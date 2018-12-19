unit uInputBoxDate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit;

type
  TSetOfChar = set of char;

  TfrmInputBoxDate = class(TForm)
    Label1: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    DateEdit1: TDateEdit;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    FAllCh : set of char;
  end;

var
  frmInputBoxDate: TfrmInputBoxDate;
function InputBoxDate(const AHandle : HWnd; const ACaption, APrompt: string; var ADate: Variant): boolean;

implementation

{$R *.DFM}
function InputBoxDate(const AHandle : HWnd; const ACaption, APrompt: string; var ADate: Variant): boolean;
var F : TfrmInputBoxDate;
begin
  Result := false;
  F := TfrmInputBoxDate.Create(nil);
  try
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);
    if ACaption <> '' then
      F.Caption := ACaption;
    if APrompt <> '' then
      F.Label1.Caption := APrompt;

    F.DateEdit1.Left := F.Label1.Left + F.Label1.Width + 10;
    F.Width := F.DateEdit1.Left + F.DateEdit1.Width + 10;

    if ADate <> Null then
    begin
      if (varType(ADate) <> varDate) then
        ADate := StrToDate(ADate);
      F.DateEdit1.Date := ADate;
    end;
    
    F.ActiveControl := F.DateEdit1;
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin

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
    MessageBox(Handle, 'Не введена дата', 'Не введены данные', MB_ICONERROR + MB_OK);
  end;
end;

end.
