unit uArc_OperSet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit;

type
  TArc_OperSet = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Arc_OperSet: TArc_OperSet;

function InputArcDate(const AHandle : HWnd; const ACaption, APrompt: string; var ADate: Variant): boolean;

implementation

{$R *.DFM}

function InputArcDate(const AHandle : HWnd; const ACaption, APrompt: string; var ADate: Variant): boolean;
var F : TArc_OperSet;
begin
  Result := false;
  F := TArc_OperSet.Create(nil);
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

procedure TArc_OperSet.btnOkClick(Sender: TObject);
begin
  if DateEdit1.Date = 0 then
  begin
    ModalResult := mrNone;
    Windows.SetFocus(DateEdit1.Handle);
    MessageBox(Handle, 'Не введена дата', 'Не введены данные', MB_ICONERROR + MB_YESNOCANCEL);
  end;
end;

end.
