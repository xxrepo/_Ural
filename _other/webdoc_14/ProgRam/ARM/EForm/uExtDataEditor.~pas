unit uExtDataEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit;

type
  TSetOfChar = set of char;

  TExtDataEditor = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    CheckBox1: TCheckBox;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    FAllCh : set of char;
  end;

var
  ExtDataEditor: TExtDataEditor;
function ShowExtDataEditor(var AName: string; var AVisible : boolean): boolean;

implementation

{$R *.DFM}
function ShowExtDataEditor(var AName: string; var AVisible : boolean): boolean;
var F : TExtDataEditor;
begin
  Result := false;
  F := TExtDataEditor.Create(nil);
  try
    F.CheckBox1.Checked := AVisible;
 
    F.Edit1.Text := AName;
    F.ActiveControl := F.Edit1;

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin

      AName := F.Edit1.Text;
      AVisible := F.CheckBox1.Checked;
 
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TExtDataEditor.btnOkClick(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ModalResult := mrNone;
    Windows.SetFocus(Edit1.Handle);
    MessageBox(Handle, 'Не введено название', 'Не введены данные', MB_ICONERROR + MB_YESNOCANCEL);
  end; 
end;

end.
