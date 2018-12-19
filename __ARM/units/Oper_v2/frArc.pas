unit frArc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, Db, DBClient, ComCtrls, ToolWin, ActnList,
  ImgList, StdCtrls, ExtCtrls, Menus, DBGridEh,
  Registry, foMyFunc, RXCtrls, uBaseGridFilter, uEhGridFilter, uArcSumm,
  Mask, ToolEdit, Clipbrd, uFormAPI_Doc, Buttons, ADODB, Provider,
  frCnstItem, RxLookup, GridsEh
, EhLibCDS;

type
  TRefrEvent = procedure (id_Oper: integer) of object;
  THackAdoDataSet = class(TCustomADODataSet)
    property CommandTimeout;
  end;

  TfArc = class(TFrame)
    cdsArc2: TClientDataSet;
    dsArc: TDataSource;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;       
    ToolButton4: TToolButton;   
    sep1: TToolButton;
    ToolButton6: TToolButton;
    ActionList1: TActionList;
    aNewWH: TAction;
    aProperty: TAction;
    aRefreshe: TAction;
    aDelete: TAction;
    aNewFin: TAction;
    aNewService: TAction;
    aNewZac: TAction;
    ilImage: TImageList;
    pnDate: TPanel;
    mpGrid: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    aNewZac1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    RxDBGrid1: TDBGridEh;
    RxSpeedButton1: TRxSpeedButton;
    ToolButton8: TToolButton;
    aNewEmpty: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    aGetMi: TAction;
    aCancelSeted: TAction;
    aSetUser: TAction;
    aUnSetUser: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    pmOperFilter: TPopupMenu;
    miWH: TMenuItem;
    miFin: TMenuItem;
    miOffer: TMenuItem;
    miEmpty: TMenuItem;
    pmUser: TPopupMenu;
    miSelf: TMenuItem;
    miNonUser: TMenuItem;
    miSeted: TMenuItem;
    miAllUser: TMenuItem;
    sep2: TToolButton;
    aSetViza: TAction;
    pmViza: TPopupMenu;
    miViza: TMenuItem;
    miNonViza: TMenuItem;
    miAll: TMenuItem;
    aUnViza: TAction;
    Panel1: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    aBuffAdd: TAction;
    aBuffDel: TAction;
    N20: TMenuItem;
    aSetError: TAction;
    aUnSetError: TAction;
    N21: TMenuItem;
    aNewCorHW: TAction;
    aNewCorFin: TAction;
    aNewCorService: TAction;
    aNewCorOffset: TAction;
    pmCor: TPopupMenu;
    sep3: TToolButton;
    aNewCor: TAction;
    N24: TMenuItem;
    N25: TMenuItem;
    RxSpeedButton8: TRxSpeedButton;
    RxSpeedButton9: TRxSpeedButton;
    RxSpeedButton10: TRxSpeedButton;
    aDoChangeOper: TAction;
    N26: TMenuItem;
    aNewCopyOper2: TAction;
    N27: TMenuItem;
    N28: TMenuItem;
    aLCBuffAdd: TAction;
    N16: TMenuItem;
    ToolBar2: TToolBar;
    miRateCH: TMenuItem;
    ToolButton11: TToolButton;
    Action1: TAction;
    aGreedToExcel: TAction;
    ToolButton13: TToolButton;
    dtFrom: TDateEdit;
    dtTo: TDateEdit;
    N18: TMenuItem;
    ToolButton3: TToolButton;
    aSelectAll: TAction;
    N29: TMenuItem;
    N30: TMenuItem;
    aSettings: TAction;
    ToolButton5: TToolButton;
    cdsExtDataDict: TClientDataSet;
    cdsExtDataDictid_Oper_ExtDataNames: TIntegerField;
    cdsExtDataDictid_business: TIntegerField;
    cdsExtDataDictType: TIntegerField;
    cdsExtDataDictNumPrm: TIntegerField;
    cdsExtDataDictParName: TStringField;
    cdsExtDataDictVisible: TBooleanField;
    aBeBack: TAction;
    N31: TMenuItem;
    ToolButton9: TToolButton;
    aExportAll: TAction;
    RxSpeedButton2: TRxSpeedButton;
    PopupMenu2: TPopupMenu;
    aImport: TAction;
    aExportSelected: TAction;
    ToolButton7: TToolButton;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    aBackToCA: TAction;
    aBackFromCA: TAction;
    N36: TMenuItem;
    aShowArcAnaliz: TAction;
    ToolButton10: TToolButton;
    RxSpeedButton3: TRxSpeedButton;
    aValList: TAction;
    N37: TMenuItem;
    N6: TMenuItem;
    N15: TMenuItem;
    N19: TMenuItem;
    aAccCard: TAction;
    aBalance: TAction;
    aWHRep: TAction;
    N39: TMenuItem;
    N42: TMenuItem;
    aCopySel: TAction;
    RxSpeedButton4: TRxSpeedButton;
    N44: TMenuItem;
    N45: TMenuItem;
    miMirr: TMenuItem;
    aNewRez: TAction;
    aMakeRez: TAction;
    aMakeRez1: TMenuItem;
    aMakeRez2: TMenuItem;
    N46: TMenuItem;
    aOperByRez: TAction;
    N47: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton12: TToolButton;
    pmAutoViza: TPopupMenu;
    N3: TMenuItem;
    aVizaSelected: TAction;
    N43: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    cdsArc2id_Oper: TIntegerField;
    cdsArc2DateCreate: TDateTimeField;
    cdsArc2OperVid: TIntegerField;
    cdsArc2BusinessName: TStringField;
    cdsArc2Correct: TBooleanField;
    cdsArc2OperTypeIn: TBooleanField;
    cdsArc2CurrencyOperShortName: TStringField;
    cdsArc2AmountOper: TFloatField;
    cdsArc2AmountOper2: TFloatField;
    cdsArc2PriceOper: TFloatField;
    cdsArc2MeasureName: TStringField;
    cdsArc2CurrencySysShortName: TStringField;
    cdsArc2SummSys: TFloatField;
    cdsArc2id_Acc: TIntegerField;
    cdsArc2id_Warehouse: TIntegerField;
    cdsArc2id_Manufact: TIntegerField;
    cdsArc2SrcName: TStringField;
    cdsArc2SrcID_Main: TIntegerField;
    cdsArc2id_Repr: TIntegerField;
    cdsArc2id_Acc_Ext: TIntegerField;
    cdsArc2id_Warehouse_Ext: TIntegerField;
    cdsArc2id_Manufact_Ext: TIntegerField;
    cdsArc2ReprName: TStringField;
    cdsArc2ReprID_Main: TIntegerField;
    cdsArc2PriceInv: TFloatField;
    cdsArc2CurrencyInvShortName: TStringField;
    cdsArc2id_Goods: TIntegerField;
    cdsArc2WareName: TStringField;
    cdsArc2WareID_Main: TIntegerField;
    cdsArc2Koeff: TIntegerField;
    cdsArc2KoeffName: TStringField;
    cdsArc2CheckDate: TDateTimeField;
    cdsArc2id_UserChecker: TIntegerField;
    cdsArc2FormalDistribName: TStringField;
    cdsArc2FuncDistribName: TStringField;
    cdsArc2Deleted: TBooleanField;
    cdsArc2id_ContrAgent: TIntegerField;
    cdsArc2ContrAgentName: TStringField;
    cdsArc2SummOper: TFloatField;
    cdsArc2TypeName: TStringField;
    cdsArc2OperNum: TStringField;
    cdsArc2OperDelta: TFloatField;
    cdsArc2OperRateDelta: TFloatField;
    cdsArc2OperTotalDelta: TFloatField;
    cdsArc2DTDiff: TIntegerField;
    cdsArc2HasViza: TBooleanField;
    cdsArc2OperState: TIntegerField;
    cdsArc2OperSummSys: TFloatField;
    cdsArc2Imp_PayBasic: TStringField;
    cdsArc2AccInv_PayAssignment: TStringField;
    cdsArc2Contract: TStringField;
    cdsArc2OperDeltaCrn: TFloatField;
    cdsArc2OperRateDeltaCrn: TFloatField;
    cdsArc2OperTotalDeltaCrn: TFloatField;
    cdsArc2OperCrnName: TStringField;
    cdsArc2OperSum_Offer: TFloatField;
    cdsArc2CRN_OLD_OperSum: TFloatField;
    cdsArc2CRN_OLD_OperSum_Offer: TFloatField;
    cdsArc2CRN_OperSum_Inv: TFloatField;
    cdsArc2OperSumCalced: TFloatField;
    cdsArc2OperSum_OfferCalced: TFloatField;
    cdsArc2Blocked: TBooleanField;
    cdsArc2CurrencyBsnName: TStringField;
    cdsArc2OpComment: TStringField;
    cdsArc2RealDataCreate: TDateTimeField;
    cdsArc2Dig1: TFloatField;
    cdsArc2Dig2: TFloatField;
    cdsArc2Dig3: TFloatField;
    cdsArc2Dig4: TFloatField;
    cdsArc2Dig5: TFloatField;
    cdsArc2Dig6: TFloatField;
    cdsArc2Dig7: TFloatField;
    cdsArc2Dig8: TFloatField;
    cdsArc2Dig9: TFloatField;
    cdsArc2Dig10: TFloatField;
    cdsArc2Dig11: TFloatField;
    cdsArc2Dig12: TFloatField;
    cdsArc2Dig13: TFloatField;
    cdsArc2Dig14: TFloatField;
    cdsArc2Dig15: TFloatField;
    cdsArc2Str1: TStringField;
    cdsArc2Str2: TStringField;
    cdsArc2Str3: TStringField;
    cdsArc2Str4: TStringField;
    cdsArc2Str5: TStringField;
    cdsArc2Str6: TStringField;
    cdsArc2Str7: TStringField;
    cdsArc2Str8: TStringField;
    cdsArc2Str9: TStringField;
    cdsArc2Str10: TStringField;
    cdsArc2Str11: TStringField;
    cdsArc2Str12: TStringField;
    cdsArc2Str13: TStringField;
    cdsArc2Str14: TStringField;
    cdsArc2Str15: TStringField;
    cdsArc2OperVidName: TStringField;
    cdsArc2CRN_OperSumRez: TFloatField;
    cdsArc2OnlyDate: TDateTimeField;
    cdsArc2is_Mirr: TBooleanField;
    cdsArc2id_Repr_Ex: TIntegerField;
    cdsArc2id_business: TIntegerField;
    miDocs: TMenuItem;
    aDoc_ShowInv: TAction;
    aDoc_ShowPayIn: TAction;
    aDoc_ShowActCL: TAction;
    aDoc_ShowDAcc: TAction;
    aDoc_ShowFinalAct: TAction;
    aDoc_ShowWarrant: TAction;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
    aDoc_ShowAF: TAction;
    N59: TMenuItem;
    aDoc_ShowWBill: TAction;
    N60: TMenuItem;
    aShowDocList: TAction;
    N61: TMenuItem;
    N62: TMenuItem;
    cdsArc2Rent: TBCDField;
    cdsArc2OperTypeSIGN: TIntegerField;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    cdsArc2SummOperIn: TFloatField;
    cdsArc2SummOperOut: TFloatField;
    cdsArc2SummSysIn: TFloatField;
    cdsArc2SummSysOut: TFloatField;
    cdsArc2VatIn: TBooleanField;
    cdsArc2AutoGen: TBooleanField;
    ADelSel: TAction;
    aUnVizaSel: TAction;
    Ljgjkybntkmyj1: TMenuItem;
    N52: TMenuItem;
    N63: TMenuItem;
    cdsArcBy_Ones: TClientDataSet;
    IntegerField1: TIntegerField;
    DateTimeField1: TDateTimeField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    BooleanField1: TBooleanField;
    BooleanField2: TBooleanField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField4: TFloatField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField5: TStringField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    StringField6: TStringField;
    IntegerField11: TIntegerField;
    FloatField5: TFloatField;
    StringField7: TStringField;
    IntegerField12: TIntegerField;
    StringField8: TStringField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    StringField9: TStringField;
    DateTimeField2: TDateTimeField;
    IntegerField15: TIntegerField;
    StringField10: TStringField;
    StringField11: TStringField;
    BooleanField3: TBooleanField;
    IntegerField16: TIntegerField;
    StringField12: TStringField;
    FloatField6: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    IntegerField17: TIntegerField;
    BooleanField4: TBooleanField;
    IntegerField18: TIntegerField;
    FloatField10: TFloatField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    StringField18: TStringField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    BooleanField5: TBooleanField;
    StringField19: TStringField;
    StringField20: TStringField;
    DateTimeField3: TDateTimeField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    FloatField35: TFloatField;
    DateTimeField4: TDateTimeField;
    BooleanField6: TBooleanField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    IntegerField21: TIntegerField;
    BooleanField7: TBooleanField;
    BooleanField8: TBooleanField;
    miOper201: TMenuItem;
    aB2: TAction;
    N17: TMenuItem;
    aA2: TAction;
    N22: TMenuItem;
    aDoc_ShowWHOrd: TAction;
    N23: TMenuItem;
    aShowOperRepl: TAction;
    N38: TMenuItem;
    N64: TMenuItem;
    aKoeff0: TAction;
    aKoeff1: TAction;
    aKoeffn1: TAction;
    N40: TMenuItem;
    N41: TMenuItem;
    N65: TMenuItem;
    N66: TMenuItem;
    aCrOff: TAction;
    N67: TMenuItem;
    Action2: TAction;
    N68: TMenuItem;
    BitBtn2: TBitBtn;
    pnParam: TPanel;
    Panel2: TPanel;
    Button2: TButton;
    Splitter1: TSplitter;
    fCnstItem1: TfCnstItem;
    cdsSessList: TClientDataSet;
    cdsSessListid_Session: TAutoIncField;
    cdsSessListDateLocal: TDateTimeField;
    cdsSessListNeed: TIntegerField;
    cdsSessListFileType: TStringField;
    Label3: TLabel;
    dsSessList: TDataSource;
    cdsSessListFileName: TStringField;
    EhGridFilter1: TEhGridFilter;
    miCrn: TMenuItem;
    ToolButton14: TToolButton;
    btnLastOper: TBitBtn;
    Label4: TLabel;
    RxSpeedButton5: TRxSpeedButton;
    pmSetDate: TPopupMenu;
    miAllDates: TMenuItem;
    MenuItem3: TMenuItem;
    miToday: TMenuItem;
    miYesterday: TMenuItem;
    N71: TMenuItem;
    miThisWeek: TMenuItem;
    miThisMounth: TMenuItem;
    miThisQuart: TMenuItem;
    N70: TMenuItem;
    miPrevWeek: TMenuItem;
    miPrevMounth: TMenuItem;
    aSetBJItem: TAction;
    miSetBJItem: TMenuItem;
    N69: TMenuItem;
    aBuffDel1: TMenuItem;
    cdsArc2id_OperParent: TIntegerField;
    cdsArc2id_old_Oper: TIntegerField;
    cdsArc2id_LC_Oper: TIntegerField;
    cdsArc2id_Replicator: TIntegerField;
    cdsArc2ReplicatorShortName: TStringField;
    cdsArc2id_UserCreator: TIntegerField;
    cdsArc2Id_CurrencyBsn: TIntegerField;
    cdsArc2BusinessNum: TStringField;
    cdsArc2DateLocal: TDateTimeField;
    cdsArc2Id_CurrencyOper: TIntegerField;
    cdsArc2CurrencyOperName: TStringField;
    cdsArc2RateOper: TFloatField;
    cdsArc2id_Measure: TIntegerField;
    cdsArc2RealKoef: TFloatField;
    cdsArc2AmountOperBaseMS: TFloatField;
    cdsArc2Id_CurrencySys: TIntegerField;
    cdsArc2CurrencySysName: TStringField;
    cdsArc2RateSys: TFloatField;
    cdsArc2Id_CurrencyInv: TIntegerField;
    cdsArc2RateInv: TFloatField;
    cdsArc2CurrencyInvName: TStringField;
    cdsArc2id_FormalDistrib: TIntegerField;
    cdsArc2id_FuncDistrib: TIntegerField;
    cdsArc2id_CAGroup: TIntegerField;
    cdsArc2HidedOper: TBooleanField;
    cdsArc2RateMain: TFloatField;
    cdsArc2id_DocType: TIntegerField;
    cdsArc2HasChild: TIntegerField;
    cdsArc2id_OperWare: TIntegerField;
    cdsArc2id_Acc_Group: TIntegerField;
    cdsArc2id_Warehouse_Group: TIntegerField;
    cdsArc2id_Manufact_Group: TIntegerField;
    cdsArc2CreatorFIO: TStringField;
    cdsArc2id_Raw: TIntegerField;
    cdsArc2id_ExtRaw: TIntegerField;
    cdsArc2id_Service: TIntegerField;
    cdsArc2CheckerFIO: TStringField;
    cdsArc2OperSum_Inv: TFloatField;
    N72: TMenuItem;
    miMinusWeek: TMenuItem;
    miMinusM: TMenuItem;
    miMinus6M: TMenuItem;
    miUPD2: TMenuItem;
    pnFlt: TPanel;
    Label1: TLabel;
    edFlt: TEdit;
    cdsFormal: TClientDataSet;
    cdsFormalid_FormalDistrib: TAutoIncField;
    cdsFormalName: TStringField;
    cdsFunc: TClientDataSet;
    cdsFuncid_FuncDistrib: TAutoIncField;
    cdsFuncName: TStringField;
    dsFormal: TDataSource;
    dsFunc: TDataSource;
    lbKoeff: TLabel;
    cbKoef: TComboBox;
    lbForm: TLabel;
    lcFormalDistrib: TRxDBLookupCombo;
    lbFunc: TLabel;
    lcFuncDistrib: TRxDBLookupCombo;
    cdsArcOld: TClientDataSet;
    IntegerField22: TIntegerField;
    DateTimeField5: TDateTimeField;
    IntegerField23: TIntegerField;
    StringField37: TStringField;
    BooleanField9: TBooleanField;
    BooleanField10: TBooleanField;
    StringField38: TStringField;
    FloatField36: TFloatField;
    FloatField37: TFloatField;
    FloatField38: TFloatField;
    StringField39: TStringField;
    StringField40: TStringField;
    FloatField39: TFloatField;
    IntegerField24: TIntegerField;
    IntegerField25: TIntegerField;
    IntegerField26: TIntegerField;
    StringField41: TStringField;
    IntegerField27: TIntegerField;
    IntegerField28: TIntegerField;
    IntegerField29: TIntegerField;
    IntegerField30: TIntegerField;
    IntegerField31: TIntegerField;
    StringField42: TStringField;
    IntegerField32: TIntegerField;
    FloatField40: TFloatField;
    StringField43: TStringField;
    IntegerField33: TIntegerField;
    StringField44: TStringField;
    IntegerField34: TIntegerField;
    IntegerField35: TIntegerField;
    StringField45: TStringField;
    DateTimeField6: TDateTimeField;
    IntegerField36: TIntegerField;
    StringField46: TStringField;
    StringField47: TStringField;
    BooleanField11: TBooleanField;
    IntegerField37: TIntegerField;
    StringField48: TStringField;
    FloatField41: TFloatField;
    StringField49: TStringField;
    StringField50: TStringField;
    FloatField42: TFloatField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    IntegerField38: TIntegerField;
    BooleanField12: TBooleanField;
    IntegerField39: TIntegerField;
    FloatField45: TFloatField;
    StringField51: TStringField;
    StringField52: TStringField;
    StringField53: TStringField;
    FloatField46: TFloatField;
    FloatField47: TFloatField;
    FloatField48: TFloatField;
    StringField54: TStringField;
    FloatField49: TFloatField;
    FloatField50: TFloatField;
    FloatField51: TFloatField;
    FloatField52: TFloatField;
    FloatField53: TFloatField;
    FloatField54: TFloatField;
    BooleanField13: TBooleanField;
    StringField55: TStringField;
    StringField56: TStringField;
    DateTimeField7: TDateTimeField;
    FloatField55: TFloatField;
    FloatField56: TFloatField;
    FloatField57: TFloatField;
    FloatField58: TFloatField;
    FloatField59: TFloatField;
    FloatField60: TFloatField;
    FloatField61: TFloatField;
    FloatField62: TFloatField;
    FloatField63: TFloatField;
    FloatField64: TFloatField;
    FloatField65: TFloatField;
    FloatField66: TFloatField;
    FloatField67: TFloatField;
    FloatField68: TFloatField;
    FloatField69: TFloatField;
    StringField57: TStringField;
    StringField58: TStringField;
    StringField59: TStringField;
    StringField60: TStringField;
    StringField61: TStringField;
    StringField62: TStringField;
    StringField63: TStringField;
    StringField64: TStringField;
    StringField65: TStringField;
    StringField66: TStringField;
    StringField67: TStringField;
    StringField68: TStringField;
    StringField69: TStringField;
    StringField70: TStringField;
    StringField71: TStringField;
    StringField72: TStringField;
    FloatField70: TFloatField;
    DateTimeField8: TDateTimeField;
    BooleanField14: TBooleanField;
    IntegerField40: TIntegerField;
    IntegerField41: TIntegerField;
    BCDField1: TBCDField;
    IntegerField42: TIntegerField;
    FloatField71: TFloatField;
    FloatField72: TFloatField;
    FloatField73: TFloatField;
    FloatField74: TFloatField;
    BooleanField15: TBooleanField;
    BooleanField16: TBooleanField;
    IntegerField43: TIntegerField;
    IntegerField44: TIntegerField;
    IntegerField45: TIntegerField;
    IntegerField46: TIntegerField;
    StringField73: TStringField;
    IntegerField47: TIntegerField;
    IntegerField48: TIntegerField;
    StringField74: TStringField;
    DateTimeField9: TDateTimeField;
    IntegerField49: TIntegerField;
    StringField75: TStringField;
    FloatField75: TFloatField;
    IntegerField50: TIntegerField;
    FloatField76: TFloatField;
    FloatField77: TFloatField;
    IntegerField51: TIntegerField;
    StringField76: TStringField;
    FloatField78: TFloatField;
    IntegerField52: TIntegerField;
    FloatField79: TFloatField;
    StringField77: TStringField;
    IntegerField53: TIntegerField;
    IntegerField54: TIntegerField;
    IntegerField55: TIntegerField;
    BooleanField17: TBooleanField;
    FloatField80: TFloatField;
    IntegerField56: TIntegerField;
    IntegerField57: TIntegerField;
    IntegerField58: TIntegerField;
    IntegerField59: TIntegerField;
    IntegerField60: TIntegerField;
    IntegerField61: TIntegerField;
    StringField78: TStringField;
    IntegerField62: TIntegerField;
    IntegerField63: TIntegerField;
    IntegerField64: TIntegerField;
    StringField79: TStringField;
    FloatField81: TFloatField;
    Timer1: TTimer;
    aShowOperBlockIT: TAction;
    N73: TMenuItem;
    N74: TMenuItem;
    btnClrFlt: TButton;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure aPropertyExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aNewWHExecute(Sender: TObject);
    procedure aNewFinExecute(Sender: TObject);
    procedure dsArcDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure cdsArcOperVidGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure aNewZacExecute(Sender: TObject);
    procedure aNewEmptyExecute(Sender: TObject);
    procedure aGetMiExecute(Sender: TObject);
    procedure aCancelSetedExecute(Sender: TObject);
    procedure aSetUserExecute(Sender: TObject);
    procedure aUnSetUserExecute(Sender: TObject);
    procedure miOfferClick(Sender: TObject);
    procedure aSetVizaExecute(Sender: TObject);
    procedure aBuffAddExecute(Sender: TObject);
    procedure aBuffDelExecute(Sender: TObject);
    procedure aUnVizaExecute(Sender: TObject);
    procedure aSetErrorExecute(Sender: TObject);
    procedure aUnSetErrorExecute(Sender: TObject);
    procedure aNewCorHWExecute(Sender: TObject);
    procedure aNewCorFinExecute(Sender: TObject);
    procedure aNewCorOffsetExecute(Sender: TObject);
    procedure aNewCorExecute(Sender: TObject);
    procedure aDoChangeOperExecute(Sender: TObject);
    procedure aNewCopyOper2Execute(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure aLCBuffAddExecute(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumnEh);
    procedure cdsArcOperDeltaCrnGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsArcOperRateDeltaCrnGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsArcOperTotalDeltaCrnGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure Action1Execute(Sender: TObject);
    procedure aGreedToExcelExecute(Sender: TObject);
    procedure EhGridFilter1AddFieldEvent(Sender, AField: TObject;
      var AllowAdd: Boolean);
    procedure miParClick(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aSettingsExecute(Sender: TObject);
    procedure aBeBackExecute(Sender: TObject);
    procedure aExportAllExecute(Sender: TObject);
    procedure aImportExecute(Sender: TObject);
    procedure aExportSelectedExecute(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure aBackToCAExecute(Sender: TObject);
    procedure aBackFromCAExecute(Sender: TObject);
    procedure dxDBGridFilterChanged(Sender: TObject; ADataSet: TDataSet;
      const AFilterText: String);
    procedure cdsArc2BeforeOpen(DataSet: TDataSet);
    procedure aShowArcAnalizExecute(Sender: TObject);
    procedure aValListExecute(Sender: TObject);
    procedure RxDBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RxDBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aAccCardExecute(Sender: TObject);
    procedure aBalanceExecute(Sender: TObject);
    procedure aWHRepExecute(Sender: TObject);
    procedure aCopySelExecute(Sender: TObject);
    procedure aMakeRezExecute(Sender: TObject);
    procedure aNewRezExecute(Sender: TObject);
    procedure aOperByRezExecute(Sender: TObject);
    procedure aVizaSelectedExecute(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
      IsDown: Boolean);
    procedure RxDBGrid1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure aDoc_ShowInvExecute(Sender: TObject);
    procedure aDoc_ShowPayInExecute(Sender: TObject);
    procedure aDoc_ShowActCLExecute(Sender: TObject);
    procedure aDoc_ShowDAccExecute(Sender: TObject);
    procedure aDoc_ShowFinalActExecute(Sender: TObject);
    procedure aDoc_ShowWarrantExecute(Sender: TObject);
    procedure aDoc_ShowAFExecute(Sender: TObject);
    procedure aDoc_ShowWBillExecute(Sender: TObject);
    procedure aShowDocListExecute(Sender: TObject);
    procedure cdsArc2CalcFields(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure ADelSelExecute(Sender: TObject);
    procedure aUnVizaSelExecute(Sender: TObject);
    procedure cdsArc2KoeffNameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure aB2Execute(Sender: TObject);
    procedure aA2Execute(Sender: TObject);
    procedure aDoc_ShowWHOrdExecute(Sender: TObject);
    procedure aShowOperReplExecute(Sender: TObject);
    procedure aKoeff0Execute(Sender: TObject);
    procedure aKoeff1Execute(Sender: TObject);
    procedure aKoeffn1Execute(Sender: TObject);
    procedure aCrOffExecute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cdsSessListCalcFields(DataSet: TDataSet);
    procedure lcFileChange(Sender: TObject);
    procedure RxDBGrid1SelectionChanged(Sender: TObject);
    procedure mpGridPopup(Sender: TObject);
    procedure miCrnClick(Sender: TObject);
    procedure btnLastOperClick(Sender: TObject);
    procedure miSetDateClick(Sender: TObject);
    procedure miUPDClick(Sender: TObject);
    procedure N69Click(Sender: TObject);
    procedure objectC1TMenuItem1Click(Sender: TObject);
    procedure N75Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure N74Click(Sender: TObject);
    procedure aSetBJItemExecute(Sender: TObject);
    procedure miUPD2Click(Sender: TObject);
    procedure cdsArc2FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure edFltChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure aShowOperBlockITExecute(Sender: TObject);
    procedure btnClrFltClick(Sender: TObject);
    procedure MiTestClick(Sender: TObject);
  private
    FIDList : TIDList;
    FNoRefr : boolean;
    FFuckedCol : integer;
    FReadOnly: boolean;
    Fid_business : Variant;
    FrozenColCnt : integer;
    FShowBudjet: boolean;
    FRefrEvent: TRefrEvent;

    procedure Initialize(id_business : Variant; HasVisa : Variant); overload;
    procedure InitmiCrn;
    procedure SetUserForOper(id_user: Variant; id_oper: Integer);
    procedure BuffAddExec(ID : integer);

    function DoEditOper(AReadOnly : boolean; id_OperParent: Variant; ACorrect, ACopy : boolean; ADelMode : boolean;
                        var ID : integer; Ais_Mirr : boolean;
                        ARezMode : boolean;
                        AViza : boolean = false;
                        AOperVid : integer = -1) : boolean;
    procedure SetReadOnly(const Value: boolean);
    procedure Setid_business(const Value: Variant);
    procedure SetShowBudjet(const Value: boolean);
    procedure ReColorFilter;
    procedure UpdateStatusBarText;
    procedure ShowDoc(ADocProc: TDocProc);
    procedure DoRefrOptimProc(id_Oper: integer; aIsMirr: boolean);
    procedure DeleteFromCDSByID(id_Oper: integer);
    procedure DelViza(id_Oper: integer);
    procedure DoRefrEvent(id_Oper : integer);
    procedure DoSetKoeff(Value: integer);
    function GetKoefVal: Variant;
  public
    AEnableLoadArcStng : boolean;
    Fid_OperParent : Variant;
    MayRefreshe : boolean;

    procedure RemakeFilter2(Aid_Oper : integer = -1; aIsMirr : boolean = false);
    procedure RemakeFilter;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    procedure Initialize(AParamBlnc : TParamBlnc); overload;

    procedure DisableEditAct;
    procedure ListMode;
    property ReadOnly : boolean read FReadOnly write SetReadOnly default false;
    property id_business : Variant read Fid_business write Setid_business;

    procedure UpdateShowBudjet;

    property ShowBudjet : boolean read FShowBudjet write SetShowBudjet;

    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
    procedure DoCancelMsg(var Msg: TMessage); message xxx_Cancel;
    procedure DoClearIDList(var Msg: TMessage); message xxx_ClearIDList;
    procedure DoRefrOptim(var Msg: TMessage); message xxx_RefrOptim;
    procedure DoDelMsg(var Msg: TMessage); message xxx_DelMsg;

    procedure RefresheInt(id_Oper: integer; aIsMirr : boolean);
    procedure loadStng;
    procedure SaveStng;

    property ARefrEvent : TRefrEvent read FRefrEvent write FRefrEvent;
    procedure MakeSimple;

    procedure SetParamVal(CDS : TDataSet; AParamName : String; V : Variant);
  end;

implementation

uses uDM, uFormsAPI_Users, {uFormApi_OperLC,} uBuffSelector, uFormApi_Oper,
  foMyFuncEh, foMyFuncEhExcel, uArcProp, uOperExp, uOperImp, uArcAnaliz,
  uAccCard, uBalance, uMovWH, uPrgForm, uAPOperList, uBalance_v2,
  uAccCard_v2, uOperRepl, uBJTreeSel, uMainForm, uOperBlockIT;

{$R *.DFM}

procedure TfArc.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);

end;

procedure TfArc.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := TDBGridEh(Sender).ScreenToClient(P);
  if (P.y <= THackGridEh(Sender).RowHeights[0]) or (P.x < 10) then
    Exit;
  aProperty.Execute;
end;

procedure TfArc.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.IsEmpty then
    Exit;

  if (Column.Field is TBooleanField) then
  begin
    if Column.Field.AsBoolean then
      Style := DFCS_CHECKED
    else
      Style := DFCS_BUTTONCHECK;

    R := Rect;
    cbSize := 15;
    if R.Bottom - R.Top > cbSize then
    begin
      R.Top := R.Top + (R.Bottom - R.Top - cbSize) div 2;
      R.Bottom := R.Top + cbSize;
    end;
    if R.Right - R.Left < cbSize then
    begin
      R.Right := R.Left + cbSize;
    end;

    if gdSelected in State then
    begin
      TDBGridEh(Sender).Canvas.Brush.Color := clHighlight;
      TDBGridEh(Sender).Canvas.FillRect(Rect);
    end;
    DrawFrameControl(TDBGridEh(Sender).Canvas.Handle, R, DFC_BUTTON, Style);
  end
  else
  begin
  {  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').AsBoolean then
    begin
      (Sender as TDBGrid).Canvas.Font.Color := clGray;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;   }

    if Column.Field.FieldName = 'OperVid' then
    begin
      case Column.Field.AsInteger of
        1 :
        begin
          ImgIndex := 0;
        end;
        2 :
        begin
          ImgIndex := 1;
        end;
        3 :
        begin
          ImgIndex := 3;
        end;
        else
          ImgIndex := -1;
      end;
      ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
    end
    else
      (Sender as TDBGridEh).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfArc.aPropertyExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr, ARezMode : boolean;
begin              
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := false;
  B := (dsArc.DataSet.FieldByName('id_UserChecker').AsInteger <> DM.IDUser) or (dsArc.DataSet.FieldByName('DTDiff').AsInteger <> 0);
  B := (//(dsArc.DataSet.FieldByName('id_UserChecker').AsInteger <> DM.IDUser) and
        (not dsArc.DataSet.FieldByName('CheckDate').IsNull))
       // or (dsArc.DataSet.FieldByName('DTDiff').AsInteger <> 0)
        ;
  ARezMode := dsArc.DataSet.FieldByName('OperVid').AsInteger = 201;
  Rez := DoEditOper(B, Fid_OperParent, false, false, false, ID, Ais_Mirr, ARezMode);
end;

procedure TfArc.ReColorFilter;
var i : integer;
begin
  RxSpeedButton8.Font.Color := clWindowText;
  RxSpeedButton8.Font.Style := [];
  for i := 0 to pmOperFilter.Items.Count - 1 do
    if (pmOperFilter.Items[i].Caption <> '-') and (not pmOperFilter.Items[i].Checked) then
    begin
      RxSpeedButton8.Font.Color := clRed;
  //    RxSpeedButton8.Font.Style := [fsBold];
      Break;
    end;
  if not miAllUser.Checked then
  begin
    RxSpeedButton9.Font.Color := clRed;
 //   RxSpeedButton9.Font.Style := [fsBold];
  end
  else
  begin
    RxSpeedButton9.Font.Color := clWindowText;
 //   RxSpeedButton9.Font.Style := [];
  end;
  if not miAll.Checked then
  begin
    RxSpeedButton10.Font.Color := clRed;
  //  RxSpeedButton10.Font.Style := [fsBold];
  end
  else
  begin
    RxSpeedButton10.Font.Color := clWindowText;
 //   RxSpeedButton10.Font.Style := [];
  end;
end;

procedure TfArc.RefresheInt(id_Oper: integer; aIsMirr : boolean);
var OldRecNo, OldCol, Cnt : integer;
    OldCur : TCursor;
    i : integer;
    S : String;
begin
  ReColorFilter;
  InitmiCrn;
  
  if not MayRefreshe or (dsArc.DataSet = DM.cdsLCBuff) or (dsArc.DataSet = nil) then
  begin
    Exit;
  end;
  
  begin
    with TClientDataSet(dsArc.DataSet) do
    begin
      THackDBGridEh(RxDBGrid1).BeginLayout;
      OldCol := RxDBGrid1.LeftCol;
      BeginUpdateControl(RxDBGrid1);

      DisableControls;
      OldCur := Screen.Cursor;
      Screen.Cursor := crSQLWait;
      Enabled := false;
      try
        if id_Oper = -1 then
          id_Oper := FieldByName('id_Oper').AsInteger;
        if Active and not IsEmpty then
          OldRecNo := RecNo
        else
          OldRecNo := -1;
        Close;
        RemakeFilter;

        SetParamVal(dsArc.DataSet, '@DateFrom', GetDateAdv(dtFrom.Date, false));
        SetParamVal(dsArc.DataSet, '@DateTo', GetDateAdv(dtTo.Date, true));
        SetParamVal(dsArc.DataSet, '@id_User', DM.IDUser);
 
        Open;

        if not Locate('id_Oper;Is_Mirr', VarArrayOf([id_Oper, ORD(aIsMirr)]), [loCaseInsensitive, loPartialKey]) and (OldRecNo <> -1) then
        begin
          if (OldRecNo <= dsArc.DataSet.RecordCount) then
            RecNo := OldRecNo
          else
            Last;
        end;
      finally
        Screen.Cursor := OldCur;
        THackDBGridEh(RxDBGrid1).EndLayout;
        EnableControls;
        RxDBGrid1.LeftCol := OldCol;
        EndUpdateControl(RxDBGrid1);
        Enabled := true;
        DoRefrEvent(id_Oper);
      end;
    end;
  end;
end;

procedure TfArc.aRefresheExecute(Sender: TObject);
var
    ID : integer;
    Ais_Mirr : boolean;
    S : String;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;

  RemakeFilter2(ID, Ais_Mirr);

end;

procedure TfArc.aDeleteExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr, ARezMode : boolean;
    ABookmark : TBookmark;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
 // if MessageBox(Handle, 'Удалить операцию?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idNo then
 //   Exit;
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  ARezMode := dsArc.DataSet.FieldByName('OperVid').AsInteger = 201;
  Rez := false;
  B := false;
  Rez := DoEditOper(B, Fid_OperParent, false, false, true, ID, Ais_Mirr, ARezMode);
end;

procedure TfArc.DeleteFromCDSByID(id_Oper: integer);
var S : String;
    ABookmark : TBookmark;
    OldFiltered : boolean;
begin
  with RxDBGrid1.DataSource.DataSet do
  begin
    DisableControls;
    S := Filter;
    OldFiltered := Filtered;
    Filter := 'id_Oper=' + IntToStr(id_Oper);
    Filtered := true;
    try
      First;
      while not Eof do
      begin
        if FieldByName('id_Oper').AsInteger = id_Oper then
          Delete
        else
          Next;
      end;
   //   GotoBookmark(ABookmark);
    finally
      Filter := S;
      Filtered := OldFiltered;
      EnableControls;
    end;
  end;
end;

procedure TfArc.DelViza(id_Oper: integer);
var S : String;
    ABookmark : TBookmark;
    OldFiltered : boolean;
begin
  with RxDBGrid1.DataSource.DataSet do
  begin
    DisableControls;
  //  ABookmark := GetBookmark;
    S := Filter;
    OldFiltered := Filtered;
    Filter := 'id_Oper=' + IntToStr(id_Oper);
    Filtered := true;
    try
      First;
      while not Eof do
      begin
        if FieldByName('id_Oper').AsInteger = id_Oper then
        begin
          Edit;
          FieldByName('CheckDate').Clear;
          FieldByName('HasViza').Clear;
          Post;
        end;
        Next;
      end;
    finally
      Filter := S;
      Filtered := OldFiltered;
      try
        Locate('id_Oper', id_Oper, []);
  //      GotoBookmark(ABookmark);
      except
      end;
      EnableControls;
    end;
  end;
end;

procedure TfArc.aNewWHExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.id_OperParent := Fid_OperParent;
  EditOperWare(Handle, AOperParamz);
end;

procedure TfArc.aNewFinExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := getEmptyOperParamz;
  AOperParamz.id_OperParent := Fid_OperParent;
  EditOperFin(Handle, AOperParamz);
end;

constructor TfArc.Create(AOwner: TCOmponent);
var 
    Year, Month, Day: Word;
    DDD : TDate;

    Reg : TRegistry;
    i : integer;
    Own : TCustomForm;
    Val : Variant;
begin
  inherited;
  ToolBar2.Visible := not FIsMegaFlt;
  pnFlt.Visible := FIsMegaFlt;

  lbKoeff.Visible := FIsMegaFlt;
  lbForm.Visible := FIsMegaFlt;
  lbFunc.Visible := FIsMegaFlt;
  cbKoef.Visible := FIsMegaFlt;
  lcFormalDistrib.Visible := FIsMegaFlt;
  lcFuncDistrib.Visible := FIsMegaFlt;

  lbKoeff.Visible := false;
  lbForm.Visible := false;
  lbFunc.Visible := false;
  cbKoef.Visible := false;
  lcFormalDistrib.Visible := false;
  lcFuncDistrib.Visible := false; 

 // if (not FIsMegaFlt) then
    dsArc.DataSet := cdsArcOld;

  EhGridFilter1.FilterFieldName := 'id_Oper';
  SetGridProps(RxDBGrid1, true, true, true);
  for i := 0 to RxDBGrid1.Columns.Count - 1 do
  begin
    if (RxDBGrid1.Columns[i].FieldName = 'DateCreate') or (RxDBGrid1.Columns[i].FieldName = 'RealDataCreate') then
        TDateTimeField(RxDBGrid1.Columns[i].Field).DisplayFormat := 'dd-mm-yyyy hh:nn';
  end;

  LoadValFromRegistry(Val, SRegPath + '\' + ClassName, 'pnParamWidth');
  if Val <> Null then
    pnParam.Width := Val;

  BitBtn1.Visible := DM.CheckUserRights(2008, Null) or DM.CheckUserRights(2009, Null);
  FIDList := TIDList.Create;
  aNewRez.Visible := DM.FMayRez;
  aMakeRez.Visible := DM.FMayRez;
  aOperByRez.Visible := DM.FMayRez;

  FNoRefr := false;
  FrozenColCnt := -1;


  Fid_business := Null;

  AEnableLoadArcStng := true;
  MayRefreshe := true;
  UpdateShowBudjet;

 // aSetError.Visible := DM.CheckUserRights(5, Null);
 // aUnSetError.Visible := aSetError.Visible;
  aSetUser.Visible := aSetError.Visible;
  aUnSetUser.Visible := aSetError.Visible;


  FFuckedCol := -1;

  Fid_OperParent := Null;
  dtTo.Date := Now;
  dtFrom.Date := Now - 0;//IncMonth(Now, -1);

  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin                               
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(SRegPath + '\' + TForm(Own).ClassName + '\pmOperFilter', false) then
      begin
        with pmOperFilter do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            if Reg.ValueExists(Items[i].Name) then
              Items[i].Checked := Reg.ReadBool(Items[i].Name);
          end;
        end;

        with pmUser do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            if Reg.ValueExists(Items[i].Name) then
              Items[i].Checked := Reg.ReadBool(Items[i].Name);
          end;
        end;

        with pmViza do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            if Reg.ValueExists(Items[i].Name) then
              Items[i].Checked := Reg.ReadBool(Items[i].Name);
          end;
        end;

      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;


end;

procedure TfArc.loadStng;
var 
    Year, Month, Day: Word;
    DDD : TDate;

    Reg : TRegistry;
    i : integer;
    Own : TCustomForm;
begin      
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin
    LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName + VarToStr(Fid_business));

    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(SRegPath + '\' + TForm(Own).ClassName + '\pmOperFilter', false) then
      begin
        if Reg.ValueExists('FrozenColCnt') then
          FrozenColCnt := Reg.ReadInteger('FrozenColCnt');
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  if FrozenColCnt > -1 then
  begin
  {  if FrozenColCnt > RxDBGrid1.VisibleColCount then
          FrozenColCnt := RxDBGrid1.VisibleColCount   }
  end
  else
    FrozenColCnt := 0;   

  RxDBGrid1.FrozenCols := FrozenColCnt;
end;

destructor TfArc.Destroy;
begin                
  SaveValToRegistry(pnParam.Width, SRegPath + '\' + ClassName, 'pnParamWidth');
  ShowText('', 1);
  ShowText('', 2);
  ShowText('', 3);
  SaveStng;
  FIDList.Free;
  inherited;
end;

procedure TfArc.SaveStng;
var Own : TCustomForm;
    Reg : TRegistry;
    i : integer;
begin
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin
    SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName + VarToStr(Fid_business));
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(SRegPath + '\' + TForm(Own).ClassName + '\pmOperFilter', true) then
      begin
        Reg.WriteInteger('FrozenColCnt', FrozenColCnt);
    //    Reg.WriteBool('ShowBudjet', FShowBudjet);

        with pmOperFilter do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            Reg.WriteBool(Items[i].Name, Items[i].Checked)
          end;
        end;

        with pmUser do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            Reg.WriteBool(Items[i].Name, Items[i].Checked)
          end;
        end;
        with pmViza do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            Reg.WriteBool(Items[i].Name, Items[i].Checked)
          end;
        end;
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
end;

procedure TfArc.dsArcDataChange(Sender: TObject; Field: TField);
var IsMy : boolean;
    S : String;
begin
//  RxDBGrid1.SelectedRows.Clear;
  with dsArc.DataSet do
  begin
    aSetBJItem.Enabled := not IsEmpty;
    aKoeff0.Enabled := not IsEmpty;
    aKoeff1.Enabled := not IsEmpty;
    aKoeffn1.Enabled := not IsEmpty;
    aGreedToExcel.Enabled := not IsEmpty;
    aA2.Enabled := not FieldByName('id_Acc').IsNull;
    aAccCard.Enabled := not FieldByName('id_Acc').IsNull;
    aB2.Enabled := not FieldByName('id_ContrAgent').IsNull;
    aBalance.Enabled := not FieldByName('id_ContrAgent').IsNull;
    aWHRep.Enabled := not FieldByName('id_WareHouse').IsNull;

    aMakeRez.Enabled := FieldByName('OperVid').AsInteger in [1, 101];
    aOperByRez.Enabled := FieldByName('OperVid').AsInteger = 201;
    aSetViza.Enabled := (not IsEmpty) and (not FieldByName('Blocked').AsBoolean) and (FieldByName('CheckDate').IsNull)
    and (FieldByName('OperVid').AsInteger <> 201);

    aVizaSelected.Enabled := RxDBGrid1.SelectedRows.Count >= 1;

    aDoc_ShowInv.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) and not FieldByName('OperTypeIn').AsBoolean;
    aDoc_ShowPayIn.Enabled := ((FieldByName('OperVid').AsInteger = 2) and FieldByName('OperTypeIn').AsBoolean) or
                              ((FieldByName('OperVid').AsInteger in [1, 201]) and not FieldByName('OperTypeIn').AsBoolean);
    aDoc_ShowActCL.Enabled := (FieldByName('OperVid').AsInteger = 4);
    aDoc_ShowDAcc.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) and not FieldByName('OperTypeIn').AsBoolean;
    aDoc_ShowFinalAct.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]);
    aDoc_ShowWarrant.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) and not FieldByName('OperTypeIn').AsBoolean;
    aDoc_ShowAF.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) and not FieldByName('OperTypeIn').AsBoolean;
    aDoc_ShowWBill.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) and not FieldByName('OperTypeIn').AsBoolean;
    aDoc_ShowWHOrd.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) and not FieldByName('OperTypeIn').AsBoolean;

    aShowDocList.Enabled := (FieldByName('OperVid').AsInteger > 0);
    ADelSel.Enabled := (RxDBGrid1.SelectedRows.Count > 0);
    aShowOperRepl.Enabled := (RxDBGrid1.SelectedRows.Count > 0) or not RxDBGrid1.DataSource.DataSet.IsEmpty;
    aUnVizaSel.Enabled := (RxDBGrid1.SelectedRows.Count > 0) or not IsEmpty;
  end;

  aValList.Enabled := (not dsArc.DataSet.IsEmpty);
  aShowArcAnaliz.Enabled := not dsArc.DataSet.IsEmpty;
  FFuckedCol := -1;
  UpdateStatusBarText;
  if dsArc.DataSet.Active then
    S := 'Всего записей: ' + IntToStr(dsArc.DataSet.RecordCount)
  else
    S := '';
  ShowText(S, 1);
  StatusBar1.Panels[0].Text := S;

  IsMy := (dsArc.DataSet.FieldByName('id_UserChecker').AsInteger = DM.IDUser);
  IsMy := true;
  aProperty.Enabled := (not dsArc.DataSet.IsEmpty);// and (cdsArcid_UserChecker.AsInteger = DM.IDUser);
  aDelete.Enabled := (not dsArc.DataSet.IsEmpty)
                      and IsMy
                      and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                    {  and (RxDBGrid1.SelectedRows.Count <= 1)};// and (cdsArcDTDiff.AsInteger = 0);

  aGetMi.Enabled := (not dsArc.DataSet.IsEmpty) and dsArc.DataSet.FieldByName('id_UserChecker').IsNull
                    and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                    and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103, 201]);
                    
  aCancelSeted.Enabled := (not dsArc.DataSet.IsEmpty) and (not dsArc.DataSet.FieldByName('id_UserChecker').IsNull) and
                          IsMy
                          and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                          and (RxDBGrid1.SelectedRows.Count <= 1)
                          and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103, 201]);;
  aSetUser.Enabled := (not dsArc.DataSet.IsEmpty) and dsArc.DataSet.FieldByName('id_UserChecker').IsNull
                      and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                      and (RxDBGrid1.SelectedRows.Count <= 1)
                      and (dsArc.DataSet.FieldByName('id_UserChecker').AsInteger = DM.IDUser)
                     { and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103, 201])};
  aUnSetUser.Enabled := (not dsArc.DataSet.IsEmpty) and not dsArc.DataSet.FieldByName('id_UserChecker').IsNull
                        and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                        and (RxDBGrid1.SelectedRows.Count <= 1)
                      {  and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103, 201])};
                
 { if ((Column.Field = dsArc.DataSet.FieldByName('SrcName')) and (not dsArc.DataSet.FieldByName('SrcName').IsNull) and (dsArc.DataSet.FieldByName('SrcID_Main').IsNull)) or // Не проверенный источник
     ((Column.Field = dsArc.DataSet.FieldByName('ReprName')) and (not dsArc.DataSet.FieldByName('ReprName').IsNull) and (dsArc.DataSet.FieldByName('ReprID_Main').IsNull)) or // Не проверенный представитель
     ((Column.Field = dsArc.DataSet.FieldByName('ReprWHName')) and (not dsArc.DataSet.FieldByName('ReprWHName').IsNull) and (dsArc.DataSet.FieldByName('ReprWHID_Main').IsNull)) or // Не проверенный склад
     ((Column.Field = dsArc.DataSet.FieldByName('WareName')) and (not dsArc.DataSet.FieldByName('WareName').IsNull) and (dsArc.DataSet.FieldByName('WareID_Main').IsNull)) // Не проверенный товар
     then
  begin
  end;   }


  aUnViza.Enabled := (not dsArc.DataSet.IsEmpty) and (not dsArc.DataSet.FieldByName('Blocked').AsBoolean)
                //     (IsMy)
                  //    and (RxDBGrid1.SelectedRows.Count <= 1)
                      and (not dsArc.DataSet.FieldByName('CheckDate').IsNull);

  aBuffAdd.Enabled := (not dsArc.DataSet.IsEmpty);
  aBuffDel.Enabled := (not dsArc.DataSet.IsEmpty);
  aLCBuffAdd.Enabled := (not dsArc.DataSet.IsEmpty);

  aSetError.Enabled := (not dsArc.DataSet.IsEmpty) and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                       and (dsArc.DataSet.FieldByName('OperState').AsInteger <> -1)
                       and (IsMy)
                    {   and (RxDBGrid1.SelectedRows.Count <= 1)};
  aUnSetError.Enabled := (not dsArc.DataSet.IsEmpty) and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                       and (dsArc.DataSet.FieldByName('OperState').AsInteger = -1)
                       and (IsMy)
                      { and (RxDBGrid1.SelectedRows.Count <= 1)};

  aNewCor.Enabled := (not dsArc.DataSet.IsEmpty) and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103, 201]);
  aNewCopyOper2.Enabled := (not dsArc.DataSet.IsEmpty) and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [0, 1, 2, 3, 4, 101, 102, 103, 201]);
        
  aBackToCA.Enabled := (not dsArc.DataSet.IsEmpty)
                     and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 101])
                     and (not dsArc.DataSet.FieldByName('CheckDate').IsNull)
                     and
                     (dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean and
                     not dsArc.DataSet.FieldByName('id_Repr').IsNull and
                     not dsArc.DataSet.FieldByName('id_Warehouse').IsNull);

  aBackFromCA.Enabled := (not dsArc.DataSet.IsEmpty)
                     and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 101])
                     and (not dsArc.DataSet.FieldByName('CheckDate').IsNull)
                     and
                     (not dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean and
                     not dsArc.DataSet.FieldByName('id_Repr').IsNull and
                     not dsArc.DataSet.FieldByName('id_Warehouse').IsNull);
