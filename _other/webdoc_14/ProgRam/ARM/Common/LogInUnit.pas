unit LogInUnit;
    // Форма "ввод логина и пароля" 
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBTables, ExtCtrls, registry, Buttons;
type
  TLogInForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edUserID: TEdit;
    edPassword: TEdit;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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

uses uSettings;

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
  Windows.SetFocus(edPassword.Handle);
  // Sleep(200);
  BringToFront;
  Application.BringToFront;
end;

procedure TLogInForm.FormCreate(Sender: TObject);
begin
  Caption := Caption + ' - ' + Application.Title;
end;

procedure TLogInForm.BitBtn1Click(Sender: TObject);
begin
  ChangeStng;
end;

procedure TLogInForm.FormDestroy(Sender: TObject);
begin
  tag := 0;
end;

end.
