unit uLog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TLog = class(TForm)
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Log: TLog;
procedure ShowLog;

implementation

{$R *.DFM}

procedure ShowLog;
begin
  if Assigned(Log) then
  begin
    Log.Show;
    Log.BringToFront;
  end
  else
  begin
    Log := TLog.Create(nil);
    Log.Show;
  end;
end;

procedure TLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TLog.FormDestroy(Sender: TObject);
begin
  Log := nil;
end;

procedure TLog.FormShow(Sender: TObject);
var S : String;
begin
    S := ExtractFilePath(ParamStr(0)) + 'Error.log';
  Memo1.Lines.LoadFromFile(S);
end;

end.
