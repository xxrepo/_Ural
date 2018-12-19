unit uMainForm;

interface

uses          
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ComCtrls, StdCtrls,ScktComp, RXSpin, uBalance, ActnList, ImgList, RXCtrls, ToolWin, uFltList, Tabs, frObjList, foMyFunc, uFormAPI_Doc,
  TimerLst, AdvMenus, AdvOfficeTabSet, AdvOfficeStatusBar;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N111: TMenuItem;
    N9: TMenuItem;
    Gjkm1: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    miWindow: TMenuItem;
    ArrangeAll1: TMenuItem;
    Cascade1: TMenuItem;
    Tile1: TMenuItem;
    N8: TMenuItem;
    Ds1: TMenuItem;
    N23: TMenuItem;
    N30: TMenuItem;
    N29: TMenuItem;
    ilImage: TImageList;
    ActionList1: TActionList;
    aNewWH: TAction;
    aNewFin: TAction;
    aNewService: TAction;
    aNewZac: TAction;
    aNewEmpty: TAction;
    aArc: TAction;
    Action1: TAction;
    aCat: TAction;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    aOperViza: TAction;
    ToolButton6: TToolButton;
    N2: TMenuItem;
    N4: TMenuItem;
    aShowNewObj: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    N12: TMenuItem;
    N18: TMenuItem;
    aShowOperBuff: TAction;
    N20: TMenuItem;
    aShowBalance: TAction;
    miRep: TMenuItem;
    aMes: TAction;
    aShowCurrencyList: TAction;
    N3: TMenuItem;
    N24: TMenuItem;
    aShowRateUpdater: TAction;
    aShowURLList: TAction;
    miCur: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    aShowBlnBsn: TAction;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N35: TMenuItem;
    aShowAccCard: TAction;
    N41: TMenuItem;
    N42: TMenuItem;
    aShowFormalDict: TAction;
    aShowFuncDict: TAction;
    N43: TMenuItem;
    N44: TMenuItem;
    aShowFltList: TAction;
    N46: TMenuItem;
    aShowMovWH: TAction;
    N36: TMenuItem;
    aShowMovService: TAction;
    aEditOperFin_FFF: TAction;
    N38: TMenuItem;
    N39: TMenuItem;
    aEditOperWare_FFF: TAction;
    N47: TMenuItem;
    ToolButton7: TToolButton;
    aEditOperService_FFF: TAction;
    N25: TMenuItem;
    N48: TMenuItem;
    aShowDelOperList: TAction;
    N49: TMenuItem;
    aShowCorrOperList: TAction;
    aShowHasVizaOperList: TAction;
    aShowEmptyOperList: TAction;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    aShowMinusOperList: TAction;
    N53: TMenuItem;
    aShowNotHasVizaOperList: TAction;
    N54: TMenuItem;
    aShowZatrataOperList: TAction;
    aShowPribilOperList: TAction;
    N55: TMenuItem;
    N56: TMenuItem;
    aShowFogetOperList: TAction;
    N57: TMenuItem;
    aShowSelfOperList: TAction;
    aShowSelfOperList1: TMenuItem;
    aEditFilter: TAction;
    N58: TMenuItem;
    aShowRateHist: TAction;
    N37: TMenuItem;
    N59: TMenuItem;
    aShowExtData: TAction;
    N60: TMenuItem;
    aShowRateOperList: TAction;
    N61: TMenuItem;
    N62: TMenuItem;
    aShowAccCard_Adv: TAction;
    aShowMovGoodsWH_Adv: TAction;
    N65: TMenuItem;
    N66: TMenuItem;
    aShowBalanceArc: TAction;
    N67: TMenuItem;
    N68: TMenuItem;
    aShowMovCA_Adv: TAction;
    N69: TMenuItem;
    N70: TMenuItem;
    N71: TMenuItem;
    N72: TMenuItem;
    N73: TMenuItem;
    N74: TMenuItem;
    N75: TMenuItem;
    N76: TMenuItem;
    N77: TMenuItem;
    N78: TMenuItem;
    N79: TMenuItem;
    N80: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    N83: TMenuItem;
    N84: TMenuItem;
    N85: TMenuItem;
    N86: TMenuItem;
    N87: TMenuItem;
    N88: TMenuItem;
    N89: TMenuItem;
    N90: TMenuItem;
    N91: TMenuItem;
    N92: TMenuItem;
    N93: TMenuItem;
    N94: TMenuItem;
    N95: TMenuItem;
    N96: TMenuItem;
    N97: TMenuItem;
    aReVal: TAction;
    N98: TMenuItem;
    N99: TMenuItem;
    aShowMovCA: TAction;
    N100: TMenuItem;
    N101: TMenuItem;
    Cjjotybz1: TMenuItem;
    aImpOper: TAction;
    N13: TMenuItem;
    N14: TMenuItem;
    Action2: TAction;
    Action3: TAction;
    aNewRez: TAction;
    N15: TMenuItem;
    RxSpeedButton2: TRxSpeedButton;
    PopupMenu2: TPopupMenu;
    RxSpeedButton3: TRxSpeedButton;
    N16: TMenuItem;
    N17: TMenuItem;
    aNewCorHW: TAction;
    aNewCorFin: TAction;
    aNewCorOffset: TAction;
    N21: TMenuItem;
    N34: TMenuItem;
    N63: TMenuItem;
    N102: TMenuItem;
    N7: TMenuItem;
    N103: TMenuItem;
    N104: TMenuItem;
    N105: TMenuItem;
    N106: TMenuItem;
    N107: TMenuItem;
    N108: TMenuItem;
    N109: TMenuItem;
    N110: TMenuItem;
    RxSpeedButton4: TRxSpeedButton;
    pmDoc: TPopupMenu;
    miPayIn: TMenuItem;
    miActCL: TMenuItem;
    N112: TMenuItem;
    miFinalAct: TMenuItem;
    N113: TMenuItem;
    N114: TMenuItem;
    N115: TMenuItem;
    N116: TMenuItem;
    aShowDocDict: TAction;
    N117: TMenuItem;
    aShowDocList: TAction;
    N118: TMenuItem;
    N119: TMenuItem;
    N120: TMenuItem;
    N121: TMenuItem;
    aBsnImp: TAction;
    aShowArc_Oper: TAction;
    N122: TMenuItem;
    aShowArc201: TAction;
    N123: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    ToolButton1: TToolButton;
    aShowWizNoDeptCA: TAction;
    N124: TMenuItem;
    N125: TMenuItem;
    aShowWizNoDeptAcc: TAction;
    N126: TMenuItem;
    sdf1: TMenuItem;
    N127: TMenuItem;
    aShowWizReplaceWare: TAction;
    N128: TMenuItem;
    aShowCAByDateLastBay: TAction;
    N129: TMenuItem;
    N130: TMenuItem;
    aShowCAPrfLoss: TAction;
    N131: TMenuItem;
    aShowWarePrfLoss: TAction;
    N132: TMenuItem;
    aShowBalance_V2: TAction;
    N133: TMenuItem;
    aA2: TAction;
    N134: TMenuItem;
    Button1: TButton;
    aaa: TAction;
    aShowBJList: TAction;
    N135: TMenuItem;
    Button2: TButton;
    aInvDict: TAction;
    aInvShowInvMain: TAction;
    aInvShowInvRepList: TAction;
    N137: TMenuItem;
    N138: TMenuItem;
    N139: TMenuItem;
    miInv: TMenuItem;
    N141: TMenuItem;
    aShowInvList: TAction;
    N19: TMenuItem;
    N45: TMenuItem;
    N142: TMenuItem;
    miAG: TMenuItem;
    N143: TMenuItem;
    aShowInv_Prft: TAction;
    N144: TMenuItem;
    aShowInvPrft1: TMenuItem;
    aShowWHAvg: TAction;
    N145: TMenuItem;
    aShowCA_W: TAction;
    aShowCAW1: TMenuItem;
    aShowPL_W: TAction;
    N146: TMenuItem;
    aShowPL_VSP: TAction;
    N147: TMenuItem;
    aShowPL_RR: TAction;
    N148: TMenuItem;
    aShowCust_DDD: TAction;
    N149: TMenuItem;
    N150: TMenuItem;
    aShowCust_v22: TAction;
    aShowCust_v23: TAction;
    aShowCust_v24: TAction;
    aShowBlnBsn_EX: TAction;
    N1545: TMenuItem;
    aANP: TAction;
    N154: TMenuItem;
    RxTimerList1: TRxTimerList;
    RxTimerEvent1: TRxTimerEvent;
    aShowAccCard_adv_v2: TAction;
    N155: TMenuItem;
    N22: TMenuItem;
    aImpImpex: TAction;
    N40: TMenuItem;
    aTask: TAction;
    pmTabList: TAdvPopupMenu;
    Edit1: TEdit;
    Edit2: TEdit;
    MainStatusBar: TAdvOfficeStatusBar;
    aShowBJList_v2: TAction;
    miSkinList13: TMenuItem;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure Tile1Click(Sender: TObject);
    procedure ArrangeAll1Click(Sender: TObject);
    procedure Ds1Click(Sender: TObject);
    procedure aArcExecute(Sender: TObject);
    procedure aCatExecute(Sender: TObject);
    procedure aNewWHExecute(Sender: TObject);
    procedure aNewFinExecute(Sender: TObject);
    procedure aNewZacExecute(Sender: TObject);
    procedure aNewEmptyExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aShowNewObjExecute(Sender: TObject);
    procedure aShowOperBuffExecute(Sender: TObject);
    procedure aShowBalanceExecute(Sender: TObject);
    procedure aMesExecute(Sender: TObject);
    procedure aShowCurrencyListExecute(Sender: TObject);
    procedure aShowRateUpdaterExecute(Sender: TObject);
    procedure aShowURLListExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aShowBlnBsnExecute(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure aShowAccCardExecute(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure aShowFormalDictExecute(Sender: TObject);
    procedure aShowFuncDictExecute(Sender: TObject);
    procedure aShowFltListExecute(Sender: TObject);
    procedure aShowMovWHExecute(Sender: TObject);
    procedure aEditOperFin_FFFExecute(Sender: TObject);
    procedure aEditOperWare_FFFExecute(Sender: TObject);
    procedure aShowDelOperListExecute(Sender: TObject);
    procedure aShowCorrOperListExecute(Sender: TObject);
    procedure aShowHasVizaOperListExecute(Sender: TObject);
    procedure aShowEmptyOperListExecute(Sender: TObject);
    procedure aShowMinusOperListExecute(Sender: TObject);
    procedure aShowNotHasVizaOperListExecute(Sender: TObject);
    procedure aShowZatrataOperListExecute(Sender: TObject);
    procedure aShowPribilOperListExecute(Sender: TObject);
    procedure aShowFogetOperListExecute(Sender: TObject);
    procedure aShowSelfOperListExecute(Sender: TObject);
    procedure aEditFilterExecute(Sender: TObject);
    procedure aShowRateHistExecute(Sender: TObject);
    procedure aShowExtDataExecute(Sender: TObject);
    procedure aShowRateOperListExecute(Sender: TObject);
    procedure PopupMenu1Change(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure N62Click(Sender: TObject);
    procedure aShowAccCard_AdvExecute(Sender: TObject);
    procedure aShowMovGoodsWH_AdvExecute(Sender: TObject);
    procedure aShowBalanceArcExecute(Sender: TObject);
    procedure aShowMovCA_AdvExecute(Sender: TObject);
    procedure N97Click(Sender: TObject);
    procedure aReValExecute(Sender: TObject);
    procedure aShowMovCAExecute(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure Cjjotybz1Click(Sender: TObject);
    procedure aImpOperExecute(Sender: TObject);
    procedure aNewRezExecute(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure aNewCorHWExecute(Sender: TObject);
    procedure aNewCorFinExecute(Sender: TObject);
    procedure aNewCorOffsetExecute(Sender: TObject);
    procedure aShowDocDictExecute(Sender: TObject);
    procedure aShowDocListExecute(Sender: TObject);
    procedure N119Click(Sender: TObject);
    procedure aBsnImpExecute(Sender: TObject);
    procedure aShowArc_OperExecute(Sender: TObject);
    procedure aShowArc201Execute(Sender: TObject);
    procedure aShowWizNoDeptCAExecute(Sender: TObject);
    procedure aShowWizNoDeptAccExecute(Sender: TObject);
    procedure sdf1Click(Sender: TObject);
    procedure aShowWizReplaceWareExecute(Sender: TObject);
    procedure aShowCAByDateLastBayExecute(Sender: TObject);
    procedure aShowCAPrfLossExecute(Sender: TObject);
    procedure aShowWarePrfLossExecute(Sender: TObject);
    procedure aShowBalance_V2Execute(Sender: TObject);
    procedure aA2Execute(Sender: TObject);
    procedure aShowBJListExecute(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure aInvDictExecute(Sender: TObject);
    procedure aInvShowInvMainExecute(Sender: TObject);
    procedure aInvShowInvRepListExecute(Sender: TObject);
    procedure aShowInvListExecute(Sender: TObject);
    procedure N142Click(Sender: TObject);
    procedure N143Click(Sender: TObject);
    procedure aShowInv_PrftExecute(Sender: TObject);
    procedure aShowWHAvgExecute(Sender: TObject);
    procedure aShowCA_WExecute(Sender: TObject);
    procedure aShowPL_WExecute(Sender: TObject);
    procedure aShowPL_VSPExecute(Sender: TObject);
    procedure aShowPL_RRExecute(Sender: TObject);
    procedure aShowCust_DDDExecute(Sender: TObject);
    procedure aShowCust_v22Execute(Sender: TObject);
    procedure aShowCust_v23Execute(Sender: TObject);
    procedure aShowCust_v24Execute(Sender: TObject);
    procedure aShowBlnBsn_EXExecute(Sender: TObject);
    procedure aANPExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RxTimerEvent1Timer(Sender: TObject);
    procedure aShowAccCard_adv_v2Execute(Sender: TObject);
    procedure aImpImpexExecute(Sender: TObject);
    procedure aTaskExecute(Sender: TObject);
    procedure miSHImportClick(Sender: TObject);
    procedure aShowBJList_v2Execute(Sender: TObject);
  private
    xxxUSAK : boolean;
    procedure AppException(Sender: TObject; E: Exception);
    procedure OnActiveFormChange(Sender: TObject);
    procedure OnActivate(Sender: TObject);
  public
    procedure DoSelectObjEvent(Sender: TObject;
                               var AID : integer;
                               var AName: string;
                               var DefSelector: boolean;
                               var Rez: boolean;
                               ExtID : Variant;
                               id_Bsn : Variant);
    procedure ColorForm(Sender: TObject);
    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
    procedure STMessage(var Message: TMessage); message WM_ShowText;
    procedure ShowText(AMessage : String; APos : integer = 1);
  end;

var
  MainForm: TMainForm;

implementation

uses uFormApi_CA, uDM, uFormApi_Ware, uFormsAPI_Users, uFormApi_CrnAdm,
  uFormsAPI_Admin, uFormApi_Oper, 
  uEForm, uBalanceBsn, uSettings, uAccCard,
  uOperDay, uFormalDict, uFuncDict,
  uMovWH, uFormApi_RPT, UniverseFilterForm, UniverseFilter,
  uRateHist, uExtData, uSelectMes, uWareCtgSelector, uAccCard_Adv,
  uMovWH_Adv, uUnivSelector, uMovCA_Adv, uOperImp, uMovCA, uSplashForm,
  uMSGList, uAPOper, uCASelector, uAPList, uBsnImp, uArc_Oper, uArc201,
  uTableReIndex, uCAByDateLastBay, uCAPrfLoss, uWarePrfLoss, uBalance_v2,
  uAccCard_v2, uBJTree, uBJList, uInvMain, uInvRepList, uInvDict, uInvList,
  uInvRep, uCnstItem, uInv_Prft, uWHAvg, uCA_W, uPL_W, uPL_VSP, uPL_RR,
  uCust_DDD, uCust_V2, uAPNList, uAPNOper, uAccCard_Adv_v2, uOperImp_impex,
  uTasks, uBCImp;

{$R *.DFM}

procedure TMainForm.STMessage(var Message: TMessage);
var S : String;
begin
  ShowText(PChar(Message.WParam), Message.LParam);
end;

procedure TMainForm.FormCreate(Sender: TObject);
var i : integer;
    MI, MI2 : TMenuItem;
    V : Variant;
begin
//  Screen.OnActiveFormChange := OnActiveFormChange;
  Application.OnActivate := OnActivate;

  aShowBlnBsn_EX.Visible := DM.XdbName = 'ACS_MBase';
  aShowArc201.Visible :=  DM.FMayRez;
  miAG.Visible := DM.CheckUserRights(2009, Null);

    miInv.Visible := DM.CheckUserRights(1001, Null) or DM.CheckUserRights(1002, Null);
  xxxUSAK := false; //true;
  if  xxxUSAK then
  begin
    aShowInv_Prft.Visible := False;
    aShowWHAvg.Visible := False;
    aShowCA_W.Visible := False;
    aShowPL_W.Visible := False;
    aShowPL_VSP.Visible := False;
    aShowPL_RR.Visible := False;

    aShowCAByDateLastBay.Visible := False;
    aShowCAPrfLoss.Visible := False;
    aShowWarePrfLoss.Visible := False;

    aShowCust_v22.Visible := False;
    aShowCust_v23.Visible := False;
    aShowCust_v24.Visible := False;
  end;

  if not DM.CheckUserRights(2007, Null) then
  begin
    aShowWarePrfLoss.Visible := False;
  end;
  if not DM.CheckUserRights(2006, Null) then
  begin
    aShowCAPrfLoss.Visible := False;
  end;
  if not DM.CheckUserRights(2005, Null) then
  begin
    aShowCust_DDD.Visible := False;
  end;

  if not DM.CheckUserRights(2004, Null) then
  begin
    aShowCust_v23.Visible := False;
  end;

  if not DM.CheckUserRights(2003, Null) then
  begin
    aShowInv_Prft.Visible := False;
    aShowWHAvg.Visible := False;
    aShowCA_W.Visible := False;
    aShowPL_W.Visible := False;
    aShowPL_VSP.Visible := False;
    aShowPL_RR.Visible := False;
  end;

  if DM.Capt <> '' then
  begin
    Caption := StringReplace(Caption, '1:1 Управленческий учет', DM.Capt, [rfReplaceAll, rfIgnoreCase]);
    Application.Title := Caption;
  end;
  MainFormHandle := Handle;
  aNewRez.Visible := DM.FMayRez;
  MainStatusBar.Panels[0].Text := 'Пользователь: ' + DM.FullFIO;
  miCur.Enabled := DM.CheckUserRights(9, Null);

  aNewWH.Visible := DM.CheckUserRights(1, Null);
  aNewFin.Visible := DM.CheckUserRights(2, Null);
  aNewZac.Visible := DM.CheckUserRights(4, Null);

  aNewCorFin.Visible := aNewFin.Visible;
  aNewCorHW.Visible := aNewWH.Visible;
  aNewRez.Visible := DM.CheckUserRights(25, Null);
  aNewCorOffset.Visible := aNewZac.Visible;

  aEditOperFin_FFF.Visible := DM.CheckUserRights(11, Null);
  aEditOperWare_FFF.Visible := DM.CheckUserRights(11, Null);
  aEditOperService_FFF.Visible := DM.CheckUserRights(11, Null);

  aReVal.Visible := DM.CheckUserRights(21, Null);

//  miRep.Visible := DM.CheckUserRights(6, Null) or DM.CheckUserRights(15, Null);
  RxSpeedButton4.Visible := miRep.Visible;

  aShowDocDict.Visible := DM.CheckUserRights(26, Null);
  aShowDocList.Visible := DM.CheckUserRights(26, Null);

  Application.OnException := AppException;

  for i := 0 to miRep.Count - 1 do
  begin
    MI2 := miRep.Items[i];
    MI := TMenuItem.Create(Self);
    PopupMenu2.Items.Add(MI);
    if MI2.Action = nil then
    begin
      MI.Caption := MI2.Caption
    end
    else
      MI.Action :=  MI2.Action;
    MI.Visible :=  MI2.Visible;
  end;

  //  aBsnImp.Visible := False;
  if xxxUSAK then
  begin
    aShowBJList.Visible := False;
    miInv.Visible := False;
    aShowCust_DDD.Visible := False;
    aShowDocList.Visible := False;
    aShowNewObj.Visible := False;
    aShowDocDict.Visible := False;
    aShowArc_Oper.Visible := False;
    aShowArc201.Visible := False;

    aImpOper.Visible := False;
    aReVal.Visible := False;
    aShowWizReplaceWare.Visible := False;
    aShowWizNoDeptAcc.Visible := False;
    aShowWizNoDeptCA.Visible := False;
    aShowMovCA.Visible := False;
  end;
  aShowBlnBsn.Visible := DM.CheckUserRights(15, Null);
  aShowBalanceArc.Visible := aShowBlnBsn.Visible;
{
  aShowBlnBsn.Visible := false;
  aShowBalanceArc.Visible := false;
  aShowBalance.Visible := false;
  aShowBalance_V2.Visible := false;
  aA2.Visible := false;
  aShowAccCard.Visible := false;
  aShowAccCard_Adv.Visible := false;
  aShowMovCA.Visible := false;
  aShowMovCA_Adv.Visible := false;
  aShowDocList.Visible := false;
  N119.Visible := false;
  aShowBJList.Visible := false;
  N140.Visible := false;   }
end;

procedure TMainForm.N10Click(Sender: TObject);
var
  ID:Variant;
  Name:string;
begin
 GetGroupsForm(ID, Name, False,True);

end;

procedure TMainForm.N11Click(Sender: TObject);
var
  ID:Variant;
  Name:string;
begin
 GetUsersForm(ID, Name, False,True);

end;

procedure TMainForm.N8Click(Sender: TObject);
var i : integer;
begin
  for i := 0 to MDIChildCount - 1 do
    MDIChildren[i].WindowState := wsMinimized;
end;

procedure TMainForm.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm.Tile1Click(Sender: TObject);
begin
  Tile;
end;

procedure TMainForm.ArrangeAll1Click(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TMainForm.Ds1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.aArcExecute(Sender: TObject);
begin
  ShowArc(Null, Null);
end;

procedure TMainForm.aCatExecute(Sender: TObject);
var ASelectedObj : TSelectedObj;
    id_Bsn, Disabled: Variant;
    AEObjTypes: TEObjTypes;
begin
  ASelectedObj.ID := Null;
  ShowEForm(ASelectedObj, -13, [eotBsn, eotFin, eotWH, eotManuf, eotCA, eotGoods]);
end;

procedure TMainForm.aNewWHExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperWare(Handle, AOperParamz);
end;

procedure TMainForm.aNewFinExecute(Sender: TObject);
var
    AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperFin(Handle, AOperParamz);
end;

procedure TMainForm.aNewZacExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperOffset(Handle, AOperParamz);
end;

procedure TMainForm.aNewEmptyExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperEmpty(Handle, AOperParamz);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageBox(Handle, 'Завершить работу с программой?', Pchar(Application.Title), MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idYes then
    Action := caFree
  else
    Action := caNone;
end;

procedure TMainForm.aShowNewObjExecute(Sender: TObject);
begin
  ShowNewObj;
end;

procedure TMainForm.aShowOperBuffExecute(Sender: TObject);
begin
  ShowOperBuff;
end;

procedure TMainForm.aShowBalanceExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
//  AParamBlnc.id_ContrAgent := 60; //1013
 // AParamBlnc.HasViza := true;
  ShowBalance(AParamBlnc);
end;

procedure TMainForm.aMesExecute(Sender: TObject);
var
  ID:Variant;
  Name:string;
begin
 GetMeasuresForm(NULL, ID, Name, False,True);
end;

procedure TMainForm.aShowCurrencyListExecute(Sender: TObject);
begin
  ShowCurrencyList(Null, Null, Null);
end;

procedure TMainForm.aShowRateUpdaterExecute(Sender: TObject);
begin
  ShowRateUpdater;
end;

procedure TMainForm.aShowURLListExecute(Sender: TObject);
begin
  ShowURLList;
end;

procedure TMainForm.FormShow(Sender: TObject);
var S : String;
begin
//  AlphaDM.ActiveFormChange(Screen);
             
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
  if FOpenDay then
  begin
    try
      S := DM.GetClosedDaysList;
      KillSplashForm(0);
      if (S <> '') then
      begin
        MessageBox(Handle, PChar('Не открыт день в бизнесе ' + #13 + #10 + S + #13 + #10 + 'Вам необходимо открыть день и задать курсы валют'), 'Необходимо открыть день', MB_OK + MB_ICONWARNING);
      end;
    except
    end;
  end;
  if DM.DefB_APN > 0 then
    ShowAPNOper(0, -1, DM.DefB_APN);
  RxTimerEvent1.Enabled := DM.CheckUserRights(5000, DM.DefB_APN) and (DM.DefB_APN > 0);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TMainForm.aShowBlnBsnExecute(Sender: TObject);
begin
  ShowBlnBsn(Null, Null, 0);
end;

procedure TMainForm.N33Click(Sender: TObject);
begin
  ChangeStng;
end;

procedure TMainForm.N37Click(Sender: TObject);
begin
  ShowCurrencyList_old(Null, Null, Null);
end;

procedure TMainForm.aShowAccCardExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowAccCard(AParamBlnc);
end;

procedure TMainForm.N42Click(Sender: TObject);
begin
  ShowOperDay;
end;

procedure TMainForm.aShowFormalDictExecute(Sender: TObject);
begin
  ShowFormalDict;
end;

procedure TMainForm.aShowFuncDictExecute(Sender: TObject);
begin
  ShowFuncDict;
end;

procedure TMainForm.aShowFltListExecute(Sender: TObject);
begin
  ShowFltList(DoSelectObjEvent);
end;

procedure TMainForm.aShowMovWHExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowMovWH(AParamBlnc, true);
end;

procedure TMainForm.aEditOperFin_FFFExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperFin_FFF(Handle, AOperParamz);
end;

procedure TMainForm.aEditOperWare_FFFExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperWare_FFF(Handle, AOperParamz);
end;

procedure TMainForm.aShowDelOperListExecute(Sender: TObject);
begin
  ShowDelOperList;
end;

procedure TMainForm.aShowCorrOperListExecute(Sender: TObject);
begin
  ShowCorrOperList;
end;

procedure TMainForm.aShowHasVizaOperListExecute(Sender: TObject);
begin
  ShowHasVizaOperList;
end;

procedure TMainForm.aShowEmptyOperListExecute(Sender: TObject);
begin
  ShowEmptyOperList;
end;

procedure TMainForm.aShowMinusOperListExecute(Sender: TObject);
begin
  ShowMinusOperList;
end;

procedure TMainForm.aShowNotHasVizaOperListExecute(Sender: TObject);
begin
  ShowNotHasVizaOperList;
end;

procedure TMainForm.aShowZatrataOperListExecute(Sender: TObject);
begin
  ShowZatrataOperList;
end;

procedure TMainForm.aShowPribilOperListExecute(Sender: TObject);
begin
  ShowPribilOperList;
end;

procedure TMainForm.aShowFogetOperListExecute(Sender: TObject);
begin
  ShowFogetOperList;
end;

procedure TMainForm.aShowSelfOperListExecute(Sender: TObject);
begin
  ShowSelfOperList;
end;

procedure TMainForm.aEditFilterExecute(Sender: TObject);
var ID : integer;
begin
  ID := -1;
  EditFilter(DM.rsFlt, 1, DM.IDUser, 0, ID, DoSelectObjEvent, [ufsObjView, ufsCondList, ufsMayChangeCond]);
end;

procedure TMainForm.aShowRateHistExecute(Sender: TObject);
begin
  ShowRateHist;
end;

procedure TMainForm.aShowExtDataExecute(Sender: TObject);
begin
  ShowExtData;
end;

procedure TMainForm.aShowRateOperListExecute(Sender: TObject);
begin
  ShowRateOperList;
end;

procedure TMainForm.PopupMenu1Change(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
  tag := 0;
end;


procedure TMainForm.ColorForm(Sender: TObject);
var i : integer;
    ind : integer;
begin
 { if (TabSet1 <> nil) then
  begin
    if (TabSet1.Tabs.Count > MDIChildCount) then
    begin
    TabSet1.OnChange := nil;
      TabSet1.Tabs.Clear;
      for i := 0 to MDIChildCount - 1 do
      begin
        TabSet1.Tabs.Add(MDIChildren[I].Caption);
      end;
      if TabSet1.Tabs.Count > 0 then
        TabSet1.TabIndex := 0;
  end;  }
end;

procedure TMainForm.TabSet1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  if MDIChildren[NewTab] <> ActiveMDIChild then
    MDIChildren[NewTab].BringToFront;
end;

procedure TMainForm.DoSelectObjEvent(Sender: TObject; var AID: integer;
  var AName: string; var DefSelector, Rez: boolean; ExtID: Variant;
  id_Bsn: Variant);
var ASelectedObj : TSelectedObj;
    UnSel : boolean;
    xxx_id_Ctg : Variant;
    S : String;
    LC_ID : Variant;
begin
  if id_Bsn = Null then
    id_Bsn := -13;
  UnSel := false;
  ASelectedObj.ID := AID;
  case ExtID of
    1 :
    begin
      UnSel := true;
      DefSelector := false;
      ASelectedObj.ObjType := eotFin;
    end;
    2 :
    begin
      UnSel := true;
      DefSelector := false;
      ASelectedObj.ObjType := eotWH;
    end;
    3 :
    begin
      UnSel := true;
      DefSelector := false;
      ASelectedObj.ObjType := eotManuf;
    end;
    4 :
    begin
      UnSel := false;
      DefSelector := false;
      if AID = Null then
        LC_ID := -1
      else
        LC_ID := AID;
      Rez := GetUsersForm(LC_ID, S, true, false, true, TWinControl(Sender).Handle);
      if Rez then
      begin
        AName := S;
        AID := LC_ID;
      end;
    end;
    5 :
    begin
      UnSel := true;
      DefSelector := false;
      ASelectedObj.ObjType := eotGoods;
    end;
    9 :
    begin
      UnSel := true;
      DefSelector := false;
      ASelectedObj.ObjType := eotCA;
    end;
    10 :
    begin
      DefSelector := false;
      Rez := SelectCAGroup(id_Bsn, ASelectedObj.ID, ASelectedObj.Name, false, true, true);
      if Rez then
      begin
        AID := ASelectedObj.ID;;
        AName := ASelectedObj.Name;
      end;
    end;
    12 :
    begin
      DefSelector := false;
      Rez := ShowSelectMes(false, false, true, false, id_Bsn, AID, AName);
    end;
    13 :
    begin
      DefSelector := false;
      Rez := ShowSelectMes(false, false, false, true, id_Bsn, AID, AName);
    end;
    14 :
    begin
      UnSel := true;
      DefSelector := false;
      ASelectedObj.ObjType := eotRepr;
    end;
    15 :
    begin
      UnSel := false;
      DefSelector := false;
      xxx_id_Ctg := AID;
      Rez := ShowWareCtgSelector(id_Bsn, xxx_id_Ctg, AName, false, false, -1);
      if Rez then
        AID := xxx_id_Ctg;
    end;
    19 :
    begin
      UnSel := false;
      DefSelector := false;
      Rez := SelectUnGroup(eotFinGroup, id_Bsn, ASelectedObj.ID, ASelectedObj.Name, false, true);
      if Rez then
      begin
        AID := ASelectedObj.ID;
        AName := ASelectedObj.Name;
      end;
    end;
    20 :
    begin
      UnSel := false;
      DefSelector := false;
      Rez := SelectUnGroup(eotWHGroup, id_Bsn, ASelectedObj.ID, ASelectedObj.Name, false, true);
      if Rez then
      begin
        AID := ASelectedObj.ID;
        AName := ASelectedObj.Name;
      end;
    end;
    21 :
    begin
      UnSel := false;
      DefSelector := false;
      Rez := SelectUnGroup(eotManufGroup, id_Bsn, ASelectedObj.ID, ASelectedObj.Name, false, true);
      if Rez then
      begin
        AID := ASelectedObj.ID;
        AName := ASelectedObj.Name;
      end;
    end;
  end;
  if UnSel then
  begin
    Rez := SelectObjUnBsn(Sender, id_Bsn, ASelectedObj, 0, [ASelectedObj.ObjType]);
    if Rez then
    begin
      AID := ASelectedObj.ID;
      AName := ASelectedObj.Name;
    end;
  end;
end;

procedure TMainForm.N62Click(Sender: TObject);
var
  ID:Variant;
  Name:string;
begin
 GetReplicatorsForm(NULL, ID, Name, False,True);
end;

procedure TMainForm.aShowAccCard_AdvExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowAccCard_Adv(AParamBlnc);
end;

procedure TMainForm.aShowMovGoodsWH_AdvExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowMovWH_Adv(AParamBlnc);
end;

procedure TMainForm.aShowBalanceArcExecute(Sender: TObject);
begin
  ShowBalanceArc;
end;

procedure TMainForm.aShowMovCA_AdvExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowMovCA_Adv(eotNone, AParamBlnc);
end;

procedure TMainForm.N97Click(Sender: TObject);
begin
  ShowOperImp(0, Null);
end;

procedure TMainForm.aReValExecute(Sender: TObject);
begin
  ShowWizReVal(Handle, null);
end;

procedure TMainForm.aShowMovCAExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowMovCA(eotNone, AParamBlnc);
end;

procedure TMainForm.DoRefrMsg(var Msg: TMessage);
begin
  RefresheArc(Msg.WParam)
end;

procedure TMainForm.N101Click(Sender: TObject);
var ID :Variant;
    S : String;
begin
  ID := Null;
  GetBusinessForm(ID, S, false, true);
end;

procedure TMainForm.Cjjotybz1Click(Sender: TObject);
begin
  ShowSMGList;
end;

procedure TMainForm.AppException(Sender: TObject; E: Exception);
var SL : TStringList;
    S : String;
    FileHandle : Integer;
begin
 // Application.OnException := nil;
  try
    S := ExtractFilePath(ParamStr(0)) + 'Error.log';
    if FileExists(S) then
    begin
      try
        FileHandle := FileOpen(S, fmOpenReadWrite or fmShareDenyNone);
      finally
        FileClose(FileHandle);
      end;
    end
    else
      FileHandle := 1;
    SL := TStringList.Create;
    try
      if FileHandle > 0 then
      begin
        if FileExists(S) then
          SL.LoadFromFile(S);
        SL.Add(E.ClassName + ' ' + DateTimeToStr(Now) + ' - ' + DM.FullFIO + ' - ' + E.Message);
        while SL.Count > 100 do
          SL.Delete(0);
        SL.SaveToFile(S);
      end;
    finally
      if (E is ESocketError) or (Pos('Windows socket error', E.Message)> 0)
      or (Pos('Variant does not reference an automation object', E.Message)> 0) then
        Application.ShowException(Exception.Create('Ошибка связи с сервером' + #13 + #10 + E.Message))
      else
        if Pos('Timeout expired', E.Message)> 0 then
          Application.ShowException(Exception.Create('Превышено время выполнения запроса к базе.' + #13 + #10 + E.Message))
        else
          Application.ShowException(E);
      SL.Free;
    end;
  except
 //   Application.OnException := AppException;
  end;
end;

procedure TMainForm.aImpOperExecute(Sender: TObject);
begin
  ShowOperImp(0, Null);
end;

procedure TMainForm.aNewRezExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.RezMode := true;
  EditOperWare(Handle, AOperParamz);
end;

procedure TMainForm.N17Click(Sender: TObject);
begin
  with TSplashForm.Create(Self, 0, true) do
    ShowModal;
end;

procedure TMainForm.aNewCorHWExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.Correct := true;
  EditOperWare(Handle, AOperParamz);
end;

procedure TMainForm.aNewCorFinExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := getEmptyOperParamz;
  AOperParamz.Correct := true;
  EditOperFin(Handle, AOperParamz);
end;

procedure TMainForm.aNewCorOffsetExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.Correct := true;
  EditOperOffset(Handle, AOperParamz);
end;

procedure TMainForm.aShowDocDictExecute(Sender: TObject);
begin
  ShowDocDict;
end;

procedure TMainForm.aShowDocListExecute(Sender: TObject);
begin
  ShowDocList(Null, 0);
end;

procedure TMainForm.N119Click(Sender: TObject);
begin
  ShowAPList;
end;

procedure TMainForm.aBsnImpExecute(Sender: TObject);
begin
  ShowBsnImp(Null, Null)
end;

procedure TMainForm.ShowText(AMessage: String; APos: integer);
begin
  if APos <= MainStatusBar.Panels.Count then
  begin
    try
      MainStatusBar.Panels[APos].Text := AMessage;
      MainStatusBar.Repaint;
    except
    end;
  end;
end;

procedure TMainForm.aShowArc_OperExecute(Sender: TObject);
begin
  ShowArc_Oper;
end;

procedure TMainForm.aShowArc201Execute(Sender: TObject);
begin
  ShowArc201
end;

procedure TMainForm.aShowWizNoDeptCAExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowWizNoDeptCA(AParamBlnc);
end;

procedure TMainForm.aShowWizNoDeptAccExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowWizNoDeptAcc(AParamBlnc);
end;

procedure TMainForm.sdf1Click(Sender: TObject);
begin
  ShowTableReIndex
end;

procedure TMainForm.aShowWizReplaceWareExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowWizReplaceWare(AParamBlnc);  
end;

procedure TMainForm.aShowCAByDateLastBayExecute(Sender: TObject);
begin
  ShowCAByDateLastBay(Null);
end;

procedure TMainForm.aShowCAPrfLossExecute(Sender: TObject);
begin
  ShowCAPrfLoss(Null);
end;

procedure TMainForm.aShowWarePrfLossExecute(Sender: TObject);
begin
  ShowWarePrfLoss(Null);
end;


procedure TMainForm.aShowBalance_V2Execute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowBalance_v2(AParamBlnc);
end;

procedure TMainForm.aA2Execute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowAccCard_v2(AParamBlnc);
end;

procedure TMainForm.aShowBJListExecute(Sender: TObject);
begin
  ShowBJList
end;

procedure TMainForm.N45Click(Sender: TObject);
begin
//*
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  ShowInvRepList(-1, Now, Now);
end;

procedure TMainForm.aInvDictExecute(Sender: TObject);
begin
  ShowInvDict(24);
end;

procedure TMainForm.aInvShowInvMainExecute(Sender: TObject);
begin
  ShowInvMain(0, 1);
end;

procedure TMainForm.aInvShowInvRepListExecute(Sender: TObject);
begin
  ShowInvRepList(-1, Now-30, Now);
end;

procedure TMainForm.aShowInvListExecute(Sender: TObject);
begin
  ShowInvList
end;

procedure TMainForm.N142Click(Sender: TObject);
begin
  ShowInvRep(-1, Now-30, Now);
end;

procedure TMainForm.N143Click(Sender: TObject);
begin
  ShowCnstItem
end;

procedure TMainForm.aShowInv_PrftExecute(Sender: TObject);
begin
  ShowInv_Prft(Null);
end;

procedure TMainForm.aShowWHAvgExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowWHAvg(AParamBlnc, true);
end;

procedure TMainForm.aShowCA_WExecute(Sender: TObject);
begin
  ShowCA_W(-1);
end;

procedure TMainForm.aShowPL_WExecute(Sender: TObject);
begin
 // raise exception.Create('Этот отчет временно отключен');
  ShowPL_W(-1);
end;

procedure TMainForm.aShowPL_VSPExecute(Sender: TObject);
begin
  ShowPL_VSP
end;

procedure TMainForm.aShowPL_RRExecute(Sender: TObject);
begin
  ShowPL_RR
end;

procedure TMainForm.aShowCust_DDDExecute(Sender: TObject);
begin
  ShowCust_DDD(1);
end;

procedure TMainForm.aShowCust_v22Execute(Sender: TObject);
begin
  ShowCust_v2(2);
end;

procedure TMainForm.aShowCust_v23Execute(Sender: TObject);
begin
  ShowCust_v2(3);

end;

procedure TMainForm.aShowCust_v24Execute(Sender: TObject);
begin
  ShowCust_v2(4);

end;

procedure TMainForm.aShowBlnBsn_EXExecute(Sender: TObject);
begin
  ShowBlnBsn(Null, Null, -1)
end;

procedure TMainForm.aANPExecute(Sender: TObject);
begin
  ShowAPNList;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  ShowAPNOper(0, -1, 24);
end;

procedure TMainForm.RxTimerEvent1Timer(Sender: TObject);
begin
  RxTimerEvent1.Enabled := false;
  try
    ShowAPNOper(0, -1, DM.DefB_APN);
  except
  end;
  RxTimerEvent1.Enabled := True;
end;

procedure TMainForm.aShowAccCard_adv_v2Execute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowAccCard_adv_v2(AParamBlnc);

end;

procedure TMainForm.aImpImpexExecute(Sender: TObject);
begin
  ShowOperImp_impex(0, Null);

end;

procedure TMainForm.aTaskExecute(Sender: TObject);
begin
  ShowTasks();
end;

procedure TMainForm.miSHImportClick(Sender: TObject);
begin
  ShowBCImp;
end;

procedure TMainForm.OnActiveFormChange(Sender: TObject);
begin
{  if (AdvOfficeMDITabSet1.Visible) and (Screen.ActiveForm <> nil) and (Screen.ActiveForm.FormStyle = fsMDIChild) then
  begin
    if AdvOfficeMDITabSet1.GetTab(Screen.ActiveForm) = nil then
    begin
      AdvOfficeMDITabSet1.AddTab(Screen.ActiveForm);
    end;
  end;   }
 { if Screen.ActiveForm <> nil then
  begin
    Screen.ActiveForm.BringToFront;
    showtext(Screen.ActiveForm.ClassName + ' ' + FormatDateTimeNull('hh:nn:ss:zzz', now), 3);
  end;  }
end;

procedure TMainForm.OnActivate(Sender: TObject);
begin
  if Screen.ActiveForm <> nil then
  begin
    Screen.ActiveForm.BringToFront;
   // showtext(Screen.ActiveForm.ClassName + ' ' + FormatDateTimeNull('hh:nn:ss:zzz', now), 3);
  end;
end;

procedure TMainForm.aShowBJList_v2Execute(Sender: TObject);
begin
 // ShowBJList_v2
end;

end.
