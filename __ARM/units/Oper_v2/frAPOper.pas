unit frAPOper;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ExtCtrls, StdCtrls, Mask, DBCtrls, foMyFunc, Buttons,
  frCurSelector, ToolEdit, RXDBCtrl, ComCtrls, ActnList, Grids, DBGrids,
  ToolWin, RxLookup, frOperOldData, CurrEdit, Registry,
  BaseGrid, AdvGrid, AdvCGrid, frBsnSelector, contnrs,
  frmctrllink, DBGridEh, ImgList, RxMemDS, GridsEh;

const
  cnsNameCol = 1;
  cnsParamTypeCol = 2;
  cnsVal = 3;

  xxx_Src_id_Acc = 1;
  xxx_Src_id_Warehouse = 2;
  xxx_Src_id_Manufact = 6;

  xxx_koeff = 4;

  xxx_Dest_id_Acc = 7;
  xxx_Dest_id_Warehouse = 8;
  xxx_Dest_id_Repr = 3;
  xxx_Dest_id_Manufact = 9; 

  xxx_id_FormalDistrib = 14;
  xxx_id_FuncDistrib = 15;

  xxx_id_ContrAgent = 16;

  xxx_Imp_PayBasic = 17;
  xxx_AccInv_PayAssignment = 18;
  xxx_Contract = 19;
  xxx_OpComment = 20;

