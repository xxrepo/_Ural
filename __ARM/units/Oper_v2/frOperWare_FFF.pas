unit frOperWare_FFF;

interface

uses 
  Windows, ImgList, Controls, DBSumLst, Db, DBClient, frExtDataVal,
  StdCtrls, Grids, DBGridEh, DBCtrls, RxLookup, frCurSelector, Buttons,
  Mask, ExtCtrls, Forms, frOperOldData, ComCtrls, Classes, graphics, Sysutils,
  ActnList, ToolWin, RXCtrls, foMyFunc, Menus, GridsEh;

type
  TCustomGridxxx = class(TDBGridEh)
  end;
  TfOperWare_FFF = class(TFrame)
    cdsOperFin: TClientDataSet;
    dsOperFin: TDataSource;
    PageControl1: TPageControl;
    tsData: TTabSheet;
    tsComment: TTabSheet;
    P1: TPanel;
    lbReprName: TLabel;
    Label3: TLabel;
    edReprName: TDBEdit;
    BitBtn4: TBitBtn;
    cbOperTypeIn: TComboBox;
    Label9: TLabel;
    P4: TPanel;
    cdsFormal: TClientDataSet;
    cdsFormalid_FormalDistrib: TAutoIncField;
    cdsFormalName: TStringField;
    dsFormal: TDataSource;
    dsFunc: TDataSource;
    cdsFunc: TClientDataSet;
    cdsFuncid_FuncDistrib: TAutoIncField;
    cdsFuncName: TStringField;
    TabSheet1: TTabSheet;
    fOperOldData1: TfOperOldData;
    Label19: TLabel;
    DBEdit12: TDBEdit;
    Label6: TLabel;
    DBEdit13: TDBEdit;
    DBEdit8: TDBEdit;
    GroupBox4: TGroupBox;
    DBMemo1: TDBMemo;
    gbWare: TGroupBox;
    fCurSelector1: TfCurSelector;
    cdsOperWare: TClientDataSet;
    dsOperWare: TDataSource;
    cdsOperWareid_OperWare: TAutoIncField;
    cdsOperWareid_Oper: TIntegerField;
    cdsOperWareid_Measure: TIntegerField;
    cdsOperWareid_Goods: TIntegerField;
    cdsOperWareMeasureName: TStringField;
    cdsOperWareRealKoef: TFloatField;
    cdsOperWareAmountOperBaseMS: TFloatField;
    cdsOperWareWareName: TStringField;
    cdsOperWareWareID_Main: TIntegerField;
    cdsOperWareSummOper2: TFloatField;
    cdsOperWareNumb: TIntegerField;
    DBGridEh1: TDBGridEh;
    ActionList1: TActionList;
    aAddWare: TAction;
    aDelWare: TAction;
    aCalcSys: TAction;
    aSumm: TAction;
    ToolBar3: TToolBar;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    Panel7: TPanel;
    Label4: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit10: TDBEdit;
    cdsOperWareAmountOper: TFloatField;
    cdsOperWarePriceOper: TFloatField;
    cdsOperWareSummSys: TFloatField;
    cdsOperWarePriceInv: TFloatField;
    cdsOperFinid_Oper: TIntegerField;
    cdsOperFinid_OperParent: TIntegerField;
    cdsOperFinid_Replicator: TIntegerField;
    cdsOperFinid_old_Oper: TIntegerField;
    cdsOperFinDateCreate: TDateTimeField;
    cdsOperFinid_LC_Oper: TIntegerField;
    cdsOperFinOperVid: TIntegerField;
    cdsOperFinid_UserCreator: TIntegerField;
    cdsOperFinCreatorFIO: TStringField;
    cdsOperFinid_business: TIntegerField;
    cdsOperFinId_CurrencyBsn: TIntegerField;
    cdsOperFinBusinessName: TStringField;
    cdsOperFinBusinessNum: TStringField;
    cdsOperFinDateLocal: TDateTimeField;
    cdsOperFinCorrect: TBooleanField;
    cdsOperFinOperTypeIn: TBooleanField;
    cdsOperFinId_CurrencyOper: TIntegerField;
    cdsOperFinCurrencyOperName: TStringField;
    cdsOperFinCurrencyOperShortName: TStringField;
    cdsOperFinPriceOper: TFloatField;
    cdsOperFinRateOper: TFloatField;
    cdsOperFinId_CurrencySys: TIntegerField;
    cdsOperFinCurrencySysName: TStringField;
    cdsOperFinCurrencySysShortName: TStringField;
    cdsOperFinSummSys: TFloatField;
    cdsOperFinRateSys: TFloatField;
    cdsOperFinid_Acc: TIntegerField;
    cdsOperFinid_Warehouse: TIntegerField;
    cdsOperFinid_Manufact: TIntegerField;
    cdsOperFinSrcName: TStringField;
    cdsOperFinSrcID_Main: TIntegerField;
    cdsOperFinid_Repr: TIntegerField;
    cdsOperFinid_Acc_Ext: TIntegerField;
    cdsOperFinid_Warehouse_Ext: TIntegerField;
    cdsOperFinid_Manufact_Ext: TIntegerField;
    cdsOperFinReprName: TStringField;
    cdsOperFinReprID_Main: TIntegerField;
    cdsOperFinId_CurrencyInv: TIntegerField;
    cdsOperFinRateInv: TFloatField;
    cdsOperFinCurrencyInvName: TStringField;
    cdsOperFinCurrencyInvShortName: TStringField;
    cdsOperFinKoeff: TIntegerField;
    cdsOperFinKoeffName: TStringField;
    cdsOperFinCheckDate: TDateTimeField;
    cdsOperFinCheckerFIO: TStringField;
    cdsOperFinid_FormalDistrib: TIntegerField;
    cdsOperFinFormalDistribName: TStringField;
    cdsOperFinid_FuncDistrib: TIntegerField;
    cdsOperFinFuncDistribName: TStringField;
    cdsOperFinDeleted: TBooleanField;
    cdsOperFinid_ContrAgent: TIntegerField;
    cdsOperFinContrAgentName: TStringField;
    cdsOperFinid_CAGroup: TIntegerField;
    cdsOperFinSummOper: TFloatField;
    cdsOperFinTypeName: TStringField;
    cdsOperFinHasViza: TBooleanField;
    cdsOperFinOperState: TIntegerField;
    cdsOperFinHidedOper: TBooleanField;
    cdsOperFinRateMain: TFloatField;
    cdsOperFinid_Repr_Ex: TIntegerField;
    cdsOperFinid_DocType: TIntegerField;
    cdsOperFinImp_PayBasic: TStringField;
    cdsOperFinAccInv_PayAssignment: TStringField;
    cdsOperFinContract: TStringField;
    cdsOperFinOperCrnName: TStringField;
    cdsOperFinBlocked: TBooleanField;
    cdsOperFinCurrencyBsnName: TStringField;
    cdsOperFinOpComment: TStringField;
    cdsOperFinRealDataCreate: TDateTimeField;
    cdsOperFinOperTypeSIGN: TIntegerField;
    cdsOperFinHasChild: TIntegerField;
    cdsOperFinDig1: TFloatField;
    cdsOperFinDig2: TFloatField;
    cdsOperFinDig3: TFloatField;
    cdsOperFinDig4: TFloatField;
    cdsOperFinDig5: TFloatField;
    cdsOperFinDig6: TFloatField;
    cdsOperFinDig7: TFloatField;
    cdsOperFinDig8: TFloatField;
    cdsOperFinDig9: TFloatField;
    cdsOperFinDig10: TFloatField;
    cdsOperFinDig11: TFloatField;
    cdsOperFinDig12: TFloatField;
    cdsOperFinDig13: TFloatField;
    cdsOperFinDig14: TFloatField;
    cdsOperFinDig15: TFloatField;
    cdsOperFinStr1: TStringField;
    cdsOperFinStr2: TStringField;
    cdsOperFinStr3: TStringField;
    cdsOperFinStr4: TStringField;
    cdsOperFinStr5: TStringField;
    cdsOperFinStr6: TStringField;
    cdsOperFinStr7: TStringField;
    cdsOperFinStr8: TStringField;
    cdsOperFinStr9: TStringField;
    cdsOperFinStr10: TStringField;
    cdsOperFinStr11: TStringField;
    cdsOperFinStr12: TStringField;
    cdsOperFinStr13: TStringField;
    cdsOperFinStr14: TStringField;
    cdsOperFinStr15: TStringField;
    cdsOperFinOperVidName: TStringField;
    cdsOperFinis_Mirr: TBooleanField;
    cdsOperFinid_Acc_Group: TIntegerField;
    cdsOperFinid_Warehouse_Group: TIntegerField;
    cdsOperFinid_Manufact_Group: TIntegerField;
    cdsOperFinOperNum: TStringField;
    aClearWare: TAction;
    ilImage: TImageList;
    ToolButton1: TToolButton;
    pmAmount: TPopupMenu;
    aAddWare1: TMenuItem;
    aDelWare1: TMenuItem;
    aSumm1: TMenuItem;
    procedure BitBtn4Click(Sender: TObject);
    procedure cbVizaClick(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsOperFinCorrectGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cbOperTypeInChange(Sender: TObject);
    procedure cdsOperFinAfterPost(DataSet: TDataSet);
    procedure lcbBsnChange(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure cdsOperWareCalcFields(DataSet: TDataSet);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure dsWMesDataChange(Sender: TObject; Field: TField);
    procedure OnSelectWare(Sender: TObject;
      TopButton: Boolean; var AutoRepeat, Handled: Boolean);
    procedure cdsOperWareid_MeasureChange(Sender: TField);
    procedure cdsOperWareMeasureName13GetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsOperWareMeasureName13Change(Sender: TField);
    procedure OnChangeMes(Sender: TObject;
      var Handled: Boolean);
    procedure DBGridEh1EditButtonClick(Sender: TObject);
    procedure aSummExecute(Sender: TObject);
    procedure aDelWareExecute(Sender: TObject);
    procedure aAddWareExecute(Sender: TObject);
    procedure cdsOperWareBeforeInsert(DataSet: TDataSet);
    procedure dsOperWareDataChange(Sender: TObject; Field: TField);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1ColEnter(Sender: TObject);
    procedure aClearWareExecute(Sender: TObject);
    procedure DBGridEh1DrawFooterCell(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEh; Rect: TRect; State: TGridDrawState);
    procedure cdsOperWareAfterPost(DataSet: TDataSet);
    procedure cdsOperWareAfterDelete(DataSet: TDataSet);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    FVKoef : Variant;
    FOperParamz : TOperParamz;
    FNeedColor : boolean;
    FReadOnly : boolean;

    FPriceLocked, FInvLocked : boolean;
    FShowSummAmount : boolean;
    procedure xxx(ACalcPrice : boolean = true);
    procedure MakeRed;
    procedure CheckNColor;
    procedure cbKoefDoChange;
    procedure AddWare(AEdit : boolean);
    procedure DoChangeMes;
    procedure CalcSumm;
    procedure xxxOne(ACalcPrice: boolean = true);
    function GetID_Oper: integer;
    procedure CalcAmountSum;

  public
    function ChangeData : boolean;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    procedure Initialize(AOperParamz : TOperParamz);

    property ID_Oper : integer read GetID_Oper;
    function CheckAmount : boolean;
    function CheckAmountOne(var Amount: Extended): boolean;
  end;

implementation

uses uDM, uUnivOper_v2, uUnivSelector,
  foMyFuncEh, uOperMesSelector;

{$R *.DFM}

{ TfOperWare }

function TfOperWare_FFF.CheckData: boolean;
begin
  FNeedColor := true;
  MakeRed;
  Result := false;
  UpdateData;
  with cbOperTypeIn do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран тип операции', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with edReprName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен чужой объект', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
    with cdsOperWare do
      if IsEmpty then
      begin
        MessageBox(Handle, 'Не выбраны товары', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Windows.SetFocus(Handle);
        Exit;
      end;
{  with DBEdit1 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle'Не введено количество', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;  }
{  with lcbWMes do
    if (trim(Text) = '') then 
    begin
      MessageBox(Handle'Не выбрана единица измерения', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;   }

{  with DBEdit2 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle'Не введена сумма', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;     }
  with fCurSelector1.cbCur do
    if {(DBEdit2.Field.AsFloat <> 0) and} (fCurSelector1.ID_Curr = Null)  then
    begin
      MessageBox(Handle,'Не выбрана валюта расчета', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;


{  if GroupBox1.Enabled then
  begin
    with DBEdit10 do
      if Value <= -0.001 then
      begin
        MessageBox(Handle'Себестоимость должна быть больше нуля', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Windows.SetFocus(Handle);
        Exit;
      end;
    with fCurSelectorInv.cbCur do
      if fCurSelectorInv.ID_Curr = Null then
      begin
        MessageBox(Handle'Не выбрана валюта', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Windows.SetFocus(Handle);
        Exit;
      end;
  end;  }
  Result := true;
  MakeRed;
end;

function TfOperWare_FFF.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  if (Owner is TCustomForm) and (not TForm(Owner).Visible) then
  begin
    Result := true;
    Exit;
  end;
  CDS := cdsOperFin;
  Result := true;
  UpdateData;
  if (FOperParamz.ID_Oper <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'Correct', 'Коррекция', SL);
        CompareField(CDS, 'SrcName', 'Счет', SL);
        CompareField(CDS, 'AcName', 'Склад', SL);
        CompareField(CDS, 'ReprName', 'Получатель', SL);
  //      CompareField(CDS, 'ReprWHName', 'Склад представителя', SL);

        CompareField(CDS, 'BusinessName', 'Бизнес', SL);

        if cdsOperWare.ChangeCount > 0 then
          SL.Add('изменен список товаров');

        CompareField(CDS, 'PriceOper', 'Сумма', SL);
        CompareField(CDS, 'CurrencyOperShortName', 'Валюта', SL);

        CompareField(CDS, 'PriceInv', 'Себестоисомть', SL);
        CompareField(CDS, 'CurrencyInvShortName', 'Валюта себестоимости', SL);

        CompareField(CDS, 'ManagerFIO', 'Сотрудник', SL);
        CompareField(CDS, 'FormalDistribName', 'Формальное распределение', SL);
        CompareField(CDS, 'FuncDistribName', 'Функциональное распределение', SL);
        CompareField(CDS, 'Koeff', 'Суть операции', SL, false);
        CompareField(CDS, 'Imp_PayBasic', 'Основание платежа', SL);
        CompareField(CDS, 'AccInv_PayAssignment', 'Пл. поручение/Счет фактура', SL);
        CompareField(CDS, 'Contract', 'Договор', SL);
        CompareField(CDS, 'OpComment', 'Комментарии', SL, false);
     end;

      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfOperWare_FFF.Create(AOwner: TComponent);
var i : integer;
begin
  inherited;
  FShowSummAmount := true;
 //1013 TCustomGridxxx(DBGridEh1).Options := TCustomGridxxx(DBGridEh1).Options - [GridsEh.goColMoving];
  FPriceLocked := false;
  FInvLocked := false;
  FNeedColor := false;
  FVKoef := Null;
  if Owner is TCustomForm then
  begin
    LoadEhGridSettingsFromRegistry(DBGridEh1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;

{  for i := 0 to DBGridEh1.Columns.Count - 1 do
  begin
    if DBGridEh1.Columns[i].Field = cdsOperWareWareName then
      DBGridEh1.Columns[i].OnEditButtonDown := OnSelectWare;
    if DBGridEh1.Columns[i].Field = cdsOperWareMeasureName then
      DBGridEh1.Columns[i].OnEditButtonClick := OnChangeMes;
    if DBGridEh1.Columns[i].Field = cdsOperWareSummSys then
      DBGridEh1.Columns[i].OnEditButtonClick := OnDoCalcCrn;
  end;}
end;

destructor TfOperWare_FFF.Destroy;
begin
  if Owner is TCustomForm then
  begin
    SaveEhGridSettingsToRegistry(DBGridEh1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
  inherited;
end;

procedure TfOperWare_FFF.Initialize(AOperParamz : TOperParamz);
var S : String;
begin
  FNeedColor := ID_Oper <> -1;
  FOperParamz := AOperParamz;
  P1.Enabled := not FOperParamz.ReadOnly;
  P4.Enabled := not FOperParamz.ReadOnly;
  DBGridEh1.ReadOnly := FOperParamz.ReadOnly;

  with cdsOperFin do
  begin
    Close;
    Params.ParamByName('@id_Oper').AsInteger := FOperParamz.ID_Oper;
    Params.ParamByName('@is_MIrr').value := false;
    Open;
    if FOperParamz.ID_Oper = -1 then
    begin
      cbOperTypeIn.ItemIndex := 0;

      Edit;
      FieldByName('Correct').AsBoolean := false;
      FieldByName('CreatorFIO').Value := DM.FullFIO; 
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      FieldByName('id_OperParent').Value := FOperParamz.id_OperParent;
      FieldByName('OperVid').AsInteger := 101;
      Post;
    end
    else
    begin
      cdsFormal.Close;
      cdsFormal.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
      cdsFormal.Open;
      cdsFunc.Close;
      cdsFunc.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
      cdsFunc.Open;

     fCurSelector1.Initialize(FieldByName('id_business').AsInteger);
//     fCurSelectorInv.Initialize(FieldByName('id_business').AsInteger);

     fCurSelector1.ID_Curr := FieldByName('Id_CurrencyOper').Value;
//     fCurSelectorInv.ID_Curr := FieldByName('Id_CurrencyInv').Value;

      if FieldByName('OperTypeIn').AsBoolean then
        cbOperTypeIn.ItemIndex := 0
      else
        cbOperTypeIn.ItemIndex := 1;
    end;
  end;
  with cdsOperWare do
  begin
    Close;
    Params.ParamByName('@id_Oper').Value := FOperParamz.ID_Oper;
    Open;
  end;
  cbOperTypeIn.Enabled := false;

  if FOperParamz.Correct or FOperParamz.Copy then   // Коррекция или копирование
  begin
    FOperParamz.ID_Oper := -1;
    RebildWareData(cdsOperWare);
    with cdsOperFin do
    begin
      Edit;
      FieldByName('Correct').AsBoolean := FOperParamz.Correct;
      FieldByName('id_OperParent').Value := FOperParamz.id_OperParent;

      FieldByName('CreatorFIO').Value := DM.FullFIO;
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      FieldByName('DateLocal').Value := Null;

      FieldByName('OperState').Value := 0;
      FieldByName('CheckDate').Value := Null;
      FieldByName('HasViza').Value := false;

      Post;
      if (FOperParamz.Correct) then
      begin
        S := FieldByName('OperNum').AsString;
        if S <> '' then
        begin
          Edit;
          FieldByName('OpComment').AsString := 'Коррекция операции №' + S;
          Post;
        end;
      end;
    end;
    xxx(false);
  end;
//  fOperOldData1.Initialize(cdsOperFinid_old_Oper.AsInteger);
  PageControl1.ActivePageIndex := 1;
  xxx(false);
  if ID_Oper <> -1 then
    MakeRed;
 { if not cdsWMes.FieldByName('id_Measure').IsNull then
  begin
    if not cdsWMes.FieldByName('id_BaseMeasure').IsNull then
      FVKoef := cdsWMes.fieldByName('Koef').Value
    else
      FVKoef := 1;
  end; }

//  DBEdit10.ReadOnly := true;
//  fCurSelectorInv.cbCur.Enabled := false;
end;

function TfOperWare_FFF.SaveProp: boolean;
begin
  if not ChangeData then
  begin
    Result := false;
    Exit;
  end;
  Result := SavePropOper(FOperParamz.ID_Oper, cdsOperFin, cdsOperWare, nil, nil);
end;

procedure TfOperWare_FFF.UpdateData;
var CDS : TClientDataSet;
begin
  CDS := cdsOperFin;

  if CDS.State <> dsEdit then
    CDS.Edit;

//  if CDS.FieldByName('PriceOper').AsFloat = 0 then
//    fCurSelector1.ID_Curr := Null;   
  CDS.FieldByName('Id_CurrencyOper').Value := fCurSelector1.ID_Curr;
  CDS.FieldByName('CurrencyOperShortName').Value := fCurSelector1.CurName;

{  if GroupBox1.Enabled then
  begin
    CDS.FieldByName('Id_CurrencyInv').Value := fCurSelectorInv.ID_Curr;
    CDS.FieldByName('CurrencyInvShortName').Value := fCurSelectorInv.CurName;
  end
  else
  begin
    CDS.FieldByName('PriceInv').Value := Null;
    CDS.FieldByName('Id_CurrencyInv').Value := Null;
    CDS.FieldByName('CurrencyInvShortName').Value := Null;
  end;    }

  CDS.FieldByName('Id_CurrencySys').Value := Null;
  CDS.FieldByName('CurrencySysShortName').Value := Null;
  CDS.FieldByName('SummSys').Value := Null;
  CDS.FieldByName('RateSys').Value := Null;

  CDS.FieldByName('Koeff').Value := 0;

  if (cbOperTypeIn.ItemIndex = 0) <> CDS.FieldByName('OperTypeIn').AsBoolean then
    CDS.FieldByName('OperTypeIn').Value := cbOperTypeIn.ItemIndex = 0;

  CDS.FieldByName('id_FormalDistrib').Value := Null;
  CDS.FieldByName('id_FuncDistrib').Value := Null;
//  CDS.FieldByName('CheckDate').Value := Null;
  CDS.Post;
end;

procedure TfOperWare_FFF.BitBtn4Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
    Rez : boolean;
    AEObjTypes: TEObjTypes;
    AOldObjType : TEObjType;
    AOldID : Variant;
begin
  with cbOperTypeIn do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран тип операции', 'Сначала выберите тип операции', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;

  if not cdsOperFin.FieldByName('id_Warehouse').IsNull then
  begin
    ASelectedObj.ID := cdsOperFin.FieldByName('id_Warehouse').Value;
    ASelectedObj.ObjType := eotWH;
  end;

  AEObjTypes := [eotWH];
  AOldObjType := ASelectedObj.ObjType;
  AOldID := ASelectedObj.ID;
  Rez := SelectObjUn(Owner, 1, ASelectedObj, 0, AEObjTypes);

  if Rez and ((ASelectedObj.ObjType <> AOldObjType) or (ASelectedObj.ID <> AOldID)) then
  begin
    with cdsOperFin do
    begin
      Edit;
      FieldByName('id_Repr').Value := Null;
      FieldByName('id_Warehouse_Ext').Value := Null;
      FieldByName('id_Manufact_Ext').Value := Null;
      FieldByName('id_Repr_Ex').Value := Null;
      


      case ASelectedObj.ObjType of
        eotWH : FieldByName('id_Warehouse').Value := ASelectedObj.ID;
      else
        raise Exception.Create('Неверный тип возвращаемого значения');
      end;

      if FieldByName('id_business').Value <> ASelectedObj.Bsn_id then
      begin
        FieldByName('id_Repr').Value := Null;
        FieldByName('ReprName').Value := Null;
        FieldByName('ContrAgentName').Value := Null;
                                                   
        FieldByName('Id_CurrencyInv').Value := Null;

        with TClientDataSet(dsOperWare.DataSet) do
        begin
          Close;
          Params.ParamByName('@id_Oper').Value := -1;
          Open;
        end;
//        cdsOperWare.EmptyDataSet;
      end;
      FieldByName('id_business').Value := ASelectedObj.Bsn_id;
      FieldByName('BusinessName').Value := ASelectedObj.Bsn_Name;
      FieldByName('ContrAgentName').Value := ASelectedObj.CA_Name;
      FieldByName('SrcName').Value := ASelectedObj.Name;
      fCurSelector1.Initialize(cdsOperFin.FieldByName('id_business').Value);
      Post;
    end;
    if (cbOperTypeIn.ItemIndex = 1) and (ASelectedObj.ObjType = eotRepr) and (not cdsOperware.IsEmpty) then
    begin
      if MessageBox(Handle, 'Пересчитать цену товара?', 'Подтвердите пересчет', MB_ICONQUESTION + MB_YESNO) = idYes then
        xxx
      else
        xxx(false)
    end
    else
      xxx(false);
  end;
end;

procedure TfOperWare_FFF.cbVizaClick(Sender: TObject);
begin
  with cdsOperFin do
  begin
    Edit;
    FieldByName('CheckDate').Value := Null;
    FieldByName('id_UserChecker').Value := Null;
    Post;
  end;
end;

function TfOperWare_FFF.ChangeData: boolean;
begin
  Result := (ID_Oper = -1) or (cdsOperFin.ChangeCount > 0) or (cdsOperWare.ChangeCount > 0)
end;

procedure TfOperWare_FFF.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) and (cdsOperFin.State = dsEdit) then
    cdsOperFin.Post;
end;

procedure TfOperWare_FFF.MakeRed;
begin
  if cdsOperFin.FieldByName('ReprID_Main').IsNull then
  begin
    with lbReprName do
    begin
      Font.Style := Font.Style + [fsBold];
      Font.Color := clRed;
    end;
  end;
{  if (not cdsOperFinid_Repr.IsNull or not cdsOperFinid_Repr_Ex.IsNull) and
     (cdsOperFinid_ContrAgent.IsNull) then
  begin
    with DBEdit12 do
    begin
      Label19.Font.Style := Font.Style + [fsBold];
      Label19.Color := clRed;
    end;
  end;    }
{  if (cdsOperFinReprWHID_Main.IsNull) and
     (not cdsCAWHList.IsEmpty) then
  begin
    with lbReprWHName do
    begin                                                                       
      Font.Style := Font.Style + [fsBold];
      Font.Color := clRed;
    end;
  end;   }
{  if cdsOperFinWareID_Main.IsNull then
  begin
    with lbWareName do
    begin
      Font.Style := Font.Style + [fsBold];
      Font.Color := clRed;
    end;
  end;  }
end;


procedure TfOperWare_FFF.cdsOperFinCorrectGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := 'Да'
  else
    Text := 'Нет';
end;

procedure TfOperWare_FFF.CheckNColor;
begin
  if FReadOnly then Exit;

  if not FNeedColor then
    Exit;
  with cbOperTypeIn do
  begin
    if  trim(Text) = '' then
    begin
      Color := redColor;
    end
    else
      Color := clWindow;
  end;

{  with DBEdit1 do
  begin
    if (trim(Text) = '') or (Field.AsFloat = 0) then
    begin
      Color := redColor;
    end
    else
      Color := clWindow;
  end; }
  with edReprName do
  begin
    if (trim(Text) = '')  or
     ((not cdsOperFin.FieldByName('id_Repr_Ex').IsNull) and (cdsOperFin.FieldByName('id_Repr').IsNull))  then
    begin
      Color := redColor;
    end
    else
      Color := clWindow;
  end;
{  with DBEdit2 do
  begin
    if (trim(Text) = '') or (Field.AsFloat = 0) then
    begin
      Color := redColor;
    end
    else
      Color := clWindow;
  end;  }
  with fCurSelector1.cbCur do
  begin
    if fCurSelector1.ID_Curr = Null then
    begin
      Color := redColor;
    end
    else
      Color := clWindow;
  end;
 { if (CheckBox1.Checked) then
  begin
    with DBEdit4 do
    begin
      if (trim(Text) = '') or (Field.AsFloat = 0) then
    begin
      Color := redColor;
    end
      else
        Color := clWindow;
    end;   
    with fCurSelector2.cbCur do
    begin
      if fCurSelector2.ID_Curr = Null then
    begin
      Color := redColor;
    end
      else
        Color := clWindow;
    end;
  end;     }
{  with DBEdit9 do
  begin
    if trim(Text) = '' then
    begin
      Color := redColor;
    end
    else
      Color := clWindow;
  end; 
  with DBEdit9 do
  begin
    if trim(Text) = '' then
    begin
      Color := redColor;
    end
    else
      Color := clWindow;
  end;   }
  with fCurSelector1.cbCur do
  begin
    if fCurSelector1.ID_Curr = Null then
  begin
    Color := redColor;
  end
    else
      Color := clWindow;
  end;
end;

procedure TfOperWare_FFF.cbOperTypeInChange(Sender: TObject);
begin
  CheckNColor;
  if (not cdsOperware.IsEmpty) then
  begin
    if MessageBox(Handle, 'Пересчитать цену товара?', 'Подтвердите пересчет', MB_ICONQUESTION + MB_YESNO) = idYes then
      xxx
    else
      xxx(false)
  end
  else
    xxx(false);
end;

procedure TfOperWare_FFF.lcbBsnChange(Sender: TObject);
begin
  CheckNColor;
end;

procedure TfOperWare_FFF.cbKoefDoChange;
begin
  CheckNColor;
end;


function TfOperWare_FFF.CheckAmount: boolean;
var ObjType : TEObjType;
    ID : integer;
    TotalAmount : Double;
    Price, ID_Cur : OLeVariant;
    Koef :  Double;
    ID_Warehouse : Variant;
    Amount: Extended;
begin
  Result := true;
  ID_Warehouse := Null;
  if (cbOperTypeIn.ItemIndex = 1) and (not cdsOperFin.FieldByName('HasViza').AsBoolean) then
  begin
    ID_Warehouse := cdsOperFin.FieldByName('ID_Warehouse').Value;
  end;
  if (cbOperTypeIn.ItemIndex = 0) and (not cdsOperFin.FieldByName('HasViza').AsBoolean) then
  begin
    ID_Warehouse := cdsOperFin.FieldByName('id_Warehouse_Ext').Value;
  end;
  // *** Проверяем кол-во ***
  with cdsOperWare do
  begin
    First;
    while not Eof do
    begin   
      Result := CheckAmountOne(Amount);
      if not Result then
        Break;
      Next;
    end;
  end;
end;

function TfOperWare_FFF.CheckAmountOne(var Amount: Extended): boolean;
var ObjType : TEObjType;
    ID : integer;
    TotalAmount : Double;
    Price, ID_Cur : OLeVariant;
    Koef :  Double;
    ID_Warehouse : Variant;
begin
  Result := true;
  ID_Warehouse := Null;
  if (cbOperTypeIn.ItemIndex = 1) and (not cdsOperFin.FieldByName('HasViza').AsBoolean) then
  begin
    ID_Warehouse := cdsOperFin.FieldByName('ID_Warehouse').Value;
  end;
  if (cbOperTypeIn.ItemIndex = 0) and (not cdsOperFin.FieldByName('HasViza').AsBoolean) then
  begin
    ID_Warehouse := cdsOperFin.FieldByName('id_Warehouse_Ext').Value;
  end;
  // *** Проверяем кол-во ***
  with cdsOperWare do
  begin
    if not FieldByName('id_Goods').IsNull then
    begin
      ID := FieldByName('id_Goods').Value;
      ObjType := eotGoods;
    end;
    if ID_Warehouse <> Null then
    begin
      if DM.PL_GetDefWarePrice(ID, ID_Warehouse, Price, ID_Cur, TotalAmount) <> -1 then
      begin
        Koef := 1;
        if not FieldByName('RealKoef').IsNull then
          Koef := FieldByName('RealKoef').AsFloat;

        Amount := Koef * TotalAmount;
        Result := Amount - cdsOperWareAmountOper.AsFloat > 0.001;
      end; 
    end; 
  end;
end;

procedure TfOperWare_FFF.cdsOperFinAfterPost(DataSet: TDataSet);
begin
  CheckNColor;
end;

procedure TfOperWare_FFF.xxx(ACalcPrice : boolean);
var OldRec : integer;
begin
  if FReadOnly then Exit;
  
  with cdsOperWare do
  begin
    OldRec := RecNo;
    First;
    DisableControls;
    try
      while not Eof do
      begin
        xxxOne(ACalcPrice);

        Next;
      end;
      RecNo := OldRec;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfOperWare_FFF.xxxOne(ACalcPrice : boolean);
begin
end;

procedure TfOperWare_FFF.DBEdit1Enter(Sender: TObject);
begin
//  Windows.SetFocus((sender as TWinControl).Handle);
  TCustomEdit(sender).SelStart := 0;
  TCustomEdit(sender).SelLength := Length(TCustomEdit(sender).Text);
end;

procedure TfOperWare_FFF.cdsOperWareCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('Numb').AsInteger := DataSet.RecNo;
  if DataSet.FieldByName('AmountOper').AsFloat = 0 then
    DataSet.FieldByName('SummOper2').AsFloat := DataSet.FieldByName('PriceOper').AsFloat
  else
    DataSet.FieldByName('SummOper2').AsFloat := DataSet.FieldByName('AmountOper').AsFloat * DataSet.FieldByName('PriceOper').AsFloat;
end;

procedure TfOperWare_FFF.DBGridEh1DblClick(Sender: TObject);
begin
//  AddWare(true);
end;

procedure TfOperWare_FFF.dsWMesDataChange(Sender: TObject; Field: TField);
begin
//*
  tag := 0;
end;

procedure TfOperWare_FFF.AddWare(AEdit : boolean);
var ASelectedObj : TSelectedObj;
    Price, ID_Cur: OleVariant;
    TotalAmount : Double;
    id_Warehouse : integer;
    AID, AName : OleVariant;
    S : String;
    EObjTypes : TEObjTypes;
begin
  with cbOperTypeIn do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран тип операции', 'Сначала выберите тип операции', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with edReprName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен чужой объект', 'Сначала выберите получателя', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  Screen.Cursor := crSQLWait;
  EObjTypes := [eotGoods];
  with cdsOperWare do
  begin
    if not FieldByName('id_Goods').IsNull then
    begin
      ASelectedObj.ID := FieldByName('id_Goods').Value;
      ASelectedObj.ObjType := eotGoods;
      EObjTypes := [eotGoods];
    end;

    if cbOperTypeIn.ItemIndex = 1 then // Расход
    begin
      if cdsOperFin.FieldByName('id_Warehouse').IsNull then
        id_Warehouse := -1
      else
        id_Warehouse := cdsOperFin.FieldByName('id_Warehouse').AsInteger;
    end
    else
    begin
      if cdsOperFin.FieldByName('id_Warehouse_Ext').IsNull then
        id_Warehouse := -1
      else
        id_Warehouse := cdsOperFin.FieldByName('id_Warehouse_Ext').AsInteger;
    end;
//    if not AEdit then ASelectedObj.ID := -1;
    if SelectObjUnBsn(Owner, cdsOperFin.FieldByName('id_business').AsInteger, ASelectedObj, 0, EObjTypes, true, id_Warehouse) then
    begin
      if Locate('id_Goods', ASelectedObj.ID, []) then
      begin
        MessageBox(Handle, 'Этот товар уже выбран. Вы можете изменить его количество', 'Этот товар уже выбран', MB_ICONWARNING + MB_OK);
        DBGridEh1.Col := 2;
        windows.SetFocus(DBGridEh1.Handle);
        Exit;
      end;
      if AEdit then
        Edit
      else
      begin
        BeforeInsert := nil;
        Append;
        BeforeInsert := cdsOperWareBeforeInsert;
      end;
        
      FieldByName('WareName').Value := ASelectedObj.Name;

      FieldByName('id_Goods').Value := ASelectedObj.ID;

      if DM.rsCA.AppServer.PL_WareMeasureGet(FieldByName('id_Goods').Value,
                                             AID, AName) = 1 then
      begin
        FieldByName('id_Measure').AsInteger := AID;
        FieldByName('MeasureName').AsString := AName;
        FieldByName('RealKoef').AsInteger := 1;
      end;
      xxxOne;
      Post;
      DBGridEh1.Col := 2;
      windows.SetFocus(DBGridEh1.Handle);
    end;
  end;
 // CheckMeasure;
{  if cdsWMes.Locate('id_BaseMeasure', Null, []) then
  begin
    lcbWMes.KeyValue := cdsWMesid_Measure.AsInteger;
  end;}
end;

procedure TfOperWare_FFF.OnSelectWare(Sender: TObject;
  TopButton: Boolean; var AutoRepeat, Handled: Boolean);
begin
  AddWare(false);
end;

procedure TfOperWare_FFF.cdsOperWareid_MeasureChange(Sender: TField);
begin
  tag := 0;
end;

procedure TfOperWare_FFF.cdsOperWareMeasureName13GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 { if Sender.AsString = '' then
    Text := Sender.DataSet.fieldByName('MeasureName').AsString
  else
    Text := Sender.AsString;    }
end;                            

procedure TfOperWare_FFF.cdsOperWareMeasureName13Change(Sender: TField);
begin
//  if Sender.DataSet.fieldByName('MeasureName').AsString <> Sender.AsString then
//    Sender.DataSet.fieldByName('MeasureName').AsString := Sender.AsString;
end;

procedure TfOperWare_FFF.OnChangeMes(Sender: TObject;
  var Handled: Boolean);
begin
  DoChangeMes;
end;

procedure TfOperWare_FFF.DoChangeMes;
var
  AID:Variant;
  AName:string;
  Koef, KKK : Extended;
  xxxPriceOper, xxxPriceInv : Variant;
begin
  with cdsOperWare do
  begin
    AID := FieldByName('id_Measure').Value;
//  AName := cdsWare.FieldByName('MeasureName').AsString;
    if SelectOperMeasure(Handle,
                         cdsOperWare.FieldByName('id_Goods').Value,
                         AID, AName, Koef) then
    begin
      Edit;
      FVKoef := FieldByName('RealKoef').Value;
      FieldByName('MeasureName').AsString := AName;
      FieldByName('id_Measure').Value := AID;
      FieldByName('RealKoef').Value := Koef;

      xxxPriceOper := Null;
      if FVKoef <> Null then
      begin
        KKK := Koef/FVKoef;
        if not FieldByName('PriceOper').IsNull then
        begin
          xxxPriceOper := FieldByName('PriceOper').AsFloat * KKK;
        end;
        if not FieldByName('PriceInv').IsNull then
        begin
          xxxPriceInv := FieldByName('PriceInv').AsFloat * KKK;
        end;
        if (not FieldByName('PriceOper').IsNull) or
           (not FieldByName('PriceInv').IsNull) then
        begin
          if MessageBox(Handle, 'Вы изменили единицу измерения. Пересчитать "Цену за единицу" и "Себестоимость единицы"?', 'Изменена единица измерения', MB_ICONQUESTION + MB_YESNO) = idYes then
          begin
            FieldByName('PriceOper').Value := xxxPriceOper;
            FieldByName('PriceInv').Value := xxxPriceInv;
          end;
        end;
      end;
      FVKoef := Koef;

      Post;
    end;
  end;
end;

procedure TfOperWare_FFF.DBGridEh1EditButtonClick(Sender: TObject);
var tmpCol : TColumnEh;
begin
  tmpCol := TDBGridEh(Sender).Columns[TDBGridEh(Sender).col - 1];
  if tmpCol.Field = cdsOperWareWareName then
    AddWare(true);
  if tmpCol.Field = cdsOperWareMeasureName then
    DoChangeMes;
end;

procedure TfOperWare_FFF.aSummExecute(Sender: TObject);
begin
  CalcSumm;
end;

procedure TfOperWare_FFF.CalcSumm;
var S : String;
    F : Extended;
begin
  if cdsOperWare.FieldByName('AmountOper').AsFloat = 0 then
    Exit;
  F := cdsOperWare.FieldByName('SummOper2').AsFloat;
  S := FloatToStr(F);
  if InputBoxKrm('Сумма товара "' + cdsOperWareWareName.AsString + '"', 'Сумма', S, [], true) then
  begin
    F := StrToFloat(S);
    F := F / cdsOperWare.FieldByName('AmountOper').AsFloat;
    with cdsOperWare do
    begin
      Edit;
      FieldByName('PriceOper').AsFloat := F;
      Post;
    end;
  end;   
end;

procedure TfOperWare_FFF.aDelWareExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if DBGridEh1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(DBGridEh1.SelectedRows.Count) + ' товаров?'
  else
    S := 'Удалить товар "' + cdsOperWareWareName.AsString+ '"?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if DBGridEh1.SelectedRows.Count > 0 then
      begin
        for i := 0 to DBGridEh1.SelectedRows.Count - 1 do
        begin
          DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
          cdsOperWare.Delete;
        end;
      end
      else
        cdsOperWare.Delete;
    finally

    end;


  end;
end;

procedure TfOperWare_FFF.aAddWareExecute(Sender: TObject);
begin
  AddWare(false);
end;

procedure TfOperWare_FFF.cdsOperWareBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TfOperWare_FFF.dsOperWareDataChange(Sender: TObject; Field: TField);
begin
  aClearWare.Enabled := not dsOperWare.DataSet.IsEmpty;
  aDelWare.Enabled := not cdsOperWare.IsEmpty;
  aSumm.Enabled := not cdsOperWare.IsEmpty and not FPriceLocked;
end;

procedure TfOperWare_FFF.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
var tmpCol : TColumnEh;
    S, S2 : String;
begin
  if (Key = '.') then
  begin
    S := DecimalSeparator;
    if S = ',' then S2 := '.' else S2 := ',';
    tmpCol := TDBGridEh(Sender).Columns[TDBGridEh(Sender).col];
    if (Key = S2[1]) and ((tmpCol.Field = cdsOperWareAmountOper) or
     (tmpCol.Field = cdsOperWarePriceOper) or
     (tmpCol.Field = cdsOperWareSummSys)) then
      Key := S[1];
  end
  else
    if (Key = #13) then
    begin
      if cdsOperWare.State = dsEdit then
        cdsOperWare.Post
      else
      begin
        with TDBGrideh(Sender) do
          if selectedindex < fieldcount - 1 then
            selectedindex := selectedindex + 1
          else
            selectedindex := 0;   
      end;
    end;
end;

function TfOperWare_FFF.GetID_Oper: integer;
begin
  Result := FOperParamz.ID_Oper;
end;

procedure TfOperWare_FFF.DBGridEh1ColEnter(Sender: TObject);
begin
  if cdsOperWare.State = dsEdit then
  begin
    cdsOperWare.Post;
    DBGridEh1.Columns[5].Footer.EnsureSumValue;
  end;
end;

procedure TfOperWare_FFF.aClearWareExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Очистить перечень товаров?'), 'Подтвердите очистку', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    with dsOperWare.DataSet do
    begin
      while not IsEmpty do
        Delete;
    end;
  end;

end;

procedure TfOperWare_FFF.DBGridEh1DrawFooterCell(Sender: TObject; DataCol,
  Row: Integer; Column: TColumnEh; Rect: TRect; State: TGridDrawState);
begin
  if Column.Field = dsOperWare.DataSet.FieldByName('AmountOper') then
  begin
    if not FShowSummAmount then
      DBGridEh1.Canvas.FillRect(Rect);
  end
  else
    if (Column.Field = dsOperWare.DataSet.FieldByName('MeasureName')) and FShowSummAmount then
    begin
      DBGridEh1.Canvas.FillRect(Rect);
      DrawText(DBGridEh1.Canvas.Handle, PChar(dsOperWare.DataSet.FieldByName('MeasureName').AsString), -1, Rect, DT_END_ELLIPSIS AND DT_RIGHT);
    end
end;

procedure TfOperWare_FFF.cdsOperWareAfterPost(DataSet: TDataSet);
begin
  CalcAmountSum;
end;

procedure TfOperWare_FFF.cdsOperWareAfterDelete(DataSet: TDataSet);
begin
  CalcAmountSum;
end;

procedure TfOperWare_FFF.CalcAmountSum;
var OldRecNo, oldId_Mes : integer;
begin
  FShowSummAmount := true;
  with dsOperWare.DataSet do
  begin
    OldRecNo := RecNo;
    DisableControls;
    try
      First;
      oldId_Mes := dsOperWare.DataSet.FieldByName('id_Measure').AsInteger;
      while not Eof do
      begin
        if oldId_Mes <> dsOperWare.DataSet.FieldByName('id_Measure').AsInteger then
        begin
          FShowSummAmount := false;
          Break;
        end;
        Next;
      end;
    finally
      RecNo := OldRecNo;
      EnableControls;
    end;
  end;
  tag := 0;
end;

procedure TfOperWare_FFF.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
    S : String;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.IsEmpty then
    Exit;

  if Column.Field = cdsOperWare.FieldByName('WareName') then
  begin
    ImgIndex := 2;
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
    R := Rect;
    R.Top := R.Top + 2;
    R.Left := R.Left + 2 + ilImage.Width;
//    S := cdsOperWare.FieldByName('WareName').AsString;
//    DrawText(TDBGridEh(Sender).Canvas.Handle, PChar(S), -1, R, DT_RIGHT);
    TDBGridEh(Sender).DefaultDrawColumnCell(R, DataCol, Column, State);
  end
  else
  begin
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

    // Красим незаполненные ячейки
    if ((Column.Field = cdsOperWarePriceOper) and
       (cdsOperWarePriceOper.AsFloat = 0)) 
       or
       ((Column.Field = cdsOperWareAmountOper) and
       (cdsOperWareAmountOper.AsFloat = 0))
       or
       (
       (Column.Field = cdsOperWareSummSys) and
       (cdsOperWareSummSys.AsFloat = 0))
        then
    begin
      TDBGridEh(Sender).Canvas.Brush.Color := clWindow;

      TDBGridEh(Sender).Canvas.Font.Color := clRed;
      TDBGridEh(Sender).Canvas.Font.Style := TDBGridEh(Sender).Canvas.Font.Style + [fsBold];

      TDBGridEh(Sender).Canvas.Brush.Style := bsClear;
      TDBGridEh(Sender).Canvas.Pen.Color := clRed;
      TDBGridEh(Sender).Canvas.Rectangle(Rect.Left + 0, Rect.Top + 0, Rect.Right - 0, Rect.Bottom - 0);
    end;    
  end;
end;

end.

