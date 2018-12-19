unit uOperList_Del;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uRptForm, StdCtrls, ExtCtrls, frRptFrame;

type
  TRptForm1 = class(TRptForm)
  private
    { Private declarations }
  public
    procedure Refr; override;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
  end;

var
  RptForm1: TRptForm1;

implementation

uses foMyFunc, uDM;

{$R *.DFM}

procedure TRptForm1.Refr;
var AParamBlnc : TParamBlnc;
begin
  Screen.Cursor := crSQLWait;
  fRptFrame1.SpeedButton1.Enabled := false;
  try
    AParamBlnc := GetEmptyParamBlnc;

    AParamBlnc.Deleted := true;
    AParamBlnc.id_business := fRptFrame1.fBsnSelector1.ID;

    AParamBlnc.DateFrom := fRptFrame1.dtFrom.Date;
    AParamBlnc.DateTo := fRptFrame1.dtTo.Date;

    fRptFrame1.fArc1.Initialize(AParamBlnc);
    fRptFrame1.fBsnSelector1.ID := AParamBlnc.id_business;
    fRptFrame1.fArc1.aRefreshe.Execute;
    fRptFrame1.CalcFIOList(nil, 'id_UserCreator', 'CreatorFIO');
  finally
    Screen.Cursor := crDefault;
    fRptFrame1.SpeedButton1.Enabled := true;
  end;
end;

constructor TRptForm1.Create(AOwner: TCOmponent);
begin
  inherited;

end;

destructor TRptForm1.Destroy;
begin
  inherited;

end;

end.
