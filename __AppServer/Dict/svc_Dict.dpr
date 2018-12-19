program svc_Dict;

uses
  SvcMgr,
  Forms,
  Windows,
  SysUtils,
  WinSvc,
  tstSvccnst,
  Comserv,
  ActiveX,
  tstSvcForm in 'tstSvcForm.pas' {SvcForm},
  svc_Dict_TLB in 'svc_Dict_TLB.pas',
  uRDM in 'uRDM.pas' {Dic: TRemoteDataModule} {Dic: CoClass},
  uMeCrpt in '..\..\__ARM\common\uMeCrpt.pas',
  uEventLogger in '..\..\__ARM\common\uEventLogger.pas';

{$R *.TLB}

{$R *.RES}

//***************** Для регистрации ******************************
// Добавлено ручками

function GUIDToString(const ClassID: TGUID): string;
var
  P: PWideChar;
begin
  StringFromCLSID(ClassID, P);
  Result := P;
  CoTaskMemFree(P);
end;

procedure CreateRegKey(const Key, ValueName, Value: string);
var
  Handle: HKey;
  Status, Disposition: Integer;
begin
  Status := RegCreateKeyEx(HKEY_CLASSES_ROOT, PChar(Key), 0, '',
    REG_OPTION_NON_VOLATILE, KEY_READ or KEY_WRITE, nil, Handle,
    @Disposition);
  if Status = 0 then
  begin
    Status := RegSetValueEx(Handle, PChar(ValueName), 0, REG_SZ,
      PChar(Value), Length(Value) + 1);
    RegCloseKey(Handle);
  end;
  if Status <> 0 then raise Exception.Create('Ошибка Error');
end;

{ Delete registry key }

procedure DeleteRegKey(const Key: string);
begin
  RegDeleteKey(HKEY_CLASSES_ROOT, PChar(Key));
end;

procedure RegisterCOMService( GUID : TGUID; const ServiceName: string);
var
   S: string;
begin
  S := GuidToString( GUID );
  CreateRegKey('AppID\' + S, 'LocalService', ServiceName);
  CreateRegKey('CLSID\' + S, 'AppID', S);
end;

procedure UnRegisterCOMService(GUID : TGUID);
var
   S: string;
begin
//  S := GuidToString( GUID );
  DeleteRegKey( 'AppID\' + S );
  DeleteRegKey( 'CLSID\' + S );
end;
//***********************************************


function Installing: Boolean;
begin
  Result := FindCmdLineSwitch('INSTALL',['-','\','/'], True) or
            FindCmdLineSwitch('UNINSTALL',['-','\','/'], True);
end;

function StartService: Boolean;
var
  Mgr, Svc: Integer;
  UserName, ServiceStartName: string;
  Config: Pointer;
  Size: DWord;
begin
  Result := False;
  Mgr := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  if Mgr <> 0 then
  begin
    Svc := OpenService(Mgr, PChar(SServiceName), SERVICE_ALL_ACCESS);
    Result := Svc <> 0;
    if Result then
    begin
      QueryServiceConfig(Svc, nil, 0, Size);
      Config := AllocMem(Size);
      try
        QueryServiceConfig(Svc, Config, Size, Size);
        ServiceStartName := PQueryServiceConfig(Config)^.lpServiceStartName;
        if CompareText(ServiceStartName, 'LocalSystem') = 0 then
          ServiceStartName := 'SYSTEM';
      finally
        Dispose(Config);
      end;
      CloseServiceHandle(Svc);
    end;
    CloseServiceHandle(Mgr);
  end;
  if Result then
  begin
    Size := 256;
    SetLength(UserName, Size);
    GetUserName(PChar(UserName), Size);
    SetLength(UserName, StrLen(PChar(UserName)));
    Result := CompareText(UserName, ServiceStartName) = 0;
  end;
end;

begin
  if not Installing then
  begin
    CreateMutex(nil, True, '83FB0C09-A0C1-4463-917B-EE225C988EC6');
   { if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      MessageBox(0, PChar(SAlreadyRunning), SApplicationName, MB_ICONERROR);
      Halt;
    end;     }
  end;
  if Installing or StartService then
  begin
    SvcMgr.Application.Initialize;
    ural_Dictionary := Tural_Dictionary.CreateNew(SvcMgr.Application, 0);
    SvcMgr.Application.CreateForm(TSvcForm, SvcForm);
  SvcMgr.Application.Run;
    if FindCmdLineSwitch('INSTALL',['-','\','/'], True) then
    begin
// Добавлено ручками
      ComServer.UpdateRegistry( true );
      RegisterCOMService(CLASS_Dic, ural_Dictionary.Name);
    end;

    if FindCmdLineSwitch('UNINSTALL',['-','\','/'], True) then
    begin
      // Добавлено ручками
      UnRegisterCOMService(Class_Dic);
      ComServer.UpdateRegistry( false );
    end;
  end
  else
  begin
    Forms.Application.ShowMainForm := False;
    Forms.Application.Initialize;
    Forms.Application.CreateForm(TSvcForm, SvcForm);
    SvcForm.Initialize(False);
    Forms.Application.OnException := SvcForm.AppException;
    Forms.Application.Run;
  end;
end.
