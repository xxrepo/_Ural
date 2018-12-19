unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OleCtnrs, ExtCtrls, sDialogs, ExtDlgs;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button2: TButton;
    sOpenDialog1: TsOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel2: TPanel;
    OleContainer1: TOleContainer;
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}




procedure TForm1.Button2Click(Sender: TObject);
var FS : TFileStream;
begin
 if sOpenDialog1.Execute then
 begin
  { FS := TFileStream.Create(sOpenDialog1.FileName, fmOpenRead	);
   FS.Position:= 0;
   OleContainer1.LoadFromStream(FS); }
   OleContainer1.CreateObjectFromFile(sOpenDialog1.FileName, true);

   OleContainer1.Run;
    OleContainer1.AutoActivate := aaManual;
   OleContainer1.DoVerb(ovShow);  // not in FormCreate, in or after FormShow

   Height := Height +10;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var S : String;
begin
  S := sOpenDialog1.FileName;
  S := StringReplace(S, '.', '_new.', []);
  OleContainer1.OleObject.SaveAs(S);
  OleContainer1.DestroyObject;

end;

end.
