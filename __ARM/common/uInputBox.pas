unit uInputBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit;

type
  TSetOfChar = set of char;

  TFrmInputBox = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    RxCalcEdit1: TRxCalcEdit;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
  private
    Cnt : TCustomEdit;
  public
    FAllCh : set of char;
  end;
                   
var
  FrmInputBox: TFrmInputBox;
function InputBoxKrm(const ACaption, APrompt: string; var Value: string; AllowChars : TSetOfChar = [Char(0)..Char(255)]; NeedDigit : boolean = false; AOwner : TObject = nil): boolean;

implementation

{$R *.DFM}
function InputBoxKrm(const ACaption, APrompt: string; var Value: string; AllowChars : TSetOfChar; NeedDigit : boolean; AOwner : TObject): boolean;
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

var F : TFrmInputBox;
begin
  Result := false;
  F := TFrmInputBox.Create(nil);
  try
    if AOwner is TWinControl then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, TWinControl(AOwner).Handle)
    else
      if Screen.ActiveForm <> nil then
        SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);

    F.Caption := ACaption;
    F.Label1.Caption := APrompt;
    F.Edit1.Visible := not NeedDigit;
    F.RxCalcEdit1.Visible := NeedDigit;

    if NeedDigit then
      F.Cnt := F.RxCalcEdit1
    else
      F.Cnt := F.Edit1;

    F.Cnt.Left := F.Label1.Left + F.Label1.Width + 10;
    F.Width := F.Cnt.Left + F.Cnt.Width + 10;
    if NeedDigit then
      F.RxCalcEdit1.Value := StrToFloatAdv(Value)
    else
      F.Cnt.Text := Value;
    F.ActiveControl := F.Cnt;
    F.FAllCh := AllowChars;
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin

      Value := F.Cnt.Text;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TFrmInputBox.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in FAllCh)) and (Key <> #8) then
  begin
    Key := #0;
    MessageBeep(MB_ICONASTERISK);
  end;
end;

procedure TFrmInputBox.btnOkClick(Sender: TObject);
begin
  if (trim(Cnt.Text) = '') and (Cnt.Text <> '') then
  begin
    MessageBox(Handle, 'Не надо вводить пробелы, введите нормальное значение', 'Не пытайтесь обмануть программу!!!', MB_OK + MB_ICONERROR);
    Windows.SetFocus(Cnt.Handle);
    ModalResult := mrNone;
    Exit;
  end;
  if trim(Cnt.Text) = '' then
  begin
    MessageBox(Handle, 'Не введено значение', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(Cnt.Handle);
    ModalResult := mrNone;
    Exit;
  end;
end;

end.
