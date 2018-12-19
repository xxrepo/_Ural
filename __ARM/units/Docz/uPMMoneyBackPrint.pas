unit uPMMoneyBackPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Mask, ToolEdit, CurrEdit,
  Db, DBClient, DBCtrls, RXDBCtrl, Qrctrls, QuickRpt, Buttons;

type
  TPMMoneyBackPrint = class(TForm)
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
    Label4: TLabel;
    edAppendix: TEdit;
    cdsPayMentGetProp: TClientDataSet;
    dsPayMentGetProp: TDataSource;
    cdsPayMentGetPropid_PayMent: TAutoIncField;
    cdsPayMentGetPropDateCreate: TDateTimeField;
    cdsPayMentGetPropid_PayerOrg: TIntegerField;
    cdsPayMentGetPropid_Creator: TIntegerField;
    cdsPayMentGetPropDateClose: TDateTimeField;
    cdsPayMentGetPropid_Closer: TIntegerField;
    cdsPayMentGetPropDateEnd: TDateTimeField;
    cdsPayMentGetPropCreator: TStringField;
    cdsPayMentGetPropPayer: TStringField;
    cdsPayMentGetPropid_Client: TIntegerField;
    cdsPayMentGetPropBaseType: TIntegerField;
    cdsPayMentGetPropid_Base: TIntegerField;
    cdsPayMentGetPropid_Currency: TIntegerField;
    cdsPayMentGetPropCurrencyName: TStringField;
    cdsPayMentGetPropSumm: TFloatField;
    cdsPayMentGetPropMoneyBack: TBooleanField;
    cdsPayMentGetPropCheckNum: TStringField;
    cdsPayMentGetPropPayForm: TIntegerField;
    cdsPayMentGetPropOffShore: TBooleanField;
    cdsPayMentGetPropExchPercent: TFloatField;
    cdsPayMentGetPropSummUSD: TFloatField;
    cdsPayMentGetPropid_Reserv: TIntegerField;
    cdsPayMentGetPropid_TicketOrder: TIntegerField;
    cdsPayMentGetPropSummRBL: TFloatField;
    cdsPayMentGetPropPayBase: TStringField;
    cdsPayMentGetPropDescr: TStringField;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    BitBtn1: TBitBtn;
    QuickRep2: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
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
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel50: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape10: TQRShape;
    QRLabel75: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel76: TQRLabel;
    QRLabel79: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel80: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel77: TQRLabel;
    cdsPayMentGetPropWasChecked: TIntegerField;
    cdsPayMentGetPropRate: TFloatField;
    Label5: TLabel;
    edBase: TEdit;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    TextCop: TQRDBText;
    TExtRbl: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape11: TQRShape;
    QRLabel7: TQRLabel;
    lbAppendix: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText2: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure ttKopPrint(sender: TObject; var Value: String);
    procedure AppendixPrint(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure TextCopPrint(sender: TObject; var Value: String);
    procedure TExtRblPrint(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    procedure SetPaymentID(AID : integer);
  end;

var
  PMMoneyBackPrint: TPMMoneyBackPrint;
  procedure ShowPMMoneyBackPrint(id_Oper : integer);
  
implementation

uses uDM, NumTools;

{$R *.DFM}

procedure ShowPMMoneyBackPrint(id_Oper : integer);
var F : TPMMoneyBackPrint;
begin
  F := TPMMoneyBackPrint.Create(nil);
  try
    F.SetPaymentID(id_Oper);
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure TPMMoneyBackPrint.FormCreate(Sender: TObject);
begin
  PageControl1.Pages[1].Visible := false;
  PageControl1.Pages[1].TabVisible := false;
  PageControl1.Pages[0].TabVisible := false;
  PageControl1.ActivePageIndex := 0;
  Width := 10;
  Height := 10;
end;

procedure TPMMoneyBackPrint.SetPaymentID(AID: integer);
begin
  with cdsPayMentGetProp do
  begin
    Close;
    Params.ParamByName('@id_Payment').Value := AID;
    Open;
  end;
end;

procedure TPMMoneyBackPrint.btnOkClick(Sender: TObject);
begin
  if (edBase.Text = '') then
  begin
    Application.MessageBox('Не введено основание', '', MB_ICONERROR + MB_OK);
    ModalResult := mrNone;
  end
  else
    QuickRep2.Preview;
end;

procedure TPMMoneyBackPrint.QRLabel9Print(sender: TObject; var Value: String);
begin
  Value := '';
end;

procedure TPMMoneyBackPrint.QRDBText5Print(sender: TObject; var Value: String);
var SSS : Extended;
begin
  SSS := (sender as TQRDBText).DataSet.FieldByName('SummRBL').AsFloat;
  Value := ' ' + NumeralToPhrase('0' + IntToStr(Trunc(SSS))) + ' руб. ' + FormatFloat(' 00 коп.', Frac(SSS) * 100);
end;

procedure TPMMoneyBackPrint.QRDBText6Print(sender: TObject; var Value: String);
var SSS : Extended;
    N, maxN : integer;
    S : String;
begin
  SSS := (sender as TQRDBText).DataSet.FieldByName('SummRBL').AsFloat;
  Value := ' ' + NumeralToPhrase('0' + IntToStr(Trunc(SSS))) + ' руб. ' + FormatFloat(' 00 коп.', Frac(SSS) * 100);
{  Value := ' ' + NumeralToPhrase('0' + FloatToStr(SSS));
  N := Length(Value);
  maxN := 0;//210;
  if (maxN - N) > 0 then
    S := StringOfChar(' ', maxN - N)
  else
    S := '';
  Value := Value + S + 'руб.  ' + FormatFloat(' 00 коп.', Frac(SSS) * 100);}
end;

procedure TPMMoneyBackPrint.ttKopPrint(sender: TObject; var Value: String);
var Year, Month, Day: Word;
begin
  DecodeDate((sender as TQRDBText).DataSet.FieldByName('DateCreate').AsDateTime, Year, Month, Day);
  Value := '  "' + FormatFloat('00', Day) + '"  ' + FormatFloat('00', Month) + '.' + FormatFloat('00', Year);
end;

procedure TPMMoneyBackPrint.AppendixPrint(sender: TObject; var Value: String);
begin
  Value := edAppendix.Text;
end;

procedure TPMMoneyBackPrint.QRDBText7Print(sender: TObject; var Value: String);
var SSS : Extended;
    N, maxN : integer;
    S : String;
begin
  SSS := trunc((sender as TQRDBText).DataSet.FieldByName('SummRBL').AsFloat);
  Value := ' ' + NumeralToPhrase('0' + IntToStr(Trunc(SSS))) + ' руб. ';
{  N := Length(Value);
  maxN := 0;//210;
  if (maxN - N) > 0 then
    S := StringOfChar(' ', maxN - N)
  else
    S := '';  
  Value := Value + S;// + 'руб.  ' + FormatFloat(' 00 коп.', Frac(SSS));    }
end;

procedure TPMMoneyBackPrint.TextCopPrint(sender: TObject;
  var Value: String);
var SSS : Extended;
begin
  SSS := (sender as TQRDBText).DataSet.FieldByName('SummRBL').AsFloat;
  Value := FormatFloat(' 00 коп.', Frac(SSS) * 100);
end;

procedure TPMMoneyBackPrint.TExtRblPrint(sender: TObject;
  var Value: String);
var SSS : Extended;
begin
  SSS := (sender as TQRDBText).DataSet.FieldByName('SummRBL').AsFloat;
  Value := ' ' + FormatFloat('0 руб.', trunc(SSS));
end;

procedure TPMMoneyBackPrint.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  Value := edBase.Text;
end;

end.
