unit frAPCond;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ExtCtrls, StdCtrls, Mask, DBCtrls, foMyFunc, Buttons,
  frCurSelector, ToolEdit, RXDBCtrl, ComCtrls, ActnList, Grids, DBGrids,
  ToolWin, RxLookup, frOperOldData, CurrEdit, frExtDataVal, Registry,
  BaseGrid, AdvGrid, AdvCGrid, frBsnSelector, contnrs,
  frmctrllink, Menus;

const
  cnsNameCol = 1;
  cnsCondCol = 2;
  cnsVal = 3;
  cnsVal2 = 4;

type
  TAPCond = ({apcNone, }apcEQ, apcNotEQ, apcLow, apcLowEQ, apcHi, apcHiEQ, apcBTW, apcNotBTW, apcIn, apcNotIn,
             apcLike, apcNotLike);
  
  TVal_obj = class
    ID : Variant;
    constructor Create(AID : Variant); 
  end;
  TPlaceACS  = class
  //  id_Repr : Variant;
    id_Acc : Variant;
    id_Warehouse : Variant;
    id_Manufact : Variant;
    PlaceName : String;
    procedure Clear; virtual;
    constructor Create;
  end;

  TPlaceACSDest  = class(TPlaceACS)
    id_Repr : Variant;
     procedure Clear; override;
    constructor Create;
  end;

  TParamAPOper = class
  private
    function GetDig(index: integer): Variant;
    procedure SetDig(index: integer; const Value: Variant);
    function GetStr(index: integer): Variant;
    procedure SetStr(index: integer; const Value: Variant);
  public
    id_Goods : Variant;
    GoodsName : String;

    id_Obj : integer;

    OperVid : Variant;
    OperVidName : String;

    OperTypeIn : Variant;
    OperTypeInName : String;

    id_UserCreator : Variant;
    id_UserChecker : Variant;
    id_business : Variant;
    BsnName : String;

    ASrc  : TPlaceACS;
    ADest : TPlaceACSDest;
  {  id_Acc : Variant;
    id_Warehouse : Variant;
    id_Manufact : Variant;
    SrcName : String;     }

    id_ContrAgent : Variant;
    ContrAgentName : String;
    
   { id_Repr : Variant;
    id_Acc_Ext : Variant;
    id_Warehouse_Ext : Variant;
    id_Manufact_Ext : Variant;
    DestName : String;    }

    Koeff : Variant;
    KoeffName : String;
    AutoGen : Variant;
    AutoGenName : String;

    id_FormalDistrib : Variant;
    FormalDistribName : String;
    id_FuncDistrib : Variant;
    FuncDistribName : String;

    Imp_PayBasic : Variant;
    AccInv_PayAssignment: Variant;
    Contract: Variant;
    OpComment: Variant;
    
    id_CAGroup : Variant;
    id_WarehouseGroup : Variant;
    id_AccGroup : Variant;
    id_ManufactGroup : Variant;

    Correct : Variant;
    CorrectName : String;

    id_CurrencyOper : Variant;
    CurOperName : String;
    SummOper1, SummOper2 : Variant;
    CondOper : TAPCond;
    CondOperName : String;

    
    id_CurrencySys : Variant;
    CurSysName : String;
    SummSys1, SummSys2 : Variant;
    CondSys : TAPCond;
    CondSysName : String;

