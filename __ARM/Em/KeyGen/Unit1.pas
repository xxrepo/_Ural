unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, ADODB;

type
  TForm1 = class(TForm)
    Memo2: TMemo;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Button4: TButton;
    edBaseName: TEdit;
    Label1: TLabel;
    dsfUserName: TLabel;
    edUserName: TEdit;
    Label2: TLabel;
    edPassword: TEdit;
    ADOConnection1: TADOConnection;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ADOConnection2: TADOConnection;
    Label3: TLabel;
    edIC: TEdit;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FBaseName : String;
    FUserName, FPassword, FIC: String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  function MakeFS(ABaseName, AUserName, APassword, AIC : String) : TMemoryStream;


implementation

uses uMeCrpt;

{$R *.DFM}
function MakeFS(ABaseName, AUserName, APassword, AIC : String) : TMemoryStream;
var
    SL : TStringList;
begin
  SL := TStringList.Create;
  try
    SL.Add('DB=' + Trim(ABaseName));
    SL.Add('UserName=' + Trim(AUserName));
    SL.Add('Password=' + Trim(APassword));
    SL.Add('IC=' + Trim(AIC));
    Result := StrToStream(Trim(SL.Text));
  finally
    SL.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var FS : TMemoryStream;
begin
  FBaseName := edBaseName.Text;
  FUserName := edUserName.Text;
  FPassword := edPassword.Text;
  FIC := edIC.Text;

  with ADOConnection1 do
  begin
    Connected := false;
    ConnectionString := 'Provider=SQLOLEDB.1;Password="' +
      String(FPassword) + '";Persist Security Info=True;User ID=' +
      String(FUserName) + ';Initial Catalog=' + FIC + ';Data Source=' + FBaseName +
                        ';Use Procedure for Prepare=1;Auto Translate=True;Application Name=' +Self.Name + '4.0;Packet Size=4096;';

    if CheckBox2.Checked then
    begin
      ConnectionString := 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;User ID=sa;Initial Catalog=ACS_MBase;Data Source=' + FBaseName;
    end;
    try
      if CheckBox1.Checked then
        Connected := true;
    except
      MessageBox(Handle, PChar('Произошла ошибка при попытке присоединиться к базе даных с заданными параметрами.' + #13 + #10 +
                 'Файл-ключ не был сгенерирован.' + #13 + #10 +
                 'Проверьте правильность параметров.'), 'Ошибка при соединении',
                 MB_ICONERROR + mb_ok);
      Exit;
    end;
  end;
  try

    FS := MakeFS(FBaseName, FUserName, FPassword, FIC );
    if SaveDialog1.Execute then
      FS.SaveToFile(SaveDialog1.FileName);
  finally
    FS.Free;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var FS : TMemoryStream;
begin
  if OpenDialog1.Execute then
    Memo2.Lines.Text := FileToStr(OpenDialog1.FileName);
end;

procedure TForm1.Button1Click(Sender: TObject);
var FS : TMemoryStream;
    SL : TStringList;
begin
  SL := TStringList.Create;
  try
    SL.Add('Val=gopapopa26');
    FS := StrToStream(Trim(SL.Text));

    if SaveDialog1.Execute then
      FS.SaveToFile(SaveDialog1.FileName);
  finally
    FS.Free;
    SL.Free;
  end;
end;

end.
