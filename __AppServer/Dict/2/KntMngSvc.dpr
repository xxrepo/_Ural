program KntMngSvc;

uses
  SvcMgr,
  Forms,
  Windows,
  SysUtils,
  WinSvc,
  tstSvccnst,
  tstSvcForm in 'tstSvcForm.pas' {SvcForm},
  KmMngSvc_TLB in 'KmMngSvc_TLB.pas',
  uDM in 'uDM.pas' {DMKM: TRemoteDataModule};

{$R *.TLB}

{$R *.RES}


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
    MIDASService := TMIDASService.CreateNew(SvcMgr.Application, 0);
    SvcMgr.Application.CreateForm(TSvcForm, SvcForm);
  SvcMgr.Application.CreateForm(TSvcForm, SvcForm);
    SvcMgr.Application.Run;
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
