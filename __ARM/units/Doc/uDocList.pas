unit uDocList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, db, Buttons, 
  ImgList, DBClient,
  Provider, DBUtils, ComCtrls, Grids, DBGrids, RXDBCtrl, ToolWin, ActnList,
  frBsnSelector, Mask, ToolEdit, Menus;

type

 TDocList = class(TForm)
    StatusBar1: TStatusBar;
    cdsDocByOper: TClientDataSet;
    cdsDocByOperType: TIntegerField;
    cdsDocByOperDocName: TStringField;
    cdsDocByOperID: TIntegerField;
    cdsDocByOperDoc_Date: TDateTimeField;
    cdsDocByOperOrgName: TStringField;
    cdsDocByOperExtInfo: TStringField;
    cdsDocByOperid_Oper: TIntegerField;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    aSelAll: TAction;
    aExcelExp: TAction;
    aSetDef: TAction;
    aUnSetDef: TAction;
    ImageList: TImageList;
    Splitter1: TSplitter;
    ListBox1: TListBox;
    DataSource1: TDataSource;
    Panel3: TPanel;
    Label2: TLabel;
    dtFrom: TDateEdit;
    Label3: TLabel;
    dtTo: TDateEdit;
    fBsnSelector1: TfBsnSelector;
    cdsDocByOperDoc_Num: TStringField;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    ToolBar: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    aPrintDoc: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ListBox1Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure cdsDocByOperFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FilterEditChange(Sender: TObject);
    procedure aPrintDocExecute(Sender: TObject);
  private
    Fid_Oper, Fid_business : Variant;
    procedure GetDocList;
  public
    procedure initialize(id_Oper, id_business : Variant);
    constructor Create(AOwner : TCOmponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    destructor Destroy; override;
  end;

procedure ShowDocList(id_Oper, id_business : Variant);

var
  DocList: TDocList;

implementation

uses uDM, {uFormApi_Oper,} uPrgForm, uFormAPI_Doc;

procedure ShowDocList(id_Oper, id_business : Variant);
begin
  DM.Rights_GetUserRights(26, Null);
  if not Assigned(DocList) then
  begin
    DocList := TDocList.Create(nil);
    try
      DocList.initialize(id_Oper, id_business);
      DocList.WindowState := wsMaximized;
      DocList.Show;
    except
      on E : Exception do
      begin
        DocList.Free;
        raise Exception.Create('Ошибка при открытии списка документов ' + E.Message);
      end;
    end;
  end
  else
  begin
    DocList.WindowState := wsMaximized;
    DocList.BringToFront;
  end;
end;

{$R *.DFM}

constructor TDocList.Create(AOwner: TCOmponent);
begin
  inherited;
{$IFDEF LC}
  aDel.Visible := false;
  aEdit.Caption := 'Просмотр';
{$ENDIF}

  dtTo.Date := Now;
  dtFrom.Date := Now;//IncMonth(Now, -1);

  LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + Name);
  LoadSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + Name);
//  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  with ListBox1 do
  begin
    Clear;
     {$IFNDEF LC}
    Items.AddObject('Акт', Pointer(4));
    Items.AddObject('Акт взаимозачета', Pointer(2));
    {$ENDIF}
    Items.AddObject('Доверенность', Pointer(7));
    Items.AddObject('Заявка на склад', Pointer(9));
    Items.AddObject('Накладная', Pointer(5));
    Items.AddObject('Приходный ордер', Pointer(6));
    Items.AddObject('Счет', Pointer(1));
    Items.AddObject('Счет-фактура', Pointer(3));
    {$IFNDEF LC}
    Items.AddObject('ТТН', Pointer(8));
    {$ENDIF}
    Items.AddObject('Универсальный передаточный документ', Pointer(10));
    Items.AddObject('Все документы', nil);
  end;
end;

procedure TDocList.CreateParams(var Params: TCreateParams);
begin
  inherited;
//  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

procedure TDocList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TDocList.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TDocList.FormDestroy(Sender: TObject);
begin
  DocList := nil;
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TDocList.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TDocList.aEditExecute(Sender: TObject);
var ADocProc : TDocProc;
  DP : TDocParamz;
begin
  DP := GetEmptyDocParamz;
  DP.ID_Doc := cdsDocByOperID.AsInteger;
  DP.ReadOnly := false;
{$IFDEF LC}
  DP.ReadOnly := true;
{$ENDIF}
  case cdsDocByOperType.AsInteger of
    1 : ADocProc := ShowDAcc;
    2 : ADocProc := ShowActCL;
    3 : ADocProc := ShowAF;
    4 : ADocProc := ShowFinalAct;
    5 : ADocProc := ShowInv;
    6 : ADocProc := ShowPayIn;
    7 : ADocProc := ShowWarrant;
    8 : ADocProc := ShowWBill;
    9 : ADocProc := ShowWHOrd;
    10 : ADocProc := ShowUPD;
  end;

  ADocProc(Handle, DP, nil, nil)
end;

procedure TDocList.aRefreshExecute(Sender: TObject);
 var
  id, AType :Integer;
