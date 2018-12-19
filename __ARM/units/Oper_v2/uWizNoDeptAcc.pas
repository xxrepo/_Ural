unit uWizNoDeptAcc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, Buttons,
  uTopWin, frBsnSelector, ActnList, frCaNavigator, Db, RxMemDS,
  Grids, DBGrids, RXDBCtrl, frCurSelector, DBClient, uAccsFrame;

type
  TWizNoDeptAcc = class(TForm)
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
    fCurSelector1: TfCurSelector;
    cdsAccSumm: TClientDataSet;
    cdsAccSummId_CurrencyOper: TIntegerField;
    cdsAccSummSumm: TFloatField;
    cdsAccSummCrnName: TStringField;
    AccsFrame1: TAccsFrame;
    Panel4: TPanel;
    Button1: TButton;
    edName: TEdit;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    mdSumm: TRxMemoryData;
    mdSummID_Currency: TIntegerField;
    mdSummSumm: TFloatField;
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
    procedure fReprList1RxDBGrid1DblClick(Sender: TObject);
    procedure AccsFrame1DataSourceDataChange(Sender: TObject;
      Field: TField);
    procedure Button1Click(Sender: TObject);
    procedure AccsFrame1RxDBGrid1DblClick(Sender: TObject);
    procedure grdCADblClick(Sender: TObject);
  private
    FHandle : HWnd;
    Fid_Acc, Fid_Repr : Variant;
    procedure aAddinDS(AID: integer; ANAme: String);
    function CheckData : boolean;
  public
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    function SaveProp: boolean;
    procedure Initialize(AParamBlnc: TParamBlnc);
  end;

var
  WizNoDeptAcc: TWizNoDeptAcc;

procedure ShowWizNoDeptAcc(AParamBlnc: TParamBlnc);

implementation

uses uDM, uPrgForm, uUnivOper_v2, uUnivSelector, uFormApi_Oper;


procedure ShowWizNoDeptAcc(AParamBlnc: TParamBlnc);
var F : TWizNoDeptAcc;
begin
  F := TWizNoDeptAcc.Create(nil);
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

