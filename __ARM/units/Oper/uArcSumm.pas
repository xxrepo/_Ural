unit uArcSumm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frArcSumm, foMyFunc, db, Buttons, dbgrideh;

type
  TArcSumm = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    BitBtn1: TBitBtn;
    fArcSumm1: TfArcSumm;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure ShowArcSumm(CDS : TDataSet; ACalcVals : TCalcVals);
procedure ShowArcSumm2(AGridEh : TDBGridEh);
var
  ArcSumm: TArcSumm;

implementation

procedure ShowArcSumm(CDS : TDataSet; ACalcVals : TCalcVals);
var F : TArcSumm;
begin
  F := TArcSumm.Create(nil);
  try
    F.fArcSumm1.DoCalc(CDS, ACalcVals);
    F.Show;
  except
    F.Free;
  end;
end;
procedure ShowArcSumm2(AGridEh : TDBGridEh);
var F : TArcSumm;
begin
  F := TArcSumm.Create(nil);
  try
    F.fArcSumm1.DoCalc2(AGridEh);
    F.Show;
  except
    F.Free;
  end;
end;

{$R *.DFM}

procedure TArcSumm.FormShow(Sender: TObject);
begin
  fArcSumm1.PageControl1.ActivePageIndex := 0;
end;

procedure TArcSumm.BitBtn1Click(Sender: TObject);
begin
  fArcSumm1.ExportToExcel;
end;

constructor TArcSumm.Create(AOwner: TCOmponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TArcSumm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TArcSumm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TArcSumm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