begin
  ID := cdsDocByOperID.AsInteger;
  AType := cdsDocByOperType.AsInteger;
  with cdsDocByOper do
  begin
    GetDocList;
    Locate('ID;Type', VarArrayOf([ID, AType]), [loCaseInsensitive]);
  end;
end;

procedure TDocList.aDelExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if RxDBGrid1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(RxDBGrid1.SelectedRows.Count) + ' документов?'
  else
    S := 'Удалить документ?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if RxDBGrid1.SelectedRows.Count > 0 then
      begin
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          cdsDocByOper.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
          DM.rsCA.AppServer.DocDel(cdsDocByOperType.AsInteger, cdsDocByOperID.AsInteger);
        end;
      end
      else
        DM.rsCA.AppServer.DocDel(cdsDocByOperType.AsInteger, cdsDocByOperID.AsInteger);
    finally
      aRefresh.Execute;
    end;
  end; 
end;

procedure TDocList.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  StatusBar1.Panels[1].Text := 'Всего документов: ' + IntToStr((Sender as TDataSource).DataSet.RecordCount);
  aEdit.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
  aDel.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
  aPrintDoc.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
end;

procedure TDocList.ListBox1Click(Sender: TObject);
begin
  GetDocList;
end;

procedure TDocList.GetDocList;
var Obj : TObject;
    i, XXX, V : integer;
begin
  Obj := ListBox1.Items.Objects[ListBox1.ItemIndex];
  with cdsDocByOper do
  begin
    Close;
    V := 0;
    if Obj = nil then
    begin
      XXX := 0;
      V := 1;
    end
    else
      XXX := integer(Obj);
    for i := 0 to Params.Count - 1 do
      Params[i].Value := V;
      
    Params.ParamByName('@id_oper').Value := Fid_Oper;
    Params.ParamByName('@id_business').Value := Fid_business;

    if Panel3.Visible then
    begin
      Params.ParamByName('@DateFrom').AsDateTime := GetDateAdv(dtFrom.Date, false);
      Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(dtTo.Date, true) - 0.001;
    end
    else
    begin
      Params.ParamByName('@DateFrom').Value := Null;
      Params.ParamByName('@DateTo').Value := Null;
    end;
    
    case XXX of
      1 :  Params.ParamByName('@Doc_Account').Value := true;
      2 :  Params.ParamByName('@Doc_ActCL').Value := true;
      3 :  Params.ParamByName('@Doc_AF').Value := true;
      4 :  Params.ParamByName('@Doc_FinalAct').Value := true;
      5 :  Params.ParamByName('@Doc_Invoice').Value := true;
      6 :  Params.ParamByName('@Doc_Pay_In').Value := true;
      7 :  Params.ParamByName('@Doc_Warrant').Value := true;
      8 :  Params.ParamByName('@Doc_WBill').Value := true;
      9 :  Params.ParamByName('@Doc_WHOrd').Value := true;
  //    10 :  Params.ParamByName('@Doc_UPD').Value := true;
    end;
    Open;
  end;
end;


procedure TDocList.initialize(id_Oper, id_business: Variant);
begin
  Fid_Oper := id_Oper;
  Fid_business := id_business;
  Panel3.Visible := Fid_business >= 0;
  if Fid_business >= 0 then
  begin
    fBsnSelector1.ID := Fid_business;
  end;  
  ListBox1.ItemIndex := ListBox1.Items.Count - 1;
  GetDocList;
end;

procedure TDocList.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TDocList.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TDocList.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

destructor TDocList.Destroy;
begin
  SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + Name);
  SaveSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + Name);
  inherited;
end;

procedure TDocList.fBsnSelector1Button1Click(Sender: TObject);
begin
  Fid_business := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if fBsnSelector1.ID <> Fid_business then
  begin
    Fid_business := fBsnSelector1.ID;
    GetDocList;
  end;
end;

procedure TDocList.cdsDocByOperFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Doc_Num').AsString)) > 0)
    or (Pos(S, AnsiUpperCase(FieldByName('OrgName').AsString)) > 0);
end;

procedure TDocList.FilterEditChange(Sender: TObject);
begin
  with cdsDocByOper   do
  begin
    DisableControls;
    try
      Filtered := False;
      FilterOptions := [foCaseInsensitive];
      Filtered := Trim(FilterEdit.Text) <> '';
    finally
      EnableControls;
    end;
  end;
end;

procedure TDocList.aPrintDocExecute(Sender: TObject);
var ADocProc : TDocProc;
  DP : TDocParamz;
begin
  DP := GetEmptyDocParamz;
  DP.ID_Doc := cdsDocByOperID.AsInteger;
  DP.ReadOnly := true;

  case cdsDocByOperType.AsInteger of
    1 : ADocProc := ShowDAcc;
    2 : ADocProc := ShowActCL;
    3 : ADocProc := ShowAF;
    4 : ADocProc := ShowFinalAct;
    5 : ADocProc := ShowInv;
    6 : ADocProc := ShowPayIn;
    7 : ADocProc := ShowWarrant;
    8 : ADocProc := ShowWBill;
    9 : ADocProc := ShowWHOrd;
  end;

  ADocProc(Handle, DP, nil, nil)
end;

end.
