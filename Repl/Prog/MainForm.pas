unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Registry,
  ShellAPI, 
  tstSvccnst, Menus, ExtCtrls, StdCtrls, uDM, ComCtrls, SvcMgr, ToolWin,
  ActnList, Psock, NMpop3,
  GDSEng, inifiles, TimerLst;

const
  WM_MIDASICON    = WM_USER + 1;
  UI_INITIALIZE   = WM_MIDASICON + 1;

type

  TSvcForm = class(TForm)
    PopupMenu: TPopupMenu;
    miClose: TMenuItem;
    N1: TMenuItem;
    miProperties: TMenuItem;
    UpdateTimer: TTimer;
    ToolBar1: TToolBar;
    MainMenu1: TMainMenu;
    Afqk1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ActionList1: TActionList;
    aClose: TAction;
    NMPOP: TNMPOP3;
    Button1: TButton;
    StatusBar1: TStatusBar;
    TimerList: TRxTimerList;
    Timer1: TRxTimerEvent;
    Timer254t3q: TRxTimerEvent;
    Button2: TButton;
    ToolButton1: TToolButton;
    OpenDialog1: TOpenDialog;
    ListBox1: TListBox;
    procedure miPropertiesClick(Sender: TObject);
    procedure UpdateTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer254t3qTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    FFromService : boolean;
    FIconData: TNotifyIconData;
    FClosing : boolean;
    FTaskMessage: DWord;
    FProgmanOpen : boolean;
    FList : TList;
    FAddToLog: LogF;
    ConnectionString : String;

    Host : String;
    Password : String;
    UserID : String;

    FDateTime : TDateTime;
    procedure LoadList;
    procedure Aaaa;
    procedure DoGetMail;
  protected
    procedure UIInitialize(var Message: TMessage); message UI_INITIALIZE;
    procedure WMMIDASIcon(var Message: TMessage); message WM_MIDASICON;
    procedure AddIcon;
    procedure WndProc(var Message: TMessage); override;
    property PAddToLog : LogF read FAddToLog write FAddToLog;
  public
    procedure AppException(Sender: TObject; E: Exception);
    procedure Initialize(FromService: Boolean);
    procedure AddRDM(ADM: TGDSDM);
    procedure RemoveRDM(ADM: TGDSDM);
  end;

  TMIDASService = class(TService)
  protected
    procedure Start(Sender: TService; var Started: Boolean);
    procedure Stop(Sender: TService; var Stopped: Boolean);
  public
    function GetServiceController: TServiceController; override;
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
  end;

var
  SvcForm: TSvcForm;
  MIDASService: TMIDASService;

implementation


{$R *.DFM}
procedure TSvcForm.AddIcon;
begin
  with FIconData do
  begin
    cbSize := SizeOf(FIconData);
    Wnd := Self.Handle;
    uID := $DEDB;
    uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;
    hIcon := Forms.Application.Icon.Handle;
    uCallbackMessage := WM_MIDASICON;
    StrCopy(szTip, PChar(Caption));
  end;
  Shell_NotifyIcon(NIM_Add, @FIconData);

end;

procedure TSvcForm.AppException(Sender: TObject; E: Exception);
begin
  FEventLogger.LogMessage('Произошла ошибка ' + E.Message, EVENTLOG_ERROR_TYPE, 0, 1);
end;

procedure TSvcForm.Initialize(FromService: Boolean);

  function IE4Installed: Boolean;
  var
    RegKey: HKEY;
  begin
    Result := False;
    if RegOpenKey(HKEY_LOCAL_MACHINE, KEY_IE, RegKey) = ERROR_SUCCESS then
    try
      Result := RegQueryValueEx(RegKey, 'Version', nil, nil, nil, nil) = ERROR_SUCCESS;
    finally
      RegCloseKey(RegKey);
    end;
  end;

begin
  FFromService := FromService;
  if FromService then
  begin
    miClose.Visible := False;
    N1.Visible := False;
  end;
//  UpdateStatus;
  AddIcon;
  if IE4Installed then
    FTaskMessage := RegisterWindowMessage('TaskbarCreated') else
    UpdateTimer.Enabled := True;
end;

procedure TSvcForm.UIInitialize(var Message: TMessage);
begin
  Initialize(Message.WParam <> 0);
end;

procedure TSvcForm.WMMIDASIcon(var Message: TMessage);
var
  pt: TPoint;
begin
  case Message.LParam of
    WM_RBUTTONUP:
    begin
      if not Visible then
      begin
        SetForegroundWindow(Handle);
        GetCursorPos(pt);
        PopupMenu.Popup(pt.x, pt.y);
      end
      else
        SetForegroundWindow(Handle);
    end;
    WM_LBUTTONDBLCLK:
      if Visible then
        SetForegroundWindow(Handle) else
        miPropertiesClick(nil);
  end;
end;

procedure TSvcForm.WndProc(var Message: TMessage);
begin
  if Message.Msg = FTaskMessage then
  begin
    AddIcon;
    Refresh;
  end;
  inherited WndProc(Message);
end;

procedure TSvcForm.miPropertiesClick(Sender: TObject);
begin
  ShowModal;
end;

procedure TSvcForm.UpdateTimerTimer(Sender: TObject);
var
  Found: Boolean;
begin
//  if Visible then
//    LoadList;
end;

procedure TSvcForm.LoadList;
begin    
end;

procedure TSvcForm.AddRDM(ADM: TGDSDM);
begin
  if FList = nil then
    FList := TList.Create;
  FList.Add(ADM);
