unit uOneItemSelector;
 
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit;

type
  TOneItemSelector = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    ListBox1: TListBox;
    procedure ListBox1DblClick(Sender: TObject);
  private
  public
  end;
                   
var
  OneItemSelector: TOneItemSelector;
function ShowOneItemSelector(TextList: string; var Value: string; ACaption : String = ''): boolean;

implementation

{$R *.DFM}
function ShowOneItemSelector(TextList: string; var Value: string; ACaption : String = ''): boolean;
var F : TOneItemSelector;
    i : integer;
begin
  Result := false;
  F := TOneItemSelector.Create(nil);
  try
    if ACaption <> '' then
      F.Caption := ACaption;
      
    F.ListBox1.Items.Text := TextList;
    F.ListBox1.itemindex := 0;
    for i := 0 to F.ListBox1.Items.Count - 1 do
      F.ListBox1.Items[i] := Trim(F.ListBox1.Items[i]);
 
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin    
      Value := F.ListBox1.Items.Strings[F.ListBox1.itemindex];
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TOneItemSelector.ListBox1DblClick(Sender: TObject);
begin
  btnOk.Click;
end;

end.
