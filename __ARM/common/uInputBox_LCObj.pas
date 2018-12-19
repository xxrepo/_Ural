unit uInputBox_LCObj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls, foMyFunc,
  RxLookup, Db, DBClient;

type
  TSetOfChar = set of char;

  TFrmInputBox_LCObj = class(TForm)
    pnCA: TPanel;
    Label8: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    DataSource1: TDataSource;
    cdsAccGroup: TClientDataSet;
    cdsAccGroupid_Group: TIntegerField;
    cdsAccGroupName: TStringField;
    cdsAccGroupCnt: TIntegerField;
    DBLookupComboBox1: TRxDBLookupCombo;
    cdsMNGroup: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    cdsWHGroup: TClientDataSet;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    IntegerField4: TIntegerField;
    procedure btnOkClick(Sender: TObject);
  private
  public
  end;
                   
var
  FrmInputBox_LCObj: TFrmInputBox_LCObj;
function InputBox_LCObj(AEObjType : TEObjType; const ACaption: string; var AName: string; var id_Group : Variant; id_Business : integer): boolean;

implementation

{$R *.DFM}
function InputBox_LCObj(AEObjType : TEObjType; const ACaption: string; var AName: string; var id_Group : Variant; id_Business : integer): boolean;
var F : TFrmInputBox_LCObj;
begin
  Result := false;
  F := TFrmInputBox_LCObj.Create(nil);
  try
    F.Caption := ACaption;

    F.Edit1.Text := AName;
    F.ActiveControl := F.Edit1;
    case AEObjType of
      eotFin : F.DataSource1.DataSet := F.cdsAccGroup;
      eotWH : F.DataSource1.DataSet := F.cdsWHGroup;
      eotManuf : F.DataSource1.DataSet := F.cdsMNGroup;
    end;

    with TClientDataSet(F.DataSource1.DataSet) do
    begin
      Close;
      Params.ParamByName('@id_business').Value := id_Business;
      Open;
    end;
    if not VarIsEmpty(id_Group) and not VarIsNull(id_Group)  then
      F.DBLookupComboBox1.KeyValue := id_Group;

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      if F.DBLookupComboBox1.KeyValue = '' then
        id_Group := Null
      else
        id_Group := F.DBLookupComboBox1.KeyValue;

      AName := F.Edit1.Text;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TFrmInputBox_LCObj.btnOkClick(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    MessageBox(Handle, 'Не введено значение', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(Edit1.Handle);
    ModalResult := mrNone;
  end;
end;

end.
