unit uRptForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frBsnSelector, frRptFrame, frArc;

type
  TRptForm = class(TForm)
    Panel1: TPanel;
    btnCancel: TButton;
    fRptFrame1: TfRptFrame;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure fRptFrame1SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Refr; virtual; abstract;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  RptForm: TRptForm;

implementation

uses foMyFunc, uDM;

{$R *.DFM}

{ TRptForm }

constructor TRptForm.Create(AOwner: TCOmponent);
var    V : Variant;
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
{  LoadValFromRegistry(V, SRegPath + '\' + Name, 'dtFrom');
  if V <> Null then
  try
    fRptFrame1.dtFrom.Date := V;
  except
  end;
  LoadValFromRegistry(V, SRegPath + '\' + Name, 'dtTo');
  if V <> Null then
  try
    fRptFrame1.dtTo.Date := V;
  except
  end;
}
  LoadValFromRegistry(V, SRegPath + '\' + Name, 'id_Bsn');
  if V <> Null then
    fRptFrame1.fBsnSelector1.ID := V;

end;

procedure TRptForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TRptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TRptForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

destructor TRptForm.Destroy;
begin
  SaveValToRegistry(fRptFrame1.dtFrom.Date, SRegPath + '\' + Name, 'dtFrom');
  SaveValToRegistry(fRptFrame1.dtTo.Date, SRegPath + '\' + Name, 'dtTo');
  SaveValToRegistry(fRptFrame1.fBsnSelector1.ID, SRegPath + '\' + Name, 'id_Bsn');
  inherited;

end;

procedure TRptForm.fRptFrame1SpeedButton1Click(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  fRptFrame1.SpeedButton1.Enabled := false;
  try
    fRptFrame1.SpeedButton1Click(Sender);
    Refr;
  finally
    Screen.Cursor := crDefault;
    fRptFrame1.SpeedButton1.Enabled := true;
  end;

end;

end.
