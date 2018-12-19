unit uInputBoxStr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit;

type
  TSetOfChar = set of char;

  TFrmInputBoxStr = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    FAllCh : set of char;
  end;

var
  FrmInputBoxStr: TFrmInputBoxStr;
function InputBoxStr(const AHandle : HWnd;const ACaption, APrompt: string; var Value: Variant; AMaxLength: Integer = -1; PasswordChar : Char = #0): boolean;

implementation

{$R *.DFM}
function InputBoxStr(const AHandle : HWnd;const ACaption, APrompt: string; var Value: Variant; AMaxLength: Integer; PasswordChar : Char): boolean;
var F : TFrmInputBoxStr;
begin
  Result := false;
  F := TFrmInputBoxStr.Create(nil);
  try
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);
    if AMaxLength <> -1 then
      F.Edit1.MaxLength := AMaxLength; 
    if ACaption <> '' then
      F.Caption := ACaption;
    if APrompt <> '' then
      F.Label1.Caption := APrompt;


    F.Edit1.Left := F.Label1.Left + F.Label1.Width + 10;
    F.Width := F.Edit1.Left + F.Edit1.Width + 10;

    if Value <> Null then
      F.Edit1.Text := Value;
    F.ActiveControl := F.Edit1;
    F.Edit1.PasswordChar := PasswordChar;
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin

      Value := F.Edit1.Text;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TFrmInputBoxStr.btnOkClick(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ModalResult := mrNone;
    Windows.SetFocus(Edit1.Handle);
    MessageBox(Handle, 'Не введено значение', 'Не введены данные', MB_ICONERROR + MB_OK);
  end; 
end;

end.
