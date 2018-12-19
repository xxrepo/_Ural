unit uOperList_Rate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uRptForm, StdCtrls, ExtCtrls, frRptFrame;

type
  TOperList_Rate = class(TRptForm)
  private
    { Private declarations }
  public
    procedure Refr; override;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
  end;

var
  OperList_Rate: TOperList_Rate;

implementation

uses foMyFunc, uDM;

{$R *.DFM}

procedure TOperList_Rate.Refr;
var AParamBlnc : TParamBlnc;
begin
  Screen.Cursor := crSQLWait;
  fRptFrame1.SpeedButton1.Enabled := false;
  try
    AParamBlnc := GetEmptyParamBlnc;

    AParamBlnc.OperVid := -1;
    AParamBlnc.id_business := fRptFrame1.fBsnSelector1.ID;

    AParamBlnc.DateFrom := fRptFrame1.dtFrom.Date;
    AParamBlnc.DateTo := fRptFrame1.dtTo.Date;

    fRptFrame1.fArc1.Initialize(AParamBlnc);
    fRptFrame1.fArc1.aRefreshe.Execute;
    fRptFrame1.CalcFIOList(nil, 'ReprName', 'ReprName');
    fRptFrame1.fArc1.aRefreshe.Execute;
  finally
    Screen.Cursor := crDefault;
    fRptFrame1.SpeedButton1.Enabled := true;
  end;
end;

constructor TOperList_Rate.Create(AOwner: TCOmponent);
begin
  inherited;
  fRptFrame1.RxDBGrid1.Columns[0].Title.Caption := 'Объект';
end;

destructor TOperList_Rate.Destroy;
begin
  inherited;

end;

end.