end;

procedure TfArc.RxDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
    S : String;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.IsEmpty then
    Exit;
  if (UpperCase(Column.FieldName) = UpperCase('PriceOper')) and (dsArc.DataSet.FieldByName('OperVid').AsInteger <> 1) then
  begin
    R := Rect;
    TDBGridEh(Sender).Canvas.FillRect(R);
 //   DrawText(TDBGridEh(Sender).Canvas.Handle, PChar('dfdf'), -1, R, DT_RIGHT);
    Exit;
  end;
  if ((Column.Field = dsArc.DataSet.FieldByName('OperTotalDeltaCrn')) or
     (Column.Field = dsArc.DataSet.FieldByName('OperDeltaCrn')))
     and (dsArc.DataSet.FieldByName('OperVid').AsInteger = 4) then
  begin
    R := Rect;
    TDBGridEh(Sender).Canvas.FillRect(R);
    S := Trim(FormatFloat('### ### ### ### ##0.00', ABS(dsArc.DataSet.FieldByName('OperSumCalced').AsFloat)));
    if dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean then
      S := '-' + S;
    R.Top := R.Top + 2;
    DrawText(TDBGridEh(Sender).Canvas.Handle, PChar(S), -1, R, DT_RIGHT);
  end
  else
  if Column.Field = dsArc.DataSet.FieldByName('OperState') then
  begin
    if dsArc.DataSet.FieldByName('HasViza').AsBoolean then
      ImgIndex := 22
    else
    begin
      if dsArc.DataSet.FieldByName('OperState').AsInteger = -1 then
        ImgIndex := 26
      else
        ImgIndex := -1;
    end;
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
  end
  else
  if Column.Field = dsArc.DataSet.FieldByName('KoeffName') then
  begin
    if dsArc.DataSet.FieldByName('OperVid').AsInteger = 4 then
    begin
      if dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean then
        ImgIndex := 37
      else
        ImgIndex := 36;
    end
    else
    begin
      case dsArc.DataSet.FieldByName('Koeff').AsInteger of
        1 : ImgIndex := 36;
        -1 : ImgIndex := 37;
        0 : ImgIndex := 3;
      end;
    end;
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
    R := Rect;
    R.left := R.left + 20;
    R.Top := R.Top + 2;
    DrawText(TDBGridEh(Sender).Canvas.Handle, PChar(Column.Field.DisplayText), -1, R, DT_LEFT);
  end
  else
    if Column.Field = dsArc.DataSet.FieldByName('OperVidName') then
    begin
      case dsArc.DataSet.FieldByName('OperVid').AsInteger of
        -1 :
        begin
          ImgIndex := 29;
        end;
        0 :
        begin
          ImgIndex := 0;
        end;
        201 :
        begin
          ImgIndex := 14;
        end;
        1, 101 :
        begin
          ImgIndex := 2;
        end;
        2, 102 :
        begin
          ImgIndex := 1;
        end;
        3, 103 :
        begin
          ImgIndex := 3;
        end;
        4 :
        begin
          ImgIndex := 3;
        end;
        else
          ImgIndex := -1;
      end;
      TDBGridEh(Sender).Canvas.FillRect(Rect);
      ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
    end
    else
    begin
      TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

      // Красим незаполненные ячейки
      if ((Column.Field = dsArc.DataSet.FieldByName('ContrAgentName')) and
         (dsArc.DataSet.FieldByName('ContrAgentName').IsNull) and
         (not dsArc.DataSet.FieldByName('id_Repr').IsNull or
         not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('BusinessName')) and
         (dsArc.DataSet.FieldByName('BusinessName').IsNull))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('KoeffName')) and
         (dsArc.DataSet.FieldByName('KoeffName').IsNull))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('FormalDistribName')) and
         (dsArc.DataSet.FieldByName('FormalDistribName').IsNull) and (dsArc.DataSet.FieldByName('Koeff').AsInteger <> 0))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('FuncDistribName')) and
         (dsArc.DataSet.FieldByName('FuncDistribName').IsNull) and (dsArc.DataSet.FieldByName('Koeff').AsInteger <> 0))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('ReprName')) and
         (dsArc.DataSet.FieldByName('id_Repr').IsNull) and
         (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull) and
         (not dsArc.DataSet.FieldByName('ReprName').IsNull))
          then
      begin
        TDBGridEh(Sender).Canvas.Brush.Color := clWindow;

        TDBGridEh(Sender).Canvas.Font.Color := clRed;
        TDBGridEh(Sender).Canvas.Font.Style := TDBGridEh(Sender).Canvas.Font.Style + [fsBold];

        TDBGridEh(Sender).Canvas.Brush.Style := bsClear;
        TDBGridEh(Sender).Canvas.Pen.Color := clRed;
        TDBGridEh(Sender).Canvas.Rectangle(Rect.Left + 0, Rect.Top + 0, Rect.Right - 0, Rect.Bottom - 0);
      end;
      if (Column.Field is TNumericField) then
      begin
        R := Rect;
        TDBGridEh(Sender).Canvas.FillRect(R);
        if (not Column.Field.IsNull) and (Column.Field.DisplayText <> '') then
        begin
          S := Trim(FormatFloat('### ### ### ### ##0.00', ABS(Column.Field.AsFloat)));
          if Column.Field.AsFloat < 0 then
            S := '-' + S;
          R.Top := R.Top + 2;
          DrawText(TDBGridEh(Sender).Canvas.Handle, PChar(S), -1, R, DT_RIGHT);
        end;
      end;
    end;
