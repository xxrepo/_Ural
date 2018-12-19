unit uActCL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Mask, DBCtrls, ToolEdit, RXDBCtrl,
  RxDBComb, CurrEdit, ComObj, foMyFunc, RXCtrls;

type
  TActCL = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cdsDoc: TClientDataSet;
    cdsDList: TClientDataSet;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    DataSource1: TDataSource;
    RxSpeedButton1: TRxSpeedButton;
    cdsDocid_ActCl: TAutoIncField;
    cdsDocid_Oper: TIntegerField;
    cdsDocDoc_Num: TStringField;
    cdsDocDoc_Date: TDateTimeField;
    cdsDocOrgName1: TStringField;
    cdsDocSumm1: TBCDField;
    cdsDocDoc1: TStringField;
    cdsDocOrgName2: TStringField;
    cdsDocSumm2: TBCDField;
    cdsDocDoc2: TStringField;
    cdsDocSumm: TBCDField;
    cdsDocName1: TStringField;
    cdsDocPost1: TStringField;
    cdsDocName2: TStringField;
    cdsDocPost2: TStringField;
    cdsDocDoc_DateCreate: TDateTimeField;
    cdsDocid_UserCreator: TIntegerField;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    cbOrgName: TRxDBComboBox;
    RxDBCalcEdit3: TRxDBCalcEdit;
    Label13: TLabel;
    Label15: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    RxDBCalcEdit1: TRxDBCalcEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Panel3: TPanel;
    Label4: TLabel;
    RxDBCalcEdit2: TRxDBCalcEdit;
    procedure cdsDocCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    FHandle : HWnd;
    FDocParamz : TDocParamz;
    function CheckData: boolean;
    function ConfirmChanges: boolean;
  public
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    function SaveProp: boolean;
    procedure initialize(ADocParamz : TDocParamz);

  end;

var
  ActCL: TActCL;

  procedure ShowActCL(AHandle : HWnd; ADocParamz : TDocParamz);
implementation

uses uDM;

procedure ShowActCL(AHandle : HWnd; ADocParamz : TDocParamz);
var F : TActCL;
begin
  F := TActCL.Create(nil);
  try
    F.FHandle := AHandle;
    F.initialize(ADocParamz);
    F.ModalResult := mrNone;
    F.Show;
  except

  end;
end;
{$R *.DFM}

procedure TActCL.cdsDocCalcFields(DataSet: TDataSet);
begin
  with DataSet do
    FieldByName('WoVAT').AsFloat := FieldByName('Summ').AsFloat * (100 - FieldByName('VAT').AsFloat)/100;
end;

constructor TActCL.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TActCL.CreateParams(var Params: TCreateParams);
begin
  inherited;

end;

procedure TActCL.initialize(ADocParamz : TDocParamz);
var Val : Variant;
begin
  FDocParamz := ADocParamz;
  with cdsDList do
  begin
    Close;
    Params.ParamByName('@UID').AsInteger := 5;
    Open;
    DM.CDStoSL(FieldByName('Name'), cbOrgName.Items);
  end;


  with cdsDoc do
  begin
    Close;
    Params.ParamByName('@id_ActCl').AsInteger := FDocParamz.id_Doc;
    Open;
  end;

  if FDocParamz.id_Doc = -1 then
  begin
    with DM.cdsOperFin do
    begin
      Close;
      Params.ParamByName('@id_Oper').AsInteger := FDocParamz.id_Oper;
      Params.ParamByName('@is_Mirr').AsBoolean := FDocParamz.is_Mirr;
      Open;
    end;
    cdsDoc.Edit;
    cdsDocid_UserCreator.AsInteger := DM.IDUser;
    cdsDocid_Oper.AsInteger := FDocParamz.id_Oper;
    cdsDocDoc_Date.AsDateTime := date;
    with DM.cdsOperFin do
    begin
      if FieldByName('SummSys').IsNull then
        cdsDocSumm.AsFloat := FieldByName('PriceOper').AsFloat * FieldByName('RateOper').AsFloat
      else
        cdsDocSumm.AsFloat := FieldByName('SummSys').AsFloat * FieldByName('RateSys').AsFloat;
      cdsDocOrgName2.AsString := FieldByName('ReprName').AsString;
    end;
    cdsDoc.Post;
  end;
  if FDocParamz.Copy then
    FDocParamz.id_Oper := -1;
  if (FDocParamz.id_Oper = -1) then
  begin
    Caption := 'Новый акт взимозачета';
  end
  else
  begin
    Caption := 'Акт взимозачета №' + cdsDocDoc_Num.AsString;
  end;
  if FDocParamz.ReadOnly then
    Caption := Caption + ', только чтение';
end;

function TActCL.SaveProp: boolean;
var ID_Tmp, id_Oper: Integer;
    Doc_Num, Doc_Date,
    OrgName1, OrgName2, Summ1, Summ2, Doc1, Doc2, Name1, Name2, Post1, Post2,
    Summ, id_UserCreator: OleVariant;
    OldCursor : TCursor;
