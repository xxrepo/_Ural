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
function InputBoxStr(const ACaption, APrompt: string; var Value: Variant): boolean;

implementation

{$R *.DFM}
function InputBoxStr(const ACaption, APrompt: string; var Value: Variant): boolean;
var F : TFrmInputBoxStr;
begin
  Result := false;
  F := TFrmInputBoxStr.Create(nil);
  try
    if ACaption <> '' then
      F.Caption := ACaption;
    if APrompt <> '' then
      F.Label1.Caption := APrompt;


    F.Edit1.Left := F.Label1.Left + F.Label1.Width + 10;
    F.Width := F.Edit1.Left + F.Edit1.Width + 10;

    if Value <> Null then
      F.Edit1.Text := Value;
    F.ActiveControl := F.Edit1;

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
    Application.MessageBox('Не введено значение', 'Не введены данные', MB_ICONERROR + MB_YESNOCANCEL);
  end; 
end;

end.
