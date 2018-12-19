unit uObjName;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, AdvOfficeButtons;

type
  TObjName = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    Label2: TLabel;
    CheckBox1: TAdvOfficeCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ObjName: TObjName;

function InputBox_ObjName(const ACaption: string; var AName, AComment: string; var ADef : Variant): boolean;

implementation

{$R *.DFM}

function InputBox_ObjName(const ACaption: string; var AName, AComment: string; var ADef : Variant): boolean;
var F : TObjName;
begin
  if VarIsEmpty(ADef) then
    ADef := Null;
  Result := false;
  F := TObjName.Create(nil);
  try
    F.Caption := ACaption;

    F.Edit1.Text := AName;
    F.Memo1.Lines.Text := AComment;
    F.ActiveControl := F.Edit1;

    F.CheckBox1.Visible := ADef <> Null;
    if F.CheckBox1.Visible then
      F.CheckBox1.Checked := ADef;

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AName := F.Edit1.Text;
      AComment := F.Memo1.Lines.Text;
      if F.CheckBox1.Visible then
        ADef := F.CheckBox1.Checked
      else
        ADef := Null;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

end.
