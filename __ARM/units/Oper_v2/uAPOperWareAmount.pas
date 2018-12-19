unit uAPOperWareAmount;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit;

type
  TAPOperWareAmount = class(TForm)
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    Image3: TImage;
    Label9: TLabel;
    cbZnak3: TComboBox;
    edK: TRxCalcEdit;
    Label2: TLabel;
    edB: TRxCalcEdit;
    Label1: TLabel;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  APOperWareAmount: TAPOperWareAmount;

function ShowOperWareAmount(var K, B : Variant; var Znak : String): boolean;

implementation

uses foMyFunc;

{$R *.DFM}

function ShowOperWareAmount(var K, B : Variant; var Znak : String): boolean;
var F : TAPOperWareAmount;
begin
  Result := false;
  F := TAPOperWareAmount.Create(nil);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    F.edK.Value := StrToFloatAdv(VarToStr(K));
    F.edB.Value := StrToFloatAdv(VarToStr(B));

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      K := F.edK.Value;
      B := F.edB.Value;
      Znak := '*';
      Result := true;
    end;
  finally
    F.Free;
  end;
end;


procedure TAPOperWareAmount.btnOkClick(Sender: TObject);
begin
  if (edK.Value = 0) and (edB.Value = 0) then
  begin
    MessageBox(Handle, 'Не введено значение', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(edK.Handle);
    ModalResult := mrNone;
  end;
end;

end.