procedure TWizNoDeptAcc.btnOkClick(Sender: TObject);
begin
  if not CheckData then
    ModalResult := mrNone
  else
  begin
    if MessageBox(Handle, Pchar('Сгенерировать операции по ' + IntToStr(RxMemoryData1.RecordCount) + ' счетам?'), '', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
    begin
      ModalResult := mrOk;
      SaveProp;
      Close;
    end
    else
      ModalResult := mrNone
  end;
end;


procedure TWizNoDeptAcc.Initialize(AParamBlnc: TParamBlnc);
var S : String;
begin
  {if AParamBlnc.id_Acc <> Null then
  begin
    S := DM.rsCA.appserver.GetCAName(AParamBlnc.id_Acc);
    aAddinDS(AParamBlnc.id_Acc, S);
    fBsnSelector1.ID := AParamBlnc.id_business;
  end;   }
end;

function TWizNoDeptAcc.SaveProp: boolean;
  procedure AddToSumm(Aid_Currency : integer; ASumm : Double);
  begin
    with mdSumm do
    begin
      if not Active then Open;
      if Locate('id_Currency', Aid_Currency, []) then
        Edit
      else
      begin
        Append;
        mdSummID_Currency.AsInteger := Aid_Currency;
      end;
      mdSummSumm.AsFloat := mdSummSumm.AsFloat + ASumm;
      Post;
    end;
  end;
var DD : Variant;
    FID_Oper, Cnt : integer;
    OperVid, id_business, Correct,
    OperTypeIn, Id_CurrencyOper, id_Repr, OpComment, id_Acc, id_Acc_Ext : OleVariant;
    OfferSumm : Double;
begin
  id_Repr := Fid_Repr;
  id_Acc_Ext := Fid_Acc;
  Result := false;
  Cnt := 0;
  with cdsAccSumm do
  begin
    try
      RxMemoryData1.First;
      ShowProgressForm(Handle, -1, -1, 'Идет подготовка к созданию операций...');
      while not RxMemoryData1.Eof do
      begin
        if Fid_Acc <> RxMemoryData1ID.AsInteger then
        begin
          Close;
          Params.ParamByName('@id_Acc').Value := RxMemoryData1ID.AsInteger;
          Params.ParamByName('@Date').Value := Null;
          if fCurSelector1.ID_Curr > 0 then
            Params.ParamByName('@Id_Currency').Value := fCurSelector1.ID_Curr
          else
            Params.ParamByName('@Id_Currency').Value := Null;
          Open;
          while not Eof do
          begin
            if ABS(cdsAccSummSumm.AsFloat) > 0.005 then
            begin
              OperVid := 2;
              Correct := false;
              OfferSumm := cdsAccSummSumm.AsFloat;
              Id_CurrencyOper := cdsAccSummId_CurrencyOper.AsInteger;
              AddToSumm(Id_CurrencyOper, OfferSumm);
              OperTypeIn := OfferSumm < 0;
              id_Acc := RxMemoryData1ID.AsInteger;
              OpComment := 'Автоматическое списание остатков со счета';
              id_business := fBsnSelector1.ID;
              FID_Oper := wp_OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyOper,
                                                     ABS(OfferSumm), 0, Null, Null, Null,
                                                     id_Repr, id_Acc, id_Acc_Ext, Null, Null,
                                                     Null, Null,
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
                end;
             end;
             Next;
          end;
        end;

        RxMemoryData1.Next;
        ShowProgressForm(Handle, RxMemoryData1.RecNo, RxMemoryData1.RecordCount, 'Создание операций');
      end;
      if (id_Repr <> Null) and CheckBox1.Checked then
      begin
        mdSumm.First;
        while not mdSumm.Eof do
        begin
          OperVid := 4;
          Correct := false;
          OfferSumm := mdSummSumm.AsFloat;
          Id_CurrencyOper := mdSummID_Currency.AsInteger;
          OperTypeIn := OfferSumm > 0;
          OpComment := 'Автоматическое списание остатков со счета - взаимозачет';
          id_business := fBsnSelector1.ID;
          FID_Oper := wp_OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyOper,
                                                   ABS(OfferSumm), 0, Null, Null, Null,
                                                   id_Repr, Null, Null, Null, Null,
                                                   Null, Null,
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
            DM.rsCA.AppServer.OP_OperSetCheckDate_v2(FID_Oper, DM.IDUser);
          mdSumm.Next;
        end;
      end;
      Result := true;
      CloseProgressForm;
      MessageBox(Handle, Pchar('Создано ' + IntToStr(Cnt) + ' операций'), '', MB_ICONINFORMATION + MB_Ok);
      RefresheArc(FID_Oper, false);
    finally
      CloseProgressForm;
    end;
  end;
 // FHandle := AHandle;
//  fWizReVal1.Initialize(id_WareHouse, AID);
end;

procedure TWizNoDeptAcc.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TWizNoDeptAcc.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

constructor TWizNoDeptAcc.Create(AOwner: TComponent);
begin
  inherited;
  Fid_Acc := Null;
  Fid_Repr := Null;
  
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  AccsFrame1.Init(-1, fBsnSelector1.ID, false, false);

  AccsFrame1.ToolBar.Visible := false;
  AccsFrame1.fAccGroup1.ToolBar1.Visible := false;
  fBsnSelector1.UID := Null;
end;

procedure TWizNoDeptAcc.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TWizNoDeptAcc.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TWizNoDeptAcc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TWizNoDeptAcc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 { Action := caFree;
  if ModalResult = mrOk then
    if SaveProp then
      SendMessage(FHandle, xxx_RefrMsg, fWizReVal1.ID_Oper, 0);  }
end;

procedure TWizNoDeptAcc.fBsnSelector1Button1Click(Sender: TObject);
var Old : Variant;
    ID : variant;
begin
  Old := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if fBsnSelector1.ID <> Old then
  begin
    ID := Null;
    AccsFrame1.Init(ID, fBsnSelector1.ID, false, false);
    fCurSelector1.Initialize(fBsnSelector1.ID);
  end;
end;

procedure TWizNoDeptAcc.aAddinDS(AID : integer; ANAme : String);
begin
  with RxMemoryData1 do
  begin
    if not Active then Open;
    if not Locate('ID', AID, []) then
    begin
      Append;
      RxMemoryData1ID.AsInteger := AID;
      RxMemoryData1Name.AsString:= ANAme;
      Post;
    end;
  end;
end;


procedure TWizNoDeptAcc.aAddOneExecute(Sender: TObject);
var i : integer;
begin
  with AccsFrame1 do
  begin
    if RxDBGrid1.SelectedRows.Count > 0 then
    begin
      for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
      begin
        RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
        aAddinDS(RxDBGrid1.DataSource.DataSet.FieldByName('id_Acc').AsInteger, RxDBGrid1.DataSource.DataSet.FieldByName('Name').AsString);
      end;
    end
    else
      aAddinDS(RxDBGrid1.DataSource.DataSet.FieldByName('id_Acc').AsInteger, RxDBGrid1.DataSource.DataSet.FieldByName('Name').AsString);
  end;
end;

procedure TWizNoDeptAcc.aAddAllExecute(Sender: TObject);
begin
  with AccsFrame1.cdsAccs do
  begin
    First;
    while not Eof do
    begin
      aAddinDS(AccsFrame1.cdsAccsid_Acc.AsInteger,
               AccsFrame1.cdsAccsName.AsString);
      Next;
    end;
  end;
end;

procedure TWizNoDeptAcc.aDelOneExecute(Sender: TObject);
begin
  RxMemoryData1.delete;
end;

procedure TWizNoDeptAcc.aDelAllExecute(Sender: TObject);
begin
  RxMemoryData1.Close;
  RxMemoryData1.Open;
end;

procedure TWizNoDeptAcc.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  btnOk.Enabled := not RxMemoryData1.IsEmpty;
  aDelOne.Enabled := not RxMemoryData1.IsEmpty;
  aDelAll.Enabled := not RxMemoryData1.IsEmpty;
end;

procedure TWizNoDeptAcc.fReprList1RxDBGrid1DblClick(Sender: TObject);
begin
//*
end;

function TWizNoDeptAcc.CheckData: boolean;
begin
  Result := false;
  with edName do
    if trim(edName.text)='' then
    begin
      MessageBox(Handle, 'Не выбрано куда списать', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with grdCA do
    if RxMemoryData1.IsEmpty then
    begin
      MessageBox(Handle, 'Не выбраны контрагенты', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  Result := true;
end;

procedure TWizNoDeptAcc.AccsFrame1DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  AccsFrame1.DataSourceDataChange(Sender, Field);
  aAddOne.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
  aAddAll.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
end;

procedure TWizNoDeptAcc.Button1Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
begin
  with fBsnSelector1.edName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран бизнес', 'Сначала выберите бизнес', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;

  if Fid_Acc <> Null then
  begin
    ASelectedObj.ID := Fid_Acc;
    ASelectedObj.ObjType := eotFin;
  end
  else
  if Fid_Repr <> Null then
  begin
    ASelectedObj.ID := Fid_Repr;
    ASelectedObj.ObjType := eotRepr;
  end;

  if SelectObjUnBsn(Self, fBsnSelector1.ID, ASelectedObj, 0, [eotFin, eotRepr]) then
  begin
    Fid_Acc := Null;
    Fid_Repr := Null;
    edName.TExt := ASelectedObj.Name;
    case ASelectedObj.ObjType of
      eotFin : Fid_Acc := ASelectedObj.ID;
      eotRepr : Fid_Repr := ASelectedObj.ID;
    else
      raise Exception.Create('Неверный тип возвращаемого значения');
    end;
  end;
  CheckBox1.Enabled := Fid_Repr <> Null;
end;

procedure TWizNoDeptAcc.AccsFrame1RxDBGrid1DblClick(Sender: TObject);
begin
  aAddOne.Execute;
end;

procedure TWizNoDeptAcc.grdCADblClick(Sender: TObject);
begin
  aDelOne.Execute;
end;

end.
