unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Registry,
  ShellAPI, 
  Menus, ExtCtrls, StdCtrls, ComCtrls, SvcMgr, ToolWin,
  ActnList, Psock, NMpop3,
  inifiles, TimerLst, Db, DBClient, MConnect, SConnect, ADODB, RealThread, ActiveX;

const
  WM_MIDASICON    = WM_USER + 1;
  UI_INITIALIZE   = WM_MIDASICON + 1;
  WM_ShowText = WM_User + 5895;
  WM_AddToLog = WM_User + 5896;
  WM_DoLog = WM_User + 5899;
type
  TLogType = (ltNone, ltOK, ltError, ltWarning);

  TSvcForm = class(TForm)
    PopupMenu: TPopupMenu;
    miClose: TMenuItem;
    N1: TMenuItem;
    miProperties: TMenuItem;
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
    OpenDialog1: TOpenDialog;
    ListBox1: TListBox;
    N5: TMenuItem;
    Button2: TButton;
    N6: TMenuItem;
    N7: TMenuItem;
    ADOConnection1: TADOConnection;
    RealThread1: TRealThread;
    Button3: TButton;
    ToolButton1: TToolButton;
    ListBox2: TListBox;
    miStng: TMenuItem;
    procedure miPropertiesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer254t3qTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RealThread1Start(Sender: TObject);
    procedure RealThread1End(Sender: TObject; ErrorInThreadProc: Boolean);
    procedure RealThread1DoInThread(Sender: TObject);
    procedure RealThread1ThreadProcException(Sender: TObject;
      AMessage: String);
    procedure miStngClick(Sender: TObject);
  private
    FFromService : boolean;
    FIconData: TNotifyIconData;
    FClosing : boolean;
    FTaskMessage: DWord;
    FProgmanOpen : boolean;
    FList : TList;

    Password : String;
    UserID, FHost, FPort,
      FremServer, FRemPsw, FRemDBName : String;
    FID_Rep : integer;
    FPeriod : integer;




    FDateTime : TDateTime;
    procedure LoadList;
    procedure AppMinimize(Sender: TObject);
    procedure MakeReplication(ASaveCDS : boolean = false);
    procedure MakeClear;
    function GetID_Rep: integer;

    function GetDM : Pointer;
    procedure ShowText2(S: String);
    procedure AddToLog2(LogType: TLogType; S: String);
    function GetConnPar(var AServer, APort, ASvrPsw, ASvrName, ABaseName, ABaseUserName,
      ABasePassword, ACatalog,
      AremServer, ARemPsw, ARemDBName: String; var APeriod: integer): boolean;
    procedure DoLog(AText: String);
  protected
    procedure UIInitialize(var Message: TMessage); message UI_INITIALIZE;
    procedure WMMIDASIcon(var Message: TMessage); message WM_MIDASICON;
    procedure AddIcon;
    procedure WndProc(var Message: TMessage); override;
  public
    sssCNT : String;
    procedure DoReplication(ASaveCDS : boolean = false);
    procedure STMessage(var Message: TMessage); message WM_ShowText;
    procedure STAddToLog(var Message: TMessage); message WM_AddToLog;
    procedure STDoLog(var Message: TMessage); message WM_DoLog;

    property ID_Rep : integer read GetID_Rep;
    procedure AppException(Sender: TObject; E: Exception);
    procedure Initialize(FromService: Boolean);
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

      xxxDBPassword, xxxDBUserName, xxxDBBaseName, xxxCatalog : String;

implementation

uses uEventLogger, uSvccnst, SyncForm, uDM, uSettings, uMeCrpt;


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
//  DoReplication;

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

procedure TSvcForm.LoadList;
begin    
end;

procedure TSvcForm.FormShow(Sender: TObject);
begin
  LoadList;
//  DoGetMail;
end;

procedure TSvcForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree;
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
//  if FClosing then
  if RealThread1.InUse then
    RealThread1.Terminate;
    Shell_NotifyIcon(NIM_DELETE, @FIconData);
end;

procedure TSvcForm.ToolButton1Click(Sender: TObject);
begin
  LoadList;  
end;

procedure TSvcForm.aCloseExecute(Sender: TObject);
begin
  Timer1.Enabled := false;
  Timer254t3q.Enabled := false;
  FClosing := True;
  Shell_NotifyIcon(NIM_DELETE, @FIconData);
  Close;
//  Free;
end;

