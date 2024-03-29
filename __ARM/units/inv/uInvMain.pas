unit uInvMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RxLookup, Grids, BaseGrid, AdvGrid, AdvCGrid, Mask,
  ToolEdit, CurrEdit, Buttons, Db, DBClient, DBCtrls,
  RXDBCtrl, ComCtrls, Provider, MtUPDPrv, ADODB, DBGridEh, ActnList,
  ImgList, ToolWin, Menus, RXCtrls, DBGrids, ComObj, GridsEh, frKomp;

const
  cnsNameCol = 1;
  cnsTitle = 0;
type
  TRowType = (cnsRow_None,
              cnsRow_HF_Amount, cnsRow_HF_Price, cnsRow_Raw_Price, cnsRow_Raw_PriceStat, cnsRow_Raw_Price_All,
              cnsRow_TM_Time, cnsRow_TM_Tuning, cnsRow_TM_Klishe, cnsRow_TM_Price,
              cnsRow_W_Amount, cnsRow_HF_Sum, cnsRow_Raw_TotalSum,
              cnsRow_TM_Total, cnsRow_TM_TotalSum, cnsRow_TotalSum,
              cnsRow_Invoice, cnsRow_KL_inv
              );
  TInvObj = class;
  
  TLineObj = class
  private
    FInvObj : TInvObj;
    HF_Amount, HF_Price, Raw_Price, Raw_PriceStat,
    TM_Time, TM_Tuning, TM_Klishe, TM_Price,
    W_Amount  : Variant;
    Fid_Lines : integer;
    FPrior : TLineObj;
    Fname : String;
    id_Manufact, id_Manufact2, id_Manufact3 : integer;
    function GetHF_Sum: Variant;
    function GetRaw_TotalSum: Variant;
    function GetTM_Total: Variant;
    function GetTM_TotalSum: Variant;
    function GetTotalSum: Variant;
    function GetInv: Variant;
    function GetRaw_Price_All: Variant;
  public
    constructor Create(AInvObj : TInvObj; AName : String);

    property HF_Sum : Variant read GetHF_Sum;

    property Raw_Price_All : Variant read GetRaw_Price_All;

    property Raw_TotalSum : Variant read GetRaw_TotalSum;
    property TM_Total : Variant read GetTM_Total;
    property TM_TotalSum : Variant read GetTM_TotalSum;

    property TotalSum : Variant read GetTotalSum;
    property Invoice : Variant read GetInv;
    property Name : String read FName;

    function isNoData : boolean;
  end;

  TInvObj = class
  private
    FNR_Delta : Extended;
    function GetLineObj(index: integer): TLineObj;
    function GetTT_Raw_TotalSum: Variant;
    function GetTT_TM_Klishe: Variant;
    function GetTT_TM_Time: Variant;
    function GetTT_TM_Total: Variant;
    function GetTT_TM_TotalSum: Variant;
    function GetTT_TM_Tuning: Variant;
    function GetTT_TotalSum: Variant;
    function GetTT_Price: Variant;
    function GetTT_PriceStat: Variant;
    function TT_GetRaw_Price_All: Variant;
    function GetTT_HF_Sum: Variant;
  public
    LN_1_Form, LN_2_Print, LN_3_Lam, LN_4_Div : TLineObj;
    FLineList : TList;
    constructor Create;
    destructor Destroy;

    procedure DoCalc(APrev : boolean= false);

    property LineObj[index : integer] : TLineObj read GetLineObj;

    property TT_Raw_Price_All : Variant read TT_GetRaw_Price_All;

    property TT_Raw_TotalSum : Variant read GetTT_Raw_TotalSum;
    property TT_TM_Time : Variant read GetTT_TM_Time;
    property TT_TM_Tuning : Variant read GetTT_TM_Tuning;
    property TT_TM_Klishe : Variant read GetTT_TM_Klishe;
    property TT_TM_Total : Variant read GetTT_TM_Total;
    property TT_TM_TotalSum : Variant read GetTT_TM_TotalSum;
    property TT_TotalSum : Variant read GetTT_TotalSum;

    property TT_Price : Variant read GetTT_Price;
    property TT_PriceStat : Variant read GetTT_PriceStat;
    property TT_HF_Sum : Variant read GetTT_HF_Sum;

  end;

  TInvMain = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    Button1: TButton;
    Panel1: TPanel;
    DateEdit1: TDBDateEdit;
    edNum: TDBEdit;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edName2: TDBEdit;
    dsInv_Rep: TDataSource;
    PageControl1: TPageControl;
    tsTab: TTabSheet;
    tsTime: TTabSheet;
    tsRez: TTabSheet;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    Label11: TLabel;
    DBEdit4: TDBEdit;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    Label13: TLabel;
    DBEdit6: TDBEdit;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    Label15: TLabel;
    DBEdit8: TDBEdit;
    Label16: TLabel;
    DBEdit9: TDBEdit;
    Label17: TLabel;
    DBEdit10: TDBEdit;
    Label18: TLabel;
    DBEdit11: TDBEdit;
    cdsInv_Rep: TClientDataSet;
    cdsInv_RepceSumm_old: TFloatField;
    cdsInv_Repid_Project: TAutoIncField;
    cdsInv_RepName: TStringField;
    cdsInv_Repid_User: TIntegerField;
    cdsInv_RepPrjNum: TIntegerField;
    cdsInv_RepPrjDate: TDateTimeField;
    cdsInv_RepDateCreate: TDateTimeField;
    cdsInv_Repid_Inv: TIntegerField;
    cdsInv_RepDisabled: TBooleanField;
    cdsInv_RepAmount1: TFloatField;
    cdsInv_RepAmount2: TFloatField;
    cdsInv_RepInv1: TFloatField;
    cdsInv_RepInv2: TFloatField;
    cdsInv_RepPrice: TFloatField;
    cdsInv_RepKlishe_Inv1: TFloatField;
    cdsInv_RepKlishe_Inv2: TFloatField;
    cdsInv_RepKlishe_Price: TFloatField;
    cdsInv_RepKlishe_Amount: TFloatField;
    cdsInv_RepTime_FormPrice: TFloatField;
    cdsInv_RepTime_Form1: TDateTimeField;
    cdsInv_RepTime_Form2: TDateTimeField;
    cdsInv_RepTime_Form_Time: TDateTimeField;
    cdsInv_RepTime_Form_Tuning: TDateTimeField;
    cdsInv_RepTime_FormDelta: TDateTimeField;
    cdsInv_RepTime_PrintPrice: TFloatField;
    cdsInv_RepTime_Print1: TDateTimeField;
    cdsInv_RepTime_Print2: TDateTimeField;
    cdsInv_RepTime_Print_Time: TDateTimeField;
    cdsInv_RepTime_Print_Tuning: TDateTimeField;
    cdsInv_RepTime_PrintDelta: TDateTimeField;
    cdsInv_RepTime_LamPrice: TFloatField;
    cdsInv_RepTime_Lam1: TDateTimeField;
    cdsInv_RepTime_Lam2: TDateTimeField;
    cdsInv_RepTime_Lam_Time: TDateTimeField;
    cdsInv_RepTime_Lam_Tuning: TDateTimeField;
    cdsInv_RepTime_LamDelta: TDateTimeField;
    cdsInv_RepTime_RezPrice: TFloatField;
    cdsInv_RepTime_Rez1: TDateTimeField;
    cdsInv_RepTime_Rez2: TDateTimeField;
    cdsInv_RepTime_Rez_Time: TDateTimeField;
    cdsInv_RepTime_Rez_Tuning: TDateTimeField;
    cdsInv_RepTime_RezDelta: TDateTimeField;
    cdsInv_RepRaw_FormAmount: TFloatField;
    cdsInv_RepRaw_Form1: TFloatField;
    cdsInv_RepRaw_Form2: TFloatField;
    cdsInv_RepRaw_FormPriceStat: TFloatField;
    cdsInv_RepRaw_FormDelta: TFloatField;
    cdsInv_RepRaw_PrintAmount: TFloatField;
    cdsInv_RepRaw_Print1: TFloatField;
    cdsInv_RepRaw_Print2: TFloatField;
    cdsInv_RepRaw_PrintPriceStat: TFloatField;
    cdsInv_RepRaw_PrintDelta: TFloatField;
    cdsInv_RepRaw_LamAmount: TFloatField;
    cdsInv_RepRaw_Lam1: TFloatField;
    cdsInv_RepRaw_Lam2: TFloatField;
    cdsInv_RepRaw_LamPriceStat: TFloatField;
    cdsInv_RepRaw_LamDelta: TFloatField;
    cdsInv_RepRaw_RezAmount: TFloatField;
    cdsInv_RepRaw_Rez1: TFloatField;
    cdsInv_RepRaw_Rez2: TFloatField;
    cdsInv_RepRaw_RezPriceStat: TFloatField;
    cdsInv_RepRaw_RezDelta: TFloatField;
    cdsInv_Repid_Goods: TIntegerField;
    cdsInv_RepWNAme: TStringField;
    cdsTime2: TClientDataSet;
    cdsTime2id_TimeItem: TAutoIncField;
    cdsTime2Val: TDateTimeField;
    cdsTime2id_TimeDict: TIntegerField;
    cdsTime2id_Project: TIntegerField;
    cdsTime2Name: TStringField;
    cdsTime2LName: TStringField;
    DataSource1: TDataSource;
    grdTime: TDBGridEh;
    cdsTime2ValPlan: TDateTimeField;
    cdsTime2Val2: TFloatField;
    cdsTime2rrr: TDateTimeField;
    cdsTime2ValPlan2: TFloatField;
    tsWare: TTabSheet;
    cdsInvWare: TClientDataSet;
    dsInvWare: TDataSource;
    cdsInvWareid_Inv_Ware: TIntegerField;
    cdsInvWareid_Project: TIntegerField;
    cdsInvWareid_Goods: TIntegerField;
    cdsInvWareid_Measure: TIntegerField;
    cdsInvWareid_Manufact: TIntegerField;
    cdsInvWareAmountPlan: TFloatField;
    cdsInvWarePricePlan: TFloatField;
    cdsInvWareAmount: TFloatField;
    cdsInvWareSumm: TFloatField;
    cdsInvWareGName: TStringField;
    cdsInvWareMSName: TStringField;
    cdsInvWareMNName: TStringField;
    grdRaw: TDBGridEh;
    cdsInvWareNumb: TIntegerField;
    cdsInvWareSummOper2: TFloatField;
    Panel3: TPanel;
    ilImage: TImageList;
    ActionList1: TActionList;
    aAddWare: TAction;
    aDelWare: TAction;
    aClearWare: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    cbMnList: TComboBox;
    Label19: TLabel;
    btnGetRaw: TButton;
    cdsInvWareDelta: TFloatField;
    cdsInvWarePriceAvg: TFloatField;
    cdsTime2TimePricePlan: TFloatField;
    cdsTime2SummPlan: TFloatField;
    cdsTime2Val2_2: TFloatField;
    cdsTime2ValPlan2_2: TFloatField;
    tsPred: TTabSheet;
    cdsInv_RepCalcDate: TDateTimeField;
    cdsInv_RepCheckDate: TDateTimeField;
    cdsInv_RepID_Main: TIntegerField;
    ToolBar2: TToolBar;
    BitBtn4: TBitBtn;
    ToolBar3: TToolBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cdsTime2id_Lines: TIntegerField;
    asgInv: TAdvColumnGrid;
    asgPrev: TAdvColumnGrid;
    ToolBar4: TToolBar;
    BitBtn3: TBitBtn;
    Label20: TLabel;
    edAmount1: TDBEdit;
    Button4: TButton;
    DBEdit12: TDBEdit;
    Label21: TLabel;
    cdsTime2rrrPPP: TFloatField;
    cdsInv_RepceSumm2_old: TFloatField;
    btnCalcInv: TButton;
    cdsInv_RepKlishe_Price2: TFloatField;
    cdsInv_RepKlishe_Amount2: TFloatField;
    cdsInv_RepLastUpdated: TBytesField;
    cdsInv_Repid_lc: TIntegerField;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    RxSpeedButton1: TRxSpeedButton;
    pmDet: TPopupMenu;
    p1: TMenuItem;
    cbFFF: TComboBox;
    cdsInv_RepComment: TStringField;
    TabSheet1: TTabSheet;
    DBMemo1: TDBMemo;
    cdsTime2ExtID: TIntegerField;
    Button2: TButton;
    tsBuh: TTabSheet;
    cdsBuh: TClientDataSet;
    dsBuh: TDataSource;
    cdsBuhid_Goods: TIntegerField;
    cdsBuhId_Ctg_Goods: TIntegerField;
    cdsBuhid_Measure: TIntegerField;
    cdsBuhAmount: TFloatField;
    cdsBuhSumm: TFloatField;
    cdsBuhDateCreate: TDateTimeField;
    cdsBuhGName: TStringField;
    cdsBuhMSName: TStringField;
    cdsBuhS_ord: TIntegerField;
    cdsBuh_GP: TClientDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField4: TIntegerField;
    dsBuh_GP: TDataSource;
    GroupBox1: TGroupBox;
    dbgBGP: TRxDBGrid;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    dbgB: TRxDBGrid;
    Panel4: TPanel;
    BitBtn5: TBitBtn;
    Button5: TButton;
    ceKlishe_Inv: TCurrencyEdit;
    Label25: TLabel;
    cePlenka_Inv: TCurrencyEdit;
    Label26: TLabel;
    ceKlishe_price: TCurrencyEdit;
    Label27: TLabel;
    Label28: TLabel;
    cePlenka_price: TCurrencyEdit;
    Panel5: TPanel;
    Label3: TLabel;
    cePrice: TDBEdit;
    Label4: TLabel;
    ceAmount: TDBEdit;
    Label5: TLabel;
    ceSumm_old: TDBEdit;
    DBEdit15_old: TDBEdit;
    Label24: TLabel;
    DBEdit14: TDBEdit;
    Label23: TLabel;
    DBEdit13: TDBEdit;
    Label22: TLabel;
    edWare: TDBEdit;
    Button3: TButton;
    Label2: TLabel;
    cdsBuh_GPTT: TAggregateField;
    cdsInv_RepInv_Prev: TFloatField;
    cdsInv_RepInv_Real: TFloatField;
    cdsInv_RepKL_PRev: TFloatField;
    cdsInv_RepKL_Real: TFloatField;
    cdsInv_RepKL_Price: TFloatField;
    cdsInv_RepPrice_Real: TFloatField;
    cdsTime2SummF: TFloatField;
    cdsInv_RepKomposit: TStringField;
    cdsInv_RepOwnName: TStringField;
    edOwnName: TDBEdit;
    Label29: TLabel;
    edKomposit: TDBEdit;
    Label30: TLabel;
    cdsInv_RepCheckDateFact: TDateTimeField;
    cdsInv_RepSendFact: TDateTimeField;
    cdsInvWarePLLid_Goods: TIntegerField;
    cdsInvWareFPP: TBooleanField;
    cdsInvWarePPPPrice: TFloatField;
    cdsInvWarePPPPricePlan: TFloatField;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    cdsInvWareK_AmountPlan: TFloatField;
    cdsInvWareK_Amount: TFloatField;
    cdsInvWare2: TClientDataSet;
    cdsInvWare2id_Goods: TIntegerField;
    cdsInvWare2id_Manufact_Ext: TIntegerField;
    cdsInvWare2AmountOper: TFloatField;
    cdsInvWare2Name: TStringField;
    cdsInvWarezzzz_PPPPrice: TAggregateField;
    RxSpeedButton2: TRxSpeedButton;
    pmDetRaw: TPopupMenu;
    pmViza: TPopupMenu;
    sbViza: TRxSpeedButton;
    aVisa: TMenuItem;
    aVisaFact: TMenuItem;
    cdsInv_RepxxxDate: TDateTimeField;
    cdsInv_Repid_Checker: TIntegerField;
    cdsInv_Repid_CheckerFFF: TIntegerField;
    cdsInv_RepFIO: TStringField;
    cdsInv_RepFIOFFF: TStringField;
    Label31: TLabel;
    DBEdit15: TDBEdit;
    Label32: TLabel;
    DBEdit18: TDBEdit;
    ToolButton8: TToolButton;
    Button6: TButton;
    btnSelCA2: TBitBtn;
    fKomp1: TfKomp;
    Label33: TLabel;
    cbLineNum: TComboBox;
    cdsInv_Repid_BSN: TIntegerField;
    cdsInv_RepOLD_PPP: TIntegerField;
    cdsInv_RepLineNum: TIntegerField;
    btn1C: TButton;
    cdsInvWare1C: TClientDataSet;
    cdsInvWare1Cid_Inv_Ware: TIntegerField;
    cdsInvWare1Cid_Project: TIntegerField;
    cdsInvWare1Cid_Goods: TIntegerField;
    cdsInvWare1Cid_Measure: TIntegerField;
    cdsInvWare1Cid_Manufact: TIntegerField;
    cdsInvWare1CAmountPlan: TFloatField;
    cdsInvWare1CPricePlan: TFloatField;
    cdsInvWare1CAmount: TFloatField;
    cdsInvWare1CSumm: TFloatField;
    cdsInvWare1CGName: TStringField;
    cdsInvWare1CMSName: TStringField;
    cdsInvWare1CMNName: TStringField;
    cdsInvWare1CNumb: TIntegerField;
    cdsInvWare1CSummOper2: TFloatField;
    cdsInvWare1CDelta: TFloatField;
    cdsInvWare1CPriceAvg: TFloatField;
    cdsInvWare1CPLLid_Goods: TIntegerField;
    cdsInvWare1CFPP: TBooleanField;
    cdsInvWare1CPPPPrice: TFloatField;
    cdsInvWare1CPPPPricePlan: TFloatField;
    cdsInvWare1CK_AmountPlan: TFloatField;
    cdsInvWare1CK_Amount: TFloatField;
    cdsInvWare1Czzzz_PPPPrice: TAggregateField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure asgInvCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure asgInvGetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure asgInvGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgInvGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure asgInvCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: String; var Valid: Boolean);
    procedure btnCalcInvClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure cdsInv_RepAfterPost(DataSet: TDataSet);
    procedure cdsInv_RepCalcFields(DataSet: TDataSet);
    procedure DBEdit8KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cePriceKeyPress(Sender: TObject; var Key: Char);
    procedure edName2KeyPress(Sender: TObject; var Key: Char);
    procedure cdsTime2CalcFields(DataSet: TDataSet);
    procedure grdTimeKeyPress(Sender: TObject; var Key: Char);
    procedure grdTimeGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure PageControl1Change(Sender: TObject);
    procedure cdsInvWareCalcFields(DataSet: TDataSet);
    procedure aAddWareExecute(Sender: TObject);
    procedure aDelWareExecute(Sender: TObject);
    procedure aClearWareExecute(Sender: TObject);
    procedure dsInvWareDataChange(Sender: TObject; Field: TField);
    procedure cbMnListChange(Sender: TObject);
    procedure btnGetRawClick(Sender: TObject);
    procedure grdRawKeyPress(Sender: TObject; var Key: Char);
    procedure grdRawGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure cdsTime2rrrGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure asgPrevGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure asgPrevGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure BitBtn3Click(Sender: TObject);
    procedure cdsTime2ValPlanGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure grdRawEditButtonClick(Sender: TObject);
    procedure p1Click(Sender: TObject);
    procedure cbFFFChange(Sender: TObject);
    procedure aVisaClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure cdsInvWareAfterPost(DataSet: TDataSet);
    procedure aVisaFactClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure btnSelCA2Click(Sender: TObject);
    procedure btn1CClick(Sender: TObject);
  private
    NeedRefrMain : boolean;
    Fid_Project, FLockPaintCount : integer;
    FInvObj : TInvObj;
    FInvObj_Pred : TInvObj;
    Fid_business, FID_Warehouse : integer;
    FHandle : HWND;
    F_CheckMode : boolean;
    procedure PaintGrid;
    procedure PaintGrid_Pred;
    function GetCode(ARow: integer): TRowType;
    function CanEditCell(ARow, ACol: Integer): Boolean;

    procedure xxxOne;
    function xxxisMerg(ARow, ACol: Integer): boolean;
    function Getid_Manufact: integer;
    procedure xxx;
    function GetCode_Pred(ARow: integer): TRowType;
    procedure AddWare(AEdit : boolean);
    procedure ChDate;
    function GetTimeByLine(id_Lines: integer; ExtID : integer = -1): Variant;
    procedure Buh_GreedToExcel;
    function GetAggValByName(ANAme: String): Variant;
    function GetTimeByLine_F(id_Lines, ExtID: integer): Variant;
    function GetRawByLine_F(id_Manufact: integer): Variant;
    procedure DoRefrMAin;
    procedure pRawClick(Sender: TObject);
    procedure pGPClick(Sender: TObject);

  public
    procedure Initialize(Handle : HWND; id_Project : integer; ACopy : boolean);
    procedure CreateParams(var Params: TCreateParams); override;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    procedure GetRaw;

    function SaveData : boolean;
    procedure CheckRO;

    function GetAggregatesValByName(ANAme : String) : Variant;
  end;

