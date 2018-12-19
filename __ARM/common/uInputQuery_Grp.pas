unit uInputQuery_Grp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls,
  RxLookup, Db, DBClient;

type
  TSetOfChar = set of char;

  TFrmuInputQuery_Grp = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cbShowInRoot: TCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;
                   
var
  FrmuInputQuery_Grp: TFrmuInputQuery_Grp;
function InputQuery_Grp(const ACaption: string; var AName: string; var AShowInRoot : boolean): boolean;

implementation

{$R *.DFM}
function InputQuery_Grp(const ACaption: string; var AName: string; var AShowInRoot : boolean): boolean;
var F : TFrmuInputQuery_Grp;
begin
  Result := false;
  F := TFrmuInputQuery_Grp.Create(nil);
  try
    F.Caption := ACaption;

    F.Edit1.Text := AName;
    F.ActiveControl := F.Edit1;
    F.cbShowInRoot.Checked := AShowInRoot;
    
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AName := F.Edit1.Text;
      AShowInRoot := F.cbShowInRoot.Checked;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TFrmuInputQuery_Grp.btnOkClick(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    MessageBox(Handle, 'Не введено название', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(Edit1.Handle);
    ModalResult := mrNone;
  end;
end;

procedure TFrmuInputQuery_Grp.FormCreate(Sender: TObject);
begin
{$IFDEF LC}
  cbShowInRoot.Visible := false;
{$ENDIF}
end;

end.