procedure TSvcForm.AddToLog2(LogType : TLogType; S : String);
begin
//  with SvcForm do
  begin
    ListBox1.Items.BeginUpdate;
    try
      ListBox1.Items.InsertObject(0, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' - ' + S, Pointer(LogType));
      if ListBox1.Items.Count > 100 then
        ListBox1.Items.Delete(ListBox1.Items.Count - 1);
    finally
      if ListBox1.Items.Count > 0 then
        ListBox1.ItemIndex := 0;
      ListBox1.Items.EndUpdate;
    end;
  end;
end;

procedure TSvcForm.ShowText2(S : String);
begin
//  with SvcForm do
  begin
    try
      StatusBar1.Panels[0].Text := S;
      Repaint;
    finally
    end;
  end;
end;

procedure TSvcForm.DoReplication(ASaveCDS : boolean);
begin
  if FHost = '' then
  begin
    miStng.Click;
    Exit;
  end;
  Screen.Cursor := crSQLWait;
  Timer1.Interval := FPeriod;
  Timer1.Enabled := false;
  Timer254t3q.Enabled := false;
  Button1.Enabled := false;
//  StatusBar1.Panels[1].Text := 'Идет обновление данных...';
  try
    MakeReplication;
  finally
    Screen.Cursor := crDefault;
    Button1.Enabled := True;
    Timer1.Enabled := POS('_SE', CmdLine) = 0;
    Timer254t3q.Enabled := POS('_SE', CmdLine) = 0;
    FDateTime := Now;

  end;
 // ListBox2.Items.Add(IntToStr(AllocMemSize));
end;



procedure TSvcForm.FormCreate(Sender: TObject);
var
    IniFile : TIniFile;
    S : String;
begin
  Afqk1.Visible := POS('_SE', CmdLine) = 0;
  
  sssCNT := '';
  if Forms.Application <> nil then
    Forms.Application.OnException := AppException;
  if Forms.Application <> nil then
    Forms.Application.OnMinimize := AppMinimize;
// ****************************************************************************
  S := ParamStr(0);
  S := ExpandFileName(S);
  Delete(S, Length(S) - 2, 3);
  S := S + 'ini';
  Password := 'gopasneg';
  UserID := 'sneg';

  FPort := '211';
  FHost := '212.119.47.74';

  xxxDBPassword := '1013';
  xxxDBUserName := 'SA';
  xxxDBBaseName := 'BD';
  xxxCatalog := 'ACS_LcBase';

  FPeriod := 60*60000;
  if GetConnPar(FHost, FPort, Password, UserID, xxxDBBaseName, xxxDBUserName, xxxDBPassword, xxxCatalog,
      FremServer, FRemPsw, FRemDBName, FPeriod) then
  begin
    if FHost = '' then
      miStng.Click;
  end
  else
    miStng.Click;
// ****************************************************************************
end;

function TSvcForm.GetConnPar(var AServer, APort, ASvrPsw, ASvrName, ABaseName, ABaseUserName,
      ABasePassword, ACatalog,
      AremServer, ARemPsw, ARemDBName: String; var APeriod: integer) : boolean;
var
    IniFile : TIniFile;
    S : String;
    SL : TStrings;
begin
// ****************************************************************************
  Result := false;
  S := ParamStr(0);
  S := ExpandFileName(S);
  Delete(S, Length(S) - 2, 3);
  S := S + 'Key' + sssCNT;

  if  FileExists(S) then
  begin
    SL := TStringList.Create;
    try
      SL.Text := FileToStr(S);
      with SL do
      begin
        ABaseName := Values['DB'];
        S := Values['Period'];
        if S <> '' then
          APeriod := StrToInt(S)
        else
          APeriod := 60;
        APeriod := APeriod*60000;

        AServer := Values['Host'];
        APort := Values['Port'];
        ASvrPsw := Values['Password'];
        ASvrName := Values['UserID'];

        ABaseName := Values['xxxDBBaseName'];
        ABaseUserName := Values['xxxDBUserName'];
        ABasePassword := Values['xxxDBPassword'];
        ACatalog := Values['xxxCatalog'];

        AremServer := Values['AremServer'];
        ARemPsw := Values['ARemPsw'];
        ARemDBName := Values['ARemDBName'];

        Result := true;
      end;
    finally
      SL.Free;
    end;
  end
  else
  begin
    S := ParamStr(0);
    S := ExpandFileName(S);
    Delete(S, Length(S) - 2, 3);
    S := S + 'ini';
    if sssCNT <> '' then
      S := StringReplace(S, '.', sssCNT + '.' , []);
    if FileExists(S) then
    begin
      IniFile := TIniFile.Create(S);
      with IniFile do
      begin
        APeriod := ReadInteger('Base', 'Period', 60);
        APeriod := APeriod*60000;

        AServer := ReadString('Base', 'Host', 'OVK');
        APort := ReadString('Base', 'Port', '211');
        ASvrPsw := ReadString('Base', 'Password', '211');
        ASvrName := ReadString('Base','UserID', '');

        ABaseName := ReadString('Base', 'xxxDBBaseName', 'server');
        ABaseUserName := ReadString('Base', 'xxxDBUserName', 'sa');
        ABasePassword := ReadString('Base', 'xxxDBPassword', 'iwanttobelive');

        ACatalog := ReadString('Base', 'xxxCatalog', 'ACS_LcBase');

        AremServer := ReadString('Base', 'AremServer', '');
        ARemPsw := ReadString('Base', 'ARemPsw', '');
        ARemDBName := ReadString('Base', 'ARemDBName', 'ACS_MBase');

      end;
      IniFile.Free;
      Result := true;
    end;
  end;