var
  InvMain: TInvMain;
procedure ShowInvMain(Handle : HWND; id_Project : integer; ACopy : boolean = false; AXXX : boolean = false);

implementation

uses foMyFunc, uDM, foMyFuncAdvStrGrigExcel,
  foMyFuncEhExcel, foMyFuncEh
{$IFDEF LC}
 , uLCSelectorUn
 {$ELSE}
 {$IFNDEF SEINV} , uUnivSelector, uBJdet, uInvDet, uCASelector,
  uRepSelector {$ENDIF}
{$ENDIF}
  ;
 {$R *.DFM}

procedure ShowInvMain(Handle : HWND; id_Project : integer; ACopy : boolean; AXXX : boolean);
var F : TInvMain;
begin
  //  DM.Rights_GetUserRights(1001, Null);
  F := TInvMain.Create(nil);
  try
    if not AXXX then
    begin
      F.Show;
      F.Repaint;
    end;
    F.Initialize(Handle, id_Project, ACopy);
    if AXXX then
      F.Button2.Click;
  except
    F.Free;
  end;
end;

procedure TInvMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TInvMain.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TInvMain.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

  function frac_XX(X: Extended): Extended;
  begin
    Result := frac(X) * 24;
    if Int(x) - 30 < 5 then
      Result := Result + Int(x)*24;

  end;

procedure TInvMain.Initialize(Handle : HWND;id_Project: integer; ACopy : boolean);
var i : integer;
    MI : TMenuItem;
    BBB : boolean;
begin
  Fid_business := 43;
  PageControl1.ActivePage := tsWare;
  tsTime.TabVisible := false;

{$IFDEF LC}
   btnGetRaw.Visible := false;
{$ELSE}
  btnGetRaw.Visible := true;
{$ENDIF}

  Fid_Project := id_Project;
  FHandle := Handle;
  FInvObj := TInvObj.Create;
  pmDet.Items.Clear;
{$IFNDEF LC}
  for i := 1 to FInvObj.FLineList.Count - 1 do
  begin
    MI := TMenuItem.Create(Self);
    MI.Caption := FInvObj.LineObj[i].Name;
    MI.OnClick := p1Click;
    MI.Tag := i;
    pmDet.Items.Add(MI);

  end;
    MI := TMenuItem.Create(Self);
    MI.Caption := '-';
    pmDet.Items.Add(MI);

    MI := TMenuItem.Create(Self);
    MI.Caption := '������������� � ������� ���������';
    MI.OnClick := pGPClick;
    pmDet.Items.Add(MI);

  pmDetRaw.Items.Clear;
  for i := 0 to FInvObj.FLineList.Count - 1 do
  begin
    MI := TMenuItem.Create(Self);
    MI.Caption := FInvObj.LineObj[i].Name;
    MI.OnClick := pRawClick;
    MI.Tag := FInvObj.LineObj[i].id_Manufact;
    pmDetRaw.Items.Add(MI);
  end;
{$ENDIF}

  FInvObj_Pred := TInvObj.Create;


  cbMnList.Items.Clear;
  cbMnList.Items.AddObject('��� �������...', nil);
  with FInvObj.LN_1_Form do
    cbMnList.Items.AddObject(Fname, Pointer(id_Manufact));
  with FInvObj.LN_2_Print do
    cbMnList.Items.AddObject(Fname, Pointer(id_Manufact));
  with FInvObj.LN_3_Lam do
    cbMnList.Items.AddObject(Fname, Pointer(id_Manufact));
  with FInvObj.LN_4_Div do
    cbMnList.Items.AddObject(Fname, Pointer(id_Manufact));

  cbMnList.ItemIndex := 0;

  //  DateEdit1.Date := now;

  for i := 0 to cdsInv_Rep.Fields.Count - 1 do
  begin
    if cdsInv_Rep.Fields[i] is TDateTimeField then
    begin
      TDateTimeField(cdsInv_Rep.Fields[i]).DisplayFormat := 'hh:nn';
      TDateTimeField(cdsInv_Rep.Fields[i]).EditMask := '!90:00;1; ';
    end;
    if cdsInv_Rep.Fields[i] is TFloatField then
    begin
      TFloatField(cdsInv_Rep.Fields[i]).DisplayFormat := '0.00';
      TFloatField(cdsInv_Rep.Fields[i]).EditFormat := '0.00';
    end;
  end;
//  if id_Project > 0 then
  begin
    with cdsTime2 do
    begin
      Close;
      Params.ParamByName('@id_Project').Value := Fid_Project;
   //   Open;
    end;
    GetRaw;
    
    with cdsInv_Rep do
    begin
      Close;
      Params.ParamByName('@id_Project').Value := Fid_Project;
      Open;

      if cdsInv_RepLineNum.AsVariant = null then
        cbLineNum.ItemIndex := 0
      else
        cbLineNum.ItemIndex := cdsInv_RepLineNum.AsVariant;


      FInvObj.LN_1_Form.TM_Time := frac_XX(cdsInv_RepTime_Form_Time.AsDateTime);
      FInvObj.LN_1_Form.TM_Tuning := frac_XX(cdsInv_RepTime_Form_Tuning.AsDateTime);
      FInvObj.LN_1_Form.TM_Klishe := frac_XX(cdsInv_RepTime_FormDelta.AsDateTime); {frac_XX(cdsInv_RepTime_Form_Time.AsDateTime -
        cdsInv_RepTime_Form_Tuning.AsDateTime -
        cdsInv_RepTime_FormDelta.AsDateTime); }

      if cdsInv_RepTime_FormPrice.AsFloat <> 0 then
        FInvObj.LN_1_Form.TM_Price := cdsInv_RepTime_FormPrice.AsFloat;
      FInvObj.LN_1_Form.W_Amount := cdsInv_RepRaw_FormAmount.AsFloat;

      FInvObj.LN_1_Form.Raw_Price := cdsInv_RepRaw_Form2.AsFloat - cdsInv_RepRaw_FormPriceStat.AsFloat;
      FInvObj.LN_1_Form.Raw_PriceStat := cdsInv_RepRaw_FormPriceStat.AsFloat;


      FInvObj.LN_2_Print.TM_Time := frac_XX(cdsInv_RepTime_Print_Time.AsDateTime);
      
      FInvObj.LN_2_Print.TM_Tuning := frac_XX(cdsInv_RepTime_Print_Tuning.AsDateTime);
      FInvObj.LN_2_Print.TM_Klishe := frac_XX(cdsInv_RepTime_PrintDelta.AsDateTime); {frac_XX(cdsInv_RepTime_Print_Time.AsDateTime -
        cdsInv_RepTime_Print_Tuning.AsDateTime -
        cdsInv_RepTime_PrintDelta.AsDateTime);  }

      if cdsInv_RepTime_PrintPrice.AsFloat <> 0 then
        FInvObj.LN_2_Print.TM_Price := cdsInv_RepTime_PrintPrice.AsFloat;
      FInvObj.LN_2_Print.W_Amount := cdsInv_RepRaw_PrintAmount.AsFloat;

      FInvObj.LN_2_Print.Raw_Price := cdsInv_RepRaw_Print2.AsFloat - cdsInv_RepRaw_PrintPriceStat.AsFloat;
      FInvObj.LN_2_Print.Raw_PriceStat := cdsInv_RepRaw_PrintPriceStat.AsFloat;


      FInvObj.LN_3_Lam.TM_Time := frac_XX(cdsInv_RepTime_Lam_Time.AsDateTime);
      FInvObj.LN_3_Lam.TM_Tuning := frac_XX(cdsInv_RepTime_Lam_Tuning.AsDateTime);
      FInvObj.LN_3_Lam.TM_Klishe := frac_XX(cdsInv_RepTime_LamDelta.AsDateTime); {frac_XX(cdsInv_RepTime_Lam_Time.AsDateTime -
        cdsInv_RepTime_Lam_Tuning.AsDateTime -
        cdsInv_RepTime_LamDelta.AsDateTime);   }

      if cdsInv_RepTime_LamPrice.AsFloat <> 0 then
        FInvObj.LN_3_Lam.TM_Price := cdsInv_RepTime_LamPrice.AsFloat;
      FInvObj.LN_3_Lam.W_Amount := cdsInv_RepRaw_LamAmount.AsFloat;
      FInvObj.LN_3_Lam.Raw_Price := cdsInv_RepRaw_Lam2.AsFloat - cdsInv_RepRaw_LamPriceStat.AsFloat;
      FInvObj.LN_3_Lam.Raw_PriceStat := cdsInv_RepRaw_LamPriceStat.AsFloat;

      
      FInvObj.LN_4_Div.TM_Time := frac_XX(cdsInv_RepTime_Rez_Time.AsDateTime);
      FInvObj.LN_4_Div.TM_Tuning := frac_XX(cdsInv_RepTime_Rez_Tuning.AsDateTime);
      FInvObj.LN_4_Div.TM_Klishe := frac_XX(cdsInv_RepTime_RezDelta.AsDateTime); {frac_XX(cdsInv_RepTime_Rez_Time.AsDateTime -
        cdsInv_RepTime_Rez_Tuning.AsDateTime -
        cdsInv_RepTime_RezDelta.AsDateTime); }

      if cdsInv_RepTime_RezPrice.AsFloat <> 0 then
        FInvObj.LN_4_Div.TM_Price := cdsInv_RepTime_RezPrice.AsFloat;
      FInvObj.LN_4_Div.W_Amount := cdsInv_RepRaw_RezAmount.AsFloat;

      FInvObj.LN_4_Div.Raw_Price := cdsInv_RepRaw_Rez2.AsFloat - cdsInv_RepRaw_RezPriceStat.AsFloat;
      FInvObj.LN_4_Div.Raw_PriceStat := cdsInv_RepRaw_RezPriceStat.AsFloat;

    end;
  end;
  FInvObj.DoCalc(true);
  PaintGrid;

  if ACopy then
  begin
    Fid_Project := -1;
    MakeCDSCopy(cdsInv_Rep, 'id_Project', 'id_Project');
 //   MakeCDSCopy(cdsTime, 'id_Project', 'id_TimeItem')   ;

    with cdsInvWare do
    begin
      AfterPost := nil;
      First;
      while not Eof do
      begin
        if cdsInvWareAmountPlan.AsFloat > 0 then
        begin
          Edit;
          cdsInvWareAmount.AsVariant := Null;
          cdsInvWareSumm.AsVariant := Null;
          Post;
          Next;
        end
        else
          Delete;
      end;
      AfterPost := cdsInvWareAfterPost;
      cdsInvWareAfterPost(cdsInvWare);
      First;
    end;

 {   with cdsTime do
    begin
      First;
      while not Eof do
      begin
      //  if cdsTimeVal.AsFloat > 0 then
        begin
          Edit;
          cdsTimeVal.AsVariant := Null;
          Post;
          Next;
        end;
      end;
      First;
    end;
       }
    MakeCDSCopy(cdsInvWare, 'id_Project', 'id_Inv_Ware') ;
    cdsInv_Rep.Edit;
    cdsInv_RepCheckDate.AsVariant := Null;
    cdsInv_RepFIO.AsVariant := Null;
    cdsInv_RepCheckDateFact.AsVariant := Null;
    cdsInv_RepFIOFFF.AsVariant := Null;
    cdsInv_Rep.Post;
  end;
  if Fid_Project = -1 then
    Caption := '����� �����';

  if Fid_Project = -1 then
  begin
    edKomposit.Visible := false;
    fKomp1.Visible := true;
    fKomp1.Height := 23;
    fKomp1.Top := edKomposit.Top;
    fKomp1.Left := edKomposit.Left;
    if ACopy then
      fKomp1.SetKomp(cdsInv_RepKomposit.AsString);
  end;


  aVisa.Enabled := cdsInv_RepCheckDate.IsNull;
  aVisaFact.Enabled := cdsInv_RepCheckDateFact.IsNull;
  sbViza.Enabled := aVisa.Enabled or aVisaFact.Enabled; 
  btn1C.Enabled := not cdsInv_RepCheckDateFact.IsNull;
  
  BBB := not cdsInv_RepCheckDateFact.IsNull;
{$IFDEF SEINV}
  BBB := true;
{$ENDIF}

  BBB := BBB OR not DM.CheckUserRights(1001, Null);

 // edOwnName.ReadOnly := BBB;
 // edKomposit.ReadOnly := BBB;

  grdTime.ReadOnly := BBB {$IFDEF LC} and not cdsInv_RepCheckDateFact.IsNull{$ENDIF};
  grdRaw.ReadOnly := BBB;
  cePrice.ReadOnly := BBB;
  ceAmount.ReadOnly :=BBB;
  ceAmount.ReadOnly := BBB;
  DBEdit13.ReadOnly := BBB;
  DBEdit14.ReadOnly := BBB;
  edAmount1.ReadOnly := BBB;
  DBEdit12.ReadOnly := BBB;
  edNum.ReadOnly := BBB;
  
//  btnOk.Enabled := not BBB;
  DateEdit1.Enabled := not BBB;
  Button4.Enabled := not BBB;
  Button3.Enabled := not BBB;
  btnCalcInv.Enabled := not BBB;
  btnGetRaw.Enabled := not BBB;

  DBMemo1.Enabled := not BBB;
  tsBuh.TabVisible := DM.CheckUserRights(1001, Null);

  if not cdsInv_RepCheckDate.IsNull then
  begin
    for i := 0 to grdTime.Columns.Count - 1 do
    begin
      grdTime.Columns[i].ReadOnly := grdTime.Columns[i].ReadOnly or (pos('����|', grdTime.Columns[i].Title.Caption) > 0);
    end;
    for i := 0 to grdRaw.Columns.Count - 1 do
    begin
      grdRaw.Columns[i].ReadOnly := grdRaw.Columns[i].ReadOnly or (pos('����|', grdRaw.Columns[i].Title.Caption) > 0) or (grdRaw.Columns[i].field = cdsInvWareGName);

      if grdRaw.Columns[i].field = cdsInvWareGName then
        grdRaw.Columns[i].ButtonStyle := DBGridEh.cbsNone;
    end;

  end;

 { if not cdsInv_RepCheckDate.IsNull then
  begin
    for i := 0 to grdTime.Columns.Count - 1 do
    begin
      grdTime.Columns[i].ReadOnly := (pos('����|', grdTime.Columns[i].Title.Caption) > 0);
    end;
  end;  }

