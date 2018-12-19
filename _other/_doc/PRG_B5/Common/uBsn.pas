unit uBsn;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF VER150} Variants,{$ENDIF}  Classes, Graphics, Controls, Forms,
  Dialogs, frUsers, frBSN;

type
  TBsn = class(TForm)
    fBSN1: TfBSN;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Initialize;
  end;

var
  Bsn: TBsn;
procedure ShowBsn;

implementation

uses uDM;

{$R *.dfm}

procedure ShowBsn;
begin
//  DM.Rights_GetUserRights(7);
  if not Assigned(Bsn) then
  begin
    Bsn := TBsn.Create(Application.MainForm);
    Bsn.WindowState := wsMaximized;
    Bsn.Initialize;
  end
  else
  begin
    Bsn.WindowState := wsMaximized;
    Bsn.BringToFront;
  end;
end;


{ TDivisionTree }

procedure TBsn.Initialize;
begin
  fBSN1.Init;
end;

procedure TBsn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TBsn.FormDestroy(Sender: TObject);
begin
  Bsn := nil;
end;

end.
