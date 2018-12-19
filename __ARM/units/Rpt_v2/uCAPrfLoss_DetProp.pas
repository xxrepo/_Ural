unit uCAPrfLoss_DetProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, foMyFunc;

type
  TSetOfChar = set of char;

  TCAPrfLoss_Det_Prop = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    cbWareProff: TCheckBox;
    cbFinProff: TCheckBox;
    cbOffProff: TCheckBox;
    cbCurProff: TCheckBox;
    cbWareLoss: TCheckBox;
    cbFinLoss: TCheckBox;
    cbOffLoss: TCheckBox;
    cbCurLoss: TCheckBox;
    procedure btnOkClick(Sender: TObject);
  private
  public
  end;
                   
var
  CAPrfLoss_Det_Prop: TCAPrfLoss_Det_Prop;
function ShowCAPrfLoss_Det_Prop(var ABlnDetail : TPL_DetailData): boolean;

implementation

{$R *.DFM}
function ShowCAPrfLoss_Det_Prop(var ABlnDetail : TPL_DetailData): boolean;
var F : TCAPrfLoss_Det_Prop;
begin
  Result := false;
  F := TCAPrfLoss_Det_Prop.Create(nil);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      ABlnDetail.WareProff := F.cbWareProff.Checked;
      ABlnDetail.WareLoss := F.cbWareLoss.Checked;

      ABlnDetail.FinProff := F.cbFinProff.Checked;
      ABlnDetail.FinLoss := F.cbFinLoss.Checked;

      ABlnDetail.OffProff := F.cbOffProff.Checked;
      ABlnDetail.OffLoss := F.cbOffLoss.Checked;

      ABlnDetail.CurProff := F.cbCurProff.Checked;
      ABlnDetail.CurLoss := F.cbCurLoss.Checked;

      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TCAPrfLoss_Det_Prop.btnOkClick(Sender: TObject);
begin
  if not cbWareProff.Checked and
     not cbWareLoss.Checked and

     not cbFinProff.Checked and
     not cbFinLoss.Checked and

     not cbOffProff.Checked and
     not cbOffLoss.Checked and

     not cbCurProff.Checked and
     not cbCurLoss.Checked then
  begin
    MessageBox(Handle, 'Не выбран ни один тип операций', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(cbWareProff.Handle);
    ModalResult := mrNone;
  end;

end;

end.