end;

procedure TfArc.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
//  ReOrderCDSEh(Column, '');
end;

procedure TfArc.cdsArcOperVidGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := '';
end;

procedure TfArc.aNewZacExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.id_OperParent := Fid_OperParent;
  EditOperOffset(Handle, AOperParamz);
end;

procedure TfArc.aNewEmptyExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperEmpty(Handle, AOperParamz);
end;

procedure TfArc.SetUserForOper(id_user: Variant; id_oper: Integer);
var i : integer;
    SavePlace: TBookmark;
    rez, Err : boolean;
begin
  Rez := false;
  Err := false;
  if (RxDBGrid1.SelectedRows.Count > 0) then
  begin
    with RxDBGrid1.DataSource.DataSet do
    begin
      for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
      begin
        GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
        if ((id_user = Null) and (dsArc.DataSet.FieldByName('id_UserChecker').Value = DM.IDUser)) or
           ((id_user <> Null) and (dsArc.DataSet.FieldByName('id_UserChecker').IsNull)) then
        begin
          if DM.rsCA.AppServer.SetUserForOper(id_user, dsArc.DataSet.FieldByName('id_Oper').AsInteger) = 1 then
            Rez := true
          else
            Err := true;
        end;
      end;
    end;
  end
  else
  begin
    if DM.rsCA.AppServer.SetUserForOper(id_user, id_oper) = 1 then
      Rez := true
    else
      Err := true;
  end;
  if rez then
  begin
    aRefreshe.Execute;
  end;
  if Err then
  begin
    raise Exception.Create('Ошибка!');
  end;
