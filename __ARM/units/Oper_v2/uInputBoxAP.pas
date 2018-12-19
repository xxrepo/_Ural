unit uInputBoxAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit;

type
  TSetOfChar = set of char;

  TFrmInputBoxAP = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    RxCalcEdit2: TRxCalcEdit;
    Label2: TLabel;
    procedure btnOkClick(Sender: TObject);
  private
  public
  end;
                   
var
  FrmInputBoxAP: TFrmInputBoxAP;
function InputBoxKrmAP(const ACaption: string; var AName: string; var Value: Extended): boolean;

implementation

{$R *.DFM}
function InputBoxKrmAP(const ACaption: string; var AName: string; var Value: Extended): boolean;
var F : TFrmInputBoxAP;
begin
  Result := false;
  F := TFrmInputBoxAP.Create(nil);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);

    F.Caption := ACaption;
    F.Edit1.Text := AName;
    F.RxCalcEdit2.Value := Value;
    F.ActiveControl := F.Edit1;
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin

      AName := F.Edit1.Text;
      Value := F.RxCalcEdit2.Value;
      
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TFrmInputBoxAP.btnOkClick(Sender: TObject);
begin
  if (trim(Edit1.Text) = '') and (Edit1.Text <> '') then
  begin
    MessageBox(Handle, 'Не надо вводить пробелы, введите нормальное значение', 'Не пытайтесь обмануть программу!!!', MB_OK + MB_ICONERROR);
    Windows.SetFocus(Edit1.Handle);
    ModalResult := mrNone;
    Exit;
  end;
  if trim(Edit1.Text) = '' then
  begin
    MessageBox(Handle, 'Не введено значение', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(Edit1.Handle);
    ModalResult := mrNone;
    Exit;
  end;
end;

end.
