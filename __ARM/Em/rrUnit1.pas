unit rrUnit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, inifiles,
  StdCtrls;

type
  TForm1 = class(TForm)
    btnEn: TButton;
    btnDis: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnEnClick(Sender: TObject);
    procedure btnDisClick(Sender: TObject);
  private
    procedure LoadState;
    procedure SaveState(B: boolean);
    { Private declarations }
  public
    ExpFlag : boolean;
    procedure CheckBtn;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CheckBtn;
begin
  btnEn.Enabled := not ExpFlag;
  btnDis.Enabled := ExpFlag;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LoadState;
end;

procedure TForm1.LoadState;
var
    S : String;
    IniFile : TIniFile;
begin
  S := ExtractFilePath(Application.ExeName);
  S := S + 'EManager_exp.ini';
  ExpFlag := true;
  if  FileExists(S) then
  begin
    IniFile := TIniFile.Create(S);
    with IniFile do
    begin
      ExpFlag := ReadBool('AppServer', 'Exp', true);
    end;
    IniFile.Free;
  end;
  CheckBtn;
end;

procedure TForm1.SaveState(B : boolean);
var
    S : String;
    IniFile : TIniFile;
begin
  S := ExtractFilePath(Application.ExeName);
  S := S + 'EManager_exp.ini';
  ExpFlag := true;
  if  FileExists(S) then
  begin
    IniFile := TIniFile.Create(S);
    with IniFile do
    begin
      WriteBool('AppServer', 'Exp', B);
    end;
    IniFile.Free;
  end;
end;

procedure TForm1.btnEnClick(Sender: TObject);
begin
  SaveState(true);
  LoadState;
end;

procedure TForm1.btnDisClick(Sender: TObject);
begin
  SaveState(false);
  LoadState;
end;

end.
