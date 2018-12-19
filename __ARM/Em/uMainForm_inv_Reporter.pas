unit uMainForm_inv_Reporter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ComCtrls, StdCtrls,
  RXSpin,
  ActnList, ImgList, RXCtrls, ToolWin, Tabs, foMyFunc;

type
  TMainForm_inv_Reporter = class(TForm)
    MainMenu1: TMainMenu;
    miWindow: TMenuItem;
    ArrangeAll1: TMenuItem;
    Cascade1: TMenuItem;
    Tile1: TMenuItem;
    N8: TMenuItem;
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
    aOperViza: TAction;
    aShowNewObj: TAction;
    aShowOperBuff: TAction;
    aShowBalance: TAction;
    miRep: TMenuItem;
    aMes: TAction;
    aShowCurrencyList: TAction;
    aShowRateUpdater: TAction;
    aShowURLList: TAction;
    aShowBlnBsn: TAction;
    aShowAccCard: TAction;
    aShowFormalDict: TAction;
    aShowFuncDict: TAction;
    aShowFltList: TAction;
    aShowMovWH: TAction;
    aShowMovService: TAction;
    aEditOperFin_FFF: TAction;
    aEditOperWare_FFF: TAction;
    aEditOperService_FFF: TAction;
    aShowDelOperList: TAction;
    aShowCorrOperList: TAction;
    aShowHasVizaOperList: TAction;
    aShowEmptyOperList: TAction;
    aShowMinusOperList: TAction;
    aShowNotHasVizaOperList: TAction;
    aShowZatrataOperList: TAction;
    aShowPribilOperList: TAction;
    aShowFogetOperList: TAction;
    aShowSelfOperList: TAction;
    aEditFilter: TAction;
    aShowRateHist: TAction;
    aShowExtData: TAction;
    aShowRateOperList: TAction;
    aShowAccCard_Adv: TAction;
    aShowMovGoodsWH_Adv: TAction;
    aShowBalanceArc: TAction;
    aShowMovCA_Adv: TAction;
    MainStatusBar: TStatusBar;
    aReVal: TAction;
    N98: TMenuItem;
    N99: TMenuItem;
    aShowMovCA: TAction;
    aImpOper: TAction;
    N13: TMenuItem;
    N14: TMenuItem;
    Action2: TAction;
    Action3: TAction;
    aNewRez: TAction;
    N15: TMenuItem;
    PopupMenu2: TPopupMenu;
    aNewCorHW: TAction;
    aNewCorFin: TAction;
    aNewCorOffset: TAction;
    N21: TMenuItem;
    N34: TMenuItem;
    N63: TMenuItem;
    N102: TMenuItem;
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
    aShowDocList: TAction;
    aBsnImp: TAction;
    aShowArc_Oper: TAction;
    aShowArc201: TAction;
    aShowWizNoDeptCA: TAction;
    N124: TMenuItem;
    N125: TMenuItem;
    aShowWizNoDeptAcc: TAction;
    N126: TMenuItem;
    aShowWizReplaceWare: TAction;
    N128: TMenuItem;
    aShowCAByDateLastBay: TAction;
    aShowCAPrfLoss: TAction;
    aShowWarePrfLoss: TAction;
    aShowBalance_V2: TAction;
    aA2: TAction;
    aaa: TAction;
    aShowBJList: TAction;
    aInvDict: TAction;
    aInvShowInvMain: TAction;
    aInvShowInvRepList: TAction;
    N139: TMenuItem;
    aShowInvList: TAction;
    N19: TMenuItem;
    N142: TMenuItem;
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
  private
    procedure AppException(Sender: TObject; E: Exception);
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
  MainForm_inv_Reporter: TMainForm_inv_Reporter;

implementation

uses uInvMain, uInvRepList, uInvDict, uInvList,
  uInvRep;

{$R *.DFM}

procedure TMainForm_inv_Reporter.STMessage(var Message: TMessage);
var S : String;
begin
  ShowText(PChar(Message.WParam), Message.LParam);
end;

procedure TMainForm_inv_Reporter.FormCreate(Sender: TObject);
var i : integer;
    MI, MI2 : TMenuItem;
begin


  MainFormHandle := Handle;
  aNewRez.Visible := DM.FMayRez;
  MainStatusBar.Panels[0].Text := 'Пользователь: ' + DM.FullFIO;


  Application.OnException := AppException;

end;

procedure TMainForm_inv_Reporter.N10Click(Sender: TObject);
var
  ID:Variant;
  Name:string;
