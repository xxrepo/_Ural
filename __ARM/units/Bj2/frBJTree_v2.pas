unit frBJTree_v2;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, Db, DBClient, ActnList, ToolWin, Menus,
  dbgrids, contnrs, RXDBCtrl, RXCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner,
  dxDBTL, StdCtrls, foMyFunc, Placemnt;

const xxx = 0;
type

  TNodeObj = class
  private
    FID : integer;
    FName: String;
    FPID: Variant;
    FBlocked: boolean;
    FBJType : TBJType;
    ID_Acc, id_ContrAgent: Variant;
    FisDeb: boolean;
  public
    constructor Create;
    destructor Destroy; override;
    property ID : integer read FID write FID;
    property PID : Variant read FPID write FPID;
    property Name : String read FName write FName;
    property Blocked : boolean read FBlocked;
    property isDeb : boolean read FisDeb;
    property BJType : TBJType read FBJType;
  end;

  TfBJTree_v2 = class(TFrame)
    ActionList1: TActionList;
    aNewDeb: TAction;
    aProperty: TAction;
    aArc: TAction;
    aRefreshe: TAction;
    aDelete: TAction;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    PopupMenu2: TPopupMenu;
    MenuItem3: TMenuItem;
    N1: TMenuItem;
    pmServiceType: TPopupMenu;
    N3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N6: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    aNewCh: TAction;
    N4: TMenuItem;
    ImgList: TImageList;
    cdsBJTec: TClientDataSet;
    aBJ_ItemAdd: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    aAddAcc: TAction;
    aAddCA: TAction;
    N7: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N2: TMenuItem;
    aNewCred: TAction;
    N5: TMenuItem;
    N13: TMenuItem;
    dxDBTreeList1: TdxDBTreeList;
    dsBJTree: TDataSource;
    cdsBJTree: TClientDataSet;
    aAddDeb: TAction;
    aAddKred: TAction;
    aAddAcz: TAction;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    ToolButton1: TToolButton;
    aClearGrp: TAction;
    N24: TMenuItem;
    N25: TMenuItem;
    aExcel: TAction;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    aItemUP: TAction;
    aItemDown: TAction;
    aSort: TAction;
    ToolButton12: TToolButton;
    ToolButton10: TToolButton;
    ceOper: TEdit;
    Label32: TLabel;
    aDet: TAction;
    N26: TMenuItem;
    N27: TMenuItem;
    dtTo: TDateTimePicker;
    Label2: TLabel;
    ToolButton11: TToolButton;
    aAccCard: TAction;
    aBalance: TAction;
    N28: TMenuItem;
    N29: TMenuItem;
    ToolButtonSep13: TToolButton;
    aExpandNode: TAction;
    aCollapseNode: TAction;
    aExpandAll: TAction;
    aCollapseAll: TAction;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    aNodeExp: TAction;
    N35: TMenuItem;
    aSetisDirect: TAction;
    aSetisInState: TAction;
    N36: TMenuItem;
    cdsBJTreeOrderNum: TIntegerField;
    cdsBJTreeisDeb: TBooleanField;
    cdsBJTreeName: TStringField;
    cdsBJTreeid_Acc: TIntegerField;
    cdsBJTreeid_ContrAgent: TIntegerField;
    cdsBJTreeid_BJ_Tree: TIntegerField;
    cdsBJTreePID: TIntegerField;
    cdsBJTreeid_BJ_Item: TIntegerField;
    cdsBJTreeExtID: TIntegerField;
    cdsBJTreeALevel: TIntegerField;
    cdsBJTreeisInState: TBooleanField;
    cdsBJTreeBlackList: TIntegerField;
    cdsBJTreePlanIn: TFloatField;
    cdsBJTreePlanDelta1: TFloatField;
    cdsBJTreePlanCorrect1: TFloatField;
    cdsBJTreePlanTotal1: TFloatField;
    cdsBJTreeS_Pay1: TFloatField;
    cdsBJTreeTRez1: TFloatField;
    cdsBJTreePRC1: TFloatField;
    cdsBJTreeDelta1: TFloatField;
    cdsBJTreePlanDelta2: TFloatField;
    cdsBJTreePlanCorrect2: TFloatField;
    cdsBJTreePlanTotal2: TFloatField;
    cdsBJTreeS_Pay2: TFloatField;
    cdsBJTreeTRez2: TFloatField;
    cdsBJTreePRC2: TFloatField;
    cdsBJTreeDelta2: TFloatField;
    cdsBJTreePlanDelta3: TFloatField;
    cdsBJTreePlanCorrect3: TFloatField;
    cdsBJTreePlanTotal3: TFloatField;
    cdsBJTreeS_Pay3: TFloatField;
    cdsBJTreeTRez3: TFloatField;
    cdsBJTreePRC3: TFloatField;
    cdsBJTreeDelta3: TFloatField;
    cdsBJTreePlanDeltaQ1: TFloatField;
    cdsBJTreePlanCorrectQ1: TFloatField;
    cdsBJTreePlanTotalQ1: TFloatField;
    cdsBJTreeS_PayQ1: TFloatField;
    cdsBJTreeTRezQ1: TFloatField;
    cdsBJTreePRCQ1: TFloatField;
    cdsBJTreeDeltaQ1: TFloatField;
    cdsBJTreePlanDelta4: TFloatField;
    cdsBJTreePlanCorrect4: TFloatField;
    cdsBJTreePlanTotal4: TFloatField;
    cdsBJTreeS_Pay4: TFloatField;
    cdsBJTreeTRez4: TFloatField;
    cdsBJTreePRC4: TFloatField;
    cdsBJTreeDelta4: TFloatField;
    cdsBJTreePlanDelta5: TFloatField;
    cdsBJTreePlanCorrect5: TFloatField;
    cdsBJTreePlanTotal5: TFloatField;
    cdsBJTreeS_Pay5: TFloatField;
    cdsBJTreeTRez5: TFloatField;
    cdsBJTreePRC5: TFloatField;
    cdsBJTreeDelta5: TFloatField;
    cdsBJTreePlanDelta6: TFloatField;
    cdsBJTreePlanCorrect6: TFloatField;
    cdsBJTreePlanTotal6: TFloatField;
    cdsBJTreeS_Pay6: TFloatField;
    cdsBJTreeTRez6: TFloatField;
    cdsBJTreePRC6: TFloatField;
    cdsBJTreeDelta6: TFloatField;
    cdsBJTreePlanDeltaQ2: TFloatField;
    cdsBJTreePlanCorrectQ2: TFloatField;
    cdsBJTreePlanTotalQ2: TFloatField;
    cdsBJTreeS_PayQ2: TFloatField;
    cdsBJTreeTRezQ2: TFloatField;
    cdsBJTreePRCQ2: TFloatField;
    cdsBJTreeDeltaQ2: TFloatField;
    cdsBJTreePlanDelta7: TFloatField;
    cdsBJTreePlanCorrect7: TFloatField;
    cdsBJTreePlanTotal7: TFloatField;
    cdsBJTreeS_Pay7: TFloatField;
    cdsBJTreeTRez7: TFloatField;
    cdsBJTreePRC7: TFloatField;
    cdsBJTreeDelta7: TFloatField;
    cdsBJTreePlanDelta8: TFloatField;
    cdsBJTreePlanCorrect8: TFloatField;
    cdsBJTreePlanTotal8: TFloatField;
    cdsBJTreeS_Pay8: TFloatField;
    cdsBJTreeTRez8: TFloatField;
    cdsBJTreePRC8: TFloatField;
    cdsBJTreeDelta8: TFloatField;
    cdsBJTreePlanDelta9: TFloatField;
    cdsBJTreePlanCorrect9: TFloatField;
    cdsBJTreePlanTotal9: TFloatField;
    cdsBJTreeS_Pay9: TFloatField;
    cdsBJTreeTRez9: TFloatField;
    cdsBJTreePRC9: TFloatField;
    cdsBJTreeDelta9: TFloatField;
    cdsBJTreePlanDeltaQ3: TFloatField;
    cdsBJTreePlanCorrectQ3: TFloatField;
    cdsBJTreePlanTotalQ3: TFloatField;
    cdsBJTreeS_PayQ3: TFloatField;
    cdsBJTreeTRezQ3: TFloatField;
    cdsBJTreePRCQ3: TFloatField;
    cdsBJTreeDeltaQ3: TFloatField;
    cdsBJTreePlanDelta10: TFloatField;
    cdsBJTreePlanCorrect10: TFloatField;
    cdsBJTreePlanTotal10: TFloatField;
    cdsBJTreeS_Pay10: TFloatField;
    cdsBJTreeTRez10: TFloatField;
    cdsBJTreePRC10: TFloatField;
    cdsBJTreeDelta10: TFloatField;
    cdsBJTreePlanDelta11: TFloatField;
    cdsBJTreePlanCorrect11: TFloatField;
    cdsBJTreePlanTotal11: TFloatField;
    cdsBJTreeS_Pay11: TFloatField;
    cdsBJTreeTRez11: TFloatField;
    cdsBJTreePRC11: TFloatField;
    cdsBJTreeDelta11: TFloatField;
    cdsBJTreePlanDelta12: TFloatField;
    cdsBJTreePlanCorrect12: TFloatField;
    cdsBJTreePlanTotal12: TFloatField;
    cdsBJTreeS_Pay12: TFloatField;
    cdsBJTreeTRez12: TFloatField;
    cdsBJTreePRC12: TFloatField;
    cdsBJTreeDelta12: TFloatField;
    cdsBJTreePlanDeltaQ4: TFloatField;
    cdsBJTreePlanCorrectQ4: TFloatField;
    cdsBJTreePlanTotalQ4: TFloatField;
    cdsBJTreeS_PayQ4: TFloatField;
    cdsBJTreeTRezQ4: TFloatField;
    cdsBJTreePRCQ4: TFloatField;
    cdsBJTreeDeltaQ4: TFloatField;
    cdsBJTreePlanDeltaYear: TFloatField;
    cdsBJTreePlanCorrectYear: TFloatField;
    cdsBJTreePlanTotalYear: TFloatField;
    cdsBJTreeS_PayYear: TFloatField;
    cdsBJTreeTRezYear: TFloatField;
    cdsBJTreePRCYear: TFloatField;
    cdsBJTreeDeltaYear: TFloatField;
    dxDBTreeList1Name: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Acc: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_ContrAgent: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_BJ_Tree: TdxDBTreeListMaskColumn;
    dxDBTreeList1PID: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_BJ_Item: TdxDBTreeListMaskColumn;
    dxDBTreeList1ALevel: TdxDBTreeListMaskColumn;
    dxDBTreeList1isInState: TdxDBTreeListCheckColumn;
    dxDBTreeList1BlackList: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanIn: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDelta1: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrect1: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotal1: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_Pay1: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRC1: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta1: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDelta2: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrect2: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotal2: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_Pay2: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRC2: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta2: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDelta3: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrect3: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotal3: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_Pay3: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRC3: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta3: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDeltaQ1: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrectQ1: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotalQ1: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_PayQ1: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRCQ1: TdxDBTreeListMaskColumn;
    dxDBTreeList1DeltaQ1: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDelta4: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrect4: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotal4: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_Pay4: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRC4: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta4: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDelta5: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrect5: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotal5: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_Pay5: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRC5: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta5: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDelta6: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrect6: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotal6: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_Pay6: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRC6: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta6: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDeltaQ2: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrectQ2: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotalQ2: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_PayQ2: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRCQ2: TdxDBTreeListMaskColumn;
    dxDBTreeList1DeltaQ2: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDelta7: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrect7: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotal7: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_Pay7: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRC7: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta7: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDelta8: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrect8: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotal8: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_Pay8: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRC8: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta8: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDelta9: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrect9: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotal9: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_Pay9: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRC9: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta9: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDeltaQ3: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrectQ3: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotalQ3: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_PayQ3: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRCQ3: TdxDBTreeListMaskColumn;
    dxDBTreeList1DeltaQ3: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDelta10: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrect10: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotal10: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_Pay10: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRC10: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta10: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDelta11: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrect11: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotal11: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_Pay11: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRC11: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta11: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDelta12: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrect12: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotal12: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_Pay12: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRC12: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta12: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDeltaQ4: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrectQ4: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotalQ4: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_PayQ4: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRCQ4: TdxDBTreeListMaskColumn;
    dxDBTreeList1DeltaQ4: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDeltaYear: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanCorrectYear: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanTotalYear: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_PayYear: TdxDBTreeListMaskColumn;
    dxDBTreeList1TRezYear: TdxDBTreeListMaskColumn;
    dxDBTreeList1PRCYear: TdxDBTreeListMaskColumn;
    dxDBTreeList1DeltaYear: TdxDBTreeListMaskColumn;
    RxSpeedButton2: TRxSpeedButton;
    pmHide: TPopupMenu;
    cbNullRow: TMenuItem;
    cbNullCol: TMenuItem;
    N40: TMenuItem;
    ToolButton14: TToolButton;
    cbShowQ1: TMenuItem;
    cbShowYear: TMenuItem;
    N41: TMenuItem;
    cbShowPRC: TMenuItem;
    cbShowPlan: TMenuItem;
    cbShowCorrect: TMenuItem;
    cbShowPlanTotal: TMenuItem;
    cbShowS_Pay: TMenuItem;
    cbShowDelta: TMenuItem;
    cbShowTRez: TMenuItem;
    N42: TMenuItem;
    cbM1: TMenuItem;
    cbM2: TMenuItem;
    cbM3: TMenuItem;
    cbM4: TMenuItem;
    cbM5: TMenuItem;
    cbM6: TMenuItem;
    cbM7: TMenuItem;
    cbM8: TMenuItem;
    cbM9: TMenuItem;
    cbM10: TMenuItem;
    cbM11: TMenuItem;
    cbM12: TMenuItem;
    dxDBTreeList1OrderNum: TdxDBTreeListMaskColumn;
    dxDBTreeList1isDeb: TdxDBTreeListCheckColumn;
    aUnSetInitial: TAction;
    aSetInitial: TAction;
    dxDBTreeList1ExtID: TdxDBTreeListMaskColumn;
    cbShowQ2: TMenuItem;
    cbShowQ3: TMenuItem;
    cbShowQ4: TMenuItem;
    N18: TMenuItem;
    miNonShowFuture: TMenuItem;
    miToNow: TMenuItem;
    miToClosedPeriod: TMenuItem;
    Action1: TAction;
    procedure aNewDebExecute(Sender: TObject);
    procedure aPropertyExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aNewChExecute(Sender: TObject);
    procedure aBJ_ItemAddExecute(Sender: TObject);
    procedure aAddAccExecute(Sender: TObject);
    procedure aAddCAExecute(Sender: TObject);
    procedure aNewCredExecute(Sender: TObject);
    procedure dxDBTreeList1GetSelectedIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure dxDBTreeList1GetImageIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure pmServiceTypePopup(Sender: TObject);
    procedure aAddDebExecute(Sender: TObject);
    procedure aAddKredExecute(Sender: TObject);
    procedure aAddAczExecute(Sender: TObject);
    procedure aClearGrpExecute(Sender: TObject);
    procedure aExcelExecute(Sender: TObject);
    procedure dxDBTreeList1CustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure aItemUPExecute(Sender: TObject);
    procedure aItemDownExecute(Sender: TObject);
    procedure aSortExecute(Sender: TObject);
    procedure aDetExecute(Sender: TObject);
    procedure cdsBJTreeCalcFields(DataSet: TDataSet);
    procedure aAccCardExecute(Sender: TObject);
    procedure aBalanceExecute(Sender: TObject);
    procedure aExpandNodeExecute(Sender: TObject);
    procedure aCollapseNodeExecute(Sender: TObject);
    procedure aExpandAllExecute(Sender: TObject);
    procedure aCollapseAllExecute(Sender: TObject);
    procedure aNodeExpExecute(Sender: TObject);
    procedure aSetisDirectExecute(Sender: TObject);
    procedure aSetisInStateExecute(Sender: TObject);
    procedure cbNullColClick(Sender: TObject);
    procedure aUnSetInitialExecute(Sender: TObject);
    procedure aSetInitialExecute(Sender: TObject);
  private
    Rights_Add_Del, Rights_Edit, Rights_Corr  : boolean;

    FFFNode : TdxTreeListNode;
    FMode : integer;
    FYear : integer;

    FAll : boolean;
    Fid_BlockSelf, Fid_BlockCh : Variant;
    Fid_Bsn, FisDeb : Variant;
    FReadOnly : boolean;
    FBJType : TBJType;
    function GetID: Variant;
    function GetID_Prn: Variant;
    procedure AddGrp(Node: TTreeNode);
    function GetGrpName: String;
    function GetPID: Variant;
    procedure aNewGrp(APID: Variant; AisDeb : boolean);
    function GetBJType: TBJType;
    procedure AddSimpleRel(AID : integer; ABT: TBJType);
    function GetisDeb: boolean;
    procedure GetIDS(var id_BJ_Item, id_BJ_Tree: Variant);
    procedure SelectEvent(id_BJ_Item, id_BJ_Tree: Variant);
    procedure aAddSys(TechMode: integer);

    procedure SelCA(AID: integer; AName : String);
    procedure SelAcc(AID: integer; AName : String);
    procedure SelCAWS(AID: integer; AName : String; ASumm : Variant);
    procedure SelAccWS(AID: integer; AName : String; ASumm : Variant);
    function GetID_BJ_Item: Variant;

    function BJ_ItemEdit_Check(isDirect, isInState: OleVariant): Integer;
    procedure getDatePeriod(var D1, D2: TDate);
    function getMonth : integer;
    procedure BJ_SetInitial(ACheck: boolean);
    procedure LoadSett;
    procedure SaveSett;
    function GetRegPath: String;
  public
    Fid_BJ_Obj : Variant;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function GetBsnID: integer;
    function GetBJDate : Variant;
    property ID : Variant read GetID;
    property ID_BJ_Item : Variant read GetID_BJ_Item;
    property isDeb : boolean read GetisDeb;
    property PID : Variant read GetPID;
    property GrpName : String read GetGrpName;
    property BJType : TBJType read GetBJType;
    procedure SetVisibleBandsCol(BandIndex : integer; AVisible : boolean);
    procedure Initialize_v2(AYear : integer; AID : Variant; AMode : integer; ABJType : TBJType; id_BJ_Obj : integer;
                       AReadOnly : boolean;
                       id_BlockSelf, id_BlockCh : Variant; AisDeb, Aid_Bsn : Variant);
  end;

