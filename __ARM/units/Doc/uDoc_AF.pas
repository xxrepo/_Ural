unit uDoc_AF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Mask, DBCtrls, ToolEdit, RXDBCtrl,
  RxDBComb, CurrEdit, ComObj, foMyFunc, RXCtrls, Grids, DBGridEh, ComCtrls,
  ToolWin, ActnList, ImgList, Menus, RxLookup, Buttons, GridsEh;

type
  TAF = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cdsDoc: TClientDataSet;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    edRC_Name: TDBEdit;
    GroupBox2: TGroupBox;
    dsOperWare: TDataSource;
    DBGridEh1: TDBGridEh;
    ilImage: TImageList;
    ActionList1: TActionList;
    aAddWare: TAction;
    aDelWare: TAction;
    aCalcAmount: TAction;
    aClearWare: TAction;
    ToolBar3: TToolBar;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    PopupMenu1: TPopupMenu;
    miOpen: TMenuItem;
    miPrint: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    cdsDocWare: TClientDataSet;
    cdsDocWareNumb: TIntegerField;
    cdsDocWareSS: TAggregateField;
    cdsDocWareSSVATVal: TAggregateField;
    edRC_Address2: TDBEdit;
    cdsDocCurGetList: TClientDataSet;
    cdsDocCurGetListid_DocCur: TAutoIncField;
    cdsDocCurGetListDocCurName: TStringField;
    cdsDocCurGetListDocCurPartName: TStringField;
    dsDocCurGetList: TDataSource;
    Label20: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    cdsDocCurGetListDef: TIntegerField;
    cdsDocWareid_AFWare: TAutoIncField;
    cdsDocWareid_AF: TIntegerField;
    cdsDocWareWareName: TStringField;
    cdsDocWareMesName: TStringField;
    cdsDocWareAmount: TFloatField;
    cdsDocWareCountry: TStringField;
    cdsDocWareGTD: TStringField;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    edExtDocNum: TDBEdit;
    edExtDocDate: TDBDateEdit;
    Label14: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label15: TLabel;
    edBayer_INN: TDBEdit;
    Label16: TLabel;
    edBayer_KPP: TDBEdit;
    Label17: TLabel;
    Label21: TLabel;
    edBayer_Name: TDBEdit;
    edBayer_Address: TDBEdit;
    Label18: TLabel;
    DBEdit2: TDBEdit;
    cdsDocWarewoVAT: TBCDField;
    cdsDocWareVatVal: TBCDField;
    cdsDocid_AF: TAutoIncField;
    cdsDocid_Oper: TIntegerField;
    cdsDocDoc_Num: TStringField;
    cdsDocDoc_Date: TDateTimeField;
    cdsDocDoc_DateCreate: TDateTimeField;
    cdsDocid_UserCreator: TIntegerField;
    cdsDocOrgName: TStringField;
    cdsDocAddress: TStringField;
    cdsDocINN: TBCDField;
    cdsDocKPP: TBCDField;
    cdsDocSender_Name: TStringField;
    cdsDocSender_Address2: TStringField;
    cdsDocRC_Name: TStringField;
    cdsDocRC_Address2: TStringField;
    cdsDocExtDocNum: TStringField;
    cdsDocExtDocDate: TDateTimeField;
    cdsDocBayer_Name: TStringField;
    cdsDocBayer_Address: TStringField;
    cdsDocBayer_INN: TBCDField;
    cdsDocBayer_KPP: TBCDField;
    cdsDocPBUL: TStringField;
    cdsDocChif: TStringField;
    cdsDocBuh: TStringField;
    cdsDocid_DocCur: TIntegerField;
    cdsDocid_business: TIntegerField;
    cdsDocDisabled: TBooleanField;
    cdsDocDocCurPartName: TStringField;
    cdsDocDocCurName: TStringField;
    cdsDocid_DocCur_1: TAutoIncField;
    cdsDocDef: TBooleanField;
    cdsDocNumberCode: TStringField;
    cdsDocid_Doc_Org: TIntegerField;
    cbINN: TDBEdit;
    cbKPP: TDBEdit;
    cbAddress: TDBEdit;
    edSender_Name: TDBEdit;
    edSender_Address2: TDBEdit;
    cbOrgName: TDBEdit;
    BitBtn3: TBitBtn;
    cbChif: TDBEdit;
    cbBuh: TDBEdit;
    cdsDocVAT: TBCDField;
    cdsDocWareSummWare: TBCDField;
    cdsDocWarePrice: TBCDField;
    cdsDocWarePrice0: TBCDField;
    RxDBCalcEdit1: TRxDBComboBox;
    Label19: TLabel;
    cdsDocWareAmount0: TFloatField;
    cdsDocWareVAT: TBCDField;
    RxDBCalcEdit2: TRxDBCalcEdit;
    cdsDocWareMesName_calc: TStringField;
    cdsDocWareMesName_Code: TStringField;
    cdsDocWareCountry_calc: TStringField;
    cdsDocWareCountry_code: TStringField;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cdsDocWareCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1ColEnter(Sender: TObject);
    procedure dsOperWareDataChange(Sender: TObject; Field: TField);
    procedure aAddWareExecute(Sender: TObject);
    procedure aDelWareExecute(Sender: TObject);
    procedure aClearWareExecute(Sender: TObject);
    procedure aCalcAmountExecute(Sender: TObject);
    procedure miOpenClick(Sender: TObject);
    procedure miPrintClick(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1GetFooterParams(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment;
      State: TGridDrawState; var Text: String);
    procedure cdsDocVATChange(Sender: TField);
    procedure cdsDocINNGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsDocKPPGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsDocSender_Address2GetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsDocRC_Address2GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsDocBayer_AddressGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure N1Click(Sender: TObject);
  private
    aDocMask : String;
    FHandle : HWnd;
    FDocParamz : TDocParamz;
    function CheckData: boolean;
    function ConfirmChanges: boolean;
    procedure MakeExport(APrint: boolean; SPath : String);
    function GetVATCol: TColumnEh;
    procedure Doc_OrgBankGetDef(id_Doc_Org: integer);
    procedure SetVat;
    procedure OpenDoc(Sender: TObject);
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
  AF: TAF;

  procedure ShowAF(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet = nil;
                   AcdsWare : TClientDataSet = nil);
implementation

uses uDM, foMyFuncEh, {$IFNDEF LC}uUnivSelector,{$ENDIF} uInputBoxDigit, NumTools, uMeCrpt,
  uSelectorDocOrg, uDoc_DAcc;

procedure ShowAF(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
var F : TAF;
begin
  DM.Rights_GetUserRights(26, Null);
  F := TAF.Create(nil);
  try
    F.FHandle := AHandle;
    F.initialize(ADocParamz, AcdsOper, AcdsWare);
    F.ModalResult := mrNone;
  //  F.Show;
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

constructor TAF.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  LoadEhGridSettingsFromRegistry(DBGridEh1, SRegPath + '\q' + ClassName);

  aDocMask := 'AF_';
  LoadDocFiles(PopupMenu1, aDocMask, OpenDoc);
end;

procedure TAF.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

procedure TAF.initialize(ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
var Val : Variant;
    NeedOpen, VATIn : boolean;
    BIK, Bank, AccName, CorAccNAme, OKPO, Addr, INN, KPP: OleVariant;
    GTD, Country, DocNomCode, DocPriceCode, DocArt, DocNumber: OleVariant;

    id_Doc_Org, OrgName, Chif, Buh, OKPD, Address: OleVariant;
  xDate: TDateTime; xNum: String;

  xxF : TCustomForm;
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
    Params.ParamByName('@id_AF').AsInteger := FDocParamz.id_Doc;
    Open;
  end;
  with cdsDocWare do
  begin
    Close;
    Params.ParamByName('@id_AF').AsInteger := FDocParamz.id_Doc;
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
        cdsDocid_business.AsVariant := FieldByName('id_business').Value;
        cdsDocBayer_Name.AsString := FieldByName('ReprName').AsString;
        DM.rsCA.AppServer.Doc_ReprGetProp(FieldByName('id_Repr').AsInteger,
                                          BIK, Bank, AccName, CorAccNAme, OKPO, Addr, INN, KPP);
        cdsDocBayer_INN.AsVariant := INN;
        cdsDocBayer_KPP.AsVariant := KPP;

        if not FieldByName('Id_CurrencySys').IsNull then
          cdsDocid_DocCur.AsInteger := FieldByName('Id_CurrencySys').AsInteger
        else
          cdsDocid_DocCur.AsInteger := FieldByName('Id_CurrencyOper').AsInteger;

        cdsDocRC_Address2.AsVariant := Addr;
        cdsDocBayer_Address.AsVariant := Addr;
        cdsDocRC_Name.AsString := FieldByName('ReprName').AsString;

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
    cdsDocDoc_Num.AsVariant := DM.rsCA.AppServer.GetDoc_Num2(1, cdsDocid_business.Value);

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

          cdsDocWareMesName.AsVariant := FieldByName('MeasureName').Value;

          DM.rsCA.AppServer.Doc_GoodsGetProp(FieldByName('id_Goods').AsInteger, GTD, Country,
                                   DocNomCode, DocPriceCode, DocArt, DocNumber);
          cdsDocWareCountry.AsVariant := Country;
          cdsDocWareGTD.AsVariant := GTD;
          cdsDocWare.Post;

          Next;
        end;
        DM.TrimCDS(cdsDocWareAmount);
        cdsDocWare.First;
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
    Caption := 'Новый счет-фактура';
  end
  else
  begin
    Caption := 'Счет-фактура №' + cdsDocDoc_Num.AsString;
  end;
  if FDocParamz.ReadOnly then
    Caption := Caption + ', только чтение';
    
  if (FDocParamz.ID_Doc = -1) and not (FDocParamz.Copy) then
    if DM.GetDefOrg(cdsDocid_business.AsInteger, id_Doc_Org, OrgName, INN,
    KPP, Chif, Buh, OKPO, OKPD, Address) then
  begin
    cdsDoc.Edit;
    cdsDocid_Doc_Org.AsVariant := id_Doc_Org;
    cdsDocOrgName.AsVariant := OrgName;
    cdsDocAddress.AsVariant := Address;
    cdsDocINN.AsVariant := INN;
    cdsDocKPP.AsVariant := KPP;
    cdsDocChif.AsVariant := Chif;
    cdsDocBuh.AsVariant := Buh;

    cdsDocSender_Name.AsVariant := OrgName;
    cdsDocSender_Address2.AsVariant := Address;
    cdsDoc.Post;
  end;
  DM.cdsDocCurGetListOpen(cdsDocCurGetList, RxDBLookupCombo1, cdsDocid_business.Value, FDocParamz.ID_Doc,
                          cdsDocid_DocCur.AsInteger); 
//  DM.ColumnGetData(GetVATCol, cdsDocid_Doc_Org.AsInteger, FDocParamz.ID_Doc);
  DM.CDStoSL(FDocParamz.ID_Doc, RxDBCalcEdit1, 1, cdsDocid_Doc_Org.AsInteger);   


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

function TAF.GetVATCol: TColumnEh;
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

function TAF.SaveProp: boolean;
var ID_Tmp : Integer;
    RRR : V_AF;
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
    RRR.id_Oper := fieldByName('id_Oper').AsInteger;
    RRR.Doc_Date := fieldByName('Doc_Date').Value;
    RRR.Doc_Num := fieldByName('Doc_Num').AsString;
    RRR.id_UserCreator := fieldByName('id_UserCreator').AsInteger;
    RRR.OrgName := fieldByName('OrgName').AsString;
    RRR.Address := fieldByName('Address').AsString;
    RRR.INN := fieldByName('INN').Value;
    RRR.KPP := fieldByName('KPP').Value;
    RRR.Sender_Name := fieldByName('Sender_Name').AsString;
    RRR.Sender_Address2 := fieldByName('Sender_Address2').AsString;
    RRR.RC_Name := fieldByName('RC_Name').AsString;
    RRR.RC_Address2 := fieldByName('RC_Address2').AsString;
    RRR.ExtDocDate := fieldByName('ExtDocDate').Value;
    RRR.ExtDocNum := fieldByName('ExtDocNum').AsString;
    RRR.Bayer_Name := fieldByName('Bayer_Name').AsString;
    RRR.Bayer_Address := fieldByName('Bayer_Address').AsString;
    RRR.Bayer_INN := fieldByName('Bayer_INN').Value;
    RRR.Bayer_KPP := fieldByName('Bayer_KPP').Value;
    RRR.PBUL := fieldByName('PBUL').AsString;
    RRR.Chif := fieldByName('Chif').AsString;
    RRR.Buh := fieldByName('Buh').AsString;
    RRR.VAT := fieldByName('VAT').Value;
    id_Doc_Org := fieldByName('id_Doc_Org').AsInteger;

  end;
  V := PackRecV_AF(RRR);
  BeginTruns(DM.rsCA);
  try
    ID_Tmp := DM.rsCA.AppServer.Doc_AFEdit(FDocParamz.ID_Doc, V, id_Doc_Org);

    if ID_Tmp = -1 then
      raise Exception.Create('Ошибка при сохранении свойств');
    if FDocParamz.ID_Doc = -1 then
      FDocParamz.ID_Doc := ID_Tmp;
    if not CDSApplyUpdates(cdsDocWare, 'id_AF', FDocParamz.ID_Doc, true) then
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

procedure TAF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if ModalResult = mrOk then
    if SaveProp then
      SendMessage(FHandle, xxx_RefrMsg, FDocParamz.ID_Doc, 0);
end;

procedure TAF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (cdsDoc.State = dsEdit) then cdsDoc.Post;
end;

destructor TAF.Destroy;
begin
  SaveEhGridSettingsToRegistry(DBGridEh1, SRegPath + '\q' + ClassName);
  inherited;
  BringWindowToTop(FPrntW);
end;


procedure TAF.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TAF.btnOkClick(Sender: TObject);
begin
  if not ConfirmChanges then
    ModalResult := mrNone
  else
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

function TAF.ConfirmChanges: boolean;
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

function TAF.CheckData: boolean;
begin
  Result := false;
 // xxx(DBEdit1);
  CheckEmptyControl(Handle, DBDateEdit1);
  CheckEmptyControl(Handle, RxDBLookupCombo1);

  CheckEmptyControl(Handle, cbOrgName);
  CheckEmptyControl(Handle, edSender_Name);
  CheckEmptyControl(Handle, edRC_Name);
  CheckEmptyControl(Handle, edBayer_Name);
  with cdsDocWare do
    if IsEmpty then
    begin
      MessageBox(Handle, 'Не выбраны товары', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(DBGridEh1.Handle);
      Exit;
    end;

  Result := true;
end;

procedure TAF.cdsDocWareCalcFields(DataSet: TDataSet);
begin
  cdsDocWare.OnCalcFields := nil;
  try
    DataSet.FieldByName('MesName_calc').AsString := DM.GetLeftText(DataSet.FieldByName('MesName').AsString);
    DataSet.FieldByName('MesName_code').AsString := DM.GetRightText(DataSet.FieldByName('MesName').AsString);
    DataSet.FieldByName('Country_calc').AsString := DM.GetWord(1, DataSet.FieldByName('Country').AsString); // DM.GetLeftText(DataSet.FieldByName('Country').AsString);
    DataSet.FieldByName('Country_code').AsString := DM.GetWord(2, DataSet.FieldByName('Country').AsString); // DM.GetRightText(DataSet.FieldByName('Country').AsString);

    DataSet.FieldByName('Numb').AsInteger := DataSet.RecNo;
    if (cdsDocWarePrice0.AsVariant <> cdsDocWarePrice.AsVariant)
    and (not cdsDocWarePrice.IsNull) and (not cdsDocWarePrice0.IsNull) then
    begin
      cdsDocWareSummWare.Value := cdsDocWareAmount.Value * cdsDocWarePrice.Value * (1 + cdsDocVAT.Value / 100);
    end;
    if (cdsDocWareAmount0.AsVariant <> cdsDocWareAmount.AsVariant)
    and (not cdsDocWareAmount.IsNull) and (not cdsDocWareAmount0.IsNull) then
    begin
      cdsDocWareSummWare.Value := cdsDocWareSummWare.Value/cdsDocWareAmount0.Value * cdsDocWareAmount.Value {* (1 + cdsDocVAT.Value / 100)};
    end; 

    cdsDocWareVATVal.Value := cdsDocWareSummWare.Value * cdsDocVAT.Value / (100 + cdsDocVAT.Value);
    cdsDocWarewoVAT.Value := cdsDocWareSummWare.Value - cdsDocWareVATVal.Value;

    if cdsDocWareAmount.Value <> 0 then
      cdsDocWarePrice.Value := cdsDocWarewoVAT.Value/cdsDocWareAmount.Value;

    cdsDocWarePrice0.AsVariant := cdsDocWarePrice.AsVariant;
    cdsDocWareAmount0.AsVariant := cdsDocWareAmount.AsVariant;
  finally
    cdsDocWare.OnCalcFields := cdsDocWareCalcFields;
  end;
end;

procedure TAF.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\26' + ClassName);
end;

procedure TAF.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\26' + ClassName);
end;

procedure TAF.DBGridEh1ColEnter(Sender: TObject);
var ACol : TColumnEh;
begin
  ACol := DBGridEh1.Columns[DBGridEh1.col - 1];
  aCalcAmount.Enabled := not DBGridEh1.DataSource.DataSet.IsEmpty and
                         (ACol.Field is TNumericField)
                         and not ACol.ReadOnly;
end;

procedure TAF.dsOperWareDataChange(Sender: TObject; Field: TField);
begin
  with (Sender as TDataSource).DataSet do
  begin
    aClearWare.Enabled := not IsEmpty;
    aDelWare.Enabled := not IsEmpty;
//    aCalcAmount.Enabled := not IsEmpty;
  end;
end;

procedure TAF.aAddWareExecute(Sender: TObject);
var ASelectedObj : TSelectedObj;
    AID, AName : OleVariant;
    EObjTypes : TEObjTypes;
begin
{$IFNDEF LC}
  if cdsDocid_business.AsVariant = Null then Exit;
  Screen.Cursor := crSQLWait;
  EObjTypes := [eotGoods];
  with cdsDocWare do
  begin
    if SelectObjUnBsn(Owner, cdsDocid_business.AsInteger, ASelectedObj, 0, EObjTypes, true) then
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
  end; {$ENDIF}
end;

procedure TAF.aDelWareExecute(Sender: TObject);
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

procedure TAF.aClearWareExecute(Sender: TObject);
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

procedure TAF.aCalcAmountExecute(Sender: TObject);
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

procedure TAF.miOpenClick(Sender: TObject);
begin
  MakeExport(false, ExtractFilePath(Application.EXEName) + 'docs_templ\AF.xlt');
end;

procedure TAF.miPrintClick(Sender: TObject);
begin
  MakeExport(true, ExtractFilePath(Application.EXEName) + 'docs_templ\AF.xlt');
end;

procedure TAF.MakeExport(APrint : boolean; SPath : String);
  function ConvName(AName : String) : String;
  begin
    if pos('ООО', AName) > -1 then
    begin
      Result := StringReplace(AName, 'ООО', 'Общество с ограниченной ответственностью', [rfReplaceAll, rfIgnoreCase])  + ' (' + AName + ')';
    end
    else
      Result := AName;
  end;
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
      try
          Workbook := ExcelApp.WorkBooks.Add(SPath);
      except
        on E : Exception do
        begin
         ShowMessage('Ошибка при открытии файла ' + SPath + #13 + #10 + E.Message);
         raise Exception.Create(E.Message);
        end;
      end;
      Sheet := ExcelApp.Workbooks[1].WorkSheets[1];

   //   Cell1 := Sheet.Cells[1, 1];
   //   Cell2 := Sheet.Cells[100, 20];
    //  Range := Sheet.Range[Cell1, Cell2];
      Range := Sheet.Cells;

      SetExcelBMVal(Range, '^Doc_NumAdv', 'Счет-фактура №' + cdsDocDoc_Num.AsString +
                           ' от ' + FormatDateTimeNull('dd mmmm yyyy г.', cdsDocDoc_Date.AsDateTime));
      SetExcelBMVal(Range, '^OrgNameAdv', 'Продавец: ' + ConvName(cdsDocOrgName.AsString));
      SetExcelBMVal(Range, '^AddressAdv', 'Адрес: ' + cdsDocAddress.AsString);
      SetExcelBMVal(Range, '^INNAdv', 'ИНН/КПП продавца: ' + cdsDocINN.DisplayText + '/' + cdsDocKPP.DisplayText);

      SetExcelBMVal(Range, '^SenderAdv', 'Грузоотправитель и его адрес: ' + cdsDocSender_Name.AsString + '/' + cdsDocSender_Address2.DisplayText);
      SetExcelBMVal(Range, '^RCAdv', 'Грузополучатель и его адрес: ' + cdsDocRC_Name.AsString + '/' + cdsDocRC_Address2.DisplayText);
      SetExcelBMVal(Range, '^DocAdv', 'К платежно-расчетному документу № ' + cdsDocExtDocNum.AsString + '/' + FormatDateTimeNull('dd mmmm yyyy г.', cdsDocExtDocDate.AsDateTime));

      SetExcelBMVal(Range, '^BayerAdv', 'Покупатель: ' + cdsDocBayer_Name.AsString);
      SetExcelBMVal(Range, '^BayerAddressAdv', 'Адрес: ' + cdsDocBayer_Address.DisplayText);
      SetExcelBMVal(Range, '^BayerINNAdv', 'ИНН/КПП покупателя: ' + cdsDocBayer_INN.DisplayText + '/' + cdsDocBayer_KPP.DisplayText);

      SSS := StrToFloatAdv(cdsDocWareSSVATVal.AsString);
      SetExcelBMVal(Range, '^VATValTT', FormatFloat('0.00', SSS));
      SetExcelBMVal(Range, '^woVATTT', cdsDocWareSS.Value - cdsDocWareSS.Value*cdsDocVAT.Value / (100 + cdsDocVAT.Value));

      SSS := StrToFloatAdv(cdsDocWareSS.AsString);
      SetExcelBMVal(Range, '^SummOper2TT', FormatFloat('0.00', SSS));

      SetExcelBMVal(Range, '^DocCurNameAdv', 'Валюта: ' + cdsDocCurGetListDocCurName.AsString);

      SSS := StrToFloatAdv(cdsDocWareSS.AsString);
      SSS := SSS*cdsDocVAT.Value;
      SSS := SSS/(100 + cdsDocVAT.Value);
      SetExcelBMVal(Range, '^TotalVAT', SSS);
 

      CDSToExcel(cdsDoc, Range);
      CDSToExcelTable(cdsDocWare, Range, '^WareName', true)
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


procedure TAF.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
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

procedure TAF.BitBtn3Click(Sender: TObject);
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
    cdsDocINN.AsVariant := INN;
    cdsDocKPP.AsVariant := KPP;
    cdsDocChif.AsVariant := Chif;
    cdsDocBuh.AsVariant := Buh;

    cdsDocSender_Name.AsVariant := OrgName;
    cdsDocSender_Address2.AsVariant := Address;
    cdsDoc.Post;
 //   Doc_OrgBankGetDef(id_Doc_Org);
    DM.CDStoSL(FDocParamz.ID_Doc, RxDBCalcEdit1, 1, cdsDocid_Doc_Org.AsInteger);   
  end;
end;

procedure TAF.Doc_OrgBankGetDef(id_Doc_Org : integer);
var Bank, BIK, Acc, CorrAcc: String;
begin
 { if DM.rsCA.AppServer.Doc_OrgBankGetDef(id_Doc_Org, Bank, BIK, Acc, CorrAcc) = 1 then
  begin
    cdsDoc.Edit;
    cdsDocBank.Value := AName;
    cdsDoc.Post;
  end;  }
end;


procedure TAF.BitBtn1Click(Sender: TObject);
var id_Doc_Org, OrgName, INN,
  KPP, Chif, Buh, OKPO, OKPD, Address : Variant;
begin
  id_Doc_Org := cdsDocid_Doc_Org.Value;
  if ShowSelectorDocOrg(cdsDocid_business.AsInteger, id_Doc_Org, OrgName, INN,
  KPP, Chif, Buh, OKPO, OKPD, Address) then
  begin
    cdsDoc.Edit;
    cdsDocOrgName.AsVariant := OrgName;
    cdsDocAddress.AsVariant := Address;
    cdsDocINN.AsVariant := INN;
    cdsDocKPP.AsVariant := KPP;
    cdsDocChif.AsVariant := Chif;
    cdsDocBuh.AsVariant := Buh;
    cdsDoc.Post;
 //   Doc_OrgBankGetDef(id_Doc_Org);
  end;
end;

procedure TAF.DBGridEh1GetFooterParams(Sender: TObject; DataCol,
  Row: Integer; Column: TColumnEh; AFont: TFont; var Background: TColor;
  var Alignment: TAlignment; State: TGridDrawState; var Text: String);
begin
  if cdsDocWareSS.Value <> Null then
  begin
    if Column.Field = cdsDocWareSummWare then
      Text := FormatFloat('0.00', cdsDocWareSS.Value)
    else
      if Column.Field = cdsDocWareVATVal then
        Text := FormatFloat('0.00', cdsDocWareSS.Value* cdsDocVAT.Value / (100 + cdsDocVAT.Value))
      else
        if (Column.Field = cdsDocWarewoVAT) then
          Text := FormatFloat('0.00', cdsDocWareSS.Value - cdsDocWareSS.Value*cdsDocVAT.Value / (100 + cdsDocVAT.Value))
      ;
  end;
end;

procedure TAF.SetVat;
var OldRecNo : integer;
begin
  with cdsDocWare do
  begin
    DisableControls;
    OldRecNo := RecNo;
    try
      First;
      while not Eof do
      begin
        Edit;
        cdsDocWareVAT.Value := cdsDocVAT.Value;
        Post;
        Next;
      end;
      First;
    finally
      RecNo := OldRecNo;
      EnableControls;
    end;
  end;
end;


procedure TAF.cdsDocVATChange(Sender: TField);
begin
  SetVat;
end;

procedure TAF.cdsDocINNGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := DM.acsINN(Sender);
end;

procedure TAF.cdsDocKPPGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := DM.acsKPP(Sender);

end;

procedure TAF.cdsDocSender_Address2GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := DM.acsAdr(Sender);

end;

procedure TAF.cdsDocRC_Address2GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := DM.acsAdr(Sender);

end;

procedure TAF.cdsDocBayer_AddressGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := DM.acsAdr(Sender);

end;

procedure TAF.N1Click(Sender: TObject);
begin
  MakeExport(false, ExtractFilePath(Application.EXEName) + 'docs_templ\AF_old.xlt');

end;

procedure TAF.OpenDoc(Sender: TObject);
begin
  MakeExport(false, ExtractFilePath(Application.EXEName) + 'docs_templ\' + aDocMask + StringReplace((Sender as TMenuItem).Caption, '&', '', [rfReplaceAll, rfIgnoreCase]) + '.xlt');
end;

end.
