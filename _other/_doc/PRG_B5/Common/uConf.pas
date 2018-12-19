unit uConf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TConf = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    FXXX : integer;
  end;

var
  Conf: TConf;
function ShowConf(ACaption : String) : boolean;

implementation

function ShowConf(ACaption : String) : boolean;
var F : TConf;
    X : integer;
begin
  Result := false;
  F := TConf.Create(nil);
  try
    X := GetTickCount Mod 3 + 1;
    F.Label1.Caption := 'Press button ' + inttoStr(X) + ' for deletion "' + ACaption + '"';

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := X = F.FXXX;
    end;
  finally
    F.Free;
  end;
end;

{$R *.DFM}

procedure TConf.Button1Click(Sender: TObject);
begin
  FXXX := 1;
end;

procedure TConf.Button2Click(Sender: TObject);
begin
  FXXX := 2;
end;

procedure TConf.Button3Click(Sender: TObject);
begin
  FXXX := 3;

end;

end.
