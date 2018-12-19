unit uInputBoxDate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, DB, ADODB,
  RxLookup;

type
  TSetOfChar = set of char;

  TfrmInputBoxDate = class(TForm)
    Label1: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    DateEdit1: TDateEdit;
    qCur: TADOQuery;
    dsCur: TDataSource;
    Label8: TLabel;
    Label2: TLabel;
    ceActPrice: TRxCalcEdit;
    Label3: TLabel;
    ceActAmount: TCurrencyEdit;
    lbCur: TRxDBLookupCombo;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    FAllCh : set of char;
  end;

var
  frmInputBoxDate: TfrmInputBoxDate;
function InputBoxDate(const ACaption, APrompt: string; var ADate: Variant;
           var ActAmount : integer; var ActPrice : Currency; var id_Cur : Variant;
           var CURNAME : String): boolean;

implementation

uses uDM;

{$R *.DFM}
function InputBoxDate(const ACaption, APrompt: string; var ADate: Variant; var ActAmount : integer; var ActPrice : Currency; var id_Cur : Variant;
           var CURNAME : String): boolean;
var F : TfrmInputBoxDate;
begin
  Result := false;
  F := TfrmInputBoxDate.Create(nil);
  try
    if ACaption <> '' then
      F.Caption := ACaption;
    if APrompt <> '' then
      F.Label1.Caption := APrompt;

    if ADate <> Null then
    begin
      if (varType(ADate) <> varDate) then
        ADate := StrToDate(ADate);
      F.DateEdit1.Date := ADate;
    end;
    if id_Cur > 0 then
      F.lbCur.KeyValue := id_Cur;
    F.ceActPrice.Value := ActPrice;
    F.ceActAmount.Value := ActAmount;

    F.ActiveControl := F.DateEdit1;
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin

      if F.lbCur.KeyValue > 0 then
      id_Cur := F.lbCur.KeyValue
        else
      id_Cur := Null;
      CURNAME :=  F.lbCur.Text;
      ActPrice := F.ceActPrice.Value;
      ActAmount := Trunc(F.ceActAmount.Value);
      ADate := F.DateEdit1.Date;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TfrmInputBoxDate.btnOkClick(Sender: TObject);
begin
  if DateEdit1.Date = 0 then
  begin
    ModalResult := mrNone;
    Windows.SetFocus(DateEdit1.Handle);
    Application.MessageBox('Date not selected', '', MB_ICONERROR + MB_YESNOCANCEL);
    Exit;
  end;
  if ceActAmount.Value = 0 then
  begin
    ModalResult := mrNone;
    Windows.SetFocus(ceActAmount.Handle);
    Application.MessageBox('Total not inputed', '', MB_ICONERROR + MB_YESNOCANCEL);
    Exit;
  end;
  if ceActPrice.Value = 0 then
  begin
    ModalResult := mrNone;
    Windows.SetFocus(ceActPrice.Handle);
    Application.MessageBox('Nominal not inputed', '', MB_ICONERROR + MB_YESNOCANCEL);
    Exit;
  end;
  if not (lbCur.KeyValue > 0) then
  begin
    ModalResult := mrNone;
    Windows.SetFocus(lbCur.Handle);
    Application.MessageBox('Currency not selected', '', MB_ICONERROR + MB_YESNOCANCEL);
    Exit;
  end;
end;

procedure TfrmInputBoxDate.FormCreate(Sender: TObject);
begin
  qCur.Open;
end;

end.