//  if not cdsInv_RepCheckDate.IsNull {$IFDEF LC} and cdsInv_RepCheckDateFact.IsNull {$ENDIF} then
//  begin
//    for i := 0 to grdTime.Columns.Count - 1 do
//    begin
//      {$IFDEF LC}
//        grdTime.Columns[i].ReadOnly := (grdTime.Columns[i].Field <> cdsTimeVal2);
//        {$Else}
//      grdTime.Columns[i].ReadOnly :=  true;
//      {$ENDIF}
//    end;
//  end;

end;

{ TLineObj }

constructor TLineObj.Create(AInvObj : TInvObj; AName : String);
begin
  FInvObj := AInvObj;
  FName := AName;
  HF_Amount := Null;
  HF_Price := Null;
  Raw_Price := Null;
  TM_Time := Null;
  TM_Tuning := Null;
  TM_Klishe := Null;
  TM_Price := Null;
  W_Amount := Null;

  Raw_PriceStat := Null;
end;

function TLineObj.GetHF_Sum: Variant;
begin
  Result := HF_Amount * HF_Price;
end;


function TLineObj.GetRaw_TotalSum: Variant;
begin
  Result := VarToFloat(HF_Sum) + VarToFloat(Raw_Price)+ VarToFloat(Raw_PriceStat);
end;

function TLineObj.GetTM_Total: Variant;
begin
 Result := VarToFloat(TM_Time) + VarToFloat(TM_Tuning);
end;

function TLineObj.GetTM_TotalSum: Variant;
begin
  Result := TM_Price * TM_Total;
end;

function TLineObj.GetTotalSum: Variant;
begin
  Result := VarToFloat(TM_TotalSum) + VarToFloat(Raw_TotalSum);
  if Self = FInvObj.LN_4_Div then
  begin
    Result := Result + VarToFloat(FInvObj.LN_1_Form.TM_Klishe) * VarToFloat(FInvObj.LN_1_Form.TM_Price);
  end;
end;

function TLineObj.GetInv: Variant;
begin
  if VarToFloat(W_Amount) <> 0 then
  begin
    Result := TotalSum/W_Amount;
    if Self = FInvObj.LN_4_Div then
    begin
      Result := (Raw_TotalSum + Self.FInvObj.LN_1_Form.Raw_PriceStat)/W_Amount;
     // Result := Result + FInvObj.FNR_Delta
    end
  end
  else
    Result := Null;

end;



function TLineObj.GetRaw_Price_All: Variant;
begin
  Result := VarToFloat(Raw_Price) + VarToFloat(Raw_PriceStat);
end;

function TLineObj.isNoData: boolean;
begin
  Result := //(VarToFloat(HF_Amount) = 0) and
        //    (VarToFloat(HF_Price) = 0) and
            (VarToFloat(Raw_Price) = 0) and
            (VarToFloat(TM_Time) = 0) and
            (VarToFloat(TM_Tuning) = 0) and
            (VarToFloat(TM_Klishe) = 0) and
            (VarToFloat(W_Amount) = 0);
end;

{ TInvObj }

constructor TInvObj.Create;
var id_Lines, TimePrice, V: OleVariant;
    i : integer;
begin
  FNR_Delta := 0.52;
  
  V := DM.rsCA.AppServer.GetINV_Form(24, -13);
  if V <> Null then
    FNR_Delta := VarToFloat(V);
  
  FLineList := TList.Create;
  
  LN_1_Form := TLineObj.Create(Self, '� 1 ������� ��.');
  FLineList.Add(LN_1_Form);
  with LN_1_Form do
  begin
  //  Raw_PriceStat := 744.80;
 //   TM_Time := 9.2;
 //   TM_Klishe := 1.7;
 //   TM_Price := 14.56;
 //   W_Amount := 14;

     id_Manufact := 41; //DM.rsCA.AppServer.Inv_GetMN(23);

    DM.rsCA.AppServer.INV_LinesPrice(1, 43, id_Lines, TimePrice);
    TM_Price := TimePrice;
    Fid_Lines := id_Lines;
  end;



  LN_2_Print := TLineObj.Create(Self, '� 2 ��. ������');
  FLineList.Add(LN_2_Print);
  with LN_2_Print do
  begin
    FPrior := LN_1_Form;
  //  Raw_Price := 1442.94;
  //  Raw_PriceStat := 41;
  //  TM_Time := 1.8;
  //  TM_Tuning := 2.5;

    TM_Price := 27.63;
    id_Manufact := 37;//DM.rsCA.AppServer.Inv_GetMN(37{19});
    id_Manufact2 := 41;//DM.rsCA.AppServer.Inv_GetMN(41{23});

    DM.rsCA.AppServer.INV_LinesPrice(2, 43,  id_Lines, TimePrice);
    TM_Price := TimePrice;
    Fid_Lines := id_Lines;
  end;

  
  LN_3_Lam := TLineObj.Create(Self, '� 3 ��. �������.');
  FLineList.Add(LN_3_Lam);
  with LN_3_Lam do
  begin
    FPrior := LN_2_Print;
 //   Raw_Price := 975.84;
 //   TM_Time := 2.5;
  //  TM_Tuning := 1.5;

    TM_Price := 16.58;
    id_Manufact := 36;//DM.rsCA.AppServer.Inv_GetMN(36{18});

    DM.rsCA.AppServer.INV_LinesPrice(3, 43, id_Lines, TimePrice);
    TM_Price := TimePrice;
    Fid_Lines := id_Lines;
  end;


  LN_4_Div := TLineObj.Create(Self, '� 4 ��. �����');
  FLineList.Add(LN_4_Div);
  with LN_4_Div do
  begin
    FPrior := LN_3_Lam;
 //   Raw_Price := 49.68;
 //   Raw_PriceStat := 0.36;
  //  TM_Time := 4.3;

    TM_Price := 14.87;
  //  W_Amount := 591.80;
    id_Manufact := 39;//DM.rsCA.AppServer.Inv_GetMN(39{21});

    DM.rsCA.AppServer.INV_LinesPrice(4, 43, id_Lines, TimePrice);
    TM_Price := TimePrice;
    Fid_Lines := id_Lines;
  end;

end;

procedure TInvMain.ChDate;
begin
  if edNum.Text = '' then
  begin
    Windows.SetFocus(edNum.Handle);
    MessageBox(Handle, '�� ������ ����� ������', '�� ������� ������', MB_ICONERROR + MB_OK);
    Abort;
  end;
  if DateEdit1.Field.isNull then
  begin
    Windows.SetFocus(DateEdit1.Handle);
    MessageBox(Handle, '�� ������� ����', '�� ������� ������', MB_ICONERROR + MB_OK);
    Abort;
  end;
  if edName2.Text = '' then
  begin
    Windows.SetFocus(edName2.Handle);
    MessageBox(Handle, '�� ������� �������� ������', '�� ������� ������', MB_ICONERROR + MB_OK);
    Abort;
  end;
  if ABS(edAmount1.Field.AsFloat) < 0.005 then
  begin
    Windows.SetFocus(edAmount1.Handle);
    MessageBox(Handle, '�� ������� ����������', '�� ������� ������', MB_ICONERROR + MB_OK);
    Abort;
  end;


end;

procedure TInvMain.btnOkClick(Sender: TObject);
var i : integer;
begin
  try
    cbMnList.ItemIndex := 0;
    cbMnListChange(cbMnList);
  except
  end;
  ChDate;

  if SaveData then
  begin
//    for i := 0 to cdsInvWare.Aggregates.Count - 1 do
 //     cdsInvWare.Aggregates[i].Active := false;

    Close;
    SendMessage(FHandle, xxx_RefrMsg, Fid_Project, 0);
  end;
end;

procedure TInvMain.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TInvMain.PaintGrid;
  procedure CellVal_Adv(ACol, ARow : integer; AName : String; Code : integer{; APCond : TAPCond = apcNone; V1 : String = ''; V2 : String = ''});
  begin
    if asgInv.RowCount <= ARow then
      asgInv.RowCount := ARow + 1;
    asgInv.Objects[ACol, ARow] := Pointer(Code);
    asgInv.Cells[ACol, ARow] := AName;
  end;
  procedure CellVal(ACol, ARow : integer; AName : Variant; Code : TRowType = cnsRow_None{; APCond : TAPCond = apcNone; V1 : String = ''; V2 : String = ''});
  begin
    if (VarType(AName) =  varDouble) or (VarType(AName) = varCurrency) then
      CellVal_Adv(ACol, ARow, FormatFloat('0.00', AName), ORD(Code))
    else
      CellVal_Adv(ACol, ARow, VarToStr(AName), ORD(Code));
  end;
var Row, X, i : integer;
    CCount, OldCol, oldRow, x_Col : integer;
    S : String;
    ALineObj : TLineObj;
begin
//  FInvObj.LN_1_Form.Raw_PriceStat := GetAggregatesValByName('S_PPPPrice');
  FInvObj.LN_1_Form.Raw_PriceStat := GetAggValByName('PPPPrice');
  
  inc(FLockPaintCount);
  Screen.Cursor := crSQLWait;
  try
    if FLockPaintCount > 1 then
      Exit;
    OldCol := asgInv.Col;
    oldRow := asgInv.Row;
    asgInv.Clear;
    asgInv.RowCount := 2;
    CCount := 5;
    asgInv.ColCount := cnsNameCol + 2 + FInvObj.FLineList.Count;
    

    Row := cnsTitle;
    CellVal(cnsNameCol, cnsTitle, '��������');

    inc(Row);
    CellVal(cnsNameCol, Row, '���-�� �/���������', cnsRow_HF_Amount);
    inc(Row);
    CellVal(cnsNameCol, Row, '��-�� 1 �� �/���������', cnsRow_HF_Price);
    inc(Row);
    CellVal(cnsNameCol, Row, '��-�� �/���������', cnsRow_HF_Sum);
    inc(Row);
    CellVal(cnsNameCol, Row, '��-�� ����� � ����������', cnsRow_Raw_Price);
    inc(Row);
    CellVal(cnsNameCol, Row, '��-�� ����������. ������', cnsRow_Raw_PriceStat);

    inc(Row);
    CellVal(cnsNameCol, Row, '��������� ������� �� ����� � ���������', cnsRow_Raw_Price_All);

    inc(Row);
    CellVal(cnsNameCol, Row, '����� ��������� �������� ������', cnsRow_Raw_TotalSum);
    inc(Row);
    CellVal(cnsNameCol, Row, '����� ���� ���-� ������ (�����)', cnsRow_TM_Time);
    inc(Row);
    CellVal(cnsNameCol, Row, '����� �������� (�����)', cnsRow_TM_Tuning);
    inc(Row);
    CellVal(cnsNameCol, Row, '����� ������� ����� (�����)', cnsRow_TM_Klishe);
    inc(Row);
    CellVal(cnsNameCol, Row, '����� ����� ���������� ������ (�����)', cnsRow_TM_Total);
    inc(Row);
    CellVal(cnsNameCol, Row, '��������� ���� ������', cnsRow_TM_Price);
    inc(Row);
    CellVal(cnsNameCol, Row, '��������� �����', cnsRow_TM_TotalSum);
    inc(Row);
    CellVal(cnsNameCol, Row, '����� ��������� ���������� ������', cnsRow_TotalSum);
    inc(Row);
    CellVal(cnsNameCol, Row, '���������� ������� ��������� (�������������)', cnsRow_W_Amount);
    inc(Row);
    CellVal(cnsNameCol, Row, '������������� ������� ������� ��������� (�������������)', cnsRow_Invoice);

    for i := 0 to FInvObj.FLineList.Count - 1 do
    begin
      ALineObj := FInvObj.LineObj[i];
      x_Col := cnsNameCol + i + 1;

      Row := cnsTitle;
      CellVal(x_Col, Row, ALineObj.Name);

      inc(Row);
      CellVal(x_Col, Row, ALineObj.HF_Amount, cnsRow_HF_Amount);
      inc(Row);
      CellVal(x_Col, Row, ALineObj.HF_Price, cnsRow_HF_Price);
      inc(Row);
      CellVal(x_Col, Row, ALineObj.HF_Sum, cnsRow_HF_Sum);

      inc(Row);

      if ALineObj = FInvObj.LN_1_Form then
        CellVal(x_Col, Row, ALineObj.Raw_PriceStat, cnsRow_Raw_Price)
      else
        CellVal(x_Col, Row, ALineObj.Raw_Price, cnsRow_Raw_Price);
      inc(Row);
      if ALineObj = FInvObj.LN_1_Form then
        CellVal(x_Col, Row, Null, cnsRow_Raw_PriceStat)
      else
        CellVal(x_Col, Row, ALineObj.Raw_PriceStat, cnsRow_Raw_PriceStat);

      inc(Row);
      CellVal(x_Col, Row, ALineObj.Raw_Price_All, cnsRow_Raw_Price_All);

      inc(Row);
      CellVal(x_Col, Row, ALineObj.Raw_TotalSum, cnsRow_Raw_TotalSum);

      inc(Row);
      CellVal(x_Col, Row, ALineObj.TM_Time, cnsRow_TM_Time);
      inc(Row);
      CellVal(x_Col, Row, ALineObj.TM_Tuning, cnsRow_TM_Tuning);
      inc(Row);
      CellVal(x_Col, Row, ALineObj.TM_Klishe, cnsRow_TM_Klishe);
      inc(Row);
      CellVal(x_Col, Row, ALineObj.TM_Total, cnsRow_TM_Total);
      inc(Row);
      CellVal(x_Col, Row, ALineObj.TM_Price, cnsRow_TM_Price);
      inc(Row);
      CellVal(x_Col, Row, ALineObj.TM_TotalSum, cnsRow_TM_TotalSum);

      inc(Row);
      CellVal(x_Col, Row, ALineObj.TotalSum, cnsRow_TotalSum);
      inc(Row);
      CellVal(x_Col, Row, ALineObj.W_Amount, cnsRow_W_Amount);
      inc(Row);
      CellVal(x_Col, Row, ALineObj.Invoice, cnsRow_Invoice);
    end;
    x_Col := cnsNameCol + FInvObj.FLineList.Count + 1;
    Row := cnsTitle;
    CellVal(x_Col, Row, '�����');

    inc(Row);
    inc(Row);
    inc(Row);
    inc(Row);

    CellVal(x_Col, Row, FInvObj.TT_Price, cnsRow_Raw_Price);
    inc(Row);
    CellVal(x_Col, Row, FInvObj.TT_PriceStat, cnsRow_Raw_PriceStat);

    inc(Row);
    CellVal(x_Col, Row, FInvObj.TT_Raw_Price_All, cnsRow_Raw_Price_All);

    inc(Row);
 //   CellVal(x_Col, Row, FInvObj.TT_Raw_TotalSum, cnsRow_Raw_TotalSum);

    inc(Row);
    CellVal(x_Col, Row, FInvObj.TT_TM_Time, cnsRow_TM_Time);
    inc(Row);
    CellVal(x_Col, Row, FInvObj.TT_TM_Tuning, cnsRow_TM_Tuning);
    inc(Row);
    CellVal(x_Col, Row, FInvObj.TT_TM_Klishe, cnsRow_TM_Klishe);
    inc(Row);
    CellVal(x_Col, Row, FInvObj.TT_TM_Total, cnsRow_TM_Total);
    inc(Row);
    inc(Row);
  //  inc(Row);
    CellVal(x_Col, Row, FInvObj.TT_TM_TotalSum, cnsRow_TM_TotalSum);

    inc(Row);
    CellVal(x_Col, Row, FInvObj.TT_TotalSum, cnsRow_TotalSum);

    
    asgInv.Col := OldCol;
    asgInv.Row := oldRow;

  {  for Row := 1 to asgInv.RowCount - 1 do
      for i := 1 to asgInv.ColCount - 1 do
      begin
        if xxxisMerg(Row, i) and xxxisMerg(Row, i + 1) then
          asgInv.MergeCells(i, Row, 2, 1);
        if xxxisMerg(Row, i) and xxxisMerg(Row + 1, i) then
          asgInv.MergeCells(i, Row, 1, 2);
      end;   }
  finally
    Dec(FLockPaintCount);
    if FLockPaintCount = 0 then
      Screen.Cursor := crDefault;
  end;
end;

function TInvMain.xxxisMerg(ARow, ACol: Integer) : boolean;
var Code : TRowType;
begin
  Code := GetCode(ARow);
  Result := false;
  if ACol = asgInv.ColCount - 1 then
  begin
    if (Code = cnsRow_HF_Amount) or
       (Code = cnsRow_HF_Price) or
       (Code = cnsRow_HF_Sum) or
       (Code = cnsRow_Raw_TotalSum) or
       (Code = cnsRow_TM_Price) or
       (Code = cnsRow_W_Amount) or
       (Code = cnsRow_Invoice) then
      Result := true
    else
      Result := false;
  end;
  if ((ACol = cnsNameCol + 1) or (ACol = cnsNameCol + 2))and (
       (Code = cnsRow_HF_Amount) or
       (Code = cnsRow_HF_Price) or
       (Code = cnsRow_HF_Sum) ) then
      Result := true
  else
  begin

  end;
end;


destructor TInvObj.Destroy;
begin
  FLineList.Free;
  
  LN_1_Form.Free;
  LN_2_Print.Free;
  LN_3_Lam.Free;
  LN_4_Div.Free;
end;

