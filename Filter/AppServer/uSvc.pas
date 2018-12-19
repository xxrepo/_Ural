unit uSvc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  ComObj, Comserv // Добавлено ручками
  ;

type
  Tural_FLT = class(TService)
    procedure ServiceExecute(Sender: TService);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceAfterUninstall(Sender: TService);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ural_FLT: Tural_FLT;

implementation

uses UNFilterApp_TLB;

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
  ural_FLT.Controller(CtrlCode);
end;

function Tural_FLT.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure Tural_FLT.ServiceExecute(Sender: TService);
begin
// Добавлено ручками
  while not Terminated do
    ServiceThread.ProcessRequests(True);
end;

procedure Tural_FLT.ServiceAfterInstall(Sender: TService);
begin
// Добавлено ручками
  ComServer.UpdateRegistry( true );
  RegisterCOMService(CLASS_UnFilter, Name);
end;

procedure Tural_FLT.ServiceAfterUninstall(Sender: TService);
begin
// Добавлено ручками
  UnRegisterCOMService(CLASS_UnFilter);
  ComServer.UpdateRegistry( false );
end;

end.
