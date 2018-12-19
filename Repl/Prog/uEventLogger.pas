unit uEventLogger;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, VCLCom, uSvccnst;

type
  TEventLogger = class(TObject)
  private
    FName: String;
    FEventLog: Integer;          
  public
    constructor Create(Name: String);
    destructor Destroy; override;
    procedure LogMessage(Message: String; EventType: DWord = 1; Category: Word = 0; ID: DWord = 0);
  end;

var
     FEventLogger : TEventLogger;

implementation

{ TEventLogger }
constructor TEventLogger.Create(Name: String);
begin
  inherited Create;
  FName := Name;
  FEventLog := 0;
end;

destructor TEventLogger.Destroy;
begin
  if FEventLog <> 0 then
    DeregisterEventSource(FEventLog);
  inherited Destroy;
end;

procedure TEventLogger.LogMessage(Message: String; EventType: DWord;
  Category: Word; ID: DWord);
var
  P: Pointer;
begin
  P := PChar(Message);
  if FEventLog = 0 then
    FEventLog := RegisterEventSource(nil, PChar(FName));
  ReportEvent(FEventLog, EventType, Category, ID, nil, 1, 0, @P, nil);
end;


initialization
  FEventLogger := TEventLogger.Create(SServiceName);
  FEventLogger.LogMessage('Сервис ' + SServiceName + ' запущен', EVENTLOG_INFORMATION_TYPE);

finalization
  FEventLogger.LogMessage('Сервис ' + SServiceName + ' остановлен', EVENTLOG_INFORMATION_TYPE);

end.