procedure TInvObj.DoCalc(APrev : boolean);
var i : integer;
    ALineObj : TLineObj;
begin
  for i := 1 to FLineList.Count - 1 do
  begin
    ALineObj := LineObj[i];
    if ALineObj.FPrior <> nil then
    begin
      if ALineObj <> LN_2_Print then
      begin
        if APrev then
        begin
          ALineObj.HF_Amount := ALineObj.FPrior.W_Amount;
        end;
        if ABS(VarToFloat(ALineObj.HF_Amount) - VarToFloat(ALineObj.FPrior.W_Amount)) < 0.05 then
          ALineObj.HF_Price := ALineObj.FPrior.Invoice
        else
        begin
          if ALineObj.HF_Amount <> 0 then
            ALineObj.HF_Price := ALineObj.FPrior.Invoice * ALineObj.FPrior.W_Amount/ALineObj.HF_Amount;
        end;
      end;
    end;
  end;
  for i := 1 to FLineList.Count - 2 do
  begin
    ALineObj := LineObj[i];
        if ALineObj.isNoData and (i in [1, 2]) then
        begin
          LineObj[i + 1].HF_Price := LineObj[i - 1].Invoice;
          LineObj[i + 1].HF_Amount := LineObj[i - 1].W_Amount;

          ALineObj.HF_Amount := Null;
          ALineObj.HF_Price := Null;
        end;
  end;
 { for i := 1 to FLineList.Count - 1 do
  begin
    ALineObj := LineObj[i];
    if ALineObj.FPrior <> nil then
    begin
      if ALineObj <> LN_2_Print then
      begin
        if APrev then
          ALineObj.HF_Amount := ALineObj.FPrior.W_Amount;
        ALineObj.HF_Price := ALineObj.FPrior.Invoice;
      end;
    end;
  end;    }
end;

function TInvObj.GetLineObj(index: integer): TLineObj;
begin
  Result := FLineList[index];
end;

procedure TInvMain.Button1Click(Sender: TObject);
begin
  FInvObj.DoCalc;
  PaintGrid;
end;

constructor TInvMain.Create(AOwner: TCOmponent);
var i : integer;
    AC : TField;
begin
  inherited;
  NeedRefrMain := false;
{$IFDEF SEINV}
  btnOk.Visible := false;
  btnGetRaw.Visible := false;
  btnCalcInv.Visible := false;
  tsBuh.TabVisible := false;
//  btnVisa.Visible := false;
{$ENDIF}


  F_CheckMode := false;
  cbFFF.ItemIndex := 0;
{$IFDEF LC}
  tsTab.TabVisible := false;
  tsPred.TabVisible := DM.CheckUserRights(1000, Null);
  Label21.Visible := false;
  DBEdit12.Visible := false;
  Label22.Visible := false;
  DBEdit13.Visible := false;
  Label23.Visible := false;
  DBEdit14.Visible := false;
  DBEdit15_old.Visible := false;
  Label24.Visible := false;
{$ENDIF}

