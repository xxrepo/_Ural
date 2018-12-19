unit uUsers;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF VER150} Variants,{$ENDIF}  Classes, Graphics, Controls, Forms,
  Dialogs, frUsers;

type
  TUsers = class(TForm)
    fUsers1: TfUsers;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Initialize;
  end;

var
  Users: TUsers;
procedure ShowUsers;

implementation

uses uDM;

{$R *.dfm}

procedure ShowUsers;
begin
//  DM.Rights_GetUserRights(7);
  if not Assigned(Users) then
  begin
    Users := TUsers.Create(Application.MainForm);
    Users.WindowState := wsMaximized;
    Users.Initialize;
  end
  else
  begin
    Users.WindowState := wsMaximized;
    Users.BringToFront;
  end;
end;


{ TDivisionTree }

procedure TUsers.Initialize;
begin
  fUsers1.Init;
end;

procedure TUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TUsers.FormDestroy(Sender: TObject);
begin
  Users := nil;
end;

end.