end;

procedure TfArc.aGetMiExecute(Sender: TObject);
begin
  SetUserForOper(DM.IDUser, dsArc.DataSet.FieldByName('id_Oper').AsInteger);
end;

procedure TfArc.aCancelSetedExecute(Sender: TObject);
begin
  SetUserForOper(Null, dsArc.DataSet.FieldByName('id_Oper').AsInteger);
end;

procedure TfArc.aSetUserExecute(Sender: TObject);
var AID:Variant;
    AName:string;
begin
  AID := dsArc.DataSet.FieldByName('id_UserChecker').Value;
  if GetUsersForm(AID, AName, true, false, true) then
  begin
    SetUserForOper(AID, dsArc.DataSet.FieldByName('id_Oper').AsInteger);
  end;
end;

procedure TfArc.aUnSetUserExecute(Sender: TObject);
begin
  SetUserForOper(Null, dsArc.DataSet.FieldByName('id_Oper').AsInteger);
end;

procedure TfArc.miOfferClick(Sender: TObject);
begin
  if (Sender as TMenuItem).RadioItem then
    (Sender as TMenuItem).Checked := true
  else
    (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
  ReColorFilter;
//  RemakeFilter;
//  if mi
//      RxSpeedButton8

end;

procedure TfArc.RemakeFilter;
begin
  with TClientDataSet(dsArc.DataSet) do
  begin
    DisableControls;
    try
      dsArc.DataSet.Filter := '(1=1)';
   {   if not miWH.Checked then
        Filter := Filter + ' AND (OperVid<>1) AND (OperVid<>101)';
      if not .Checked then
        Filter := Filter + ' AND (OperVid<>2) AND (OperVid<>102)';
      if not miService.Checked then
        Filter := Filter + ' AND (OperVid<>3) AND (OperVid<>103)';
      if not miOffer.Checked then
        Filter := Filter + ' AND (OperVid<>4) AND (OperVid<>104)';
      if not miEmpty.Checked then
        Filter := Filter + ' AND (OperVid<>0)';
      if not miRateCH.Checked then
        Filter := Filter + ' AND (OperVid<>-1)';   }

      if miSelf.Checked then
        Filter := Filter + ' AND (id_UserChecker=' + VarToStr(DM.IDUser) + ')';
      if miNonUser.Checked then
        Filter := Filter + ' AND (id_UserChecker IS NULL)';
      if miSeted.Checked then
        Filter := Filter + ' AND (id_UserChecker IS NOT NULL)';
        
  {    if miViza.Checked then
        Filter := Filter + ' AND (CheckDate IS NOT NULL)';
      if miNonViza.Checked then
        Filter := Filter + ' AND (CheckDate IS NULL)'; }

      EhGridFilter1.DefFilter := dsArc.DataSet.Filter;
    finally
      Filtered := true;
      EnableControls;
    end;
  end;
end;

procedure TfArc.RemakeFilter2(Aid_Oper : integer; aIsMirr : boolean);
begin
  begin
    with TClientDataSet(dsArc.DataSet) do
    begin
  //    DisableControls;
      try
        if (dsArc.DataSet = cdsArc2) or (dsArc.DataSet = cdsArcOld) then
        begin
          SetCDSParamVal(TClientDataSet(dsArc.DataSet), '@is_Mirr', miMirr.Checked);
          SetCDSParamVal(TClientDataSet(dsArc.DataSet), '@OperFin', miFin.Checked);
          SetCDSParamVal(TClientDataSet(dsArc.DataSet), '@OperWare', miWH.Checked);
          SetCDSParamVal(TClientDataSet(dsArc.DataSet), '@OperOffset', miOffer.Checked);
          SetCDSParamVal(TClientDataSet(dsArc.DataSet), '@OperCrn', miRateCH.Checked);
          SetCDSParamVal(TClientDataSet(dsArc.DataSet), '@OperEmpty', miEmpty.Checked);
          SetCDSParamVal(TClientDataSet(dsArc.DataSet), '@Oper201', miOper201.Checked);
          SetCDSParamVal(TClientDataSet(dsArc.DataSet), '@id_OperParent', Fid_OperParent);

          SetCDSParamVal(TClientDataSet(dsArc.DataSet), '@id_FormalDistrib', lcFormalDistrib.KeyValue);
          SetCDSParamVal(TClientDataSet(dsArc.DataSet), '@id_FuncDistrib', lcFuncDistrib.KeyValue);
          SetCDSParamVal(TClientDataSet(dsArc.DataSet), '@Koeff', GetKoefVal);

          if miAll.Checked then
            SetCDSParamVal(TClientDataSet(dsArc.DataSet), '@HasViza', Null)
          else
            SetCDSParamVal(TClientDataSet(dsArc.DataSet), '@HasViza', miViza.Checked);
        end;
      
        RefresheInt(Aid_Oper, aIsMirr);
      finally
  //      EnableControls;
      end;
    end;
  end;
end;

procedure TfArc.aSetVizaExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr, ARezMode : boolean;
begin
  if MessageBox(Handle, 'Завизировать операцию?', 'Подтвердите визирование', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
    ARezMode := dsArc.DataSet.FieldByName('OperVid').AsInteger = 201;
    Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
    Rez := DoEditOper(false, Fid_OperParent, false, false, false, ID, Ais_Mirr, ARezMode, true);
  end;
end;

procedure TfArc.BuffAddExec(ID : integer);
var i : integer;
begin
  with RxDBGrid1.DataSource.DataSet do
  begin
    if (RxDBGrid1.SelectedRows.Count = 0) and (not dsArc.DataSet.IsEmpty) then
      DM.UnAddOperToBuff(dsArc.DataSet, ID);
    for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
    begin
      GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
      DM.UnAddOperToBuff(dsArc.DataSet, ID);
    end;
  end;
end;

procedure TfArc.aBuffAddExecute(Sender: TObject);
var ID, i : integer;
    S : String;
begin
  ID := -1;
  if SelectBuff(ID, S) then
  begin
    BuffAddExec(ID);
  end;
end;

procedure TfArc.aBuffDelExecute(Sender: TObject);
var i : integer;
begin
  with RxDBGrid1.DataSource.DataSet do
  begin
    if (RxDBGrid1.SelectedRows.Count = 0) and (not dsArc.DataSet.IsEmpty) then
      DM.UnDelOperFromBuff(dsArc.DataSet);  
    for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
    begin
      GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
      DM.UnDelOperFromBuff(dsArc.DataSet);
    end;
  end;
end;

procedure TfArc.aSetErrorExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Пометить операцию как ошибочную?', '', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    if DM.rsCA.AppServer.OP_OperSetOperState_v2(dsArc.DataSet.FieldByName('id_Oper').AsInteger, -1) then
    begin
      aRefreshe.Execute;
      RxDBGrid1.Selection.Clear;
    end
    else
    begin
      MessageBox(Handle, 'Произошла ошибка', 'Произошла ошибка', MB_YESNO + MB_ICONQUESTION);
    end;  
  end;
end;

procedure TfArc.aUnSetErrorExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Снять пометку "Ошибка"?', 'Подтвердите снятие пометки', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    if DM.rsCA.AppServer.OP_OperSetOperState_v2(dsArc.DataSet.FieldByName('id_Oper').AsInteger, 0) then
    begin
      aRefreshe.Execute;
      RxDBGrid1.SelectedRows.Clear;
    end
    else
    begin
      MessageBox(Handle, 'Ошибка при снятии пометки', 'Произошла ошибка при снятии пометки', MB_YESNO + MB_ICONQUESTION);
    end;  
  end;
end;

procedure TfArc.aNewCorHWExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.Correct := true;
  EditOperWare(Handle, AOperParamz);
end;

procedure TfArc.aNewCorFinExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := getEmptyOperParamz;
  AOperParamz.Correct := true;
  EditOperFin(Handle, AOperParamz);
end;

procedure TfArc.aNewCorOffsetExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.Correct := true;
  EditOperOffset(Handle, AOperParamz);
end;

procedure TfArc.aNewCorExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr : boolean;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := false;
  B := false;
  Rez := DoEditOper(B, Null, true, true, false, ID, Ais_Mirr, false);
  if Rez then
    RefresheInt(ID, Ais_Mirr)
end;

procedure TfArc.aDoChangeOperExecute(Sender: TObject);
begin
  DoChangeOper(dsArc.DataSet.FieldByName('id_Oper').AsInteger);
end;

procedure TfArc.aNewCopyOper2Execute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr, ARezMode : boolean;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := false;
  B := false;
  ARezMode := dsArc.DataSet.FieldByName('OperVid').AsInteger = 201;
  Rez := DoEditOper(B, Fid_OperParent, false, true, false, ID, Ais_Mirr, ARezMode);

//  if Rez then
//    RefresheInt(ID)
end;

procedure TfArc.Initialize(AParamBlnc: TParamBlnc);
var V : Variant;
begin
  fCnstItem1.Initialize(AParamBlnc.id_business);
  dtFrom.Date := AParamBlnc.DateFrom;
  dtTo.Date := AParamBlnc.DateTo;
  with TClientDataSet(dsArc.DataSet) do
  begin
 //   Close;
    Params.ParamByName('@id_User').Value := DM.IDUser;
    Params.ParamByName('@id_business').Value := AParamBlnc.id_business;
    Params.ParamByName('@HasViza').Value := AParamBlnc.HasViza;

    TClientDataSet(dsArc.DataSet).Params.ParamByName('@DateFrom').AsDateTime := GetDateAdv(dtFrom.Date, false);
    TClientDataSet(dsArc.DataSet).Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(dtTo.Date, true);

    Params.ParamByName('@id_ContrAgent').Value := AParamBlnc.id_ContrAgent;
    Params.ParamByName('@id_CAGroup').Value := AParamBlnc.id_CAGroup;

    Params.ParamByName('@id_Repr').Value := AParamBlnc.id_Repr;
    Params.ParamByName('@id_Warehouse').Value := AParamBlnc.id_Warehouse;
    Params.ParamByName('@id_Acc').Value := AParamBlnc.id_Acc;
    Params.ParamByName('@id_Manufact').Value := AParamBlnc.id_Manufact;

    Params.ParamByName('@Correct').Value := AParamBlnc.Correct;
    Params.ParamByName('@Deleted').Value := AParamBlnc.Deleted;
    Params.ParamByName('@OperVid').Value := AParamBlnc.OperVid;
    Params.ParamByName('@Koeff').Value := AParamBlnc.Koeff;

 //   Params.ParamByName('@DateFrom').AsDate := Trunc(dtFrom.Date) - 2;
 //   Params.ParamByName('@DateTo').AsDate := Trunc(dtTo.Date) - 2 + 1 ;
    
    if AParamBlnc.id_CAGroup = -13 then
    begin
      Params.ParamByName('@id_CAGroup').Value := Null;
      Params.ParamByName('@CANone').Value := true;
    end;
//    Open;
   // aRefreshe.Execute;
  end;
  id_business := AParamBlnc.id_business;
end;

procedure TfArc.Initialize(id_business: Variant; HasVisa : Variant);
var i : integer;
begin
  with TClientDataSet(dsArc.DataSet) do
  begin
    Close;
    
    for i := 0 to Params.Count - 1 do
      Params[i].Value := Null;
    Params.ParamByName('@id_business').Value := id_business;
    Params.ParamByName('@HasViza').Value := HasVisa;

    aRefreshe.Execute;
  end;
  RemakeFilter;
end;

procedure TfArc.RxDBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (dsArc.DataSet.IsEmpty) then
    Exit;

 { if (UpperCase(Column.FieldName) = UpperCase('PriceOper')) and (dsArc.DataSet.FieldByName('OperVid').AsInteger <> 1) then
  begin
    Background := clRed;
 
  end;
   }

    if (dsArc.DataSet.FieldByName('DTDiff').AsInteger <> 0) and
     (not dsArc.DataSet.FieldByName('HasViza').AsBoolean) then
    AFont.Style := AFont.Style + [fsBold];

  if ((Column.Field = dsArc.DataSet.FieldByName('SrcName')) and (not dsArc.DataSet.FieldByName('SrcName').IsNull) and (dsArc.DataSet.FieldByName('SrcID_Main').IsNull)) or // Не проверенный источник
     ((Column.Field = dsArc.DataSet.FieldByName('ReprName')) and (not dsArc.DataSet.FieldByName('ReprName').IsNull) and (dsArc.DataSet.FieldByName('ReprID_Main').IsNull)) or // Не проверенный представитель
//     ((Column.Field = dsArc.DataSet.FieldByName('ReprWHName')) and (not dsArc.DataSet.FieldByName('ReprWHName').IsNull) and (dsArc.DataSet.FieldByName('ReprWHID_Main').IsNull)) or // Не проверенный склад
     ((Column.Field = dsArc.DataSet.FieldByName('WareName')) and (not dsArc.DataSet.FieldByName('WareName').IsNull) and (dsArc.DataSet.FieldByName('WareID_Main').IsNull)) {or} // Не проверенный товар
  {   ((Column.Field = dsArc.DataSet.FieldByName('ReprName')) and
      (dsArc.DataSet.FieldByName('id_Repr').IsNull) and
      (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull) and
       (not dsArc.DataSet.FieldByName('ReprName').IsNull)) }
     then
  begin
    AFont.Color := clRed;
    AFont.Style := AFont.Style + [fsBold];
  end;


  if not (gdFocused in State) then
  begin
     if not (gdSelected in State) then
     begin
       if not MayVized(dsArc.DataSet) then
        Background := $00DBD3FE;
     end
     else
       Background := $0086393F;//$00964147;
  end

{  if not (gdSelected in State) then
  begin
    if not MayVized(dsArc.DataSet) then
      Background := $00DBD3FE;//clRed;
  end;
  if (gdSelected in State) then
  begin
    if gdFocused in State then
      Background := clHighlight
    else
      Background := $0086393F;//$00964147;
  end;  }
end;

procedure TfArc.aLCBuffAddExecute(Sender: TObject);
begin
  BuffAddExec(-13);
end;

procedure TfArc.RxDBGrid1CellClick(Column: TColumnEh);
var S : String;
    P : TPoint;
    i, X : integer;
    Row: Longint;
begin
  P := Mouse.CursorPos;
  P := TDBGridEh(RxDBGrid1).ScreenToClient(P);
  THackGridEh(RxDBGrid1).MouseToCell(P.X, P.Y, FFuckedCol, Row);

  UpdateStatusBarText;
end;

procedure TfArc.cdsArcOperDeltaCrnGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if ((dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 101]) and (not dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean) and ((not dsArc.DataSet.FieldByName('id_Repr').IsNull) or (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull)))
  or (dsArc.DataSet.FieldByName('OperRateDeltaCrn').AsFloat <> 0 )
  or (dsArc.DataSet.FieldByName('Koeff').AsInteger <> 0 )
  then
  begin
    if TFloatField(Sender).AsFloat <> 0 then
      Text := FormatFloat((Sender as TFloatField).DisplayFormat, (Sender as TFloatField).AsFloat);
  end
  else
  begin
    Text := ''
  end;
end;

procedure TfArc.cdsArcOperRateDeltaCrnGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ((dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 101]) and (not dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean) and ((not dsArc.DataSet.FieldByName('id_Repr').IsNull) or (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull)))
  or (dsArc.DataSet.FieldByName('OperRateDeltaCrn').AsFloat <> 0 )
  or (dsArc.DataSet.FieldByName('Koeff').AsInteger <> 0 )
  then
  begin
    if (Sender as TFloatField).AsFloat <> 0 then
      Text := FormatFloat((Sender as TFloatField).DisplayFormat, (Sender as TFloatField).AsFloat);
  end
  else
  begin
    Text := ''
  end;
