unit uDoc_PayIn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Mask, DBCtrls, ToolEdit, RXDBCtrl,
  RxDBComb, CurrEdit, ComObj, foMyFunc, RXCtrls, Menus, RxLookup, Buttons;

type
  TPayIn = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cdsDoc: TClientDataSet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label11: TLabel;
    RxDBCalcEdit2: TRxDBCalcEdit;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    cdsDocCurGetList: TClientDataSet;
    cdsDocCurGetListid_DocCur: TAutoIncField;
    cdsDocCurGetListDocCurName: TStringField;
    cdsDocCurGetListDocCurPartName: TStringField;
    dsDocCurGetList: TDataSource;
    Label20: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    cdsDocCurGetListDef: TIntegerField;
    RxDBCalcEdit1: TRxDBComboBox;
    cbOrgName: TDBEdit;
    BitBtn3: TBitBtn;
    cbOKPO: TDBEdit;
    cbBuh: TDBEdit;
    cbCasser: TRxDBComboBox;
    cdsDocid_Pay_In: TAutoIncField;
    cdsDocid_Oper: TIntegerField;
    cdsDocDoc_Num: TStringField;
    cdsDocDoc_Date: TDateTimeField;
    cdsDocOKPO: TStringField;
    cdsDocSumm: TBCDField;
    cdsDocVAT: TBCDField;
    cdsDocBasePM: TStringField;
    cdsDocPayer: TStringField;
    cdsDocBuh: TStringField;
    cdsDocCasser: TStringField;
    cdsDocDoc_DateCreate: TDateTimeField;
    cdsDocid_UserCreator: TIntegerField;
    cdsDocOrgName: TStringField;
    cdsDocExtInfo: TStringField;
    cdsDocid_DocCur: TIntegerField;
    cdsDocid_business: TIntegerField;
    cdsDocDisabled: TBooleanField;
    cdsDocDocCurPartName: TStringField;
    cdsDocDocCurName: TStringField;
    cdsDocid_DocCur_1: TAutoIncField;
    cdsDocDef: TBooleanField;
    cdsDocNumberCode: TStringField;
    cdsDocid_Doc_Org: TIntegerField;
    cdsDocwoVAT: TBCDField;
    cdsDocVatVal: TBCDField;
    procedure cdsDocCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    FHandle : HWnd;
    FDocParamz : TDocParamz;
    procedure MakeExport(APrint : boolean);
    function CheckData: boolean;
    function ConfirmChanges: boolean;
  public
    FPrntW : HWnd;
    destructor Destroy; override;
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    function SaveProp: boolean;
    procedure initialize(ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);

  end;

