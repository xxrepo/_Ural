unit uDM_2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB;

type
  TDM = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    FADOConnection: TADOConnection;
    constructor Create(AOwner: TComponent; ADOConnection: TADOConnection); overload;
  end;

var
  DM: TDM;

implementation

uses uRDM;

{$R *.DFM}

constructor TDM.Create(AOwner: TComponent; ADOConnection: TADOConnection);
var    i : integer;
begin
  inherited Create(AOwner);
  FADOConnection := ADOConnection;
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TCustomADODataSet) then
      TCustomADODataSet(Components[i]).Connection := FADOConnection;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
 // tag := GetCurrentThreadId;
 // THackAdoDataSet(spArc201).CommandTimeout := tag;

end;

end.
