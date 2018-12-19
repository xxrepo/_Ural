unit uTasks;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtrls, SHDocVw;

type
  TTasks = class(TForm)
    WebBrowser1: TWebBrowser;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Initialize;
  end;

var
  Tasks: TTasks;
procedure ShowTasks();

implementation

{$R *.DFM}

{ TTasks }

procedure ShowTasks();
var F : TTasks;
begin
  F := TTasks.Create(nil);
  try
    F.Show;
    F.Repaint;
    F.Initialize;
  except
    F.Free;
  end;
end;

constructor TTasks.Create(AOwner: TCOmponent);
begin
  inherited;

end;

procedure TTasks.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

destructor TTasks.Destroy;
begin
  inherited;

end;

procedure TTasks.Initialize;
begin
  WebBrowser1.Navigate('http://oracle/Sites/VB%20Hotel%20Distribution%20Server/BackOffice/Lists/Tasks/AllItems.aspx');
end;

procedure TTasks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

end.
