unit uPMPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Mask, ToolEdit, CurrEdit,
  Db, DBClient, DBCtrls, RXDBCtrl, Qrctrls, QuickRpt, Buttons, frOperFin;

type
  TPMPrint = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edAndOther: TEdit;
    edAppendix: TEdit;
    dsPayMentGetProp: TDataSource;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    BitBtn1: TBitBtn;
    QuickRep2: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape2: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape10: TQRShape;
    QRLabel68: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel75: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel76: TQRLabel;
    QRLabel79: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    CurrencyEdit1: TCurrencyEdit;
    QRLabel85: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QuickRep2BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRLabel33Print(sender: TObject; var Value: String);
    procedure QRLabel16Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
  private
    FOperFin : TfOperFin;
    function GetSum: Extended;

  public
    procedure SetPaymentID(AOperFin : TfOperFin);
  end;


var
  PMPrint: TPMPrint;
procedure ShowPMPrint(AOperFin : TfOperFin);

implementation

uses NumTools;

procedure ShowPMPrint(AOperFin : TfOperFin);
var F : TPMPrint;
begin
  F := TPMPrint.Create(nil);
  try
    F.SetPaymentID(AOperFin);
    F.ShowModal;
  finally
    F.Free;
  end;
end;

{$R *.DFM}



procedure TPMPrint.FormCreate(Sender: TObject);
begin
  PageControl1.Pages[1].Visible := false;
  PageControl1.Pages[1].TabVisible := false;
  PageControl1.Pages[0].TabVisible := false;
  PageControl1.ActivePageIndex := 0;
  Width := 10;
  Height := 10;
end;

procedure TPMPrint.SetPaymentID(AOperFin : TfOperFin);
var SSS : Extended;
    i : integer;
begin
  FOperFin := AOperFin;
  dsPayMentGetProp.DataSet := FOperFin.cdsOperFin;
  SSS := dsPayMentGetProp.DataSet.FieldByName('PriceOper').AsFloat * FOperFin.fCurSelector1.RateRBL;
  CurrencyEdit1.Value := SSS;
  SSS := SSS - SSS/1.18;

  edAndOther.Text := 'НДС ' + FormatFloat('0 руб.', Trunc(SSS)) + FormatFloat(' 00 коп.', Frac(SSS) * 100);

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TQRDBText then
      TQRDBText(Components[i]).DataSet := dsPayMentGetProp.DataSet;
end;

procedure TPMPrint.btnOkClick(Sender: TObject);
begin
  QuickRep2.Preview;
end;

procedure TPMPrint.QRLabel9Print(sender: TObject; var Value: String);
begin
  Value := '';
end;

function TPMPrint.GetSum : Extended;
begin
  Result := CurrencyEdit1.Value;
  ;
end;

procedure TPMPrint.QRDBText5Print(sender: TObject; var Value: String);
var SSS : Extended;
begin
  SSS := GetSum;
  Value := ' ' + FormatFloat('0 руб.', Trunc(SSS)) + FormatFloat(' 00 коп.', Frac(SSS) * 100);
end;

procedure TPMPrint.QRDBText6Print(sender: TObject; var Value: String);
var SSS : Extended;
    N, maxN : integer;
    S : String;
begin
  SSS := GetSum;
  Value := ' ' + NumeralToPhrase('0' + IntToStr(Trunc(SSS))) + ' руб. ' + FormatFloat(' 00 коп.', Frac(SSS) * 100);
end;

procedure TPMPrint.QRDBText7Print(sender: TObject; var Value: String);
var SSS : Extended;
    N, maxN : integer;
    S : String;
begin
  SSS := GetSum;
  Value := ' ' + NumeralToPhrase('0' + IntToStr(Trunc(SSS))) + ' руб. ' + FormatFloat(' 00 коп.', Frac(SSS) * 100);
end;


procedure TPMPrint.QuickRep2BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabel2.Color := clWindow;
end;

procedure TPMPrint.QRDBText2Print(sender: TObject; var Value: String);
var Year, Month, Day: Word;
begin
  DecodeDate((sender as TQRDBText).DataSet.FieldByName('DateCreate').AsDateTime, Year, Month, Day);
  Value := '  "' + FormatFloat('00', Day) + '"  ' + FormatFloat('00', Month) + '.' + FormatFloat('00', Year);
end;

procedure TPMPrint.QRLabel33Print(sender: TObject; var Value: String);
begin
  Value := edAndOther.Text;
end;

procedure TPMPrint.QRLabel16Print(sender: TObject; var Value: String);
begin
  Value := edAppendix.Text;
end;


end.
