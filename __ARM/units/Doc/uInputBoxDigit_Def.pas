unit uInputBoxDigit_Def;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, dxCntner, dxEditor,
  dxExEdtr, dxEdLib, dxCalc;

type
  TSetOfChar = set of char;

  TFrmInputBoxDigit_Def = class(TForm)
    Label1: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    dxCalculator: TdxCalculator;
    RxCalcEdit1: TdxCalcDisplay;
    CheckBox1: TCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure RxCalcEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure dxCalculatorResult(Sender: TObject);
    procedure dxCalculatorKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    FAllCh : set of char;
  end;

var
  FrmInputBoxDigit_Def: TFrmInputBoxDigit_Def;
function InputBoxDigit_Def(const AHandle : HWnd; const ACaption, APrompt: string; var Value: Variant; var isDef : boolean; AFormat : String = '0.##'): boolean;

implementation

uses foMyFunc, uDM;

{$R *.DFM}
function InputBoxDigit_Def(const AHandle : HWnd; const ACaption, APrompt: string; var Value: Variant; var isDef : boolean; AFormat : String = '0.##'): boolean;
var F : TFrmInputBoxDigit_Def;
begin
  Result := false;
  F := TFrmInputBoxDigit_Def.Create(nil);
  try
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);
    if ACaption <> '' then
      F.Caption := ACaption;
    if APrompt <> '' then
      F.Label1.Caption := APrompt;

//    F.RxCalcEdit1.Left := F.Label1.Left + F.Label1.Width + 10;
//    F.Width := F.RxCalcEdit1.Left + F.RxCalcEdit1.Width + 10;

    if Value <> Null then
      F.dxCalculator.Value := Value;
 //   F.RxCalcEdit1.DisplayFormat := AFormat;
    F.CheckBox1.Checked := isDef;
    F.ActiveControl := F.dxCalculator;

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      isDef := F.CheckBox1.Checked;
      Value := F.dxCalculator.Value;
      if integer(Trunc(Value*100)) - Value*100 <> 0 then
        Value := Trunc(Value*100 + 0.5*(abs(Value)/Value))/100;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TFrmInputBoxDigit_Def.btnOkClick(Sender: TObject);
begin
  if RxCalcEdit1.Text = '' then
  begin
    ModalResult := mrNone;
    Windows.SetFocus(RxCalcEdit1.Handle);
    MessageBox(Handle, 'Не введено число', 'Не введены данные', MB_ICONERROR + MB_OK);
  end;
end;

procedure TFrmInputBoxDigit_Def.RxCalcEdit1KeyPress(Sender: TObject;
  var Key: Char);
var P : integer;
    S : String;
begin
{  with TdxCalcEdit(Sender) do
  begin
    if Key in ['0'..'9', #8, DecimalSeparator] then
    begin
      S := Text;
      P := Pos(DecimalSeparator, S);
      if (P > 0) and (Length(S) - P = 2) then
        Key := #0;
    end
    else
      Key := #0;
  end;   }

end;

procedure TFrmInputBoxDigit_Def.dxCalculatorResult(Sender: TObject);
var Value : variant;
begin
  Value := dxCalculator.Value;
  if Value > 0 then
    dxCalculator.Value := (Trunc(Value*100 + 0.5)/100)
  else
    dxCalculator.Value := (Trunc(Value*100 - 0.5)/100);
end;

procedure TFrmInputBoxDigit_Def.dxCalculatorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    ModalResult := mrOk;
end;

procedure TFrmInputBoxDigit_Def.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TFrmInputBoxDigit_Def.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

end.
