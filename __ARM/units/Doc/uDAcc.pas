unit uDAcc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Mask, DBCtrls, ToolEdit, RXDBCtrl,
  RxDBComb, CurrEdit, ComObj, foMyFunc, RXCtrls, Grids, DBGridEh;

type
  TDAcc = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cdsDoc: TClientDataSet;
    DataSource1: TDataSource;
    RxSpeedButton1: TRxSpeedButton;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    cbOrgName: TRxDBComboBox;
    Label12: TLabel;
    cbAddress: TRxDBComboBox;
    Label3: TLabel;
    cbINN: TRxDBComboBox;
    Label5: TLabel;
    cbKPP: TRxDBComboBox;
    Label13: TLabel;
    cbBank: TRxDBComboBox;
    cbAcc1: TRxDBComboBox;
    Label14: TLabel;
    cbBIK: TRxDBComboBox;
    Label15: TLabel;
    cbAcc2: TRxDBComboBox;
    Label16: TLabel;
    Label18: TLabel;
    edcustomer: TDBEdit;
    Label19: TLabel;
    edPayer: TDBEdit;
    Label20: TLabel;
    cbChif: TRxDBComboBox;
    Label21: TLabel;
    cbBuh: TRxDBComboBox;
    GroupBox2: TGroupBox;
    cdsDocWare: TClientDataSet;
    cdsDocWareSummOper2: TFloatField;
    cdsDocWareNumb: TIntegerField;
    cdsDocWareSS: TAggregateField;
    dsOperWare: TDataSource;
    DBGridEh1: TDBGridEh;
    cdsDocWarewoVAT: TFloatField;
    cdsDocid_Account: TAutoIncField;
    cdsDocid_Oper: TIntegerField;
    cdsDocDoc_Num: TStringField;
    cdsDocDoc_Date: TDateTimeField;
    cdsDocDoc_DateCreate: TDateTimeField;
    cdsDocid_UserCreator: TIntegerField;
    cdsDocOrgName: TStringField;
    cdsDocAddress: TStringField;
    cdsDocINN: TIntegerField;
    cdsDocKPP: TIntegerField;
    cdsDocBank: TStringField;
    cdsDocAcc1: TStringField;
    cdsDocBIK: TIntegerField;
    cdsDocAcc2: TStringField;
    cdsDocChif: TStringField;
    cdsDocBuh: TStringField;
    cdsDoccustomer: TStringField;
    cdsDocPayer: TStringField;
    cdsDocWareid_AccountWare: TAutoIncField;
    cdsDocWareid_Account: TIntegerField;
    cdsDocWareWareName: TStringField;
    cdsDocWareMesName: TStringField;
    cdsDocWareAmount: TFloatField;
    cdsDocWarePrice: TBCDField;
    cdsDocWareVAT: TBCDField;
    cdsDocWareVatVal: TFloatField;
    procedure cdsDocCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cdsDocWareCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FHandle : HWnd;
    FDocParamz : TDocParamz;
    function CheckData: boolean;
    function ConfirmChanges: boolean;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
    function SaveProp: boolean;
    procedure initialize(ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);

  end;

var
  DAcc: TDAcc;

  procedure ShowDAcc(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet = nil;
                   AcdsWare : TClientDataSet = nil);
implementation

uses uDM, foMyFuncEh;