implementation

uses uDM, uBJTreeProp, uInputBoxStr, uUnivSelector, uBJItemProp_v2,
  uMultiSelectCA, uMultiSelectAcc, uBalanceSel, foMyFuncDXTreeExcel,
  uBJSort, uBJdet, uAccCard_v2, uBalance_v2;

{$R *.DFM}

{ TfCAGroupList }

procedure TfBJTree_v2.AddGrp(Node : TTreeNode);
var Obj : TNodeObj;
    N, N2 : TTreeNode;
    List : TList;
    Year, Month, Day: Word;
    i : integer;

begin
  List := TList.Create;
  try
    with cdsBJTree do
    begin
      Close;
      Params.ParamByName('@M1').Value := cbM1.Checked;
      Params.ParamByName('@M2').Value := cbM2.Checked;
      Params.ParamByName('@M3').Value := cbM3.Checked;
      Params.ParamByName('@M4').Value := cbM4.Checked;
      Params.ParamByName('@M5').Value := cbM5.Checked;
      Params.ParamByName('@M6').Value := cbM6.Checked;
      Params.ParamByName('@M7').Value := cbM7.Checked;
      Params.ParamByName('@M8').Value := cbM8.Checked;
      Params.ParamByName('@M9').Value := cbM9.Checked;
      Params.ParamByName('@M10').Value := cbM10.Checked;
      Params.ParamByName('@M11').Value := cbM11.Checked;
      Params.ParamByName('@M12').Value := cbM12.Checked;

      Params.ParamByName('@id_BJ_Obj').Value := Fid_BJ_Obj;
      Params.ParamByName('@isDeb').Value := FisDeb;
      Params.ParamByName('@Mode').Value := FMode;
      Params.ParamByName('@id_Oper').Value := DM.GetID_Oper(ceOper.Text) ;
      if dtTo.Checked then
        Params.ParamByName('@DateRep').Value := GetDateAdv(dtTo.Date, true)
      else
        Params.ParamByName('@DateRep').Value := Null;


      if miNonShowFuture.Checked then
      begin
        DecodeDate(Now, Year, Month, Day);
        for i := Month + 1 to 12 do
        begin
          if Params.FindParam('@M' + IntToStr(i)) <> nil then
            Params.ParamByName('@M' + IntToStr(i)).Value := false;
        end;
      end;
      Open;
 
    end;
           
  finally
    List.Free;
  end;
