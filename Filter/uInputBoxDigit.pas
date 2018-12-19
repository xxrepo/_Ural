unit uInputBoxDigit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit;

type
  TSetOfChar = set of char;

  TFrmInputBoxDigit = class(TForm)
    Label1: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    RxCalcEdit1: TRxCalcEdit;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    FAllCh : set of char;
  end;

var
  FrmInputBoxDigit: TFrmInputBoxDigit;
function InputBoxDigit(const ACaption, APrompt: string; var Value: Variant; AFormat : String = '0.##'): boolean;

implementation

{$R *.DFM}
function InputBoxDigit(const ACaption, APrompt: string; var Value: Variant; AFormat : String = '0.##'): boolean;
function StrToFloatAdv(S: string): Extended;
begin
  S := trim(S);
  if S = '' then
    Result := 0
  else
  begin
    if (DecimalSeparator = '.') then
      S := StringReplace(Trim(S), ',', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
    if (DecimalSeparator = ',') then
      S := StringReplace(Trim(S), '.', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
    try
      Result := StrToFloat(S);
    except
      Result := 0;
    end;
  end;
end;

var F : TFrmInputBoxDigit;
begin
  Result := false;
  F := TFrmInputBoxDigit.Create(nil);
  try
    if ACaption <> '' then
      F.Caption := ACaption;
    if APrompt <> '' then
      F.Label1.Caption := APrompt;

    F.RxCalcEdit1.Left := F.Label1.Left + F.Label1.Width + 10;
    F.Width := F.RxCalcEdit1.Left + F.RxCalcEdit1.Width + 10;

    if Value <> Null then
      F.RxCalcEdit1.Value := Value;
    F.RxCalcEdit1.DisplayFormat := AFormat;
    F.ActiveControl := F.RxCalcEdit1;

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin

      Value := F.RxCalcEdit1.Value;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TFrmInputBoxDigit.btnOkClick(Sender: TObject);
begin
  if RxCalcEdit1.Text = '' then
  begin
    ModalResult := mrNone;
    Windows.SetFocus(RxCalcEdit1.Handle);
    Application.MessageBox('Не введено число', 'Не введены данные', MB_ICONERROR + MB_YESNOCANCEL);
  end; 
end;

end.