// ****************************************************************************
end;


procedure TSvcForm.Timer254t3qTimer(Sender: TObject);
begin
  if FDateTime > 0 then
    StatusBar1.Panels[0].Text := 'С момента проверки прошло ' + FormatDateTime('hh:nn:ss', Now - FDateTime)
  else
    StatusBar1.Panels[0].Text := 'Обновление не проводилось';
end;

procedure TSvcForm.Timer1Timer(Sender: TObject);
begin
  DoReplication;
end;

procedure TSvcForm.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  if Index <> -1 then
  begin
    if TLogType(ListBox1.Items.Objects[Index]) = ltError then
    begin
      ListBox1.Canvas.Font.Color := clRed;
      ListBox1.Canvas.Font.Style := ListBox1.Canvas.Font.Style + [fsBold];
    end;
    if TLogType(ListBox1.Items.Objects[Index]) = ltWarning then
    begin
      ListBox1.Canvas.Font.Style := ListBox1.Canvas.Font.Style + [fsBold];
    end;
    if (TLogType(ListBox1.Items.Objects[Index]) = ltOK) {and
       (ListBox1.ItemIndex <> Index)} then
    begin
      ListBox1.Canvas.Font.Color := clGreen;
    end;
  end;
  ListBox1.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 0, ListBox1.Items[Index]);
end;

procedure TSvcForm.AppMinimize(Sender: TObject);
begin
  Close;
end;

procedure TSvcForm.Button1Click(Sender: TObject);
begin      
  if POS('_SE', CmdLine) = 0 then
  begin
    sssCNT := '';
    DoReplication;
  end
  else
  begin
    sssCNT := '';
    try GetConnPar(FHost, FPort, Password, UserID, xxxDBBaseName, xxxDBUserName, xxxDBPassword, xxxCatalog,
      FremServer, FRemPsw, FRemDBName, FPeriod);
    DoReplication;
    except end;
    sssCNT := 'v2';
    try GetConnPar(FHost, FPort, Password, UserID, xxxDBBaseName, xxxDBUserName, xxxDBPassword, xxxCatalog,
      FremServer, FRemPsw, FRemDBName, FPeriod);
    DoReplication;
    except end;
  end;
end;

procedure TSvcForm.MakeReplication(ASaveCDS : boolean);
var DM : TDataModule1;
begin
  try
    DM := TDataModule1(GetDM);
  except
    on E : Exception do
    begin
      AddToLog_UN(Handle, ltError, sssCNT + ' ' + 'Ошибка ' + E.Message);
      Exit;
    end;
  end;
  with DM.SocketConnection1 do
  begin
//    Address := FHost;
    Host := FHost;
    Port := StrToInt(FPort);
    try
      //StatusBar1.Panels[1].Text := 'Идет обновление данных...';
      ShowText_UN(Handle, sssCNT + ' ' + 'Идет обновление данных...');
      try
        AddToLog_UN(Handle, ltNone, sssCNT + ' ' + 'Установка связи с сервером');
        Open;

        if FremServer <> '' then
          AppServer.SetFBaseName(FremServer);
        if FRemPsw <> '' then
          AppServer.SetFPassword(FRemPsw);
        if FRemDBName <> '' then
          AppServer.SetIC(FRemDBName);

//        SvcForm.AddToLog(ltOK, 'Связь установлена');
        AddToLog_UN(Handle, ltOK, sssCNT + ' ' + 'Связь установлена');
      except
        on E : Exception do
        begin