//  LoadList;
end;

procedure TSvcForm.RemoveRDM(ADM: TGDSDM);
var N : integer;
begin
  if FList <> nil then
  begin
    N := FList.IndexOf(ADM);
    if N > -1 then
      FList.Delete(N);
//    LoadList;
  end;
end;

procedure TSvcForm.FormShow(Sender: TObject);
begin
  LoadList;
//  DoGetMail;
  FDateTime := Now;
  Timer1.Enabled := true;
end;

procedure TSvcForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
end;

{ TMIDASService }

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  MIDASService.Controller(CtrlCode);
end;

constructor TMIDASService.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  inherited CreateNew(AOwner, Dummy);
  AllowPause := False;
  Interactive := True;
  DisplayName := SApplicationName;
  Name := SServiceName;
  OnStart := Start;
  OnStop := Stop;
end;

function TMIDASService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TMIDASService.Start(Sender: TService; var Started: Boolean);
begin
  PostMessage(SvcForm.Handle, UI_INITIALIZE, 1, 0);
  Started := True;
end;

procedure TMIDASService.Stop(Sender: TService; var Stopped: Boolean);
begin
  PostMessage(SvcForm.Handle, WM_QUIT, 0, 0);
  Stopped := True;
end;

procedure TSvcForm.FormDestroy(Sender: TObject);
begin
  Shell_NotifyIcon(NIM_DELETE, @FIconData);
end;

procedure TSvcForm.ToolButton1Click(Sender: TObject);
begin
  LoadList;  
end;

procedure TSvcForm.aCloseExecute(Sender: TObject);
begin
  FClosing := True;
  Shell_NotifyIcon(NIM_DELETE, @FIconData);
  Close;
end;

procedure TSvcForm.Aaaa;
begin
end;

procedure AddToLog(LogType : TLogType; S : String);
begin
  with SvcForm do
  begin
    ListBox1.Items.BeginUpdate;
    try
      ListBox1.Items.InsertObject(0, FormatDateTime('yyyy-mm-dd hh:nn', Now) + ' - ' + S, Pointer(LogType));
      if ListBox1.Items.Count > 100 then
        ListBox1.Items.Delete(ListBox1.Items.Count - 1);
    finally
      ListBox1.Items.EndUpdate;
    end;
  end;
end;

procedure TSvcForm.DoGetMail;
begin
  Timer1.Enabled := false;
//  Timer2.Enabled := false;
  Button1.Enabled := false;
  StatusBar1.SimpleText := 'Идет проверка почты...';
  try
    GetMail(AddToLog, ConnectionString, Host, Password, UserID);
  finally
    Button1.Enabled := True;
    Timer1.Enabled := True;
//    Timer2.Enabled := True;
  end;
  FDateTime := Now;
end;


procedure TSvcForm.Button1Click(Sender: TObject);
begin
  DoGetMail;
end;


procedure TSvcForm.FormCreate(Sender: TObject);
var
    IniFile : TIniFile;
    S, FBaseName, FUser, FPsw : String;
begin
// ****************************************************************************
  S := ParamStr(0);
  S := ExpandFileName(S);
  Delete(S, Length(S) - 2, 3);
  S := S + 'ini';
  if  FileExists(S) then
  begin
    IniFile := TIniFile.Create(S);
    with IniFile do
    begin
      FBaseName := ReadString('Base', 'DB', 'OVK\TESTSQL');
      FUser := ReadString('Base', 'User', '');
      FPsw := ReadString('Base', 'Psw', '');

      Host := ReadString('Base', 'Host', 'mail.webtours.ru');
      Password := ReadString('Base', 'Password', 'sdg');
      UserID := ReadString('Base', 'UserID', 'gds');
    end;
    IniFile.Free;
  end;
  ConnectionString := 'Provider=SQLOLEDB.1;Password="' +
     FPsw + '";Persist Security Info=True;User ID=' +
     FUser + ';Initial Catalog=FOBase;Data Source=' + FBaseName +
                        ';Use Procedure for Prepare=1;Auto Translate=True;Application Name=' + SServiceName + '4.0;Packet Size=4096;';
// ****************************************************************************
end;

procedure TSvcForm.Timer254t3qTimer(Sender: TObject);
begin
//  StatusBar1.SimpleText := 'С момента проверки прошло ' + FormatDateTime('hh:nn:ss', Now - FDateTime);
end;

procedure TSvcForm.Timer1Timer(Sender: TObject);
begin
  DoGetMail;
end;

procedure TSvcForm.Button2Click(Sender: TObject);
var SLHead : TStringList;
    SLBody : TStringList;
begin
  if OpenDialog1.Execute then
  begin
    SLHead := TStringList.Create;
    SLBody := TStringList.Create;
    SLBody.LoadFromFile(OpenDialog1.FileName);
    try
      DoMailW(SLHead, SLBody, AddToLog, ConnectionString);
    finally
      SLHead.Free;
      SLBody.Free;
    end;
  end;
end;

procedure TSvcForm.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  if Index <> -1 then
    if TLogType(ListBox1.Items.Objects[Index]) = ltError then
    begin
      ListBox1.Canvas.Font.Color := clRed;
      ListBox1.Canvas.Font.Style := ListBox1.Canvas.Font.Style + [fsBold];
//      ListBox1.Canvas.FillRect(Rect);
    end;
  ListBox1.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 1, ListBox1.Items[Index]);
end;

end.