end;

procedure TfBJTree_v2.Initialize_v2(AYear : integer; AID : Variant; AMode : integer; ABJType : TBJType; id_BJ_Obj : integer;
                       AReadOnly : boolean;
                       id_BlockSelf, id_BlockCh : Variant; AisDeb, Aid_Bsn : Variant);
var Obj : TNodeObj;
    BsnObj : TBsnObj;
    N : TTreeNode;
    i, j, TmpID, Cnt : integer;
    Year, Month, Month2, Day: Word;
    AComponent : TComponent;
    ABand : TdxTreeListBand;
    B : boolean;
    Q2_Hide, Q3_Hide, Q4_Hide : boolean;
begin
  FYear := AYear;
  Rights_Add_Del := DM.CheckUserRights(104, Aid_Bsn);
  Rights_Edit := DM.CheckUserRights(102, Aid_Bsn);
  Rights_Corr := DM.CheckUserRights(103, Aid_Bsn);

 // dxDBTreeList1.RegistryPath := SRegPath + '\' + ClassName + '\wwq' + dxDBTreeList1.Name;
 // dxDBTreeList1.OptionsBehavior := dxDBTreeList1.OptionsBehavior + [etoStoreToRegistry];

  if trunc(dtTo.Date) = 0 then
  begin
    dtTo.Date := Now;
    dtTo.Checked := false;
  end;
  
  FFFNode := nil;
//  if Fid_Bsn <> id_Bsn then
  begin
    FMode := AMode;
    b := false;
    if (Fid_BJ_Obj <> id_BJ_Obj)  then
    begin
      SaveSett;
      b := true;
    end;
    Fid_Bsn := Aid_Bsn;


    Fid_BlockSelf := id_BlockSelf;
    Fid_BlockCh := id_BlockCh;
    FBJType := ABJType;
    Fid_BJ_Obj := id_BJ_Obj;
    FReadOnly := AReadOnly;
    FisDeb := AisDeb;

    if b then
      LoadSett;

    aNewDeb.Enabled := true;
    aNewCred.Enabled := true;
  //  aRefreshe.Enabled := Fid_Bsn >= 0;

    ToolBar1.Visible := not AReadOnly;
    try
      Screen.Cursor := crSQLWait;
 //     cdsBJTree.DisableControls;
      dxDBTreeList1.DataSource := nil;
      AddGrp(nil);



  if cbNullRow.Checked then
  begin
    with cdsBJTree do
    begin
      First;
      while not eof do
      begin
        if (cdsBJTreeOrderNum.AsFloat >= 0) and (cdsBJTreeOrderNum.AsFloat <= 1000) and
          (cdsBJTreePlanTotalYear.AsFloat = 0) and (cdsBJTreeS_PayYear.AsFloat = 0) and (cdsBJTreeTRezYear.AsFloat = 0) and (cdsBJTreeDeltaYear.AsFloat = 0) then
          Delete
        else
          Next;
      end;
    end;
  end;
  
    finally
    try
        if  (cdsBJTree.Locate('OrderNum', -99999, [loCaseInsensitive, loPartialKey])) then
        begin
          for j := 0 to dxDBTreeList1.Bands.Count - 1 do
          begin
            dxDBTreeList1.Bands.Items[j].Visible := true;
          end;
          for j := 0 to dxDBTreeList1.ColumnCount - 1 do
          begin
            dxDBTreeList1.Columns[j].Visible := dxDBTreeList1.Columns[j].Tag = 0;
          end;

          for i := 0 to cdsBJTree.Fields.Count - 1 do
          begin
            if cdsBJTree.Fields[i] is TNumericField then
              if cdsBJTree.Fields[i].Tag <> -26 then
                if dxDBTreeList1.FindColumnByFieldName(cdsBJTree.Fields[i].FieldName) <> nil then
                  dxDBTreeList1.ColumnByFieldName(cdsBJTree.Fields[i].FieldName).Visible := (cdsBJTree.Fields[i].AsFloat <> 0) or (not cbNullCol.Checked);
          end;
          if (cdsBJTree.Locate('OrderNum', -99999, [loCaseInsensitive, loPartialKey])) then
          begin
            cdsBJTree.Delete;
          end;
          DecodeDate(Now, Year, Month2, Day);
          Month2 := Month2;
          for j := 0 to dxDBTreeList1.Bands.Count - 1 do
          begin
            ABand := dxDBTreeList1.Bands[j];
            Month := 0;
            if ABand.Caption = 'Январь' then Month := 1;
            if ABand.Caption = 'Февраль' then Month := 2;
            if ABand.Caption = 'Март' then Month := 3;
            if ABand.Caption = 'Апрель' then Month := 4;
            if ABand.Caption = 'Май' then Month := 5;
            if ABand.Caption = 'Июнь' then Month := 6;
            if ABand.Caption = 'Июль' then Month := 7;
            if ABand.Caption = 'Август' then Month := 8;
            if ABand.Caption = 'Сентябрь' then Month := 9;
            if ABand.Caption = 'Октябрь' then Month := 10;
            if ABand.Caption = 'Ноябрь' then Month := 11;
            if ABand.Caption = 'Декабрь' then Month := 12;

            AComponent := FindComponent('cbM' + IntToStr(Month));
            if AComponent is TMenuItem then
            begin
              SetVisibleBandsCol(j,  (AComponent as TMenuItem).Checked and (not miNonShowFuture.Checked or
               (miNonShowFuture.Checked and (Month <= Month2)))
               );
            end;
          end;
                    
          Q2_Hide := (Month2 <= 3) and (miNonShowFuture.Checked);
          Q3_Hide := (Month2 <= 6) and (miNonShowFuture.Checked);
          Q4_Hide := (Month2 <= 9) and (miNonShowFuture.Checked);
           
          for i := dxDBTreeList1.VisibleColumnCount - 1 downto 0 do
          begin
            if (not cbShowQ1.Checked) and (POS('Q1', dxDBTreeList1.VisibleColumns[i].FieldName) > 0) then
              dxDBTreeList1.VisibleColumns[i].Visible := false
            else
            if (not cbShowQ2.Checked or Q2_Hide) and (POS('Q2', dxDBTreeList1.VisibleColumns[i].FieldName) > 0) then
              dxDBTreeList1.VisibleColumns[i].Visible := false
            else
            if (not cbShowQ3.Checked or Q3_Hide) and (POS('Q3', dxDBTreeList1.VisibleColumns[i].FieldName) > 0) then
              dxDBTreeList1.VisibleColumns[i].Visible := false
            else
            if (not cbShowQ4.Checked or Q4_Hide) and (POS('Q4', dxDBTreeList1.VisibleColumns[i].FieldName) > 0) then
              dxDBTreeList1.VisibleColumns[i].Visible := false
            else
              if not cbShowYear.Checked and (POS('Year', dxDBTreeList1.VisibleColumns[i].FieldName) > 0) then
                dxDBTreeList1.VisibleColumns[i].Visible := false
              else
                if not cbShowPlan.Checked and (POS('PlanDelta', dxDBTreeList1.VisibleColumns[i].FieldName) > 0) then
                  dxDBTreeList1.VisibleColumns[i].Visible := false
              else
                if not cbShowCorrect.Checked and (POS('PlanCorrect', dxDBTreeList1.VisibleColumns[i].FieldName) > 0) then
                  dxDBTreeList1.VisibleColumns[i].Visible := false
              else
                if not cbShowPlanTotal.Checked and (POS('PlanTotal', dxDBTreeList1.VisibleColumns[i].FieldName) > 0) then
                  dxDBTreeList1.VisibleColumns[i].Visible := false
              else
                if not cbShowS_Pay.Checked and (POS('S_Pay', dxDBTreeList1.VisibleColumns[i].FieldName) > 0) then
                  dxDBTreeList1.VisibleColumns[i].Visible := false
              else
                if not cbShowTRez.Checked and (POS('TRez', dxDBTreeList1.VisibleColumns[i].FieldName) > 0) then
                  dxDBTreeList1.VisibleColumns[i].Visible := false
              else
                if not cbShowPRC.Checked and (POS('PRC', dxDBTreeList1.VisibleColumns[i].FieldName) > 0) then
                  dxDBTreeList1.VisibleColumns[i].Visible := false
              else
                if not cbShowDelta.Checked and (POS('Delta', dxDBTreeList1.VisibleColumns[i].FieldName)= 1) then
                  dxDBTreeList1.VisibleColumns[i].Visible := false
          end;
          for j := 0 to dxDBTreeList1.Bands.Count - 1 do
          begin
            Cnt := 0;
            for i := 0 to dxDBTreeList1.VisibleColumnCount - 1 do
            begin
              if dxDBTreeList1.Bands.Items[j].Index = dxDBTreeList1.VisibleColumns[i].BandIndex then
                inc(Cnt);
            end;
            if Cnt = 0 then
               dxDBTreeList1.Bands.Items[j].Visible := false;
          end;
        end;

  finally
        dxDBTreeList1.DataSource := dsBJTree;
        Screen.Cursor := crDefault;
      end;
      dxDBTreeList1.DataSource := dsBJTree;
  //    cdsBJTree.EnableControls;
      Screen.Cursor := crDefault;
    end;
  end;
  


  dxDBTreeList1.FullCollapse;
  dxDBTreeList1.OnChangeNode := nil;

  if AID > 0 then
    SelectEvent(-13, AID)
  else
    if AID <> -1 then
      SelectEvent(-AID, -13);
  dxDBTreeList1.OnChangeNode := dxDBTreeList1ChangeNode;