end;

procedure TfArc.cdsArcOperTotalDeltaCrnGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ((dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 101]) and (not dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean) and ((not dsArc.DataSet.FieldByName('id_Repr').IsNull) or (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull)))
  or (dsArc.DataSet.FieldByName('OperRateDeltaCrn').AsFloat <> 0 )
  or (dsArc.DataSet.FieldByName('Koeff').AsInteger <> 0 )
  then
  begin
    if (Sender as TFloatField).AsFloat <> 0 then
      Text := FormatFloat((Sender as TFloatField).DisplayFormat, (Sender as TFloatField).AsFloat);
  end
  else
  begin
    Text := ''
  end;
end;

procedure TfArc.Action1Execute(Sender: TObject);
begin
  //ShowArcSumm(dsArc.DataSet, [cvFinSum, cvWHWare, cvWHService, cvOffer, cvRateCH]);
  ShowArcSumm2(RxDBGrid1)
end;

procedure TfArc.aGreedToExcelExecute(Sender: TObject);
begin
  Enabled := false;
  aGreedToExcel.Enabled := false;
  Repaint;
  try
    GreedToExcel(RxDBGrid1, 'Архив операций')
  finally
    Enabled := true;
    aGreedToExcel.Enabled := true;
  end;
end;

function TfArc.DoEditOper(AReadOnly: boolean; id_OperParent: Variant;
  ACorrect, ACopy, ADelMode: boolean; var ID : integer; Ais_Mirr : boolean;
  ARezMode : boolean;
  AViza : boolean;
  AOperVid : integer): boolean;
var
    Rez : boolean;
    B : boolean;
    AOperParamz : TOperParamz;
begin
  ADelMode := ADelMode and (not dsArc.DataSet.IsEmpty)
                      and (dsArc.DataSet.FieldByName('CheckDate').IsNull);
                   //   and (RxDBGrid1.SelectedRows.Count <= 1);// and (cdsArcDTDiff.AsInteger = 0);

  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ReadOnly := AReadOnly or FReadOnly;
  AOperParamz.ID_Oper := ID;
  AOperParamz.is_Mirr := Ais_Mirr;
  AOperParamz.Correct := ACorrect;
  AOperParamz.Copy := ACopy;
  AOperParamz.DelMode := ADelMode;
  AOperParamz.RezMode := ARezMode;
  AOperParamz.Viza := AViza;
  AOperParamz.ALevel := 0;

  AReadOnly := AReadOnly or FReadOnly;
  if AOperParamz.Copy  then
    AOperParamz.ReadOnly := false;

{  if not AOperParamz.RezMode and (OperVid = 201) then
  begin
    AOperParamz.ID_Oper := -1;
    AOperParamz.id_OperParent := ID;
  end;   }
