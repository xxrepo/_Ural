unit uSvc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  ComObj, Comserv // Добавлено ручками
  ;

type
  Tural_Replicator = class(TService)
    procedure ServiceExecute(Sender: TService);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceAfterUninstall(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ural_Replicator: Tural_Replicator;

implementation

uses ReplSvc_TLB;

{$R *.DFM}
//***************** Для регистрации ******************************
// Добавлено ручками
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
  S := GuidToString( GUID );
  DeleteRegKey( 'AppID\' + S );
  DeleteRegKey( 'CLSID\' + S );
end;
//***********************************************

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ural_Replicator.Controller(CtrlCode);
end;

function Tural_Replicator.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure Tural_Replicator.ServiceExecute(Sender: TService);
begin
// Добавлено ручками
  while not Terminated do
    ServiceThread.ProcessRequests(True);
end;

procedure Tural_Replicator.ServiceAfterInstall(Sender: TService);
begin
// Добавлено ручками
  ComServer.UpdateRegistry( true );
  RegisterCOMService(CLASS_ReplDM, Name );
end;

procedure Tural_Replicator.ServiceAfterUninstall(Sender: TService);
begin
// Добавлено ручками
  UnRegisterCOMService(CLASS_ReplDM);
  ComServer.UpdateRegistry( false );
end;

procedure Tural_Replicator.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
{  if ural_Replicator <> nil then
    try
      ural_Replicator.LogMessage('Запуск');
    except
    end; }
end;

end.
