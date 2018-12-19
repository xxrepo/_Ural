unit frUnSelectorLC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ExtCtrls, StdCtrls,
  registry, frReprList, frCntrAgentList, frCAGroupList, db, frWare, foMyFunc,
  ActnList, ToolWin, RXCtrls, frCaNavigator, uWareHouseFrame,
  uManufactFrame, uEquipFrame, Menus, frTreeChItem, contnrs, 
  uAccsFrame;

type
 
  TEObj = class
    EObjType : TEObjType;
    id_Bsn : Variant;
    Name  : String;
    constructor Create(ATEObjType : TEObjType; Aid_Bsn : Variant);
  end;

  TfUnSelectorLC = class(TFrame)
    TreeView1: TTreeView;
    ilEM: TImageList;
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    tsFin: TTabSheet;
    tsOwnCA: TTabSheet;
    tsGoods: TTabSheet;
    fWareGoods: TfWare;
    ActionList1: TActionList;
    aShowTree: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    tsEmpty: TTabSheet;
    Label1: TLabel;
    tsBsn: TTabSheet;
    tsRaw: TTabSheet;
    tsExtRaw: TTabSheet;
    tsService: TTabSheet;
    fWareService: TfWare;
    fWareExtRaw: TfWare;
    fWareRaw: TfWare;
    fCaNavigatorOwn: TfCaNavigator;
    tsCA: TTabSheet;
    fCaNavigator: TfCaNavigator;
    tsWH: TTabSheet;
    WareHouseFrame1: TWareHouseFrame;
    tsManuf: TTabSheet;
    ManufactFrame1: TManufactFrame;
    tsEQ: TTabSheet;
    aBsnProp: TAction;
    aNewBsn: TAction;
    pmEM: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    aRefresheBsn: TAction;
    Panel1: TPanel;
    lbBsn: TLabel;
    fTreeChItem1: TfTreeChItem;
    EquipFrame1: TEquipFrame;
    tsRepr: TTabSheet;
    fReprList1: TfReprList;
    AccsFrame1: TAccsFrame;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure aShowTreeExecute(Sender: TObject);
    procedure TreeView1Deletion(Sender: TObject; Node: TTreeNode);
    procedure aBsnPropExecute(Sender: TObject);
    procedure aNewBsnExecute(Sender: TObject);
    procedure aRefresheBsnExecute(Sender: TObject);
  private
    FBsns : TObjectList;
    Fid_Bsn : Variant;
    FDisabled : Variant;
    FEObjTypes : TEObjTypes;
    FReadOnly : boolean;
    procedure GetTree(Node : TTreeNode; id_Bsn : Variant);
    procedure SetTabSheet(ATabSheet: TTabSheet);
    procedure GetNodeImageIndex(Node: TTreeNode);
    function GetBsn: Variant;
    function GetObjType: TEObjType;
    procedure InternalInitialize(id_Bsn : Variant; UID : Variant; Disabled : Variant; AEObjTypes : TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, eotOwnCA, eotOwnRepr, eotCA, eotRepr, eotEQ, eotCatalog, eotWare, eotRaw, eotExtRaw, eotService, eotSimplRepr]; AReadOnly : Boolean = false);
    function GetEObjType: TEObjType;
    function GetSelObjID: Variant;
    function GetObjName: String;
    function GetisNeedObjSelected: boolean;
  public
    procedure Initialize(id_Bsn : Variant; Disabled : Variant; AEObjTypes : TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, eotOwnCA, eotOwnRepr, eotCA, eotRepr, eotEQ, eotCatalog, eotWare, eotRaw, eotExtRaw, eotService, eotSimplRepr]; AReadOnly : boolean = false);
    procedure Initialize2(UID : integer; Disabled : Variant; AEObjTypes : TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, eotOwnCA, eotOwnRepr, eotCA, eotRepr, eotEQ, eotCatalog, eotWare, eotRaw, eotExtRaw, eotService, eotSimplRepr]; AReadOnly : boolean = false);
    destructor Destroy; override;
    constructor Create(AOwner: TComponent); override;

    property EObjTypes : TEObjTypes read FEObjTypes;

    property SelObjType : TEObjType read GetEObjType;
    property SelObjID : Variant read GetSelObjID;
    property SelObjName : String read GetObjName;

    property isNeedObjSelected : boolean read GetisNeedObjSelected;
  end;


