unit InputQuery_Obj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls,
  RxLookup, Db;

type
  TfrmInputQuery_Obj = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edName: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    edComment: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    CurrencyEdit1: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    edPlaced: TEdit;
    procedure btnOkClick(Sender: TObject);
  private
  public
  end;
                   
var
  frmInputQuery_Obj: TfrmInputQuery_Obj;
function ShowInputQuery_Obj(var AName, Placed, Comment : string; var Amount : integer): boolean;

implementation

uses foMyFunc;

{$R *.DFM}
function ShowInputQuery_Obj(var AName, Placed, Comment : string; var Amount : integer): boolean;
var F : TfrmInputQuery_Obj;
begin
  Result := false;
  F := TfrmInputQuery_Obj.Create(nil);
  try
    F.edName.Text := AName;
    F.edPlaced.Text := Placed;
    F.edComment.Text := Comment;
    F.CurrencyEdit1.value := Amount;
    
    F.ActiveControl := F.edName;

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AName := F.edName.Text;
      Placed := F.edPlaced.Text;
      Comment := F.edComment.Text;
      Amount := Trunc(F.CurrencyEdit1.value);

      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TfrmInputQuery_Obj.btnOkClick(Sender: TObject);
begin
  if edName.Text = '' then
  begin
    MessageBox(Handle, 'Name not input', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(edName.Handle);
    ModalResult := mrNone;
    Exit;
  end;
{  if edComment.Text = '' then
  begin
    MessageBox(Handle, 'Comment not input', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(edName.Handle);
    ModalResult := mrNone;
    Exit;
  end; }
end;

end.
