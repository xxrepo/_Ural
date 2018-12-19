unit uMovService;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, dxMasterView, Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons,
  dxPSGlbl, Menus, DBGridEh, foMyFunc, frMov_Service;

type
  TMovService = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    fMov_Service1: TfMov_Service;
    Panel3: TPanel;
    fBsnSelector1: TfBsnSelector;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
  private
    FShowNull : boolean;

  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(AParamBlnc : TParamBlnc; AShowNull : boolean = false);
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure ShowMovService(AParamBlnc : TParamBlnc; AShowNull : boolean = false);

var
  MovService: TMovService;

implementation

uses uDM;

{$R *.DFM}

procedure ShowMovService(AParamBlnc : TParamBlnc; AShowNull : boolean);
var F : TMovService;
begin
  DM.Rights_GetUserRights(6, Null);
  F := TMovService.Create(nil);
  try
    F.Initialize(AParamBlnc, AShowNull);
    F.Show;
  except
    F.Free;
  end;
end;

{ TGoodsSum }

procedure TMovService.Initialize(AParamBlnc : TParamBlnc; AShowNull : boolean);
begin
  if AParamBlnc.id_business <> Null then
    fBsnSelector1.ID := AParamBlnc.id_business;

  fMov_Service1.Initialize(AParamBlnc, FShowNull);
end;

constructor TMovService.Create(AOwner: TCOmponent);
var V : Variant;
begin
  inherited;
  V := Null;
//  LoadValFromRegistry(V, SRegPath + '\' + Name, 'Fid_business');
  if V <> Null then
    fBsnSelector1.ID := V;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);

{  fSumWH_Goods1.Panel1.Visible := false;
  fSumWH_Raw1.Panel1.Visible := false;
  fSumWH_ExtRaw1.Panel1.Visible := false;
  fSumWH_Service1.Panel1.Visible := false;  }
end;

procedure TMovService.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMovService.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TMovService.btnCancelClick(Sender: TObject);
begin
  Close;
end;


destructor TMovService.Destroy;
begin
  SaveValToRegistry(fBsnSelector1.ID, SRegPath + '\' + Name, 'Fid_business');
  inherited;

end;

procedure TMovService.fBsnSelector1Button1Click(Sender: TObject);
var OldID : integer;
begin
  OldID := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if OldID <> fBsnSelector1.ID then
    fMov_Service1.Initialize(fBsnSelector1.ID, FShowNull);
end;

end.