end;

function TfBJTree_v2.GetID: Variant;
begin
  if (FFFNode<> nil) then
  begin
    Result := FFFNode.Values[dxDBTreeList1id_BJ_Tree.Index];
  end
  else
    Result := -2;
end;

function TfBJTree_v2.GetBsnID: integer;
begin
  Result := Fid_Bsn
end;

function TfBJTree_v2.GetGrpName: String;
begin
  if (FFFNode<> nil) then
  begin
    Result := FFFNode.Values[dxDBTreeList1Name.Index];
  end
  else
    Result := '';
end;

constructor TfBJTree_v2.Create(AOwner: TComponent);
var V : Variant;
    i : integer;
begin
  inherited;
  Fid_BJ_Obj := -1;
  for i := 0 to dxDBTreeList1.ColumnCount - 1 do
  begin
    if dxDBTreeList1.Columns[i].Visible then
      dxDBTreeList1.Columns[i].Tag := 0
    else
      dxDBTreeList1.Columns[i].Tag := -26;
  end;
  
  for i := 0 to pmHide.items.count - 1 do
  begin
    V := Null;
    LoadValFromRegistry(V, SRegPath + '\' + ClassName, pmHide.items[i].Name + 'Checked');
    if V <> Null then
      pmHide.items[i].Checked := V;
  end;

  FFFNode := nil;
  Fid_BlockSelf := Null;
  Fid_BlockCh := Null;
  Fid_Bsn := -1;
  dtTo.Checked := false;
  dtTo.Date := 0;
end;

destructor TfBJTree_v2.Destroy;
var i : integer;
begin
  SaveSett;


  inherited;
end;

function TfBJTree_v2.GetRegPath : String;
var i : integer;
    V : Variant;
begin
  Result := '';

  if VarToFloat(Fid_BJ_Obj) > 0 then
  begin
    LoadValFromRegistry(V, SRegPath + '\' + ClassName + 'BJ_' + IntToStr(Fid_BJ_Obj), 'HasSett');
    if V <> Null then Result := 'BJ_' + IntToStr(Fid_BJ_Obj);
  end
  else
    if Fid_Bsn > 0 then
      Result := 'BSN_' + IntToStr(Fid_Bsn);
end;


procedure TfBJTree_v2.LoadSett;
var V : Variant;
    i : integer;
    S : String;
begin
  S := GetRegPath;

  dxDBTreeList1.RegistryPath := SRegPath + '\' + ClassName + S + dxDBTreeList1.Name;
  dxDBTreeList1.LoadFromRegistry(dxDBTreeList1.RegistryPath);


  for i := 0 to dxDBTreeList1.ColumnCount - 1 do
  begin
    if dxDBTreeList1.Columns[i].Visible then
      dxDBTreeList1.Columns[i].Tag := 0
    else
      dxDBTreeList1.Columns[i].Tag := -26;
  end;
  
  for i := 0 to pmHide.items.count - 1 do
  begin
    V := Null;
    LoadValFromRegistry(V, SRegPath + '\' + ClassName + S, pmHide.items[i].Name + 'Checked');
    if V <> Null then
      pmHide.items[i].Checked := V;
  end;
end;

procedure TfBJTree_v2.SaveSett;
var i : integer;
    S : String;
begin
  S := GetRegPath;
  if (Fid_Bsn <> Null) then
    SaveValToRegistry(1, SRegPath + '\' + ClassName + 'BJ_' + IntToStr(Fid_BJ_Obj), 'HasSett');
  if (S <> '') or (Fid_Bsn <> Null) then
    for i := 0 to pmHide.items.count - 1 do
    begin
      if (S <> '') then
        SaveValToRegistry(pmHide.items[i].Checked, SRegPath + '\' + ClassName + S, pmHide.items[i].Name + 'Checked');
      if Fid_Bsn <> Null then
        SaveValToRegistry(pmHide.items[i].Checked, SRegPath + '\' + ClassName + 'BSN_' + IntToStr(Fid_Bsn), pmHide.items[i].Name + 'Checked');
    end;
end;

{ TNodeObj }

constructor TNodeObj.Create;
begin
  inherited;
  FisDeb := true;
  FID := -1;
  FPID := Null;
  FBlocked := false;
  FBJType := bjtGrp;
  ID_Acc := Null;
  id_ContrAgent := Null;
end;

destructor TNodeObj.Destroy;
begin
  inherited;

end;

procedure TfBJTree_v2.aNewDebExecute(Sender: TObject);
begin
  aNewGrp(Null, true);
end;

procedure TfBJTree_v2.aNewGrp(APID : Variant; AisDeb : boolean);
var AID : integer;
begin
  AID := -1;
  if ShowBJTreeProp(AID, Fid_BJ_Obj, APID, AisDeb, Fid_Bsn) then
  begin
  //  Fid_Bsn := 0;
    aRefreshe.Execute;
    SelectEvent(-8, AID);
    if FFFNode <> nil then FFFNode.Expand(false);
  end;
end;

procedure TfBJTree_v2.aPropertyExecute(Sender: TObject);
var AID : integer;
    Value: Variant;
begin
  AID := ID;
  if BJType = bjtGrp then
  begin
    if ShowBJTreeProp(AID, Fid_BJ_Obj, -1, false, Fid_Bsn) then
    begin
      aRefreshe.Execute;
    end;
  end
  else
    AddSimpleRel(FFFNode.Values[dxDBTreeList1id_BJ_Item.Index], BJType);
end;

procedure TfBJTree_v2.aRefresheExecute(Sender: TObject);
var id_BJ_Item, id_BJ_Tree : Variant;
    b : boolean;
begin
  SaveSett;
  dxDBTreeList1.OnChangeNode := nil;
  try
    if FFFNode <> nil then
      b := FFFNode.Expanded
    else
      b := false;
    GetIDS(id_BJ_Item, id_BJ_Tree);
    Initialize_v2(FYear, ID, FMode, BJType, Fid_BJ_Obj, FReadOnly, Fid_BlockSelf, Fid_BlockCh, Null, Fid_Bsn);
  finally
    dxDBTreeList1.OnChangeNode := dxDBTreeList1ChangeNode;
    SelectEvent(id_BJ_Item, id_BJ_Tree);
    if b and (FFFNode <> nil) then
      FFFNode.Expand(false);
  end;


end;

procedure TfBJTree_v2.aDeleteExecute(Sender: TObject);
var
    Rez : integer;
    id_BJ_Item, id_BJ_Tree : Variant;
    P : TdxTreeListNode;
    procedure GetSuxxxNode;
    var NeedLast : boolean;
    begin
      P := FFFNode;
  //    NeedLast := false;
      FFFNode := P.GetNextSibling;
      NeedLast := FFFNode = nil;
      if FFFNode = nil then
        FFFNode := P.Parent;
      P.Free;
        
      if NeedLast and (FFFNode <> nil) and (FFFNode.HasChildren) then
        FFFNode := FFFNode.GetLastChild;
      if FFFNode <> nil then
      begin
        FFFNode.Focused := true;
        FFFNode.MakeVisible;
      end;
    end;
begin
  GetIDS(id_BJ_Item, id_BJ_Tree);

  if BJType = bjtGrp then
  begin
    if MessageBox(Handle, PChar('Удалить группу "' + GetGrpName + '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
    begin
      Rez := DM.rsCA.AppServer.BJ_TreeDel(id_BJ_Tree);
      if Rez <> -1 then
      begin
        GetSuxxxNode;
      //  OrgTreeView.Selected.Delete;
      end
      else
        raise Exception.Create('Ошибка при удалении');
    end;   
  end
  else
    if BJType = bjtItem then
    begin
      if MessageBox(Handle, PChar('Удалить статью "' + GetGrpName + '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
      begin
        Rez := DM.rsCA.AppServer.BJ_ItemDel(id_BJ_Item);
        if Rez <> -1 then
        begin
          GetSuxxxNode;
        end
        else
          raise Exception.Create('Ошибка при удалении');
      end;   
    end
    else
      if (BJType = bjtAcc) or (BJType = bjtCA) then
      begin
        if MessageBox(Handle, PChar('Удалить объект "' + GetGrpName + '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
        begin
          Rez := DM.rsCA.AppServer.BJ_ItemDel(id_BJ_Item);
          if Rez <> -1 then
          begin
            GetSuxxxNode;
          end
          else
            raise Exception.Create('Ошибка при удалении');
        end;
      end;
  if (FFFNode = Nil) and (dxDBTreeList1.Count > 0) then
  begin
    FFFNode := dxDBTreeList1.Items[0];
    FFFNode.Focused := true;
    FFFNode.MakeVisible;
  end;
end;

function TfBJTree_v2.GetPID: Variant;
begin
  if (FFFNode<> nil) then
  begin
    Result := FFFNode.Values[dxDBTreeList1PID.Index];
  end
  else
    Result := Null;
end;

procedure TfBJTree_v2.aNewChExecute(Sender: TObject);
begin
  aNewGrp(GetID_Prn, isDeb);
end;

function TfBJTree_v2.GetBJType: TBJType;
begin
  if (FFFNode<> nil) then
  begin
    if FFFNode.Values[dxDBTreeList1id_Acc.Index] <> Null then
      Result := bjtAcc
    else
      if FFFNode.Values[dxDBTreeList1id_ContrAgent.Index] <> Null then
        Result := bjtCA
      else
        if FFFNode.Values[dxDBTreeList1id_BJ_Item.Index] <> Null then
          Result := bjtItem
        else
          Result := bjtGrp
  end
  else
    Result := bjtNone; 
end;

procedure TfBJTree_v2.aBJ_ItemAddExecute(Sender: TObject);
var Value: Variant;
    I, id_BJ_Tree : integer;
begin
  AddSimpleRel(-1, bjtItem);
end;

procedure TfBJTree_v2.aAddAccExecute(Sender: TObject);
var ASelectedObj : TSelectedObj;
    I, id_BJ_Tree : integer;
    id_ContrAgent, id_Acc: OleVariant;
    BT : TBJType;
begin
  if ShowMultiSelectAcc(Fid_Bsn, SelAcc) then
    aRefreshe.Execute;
end;

procedure TfBJTree_v2.AddSimpleRel(AID : integer; ABT : TBJType);
var id_BJ_Tree : integer;
begin
  id_BJ_Tree := AID;
  if ShowBJItemProp_v2(id_BJ_Tree, GetBsnID, ABT, GetID_Prn, isDeb)  then
  begin
    aRefreshe.Execute;
    SelectEvent(id_BJ_Tree, -13);
  end;
end;

procedure TfBJTree_v2.SelectEvent(id_BJ_Item, id_BJ_Tree : Variant);
var i : integer;
    Node : TdxTreeListNode;
begin
  FFFNode := nil;
  for i := dxDBTreeList1.SelectedCount - 1 downto 0 do
    dxDBTreeList1.SelectedNodes[i].Selected := false;
  if (id_BJ_Item < 0) and (id_BJ_Tree < 0) then
  begin
    if dxDBTreeList1.Count > 0 then
    begin
      FFFNode := dxDBTreeList1.Items[0];
      dxDBTreeList1.MakeNodeVisible(FFFNode);
      FFFNode.Selected := true;
      FFFNode.Focused := true;
      FFFNode.MakeVisible;
    end;
    Exit;
  end;
  Node := dxDBTreeList1.TopNode;
  while Node <> nil do
  begin
    if (Node.Values[dxDBTreeList1id_BJ_Item.Index] = id_BJ_Item) or
       (Node.Values[dxDBTreeList1id_BJ_Tree.Index] = id_BJ_Tree) then
    begin
      dxDBTreeList1.MakeNodeVisible(Node);
      Node.Selected := true;
      Node.Focused := true;
      FFFNode := Node;
      Break;
    end;

    Node := Node.GetNext;
  end;
//  if (FFFNode = nil) and (dxDBTreeList1.Count)
end;

procedure TfBJTree_v2.GetIDS(var id_BJ_Item, id_BJ_Tree : Variant);
begin
  if (FFFNode <> nil) {and (dxDBTreeList1.SelectedCount > 0)} then
  begin
    id_BJ_Item := FFFNode.Values[dxDBTreeList1id_BJ_Item.Index];
    id_BJ_Tree := FFFNode.Values[dxDBTreeList1id_BJ_Tree.Index];
    if id_BJ_Tree = -1 then id_BJ_Tree := -13;
    if id_BJ_Item = Null then id_BJ_Item := -13;
    if id_BJ_Item <> -13 then
      id_BJ_Tree := -13; 
  end
  else
  begin
    id_BJ_Item := -13;
    id_BJ_Tree := -13;
  end;
end;

procedure TfBJTree_v2.SelCA(AID: integer; AName: String);
var ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta: OleVariant;
   id_BJ_Tree : integer;
begin
  ANameX := AName;
  id_ContrAgent := AID;
  id_Acc := Null;
  id_BJ_Tree := ID;

  PlanIn := Null;
  PlanDelta := Null;
  DM.rsCA.AppServer.BJ_ItemEdit(-1, id_BJ_Tree, ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta, false, Null, false, false);
end;

procedure TfBJTree_v2.SelCAWS(AID: integer; AName : String; ASumm : Variant);
var ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta: OleVariant;
   id_BJ_Tree : integer;
begin
  ANameX := AName;
  id_ContrAgent := AID;
  id_Acc := Null;
  id_BJ_Tree := ID;

  PlanIn := ABS(ASumm);
  PlanDelta := Null;
  DM.rsCA.AppServer.BJ_ItemEdit(-1, id_BJ_Tree, ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta, false, Null, false, false);
end;


procedure TfBJTree_v2.SelAcc(AID: integer; AName: String);
var ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta: OleVariant;
   id_BJ_Tree : integer;
begin
  ANameX := AName;
  id_ContrAgent := Null;
  id_Acc := AID;
  id_BJ_Tree := GetID_Prn;

  PlanIn := Null;
  PlanDelta := Null;
  DM.rsCA.AppServer.BJ_ItemEdit(-1, id_BJ_Tree, ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta, true, Null, false, false);
end;

procedure TfBJTree_v2.SelAccWS(AID: integer; AName : String; ASumm : Variant);
var ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta: OleVariant;
   id_BJ_Tree : integer;
begin
  ANameX := AName;
  id_ContrAgent := Null;
  id_Acc := AID;
  id_BJ_Tree := GetID_Prn;

  PlanIn := ASumm;
  PlanDelta := Null;
  DM.rsCA.AppServer.BJ_ItemEdit(-1, id_BJ_Tree, ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta, false, Null, false, false);
end;


procedure TfBJTree_v2.aAddCAExecute(Sender: TObject);
begin
  if ShowMultiSelectCA(Fid_Bsn, SelCA) then
    aRefreshe.Execute;

 // AddSimpleRel(-1, bjtCA);
end;

procedure TfBJTree_v2.aNewCredExecute(Sender: TObject);
begin
  aNewGrp(Null, false);
end;

function TfBJTree_v2.GetisDeb: boolean;
begin
  if (FFFNode<> nil) then
  begin
    Result := FFFNode.Values[dxDBTreeList1isDeb.Index];
  end
  else
    Result := false;
end;

procedure TfBJTree_v2.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  Index := Node.ImageIndex;
  if Index = 1 then
    Index := 0; 
end;

procedure TfBJTree_v2.dxDBTreeList1GetImageIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
var
  ColInd: Integer;
begin
  Index := -1;
  if (Node <> nil) then
  begin
 {   if (Node.Values[dxDBTreeList1ExtID.Index] = 3) then
      Index := 17
    else
    if (Node.Values[dxDBTreeList1ExtID.Index] = 1) or (Node.Values[dxDBTreeList1ExtID.Index] = 2) then
      Index := 16
    else   }
    if (Node.Values[dxDBTreeList1ExtID.Index] = -13) then
      Index := 3
    else     
    if (Node.Values[dxDBTreeList1OrderNum.Index] = -1) then
      Index := 18
    else     
    if (Node.Values[dxDBTreeList1OrderNum.Index] = 3000) then
      Index := 18
    else     
    if Node.Values[dxDBTreeList1id_BJ_Tree.Index] > 0 then
      Index := 1
    else
      if (Node.Values[dxDBTreeList1OrderNum.Index] = 4000) then
        Index := -1
      else
        if Node.Values[dxDBTreeList1id_ContrAgent.Index] <> Null then
          Index := 16
        else
          if Node.Values[dxDBTreeList1id_Acc.Index] <> Null then
            Index := 17
          else
            Index := 2;
  end;     
end;

procedure TfBJTree_v2.dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
var T_Node, B_Node : TdxTreeListNode;
begin    
  FFFNode := Node;
  T_Node := nil;
  B_Node := nil;
  if Node <> nil then
  begin
    T_Node := Node.GetPrevSibling;
    B_Node := Node.GetNextSibling;
  end;
 aProperty.Enabled := (FFFNode <> nil) and
    ((FFFNode.Values[dxDBTreeList1id_BJ_Item.Index] > 0) or
     (FFFNode.Values[dxDBTreeList1id_BJ_Tree.Index] > 0)
    )
    and (FFFNode.Values[dxDBTreeList1ExtID.Index] <> -13)
     and (Rights_Edit or Rights_Corr);
    
  aDelete.Enabled :=  aProperty.Enabled and Rights_Add_Del;

  aItemUP.Enabled := aProperty.Enabled and Rights_Edit;
  aItemDown.Enabled := aProperty.Enabled and Rights_Edit;

  aSort.Enabled := aProperty.Enabled and Rights_Edit;//aItemUP.Enabled or aItemDown.Enabled;

  pmServiceTypePopup(nil);
end;

procedure TfBJTree_v2.getDatePeriod(var D1, D2 : TDate);
var AColumn : TdxDBTreeListColumn;
    ABand : TdxTreeListBand;
    Month : Word;
begin
  ABand := nil;
  D1 := EncodeDate(FYear, 1, 1);
  D2 := EncodeDate(FYear, 12, 31);
//  if dxDBTreeList1.FocusedColumn > 0 then
  begin
    AColumn := dxDBTreeList1.VisibleColumns[dxDBTreeList1.FocusedColumn];
    ABand := dxDBTreeList1.Bands.Items[AColumn.BandIndex];
    if ABand <> nil then
    begin
      if ABand.Caption = '' then Exit;
      Month := 1;
      if ABand.Caption = 'Январь' then Month := 1;
      if ABand.Caption = 'Февраль' then Month := 2;                                                                          
      if ABand.Caption = 'Март' then Month := 3;
      if ABand.Caption = 'Апрель' then Month := 4;
      if ABand.Caption = 'Май' then Month := 5;
      if ABand.Caption = 'Июнь' then Month := 6;
      if ABand.Caption = 'Июль' then Month := 7;
      if ABand.Caption = 'Август' then Month := 8;
      if ABand.Caption = 'Сентябрь' then Month := 9;
      if ABand.Caption = 'Октябрь' then Month := 10;
      if ABand.Caption = 'Ноябрь' then Month := 11;
      if ABand.Caption = 'Декабрь' then Month := 12;
      if ABand.Caption = 'весь год' then Month := 12;
      if ABand.Caption = '' then Month := 1;

      D1 := EncodeDate(FYear, Month, 1);
      D2 := IncMonth(D1, 1) - 1;
      
      if ABand.Caption = '1 кв.' then
      begin
        D1 := EncodeDate(FYear, 1, 1);
        D2 := EncodeDate(FYear, 3, 31);
      end;
      if ABand.Caption = '2 кв.' then
      begin
        D1 := EncodeDate(FYear, 4, 1);
        D2 := EncodeDate(FYear, 6, 30);
      end;
      if ABand.Caption = '3 кв.' then
      begin
        D1 := EncodeDate(FYear, 7, 1);
        D2 := EncodeDate(FYear, 9, 30);
      end;
      if ABand.Caption = '4 кв.' then
      begin
        D1 := EncodeDate(FYear, 10, 1);
        D2 := EncodeDate(FYear, 12, 31);
      end;
    end;
  end;
end;


procedure TfBJTree_v2.pmServiceTypePopup(Sender: TObject);
var AColumn : TdxDBTreeListColumn;
    ABand : TdxTreeListBand;
    S : String;
    i : integer;
begin
  aUnSetInitial.Enabled := getMonth > 0;
  aSetInitial.Enabled := aUnSetInitial.Enabled;
  aUnSetInitial.Caption := 'Обнулить план';
  aSetInitial.Caption := 'Установить план';

  ABand := nil;
//  if dxDBTreeList1.FocusedColumn > 0 then
  begin
    AColumn := dxDBTreeList1.VisibleColumns[dxDBTreeList1.FocusedColumn];
    ABand := dxDBTreeList1.Bands.Items[AColumn.BandIndex];
    if ABand <> nil then
    begin
      S := ABand.Caption;
      if S = '' then
        S := 'год';
      if FYear > 0 then S := S + ' ' + IntToStr(FYear);
      
      aDet.Caption := 'Детализация, ' + S;
      aBalance.Caption := 'Взаиморасчеты, ' + S;
      aAccCard.Caption := 'Карточка счета, ' + S;
      if aUnSetInitial.Enabled then
      begin
        aUnSetInitial.Caption := aUnSetInitial.Caption + ' на ' + S;
        aSetInitial.Caption := aSetInitial.Caption + ' на ' + S;
      end;
    end;
  end;


  aNewDeb.Enabled := Rights_Add_Del;
  aNewCred.Enabled := Rights_Add_Del;
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);


 aProperty.Enabled := (FFFNode <> nil) and
    ((FFFNode.Values[dxDBTreeList1id_BJ_Item.Index] > 0) or
     (FFFNode.Values[dxDBTreeList1id_BJ_Tree.Index] > 0) or
     (FFFNode.Values[dxDBTreeList1id_ContrAgent.Index] > 0)
    )
    and (FFFNode.Values[dxDBTreeList1ExtID.Index] <> -13)
     and (Rights_Edit or Rights_Corr);


//  aProperty.Enabled := (FFFNode <> nil) and (FFFNode.Values[dxDBTreeList1ExtID.Index] <> -13) and (Rights_Edit or Rights_Corr);

  aDelete.Enabled :=  (FFFNode <> nil) and (FFFNode.Values[dxDBTreeList1ExtID.Index] <> -13) and Rights_Add_Del;
  S := '';
  aNewCh.Enabled := (FFFNode <> nil) and (FFFNode.Values[dxDBTreeList1id_BJ_Item.Index] = Null)
  and (FFFNode.Values[dxDBTreeList1id_BJ_Tree.Index] > 0) and (FFFNode.Values[dxDBTreeList1ExtID.Index] <> -13)
   and Rights_Add_Del;
  if not aNewCh.Enabled and (FFFNode <> nil) and Rights_Add_Del and (FFFNode.Parent <> nil) then
  begin
    aNewCh.Enabled := (FFFNode.Parent.Values[dxDBTreeList1id_BJ_Item.Index] = Null)
      and (FFFNode.Parent.Values[dxDBTreeList1id_BJ_Tree.Index] > 0) and (FFFNode.Parent.Values[dxDBTreeList1ExtID.Index] <> -13);
    S := ' в группу "' + FFFNode.Parent.Values[dxDBTreeList1Name.Index] + '"';
  end
  else
    if FFFNode <> nil then
      S := ' в группу "' + FFFNode.Values[dxDBTreeList1Name.Index] + '"' ;

  aSetisDirect.Enabled := aNewCh.Enabled and (Rights_Edit);
  aSetisInState.Enabled := aNewCh.Enabled and (Rights_Edit);

  aBJ_ItemAdd.Enabled := aNewCh.Enabled  and Rights_Add_Del;// and (Node.Values[dxDBTreeList1id_BJ_Item.Index] = Null);
  aAddAcc.Enabled := aNewCh.Enabled  and Rights_Add_Del;//  and (Node.Values[dxDBTreeList1id_BJ_Item.Index] = Null);
  aAddCA.Enabled := aNewCh.Enabled  and Rights_Add_Del;//  and (Node.Values[dxDBTreeList1id_BJ_Item.Index] = Null);

  aNewCh.Caption := 'Добавить подгруппу' + S;
  aBJ_ItemAdd.Caption := 'Добавить статью' + S;
  aAddAcc.Caption := 'Добавить счета' + S;
  aAddCA.Caption := 'Добавить контрагентов' + S;


  aAddDeb.Enabled := aNewCh.Enabled  and Rights_Add_Del;
  aAddKred.Enabled := aNewCh.Enabled  and Rights_Add_Del;
  aAddAcz.Enabled := aNewCh.Enabled  and Rights_Add_Del;
  aClearGrp.Enabled := aNewCh.Enabled  and Rights_Add_Del;

  aDet.Enabled := (FFFNode <> nil) and (
                   (FFFNode.Values[dxDBTreeList1id_BJ_Item.Index] <> Null) or
                   (FFFNode.Values[dxDBTreeList1id_Acc.Index] <> Null) or
                   (FFFNode.Values[dxDBTreeList1id_ContrAgent.Index] <> Null)
                  ) ;

  aAccCard.Enabled := (FFFNode <> nil) and (
                   (FFFNode.Values[dxDBTreeList1id_Acc.Index] <> Null)
                  );
  aBalance.Enabled := (FFFNode <> nil) and (
                   (FFFNode.Values[dxDBTreeList1id_ContrAgent.Index] <> Null)
                  );

   AColumn := dxDBTreeList1.VisibleColumns[dxDBTreeList1.FocusedColumn];
   for i := 0 to PopupMenu2.items.count - 1 do
   begin
     if (PopupMenu2.items[i].Action = aNewDeb)
         or  (PopupMenu2.items[i].Action = aNewCred)
         or  (PopupMenu2.items[i].Action = aNewCh)
         or  (PopupMenu2.items[i].Action = aBJ_ItemAdd)
         or  (PopupMenu2.items[i].Action = aAddAcc)
         or  (PopupMenu2.items[i].Action = aAddCA)
         or  (PopupMenu2.items[i].Action = aDelete) then
     begin
       PopupMenu2.items[i].Visible := (AColumn = dxDBTreeList1Name);
     end;
   end;








end;

procedure TfBJTree_v2.aAddDebExecute(Sender: TObject);
begin
  if ShowSelectBsn(Fid_Bsn, GetBJDate, 1, SelCAWS) then
    aRefreshe.Execute;
//  aAddSys(1);
end;

procedure TfBJTree_v2.aAddKredExecute(Sender: TObject);
begin
  if ShowSelectBsn(Fid_Bsn, GetBJDate, 2, SelCAWS) then
    aRefreshe.Execute;
//  aAddSys(2);
end;

procedure TfBJTree_v2.aAddAczExecute(Sender: TObject);
begin
  if ShowSelectBsn(Fid_Bsn, GetBJDate, 4, SelAccWS) then
    aRefreshe.Execute;
//  aAddSys(4);
end;

procedure TfBJTree_v2.aAddSys(TechMode: integer);
var Rez, i, ExtID : integer;
    isDeb : boolean;
    AName, id_ContrAgent, id_Acc, PlanIn, PlanDelta: OleVariant;
begin
  Screen.Cursor := crSQLWait;
  try
    with cdsBJTec do
    begin
      Close;
      Params.ParamByName('@id_business').Value := Fid_Bsn;
      Params.ParamByName('@id_BJ_Obj').Value := Fid_BJ_Obj;
      Params.ParamByName('@TechMode').Value := TechMode;

      if TechMode = 1 then
      begin
        AName := 'Дебиторы';
        isDeb := true;
        ExtID := 1;
      end
      else
        if TechMode = 2 then
        begin
          AName := 'Кредиторы';
          isDeb := false;
          ExtID := 2;
        end
        else
          if TechMode = 4 then
          begin
            AName := 'Остатки денежных средств';
            isDeb := false;
            ExtID := 3;
          end;
      Open;
      First;
      BeginTruns(DM.rsCA);
      try
        Rez := DM.rsCA.AppServer.BJ_TreeEdit(-1, Fid_BJ_Obj, AName, Null, isDeb, ExtID);
        while not Eof do
        begin
          AName := cdsBJTec.FieldByName('Name').AsString;
          id_ContrAgent := cdsBJTec.FieldByName('id_ContrAgent').AsVariant;
          id_Acc := cdsBJTec.FieldByName('id_Acc').AsVariant;
          PlanIn := ABS(cdsBJTec.FieldByName('Summ').AsFloat);
          PlanDelta := Null;
          i := DM.rsCA.AppServer.BJ_ItemEdit(-1, Rez, AName, id_ContrAgent, id_Acc, PlanIn, PlanDelta, false, Null, false, false);
          if i = -1 then
           raise Exception.Create('Ошибка при сохранении');

          Next;
        end;
        CommitTrans(DM.rsCA);
      except
        on E : Exception do
        begin
          RollbackTrans(DM.rsCA);
          raise Exception.Create(E.Message);
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    aRefreshe.Execute;
    SelectEvent(-8, Rez);
  end;
end;


function TfBJTree_v2.GetBJDate: Variant;
begin
  result := DM.rsCA.AppServer.BJ_ObjDateStart(Fid_BJ_Obj);
end;

procedure TfBJTree_v2.aClearGrpExecute(Sender: TObject);
var Node : TdxTreeListNode;
begin
  if MessageBox(Handle, PChar('Очистить группу "' + GetGrpName + '"?'), 'Подтвердите очистку', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    Node := FFFNode.GetFirstChild;
    while Node <> nil do
    begin
      if Node.Values[dxDBTreeList1id_BJ_Tree.Index] > 0 then
        DM.rsCA.AppServer.BJ_TreeDel(Node.Values[dxDBTreeList1id_BJ_Tree.Index])
      else
        if Node.Values[dxDBTreeList1id_BJ_Item.Index] > 0 then
          DM.rsCA.AppServer.BJ_ItemDel(Node.Values[dxDBTreeList1id_BJ_Item.Index]);
      Node := Node.GetNextSibling;
    end;
    aRefreshe.Execute;
  end;
end;

procedure TfBJTree_v2.aExcelExecute(Sender: TObject);
var S : String;
begin
  S := 'Бюджет ';
  DBTreeListToExcel(dxDBTreeList1, S);
end;

procedure TfBJTree_v2.dxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if ANode.Values[dxDBTreeList1id_BJ_Tree.Index] > 0 then
      AFont.Style := AFont.Style + [fsBold];
  if (ANode.Values[dxDBTreeList1OrderNum.Index] = 4000) AND (AColumn is TdxDBTreeListColumn) and (TdxDBTreeListColumn(AColumn).Field is TNumericField) then
  begin
    if ((ANode.Values[AColumn.Index] <> Null) and (ABS(ANode.Values[AColumn.Index]) > 0.005)) then
    begin
      AColor := clRed;
    end
    else
    begin
      AColor := $00D7D700;
    end;
  end;
  if AFont.Style = [fsBold] then
    ANode.Data := Pointer(1013);
end;

procedure TfBJTree_v2.aItemUPExecute(Sender: TObject);
var i : integer;
begin
  if FFFNode <> nil then
  begin
    if FFFNode.Parent = nil then
    begin
  //    for i := 
    end
    else
    begin

    end;
//    DM.
  end;
end;

procedure TfBJTree_v2.aItemDownExecute(Sender: TObject);
begin
//*
end;

procedure TfBJTree_v2.aSortExecute(Sender: TObject);
var Aid_BJ_Item, Aid_BJ_Tree : integer;
begin
  Aid_BJ_Item := -1;
  Aid_BJ_Tree := -1;
  if BJType = bjtGrp then
  begin
    Aid_BJ_Tree := ID;
  end
  else
    Aid_BJ_Item := FFFNode.Values[dxDBTreeList1id_BJ_Item.Index];
  if ShowBJSort(Aid_BJ_Item, Aid_BJ_Tree) then
    aRefreshe.Execute;
end;

function TfBJTree_v2.GetID_BJ_Item: Variant;
begin
  if (FFFNode<> nil) then
  begin
    Result := FFFNode.Values[dxDBTreeList1id_BJ_Item.Index];
  end
  else
    Result := -2;

end;

procedure TfBJTree_v2.aDetExecute(Sender: TObject);
var id_acc, id_ContrAgent, id_BJ_Item, id_Oper, VVV : Variant;
    S : String;
    D1, D2 : TDate;
begin
  getDatePeriod(D1, D2);
  if dtTo.Checked then
    VVV := GetDateAdv(dtTo.Date, true)
  else
    VVV := Null;
  
  id_acc := FFFNode.Values[dxDBTreeList1id_Acc.Index];
  id_ContrAgent := FFFNode.Values[dxDBTreeList1id_ContrAgent.Index];
  id_BJ_Item := FFFNode.Values[dxDBTreeList1id_BJ_Item.Index] ;
  if (id_acc <> Null) or (id_ContrAgent <> Null ) then
    id_BJ_Item := Null;
  id_Oper := DM.GetID_Oper(ceOper.Text) ;
  if id_acc <> Null then
    S := 'по счету "' + FFFNode.Values[dxDBTreeList1Name.Index] + '"';
  if id_ContrAgent <> Null then
    S := 'по контрагенту "' + FFFNode.Values[dxDBTreeList1Name.Index] + '"';
  if id_BJ_Item <> Null then
    S := 'по статье "' + FFFNode.Values[dxDBTreeList1Name.Index] + '"';

  ShowBJdet_v2((Sender as TAction).Caption + ' ' + S, Fid_Bsn, Fid_BJ_Obj, id_acc, id_ContrAgent, id_BJ_Item, id_Oper, VVV, D1, D2);
end;

procedure TfBJTree_v2.cdsBJTreeCalcFields(DataSet: TDataSet);
begin
  if not DataSet.FieldByName('S_Pay').IsNull or
     not DataSet.FieldByName('S_Off').IsNull then
  DataSet.FieldByName('SSS').AsFloat :=
          DataSet.FieldByName('S_Pay').AsFloat +
          DataSet.FieldByName('S_Off').AsFloat;

  if (abs(DataSet.FieldByName('APlan').AsFloat) >= 0.005) and (DataSet.FieldByName('OrderNum').Asinteger <> 4000) then
    DataSet.FieldByName('PRC').AsFloat :=
            (DataSet.FieldByName('APlan').AsFloat - DataSet.FieldByName('Trez').AsFloat) /
            DataSet.FieldByName('APlan').AsFloat*100;
end;

procedure TfBJTree_v2.aAccCardExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
    D1, D2 : TDate;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_acc := FFFNode.Values[dxDBTreeList1id_Acc.Index];

  getDatePeriod(D1, D2);

  if dtTo.Checked then
  begin
    AParamBlnc.DateFrom := dtTo.Date;
    AParamBlnc.DateTo := dtTo.Date;
  end
  else
  begin
    AParamBlnc.DateFrom := D1;
    AParamBlnc.DateTo := D2;
  end;
  
  ShowAccCard_v2(AParamBlnc);
end;

procedure TfBJTree_v2.aBalanceExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
    D1, D2 : TDate;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_ContrAgent := FFFNode.Values[dxDBTreeList1id_ContrAgent.Index];

  getDatePeriod(D1, D2);

  if dtTo.Checked then
  begin
    AParamBlnc.DateFrom := dtTo.Date;
    AParamBlnc.DateTo := dtTo.Date;
  end
  else
  begin
    AParamBlnc.DateFrom := D1;
    AParamBlnc.DateTo := D2;
  end;

    AParamBlnc.DateFrom := D1;
    AParamBlnc.DateTo := D2;
  ShowBalance_v2(AParamBlnc);
end;

procedure TfBJTree_v2.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TfBJTree_v2.aCollapseNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TfBJTree_v2.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TfBJTree_v2.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TfBJTree_v2.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  S := FFFNode.Values[dxDBTreeList1Name.Index];
  DBTreeListToExcel(dxDBTreeList1, S, FFFNode);
end;

procedure TfBJTree_v2.aSetisDirectExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Пометить все элементы в группе "' + GetGrpName + '" как постоянные величины?'), 'Подтвердите действие', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    BJ_ItemEdit_Check(true, Null)
  end;
end;

procedure TfBJTree_v2.aSetisInStateExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Пометить все элементы в группе "' + GetGrpName + '" как входящее состояние?'), 'Подтвердите действие', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    BJ_ItemEdit_Check(Null, true)
  end;
end;

function TfBJTree_v2.BJ_ItemEdit_Check(isDirect, isInState: OleVariant): Integer;
var Node : TdxTreeListNode;
    id_BJ_Item, N: Integer;
begin
  Screen.Cursor := crSQLWait;
  try
    N := 0;
    Node := FFFNode;
    while Node <> nil do
    begin
      if (Node.Values[dxDBTreeList1id_BJ_Item.Index] > 0) and (Node.HasAsParent(FFFNode))  then
      begin
        id_BJ_Item := Node.Values[dxDBTreeList1id_BJ_Item.Index];

        DM.rsCA.AppServer.BJ_ItemEdit_Check(id_BJ_Item, isDirect, isInState);
        inc(N);
      end;

      Node := Node.GetNext;
    end;
    MessageBox(Handle, PChar('Помечено ' + IntToStr(N) + ' элементов'), '', MB_ICONINFORMATION + MB_OK);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfBJTree_v2.cbNullColClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
end;

function TfBJTree_v2.GetID_Prn: Variant;
begin
  if (FFFNode <> nil) and (FFFNode.Values[dxDBTreeList1id_BJ_Item.Index] = Null) then
    Result := FFFNode.Values[dxDBTreeList1id_BJ_Tree.Index]
  else
  if (FFFNode <> nil) and (FFFNode.Parent <> nil) then
  begin
    Result := FFFNode.Parent.Values[dxDBTreeList1id_BJ_Tree.Index];
  end
end;

procedure TfBJTree_v2.SetVisibleBandsCol(BandIndex : integer; AVisible : boolean);
var i : integer;
begin
  for i := 0 to dxDBTreeList1.ColumnCount - 1 do
  begin
    if BandIndex = dxDBTreeList1.Columns[i].BandIndex then
      dxDBTreeList1.Columns[i].Visible := AVisible;
  end;
end;

procedure TfBJTree_v2.aUnSetInitialExecute(Sender: TObject);
begin
  BJ_SetInitial(false)
end;

procedure TfBJTree_v2.aSetInitialExecute(Sender: TObject);
begin
  BJ_SetInitial(true)
end;

procedure TfBJTree_v2.BJ_SetInitial(ACheck: boolean);
var S : String;
    Month: OleVariant;
begin
  if ACheck then
  begin
    S := 'Установить план?';
  end
  else
  begin
    S := 'Обнулить плановые значения?';
    if MessageBox(Handle, 'Вы уверены что хотите обнулить плановые значения? Восстановления невозможно!!!', 'Подтвердите действие', MB_YESNO + MB_ICONQUESTION) <> idYes then  Exit;
  end;

  if MessageBox(Handle, PChar(S), 'Подтвердите действие', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      Month := getMonth;
      Screen.Cursor := crSQLWait;
      DM.rsCA.AppServer.BJ_SetInitial(Fid_BJ_Obj, Month, not ACheck);
    finally
      aRefreshe.Execute;
      Screen.Cursor := crDefault;
    end;
  end;
end;

function TfBJTree_v2.getMonth: integer;
var AColumn : TdxDBTreeListColumn;
    ABand : TdxTreeListBand;
    Month : Word;
begin
  ABand := nil;
  Month := 0;
  
  begin
    AColumn := dxDBTreeList1.VisibleColumns[dxDBTreeList1.FocusedColumn];
    ABand := dxDBTreeList1.Bands.Items[AColumn.BandIndex];
    if ABand <> nil then
    begin
      if ABand.Caption = 'Январь' then Month := 1;
      if ABand.Caption = 'Февраль' then Month := 2;
      if ABand.Caption = 'Март' then Month := 3;
      if ABand.Caption = 'Апрель' then Month := 4;
      if ABand.Caption = 'Май' then Month := 5;
      if ABand.Caption = 'Июнь' then Month := 6;
      if ABand.Caption = 'Июль' then Month := 7;
      if ABand.Caption = 'Август' then Month := 8;
      if ABand.Caption = 'Сентябрь' then Month := 9;
      if ABand.Caption = 'Октябрь' then Month := 10;
      if ABand.Caption = 'Ноябрь' then Month := 11;
      if ABand.Caption = 'Декабрь' then Month := 12;
    end;
  end;
  Result := Month;
end;

end.
 


