unit uOperList_HasViza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uRptForm, StdCtrls, ExtCtrls, frRptFrame, Db, DBClient;

type
  TOperList_HasViza = class(TRptForm)
  private
    { Private declarations }
  public
    procedure Refr; override;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
  end;

var
  OperList_HasViza: TOperList_HasViza;

implementation

uses foMyFunc, uDM;

{$R *.DFM}

procedure TOperList_HasViza.Refr;
var AParamBlnc : TParamBlnc;
begin
  Screen.Cursor := crSQLWait;
  fRptFrame1.SpeedButton1.Enabled := false;
  try
    AParamBlnc := GetEmptyParamBlnc;

    AParamBlnc.HasViza := true;
    AParamBlnc.id_business := fRptFrame1.fBsnSelector1.ID;

    AParamBlnc.DateFrom := fRptFrame1.dtFrom.Date;
    AParamBlnc.DateTo := fRptFrame1.dtTo.Date;

    fRptFrame1.fArc1.Initialize(AParamBlnc);
    fRptFrame1.fArc1.aRefreshe.Execute;
    fRptFrame1.CalcFIOList(nil, 'id_UserCreator', 'CreatorFIO');
    fRptFrame1.fArc1.aRefreshe.Execute;
  finally
    Screen.Cursor := crDefault;
    fRptFrame1.SpeedButton1.Enabled := true;
  end;
end;

constructor TOperList_HasViza.Create(AOwner: TCOmponent);
begin
  inherited;

end;

destructor TOperList_HasViza.Destroy;
begin
  inherited;

end;

end.