//          SvcForm.AddToLog(ltError, 'Ошибка при соединении с сервером ' + E.Message);
          AddToLog_UN(Handle, ltError, sssCNT + ' ' + 'Ошибка при соединении с сервером ' + E.Message);
          Exit;
        end;
      end;

      try
//        SvcForm.AddToLog(ltNone, 'Проверка пароля');
        AddToLog_UN(Handle, ltNone, sssCNT + ' ' + 'Проверка пароля');
        FID_Rep := AppServer.DoLogin(UserID, Password);
        if FID_Rep = -1 then
          raise Exception.Create(sssCNT + ' ' + 'Неверный пароль. В доступе отказано');
        DM.FID_Rep := FID_Rep;
      except
        on E : Exception do
        begin
   //       AddToLog(ltError, 'Ошибка ' + E.Message);
          AddToLog_UN(Handle, ltError, sssCNT + ' ' + 'Ошибка ' + E.Message);
          Exit;
        end;
      end;

      AddToLog_UN(Handle, ltOK, sssCNT + ' ' + 'Доступ открыт');

     
      DM.DoRepBsn(sssCNT + ' ' + 'Обновление бизнесов');
      DM.DoRepuserInfos(sssCNT + ' ' + 'Обновление информации о пользователях');

    //  if POS('_SE', CmdLine) = 0 then
        DM.DoRepCrn(sssCNT + ' ' + 'Обновление валют');
      DM.DoRepDocs(otDocAccount, sssCNT + ' ' + 'обновление счетов', 'Account', true);
      DM.DoRepDocs(otDocAF, sssCNT + ' ' + 'обновление счетов-фактур', 'AF', true);
  //    DM.DoRepDocs(otDocFinalAct, sssCNT + ' ' + 'обновление актов', 'FinalAct', true);
      DM.DoRepDocs(otDocInvoice, sssCNT + ' ' + 'обновление накладных', 'Invoice', true);
      DM.DoRepDocs(otDocPay_In, sssCNT + ' ' + 'обновление приходников', 'Pay_In', false);
      DM.DoRepDocs(otDocWarrant, sssCNT + ' ' + 'обновление доверенностей', 'Warrant', true);
   //   DM.DoRepDocs(otDocWBill, sssCNT + ' ' + 'обновление ТТН', 'WBill', true);         
      DM.DoRepDocs(otDocWHOrd, sssCNT + ' ' + 'обновление заявок на склад', 'WHOrd', true);


{$IFNDEF ACS_V2}
      if (POS('_SE', CmdLine) = 0) then
      begin
        DM.DoRepInvForm('Обновление справочников по себестоимости 1/3');
        DM.DoRepInvLines('Обновление справочников по себестоимости 2/3');
        DM.DoRepTimeDict('Обновление справочников по себестоимости 3/3');

        DM.DoRepInv('Обновление себестоимостей');
        DM.DoRepInvFact('Обновление себестоимостей - факт');
      end;

{$ENDIF}

      DM.DoRepEDName(sssCNT + ' ' + 'Обновление параметров');

      DM.DoRepFormalDistr(sssCNT + ' ' + 'Обновление функциональных распределений');
      DM.DoRepFuncDistr(sssCNT + ' ' + 'Обновление формальных распределений');


{$IFDEF ACS_V2}
 // Передаем контрагентов
      DM.DoRepAccGrp(sssCNT + ' ' + 'Обновление групп счетов');
      DM.DoRepAcc(sssCNT + ' ' + 'Обновление счетов', ASaveCDS);

      DM.DoRepCAGrp(sssCNT + ' ' + 'Обновление групп контрагентов');  
      DM.DoRepCA(sssCNT + ' ' + 'Обновление контрагентов');  
      DM.DoRepRepr(sssCNT + ' ' + 'Обновление представителей', ASaveCDS);   

{$ELSE}
      DM.DoRepRepr(sssCNT + ' ' + 'Обновление представителей', ASaveCDS);   
      DM.DoRepAcc(sssCNT + ' ' + 'Обновление счетов', ASaveCDS);
{$ENDIF}

