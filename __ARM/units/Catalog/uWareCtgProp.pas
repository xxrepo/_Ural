unit uWareCtgProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frWareCtgProp, foMyFunc;

type
  TWareCtgProp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fWareCtgProp1: TfWareCtgProp;
    procedure btnOkClick(Sender: TObject);
  private
    function Getid_Bsn: integer;
    function Getid_Ctg: Variant;
    { Private declarations }
  public
    function SaveProp: boolean;
    procedure Initialize(id_Ctg : integer; id_Bsn : integer; id_BaseCtg_Goods : Variant);
    property id_Ctg : Variant read Getid_Ctg;
    property id_Bsn : integer read Getid_Bsn;
  end;

var
  WareCtgProp: TWareCtgProp;

implementation

uses uDM;

{$R *.DFM}

procedure TWareCtgProp.btnOkClick(Sender: TObject);
begin
  if not fWareCtgProp1.ConfirmChanges then
    ModalResult := mrNone;
end;

function TWareCtgProp.Getid_Bsn: integer;
begin
  Result := fWareCtgProp1.id_Bsn;
end;

function TWareCtgProp.Getid_Ctg: Variant;
begin
  Result := fWareCtgProp1.id_Ctg;
end;

procedure TWareCtgProp.Initialize(id_Ctg,
  id_Bsn: integer; id_BaseCtg_Goods: Variant);
var H : integer;
begin
  ActiveControl := fWareCtgProp1.DBEdit1;

  fWareCtgProp1.Initialize(id_Ctg, id_Bsn, id_BaseCtg_Goods);

  if id_Ctg = -1 then
  begin
    Caption := 'Новая категория товаров';
    Caption := Caption + ' - бизнес "' + DM.GetBusinessName(id_Bsn) + '"'
  end
  else
  begin
    Caption := 'Категория товаров: ' + fWareCtgProp1.dsCtgGoodsProp.DataSet.FieldByName('Name').AsString + ' (' + IntToStr(id_Ctg) + ')';
  end;
{$IFDEF LC}
  btnOk.Enabled := fWareCtgProp1.cdsCtgGoodsPropID_Main.IsNull;
  if not fWareCtgProp1.cdsCtgGoodsPropID_Main.IsNull then
    DisableControl(fWareCtgProp1);
{$ENDIF}
end;

function TWareCtgProp.SaveProp: boolean;
begin
  Result := fWareCtgProp1.SaveProp;
end;

end.
 