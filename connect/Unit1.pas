unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, MConnect, SConnect, StdCtrls, ADODB, ExtCtrls;

type
  TForm1 = class(TForm)
    rsCA: TSocketConnection;
    rsFlt: TSocketConnection;
    ADOConnection1: TADOConnection;
    Button4: TButton;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    Button5: TButton;
    Button7: TButton;
    Button9: TButton;
    scReplSvc: TSocketConnection;
    Button1: TButton;
    Button11: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    SocketConnection1: TSocketConnection;
    edIP: TEdit;
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
    function getFPassword: String;
    function getFUserName: String;
  public
    property FUserName : String read getFUserName;
    property FPassword : String read getFPassword;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button4Click(Sender: TObject);
begin
  try
    ADOConnection1.Open;
    ShowMessage('Все хорошо');
  except
    on E : Exception do
      ShowMessage('Ошибка ' + E.Message);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  try
    rsCA.Open;
    ShowMessage('Все хорошо');
  except
    on E : Exception do
      ShowMessage('Ошибка ' + E.Message);
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  try
    rsFlt.Open;
    ShowMessage('Все хорошо');
  except
    on E : Exception do
      ShowMessage('Ошибка ' + E.Message);
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if not rsCA.Connected then
    rsCA.Open;
  try
    if rsCA.AppServer.DoLogin(FUserName, FPassword) = 1 then
      ShowMessage('Залогинился')
    else
      ShowMessage('В доступе отказано');
  except
    on E : Exception do
      ShowMessage('Ошибка ' + E.Message);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 01;
  RadioGroup1Click(nil);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if not rsFlt.Connected then
    rsFlt.Open;
  try
    if rsFlt.AppServer.DoLogin(FUserName, FPassword) = 1 then
      ShowMessage('Залогинился')
    else
      ShowMessage('В доступе отказано');
  except
    on E : Exception do
      ShowMessage('Ошибка ' + E.Message);
  end;

end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
var S : String;
begin
  rsCA.Close;
  rsFlt.Close;
  scReplSvc.Close;

  if RadioGroup1.ItemIndex = 0 then
  begin
    S := '127.0.0.1';
  end
  else
  begin
    S := edIP.Text;

  end;
    rsFlt.Host := S;
    rsCA.Host := S;
    scReplSvc.Host := S;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  try
    scReplSvc.Open;
    ShowMessage('Все хорошо');
  except
    on E : Exception do
      ShowMessage('Ошибка ' + E.Message);
  end;
end;

procedure TForm1.Button11Click(Sender: TObject);
var T : integer;
begin
  if not scReplSvc.Connected then
    scReplSvc.Open;
  try
    T := scReplSvc.AppServer.DoLogin('ika', 'ika');
    if T > 0 then
      ShowMessage('Залогинился')
    else
      ShowMessage('В доступе отказано');
  except
    on E : Exception do
      ShowMessage('Ошибка ' + E.Message);
  end;
end;

function TForm1.getFPassword: String;
begin
  Result := Edit2.Text;
end;

function TForm1.getFUserName: String;
begin
  Result := Edit1.Text;
end;

end.
