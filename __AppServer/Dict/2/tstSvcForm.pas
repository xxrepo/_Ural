unit tstSvcForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Registry,
  ShellAPI, 
  tstSvccnst, Menus, ExtCtrls, StdCtrls, uDM, ComCtrls, SvcMgr, ToolWin;

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
    ListView1: TListView;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    procedure miCloseClick(Sender: TObject);
    procedure miPropertiesClick(Sender: TObject);
    procedure UpdateTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    FFromService : boolean;
    FIconData: TNotifyIconData;
    FClosing : boolean;
    FTaskMessage: DWord;
    FProgmanOpen : boolean;
    FList : TList;
    procedure LoadList;
  protected
    procedure UIInitialize(var Message: TMessage); message UI_INITIALIZE;
    procedure WMMIDASIcon(var Message: TMessage); message WM_MIDASICON;
    procedure AddIcon;
    procedure WndProc(var Message: TMessage); override;
  public
    procedure AppException(Sender: TObject; E: Exception);
    procedure Initialize(FromService: Boolean);
    procedure AddRDM(ADM: TDMKM);
    procedure RemoveRDM(ADM: TDMKM);
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
  FEventLogger.LogMessage('��������� ������ ' + E.Message, EVENTLOG_ERROR_TYPE, 0, 1);
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

procedure TSvcForm.miCloseClick(Sender: TObject);
begin
  FClosing := True;
  Shell_NotifyIcon(NIM_DELETE, @FIconData);
  Close;
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
var i : integer;
    Item: TListItem;
begin    
  if FList <> nil then
  begin
    ListView1.Items.BeginUpdate;
    ListView1.Items.Clear;
    try
      for i := 0 to FList.Count - 1 do
      begin
        Item := ListView1.Items.Add;
        if TDMKM(FList[Item.Index]).UserName = '' then
          Item.SubItems.Add('��������')
        else
          Item.SubItems.Add(TDMKM(FList[Item.Index]).FullFIO + ' (' + TDMKM(FList[Item.Index]).UserName + ')');
        Item.SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', TDMKM(FList[Item.Index]).CreateDate));
      end;
    finally
      ListView1.Items.EndUpdate;
    end;
  end;
end;

procedure TSvcForm.AddRDM(ADM: TDMKM);
begin
  if FList = nil then
    FList := TList.Create;
  FList.Add(ADM);
//  LoadList;
end;

procedure TSvcForm.RemoveRDM(ADM: TDMKM);
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
end;

procedure TSvcForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListView1.Items.Clear;
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

end.
