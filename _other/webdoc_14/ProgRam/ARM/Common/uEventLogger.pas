unit uEventLogger;

interface

uses
  Windows, Messages, SysUtils, Classes, forms;


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

var SL : TStringList;
    S : String;
    FileHandle : Integer;
begin
  try
    S := ExtractFilePath(ParamStr(0)) + 'Error.log';
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
    if FileHandle > 0 then
    begin
      try
        SL := TStringList.Create;
        if FileExists(S) then
          SL.LoadFromFile(S);
        SL.Insert(0, DateTimeToStr(Now) + ' - ' + Message);
        while SL.Count > 100 do
          SL.Delete(0);
        SL.SaveToFile(S);
      finally
        SL.Free;
      end;
    end;
  finally

  end;

  P := PChar(Message);
  if FEventLog = 0 then
    FEventLog := RegisterEventSource(nil, PChar(FName));
  ReportEvent(FEventLog, EventType, Category, ID, nil, 1, 0, @P, nil);
end;

initialization
  FEventLogger := TEventLogger.Create(Application.Title);

finalization
  FEventLogger.Free;
end.