procedure ShowDAcc(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
var F : TDAcc;
begin
  F := TDAcc.Create(nil);
  try
    F.FHandle := AHandle;
    F.initialize(ADocParamz, AcdsOper, AcdsWare);
    F.ModalResult := mrNone;
    F.Show;
  except

  end;
end;
{$R *.DFM}

procedure TDAcc.cdsDocCalcFields(DataSet: TDataSet);
begin
  with DataSet do
    FieldByName('WoVAT').AsFloat := FieldByName('Summ').AsFloat * (100 - FieldByName('VAT').AsFloat)/100;
end;

constructor TDAcc.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  LoadEhGridSettingsFromRegistry(DBGridEh1, SRegPath + '\' + Name);
end;

procedure TDAcc.CreateParams(var Params: TCreateParams);
begin
  inherited;

end;

procedure TDAcc.initialize(ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
var Val : Variant;
    VAT : Variant;
    RateOper, RateSys : Variant;
    NeedOpen : boolean;
begin
  VAT := 20;
  FDocParamz := ADocParamz;
  NeedOpen := AcdsOper = nil;
  if AcdsOper = nil then
  begin
    AcdsOper := DM.cdsOperFin;
  end;
  if AcdsWare = nil then
    AcdsWare := DM.cdsOperWare;

  with cdsDoc do
  begin
    Close;
    Params.ParamByName('@id_Account').AsInteger := FDocParamz.id_Doc;
    Open;
  end;
  with cdsDocWare do
  begin
    Close;
    Params.ParamByName('@id_Account').AsInteger := FDocParamz.id_Doc;
    Open;
  end;


  if FDocParamz.id_Doc = -1 then
  begin
    cdsDoc.Edit;
    cdsDocid_UserCreator.AsInteger := DM.IDUser;
    cdsDocid_Oper.AsInteger := FDocParamz.id_Oper;
    cdsDocDoc_Date.AsDateTime := date;
    with AcdsOper do
    begin
      if NeedOpen then
      begin
        Close;
        Params.ParamByName('@id_Oper').AsInteger := FDocParamz.id_Oper;
        Params.ParamByName('@is_Mirr').AsBoolean := FDocParamz.is_Mirr;
        Open;
      end;
      try
        cdsDoccustomer.AsString := FieldByName('ReprName').AsString;
        cdsDocPayer.AsString := FieldByName('ReprName').AsString;
        RateOper := FieldByName('RateOper').AsFloat;
        RateSys := FieldByName('RateSys').AsFloat;
      finally
        if NeedOpen then Close;
      end;
    end;
    cdsDoc.Post;

    with AcdsWare do
    begin
      if NeedOpen then
      begin
        Close;
        Params.ParamByName('@id_Oper').AsInteger := FDocParamz.id_Oper;
        Open;
      end;

      DisableControls;
      try
        First;
        while not Eof do
        begin
          cdsDocWare.Append;
          cdsDocWareWareName.Value := FieldByName('WareName').Value;
          if FieldByName('SummSys').IsNull then
            cdsDocWarePrice.Value := FieldByName('PriceOper').Value * RateOper
          else
            cdsDocWarePrice.Value := FieldByName('SummSys').Value * RateSys;
          cdsDocWareVAT.Value := VAT;
          cdsDocWareAmount.Value := FieldByName('AmountOper').Value;
          cdsDocWareMesName.Value := FieldByName('MeasureName').Value;

          cdsDocWare.Post;

          Next;
        end;
      finally
        if NeedOpen then Close else First;
        EnableControls;
      end;
    end;
  end;
  if FDocParamz.Copy then
    FDocParamz.id_Oper := -1;
  if (FDocParamz.id_Oper = -1) then
  begin
    Caption := 'Новый счет';
  end
  else
  begin
    Caption := 'Счет №' + cdsDocDoc_Num.AsString;
  end;
  if FDocParamz.ReadOnly then
    Caption := Caption + ', только чтение';
  DM.CDStoSL(5, FDocParamz.ID_Doc, cbOrgName);
  DM.CDStoSL(7, FDocParamz.ID_Doc, cbINN);
  DM.CDStoSL(6, FDocParamz.ID_Doc, cbAddress);
  DM.CDStoSL(9, FDocParamz.ID_Doc, cbKPP);
  DM.CDStoSL(11, FDocParamz.ID_Doc, cbBIK);
  DM.CDStoSL(10, FDocParamz.ID_Doc, cbBank);
  DM.CDStoSL(12, FDocParamz.ID_Doc, cbAcc1);
  DM.CDStoSL(12, FDocParamz.ID_Doc, cbAcc2);
  DM.CDStoSL(3, FDocParamz.ID_Doc, cbChif);
  DM.CDStoSL(2, FDocParamz.ID_Doc, cbBuh);
end;

function TDAcc.SaveProp: boolean;
var ID_Tmp, id_Oper: Integer;
    Doc_Num, Doc_Date,
    BIK, id_UserCreator, INN, Payer, Chif, Buh, customer, Bank,
  Acc1, Acc2, OrgName, Address, KPP: OleVariant;
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

    BIK := fieldByName('BIK').Value;
    INN := fieldByName('INN').Value;
    Payer := fieldByName('Payer').Value;
    Chif  := fieldByName('Chif').Value;
    Buh := fieldByName('Buh').Value;
    customer := fieldByName('customer').Value;
    Bank := fieldByName('Bank').Value;
    Acc1 := fieldByName('Acc1').Value;
    Acc2 := fieldByName('Acc2').Value;
    OrgName := fieldByName('OrgName').Value;
    Address := fieldByName('Address').Value;
    KPP := fieldByName('KPP').Value;

    id_UserCreator := fieldByName('id_UserCreator').Value;
  end;

  BeginTruns(DM.rsCA);
  try
    ID_Tmp := DM.rsCA.AppServer.Doc_AccountEdit(FDocParamz.ID_Doc, id_Oper, Doc_Num,
            Doc_Date, BIK, id_UserCreator, INN, Payer, Chif, Buh, customer, Bank,
            Acc1, Acc2, OrgName, Address, KPP);

    if ID_Tmp = -1 then
      raise Exception.Create('Ошибка при сохранении свойств');

    if not CDSApplyUpdates(cdsDocWare, 'id_Account', ID_Tmp, true) then
      raise Exception.Create('Ошибка при сохранении перечня товаров');
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

procedure TDAcc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if ModalResult = mrOk then
    if SaveProp then
      SendMessage(FHandle, xxx_RefrMsg, FDocParamz.ID_Doc, 0);
end;

procedure TDAcc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (cdsDoc.State = dsEdit) then cdsDoc.Post;
end;

destructor TDAcc.Destroy;
begin
  SaveEhGridSettingsToRegistry(DBGridEh1, SRegPath + '\' + Name);
  inherited;
end;


procedure TDAcc.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TDAcc.btnOkClick(Sender: TObject);
begin
  if not ConfirmChanges then
    ModalResult := mrNone
  else
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

function TDAcc.ConfirmChanges: boolean;
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
  CDS.Post;
end;

function TDAcc.CheckData: boolean;
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
  xxx(cbAddress);
  xxx(cbINN);
  xxx(cbKPP);
  xxx(cbBIK);

  xxx(cbBank);
  xxx(cbAcc1);
  xxx(cbAcc2);
  xxx(edcustomer);
  xxx(edPayer);

  xxx(cbBuh);
  Result := true;
end;

procedure TDAcc.cdsDocWareCalcFields(DataSet: TDataSet);
var SummOper2 : Extended;
begin
  DataSet.FieldByName('Numb').AsInteger := DataSet.RecNo;
  if DataSet.FieldByName('Amount').AsFloat = 0 then
    SummOper2 := DataSet.FieldByName('Price').AsFloat
  else
    SummOper2 := DataSet.FieldByName('Amount').AsFloat * DataSet.FieldByName('Price').AsFloat;
  DataSet.FieldByName('SummOper2').AsFloat := SummOper2;

  DataSet.FieldByName('VATVal').AsFloat := SummOper2*(DataSet.FieldByName('VAT').AsFloat)/100;
  DataSet.FieldByName('woVAT').AsFloat := SummOper2*(100-DataSet.FieldByName('VAT').AsFloat)/100;
end;

procedure TDAcc.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TDAcc.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

end.
