unit uPayIn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Mask, DBCtrls, ToolEdit, RXDBCtrl,
  RxDBComb, CurrEdit, ComObj, foMyFunc, RXCtrls;

type
  TPayIn = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cdsPayIn: TClientDataSet;
    cdsPayInid_Pay_In: TAutoIncField;
    cdsPayInid_Oper: TIntegerField;
    cdsPayInDoc_Num: TStringField;
    cdsPayInDoc_Date: TDateTimeField;
    cdsPayInOKPO: TStringField;
    cdsPayInSumm: TBCDField;
    cdsPayInVAT: TBCDField;
    cdsPayInBasePM: TStringField;
    cdsPayInPayer: TStringField;
    cdsPayInBuh: TStringField;
    cdsPayInCasser: TStringField;
    cdsPayInDoc_DateCreate: TDateTimeField;
    cdsPayInid_UserCreator: TIntegerField;
    cdsPayInOrgName: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cdsPayInWoVAT: TFloatField;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBDateEdit1: TDBDateEdit;
    cbOKPO: TRxDBComboBox;
    cbBuh: TRxDBComboBox;
    cbCasser: TRxDBComboBox;
    cbOrgName: TRxDBComboBox;
    Label11: TLabel;
    cdsDList: TClientDataSet;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    RxDBCalcEdit1: TRxDBCalcEdit;
    RxDBCalcEdit2: TRxDBCalcEdit;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    RxSpeedButton1: TRxSpeedButton;
    procedure cdsPayInCalcFields(DataSet: TDataSet);
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
  PayIn: TPayIn;

  procedure ShowPayIn(AHandle : HWnd; ADocParamz : TDocParamz);
implementation

uses uDM;

procedure ShowPayIn(AHandle : HWnd; ADocParamz : TDocParamz);
var F : TPayIn;
begin
  F := TPayIn.Create(nil);
  try
    F.FHandle := AHandle;
    F.initialize(ADocParamz);
    F.ModalResult := mrNone;
    F.Show;
  except

  end;
end;
{$R *.DFM}

procedure TPayIn.cdsPayInCalcFields(DataSet: TDataSet);
begin
  with DataSet do
    FieldByName('WoVAT').AsFloat := FieldByName('Summ').AsFloat * (100 - FieldByName('VAT').AsFloat)/100;
end;

constructor TPayIn.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TPayIn.CreateParams(var Params: TCreateParams);
begin
  inherited;

end;

procedure TPayIn.initialize(ADocParamz : TDocParamz);
var Val : Variant;
begin
  FDocParamz := ADocParamz;
  with cdsDList do
  begin
    Close;
    Params.ParamByName('@UID').AsInteger := 5;
    Open;
    DM.CDStoSL(FieldByName('Name'), cbOrgName.Items);

    Close;
    Params.ParamByName('@UID').AsInteger := 2;
    Open;
    DM.CDStoSL(FieldByName('Name'), cbBuh.Items);

    Close;
    Params.ParamByName('@UID').AsInteger := 1;
    Open;
    DM.CDStoSL(FieldByName('Name'), cbCasser.Items);

    Close;
    Params.ParamByName('@UID').AsInteger := 4;
    Open;
    DM.CDStoSL(FieldByName('Name'), cbOKPO.Items);
  end;


  with cdsPayIn do
  begin
    Close;
    Params.ParamByName('@id_Pay_In').AsInteger := FDocParamz.id_Doc;
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
    cdsPayIn.Edit;
    cdsPayInid_UserCreator.AsInteger := DM.IDUser;
    cdsPayInid_Oper.AsInteger := FDocParamz.id_Oper;
    cdsPayInDoc_Date.AsDateTime := date;
    with DM.cdsOperFin do
    begin
      if FieldByName('SummSys').IsNull then
        cdsPayInSumm.AsFloat := FieldByName('PriceOper').AsFloat * FieldByName('RateOper').AsFloat
      else
        cdsPayInSumm.AsFloat := FieldByName('SummSys').AsFloat * FieldByName('RateSys').AsFloat;
      cdsPayInVAT.AsFloat := 20;
      cdsPayInPayer.AsString := FieldByName('ReprName').AsString;
    end;
    cdsPayIn.Post;
  end;
  if FDocParamz.Copy then
    FDocParamz.id_Oper := -1;
  if (FDocParamz.id_Oper = -1) then
  begin
    Caption := 'Новый приходный ордер';
  end
  else
  begin
    Caption := 'Приходный ордер №' + cdsPayInDoc_Num.AsString;
  end;
  if FDocParamz.ReadOnly then
    Caption := Caption + ', только чтение';
