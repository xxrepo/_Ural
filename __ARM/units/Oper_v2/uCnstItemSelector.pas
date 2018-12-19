unit uCnstItemSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frDocOrg, frCnstItem;

type
  TCnstItemSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fCnstItem1: TfCnstItem;
    procedure fDocOrg1RxDBGrid1DblClick(Sender: TObject);
    procedure fCnstItem1dsFltListDataChange(Sender: TObject;
      Field: TField);
  private
  public
    procedure Initialize(id_Bsn : integer);
  end;

var
  CnstItemSelector: TCnstItemSelector;
function ShowCnstItemSelector(id_Bsn : integer; var id_CnstItem : integer; var AName: string; var Value: Extended) : boolean;

implementation

uses uDM, foMyFunc;

{$R *.DFM}

function ShowCnstItemSelector(id_Bsn : integer; var id_CnstItem : integer; var AName: string; var Value: Extended) : boolean;
var F : TCnstItemSelector;
begin
  Result := false;
  F := TCnstItemSelector.Create(nil);
  try
    with F do
    begin
      if Screen.ActiveForm <> nil then
        SetWindowLong(Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
      F.Initialize(id_Bsn);
      F.fCnstItem1.cdsAPCnstItemGetList.Locate('id_CnstItem', id_CnstItem, []);
      F.ShowModal;
      if F.ModalResult = mrOk then
      begin
        Result := true;
        id_CnstItem := F.fCnstItem1.cdsAPCnstItemGetListid_CnstItem.AsInteger;
        AName := F.fCnstItem1.cdsAPCnstItemGetListName.AsString;
        Value := F.fCnstItem1.cdsAPCnstItemGetListVal.AsFloat;
      end;
    end;
  finally
    F.Free;
  end;
end;


procedure TCnstItemSelector.Initialize(id_Bsn : integer);
begin
  fCnstItem1.Initialize(id_Bsn);
end;


procedure TCnstItemSelector.fDocOrg1RxDBGrid1DblClick(Sender: TObject);
var  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 if btnOk.enabled then
   btnOk.Click;
end;

procedure TCnstItemSelector.fCnstItem1dsFltListDataChange(Sender: TObject;
  Field: TField);
begin
  fCnstItem1.dsFltListDataChange(Sender, Field);
  btnOk.enabled := not fCnstItem1.cdsAPCnstItemGetList.isEmpty;
end;

end.
