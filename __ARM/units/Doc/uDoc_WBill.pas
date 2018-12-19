unit uDoc_WBill;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Mask, DBCtrls, ToolEdit, RXDBCtrl,
  RxDBComb, CurrEdit, ComObj, foMyFunc, RXCtrls, Grids, DBGridEh, Menus,
  ComCtrls, ToolWin, ImgList, ActnList, RxLookup, Buttons, GridsEh;

type
  TWBill = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cdsDoc: TClientDataSet;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    GroupBox2: TGroupBox;
    cdsDocWare: TClientDataSet;
    cdsDocWareNumb: TIntegerField;
    cdsDocWareSS: TAggregateField;
    dsOperWare: TDataSource;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    ActionList1: TActionList;
    aAddWare: TAction;
    aDelWare: TAction;
    aCalcAmount: TAction;
    aClearWare: TAction;
    ilImage: TImageList;
    ToolBar3: TToolBar;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    edRC_Name: TDBEdit;
    edRC_Address: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edRC_Bank: TDBEdit;
    edRC_Acc: TDBEdit;
    edRC_BIK: TDBEdit;
    edRC_CorAcc: TDBEdit;
    GroupBox5: TGroupBox;
    Label17: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edPayer_Name: TDBEdit;
    edPayer_Address: TDBEdit;
    edPayer_Bank: TDBEdit;
    edPayer_Acc: TDBEdit;
    edPayer_BIK: TDBEdit;
    edPayer_CorAcc: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label1: TLabel;
    Label31: TLabel;
    DBEdit3: TDBEdit;
    Label32: TLabel;
    edChif_Post: TDBEdit;
    Label33: TLabel;
    Label34: TLabel;
    edPuter_Name: TDBEdit;
    Label35: TLabel;
    edPuter_post: TDBEdit;
    cdsDocWareSSBrutto: TAggregateField;
    Label20: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    dsDocCurGetList: TDataSource;
    cdsDocCurGetList: TClientDataSet;
    cdsDocCurGetListid_DocCur: TAutoIncField;
    cdsDocCurGetListDocCurName: TStringField;
    cdsDocCurGetListDocCurPartName: TStringField;
    cdsDocCurGetListDef: TIntegerField;
    cdsDocWareid_WBillWare: TAutoIncField;
    cdsDocWareid_WBill: TIntegerField;
    cdsDocWareAmount: TFloatField;
    cdsDocWareWareName: TStringField;
    cdsDocWareMesName: TStringField;
    cdsDocWarePackType: TStringField;
    cdsDocWarePalaceCount: TFloatField;
    cdsDocWareBrutto: TFloatField;
    cdsDocWareSSPalaceCount: TAggregateField;
    cdsDocWareCode: TStringField;
    cdsDocWarePRCNum: TStringField;
    cdsDocWareCardNum: TStringField;
    cdsDocWareArticul: TStringField;
    cdsDocid_WBill: TAutoIncField;
    cdsDocid_Oper: TIntegerField;
    cdsDocDoc_Num: TStringField;
    cdsDocDoc_Date: TDateTimeField;
    cdsDocDoc_DateCreate: TDateTimeField;
    cdsDocid_UserCreator: TIntegerField;
    cdsDocid_DocCur: TIntegerField;
    cdsDocOrgName: TStringField;
    cdsDocAddress: TStringField;
    cdsDocBank: TStringField;
    cdsDocBIK: TBCDField;
    cdsDocAcc: TStringField;
    cdsDocCorAcc: TStringField;
    cdsDocOKPO: TStringField;
    cdsDocOKPO2: TStringField;
    cdsDocOKPO3: TStringField;
    cdsDocRC_Name: TStringField;
    cdsDocRC_Address: TStringField;
    cdsDocRC_Bank: TStringField;
    cdsDocRC_BIK: TBCDField;
    cdsDocRC_Acc: TStringField;
    cdsDocRC_CorAcc: TStringField;
    cdsDocPayer_Name: TStringField;
    cdsDocPayer_Address: TStringField;
    cdsDocPayer_Bank: TStringField;
    cdsDocPayer_BIK: TBCDField;
    cdsDocPayer_Acc: TStringField;
    cdsDocPayer_CorAcc: TStringField;
    cdsDocBuh: TStringField;
    cdsDocChecker_post: TStringField;
    cdsDocChecker_Name: TStringField;
    cdsDocPuter_post: TStringField;
    cdsDocPuter_Name: TStringField;
    cdsDocGeter_Post: TStringField;
    cdsDocGeter_FIO: TStringField;
    cdsDocDisabled: TBooleanField;
    cdsDocid_business: TIntegerField;
    cdsDocDocCurPartName: TStringField;
    cdsDocDocCurName: TStringField;
    cdsDocid_DocCur_1: TAutoIncField;
    cdsDocDef: TBooleanField;
    cdsDocNumberCode: TStringField;
    cdsDocid_Doc_Org: TIntegerField;
    cbOrgName: TDBEdit;
    BitBtn3: TBitBtn;
    cbAddress: TDBEdit;
    cbOKPO: TDBEdit;
    cbBank: TDBEdit;
    BitBtn1: TBitBtn;
    cbBIK: TDBEdit;
    cbAcc1: TDBEdit;
    cbAcc2: TDBEdit;
    cbBuh: TDBEdit;
    cdsDocWareVatVal: TBCDField;
    cdsDocVAT: TBCDField;
    cdsDocWareSummWare: TBCDField;
    cdsDocWarePrice: TBCDField;
    cdsDocWarePrice0: TBCDField;
    cdsDocWareAmount0: TFloatField;
    cdsDocWareVAT: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cdsDocWareCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure dsOperWareDataChange(Sender: TObject; Field: TField);
    procedure DBGridEh1ColEnter(Sender: TObject);
    procedure aAddWareExecute(Sender: TObject);
    procedure aDelWareExecute(Sender: TObject);
    procedure aClearWareExecute(Sender: TObject);
    procedure aCalcAmountExecute(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cdsDocAddressGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    FHandle : HWnd;
    FDocParamz : TDocParamz;
    function CheckData: boolean;
    function ConfirmChanges: boolean;
    procedure MakeExport(APrint: boolean);
    function GetVATCol: TColumnEh;
    procedure Doc_OrgBankGetDef(id_Doc_Org: integer);
  public
    FPrntW : HWnd;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
    function SaveProp: boolean;
    procedure initialize(ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);

  end;

var
  WBill: TWBill;

  procedure ShowWBill(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet = nil;
                   AcdsWare : TClientDataSet = nil);

  procedure ShowWBill_Delta(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet = nil;
                   AcdsWare : TClientDataSet = nil);
implementation

uses uDM, foMyFuncEh, {$IFNDEF LC} uUnivSelector, {$ENDIF} uInputBoxDigit, NumTools, uMeCrpt,
  uSelectorDocOrg, uSelectorDocOrgBank;

procedure ShowWBill_Delta(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet = nil;
                   AcdsWare : TClientDataSet = nil);
begin
  ADocParamz.OnlyDelta := true;
  ShowWBill(AHandle, ADocParamz, AcdsOper, AcdsWare);
end;

procedure ShowWBill(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
var F : TWBill;
begin
  DM.Rights_GetUserRights(26, Null);
  F := TWBill.Create(nil);
  try
    F.FHandle := AHandle;
    F.initialize(ADocParamz, AcdsOper, AcdsWare);
    F.ModalResult := mrNone;
{$IFNDEF LC}
    F.Show;
{$ELSE}
    F.MakeExport(false);
    F.Free;
{$ENDIF}
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;
{$R *.DFM}

constructor TWBill.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  LoadEhGridSettingsFromRegistry(DBGridEh1, SRegPath + '\' + ClassName);
end;

procedure TWBill.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

procedure TWBill.initialize(ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
var Val : Variant;
    NeedOpen, VATIn : boolean;
    BIK, Bank, AccName, CorAccNAme, OKPO, Addr, INN, KPP: OleVariant;
    GTD, Country, DocNomCode, DocPriceCode, DocArt, DocNumber: OleVariant;
    OperVid : integer;
    id_Doc_Org, OrgName, Chif, Buh, OKPD, Address :  OleVariant;
  xDate: TDateTime; xNum: String;
begin
  FPrntW := GetControlFormHHH(AcdsOper);
  btnOk.Enabled := (ADocParamz.ID_Oper > 0) or (ADocParamz.id_Doc > 0);
  FDocParamz := ADocParamz;
  NeedOpen := AcdsOper = nil;
  if AcdsOper = nil then
  begin
    AcdsOper := DM.cdsOperFin;
  end;
//  if AcdsWare = nil then
  //  AcdsWare := DM.cdsOperWare;

  with cdsDoc do
  begin
    Close;
    Params.ParamByName('@id_WBill').AsInteger := FDocParamz.id_Doc;
    Open;
  end;
  with cdsDocWare do
  begin
    Close;
    Params.ParamByName('@id_WBill').AsInteger := FDocParamz.id_Doc;
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
        VATIn := FieldByName('VATIn').AsBoolean;
        cdsDocid_business.Value := FieldByName('id_business').Value;
        DM.rsCA.AppServer.Doc_ReprGetProp(FieldByName('id_Repr').AsInteger,
                                          BIK, Bank, AccName, CorAccNAme, OKPO, Addr, INN, KPP);
        cdsDocRC_Name.AsString := FieldByName('ReprName').AsString;
        cdsDocRC_Address.AsVariant := Addr;
        cdsDocRC_Bank.AsVariant := Bank;
        cdsDocRC_BIK.AsVariant := BIK;
        cdsDocRC_Acc.AsVariant := AccName;
        cdsDocRC_CorAcc.AsVariant := CorAccNAme;

        cdsDocPayer_Name.AsString := FieldByName('ReprName').AsString;
        cdsDocPayer_Address.AsVariant := Addr;
        cdsDocPayer_Bank.AsVariant := Bank;
        cdsDocPayer_BIK.AsVariant := BIK;
        cdsDocPayer_Acc.AsVariant := AccName;
        cdsDocPayer_CorAcc.AsVariant := CorAccNAme;

        if not FieldByName('Id_CurrencySys').IsNull then
          cdsDocid_DocCur.AsInteger := FieldByName('Id_CurrencySys').AsInteger
        else
          cdsDocid_DocCur.AsInteger := FieldByName('Id_CurrencyOper').AsInteger;

  if AcdsWare = nil then
  begin
    if DM.FFF201 and (AcdsOper.FieldByName('OperVid').AsInteger = 201) then
    begin
      AcdsWare := DM.cdsOperWare201;
      AcdsWare.Params.ParamByName('@Mode').Value := 1;
    end
    else
      AcdsWare := DM.cdsOperWare;
  end;

      finally
        if NeedOpen then Close;
      end;
    end;
    cdsDocDoc_Num.AsVariant := DM.rsCA.AppServer.GetDoc_Num2(7, cdsDocid_business.Value);
        if DM.GetDocNum(cdsDocid_Oper.AsInteger, cdsDocid_business.AsInteger, xDate, xNum) then
        begin
          cdsDocDoc_Num.AsString := xNum;
          cdsDocDoc_Date.AsDateTime := xDate;
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
            cdsDocWareSummWare.AsVariant := FieldByName('PriceOper').Value * FieldByName('AmountOper').Value
          else
            cdsDocWareSummWare.AsVariant := FieldByName('SummSys').Value;
          if AcdsWare.FindField('AmountOperBaseMS_1') <> nil then
            cdsDocWareAmount.AsVariant := FieldByName('AmountOper').AsFloat - FieldByName('AmountOperBaseMS_1').AsFloat
          else
            cdsDocWareAmount.AsVariant := FieldByName('AmountOper').Value;
          cdsDocWareMesName.AsVariant := DM.GetLeftText(FieldByName('MeasureName').Value);

          DM.rsCA.AppServer.Doc_GoodsGetProp(FieldByName('id_Goods').AsInteger, GTD, Country,
                                   DocNomCode, DocPriceCode, DocArt, DocNumber);

          cdsDocWareCode.AsVariant := DocNomCode;
          cdsDocWarePRCNum.AsVariant := DocPriceCode;
          cdsDocWareArticul.AsVariant := DocArt;
          cdsDocWareCardNum.AsVariant := DocNumber;

          cdsDocWare.Post;

          Next;
        end;
        DM.TrimCDS(cdsDocWareAmount);
      finally
        if NeedOpen then Close else First;
        EnableControls;
      end;
    end;
  end
  else
  begin
    with cdsDoc do
    begin
      if FieldByName('Doc_Num').IsNull then
      begin
        Edit;
        FieldByName('Doc_Num').AsString := IntToStr(FDocParamz.id_Doc);
        Post;
      end;
    end;
  end;
  if FDocParamz.Copy then
    FDocParamz.id_Oper := -1;
  if (FDocParamz.ID_Doc = -1) then
  begin
    Caption := 'Новая товарно-транспортная накладная';
  end
  else
  begin
    Caption := 'Товарно-транспортная накладная №' + cdsDocDoc_Num.AsString;
  end;
  if FDocParamz.ReadOnly then
    Caption := Caption + ', только чтение';

  if (FDocParamz.ID_Doc = -1) and not (FDocParamz.Copy) then
    if DM.GetDefOrg(cdsDocid_business.AsInteger, id_Doc_Org, OrgName, INN,
    KPP, Chif, Buh, OKPO, OKPD, Address) then
  begin
    cdsDoc.Edit;
    cdsDocid_Doc_Org.Value := id_Doc_Org;
    cdsDocOrgName.AsVariant := OrgName;
    cdsDocAddress.AsVariant := Address;
    cdsDocOKPO.AsVariant := OKPO;
    cdsDocBuh.AsVariant := Buh;

    cdsDoc.Post;
    Doc_OrgBankGetDef(id_Doc_Org);
  end;
  DM.cdsDocCurGetListOpen(cdsDocCurGetList, RxDBLookupCombo1, cdsDocid_business.Value, FDocParamz.ID_Doc,
                          cdsDocid_DocCur.AsInteger); 
//  DM.ColumnGetData(GetVATCol, cdsDocid_Doc_Org.AsInteger, FDocParamz.ID_Doc);


  DM.ColumnGetData(GetVATCol, cdsDocid_Doc_Org.AsInteger, FDocParamz.ID_Doc);

  if not VATIn and (FDocParamz.id_Doc = -1) then
  begin
    with cdsDocWare do
    begin
      DisableControls;
      try
        First;
        while not Eof do
        begin
          Edit;
          cdsDocWareSummWare.AsFloat := cdsDocWareSummWare.AsFloat * (100 + cdsDocWareVAT.AsFloat)/100;
          Post;
          Next;
        end;
        First;
      finally
        EnableControls;
      end;
    end;
  end;
end;

function TWBill.GetVATCol: TColumnEh;
var i : integer;
begin
  Result := nil;
  for i := 0 to DBGridEh1.Columns.Count - 1 do
  begin
    if DBGridEh1.Columns[i].Field = cdsDocWareVAT then
    begin
      Result := DBGridEh1.Columns[i];
      Break;
    end;
  end;
end;

function TWBill.SaveProp: boolean;
var ID_Tmp : Integer;
    RRR : V_WBill;
    OldCursor : TCursor;
    V : Variant;
    id_Doc_Org : integer;
begin
  if FDocParamz.ReadOnly or ((cdsDoc.ChangeCount = 0) and  (cdsDocWare.ChangeCount = 0)) then Exit;
  ID_Tmp := FDocParamz.ID_Doc;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  with cdsDoc do
  begin
    RRR.id_DocCur := fieldByName('id_DocCur').AsInteger;
    RRR.Doc_Date := fieldByName('Doc_Date').Value;
    RRR.Doc_Num := fieldByName('Doc_Num').AsString;
    RRR.id_Oper := fieldByName('id_Oper').Value;
    RRR.id_UserCreator := fieldByName('id_UserCreator').Value;

    RRR.OKPO := fieldByName('OKPO').AsString;
    RRR.OKPO2 := fieldByName('OKPO2').AsString;
    RRR.OKPO3 := fieldByName('OKPO3').AsString;

    RRR.OrgName := fieldByName('OrgName').AsString;
    RRR.Address := fieldByName('Address').AsString;
    RRR.Bank := fieldByName('Bank').AsString;
    RRR.BIK := fieldByName('BIK').Value;
    RRR.CorAcc := fieldByName('CorAcc').AsString;
    RRR.Acc := fieldByName('Acc').AsString;

    RRR.RC_Name := fieldByName('RC_Name').AsString;
    RRR.RC_Address := fieldByName('RC_Address').AsString;
    RRR.RC_Bank := fieldByName('RC_Bank').AsString;
    RRR.RC_BIK := fieldByName('RC_BIK').Value;
    RRR.RC_CorAcc := fieldByName('RC_CorAcc').AsString;
    RRR.RC_Acc := fieldByName('RC_Acc').AsString;

    RRR.Payer_Name := fieldByName('Payer_Name').AsString;
    RRR.Payer_Address := fieldByName('Payer_Address').AsString;
    RRR.Payer_Bank := fieldByName('Payer_Bank').AsString;
    RRR.Payer_BIK := fieldByName('Payer_BIK').Value;
    RRR.Payer_CorAcc := fieldByName('Payer_CorAcc').AsString;
    RRR.Payer_Acc := fieldByName('Payer_Acc').AsString;

    RRR.Buh := fieldByName('Buh').AsString;

    RRR.Checker_Name := fieldByName('Checker_Name').AsString;
    RRR.Checker_post := fieldByName('Checker_post').AsString;

    RRR.Puter_Name := fieldByName('Puter_Name').AsString;
    RRR.Puter_post := fieldByName('Puter_post').AsString;
    RRR.Geter_FIO := fieldByName('Geter_FIO').AsString;
    RRR.Geter_Post := fieldByName('Geter_Post').AsString;
    RRR.VAT := fieldByName('VAT').Value;

    id_Doc_Org := fieldByName('id_Doc_Org').AsInteger;
  end;
  V := PackRecV_WBill(RRR);
  BeginTruns(DM.rsCA);
  try
    ID_Tmp := DM.rsCA.AppServer.Doc_WBillEdit(FDocParamz.ID_Doc, V, id_Doc_Org);

    if ID_Tmp = -1 then
      raise Exception.Create('Ошибка при сохранении свойств');
    if FDocParamz.ID_Doc = -1 then
      FDocParamz.ID_Doc := ID_Tmp;
    if not CDSApplyUpdates(cdsDocWare, 'id_WBill', FDocParamz.ID_Doc, true) then
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

procedure TWBill.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if ModalResult = mrOk then
    if SaveProp then
      SendMessage(FHandle, xxx_RefrMsg, FDocParamz.ID_Doc, 0);
end;

procedure TWBill.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (cdsDoc.State = dsEdit) then cdsDoc.Post;
end;

destructor TWBill.Destroy;
begin
  SaveEhGridSettingsToRegistry(DBGridEh1, SRegPath + '\' + ClassName);
  inherited;
  BringWindowToTop(FPrntW);
end;


procedure TWBill.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TWBill.btnOkClick(Sender: TObject);
begin
  ModalResult := mrNone;
  if not ConfirmChanges then
    ModalResult := mrNone
  else
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

function TWBill.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  if cdsDocWare.State in [dsEdit, dsInsert] then cdsDocWare.Post;

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

function TWBill.CheckData: boolean;
begin
  Result := false;

  CheckEmptyControl(Handle,DBDateEdit1);

  CheckEmptyControl(Handle, cbOrgName);
  CheckEmptyControl(Handle, edRC_Name);
  CheckEmptyControl(Handle, edPayer_Name);

  with cdsDocWare do
    if IsEmpty then
    begin
      MessageBox(Handle, 'Не выбраны товары', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(DBGridEh1.Handle);
      Exit;
    end;
  Result := true;
end;

procedure TWBill.cdsDocWareCalcFields(DataSet: TDataSet);
begin
  cdsDocWare.OnCalcFields := nil;
  try
    DataSet.FieldByName('Numb').AsInteger := DataSet.RecNo;
    if (cdsDocWarePrice0.AsVariant <> cdsDocWarePrice.AsVariant)
    and (not cdsDocWarePrice.IsNull)
    and (not cdsDocWarePrice0.IsNull) then
    begin
      cdsDocWareSummWare.Value := cdsDocWarePrice.Value * cdsDocWareAmount.Value / (1 - cdsDocVAT.Value / 100);
    end;
    if (cdsDocWareAmount0.AsVariant <> cdsDocWareAmount.AsVariant)
    and (not cdsDocWareAmount.IsNull)
    and (not cdsDocWareAmount0.IsNull) then
    begin
      cdsDocWareSummWare.Value := cdsDocWarePrice.Value * cdsDocWareAmount.Value / (1 - cdsDocVAT.Value / 100);
    end;

    cdsDocWareVATVal.Value := cdsDocWareSummWare.Value * cdsDocVAT.Value / (100 + cdsDocVAT.Value);
 //   cdsDocWarewoVAT.Value := cdsDocWareSummWare.Value - cdsDocWareVATVal.Value;

    if cdsDocWareAmount.Value <> 0 then
      cdsDocWarePrice.Value := cdsDocWareSummWare.Value/cdsDocWareAmount.Value;

    cdsDocWarePrice0.AsVariant := cdsDocWarePrice.AsVariant;
    cdsDocWareAmount0.AsVariant := cdsDocWareAmount.AsVariant;
  finally
    cdsDocWare.OnCalcFields := cdsDocWareCalcFields;
  end;
end;

procedure TWBill.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TWBill.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TWBill.MakeExport(APrint : boolean);
var
  ExcelApp, DataValues, Workbook, Column, Sheet, Cell1, Cell2, Range, V : Variant;
  i : integer;
  SSS : Extended;
  S, S2, S3 : String;
begin
//  if cdsDocWare.IsEmpty then
//    raise Exception.Create('Не введен ни один товар!!!' + #13 + #10 + 'Распечатать невозможно');
  CheckExcel;
  if cdsDoc.State in [dsEdit, dsInsert] then
  begin
    cdsDocDocCurName.AsString := cdsDocCurGetListDocCurName.AsString;
    cdsDocDocCurPartName.AsString := cdsDocCurGetListDocCurPartName.AsString;
    cdsDoc.Post;
  end;
  windows.SetFocus(DBDateEdit1.Handle);
  try
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.visible := true;
    ExcelApp.Application.EnableEvents := false;
    ExcelApp.ScreenUpdating:= false;
    Screen.Cursor := crSQLWait;
    try
      try Workbook := ExcelApp.WorkBooks.Add(ExtractFilePath(Application.EXEName) + 'docs_templ\WayBill.xlt');
      except
        on E : Exception do
        begin
         ShowMessage('Ошибка при открытии файла ' + #13 + #10 + E.Message);
         raise Exception.Create(E.Message);
        end;
      end;
      Sheet := ExcelApp.Workbooks[1].WorkSheets[1];

   //   Cell1 := Sheet.Cells[1, 1];
   //   Cell2 := Sheet.Cells[100, 20];
    //  Range := Sheet.Range[Cell1, Cell2];
      Range := Sheet.Cells;


      SetExcelBMVal(Range, '^PriceCol', 'Цена, ' + cdsDocCurGetListDocCurName.AsString + '. ' + cdsDocCurGetListDocCurPartName.AsString);
      SetExcelBMVal(Range, '^SummCol', 'Сумма, ' + cdsDocCurGetListDocCurName.AsString + '. ' + cdsDocCurGetListDocCurPartName.AsString);

      S := cdsDocOrgName.AsString;
      if cdsDocAddress.AsString <> '' then
        S := S + ', ' + cdsDocAddress.AsString;
      if cdsDocAcc.AsString <> '' then
        S := S + ', р/с ' + cdsDocAcc.AsString;
      if cdsDocBank.AsString <> '' then
        S := S + ' в ' + cdsDocBank.AsString;
      if cdsDocBIK.AsString <> '' then
        S := S + ', БИК ' + cdsDocBIK.DisplayText;
      if cdsDocCorAcc.AsString <> '' then
        S := S + ', корр/с ' + cdsDocCorAcc.AsString;
      SetExcelBMVal(Range, '^OrgNameAdv', S);

      S := cdsDocRC_Name.AsString;
      if cdsDocRC_Address.AsString <> '' then
        S := S + ', ' + cdsDocRC_Address.AsString;
      if cdsDocRC_Acc.AsString <> '' then
        S := S + ', р/с ' + cdsDocRC_Acc.AsString;
      if cdsDocRC_Bank.AsString <> '' then
        S := S + ' в ' + cdsDocRC_Bank.AsString;
      if cdsDocRC_BIK.AsString <> '' then
        S := S + ', БИК ' + cdsDocRC_BIK.DisplayText;
      if cdsDocRC_CorAcc.AsString <> '' then
        S := S + ', корр/с ' + cdsDocRC_CorAcc.AsString;
      SetExcelBMVal(Range, '^RCAdv', S);

      S := cdsDocPayer_Name.AsString;
      if cdsDocPayer_Address.AsString <> '' then
        S := S + ', ' + cdsDocPayer_Address.AsString;
      if cdsDocPayer_Acc.AsString <> '' then
        S := S + ', р/с ' + cdsDocPayer_Acc.AsString;
      if cdsDocPayer_Bank.AsString <> '' then
        S := S + ' в ' + cdsDocPayer_Bank.AsString;
      if cdsDocPayer_BIK.AsString <> '' then
        S := S + ', БИК ' + cdsDocPayer_BIK.DisplayText;
      if cdsDocPayer_CorAcc.AsString <> '' then
        S := S + ', корр/с ' + cdsDocPayer_CorAcc.AsString;
      SetExcelBMVal(Range, '^PayerAdv', S);

      SSS := StrToFloatAdv(cdsDocWareSS.AsString);
      S := 'Всего отпущено на сумму ' + NumeralToPhraseAdv(SSS);
      SetExcelBMVal(Range, '^TotalSummAdv', S);

      SetExcelBMVal(Range, '^SummOper2TT', cdsDocWareSS.AsString);
      SetExcelBMVal(Range, '^Doc_DateAdv1', FormatDateTimeNull('dd mm yyyy', cdsDocDoc_Date.AsDateTime));
      SetExcelBMVal(Range, '^Doc_DateAdv2', FormatDateTimeNull('dd mmmm yyyy г.', cdsDocDoc_Date.AsDateTime));

      S := NumeralToPhrase('0' + IntToStr(cdsDoc.RecordCount));
      SetExcelBMVal(Range, '^NumCount', S);
      SetExcelBMVal(Range, '^NameCount', S);


      SetExcelBMVal(Range, '^PalaceCountSS', cdsDocWareSSPalaceCount.AsString);


      CDSToExcel(cdsDoc, Range);
      CDSToExcelTable(cdsDocWare, Range, '^Code');

      SetExcelBMVal(Range, '^Brutto1', cdsDocWareSSBrutto.AsString);
      SetExcelBMVal(Range, '^Brutto2', cdsDocWareSSBrutto.AsString);
      SSS := StrToFloatAdv(cdsDocWareSSBrutto.AsString);
      S := NumeralToPhrase('0' + IntToStr(Trunc(SSS))) + ' ' + FormatFloat('00', Frac(SSS) * 1000);
      SetExcelBMVal(Range, '^BruttoAdv1', S);
      SetExcelBMVal(Range, '^BruttoAdv2', S);

      ExcelApp.ActiveWindow.View := 2;
      i := Sheet.HPageBreaks.Count;
      ExcelApp.ActiveWindow.View := 1;
      if i = 0 then
        S := '-----------'
      else
        S := NumeralToPhrase('0' + IntToStr(i));
      SetExcelBMVal(Range, '^PageCount', S);
    finally
      ExcelApp.Visible := not APrint;
      Screen.Cursor := crDefault;
      if APrint then
      begin
        Sheet.PrintOut;
        Workbook.Close(false);
        ExcelApp.Visible := true;
        ExcelApp.Quit;
        ExcelApp := Null;
      end
      else
        ExcelApp.ScreenUpdating:= true;
    end;
  except
    on E : Exception do
    begin
      try
        Workbook.Close(false);
      except end;
      ExcelApp.Quit;
      ExcelApp := Null;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TWBill.N1Click(Sender: TObject);
begin
  MakeExport(false);
end;

procedure TWBill.N2Click(Sender: TObject);
begin
  MakeExport(true);
end;

procedure TWBill.dsOperWareDataChange(Sender: TObject; Field: TField);
begin
  with (Sender as TDataSource).DataSet do
  begin
    aClearWare.Enabled := not IsEmpty;
    aDelWare.Enabled := not IsEmpty;
 //   aCalcAmount.Enabled := not IsEmpty;
  end;
end;

procedure TWBill.DBGridEh1ColEnter(Sender: TObject);
var ACol : TColumnEh;
begin
  ACol := DBGridEh1.Columns[DBGridEh1.col];
  aCalcAmount.Enabled := not DBGridEh1.DataSource.DataSet.IsEmpty and
                         (ACol.Field is TNumericField)
                         and not ACol.ReadOnly;

end;

procedure TWBill.aAddWareExecute(Sender: TObject);
var ASelectedObj : TSelectedObj;
    AID, AName : OleVariant;
    EObjTypes : TEObjTypes;
begin
{$IFNDEF LC}
  Screen.Cursor := crSQLWait;
  EObjTypes := [eotGoods];
  with cdsDocWare do
  begin
    if SelectObjUnBsn(Owner, cdsDocid_business.Value, ASelectedObj, 0, EObjTypes, true) then
    begin
      Append;
      FieldByName('WareName').Value := ASelectedObj.Name;
      if DM.rsCA.AppServer.PL_WareMeasureGet(ASelectedObj.ID,
                                             AID, AName) = 1 then
      begin
        FieldByName('MesName').Value := AName;
      end;
      DBGridEh1.col := 2;
      windows.SetFocus(DBGridEh1.Handle);
      Post;
    end;
  end;
{$ENDIF}
end;

procedure TWBill.aDelWareExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if DBGridEh1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(DBGridEh1.SelectedRows.Count) + ' товаров?'
  else
    S := 'Удалить товар "' + DBGridEh1.DataSource.DataSet.FieldByName('WareName').AsString+ '"?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if DBGridEh1.SelectedRows.Count > 0 then
      begin
        for i := 0 to DBGridEh1.SelectedRows.Count - 1 do
        begin
          DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
          DBGridEh1.DataSource.DataSet.Delete;
        end;
      end
      else
        DBGridEh1.DataSource.DataSet.Delete;
    finally

    end;


  end;
end;

procedure TWBill.aClearWareExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Очистить перечень товаров?'), 'Подтвердите очистку', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    with cdsDocWare do
    begin
      while not IsEmpty do
        Delete;
    end;
  end;
end;

procedure TWBill.aCalcAmountExecute(Sender: TObject);
var F : Variant;
    ACol : TColumnEh;
    S : String;
begin
  ACol := DBGridEh1.Columns[DBGridEh1.col];
  F := ACol.Field.AsFloat;
  S := ACol.Title.Caption;
  if InputBoxDigit(Handle, S + ' "' + cdsDocWareWareName.AsString + '"', ACol.Title.Caption, F) then
  begin
    with cdsDocWare do
    begin
      Edit;
      ACol.Field.AsFloat := F;
      Post;
    end;
  end;   
end;

procedure TWBill.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
var tmpCol : TColumnEh;
    S, S2 : String;
begin
  if (Key = '.') then
  begin
    S := DecimalSeparator;
    if S = ',' then S2 := '.' else S2 := ',';
    tmpCol := TDBGridEh(Sender).Columns[TDBGridEh(Sender).col];
    if (Key = S2[1]) and ((tmpCol.Field is TFloatField) or (tmpCol.Field is TBCDField)) then
      Key := S[1];
  end
  else
    if (Key = #13) then
    begin
      if TDBGridEh(Sender).DataSource.DataSet.State = dsEdit then
        TDBGridEh(Sender).DataSource.DataSet.Post
      else
      begin
        with TDBGrideh(Sender) do
          if selectedindex < (fieldcount - 1) then
            selectedindex := selectedindex + 1
          else
            selectedindex := 0;   
      end;
    end;
end;

procedure TWBill.BitBtn3Click(Sender: TObject);
var id_Doc_Org, OrgName, INN,
  KPP, Chif, Buh, OKPO, OKPD, Address : Variant;
begin
  id_Doc_Org := cdsDocid_Doc_Org.Value;
  if ShowSelectorDocOrg(cdsDocid_business.AsInteger, id_Doc_Org, OrgName, INN,
  KPP, Chif, Buh, OKPO, OKPD, Address) then
  begin
    cdsDoc.Edit;
    cdsDocid_Doc_Org.Value := id_Doc_Org;
    cdsDocOrgName.AsVariant := OrgName;
    cdsDocAddress.AsVariant := Address;
    cdsDocOKPO.AsVariant := OKPO;
    cdsDocBuh.AsVariant := Buh;

    cdsDoc.Post;
    Doc_OrgBankGetDef(id_Doc_Org);
    DM.ColumnGetData(GetVATCol, cdsDocid_Doc_Org.AsInteger, FDocParamz.ID_Doc);
  end;
end;

procedure TWBill.Doc_OrgBankGetDef(id_Doc_Org : integer);
var Bank, BIK, Acc, CorrAcc: OleVariant;
begin
  if DM.rsCA.AppServer.Doc_OrgBankGetDef(id_Doc_Org, Bank, BIK, Acc, CorrAcc) = 1 then
  begin
    cdsDoc.Edit;
    cdsDocBank.AsVariant := Bank;
    cdsDocBIK.AsVariant := BIK;
    cdsDocAcc.AsVariant := Acc;
    cdsDocCorAcc.AsVariant := CorrAcc;
    cdsDoc.Post;
  end;
end;

procedure TWBill.BitBtn1Click(Sender: TObject);
var Bank, BIK, Acc, CorrAcc: Variant;
begin
  if ShowSelectorDocOrgBank(cdsDocid_Doc_Org.AsInteger, Bank, BIK, Acc, CorrAcc)  then
  begin
    cdsDoc.Edit;
    cdsDocBank.AsVariant := Bank;
    cdsDocBIK.AsVariant := BIK;
    cdsDocAcc.AsVariant := Acc;
    cdsDocCorAcc.AsVariant := CorrAcc;
    cdsDoc.Post;
  end;
end;

procedure TWBill.cdsDocAddressGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := DM.acsAdr(Sender);

end;

end.