//  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Result := false;
  if AOperVid = -1 then
    AOperVid := dsArc.DataSet.FieldByName('OperVid').AsInteger;
  case AOperVid of
    -1 : EditOperCrnCh(Handle, AOperParamz); 
    0 : EditOperEmpty(Handle, AOperParamz);
    1 : EditOperWare(Handle, AOperParamz);
    2 : EditOperFin(Handle, AOperParamz);
    4 : EditOperOffset(Handle, AOperParamz);

    101 : EditOperWare_FFF(Handle, AOperParamz);
    102 : EditOperFin_FFF(Handle, AOperParamz);

    201 : EditOperWare(Handle, AOperParamz);
  end;
end;

procedure TfArc.DisableEditAct;
begin
  aDelete.Visible := false;

  aNewWH.Visible := false;
  aNewFin.Visible := false;
  aNewService.Visible := false;
  aNewZac.Visible := false;
  aNewZac1.Visible := false;
  aNewEmpty.Visible := false;

  aGetMi.Visible := false;
  aCancelSeted.Visible := false;
  aSetUser.Visible := false;
  aUnSetUser.Visible := false;
  aNewCor.Visible := false;
  aNewCorHW.Visible := false;
  aNewCorFin.Visible := false;
  aNewCorOffset.Visible := false;
  aNewCorService.Visible := false;

 // aNewCopyOper.Visible := false;

  aUnSetError.Visible := false;
  aSetError.Visible := false;

  aDoChangeOper.Visible := false;
end;

procedure TfArc.SetReadOnly(const Value: boolean);
begin
  FReadOnly := Value;
 // RxSpeedButton5.Visible := not ReadOnly;
  RxSpeedButton1.Visible := not ReadOnly;
end;

procedure TfArc.ListMode;
begin
  DisableEditAct;
  ReadOnly := true;
  Panel1.Visible := false;
  pnDate.Visible := false;
  ToolButton6.Visible := false;

  ToolBar2.Visible := false;
  pnFlt.Visible := false;  

  sep1.Visible := false;
  sep2.Visible := false;
  sep3.Visible := false;
//  sep4.Visible := false;
end;

procedure TfArc.UpdateShowBudjet;
var i : integer;
begin
  for i := 0 to RxDBGrid1.Columns.Count - 1 do
    if Pos('Бюджет|', RxDBGrid1.Columns[i].Title.Caption) > 0 then
      RxDBGrid1.Columns[i].Visible := ShowBudjet;
end;

procedure TfArc.EhGridFilter1AddFieldEvent(Sender, AField: TObject;
  var AllowAdd: Boolean);
begin
  if AField <> RxDBGrid1.Columns[1] then
    AllowAdd := true;
end;

