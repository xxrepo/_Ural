unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;
const
  Mapi32Dll = 'mapi32.dll';
type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var MAPIDLLHandle:THandle;
begin
  MAPIDLLHandle:=LoadLibrary('MAPI32.DLL');
  if MAPIDLLHandle = 0 then
  begin
    ShowMessage('Œ¯Ë·Í‡ ' + SysErrorMessage(GetLastError));
  end
  else
    ShowMessage('ŒÍ');

end;

end.
 