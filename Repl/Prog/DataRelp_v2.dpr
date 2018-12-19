program DataRelp_v2;

uses
  SvcMgr,
  Forms,
  Windows,
  SysUtils,
  WinSvc,
  uMainForm in 'uMainForm.pas' {SvcForm},
  uSvccnst in 'uSvccnst.pas',
  uEventLogger in 'uEventLogger.pas',
  uDM in 'uDM.pas' {DataModule1: TDataModule},
  SyncForm in 'SyncForm.pas' {fSyncForm},
  uSettings in 'uSettings.pas' {Settings},
  uMeCrpt in '..\..\__ARM\common\uMeCrpt.pas';

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
 { if 1=1 then
  begin

  end
  else   }
  begin
    if not Installing then
    begin
      CreateMutex(nil, True, 'F6BBeee06B-7282-494B-AB08-EFBE595C609C');
      if GetLastError = ERROR_ALREADY_EXISTS then
      begin
        MessageBox(0, PChar(SAlreadyRunning), SApplicationName, MB_ICONERROR);
        Halt;
      end;
    end;
    if Installing or StartService then
    begin
      SvcMgr.Application.Initialize;
      MIDASService := TMIDASService.CreateNew(SvcMgr.Application, 0);
      SvcMgr.Application.CreateForm(TSvcForm, SvcForm);
      SvcMgr.Application.Run;

  //    SvcForm.DoReplication;
    end
    else
    begin
      Forms.Application.ShowMainForm := False;
      Forms.Application.Initialize;
      Forms.Application.CreateForm(TSvcForm, SvcForm);
      SvcForm.Initialize(False);
      Forms.Application.OnException := SvcForm.AppException;
      Forms.Application.Run;

  //    SvcForm.DoReplication;
    end;
  end;
end.