var
  PayIn: TPayIn;

  procedure ShowPayIn(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
implementation

uses uDM, NumTools, uSelectorDocOrg;

procedure ShowPayIn(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
var F : TPayIn;
begin
  DM.Rights_GetUserRights(26, Null);
  F := TPayIn.Create(nil);
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

procedure TPayIn.cdsDocCalcFields(DataSet: TDataSet);
begin
  with DataSet do
    FieldByName('VATVal').AsFloat := FieldByName('Summ').AsFloat/(100 + FieldByName('VAT').AsFloat) * FieldByName('VAT').AsFloat;
end;

constructor TPayIn.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TPayIn.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

procedure TPayIn.initialize(ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
var NeedOpen, VATIn : boolean;
    id_Doc_Org, OrgName, INN,
  KPP, Chif, Buh, OKPO, OKPD, Address: OleVariant;
  AField : TField;
  OperVid : integer;

  xDate: TDateTime; xNum: String;
begin
  FPrntW := GetControlFormHHH(AcdsOper);
  VATIn := true;
  btnOk.Enabled := (ADocParamz.ID_Oper > 0) or (ADocParamz.id_Doc > 0);
  NeedOpen := AcdsOper = nil;
  if AcdsOper = nil then
  begin
    AcdsOper := DM.cdsOperFin;
  end;
  FDocParamz := ADocParamz;

  with cdsDoc do
  begin
    Close;
    Params.ParamByName('@id_Pay_In').AsInteger := FDocParamz.id_Doc;
    Open;
  end;

  if FDocParamz.id_Doc = -1 then
  begin
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

        cdsDoc.Edit;
        VATIn := FieldByName('VATIn').AsBoolean;
        cdsDocid_Oper.Value := FDocParamz.id_Oper;
        cdsDocid_business.Value := FieldByName('id_business').AsInteger;
        cdsDocid_UserCreator.AsInteger := DM.IDUser;
        cdsDocDoc_Num.AsVariant := DM.rsCA.AppServer.GetDoc_Num2(5, cdsDocid_business.Value);

        cdsDocid_Oper.AsInteger := FDocParamz.id_Oper;
        cdsDocDoc_Date.AsDateTime := date;

        if not FieldByName('Id_CurrencySys').IsNull then
          cdsDocid_DocCur.AsInteger := FieldByName('Id_CurrencySys').AsInteger
        else
          cdsDocid_DocCur.AsInteger := FieldByName('Id_CurrencyOper').AsInteger;
        cdsDocPayer.AsString := FieldByName('ReprName').AsString;

        OperVid := FieldByName('OperVid').AsInteger;
        if OperVid in [1, 201] then
        begin
          if AcdsWare = nil then
          begin
            AcdsWare := DM.cdsOperWare;
           { if OperVid = 1 then
              AcdsWare := DM.cdsOperWare
            else
              AcdsWare := DM.cdsOperWare201;}
          end;
          if NeedOpen then
          begin
            AcdsWare.Close;
            AcdsWare.Params.ParamByName('@id_Oper').AsInteger := FDocParamz.id_Oper;
            AcdsWare.Open;
          end;
          if FieldByName('Id_CurrencySys').IsNull then
            AField := AcdsWare.FieldByName('SummOper2')
          else
            AField := FieldByName('SummSys');

          AcdsWare.First;
          cdsDocSumm.AsFloat := 0;
          while not AcdsWare.Eof do
          begin
            if not VATIn then
              cdsDocSumm.AsFloat := cdsDocSumm.AsFloat + AField.AsFloat * (1 + cdsDocVAT.Value/100)
            else
              cdsDocSumm.AsFloat := cdsDocSumm.AsFloat + AField.AsFloat;

            AcdsWare.Next;
          end;
        end
        else
        begin
          if FieldByName('Id_CurrencySys').IsNull then
            cdsDocSumm.AsFloat := FieldByName('PriceOper').AsFloat
          else
            cdsDocSumm.AsFloat := FieldByName('SummSys').AsFloat;
        end;

        if DM.PIN then
        begin
          cdsDocBasePM.AsString := 'реализация товара (выручка)';
          cdsDocExtInfo.AsString := 'чек № от';
        end;
        if DM.GetDocNum(cdsDocid_Oper.AsInteger, cdsDocid_business.AsInteger, xDate, xNum) then
        begin
          cdsDocDoc_Num.AsString := xNum;
          cdsDocDoc_Date.AsDateTime := xDate;
        end;
        cdsDoc.Post;
      finally
        if NeedOpen then
        begin
          Close;
          if AcdsWare <> nil then
            AcdsWare.Close;
        end;
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
    FDocParamz.ID_Doc := -1;
  if (FDocParamz.ID_Doc = -1) then
  begin
    Caption := 'Новый приходный кассовый ордер';
  end
  else
  begin
    Caption := 'Приходного кассового ордер №' + cdsDocDoc_Num.AsString;
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
    cdsDocBuh.AsVariant := Buh;
    cdsDoc.Post;
  end;
  DM.cdsDocCurGetListOpen(cdsDocCurGetList, RxDBLookupCombo1, cdsDocid_business.Value, FDocParamz.ID_Doc,
                          cdsDocid_DocCur.AsInteger);

  DM.CDStoSL(FDocParamz.ID_Doc, RxDBCalcEdit1, 1, cdsDocid_Doc_Org.AsInteger);
  DM.CDStoSL(FDocParamz.ID_Doc, cbCasser, 2, cdsDocid_Doc_Org.AsInteger);

  if not VATIn then
  begin
    with cdsDoc do
    begin
      Edit;
      cdsDocSumm.Value := cdsDocSumm.Value * (1 + cdsDocVAT.Value/100);
      Post;
    end;
  end;
end;

function TPayIn.SaveProp: boolean;
var ID_Tmp, id_Oper: Integer;
    Doc_Num, Doc_Date, OKPO, Summ, VAT, BasePM, Payer, Buh, Casser, id_UserCreator,
    OrgName, ExtInfo: OleVariant;
    id_DocCur, id_Doc_Org : integer;
    OldCursor : TCursor;
begin
  if FDocParamz.ReadOnly or (cdsDoc.ChangeCount = 0) then Exit;
  ID_Tmp := FDocParamz.ID_Doc;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  with cdsDoc do
  begin
    id_DocCur := fieldByName('id_DocCur').AsInteger;
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
    ExtInfo := fieldByName('ExtInfo').Value;
    id_Doc_Org := fieldByName('id_Doc_Org').AsInteger;
  end;

  BeginTruns(DM.rsCA);
  try
    ID_Tmp := DM.rsCA.AppServer.Doc_Pay_InEdit(FDocParamz.ID_Doc, id_Oper, Doc_Num, Doc_Date, OKPO, Summ,
                                                 VAT, BasePM, Payer, Buh, Casser, id_UserCreator, OrgName, ExtInfo, id_DocCur, id_Doc_Org);

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
  if (Key = #13) and (cdsDoc.State = dsEdit) then cdsDoc.Post;
end;

procedure TPayIn.MakeExport(APrint : boolean);
var
  ExcelApp, DataValues, Workbook, Column, Sheet, Cell1, Cell2, Range, V : Variant;
  i : integer;
  SSS : Extended;
  S, S1, S2 : String;
begin
  CheckExcel;
  if cdsDoc.State in [dsEdit, dsInsert] then
  begin
    cdsDocDocCurName.AsString := cdsDocCurGetListDocCurName.AsString;
    cdsDocDocCurPartName.AsString := cdsDocCurGetListDocCurPartName.AsString;
    cdsDoc.Post;
  end;
  windows.SetFocus(DBDateEdit1.Handle);
  try
    SSS := cdsDocSumm.AsFloat;
      S1 := NumeralToPhraseAdv(SSS);

    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.visible := true;
    ExcelApp.Application.EnableEvents := false;
    ExcelApp.ScreenUpdating:= false;
    Screen.Cursor := crSQLWait;
    try
      try Workbook := ExcelApp.WorkBooks.Add(ExtractFilePath(Application.EXEName) + 'docs_templ\PayIn.xlt');
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

//ShowMessage('1');
      SetExcelBMVal(Range, '^Doc_DateAdv2', FormatDateTimeNull('dd mmmm yyyy г.', cdsDocDoc_Date.AsDateTime));
//ShowMessage('2');

      SetExcelBMVal(Range, '^Doc_NumAdv2', 'К приходному кассовому ордеру' + #10 +
                                           '№' + cdsDocDoc_Num.AsString + ' от ' + FormatDateTimeNull('dd mmmm yyyy г.', cdsDocDoc_Date.AsDateTime));

//ShowMessage('3');
      S := 'Принято от ' + cdsDocPayer.AsString + #10 +
                                    'Основание: ' + cdsDocBasePM.AsString;
 //     if DM.PIN then
   //     S := S + 'реализация товара (выручка)';
                                    S := S + #10 +
                                    'сумма: ' + S1;
      if cdsDocVAT.AsFloat <> 0 then
      begin
        SSS := cdsDocVATVal.AsFloat;
        S2 := (IntToStr(Trunc(SSS))) + ' ' + cdsDocCurGetListDocCurName.AsString + '. ' + FormatFloat('00 ' + cdsDocCurGetListDocCurPartName.AsString + '.', Frac(SSS) * 100);
        S := S + #10 + 'в том числе НДС: ' + S2;
      end;
      S := S + #10 + 'Приложение:' + cdsDocExtInfo.AsString;
   //   if DM.PIN then
     //   S := S + ' чек № от ';
      SetExcelBMVal(Range, '^From', S);
//ShowMessage('4');
      SSS := cdsDocSumm.AsFloat;
      S := 'Принято от ' + cdsDocPayer.AsString + #10 +
                                    'Основание: ' + cdsDocBasePM.AsString + #10 +
                                    'сумма: ' + (IntToStr(Trunc(SSS))) + ' ' + cdsDocCurGetListDocCurName.AsString + '. ' + FormatFloat(' 00 ' + cdsDocCurGetListDocCurPartName.AsString + '.', Frac(SSS) * 100) +
                                    ' ' + S1 + #10;
      if cdsDocVAT.AsFloat <> 0 then
      begin
        SSS := cdsDocVATVal.AsFloat;
        S2 := (IntToStr(Trunc(SSS))) + ' ' + cdsDocCurGetListDocCurName.AsString + '. ' + FormatFloat('00 ' + cdsDocCurGetListDocCurPartName.AsString + '.', Frac(SSS) * 100);
        S := S + 'в том числе НДС: ' + S2 + #10;
      end;
      SetExcelBMVal(Range, '^From2', S);

      CDSToExcel(cdsDoc, Range);
    finally
{$IFDEF LC}
 // Workbook.ReadOnly := true;
{$ENDIF}
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
   {   try
        Workbook.Close(false);
      except end;
      ExcelApp.Quit;
      ExcelApp := Null;  }
      raise Exception.Create(E.Message);
    end;
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
  CDS.Post;
end;

function TPayIn.CheckData: boolean;
begin
  Result := false;
  CheckEmptyControl(Handle, cbOrgName);
//  CheckEmptyControl(Handle,DBEdit1);
  CheckEmptyControl(Handle,DBDateEdit1);
//  CheckEmptyControl(Handle,cbOKPO);
  CheckEmptyControl(Handle,RxDBCalcEdit2);
  CheckEmptyControl(Handle,RxDBLookupCombo1);
  CheckEmptyControl(Handle,RxDBCalcEdit1);
//  CheckEmptyControl(Handle,DBEdit7);
  CheckEmptyControl(Handle,DBEdit8);
  CheckEmptyControl(Handle,cbBuh);
  CheckEmptyControl(Handle,cbCasser);
  Result := true;
end;

procedure TPayIn.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TPayIn.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TPayIn.N1Click(Sender: TObject);
begin
  MakeExport(false);
end;

procedure TPayIn.N2Click(Sender: TObject);
begin
  MakeExport(true);
end;

procedure TPayIn.BitBtn3Click(Sender: TObject);
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
    cdsDocOKPO.AsVariant := OKPO;
    cdsDocBuh.AsVariant := Buh;

    cdsDoc.Post;
    DM.CDStoSL(FDocParamz.ID_Doc, RxDBCalcEdit1, 1, cdsDocid_Doc_Org.AsInteger);
    DM.CDStoSL(FDocParamz.ID_Doc, cbCasser, 2, cdsDocid_Doc_Org.AsInteger);
  end;
end;

destructor TPayIn.Destroy;
begin
  inherited;
  BringWindowToTop(FPrntW);

end;

end.