//    id_Goods : Variant;
    FDigList, FStrList : TObjectList;
    constructor Create;
    destructor Destroy; override;

    function GetPropByExtID(AExtID: integer; isSec : boolean) : PVariant;
    procedure SetValByExtID(AExtID: integer; isSec : boolean; const Value: Variant);
    function GetValByExtID(AExtID: integer; isSec: boolean): Variant;

    property Dig[index : integer] : Variant read GetDig write SetDig;
    property Str[index : integer] : Variant read GetStr write SetStr;
    property ValByExtID[AExtID : integer; isSec : boolean] : Variant read GetValByExtID write SetValByExtID;
  end;

  TRowType = (cnsRow_None, cnsRow_Bsn, cnsRow_OType, cnsRow_OperVid, cnsRow_Corr,
              cnsRow_SrcName, cnsRow_DestName, cnsRow_CA,
              cnsRow_Koeff, cnsRow_FormalDistribName, cnsRow_FuncDistribName,
              cnsRow_Imp_PayBasic, cnsRow_AccInv_PayAssignment, cnsRow_Contract,
              cnsRow_Comment,
              cnsRow_CurOper,
              cnsRow_CurSys,
              cnsRow_SummOper,
              cnsRow_SummSys, cnsRow_AutoGen, cnsRow_Goods
              );

  TfAPCond = class(TFrame)
    cdsAPObj: TClientDataSet;
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
    cbCorrect: TComboBox;
    cbOperTypeIn: TComboBox;
    cbOperVid: TComboBox;
    cbKoef: TComboBox;
    Panel1: TPanel;
    Edit1: TEdit;
    cdsAPCond: TClientDataSet;
    cdsAPObjid_AP_Obj: TAutoIncField;
    cdsAPObjid_business: TIntegerField;
    cdsAPObjOperVid: TIntegerField;
    cdsAPObjOperTypeIn: TBooleanField;
    cdsAPObjCorrect: TBooleanField;
    cdsAPObjName: TStringField;
    cdsAPObjid_User: TIntegerField;
    cdsAPObjDateCreateAP: TDateTimeField;
    cdsAPObjDeleted: TBooleanField;
    cdsAPCondid_AP_Cond: TAutoIncField;
    cdsAPCondid_AP_Obj: TIntegerField;
    cdsAPCondid_AP_Oper_Dic: TIntegerField;
    cdsAPCondAPCond: TIntegerField;
    cdsAPCondV_Str: TStringField;
    cdsAPCondExtID: TIntegerField;
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
    cdsAPCondV_Str2: TStringField;
    edCondOper: TFormControlEditLink;
    cbCond: TComboBox;
    edCondSys: TFormControlEditLink;
    lcCur: TRxDBLookupCombo;
    cbAutoGen: TComboBox;
    elAutoGen: TFormControlEditLink;
    cdsAPObjIndAuto: TIntegerField;
    cdsAPObjId_CurrencyOper: TIntegerField;
    cdsAPObjId_CurrencySys: TIntegerField;
    cdsAPObjid_Acc: TIntegerField;
    cdsAPObjid_Warehouse: TIntegerField;
    cdsAPObjid_Manufact: TIntegerField;
    cdsAPObjid_Acc_Ext: TIntegerField;
    cdsAPObjid_Warehouse_Ext: TIntegerField;
    cdsAPObjid_Manufact_Ext: TIntegerField;
    cdsAPObjid_Repr: TIntegerField;
    cdsAPObjid_ContrAgent: TIntegerField;
    cdsAPObjKoeff: TIntegerField;
    cdsAPObjid_FormalDistrib: TIntegerField;
    cdsAPObjid_FuncDistrib: TIntegerField;
    cdsAPObjOpComment: TStringField;
    cdsAPObjImp_PayBasic: TStringField;
    cdsAPObjAccInv_PayAssignment: TStringField;
    cdsAPObjContract: TStringField;
    cdsAPObjAutoGen: TBooleanField;
    lcFormalDistrib: TRxDBLookupCombo;
    lcFuncDistrib: TRxDBLookupCombo;
    cdsAPObjid_Goods: TIntegerField;
    cdsGoodsProp: TClientDataSet;
    cdsGoodsPropid_Goods: TAutoIncField;
    cdsGoodsPropid_Ctg_Goods: TIntegerField;
    cdsGoodsPropName: TStringField;
    cdsGoodsPropShortName: TStringField;
    cdsGoodsPropBarCode: TStringField;
    cdsGoodsPropDisabled: TBooleanField;
    cdsGoodsPropLastUpdated: TBytesField;
    cdsGoodsPropid_Measure: TIntegerField;
    cdsGoodsPropMeasureName: TStringField;
    cdsGoodsPropGTD: TStringField;
    cdsGoodsPropCountry: TStringField;
    cdsGoodsPropDocNomCode: TStringField;
    cdsGoodsPropDocPriceCode: TStringField;
    cdsGoodsPropDocArt: TStringField;
    cdsGoodsPropDocNumber: TStringField;
    PopupMenu1: TPopupMenu;
    miClearPar: TMenuItem;
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
    procedure edCondOperGetEditorValue(Sender: TObject;
      Grid: TAdvStringGrid; var AValue: String);
    procedure edCondOperSetEditorValue(Sender: TObject;
      Grid: TAdvStringGrid; AValue: String);
    procedure elCurSysSetEditorProperties(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure elCurOperSetEditorProperties(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure alAGGev(Sender: TObject; Grid: TAdvStringGrid;
      var AValue: String);
    procedure alAGSev(Sender: TObject;
      Grid: TAdvStringGrid; AValue: String);
    procedure miClearParClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    Fid_AP_Obj : integer;
    FNeedColor, FReadOnly : boolean;
    AParamAPOper : TParamAPOper;
    FLockPaintCount : integer;
    function GetKoefVal: integer;
    procedure SetKoefVal(const Value: integer);
    procedure cbKoefDoChange;
    property KoefVal : integer read GetKoefVal write SetKoefVal;
    procedure PaintGrid;
    function GetCode(ARow : integer): TRowType;
    function GetIndex(SL: TStrings; V: Variant): integer;
    function GetVal(SL: TStrings; Index: integer): Variant;
    procedure SetRowByCode(ARowType: TRowType);
    function AP_CondAdd(id_AP_Obj, ExtID: Integer; V_Str, V_Str2: OleVariant; APCond: TAPCond = apcEQ): Integer;
    function GetNameByID(SL: TStrings; V: Variant): String;
    function GetCDSNameByID(CDS : TClientDataSet; AKeyName, AName : String; ID: Variant): Variant;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure Initialize(id_AP_Obj, id_business : integer; OperVid, ACopy : Variant; AReadOnly : boolean);

    property id_AP_Obj : integer read Fid_AP_Obj;

  end;

implementation

uses uDM, uFormsAPI_Admin, uFormsAPI_Users, uFormApi_CA, uUnivOper_v2,
  uRepSelector, uComment_ext, uUnivSelector, uInputBoxDigit, uCASelector,
  foMyFuncAdvStrGrigExcel;

{$R *.DFM}
 {
procedure ParseCODE(ACode : integer; var AType: integer; var ANum: integer);
begin
  AType := ABS(ACode) and $00FF;
  ANum := ABS(ACode) shr 8;
end;  }

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


constructor TfAPCond.Create(AOwner: TComponent);
var
    Reg : TRegistry;
    FullRegPathName : String;
    V : TVal_obj;
begin
  inherited;
  FLockPaintCount := 0;
  AParamAPOper := TParamAPOper.Create;
  if Owner is TCustomForm then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      FullRegPathName := SRegPath + '\' + ClassName + TCustomForm(Owner).ClassName;
      LoadGridSettingsFromRegistryTMS(AdvStringGrid1, FullRegPathName + '\grid');
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  FNeedColor := false;

  with cbOperVid do
  begin
    Items.Clear;
    Items.AddObject('', TVal_obj.Create(NULL));
    Items.AddObject('Складская', TVal_obj.Create(1));
    Items.AddObject('Финансовая', TVal_obj.Create(2));
    Items.AddObject('Взаимозачетная', TVal_obj.Create(4));
  end;
  
  with cbCorrect do
  begin
    Items.Clear;
    Items.AddObject('', TVal_obj.Create(NULL));
    Items.AddObject('Да', TVal_obj.Create(true));
    Items.AddObject('Нет', TVal_obj.Create(false));
  end;

  with cbOperTypeIn do
  begin
    Items.Clear;
    Items.AddObject('', TVal_obj.Create(NULL));
    Items.AddObject('Приходная операция', TVal_obj.Create(true));
    Items.AddObject('Расходная операция', TVal_obj.Create(false));
  end;
  
  with cbKoef do
  begin
    Items.Clear;
    Items.AddObject('', TVal_obj.Create(NULL));
    Items.AddObject('Расчет с контрагентом', TVal_obj.Create(0));
    Items.AddObject('Прибыль', TVal_obj.Create(1));
    Items.AddObject('Затрата', TVal_obj.Create(-1));
  end;
  
  with cbAutoGen do
  begin
    Items.Clear;
    Items.AddObject('', TVal_obj.Create(NULL));
    Items.AddObject('Да', TVal_obj.Create(true));
    Items.AddObject('Нет', TVal_obj.Create(false));
  end;

  with cbCond do
  begin
    Items.Clear;
    Items.AddObject('=', TVal_obj.Create(ORD(apcEQ)));
    Items.AddObject('>', TVal_obj.Create(ORD(apcHi)));
    Items.AddObject('<', TVal_obj.Create(ORD(apcLow)));
    Items.AddObject('>=', TVal_obj.Create(ORD(apcHiEQ)));
    Items.AddObject('<=', TVal_obj.Create(ORD(apcLowEQ)));
    Items.AddObject('<>', TVal_obj.Create(ORD(apcNotEQ)));
    Items.AddObject('между', TVal_obj.Create(ORD(apcBTW)));
  end;

end;

destructor TfAPCond.Destroy;
  procedure ClearCB(SL : TStrings);
  var Obj : TObject;
  begin
  try
    with SL do
      while Count > 0 do
      begin
        Obj := Objects[Count - 1];
        if Obj <> nil then
          Obj.Free;
        Delete(Count - 1);
      end;

      except
      end;
    end;
var Reg : TRegistry;
    FullRegPathName : String;
begin
  AParamAPOper := TParamAPOper.Create;
{  ClearCB(cbOperVid.Items);
  ClearCB(cbOperTypeIn.Items);
  ClearCB(cbCorrect.Items);     }

  AParamAPOper.Free;
  if Owner is TCustomForm then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;

      FullRegPathName := SRegPath + '\' + ClassName + TCustomForm(Owner).ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        SaveGridSettingsToRegistryTMS(AdvStringGrid1, FullRegPathName + '\grid');
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  inherited;
end;




procedure TfAPCond.cbKoefKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    cbKoef.ItemIndex := 0;
  cbKoefDoChange;
end;

function TfAPCond.GetKoefVal: integer;
begin
  case cbKoef.ItemIndex of
    0 : Result := 0;
    1 : Result := 1;
    2 : Result := -1;
    else
      Result := 0;
  end;
end;

procedure TfAPCond.SetKoefVal(const Value: integer);
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

procedure TfAPCond.DBEdit1Change(Sender: TObject);
begin
 { if FID_OperFin <> -1 then
  begin
    if THackControl(Sender).Text = '' then
      THackControl(Sender).Color := clRed
    else
      THackControl(Sender).Color := clWindow;
  end;  }
end;


procedure TfAPCond.cbKoefDoChange;
begin
  lcFormalDistrib.Enabled := (cbKoef.ItemIndex > 0);
  lcFuncDistrib.Enabled := (cbKoef.ItemIndex > 0);
end;

procedure TfAPCond.cbKoefChange(Sender: TObject);
begin
 cbKoefDoChange;
end;

procedure TfAPCond.AdvStringGrid1GetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
var Code : TRowType;
    X : integer;
begin
  X := integer(AdvStringGrid1.Objects[1, ARow]);
  if X > 0 then
    Code := TRowType(X)
  else
    Code := cnsRow_None;
  case ACol of
    cnsNameCol :
    begin
    //  aEditor := edCustom;
    end;
    cnsCondCol, cnsVal, cnsVal2 :
    begin
      case Code of
       { cnsRow_Bsn,} cnsRow_SrcName, cnsRow_DestName, cnsRow_CA, cnsRow_Goods : aEditor := edEditBtn;
        cnsRow_OType : TAdvStringGrid(Sender).EditLink := elOType;
        cnsRow_Corr : TAdvStringGrid(Sender).EditLink := elCorr;
        cnsRow_AutoGen : TAdvStringGrid(Sender).EditLink := elAutoGen;
        cnsRow_OperVid : TAdvStringGrid(Sender).EditLink := elOperVid;
        cnsRow_Koeff : TAdvStringGrid(Sender).EditLink := elKoef;
        cnsRow_FormalDistribName : TAdvStringGrid(Sender).EditLink := elFormal;
        cnsRow_FuncDistribName : TAdvStringGrid(Sender).EditLink := elFunc;
        cnsRow_Imp_PayBasic, cnsRow_AccInv_PayAssignment,
        cnsRow_Contract, cnsRow_Comment : AEditor := edNormal;
        
        cnsRow_SummOper :
          case ACol of
            cnsCondCol : TAdvStringGrid(Sender).EditLink := edCondOper;
            cnsVal, cnsVal2 : AEditor := edFloat;
          end;
        cnsRow_SummSys :
          case ACol of
            cnsCondCol : TAdvStringGrid(Sender).EditLink := edCondSys;
            cnsVal, cnsVal2 : AEditor := edFloat;
          end;
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
      if Assigned(TAdvStringGrid(Sender).EditLink) then
        aEditor := edCustom;
    end;
  end;
end;

function TfAPCond.GetCode(ARow : integer) : TRowType;
var X : integer;
begin
  X := integer(AdvStringGrid1.Objects[1, ARow]);
  if X < 0 then
    Result := cnsRow_None
  else
    Result := TRowType(X);
end;


procedure TfAPCond.SetRowByCode(ARowType : TRowType);
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


procedure TfAPCond.PaintGrid;
  procedure CellVal_Adv(ACol, ARow : integer; AName : String; Code : integer{; APCond : TAPCond = apcNone; V1 : String = ''; V2 : String = ''});
  begin
    if AdvStringGrid1.RowCount <= ARow then
      AdvStringGrid1.RowCount := ARow + 1;
    AdvStringGrid1.Objects[ACol, ARow] := Pointer(Code);
    AdvStringGrid1.Cells[ACol, ARow] := AName;
  end;
  procedure CellVal(ACol, ARow : integer; AName : Variant; Code : TRowType = cnsRow_None{; APCond : TAPCond = apcNone; V1 : String = ''; V2 : String = ''});
  begin
    CellVal_Adv(ACol, ARow, VarToStr(AName), ORD(Code));
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
    CCount := 5;
    AdvStringGrid1.ColCount := CCount;

    CellVal(cnsNameCol, 0, 'Параметр');
    AdvStringGrid1.MergeCells(cnsCondCol , 0, CCount - cnsCondCol, 1);
    CellVal(cnsCondCol, 0, 'Значение');

    AdvStringGrid1.DefaultRowHeight := 18;
    AdvStringGrid1.FixedRowHeight := 52;

    AdvStringGrid1.FontStyles[0, 0] := [fsBold];
    AdvStringGrid1.FontStyles[1, 0] := [fsBold];
    AdvStringGrid1.FontStyles[2, 0] := [fsBold];

    AdvStringGrid1.Alignments[2, 0] := taCenter;

    Row := 1;
    CellVal(cnsNameCol, Row, 'Бизнес', cnsRow_Bsn);
    AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
    CellVal(cnsCondCol, Row, AParamAPOper.BsnName);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Вид операции', cnsRow_OperVid);
    AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
    CellVal(cnsCondCol, Row, AParamAPOper.OperVidName);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Приход/расход', cnsRow_OType);
    AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
    CellVal(cnsCondCol, Row, AParamAPOper.OperTypeInName);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Коррекционная', cnsRow_Corr);
    AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
    CellVal(cnsCondCol, Row, AParamAPOper.CorrectName);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Автоматическая', cnsRow_AutoGen);
    AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
    CellVal(cnsCondCol, Row, AParamAPOper.AutoGenName);

    if AParamAPOper.OperVid <> 4 then
    begin
      inc(Row);
      CellVal(cnsNameCol, Row, 'Свой объект', cnsRow_SrcName);
      AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
      CellVal(cnsCondCol, Row, AParamAPOper.ASrc.PlaceName);
    end;

    if AParamAPOper.OperVid <> 4 then
    begin
      S := 'Чужой объект';
    end
    else
      S := 'Представитель';
  
    inc(Row);
    CellVal(cnsNameCol, Row, S, cnsRow_DestName);
    AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
    CellVal(cnsVal, Row, AParamAPOper.ADest.PlaceName);

   // if AParamAPOper.ADest.id_Repr <> NUll then
    begin
      inc(Row);
      CellVal(cnsNameCol, Row, 'Контрагент', cnsRow_CA);
      AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
      CellVal(cnsVal, Row, AParamAPOper.ContrAgentName);
    end;
    
    if AParamAPOper.OperVid = 1 then
    begin
      inc(Row);
      CellVal(cnsNameCol, Row, 'Товар', cnsRow_Goods);
      AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
      CellVal(cnsVal, Row, AParamAPOper.GoodsName);
    end;

    if AParamAPOper.OperVid <> 4 then
    begin
      inc(Row);
      CellVal(cnsNameCol, Row, 'Суть операции', cnsRow_Koeff);
      AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
      CellVal(cnsVal, Row, AParamAPOper.KoeffName);
    end;
    

    inc(Row);
    CellVal(cnsNameCol, Row, 'Формальное распределение', cnsRow_FormalDistribName);
    AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
    CellVal(cnsVal, Row, AParamAPOper.FormalDistribName);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Функциональное распределение', cnsRow_FuncDistribName);
    AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
    CellVal(cnsVal, Row, AParamAPOper.FuncDistribName);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Осн. платежа/накладная', cnsRow_Imp_PayBasic);
    AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
    CellVal(cnsVal, Row, AParamAPOper.Imp_PayBasic);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Пл. поручение/Счет фактура', cnsRow_AccInv_PayAssignment);
    AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
    CellVal(cnsVal, Row, AParamAPOper.AccInv_PayAssignment);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Договор', cnsRow_Contract);
    AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
    CellVal(cnsVal, Row, AParamAPOper.Contract);

    inc(Row);
    CellVal(cnsNameCol, Row, 'Комментарий', cnsRow_Comment);
    AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
    CellVal(cnsVal, Row, AParamAPOper.OpComment);

    if AParamAPOper.OperVid <> 1 then
    begin
      inc(Row);
      CellVal(cnsNameCol, Row, 'Сумма операции', cnsRow_SummOper);
  //    AdvStringGrid1.MergeCells(cnsCondCol + 1, Row, CCount - cnsCondCol - 1, 1);
      CellVal(cnsCondCol, Row, AParamAPOper.CondOperName);
      CellVal(cnsVal, Row, AParamAPOper.SummOper1);
      CellVal(cnsVal2, Row, AParamAPOper.SummOper2);

      inc(Row);
      CellVal(cnsNameCol, Row, 'Валюта операции', cnsRow_CurOper);
      AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
      CellVal(cnsVal, Row, AParamAPOper.CurOperName);

      if AParamAPOper.OperVid <> 4 then
      begin
        inc(Row);
        CellVal(cnsNameCol, Row, 'Сумма зачета', cnsRow_SummSys);
    //    AdvStringGrid1.MergeCells(cnsCondCol + 1, Row, CCount - cnsCondCol - 1, 1);
        CellVal(cnsCondCol, Row, AParamAPOper.CondSysName);
        CellVal(cnsVal, Row, AParamAPOper.SummSys1);
        CellVal(cnsVal2, Row, AParamAPOper.SummSys2);

        inc(Row);
        CellVal(cnsNameCol, Row, 'Валюта зачета', cnsRow_CurSys);
        AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
        CellVal(cnsVal, Row, AParamAPOper.CurSysName);
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
        AdvStringGrid1.MergeCells(cnsCondCol, Row, CCount - cnsCondCol, 1);
        CellVal(cnsCondCol, Row, AParamAPOper.ValByExtID[-X, false]);

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

procedure TfAPCond.AdvStringGrid1EllipsClick(Sender: TObject; ACol,
  ARow: Integer; var S: String);
var Code : TRowType;
    ASelectedObj : TSelectedObj;
    AEObjTypes: TEObjTypes;
    APlaceACS : TPlaceACS;
begin
  Code := GetCode(ARow);
  case ACol of
    cnsNameCol :
    begin

    end;
    cnsCondCol, cnsVal :
    begin
      case Code of
        cnsRow_Goods :
        begin
          ASelectedObj.ObjType := eotGoods;
          ASelectedObj.ID := AParamAPOper.id_Goods;
          if ASelectedObj.ID = Null then ASelectedObj.ID := -1;
          if SelectObjUnBsn(Owner, AParamAPOper.id_business, ASelectedObj, 0, [eotGoods]) then
          begin
            AParamAPOper.GoodsName := ASelectedObj.Name;
            AParamAPOper.id_Goods := ASelectedObj.ID;
          end;
        end;
        cnsRow_CA :
        begin
          ASelectedObj.ObjType := eotCA;
          if VarIsEmpty(AParamAPOper.id_ContrAgent) then AParamAPOper.id_ContrAgent := Null;
          ASelectedObj.ID := AParamAPOper.id_ContrAgent;
          if SelectCA(Self, ASelectedObj, 0, AParamAPOper.id_business, -1) then
          begin
            AParamAPOper.ADest.Clear;
            AParamAPOper.ADest.PlaceName := '';
            AParamAPOper.ContrAgentName := ASelectedObj.Name;
            AParamAPOper.id_ContrAgent := ASelectedObj.ID;
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
            APlaceACS := AParamAPOper.ASrc
          else
            APlaceACS := AParamAPOper.ADest;
          if APlaceACS.id_Acc <> Null then
          begin
            ASelectedObj.ID := APlaceACS.id_Acc;
            ASelectedObj.ObjType := eotFin;
          end
          else
            if APlaceACS.id_Warehouse <> Null then
            begin
              ASelectedObj.ID := APlaceACS.id_Warehouse;
              ASelectedObj.ObjType := eotWH;
            end
            else
              if APlaceACS.id_Manufact <> Null then
              begin
                ASelectedObj.ID := APlaceACS.id_Manufact;
                ASelectedObj.ObjType := eotManuf;
              end
              else
                if (APlaceACS is TPlaceACSDest) and (TPlaceACSDest(APlaceACS).id_Repr <> Null) then
                begin
                  ASelectedObj.ID := TPlaceACSDest(APlaceACS).id_Repr;
                  ASelectedObj.ObjType := eotRepr;
                end;

          case AParamAPOper.OperVid of
            1 :
            begin
              if Code = cnsRow_DestName then
                AEObjTypes :=[eotManuf, eotManuf]
              else
                AEObjTypes :=[eotWH, eotManuf];
            end;
            2 : AEObjTypes :=[eotFin];
            4 : AEObjTypes :=[];
          end;

          if Code = cnsRow_DestName then
            AEObjTypes := AEObjTypes + [eotRepr];
          if SelectObjUnBsn(Owner, AParamAPOper.id_business, ASelectedObj, 0, AEObjTypes) then
          begin
            APlaceACS.Clear;
            APlaceACS.PlaceName := ASelectedObj.Name;
            case ASelectedObj.ObjType of
              eotFin : APlaceACS.id_Acc := ASelectedObj.ID;
              eotWH : APlaceACS.id_Warehouse := ASelectedObj.ID;
              eotManuf : APlaceACS.id_Manufact := ASelectedObj.ID;
              eotRepr : TPlaceACSDest(APlaceACS).id_Repr := ASelectedObj.ID;
            else
              raise Exception.Create('Неверный тип возвращаемого значения');
            end;
            if APlaceACS = AParamAPOper.ADest then
            begin
              AParamAPOper.ContrAgentName := VarToStr(ASelectedObj.CA_Name);
              AParamAPOper.id_ContrAgent := ASelectedObj.CA_ID;
            end;
          end;
        end;
      end;
      PaintGrid;
    end;
  end;
end;

procedure TfAPCond.AdvStringGrid1CanAddRow(Sender: TObject;
  var CanAdd: Boolean);
begin
  CanAdd := false;
end;

procedure TfAPCond.AdvStringGrid1CanDeleteRow(Sender: TObject;
  ARow: Integer; var CanDelete: Boolean);
begin
  CanDelete := false;
end;

procedure TfAPCond.AdvStringGrid1CanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
var Code : TRowType;
begin
  Code := GetCode(ARow);
  CanEdit := (ACol > 1) and not ((ACol = cnsCondCol) and (Code = cnsRow_SrcName) and (AParamAPOper.OperVid = 4))
             and not ((ACol = cnsVal2) and
              ((Code = cnsRow_SummOper) and (AParamAPOper.CondOper <> apcBTW) or
              (Code = cnsRow_SummSys) and (AParamAPOper.CondSys <> apcBTW)))
               ;
  CanEdit := CanEdit and  (Code <> cnsRow_Bsn);
end;

procedure TfAPCond.elSetEditorFocus(Sender: TObject;
  Grid: TAdvStringGrid; AControl: TWinControl);
begin
  AControl.SetFocus;
end;

procedure TfAPCond.elSetEditorProperties(Sender: TObject;
  Grid: TAdvStringGrid; AControl: TWinControl);
begin
  AControl.Height := 200;
  
end;

procedure TfAPCond.ComboBox1DropDown(Sender: TObject);
begin
  tag := 0;
end;

procedure TfAPCond.elLBSetEditorValue(Sender: TObject;
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

procedure TfAPCond.AdvStringGrid1GetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
var Code : TRowType;
begin
  if not (gdSelected in AState) then
  begin
    Code := GetCode(ARow);
    if AdvStringGrid1.IsSelected(ACol, ARow) and (not AdvStringGrid1.EditMode) then
      AFont.Color := clWhite
    else
      if ((Code = cnsRow_SrcName) and (AParamAPOper.OperVid = 4)) then
        AFont.Color := clGrayText
      else
        if (Code = cnsRow_SummOper) and (AParamAPOper.CondOper <> apcBTW) and (ACol = cnsVal2) then
          AFont.Color := clGrayText
        else
          if (Code = cnsRow_SummSys) and (AParamAPOper.CondSys <> apcBTW) and (ACol = cnsVal2) then
            AFont.Color := clGrayText;
  end
  else
    AFont.Color := clWindow;
end;


procedure TfAPCond.Initialize(id_AP_Obj, id_business : integer; OperVid, ACopy : Variant; AReadOnly: boolean);
var V : Variant;
begin
  AParamAPOper.id_business := id_business;
  Fid_AP_Obj := id_AP_Obj;
  with cdsFormal do
  begin
    Close;
    Params.ParamByName('@id_Bsn').Value := id_business;
    Open;
  end;
  
  with cdsFunc do
  begin
    Close;
    Params.ParamByName('@id_Bsn').Value := id_business;
    Open;
  end;

  with cdsExtData do
  begin
    Close;
    Params.ParamByName('@id_Oper').Value := Null;
    Params.ParamByName('@id_business').Value := id_business;
    Open;
  end;

  with cdsCur do
  begin
    Close;
    Params.ParamByName('@FastAccess').Value := Null;
    Params.ParamByName('@AvForPay').Value := true;
    Params.ParamByName('@id_Bsn').Value := id_business;
    Open;
  end;

  if Fid_AP_Obj > 0 then
  begin
    with cdsAPObj do
    begin
      Close;
      Params.ParamByName('@id_AP_Obj').Value := Fid_AP_Obj;
      Open;
      AParamAPOper.id_business := cdsAPObjid_business.AsVariant;

      AParamAPOper.OperVid := cdsAPObjOperVid.AsVariant;
      AParamAPOper.OperVidName := GetNameByID(cbOperVid.Items, AParamAPOper.OperVid);

      AParamAPOper.OperTypeIn := cdsAPObjOperTypeIn.AsVariant;
      AParamAPOper.OperTypeInName := GetNameByID(cbOperTypeIn.Items, AParamAPOper.OperTypeIn);

      AParamAPOper.Correct := cdsAPObjCorrect.AsVariant;
      AParamAPOper.CorrectName := GetNameByID(cbCorrect.Items, AParamAPOper.Correct);

      AParamAPOper.id_UserCreator := cdsAPObjid_User.AsVariant;

      AParamAPOper.AutoGen := cdsAPObjAutoGen.AsVariant;
      AParamAPOper.AutoGenName := GetNameByID(cbAutoGen.Items, AParamAPOper.AutoGen);
      
      AParamAPOper.Id_CurrencyOper := cdsAPObjId_CurrencyOper.AsVariant;
      AParamAPOper.Id_CurrencySys := cdsAPObjId_CurrencySys.AsVariant;
      AParamAPOper.ASrc.id_Acc := cdsAPObjid_Acc.AsVariant;
      AParamAPOper.ASrc.id_Warehouse := cdsAPObjid_Warehouse.AsVariant;
      AParamAPOper.ASrc.id_Manufact := cdsAPObjid_Manufact.AsVariant;
      AParamAPOper.ADest.id_Acc := cdsAPObjid_Acc_Ext.AsVariant;
      AParamAPOper.ADest.id_Warehouse := cdsAPObjid_Warehouse_Ext.AsVariant;
      AParamAPOper.ADest.id_Manufact := cdsAPObjid_Manufact_Ext.AsVariant;
      AParamAPOper.ADest.id_Repr := cdsAPObjid_Repr.AsVariant;
      AParamAPOper.id_ContrAgent := cdsAPObjid_ContrAgent.AsVariant;

      AParamAPOper.Koeff := cdsAPObjKoeff.AsVariant;
      AParamAPOper.id_FormalDistrib := cdsAPObjid_FormalDistrib.AsVariant;
      AParamAPOper.id_FuncDistrib := cdsAPObjid_FuncDistrib.AsVariant;
      AParamAPOper.OpComment := cdsAPObjOpComment.AsVariant;
      AParamAPOper.Imp_PayBasic := cdsAPObjImp_PayBasic.AsVariant;
      AParamAPOper.AccInv_PayAssignment := cdsAPObjAccInv_PayAssignment.AsVariant;
      AParamAPOper.Contract := cdsAPObjContract.AsVariant;

      AParamAPOper.id_Goods := cdsAPObjid_Goods.AsVariant;

      Edit1.Text := cdsAPObjName.Value;
    end;
    with cdsAPCond do
    begin
      Close;
      Params.ParamByName('@id_AP_Obj').Value := Fid_AP_Obj;
      Open;
      First;
      while not Eof do
      begin
        if not cdsAPCondV_Str.IsNull then
        begin
          AParamAPOper.ValByExtID[cdsAPCondExtID.AsInteger, false] := cdsAPCondV_Str.AsVariant;
        end;
        if not cdsAPCondV_Str2.IsNull then
        begin
          AParamAPOper.ValByExtID[cdsAPCondExtID.AsInteger, true] := cdsAPCondV_Str2.AsVariant;
        end;
        if cdsAPCondExtID.AsInteger = 30 then
        begin
//          AParamAPOper.AutoGen := cdsAPCondV_Str.AsInteger;
          AParamAPOper.AutoGenName := GetNameByID(cbAutoGen.Items, AParamAPOper.AutoGen);
        end;
        if cdsAPCondExtID.AsInteger = 5 then
        begin
          AParamAPOper.CondOper := TAPCond(cdsAPCondAPCond.AsInteger);
          AParamAPOper.CondOperName := GetNameByID(cbCond.Items, AParamAPOper.CondOper);
        end;
        if cdsAPCondExtID.AsInteger = 11 then
        begin
          AParamAPOper.CondSys := TAPCond(cdsAPCondAPCond.AsVariant);
          AParamAPOper.CondSysName := GetNameByID(cbCond.Items, AParamAPOper.CondSys);
        end;
        Next;
      end;
    end;
  end;

  AParamAPOper.BsnName := DM.GetBusinessName(AParamAPOper.id_business);
  AParamAPOper.KoeffName := GetNameByID(cbKoef.Items, AParamAPOper.Koeff);

  AParamAPOper.FormalDistribName := GetCDSNameByID(cdsFormal, 'id_FormalDistrib', 'Name', AParamAPOper.id_FormalDistrib);
  AParamAPOper.FuncDistribName := GetCDSNameByID(cdsFunc, 'id_FuncDistrib', 'Name', AParamAPOper.id_FuncDistrib);
  AParamAPOper.CurOperName := GetCDSNameByID(cdsCur, 'id_Currency', 'Name', AParamAPOper.id_CurrencyOper);
  AParamAPOper.CurSysName := GetCDSNameByID(cdsCur, 'id_Currency', 'Name', AParamAPOper.id_CurrencySys);
  if AParamAPOper.id_Goods <> Null then
  begin
    with cdsGoodsProp do
    begin
      Close;
      Params.ParamByName('@id_Goods').Value := AParamAPOper.id_Goods;
      Open;
      try
       AParamAPOper.GoodsName := cdsGoodsPropName.AsString;
      finally
        Close;
      end;
    end;
  end;

  with AParamAPOper.ASrc do
    if id_Acc <> Null then
      PlaceName := DM.rsCA.AppServer.GetAccName(id_Acc);
  with AParamAPOper.ADest do
    if id_Acc <> Null then
      PlaceName := DM.rsCA.AppServer.GetAccName(id_Acc);

  with AParamAPOper.ASrc do
    if id_Warehouse <> Null then
      PlaceName := DM.rsCA.AppServer.GetWHName(id_Warehouse);
  with AParamAPOper.ADest do
    if id_Warehouse <> Null then
      PlaceName := DM.rsCA.AppServer.GetWHName(id_Warehouse);

  with AParamAPOper.ASrc do
    if id_Manufact <> Null then
      PlaceName := DM.rsCA.AppServer.GetMNName(id_Manufact);
  with AParamAPOper.ADest do
    if id_Manufact <> Null then
      PlaceName := DM.rsCA.AppServer.GetMNName(id_Manufact);

  with AParamAPOper.ADest do
    if id_Repr <> Null then
      PlaceName := DM.rsCA.AppServer.GetReprName(id_Repr);

  with AParamAPOper do
    if id_ContrAgent <> Null then
      ContrAgentName := DM.rsCA.AppServer.GetCAName(id_ContrAgent);
 { with AParamAPOper do
    if id_AccGroup <> Null then
      id_AccGroup    }
  if ACopy then
  begin
    Fid_AP_Obj := -1;
    Edit1.Text := 'новое';
  end;
  PaintGrid;
end;

procedure TfAPCond.elCorrGetEditorValue(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
  begin
    AValue := TComboBox(TFormControlEditLink(Sender).Control).Text;
    AParamAPOper.CorrectName := AValue;
    AParamAPOper.Correct := cbCorrect.ItemIndex = 1;
  end;
end;

procedure TfAPCond.elOperVidSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
    with TComboBox(TFormControlEditLink(Sender).Control) do
      ItemIndex := GetIndex(Items, AParamAPOper.OperVid);
end;

procedure TfAPCond.elOperVidGEV(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
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
    if AParamAPOper.ADest.id_Repr = Null then
    begin
      AParamAPOper.ADest.Clear;
      AParamAPOper.ADest.PlaceName := '';
    end;
  end;
  PaintGrid;
end;

procedure TfAPCond.elOTypeSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
    with TComboBox(TFormControlEditLink(Sender).Control) do
      ItemIndex := GetIndex(Items, AParamAPOper.OperTypeIn);
end;

procedure TfAPCond.elOTypeGEV(Sender: TObject;
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

function TfAPCond.GetIndex(SL: TStrings; V: Variant) : integer;
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

function TfAPCond.GetVal(SL: TStrings; Index: integer) : Variant;
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


procedure TfAPCond.cbOperTypeInKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    (Sender as TComboBox).ItemIndex := -1;
end;

procedure TfAPCond.elCorGEV(Sender: TObject; Grid: TAdvStringGrid;
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

procedure TfAPCond.elCorrSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
    with TComboBox(TFormControlEditLink(Sender).Control) do
      ItemIndex := GetIndex(Items, AParamAPOper.Correct);
end;


procedure TfAPCond.elKoeffGEV(Sender: TObject; Grid: TAdvStringGrid;
  var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
  begin
    with TComboBox(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.Koeff := GetVal(Items, ItemIndex);
    end;
  end;
  AParamAPOper.KoeffName := AValue;
end;

procedure TfAPCond.elKoeffSEV(Sender: TObject; Grid: TAdvStringGrid;
  AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
    with TComboBox(TFormControlEditLink(Sender).Control) do
      ItemIndex := GetIndex(Items, AParamAPOper.Koeff);
end;

function TfAPCond.AP_CondAdd(id_AP_Obj, ExtID: Integer; V_Str, V_Str2: OleVariant; APCond: TAPCond): Integer;
begin
  if VarIsEmpty(V_Str) then V_Str := Null;
  if VarIsEmpty(V_Str2) then V_Str2 := Null;
  if (VarToStr(V_Str) <> '') or (VarToStr(V_Str2) <> '') then
    Result := DM.rsCA.AppServer.AP_CondAdd(id_AP_Obj, ExtID, APCond, V_Str, V_Str2);
end;

function TfAPCond.SaveProp: boolean;
  function IDPropAdd(ExtID : integer): integer;
  var V : Variant;
      PV : PVariant;
      V_Str, V_Str2: OleVariant;
      APCond: TAPCond;
  begin
    PV := AParamAPOper.GetPropByExtID(ExtID, false);
    if PV <> nil then
    begin
      V := PV^;
      APCond := apcEQ;
      if VarType(V) = varDouble then
        V_Str := StringReplace(VarToStr(V), ',', '.', [rfReplaceAll, rfIgnoreCase])
      else
        V_Str := V;
      V_Str2 := Null;
      if (ExtID = 5) or (ExtID = 11) then
      begin
        if ExtID = 5 then
          APCond := TAPCond(AParamAPOper.CondOper)
        else
          APCond := TAPCond(AParamAPOper.CondSys);
        if APCond in [apcBTW, apcNotBTW] then
        begin
          PV := AParamAPOper.GetPropByExtID(ExtID, true);
          if PV <> nil then
            V_Str2 := PV^;
        end
        else
           V_Str2 := Null;
      end;
      //1013
      if (ExtID in [17, 18, 19, 20]) then
        APCond := apcLike;
      Result := AP_CondAdd(id_AP_Obj, ExtID, V_Str, V_Str2, APCond);
    end
    else
      Result := 0;
  end;
var OldCursor : TCursor;
    tmpID, RezID : integer;
    i, j : integer;
begin
  if AParamAPOper.OperVid = 4 then
  begin
    AParamAPOper.ASrc.Clear;
    AParamAPOper.Koeff := 0;
  //  AParamAPOper.id_FormalDistrib := Null;
  //  AParamAPOper.id_FuncDistrib := Null;

    AParamAPOper.id_CurrencySys := Null;
    AParamAPOper.SummSys1 := Null;
    AParamAPOper.SummSys2 := Null;
  end;

  if AParamAPOper.OperVid <> 1 then
  begin
    AParamAPOper.id_Goods := Null;
  end;

  tmpID := id_AP_Obj;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;


  BeginTruns(DM.rsCA);
  try
    RezID := DM.rsCA.AppServer.AP_ObjEdit(id_AP_Obj,
                                          AParamAPOper.id_business,
                                          AParamAPOper.OperVid,
                                          AParamAPOper.OperTypeIn,
                                          AParamAPOper.Correct,
                                          Edit1.Text,
                                          DM.IDUser,

                                          AParamAPOper.AutoGen,
                                          AParamAPOper.Id_CurrencyOper,
                                          AParamAPOper.Id_CurrencySys,
                                          AParamAPOper.ASrc.id_Acc,
                                          AParamAPOper.ASrc.id_Warehouse,
                                          AParamAPOper.ASrc.id_Manufact,
                                          AParamAPOper.ADest.id_Acc,
                                          AParamAPOper.ADest.id_Warehouse,
                                          AParamAPOper.ADest.id_Manufact,
                                          AParamAPOper.ADest.id_Repr,
                                          AParamAPOper.id_ContrAgent,

                                          AParamAPOper.Koeff,
                                          AParamAPOper.id_FormalDistrib,
                                          AParamAPOper.id_FuncDistrib,
                                          AParamAPOper.OpComment,
                                          AParamAPOper.Imp_PayBasic,
                                          AParamAPOper.AccInv_PayAssignment,
                                          AParamAPOper.Contract,
                                          AParamAPOper.id_Goods
                                          );
    if RezID = -1 then
      raise Exception.Create('Ошибка при сохранении');
    if tmpID = -1 then
      Fid_AP_Obj := RezID;
      
    RezID := DM.rsCA.AppServer.AP_CondClear(id_AP_Obj);
    if RezID = -1 then
      raise Exception.Create('Ошибка при сохранении');

    with AParamAPOper do
    begin
      for i := 1 to 120 do
        if IDPropAdd(i) = -1 then
          raise Exception.Create('Ошибка при сохранении');
      for j := 1 to 2 do
        for i := 1 to 15 do
          if IDPropAdd(-ToXXX(j, i)) = -1 then
            raise Exception.Create('Ошибка при сохранении');
    end;
    CommitTrans(DM.rsCA);
    Result := true;
  except
    on E : Exception do
    begin
      Screen.Cursor := OldCursor;
      RollbackTrans(DM.rsCA);
      Fid_AP_Obj := tmpID;
      raise Exception.Create(E.Message);
    end;
  end;
  Screen.Cursor := OldCursor;
end;

function TfAPCond.GetNameByID(SL: TStrings; V: Variant): String;
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

function TfAPCond.GetCDSNameByID(CDS: TClientDataSet; AKeyName, AName : String;
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

{ TParamAPOper }

constructor TParamAPOper.Create;
var Val_obj : TVal_obj;
    i : integer;
begin
  FDigList := TObjectList.Create(true);
  FStrList := TObjectList.Create(true);
  for i := 1 to 15 do
  begin
    FDigList.Add(TVal_obj.Create(Null));
    FStrList.Add(TVal_obj.Create(Null));
  end;

  ASrc := TPlaceACS.Create;
  ADest := TPlaceACSDest.Create;
  id_Obj := -1;
  CondOper := apcEQ;
  CondSys := apcEQ;

  id_Goods := Null;
  OperVid := Null;
  OperTypeIn := Null;

  id_UserCreator := Null;
  id_UserChecker := Null;
  id_business := Null;

 { id_Acc := Null;
  id_Warehouse := Null;
  id_Manufact := Null;  }

  id_ContrAgent := Null;

  {id_Repr := Null;
  id_Acc_Ext := Null;
  id_Warehouse_Ext := Null;
  id_Manufact_Ext := Null;   }

  Koeff := Null;
  AutoGen := Null;

  id_FormalDistrib := Null;
  id_FuncDistrib := Null;

  id_CAGroup := Null;
  id_WarehouseGroup := Null;
  id_AccGroup := Null;
  id_ManufactGroup := Null;

  Correct := Null;
  id_CurrencyOper := Null;
  SummOper1 := Null;
  SummOper2 := Null;
  id_CurrencySys := Null;
  SummSys1 := Null;
  SummSys2 := Null;

  Imp_PayBasic := Null;
  AccInv_PayAssignment := Null;
  Contract := Null;
  OpComment := Null;
end;

destructor TParamAPOper.Destroy;
begin
  FDigList.Free;
  FStrList.Free;
  
  ASrc.Free;
  ADest.Free;
  inherited;
end;

procedure TfAPCond.elFormalGEV(Sender: TObject; Grid: TAdvStringGrid;
  var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TRxDBLookupCombo then
  begin
    with TRxDBLookupCombo(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.id_FormalDistrib := KeyValue;
    end;
  end;
  AParamAPOper.FormalDistribName := AValue;
end;

procedure TfAPCond.elFuncGEV(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TRxDBLookupCombo then
  begin
    with TRxDBLookupCombo(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.id_FuncDistrib := KeyValue;
    end;
  end;
  AParamAPOper.FuncDistribName := AValue;
end;

procedure TfAPCond.elFormalSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TRxDBLookupCombo then
    with TRxDBLookupCombo(TFormControlEditLink(Sender).Control) do
      KeyValue := VarToStr(AParamAPOper.id_FormalDistrib);
end;

procedure TfAPCond.elFuncSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TRxDBLookupCombo then
    with TRxDBLookupCombo(TFormControlEditLink(Sender).Control) do
      KeyValue := VarToStr(AParamAPOper.id_FuncDistrib);
end;

procedure TfAPCond.AdvStringGrid1CellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
var Code : TRowType;
    S : String;
    X : integer;
    AType, ANum: integer;
    V : Variant;
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
    cnsCondCol, cnsVal, cnsVal2 :
    begin
      S := Value;//AdvStringGrid1.Cells[ACol, ARow];
      if S = '' then
        V := Null
      else
        V := S;
      case Code of
//        cnsRow_OType : PaintGrid;
        cnsRow_Imp_PayBasic : AParamAPOper.Imp_PayBasic := V;
        cnsRow_AccInv_PayAssignment : AParamAPOper.AccInv_PayAssignment := V;
        cnsRow_Contract : AParamAPOper.Contract := V;
        cnsRow_Comment : AParamAPOper.OpComment := V;

        cnsRow_SrcName : AParamAPOper.ASrc.Clear;
        cnsRow_DestName : AParamAPOper.ADest.Clear;
        cnsRow_CA : AParamAPOper.id_ContrAgent := Null;

        cnsRow_SummOper :
        begin
          case ACol of
            cnsVal : if V = Null then AParamAPOper.SummOper1 := Null else AParamAPOper.SummOper1 := StrToFloatAdv(V);
            cnsVal2 : if V = Null then AParamAPOper.SummOper2 := Null else AParamAPOper.SummOper2 := StrToFloatAdv(V);
          end;
        end;
        cnsRow_SummSys :
        begin
          case ACol of
            cnsVal : if V = Null then AParamAPOper.SummSys1 := Null else AParamAPOper.SummSys1 := StrToFloatAdv(V);
            cnsVal2 : if V = Null then AParamAPOper.SummSys2 := Null else AParamAPOper.SummSys2 := StrToFloatAdv(V);
          end;
        end;

        cnsRow_None :
        begin
          if X < 0 then
          begin
            FromXXX(X, AType, ANum);
            if AType = 1 then
            begin
              if V = Null then
                AParamAPOper.Dig[ANum - 1] := Null
              else
                AParamAPOper.Dig[ANum - 1] := StrToFloatAdv(S)
            end
            else
              if AType = 2 then
                AParamAPOper.Str[ANum - 1] := S
          end;
        end;
  {      else
          Valid := false; }
      end;
    end;
  end;
  PaintGrid;
end;

function TParamAPOper.GetDig(index: integer): Variant;
begin
  Result := TVal_obj(FDigList[index]).ID;
end;

function TParamAPOper.GetPropByExtID(AExtID: integer; isSec : boolean): PVariant;
var i, N : integer;
    AList : TList;
begin
  Result := nil;
  if AExtID < 0 then
  begin    
    FromXXX(AExtID, i, N);
    case i of
      1 : AList := FDigList;
      2 : AList := FStrList;
    end;
    if AList.Count > i then
      Result := @TVal_obj(AList[N - 1]).ID;
  end
  else
  begin
    case AExtID of
   {   1 : Result := @ASrc.id_Acc;
      2 : Result := @ASrc.id_Warehouse;
      3 : Result := @ADest.id_Repr;
      4 : Result := @koeff;


      6 : Result := @ASrc.id_Manufact;
      7 : Result := @ADest.id_Acc;
      8 : Result := @ADest.id_Warehouse;
      9 : Result := @ADest.id_Manufact;  }

      5 : if isSec then Result := @SummOper2 else Result := @SummOper1;
      11 : if isSec then Result := @SummSys2 else Result := @SummSys1;

     { 12 : Result := @id_CurrencySys;
      13 : Result := @id_CurrencyOper;

      14 : Result := @id_FormalDistrib;
      15 : Result := @id_FuncDistrib;

      16 : Result := @id_ContrAgent;
      17 : Result := @Imp_PayBasic;
      18 : Result := @AccInv_PayAssignment;
      19 : Result := @Contract;
      20 : Result := @OpComment;   }
      21 : Result := @id_CAGroup;
      22 : Result := @id_WarehouseGroup;
      23 : Result := @id_AccGroup;
      24 : Result := @id_ManufactGroup;

  //    30 : Result := @AutoGen;
    end;
  end;
end;

function TParamAPOper.GetStr(index: integer): Variant;
begin
  Result := TVal_obj(FStrList[index]).ID;
end;

function TParamAPOper.GetValByExtID(AExtID: integer; isSec : boolean): Variant;
var PV : PVariant;
begin
  PV := GetPropByExtID(AExtID, isSec);
  if PV <> nil then
    Result := PV^;
end;

procedure TParamAPOper.SetDig(index: integer; const Value: Variant);
begin
  TVal_obj(FDigList[index]).ID := Value;
end;

procedure TParamAPOper.SetStr(index: integer; const Value: Variant);
begin
  TVal_obj(FStrList[index]).ID := Value;
end;

procedure TParamAPOper.SetValByExtID(AExtID: integer; isSec : boolean;
  const Value: Variant);
var PV : PVariant;
begin
  PV := GetPropByExtID(AExtID, isSec);
  if PV <> nil then
    PV^ := Value;
end;

{ TPlaceACS }

procedure TPlaceACS.Clear;
begin
  id_Acc := Null;
  id_Warehouse := Null;
  id_Manufact := Null;
  PlaceName := '';
end;

constructor TPlaceACS.Create;
begin
  inherited Create;
  id_Acc := Null;
  id_Warehouse := Null;
  id_Manufact := Null;
end;

procedure TfAPCond.AdvStringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (TAdvStringGrid(Sender).EditLink <> nil) then
    Key := #0;
end;

procedure TfAPCond.AdvStringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (TAdvStringGrid(Sender).EditLink <> nil) then
    Key := 0;
end;

{ TPlaceACSDest }

procedure TPlaceACSDest.Clear;
begin
  inherited;
  id_Repr := Null;
end;

constructor TPlaceACSDest.Create;
begin
  inherited Create;
  id_Repr := Null;
end;

procedure TfAPCond.elCurOperGEV(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TRxDBLookupCombo then
  begin
    with TRxDBLookupCombo(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.id_CurrencyOper := KeyValue;
    end;
  end;
  AParamAPOper.CurOperName := AValue;

end;

procedure TfAPCond.elCurOperSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TRxDBLookupCombo then
    with TRxDBLookupCombo(TFormControlEditLink(Sender).Control) do
      KeyValue := VarToStr(AParamAPOper.id_CurrencyOper);
end;

procedure TfAPCond.elCurSysGEV(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TRxDBLookupCombo then
  begin
    with TRxDBLookupCombo(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.id_CurrencySys := KeyValue;
    end;
  end;
  AParamAPOper.CurSysName := AValue;
end;

procedure TfAPCond.elCurSysSEV(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TDBLookupComboBox then
    with TDBLookupComboBox(TFormControlEditLink(Sender).Control) do
      KeyValue := VarToStr(AParamAPOper.id_CurrencySys);
end;

procedure TfAPCond.edCondOperGetEditorValue(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
  begin
    with TComboBox(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      if Sender = edCondOper then
        AParamAPOper.CondOper := TAPCond(GetVal(Items, ItemIndex))
      else
        AParamAPOper.CondSys := TAPCond(GetVal(Items, ItemIndex));
    end;
  end;
  if Sender = edCondOper then
    AParamAPOper.CondOperName := AValue
  else
    AParamAPOper.CondSysName := AValue;
end;

procedure TfAPCond.edCondOperSetEditorValue(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
var V : Variant;
begin
  if Sender = edCondOper then
    V := AParamAPOper.CondOper
  else
    V := AParamAPOper.CondSys;

  if TFormControlEditLink(Sender).Control is TComboBox then
    with TComboBox(TFormControlEditLink(Sender).Control) do
      ItemIndex := GetIndex(Items, V);
end;

procedure TfAPCond.elCurSysSetEditorProperties(Sender: TObject;
  Grid: TAdvStringGrid; AControl: TWinControl);
begin
 // AControl.Width := 400;
end;

procedure TfAPCond.elCurOperSetEditorProperties(Sender: TObject;
  Grid: TAdvStringGrid; AControl: TWinControl);
begin
//AControl.Width := 400;
end;

procedure TfAPCond.alAGGev(Sender: TObject; Grid: TAdvStringGrid;
  var AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
  begin
    with TComboBox(TFormControlEditLink(Sender).Control) do
    begin
      AValue := Text;
      AParamAPOper.AutoGen := GetVal(Items, ItemIndex);
    end;
  end;
  AParamAPOper.AutoGenName := AValue;

end;

procedure TfAPCond.alAGSev(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if TFormControlEditLink(Sender).Control is TComboBox then
    with TComboBox(TFormControlEditLink(Sender).Control) do
      ItemIndex := GetIndex(Items, AParamAPOper.AutoGen);
end;

procedure TfAPCond.miClearParClick(Sender: TObject);
var Code : TRowType;
    X : integer;
begin
  X := integer(AdvStringGrid1.Objects[1, AdvStringGrid1.Row]);
  if X > 0 then
    Code := TRowType(X)
  else
    Code := cnsRow_None;
  if Code in [cnsRow_SrcName, cnsRow_DestName, cnsRow_CA, cnsRow_Goods] then
  begin
    case Code of
      cnsRow_SrcName : AParamAPOper.ASrc.Clear;
      cnsRow_DestName : AParamAPOper.ADest.Clear;
      cnsRow_CA :
      begin
        AParamAPOper.id_ContrAgent := Null;
        AParamAPOper.ContrAgentName := '';
      end;
      cnsRow_Goods :
      begin
        AParamAPOper.id_Goods := Null;
        AParamAPOper.GoodsName := '';
      end;
    end;
    PaintGrid;
  end;
end;

procedure TfAPCond.PopupMenu1Popup(Sender: TObject);
var Code : TRowType;
    X : integer;
begin
  X := integer(AdvStringGrid1.Objects[1, AdvStringGrid1.Row]);
  if X > 0 then
    Code := TRowType(X)
  else
    Code := cnsRow_None;
  miClearPar.Enabled := Code in [cnsRow_SrcName, cnsRow_DestName, cnsRow_CA, cnsRow_Goods];
end;

end.
