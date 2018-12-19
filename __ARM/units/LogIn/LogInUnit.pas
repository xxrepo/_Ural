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
    ActionList1: TActionList;
    aEgg: TAction;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aEggExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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

uses uSettings, uEgg;

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
   {
    edUserID.Text := 'admin';
    MessageBox(0, 'Если это первый запуск программы, используйте для входа в систему имя admin, без пароля (поле Пароль не заполняйте). Рекомендуем Вам сменить пароль администратора.', '', MB_ICONINFORMATION + mb_ok);
   }
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
      {$IFDEF SEINV}
        SpeedButton1.Visible := false;
       {$ENDIF}
  Caption := Application.Title;
end;

procedure TLogInForm.aEggExecute(Sender: TObject);
var F : TEgg;
begin
  F := TEgg.Create(nil);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure TLogInForm.SpeedButton1Click(Sender: TObject);
begin
  ChangeStng(true);

end;

end.
