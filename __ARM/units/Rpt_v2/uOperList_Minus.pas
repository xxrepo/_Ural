unit uOperList_Minus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uRptForm, StdCtrls, ExtCtrls, frRptFrame, Db, DBClient;

type
  TOperList_Minus = class(TRptForm)
    cdsMinus: TClientDataSet;
  private
    { Private declarations }
  public
    procedure Refr; override;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
  end;

var
  OperList_Minus: TOperList_Minus;

implementation

uses foMyFunc, uDM;

{$R *.DFM}

procedure TOperList_Minus.Refr;
var AParamBlnc : TParamBlnc;
    i : integer;
begin
  Screen.Cursor := crSQLWait;
  fRptFrame1.SpeedButton1.Enabled := false;
  cdsMinus.DisableControls;
  try
    with cdsMinus do
    begin
      Close;
      for i := 0 to Params.Count - 1 do
        Params[i].Value := Null;
      Params.ParamByName('@id_User').Value := DM.IDUser;
      Params.ParamByName('@id_business').Value := fRptFrame1.fBsnSelector1.ID;
      Params.ParamByName('@HasViza').Value := true;
      Params.ParamByName('@DateFrom').AsDate := Trunc(fRptFrame1.dtFrom.Date) - 0;
      Params.ParamByName('@DateTo').AsDate := Trunc(fRptFrame1.dtTo.Date) - 0 + 1 ;

      Open;
    end;

    fRptFrame1.CalcFIOList(cdsMinus, 'id_UserCreator', 'CreatorFIO');
    fRptFrame1.fArc1.aRefreshe.Execute;
  finally
    Screen.Cursor := crDefault;
    fRptFrame1.SpeedButton1.Enabled := true;
    cdsMinus.EnableControls;
  end;
end;

constructor TOperList_Minus.Create(AOwner: TCOmponent);
begin
  inherited;
  fRptFrame1.fArc1.dsArc.DataSet := cdsMinus;

end;

destructor TOperList_Minus.Destroy;
begin
  inherited;

end;

end.