begin
 GetGroupsForm(ID, Name, False,True);

end;

procedure TMainForm_inv_Reporter.N11Click(Sender: TObject);
var
  ID:Variant;
  Name:string;
begin
 GetUsersForm(ID, Name, False,True);

end;

procedure TMainForm_inv_Reporter.N8Click(Sender: TObject);
var i : integer;
begin
  for i := 0 to MDIChildCount - 1 do
    MDIChildren[i].WindowState := wsMinimized;
end;

procedure TMainForm_inv_Reporter.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm_inv_Reporter.Tile1Click(Sender: TObject);
begin
  Tile;
end;

procedure TMainForm_inv_Reporter.ArrangeAll1Click(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TMainForm_inv_Reporter.Ds1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm_inv_Reporter.aArcExecute(Sender: TObject);
begin
  ShowArc(Null, Null);
end;

procedure TMainForm_inv_Reporter.aCatExecute(Sender: TObject);
begin
  ShowEForm(-13, false);
end;

procedure TMainForm_inv_Reporter.aNewWHExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperWare(Handle, AOperParamz);
end;

procedure TMainForm_inv_Reporter.aNewFinExecute(Sender: TObject);
var
    AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperFin(Handle, AOperParamz);
end;

procedure TMainForm_inv_Reporter.aNewZacExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperOffset(Handle, AOperParamz);
end;

procedure TMainForm_inv_Reporter.aNewEmptyExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperEmpty(Handle, AOperParamz);
end;

procedure TMainForm_inv_Reporter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageBox(Handle, 'Завершать работу с программой?', Pchar(Application.Title), MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idYes then
    Action := caFree
  else
    Action := caNone;
end;

procedure TMainForm_inv_Reporter.aShowNewObjExecute(Sender: TObject);
begin
  ShowNewObj;
end;

procedure TMainForm_inv_Reporter.aShowOperBuffExecute(Sender: TObject);
begin
  ShowOperBuff;
end;

procedure TMainForm_inv_Reporter.aShowBalanceExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
//  AParamBlnc.id_ContrAgent := 60; //1013
 // AParamBlnc.HasViza := true;
  ShowBalance(AParamBlnc);
end;

procedure TMainForm_inv_Reporter.aMesExecute(Sender: TObject);
var
  ID:Variant;
  Name:string;
begin
 GetMeasuresForm(NULL, ID, Name, False,True);
end;

procedure TMainForm_inv_Reporter.aShowCurrencyListExecute(Sender: TObject);
begin
  ShowCurrencyList(Null, Null, Null);
end;

procedure TMainForm_inv_Reporter.aShowRateUpdaterExecute(Sender: TObject);
begin
  ShowRateUpdater;
end;

procedure TMainForm_inv_Reporter.aShowURLListExecute(Sender: TObject);
begin
  ShowURLList;
end;

procedure TMainForm_inv_Reporter.FormShow(Sender: TObject);
var S : String;
begin            
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
end;

procedure TMainForm_inv_Reporter.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TMainForm_inv_Reporter.aShowBlnBsnExecute(Sender: TObject);
begin
  ShowBlnBsn(Null, Null);
end;

procedure TMainForm_inv_Reporter.N33Click(Sender: TObject);
begin
  ChangeStng;
end;

procedure TMainForm_inv_Reporter.N37Click(Sender: TObject);
begin
  ShowCurrencyList_old(Null, Null, Null);
end;

procedure TMainForm_inv_Reporter.aShowAccCardExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowAccCard(AParamBlnc);
end;

procedure TMainForm_inv_Reporter.N42Click(Sender: TObject);
begin
  ShowOperDay;
end;

procedure TMainForm_inv_Reporter.aShowFormalDictExecute(Sender: TObject);
begin
  ShowFormalDict;
end;

procedure TMainForm_inv_Reporter.aShowFuncDictExecute(Sender: TObject);
begin
  ShowFuncDict;
end;

procedure TMainForm_inv_Reporter.aShowFltListExecute(Sender: TObject);
begin
  ShowFltList(DoSelectObjEvent);
end;

procedure TMainForm_inv_Reporter.aShowMovWHExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowMovWH(AParamBlnc, true);
end;

procedure TMainForm_inv_Reporter.aEditOperFin_FFFExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperFin_FFF(Handle, AOperParamz);
end;

procedure TMainForm_inv_Reporter.aEditOperWare_FFFExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperWare_FFF(Handle, AOperParamz);
end;

procedure TMainForm_inv_Reporter.aShowDelOperListExecute(Sender: TObject);
begin
  ShowDelOperList;
end;

procedure TMainForm_inv_Reporter.aShowCorrOperListExecute(Sender: TObject);
begin
  ShowCorrOperList;
end;

procedure TMainForm_inv_Reporter.aShowHasVizaOperListExecute(Sender: TObject);
begin
  ShowHasVizaOperList;
end;

procedure TMainForm_inv_Reporter.aShowEmptyOperListExecute(Sender: TObject);
begin
  ShowEmptyOperList;
end;

procedure TMainForm_inv_Reporter.aShowMinusOperListExecute(Sender: TObject);
begin
  ShowMinusOperList;
end;

procedure TMainForm_inv_Reporter.aShowNotHasVizaOperListExecute(Sender: TObject);
begin
  ShowNotHasVizaOperList;
end;

procedure TMainForm_inv_Reporter.aShowZatrataOperListExecute(Sender: TObject);
begin
  ShowZatrataOperList;
end;

procedure TMainForm_inv_Reporter.aShowPribilOperListExecute(Sender: TObject);
begin
  ShowPribilOperList;
end;

procedure TMainForm_inv_Reporter.aShowFogetOperListExecute(Sender: TObject);
begin
  ShowFogetOperList;
end;

procedure TMainForm_inv_Reporter.aShowSelfOperListExecute(Sender: TObject);
begin
  ShowSelfOperList;
end;

procedure TMainForm_inv_Reporter.aEditFilterExecute(Sender: TObject);
var ID : integer;
begin
  ID := -1;
  EditFilter(DM.rsFlt, 1, DM.IDUser, 0, ID, DoSelectObjEvent, [ufsObjView, ufsCondList, ufsMayChangeCond]);
end;

procedure TMainForm_inv_Reporter.aShowRateHistExecute(Sender: TObject);
begin
  ShowRateHist;
end;

procedure TMainForm_inv_Reporter.aShowExtDataExecute(Sender: TObject);
begin
  ShowExtData;
end;

procedure TMainForm_inv_Reporter.aShowRateOperListExecute(Sender: TObject);
begin
  ShowRateOperList;
end;

procedure TMainForm_inv_Reporter.PopupMenu1Change(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
  tag := 0;
end;


procedure TMainForm_inv_Reporter.ColorForm(Sender: TObject);
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

procedure TMainForm_inv_Reporter.TabSet1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  if MDIChildren[NewTab] <> ActiveMDIChild then
    MDIChildren[NewTab].BringToFront;
end;

procedure TMainForm_inv_Reporter.DoSelectObjEvent(Sender: TObject; var AID: integer;
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

procedure TMainForm_inv_Reporter.N62Click(Sender: TObject);
var
  ID:Variant;
  Name:string;
begin
 GetReplicatorsForm(NULL, ID, Name, False,True);
end;

procedure TMainForm_inv_Reporter.aShowAccCard_AdvExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowAccCard_Adv(AParamBlnc);
end;

procedure TMainForm_inv_Reporter.aShowMovGoodsWH_AdvExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowMovWH_Adv(AParamBlnc);
end;

procedure TMainForm_inv_Reporter.aShowBalanceArcExecute(Sender: TObject);
begin
  ShowBalanceArc;
end;

procedure TMainForm_inv_Reporter.aShowMovCA_AdvExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowMovCA_Adv(eotNone, AParamBlnc);
end;

procedure TMainForm_inv_Reporter.N97Click(Sender: TObject);
begin
  ShowOperImp(0, Null);
end;

procedure TMainForm_inv_Reporter.aReValExecute(Sender: TObject);
begin
  ShowWizReVal(Handle, null);
end;

procedure TMainForm_inv_Reporter.aShowMovCAExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowMovCA(eotNone, AParamBlnc);
end;

procedure TMainForm_inv_Reporter.DoRefrMsg(var Msg: TMessage);
begin
  RefresheArc(Msg.WParam)
end;

procedure TMainForm_inv_Reporter.N101Click(Sender: TObject);
var ID :Variant;
    S : String;
begin
  ID := Null;
  GetBusinessForm(ID, S, false, true);
end;

procedure TMainForm_inv_Reporter.Cjjotybz1Click(Sender: TObject);
begin
  ShowSMGList;
end;

procedure TMainForm_inv_Reporter.AppException(Sender: TObject; E: Exception);
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
        SL.Add(DateTimeToStr(Now) + ' - ' + DM.FullFIO + ' - ' + E.Message);
        while SL.Count > 100 do
          SL.Delete(0);
        SL.SaveToFile(S);
      end;
    finally
      Application.ShowException(E);
      SL.Free;
    end;
  except
 //   Application.OnException := AppException;
  end;
end;

procedure TMainForm_inv_Reporter.aImpOperExecute(Sender: TObject);
begin
  ShowOperImp(0, Null);
end;

procedure TMainForm_inv_Reporter.aNewRezExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.RezMode := true;
  EditOperWare(Handle, AOperParamz);
end;

procedure TMainForm_inv_Reporter.N17Click(Sender: TObject);
begin
  with TSplashForm.Create(Self, 0, true) do
    ShowModal;
end;

procedure TMainForm_inv_Reporter.aNewCorHWExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.Correct := true;
  EditOperWare(Handle, AOperParamz);
end;

procedure TMainForm_inv_Reporter.aNewCorFinExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := getEmptyOperParamz;
  AOperParamz.Correct := true;
  EditOperFin(Handle, AOperParamz);
end;

procedure TMainForm_inv_Reporter.aNewCorOffsetExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.Correct := true;
  EditOperOffset(Handle, AOperParamz);
end;

procedure TMainForm_inv_Reporter.aShowDocDictExecute(Sender: TObject);
begin
  ShowDocDict;
end;

procedure TMainForm_inv_Reporter.aShowDocListExecute(Sender: TObject);
begin
  ShowDocList(Null, 0);
end;

procedure TMainForm_inv_Reporter.N119Click(Sender: TObject);
begin
  ShowAPList;
end;

procedure TMainForm_inv_Reporter.aBsnImpExecute(Sender: TObject);
begin
  ShowBsnImp(Null, Null)
end;

procedure TMainForm_inv_Reporter.ShowText(AMessage: String; APos: integer);
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

procedure TMainForm_inv_Reporter.aShowArc_OperExecute(Sender: TObject);
begin
  ShowArc_Oper;
end;

procedure TMainForm_inv_Reporter.aShowArc201Execute(Sender: TObject);
begin
  ShowArc201
end;

procedure TMainForm_inv_Reporter.aShowWizNoDeptCAExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowWizNoDeptCA(AParamBlnc);
end;

procedure TMainForm_inv_Reporter.aShowWizNoDeptAccExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowWizNoDeptAcc(AParamBlnc);
end;

procedure TMainForm_inv_Reporter.sdf1Click(Sender: TObject);
begin
  ShowTableReIndex
end;

procedure TMainForm_inv_Reporter.aShowWizReplaceWareExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowWizReplaceWare(AParamBlnc);  
end;

procedure TMainForm_inv_Reporter.aShowCAByDateLastBayExecute(Sender: TObject);
begin
  ShowCAByDateLastBay(Null);
end;

procedure TMainForm_inv_Reporter.aShowCAPrfLossExecute(Sender: TObject);
begin
  ShowCAPrfLoss(Null);
end;

procedure TMainForm_inv_Reporter.aShowWarePrfLossExecute(Sender: TObject);
begin
  ShowWarePrfLoss(Null);
end;


procedure TMainForm_inv_Reporter.aShowBalance_V2Execute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowBalance_v2(AParamBlnc);
end;

procedure TMainForm_inv_Reporter.aA2Execute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  ShowAccCard_v2(AParamBlnc);
end;

procedure TMainForm_inv_Reporter.aShowBJListExecute(Sender: TObject);
begin
  ShowBJList
end;

procedure TMainForm_inv_Reporter.N45Click(Sender: TObject);
begin
//*
end;

procedure TMainForm_inv_Reporter.Button2Click(Sender: TObject);
begin
  ShowInvRepList(-1, Now, Now);
end;

procedure TMainForm_inv_Reporter.aInvDictExecute(Sender: TObject);
begin
  ShowInvDict(24);
end;

procedure TMainForm_inv_Reporter.aInvShowInvMainExecute(Sender: TObject);
begin
  ShowInvMain(0, 1);
end;

procedure TMainForm_inv_Reporter.aInvShowInvRepListExecute(Sender: TObject);
begin
  ShowInvRepList(-1, Now-30, Now);
end;

procedure TMainForm_inv_Reporter.aShowInvListExecute(Sender: TObject);
begin
  ShowInvList
end;

procedure TMainForm_inv_Reporter.N142Click(Sender: TObject);
begin
  ShowInvRep(-1, Now-30, Now);
end;

end.
