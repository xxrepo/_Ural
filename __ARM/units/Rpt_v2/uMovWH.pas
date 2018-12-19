unit uMovWH;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons,
  dxPSGlbl, Menus, DBGridEh, frMov_Goods, foMyFunc;

type
  TMovWH = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    edWH: TEdit;
    BitBtn1: TBitBtn;
    fMov_Goods1: TfMov_Goods;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure fMov_Goods1SpeedButton2Click(Sender: TObject);
  private
    FShowNull : boolean;
    FID_Warehouse, FID_Bsn : Variant;

  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(AParamBlnc : TParamBlnc; AShowNull : boolean = false);
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure ShowMovWH(AParamBlnc : TParamBlnc; AShowNull : boolean = false);

var
  MovWH: TMovWH;

implementation

uses uDM, uUnivSelector, uMovWH_Adv;

{$R *.DFM}

  function VarValToInt(Val : Variant) : integer;
  begin
    if Val <> Null then
      Result := Val
    else
      Result := -1;
  end;

procedure ShowMovWH(AParamBlnc : TParamBlnc; AShowNull : boolean);
var F : TMovWH;
begin
  DM.Rights_GetUserRights(2010, Null);
  F := TMovWH.Create(nil);
  try
    with F do
    begin
      Initialize(AParamBlnc, AShowNull);
      Show;
    end;
  except
    F.Free;
  end;
end;

{ TGoodsSum }

procedure TMovWH.Initialize(AParamBlnc : TParamBlnc; AShowNull : boolean);
var ANAme, ABsnName: OleVariant;
   ObjName, ObjID, BsnName, id_business: OleVariant;
begin
  if AParamBlnc.ID_Warehouse <> Null then
    FID_Warehouse := AParamBlnc.ID_Warehouse
  else
  begin
    if AReadOneObj then
    begin
      if DM.SnglObj_wh(ObjName, ObjID, BsnName, id_business) then
      begin
        AParamBlnc.ID_Warehouse := ObjID;
        FID_Warehouse := ObjID;
      end;
    end;
  end;

  if (AParamBlnc.ID_Warehouse <> Null) then
  begin
    if DM.rsCA.AppServer.GetWH(AParamBlnc.ID_Warehouse, ANAme, ABsnName, id_Business) <> -1 then
    begin
      edWH.Text := ABsnName + '/' + ANAme;
      FID_Bsn := id_Business;
      AParamBlnc.id_business:= id_Business;
    end;
  end;

  if fMov_Goods1.Tag <> VarValToInt(AParamBlnc.ID_Warehouse) then
  begin
    fMov_Goods1.Initialize(AParamBlnc, FShowNull);
    fMov_Goods1.Tag := VarValToInt(AParamBlnc.ID_Warehouse);
  end;
end;

constructor TMovWH.Create(AOwner: TCOmponent);
begin
  inherited;
  FID_Warehouse := Null;
  FID_Bsn := Null;
//  LoadValFromRegistry(FID_Warehouse, SRegPath + '\' + Name, 'ID_Warehouse2');
//  LoadValFromRegistry(FID_Bsn, SRegPath + '\' + Name, 'FID_Bsn2');
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
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
begin
  ASelectedObj.ID := FID_Warehouse;
  ASelectedObj.ObjType := eotWH;      
  if SelectObjUn(Self, 2010, ASelectedObj, 0, [eotWH], false) then
  begin
    edWH.Text := ASelectedObj.Bsn_Name + '/' + ASelectedObj.Name;
    FID_Warehouse := ASelectedObj.ID;
    FID_Bsn := ASelectedObj.Bsn_id;
    fMov_Goods1.Initialize(FID_Warehouse, FID_Bsn, FShowNull);
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
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TMovWH.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TMovWH.BitBtn1Click(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_Warehouse := FID_Warehouse;
  AParamBlnc.id_business := FID_Bsn;

  ShowMovWH_Adv(AParamBlnc);
end;

procedure TMovWH.fMov_Goods1SpeedButton2Click(Sender: TObject);
begin
  fMov_Goods1.SpeedButton2Click(Sender);

end;

end.
