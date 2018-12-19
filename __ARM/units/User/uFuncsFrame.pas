unit uFuncsFrame;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, Db, DBClient;

type
  TFuncsFrame = class(TFrame)
    RxDBGrid1: TRxDBGrid;
    cdsFuncs: TClientDataSet;
    DataSource1: TDataSource;
    cdsFuncsid_Func: TAutoIncField;
    cdsFuncsFuncName: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(id_Group, id_Business, id_Func : integer);
  end;

implementation
  uses uDm;
{$R *.DFM}

procedure TFuncsFrame.Init(id_Group, id_Business, id_Func : integer);
begin
  with cdsFuncs do
  begin
    Close;
    Params.ParamByName('@id_Group').Value := id_Group;
    Params.ParamByName('@id_Business').Value := id_Business;
    Params.ParamByName('@id_Func').Value := id_Func;
    Open;
    Locate('id_Func', id_Func, []);
  end;
end;

end.
