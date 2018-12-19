unit uMovCA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons,
  dxPSGlbl, Menus, DBGridEh, 
  foMyFunc, Registry, frObjList, RXSplit, BaseGrid, AdvGrid, frMov_WareUn;

type
  TMovCA = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    BitBtn1: TBitBtn;
    Panel5: TPanel;
    Label2: TLabel;
    Button1: TButton;
    edCA: TEdit;
    fMov_WareUn1: TfMov_WareUn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FID_Bsn : Variant;
    FEObjType : TEObjType;
 //   FParamBlnc: TParamBlnc;
    ASelectedObj : TSelectedObj;
    Val : Variant;

    procedure GetCAList(var V : Variant);
    procedure InitMov;

  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(AEObjType : TEObjType; AParamBlnc: TParamBlnc);
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure ShowMovCA(AEObjType : TEObjType; AParamBlnc: TParamBlnc);

var
  MovCA: TMovCA;

implementation

uses uDM, uCASelector, uMovCA_Adv;

{$R *.DFM}

procedure ShowMovCA(AEObjType : TEObjType; AParamBlnc: TParamBlnc);
var F : TMovCA;
begin
  DM.Rights_GetUserRights(6, Null);
  F := TMovCA.Create(nil);
  try
    F.Initialize(AEObjType, AParamBlnc);
    F.Show;
  except
    F.Free;
  end;
end;

{ TGoodsSum }

procedure TMovCA.Initialize(AEObjType : TEObjType; AParamBlnc: TParamBlnc);
var i, N : integer;
begin
  FEObjType := AEObjType;
//  FParamBlnc := AParamBlnc;
//  InitMov;
  
  if AParamBlnc.id_ContrAgent <> Null then
  begin
    ASelectedObj.ID := AParamBlnc.id_ContrAgent;
    edCA.Text := DM.rsCA.appserver.GetCAName(ASelectedObj.ID);
  end
  else
    ASelectedObj.ID := Null;
  if AParamBlnc.id_business <> Null then
  begin
    ASelectedObj.Bsn_id := AParamBlnc.id_business;
  end;
end;

constructor TMovCA.Create(AOwner: TCOmponent);
var i : integer;
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  for i := 0 to fMov_WareUn1.dxDBTreeList1.Bands.Count - 1 do
  begin
    if fMov_WareUn1.dxDBTreeList1.Bands[i].Caption = 'Входящее состояние' then
      fMov_WareUn1.dxDBTreeList1.Bands[i].Visible := false;
    if fMov_WareUn1.dxDBTreeList1.Bands[i].Caption = 'Исходящее состояние' then
      fMov_WareUn1.dxDBTreeList1.Bands[i].Visible := false;
  end;
end;

procedure TMovCA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMovCA.CreateParams(var Params: TCreateParams);
begin
  inherited;
//  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TMovCA.btnCancelClick(Sender: TObject);
begin
  Close;
end;


procedure TMovCA.PageControl1Change(Sender: TObject);
  function VarValToInt(Val : Variant) : integer;
  begin
    if Val <> Null then
      Result := Val
    else
      Result := -1;
  end;
begin
end;

destructor TMovCA.Destroy;
var
    Reg : TRegistry;
    FullRegPathName : String;
begin
  SaveValToRegistry(ASelectedObj.ID, SRegPath + '\' + Name, 'ID_CA');
  SaveValToRegistry(ASelectedObj.Bsn_id, SRegPath + '\' + Name, 'IDBsn2');

  inherited;
end;

procedure TMovCA.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TMovCA.FormShow(Sender: TObject);
var
    Reg : TRegistry;
    FullRegPathName : String;
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TMovCA.GetCAList(var V: Variant);
begin
  V := IntToStr(ASelectedObj.ID);
end;

procedure TMovCA.InitMov;
var AID : integer;
begin
  AID := 201;
  fMov_WareUn1.Initialize(AID, nil, nil, nil, nil, GetCAList, nil, ASelectedObj.Bsn_id);
end;

procedure TMovCA.Button1Click(Sender: TObject);
begin
  ASelectedObj.ObjType := eotCA;
 // ASelectedObj.ID := FParamBlnc.id_ContrAgent;
                        
  if SelectCA(Self, ASelectedObj, 0, null, 6) then
  begin
  //  FParamBlnc.id_ContrAgent := ASelectedObj.ID;
    edCA.Text := ASelectedObj.Name;
    InitMov;
  end;
  fMov_WareUn1.BitBtn2.Enabled := ASelectedObj.ID  > 0;
end;

procedure TMovCA.BitBtn1Click(Sender: TObject);
var AParamBlnc : TParamBlnc;
    AEObjType : TEObjType;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_ContrAgent := ASelectedObj.ID;
  AParamBlnc.id_business := ASelectedObj.Bsn_id;

  ShowMovCA_Adv(AEObjType, AParamBlnc);
end;

end.
