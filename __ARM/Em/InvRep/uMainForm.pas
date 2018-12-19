unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ComCtrls, StdCtrls,
  RXSpin,
  ActnList, ImgList, RXCtrls, ToolWin, Tabs, foMyFunc;

type
  TMainForm = class(TForm)
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
    procedure N8Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure Tile1Click(Sender: TObject);
    procedure ArrangeAll1Click(Sender: TObject);
    procedure Ds1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure N17Click(Sender: TObject);
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
    procedure ColorForm(Sender: TObject);
    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
    procedure STMessage(var Message: TMessage); message WM_ShowText;
    procedure ShowText(AMessage : String; APos : integer = 1);
  end;

var
  MainForm: TMainForm;

implementation

uses uInvMain, uInvRepList, uInvDict, uInvList,
  uInvRep, uDM, uSplashForm;

{$R *.DFM}

procedure TMainForm.STMessage(var Message: TMessage);
var S : String;
begin
  ShowText(PChar(Message.WParam), Message.LParam);
end;

procedure TMainForm.FormCreate(Sender: TObject);
var i : integer;
    MI, MI2 : TMenuItem;
begin


  MainFormHandle := Handle;
  aNewRez.Visible := DM.FMayRez;
  MainStatusBar.Panels[0].Text := 'Пользователь: ' + DM.FullFIO;


  Application.OnException := AppException;

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

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageBox(Handle, 'Завершать работу с программой?', Pchar(Application.Title), MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idYes then
    Action := caFree
  else
    Action := caNone;
end;

procedure TMainForm.FormShow(Sender: TObject);
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

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TMainForm.ColorForm(Sender: TObject);
begin
end;

procedure TMainForm.TabSet1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  if MDIChildren[NewTab] <> ActiveMDIChild then
    MDIChildren[NewTab].BringToFront;
end;


procedure TMainForm.DoRefrMsg(var Msg: TMessage);
begin
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

procedure TMainForm.N17Click(Sender: TObject);
begin
  with TSplashForm.Create(Self, 0, true) do
    ShowModal;
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

end.