implementation

uses uMainForm, uDM, uNSIDetailFormsAPI;
{$R *.DFM}

{ TEObj }


constructor TEObj.Create(ATEObjType : TEObjType; Aid_Bsn : Variant);
begin
  inherited Create;
  id_Bsn := Aid_Bsn;
  EObjType := ATEObjType;
  case EObjType of
    eotFin : Name := 'Счета';
    eotWH : Name := 'Склады';
    eotManuf : Name := 'Производство';
    eotOwnCA : Name := 'Свои контрагенты';
    eotCA : Name := 'Контрагенты';
    eotEQ : Name := 'Оборудование';
    eotCatalog : Name := 'Каталог';
    eotWare : Name := 'Товар';
    eotRaw : Name := 'Сырье';
    eotExtRaw : Name := 'Сырье давальческое';
    eotService : Name := 'Услуги';
    eotSimplRepr : Name := 'Представители';
  end;
end;

{ TEForm }
destructor TfUnSelectorLC.Destroy;
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, true) then
    begin
      Reg.WriteInteger('TreeView1Width', TreeView1.Width);
      Reg.WriteBool('TreeView1Visible', TreeView1.Visible);

      Reg.WriteInteger('ID_Bsn', GetBsn);
      Reg.WriteInteger('ObjType', Integer(GetObjType));

    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  FBsns.Free;
  inherited;
end;

constructor TfUnSelectorLC.Create(AOwner: TComponent);
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
    ID_Bsn : Variant;
    ObjType : TEObjType;
begin
  inherited;
  FBsns := TObjectList.Create(true);
  for i := PageControl1.PageCount - 1 downto 0 do
  begin
    PageControl1.Pages[i].TabVisible := false;
    PageControl1.Pages[i].Tag := -26;
  end;
  SetTabSheet(tsEmpty);

  ID_Bsn := Null;
  ObjType := eotNone;
  
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, true) then
    begin
      if Reg.ValueExists('TreeView1Width') then
        TreeView1.Width := Reg.ReadInteger('TreeView1Width');
   //   if Reg.ValueExists('TreeView1Visible') then
   //     TreeView1.Visible := Reg.ReadBool('TreeView1Visible');

      if Reg.ValueExists('ID_Bsn') then
        ID_Bsn := Reg.ReadInteger('ID_Bsn');
      if Reg.ValueExists('ObjType') then
        ObjType := TEObjType(Reg.ReadInteger('ObjType'));
    end;
  finally
    ToolButton1.Down := TreeView1.Visible;
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TfUnSelectorLC.GetTree(Node: TTreeNode; id_Bsn: Variant);
var 
    Obj : TEObj;
    N : TTreeNode;