end;

function TPayIn.SaveProp: boolean;
var ID_Tmp, id_Oper: Integer;
    Doc_Num, Doc_Date, OKPO, Summ, VAT, BasePM, Payer, Buh, Casser, id_UserCreator,
    OrgName: OleVariant;
    OldCursor : TCursor;
begin
  if FDocParamz.ReadOnly or (cdsPayIn.ChangeCount = 0) then Exit;
  ID_Tmp := FDocParamz.ID_Doc;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  with cdsPayIn do
  begin
    id_Oper := fieldByName('id_Oper').AsInteger;
    Doc_Num := fieldByName('Doc_Num').Value;
    Doc_Date := fieldByName('Doc_Date').Value;
    OKPO := fieldByName('OKPO').Value;
    Summ := fieldByName('Summ').Value;
    VAT := fieldByName('VAT').Value;
    BasePM  := fieldByName('BasePM').Value;
    Payer := fieldByName('Payer').Value;
    Buh := fieldByName('Buh').Value;
    Casser := fieldByName('Casser').Value;
    id_UserCreator := fieldByName('id_UserCreator').Value;
    OrgName := fieldByName('OrgName').Value;
  end;

  BeginTruns(DM.rsCA);
  try
    ID_Tmp := DM.rsCA.AppServer.Doc_Pay_InEdit(FDocParamz.ID_Doc, id_Oper, Doc_Num, Doc_Date, OKPO, Summ,
                                                 VAT, BasePM, Payer, Buh, Casser, id_UserCreator, OrgName);

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

procedure TPayIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if ModalResult = mrOk then
    if SaveProp then
      SendMessage(FHandle, xxx_RefrMsg, FDocParamz.ID_Doc, 0);
end;

procedure TPayIn.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (cdsPayIn.State = dsEdit) then cdsPayIn.Post;
end;

procedure TPayIn.Button1Click(Sender: TObject);
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

procedure TPayIn.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TPayIn.btnOkClick(Sender: TObject);
begin
  if not ConfirmChanges then
    ModalResult := mrNone
  else
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

function TPayIn.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsPayIn;
  if CDS.State <> dsEdit then
    CDS.Edit;
  Result := true;
  if (FDocParamz.ID_Doc <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'OrgName', 'Организация', SL);
        CompareField(CDS, 'Doc_Num', 'Номер документа', SL);
        CompareField(CDS, 'Doc_Date', 'Дата составления', SL);
        CompareField(CDS, 'OKPO', 'ОКПО', SL);

        CompareField(CDS, 'Summ', 'Сумма', SL);
        CompareField(CDS, 'VAT', 'НДС (%)', SL);

        CompareField(CDS, 'WoVAT', 'Сумма без НДС', SL);
        CompareField(CDS, 'BasePM', 'Основание платежа', SL);
        CompareField(CDS, 'Payer', 'Принято от', SL);
        CompareField(CDS, 'Buh', 'Главный бухгалтер', SL);
        CompareField(CDS, 'Casser', 'Кассир', SL);
      end;

      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

function TPayIn.CheckData: boolean;
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
  xxx(cbOrgName);
  xxx(DBEdit1);
  xxx(DBDateEdit1);
  xxx(cbOKPO);
  xxx(RxDBCalcEdit2);
  xxx(RxDBCalcEdit1);
  xxx(DBEdit7);
  xxx(DBEdit8);
  xxx(cbBuh);
  xxx(cbCasser);
  Result := true;
end;

end.
