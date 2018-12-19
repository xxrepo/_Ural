unit uWizReplaceWare;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, Buttons,
  uTopWin, frBsnSelector, ActnList, frCaNavigator, Db, RxMemDS,
  Grids, DBGrids, RXDBCtrl, frCurSelector, DBClient, frWare, comctrls;

type
  TWizReplaceWare = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Splitter1: TSplitter;
    ActionList1: TActionList;
    aAddOne: TAction;
    aAddAll: TAction;
    aDelOne: TAction;
    aDelAll: TAction;
    Panel9: TPanel;
    sbAddOne1: TSpeedButton;
    sbDelOne1: TSpeedButton;
    sbAddAll1: TSpeedButton;
    sbDelAll1: TSpeedButton;
    grdCA: TRxDBGrid;
    RxMemoryData1: TRxMemoryData;
    DataSource1: TDataSource;
    RxMemoryData1ID: TIntegerField;
    RxMemoryData1Name: TStringField;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    Panel3: TPanel;
    Panel4: TPanel;
    Button1: TButton;
    edName: TEdit;
    Label1: TLabel;
    fWare1: TfWare;
    Button2: TButton;
    edName2: TEdit;
    Label2: TLabel;
    RxMemoryData1id_Measure: TIntegerField;
    cdsCtg_GetGoods: TClientDataSet;
    cdsCtg_GetGoodsId: TAutoIncField;
    cdsCtg_GetGoodsName: TStringField;
    Label3: TLabel;
    cbG: TComboBox;
    cdsGoods: TClientDataSet;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure aAddOneExecute(Sender: TObject);
    procedure aAddAllExecute(Sender: TObject);
    procedure aDelOneExecute(Sender: TObject);
    procedure aDelAllExecute(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Button1Click(Sender: TObject);
    procedure grdCADblClick(Sender: TObject);
    procedure fWare1grdListDblClick(Sender: TObject);
    procedure fWare1dsWaresListDataChange(Sender: TObject; Field: TField);
    procedure Button2Click(Sender: TObject);
    procedure fTreeChItem1tvChildChange(Sender: TObject; Node: TTreeNode);
    procedure fWareCtgTree1TreeView1Change(Sender: TObject;
      Node: TTreeNode);
    procedure cbGChange(Sender: TObject);
  private
    FHandle : HWnd;
    Fid_WH1, Fid_WH2, Fid_Repr, Fid_Manufact : Variant;
    procedure aAddinDS(AID: integer; ANAme: String);
    function CheckData : boolean;
    procedure GetGoodsByCtg(AID: integer);
  public
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    function SaveProp: boolean;
    procedure Initialize(AParamBlnc: TParamBlnc);
    procedure xxxOne(ID_Warehouse, id_Goods: Variant; var Price, ID_Cur: OleVariant;
      var TotalAmount: Double);
  end;

var
  WizReplaceWare: TWizReplaceWare;

procedure ShowWizReplaceWare(AParamBlnc: TParamBlnc);

implementation

uses uDM, uPrgForm, uUnivOper_v2, uUnivSelector, uFormApi_Oper;


procedure ShowWizReplaceWare(AParamBlnc: TParamBlnc);
var F : TWizReplaceWare;
begin
  F := TWizReplaceWare.Create(nil);
  try
    F.Initialize(AParamBlnc);
    F.Show;
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

{$R *.DFM}

procedure TWizReplaceWare.btnOkClick(Sender: TObject);
var S : String;
begin
  if not CheckData then
    ModalResult := mrNone
  else
  begin
    if cbG.ItemIndex = 1 then
      S := 'Сгенерировать операции по ' + IntToStr(RxMemoryData1.RecordCount) + ' товарам?'
    else
      S := 'Сгенерировать операции по всем товарам бизнеса ' + fBsnSelector1.BsnName + '?';
    if MessageBox(Handle, Pchar(S), '', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
    begin
      ModalResult := mrOk;
      SaveProp;
      Close;
    end
    else
      ModalResult := mrNone
  end;
end;


procedure TWizReplaceWare.Initialize(AParamBlnc: TParamBlnc);
var S : String;
begin
  {if AParamBlnc.id_Acc <> Null then
  begin
    S := DM.rsCA.appserver.GetCAName(AParamBlnc.id_Acc);
    aAddinDS(AParamBlnc.id_Acc, S);
    fBsnSelector1.ID := AParamBlnc.id_business;
  end;   }
end;

function TWizReplaceWare.SaveProp: boolean;
var DD : Variant;
    FID_Oper, Cnt, xC : integer;
    OperVid, id_business, Correct,
    OperTypeIn, id_Manufact, Id_CurrencyOper, id_Repr, OpComment, id_WareHouse, id_WareHouse_Ext, id_Goods, id_Measure, AShortName : OleVariant;

    Price, ID_Cur: OleVariant;
    TotalAmount: Double;
    DS : TDataSet;
    AField : TField;
begin
  id_WareHouse := Fid_WH1;
  id_WareHouse_Ext := Fid_WH2;
  id_Repr := Fid_Repr;
  id_Manufact := Fid_Manufact;
  Result := false;
  try
    if cbG.ItemIndex = 0 then
    begin
      with cdsGoods do
      begin
        Close;
        Params.ParamByName('@Disabled').Value := False;
        Params.ParamByName('@id_business').Value := fBsnSelector1.ID;

        Params.ParamByName('@id_Ctg_Goods').Value := Null;

        Open;
        DS := cdsGoods;
        AField := cdsGoods.FieldByName('ID_Goods');
      end;
    end
    else
    begin
      DS := RxMemoryData1;
      AField := DS.FieldByName('ID');
    end;
    Cnt := DS.RecordCount;
    OperVid := 1;
    Correct := false;
    id_business := fBsnSelector1.ID;
    Id_CurrencyOper := DM.rsCA.AppServer.GetBsnCur(id_business);;
    OperTypeIn := false;
    OpComment := 'Автоматический перевод товара';
    FID_Oper := wp_OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyOper,
                                                 Null, 0, Null, Null, Null,
                                                 id_Repr, Null, Null, id_WareHouse, id_WareHouse_Ext,
                                                 id_Manufact, Null,
                                                 Null, Null, 0,
                                                 Null, Null, 0,
                                                 DM.IDUser, Null,
                                                 Null, Null, Null, OpComment,
                                                 Null, Null, Null, Null, Null, Null, Null, Null,
                                                 Null, Null, Null, Null, Null, Null, Null,
                                                 Null, Null, Null, Null, Null, Null, Null, Null,
                                                 Null, Null, Null, Null, Null, Null, Null,
                                                 Null, Null, Null, Null, Null, Null, Null,
                                                 Null, Null, Null, Null, Null, Null, Null, Null, true, false);

    if FID_Oper > 0 then
    begin
      inc(Cnt);
      DM.rsCA.AppServer.OP_OperSetCheckDate_v2(FID_Oper, DM.IDUser);

      with DS do
      begin
        DisableControls;
        First;
        xC := 0;
        while not Eof do
        begin
          ShowProgressForm(Handle, RecNo, RecordCount, 'Перевод товара...');
          id_Goods := AField.AsInteger;
          xxxOne(ID_Warehouse, id_Goods, Price, ID_Cur, TotalAmount);

          if TotalAmount > 0 then
          begin
            inc(xC);
            DM.rsCA.AppServer.PL_WareMeasureGet(id_Goods, id_Measure, AShortName);

            if DM.rsCA.AppServer.OP_OperWareAdd_BackToCA(FID_Oper,
                                 id_Goods,
                                 id_Measure, TotalAmount,
                                 Price,
                                 Null,
                                 true) = -1 then
              raise Exception.Create('Ошибка при создании возвратной операции - товары');
          end;
          Next;
        end;
      end;

    end;
  finally
    Result := true;
    CloseProgressForm;
    MessageBox(Handle, Pchar('Переведено ' + IntToStr(xC) + ' товаров'), '', MB_ICONINFORMATION + MB_Ok);
    RefresheArc(FID_Oper, false);
    CloseProgressForm;
    DS.EnableControls;
  end;
end;

procedure TWizReplaceWare.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TWizReplaceWare.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

constructor TWizReplaceWare.Create(AOwner: TComponent);
begin
  inherited;
  Fid_WH1 := Null;
  Fid_WH2 := Null;
  Fid_Repr := Null;
  Fid_Manufact := Null;

  cbG.ItemIndex := 1;
  cbGChange(cbG);
  
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  fWare1.Initialize(-1, fBsnSelector1.ID, false, false, false);
  
  fWare1.ToolBar1.Visible := false;
  fWare1.ToolBar2.Visible := false;
  fBsnSelector1.UID := Null;
end;

procedure TWizReplaceWare.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TWizReplaceWare.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TWizReplaceWare.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ((ModalResult = mrCancel) or (ModalResult = mrNone)) and (not RxMemoryData1.IsEmpty) then
  begin
    case MessageBox(Handle, 'Сохранить данные?', 'Данные не были сохранены', MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONQUESTION) of
      id_Yes :
        begin
          CanClose := false;
          btnOk.Click;
        end;
      ID_CANCEL : CanClose := false;
      else
        CanClose := true;
      end
  end;
end;

procedure TWizReplaceWare.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 { Action := caFree;
  if ModalResult = mrOk then
    if SaveProp then
      SendMessage(FHandle, xxx_RefrMsg, fWizReVal1.ID_Oper, 0);  }
end;

procedure TWizReplaceWare.fBsnSelector1Button1Click(Sender: TObject);
var Old : Variant;
    ID : variant;
begin
  Old := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if fBsnSelector1.ID <> Old then
  begin
    ID := Null;
    fWare1.Initialize(ID, fBsnSelector1.ID, false, false, false);
  end;
end;

procedure TWizReplaceWare.aAddinDS(AID : integer; ANAme : String);
begin
  with RxMemoryData1 do
  begin
    if not Active then Open;
    DisableControls;
    try
      if not Locate('ID', AID, []) then
      begin
        Append;
        RxMemoryData1ID.AsInteger := AID;
        RxMemoryData1Name.AsString:= ANAme;
        Post;
      end;
    finally
      EnableControls;
    end;
  end;
end;


procedure TWizReplaceWare.aAddOneExecute(Sender: TObject);
var i : integer;
begin
  with fWare1 do
  begin
    if pcCldObj.ActivePage = tsWare then
    begin
      if grdList.SelectedRows.Count > 0 then
      begin
        for i := 0 to grdList.SelectedRows.Count - 1 do
        begin
          grdList.DataSource.DataSet.GotoBookmark(pointer(grdList.SelectedRows.Items[i]));
          aAddinDS(grdList.DataSource.DataSet.FieldByName('id_Goods').AsInteger, grdList.DataSource.DataSet.FieldByName('Name').AsString);
        end;
      end
      else
        aAddinDS(grdList.DataSource.DataSet.FieldByName('id_Goods').AsInteger, grdList.DataSource.DataSet.FieldByName('Name').AsString);
    end
    else
    begin
      if MessageBox(Handle, Pchar('Добавить все товары из категории ' + VarToStr(fTreeChItem1.ItemName) + '?'), '', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
      begin
        GetGoodsByCtg(fTreeChItem1.ItemID);
      end;
    end;
  end;
end;

procedure TWizReplaceWare.GetGoodsByCtg(AID: integer);
begin
  with cdsCtg_GetGoods do
  begin
    Close;
    Params.ParamByName('@ID').Value := AID;
    Open;
    Screen.Cursor := crSQLWait;
    try
      First;
      while not Eof do
      begin
        aAddinDS(cdsCtg_GetGoodsId.AsInteger,
                 cdsCtg_GetGoodsName.AsString);
        Next;
      end;
    finally
      Screen.Cursor := crDefault;
      Close;
    end;
  end;
end;

procedure TWizReplaceWare.aAddAllExecute(Sender: TObject);
var i : integer;
begin
  RxMemoryData1.DisableControls;
  try
    if fWare1.pcCldObj.ActivePage = fWare1.tsWare then
    begin
      with fWare1.cdsGoods do
      begin
        First;
        while not Eof do
        begin
          aAddinDS(fWare1.cdsGoodsid_Goods.AsInteger,
                   fWare1.cdsGoodsName.AsString);
          Next;
        end;
      end;
    end
    else
    begin
      if MessageBox(Handle, Pchar('Добавить все товары из ' + IntToStr(fWare1.fTreeChItem1.tvChild.Items.Count) + ' категорий?'), '', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
      begin
        for i := 0 to fWare1.fTreeChItem1.tvChild.Items.Count - 1 do
          GetGoodsByCtg(fWare1.fTreeChItem1.ItemIDByIndex[i]);
      end;
    end;
  finally
    RxMemoryData1.EnableControls;
  end;
end;

procedure TWizReplaceWare.aDelOneExecute(Sender: TObject);
begin
  RxMemoryData1.delete;
end;

procedure TWizReplaceWare.aDelAllExecute(Sender: TObject);
begin
  RxMemoryData1.Close;
  RxMemoryData1.Open;
end;

procedure TWizReplaceWare.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  btnOk.Enabled := not RxMemoryData1.IsEmpty or (cbG.ItemIndex = 0);
  aDelOne.Enabled := not RxMemoryData1.IsEmpty;
  aDelAll.Enabled := not RxMemoryData1.IsEmpty;
end;

function TWizReplaceWare.CheckData: boolean;
begin
  Result := false;
  with edName do
    if trim(edName.text)='' then
    begin
      MessageBox(Handle, 'Не выбрано откуда списать', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with edName2 do
    if trim(edName.text)='' then
    begin
      MessageBox(Handle, 'Не выбрано куда списать', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with edName2 do
    if Fid_WH1 = Fid_WH2 then
    begin
      MessageBox(Handle, 'Нужно указать разные склады', 'Ошибка', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;

  with grdCA do
    if RxMemoryData1.IsEmpty and (cbG.ItemIndex = 1) then
    begin
      MessageBox(Handle, 'Не выбраны товары', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  Result := true;
end;

procedure TWizReplaceWare.Button1Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
begin
  with fBsnSelector1.edName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран бизнес', 'Сначала выберите бизнес', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;

  if Fid_WH1 <> Null then
  begin
    ASelectedObj.ID := Fid_WH1;
    ASelectedObj.ObjType := eotWH;
  end;

  if SelectObjUnBsn(Self, fBsnSelector1.ID, ASelectedObj, 0, [eotWH]) then
  begin
    Fid_WH1 := ASelectedObj.ID;
    edName.TExt := ASelectedObj.Name;
  end;
end;

procedure TWizReplaceWare.grdCADblClick(Sender: TObject);
begin
  aDelOne.Execute;
end;

procedure TWizReplaceWare.fWare1grdListDblClick(Sender: TObject);
begin
  aAddOne.Execute;

end;

procedure TWizReplaceWare.fWare1dsWaresListDataChange(Sender: TObject;
  Field: TField);
begin
  fWare1.dsWaresListDataChange(Sender, Field);
  aAddOne.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
  aAddAll.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;

end;


procedure TWizReplaceWare.fTreeChItem1tvChildChange(Sender: TObject;
  Node: TTreeNode);
begin
  aAddOne.Enabled := Node <> nil;
end;



procedure TWizReplaceWare.Button2Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
begin
  with fBsnSelector1.edName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран бизнес', 'Сначала выберите бизнес', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;

  if Fid_WH2 <> Null then
  begin
    ASelectedObj.ID := Fid_WH2;
    ASelectedObj.ObjType := eotWH;
  end;
  if Fid_Repr <> Null then
  begin
    ASelectedObj.ID := Fid_Repr;
    ASelectedObj.ObjType := eotRepr;
  end;
  if Fid_Manufact <> Null then
  begin
    ASelectedObj.ID := Fid_Manufact;
    ASelectedObj.ObjType := eotManuf;
  end;

  if SelectObjUnBsn(Self, fBsnSelector1.ID, ASelectedObj, 0, [eotWH, eotRepr, eotManuf]) then
  begin
    Fid_WH2 := Null;
    Fid_Repr := Null;
    Fid_Manufact := Null;
    
    if ASelectedObj.ObjType = eotWH then
      Fid_WH2 := ASelectedObj.ID;
    if ASelectedObj.ObjType = eotRepr then
      Fid_Repr := ASelectedObj.ID;
    if ASelectedObj.ObjType = eotManuf then
      Fid_Manufact := ASelectedObj.ID;
    edName2.TExt := ASelectedObj.Name;
  end;

end;

procedure TWizReplaceWare.xxxOne(ID_Warehouse, id_Goods: Variant; var Price,
  ID_Cur: OleVariant; var TotalAmount: Double);
begin
  if DM.PL_GetDefWarePrice(id_Goods, ID_Warehouse, Price, ID_Cur, TotalAmount) = -1 then
    raise Exception.Create('Ошибка при подсчете остатков');
end;


procedure TWizReplaceWare.fWareCtgTree1TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
  fWare1.fWareCtgTree1TreeView1Change(Sender, Node);
  aAddAll.Enabled := (Node.Count > 0) or not fWare1.cdsGoods.IsEmpty;
  aAddOne.Enabled := false;

end;

procedure TWizReplaceWare.cbGChange(Sender: TObject);
begin
  btnOk.Enabled := not RxMemoryData1.IsEmpty or (cbG.ItemIndex = 0);
  if cbG.ItemIndex = 1 then
  begin
    EnableControl(fWare1);
    EnableControl(Panel9);
    EnableControl(GroupBox2);
  end
  else
  begin
    DisableControl(fWare1);
    DisableControl(Panel9);
    DisableControl(GroupBox2);
  end;
end;

end.