begin
  if eotFin in FEObjTypes then
  begin
    Obj := TEObj.Create(eotFin, id_Bsn);
    N := TreeView1.Items.AddChildObject(Node, Obj.Name, Obj);
  end;
  if eotWH in FEObjTypes then
  begin
    Obj := TEObj.Create(eotWH, id_Bsn);
    N := TreeView1.Items.AddChildObject(Node, Obj.Name, Obj);
  end;
  if eotManuf in FEObjTypes then
  begin
    Obj := TEObj.Create(eotManuf, id_Bsn);
    N := TreeView1.Items.AddChildObject(Node, Obj.Name, Obj);
  end;
  if (eotOwnCA in FEObjTypes) or (eotOwnRepr in FEObjTypes) then
  begin
    Obj := TEObj.Create(eotOwnCA, id_Bsn);
    N := TreeView1.Items.AddChildObject(Node, Obj.Name, Obj);
  end;
  if (eotCA in FEObjTypes) or (eotRepr in FEObjTypes) then
  begin
    Obj := TEObj.Create(eotCA, id_Bsn);
    N := TreeView1.Items.AddChildObject(Node, Obj.Name, Obj);
  end;
  if (eotSimplRepr in FEObjTypes) then
  begin
    Obj := TEObj.Create(eotSimplRepr, id_Bsn);
    N := TreeView1.Items.AddChildObject(Node, Obj.Name, Obj);
  end;

  if eotEQ in FEObjTypes then
  begin
    Obj := TEObj.Create(eotEQ, id_Bsn);
    N := TreeView1.Items.AddChildObject(Node, Obj.Name, Obj);
  end;
  if eotWare in FEObjTypes then
  begin
    Obj := TEObj.Create(eotWare, id_Bsn);
    N := TreeView1.Items.AddChildObject(Node, Obj.Name, Obj);
  end;
  if eotRaw in FEObjTypes then
  begin
    Obj := TEObj.Create(eotRaw, id_Bsn);
    N := TreeView1.Items.AddChildObject(Node, Obj.Name, Obj);
  end;
  if eotExtRaw in FEObjTypes then
  begin
    Obj := TEObj.Create(eotExtRaw, id_Bsn);
    N := TreeView1.Items.AddChildObject(Node, Obj.Name, Obj);
  end;
  if eotService in FEObjTypes then
  begin
    Obj := TEObj.Create(eotService, id_Bsn);
    N := TreeView1.Items.AddChildObject(Node, Obj.Name, Obj);
  end;
end;

procedure TfUnSelectorLC.InternalInitialize(id_Bsn : Variant; UID : Variant; Disabled : Variant; AEObjTypes : TEObjTypes; AReadOnly : boolean);
var i : integer;
    Obj : TEObj;
    N : TTreeNode;
begin
  Fid_Bsn := id_Bsn;
  FDisabled := Disabled;
  FEObjTypes := AEObjTypes;
  FReadOnly := AReadOnly;

  if (id_Bsn = -13) then
  begin
    DM.GetBsnList(FBsns, DM.IDUser, UID);
    if FBsns.Count = 1 then
    begin
      GetTree(nil, TBsnObj(FBsns[0]).ID);
    end
    else
    begin
      for i := 0 to FBsns.Count - 1 do
      begin
        Obj := TEObj.Create(eotBsn, TBsnObj(FBsns[i]).ID);
        Obj.Name := 'Бизнес: ' + TBsnObj(FBsns[i]).Name;
        N := TreeView1.Items.AddObject(nil, Obj.Name, Obj);
        GetTree(N, Obj.id_Bsn);
      end;
    end;
  end
  else
  begin
    GetTree(nil, id_Bsn);
  end;
end;


procedure TfUnSelectorLC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfUnSelectorLC.TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  GetNodeImageIndex(Node);
end;

procedure TfUnSelectorLC.GetNodeImageIndex(Node: TTreeNode);
begin
  if (TObject(Node.Data) is TEObj) then
  begin
    case TEObj(Node.Data).EObjType of
      eotBsn : Node.ImageIndex := 16;
      eotFin : Node.ImageIndex := 19;
      eotWH : Node.ImageIndex := 31;
      eotManuf : Node.ImageIndex := 26;
      eotOwnCA : Node.ImageIndex := 28;
      eotCA : Node.ImageIndex := 32;
      eotEQ : Node.ImageIndex := 35;
      eotCatalog : Node.ImageIndex := 4;
      eotWare : Node.ImageIndex := 20;
      eotRaw : Node.ImageIndex := 33;
      eotExtRaw : Node.ImageIndex := 36;//36
      eotService : Node.ImageIndex := 21;
      eotSimplRepr : Node.ImageIndex := 32;
    end;
  end;
end;

