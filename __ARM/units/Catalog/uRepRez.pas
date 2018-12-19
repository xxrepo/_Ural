unit uRepRez;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, StdCtrls, Mask, DBCtrls, ExtCtrls, frRepRez;

type
  TRepRez = class(TForm)
    cdsGoodsProp: TClientDataSet;
    Panel1: TPanel;
    cdsGoodsPropid_Goods: TAutoIncField;
    cdsGoodsPropid_Ctg_Goods: TIntegerField;
    cdsGoodsPropName: TStringField;
    cdsGoodsPropShortName: TStringField;
    cdsGoodsPropBarCode: TStringField;
    cdsGoodsPropDisabled: TBooleanField;
    cdsGoodsPropLastUpdated: TBytesField;
    cdsGoodsPropid_Measure: TIntegerField;
    cdsGoodsPropMeasureName: TStringField;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    fRepRez1: TfRepRez;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(id_Goods : integer; id_WareHouse : Variant);
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  RepRez: TRepRez;

procedure ShowRepRez(id_Goods : integer; id_WareHouse : Variant);
implementation

uses foMyFunc, uDM;

{$R *.DFM}
procedure ShowRepRez(id_Goods : integer; id_WareHouse : Variant);
var F : TRepRez;
begin
  F := TRepRez.Create(nil);
  try
    F.Initialize(id_Goods, id_WareHouse);
    F.Show;
  except
    F.Free;
  end;
end;
{ TForm2 }

constructor TRepRez.Create(AOwner: TCOmponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TRepRez.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

destructor TRepRez.Destroy;
begin
  inherited;

end;

procedure TRepRez.Initialize(id_Goods: integer; id_WareHouse: Variant);
var AParamz201 : TParamz201;
begin
  AParamz201 := GetEmptyParamz201;
  with cdsGoodsProp do
  begin
    Close;
    Params.ParamByName('@id_Goods').Value := id_Goods;
    Open;
    Caption := 'Резерв товара' + FieldByName('Name').AsString;
  end;
  AParamz201.id_Goods := id_Goods;
  AParamz201.id_WareHouse := id_WareHouse;
  AParamz201.HasDept := true;
  fRepRez1.Initialize(AParamz201);
end;

procedure TRepRez.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TRepRez.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TRepRez.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

end.
