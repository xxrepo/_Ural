unit uMovWHLC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, dxMasterView, Grids, DBGrids, RXDBCtrl,
  ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons,
  dxPSGlbl, Menus, DBGridEh, frMov_GoodsLC, foMyFunc;

type
  TMovWH = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    edWH: TEdit;
    fMov_Goods1: TfMov_GoodsLC;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FShowNull : boolean;
    FID_Warehouse, FID_Bsn : Variant;

  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(AID_Warehouse : Variant; AShowNull : boolean = false);
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure ShowMovWHLC(ID_Warehouse : Variant; AShowNull : boolean = false);

var
  MovWH: TMovWH;

implementation

uses uDM, uLCSelectorUn;

{$R *.DFM}

procedure ShowMovWHLC(ID_Warehouse : Variant; AShowNull : boolean);
var F : TMovWH;
begin
  DM.Rights_GetUserRights(2010, Null);
  F := TMovWH.Create(nil);
  try
    F.Initialize(ID_Warehouse, AShowNull);
    F.Show;
  except
    F.Free;
  end;
end;

{ TGoodsSum }

procedure TMovWH.Initialize(AID_Warehouse : Variant; AShowNull : boolean);
var V_Date : Variant;
   ANAme, ABsnName, id_business: OleVariant;
begin
  V_Date := DM.rsCA.AppServer.RP_WHStateDates_Get;
  if V_Date <> Null then
    Caption := Caption + ' - последнее обновление ' + FormatDateTime('yy-mm-dd hh:nn', V_Date);

  if AID_Warehouse <> Null then
    FID_Warehouse := AID_Warehouse;
  if (FID_Warehouse <> Null) then
  begin
    if DM.rsCA.AppServer.GetWH(FID_Warehouse, ANAme, ABsnName, id_Business) <> -1 then
      edWH.Text := ABsnName + '/' + ANAme;
  end;
  fMov_Goods1.Initialize(FID_Warehouse, FID_Bsn, AShowNull);
end;

constructor TMovWH.Create(AOwner: TCOmponent);
begin
  inherited;
  LoadValFromRegistry(FID_Warehouse, SRegPath + '\' + Name, 'ID_Warehouse2');
  LoadValFromRegistry(FID_Bsn, SRegPath + '\' + Name, 'FID_Bsn2');
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);

{  fSumWH_Goods1.Panel1.Visible := false;
  fSumWH_Raw1.Panel1.Visible := false;
  fSumWH_ExtRaw1.Panel1.Visible := false;
  fSumWH_Service1.Panel1.Visible := false;  }
end;

procedure TMovWH.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMovWH.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TMovWH.btnCancelClick(Sender: TObject);
begin
  Close;
end;


procedure TMovWH.fBsnSelector1Button1Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
    Rez : boolean;
begin
  ASelectedObj.ID := FID_Warehouse;
  ASelectedObj.ObjType := eotWH;
  if SelectObjUnLC(6, ASelectedObj, 0, [eotWH], -1, false) then
  begin
    edWH.Text := ASelectedObj.Bsn_Name + '/' + ASelectedObj.Name;
    FID_Warehouse := ASelectedObj.ID;
    FID_Bsn := ASelectedObj.Bsn_id;
    Initialize(FID_Warehouse, FShowNull);
  end;
end;

destructor TMovWH.Destroy;
begin
  SaveValToRegistry(FID_Warehouse, SRegPath + '\' + Name, 'ID_Warehouse2');
  SaveValToRegistry(FID_Bsn, SRegPath + '\' + Name, 'FID_Bsn2');
  inherited;

end;

procedure TMovWH.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TMovWH.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

end.