procedure TfUnSelectorLC.TreeView1GetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TfUnSelectorLC.SetTabSheet(ATabSheet: TTabSheet);
begin
 { if ATabSheet = nil then
  begin
    PageControl1.Visible := false;
  end
  else  }
  begin
  //  PageControl1.Visible := true;
//    PageControl1.ActivePage.Tag := -1;
    PageControl1.ActivePage := ATabSheet;
  end;
end;

function TfUnSelectorLC.GetBsn : Variant;
begin
  Result := -1;
  if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) and (TObject(TreeView1.Selected.Data) is TEObj) then
  begin
    Result := TEObj(TreeView1.Selected.Data).id_Bsn;
  end;
end;

function TfUnSelectorLC.GetObjType : TEObjType;
begin
  Result := eotNone;
  if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) and (TObject(TreeView1.Selected.Data) is TEObj) then
  begin
    Result := TEObj(TreeView1.Selected.Data).EObjType;
  end;
end;

procedure TfUnSelectorLC.TreeView1Change(Sender: TObject; Node: TTreeNode);
var ABsn_ID : Variant;
    AID : Variant;
begin
  if (Node <> nil) and (TObject(Node.Data) is TEObj) then
  begin
    ABsn_ID := GetBsn;
    lbBsn.Caption := Node.Text;
    case TEObj(Node.Data).EObjType of
      eotBsn :
      begin
        SetTabSheet(tsBsn);
        fTreeChItem1.SetBsnNode(Node);
      end;
      eotFin :
      begin
        SetTabSheet(tsFin);
        if PageControl1.ActivePage.Tag <> ABsn_ID then
        begin
          with AccsFrame1 do
          begin
            Init(ABsn_ID, FReadOnly, not FReadOnly);
          end;
        end;
      end;
      eotWH :
      begin
        SetTabSheet(tsWH);
        if PageControl1.ActivePage.Tag <> ABsn_ID then
        begin
          with WareHouseFrame1 do
          begin
            Init(ABsn_ID, FReadOnly, not FReadOnly);
          end;
        end;
      end;
      eotManuf :
      begin
        SetTabSheet(tsManuf);
        if PageControl1.ActivePage.Tag <> ABsn_ID then
        begin
          with ManufactFrame1 do
          begin
            Init(ABsn_ID, FReadOnly, not FReadOnly);
          end;
        end;
      end;
      eotOwnCA :
      begin
        SetTabSheet(tsOwnCA);
        AID := Null;
        if PageControl1.ActivePage.Tag <> ABsn_ID then
        begin
          fCaNavigatorOwn.Initialize(AID, ABsn_ID, FDisabled, true);
          fCaNavigatorOwn.ShowReprList := eotOwnRepr in FEObjTypes;
        end;
      end;
      eotCA :
      begin
        SetTabSheet(tsCA);
        AID := Null;
        if PageControl1.ActivePage.Tag <> ABsn_ID then
        begin
          fCaNavigator.Initialize(AID, ABsn_ID, FDisabled, false);
         fCaNavigator.ShowReprList := eotRepr in FEObjTypes;
        end;
      end;
      eotSimplRepr :
      begin
        SetTabSheet(tsRepr);
        fReprList1.Initialize(Null, Null, FDisabled, ABsn_ID);
      end;
      eotEQ :
      begin
        SetTabSheet(tsEQ);
        if PageControl1.ActivePage.Tag <> ABsn_ID then
        begin
          with EquipFrame1 do
          begin
             ReadOnly := false;
             ToolBar.Visible := true;
             Init(ABsn_ID);
          end;
        end;
      end;
      eotWare :
      begin
        SetTabSheet(tsGoods);
        if PageControl1.ActivePage.Tag <> ABsn_ID then
        begin
          fWareGoods.Initialize(coGoods, Null, ABsn_ID, FDisabled);
        end;
      end;
      eotRaw :
      begin
        SetTabSheet(tsRaw);
        if PageControl1.ActivePage.Tag <> ABsn_ID then
        begin
          fWareRaw.Initialize(coRaw, Null, ABsn_ID, FDisabled);
        end;
      end;
      eotExtRaw :
      begin
        SetTabSheet(tsExtRaw);
        if PageControl1.ActivePage.Tag <> ABsn_ID then
        begin
          fWareExtRaw.Initialize(coExtRaw, Null, ABsn_ID, FDisabled);
        end;
      end;
      eotService :
      begin
        SetTabSheet(tsService);
        if PageControl1.ActivePage.Tag <> ABsn_ID then
        begin
          fWareService.Initialize(coService, Null, ABsn_ID, FDisabled);
        end;
      end;
    end;
    PageControl1.ActivePage.Tag := ABsn_ID;
  end;
  aBsnProp.Enabled := (Node <> nil) and (TObject(Node.Data) is TEObj) and (TEObj(Node.Data).EObjType = eotBsn);
