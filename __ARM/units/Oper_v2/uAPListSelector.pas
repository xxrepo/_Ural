unit uAPListSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, frAPList, DB;

type
  TAPListSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fAPList1: TfAPList;
    procedure fAPList1RxDBGrid1DblClick(Sender: TObject);
    procedure fAPList1dsFltListDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  APListSelector: TAPListSelector;

function ShowAPListSelector(var id_AP_Obj : Variant; var AName : String; id_business : integer) : boolean;

implementation

uses foMyFunc;

{$R *.DFM}

function ShowAPListSelector(var id_AP_Obj : Variant; var AName : String; id_business : integer) : boolean;
var F : TAPListSelector;
begin
  Result := false;
  F := TAPListSelector.Create(nil);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    F.fAPList1.Initialize(id_business);
    if id_AP_Obj <> Null then
      F.fAPList1.cdsAPList.Locate('id_AP_Obj', id_AP_Obj, []); 
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := true;
      id_AP_Obj := F.fAPList1.cdsAPListid_AP_Obj.AsInteger;
      AName := F.fAPList1.cdsAPListName.AsString;
    end
  finally
    F.Free;
  end;
end;


procedure TAPListSelector.fAPList1RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
  btnOk.Click;
end;

procedure TAPListSelector.fAPList1dsFltListDataChange(Sender: TObject;
  Field: TField);
begin
  fAPList1.dsFltListDataChange(Sender, Field);
  btnOk.Enabled := not (Sender as TDataSource).DataSet.IsEmpty; 
end;

end.