procedure TfArc.miParClick(Sender: TObject);
begin
  if (Sender as TMenuItem).RadioItem then
    (Sender as TMenuItem).Checked := true
  else
    (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
  ReColorFilter;
//  RemakeFilter2;
end;

procedure TfArc.aSelectAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectedRows.SelectAll;
end;

procedure TfArc.aSettingsExecute(Sender: TObject);
begin
  if ShowArcProp(RxDBGrid1, FrozenColCnt, FShowBudjet, '', AEnableLoadArcStng) then
  begin
    EhGridFilter1.DBGrid := RxDBGrid1;
    SaveStng;
  end;
end;

function TfArc.GetKoefVal: Variant;
begin
  case cbKoef.ItemIndex of
    1 : Result := 0;
    2 : Result := 1;
    3 : Result := -1;
    else
      Result := Null;
  end;
end;


procedure TfArc.Setid_business(const Value: Variant);
var MI : TMenuItem;
    S : String;
    i : integer;
    ACol : TColumnEh;
begin

  if (Fid_business <> Value) then
  begin
    SaveStng;
    Fid_business := Value;
    InitmiCrn;
      cdsFormal.Close;
      cdsFormal.Params.ParamByName('@id_Bsn').Value := Fid_business;
      cdsFormal.Open;
      cdsFunc.Close;
      cdsFunc.Params.ParamByName('@id_Bsn').Value := Fid_business;
      cdsFunc.Open;

  {    with cdsSessList do
    begin
      Close;
      Params.ParamByName('@id_business').Value := Fid_business;
      try
        cdsSessList.Open;
        lcFile.Visible := not cdsSessList.IsEmpty;
        lbFile.Visible := not cdsSessList.IsEmpty;
      except
        lcFile.Visible := false;   
        lbFile.Visible := false;
      end;
    end;  }

    with cdsExtDataDict do
    begin
      Close;
      Params.ParamByName('@id_business').Value := Fid_business;
      Screen.Cursor := crSQLWait;
      Open;
      try
        First;
        while Not Eof do
        begin
          case FieldByName('Type').AsInteger of
            1 : S := 'Dig';
            2 : S := 'Str';
            3 : S := 'Date';
          end;
          S := S + FieldByName('NumPrm').AsString;
          S := UpperCase(S);
          for i := RxDBGrid1.Columns.Count - 1 downto 0 do
          begin
            ACol := RxDBGrid1.Columns[i];
            if UpperCase(ACol.FieldName) = S then
            begin
              ACol.Visible := FieldByName('Visible').AsBoolean;
              if FieldByName('Visible').AsBoolean then
                ACol.Title.Caption := 'Бюджет|' + FieldByName('ParName').AsString;
              Break;
            end;
          end;
          Next;
        end;
      finally
        Close;
        Screen.Cursor := crDefault;
      end;
    end;
    loadStng;
    if TClientDataSet(dsArc.DataSet).Params.FindParam('@id_business') <> nil then
      TClientDataSet(dsArc.DataSet).Params.ParamByName('@id_business').Value := id_business;
    EhGridFilter1.DBGrid := RxDBGrid1;
  end;
  dsArcDataChange(dsArc, nil);
  aShowOperRepl.Visible := DM.CheckUserRights(1941, id_business);
  aShowOperBlockIT.Visible := DM.CheckUserRights(1945, id_business);

  BitBtn1.Visible := DM.CheckUserRights(2008, Null);

  aNewWH.Visible := DM.CheckUserRights(1, id_business);
  aNewFin.Visible := DM.CheckUserRights(2, id_business);
  aNewService.Visible := DM.CheckUserRights(3, id_business);
  aNewZac.Visible := DM.CheckUserRights(4, id_business);

  aNewCorFin.Visible := aNewFin.Visible;
  aNewCorHW.Visible := aNewWH.Visible;
  aNewRez.Visible := DM.CheckUserRights(25, id_business);
  aMakeRez.Visible := DM.CheckUserRights(25, id_business);
  aNewCorOffset.Visible := aNewZac.Visible;
  miDocs.Visible := DM.CheckUserRights(26, id_business);

  with DM.cdsBJ_ByOper do
  begin
    Close;
    Params.ParamByName('@id_Oper').Value := -1;
    Params.ParamByName('@id_business').Value := id_business;
    Params.ParamByName('@id_Oper_OLD').Value := -1;
    Open;
    First;
    miSetBJItem.Clear;
    miSetBJItem.Tag := 0;
    if recordCount = 1 then
    begin
      miSetBJItem.Tag := DM.cdsBJ_ByOperid_BJ_Obj.AsInteger;
      Exit;
    end;
    while not Eof do
    begin
      MI := TMenuItem.Create(miSetBJItem);
      miSetBJItem.Add(MI);
      MI.Caption := DM.cdsBJ_ByOperBJ_Name.AsString;
      MI.Tag := DM.cdsBJ_ByOperid_BJ_Obj.AsInteger;
      MI.OnClick := aSetBJItemExecute;
      
      Next;
    end;
  end;
end;

procedure TfArc.SetShowBudjet(const Value: boolean);
begin
  FShowBudjet := Value;
  upDateShowBudjet
end;

procedure TfArc.aBeBackExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B : boolean;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Rez := false;
  B := false;
  Rez := DoEditOper(B, Fid_OperParent, true, false, false, ID, true, false);
                      
  if Rez then
    RefresheInt(ID, false)
end;

procedure TfArc.aExportAllExecute(Sender: TObject);
begin
  ShowWHExp(RxDBGrid1, false);
end;

procedure TfArc.aImportExecute(Sender: TObject);
begin
  ShowOperImp(Handle, Null);
end;

procedure TfArc.aExportSelectedExecute(Sender: TObject);
begin
  ShowWHExp(RxDBGrid1, true);
end;

procedure TfArc.PopupMenu2Popup(Sender: TObject);
begin
  aExportAll.Enabled := not dsArc.DataSet.IsEmpty;
  aExportSelected.Enabled := (RxDBGrid1.SelectedRows.Count > 0) and not dsArc.DataSet.IsEmpty;
end;

procedure TfArc.aBackToCAExecute(Sender: TObject);
var ID : integer;
begin
  ID := dsArc.DataSet.fieldByName('id_Oper').AsInteger;

  ShowWizBackToCA(Handle, ID);
end;

procedure TfArc.aBackFromCAExecute(Sender: TObject);
var ID : integer;
begin
  ID := dsArc.DataSet.fieldByName('id_Oper').AsInteger;

  ShowWizBackFromCA(Handle, ID);
end;

procedure TfArc.dxDBGridFilterChanged(Sender: TObject; ADataSet: TDataSet;
  const AFilterText: String);
begin
  tag := 0;
end;

procedure TfArc.DoRefrMsg(var Msg: TMessage);
begin
  if ReadOnly then Exit;
  if not FNoRefr and (Msg.WParam > 0) then
  begin
    if FArcOptim then
    begin
      DoRefrOptimProc(Msg.WParam, Msg.LParam = 1);
    end
    else
      RefresheInt(Msg.WParam, Msg.LParam = 1);
    RxDBGrid1.Selection.Clear;
 //   RxDBGrid1SelectionChanged(nil);
  end;
  if (Msg.WParam < 0) then
    FIDList.Add(ABS(Msg.WParam));
end;

procedure TfArc.cdsArc2BeforeOpen(DataSet: TDataSet);
var i, Cnt : integer;
    AParam : TParam;
begin
  FIDList.Clear;

{  Cnt := 0;
    with cdsArcCnt do
    begin
      Close;
      for i := 0 to Params.Count - 1 do
      begin
        AParam := cdsArc.Params.FindParam(Params[i].Name);
        if AParam <> nil then
          Params[i].Value := AParam.Value;
      end;
      try
        try
          Open;
          Cnt := cdsArcCntCnt.AsInteger;
        except

        end;
        if Cnt >= 1500 then
        begin
          if MessageBox(Handle, PChar('Возвращаемое количество операций слишком велико (' + IntToStr(Cnt) + ' шт.)' + #13 + #10 +
                     'Загрузка такого количество операций существенно замедлит работу системы' + #13 + #10 +
                     'Хотите изменить параметны фильтра или диапазон дат???'), 'Слишком много операций!',
                     MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON1) = IDYES	then
            Abort;
        end;
      finally
        Close;
      end;
    end;    }
end;

procedure TfArc.aShowArcAnalizExecute(Sender: TObject);
begin
  ShowArcAnaliz(RxDBGrid1);
end;

procedure TfArc.aValListExecute(Sender: TObject);
var S : String;
    P : TPoint;
    i, X : integer;
    Row: Longint;
begin
  if (FFuckedCol > 0) and (FFuckedCol < RxDBGrid1.Columns.Count) and (RxDBGrid1.Columns[FFuckedCol - 1].Field <> nil) then
    ShowValListDistinct(RxDBGrid1.Columns[FFuckedCol - 1].Field, 'Значения "' + RxDBGrid1.Columns[FFuckedCol - 1].Title.Caption + '"')
end;

procedure TfArc.RxDBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Row: Longint;
begin
  THackGridEh(RxDBGrid1).MouseToCell(X, Y, FFuckedCol, Row);

  UpdateStatusBarText;
end;

procedure TfArc.UpdateStatusBarText;
var S : String;
begin
  if (FFuckedCol > 0) and (FFuckedCol < RxDBGrid1.Columns.Count) and (RxDBGrid1.Columns[FFuckedCol - 1].Field <> nil) then
    S := 'Значение: ' + RxDBGrid1.Columns[FFuckedCol - 1].Field.DisplayText
  else
    S := '';
  ShowText(S, 2);
  StatusBar1.Panels[1].Text := S;
end;

procedure TfArc.RxDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//*
end;

procedure TfArc.aAccCardExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  with dsArc.DataSet do
  begin
    AParamBlnc.id_Acc := FieldByName('id_Acc').AsInteger;
    AParamBlnc.DateFrom := FieldByName('DateCreate').AsDateTime;
    AParamBlnc.DateTo := FieldByName('DateCreate').AsDateTime;
  end;
  ShowAccCard(AParamBlnc);
end;

procedure TfArc.aBalanceExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  with dsArc.DataSet do
  begin
    AParamBlnc.id_ContrAgent := FieldByName('id_ContrAgent').AsInteger;
    AParamBlnc.DateFrom := FieldByName('DateCreate').AsDateTime;
    AParamBlnc.DateTo := FieldByName('DateCreate').AsDateTime;
  end;
  ShowBalance(AParamBlnc);
end;

procedure TfArc.aWHRepExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
    ACatObj : TCatObj;
begin
  AParamBlnc := GetEmptyParamBlnc;
  with dsArc.DataSet do
  begin
    AParamBlnc.id_business := FieldByName('id_business').AsInteger;
    AParamBlnc.id_Warehouse := FieldByName('id_Warehouse').AsInteger;
    AParamBlnc.DateFrom := FieldByName('DateCreate').AsDateTime;
    AParamBlnc.DateTo := FieldByName('DateCreate').AsDateTime;   

    AParamBlnc.id_Goods := FieldByName('id_Goods').AsInteger;
  end;
  ShowMovWH(AParamBlnc, true);
end;

procedure TfArc.aCopySelExecute(Sender: TObject);
begin
  Clipboard.AsText:=GridSelectionAsExcelText(RxDBGrid1)
end;

procedure TfArc.aMakeRezExecute(Sender: TObject);
var
    ID : integer;
    B, Ais_Mirr : boolean;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  B := false;
  DoEditOper(B, Fid_OperParent, false, true, false, ID, Ais_Mirr, true);
end;

procedure TfArc.aNewRezExecute(Sender: TObject);
var
    ID : integer;
begin
  ID := -1;
  DoEditOper(false, Fid_OperParent, false, true, false, ID, false, true);
end;

procedure TfArc.aOperByRezExecute(Sender: TObject);
var
    ID : integer;
    B, Ais_Mirr : boolean;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  B := false;
  DoEditOper(B, Fid_OperParent, false, false, false, ID, Ais_Mirr, false);
end;

procedure TfArc.aVizaSelectedExecute(Sender: TObject);
var AList, AListOperVid : TIDList;
    ID, i, ind : integer;
    Rez : boolean;
    B, Ais_Mirr, ARezMode, ANeedRefr : boolean;
    ABookmark : TBookmark;
begin
  Ais_Mirr := false;
  ANeedRefr := true;
  if MessageBox(Handle, 'Завизировать выделенные операции?', 'Подтвердите визирование', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    with dsArc.DataSet do
    begin
      AList := TIDList.Create;
      AListOperVid := TIDList.Create;
      FNoRefr := true;
      try
        DisableControls;
        ABookmark := GetBookmark;
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          ShowProgressForm(Handle, i, RxDBGrid1.SelectedRows.Count, 'Составление списка операций');
          GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
          if (dsArc.DataSet.FieldByName('CheckDate').IsNull) and
             (dsArc.DataSet.FieldByName('OperVid').AsInteger <> 201) and
             (dsArc.DataSet.FieldByName('OperVid').AsInteger <> -1) then
          begin
            ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
            ind := AList.IndexOf(ID);
            if ind = -1 then
            begin
              AList.Add(ID);
              AListOperVid.Add(dsArc.DataSet.FieldByName('OperVid').AsInteger);
            end;
          end;
        end;
        CloseProgressForm;
        for i := 0 to AList.Count - 1 do
        begin
          if not FNoRefr then
          begin
        //    ANeedRefr := false;
            Break;
          end;
          ID := AList[i];
          ShowProgressForm(Handle, i, AList.Count, 'Визирование операций');
          DoEditOper(false, Null, false, false, false, ID, false, false, true, AListOperVid[i]);
        end;
      //  aRefreshe.Execute;
      finally
        CloseProgressForm;
        FNoRefr := false;
        AList.Free;
        AListOperVid.Free;
        EnableControls;

        GotoBookmark(ABookmark);
        ShowProgressForm(Handle, 0, 0, 'Идет обновление данных');
        try
          if ANeedRefr then
            aRefreshe.Execute;
        finally
          CloseProgressForm;
        end;
      end;
    end;
  end;
end;

procedure TfArc.aUnVizaExecute(Sender: TObject);
var ABookmark : TBookmark;
    ID_oper, AOperVid, UID : integer;
begin
  AOperVid := dsArc.DataSet.FieldByName('OperVid').AsInteger;
  case AOperVid of
    1 : DM.Rights_GetUserRights(1, Null);
    2 : DM.Rights_GetUserRights(2, Null);
    4 : DM.Rights_GetUserRights(4, Null);
    201 : DM.Rights_GetUserRights(25, Null);
  end;


      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  if MessageBox(Handle, 'Снять визирование?', 'Подтвердите снятие визирования', MB_YESNO + MB_ICONWARNING) = idYes then
  begin
    ID_oper := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
    if DM.rsCA.AppServer.OP_OperDelCheckDate_v2(ID_oper) then
    begin
      DelViza(ID_oper);
    end
    else
    begin
      MessageBox(Handle, 'Ошибка при снятии визирования', 'Произошла ошибка при снятии визирования', MB_YESNO + MB_ICONERROR);
    end;
  end;
end;


procedure TfArc.ToolButton1Click(Sender: TObject);
begin
  aSetViza.Execute;
end;

procedure TfArc.DoCancelMsg(var Msg: TMessage);
begin
  FNoRefr := false;
end;

procedure TfArc.RxDBGrid1GetBtnParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarkerEh(Column.Field);
end;

procedure TfArc.RxDBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  SaveStng;
end;

procedure TfArc.aDoc_ShowInvExecute(Sender: TObject);
begin
  ShowDoc(ShowInv);
end;

procedure TfArc.aDoc_ShowPayInExecute(Sender: TObject);
begin
  ShowDoc(ShowPayIn);
end;

procedure TfArc.aDoc_ShowActCLExecute(Sender: TObject);
begin
  ShowDoc(ShowActCL);
end;

procedure TfArc.aDoc_ShowDAccExecute(Sender: TObject);
begin
  ShowDoc(ShowDAcc);
end;

procedure TfArc.aDoc_ShowFinalActExecute(Sender: TObject);
begin
  ShowDoc(ShowFinalAct);
end;

procedure TfArc.aDoc_ShowWarrantExecute(Sender: TObject);
begin
  ShowDoc(ShowWarrant);
end;

procedure TfArc.ShowDoc(ADocProc : TDocProc);
var DP : TDocParamz;
begin
  DP := GetEmptyDocParamz;
  DP.ID_Oper := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  ADocProc(Handle, DP, nil, nil)
end;


procedure TfArc.aDoc_ShowAFExecute(Sender: TObject);
begin
  ShowDoc(ShowAF);
end;

procedure TfArc.aDoc_ShowWBillExecute(Sender: TObject);
begin
  ShowDoc(ShowWBill);
end;

procedure TfArc.aShowDocListExecute(Sender: TObject);
begin
  ShowDocList(dsArc.DataSet.FieldByName('id_Oper').AsInteger, Null);
end;

procedure TfArc.cdsArc2CalcFields(DataSet: TDataSet);
begin
  DataSet.OnCalcFields := nil;
  try
    if (DataSet.FieldByName('CRN_OperSum_Inv').AsFloat <> 0) and (DataSet.FieldByName('OperVid').AsInteger = 1) and (DataSet.FieldByName('OperTotalDeltaCrn').AsFloat <> 0) and (DataSet.FieldByName('CRN_OperSumRez').AsFloat <> 0) then
      DataSet.FieldByName('Rent').Value := 100 * DataSet.FieldByName('OperTotalDeltaCrn').AsFloat/
      abs(DataSet.FieldByName('CRN_OperSum_Inv').AsFloat)
    else
      DataSet.FieldByName('Rent').Value := Null;
      
    if (DataSet.FieldByName('OperVid').AsInteger <> 1) then
      DataSet.FieldByName('PriceOper').AsVariant := null;

    if DataSet.FieldByName('OperTypeIn').AsBoolean then
    begin
      DataSet.FieldByName('SummOperIn').Value := DataSet.FieldByName('SummOper').Value;
      DataSet.FieldByName('SummSysIn').Value := DataSet.FieldByName('SummSys').Value;
    end
    else
    begin
      DataSet.FieldByName('SummOperOut').Value := DataSet.FieldByName('SummOper').Value;
      DataSet.FieldByName('SummSysOut').Value := DataSet.FieldByName('SummSys').Value;
    end;
    DataSet.OnCalcFields := cdsArc2CalcFields;
  except

  end;
end;

procedure TfArc.BitBtn1Click(Sender: TObject);
begin
  ShowAPOperList(Handle, dsArc.DataSet.FieldByName('id_Oper').AsInteger, 0)
end;

procedure TfArc.ADelSelExecute(Sender: TObject);
var i, id_Oper : integer;
    ABookmark : TBookmark;
    AIDLIst : TIDList;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  if MessageBox(Handle, 'Удалить выделенные операции?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    with dsArc.DataSet do
    begin
      AIDLIst := TIDList.Create;
      id_Oper := dsArc.DataSet.FieldByName('id_OPer').AsInteger;
      if AIDLIst.IndexOf(id_Oper) = -1 then AIDLIst.Add(id_Oper);
      try
        DisableControls;
        ABookmark := GetBookmark;
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
          id_Oper := dsArc.DataSet.FieldByName('id_OPer').AsInteger;
          if (dsArc.DataSet.FieldByName('OperVid').AsInteger >= 0) and
              not FieldByName('Blocked').AsBoolean and
              (AIDLIst.IndexOf(id_Oper) = -1) then AIDLIst.Add(id_Oper);
        end;
        for i := 0 to AIDLIst.Count - 1 do
        begin
          ShowProgressForm(Handle, i, RxDBGrid1.SelectedRows.Count, 'Удаление операций');
          id_Oper := AIDLIst[i];
          if DM.rsCA.AppServer.OP_OperDelCheckDate_v2(id_Oper) <> -1 then
          begin
            DM.rsCA.AppServer.OP_OperDel(id_Oper);
            DeleteFromCDSByID(id_Oper);
          end;
        end;
      finally
        AIDLIst.Free;
        EnableControls;
        RxDBGrid1.SelectedRows.Clear;
        CloseProgressForm;
     //   aRefreshe.Execute;
      end;
    end;
  end;
end;

procedure TfArc.aUnVizaSelExecute(Sender: TObject);
var i, id_Oper : integer;
    ABookmark : TBookmark;
    AIDLIst : TIDList;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  if MessageBox(Handle, 'Снять визу с выделенных операций?', 'Подтвердите снятие визы', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    with dsArc.DataSet do
    begin
      AIDLIst := TIDList.Create;
      try
        DisableControls;
        ABookmark := GetBookmark;
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
          id_Oper := dsArc.DataSet.FieldByName('id_OPer').AsInteger;
          if (dsArc.DataSet.FieldByName('OperVid').AsInteger >= 0) and
             not dsArc.DataSet.FieldByName('Blocked').AsBoolean and
             (AIDLIst.IndexOf(id_Oper) = -1) then
               AIDLIst.Add(id_Oper);
        end;
       id_Oper := dsArc.DataSet.FieldByName('id_OPer').AsInteger;
       if AIDLIst.IndexOf(id_Oper) = -1 then AIDLIst.Add(id_Oper);

       for i := 0 to AIDLIst.Count - 1 do
        begin
          ShowProgressForm(Handle, i, RxDBGrid1.SelectedRows.Count, 'Снятие визы');
          id_Oper := AIDLIst[i];
          if DM.rsCA.AppServer.OP_OperDelCheckDate_v2(id_Oper) <> -1 then
            DelViza(id_Oper);
        end;
      finally
        AIDLIst.Free;
        EnableControls;
        RxDBGrid1.SelectedRows.Clear;
        CloseProgressForm;
     //   aRefreshe.Execute;
      end;
    end;
  end;
end;

procedure TfArc.DoClearIDList(var Msg: TMessage);
begin
  FIDList.Clear;
end;

procedure TfArc.DoRefrOptim(var Msg: TMessage);
var i : integer;
    S : String;
    AField, AField2 : TField;
begin
  if ReadOnly then Exit;
  tag := 0;
  if FArcOptim then
  begin
    DoRefrOptimProc(Msg.WParam, Msg.LParam = 1);
  end
  else
  begin
    RefresheInt(Msg.WParam, Msg.LParam = 1);
  end;
end;

procedure TfArc.DoRefrOptimProc(id_Oper: integer; aIsMirr : boolean);
var i, OldRecNo : integer;
    S : String;
    AField, AField2 : TField;
    AParam : TParam;
begin
  if (dsArc.DataSet <> cdsArcOld) and (dsArc.DataSet <> cdsArc2) then
    Exit;
  dsArc.DataSet.DisableControls;
  try
    if dsArc.DataSet.Active and not dsArc.DataSet.IsEmpty then
      OldRecNo := dsArc.DataSet.RecNo
    else
      OldRecNo := -1;
    tag := 0;
    if FArcOptim then
    begin
      for i := 0 to TClientDataset(dsArc.DataSet).Params.Count - 1 do
        with TClientDataset(dsArc.DataSet).Params[i] do
        begin
          AParam := cdsArcBy_Ones.Params.FindParam(Name);
          if AParam <> nil then
            AParam.Value := Value;
        end;
      S := '';
      if FIDList.Count = 0 then
      begin
        S := IntToStr(id_Oper);
        DeleteFromCDSByID(id_Oper);
      end;
      for i := 0 to FIDList.Count - 1 do
      begin
        if S <> '' then S := S + ',';
        S := S + IntToStr(FIDList[i]);
     //   DeleteFromCDSByID(FIDList[i]);
      end;
      cdsArcBy_Ones.Params.ParamByName('@id_OperList').Value := S;
      FIDList.Clear;
      with cdsArcBy_Ones do
      begin
        Close;
        Open;
        try
          First;
          while not Eof do
          begin
            TClientDataset(dsArc.DataSet).Append;
            for i := 0 to Fields.Count - 1 do
            begin
              AField := Fields[i];
              AField2 := TClientDataset(dsArc.DataSet).FindField(AField.FieldName);
              if AField2 <> nil then
              begin
                AField2.Value := AField.Value;
              end;
            end;
            TClientDataset(dsArc.DataSet).Post;
            Next;
          end;
        finally
          Close;
          if not TClientDataset(dsArc.DataSet).Locate('id_Oper;Is_Mirr', VarArrayOf([id_Oper, ORD(aIsMirr)]), [loCaseInsensitive, loPartialKey]) and (OldRecNo <> -1) then
          begin
            if (OldRecNo <= dsArc.DataSet.RecordCount) then
              TClientDataset(dsArc.DataSet).RecNo := OldRecNo
            else
              TClientDataset(dsArc.DataSet).Last;
          end;
        end;
      end;
    end;
  finally
    TClientDataset(dsArc.DataSet).EnableControls;
    DoRefrEvent(id_Oper);
  end;
end;

procedure TfArc.DoDelMsg(var Msg: TMessage);
begin
  if ReadOnly then Exit;
  DeleteFromCDSByID(Msg.WParam);
  DoRefrEvent(Msg.WParam);
end;

procedure TfArc.DoRefrEvent(id_Oper : integer);
begin
  if Assigned(FRefrEvent) then
    try  FRefrEvent(id_Oper) except end;
end;

procedure TfArc.cdsArc2KoeffNameGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if dsArc.DataSet.FieldByName('OperVid').AsInteger = 4 then
  begin
    if dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean then
      text := 'Затрата'
    else
      text := 'Прибыль';
  end
  else
    text := Sender.AsString;

end;

procedure TfArc.aB2Execute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  with dsArc.DataSet do
  begin
    AParamBlnc.id_ContrAgent := FieldByName('id_ContrAgent').AsInteger;
    AParamBlnc.DateFrom := FieldByName('DateCreate').AsDateTime;
    AParamBlnc.DateTo := FieldByName('DateCreate').AsDateTime;
  end;
  ShowBalance_v2(AParamBlnc);
end;

procedure TfArc.aA2Execute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  with dsArc.DataSet do
  begin
    AParamBlnc.id_Acc := FieldByName('id_Acc').AsInteger;
    AParamBlnc.DateFrom := FieldByName('DateCreate').AsDateTime;
    AParamBlnc.DateTo := FieldByName('DateCreate').AsDateTime;
  end;
  ShowAccCard_v2(AParamBlnc);
end;

procedure TfArc.aDoc_ShowWHOrdExecute(Sender: TObject);
begin
  ShowDoc(ShowWHOrd);
end;

procedure TfArc.aShowOperReplExecute(Sender: TObject);
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  if ShowOperRepl(Fid_business, RxDBGrid1) then
    aRefreshe.Execute;
end;

procedure TfArc.aKoeff0Execute(Sender: TObject);
begin
  DoSetKoeff(0);
end;

procedure TfArc.aKoeff1Execute(Sender: TObject);
begin
  DoSetKoeff(1);
end;

procedure TfArc.aKoeffn1Execute(Sender: TObject);
begin
  DoSetKoeff(-1);
end;

procedure TfArc.DoSetKoeff(Value: integer);
var AList, AListOperVid : TIDList;
    ID, i, ind : integer;
    Rez : boolean;
    B, Ais_Mirr, ARezMode, ANeedRefr : boolean;
    ABookmark : TBookmark;
begin
  Ais_Mirr := false;
  ANeedRefr := true;
  if MessageBox(Handle, 'Пометить выделенные операции?', 'Подтвердите действие', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    with dsArc.DataSet do
    begin
      AList := TIDList.Create;
      AListOperVid := TIDList.Create;
      FNoRefr := true;
      try
        DisableControls;
        ABookmark := GetBookmark;
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          ShowProgressForm(Handle, i, RxDBGrid1.SelectedRows.Count, 'Составление списка операций');
          GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
          ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
          ind := AList.IndexOf(ID);
          if (dsArc.DataSet.FieldByName('CheckDate').isnull) and (ind = -1) then
          begin
            AList.Add(ID);
            AListOperVid.Add(dsArc.DataSet.FieldByName('OperVid').AsInteger);
          end;
        end;
        CloseProgressForm;
        for i := 0 to AList.Count - 1 do
        begin
          if not FNoRefr then
          begin
        //    ANeedRefr := false;
            Break;
          end;
          ID := AList[i];
          ShowProgressForm(Handle, i, AList.Count, 'Идет обработка операций');
          DM.rsCA.AppServer.OP__SetKoeff(Value, ID);
          // DoEditOper(false, Null, false, false, false, ID, false, false, true, AListOperVid[i]);
        end;
      //  aRefreshe.Execute;
      finally
        CloseProgressForm;
        FNoRefr := false;
        AList.Free;
        AListOperVid.Free;
        EnableControls;

        GotoBookmark(ABookmark);
        ShowProgressForm(Handle, 0, 0, 'Идет обновление данных');
        try
          if ANeedRefr then
            aRefreshe.Execute;
        finally
          CloseProgressForm;
        end;
      end;
    end;
  end;
end;

procedure TfArc.aCrOffExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ID_Oper := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  AOperParamz.Offset := true;
  AOperParamz.Copy := true;
  EditOperOffset(Handle, AOperParamz);
end;

procedure TfArc.Action2Execute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ID_Oper := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  AOperParamz.xxx := true;
  AOperParamz.Copy := true;
  EditOperWare(Handle, AOperParamz);
end;

procedure TfArc.BitBtn2Click(Sender: TObject);
begin
  pnParam.Visible := not pnParam.Visible;
end;

procedure TfArc.Button2Click(Sender: TObject);
begin
  pnParam.Visible := not pnParam.Visible;

end;

procedure TfArc.cdsSessListCalcFields(DataSet: TDataSet);
begin
  cdsSessListFileName.AsString := cdsSessListFileType.AsString + ' (' + cdsSessListDateLocal.DisplayText + ')';
end;

procedure TfArc.lcFileChange(Sender: TObject);
begin
{  Label1.Enabled :=  (lcFile.KeyValue = Null);
  dtFrom.Enabled :=  (lcFile.KeyValue = Null);
  Label2.Enabled :=  (lcFile.KeyValue = Null);
  dtTo.Enabled :=  (lcFile.KeyValue = Null); }
end;

procedure TfArc.RxDBGrid1SelectionChanged(Sender: TObject);
var V : Variant;
    S : String;
begin
  V := GridSelectionSumm(RxDBGrid1, true);
  if V = Null then
    S := ''
  else
    S := 'Сумма: ' + FormatFloat('0.##', V);
  ShowText(S, 3);
  StatusBar1.Panels[2].Text := S;
end;

procedure TfArc.mpGridPopup(Sender: TObject);
begin
  if Fid_business <> Null then
    DM.InitializeMI(Fid_business, miCrn);
end;

procedure TfArc.miCrnClick(Sender: TObject);
begin
//  DM.InitializeMI(Fid_business, miCrn);

end;

procedure TfArc.InitmiCrn;
begin
  miCrn.Clear;
  miCrn.Visible := DM.CheckUserRights(9, Fid_business) and CrnInArc;
  MakeSimple;
end;

procedure TfArc.btnLastOperClick(Sender: TObject);
begin
  TClientDataSet(dsArc.DataSet).First;
 // if DM.LastID_Oper > 0 then
  //  TClientDataSet(dsArc.DataSet).Locate('id_Oper', DM.LastID_Oper, [loCaseInsensitive, loPartialKey])
end;

procedure TfArc.miSetDateClick(Sender: TObject);
var Year, Month, Day: Word;
begin
  if Sender = miMinus6M then
  begin
    dtFrom.Date := IncMonth(now, -6);
    dtTo.Date := now;
  end
  else
  if Sender = miMinusM then
  begin
    dtFrom.Date := IncMonth(now, -1);
    dtTo.Date := now;
  end
  else
  if Sender = miMinusWeek then
  begin
    dtFrom.Date := now - 7;
    dtTo.Date := now;
  end
  else
  if Sender = miToday then
  begin
    dtFrom.Date := now;
    dtTo.Date := now;
  end
  else
  if Sender = miYesterday then
  begin
    dtFrom.Date := now - 1;
    dtTo.Date := now - 1;
  end
  else
  if Sender = miThisWeek then
  begin
    dtFrom.Date := CalcFirstDayOfWeek(Now);
    dtTo.Date := now;
  end
  else
  if Sender = miThisMounth then
  begin
    DecodeDate(Now, Year, Month, Day);
    dtFrom.Date := EncodeDate(Year, Month, 1);

    dtTo.Date := now;
  end
  else
  if Sender = miThisQuart then
  begin
    DecodeDate(Now, Year, Month, Day);
    if Month in [1, 2, 3] then Month := 1;
    if Month in [4, 5, 6] then Month := 1;
    if Month in [7, 8, 9] then Month := 1;
    if Month in [10, 11, 12] then Month := 1;
    dtFrom.Date := EncodeDate(Year, Month, 1);

    dtTo.Date := now;
  end
  else
  if Sender = miPrevWeek then
  begin
    dtFrom.Date := CalcFirstDayOfWeek(Now) - 7;
    dtTo.Date := dtFrom.Date + 6;
  end
  else
  if Sender = miPrevMounth then
  begin
    DecodeDate(IncMonth(Now, -1), Year, Month, Day);
    dtFrom.Date := EncodeDate(Year, Month, 1);

    dtTo.Date := IncMonth(dtFrom.Date, 1) - 1;
  end;
end;

procedure TfArc.miUPDClick(Sender: TObject);
begin
  dtFrom.Date := now - 1;
  dtTo.Date := now - 1;
end;

procedure TfArc.N69Click(Sender: TObject);
var Year, Month, Day: Word;
begin
  DecodeDate(Now, Year, Month, Day);
  dtFrom.Date := EncodeDate(Year, Month, 1);

  dtTo.Date := now;
end;

procedure TfArc.objectC1TMenuItem1Click(Sender: TObject);
var Year, Month, Day: Word;
begin
  DecodeDate(Now, Year, Month, Day);
  if Month in [1, 2, 3] then Month := 1;
  if Month in [4, 5, 6] then Month := 1;
  if Month in [7, 8, 9] then Month := 1;
  if Month in [10, 11, 12] then Month := 1;
  dtFrom.Date := EncodeDate(Year, Month, 1);

  dtTo.Date := now;
end;

procedure TfArc.N75Click(Sender: TObject);
var Year, Month, Day: Word;
begin

  DecodeDate(IncMonth(Now, -1), Year, Month, Day);
  dtFrom.Date := EncodeDate(Year, Month, 1);

  dtTo.Date := IncMonth(dtFrom.Date, 1) - 1;
end;

procedure TfArc.C1Click(Sender: TObject);
begin
  dtFrom.Date := CalcFirstDayOfWeek(Now);
  dtTo.Date := now;
end;

procedure TfArc.N74Click(Sender: TObject);
begin
  dtFrom.Date := CalcFirstDayOfWeek(Now) - 7;
  dtTo.Date := dtFrom.Date + 6;
end;

procedure TfArc.aSetBJItemExecute(Sender: TObject);
var id_BJ_Obj : integer;
    id_BJ_Item : Variant;
    AName : String;
    AList : TIDList;
    ABookmark : TBookmark;
    i, ID : integer;
begin
  id_BJ_Obj := -1;
  if (Sender is TMenuItem) then
    id_BJ_Obj := TMenuItem(Sender).Tag;
  if id_BJ_Obj = -1 then Exit;

  id_BJ_Item := -1;
  
  if ShowBJTreeSel(id_BJ_Item, AName,
            id_BJ_Obj, Null, Null, Null, Fid_business, true, 10) then
  begin

  if MessageBox(Handle, Pchar('Назначить финансовым операциям статью "' + AName + '"?'), 'Подтвердите действие', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    if id_BJ_Item = Null then id_BJ_Item := -1;
    with dsArc.DataSet do
    begin
      AList := TIDList.Create;
      ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;

      if (dsArc.DataSet.FieldByName('OperVid').AsInteger = 2) and (AList.IndexOf(ID) = -1) then
      begin
        AList.Add(ID);
      end;

      try
        DisableControls;
        ABookmark := GetBookmark;
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          ShowProgressForm(Handle, i, RxDBGrid1.SelectedRows.Count, 'Составление списка операций');
          GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
          ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;

          if (dsArc.DataSet.FieldByName('OperVid').AsInteger = 2) and (AList.IndexOf(ID) = -1) then
          begin
            AList.Add(ID);
          end;
        end;
        
        CloseProgressForm;
        for i := 0 to AList.Count - 1 do
        begin
          ID := AList[i];
          ShowProgressForm(Handle, i, AList.Count, 'Идет обработка операций');
          DM.rsCA.AppServer.BJ_OperRelEDIT(-1, id_BJ_Item, ID);
        end;
      finally
        CloseProgressForm;
        FNoRefr := false;
        AList.Free;
 
        EnableControls;

        GotoBookmark(ABookmark);
//        ShowProgressForm(Handle, 0, 0, 'Идет обновление данных');
        CloseProgressForm;
      end;
    end;
  end;

  end;
end;

procedure TfArc.MakeSimple;
var
    i : integer;
    MI : TMenuItem;
begin
  if DM.IsSimple then
  begin
    BitBtn2.Visible := false;
    BitBtn1.Visible := false;
    RxSpeedButton3.Visible := false;
    RxSpeedButton2.Visible := false;
    RxSpeedButton9.Visible := false;
    
    for i := ComponentCount - 1 downto 0 do
    begin
      if Components[i] is TMenuItem then
      begin
        MI := TMenuItem(Components[i]);
        if (MI.Caption <> '-') then
        begin
         { MI.Visible := (MI = N1)
          or (MI = N23) or (MI = miRep) or (MI = Gjkm1) or (MI = miWindow)
           or (MI = N32); }

          MI.Visible := (MI.Action = aNewWH) or (MI.Action = aNewFin) or (MI.Action = aNewZac) or (MI.Action = aNewRez)
           or (MI.Action = aOperByRez)  or (MI.Action = aA2) or (MI.Action = aB2) or (MI.Action = aWHRep)
           or (MI.Action = aNewCopyOper2) or (MI.Action = aUnViza) or (MI.Action = aCopySel)
           or (MI.Action = aDelete) or (MI.Action = aProperty) or (MI.Action = aSelectAll)
           or (MI.Action = ADelSel) or (MI.Action = aUnVizaSel) or (MI.Action = aShowOperRepl)
           or (MI.GetParentMenu = pmOperFilter)
           or (MI.GetParentMenu = pmViza)
           or (MI.GetParentMenu = pmSetDate)
           or (MI.GetParentMenu = pmAutoViza)

         ;
          
          if (MI.Visible) and (MI.Parent <> nil) then MI.Parent.Visible := true;
          if (MI.Visible) and (MI.Parent <> nil) and (MI.Parent.Parent <> nil) then MI.Parent.Parent.Visible := true;
         // if (MI = miCrn) then MI.Free;
        end;
      end;
    end;
  end;
end;

procedure TfArc.miUPD2Click(Sender: TObject);
begin
  ShowDoc(ShowUPD);
end;

procedure TfArc.cdsArc2FilterRecord(DataSet: TDataSet; var Accept: Boolean);
var S, S2 : String;
    Rez : boolean;
  function CompFV(AField : TField) : boolean;
  var SSS, SSS2, Stmp : String;
      i : integer;
      Col : TColumnEh;
  begin
    Stmp := S2;
    Col := nil;
    for i := 0 to RxDBGrid1.Columns.Count - 1 do
    begin
      if (AField = RxDBGrid1.Columns[i].Field) then
      begin
        if (RxDBGrid1.Columns[i].Visible) then
        begin
          Col := RxDBGrid1.Columns[i];
        end;
        Break;
      end;
    end;
    if (Col <> nil) then
    begin
      SSS := AnsiUpperCase(AField.AsString);
      if AField is TNumericField then
      begin
        SSS := FormatFloat('0.00', AField.AsFloat);
        Stmp := StringReplace(Stmp, '.' , DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
        Stmp := StringReplace(Stmp, ',' , DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
      end;
        
      SSS2 := StringReplace(SSS, ' ' , '', [rfReplaceAll, rfIgnoreCase]);
      Result := (Pos(S, SSS) > 0) or (SSS = S)
      or (Pos(Stmp, SSS2) > 0) or (SSS2 = Stmp);

      if (Result) then
      begin
        Rez := true;
        Col.Title.Font.Color := clRed;
      end;
    end;
  end;
var i : integer;
begin
  S := AnsiUpperCase(Trim(edFlt.Text));
  S2 := StringReplace(S, ' ' , '', [rfReplaceAll, rfIgnoreCase]);
  Rez := false;
 {   for i := 0 to RxDBGrid1.Columns.Count - 1 do
    begin
      RxDBGrid1.Columns[i].Title.Font.Color := clBlack;
    end;
          }
  if trim(S) <> '' then
  begin
    with DataSet do
    begin
        CompFV(FieldByName('PriceOper'));
        CompFV(FieldByName('SummOper'));
        CompFV(FieldByName('OperNum'));
        CompFV(FieldByName('WareName'));
        CompFV(FieldByName('SrcName'));
        CompFV(FieldByName('ReprName'));
        CompFV(FieldByName('ContrAgentName'));
        CompFV(FieldByName('FormalDistribName'));
        CompFV(FieldByName('FuncDistribName'));
        CompFV(FieldByName('Imp_PayBasic'));
        CompFV(FieldByName('AccInv_PayAssignment'));
        CompFV(FieldByName('Contract'));
        CompFV(FieldByName('OpComment'));
        CompFV(FieldByName('Str1'));
        CompFV(FieldByName('Str2'));
        CompFV(FieldByName('Str3'));
        CompFV(FieldByName('Str4'));
        CompFV(FieldByName('Str5'));
        CompFV(FieldByName('Str6'));
        CompFV(FieldByName('Str7'));
        CompFV(FieldByName('Str8'));
        CompFV(FieldByName('Str9'));
        CompFV(FieldByName('Str10'));
        CompFV(FieldByName('Str11'));
        CompFV(FieldByName('Str12'));
        CompFV(FieldByName('Str13'));
        CompFV(FieldByName('Str14'));
        CompFV(FieldByName('Str15'));
    end;
  end
  else
    Rez := true;
  Accept := Rez;       
end;

procedure TfArc.edFltChange(Sender: TObject);
var     i : integer;
begin
  Timer1.Enabled := false;
  Timer1.Enabled := true;

end;

procedure TfArc.SetParamVal(CDS : TDataSet; AParamName: String; V: Variant);
var Param : TParam;
begin
  Param := TClientDataSet(CDS).Params.FindParam(AParamName);
  if Param <> nil then Param.Value := V;
end;

procedure TfArc.Timer1Timer(Sender: TObject);
var i : integer;
begin
  Timer1.Enabled := false;
  with TClientDataset(dsArc.DataSet) do
  begin
    DisableControls;
    try
      Filtered := False;
      for i := 0 to RxDBGrid1.Columns.Count - 1 do
      begin
        RxDBGrid1.Columns[i].Title.Font.Color := clBlack;
      end;
      FilterOptions := [foCaseInsensitive];
      Filtered := Trim(edFlt.Text) <> '';

    finally
      OnFilterRecord := cdsArc2FilterRecord;
      EnableControls;
    end;
  end;
end;

procedure TfArc.aShowOperBlockITExecute(Sender: TObject);
begin
  ShowOperBlockIT(Fid_business);
end;

procedure TfArc.btnClrFltClick(Sender: TObject);
begin
  edFlt.Text := '';
  Timer1Timer(Timer1);
end;

procedure TfArc.MiTestClick(Sender: TObject);
var ID, X: integer;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  try
    X := DM.rsCA.AppServer.OP_OperSetCheckDate_v2(ID, DM.IDUser);
  except
    on E : Exception do
    begin
       MessageBox(Handle, PChar( E.Message), 'NOT OK', MB_OK); //MessageBox(Handle, 'Ошибка на сервере. ' , MB_OK + MB_ICONERROR);
    end;
  end;

  if X = 1 then
                begin
                  MessageBox(Handle, 'Нет ошибок', 'OK', MB_OK);
                  Exit;
                end;
  if X <> 1 then
                begin
                  MessageBox(Handle, 'Ошибка при визировании', 'Произошла ошибка при визировании операции', MB_OK + MB_ICONERROR);
                  Exit;
                end;
end;

end.