end;

procedure TfUnSelectorLC.aShowTreeExecute(Sender: TObject);
begin
  TreeView1.Visible := not TreeView1.Visible;
  ToolButton1.Down := TreeView1.Visible;
end;

procedure TfUnSelectorLC.TreeView1Deletion(Sender: TObject; Node: TTreeNode);
begin
  if Node.Data <> nil then
    TObject(Node.Data).Free;
end;

procedure TfUnSelectorLC.aBsnPropExecute(Sender: TObject);
var
  ID, ID2 : Variant;
  AName: OleVariant;
begin
  ID := GetBsn;
  ID2 := ID;
  if ShowBusinessDetailForm(ID, false) then
  begin
    if DM.rsCA.AppServer.BsnByID(ID2, AName) = 1 then
      TreeView1.Selected.Text := 'Бизнес: ' + AName;
 //   aRefreshExecute(nil);
 //   cdsBusiness.Locate('id_Business', Id, [loCaseInsensitive]);
  end;
end;

procedure TfUnSelectorLC.aNewBsnExecute(Sender: TObject);
var
  ID : Variant;
  AName: OleVariant;
begin
  ID := -1;
  if ShowBusinessDetailForm(ID, false) then
  begin
//    if DM.rsCA.AppServer.BsnByID(ID, AName) = 1 then
//      TreeView1.Selected.Text := 'Бизнес: ' + AName;
 //   aRefreshExecute(nil);
 //   cdsBusiness.Locate('id_Business', Id, [loCaseInsensitive]);
  end;
end;

procedure TfUnSelectorLC.aRefresheBsnExecute(Sender: TObject);
begin
  Initialize(Fid_Bsn, FDisabled, FEObjTypes);
end;

procedure TfUnSelectorLC.Initialize2(UID: integer; Disabled: Variant;
  AEObjTypes: TEObjTypes; AReadOnly : boolean);
begin
  InternalInitialize(-13, UID, Disabled, AEObjTypes, AReadOnly);
  if TreeView1.Items.Count = 1 then
  begin
    TreeView1.Items[0].Selected := true;
    TreeView1.OnChange(TreeView1, TreeView1.Selected);
    aNewBsn.Enabled := false;
    aBsnProp.Enabled := false;

    TreeView1.Visible := false;
    ToolButton1.Down := TreeView1.Visible;
    
    ToolBar1.Visible := false;
  end;
end;

procedure TfUnSelectorLC.Initialize(id_Bsn, Disabled: Variant;
  AEObjTypes: TEObjTypes; AReadOnly : boolean);
begin
  InternalInitialize(-13, Null, Disabled, AEObjTypes, AReadOnly);
end;

function TfUnSelectorLC.GetEObjType: TEObjType;
var AControl : TWinControl;
begin
  Result := eotNone;
  if (TreeView1.Selected <> nil) and (TObject(TreeView1.Selected.Data) is TEObj) then
  begin
    Result := TEObj(TreeView1.Selected.Data).EObjType;
    if (Result = eotOwnCA) and (eotOwnRepr in FEObjTypes) and fCaNavigatorOwn.ShowReprList  then
      Result := eotOwnRepr;
    if (Result = eotCA) and (eotRepr in FEObjTypes) and fCaNavigator.ShowReprList  then
      Result := eotRepr;
  end;
