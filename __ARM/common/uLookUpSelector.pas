unit uLookUpSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls, foMyFunc,
  RxLookup, Db, DBClient;

type
  TLookUpSelector = class(TForm)
    pnCA: TPanel;
    Label8: TLabel;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    DataSource1: TDataSource;
    DBLookupComboBox1: TRxDBLookupCombo;
    procedure btnOkClick(Sender: TObject);
  private
  public
  end;
                   
var
  LookUpSelector: TLookUpSelector;
function ShowLookUpSelector(LookupDataSet : TDataSet; const ACaption, ALookupField, ALookupDisplay: string; var Aid : integer): boolean;

implementation

{$R *.DFM}
function ShowLookUpSelector(LookupDataSet : TDataSet; const ACaption, ALookupField, ALookupDisplay: string; var Aid : integer): boolean;
var F : TLookUpSelector;
begin
  Result := false;
  F := TLookUpSelector.Create(nil);
  try
    F.Caption := ACaption;

    F.DataSource1.DataSet := LookupDataSet;
    F.DBLookupComboBox1.LookupField := ALookupField;
    F.DBLookupComboBox1.LookupDisplay := ALookupDisplay;

    if not VarIsEmpty(Aid) and not VarIsNull(Aid)  then
      F.DBLookupComboBox1.KeyValue := Aid;

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      if F.DBLookupComboBox1.KeyValue = '' then
        Aid := -1
      else
        Aid := F.DBLookupComboBox1.KeyValue;

      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TLookUpSelector.btnOkClick(Sender: TObject);
begin
  if DBLookupComboBox1.KeyValue = '' then
  begin
    MessageBox(Handle, 'Ничего не выбрано', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(DBLookupComboBox1.Handle);
    ModalResult := mrNone;
  end;
end;

end.
