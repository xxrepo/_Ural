unit uInputBoxObj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Db, DBClient, MConnect,
  SConnect, Grids, DBGrids, RXDBCtrl;

type
  TSetOfChar = set of char;

  TFrmInputBoxObj = class(TForm)
    cdsObj: TClientDataSet;
    cdsObjID: TIntegerField;
    cdsObjName: TStringField;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    FAllCh : set of char;
  end;

var
  FrmInputBoxObj: TFrmInputBoxObj;
function InputBoxObj(const ACaption : string; id_Obj : integer;
                     var AID : integer; var AName: string;
                     AConnection : TCustomConnection): boolean;

implementation

{$R *.DFM}
function InputBoxObj(const ACaption : string; id_Obj : integer;
                     var AID : integer; var AName: string;
                     AConnection : TCustomConnection): boolean;
var F : TFrmInputBoxObj;
begin
  Result := false;
  F := TFrmInputBoxObj.Create(nil);
  try
    if ACaption <> '' then
      F.Caption := ACaption;
    F.cdsObj.RemoteServer := TCustomRemoteServer(AConnection);
    F.cdsObj.ProviderName := 'dsObj';
    F.cdsObj.Params.Clear;
    F.cdsObj.FetchParams;
    F.cdsObj.Params.ParamByName('@id_Obj').Value := id_Obj;
    F.cdsObj.Open;
    F.cdsObj.Locate('ID', AID, []);

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AID := F.cdsObj.FieldByName('ID').AsInteger;
      AName := F.cdsObj.FieldByName('Name').AsString;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

end.