end;

function TfUnSelectorLC.GetSelObjID: Variant;
begin
  Result := Null;
    case SelObjType of
      eotBsn :
      begin
      end;
      eotFin :
      begin
        if AccsFrame1.cdsAccs.Active then
          Result := AccsFrame1.cdsAccs.FieldByName('id_Acc').Value;
      end;
      eotWH :
      begin
        if WareHouseFrame1.cdsWareHouses.Active then
          Result :=  WareHouseFrame1.cdsWareHouses.FieldByName('id_WareHouse').Value;
      end;
      eotManuf :
      begin
        if ManufactFrame1.cdsManufacts.Active then
          Result :=  ManufactFrame1.cdsManufacts.FieldByName('id_Manufact').Value;
      end;
      eotOwnCA :
      begin
        Result := fCaNavigatorOwn.CA_ID;
      end;
      eotOwnRepr :
      begin
        Result := fCaNavigatorOwn.Repr_ID;
      end;
      eotCA :
      begin
        Result := fCaNavigator.CA_ID;
      end;
      eotRepr :
      begin
        Result := fCaNavigator.Repr_ID;
      end;
      eotSimplRepr :
      begin
        Result := fReprList1.Repr_ID;
      end;
      eotEQ :
      begin
       Result :=  EquipFrame1.cdsEquips.FieldByName('id_Equipment').Value;
      end;
      eotWare :
      begin
        Result := fWareGoods.WareID;
      end;
      eotRaw :
      begin
        Result := fWareRaw.WareID;
      end;
      eotExtRaw :
      begin
        Result := fWareExtRaw.WareID;
      end;
      eotService :
      begin
        Result := fWareService.WareID;
      end;
    end;
end;

function TfUnSelectorLC.GetObjName: String;
begin
  Result := '';
    case SelObjType of
      eotBsn :
      begin
      end;
      eotFin :
      begin
        if AccsFrame1.cdsAccs.Active then
          Result := AccsFrame1.cdsAccs.FieldByName('Name').AsString;
      end;
      eotWH :
      begin
        if WareHouseFrame1.cdsWareHouses.Active then
          Result :=  WareHouseFrame1.cdsWareHouses.FieldByName('Name').AsString;
      end;
      eotManuf :
      begin
        if ManufactFrame1.cdsManufacts.Active then
          Result :=  ManufactFrame1.cdsManufacts.FieldByName('Name').AsString;
      end;
      eotOwnCA :
      begin
        Result := fCaNavigatorOwn.CA_Name;
      end;
      eotOwnRepr :
      begin
        Result := fCaNavigatorOwn.Repr_Name;
      end;
      eotCA :
      begin
        Result := fCaNavigator.CA_Name;
      end;
      eotRepr :
      begin
        Result := fCaNavigator.Repr_Name;
      end;
      eotSimplRepr :
      begin
        Result := fReprList1.Repr_Name; 
      end;
      eotEQ :
      begin
       Result :=  EquipFrame1.cdsEquips.FieldByName('Name').AsString;
      end;
      eotWare :
      begin
        Result := fWareGoods.WareName;
      end;
      eotRaw :
      begin
        Result := fWareRaw.WareName;
      end;
      eotExtRaw :
      begin
        Result := fWareExtRaw.WareName;
      end;
      eotService :
      begin
        Result := fWareService.WareName;
      end;
    end;
end;

function TfUnSelectorLC.GetisNeedObjSelected: boolean;
begin
  Result := ((SelObjType in FEObjTypes) or
     ((SelObjType = eotOwnRepr) and (SelObjType in FEObjTypes)) or
     ((SelObjType = eotRepr) and (SelObjType in FEObjTypes))
     ) and (SelObjID <> Null);
end;

end.
