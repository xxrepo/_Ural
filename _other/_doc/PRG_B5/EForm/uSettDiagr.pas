unit uSettDiagr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls,
  RxLookup, Db, ADODB, Provider, MtUPDPrv, DBClient, ExtDlgs, registry,
  RxCombos;

type
  TSettDiagr = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    ColorDialog1: TColorDialog;
    lb1: TLabel;
    lb3: TLabel;
    Button1: TButton;
    Button3: TButton;
    PP: TPanel;
    PF: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    Fid_CA : Variant;
  public

  end;
                   
var
  SettDiagr: TSettDiagr;
function ShowSettDiagr(var AColorRed, AColorGreen : TColor): boolean;

implementation

uses uDM;

{$R *.DFM}
function ShowSettDiagr(var AColorRed, AColorGreen : TColor): boolean;
var F : TSettDiagr;
begin
  Result := false;
  F := TSettDiagr.Create(nil);
  try
    F.PP.Color := AColorRed;
    F.PF.Color := AColorGreen;

   
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AColorRed := F.PP.Color;
      AColorGreen := F.PF.Color;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;


procedure TSettDiagr.Button1Click(Sender: TObject);
begin
  ColorDialog1.Color := PF.Color;
  if ColorDialog1.Execute then
    PF.Color := ColorDialog1.Color;
end;

procedure TSettDiagr.Button3Click(Sender: TObject);
begin
  ColorDialog1.Color := PP.Color;
  if ColorDialog1.Execute then
    PP.Color := ColorDialog1.Color;

end;

end.
