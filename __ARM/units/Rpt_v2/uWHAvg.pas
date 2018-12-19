unit uWHAvg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, frObjList, frAvg_Goods, frBsnSelector,
  ComCtrls, Grids, DBGrids, RXDBCtrl,
  dxPSGlbl, Menus, DBGridEh, foMyFunc;

type
  TWHAvg = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    PageControl1: TPageControl;
    Panel1: TPanel;
    fAvg_Goods1: TfAvg_Goods;
    fBsnSelector1: TfBsnSelector;
    Panel3: TPanel;
    p1: TGroupBox;
    fObjListWH: TfObjList;
    Splitter1: TSplitter;
    p2: TGroupBox;
    fObjListWare: TfObjList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fMov_Goods1SpeedButton2Click(Sender: TObject);
    procedure fAvg_Goods1BitBtn2Click(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
  private
    FShowNull : boolean;
    FParamBlnc : TParamBlnc;
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(AParamBlnc : TParamBlnc; AShowNull : boolean = false);
    procedure CreateParams(var Params: TCreateParams); override;

    procedure GetWHList(var V : Variant);
    procedure GetWHGroupList(var V : Variant);
    procedure GetWareList(var V : Variant);
    procedure GetWareGroupList(var V : Variant);
  //  procedure InitMov;
    procedure RefresheLists;
  end;

procedure ShowWHAvg(AParamBlnc : TParamBlnc; AShowNull : boolean = false);

var
  WHAvg: TWHAvg;

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

procedure ShowWHAvg(AParamBlnc : TParamBlnc; AShowNull : boolean);
var F : TWHAvg;
begin
  DM.Rights_GetUserRights(2010, Null);
  F := TWHAvg.Create(nil);
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

procedure TWHAvg.Initialize(AParamBlnc : TParamBlnc; AShowNull : boolean);
var ANAme, ABsnName: OleVariant;
   ObjName, ObjID, BsnName, id_Bsn, id_Group: OleVariant;
begin
  FParamBlnc := AParamBlnc;
  if (AParamBlnc.id_Warehouse <> Null) and (AParamBlnc.id_business = Null) then
  begin
    DM.rsCA.AppServer.UNSel_WHBsn(AParamBlnc.id_Warehouse, id_Bsn, id_Group);
    AParamBlnc.id_business := id_Bsn;
    fBsnSelector1.ID := id_Bsn;
  end;


{  if fAvg_Goods1.Tag <> VarValToInt(AParamBlnc.ID_Warehouse) then
  begin
    fAvg_Goods1.Initialize(AParamBlnc, FShowNull);
    fAvg_Goods1.Tag := VarValToInt(AParamBlnc.ID_Warehouse);
  end;     }
end;

constructor TWHAvg.Create(AOwner: TCOmponent);
begin
  inherited;
//  LoadValFromRegistry(FID_Warehouse, SRegPath + '\' + Name, 'ID_Warehouse2');
//  LoadValFromRegistry(FID_Bsn, SRegPath + '\' + Name, 'FID_Bsn2');
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TWHAvg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWHAvg.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TWHAvg.btnCancelClick(Sender: TObject);
begin
  Close;
end;


destructor TWHAvg.Destroy;
begin
//  SaveValToRegistry(FID_Warehouse, SRegPath + '\' + Name, 'ID_Warehouse2');
//  SaveValToRegistry(FID_Bsn, SRegPath + '\' + Name, 'FID_Bsn2');
  inherited;

end;

procedure TWHAvg.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TWHAvg.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TWHAvg.fMov_Goods1SpeedButton2Click(Sender: TObject);
begin
  fAvg_Goods1.SpeedButton2Click(Sender);

end;

procedure TWHAvg.GetWareGroupList(var V: Variant);
begin
  V := fObjListWare.GetIDList(eotGoodsGroup);
end;

procedure TWHAvg.GetWareList(var V: Variant);
begin
  V := fObjListWare.GetIDList(eotGoods);
end;

procedure TWHAvg.GetWHGroupList(var V: Variant);
begin
  V := fObjListWH.GetIDList(eotWHGroup);
end;

procedure TWHAvg.GetWHList(var V: Variant);
begin
  V := fObjListWH.GetIDList(eotWH);
end;

procedure TWHAvg.RefresheLists;
var
    IDWares : TEObjTypes;
begin
  FParamBlnc := GetEmptyParamBlnc;

  fObjListWH.Initialize([eotWH, eotWHGroup], fBsnSelector1.ID, 40, true);


  IDWares := [eotGoods, eotGoodsGroup];

  fObjListWare.Initialize(IDWares, fBsnSelector1.ID, 40, true);
end;

procedure TWHAvg.fAvg_Goods1BitBtn2Click(Sender: TObject);
begin
  if (fBsnSelector1.ID = -1)  then
  begin
    Windows.SetFocus(fObjListWH.RxDBGrid1.Handle);
    MessageBox(Handle, 'Не выбран бизнес', 'Выберите бизнес', MB_ICONQUESTION + mb_OK);
    Exit;
  end;
 { if (fObjListWH.ObjCount = 0)  then
  begin
    Windows.SetFocus(fObjListWH.RxDBGrid1.Handle);
    MessageBox(Handle, 'Не выбран ни один склад', 'Выберите склад', MB_ICONQUESTION + mb_OK);
    Exit;
  end;   }

  try
    Screen.Cursor := crSQLWait;
    Enabled := false;
    with fAvg_Goods1.cdsWHAvg do
    begin
      Close;
      Params.ParamByName('@id_business').AsInteger := fBsnSelector1.ID;

      Params.ParamByName('@IDWHList').Value := fObjListWH.GetIDList(eotWH);
      Params.ParamByName('@IDWHGroupList').Value := fObjListWH.GetIDList(eotWHGroup);
      Params.ParamByName('@IDGoodsList').Value := fObjListWare.GetIDList(eotGoods);
      Params.ParamByName('@IDGoodsGroupList').Value := fObjListWare.GetIDList(eotGoodsGroup);

      Params.ParamByName('@DateFrom').AsDateTime := GetDateAdv(fAvg_Goods1.dtFrom.Date, false);
      Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(fAvg_Goods1.dtTo.Date, true);

      Params.ParamByName('@ShowNull').Value := false;

      Open;
    end;
  finally
    Screen.Cursor := crDefault;
    Enabled := true;
  end;
end;

procedure TWHAvg.fBsnSelector1Button1Click(Sender: TObject);
var OldID : Variant;
begin
  OldID := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if OldID <> fBsnSelector1.ID then
  begin
    RefresheLists;
    fAvg_Goods1.FID_Bsn := fBsnSelector1.ID;
  //  Initialize;
  end;
end;

end.