type
  TParamType = (ptOther, ptNull, ptLikeOper, ptSet, ptInput, ptCrnOper, ptCrnSys);
                           
  TVal_obj = class
    ID : Variant;
    constructor Create(AID : Variant);
  end;

  TVal_Oper = class
  private
    fVal: Variant;
    procedure SetVal(const Value: Variant);
  public
    ExtID : integer;
    ParamType : TParamType;
    property Val : Variant read fVal write SetVal;
    constructor Create(AExtID : integer; AParamType : TParamType = ptOther);
  end;

  TVal_Sum = class
  private
    FParamTypeCurrency: TParamType;
    procedure SetParamTypeCurrency(const Value: TParamType);
  public
    ParamType : TParamType;
    //ParamTypeCurrency : TParamType;
    FormType : integer;
    Formulas,
    Koeff, Val, Znak, Koeff2, Znak2, Koeff3, Znak3, 
    id_Currency, id_ObjItemSumm : Variant;
    CurName, ParamName : String;
    inPercent, Summ_UseSys : boolean;
    id_CnstItem, ZnakCnstItem, K_CnstItem : Variant;

    constructor Create;
    function GetStr : String;
    procedure ClearFrm;
    property ParamTypeCurrency : TParamType read FParamTypeCurrency write SetParamTypeCurrency;
  end;

  TParamAPOper = class
  private
    function GetVal_OperByExtID_Int(AExtID: integer): TVal_Oper;
    function GetVal_OperByExtID(AExtID: integer; AddIfNeed : boolean; AList : TList): TVal_Oper;
    function GetDigVal_Oper(index: integer): TVal_Oper;
    function GetStrVal_Oper(index: integer): TVal_Oper;
    function GetDestParamType: TParamType;
    function GetSrcParamType: TParamType;
    procedure SetDestParamType(const Value: TParamType);
    procedure SetSrcParamType(const Value: TParamType);
    procedure SetSrcVal(const Value: Variant);
    procedure SetDestVal(const Value: Variant);
  public
    SrcPlaceName, DestPlaceName : String;

    OperVid : Variant;
    OperVidName : String;

    OperTypeIn : Variant;
    OperTypeInName : String;

    Correct : Variant;
    CorrectName : String;

    id_business : Variant;
    BsnName : String;

    ContrAgentName : String;
    
    KoeffName : String;
    
    FormalDistribName : String;
    FuncDistribName : String;

    FParamTypeList : TObjectList;
    SumOper, SumSys : TVal_Sum;
    constructor Create;
    destructor Destroy; override;

    property Val_OperByExtID[AExtID : integer] : TVal_Oper read GetVal_OperByExtID_Int;
    property DigVal_Oper[index : integer] : TVal_Oper read GetDigVal_Oper;
    property StrVal_Oper[index : integer] : TVal_Oper read GetStrVal_Oper;

    property SrcParamType : TParamType read GetSrcParamType write SetSrcParamType;
    property SrcVal : Variant {read GetSrcVal} write SetSrcVal;
    property DestParamType : TParamType read GetDestParamType write SetDestParamType;
    property DestVal : Variant {read GetSrcVal} write SetDestVal;

    procedure SrcClear;
    procedure DestClear;

    procedure GetSrcInfo(var AEObjType : TEObjType; var AID : Variant);
    procedure GetDestInfo(var AEObjType : TEObjType; var AID : Variant);
  end;

  TRowType = (cnsRow_None, cnsRow_Bsn, cnsRow_OType, cnsRow_OperVid, cnsRow_Corr,
              cnsRow_SrcName, cnsRow_DestName, cnsRow_CA,
              cnsRow_Koeff, cnsRow_FormalDistribName, cnsRow_FuncDistribName,
              cnsRow_Imp_PayBasic, cnsRow_AccInv_PayAssignment, cnsRow_Contract,
              cnsRow_Comment,
              cnsRow_CurOper,
              cnsRow_CurSys,
              cnsRow_SummOper,
              cnsRow_SummSys, cnsRow_Goods
              );

  TfAPOper = class(TFrame)
    cdsAPOI: TClientDataSet;
    cdsFormal: TClientDataSet;
    dsFormal: TDataSource;
    dsCur: TDataSource;
    cdsFunc: TClientDataSet;
    cdsFormalid_FormalDistrib: TAutoIncField;
    cdsFormalName: TStringField;
    cdsFuncid_FuncDistrib: TAutoIncField;
    cdsFuncName: TStringField;
    elCorr: TFormControlEditLink;
    elOType: TFormControlEditLink;
    elKoef: TFormControlEditLink;
    elFormal: TFormControlEditLink;
    elFunc: TFormControlEditLink;
    elOperVid: TFormControlEditLink;
    Panel2: TPanel;
    AdvStringGrid1: TAdvColumnGrid;
    cdsExtData: TClientDataSet;
    cdsExtDataid_Oper_ExtData: TIntegerField;
    cdsExtDataid_Oper: TIntegerField;
    cdsExtDataType: TIntegerField;
    cdsExtDataNumPrm: TIntegerField;
    cdsExtDataParName: TStringField;
    cdsExtDataVisible: TBooleanField;
    cdsExtDataDigVal: TFloatField;
    cdsExtDataStrVal: TStringField;
    cdsExtDataDateVal: TDateTimeField;
    lcFuncDistrib: TDBLookupComboBox;
    lcFormalDistrib: TDBLookupComboBox;
    cbCorrect: TComboBox;
    cbOperTypeIn: TComboBox;
    cbOperVid: TComboBox;
    cbKoef: TComboBox;
    Panel1: TPanel;
    Edit1: TEdit;
    cdsAP: TClientDataSet;
    cdsCur: TClientDataSet;
    dsFunc: TDataSource;
    elCurOper: TFormControlEditLink;
    elCurSys: TFormControlEditLink;
    cdsCurId_Currency: TAutoIncField;
    cdsCurName: TStringField;
    cdsCurShortName: TStringField;
    cdsCurISOCode: TStringField;
    cdsCurNumberCode: TStringField;
    cdsCurFastAccess: TBooleanField;
    cdsCurValue: TIntegerField;
    cdsCurRate: TFloatField;
    cdsCurAvForPay: TBooleanField;
    cdsCurBase: TBooleanField;
    cdsCurLastUpdated: TBytesField;
    cdsCurId_URL: TIntegerField;
    cdsAPid_AP_Oper: TAutoIncField;
    cdsAPid_ObjItem: TIntegerField;
    cdsAPid_AP_Oper_Dic: TIntegerField;
    cdsAPParamType: TIntegerField;
    cdsAPV_Str: TStringField;
    cdsAPV1: TFloatField;
    cdsAPExtID: TIntegerField;
    Button1: TButton;
    cdsAPOIid_ObjItem: TAutoIncField;
    cdsAPOIid_AP_Obj: TIntegerField;
    cdsAPOIOperVid: TIntegerField;
    cdsAPOIOperTypeIn: TBooleanField;
    cdsAPOICorrect: TBooleanField;
    cdsAPOIOpName: TStringField;
    cdsAPSumm: TClientDataSet;
    cdsAPSummid_ObjItemSumm: TAutoIncField;
    cdsAPSummid_ObjItem: TIntegerField;
    cdsAPSummisSys: TBooleanField;
    cdsAPSummSumm_Type: TIntegerField;
    cdsAPSummSumm_FormType: TIntegerField;
    cdsAPSummSumm_Koeff: TFloatField;
    cdsAPSummSumm_B: TFloatField;
    cdsAPSummSumm_Znak: TStringField;
    cdsAPSummSumm_Koeff2: TFloatField;
    cdsAPSummSumm_Znak2: TStringField;
    cdsAPSummSumm_Koeff3: TFloatField;
    cdsAPSummSumm_Znak3: TStringField;
    cdsAPSumminPercent: TBooleanField;
    cdsAPSummid_Currency: TIntegerField;
    cdsAPSummCurrency_Type: TIntegerField;
    cdsAPSummSumm_Formulas: TStringField;
    cdsAPSummSumm_UseSys: TBooleanField;
    sbCrnType: TComboBox;
    elCurTypeOper: TFormControlEditLink;
    elCurTypeSys: TFormControlEditLink;
    edObjName: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    cdsAPObj: TClientDataSet;
    cdsAPObjid_AP_Obj: TAutoIncField;
    cdsAPObjid_business: TIntegerField;
    cdsAPObjOperVid: TIntegerField;
    cdsAPObjOperTypeIn: TBooleanField;
    cdsAPObjCorrect: TBooleanField;
    cdsAPObjName: TStringField;
    cdsAPObjid_User: TIntegerField;
    cdsAPObjDateCreateAP: TDateTimeField;
    cdsAPObjDeleted: TBooleanField;
    lcCur: TRxDBLookupCombo;
    ActionList1: TActionList;
    aAddWare: TAction;
    aDelWare: TAction;
    aCalcSys: TAction;
    aSumm: TAction;
    aCalcAmount: TAction;
    aClearWare: TAction;
    aCalcOper: TAction;
    ilImage: TImageList;
    gbWare: TGroupBox;
    DBGridEh1: TDBGridEh;
    ToolBar3: TToolBar;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton2: TToolButton;
    Splitter1: TSplitter;
    cdsAPGoods: TClientDataSet;
    dsAPGoods: TDataSource;
    cdsAPGoodsid_AP_Goods: TAutoIncField;
    cdsAPGoodsid_ObjItem: TIntegerField;
    cdsAPGoodsid_Goods: TIntegerField;
    cdsAPGoodsAmount_Koeff: TBCDField;
    cdsAPGoodsAmount_Znak: TStringField;
    cdsAPGoodsAmount_B: TBCDField;
    cdsAPGoodsDisabled: TBooleanField;
    cdsAPGoodsid_Measure: TIntegerField;
    cdsAPGoodsSumm_UseSys: TBooleanField;
    cdsAPGoodsSumm_Type: TIntegerField;
    cdsAPGoodsSumm_Koeff: TBCDField;
    cdsAPGoodsSumm_B: TBCDField;
    cdsAPGoodsSumm_Znak: TStringField;
    cdsAPGoodsid_Currency: TIntegerField;
    cdsAPGoodsCurrency_Type: TIntegerField;
    cdsAPGoodsMeasureName: TStringField;
    cdsAPGoodsRealKoef: TFloatField;
    cdsAPGoodsWareName: TStringField;
    cdsAPGoodsNumb: TIntegerField;
    cdsAPGoodsPriceStr: TStringField;
    cdsAPGoodsAmountStr: TStringField;
    cdsAPSummdd: TBooleanField;
    cdsAPSummID_Main3: TIntegerField;
    cdsAPSummid_CnstItem: TIntegerField;
    cdsAPSummZnakCnstItem: TStringField;
    cdsAPSummK_CnstItem: TFloatField;
    procedure cbKoefKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1Change(Sender: TObject);
    procedure cbKoefChange(Sender: TObject);
    procedure AdvStringGrid1GetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure AdvStringGrid1EllipsClick(Sender: TObject; ACol,
      ARow: Integer; var S: String);
    procedure AdvStringGrid1CanAddRow(Sender: TObject;
      var CanAdd: Boolean);
    procedure AdvStringGrid1CanDeleteRow(Sender: TObject; ARow: Integer;
      var CanDelete: Boolean);
    procedure AdvStringGrid1CanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure elSetEditorFocus(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure elSetEditorProperties(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure elOTypeGEV(Sender: TObject; Grid: TAdvStringGrid;
      var AValue: String);
    procedure elLBSetEditorValue(Sender: TObject; Grid: TAdvStringGrid;
      AValue: String);
    procedure AdvStringGrid1GetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure elCorrGetEditorValue(Sender: TObject; Grid: TAdvStringGrid;
      var AValue: String);
    procedure elCorrSEV(Sender: TObject; Grid: TAdvStringGrid;
      AValue: String);
    procedure elOperVidSEV(Sender: TObject;
      Grid: TAdvStringGrid; AValue: String);
    procedure elOperVidGEV(Sender: TObject;
      Grid: TAdvStringGrid; var AValue: String);
    procedure elOTypeSEV(Sender: TObject; Grid: TAdvStringGrid;
      AValue: String);
    procedure cbOperTypeInKeyPress(Sender: TObject; var Key: Char);
    procedure elCorGEV(Sender: TObject; Grid: TAdvStringGrid;
      var AValue: String);
    procedure elKoeffGEV(Sender: TObject; Grid: TAdvStringGrid;
      var AValue: String);
    procedure elKoeffSEV(Sender: TObject; Grid: TAdvStringGrid;
      AValue: String);
    procedure elFormalGEV(Sender: TObject; Grid: TAdvStringGrid;
      var AValue: String);
    procedure elFuncGEV(Sender: TObject; Grid: TAdvStringGrid;
      var AValue: String);
    procedure elFormalSEV(Sender: TObject; Grid: TAdvStringGrid;
      AValue: String);
    procedure elFuncSEV(Sender: TObject; Grid: TAdvStringGrid;
      AValue: String);
    procedure AdvStringGrid1CellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: String; var Valid: Boolean);
    procedure AdvStringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure AdvStringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure elCurOperGEV(Sender: TObject; Grid: TAdvStringGrid;
      var AValue: String);
    procedure elCurOperSEV(Sender: TObject; Grid: TAdvStringGrid;
      AValue: String);
    procedure elCurSysGEV(Sender: TObject;
      Grid: TAdvStringGrid; var AValue: String);
    procedure elCurSysSEV(Sender: TObject;
      Grid: TAdvStringGrid; AValue: String);
    procedure Button1Click(Sender: TObject);
    procedure elCurTypeOperGEV(Sender: TObject;
      Grid: TAdvStringGrid; var AValue: String);
    procedure elCurTypeOperSEV(Sender: TObject;
      Grid: TAdvStringGrid; AValue: String);
    procedure elCurTypeSysGEV(Sender: TObject;
      Grid: TAdvStringGrid; var AValue: String);
    procedure elCurTypeSysSEV(Sender: TObject;
      Grid: TAdvStringGrid; AValue: String);
    procedure elCurTypeOperSetEditorProperties(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure BitBtn1Click(Sender: TObject);
    procedure aAddWareExecute(Sender: TObject);
    procedure aDelWareExecute(Sender: TObject);
    procedure aClearWareExecute(Sender: TObject);
    procedure cdsAPGoodsCalcFields(DataSet: TDataSet);
    procedure dsAPGoodsDataChange(Sender: TObject; Field: TField);
    procedure DBGridEh1EditButtonClick(Sender: TObject);
  private
    Fid_ObjItem, Fid_AP_Obj, Fid_business : integer;
    FNeedColor, FReadOnly : boolean;
    AParamAPOper : TParamAPOper;
    FLockPaintCount, FMsg : integer;
    FOldWinProc : TWndMethod;
    function GetKoefVal: integer;
    procedure SetKoefVal(const Value: integer);
    procedure cbKoefDoChange;
    property KoefVal : integer read GetKoefVal write SetKoefVal;
    procedure PaintGrid;
    function GetCode(ARow : integer): TRowType;
    function GetIndex(SL: TStrings; V: Variant): integer;
    function GetVal(SL: TStrings; Index: integer): Variant;
    function GetParamType(ARow: integer): TParamType;
    procedure SetRowByCode(ARowType: TRowType);
    function AP_OperAdd(ExtID, id_ObjItem, ParamType: Integer; V_Str, V1: OleVariant): Integer;
    function GetNameByID(SL: TStrings; V: Variant): String;
    function GetCDSNameByID(CDS : TClientDataSet; AKeyName, AName : String; ID: Variant): Variant;
    function VarTypeToParamType(AVarType: Variant): TParamType;
    function PTToInt(PT: TParamType): integer;
    function IntToPT(PT: integer): TParamType;
    function AP_ObjItemSummAdd(id_ObjItem: Integer; isSys: WordBool;
      Summ_Type, Summ_FormType, Summ_Koeff, Summ_B, Summ_Znak, Summ_Koeff2,
      Summ_Znak2, Summ_Koeff3, Summ_Znak3: OleVariant; inPercent: WordBool;
      Id_Currency: OleVariant; Currency_Type: Integer;
      SumOper_Formulas, Summ_UseSys: OleVariant): Integer;
    function AP_ObjItemSummAdd_int(id_ObjItem: Integer; AVal_Sum: TVal_Sum): Integer;
    procedure AddWare(AEdit : boolean);
  public
    function ConfirmChanges : boolean;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure Initialize(id_ObjItem, id_AP_Obj, id_business : integer; OperVid, ACopy : Variant; AReadOnly : boolean);

    property id_ObjItem : integer read Fid_ObjItem;
  end;

implementation

uses uDM, uFormsAPI_Admin, uFormsAPI_Users, uFormApi_CA, uUnivOper_v2,
  uRepSelector, uComment_ext, uUnivSelector, uInputBoxDigit, uCASelector,
  uInputSumm, foMyFuncAdvStrGrigExcel, uAPListSelector, uAPOperWareAmount;

{$R *.DFM}
 {
procedure ParseCODE(ACode : integer; var AType: integer; var ANum: integer);
begin
  AType := ABS(ACode) and $00FF;
  ANum := ABS(ACode) shr 8;
end;  }

procedure RebildApWareData(CDS: TClientDataSet);
var
    RxMemoryData1: TRxMemoryData;
    i : integer;
    AField : TField;
    ABeforeInsert: TDataSetNotifyEvent;
begin
  if not CDS.IsEmpty then
  begin                                                        
    RxMemoryData1 := TRxMemoryData.Create(nil);
    try
      CDS.First;
      RxMemoryData1.FieldDefs.Add('id_Goods', ftInteger);
      RxMemoryData1.FieldDefs.Add('Amount_Koeff', ftFloat);
      RxMemoryData1.FieldDefs.Add('Amount_Znak', ftString, 3);
      RxMemoryData1.FieldDefs.Add('Amount_B', ftFloat);
      RxMemoryData1.FieldDefs.Add('id_Measure', ftInteger);
      RxMemoryData1.FieldDefs.Add('MeasureName', ftString, 100);
      RxMemoryData1.FieldDefs.Add('WareName', ftString, 255);


      RxMemoryData1.FieldDefs.Add('Summ_UseSys', ftBoolean);
      RxMemoryData1.FieldDefs.Add('Summ_Type', ftInteger);
      RxMemoryData1.FieldDefs.Add('Summ_Koeff', ftFloat);
      RxMemoryData1.FieldDefs.Add('Summ_Znak', ftString, 3);
      RxMemoryData1.FieldDefs.Add('Summ_B', ftFloat);


      RxMemoryData1.FieldDefs.Add('id_Currency', ftInteger);
      RxMemoryData1.FieldDefs.Add('Currency_Type', ftInteger);
      RxMemoryData1.FieldDefs.Add('RealKoef', ftFloat);

      RxMemoryData1.LoadFromDataSet(CDS, CDS.RecordCount, lmAppend);
//      CDS.EmptyDataSet;
      CDS.Close;
      CDS.Params.ParamByName('@id_ObjItem').Value := -1;
      CDS.Open;
      
      with RxMemoryData1 do
      begin
        First;
        while not Eof do
        begin
          CDS.Append;
          for i := 0 to Fields.Count - 1 do
          begin
            AField := CDS.FindField(Fields[i].FieldName);
            if (AField <> nil) and (AField.CanModify) and (not AField.ReadOnly) then
              AField.Value := Fields[i].Value;
          end;
          CDS.Post;
          Next;
        end;
      end;
      RxMemoryData1.Close;
    finally
      RxMemoryData1.Free;
    end;
  end;
end;

function ToXXX(ADataType, ANumPrm : integer) : integer;
begin
  result := ADataType * $100 + ANumPrm;
end;

procedure FromXXX(ACode : integer; var ADataType, ANumPrm : integer);
begin
  ADataType := ABS(ACode) shr 8;
  ANumPrm := ABS(ACode) and $00FF;
 { ADataType := ABS(ACode) and $00FF;
  ANumPrm := (ABS(ACode) - ADataType) div $100;      }
end;

{ TfAPOper }


constructor TfAPOper.Create(AOwner: TComponent);
var
    Reg : TRegistry;
    FullRegPathName : String;
    V : TVal_obj;
begin
  inherited;              
//  FOldWinProc := AdvStringGrid1.WindowProc;
//  AdvStringGrid1.WindowProc := NewWindowProc;

  FLockPaintCount := 0;
  AParamAPOper := TParamAPOper.Create;
  if Owner is TCustomForm then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      FullRegPathName := SRegPath + '\' + ClassName + TCustomForm(Owner).ClassName;
      LoadGridSettingsFromRegistryTMS(AdvStringGrid1, FullRegPathName + '\grid');
      LoadSplitterSettingsFromRegistry(Splitter1, FullRegPathName + '\Splitter1');
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  FNeedColor := false;

  with cbOperVid do
  begin
    Items.Clear;
 //   Items.AddObject('', TVal_obj.Create(NULL));
    Items.AddObject('Складская', TVal_obj.Create(1));
    Items.AddObject('Финансовая', TVal_obj.Create(2));
    Items.AddObject('Взаимозачетная', TVal_obj.Create(4));
  end;
  
  with cbCorrect do
  begin
    Items.Clear;
 //   Items.AddObject('', TVal_obj.Create(NULL));
    Items.AddObject('Да', TVal_obj.Create(true));
    Items.AddObject('Нет', TVal_obj.Create(false));
  end;

  with cbOperTypeIn do
  begin
    Items.Clear;
//    Items.AddObject('', TVal_obj.Create(NULL));
    Items.AddObject('Приходная операция', TVal_obj.Create(true));
    Items.AddObject('Расходная операция', TVal_obj.Create(false));
  end;
  
  with cbKoef do
  begin
    Items.Clear;
 //   Items.AddObject('', TVal_obj.Create(NULL));
    Items.AddObject('Расчет с контрагентом', TVal_obj.Create(0));
    Items.AddObject('Прибыль', TVal_obj.Create(1));
    Items.AddObject('Затрата', TVal_obj.Create(-1));
  end;

  with sbCrnType do
  begin
    Items.Clear;
 //   Items.AddObject('', TVal_obj.Create(NULL));
    Items.AddObject('пусто', TVal_obj.Create(ptNull));
//    Items.AddObject('как в операции', TVal_obj.Create(1));
    Items.AddObject('валюта операции', TVal_obj.Create(ptCrnOper));
    Items.AddObject('валюта зачета', TVal_obj.Create(ptCrnSys));
    Items.AddObject('указать', TVal_obj.Create(ptSet));
  end;



  with AdvStringGrid1.Columns[cnsParamTypeCol].ComboItems do
  begin
    Clear;
    AddObject('пусто', TVal_obj.Create(ptNull));
    AddObject('как в операции', TVal_obj.Create(ptLikeOper));
    AddObject('указать', TVal_obj.Create(ptSet));
 //1014   AddObject('запросить', TVal_obj.Create(ptInput));
  end;
end;

destructor TfAPOper.Destroy;
  procedure ClearCB(SL : TStrings);
  var Obj : TObject;
  begin
    with SL do
      while Count > 0 do
      begin
        Obj := Objects[Count - 1];
        if Obj <> nil then
          Obj.Free;
        Delete(Count - 1);
      end;
    end;
var Reg : TRegistry;
    FullRegPathName : String;
begin
//  AParamAPOper := TParamAPOper.Create;
 { ClearCB(cbOperVid.Items);
  ClearCB(cbOperTypeIn.Items);
  ClearCB(cbCorrect.Items); }

  AParamAPOper.Free;
  if Owner is TCustomForm then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;

      FullRegPathName := SRegPath + '\' + ClassName + TCustomForm(Owner).ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        SaveGridSettingsToRegistryTMS(AdvStringGrid1,  FullRegPathName + '\grid');
        SaveSplitterSettingsFromRegistry(Splitter1, FullRegPathName + '\Splitter1');
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  inherited;
end;




procedure TfAPOper.cbKoefKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    cbKoef.ItemIndex := 0;
  cbKoefDoChange;
end;

function TfAPOper.GetKoefVal: integer;
begin
  case cbKoef.ItemIndex of
    0 : Result := 0;
    1 : Result := 1;
    2 : Result := -1;
    else
      Result := 0;
  end;
end;

procedure TfAPOper.SetKoefVal(const Value: integer);
begin
  case Value of
    0 : cbKoef.ItemIndex := 0;
    1 : cbKoef.ItemIndex := 1;
    -1 : cbKoef.ItemIndex := 2;
    else
      cbKoef.ItemIndex := 0;  
  end;
  cbKoefDoChange;
end;

procedure TfAPOper.DBEdit1Change(Sender: TObject);
begin
 { if FID_OperFin <> -1 then
  begin
    if THackControl(Sender).Text = '' then
      THackControl(Sender).Color := clRed
    else
      THackControl(Sender).Color := clWindow;
  end;  }
end;


procedure TfAPOper.cbKoefDoChange;
begin
  lcFormalDistrib.Enabled := (cbKoef.ItemIndex > 0);
  lcFuncDistrib.Enabled := (cbKoef.ItemIndex > 0);
end;

procedure TfAPOper.cbKoefChange(Sender: TObject);
begin
  cbKoefDoChange;
end;

procedure TfAPOper.AdvStringGrid1GetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
var Code : TRowType;
    X : integer;
begin
  X := integer(AdvStringGrid1.Objects[1, ARow]);
  if X > 0 then
    Code := TRowType(X)
  else
    Code := cnsRow_None;
  if (Code in [cnsRow_OType, cnsRow_OperVid, cnsRow_Corr]) and (ACol=cnsParamTypeCol) then
    ACol := cnsVal;
  case ACol of
    cnsNameCol :
    begin
    //  aEditor := edCustom;
    end;
    cnsParamTypeCol :
    begin
      if Code = cnsRow_CurOper then
        TAdvStringGrid(Sender).EditLink := elCurTypeOper
      else
        if Code = cnsRow_CurSys then
          TAdvStringGrid(Sender).EditLink := elCurTypeSys
        else
          if not (Code in [cnsRow_OType, cnsRow_OperVid, cnsRow_Corr]) then aEditor := edComboList;
    end;
    cnsVal :
    begin                                                                      
      case Code of
        cnsRow_SrcName, cnsRow_DestName, cnsRow_CA : aEditor := edEditBtn;
        cnsRow_OType : TAdvStringGrid(Sender).EditLink := elOType;
        cnsRow_Corr : TAdvStringGrid(Sender).EditLink := elCorr;
        cnsRow_OperVid : TAdvStringGrid(Sender).EditLink := elOperVid;
        cnsRow_Koeff : TAdvStringGrid(Sender).EditLink := elKoef;
        cnsRow_FormalDistribName : TAdvStringGrid(Sender).EditLink := elFormal;
        cnsRow_FuncDistribName : TAdvStringGrid(Sender).EditLink := elFunc;
        cnsRow_Imp_PayBasic, cnsRow_AccInv_PayAssignment,
        cnsRow_Contract, cnsRow_Comment : AEditor := edNormal;
        
        cnsRow_SummOper, cnsRow_SummSys : AEditor := edEditBtn;

        cnsRow_CurOper : TAdvStringGrid(Sender).EditLink := elCurOper;
        cnsRow_CurSys : TAdvStringGrid(Sender).EditLink := elCurSys;
        cnsRow_None :
        begin
          if X < 0 then
          begin
            X := ABS(X) shr 8;
            case X of
              1 : AEditor := edFloat;
              2 : AEditor := edNormal;
              3 : AEditor := edDateEdit;
            end;
          end;
        end;
      end;
    end;
  end;   
  if Assigned(TAdvStringGrid(Sender).EditLink) then
    aEditor := edCustom;
end;

function TfAPOper.GetCode(ARow : integer) : TRowType;
var X : integer;
begin
  X := integer(AdvStringGrid1.Objects[1, ARow]);
  if X < 0 then
    Result := cnsRow_None
  else
    Result := TRowType(X);
end;


procedure TfAPOper.SetRowByCode(ARowType : TRowType);
var i : integer;
begin
  for i := 0 to AdvStringGrid1.RowCount - 1 do
  begin
    if TRowType(AdvStringGrid1.Objects[1, i]) = ARowType then
    begin
      AdvStringGrid1.Row := i;
      Break;
    end;
  end;
end;

function TfAPOper.VarTypeToParamType(AVarType : Variant) : TParamType;
begin
  if AVarType = Null then
    Result := ptOther
  else
    case AVarType of
      varNull : Result := ptNull;
      varError : Result := ptLikeOper;
      varUnknown : Result := ptSet;
      varDispatch : Result := ptInput;
    end;
end;

procedure TfAPOper.PaintGrid;
  procedure CellVal_Adv(ACol, ARow : integer; AName : String; Code : integer);
  begin
    if AdvStringGrid1.RowCount <= ARow then
      AdvStringGrid1.RowCount := ARow + 1;
    AdvStringGrid1.Objects[ACol, ARow] := Pointer(Code);
    AdvStringGrid1.Cells[ACol, ARow] := AName;
  end;
  procedure CellVal(ACol, ARow : integer; AName : Variant; Code : TRowType = cnsRow_None);
  begin
    CellVal_Adv(ACol, ARow, VarToStr(AName), ORD(Code));
  end;
  procedure CellVal_PT(ARow : integer; PT : TParamType);
  var i : integer;
      S : String;
  begin
    i := GetIndex(AdvStringGrid1.Columns[cnsParamTypeCol].ComboItems, PT);
    if i > -1 then
    begin
      S := AdvStringGrid1.Columns[cnsParamTypeCol].ComboItems[i];
      CellVal(cnsParamTypeCol, ARow, S);
    end;
  end;
var Row, X : integer;
    CCount, OldCol, oldRow : integer;
    S : String; 
begin
  inc(FLockPaintCount);
  try
    if FLockPaintCount > 1 then
      Exit;
    OldCol := AdvStringGrid1.Col;
    oldRow := AdvStringGrid1.Row;
  
    AdvStringGrid1.Clear;
    AdvStringGrid1.RowCount := 2;
    CCount := 4;
    AdvStringGrid1.ColCount := CCount;

    AdvStringGrid1.Cells[cnsNameCol, 0] := 'Параметр';
//    AdvStringGrid1.Cells[cnsParamTypeCol, 0] := '';
    AdvStringGrid1.MergeCells(cnsParamTypeCol, 0, CCount - cnsParamTypeCol, 1);
    AdvStringGrid1.Cells[cnsVal, 0] := 'Значение';
    AdvStringGrid1.Alignments[cnsParamTypeCol, 0] := taCenter;

    AdvStringGrid1.DefaultRowHeight := 18;
    AdvStringGrid1.FixedRowHeight := 52;

    AdvStringGrid1.FontStyles[0, 0] := [fsBold];
    AdvStringGrid1.FontStyles[1, 0] := [fsBold];
    AdvStringGrid1.FontStyles[2, 0] := [fsBold];

    Row := 1;
    CellVal(cnsNameCol, Row, 'Бизнес', cnsRow_Bsn);
    AdvStringGrid1.MergeCells(cnsParamTypeCol, Row, CCount - cnsParamTypeCol, 1);
    CellVal(cnsVal, Row, AParamAPOper.BsnName);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Вид операции', cnsRow_OperVid);
    AdvStringGrid1.MergeCells(cnsParamTypeCol, Row, CCount - cnsParamTypeCol, 1);
    CellVal(cnsVal, Row, AParamAPOper.OperVidName);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Приход/расход', cnsRow_OType);
    AdvStringGrid1.MergeCells(cnsParamTypeCol, Row, CCount - cnsParamTypeCol, 1);
    CellVal(cnsVal, Row, AParamAPOper.OperTypeInName);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Коррекционная', cnsRow_Corr);
    AdvStringGrid1.MergeCells(cnsParamTypeCol, Row, CCount - cnsParamTypeCol, 1);
    CellVal(cnsVal, Row, AParamAPOper.CorrectName);

    if AParamAPOper.OperVid <> 4 then
    begin
      inc(Row);
      CellVal(cnsNameCol, Row, 'Свой объект', cnsRow_SrcName);
      CellVal_PT(Row, AParamAPOper.SrcParamType);
      CellVal(cnsVal, Row, AParamAPOper.SrcPlaceName);
    end;
    
    if AParamAPOper.OperVid <> 4 then
    begin
      S := 'Чужой объект';
    end
    else
      S := 'Представитель';
  
    inc(Row);
    CellVal(cnsNameCol, Row, S, cnsRow_DestName);
    CellVal_PT(Row, AParamAPOper.DestParamType);
    CellVal(cnsVal, Row, AParamAPOper.DestPlaceName);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Контрагент', cnsRow_CA);
    AdvStringGrid1.MergeCells(cnsParamTypeCol, Row, CCount - cnsParamTypeCol, 1);
    CellVal_PT(Row, AParamAPOper.Val_OperByExtID[xxx_id_ContrAgent].ParamType);
    CellVal(cnsVal, Row, AParamAPOper.ContrAgentName);

    gbWare.Visible := AParamAPOper.OperVid = 1;
    if gbWare.Visible then
    begin
      if not cdsAPGoods.Active then
      begin
        cdsAPGoods.Params.ParamByName('@id_ObjItem').Value := Fid_ObjItem;
        cdsAPGoods.Open;
      end;
    end;
    
    if AParamAPOper.OperVid <> 4 then
    begin
      inc(Row);
      CellVal(cnsNameCol, Row, 'Суть операции', cnsRow_Koeff);
      CellVal_PT(Row, AParamAPOper.Val_OperByExtID[xxx_Koeff].ParamType);
      CellVal(cnsVal, Row, AParamAPOper.KoeffName);
    end;

    inc(Row);
    CellVal(cnsNameCol, Row, 'Формальное распределение', cnsRow_FormalDistribName);
    CellVal_PT(Row, AParamAPOper.Val_OperByExtID[xxx_id_FormalDistrib].ParamType);
    CellVal(cnsVal, Row, AParamAPOper.FormalDistribName);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Функциональное распределение', cnsRow_FuncDistribName);
    CellVal_PT(Row, AParamAPOper.Val_OperByExtID[xxx_id_FuncDistrib].ParamType);
    CellVal(cnsVal, Row, AParamAPOper.FuncDistribName);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Осн. платежа/накладная', cnsRow_Imp_PayBasic);
    CellVal_PT(Row, AParamAPOper.Val_OperByExtID[xxx_Imp_PayBasic].ParamType);
    CellVal(cnsVal, Row, AParamAPOper.Val_OperByExtID[xxx_Imp_PayBasic].Val);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Пл. поручение/Счет фактура', cnsRow_AccInv_PayAssignment);
    CellVal_PT(Row, AParamAPOper.Val_OperByExtID[xxx_AccInv_PayAssignment].ParamType);
    CellVal(cnsVal, Row, AParamAPOper.Val_OperByExtID[xxx_AccInv_PayAssignment].Val);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Договор', cnsRow_Contract);
    CellVal_PT(Row, AParamAPOper.Val_OperByExtID[xxx_Contract].ParamType);
    CellVal(cnsVal, Row, AParamAPOper.Val_OperByExtID[xxx_Contract].Val);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Комментарий', cnsRow_Comment);
    CellVal_PT(Row, AParamAPOper.Val_OperByExtID[xxx_OpComment].ParamType);
    CellVal(cnsVal, Row, AParamAPOper.Val_OperByExtID[xxx_OpComment].Val);

    if AParamAPOper.OperVid <> 1 then
    begin
      inc(Row);
      CellVal(cnsNameCol, Row, 'Сумма операции', cnsRow_SummOper);
      CellVal_PT(Row, AParamAPOper.SumOper.ParamType);
      CellVal(cnsVal, Row, AParamAPOper.SumOper.GetStr);

      inc(Row);
      CellVal(cnsNameCol, Row, 'Валюта операции', cnsRow_CurOper);
    //  CellVal_PT(Row, AParamAPOper.SumOper.ParamTypeCurrency);
      CellVal(cnsVal, Row, AParamAPOper.SumOper.CurName);
      elCurTypeOperSEV(elCurTypeOper, nil, '');
      CellVal(cnsParamTypeCol, Row, sbCrnType.Text);

      if AParamAPOper.OperVid <> 4 then
      begin
        inc(Row);
        CellVal(cnsNameCol, Row, 'Сумма зачета', cnsRow_SummSys);
        CellVal_PT(Row, AParamAPOper.SumSys.ParamType);
        CellVal(cnsVal, Row, AParamAPOper.SumSys.GetStr);

        inc(Row);
        CellVal(cnsNameCol, Row, 'Валюта зачета', cnsRow_CurSys);
      //  CellVal_PT(Row, AParamAPOper.SumSys.ParamTypeCurrency);
        CellVal(cnsVal, Row, AParamAPOper.SumSys.CurName);
        elCurTypeSysSEV(elCurTypeSys, nil, '');
        CellVal(cnsParamTypeCol, Row, sbCrnType.Text);
      end;
    end;
//***********************************************************************
    inc(Row);
    AdvStringGrid1.MergeCells(cnsNameCol - 0, Row, CCount - cnsNameCol, 1);
    CellVal(cnsNameCol, Row, 'Дополнительные параметры');
    AdvStringGrid1.FontStyles[cnsNameCol - 0, Row] := [fsBold];
    AdvStringGrid1.Alignments[cnsNameCol, Row] := taCenter;
    AdvStringGrid1.Colors[cnsNameCol - 0, Row] := clBtnFace;

    with cdsExtData do
    begin
      First;
      while not Eof do
      begin
        inc(Row);
        X := ToXXX(cdsExtDataType.AsInteger, cdsExtDataNumPrm.AsInteger);
        CellVal_Adv(cnsNameCol, Row, cdsExtData.FieldByName('ParName').AsString, -X);
        CellVal_PT(Row, AParamAPOper.Val_OperByExtID[-X].ParamType);
        CellVal(cnsVal, Row, AParamAPOper.Val_OperByExtID[-X].Val);

        Next;
      end;
    end;

   { inc(Row);
    CellVal(1, Row, 'Комментарий2', cnsRow_Comment);
    AdvStringGrid1.SplitCells(2, Row);  }
    AdvStringGrid1.Col := OldCol;
    AdvStringGrid1.Row := oldRow;

  finally
    Dec(FLockPaintCount);
  end;
end;

procedure TfAPOper.AdvStringGrid1EllipsClick(Sender: TObject; ACol,
  ARow: Integer; var S: String);
var Code : TRowType;
    ASelectedObj : TSelectedObj;
    AEObjTypes: TEObjTypes;
    K, B, Znak, Formulas : Variant;
    AVal_Oper : TVal_Oper;
    AVal_Sum : TVal_Sum;
    Str : String;
    ASummData : TSummData;
    ANAme, Val: OleVariant;
begin
  Code := GetCode(ARow);
  case ACol of
    cnsNameCol :
    begin

    end;
    cnsVal :
    begin
      case Code of
        cnsRow_SummOper, cnsRow_SummSys :
        begin
          if Code = cnsRow_SummOper then
          begin
            AVal_Sum := AParamAPOper.SumOper;
            Str := 'Сумма операции';
          end                                         
          else
          begin
            AVal_Sum := AParamAPOper.SumSys;
            Str := 'Сумма зачета';
          end;
          ASummData.FormType := AVal_Sum.FormType;
          ASummData.Koeff := AVal_Sum.Koeff;
          ASummData.Val := AVal_Sum.Val;
          ASummData.Znak := AVal_Sum.Znak;
          ASummData.Koeff2 := AVal_Sum.Koeff2;
          ASummData.Znak2 := AVal_Sum.Znak2;
          ASummData.Koeff3 := AVal_Sum.Koeff3;
          ASummData.Znak3 := AVal_Sum.Znak3;
          ASummData.inPercent := AVal_Sum.inPercent;
          ASummData.Formulas := AVal_Sum.Formulas;
          ASummData.Summ_UseSys := AVal_Sum.Summ_UseSys;
          ASummData.id_Business := Fid_business;

          ASummData.id_CnstItem := AVal_Sum.id_CnstItem;
          ASummData.ZnakCnstItem := AVal_Sum.ZnakCnstItem;
          ASummData.K_CnstItem := AVal_Sum.K_CnstItem;

          if ShowInputSumm(Str, ASummData, AVal_Sum = AParamAPOper.SumSys) then
          begin
            AVal_Sum.id_CnstItem := ASummData.id_CnstItem;
            AVal_Sum.ZnakCnstItem := ASummData.ZnakCnstItem;
            AVal_Sum.K_CnstItem := ASummData.K_CnstItem;


            AVal_Sum.FormType := ASummData.FormType;
            AVal_Sum.Koeff := ASummData.Koeff;
            AVal_Sum.Val := ASummData.Val;
            AVal_Sum.Znak := ASummData.Znak;
            AVal_Sum.Koeff2 := ASummData.Koeff2;
            AVal_Sum.Znak2 := ASummData.Znak2;
            AVal_Sum.Koeff3 := ASummData.Koeff3;
            AVal_Sum.Znak3 := ASummData.Znak3;
            AVal_Sum.inPercent := ASummData.inPercent;
            AVal_Sum.Formulas := ASummData.Formulas;
            AVal_Sum.Summ_UseSys := ASummData.Summ_UseSys;

            if AVal_Sum.id_CnstItem > 0 then
            begin
              DM.rsCA.AppServer.AP_CnstGetProp(AVal_Sum.id_CnstItem, ANAme, Val);
              AVal_Sum.ParamName := ANAme;
            end;
          end;
        end;
        cnsRow_SrcName, cnsRow_DestName :
        begin
          if AParamAPOper.OperVid = Null then
          begin
            SetRowByCode(cnsRow_OperVid);
            MessageBox(Handle, 'Не выбран вид операции', 'Сначала выберите вид операции', MB_OK + MB_ICONERROR);
            Exit;
          end;
          if Code = cnsRow_SrcName then
            AParamAPOper.GetSrcInfo(ASelectedObj.ObjType, ASelectedObj.ID)
          else
            AParamAPOper.GetDestInfo(ASelectedObj.ObjType, ASelectedObj.ID);

          case AParamAPOper.OperVid of
            1 : AEObjTypes :=[eotWH, eotManuf];
            2 : AEObjTypes :=[eotFin];
            4 : AEObjTypes :=[];
          end;
          if Code = cnsRow_DestName then
            AEObjTypes := AEObjTypes + [eotRepr];
          if SelectObjUnBsn(Owner, AParamAPOper.id_business, ASelectedObj, 0, AEObjTypes) then
          begin
            if Code = cnsRow_SrcName then
            begin
              AParamAPOper.SrcClear;
              AParamAPOper.SrcPlaceName := VarToStr(ASelectedObj.Name);
              case ASelectedObj.ObjType of
                eotFin : AParamAPOper.Val_OperByExtID[xxx_Src_id_Acc].Val := ASelectedObj.ID;
                eotWH : AParamAPOper.Val_OperByExtID[xxx_Src_id_WareHouse].Val := ASelectedObj.ID;
                eotManuf : AParamAPOper.Val_OperByExtID[xxx_Src_id_Manufact].Val := ASelectedObj.ID;
              else
                raise Exception.Create('Неверный тип возвращаемого значения');
              end;
            end
            else
            begin
              AParamAPOper.DestClear;
              case ASelectedObj.ObjType of
                eotFin : AParamAPOper.Val_OperByExtID[xxx_Dest_id_Acc].Val := ASelectedObj.ID;
                eotWH : AParamAPOper.Val_OperByExtID[xxx_Dest_id_WareHouse].Val := ASelectedObj.ID;
                eotManuf : AParamAPOper.Val_OperByExtID[xxx_Dest_id_Manufact].Val := ASelectedObj.ID;
                eotRepr : AParamAPOper.Val_OperByExtID[xxx_Dest_id_Repr].Val := ASelectedObj.ID;
              else
                raise Exception.Create('Неверный тип возвращаемого значения');
              end;
              AParamAPOper.DestPlaceName := VarToStr(ASelectedObj.Name);
              AParamAPOper.ContrAgentName := VarToStr(ASelectedObj.CA_Name);
            end;
          end;
        end;
      end;
      PaintGrid;
    end;
  end;  
end;

procedure TfAPOper.AdvStringGrid1CanAddRow(Sender: TObject;
  var CanAdd: Boolean);
begin
  CanAdd := false;
end;

procedure TfAPOper.AdvStringGrid1CanDeleteRow(Sender: TObject;
  ARow: Integer; var CanDelete: Boolean);
begin
  CanDelete := false;
end;

procedure TfAPOper.AdvStringGrid1CanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
var Code : TRowType;
    PT : TParamType;
begin
  Code := GetCode(ARow);
  PT := GetParamType(ARow);
  CanEdit := 
//  ((Code in [cnsRow_OType, cnsRow_OperVid, cnsRow_Corr]) and (ACol = cnsVal)) or
  ((Code in [cnsRow_OType, cnsRow_OperVid, cnsRow_Corr]) and (ACol = cnsParamTypeCol)) or
  (not (Code in [cnsRow_OType, cnsRow_OperVid, cnsRow_Corr]) and (ACol = cnsParamTypeCol))
   or
 ((ACol = cnsVal) and (PT = ptSet) )
 and not ((AParamAPOper.OperVid = 4) and (Code = cnsRow_SrcName));
 CanEdit := (Code <> cnsRow_CA) and CanEdit;
end;

procedure TfAPOper.elSetEditorFocus(Sender: TObject;
  Grid: TAdvStringGrid; AControl: TWinControl);
begin
  AControl.SetFocus;
end;

procedure TfAPOper.elSetEditorProperties(Sender: TObject;
  Grid: TAdvStringGrid; AControl: TWinControl);
begin
  AControl.Height := 200;
//  AControl.Width := 400;
end;

procedure TfAPOper.ComboBox1DropDown(Sender: TObject);
begin
  tag := 0;
end;

procedure TfAPOper.elLBSetEditorValue(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
var N : integer;
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
  begin
    N := TComboBox(TFormControlEditLink(Sender).Control).Items.IndexOf(AValue);
    TComboBox(TFormControlEditLink(Sender).Control).ItemIndex := N;
  end
  else
  begin
 {   TRxDBLookupCombo(TFormControlEditLink(Sender).Control).Text
    if TFormControlEditLink(Sender).Control is TRxDBLookupCombo then
      AValue := TRxDBLookupCombo(TFormControlEditLink(Sender).Control).DisplayValue; }
  end;
end;

procedure TfAPOper.AdvStringGrid1GetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
var Code : TRowType;
    CanEdit : boolean;
    PT : TParamType;
begin
  if not (gdSelected in AState) then
  begin
    Code := GetCode(ARow);
    PT := GetParamType(ARow);
    CanEdit := (ACol = cnsNameCol) or
    (Code in [cnsRow_Bsn, cnsRow_OType, cnsRow_OperVid, cnsRow_Corr]) or
    (not (Code in [cnsRow_Bsn, cnsRow_OType, cnsRow_OperVid, cnsRow_Corr]) and (ACol = cnsParamTypeCol))
     or
   ((ACol = cnsVal) and (PT = ptSet))
   and not ((AParamAPOper.OperVid = 4) and (Code = cnsRow_SrcName));

   CanEdit := (Code = cnsRow_CA) or CanEdit;

   if not CanEdit then
      AFont.Color := clGrayText;
  end
  else
    AFont.Color := clWindow;
end;


procedure TfAPOper.Initialize(id_ObjItem, id_AP_Obj, id_business : integer; OperVid, ACopy : Variant; AReadOnly: boolean);
var V : Variant;
    isOwn: WordBool; id_CAGroup, id_Ca: OleVariant;
    PT : TParamType;
    Obj : TVal_Oper;
    X, E : integer;
    AVal_Sum : TVal_Sum;
    ANAme, AVal: OleVariant;
begin
  Fid_AP_Obj := id_AP_Obj;
  Fid_ObjItem := id_ObjItem;
  Fid_business := id_business;
  AParamAPOper.id_business := Fid_business;
  if Fid_AP_Obj > 0 then
  begin
    with cdsAPObj do
    begin
      Close;
      Params.ParamByName('@id_AP_Obj').Value := Fid_AP_Obj;
      Open;
      edObjName.Text := cdsAPObjName.Value;
    end;
  end;

  with cdsFormal do
  begin
    Close;
    Params.ParamByName('@id_Bsn').Value := Fid_business;
    Open;
  end;
  
  with cdsFunc do
  begin
    Close;
    Params.ParamByName('@id_Bsn').Value := Fid_business;
    Open;
  end;

  with cdsExtData do
  begin
    Close;
    Params.ParamByName('@id_Oper').Value := Null;
    Params.ParamByName('@id_business').Value := Fid_business;
    Open;
  end;

  with cdsCur do
  begin
    Close;
    Params.ParamByName('@FastAccess').Value := Null;
    Params.ParamByName('@AvForPay').Value := true;
    Params.ParamByName('@id_Bsn').Value := Fid_business;
    Open;
  end;


  if Fid_ObjItem > 0 then
  begin
    with cdsAPOI do
    begin
      Close;
      Params.ParamByName('@id_ObjItem').Value := Fid_ObjItem;
      Open;
      AParamAPOper.id_business := Fid_business;

      AParamAPOper.OperVid := cdsAPOIOperVid.AsVariant;
      AParamAPOper.OperVidName := GetNameByID(cbOperVid.Items, AParamAPOper.OperVid);

      AParamAPOper.OperTypeIn := cdsAPOIOperTypeIn.AsVariant;
      AParamAPOper.OperTypeInName := GetNameByID(cbOperTypeIn.Items, AParamAPOper.OperTypeIn);

      AParamAPOper.Correct := cdsAPOICorrect.AsVariant;
      AParamAPOper.CorrectName := GetNameByID(cbCorrect.Items, AParamAPOper.Correct);

      Edit1.Text := cdsAPOIOpName.Value;
    end;
    with cdsAPSumm do
    begin
      Close;
      Params.ParamByName('@id_ObjItem').Value := Fid_ObjItem;
      Open;

      First;
      while not Eof do
      begin
        if cdsAPSummisSys.AsBoolean then
          AVal_Sum := AParamAPOper.SumSys
        else
          AVal_Sum := AParamAPOper.SumOper;
        with AVal_Sum do
        begin
          ParamType := IntToPT(cdsAPSummSumm_Type.AsInteger);
          ParamTypeCurrency := IntToPT(cdsAPSummCurrency_Type.AsInteger);
          FormType := cdsAPSummSumm_FormType.AsInteger;
          Formulas := cdsAPSummSumm_Formulas.AsVariant;
          Koeff := cdsAPSummSumm_Koeff.AsVariant;
          Znak := cdsAPSummSumm_Znak.AsVariant;
          Val := cdsAPSummSumm_B.AsVariant;
          id_Currency := cdsAPSummid_Currency.AsVariant;

          Koeff2 := cdsAPSummSumm_Koeff2.AsVariant;
          Znak2 := cdsAPSummSumm_Znak2.AsVariant;

          Koeff3 := cdsAPSummSumm_Koeff3.AsVariant;
          Znak3 := cdsAPSummSumm_Znak3.AsVariant;
          inPercent := cdsAPSumminPercent.AsBoolean;
          Summ_UseSys := cdsAPSummSumm_UseSys.AsBoolean;
          
          id_ObjItemSumm := cdsAPSummid_ObjItemSumm.AsVariant;

          id_CnstItem := cdsAPSummid_CnstItem.AsVariant;
          ZnakCnstItem := cdsAPSummZnakCnstItem.AsVariant;
          K_CnstItem := cdsAPSummK_CnstItem.AsVariant;

          if id_CnstItem > 0 then
          begin
            DM.rsCA.AppServer.AP_CnstGetProp(AVal_Sum.id_CnstItem, ANAme, AVal);
            ParamName := ANAme;
          end;

        end;
        Next;
      end;
    end;
    with cdsAP do
    begin
      Close;
      Params.ParamByName('@id_ObjItem').Value := Fid_ObjItem;
      Open;
      First;
      while not Eof do
      begin
        PT := IntToPT(cdsAPParamType.AsInteger);
        if (cdsAPExtID.AsInteger = 10000) then
        begin
          AParamAPOper.SrcParamType := PT;
          AParamAPOper.SrcVal := cdsAPV_Str.AsVariant;
        end
        else
        if (cdsAPExtID.AsInteger = 10001) then
        begin
          AParamAPOper.DestParamType := PT;
          AParamAPOper.DestVal := cdsAPV_Str.AsVariant;
        end
        else
        begin
          Obj := AParamAPOper.Val_OperByExtID[cdsAPExtID.AsInteger];
          Obj.ParamType := PT;
          try
            Val(cdsAPV_Str.AsString, X, E);
            if E <> 0 then
              Obj.Val := cdsAPV_Str.AsVariant
            else
              Obj.Val := X;
          except

          end;
          if not cdsAPV1.IsNull then
            Obj.Val := cdsAPV1.AsVariant;
        end;
        Next;
      end;
    end;
  end;

  AParamAPOper.BsnName := DM.GetBusinessName(AParamAPOper.id_business);
  AParamAPOper.KoeffName := GetNameByID(cbKoef.Items, AParamAPOper.Val_OperByExtID[xxx_koeff].Val);

  AParamAPOper.FormalDistribName := GetCDSNameByID(cdsFormal, 'id_FormalDistrib', 'Name', AParamAPOper.Val_OperByExtID[xxx_id_FormalDistrib].Val);
  AParamAPOper.FuncDistribName := GetCDSNameByID(cdsFunc, 'id_FuncDistrib', 'Name', AParamAPOper.Val_OperByExtID[xxx_id_FuncDistrib].Val);
  AParamAPOper.SumOper.CurName := GetCDSNameByID(cdsCur, 'id_Currency', 'Name', AParamAPOper.SumOper.id_Currency);
  AParamAPOper.SumSys.CurName := GetCDSNameByID(cdsCur, 'id_Currency', 'Name', AParamAPOper.SumSys.id_Currency);

  with AParamAPOper.Val_OperByExtID[xxx_Src_id_Acc] do
    if Val <> Null then
      AParamAPOper.SrcPlaceName := DM.rsCA.AppServer.GetAccName(Val);
  with AParamAPOper.Val_OperByExtID[xxx_Dest_id_Acc] do
    if Val <> Null then
      AParamAPOper.DestPlaceName := DM.rsCA.AppServer.GetAccName(Val);

  with AParamAPOper.Val_OperByExtID[xxx_Src_id_Warehouse] do
    if Val <> Null then
      AParamAPOper.SrcPlaceName := DM.rsCA.AppServer.GetWHName(Val);
  with AParamAPOper.Val_OperByExtID[xxx_Dest_id_Warehouse] do
    if Val <> Null then
      AParamAPOper.DestPlaceName := DM.rsCA.AppServer.GetWHName(Val);

  with AParamAPOper.Val_OperByExtID[xxx_Src_id_Manufact] do
    if Val <> Null then
      AParamAPOper.SrcPlaceName := DM.rsCA.AppServer.GetMNName(Val);
  with AParamAPOper.Val_OperByExtID[xxx_Dest_id_Manufact] do
    if Val <> Null then
      AParamAPOper.DestPlaceName := DM.rsCA.AppServer.GetMNName(Val);

  with AParamAPOper.Val_OperByExtID[xxx_Dest_id_Repr] do
    if Val <> Null then
    begin
      AParamAPOper.DestPlaceName := DM.rsCA.AppServer.GetReprName(Val);
      DM.rsCA.AppServer.UNSel_ReprBsn(Val, isOwn, id_CAGroup, id_Ca);
      AParamAPOper.ContrAgentName := VarToStr(DM.rsCA.AppServer.GetCAName(id_Ca));
    end;

  gbWare.Visible := AParamAPOper.OperVid = 1;
  if gbWare.Visible then
  begin
    if not cdsAPGoods.Active then
    begin
      cdsAPGoods.Params.ParamByName('@id_ObjItem').Value := Fid_ObjItem;
      cdsAPGoods.Open;
    end;
  end;

  if ACopy then
  begin
    Fid_ObjItem := -1;
    Edit1.Text := 'новое';
    AParamAPOper.SumOper.id_ObjItemSumm := Null;
    AParamAPOper.SumSys.id_ObjItemSumm := Null;
    RebildAPWareData(cdsAPGoods);
  end;
  AParamAPOper.BsnName := DM.GetBusinessName(AParamAPOper.id_business);
  cdsAPOI.Close;
  cdsAPSumm.Close;
  cdsAP.Close;
  PaintGrid;
end;

procedure TfAPOper.elCorrGetEditorValue(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
  begin
    AValue := TComboBox(TFormControlEditLink(Sender).Control).Text;
    AParamAPOper.CorrectName := AValue;
    AParamAPOper.Correct := cbCorrect.ItemIndex = 1;
  end;
end;

procedure TfAPOper.elOperVidSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
    with TComboBox(TFormControlEditLink(Sender).Control) do
      ItemIndex := GetIndex(Items, AParamAPOper.OperVid);
end;

procedure TfAPOper.elOperVidGEV(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
var AEObjType : TEObjType;
    AID : Variant;
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
  begin
    with TComboBox(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.OperVid := GetVal(Items, ItemIndex);
    end;
  end;
  AParamAPOper.OperVidName := AValue;
  if AParamAPOper.OperVid = 4 then
  begin
    AParamAPOper.GetDestInfo(AEObjType, AID);
    if AEObjType <> eotRepr then
    begin
      AParamAPOper.DestClear;
      AParamAPOper.DestPlaceName := '';
    end;
  end;
  PaintGrid;
end;

procedure TfAPOper.elOTypeSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
    with TComboBox(TFormControlEditLink(Sender).Control) do
      ItemIndex := GetIndex(Items, AParamAPOper.OperTypeIn);
end;

procedure TfAPOper.elOTypeGEV(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
  begin
    with TComboBox(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.OperTypeIn := GetVal(Items, ItemIndex);
    end;
  end;
  AParamAPOper.OperTypeInName := AValue;
end;

function TfAPOper.GetIndex(SL: TStrings; V: Variant) : integer;
var i : integer;
    Obj : TObject;
begin
  Result := -1;
  for i := 0 to SL.Count - 1 do
  begin
    Obj := SL.Objects[i];
    if (Obj is TVal_obj) and (TVal_obj(Obj).ID = V) then
    begin
      Result := i;
      Break;
    end;
  end;
end;

function TfAPOper.GetVal(SL: TStrings; Index: integer) : Variant;
var Obj : TObject;
begin
  Result := Null;
  if Index > -1 then
  begin
    Obj := SL.Objects[Index];
    if (Obj is TVal_obj) then
      Result := TVal_obj(Obj).ID;
  end;
end;

{ Val_obj }

constructor TVal_obj.Create(AID: Variant);
begin
  inherited Create;
  ID := AID;
end;


procedure TfAPOper.cbOperTypeInKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    (Sender as TComboBox).ItemIndex := -1;
end;

procedure TfAPOper.elCorGEV(Sender: TObject; Grid: TAdvStringGrid;
  var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
  begin
    with TComboBox(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.Correct := GetVal(Items, ItemIndex);
    end;
  end;
  AParamAPOper.CorrectName := AValue;
end;

procedure TfAPOper.elCorrSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
    with TComboBox(TFormControlEditLink(Sender).Control) do
      ItemIndex := GetIndex(Items, AParamAPOper.Correct);
end;


procedure TfAPOper.elKoeffGEV(Sender: TObject; Grid: TAdvStringGrid;
  var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
  begin
    with TComboBox(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.Val_OperByExtID[xxx_Koeff].Val := GetVal(Items, ItemIndex);
    end;
  end;
  AParamAPOper.KoeffName := AValue;
end;

procedure TfAPOper.elKoeffSEV(Sender: TObject; Grid: TAdvStringGrid;
  AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
    with TComboBox(TFormControlEditLink(Sender).Control) do
      ItemIndex := GetIndex(Items, AParamAPOper.Val_OperByExtID[xxx_Koeff].Val);
end;

function TfAPOper.AP_OperAdd(ExtID, id_ObjItem, ParamType: Integer; V_Str, V1: OleVariant): Integer;
begin
  Result := DM.rsCA.AppServer.AP_OperAdd(ExtID, id_ObjItem, ParamType, V_Str, V1);
end;

function TfAPOper.IntToPT(PT: integer): TParamType;
begin
  case PT of
    0 : Result := ptLikeOper;
    1 : Result := ptSet;
    2 : Result := ptNull;
    3 : Result := ptInput;
    4 : Result := ptCrnOper;
    5 : Result := ptCrnSys;
  end;
end;

function TfAPOper.PTToInt(PT : TParamType): integer;
begin
  case PT of
    ptSet :
    begin
      Result := 1;
    end;
    ptNull :
    begin
      Result := 2;
    end;
    ptLikeOper :
    begin
      Result := 0;
    end;
    ptInput :
    begin
      Result := 3;
    end;
    ptCrnOper :
    begin
      Result := 4;
    end;
    ptCrnSys :
    begin
      Result := 5;
    end;
  end;
end;

function TfAPOper.SaveProp: boolean;
  function IDPropAdd(Obj : TVal_Oper): integer;
  var ParamType: Integer; V_Str, V1: OleVariant;
      PT : TParamType;
  begin
    if (Obj.ExtID < 10000) and not (Obj.ExtID in [5, 11, 12, 13]) then
    begin
      V_Str := Null;
      V1 := Null;
      PT := Obj.ParamType;
      ParamType := PTToInt(PT);
      if PT = ptSet then
      begin
        case VarType(Obj.Val) of
          varDouble : V_Str := StringReplace(VarToStr(Obj.Val), ',', '.', [rfReplaceAll, rfIgnoreCase])
        else
          V_Str := Obj.Val;
        end;
      end;

      if PT <> ptOther then
        Result := AP_OperAdd(Obj.ExtID, id_ObjItem, ParamType, V_Str, V1);
    end;
  end;
var OldCursor : TCursor;
    tmpID, RezID : integer;
    i, j : integer;
begin
  if AParamAPOper.OperVid = 4 then
  begin
    with AParamAPOper.Val_OperByExtID[xxx_koeff] do
    begin
      ParamType := ptSet;
      Val := 0;
    end;
    AParamAPOper.SrcClear;
 {   with AParamAPOper.Val_OperByExtID[xxx_id_FormalDistrib] do
    begin
      ParamType := ptNull;
    end;
    with AParamAPOper.Val_OperByExtID[xxx_id_FuncDistrib] do
    begin
      ParamType := ptNull;                    
    end;    }
    AParamAPOper.SumSys.ParamTypeCurrency := ptNull;
    AParamAPOper.SumSys.ParamType := ptNull;
  end;
  tmpID := id_ObjItem;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;


  BeginTruns(DM.rsCA);
  try
    RezID := DM.rsCA.AppServer.AP_ObjItemEdit(id_ObjItem, Fid_AP_Obj,
                                          AParamAPOper.OperVid,
                                          AParamAPOper.OperTypeIn,
                                          AParamAPOper.Correct,
                                          Edit1.Text
                                          {,
                                          PTToInt(AParamAPOper.SumOper.ParamType),
                                          AParamAPOper.SumOper.Formulas,
                                          AParamAPOper.SumOper.Koeff,
                                          AParamAPOper.SumOper.Val,
                                          AParamAPOper.SumOper.Znak,

                                          PTToInt(AParamAPOper.SumSys.ParamType),
                                          AParamAPOper.SumSys.Formulas,
                                          AParamAPOper.SumSys.Koeff,
                                          AParamAPOper.SumSys.Val,
                                          AParamAPOper.SumSys.Znak,
                                          AParamAPOper.SumOper.id_Currency,
                                          AParamAPOper.SumSys.id_Currency,
                                          PTToInt(AParamAPOper.SumOper.ParamTypeCurrency),
                                          PTToInt(AParamAPOper.SumSys.ParamTypeCurrency)});
    if RezID = -1 then
      raise Exception.Create('Ошибка при сохранении');
    if tmpID = -1 then
      Fid_ObjItem := RezID;

    RezID := AP_ObjItemSummAdd_int(Fid_ObjItem, AParamAPOper.SumOper);
    if RezID = -1 then
      raise Exception.Create('Ошибка при сохранении');
    RezID := AP_ObjItemSummAdd_int(id_ObjItem, AParamAPOper.SumSys);
    if RezID = -1 then
      raise Exception.Create('Ошибка при сохранении');

    RezID := DM.rsCA.AppServer.AP_OperClear(id_ObjItem);
    if RezID = -1 then
      raise Exception.Create('Ошибка при сохранении');

    with AParamAPOper do
    begin
      for i := 0 to FParamTypeList.Count - 1 do
        if IDPropAdd(TVal_Oper(FParamTypeList[i])) = -1 then
          raise Exception.Create('Ошибка при сохранении');
    end;

    if cdsAPGoods.Active then
    begin
      if AParamAPOper.OperVid <> 1 then
        aClearWare.Execute;
      if not CDSApplyUpdates(cdsAPGoods, 'id_ObjItem', Fid_ObjItem, true) then
        raise Exception.Create('Ошибка при сохранении перечня товаров');
    end;
    CommitTrans(DM.rsCA);
    Result := true;
  except
    on E : Exception do
    begin
      Screen.Cursor := OldCursor;
      RollbackTrans(DM.rsCA);
      Fid_ObjItem := tmpID;
      raise Exception.Create(E.Message);
    end;
  end;
  Screen.Cursor := OldCursor;
end;

function TfAPOper.AP_ObjItemSummAdd_int(id_ObjItem: Integer; AVal_Sum : TVal_Sum): Integer;
var id_ObjItemSumm : integer;
begin
  if AVal_Sum.id_ObjItemSumm = Null then
    id_ObjItemSumm := -1
  else
    id_ObjItemSumm := AVal_Sum.id_ObjItemSumm;
  if AVal_Sum.ParamTypeCurrency <> ptSet then
    AVal_Sum.id_Currency := Null;
  if AVal_Sum.ParamType <> ptSet then
  begin
    AVal_Sum.ClearFrm;
  end;
  if VarToStr(AVal_Sum.ZnakCnstItem) = '' then
    AVal_Sum.K_CnstItem := Null;

  if (VarToStr(AVal_Sum.K_CnstItem) = '') or
     (VarToStr(AVal_Sum.K_CnstItem) = '0') then
    AVal_Sum.ZnakCnstItem := Null;

  if (AVal_Sum.ParamType <> ptOther) or (AVal_Sum.ParamTypeCurrency <> ptOther) then
    Result := DM.rsCA.AppServer.AP_ObjItemSummAdd(id_ObjItemSumm, id_ObjItem, AVal_Sum = AParamAPOper.SumSys,
    PTToInt(AVal_Sum.ParamType), AVal_Sum.FormType, AVal_Sum.Koeff, AVal_Sum.Val, AVal_Sum.Znak, AVal_Sum.Koeff2,
    AVal_Sum.Znak2, AVal_Sum.Koeff3, AVal_Sum.Znak3, AVal_Sum.inPercent,
    AVal_Sum.Id_Currency, PTToInt(AVal_Sum.ParamTypeCurrency), AVal_Sum.Formulas, AVal_Sum.Summ_UseSys,
    AVal_Sum.id_CnstItem, AVal_Sum.ZnakCnstItem, AVal_Sum.K_CnstItem)
  else
    Result := 1;
end;


function TfAPOper.AP_ObjItemSummAdd(id_ObjItem: Integer; isSys: WordBool;
  Summ_Type, Summ_FormType, Summ_Koeff, Summ_B, Summ_Znak, Summ_Koeff2,
  Summ_Znak2, Summ_Koeff3, Summ_Znak3: OleVariant; inPercent: WordBool;
  Id_Currency: OleVariant; Currency_Type: Integer;
  SumOper_Formulas, Summ_UseSys: OleVariant): Integer;
begin
  Result := DM.rsCA.AppServer.AP_ObjItemSummAdd(id_ObjItem, isSys,
  Summ_Type, Summ_FormType, Summ_Koeff, Summ_B, Summ_Znak, Summ_Koeff2,
  Summ_Znak2, Summ_Koeff3, Summ_Znak3, inPercent,
  Id_Currency, Currency_Type, SumOper_Formulas, Summ_UseSys);
end;

function TfAPOper.GetNameByID(SL: TStrings; V: Variant): String;
var i : integer;
    Obj : TObject;
begin
  Result := '';
  for i := 0 to SL.Count - 1 do
  begin
    Obj := SL.Objects[i];
    if (Obj is TVal_obj) and (TVal_obj(Obj).ID = V) then
    begin
      Result := SL[i];
      Break;
    end;
  end;
end;

function TfAPOper.GetCDSNameByID(CDS: TClientDataSet; AKeyName, AName : String;
  ID: Variant): Variant;
var AField : TField;
begin
  Result := '';
  with CDS do
  begin
    AField := FindField(AKeyName);
    if AField <> nil then
    begin
      First;
      while not Eof do
      begin
        if AField.Value = ID then
        begin
          Result := FieldByName(AName).AsString;
          Break;
        end;
        Next;
      end;
    end;
  end;
end;

function TfAPOper.GetParamType(ARow: integer): TParamType;
var V : Variant;
begin                                               
 Result := ptOther;
 V := GetVal(AdvStringGrid1.Columns[cnsParamTypeCol].ComboItems,
                  AdvStringGrid1.Columns[cnsParamTypeCol].ComboItems.IndexOf(AdvStringGrid1.cells[cnsParamTypeCol, ARow]));
 if V <> Null then
   Result := TParamType(V);
end;

function TfAPOper.ConfirmChanges: boolean;
  procedure Sel(ARowType : TRowType; ACol : integer);
  var i : integer;
  begin
    for i := 0 to AdvStringGrid1.RowCount - 1 do
    begin
      if GetCode(i) = ARowType then
      begin
        AdvStringGrid1.SelectRange(Acol, ACol, i, i);
      end;
    end;
  end;
var Obj1, Obj2 : TVal_Oper;
    SumObj1, SumObj2 : TVal_Sum;
    AEObjType : TEObjType;
    AID : Variant;
    S : String;
    V : Variant;
begin
  Result := false;
  if (AParamAPOper.OperVid = Null) then
  begin                               
    Windows.SetFocus(AdvStringGrid1.Handle);
    Sel(cnsRow_OperVid, cnsVal);
    MessageBox(Handle, 'Не выбран вид операции', 'Введены не все данные', MB_OK + MB_ICONERROR);
    Exit;
  end;
  if (AParamAPOper.OperTypeIn = Null) then
  begin                               
    Windows.SetFocus(AdvStringGrid1.Handle);
    Sel(cnsRow_OType, cnsVal);
    MessageBox(Handle, 'Не выбран тип операции', 'Введены не все данные', MB_OK + MB_ICONERROR);
    Exit;
  end;

  if AParamAPOper.OperVid <> 4 then
  begin
    AParamAPOper.GetSrcInfo(AEObjType, AID);
    if ((AID = Null) and (AParamAPOper.SrcParamType = ptSet)) or (AParamAPOper.SrcParamType in [ptOther, ptNull]) then
    begin
      Windows.SetFocus(AdvStringGrid1.Handle);
      Sel(cnsRow_SrcName, cnsVal);
      MessageBox(Handle, 'Не введен свой объект', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  if AParamAPOper.OperVid = 1 then
  begin
    AParamAPOper.GetSrcInfo(AEObjType, AID);
    if (AParamAPOper.SrcParamType <> ptSet) then
    begin
      Windows.SetFocus(AdvStringGrid1.Handle);
      AParamAPOper.SrcParamType := ptSet;
      PaintGrid;
      Sel(cnsRow_SrcName, cnsVal);
      MessageBox(Handle, 'Для складских операций нужно указывать свой объект', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  AParamAPOper.GetDestInfo(AEObjType, AID);
  if ((AID = Null) and (AParamAPOper.DestParamType = ptSet)) or (AParamAPOper.DestParamType in [ptOther, ptNull]) then
  begin                               
    Windows.SetFocus(AdvStringGrid1.Handle);
    Sel(cnsRow_DestName, cnsVal);
    if AParamAPOper.OperVid <> 4 then
    begin
      S := 'Не введен чужой объект';
    end
    else
      S := 'Не введен представитель';
    MessageBox(Handle, PChar(S), 'Введены не все данные', MB_OK + MB_ICONERROR);
    Exit;
  end;

  if AParamAPOper.OperVid = 1 then
  begin
    AParamAPOper.GetDestInfo(AEObjType, AID);
    if (AParamAPOper.DestParamType <> ptSet) then
    begin
      Windows.SetFocus(AdvStringGrid1.Handle);
      AParamAPOper.DestParamType := ptSet;
      PaintGrid;
      Sel(cnsRow_DestName, cnsVal);
      MessageBox(Handle, 'Для складских операций нужно указывать чужой объект', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;

  V := Null;
  if AParamAPOper.OperVid <> 4 then
  begin
    Obj1 := AParamAPOper.Val_OperByExtID[xxx_Koeff];
    V := Obj1.Val;
    if (Obj1.ParamType = ptNull) or (((V = Null) and (Obj1.ParamType = ptSet)) and not (Obj1.ParamType in [ptLikeOper, ptInput])) then
    begin
      Windows.SetFocus(AdvStringGrid1.Handle);
      Sel(cnsRow_Koeff, cnsVal);
      MessageBox(Handle, 'Не введена суть операции', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;

//  if (V = -1) or (V = 1) or (AParamAPOper.OperVid = 4) then
  begin
    Obj1 := AParamAPOper.Val_OperByExtID[xxx_id_FormalDistrib];
    if (((Obj1.Val = Null) and (Obj1.ParamType = ptSet)) and not (Obj1.ParamType in [ptLikeOper, ptInput])) then
    begin
      Windows.SetFocus(AdvStringGrid1.Handle);
      Sel(cnsRow_FormalDistribName, cnsVal);
      MessageBox(Handle, 'Не введено формальное распределение', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Exit;
    end;
    Obj1 := AParamAPOper.Val_OperByExtID[xxx_id_FuncDistrib];
    if (((Obj1.Val = Null) and (Obj1.ParamType = ptSet)) and not (Obj1.ParamType in [ptLikeOper, ptInput])) then
    begin
      Windows.SetFocus(AdvStringGrid1.Handle);
      Sel(cnsRow_FuncDistribName, cnsVal);
      MessageBox(Handle, 'Не введено функциональное распределение', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;

  if AParamAPOper.OperVid <> 1 then
  begin
    SumObj1 := AParamAPOper.SumOper;
    begin
      if (SumObj1.ParamType in [ptOther, ptNull]) or
          ((SumObj1.FormType = 0) and (SumObj1.ParamType = ptSet)) or
         ((SumObj1.ParamType in [ptOther, ptNull]) and not (SumObj1.ParamTypeCurrency in [ptOther, ptNull])) then
      begin
        Windows.SetFocus(AdvStringGrid1.Handle);
        Sel(cnsRow_SummOper, cnsVal);
        MessageBox(Handle, 'Не введена сумма', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Exit;
      end;
      if (SumObj1.ParamTypeCurrency = ptOther) or
         (SumObj1.id_Currency = Null) and ((SumObj1.ParamTypeCurrency = ptSet)) or
         ((SumObj1.ParamTypeCurrency in [ptOther, ptNull]) and not (SumObj1.ParamType in [ptOther, ptNull])) then
      begin

        Windows.SetFocus(AdvStringGrid1.Handle);
        Sel(cnsRow_CurOper, cnsVal);
        MessageBox(Handle, 'Не введена валюта', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
  end;
  
  if (AParamAPOper.OperVid <> 4) then
  begin
    SumObj1 := AParamAPOper.SumSys;
    if (SumObj1.ParamType in [ptOther]) or
        ((SumObj1.FormType = 0) and (SumObj1.ParamType = ptSet)) or
       ((SumObj1.ParamType in [ptOther, ptNull]) and not (SumObj1.ParamTypeCurrency in [ptOther, ptNull])) then
    begin
      Windows.SetFocus(AdvStringGrid1.Handle);
      Sel(cnsRow_SummSys, cnsVal);
      MessageBox(Handle, 'Не введена сумма зачета', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Exit;
    end;
    if (SumObj1.ParamTypeCurrency = ptOther) or
       (SumObj1.id_Currency = Null) and ((SumObj1.ParamTypeCurrency = ptSet)) or
       (SumObj1.id_Currency = Null) and ((SumObj1.ParamType in [ptSet, ptLikeOper])) or
       ((SumObj1.ParamTypeCurrency in [ptOther]) and not (SumObj1.ParamType in [ptOther])) then
    begin
      Windows.SetFocus(AdvStringGrid1.Handle);
      Sel(cnsRow_CurSys, cnsVal);
      MessageBox(Handle, 'Не введена валюта зачета', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  with cdsAPGoods do
  begin
    if Active then
    begin
      DisableControls;
      try
        First;
        while not Eof do
        begin
          if cdsAPGoodsAmount_Znak.IsNull then
          begin
            Windows.SetFocus(DBGridEh1.Handle);
            DBGridEh1.col := 4;       
            MessageBox(Handle, 'Не введено количество товара', 'Введены не все данные', MB_OK + MB_ICONERROR);
            Exit;
          end;
          Next;
        end;
      finally
        EnableControls;
      end;
    end;
  end;
  Result := true;
end;

procedure TfAPOper.AddWare(AEdit: boolean);
var ASelectedObj : TSelectedObj;
    Price, ID_Cur: OleVariant;
    TotalAmount : Double;
    id_Warehouse : integer;
    AID, AName : OleVariant;
    S : String;
    EObjTypes : TEObjTypes;
    OldID, OldRecNo : Integer;
begin
  Screen.Cursor := crSQLWait;
  EObjTypes := [eotGoods];
  with cdsAPGoods do
  begin
    if not FieldByName('id_Goods').IsNull then
    begin
      ASelectedObj.ID := FieldByName('id_Goods').Value;
      ASelectedObj.ObjType := eotGoods;
//      EObjTypes := [eotGoods];
    end;
    id_Warehouse := -1;

    OldID := ASelectedObj.ID;
    if SelectObjUnBsn(Owner, Fid_business, ASelectedObj, 0, EObjTypes, true, id_Warehouse) then
    begin                                    
      OldRecNo := RecNo;
      if (not AEdit or (OldID <> ASelectedObj.ID)) and Locate('id_Goods', ASelectedObj.ID, []) then
      begin
        MessageBox(Handle, PChar('Этот товар уже выбран. Нельзя добавить его повторно, можно его количество.'), 'Этот товар уже выбран', MB_ICONWARNING + MB_OK);
        DBGridEh1.Col := 4;
        windows.SetFocus(DBGridEh1.Handle);
        Exit;
      end;

      if AEdit then
        Edit
      else
        Append;
        
      FieldByName('WareName').Value := ASelectedObj.Name;

      FieldByName('id_Goods').Value := ASelectedObj.ID;

      if DM.rsCA.AppServer.PL_WareMeasureGet(FieldByName('id_Goods').Value,
                                             AID, AName) = 1 then
      begin
        FieldByName('id_Measure').Value := AID;
        FieldByName('MeasureName').Value := AName;
      end;
      Post;
      DBGridEh1.col := 4;
      windows.SetFocus(DBGridEh1.Handle);
    end;
  end;
end;

{ TParamAPOper }

constructor TParamAPOper.Create;
var Val_obj : TVal_obj;
    i : integer;
begin
  FParamTypeList := TObjectList.Create(true);

  OperVid := Null;
  OperTypeIn := Null;

  id_business := Null;

  Correct := Null;

  SumOper := TVal_Sum.Create;
  SumOper.Summ_UseSys := false;
  SumSys := TVal_Sum.Create;
  SumSys.Summ_UseSys := false;
end;

destructor TParamAPOper.Destroy;
begin
  FParamTypeList.Free;
  SumOper.Free;
  SumSys.Free;

  inherited;
end;

procedure TfAPOper.elFormalGEV(Sender: TObject; Grid: TAdvStringGrid;
  var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TDBLookupComboBox then
  begin
    with TDBLookupComboBox(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.Val_OperByExtID[xxx_id_FormalDistrib].Val := KeyValue;
    end;
  end;
  AParamAPOper.FormalDistribName := AValue;
end;

procedure TfAPOper.elFuncGEV(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TDBLookupComboBox then
  begin
    with TDBLookupComboBox(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.Val_OperByExtID[xxx_id_FuncDistrib].Val := KeyValue;
    end;
  end;
  AParamAPOper.FuncDistribName := AValue;
end;

procedure TfAPOper.elFormalSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TDBLookupComboBox then
    with TDBLookupComboBox(TFormControlEditLink(Sender).Control) do
      KeyValue := AParamAPOper.Val_OperByExtID[xxx_id_FormalDistrib].Val;
end;

procedure TfAPOper.elFuncSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TDBLookupComboBox then
    with TDBLookupComboBox(TFormControlEditLink(Sender).Control) do
      KeyValue := AParamAPOper.Val_OperByExtID[xxx_id_FuncDistrib].Val;
end;

procedure TfAPOper.AdvStringGrid1CellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
var Code : TRowType;
    S : String;
    X : integer;
    AType, ANum: integer;
    V : Variant;
    AVal_Oper : TVal_Oper;
    AVal_Sum : TVal_Sum;
begin
  X := integer(AdvStringGrid1.Objects[1, ARow]);
  if X > 0 then
    Code := TRowType(X)
  else
    Code := cnsRow_None;
  case ACol of
    cnsNameCol :
    begin

    end;
    cnsParamTypeCol, cnsVal :
    begin
      AVal_Oper := nil;
      AVal_Sum := nil;
      V := Value;//AdvStringGrid1.Cells[cnsVal, ARow];
      S := Value;//AdvStringGrid1.Cells[cnsVal, ARow];
      case Code of
        cnsRow_Koeff : AVal_Oper := AParamAPOper.Val_OperByExtID[xxx_Koeff];
        cnsRow_FormalDistribName : AVal_Oper := AParamAPOper.Val_OperByExtID[xxx_id_FormalDistrib];
        cnsRow_FuncDistribName : AVal_Oper := AParamAPOper.Val_OperByExtID[xxx_id_FuncDistrib];

        cnsRow_SummOper :
        begin
          AVal_Sum := AParamAPOper.SumOper;
          if ACol = cnsParamTypeCol then
            AVal_Sum.ParamType := GetParamType(AdvStringGrid1.Row);
        end;
      {  cnsRow_CurOper :
        begin
          AVal_Sum := AParamAPOper.SumOper;
          if ACol = cnsParamTypeCol then
            AVal_Sum.ParamTypeCurrency := GetParamType(AdvStringGrid1.Row);
        end;   }

        cnsRow_SummSys :
        begin
          AVal_Sum := AParamAPOper.SumSys;
          if ACol = cnsParamTypeCol then
            AVal_Sum.ParamType := GetParamType(AdvStringGrid1.Row);
        end;
     {   cnsRow_CurSys :
        begin
          AVal_Sum := AParamAPOper.SumSys;
          if ACol = cnsParamTypeCol then
            AVal_Sum.ParamTypeCurrency := GetParamType(AdvStringGrid1.Row);
        end;   }

        cnsRow_Imp_PayBasic : AVal_Oper := AParamAPOper.Val_OperByExtID[xxx_Imp_PayBasic];
        cnsRow_AccInv_PayAssignment : AVal_Oper := AParamAPOper.Val_OperByExtID[xxx_AccInv_PayAssignment];
        cnsRow_Contract : AVal_Oper := AParamAPOper.Val_OperByExtID[xxx_Contract];
        cnsRow_Comment : AVal_Oper := AParamAPOper.Val_OperByExtID[xxx_OpComment];

        cnsRow_SrcName :
        begin
          if ACol = cnsParamTypeCol then
            AParamAPOper.SrcParamType := GetParamType(AdvStringGrid1.Row);
        end;
        cnsRow_DestName :
        begin
          if ACol = cnsParamTypeCol then
            AParamAPOper.DestParamType := GetParamType(AdvStringGrid1.Row);
        end;
        
        cnsRow_CA : AVal_Oper := AParamAPOper.Val_OperByExtID[xxx_id_ContrAgent];

       {  :
        begin
          AVal_Oper := AParamAPOper.Val_OperByExtID[xxx_SummOper];
        end;
         :
        begin
          AVal_Oper := AParamAPOper.Val_OperByExtID[xxx_SummSys];
        end;   }

        cnsRow_None :
        begin
          if X < 0 then
          begin
            FromXXX(X, AType, ANum);
            if AType = 1 then
              AVal_Oper := AParamAPOper.DigVal_Oper[ANum]//.Val := StrToFloatAdv(S)
            else
              if AType = 2 then
                AVal_Oper := AParamAPOper.StrVal_Oper[ANum];//.Val := S
          end;
        end;
      end;
      if (AVal_Oper <> nil) then
      begin
        if (ACol = cnsVal) and
           not (code in [cnsRow_SrcName, cnsRow_DestName, cnsRow_Koeff,
                         cnsRow_FormalDistribName, cnsRow_FuncDistribName,
                         cnsRow_CurSys, cnsRow_CurOper]) then
        begin
          if X > 0 then
            AVal_Oper.Val := V
          else
          begin
            if AType = 1 then
            begin
              if V = Null then
                AVal_Oper.Val := Null
              else
                AVal_Oper.Val := StrToFloatAdv(S);
            end
            else
              if AType = 2 then
                AVal_Oper.Val := S
          end;
        end
        else
          if ACol = cnsParamTypeCol then
            AVal_Oper.ParamType := GetParamType(AdvStringGrid1.Row);
      end;
      PaintGrid;

    end;
  end;
end;


function TParamAPOper.GetVal_OperByExtID(AExtID: integer; AddIfNeed : boolean; AList : TList): TVal_Oper;
var i : integer;
begin
  Result := nil;
  for i := 0 to AList.Count - 1 do
  begin
    if TVal_Oper(AList[i]).ExtID = AExtID then
    begin
      Result := TVal_Oper(AList[i]);
      Break;
    end;
  end;
  if AddIfNeed and (Result = nil) then
  begin
    Result := TVal_Oper.Create(AExtID);
    AList.Add(Result);
  end;
end;

function TParamAPOper.GetVal_OperByExtID_Int(AExtID: integer): TVal_Oper;
begin
  Result := GetVal_OperByExtID(AExtID, true, FParamTypeList);
end;

procedure TParamAPOper.SrcClear;
begin
  Val_OperByExtID[xxx_Src_id_Acc].Val := Null;
  Val_OperByExtID[xxx_Src_id_Warehouse].Val := Null;
  Val_OperByExtID[xxx_Src_id_Manufact].Val := Null;
  SrcPlaceName := '';
end;

procedure TParamAPOper.DestClear;
begin
  Val_OperByExtID[xxx_Dest_id_Acc].Val := Null;
  Val_OperByExtID[xxx_Dest_id_Warehouse].Val := Null;
  Val_OperByExtID[xxx_Dest_id_Manufact].Val := Null;
  Val_OperByExtID[xxx_Dest_id_Repr].Val := Null;
  DestPlaceName := '';
end;

procedure TfAPOper.AdvStringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (TAdvStringGrid(Sender).EditLink <> nil) then
    Key := #0;
end;

procedure TfAPOper.AdvStringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (TAdvStringGrid(Sender).EditLink <> nil) then
    Key := 0;
end;

procedure TfAPOper.elCurOperGEV(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TRxDBLookupCombo then
  begin
    with TRxDBLookupCombo(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.SumOper.id_Currency := KeyValue;
    end;
  end;
  AParamAPOper.SumOper.CurName := AValue;

end;

procedure TfAPOper.elCurOperSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TRxDBLookupCombo then
    with TRxDBLookupCombo(TFormControlEditLink(Sender).Control) do
      KeyValue := VarToStr(AParamAPOper.SumOper.id_Currency);
end;

procedure TfAPOper.elCurSysGEV(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TRxDBLookupCombo then
  begin
    with TRxDBLookupCombo(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.SumSys.id_Currency := KeyValue;
    end;
  end;
  AParamAPOper.SumOper.CurName := AValue;
end;

procedure TfAPOper.elCurSysSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TRxDBLookupCombo then
    with TRxDBLookupCombo(TFormControlEditLink(Sender).Control) do
      KeyValue := VarToStr(AParamAPOper.SumSys.id_Currency);
end;

function TParamAPOper.GetDigVal_Oper(index: integer): TVal_Oper;
begin
  index := -ToXXX(1, index);
  Result := GetVal_OperByExtID(index, true, FParamTypeList);
end;

function TParamAPOper.GetStrVal_Oper(index: integer): TVal_Oper;
begin
  index := -ToXXX(2, index);
  Result := GetVal_OperByExtID(index, true, FParamTypeList);
end;


procedure TParamAPOper.GetDestInfo(var AEObjType: TEObjType;
  var AID: Variant);
begin
  AEObjType := eotNone;
  AID := Null;
  with  Val_OperByExtID[xxx_Dest_id_Acc] do
    if Val <> Null then
    begin
      AEObjType := eotFin;
      AID := Val;
    end;
  with  Val_OperByExtID[xxx_Dest_id_Warehouse] do
    if Val <> Null then
    begin
      AEObjType := eotWH;
      AID := Val;
    end;
  with  Val_OperByExtID[xxx_Dest_id_Manufact] do
    if Val <> Null then
    begin
      AEObjType := eotManuf;
      AID := Val;
    end;
  with  Val_OperByExtID[xxx_Dest_id_Repr] do
    if Val <> Null then
    begin
      AEObjType := eotRepr;
      AID := Val;
    end;
end;

procedure TParamAPOper.GetSrcInfo(var AEObjType: TEObjType;
  var AID: Variant);
begin
  AEObjType := eotNone;
  AID := Null;
  with  Val_OperByExtID[xxx_Src_id_Acc] do
    if Val <> Null then
    begin
      AEObjType := eotFin;
      AID := Val;
    end;
  with  Val_OperByExtID[xxx_Src_id_Warehouse] do
    if Val <> Null then
    begin
      AEObjType := eotWH;
      AID := Val;
    end;
  with  Val_OperByExtID[xxx_Src_id_Manufact] do
    if Val <> Null then
    begin
      AEObjType := eotManuf;
      AID := Val;
    end;
end;

function TParamAPOper.GetDestParamType: TParamType;
begin
  with Val_OperByExtID[xxx_Dest_id_Acc] do
    if ParamType <> ptOther then
      Result := ParamType;
  with Val_OperByExtID[xxx_Dest_id_Warehouse] do
    if ParamType <> ptOther then
      Result := ParamType;
  with Val_OperByExtID[xxx_Dest_id_Manufact] do
    if ParamType <> ptOther then
      Result := ParamType;
  with Val_OperByExtID[xxx_Dest_id_Repr] do
    if ParamType <> ptOther then
      Result := ParamType;
end;

function TParamAPOper.GetSrcParamType: TParamType;
begin
  with Val_OperByExtID[xxx_Src_id_Acc] do
    if ParamType <> ptOther then
      Result := ParamType;
  with Val_OperByExtID[xxx_Src_id_Warehouse] do
    if ParamType <> ptOther then
      Result := ParamType;
  with Val_OperByExtID[xxx_Src_id_Manufact] do
    if ParamType <> ptOther then
      Result := ParamType;
end;

procedure TParamAPOper.SetDestParamType(const Value: TParamType);
begin
  Val_OperByExtID[xxx_Dest_id_Acc].ParamType := Value;
  Val_OperByExtID[xxx_Dest_id_Warehouse].ParamType := Value;
  Val_OperByExtID[xxx_Dest_id_Manufact].ParamType := Value;
  Val_OperByExtID[xxx_Dest_id_Repr].ParamType := Value;
end;

procedure TParamAPOper.SetSrcParamType(const Value: TParamType);
begin
  Val_OperByExtID[xxx_Src_id_Acc].ParamType := Value;
  Val_OperByExtID[xxx_Src_id_Warehouse].ParamType := Value;
  Val_OperByExtID[xxx_Src_id_Manufact].ParamType := Value;
end;

procedure TParamAPOper.SetSrcVal(const Value: Variant);
begin
  Val_OperByExtID[xxx_Src_id_Acc].Val := Value;
  Val_OperByExtID[xxx_Src_id_Warehouse].Val := Value;
  Val_OperByExtID[xxx_Src_id_Manufact].Val := Value;
end;

procedure TParamAPOper.SetDestVal(const Value: Variant);
begin
  Val_OperByExtID[xxx_Dest_id_Acc].Val := Value;
  Val_OperByExtID[xxx_Dest_id_Warehouse].Val := Value;
  Val_OperByExtID[xxx_Dest_id_Manufact].Val := Value;
  Val_OperByExtID[xxx_Dest_id_Repr].Val := Value;
end;

{ TVal_Oper }

constructor TVal_Oper.Create(AExtID: integer; AParamType : TParamType);
begin
  inherited Create;
  Val := Null;
  ExtID := AExtID;
  ParamType := AParamType;
end;

procedure TfAPOper.Button1Click(Sender: TObject);
begin
  GetParamType(AdvStringGrid1.Row)
end;

procedure TVal_Oper.SetVal(const Value: Variant);
begin
  fVal := Value;
end;

{ TVal_Sum }

procedure TVal_Sum.ClearFrm;
begin
  Koeff := Null;
  Koeff2 := Null;
  Koeff3 := Null;
  Koeff := Null;
  Znak := Null;
  Znak2 := Null;
  Znak3 := Null;
  Val := Null;
  Formulas := Null;
  FormType := 0;
end;

constructor TVal_Sum.Create;
begin
  id_CnstItem := Null;
  ZnakCnstItem := Null;
  K_CnstItem := Null;

  inPercent := true;
  Koeff := Null;
  Koeff2 := Null;
  Koeff3 := Null;
  Koeff := Null;
  Znak := Null;
  Znak2 := Null;
  Znak3 := Null;
  Val := Null;
  Formulas := Null;
  FormType := 0;

  id_Currency := Null; 
  ParamType := ptNull;
  FParamTypeCurrency := ptNull;
  id_ObjItemSumm := Null;
end;

function TVal_Sum.GetStr: String;
var S, S_Summ : String;
begin
  Result := '';
  if Summ_UseSys then
    S_Summ := 'Сумм. зач.'
  else
    S_Summ := 'Сумм. опер.';
  case FormType of
    20 :
    begin
      Result := 'Зачесть по курсу';
    end;
    10 :
    begin
      Result := 'Кол-во*'+ VarToStr(Koeff);
    end;
    1 :
    begin
      Result := VarToStr(Val);
    end;
    2 :
    begin
      if id_CnstItem > 0 then
      begin
        Result := S_Summ + ' * ([' + ParamName + ']';
        if VarToStr(ZnakCnstItem) <> '' then
        Result := Result + ' ' + VarToStr(ZnakCnstItem) + ' ' + VarToStr(K_CnstItem);
        Result := Result + ')%';
      end
      else
        Result := S_Summ + ' * ' + VarToStr(Koeff) + '%';
    end;
    3 :
    begin
      if id_CnstItem > 0 then
      begin
        Result := S_Summ + '/(100- ([' + ParamName + ']';
        if ZnakCnstItem <> '' then
          Result := Result + ' ' + VarToStr(ZnakCnstItem) + ' ' + VarToStr(K_CnstItem) + ')%'
        else
          Result := Result + ')%';
        Result := Result + ') - ' + S_Summ;
      end
      else
        Result := S_Summ + '/(100- ' + VarToStr(Koeff) + '%) - ' + S_Summ;

      if (Koeff2 <> 100) and (Koeff2 <> 0) then
          Result := '(' + Result + ') * ' + VarToStr(Koeff2) + '%';
    end;
    30 :
    begin
      if id_CnstItem > 0 then
      begin
        Result := S_Summ + '/(100+ ([' + ParamName + ']';
        if ZnakCnstItem <> '' then
          Result := Result + ' ' + VarToStr(ZnakCnstItem) + ' ' + VarToStr(K_CnstItem) + ')%'
        else
          Result := Result + ')%';
        Result := Result + ') - ' + S_Summ;
      end
      else
        Result := S_Summ + ' - ' + S_Summ + '/(100+ ' + VarToStr(Koeff) + '%)';

      if (Koeff2 <> 100) and (Koeff2 <> 0) then
          Result := '(' + Result + ') * ' + VarToStr(Koeff2) + '%';
    end;
    4 :
    begin
      if Znak <> Null then
      begin
        if Koeff < 0 then
          Result := Result + '-';
        Result := S_Summ + VarToStr(Znak) + '' + VarToStr(ABS(Koeff));
        if inPercent then Result := Result + '%';
      end;
      if Znak2 <> Null then
      begin
        if Koeff2 < 0 then
          Result := Result + '-'
        else
          Result := Result + '+';
        Result := Result + S_Summ + VarToStr(Znak2) + '' + VarToStr(ABS(Koeff2));
        if inPercent then Result := Result + '%';
      end;
      if Znak3 <> Null then
      begin
        if Koeff3 < 0 then
          Result := Result + '-'
        else
          Result := Result + '+';
        Result := Result + S_Summ + VarToStr(Znak3) + '' + VarToStr(ABS(Koeff3));
        if inPercent then Result := Result + '%';
      end;

      if (Val <> Null) and (Val <> 0) then
      begin
        if (Val > 0) and (Result <> '') then
          S := '+'
        else
          S := '';
        Result := Result + S + VarToStr(Val);
      end;
    end;
  end;
end;

procedure TfAPOper.elCurTypeOperGEV(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
var ID : Variant;
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
  begin
    with TComboBox(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.SumOper.ParamTypeCurrency := GetVal(Items, ItemIndex);
    end;
  end;
end;

procedure TfAPOper.elCurTypeOperSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
    with TComboBox(TFormControlEditLink(Sender).Control) do
      ItemIndex := GetIndex(Items, AParamAPOper.SumOper.ParamTypeCurrency);

end;

procedure TfAPOper.elCurTypeSysGEV(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
  begin
    with TComboBox(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.SumSys.ParamTypeCurrency := GetVal(Items, ItemIndex);
    end;                                               
  end;
end;

procedure TfAPOper.elCurTypeSysSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
    with TComboBox(TFormControlEditLink(Sender).Control) do
      ItemIndex := GetIndex(Items, AParamAPOper.SumSys.ParamTypeCurrency);
end;

procedure TfAPOper.elCurTypeOperSetEditorProperties(Sender: TObject;
  Grid: TAdvStringGrid; AControl: TWinControl);
begin
  AControl.Height := 300;
end;

procedure TVal_Sum.SetParamTypeCurrency(const Value: TParamType);
begin
  FParamTypeCurrency := Value;
end;

procedure TfAPOper.BitBtn1Click(Sender: TObject);
var id_AP_Obj : Variant;
    AName : String;
begin
  id_AP_Obj := Fid_AP_Obj;
  AName := edObjName.Text;
  if ShowAPListSelector(id_AP_Obj, AName, Fid_business) then
  begin
    Fid_AP_Obj := id_AP_Obj;
    edObjName.Text := AName;
  end;
end;

procedure TfAPOper.aAddWareExecute(Sender: TObject);
begin
  AddWare(false);
end;

procedure TfAPOper.aDelWareExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if DBGridEh1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(DBGridEh1.SelectedRows.Count) + ' товаров?'
  else
    S := 'Удалить товар "' + cdsAPGoods.FieldByName('WareName').AsString+ '"?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if DBGridEh1.SelectedRows.Count > 0 then
      begin
        for i := 0 to DBGridEh1.SelectedRows.Count - 1 do
        begin
          cdsAPGoods.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
          cdsAPGoods.Delete;
        end;
      end
      else
        cdsAPGoods.Delete;
    finally

    end;


  end;
end;

procedure TfAPOper.aClearWareExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Очистить перечень товаров?'), 'Подтвердите очистку', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    with cdsAPGoods do
    begin
      while not IsEmpty do
        Delete;
    end;
  end;
end;


procedure TfAPOper.dsAPGoodsDataChange(Sender: TObject; Field: TField);
begin
  aClearWare.Enabled := not cdsAPGoods.IsEmpty;
  aDelWare.Enabled := not cdsAPGoods.IsEmpty;
end;


procedure TfAPOper.cdsAPGoodsCalcFields(DataSet: TDataSet);
var S : String;
begin
  DataSet.FieldByName('Numb').AsInteger := DataSet.RecNo;
  if not cdsAPGoodsAmount_Znak.IsNull then
  begin
    S := '';
    if not cdsAPGoodsAmount_Koeff.IsNull then
      S := 'Количество' + cdsAPGoodsAmount_Znak.AsString
      + FormatFloat('0.####', cdsAPGoodsAmount_Koeff.AsFloat);

    if cdsAPGoodsAmount_B.AsFloat > 0 then
      S := S + '+' + FormatFloat('#.####', cdsAPGoodsAmount_B.AsFloat);
    if cdsAPGoodsAmount_B.AsFloat < 0 then
      S := S + '-' + FormatFloat('#.####', -cdsAPGoodsAmount_B.AsFloat);

    DataSet.FieldByName('AmountStr').AsString := S;
  end;
 // DataSet.FieldByName('PriceStr').AsString := S;
end;


procedure TfAPOper.DBGridEh1EditButtonClick(Sender: TObject);
var tmpCol : TColumnEh;
    K, B : Variant;
    Znak : String;
begin
  if cdsAPGoods.FieldByName('WareName').IsNull then Exit;
  tmpCol := TDBGridEh(Sender).Columns[TDBGridEh(Sender).col - 1];
  if tmpCol.Field = cdsAPGoodsAmountStr then
  begin
    K := cdsAPGoodsAmount_Koeff.AsVariant;
    B := cdsAPGoodsAmount_B.AsVariant;
    Znak := cdsAPGoodsAmount_Znak.AsString;
    if ShowOperWareAmount(K, B, Znak) then
    begin
      cdsAPGoods.Edit;
      cdsAPGoodsAmount_Koeff.AsVariant := K;
      cdsAPGoodsAmount_B.AsVariant := B;
      cdsAPGoodsAmount_Znak.AsVariant := Znak; 
      cdsAPGoods.Post;
    end;
  end;
end;

end.
