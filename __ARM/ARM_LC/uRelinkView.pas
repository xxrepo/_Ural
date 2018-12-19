unit uRelinkView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frRelinkView;

type
  TRelinkView = class(TForm)
    fRelinkView1: TfRelinkView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Initialize;
  end;

var
  RelinkView: TRelinkView;
  procedure ShowRelinkView;
implementation

uses uDM;

{$R *.DFM}

procedure ShowRelinkView;
begin
  if not Assigned(RelinkView) then
  begin
    RelinkView := TRelinkView.Create(nil);
    RelinkView.Initialize;
  end
  else
  begin
    RelinkView.WindowState := wsMaximized;
    RelinkView.BringToFront;
  end;
end;


procedure TRelinkView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TRelinkView.FormDestroy(Sender: TObject);
begin
  RelinkView := nil;
end;

procedure TRelinkView.Initialize;
begin
  fRelinkView1.Initialize;
end;

end.
