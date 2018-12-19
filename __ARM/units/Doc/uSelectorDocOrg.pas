unit uSelectorDocOrg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frDocOrg;

type
  TSelectorDocOrg = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fDocOrg1: TfDocOrg;
    procedure fDocOrg1DataSource1DataChange(Sender: TObject;
      Field: TField);
    procedure fDocOrg1RxDBGrid1DblClick(Sender: TObject);
  private
  public
    procedure Initialize(id_Bsn : integer);
  end;

var
  SelectorDocOrg: TSelectorDocOrg;
function ShowSelectorDocOrg(id_Bsn : integer; var id_Doc_Org, OrgName, INN,
  KPP, Chif, Buh, OKPO, OKPD, Address : Variant) : boolean;

implementation

uses uDM, foMyFunc;

{$R *.DFM}

function ShowSelectorDocOrg(id_Bsn : integer; var id_Doc_Org, OrgName, INN,
  KPP, Chif, Buh, OKPO, OKPD, Address : Variant) : boolean;
var F : TSelectorDocOrg;
begin
  Result := false;
  F := TSelectorDocOrg.Create(nil);
  try
    with F do
    begin
    //  if Screen.ActiveForm <> nil then
      //  SetWindowLong(Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
      F.Initialize(id_Bsn);
      F.fDocOrg1.cdsDocOrg.Locate('id_Doc_Org', id_Doc_Org, []);
      F.ShowModal;
      if F.ModalResult = mrOk then
      begin
        Result := true;
        id_Doc_Org := F.fDocOrg1.cdsDocOrgid_Doc_Org.AsInteger;
        OrgName := F.fDocOrg1.cdsDocOrgOrgName.AsVariant;
        INN := F.fDocOrg1.cdsDocOrgINN.AsVariant;
        KPP := F.fDocOrg1.cdsDocOrgKPP.AsVariant;
        Chif := F.fDocOrg1.cdsDocOrgChif.AsVariant;
        Buh := F.fDocOrg1.cdsDocOrgBuh.AsVariant;
        OKPO := F.fDocOrg1.cdsDocOrgOKPO.AsVariant;
        OKPD := F.fDocOrg1.cdsDocOrgOKPD.AsVariant;
        Address := F.fDocOrg1.cdsDocOrgAddress.AsVariant;
      end;
    end;
  finally
    F.Free;
  end;
end;


procedure TSelectorDocOrg.Initialize(id_Bsn : integer);
begin
  fDocOrg1.Initialize(id_Bsn);
end;


procedure TSelectorDocOrg.fDocOrg1DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  fDocOrg1.DataSource1DataChange(Sender, Field);
  btnOk.enabled := not fDocOrg1.cdsDocOrg.isEmpty;
end;


procedure TSelectorDocOrg.fDocOrg1RxDBGrid1DblClick(Sender: TObject);
var  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 if btnOk.enabled then
   btnOk.Click;
end;

end.