{$IFDEF LC}
  for i := 0 to grdTime.Columns.Count - 1 do
  begin
    AC := grdTime.Columns[i].Field;
    if (AC = cdsTimeTimePricePlan) or
       (AC = cdsTimerrrPPP) or
       (AC = cdsTimeSummPlan) then

    grdTime.Columns[i].Visible := false;
  end;
  for i := 0 to grdRaw.Columns.Count - 1 do
  begin
    AC := grdRaw.Columns[i].Field;
    if (AC = cdsInvWarePricePlan) or
       (AC = cdsInvWareSumm) or
       (AC = cdsInvWarePriceAvg) or
       (AC = cdsInvWareSummOper2) or
       (AC = cdsInvWareFPP) then

    grdRaw.Columns[i].Visible := false;
  end;
{$ENDIF}


  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  LoadGridSettingsFromRegistryTMS(asgInv, SRegPath + '\' + Self.ClassName);
  LoadGridSettingsFromRegistryTMS(asgPrev, SRegPath + '\' + Self.ClassName + 'ppp');
  LoadEhGridSettingsFromRegistry(grdTime, SRegPath + '\' + Self.ClassName + 'ttt');
  LoadEhGridSettingsFromRegistry(grdRaw, SRegPath + '\' + Self.ClassName + 'www');

  LoadGridSettingsFromRegistry(dbgBGP, SRegPath + '\' + Self.ClassName + 'dbgBGP');
  LoadGridSettingsFromRegistry(dbgB, SRegPath + '\' + Self.ClassName + 'dbgB');

  LoadSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + Self.ClassName + 'Splitter');
end;

procedure TInvMain.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;


function TInvObj.GetTT_Raw_TotalSum: Variant;
var i : integer;
begin
  Result := 0; 
  for i := 0 to FLineList.Count - 1 do
  begin
    Result := Result + VarToFloat(TLineObj(FLineList[i]).Raw_TotalSum);
  end;
end;

function TInvObj.GetTT_TM_Klishe: Variant;
var i : integer;
begin
  Result := 0; 
  for i := 0 to FLineList.Count - 1 do
  begin
    Result := Result + VarToFloat(TLineObj(FLineList[i]).TM_Klishe);
  end;
end;

function TInvObj.GetTT_TM_Time: Variant;
var i : integer;
begin
  Result := 0; 
  for i := 0 to FLineList.Count - 1 do
  begin
    Result := Result + VarToFloat(TLineObj(FLineList[i]).TM_Time);
  end;
end;

function TInvObj.GetTT_TM_Total: Variant;
var i : integer;
begin
  Result := 0; 
  for i := 0 to FLineList.Count - 1 do
  begin
    Result := Result + VarToFloat(TLineObj(FLineList[i]).TM_Total);
  end;
end;

function TInvObj.GetTT_TM_TotalSum: Variant;
var i : integer;
begin
  Result := 0; 
  for i := 0 to FLineList.Count - 1 do
  begin
    Result := Result + VarToFloat(TLineObj(FLineList[i]).TM_TotalSum);
  end;
end;

function TInvObj.GetTT_TM_Tuning: Variant;
var i : integer;
begin
  Result := 0; 
  for i := 0 to FLineList.Count - 1 do
  begin
    Result := Result + VarToFloat(TLineObj(FLineList[i]).TM_Tuning);
  end;
end;

function TInvObj.GetTT_TotalSum: Variant;
var i : integer;
begin
  Result := 0;
  for i := 0 to FLineList.Count - 1 do
  begin
    Result := Result + VarToFloat(TLineObj(FLineList[i]).TotalSum);
  end;
end;

function TInvObj.GetTT_Price: Variant;
var i : integer;
begin
  Result := 0;
  for i := 0 to FLineList.Count - 1 do
  begin
    Result := Result + VarToFloat(TLineObj(FLineList[i]).Raw_Price);
  end;
end;

function TInvObj.GetTT_PriceStat: Variant;
var i : integer;
begin
  Result := 0;
  for i := 0 to FLineList.Count - 1 do
  begin
    Result := Result + VarToFloat(TLineObj(FLineList[i]).Raw_PriceStat);
  end;
end;

function TInvObj.TT_GetRaw_Price_All: Variant;
var i : integer;
begin
  Result := 0;
  for i := 0 to FLineList.Count - 1 do
  begin
    Result := Result + VarToFloat(TLineObj(FLineList[i]).Raw_Price_All);
  end;
end;


procedure TInvMain.asgInvCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := false;//CanEditCell(ARow, ACol);

end;

function TInvMain.CanEditCell(ARow, ACol: Integer): Boolean;
var Code : TRowType;
begin
  Code := GetCode(ARow);
  Result := (ACol > 1) and (ACol < asgInv.ColCount - 1)
              AND (
              (Code = cnsRow_Raw_Price) or
              (Code = cnsRow_Raw_PriceStat) or
              (Code = cnsRow_TM_Time) or
              (Code = cnsRow_TM_Tuning) or
              (Code = cnsRow_TM_Klishe) or
              (Code = cnsRow_TM_Price) or
              (Code = cnsRow_W_Amount)
              );

end;


function TInvMain.GetCode(ARow : integer) : TRowType;
var X : integer;
begin
  X := integer(asgInv.Objects[1, ARow]);
  if X < 0 then
    Result := cnsRow_None
  else
    Result := TRowType(X);
end;


function TInvMain.GetCode_Pred(ARow : integer) : TRowType;
var X : integer;
begin
  X := integer(asgPrev.Objects[1, ARow]);
  if X < 0 then
    Result := cnsRow_None
  else
    Result := TRowType(X);
end;


procedure TInvMain.asgInvGetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
var Code : TRowType;
begin
  Code := GetCode(ARow);
  if (Code = cnsRow_Raw_TotalSum) or
     (Code = cnsRow_TM_TotalSum) or
     (Code = cnsRow_TotalSum) or
     (Code = cnsRow_W_Amount) or
     (Code = cnsRow_Invoice) then
     AFont.Style := AFont.Style + [fsBold];
  if ACol = (Sender as TAdvColumnGrid).ColCount - 1 then
  begin
    AFont.Style := AFont.Style + [fsBold];
    if (Code = cnsRow_HF_Amount) or        
       (Code = cnsRow_HF_Price) or
       (Code = cnsRow_HF_Sum) or
       (Code = cnsRow_Raw_TotalSum) or
       (Code = cnsRow_TM_Price) or
       (Code = cnsRow_W_Amount) or
       (Code = cnsRow_Invoice) then
      ABrush.Color := clBlack
    else
      ABrush.Color := $00F1F2F3;
  end;
  if ((ACol = cnsNameCol + 1) or (ACol = cnsNameCol + 2))and (
       (Code = cnsRow_HF_Amount) or
       (Code = cnsRow_HF_Price) or
       (Code = cnsRow_HF_Sum) ) then
      ABrush.Color := clBlack
  else
  begin
    if not (gdSelected in AState) then
    begin
      if (Sender as TAdvColumnGrid).IsSelected(ACol, ARow) and (not (Sender as TAdvColumnGrid).EditMode) then
        AFont.Color := clWhite
      else
        if CanEditCell(ARow, ACol) then
          ABrush.Color := $00DFFFDF;
    end
    else
      AFont.Color := clWindow;
  end;
end;

procedure TInvMain.asgInvGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
 // if (ARow > 1) and (ACol >= 1) then
   // HAlign := taRightJustify;
  if (ARow = 0) then
    HAlign := taCenter
  else
    HAlign := taRightJustify;
end;

procedure TInvMain.asgInvGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  AEditor := edFloat;
end;

procedure TInvMain.asgInvCellValidate(Sender: TObject; ACol, ARow: Integer; var Value: String; var Valid: Boolean);
var Code : TRowType;
    ALineObj : TLineObj;
    V : Variant;
begin
  Code := GetCode(ARow);
  ALineObj := FInvObj.LineObj[ACol - 2];
 { if Value = '' then
    V := Null
  else  }
    V := Value;
  case Code of
    cnsRow_Raw_Price : ALineObj.Raw_Price := StrToFloatAdv(V);
    cnsRow_Raw_PriceStat : ALineObj.Raw_PriceStat := StrToFloatAdv(V);
    cnsRow_TM_Time : ALineObj.TM_Time := StrToFloatAdv(V);
    cnsRow_TM_Tuning : ALineObj.TM_Tuning := StrToFloatAdv(V);
    
    cnsRow_TM_Klishe : ALineObj.TM_Klishe := StrToFloatAdv(V);
    cnsRow_TM_Price : ALineObj.TM_Price := StrToFloatAdv(V);
    cnsRow_W_Amount : ALineObj.W_Amount := StrToFloatAdv(V);
  end;
  FInvObj.DoCalc;
  PaintGrid;
end;

function TInvMain.GetTimeByLine_F(id_Lines : integer; ExtID : integer) : Variant;
var Old_RecNo : integer;
begin
  Result := 0;
 { with cdsTime do
  begin
    Old_RecNo := RecNo;
    DisableControls;
    First;
    while not Eof do
    begin
      if (cdsTimeid_Lines.AsInteger = id_Lines) and not cdsTimeVal2.IsNull and
      ((cdsTimeExtID.AsInteger = ExtID) or (ExtID = -1) or
      ((ExtID = -2) and ((cdsTimeExtID.AsInteger <> 1)))
      ) then
      begin
        Result := Result + cdsTimeVal2.AsFloat;
      end;
      Next;
    end;
    RecNo := Old_RecNo;
    EnableControls;
    if Result = 0 then
      Result := Null;
  end;  }
end;

function TInvMain.GetRawByLine_F(id_Manufact : integer) : Variant;
var Old_RecNo : integer;
    S : String;
    b : boolean;
begin
  Result := 0;
  if id_Manufact = 0 then
    Exit;
  with cdsInvWare do
  begin
    Old_RecNo := RecNo;
    DisableControls;
    S := Filter;
    b := Filtered;
    Filtered := false;
    First;
    while not Eof do
    begin
      if (cdsInvWareid_Manufact.AsInteger = id_Manufact) and not cdsInvWareSumm.IsNull
//        and (cdsInvWareid_Goods.AsInteger <> cdsInv_Repid_Goods.AsInteger) then
      and (not cdsInvWareFPP.AsBoolean) then
      begin
        Result := Result + cdsInvWareSumm.AsFloat;
      end;
      Next;
    end;
    Filter := S;
    Filtered := b;
    RecNo := Old_RecNo;
    EnableControls;
    if Result = 0 then
      Result := Null;
  end;
end;

procedure TInvMain.btnCalcInvClick(Sender: TObject);
var i : integer;
    V, OperTypeIn, ADate, Price, ExtID : Variant;
    ALineObj : TLineObj;
    function cdsInvWare2GetData(id_Manufact : integer; AName : String) : Variant;
    begin
      Result := Null;
      with cdsInvWare2 do
      begin
        First;
        while not Eof do
        begin
          if (cdsInvWare2id_Manufact_Ext.AsInteger = id_Manufact) and
            (Pos(AName, cdsInvWare2Name.AsString) > 0) then
          begin
            Result := cdsInvWare2AmountOper.AsFloat;
            Break;
          end;
          Next;
        end;
      end;
    end;
begin
  if cdsInv_Rep.State in [dsEdit, dsInsert] then
      cdsInv_Rep.Post;
  if cdsInvWare.State in [dsEdit, dsInsert] then
      cdsInvWare.Post;

  Screen.Cursor := crSQLWait;
  inc(FLockPaintCount);
  try
    with cdsInvWare2 do
    begin
      Close;
      Params.ParamByName('@OPComment').Value := edNum.Text;
      Params.ParamByName('@id_Manufact').Value := Null;
      Params.ParamByName('@Mode').Value := 0;
      Open;
    end;
    with FInvObj.LN_1_Form do
    begin            
      ExtID := 0;
      Price := GetTimeByLine_F(Fid_Lines, ExtID);
      TM_Time := ABS(VarToFloat(Price));

      ExtID := 2;
      Price := GetTimeByLine_F(Fid_Lines, ExtID);
      TM_Tuning := ABS(VarToFloat(Price));

      ExtID := 1;
      Price := GetTimeByLine_F(Fid_Lines, ExtID);
      TM_Klishe := ABS(VarToFloat(Price));

    end;

    with FInvObj.LN_2_Print do
    begin
      Price := cdsInvWare2GetData(id_Manufact, '�����');
      W_Amount := ABS(VarToFloat(Price));

      ExtID := 0;
      Price := GetTimeByLine_F(Fid_Lines, ExtID);
      TM_Time := ABS(VarToFloat(Price));

      ExtID := 2;
      Price := GetTimeByLine_F(Fid_Lines, ExtID);
      TM_Tuning := ABS(VarToFloat(Price));
    end;

    with FInvObj.LN_3_Lam do
    begin
      Price := cdsInvWare2GetData(id_Manufact, '�����');
      HF_Amount := ABS(VarToFloat(Price));

      Price := cdsInvWare2GetData(id_Manufact, '�������');
      W_Amount := ABS(VarToFloat(Price));

      ExtID := 0;
      Price := GetTimeByLine_F(Fid_Lines, ExtID);
      TM_Time := ABS(VarToFloat(Price));
      
      ExtID := 2;
      Price := GetTimeByLine_F(Fid_Lines, ExtID);
      TM_Tuning := ABS(VarToFloat(Price));
    end;
    
    with FInvObj.LN_4_Div do
    begin
      Price := cdsInvWare2GetData(id_Manufact, '�������');
      HF_Amount := ABS(VarToFloat(Price));

      if cdsInvWare2.Locate('id_Goods', -1, [loCaseInsensitive, loPartialKey]) then
        Price := cdsInvWare2AmountOper.AsFloat
      else
        Price := 0;
      W_Amount := ABS(VarToFloat(Price));

      ExtID := 0;
      Price := GetTimeByLine_F(Fid_Lines, ExtID);
      TM_Time := ABS(VarToFloat(Price));
      
      ExtID := 2;
      Price := GetTimeByLine_F(Fid_Lines, ExtID);
      TM_Tuning := ABS(VarToFloat(Price));
    end;


    for i := 0 to FInvObj.FLineList.Count - 1 do
    begin
      ALineObj := FInvObj.LineObj[i];
      V := 0;
      OperTypeIn := Null;
      if ALineObj = FInvObj.LN_4_Div then
        OperTypeIn := 0;

      if (ALineObj.id_Manufact > 0) and (ALineObj <> FInvObj.LN_1_Form) then
        V := V + VarToFloat(GetRawByLine_F(ALineObj.id_Manufact));
      if (ALineObj.id_Manufact2 > 0) and (ALineObj <> FInvObj.LN_1_Form) then
        V := V + VarToFloat(GetRawByLine_F(ALineObj.id_Manufact2));
      if (ALineObj.id_Manufact3 > 0) and (ALineObj <> FInvObj.LN_1_Form) then
        V := V + VarToFloat(GetRawByLine_F(ALineObj.id_Manufact3));

      ALineObj.Raw_Price := V;
    end;
    if VarToFloat(FInvObj.LN_2_Print.Raw_Price) > 0 then
      FInvObj.LN_2_Print.Raw_PriceStat := VarToFloat(DM.rsCA.AppServer.GetINV_Form(Fid_business, 1))
    else
      FInvObj.LN_2_Print.Raw_PriceStat := 0;

    FInvObj.LN_4_Div.Raw_PriceStat := (VarToFloat(DM.rsCA.AppServer.GetINV_Form(Fid_business, 10))
                    + VarToFloat(DM.rsCA.AppServer.GetINV_Form(Fid_business, 11))) * FInvObj.LN_4_Div.W_Amount;
                    //FInvObj.LN_2_Print.HF_Amount;


    ADate := GetDateAdv(DateEdit1.Date, true);
  //  if cdsInvWare.Locate('FPP', true, []) then
    //  Price := DM.rsCA.AppServer.INV_GetFormPrice(cdsInvWareid_Goods.AsInteger, FInvObj.LN_1_Form.id_Manufact, ADate);
    //666
    if (ABS(cdsInv_RepInv2.AsFloat) < 0.005) or (1=1) then
    begin
      cdsInv_Rep.Edit;
    //  cdsInv_RepInv2.Value := VarToFloat(Price);
      cdsInv_RepAmount2.AsVariant := FInvObj.LN_4_Div.W_Amount;   //888999

    //  if cdsInvWare.Locate('id_Goods', cdsInv_Repid_Goods.AsInteger, []) then
      begin
      //  cdsInv_RepInv1.AsVariant := GetAggregatesValByName('S_PPPPricePlan');
        cdsInv_RepInv1.AsVariant := GetAggValByName('PPPPricePlan');
     //   cdsInv_RepKlishe_Amount.AsVariant := GetAggregatesValByName('S_K_AmountPlan');
        cdsInv_RepKlishe_Amount.AsVariant := GetAggValByName('K_AmountPlan');
        if cdsInv_RepKlishe_Amount.AsFloat > 0 then
          cdsInv_RepInv2.Value := cdsInv_RepInv1.AsVariant/cdsInv_RepKlishe_Amount.AsVariant
        else
          cdsInv_RepInv2.AsVariant := Null;
      //  cdsInv_RepInv2.AsVariant := GetAggregatesValByName('S_PPPPrice');
        cdsInv_RepInv2.AsVariant := GetAggValByName('PPPPrice');
      //  cdsInv_RepKlishe_Amount2.AsVariant := GetAggregatesValByName('S_K_Amount');   //888999
        cdsInv_RepKlishe_Amount2.AsVariant := GetAggValByName('K_Amount');   //888999

      end;

      cdsInv_Rep.Post;
    end
    else
    begin
      cdsInv_Rep.Edit;
      cdsInv_RepAmount2.AsVariant := FInvObj.LN_4_Div.W_Amount;   //888999
      cdsInv_Rep.Post;
    end;
  finally
    Screen.Cursor := crDefault;
    Dec(FLockPaintCount);
    FInvObj.DoCalc;
    PaintGrid;

  end;
end;

procedure TInvMain.Button3Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
    TotalAmount : Double;
    AID, AName : OleVariant;
    S : String;
    EObjTypes : TEObjTypes;
    Price, ADate : OleVariant;
begin
{$IFNDEF SEINV}
  Screen.Cursor := crSQLWait;
  EObjTypes := [eotGoods];
  ASelectedObj.ID := cdsInv_Repid_Goods.AsInteger;

  ASelectedObj.ObjType := eotGoods;
{$IFNDEF LC}
  if SelectObjUnBsn(Owner, Fid_business, ASelectedObj, 0, EObjTypes, true, -1) then
{$ELSE}
  if SelectObjUnLCBsn(Fid_business, ASelectedObj, 0, EObjTypes) then
{$ENDIF}
  begin
    if cdsInv_Repid_Goods.AsInteger <> ASelectedObj.ID then
    begin
      cdsInv_Rep.Edit;
      cdsInv_RepWNAme.AsString := ASelectedObj.Name;
      cdsInv_Repid_Goods.AsInteger := ASelectedObj.ID;

      ADate := GetDateAdv(DateEdit1.Date, true);

      Price := DM.rsCA.AppServer.INV_GetFormPrice(cdsInv_Repid_Goods.AsInteger, FInvObj.LN_1_Form.id_Manufact, ADate);
      cdsInv_RepInv2.Value :=  VarToFloat(Price);
      cdsInv_Rep.Post;
    end;
  end;
{$ENDIF}
end;

procedure TInvMain.BitBtn4Click(Sender: TObject);
begin
  AdvStringGridToExcel(asgInv, '����� �' + edNum.Text);

end;


destructor TInvMain.Destroy;
var i : integer;
begin
  SaveGridSettingsToRegistryTMS(asgInv, SRegPath + '\' + Self.ClassName);
  SaveGridSettingsToRegistryTMS(asgPrev, SRegPath + '\' + Self.ClassName + 'ppp');

  for i := 0 to grdRaw.Columns.Count - 1 do
  begin
    grdRaw.Columns[i].Visible := true;
  end;

  SaveGridSettingsToRegistry(dbgBGP, SRegPath + '\' + Self.ClassName + 'dbgBGP');
  SaveGridSettingsToRegistry(dbgB, SRegPath + '\' + Self.ClassName + 'dbgB');

  SaveEhGridSettingsToRegistry(grdTime, SRegPath + '\' + Self.ClassName + 'ttt');
  SaveEhGridSettingsToRegistry(grdRaw, SRegPath + '\' + Self.ClassName + 'www');
  SaveSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + Self.ClassName + 'Splitter');

  try
    cdsInvWare.OnCalcFields := nil;
    cdsInvWare.AggregatesActive := false;
    cdsInvWare.Aggregates.Clear;


    cdsInvWare.Close;   

    inherited;
  except
  end;
end;

function TInvMain.SaveData: boolean;
begin
  if cdsInvWare.State in [dsEdit, dsInsert] then
      cdsInvWare.Post;

  Screen.Cursor := crSQLWait;
  try
    with cdsInv_Rep do
    begin
      if State in [dsEdit, dsInsert] then
        Post;
      if (Fid_Project = -1) then
      begin
        Edit;
        cdsInv_RepKomposit.AsString := fKomp1.GetKomp;
        Post;
      end;

      if not cdsInv_RepCheckDateFact.IsNull and (Button2.tag = 0) then
      begin
      //  DM.rsCA.AppServer.Inv_ProjectComment(Fid_Project, cdsInv_RepComment.AsString);
        ApplyUpdates(0);
        Result := true;
{$IFDEF LC}
        if not cdsInv_RepCheckDateFact.IsNull then
{$ENDIF}
          Exit;
      end;
      Edit;

{$IFNDEF LC}

      if F_CheckMode then
      begin
        FInvObj_Pred.DoCalc;
        PaintGrid_Pred;

        if not (State in [dsEdit, dsInsert]) then
          Edit;
        cdsInv_RepKL_PRev.AsFloat := VarToFloat(FInvObj_Pred.LN_1_Form.TotalSum);
        if cdsInv_RepAmount1.AsFloat <> 0 then
          cdsInv_RepInv_Prev.AsFloat := (FInvObj_Pred.TT_TotalSum {- VarToFloat(FInvObj_Pred.LN_1_Form.TM_TotalSum) - VarToFloat(FInvObj_Pred.LN_1_Form.Raw_TotalSum)})/cdsInv_RepAmount1.AsFloat  + FInvObj.FNR_Delta
        else
          cdsInv_RepInv_Prev.AsVariant := Null;

        cdsInv_RepRaw_Form1.AsVariant := FInvObj_Pred.LN_1_Form.HF_Price;
        cdsInv_RepRaw_Print1.AsVariant := FInvObj_Pred.LN_2_Print.HF_Price;
        cdsInv_RepRaw_Lam1.AsVariant := FInvObj_Pred.LN_3_Lam.HF_Price;
        cdsInv_RepRaw_Rez1.AsVariant := FInvObj_Pred.LN_4_Div.HF_Price;

        cdsInv_RepKL_Real.AsFloat := VarToFloat(FInvObj.LN_1_Form.TotalSum);
        cdsInv_RepInv_Real.AsFloat := VarToFloat(FInvObj.LN_4_Div.Invoice);

        with cdsBuh do
        begin
          DisableControls;
          Close;
          Params.ParamByName('@id_Project').Value := Fid_Project;
          if (Fid_Project = -1) and (edNum.Text <> '') then
            Params.ParamByName('@PrjNum').Value := StrToInt(edNum.Text)
          else
            Params.ParamByName('@PrjNum').Value := Null;

          Params.ParamByName('@TM').Value := 13;
          Open;

          if (cdsBuhAmount.AsFloat <> 0) then
            cdsInv_RepPrice_Real.Value := cdsBuhSumm.AsFloat/cdsBuhAmount.AsFloat
          else
            cdsInv_RepPrice_Real.Value := 0;
        end;

        with cdsBuh do
        begin
          DisableControls;
          Close;
          Params.ParamByName('@id_Project').Value := Fid_Project;
          if (Fid_Project = -1) and (edNum.Text <> '') then
            Params.ParamByName('@PrjNum').Value := StrToInt(edNum.Text)
          else
            Params.ParamByName('@PrjNum').Value := Null;

          Params.ParamByName('@TM').Value := 10;
          Open;

          if Locate('S_ord', 110, []) and (cdsBuhAmount.AsFloat <> 0) then
            cdsInv_RepKL_Price.AsFloat := cdsBuhSumm.AsFloat/cdsBuhAmount.AsFloat
          else
            cdsInv_RepKL_Price.AsFloat := 0;

        end;
      end;

{$ENDIF}


      if cbLineNum.ItemIndex <= 0 then
        cdsInv_RepLineNum.AsVariant := null
      else
        cdsInv_RepLineNum.AsVariant := cbLineNum.ItemIndex;

      cdsInv_Repid_Inv.AsInteger := 1;
      cdsInv_Repid_User.AsInteger := DM.IDUser;


        cdsInv_RepTime_Form_Time.AsVariant := FInvObj.LN_1_Form.TM_Time/24;
        cdsInv_RepTime_Form_Tuning.AsVariant := FInvObj.LN_1_Form.TM_Tuning/24;
        cdsInv_RepTime_FormDelta.AsVariant := FInvObj.LN_1_Form.TM_Klishe/24;

        cdsInv_RepTime_FormPrice.AsVariant := FInvObj.LN_1_Form.TM_Price;
        cdsInv_RepRaw_FormAmount.AsVariant := FInvObj.LN_1_Form.W_Amount;

        cdsInv_RepRaw_Form2.AsVariant := FInvObj.LN_1_Form.Raw_Price_All;
        cdsInv_RepRaw_FormPriceStat.AsVariant := FInvObj.LN_1_Form.Raw_PriceStat;

        cdsInv_RepRaw_Print2.AsVariant := FInvObj.LN_2_Print.Raw_Price_All;
        cdsInv_RepRaw_PrintPriceStat.AsVariant := FInvObj.LN_2_Print.Raw_PriceStat;

        cdsInv_RepRaw_Lam2.AsVariant := FInvObj.LN_3_Lam.Raw_Price_All;
        cdsInv_RepRaw_LamPriceStat.AsVariant := FInvObj.LN_3_Lam.Raw_PriceStat;

        cdsInv_RepRaw_Rez2.AsVariant := FInvObj.LN_4_Div.Raw_Price_All;
        cdsInv_RepRaw_RezPriceStat.AsVariant := FInvObj.LN_4_Div.Raw_PriceStat;

        //**
        cdsInv_RepTime_Print_Time.AsVariant := FInvObj.LN_2_Print.TM_Time/24;
        cdsInv_RepTime_Print_Tuning.AsVariant := FInvObj.LN_2_Print.TM_Tuning/24;
        cdsInv_RepTime_PrintDelta.AsVariant := FInvObj.LN_2_Print.TM_Klishe/24;

        cdsInv_RepTime_PrintPrice.AsVariant := FInvObj.LN_2_Print.TM_Price;
        cdsInv_RepRaw_PrintAmount.AsVariant := FInvObj.LN_2_Print.W_Amount;
        //**

        cdsInv_RepTime_Lam_Time.AsVariant := FInvObj.LN_3_Lam.TM_Time/24;
        cdsInv_RepTime_Lam_Tuning.AsVariant := FInvObj.LN_3_Lam.TM_Tuning/24;
        cdsInv_RepTime_LamDelta.AsVariant := FInvObj.LN_3_Lam.TM_Klishe/24;

        cdsInv_RepTime_LamPrice.AsVariant := FInvObj.LN_3_Lam.TM_Price;
        cdsInv_RepRaw_LamAmount.AsVariant := FInvObj.LN_3_Lam.W_Amount;
         //**

        cdsInv_RepTime_Rez_Time.AsVariant := FInvObj.LN_4_Div.TM_Time/24;
        cdsInv_RepTime_Rez_Tuning.AsVariant := FInvObj.LN_4_Div.TM_Tuning/24;
        cdsInv_RepTime_RezDelta.AsVariant := FInvObj.LN_4_Div.TM_Klishe/24;

        cdsInv_RepTime_RezPrice.AsVariant := FInvObj.LN_4_Div.TM_Price;
        cdsInv_RepRaw_RezAmount.AsVariant := FInvObj.LN_4_Div.W_Amount;

        cdsInv_RepPrice.AsVariant := FInvObj.LN_4_Div.Invoice;
        cdsInv_RepKlishe_Inv2.AsVariant := FInvObj.LN_1_Form.Invoice;

        cdsInv_RepKlishe_Inv1.AsVariant :=
//        GetAggregatesValByName('S_PPPPrice') +
        GetAggValByName('PPPPrice') +
        FInvObj.LN_1_Form.TM_Price * GetTimeByLine(FInvObj.LN_1_Form.Fid_Lines);

      Post;
      reSult := ApplyUpdates(0)=0;
      if Fid_Project = -1 then
        Fid_Project := DM.rsCA.AppServer.Getid_Project;
    end;
 {   with cdsTime do
    begin

      if State in [dsEdit, dsInsert] then
        Post;
      DisableControls;
      First;
      while not Eof do
      begin
        if (frac(cdsTimeVal.AsDateTime) = 0) and (cdsTimeVal2.AsFloat = 0) then
        begin
          Edit;
          cdsTimeVal.AsVariant := Null;
          Post;
        end;
        if (frac(cdsTimeValPlan.AsDateTime) = 0) and (cdsTimeValPlan2.AsFloat = 0) then
        begin
          Edit;
          cdsTimeValPlan.AsVariant := Null;
          Post;
        end;

        Next;
      end;
      First;
      EnableControls;

      if not CDSApplyUpdates(cdsTime, 'id_Project', Fid_Project, true) then
        raise Exception.Create('������ ��� ���������� ��������� ������');
    end;
      }
    with cdsInvWare do
    begin
      if State in [dsEdit, dsInsert] then
        Post;
      if not CDSApplyUpdates(cdsInvWare, 'id_Project', Fid_Project, true) then
        raise Exception.Create('������ ��� ���������� �������� ������');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TInvMain.cdsInv_RepAfterPost(DataSet: TDataSet);
begin
{  FInvObj.LN_1_Form.Raw_PriceStat := cdsInv_RepceSumm2.Value;

  FInvObj.DoCalc;
  PaintGrid;  }
end;

procedure TInvMain.cdsInv_RepCalcFields(DataSet: TDataSet);
begin
  cdsInv_RepceSumm_old.asfloat := cdsInv_RepKlishe_Amount.AsFloat*cdsInv_RepInv1.AsFloat;
  cdsInv_RepceSumm2_old.asfloat := cdsInv_RepKlishe_Amount2.AsFloat*cdsInv_RepInv2.AsFloat;
end;

procedure TInvMain.DBEdit8KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = '.') or (Key = ',') then
    Key := DecimalSeparator;
  if (Key = #13) and (cdsInv_Rep.State in [dsEdit, dsInsert]) then
    cdsInv_Rep.Post;


end;

procedure TInvMain.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (cdsInv_Rep.State in [dsEdit, dsInsert]) then
    cdsInv_Rep.Post;
end;

procedure TInvMain.cePriceKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (cdsInv_Rep.State in [dsEdit, dsInsert]) then
    cdsInv_Rep.Post;
end;

procedure TInvMain.edName2KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (cdsInv_Rep.State in [dsEdit, dsInsert]) then
    cdsInv_Rep.Post;
end;

procedure TInvMain.cdsTime2CalcFields(DataSet: TDataSet);
begin
{  if cdsTimeVal2_2.AsVariant <> cdsTimeVal2.AsVariant then
  begin
    DataSet.fieldByName('Val').AsVariant := cdsTimeVal2.AsVariant/24;
  end;
  if cdsTimeValPlan2_2.AsVariant <> cdsTimeValPlan2.AsVariant then
  begin
     DataSet.fieldByName('ValPlan').AsVariant := cdsTimeValPlan2.AsVariant/24;
  end;

  if not DataSet.fieldByName('Val').IsNull then
    DataSet.fieldByName('Val2').AsFloat := frac_XX(DataSet.fieldByName('Val').AsDateTime)
  else
    DataSet.fieldByName('Val2').AsVariant := Null;

  if not DataSet.fieldByName('ValPlan').IsNull then
  begin
    DataSet.fieldByName('ValPlan2').AsFloat := frac_XX(DataSet.fieldByName('ValPlan').AsDateTime)
  end
  else
  begin
    DataSet.fieldByName('ValPlan2').AsVariant := Null;
  end;
  

  if not DataSet.fieldByName('ValPlan').IsNull and
     not DataSet.fieldByName('Val').IsNull then
  DataSet.fieldByName('rrr').AsFloat := frac(DataSet.fieldByName('ValPlan').AsDateTime) -
                                        frac(DataSet.fieldByName('Val').AsDateTime);

  DataSet.fieldByName('SummPlan').AsVariant := DataSet.fieldByName('ValPlan2').AsVariant *
               DataSet.fieldByName('TimePricePlan').AsVariant;
  DataSet.fieldByName('SummF').AsVariant := DataSet.fieldByName('Val2').AsVariant *
               DataSet.fieldByName('TimePricePlan').AsVariant;

  cdsTimeVal2_2.AsVariant := cdsTimeVal2.AsVariant;
  cdsTimeValPlan2_2.AsVariant := cdsTimeValPlan2.AsVariant;

  cdsTimerrrPPP.AsVariant := DataSet.fieldByName('TimePricePlan').AsVariant *((cdsTime.fieldByName('ValPlan2').AsFloat) -
                                        (cdsTime.fieldByName('Val2').AsFloat));
                                        }
end;

procedure TInvMain.grdTimeKeyPress(Sender: TObject; var Key: Char);
var tmpCol : TColumnEh;
begin
  if (Key = '.') or (Key = ',') then
  begin
    tmpCol := TDBGridEh(Sender).Columns[TDBGridEh(Sender).col - 1];
    if (tmpCol.Field is TFloatField) or (tmpCol.Field is TBCDField) then
      Key := DecimalSeparator;
  end;

  if (Key = #13) then
  begin
    if TDBGridEh(Sender).DataSource.DataSet.State = dsEdit then
      TDBGridEh(Sender).DataSource.DataSet.Post;
  end;
end;

procedure TInvMain.grdTimeGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
{  if not cdsTime.fieldByName('Val').isNull then
  begin
    if cdsTime.fieldByName('ValPlan2').AsFloat < cdsTime.fieldByName('Val2').AsFloat then
    begin
      AFont.Color := clRed;
      AFont.Style := [fsBold];
    end;
    if cdsTime.fieldByName('ValPlan2').AsFloat > cdsTime.fieldByName('Val2').AsFloat then
    begin
      AFont.Color := clGreen;
      AFont.Style := [fsBold];
    end;
  end;    }
end;

procedure TInvMain.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = tsPred then
  begin
    FInvObj_Pred.DoCalc;
    PaintGrid_Pred;

  end
  else
  if (PageControl1.ActivePage = tsTab) and (NeedRefrMain) then
  begin
  //  NeedRefrMain := false;
  //  DoRefrMain;

  end
  else
  if (PageControl1.ActivePage = tsPred) and (NeedRefrMain) then
  begin
    NeedRefrMain := false;
    FInvObj_Pred.DoCalc;
    PaintGrid_Pred;

  end;
end;

procedure TInvMain.cdsInvWareCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('FPP').AsBoolean := not DataSet.FieldByName('PLLid_Goods').IsNull;

    

  DataSet.FieldByName('Numb').AsInteger := DataSet.RecNo;
 { if DataSet.FieldByName('AmountPlan').AsFloat = 0 then
    DataSet.FieldByName('SummOper2').AsFloat := DataSet.FieldByName('PricePlan').AsFloat
  else  }

  DataSet.FieldByName('SummOper2').AsFloat := DataSet.FieldByName('AmountPlan').AsFloat * DataSet.FieldByName('PricePlan').AsFloat;
  DataSet.FieldByName('Delta').AsFloat := DataSet.FieldByName('SummOper2').AsFloat - DataSet.FieldByName('Summ').AsFloat;

  if DataSet.FieldByName('Amount').AsFloat = 0 then
    DataSet.FieldByName('PriceAvg').AsFloat := DataSet.FieldByName('Summ').AsFloat
  else
    DataSet.FieldByName('PriceAvg').AsFloat := DataSet.FieldByName('Summ').AsFloat/DataSet.FieldByName('Amount').AsFloat;

  if not DataSet.FieldByName('PLLid_Goods').IsNull then
    DataSet.FieldByName('PPPPrice').AsFloat := DataSet.FieldByName('Summ').AsFloat
  else
    DataSet.FieldByName('PPPPrice').AsVariant := 0;
    
  if not DataSet.FieldByName('PLLid_Goods').IsNull then
    DataSet.FieldByName('PPPPricePlan').AsFloat := DataSet.FieldByName('SummOper2').AsFloat
  else
    DataSet.FieldByName('PPPPricePlan').AsVariant := 0;

  if not DataSet.FieldByName('PLLid_Goods').IsNull then
    DataSet.FieldByName('K_AmountPlan').AsFloat := DataSet.FieldByName('AmountPlan').AsFloat
  else
    DataSet.FieldByName('K_AmountPlan').AsVariant := 0;

  if not DataSet.FieldByName('PLLid_Goods').IsNull then
    DataSet.FieldByName('K_Amount').AsFloat := DataSet.FieldByName('Amount').AsFloat
  else
    DataSet.FieldByName('K_Amount').AsVariant := 0;
end;

procedure TInvMain.aAddWareExecute(Sender: TObject);
begin
  AddWare(False);
end;

procedure TInvMain.xxx;
var OldRec : integer;
begin
  if not cdsInv_RepCheckDate.IsNull then
    Exit;

  with cdsInv_Rep do
  begin
    DisableControls;
    Screen.Cursor := crSQLWait;
    OldRec := RecNo;
    First;
    try
      while not Eof do
      begin
        xxxOne;

        Next;
      end;
      RecNo := OldRec;
    finally
      Screen.Cursor := crDefault;
      EnableControls;
    end;
  end;
end;

procedure TInvMain.xxxOne;
var ASelectedObj : TSelectedObj;
    Price33, Price44, Price99, ID_Cur, ID_Warehouse: OleVariant;
    TotalAmount : Double;
    NeedPost : boolean;
begin
{$IFDEF LC}
  Exit;
{$ENDIF}

  ASelectedObj.ID := Null;
  with cdsInvWare do
  begin
    if not FieldByName('id_Goods').IsNull then
    begin
      ASelectedObj.ID := FieldByName('id_Goods').Value;
      ASelectedObj.ObjType := eotGoods;
    end;

    if ASelectedObj.ID <> Null then
    begin
      NeedPost := not (State in [dsEdit, dsInsert]);
      if NeedPost then
        Edit;
      // ����������� ���������� ����

        ID_Warehouse := 33; //cdsOperFin.FieldByName('ID_Warehouse').Value;

{$IFNDEF LC}
        Price33 := 0;
        Price44 := 0;
        Price99 := 0;
        if DM.PL_GetDefWarePrice(ASelectedObj.ID, 33, Price33, ID_Cur, TotalAmount) <> -1 then
        begin

        end;
        if DM.PL_GetDefWarePrice(ASelectedObj.ID, 44, Price44, ID_Cur, TotalAmount) <> -1 then
        begin

        end;
        if DM.PL_GetDefWarePrice(ASelectedObj.ID, 99, Price99, ID_Cur, TotalAmount) <> -1 then
        begin

        end;
        if Price33 < Price44 then
          Price33 := Price44;
        if Price33 < Price99 then
          Price33 := Price99;

        FieldByName('PricePlan').Value := Price33;
        if FieldByName('PricePlan').AsFloat < 0.005 then
        begin
          try
            Price33 := DM.rsCA.AppServer.PL_LastPrice(ASelectedObj.ID);
            FieldByName('PricePlan').Value := Price33;
          except
          end;
        end;
{$ENDIF}
       if NeedPost and (State in [dsEdit, dsInsert]) then
         Post;

    end;
  end;
end;


procedure TInvMain.aDelWareExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if grdRaw.SelectedRows.Count > 0 then
    S := '������� ' + IntToStr(grdRaw.SelectedRows.Count) + ' �������?'
  else
    S := '������� ����� "' + grdRaw.DataSource.DataSet.FieldByName('GName').AsString+ '"?';
  if MessageBox(Handle, PChar(S), '����������� ��������', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if grdRaw.SelectedRows.Count > 0 then
      begin
        for i := 0 to grdRaw.SelectedRows.Count - 1 do
        begin
          grdRaw.DataSource.DataSet.GotoBookmark(pointer(grdRaw.SelectedRows.Items[i]));
          grdRaw.DataSource.DataSet.Delete;
        end;
      end
      else
        grdRaw.DataSource.DataSet.Delete;
    finally

    end;


  end;
end;

procedure TInvMain.aClearWareExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('�������� �������� �������?'), '����������� �������', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    with cdsInvWare do
    begin
      while not IsEmpty do
        Delete;
    end;
  end;
end;

procedure TInvMain.dsInvWareDataChange(Sender: TObject; Field: TField);
begin
  aClearWare.Enabled := not cdsInvWare.IsEmpty and cdsInv_RepCheckDate.IsNull;
  aDelWare.Enabled := not cdsInvWare.IsEmpty and cdsInv_RepCheckDate.IsNull;
end;

function TInvMain.Getid_Manufact : integer;
begin
  Result := -1;
  if (cbMnList.ItemIndex > 0) and
     (cbMnList.Items.Objects[cbMnList.ItemIndex] <> nil) then
    Result := Integer(cbMnList.Items.Objects[cbMnList.ItemIndex]);

end;

procedure TInvMain.cbMnListChange(Sender: TObject);
var id_Manufact : integer;
begin
  cdsInvWare.DisableControls;
  try
    cdsInvWare.Filtered := false;
    id_Manufact := Getid_Manufact;

    aAddWare.Enabled := (id_Manufact > 0) and cdsInv_RepCheckDate.IsNull; 

    if id_Manufact > 0 then
      cdsInvWare.Filter := 'id_Manufact=' + IntToStr(id_Manufact)
    else
      cdsInvWare.Filter := '';
    if cbFFF.ItemIndex = 1 then
    begin
      if cdsInvWare.Filter <> '' then cdsInvWare.Filter := cdsInvWare.Filter + ' AND ';
      cdsInvWare.Filter := cdsInvWare.Filter + 'AmountPlan>0'
    end;
    if cbFFF.ItemIndex = 2 then
    begin
      if cdsInvWare.Filter <> '' then cdsInvWare.Filter := cdsInvWare.Filter + ' AND ';
      cdsInvWare.Filter := cdsInvWare.Filter + 'Amount>0'
    end;
    cdsInvWare.Filtered := (id_Manufact > 0) or (cbFFF.ItemIndex > 0);
  finally
    cdsInvWare.EnableControls;
  end;
end;

procedure TInvMain.btnGetRawClick(Sender: TObject);
begin
  GetRaw;
end;

procedure TInvMain.GetRaw;
begin
    cbMnList.ItemIndex := 0;
    cbMnListChange(cbMnList);
  try
    with cdsInvWare do
    begin
      Close;
      Screen.Cursor := crSQLWait;
      Params.ParamByName('@id_Project').Value := Fid_Project;
      if (Fid_Project = -1) and (edNum.Text <> '') then
        Params.ParamByName('@PrjNum').Value := StrToInt(edNum.Text)
      else
        Params.ParamByName('@PrjNum').Value := Null;
      
      Params.ParamByName('@id_Manufact').Value := Null;
      Params.ParamByName('@Mode').Value := 1;//ORD(not cbPlan.Checked);

    {  if not cdsInv_RepCheckDate.IsNull then
      begin
        Params.ParamByName('@Mode').Value := 0;
      end; }

  {$IFDEF LC}
    Params.ParamByName('@Mode').Value := 0;
  {$ELSE}

  {$ENDIF}

      Open;
      Screen.Cursor := crDefault;
    end;
  finally

  end;
end;

procedure TInvMain.grdRawKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = '.') or (Key = ',') then
  begin
    Key := DecimalSeparator;
  end;

  if (Key = #13) then
  begin
    if TDBGridEh(Sender).DataSource.DataSet.State = dsEdit then
      TDBGridEh(Sender).DataSource.DataSet.Post
  end;
end;

procedure TInvMain.grdRawGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
{$IFDEF LC}
   Exit;
{$ENDIF}

  if (ABS(cdsInvWare.FieldByName('AmountPlan').AsFloat) > 0.005) and
     (ABS(cdsInvWare.FieldByName('Delta').AsFloat) > 0.005) then
  begin
    if cdsInvWare.FieldByName('Summ').AsFloat = 0 then
    begin
 //     AFont.Color := clRed;
      AFont.Style := [fsBold];
    end
    else
    if cdsInvWare.fieldByName('SummOper2').AsFloat < cdsInvWare.fieldByName('Summ').AsFloat then
    begin
      AFont.Color := clRed;
      AFont.Style := [fsBold];
    end
    else
    if cdsInvWare.fieldByName('SummOper2').AsFloat > cdsInvWare.fieldByName('Summ').AsFloat then
    begin
      AFont.Color := clGreen;
      AFont.Style := [fsBold];
    end;
  end
  else
  begin
    if ABS(cdsInvWare.FieldByName('AmountPlan').AsFloat) < 0.005 then
      AFont.Color := clGrayText;
  end;
end;

procedure TInvMain.cdsTime2rrrGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
{  if not cdsTime.fieldByName('ValPlan').IsNull and
     not cdsTime.fieldByName('Val').IsNull then
  begin
    Text := FormatFloat('0.00', 1*((cdsTime.fieldByName('ValPlan2').AsFloat) -
                                        (cdsTime.fieldByName('Val2').AsFloat)));
  end;  }
end;

procedure TInvMain.BitBtn1Click(Sender: TObject);
begin
  foMyFuncEhExcel.GreedToExcel(grdtime, '��������� �������, ����� �' + edNum.Text);
end;

procedure TInvMain.BitBtn2Click(Sender: TObject);
begin
  foMyFuncEhExcel.GreedToExcel(grdRaw, '�������� �������, ����� �' + edNum.Text);
end;

  function TInvMain.GetTimeByLine(id_Lines : integer; ExtID : integer) : Variant;
  var Old_RecNo : integer;
  begin
    Result := 0;
    {with cdsTime do
    begin
      Old_RecNo := RecNo;
      DisableControls;
      First;
      while not Eof do
      begin
        if (cdsTimeid_Lines.AsInteger = id_Lines) and not cdsTimeValPlan2.IsNull and
        ((cdsTimeExtID.AsInteger = ExtID) or (ExtID = -1) or
        ((ExtID = -2) and ((cdsTimeExtID.AsInteger <> 1)))
        ) then
        begin
          Result := Result + cdsTimeValPlan2.AsFloat;
        end;
        Next;
      end;
      RecNo := Old_RecNo;
      EnableControls;
      if Result = 0 then
        Result := Null;
    end; }
  end;

procedure TInvMain.PaintGrid_Pred;
  function GetRawByLine(id_Manufact : integer) : Variant;
  var Old_RecNo : integer;
      S : String;
      b : boolean;
  begin
    Result := 0;
    if id_Manufact = 0 then
      Exit;
    with cdsInvWare do
    begin
      Old_RecNo := RecNo;
      DisableControls;
      S := Filter;
      b := Filtered;
      Filtered := false;
      First;
      while not Eof do
      begin
        if (cdsInvWareid_Manufact.AsInteger = id_Manufact) and not cdsInvWareSummOper2.IsNull
//        and (cdsInvWareid_Goods.AsInteger <> cdsInv_Repid_Goods.AsInteger) then
        and (not cdsInvWareFPP.AsBoolean) then
        begin
          Result := Result + cdsInvWareSummOper2.AsFloat;
        end;
        Next;
      end;
      Filter := S;
      Filtered := b;
      RecNo := Old_RecNo;
      EnableControls;
      if Result = 0 then
        Result := Null;
    end;
  end;
  procedure CellVal_Adv(ACol, ARow : integer; AName : String; Code : integer{; APCond : TAPCond = apcNone; V1 : String = ''; V2 : String = ''});
  begin
    if asgPrev.RowCount <= ARow then
      asgPrev.RowCount := ARow + 1;
    asgPrev.Objects[ACol, ARow] := Pointer(Code);
    asgPrev.Cells[ACol, ARow] := AName;
  end;
  procedure CellVal(ACol, ARow : integer; AName : Variant; Code : TRowType = cnsRow_None{; APCond : TAPCond = apcNone; V1 : String = ''; V2 : String = ''});
  begin
    if (VarType(AName) =  varDouble) or (VarType(AName) = varCurrency) then
      CellVal_Adv(ACol, ARow, FormatFloat('0.00', AName), ORD(Code))
    else
      CellVal_Adv(ACol, ARow, VarToStr(AName), ORD(Code));
  end;
var id_Lines, TimePrice, V: OleVariant;
    Row, X, i : integer;
    CCount, OldCol, oldRow, x_Col : integer;
    S : String;
    ALineObj : TLineObj;
    b : boolean;
begin
  if cdsInv_Rep.State in [dsEdit, dsInsert] then
      cdsInv_Rep.Post;

  if cdsInvWare.State in [dsEdit, dsInsert] then
      cdsInvWare.Post;

  inc(FLockPaintCount);
  Screen.Cursor := crSQLWait;
  try
    if FLockPaintCount > 1 then
      Exit;

    with FInvObj_Pred.LN_1_Form do
    begin
      S := cdsInvWare.Filter;
      b := cdsInvWare.Filtered;
      cdsInvWare.Filtered := false;

      DM.rsCA.AppServer.INV_LinesPrice(1, 43, id_Lines, TimePrice);
   //   Raw_PriceStat := DM.rsCA.AppServer.INV_ExtPrice(1, cdsInv_RepAmount1.AsFloat);
    //  Raw_PriceStat :=  VarToFloat(DM.rsCA.AppServer.GetINV_Form(Fid_business, 1));

      TM_Price := TimePrice;
      if id_Lines <> Null then
        TM_Time := GetTimeByLine(id_Lines, -2);

      if id_Lines <> Null then
        TM_Klishe := GetTimeByLine(id_Lines, 1); 

      HF_Amount := 1;                                 

   {   if cdsInvWare.Locate('id_Goods', cdsInv_Repid_Goods.AsInteger, []) then
      begin
        HF_Price := cdsInvWarePricePlan.AsVariant * cdsInvWareAmountPlan.AsVariant;
      end
      else
        HF_Price := 0;  }
   //   V := GetAggregatesValByName('S_PPPPricePlan');
      V := GetAggValByName('PPPPricePlan');
      HF_Price := V;

    end;

    with FInvObj_Pred.LN_2_Print do
    begin
      DM.rsCA.AppServer.INV_LinesPrice(2, 43, id_Lines, TimePrice);
  //    Raw_PriceStat :=  VarToFloat(DM.rsCA.AppServer.GetINV_Form(Fid_business, 1));

      TM_Price := TimePrice;
      if id_Lines <> Null then
        TM_Time := GetTimeByLine(id_Lines);

      HF_Amount := 1;
      HF_Price := GetRawByLine(id_Manufact);
      HF_Price := VarToFloat(HF_Price) + VarToFloat(GetRawByLine(FInvObj_Pred.LN_1_Form.id_Manufact)) {+ GetRawByLine(id_Manufact3)};
    end;

    with FInvObj_Pred.LN_3_Lam do
    begin
      DM.rsCA.AppServer.INV_LinesPrice(3, 43, id_Lines, TimePrice);
    //  Raw_PriceStat := DM.rsCA.AppServer.INV_ExtPrice(3, cdsInv_RepAmount1.AsFloat);
    //  Raw_PriceStat :=  VarToFloat(DM.rsCA.AppServer.GetINV_Form(Fid_business, 3));

      TM_Price := TimePrice;
      if id_Lines <> Null then
        TM_Time := GetTimeByLine(id_Lines);

      HF_Amount := 1;
      HF_Price := GetRawByLine(id_Manufact);// + VarToFloat(GetRawByLine(FInvObj_Pred.LN_1_Form.id_Manufact));
    end;

    with FInvObj_Pred.LN_4_Div do
    begin
      DM.rsCA.AppServer.INV_LinesPrice(4, 43, id_Lines, TimePrice);
     // Raw_PriceStat := DM.rsCA.AppServer.INV_ExtPrice(4, cdsInv_RepAmount1.AsFloat);

    {  V := (VarToFloat(DM.rsCA.AppServer.GetINV_Form(Fid_business, 10))
                    + VarToFloat(DM.rsCA.AppServer.GetINV_Form(Fid_business, 11))) * FInvObj_Pred.LN_4_Div.W_Amount;
           }
     { Raw_PriceStat := V;       }
      
      TM_Price := TimePrice;
      if id_Lines <> Null then
        TM_Time := GetTimeByLine(id_Lines);

      HF_Amount := 1;
      HF_Price := GetRawByLine(id_Manufact){ + GetRawByLine(id_Manufact2) + GetRawByLine(id_Manufact3)};
    end;


    OldCol := asgPrev.Col;
    oldRow := asgPrev.Row;
    asgPrev.Clear;
    asgPrev.RowCount := 2;
    CCount := 5;
    asgPrev.ColCount := cnsNameCol + 2 + FInvObj_Pred.FLineList.Count;
    

    Row := cnsTitle;
    CellVal(cnsNameCol, cnsTitle, '��������');

    inc(Row);
    CellVal(cnsNameCol, Row, '��-�� ����� � ����������', cnsRow_Raw_Price);
    inc(Row);
    CellVal(cnsNameCol, Row, '��-�� ����������. ������', cnsRow_Raw_PriceStat);
    inc(Row);
    CellVal(cnsNameCol, Row, '����� ��������� �������� ������', cnsRow_Raw_TotalSum);

    
    inc(Row);
    CellVal(cnsNameCol, Row, '����� ������ ������� (�����)', cnsRow_TM_Time);
    inc(Row);
    CellVal(cnsNameCol, Row, '����� ������� ����� (�����)', cnsRow_TM_Klishe);
    inc(Row);
    CellVal(cnsNameCol, Row, '��������� ���� ������', cnsRow_TM_Price);
    inc(Row);
    CellVal(cnsNameCol, Row, '��������� �����', cnsRow_TM_TotalSum);
    
    inc(Row);
    CellVal(cnsNameCol, Row, '����� ��������� ���������� ������', cnsRow_TotalSum);
    
    inc(Row);
    CellVal(cnsNameCol, Row, '����� ��������� ������� ���������', cnsRow_Invoice);

    inc(Row);
    CellVal(cnsNameCol, Row, '������������� �����', cnsRow_KL_inv);

    for i := 0 to FInvObj_Pred.FLineList.Count - 1 do
    begin
      ALineObj := FInvObj_Pred.LineObj[i];
      x_Col := cnsNameCol + i + 1;

      Row := cnsTitle;
      CellVal(x_Col, Row, ALineObj.Name);

      inc(Row);
      CellVal(x_Col, Row, ALineObj.HF_Sum, cnsRow_Raw_Price);
      inc(Row);
      CellVal(x_Col, Row, ALineObj.Raw_PriceStat, cnsRow_Raw_PriceStat);
      inc(Row);
      CellVal(x_Col, Row, ALineObj.Raw_TotalSum, cnsRow_Raw_TotalSum);

      inc(Row);
      CellVal(x_Col, Row, ALineObj.TM_Time, cnsRow_TM_Time);
      inc(Row);
      CellVal(x_Col, Row, ALineObj.TM_Klishe, cnsRow_TM_Klishe);
      inc(Row);
      CellVal(x_Col, Row, ALineObj.TM_Price, cnsRow_TM_Price);
      inc(Row);
      CellVal(x_Col, Row, ALineObj.TM_TotalSum, cnsRow_TM_TotalSum);
    end;
    x_Col := cnsNameCol + FInvObj_Pred.FLineList.Count + 1;
    Row := cnsTitle;
    CellVal(x_Col, Row, '�����');
    inc(Row);
    CellVal(x_Col, Row, FInvObj_Pred.TT_HF_Sum, cnsRow_Raw_Price);
    inc(Row);
    CellVal(x_Col, Row, FInvObj_Pred.TT_PriceStat, cnsRow_Raw_PriceStat);
    inc(Row);
    CellVal(x_Col, Row, FInvObj_Pred.TT_Raw_TotalSum - VarToFloat(FInvObj_Pred.LN_1_Form.Raw_TotalSum) , cnsRow_Raw_TotalSum);

    inc(Row);
   // CellVal(x_Col, Row, FInvObj_Pred.TT_TM_Time, cnsRow_TM_Time);
    inc(Row);
    inc(Row);
    inc(Row);

    CellVal(x_Col, Row, FInvObj_Pred.TT_TM_TotalSum - VarToFloat(FInvObj_Pred.LN_1_Form.TM_TotalSum), cnsRow_TM_TotalSum);

    inc(Row);
    V := FInvObj_Pred.TT_TotalSum {- VarToFloat(FInvObj_Pred.LN_1_Form.TM_TotalSum) - VarToFloat(FInvObj_Pred.LN_1_Form.Raw_TotalSum)};
    CellVal(x_Col, Row, V, cnsRow_TotalSum);

    inc(Row);
    if cdsInv_RepAmount1.AsFloat <> 0 then
      CellVal(x_Col, Row, V/cdsInv_RepAmount1.AsFloat  + FInvObj.FNR_Delta, cnsRow_Invoice);

    inc(Row);
    CellVal(cnsNameCol + 1, Row, VarToFloat(FInvObj_Pred.LN_1_Form.TM_Time*FInvObj_Pred.LN_1_Form.TM_Price) +
                      VarToFloat(FInvObj_Pred.LN_1_Form.Raw_TotalSum) , cnsRow_KL_inv);
                           
    asgPrev.Col := OldCol;
    asgPrev.Row := oldRow;

  finally
      cdsInvWare.Filter := S;
      cdsInvWare.Filtered := b;

   Dec(FLockPaintCount);
    if FLockPaintCount = 0 then
      Screen.Cursor := crDefault;
  end;
  
end;

procedure TInvMain.Button4Click(Sender: TObject);
begin
  FInvObj_Pred.DoCalc;
  PaintGrid_Pred;
end;

procedure TInvMain.asgPrevGetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
var Code : TRowType;
begin
  Code := GetCode_PRed(ARow);
  if (Code = cnsRow_Raw_TotalSum) or
     (Code = cnsRow_TM_TotalSum) or
     (Code = cnsRow_TotalSum) or
     (Code = cnsRow_W_Amount) or
     (Code = cnsRow_Invoice) then
     AFont.Style := AFont.Style + [fsBold];
  if ACol = (Sender as TAdvColumnGrid).ColCount - 1 then
  begin
    AFont.Style := AFont.Style + [fsBold];
    ABrush.Color := $00F1F2F3;
  end;
{
  if ((ACol = cnsNameCol + 1) or (ACol = cnsNameCol + 2))and (
       (Code = cnsRow_HF_Amount) or
       (Code = cnsRow_HF_Price) or
       (Code = cnsRow_HF_Sum) ) then
      ABrush.Color := clBlack
  else
  begin
    if not (gdSelected in AState) then
    begin
      if (Sender as TAdvColumnGrid).IsSelected(ACol, ARow) and (not (Sender as TAdvColumnGrid).EditMode) then
        AFont.Color := clWhite
      else
        if CanEditCell(ARow, ACol) then
          ABrush.Color := $00DFFFDF;
    end
    else
      AFont.Color := clWindow;
  end; }
end;

function TInvObj.GetTT_HF_Sum: Variant;
var i : integer;
begin
  Result := 0;
  for i := 0 to FLineList.Count - 1 do
  begin
    Result := Result + VarToFloat(TLineObj(FLineList[i]).HF_Sum);
  end;
end;

procedure TInvMain.asgPrevGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if (ARow = 0) then
    HAlign := taCenter
  else
    HAlign := taRightJustify;
end;

procedure TInvMain.BitBtn3Click(Sender: TObject);
begin
  AdvStringGridToExcel(asgPrev, '����� �' + edNum.Text);
end;

procedure TInvMain.CheckRO;
begin
//  if not cdsInv_RepCheckDate.IsNull then
  //  MessageBox(Handle, PChar(S), '����������� ��������', MB_YESNO + MB_ICONQUESTION)
end;

procedure TInvMain.cdsTime2ValPlanGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
var Year, Month, Day, Hour, Min, Sec, MSec: Word;
    X : integer;
begin
  if not Sender.IsNull then
  begin
    DecodeDate(Sender.AsDateTime, Year, Month, Day);
    DecodeTime(Sender.AsDateTime, Hour, Min, Sec, MSec);

    x := Trunc(Sender.AsDateTime) - Trunc(EncodeDate(1899, 12, 30));
    if x <> 0 then
    begin 
      Text := Inttostr(X);
    end;
    Text := Text + ' ' + FormatDateTime('hh:mm', Sender.AsDateTime);
  end;
  Text := trim(Text);
end;

procedure TInvMain.grdRawEditButtonClick(Sender: TObject);
var tmpCol : TColumnEh;
begin
  if cdsInvWareGName.IsNull then Exit;
  tmpCol := TDBGridEh(Sender).Columns[TDBGridEh(Sender).col - 1];
  if tmpCol.Field = cdsInvWareGName then
    AddWare(true);
 { if not FOperParamz.ReadOnly then
  begin
    if tmpCol.Field = dsOperWare.DataSet.FieldByName('MeasureName') then
      DoChangeMes;
    if tmpCol.Field = dsOperWare.DataSet.FieldByName('AmountOper') then
      EditAmountOper;
    if tmpCol.Field = dsOperWare.DataSet.FieldByName('SummSys') then
      sbConvertCrn;
  end; }
end;

procedure TInvMain.AddWare(AEdit: boolean);
var ASelectedObj : TSelectedObj;
    Price, ID_Cur: OleVariant;
    TotalAmount : Double;
    id_Warehouse : integer;
    AID, AName : OleVariant;
    S : String;
    EObjTypes : TEObjTypes;
    OldID, OldRecNo : Integer;
begin
{$IFNDEF SEINV}
  Screen.Cursor := crSQLWait;
  EObjTypes := [eotGoods];
  with cdsInvWare do
  begin
    if not FieldByName('id_Goods').IsNull then
    begin
      ASelectedObj.ID := FieldByName('id_Goods').Value;
      ASelectedObj.ObjType := eotGoods;
    end;
    OldID := ASelectedObj.ID;
{$IFNDEF LC}
   if SelectObjUnBsn(Owner, Fid_business, ASelectedObj, 0, EObjTypes, true, -1) then
{$ELSE}
  if SelectObjUnLCBsn(Fid_business, ASelectedObj, 0, EObjTypes) then
{$ENDIF}

    begin
      OldRecNo := RecNo;
      if ((OldID <> ASelectedObj.ID)) and Locate('id_Goods', ASelectedObj.ID, []) then
      begin
          if MessageBox(Handle, PChar('���� ����� ��� ������. �� ������ �� ��������� ��� ��������, � ������ �������� ��� ����������.' + #13 + #10 +
                                      '�������� ��������?'), '���� ����� ��� ������', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) <> IDYES	then
          begin
            grdRaw.Col := 4;
            windows.SetFocus(grdRaw.Handle);
            Exit;
          end
          else
          begin
            RecNo := OldRecNo;
          end;
      end;
      if AEdit then
        Edit
      else
      begin
        Append;
      end;

      FieldByName('GName').Value := ASelectedObj.Name;
      FieldByName('id_Goods').Value := ASelectedObj.ID;
      FieldByName('id_Manufact').Value := Getid_Manufact;
      FieldByName('MNName').Value := cbMnList.Items[cbMnList.ItemIndex];
      if ASelectedObj.ID_Cat = 1437 then
      begin
          // ��� ���������� ��������
        FieldByName('PLLid_Goods').Value := ASelectedObj.ID;
      end
      else
        FieldByName('PLLid_Goods').Value := Null;

      if DM.rsCA.AppServer.PL_WareMeasureGet(FieldByName('id_Goods').Value,
                                             AID, AName) = 1 then
      begin
        FieldByName('id_Measure').Value := AID;
        FieldByName('MSName').Value := AName;
      end;
      xxxOne;
      Post;
      try
        Locate('id_Goods', ASelectedObj.ID, []);
      except
      end;
      grdRaw.col := 4;
      windows.SetFocus(grdRaw.Handle);
    end;
  end;
{$ENDIF}
end;


procedure TInvMain.pGPClick(Sender: TObject);
var
   MI : TMenuItem;
begin
{$IFNDEF LC}
  MI := TMenuItem(Sender);
  ShowInvDet2(Fid_Project, -1, '������� ���������')
{$ENDIF}
end;

procedure TInvMain.pRawClick(Sender: TObject);
var
   MI : TMenuItem;
begin
{$IFNDEF LC}
  MI := TMenuItem(Sender);
  ShowInvDet2(Fid_Project, MI.Tag, '����������� ' + StringReplace(MI.Caption, '&', '', [rfReplaceAll, rfIgnoreCase]))
{$ENDIF}
end;

procedure TInvMain.p1Click(Sender: TObject);
var
   MI : TMenuItem;
begin
{$IFNDEF SEINV}
  MI := TMenuItem(Sender);
{$IFNDEF LC}
  ShowInvDet('����������� ' + StringReplace(MI.Caption, '&', '', [rfReplaceAll, rfIgnoreCase]), edNum.Text, Fid_business, MI.Tag + 1)
 {$ENDIF}
 {$ENDIF}
end;

procedure TInvMain.cbFFFChange(Sender: TObject);
var i : integer;
    b_Plan, P_Fackt : boolean;
begin
  cbMnListChange(cbMnList);

  b_Plan := true;
  P_Fackt := true;
  if cbFFF.ItemIndex = 1 then
  begin
    P_Fackt := false;
  end;
  if cbFFF.ItemIndex = 2 then
  begin
    b_Plan := false;
  end;
  for i := 0 to grdRaw.Columns.Count - 1 do
  begin
    if POS('����', grdRaw.Columns[i].Title.Caption) = 1 then
      grdRaw.Columns[i].Visible := b_Plan;
    if POS('����', grdRaw.Columns[i].Title.Caption) = 1 then
      grdRaw.Columns[i].Visible := P_Fackt;
  end;
end;

{    with F.qWayList do
    begin
      V := VarArrayCreate([0, FieldCount - 1], varVariant);
      for i := 0 to FieldCount - 1 do
        V[i] := Fields[i].Value;
      Close;
      ParamByName('id_WayList').Value := F.Fid_WayList;
      Open;
      Edit;
      for i := 0 to FieldCount - 1 do
        if UpperCase(Fields[i].FieldName) <> 'ID_WAYLIST' then
          Fields[i].Value := V[i];
      Post;
    end;
}

procedure TInvMain.aVisaClick(Sender: TObject);
begin
{$IFNDEF LC}
  ChDate;
  with cdsInvWare do
  begin
    Filtered := false;
    First;
    while not Eof do        
    begin
      if (ABS(cdsInvWareAmountPlan.AsFloat) > 0.005) and
         (ABS(cdsInvWarePricePlan.AsFloat) <= 0.005) then
      begin
        PageControl1.ActivePage := tsWare;
        grdRaw.Col := 5;
        windows.SetFocus(grdRaw.Handle);
        if MessageBox(Handle, PChar('�� ������� �������� ����. ' + #13 + #10 +
        '������ ��������� ����???'),
        '�� ������� ����', MB_YESNO + MB_ICONERROR + MB_DEFBUTTON1) = idYes then
          Abort;
      end;
      Next;
    end;

    Filtered := Filter <> '';
  end;

{$ENDIF}
  F_CheckMode := true;
  try
    if SaveData then
    begin
      Close;
      DM.rsCA.AppServer.Inv_ProjectSetCheckDate(Fid_Project, Now);
      SendMessage(FHandle, xxx_RefrMsg, Fid_Project, 0);
    end;
  finally
    F_CheckMode := false;
  end;
end;

procedure TInvMain.Button2Click(Sender: TObject);
begin
  Button2.tag := 1;
  F_CheckMode := true;
  SaveData;
  DM.rsCA.AppServer.Inv_ProjectSetCheckDate(Fid_Project, Now);
  Close;
end;

procedure TInvMain.BitBtn5Click(Sender: TObject);
begin
  if not cdsBuh.active then
    raise Exception.Create('������� ������� "�����������"');
  Buh_GreedToExcel;
end;

procedure TInvMain.Button5Click(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    ceKlishe_Inv.Value := VarToFloat(FInvObj.LN_1_Form.TotalSum);
    cePlenka_Inv.Value := VarToFloat(FInvObj.LN_4_Div.Invoice);
                                                        
    with cdsBuh do
    begin
      DisableControls;
      Close;
      Params.ParamByName('@id_Project').Value := Fid_Project;
      if (Fid_Project = -1) and (edNum.Text <> '') then
        Params.ParamByName('@PrjNum').Value := StrToInt(edNum.Text)
      else
        Params.ParamByName('@PrjNum').Value := Null;
      
      Params.ParamByName('@TM').Value := 10;
      Open;

      if Locate('S_ord', 110, []) and (cdsBuhAmount.AsFloat <> 0) then
        ceKlishe_price.Value := cdsBuhSumm.AsFloat/cdsBuhAmount.AsFloat
      else
        ceKlishe_price.Value := 0;
        
      if Locate('S_ord', 120, []) and (cdsBuhAmount.AsFloat <> 0) then
        cePlenka_price.Value := cdsBuhSumm.AsFloat/cdsBuhAmount.AsFloat
      else
        cePlenka_price.Value := 0;

    end;

    with cdsBuh do
    begin
      Close;
      Params.ParamByName('@id_Project').Value := Fid_Project;
      if (Fid_Project = -1) and (edNum.Text <> '') then
        Params.ParamByName('@PrjNum').Value := StrToInt(edNum.Text)
      else
        Params.ParamByName('@PrjNum').Value := Null;
      
      Params.ParamByName('@TM').Value := 2;
      Open;
    end;
    with cdsBuh_GP do
    begin
      Close;
      Screen.Cursor := crSQLWait;
      Params.ParamByName('@id_Project').Value := Fid_Project;
      if (Fid_Project = -1) and (edNum.Text <> '') then
        Params.ParamByName('@PrjNum').Value := StrToInt(edNum.Text)
      else
        Params.ParamByName('@PrjNum').Value := Null;
      
      Params.ParamByName('@TM').Value := 1;
      Open;
    end;
  finally
    cdsBuh.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TInvMain.Buh_GreedToExcel;
var i, j, MaxColWdth : integer;
    OldValue : Variant;
    ExcelApp, DataValues : Variant;
    Workbook, Column, Sheet, Cell1, Cell2, Range, Row : Variant;
    BeginCol, BeginRow, ColumnsCnt, XXX: integer;
    S : String;
    AHandle : HWnd;

procedure xx_GreedToExcel(Grid: TDBGrid; ACaption : string = ''; AFS : integer = -1);
var i, j : integer;
begin
//**************************************************
    with Grid.DataSource.DataSet do
    begin
      DisableControls;
      OldValue := Grid.DataSource.DataSet.fieldByName('id_Goods').AsInteger;
        ColumnsCnt := 0;
        for i := 0 to Grid.Columns.Count - 1 do
      //   if Grid.Columns[i].Visible then
           inc(ColumnsCnt);

        DataValues := VarArrayCreate([0, RecordCount + 0, 0, ColumnsCnt - 1], varVariant);

        XXX := -1;
        for i := 0 to Grid.Columns.Count - 1 do
        begin
     //     if Grid.Columns[i].Visible then
          begin
            inc(XXX);
            DataValues[0, XXX] := Grid.Columns[i].Title.Caption;
          end;
        end;

        j := 1;
        First;
        while not EOF do
        begin
          XXX := -1;
          for i := 0 to Grid.Columns.Count - 1 do
          begin
            inc(XXX);
            if Grid.Columns[i].Visible then
            begin

              if Grid.Columns[i].Field is TDateTimeField then
              begin
                DataValues[j, XXX] := StrToDate(Grid.Columns[i].Field.DisplayText);
              end
              else
              if (Grid.Columns[i].Field is TFloatField) then
              begin
                if not Grid.Columns[i].Field.IsNull then
                begin
                  S := TFloatField(Grid.Columns[i].Field).DisplayFormat;
                  if S = '' then
                    S := '0.##';
                  DataValues[j, XXX] := StrToFloat(FormatFloat(S, Grid.Columns[i].Field.AsFloat))
                end;
              end
              else
                DataValues[j, XXX] := Grid.Columns[i].Field.Value
            end;
          end;

          inc(j);
          Next;
        end;
        Cell1 := Sheet.Cells[BeginRow, BeginCol];
        Cell2 := Sheet.Cells[BeginRow + RecordCount + 0, BeginCol + ColumnsCnt - 1];
        Range := Sheet.Range[Cell1, Cell2];
        Range.Value := DataValues;
        Range.Borders.LineStyle := 1;

        if AFS > 0 then
        begin
          Cell1 := Sheet.Cells[BeginRow, BeginCol + ColumnsCnt - 1];
          Cell2 := Sheet.Cells[BeginRow + RecordCount + 0, BeginCol + ColumnsCnt - 1];
          Range := Sheet.Range[Cell1, Cell2];
          Range.Font.Size := 10;

          // Sheet.columns[BeginCol + 2].Borders.LineStyle := 0;
          Cell1 := Sheet.Cells[BeginRow + 0, BeginCol + 2];
          Cell2 := Sheet.Cells[BeginRow + RecordCount - 0, BeginCol + 2];
          Range := Sheet.Range[Cell1, Cell2];
          Range.Borders.LineStyle := 0;
        end;
      //  Range.Font.Size := 9;
       // Range.Borders.Weight := 3;

        Range.VerticalAlignment := 5;
        Range.WrapText := true;

        Cell1 := Sheet.Cells[BeginRow, BeginCol];
        Cell2 := Sheet.Cells[BeginRow, BeginCol + ColumnsCnt - 1];
        Range := Sheet.Range[Cell1, Cell2];
        Range.Font.Bold := true;


      Locate('id_Goods', OldValue, [loCaseInsensitive]);
      EnableControls;
    end;
    Cell1 := Sheet.Cells[BeginRow - 1, BeginCol];
    Cell1.Font.Bold := true;
    Cell1.Font.Size := 10;
    Cell1.Value := ACaption;
  //**************************************************
end;
begin
  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;
  CheckExcel;

  BeginCol := 1;

  MaxColWdth := 55;

  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Application.EnableEvents := false;
 //  ExcelApp.Visible := true;

  try
    try Workbook := ExcelApp.WorkBooks.Add; except end;
    Sheet := ExcelApp.Workbooks[1].WorkSheets[1];
    Sheet.Cells.Font.Size := 8;

    BeginRow := 2;
    xx_GreedToExcel(dbgB, '����� ������� ����� �� ����� �' + edNum.Text, 10);
    BeginRow := 2 + cdsBuh.RecordCount + 4;
    xx_GreedToExcel(dbgBGP, '�����������');

    BeginRow := 2 + cdsBuh.RecordCount + 4 + cdsBuh_GP.RecordCount + 1;
    Cell1 := Sheet.Cells[BeginRow, BeginCol + 3];
    Cell1.value := cdsBuh_GPTT.Value;
    Cell1.Borders.LineStyle := 1;
 //   Cell1.Font.Size := 9;
    Cell1.Font.Bold := true;

 {
    BeginRow := 2 + cdsBuh.RecordCount + cdsBuh_GP.RecordCount + 6;
    Cell1 := Sheet.Cells[BeginRow, BeginCol];
    Cell1.value := '������������� �����';
    Cell1.HorizontalAlignment  := 4;
    Cell1 := Sheet.Cells[BeginRow, BeginCol + 2];
    Cell1.value := ceKlishe_Inv.Value;
    Cell1.HorizontalAlignment  := 4;
    Cell1.NumberFormat := '0,00';

    inc(BeginRow);
    Cell1 := Sheet.Cells[BeginRow, BeginCol];
    Cell1.value := '������������� ������';
    Cell1.HorizontalAlignment  := 4;
    Cell1 := Sheet.Cells[BeginRow, BeginCol + 2];
    Cell1.value := cePlenka_Inv.Value;
    Cell1.HorizontalAlignment  := 4;
    Cell1.NumberFormat := '0,00';
 }
    inc(BeginRow);
    inc(BeginRow);
    Cell1 := Sheet.Cells[BeginRow, BeginCol];
    Cell1.value := '��������� �����';
    Cell1.HorizontalAlignment  := 4;
    Cell1 := Sheet.Cells[BeginRow, BeginCol + 2];
    Cell1.value := ceKlishe_price.Value;
    Cell1.HorizontalAlignment  := 4;
    Cell1.NumberFormat := '0,00';

    inc(BeginRow);
    Cell1 := Sheet.Cells[BeginRow, BeginCol];
    Cell1.value := '��������� ������';
    Cell1.HorizontalAlignment  := 4;
    Cell1 := Sheet.Cells[BeginRow, BeginCol + 2];
    Cell1.value := cePlenka_price.Value;
    Cell1.HorizontalAlignment  := 4;
    Cell1.NumberFormat := '0,00';

    inc(BeginRow);
    inc(BeginRow);
    Cell1 := Sheet.Cells[BeginRow, BeginCol];
  {  for i := 0 to grdTime.Columns.Count - 1 do
    begin
      if grdTime.Columns[i].Field = cdsTimeVal2 then
      begin

        S := grdTime.GetFooterValue(1, grdTime.Columns[i]);
        Cell1.value := '����� ��������� ������ � ����� ����� ' + S;
        Cell1.HorizontalAlignment  := 1;
        Break;
      end;
    end;  }
 //   Cell1.Value := '����� ������� ����� �� ����� �' + edNum.Text;
  except
    ExcelApp.Quit;
    ExcelApp := Null;
    Exit;

  end;

  for i := 0 to 10 do
  begin
    Column := Sheet.Columns[BeginCol + i];
    Column.AutoFit;
    if Column.ColumnWidth > MaxColWdth then
      Column.ColumnWidth := MaxColWdth;
  end;

  Sheet.Cells.VerticalAlignment := 5;
  Sheet.Cells.WrapText := true;
  Sheet.Columns[BeginCol + 3].NumberFormat := '0,00';

        {  for i := 0 to 100 do
  begin
    Row := Sheet.Rows[BeginRow + i];
    Row.AutoFit;
  end;  }

  ExcelApp.Visible := true;
end;

procedure TInvMain.cdsInvWareAfterPost(DataSet: TDataSet);
var i, id_Goods, id_Inv_Ware : integer;
begin
//  FInvObj.LN_1_Form.Raw_PriceStat := GetAggValByName('PPPPrice');

  try
    id_Inv_Ware := cdsInvWareid_Inv_Ware.AsInteger;
    id_Goods := cdsInvWareid_Goods.AsInteger;

  //  FInvObj.DoCalc;
  //  PaintGrid;
    NeedRefrMain := true;
  finally
    if id_Inv_Ware > 0 then
      cdsInvWare.Locate('id_Inv_Ware', id_Inv_Ware, [])
    else
      cdsInvWare.Locate('id_Goods', id_Goods, []);
  end;  
end;

procedure TInvMain.DoRefrMAin;
var i, id_Goods, id_Inv_Ware : integer;
begin
  try
    id_Inv_Ware := cdsInvWareid_Inv_Ware.AsInteger;
    id_Goods := cdsInvWareid_Goods.AsInteger;

    FInvObj.DoCalc;
    PaintGrid;
  finally
    if id_Inv_Ware > 0 then
      cdsInvWare.Locate('id_Inv_Ware', id_Inv_Ware, [])
    else
      cdsInvWare.Locate('id_Goods', id_Goods, []);
  end;
end;

function TInvMain.GetAggregatesValByName(ANAme: String): Variant;
var i : integer;
begin
  try
    Result := Null;
    for i := 0 to cdsInvWare.Aggregates.Count - 1 do
    begin
      if UpperCase(cdsInvWare.Aggregates[i].AggregateName) = UpperCase(ANAme) then
      begin
        Result := cdsInvWare.Aggregates[i].Value;
        Break;
      end;
    end;
  except

  end;
end;

function TInvMain.GetAggValByName(ANAme: String): Variant;
var i, id_Goods, id_Inv_Ware : integer;
    AField : TField;
    b : boolean;
begin
  Result := 0;
  with cdsInvWare do
  begin
    DisableControls;

    id_Inv_Ware := -1;
    id_Goods := -1;
    id_Inv_Ware := cdsInvWareid_Inv_Ware.AsInteger;
    id_Goods := cdsInvWareid_Goods.AsInteger;
    

    b := Filtered;
    Filtered := false;
    try
      AField := FieldByName(ANAme);
      First;
      while not Eof do
      begin
        if cdsInvWareFPP.AsBoolean then
          Result := Result + AField.AsFloat;
        Next;
      end;
      if id_Inv_Ware > 0 then
        Locate('id_Inv_Ware', id_Inv_Ware, [])
      else
        Locate('id_Goods', id_Goods, []);
    finally
      Filtered := b;
      EnableControls;
    end;
  end;
end;

procedure TInvMain.aVisaFactClick(Sender: TObject);
begin
  ChDate;
  with cdsInvWare do
  begin
    Filtered := false;
    First;
    while not Eof do        
    begin
      if (ABS(cdsInvWareAmountPlan.AsFloat) > 0.005) and
         (ABS(cdsInvWarePricePlan.AsFloat) <= 0.005) then
      begin
        PageControl1.ActivePage := tsWare;
        grdRaw.Col := 5;
        windows.SetFocus(grdRaw.Handle);
        if MessageBox(Handle, PChar('�� ������� �������� ����. ' + #13 + #10 +
        '������ ��������� ����???'),
        '�� ������� ����', MB_YESNO + MB_ICONERROR + MB_DEFBUTTON1) = idYes then
          Abort;
      end;
      Next;
    end;

    Filtered := Filter <> '';
  end;


  F_CheckMode := true;
  try
    if SaveData then
    begin
      Close;
      DM.rsCA.AppServer.Inv_ProjectSetCheckDateFact(Fid_Project, Now);
      SendMessage(FHandle, xxx_RefrMsg, Fid_Project, 0);
    end;
  finally
    F_CheckMode := false;
  end;

end;

procedure TInvMain.Button6Click(Sender: TObject);
var id_Lines,TimePrice : OleVariant;
begin
  with FInvObj.LN_1_Form do
  begin
    DM.rsCA.AppServer.INV_LinesPrice(1, 43, id_Lines, TimePrice);
    TM_Price := TimePrice;
  end;
  with FInvObj.LN_2_Print do
  begin
 
    DM.rsCA.AppServer.INV_LinesPrice(2, 43, id_Lines, TimePrice);
    TM_Price := TimePrice;
  end;
  with FInvObj.LN_3_Lam do
  begin
   DM.rsCA.AppServer.INV_LinesPrice(3, 43, id_Lines, TimePrice);
    TM_Price := TimePrice;
  end;
  with FInvObj.LN_4_Div do
  begin
   DM.rsCA.AppServer.INV_LinesPrice(4, 43, id_Lines, TimePrice);
    TM_Price := TimePrice;
  end;
  btnCalcInv.Click;
end;

procedure TInvMain.btnSelCA2Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
    AEObjTypes: TEObjTypes;
begin
  ASelectedObj.ID := -1;
  ASelectedObj.ObjType := eotCA;

 if SelectObjUnBsn(Self, 43, ASelectedObj, false, [eotRepr]) then
  begin
    with cdsInv_Rep do
    begin
      Edit;
      FieldByName('OwnName').AsString := ASelectedObj.Name;
      if (ASelectedObj.CA_Name <> ASelectedObj.Name) then FieldByName('OwnName').AsString := FieldByName('OwnName').AsString + ' (' + ASelectedObj.CA_Name + ')';
      Post;
    end;
  end;
end;

procedure TInvMain.btn1CClick(Sender: TObject);
begin
    cdsInvWare1C.Params.ParamByName('@id_Project').Value := Fid_Project;
    cdsInvWare1C.Params.ParamByName('@PrjNum').Value := null;
    cdsInvWare1C.Params.ParamByName('@id_Manufact').Value := null;
    cdsInvWare1C.Params.ParamByName('@Mode').Value := 777;

    cdsInvWare1C.Execute;
    MessageBox(Handle, '�������� ������ � 1� ���������', Pchar(Application.Title), MB_ICONINFORMATION + MB_OK)
end;

end.