{$IFDEF ACS_V2}
      DM.DoRepRRR('Обновление прав');
{$ENDIF}


      if POS('_SE', CmdLine) = 0 then
        DM.DoRepMN(sssCNT + ' ' + 'Обновление производств', ASaveCDS);
      DM.DoRepMeasure(sssCNT + ' ' + 'Обновление единиц измерения');
      DM.DoRepWH(sssCNT + ' ' + 'Обновление складов', ASaveCDS);

      DM.DoRepCtgGoods(sssCNT + ' ' + 'Обновление категорий товаров', ASaveCDS);
      DM.DoRepGoods(sssCNT + ' ' + 'Обновление товаров', ASaveCDS);

      DM.DoRepOper(sssCNT + ' ' + 'Обновление операций', ASaveCDS);

      if POS('_SE', CmdLine) <> 0 then
        DM.DoRepOper201(sssCNT + ' ' + 'Обновление резервов');


{$IFNDEF ACS_V2}
      DM.DoRepWHState(sssCNT + ' ' + 'Обновление состояния склада');
{$ENDIF}

      MakeClear;
      StatusBar1.Panels[1].Text := 'Обмен данными завершен';
      AddToLog_un(Handle, ltOK, sssCNT + ' ' + 'Обмен данными завершен');
    finally
    //  StatusBar1.Panels[1].Text := '';
      ShowText_UN(Handle, '');
      Close;
      FreeAndNil(DataModule1);
    end;
  end;
end;

function TSvcForm.GetID_Rep: integer;
begin
  Result := FID_Rep;
end;

function TSvcForm.GetDM: Pointer;
begin
  try
    if DataModule1 = nil then
    begin
      DataModule1 := TDataModule1.Create(Self);
      DataModule1.MFHandle := Handle;
   //   FID_Rep := ID_Rep;
    end;
    Result := DataModule1;
    if not DataModule1.ADOConnection1.Connected then
      raise Exception.Create('Не удалось устанвить соединение с базой');
  except
    on E : Exception do
    begin
      raise Exception.Create('DoLogin, ' + E.Message);
    end;
  end;
end;

procedure TSvcForm.N4Click(Sender: TObject);
begin
  FClosing := True;
  Shell_NotifyIcon(NIM_DELETE, @FIconData);
  Close;

end;

procedure TSvcForm.MakeClear;
var DelPeriod : integer;
begin
  DelPeriod := DataModule1.SocketConnection1.AppServer.RP_ReplicatorDelPeriod(ID_Rep);
  if DelPeriod > 0 then
  begin
    DataModule1.DoClear(DelPeriod);
  end;
end;

procedure TSvcForm.N5Click(Sender: TObject);
var DM : TDataModule1;
    F : TfSyncForm;
begin
  F := TfSyncForm.Create(Self);
  try
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      DM := TDataModule1(GetDM);
      try
        StatusBar1.Panels[1].Text := 'Сохраняем настройки...';

        if F.cbUser.Checked then
        begin
          DM.ClearTS(otDic_Func);
          DM.ClearTS(otUSR_Group);
          DM.ClearTS(otUSR_User);
        end;
        if F.cbObj.Checked then
        begin
          DM.ClearTS(otBsn);
          DM.ClearTS(otCrn);
          DM.ClearTS(otRepr);
          DM.ClearTS(otAcc);
          DM.ClearTS(otMN);
          DM.ClearTS(otWH);
          DM.ClearTS(otMeasure);
          DM.ClearTS(otLnk);
        end;
        if F.cbGoods.Checked then
        begin
          DM.ClearTS(otCtgGoods);
          DM.ClearTS(otGoods);
        end;
        if F.cbWHState.Checked then
        begin
          DM.ClearTS(otWHState);
          DM.ClearTS(otWHState);
        end;
      finally
        FreeAndNil(DataModule1);
        StatusBar1.Panels[1].Text := '';
      end;
    end;
  finally
    F.Free;
  end;
end;

procedure TSvcForm.Button2Click(Sender: TObject);
begin
 ListBox2.Items.Add(IntToStr(AllocMemSize));
end;

procedure TSvcForm.N7Click(Sender: TObject);
begin
  Close;
end;

procedure TSvcForm.Button3Click(Sender: TObject);
begin
  RealThread1.Terminate;
  RealThread1.WaitForEnd;
  RealThread1.Run;
end;

procedure TSvcForm.RealThread1Start(Sender: TObject);
begin
  Timer254t3q.Enabled := false;
  Screen.Cursor := crSQLWait;
  Timer1.Interval := FPeriod;
  Timer1.Enabled := false;
  Button3.Enabled := false;
end;

procedure TSvcForm.RealThread1End(Sender: TObject;
  ErrorInThreadProc: Boolean);
begin
  Screen.Cursor := crDefault;
  Button3.Enabled := True;
  Timer1.Enabled := True;
  FDateTime := Now;
  Timer254t3q.Enabled := True;
