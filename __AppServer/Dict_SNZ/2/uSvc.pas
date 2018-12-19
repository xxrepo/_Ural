unit uSvc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  ComObj, Comserv, Forms // Добавлено ручками
  ;

type
  Tural_Dictionary = class(TService)
    procedure ServiceExecute(Sender: TService);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceAfterUninstall(Sender: TService);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ural_Dictionary: Tural_Dictionary;

implementation

uses svc_Dict_TLB;

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
  ural_Dictionary.Controller(CtrlCode);
end;

function Tural_Dictionary.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure Tural_Dictionary.ServiceExecute(Sender: TService);
begin
// Добавлено ручками
  while not Terminated do
    ServiceThread.ProcessRequests(True);
end;

procedure Tural_Dictionary.ServiceAfterInstall(Sender: TService);
begin
// Добавлено ручками
  ComServer.UpdateRegistry( true );
  RegisterCOMService(Class_Dic, Name );
end;

procedure Tural_Dictionary.ServiceAfterUninstall(Sender: TService);
begin
// Добавлено ручками
  UnRegisterCOMService(Class_Dic);
  ComServer.UpdateRegistry( false );
end;

procedure Tural_Dictionary.ServiceCreate(Sender: TObject);
begin
// Добавлено ручками
//  ComServer.UIInteractive := false;
end;

procedure Tural_Dictionary.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  Tag := 0;
end;

end.