begin
  if FDocParamz.ReadOnly or (cdsDoc.ChangeCount = 0) then Exit;
  ID_Tmp := FDocParamz.ID_Doc;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  with cdsDoc do
  begin
    id_Oper := fieldByName('id_Oper').AsInteger;
    Doc_Num := fieldByName('Doc_Num').Value;
    Doc_Date := fieldByName('Doc_Date').Value;

    OrgName1 := fieldByName('OrgName1').Value;
    OrgName2 := fieldByName('OrgName2').Value;
    Summ1 := fieldByName('Summ1').Value;
    Summ2  := fieldByName('Summ2').Value;
    Doc1 := fieldByName('Doc1').Value;
    Doc2 := fieldByName('Doc2').Value;
    Name1 := fieldByName('Name1').Value;
    Name2 := fieldByName('Name2').Value;
    Post1 := fieldByName('Post1').Value;
    Post2 := fieldByName('Post2').Value;
    Summ := fieldByName('Summ').Value;    

    id_UserCreator := fieldByName('id_UserCreator').Value;
  end;

  BeginTruns(DM.rsCA);
  try
    ID_Tmp := DM.rsCA.AppServer.Doc_ActClEdit(FDocParamz.ID_Doc, id_Oper, Doc_Num, Doc_Date,
             OrgName1, OrgName2, Summ1, Summ2, Doc1, Doc2, Name1, Name2, Post1, Post2,
             Summ, id_UserCreator);

    if ID_Tmp = -1 then
      raise Exception.Create('Ошибка при сохранении свойств');

    CommitTrans(DM.rsCA);
    Result := true;
  except
    on E : Exception do
    begin
      Screen.Cursor := OldCursor;
      RollbackTrans(DM.rsCA);
      FDocParamz.ID_Doc := ID_Tmp;
      raise Exception.Create(E.Message);
    end;
  end;
  Screen.Cursor := OldCursor;
end;

procedure TActCL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if ModalResult = mrOk then
    if SaveProp then
      SendMessage(FHandle, xxx_RefrMsg, FDocParamz.ID_Doc, 0);
end;

procedure TActCL.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (cdsDoc.State = dsEdit) then cdsDoc.Post;
end;

procedure TActCL.Button1Click(Sender: TObject);
var WordApp, ActiveDocument : Variant;
begin
  try
    WordApp := CreateOleObject('Word.Application');
    WordApp.visible := true;
    ActiveDocument := WordApp.Documents.Add(ExtractFilePath(Application.EXEName) + 'test1.Doc');
   // WordApp.ScreenUpdating:= false;
    try
      DM.EditBookmark(ActiveDocument, 'qqq', '789');

    finally
      WordApp.Selection.Start := 0;
      WordApp.Selection.End := 0;
      WordApp.visible := true;
      WordApp.ScreenUpdating:= true;
    end;
  except
    WordApp := Null;
  end;
end;

procedure TActCL.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TActCL.btnOkClick(Sender: TObject);
begin
  if not ConfirmChanges then
    ModalResult := mrNone
  else
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

function TActCL.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsDoc;
  if CDS.State <> dsEdit then
    CDS.Edit;
  Result := true;
  if (FDocParamz.ID_Doc <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'Doc_Num', 'Номер документа', SL);
        CompareField(CDS, 'Doc_Date', 'Дата составления', SL);

        CompareField(CDS, 'OrgName1', 'Организация', SL);
        CompareField(CDS, 'Summ1', 'Задолженность', SL);
        CompareField(CDS, 'Doc1', 'Основание', SL);
        CompareField(CDS, 'Post1', 'Должность', SL);

        CompareField(CDS, 'OrgName2', 'Организация', SL);
        CompareField(CDS, 'Summ2', 'Задолженность', SL);
        CompareField(CDS, 'Doc2', 'Основание', SL);
        CompareField(CDS, 'Post2', 'Должность', SL);

        CompareField(CDS, 'Summ', 'Сумма зачета', SL);
      end;

      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

function TActCL.CheckData: boolean;
  procedure xxx(AWC : TWinControl);
  begin
    if trim(TWinHackControl(AWC).Text) = '' then
    begin
      Windows.SetFocus(TWinHackControl(AWC).Handle);
      MessageBox(Handle, 'Введены не все данные. Заполните все неоходимые поля', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Abort;
    end;
  end;
begin
  Result := false;
  xxx(DBEdit1);
  xxx(DBDateEdit1);
  
  xxx(cbOrgName);
  xxx(RxDBCalcEdit3);
  xxx(DBEdit4);
  xxx(DBEdit2);
  xxx(DBEdit3);

  xxx(DBEdit8);
  xxx(RxDBCalcEdit1);
  xxx(DBEdit5);
  xxx(DBEdit6);
  xxx(DBEdit7);

  xxx(RxDBCalcEdit2);
  Result := true;
end;

end.
