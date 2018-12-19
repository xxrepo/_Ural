unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, ADODB, ImgList, OleCtrls,
  SHDocVw, MSHTML, ActiveX, Grids;

type
  TMainForm = class(TForm)
    Button1: TButton;
    ADOConnection1: TADOConnection;
    Button2: TButton;
    Button3: TButton;
    ImageList2: TImageList;
    ImageList1: TImageList;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    SL : TStringList;
    SL2 : TStringList;
    TblCnt, RblNum : integer;
 end;

var
  MainForm: TMainForm;

implementation

uses UnitCurrency, UnitURLsTune, Common, HyperParse;

{$R *.DFM}

procedure TMainForm.Button1Click(Sender: TObject);
begin
  if not Assigned(FormCurrency) then
    FormCurrency:=TFormCurrency.Create(Self)
  else
    FormCurrency.WindowState:=wsMaximized;
  FormCurrency.BringToFront;

end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  if not Assigned(FormURLsTune) then
    FormURLsTune:=TFormURLsTune.Create(Self)
  else
    FormURLsTune.WindowState:=wsMaximized;
  FormURLsTune.BringToFront;
end;

procedure ShowHTMLText(AWebBrowser : TWebBrowser; const AText: String);
var
  HTMLDocument : IHTMLDocument2;
  OldCursor : TCursor;
  V : Variant;
  FOnBeforeNavigate2: TWebBrowserBeforeNavigate2;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    FOnBeforeNavigate2 := AWebBrowser.OnBeforeNavigate2;
    AWebBrowser.OnBeforeNavigate2 := nil;
    AWebBrowser.Navigate('about:blank');
    while AWebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;

    HTMLDocument := IHTMLDocument2(AWebBrowser.Document);
    if Assigned(HTMLDocument) then
    begin
      V := VarArrayCreate([0, 0], varVariant);
      v[0] := AText; 
      HTMLDocument.Write(PSafeArray(TVarData(v).VArray));
      HTMLDocument.Close;
      while AWebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;
    end;
{    AWebBrowser.Navigate('about:blank');
    while AWebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;

    V := AWebBrowser.Document;
    V.Write(AText);
    while AWebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;   }
  finally
    Screen.Cursor := OldCursor;
    AWebBrowser.OnBeforeNavigate2 := FOnBeforeNavigate2;
  end;

end;

end.
