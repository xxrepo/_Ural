unit LogInUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBTables, ExtCtrls, registry, Buttons, ActnList;
type
  TLogInForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edUserID: TEdit;
    edPassword: TEdit;
    SpeedButton1: TSpeedButton;
    ActionList1: TActionList;
    Action1: TAction;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    Base : String;
    UserID : String;
    Password : String;
  end;

var
  LogInForm: TLogInForm;

implementation

uses uDM;

{$R *.DFM}

procedure TLogInForm.Button1Click(Sender: TObject);
begin
    UserID := edUserID.Text;
    Password := edPassword.Text;
end;

procedure TLogInForm.FormShow(Sender: TObject);
var Buffer : PChar;
    Len : DWORD;
begin
  if edUserID.Text = '' then
  begin
    try
      Len := 256;
      Buffer := AllocMem(Len);
      GetUserName(Buffer, Len);
      edUserID.Text := StrPas(Buffer);
    finally
      FreeMem(Buffer, Len);
      ActiveControl := edUserID;
    end;
  end;
  edPassword.Text := '';
  ActiveControl := edPassword;
end;

procedure TLogInForm.FormCreate(Sender: TObject);
begin
  Caption := Caption + ' - ' + Application.Title;
end;

procedure TLogInForm.SpeedButton1Click(Sender: TObject);
begin
  DM.DoEditConnectionString;
end;

procedure TLogInForm.Action1Execute(Sender: TObject);
begin
  SpeedButton1.Visible := not SpeedButton1.Visible
end;

end.