end;

procedure TSvcForm.RealThread1DoInThread(Sender: TObject);
begin
  CoInitialize(nil);
  try
    MakeReplication;
  finally
    CoUnInitialize;
  end;
end;

procedure TSvcForm.STMessage(var Message: TMessage);
var S : String;
begin
  S := PChar(Message.WParam);
  ShowText2(S);
end;

procedure TSvcForm.STAddToLog(var Message: TMessage);
var S : String;
    LogType: TLogType;
begin
  S := PChar(Message.WParam);
  LogType := TLogType(Message.LParam);
  AddToLog2(LogType, S);
 // if (LogType = ltError) or (LogType = ltWarning) then
    DoLog(S);
end;


procedure TSvcForm.DoLog(AText: String);
var SL : TStringList;
    S : String;
    FileHandle : Integer;
begin
 // Application.OnException := nil;
  try
    S := ExtractFilePath(ParamStr(0)) + 'Error_REPL.log';
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
        SL.Add(DateTimeToStr(Now) + ' - ' + AText);
        while SL.Count > 100 do
          SL.Delete(0);
        SL.SaveToFile(S);
      end;
    finally
      SL.Free;
    end;
  except
 //   Application.OnException := AppException;
  end;
end;


procedure TSvcForm.RealThread1ThreadProcException(Sender: TObject;
  AMessage: String);
begin
  AddToLog_UN(Handle, ltError, 'Ошибка ' + AMessage);
end;

procedure TSvcForm.miStngClick(Sender: TObject);
var SL : TStringList;
    FS : TMemoryStream;
    S, AServer, APort, ASvrPsw, ASvrName, ABaseName, ABaseUserName, ACatalog,
      ABasePassword : String;
    APeriod : integer;
begin
  if Settings <> nil then Exit;

  GetConnPar(AServer, APort, ASvrPsw, ASvrName, ABaseName, ABaseUserName,
      ABasePassword, ACatalog,
      FremServer, FRemPsw, FRemDBName, APeriod);

  Settings := TSettings.Create(Self);
  SL := TStringList.Create;

  S := ParamStr(0);
  S := ExpandFileName(S);
  Delete(S, Length(S) - 2, 3);
  S := S + 'Key';

  if  FileExists(S) then
    SL.Text := FileToStr(S);
  try
    Settings.edServer.Text := AServer;
    Settings.edPort.Text := APort;
    
    Settings.edPeriod.Value := Trunc(APeriod/60000);
    Settings.edSvrName.Text := ASvrName;
    Settings.edSvrPassword.Text := ASvrPsw;

    Settings.edBaseName.Text := ABaseName;
    Settings.edBaseUserName.Text := ABaseUserName;
    Settings.edBasePassword.Text := ABasePassword;
    Settings.edxxxCatalog.Text := ACatalog;

    Settings.ShowModal;
    if Settings.ModalResult = mrOk then
    begin
      AServer := Settings.edServer.Text;
      APort := Settings.edPort.Text;

      APeriod := Trunc(Settings.edPeriod.Value);
      ASvrName := Settings.edSvrName.Text;
      ASvrPsw := Settings.edSvrPassword.Text;

      ABaseName := Settings.edBaseName.Text;
      ABaseUserName := Settings.edBaseUserName.Text;
      ABasePassword := Settings.edBasePassword.Text;
      ACatalog := Settings.edxxxCatalog.Text;
      
      SL.Clear;
      SL.Add('Port=' + APort);
      SL.Add('Host=' + AServer);

      SL.Add('Period=' + Inttostr(APeriod));
      SL.Add('Password=' + ASvrPsw);
      SL.Add('UserID=' + ASvrName);

      SL.Add('xxxDBPassword=' + ABasePassword);
      SL.Add('xxxDBUserName=' + ABaseUserName);
      SL.Add('xxxDBBaseName=' + ABaseName);
      SL.Add('xxxCatalog=' + ACatalog);

      FS := StrToStream(SL.Text);
      FS.SaveToFile(S);
      GetConnPar(FHost, FPort, Password, UserID, xxxDBBaseName, xxxDBUserName, xxxDBPassword, ACatalog,
      FremServer, FRemPsw, FRemDBName, FPeriod);
    end;
  finally
    Settings.Free;
    SL.Free;
  end;
end;

procedure TSvcForm.STDoLog(var Message: TMessage);
var S : String;
    LogType: TLogType;
begin
  S := PChar(Message.WParam);

    DoLog(S);
end;

end.
