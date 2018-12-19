unit frEForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ExtCtrls, StdCtrls,
  registry, frReprList, db, frWare, foMyFunc,
  ActnList, ToolWin, RXCtrls, frCaNavigator, uAccsFrame, uWareHouseFrame,
  uManufactFrame, Menus, frTreeChItem, contnrs, jpeg;

type
 
  TEObj = class
    EObjType : TEObjType;
    id_Bsn : Variant;
    Name  : String;
    constructor Create(ATEObjType : TEObjType; Aid_Bsn : Variant);
  private
  end;

  TfEForm = class(TFrame)
    TreeView1: TTreeView;
    ilEM: TImageList;
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    tsFin: TTabSheet;
    tsGoods: TTabSheet;
    ActionList1: TActionList;
    aShowTree: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    tsEmpty: TTabSheet;
    Label1: TLabel;
    tsBsn: TTabSheet;
    tsCA: TTabSheet;
    tsWH: TTabSheet;
    tsManuf: TTabSheet;
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
    tsRepr: TTabSheet;
    tsNoRights: TTabSheet;
    Label2: TLabel;
    Image2: TImage;
    ToolButton5: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure TrChange(Sender: TObject; Node: TTreeNode);
    procedure aShowTreeExecute(Sender: TObject);
    procedure TreeView1Deletion(Sender: TObject; Node: TTreeNode);
    procedure aBsnPropExecute(Sender: TObject);
    procedure aNewBsnExecute(Sender: TObject);
    procedure aRefresheBsnExecute(Sender: TObject);
    procedure fWareGoodsFilterEditChange(Sender: TObject);
  private

    FInSelect : boolean;
    FBsns : TObjectList;
    Fid_Bsn : Variant;
    FDisabled : Variant;
    FEObjTypes : TEObjTypes;
    FReadOnly : boolean;
    FSelectedObj : TSelectedObj;
    FID_WareHouse: Variant;

    procedure GetTree(Node : TTreeNode; id_Bsn : Variant);
    procedure SetTabSheet(ATabSheet: TTabSheet);
    procedure GetNodeImageIndex(Node: TTreeNode);
    function GetObjType: TEObjType;
//    procedure InternalInitialize(ASelectedObj : TSelectedObj; id_Bsn : Variant; UID : Variant; Disabled : Variant; AEObjTypes : TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, {eotOwnCA, eotOwnRepr,} eotCA, {eotRepr,} {eotEQ, eotCatalog,} eotGoods, eotRaw, eotExtRaw, eotService]; AReadOnly : Boolean; AShowAllBsn : boolean);
    function GetEObjType: TEObjType;
    function GetSelObjID: Variant;
    function GetObjName: String;
    function GetisNeedObjSelected: boolean;
    procedure SetNode(Node: TTreeNode);
    function CheckNode(Node: TTreeNode): boolean;
    procedure InternalInitialize(ASelectedObj: TSelectedObj; id_Bsn, UID,
      Disabled: Variant; AEObjTypes: TEObjTypes; AReadOnly,
      AShowAllBsn: boolean; AID_WareHouse: Variant);
    procedure CreateFrames;
  public
    AccsFrame1: TAccsFrame;
    fCaNavigator: TfCaNavigator;
    fWareGoods : TfWare;
    WareHouseFrame1: TWareHouseFrame;
    ManufactFrame1: TManufactFrame;
    fReprList1: TfReprList;

    function GetBsn: Variant;
    function GetBsn_v2: Variant;
    function GetBsnName: String;

    procedure SetPosit(ASelectedObj : TSelectedObj);
    procedure Initialize(ASelectedObj : TSelectedObj; id_Bsn : Variant; Disabled : Variant; AEObjTypes : TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, eotCA, eotGoods]; AReadOnly : boolean = false; AShowAllBsn : boolean = false);
    procedure Initialize_WH(ASelectedObj : TSelectedObj; id_Bsn : Variant; Disabled : Variant; AID_WareHouse: Variant; AEObjTypes : TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, eotCA, eotGoods]; AReadOnly : boolean = false; AShowAllBsn : boolean = false);
    procedure Initialize2(ASelectedObj : TSelectedObj; UID : Variant; Disabled : Variant; AEObjTypes : TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, eotCA, eotGoods]; AReadOnly : boolean = false; AShowAllBsn : boolean = false);
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
//    eotOwnCA : Name := 'Свои контрагенты';
    eotCA : Name := 'Контрагенты';
//    eotCatalog : Name := 'Каталог';
    eotGoods : Name := 'Товар';
    eotSimplRepr : Name := 'Представители';
  end;
end;

{ TEForm }

function TfEForm.GetBsnName : String;
begin
  Result := DM.GetBusinessName(GetBsn_v2);
end;


destructor TfEForm.Destroy;
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
begin
  ShowText('', 1);
  ShowText('', 2);
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

  if fWareGoods <> nil then
    with fWareGoods do SaveGridSettingsToRegistry(grdList, SRegPath + Name + '\grdList');
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  FBsns.Free;
  inherited;
end;

constructor TfEForm.Create(AOwner: TComponent);
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
    ID_Bsn : Variant;
    ObjType : TEObjType;
begin
  inherited;
  FInSelect := false;
  FID_WareHouse := Null;
  
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

procedure TfEForm.GetTree(Node: TTreeNode; id_Bsn: Variant);
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
{  if (eotOwnCA in FEObjTypes) or (eotOwnRepr in FEObjTypes) then
  begin
    Obj := TEObj.Create(eotOwnCA, id_Bsn);
    N := TreeView1.Items.AddChildObject(Node, Obj.Name, Obj);
  end; }
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

  if eotGoods in FEObjTypes then
  begin
    Obj := TEObj.Create(eotGoods, id_Bsn);
    N := TreeView1.Items.AddChildObject(Node, Obj.Name, Obj);
  end;
end;

procedure TfEForm.CreateFrames;
begin
//  if DM.FBsnList.Count = 0 then Exit;
  if (eotFin in FEObjTypes) and (not assigned(AccsFrame1)) then
  begin
    AccsFrame1 := TAccsFrame.Create(Self);
    AccsFrame1.Parent := tsFin;
    AccsFrame1.Align := alClient;
  end;
  if ((eotCA in FEObjTypes) or (eotRepr in FEObjTypes) ) and (not assigned(fCaNavigator))then
  begin
    fCaNavigator := TfCaNavigator.Create(Self);
    fCaNavigator.Parent := tsCA;
    fCaNavigator.Align := alClient;
  end;

  if (eotGoods in FEObjTypes) and (not assigned(fWareGoods))  then
  begin
    fWareGoods := TfWare.Create(Self);
    fWareGoods.Parent := tsGoods;
    fWareGoods.Align := alClient;
    fWareGoods.FilterEdit.Focused;
    with fWareGoods do LoadGridSettingsFromRegistry(grdList, SRegPath + Name + '\grdList');
  end;

  if (eotWH in FEObjTypes) and (not assigned(WareHouseFrame1)) then
  begin
    WareHouseFrame1 := TWareHouseFrame.Create(Self);
    WareHouseFrame1.Parent := tsWH;
    WareHouseFrame1.Align := alClient;
  end;

  if (eotManuf in FEObjTypes) and (not assigned(ManufactFrame1)) then
  begin
    ManufactFrame1 := TManufactFrame.Create(Self);
    ManufactFrame1.Parent := tsManuf;
    ManufactFrame1.Align := alClient;
  end;

  if (eotSimplRepr in FEObjTypes) and (not assigned(fReprList1)) then
  begin
    fReprList1 := TfReprList.Create(Self);
    fReprList1.Parent := tsRepr;
    fReprList1.Align := alClient;
  end;
end;

procedure TfEForm.InternalInitialize(ASelectedObj : TSelectedObj; id_Bsn : Variant; UID : Variant; Disabled : Variant; AEObjTypes : TEObjTypes; AReadOnly : boolean; AShowAllBsn : boolean; AID_WareHouse: Variant);
var i : integer;
    Obj : TEObj;
    N : TTreeNode;
begin
  TreeView1.Items.Clear;
  Fid_Bsn := id_Bsn;
  FDisabled := Disabled;
  FEObjTypes := AEObjTypes;
  HideEObjTypes(FEObjTypes);
  CreateFrames;

  FReadOnly := AReadOnly;
  FSelectedObj := ASelectedObj;

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

      if AShowAllBsn and (TreeView1.Items.Count > 0) then
      begin
        Obj := TEObj.Create(eotBsn, Null);
        Obj.Name := 'Все бизнесы';
        N := TreeView1.Items.AddObject(nil, Obj.Name, Obj);
        GetTree(N, Obj.id_Bsn);
      end;
    end;
  end
  else
  begin
    GetTree(nil, id_Bsn);
  end;
  
  try
    FInSelect := true;
    SetPosit(ASelectedObj);
  except
  end;
  FInSelect := true;
  
  if TreeView1.Items.Count = 1 then
  begin
    if TreeView1.Selected <> TreeView1.Items[0] then
    begin
      TreeView1.Items[0].Selected := true;
      TreeView1.OnChange(TreeView1, TreeView1.Selected);
    end;
    aNewBsn.Enabled := false;
    aBsnProp.Enabled := false;

    TreeView1.Visible := false;
    ToolButton1.Down := TreeView1.Visible;
  end;
  fTreeChItem1.SetBsnNode(nil);
  lbBsn.Caption := '';
end;


procedure TfEForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfEForm.TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  GetNodeImageIndex(Node);
end;

procedure TfEForm.GetNodeImageIndex(Node: TTreeNode);
begin
  if (TObject(Node.Data) is TEObj)
  and not ((TEObj(Node.Data).id_Bsn = Null) and (TEObj(Node.Data).EObjType = eotBsn)) then
  begin
    case TEObj(Node.Data).EObjType of
      eotBsn : Node.ImageIndex := 16;
      eotFin : Node.ImageIndex := 19;
      eotWH : Node.ImageIndex := 31;
      eotManuf : Node.ImageIndex := 26;
      eotCA : Node.ImageIndex := 32;
      eotGoods : Node.ImageIndex := 20;
      eotSimplRepr : Node.ImageIndex := 32;
    end;
  end
  else
    Node.ImageIndex := -1;  
end;

procedure TfEForm.TreeView1GetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TfEForm.SetTabSheet(ATabSheet: TTabSheet);
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

function TfEForm.GetBsn : Variant;
begin
  Result := -1;
  if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) and (TObject(TreeView1.Selected.Data) is TEObj) then
  begin
    Result := TEObj(TreeView1.Selected.Data).id_Bsn;
  end;
end;

function TfEForm.GetBsn_v2 : Variant;
begin
  Result := -1;
  if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) and (TObject(TreeView1.Selected.Data) is TEObj) then
  begin
    Result := TEObj(TreeView1.Selected.Data).id_Bsn;
    if Result = Null then
    begin
        case SelObjType of
          eotFin :
          begin
            if AccsFrame1.cdsAccs.Active then
              Result := AccsFrame1.cdsAccs.FieldByName('id_business').Value;
          end;
          eotWH :
          begin
            if WareHouseFrame1.cdsWareHouses.Active then
              Result :=  WareHouseFrame1.cdsWareHouses.FieldByName('id_business').Value;
          end;
          eotManuf :
          begin
            if ManufactFrame1.cdsManufacts.Active then
              Result :=  ManufactFrame1.cdsManufacts.FieldByName('id_business').Value;
          end;
  {        eotOwnCA :
          begin
            Result := fCaNavigatorOwn.fCntrAgentList1.cdsCAgent.FieldByName('id_business').Value;
          end;    
          eotOwnRepr :
          begin
            Result := fCaNavigatorOwn.fCntrAgentList1.cdsCAgent.FieldByName('id_business').Value;
          end;     }
          eotCA :
          begin
            Result := fCaNavigator.fCntrAgentList1.cdsCAgent.FieldByName('id_business').Value;
          end;
          eotRepr :
          begin
            Result := fCaNavigator.fCntrAgentList1.cdsCAgent.FieldByName('id_business').Value;
          end;
          eotSimplRepr :
          begin
            Result := fReprList1.cdsPepr.FieldByName('id_business').Value;
          end;
          eotGoods :
          begin
     //       Result := fWareGoods.WareID;
          end;
        end;
    end;
  end;
end;

function TfEForm.GetObjType : TEObjType;
begin
  Result := eotNone;
  if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) and (TObject(TreeView1.Selected.Data) is TEObj) then
  begin
    Result := TEObj(TreeView1.Selected.Data).EObjType;
  end;
end;

function TfEForm.CheckNode(Node: TTreeNode) : boolean;
var ABsn_ID : Variant;
begin
  Result := false;
  ABsn_ID := GetBsn;
  case TEObj(Node.Data).EObjType of
    eotBsn :
    begin
      Result := true;
    end;
    eotFin :
    begin
      Result := DM.CheckUserRights(2, ABsn_ID)
                or DM.CheckUserRights(6, ABsn_ID);
    end;
    eotWH :
    begin
      Result := DM.CheckUserRights(1, ABsn_ID)
                or DM.CheckUserRights(6, ABsn_ID)
                or DM.CheckUserRights(25, ABsn_ID);
    end;
    eotManuf :
    begin
      Result := DM.CheckUserRights(1, ABsn_ID)
                or DM.CheckUserRights(25, ABsn_ID);
    end;
    eotCA :
    begin
      Result := DM.CheckUserRights(1, ABsn_ID)
                or DM.CheckUserRights(2, ABsn_ID)
                or DM.CheckUserRights(3, ABsn_ID)
                or DM.CheckUserRights(25, ABsn_ID);
    end;
    eotSimplRepr :
    begin
      Result := DM.CheckUserRights(1, ABsn_ID)
                or DM.CheckUserRights(2, ABsn_ID)
                or DM.CheckUserRights(3, ABsn_ID)
                or DM.CheckUserRights(25, ABsn_ID);
    end;
    eotGoods :
    begin
      Result := DM.CheckUserRights(1, ABsn_ID)
                or DM.CheckUserRights(25, ABsn_ID);
    end;
  end;
end;

procedure TfEForm.SetNode(Node: TTreeNode);
  function ConvIDToTag(AID : Variant) : integer;
  begin
    Result := -1;
    if (VarType(AID) <> varEmpty) and (VarType(AID) <> varNull) then
      Result := AID;
  end;
var ABsn_ID : Variant;
    AID : Variant;
begin
  AID := FSelectedObj.ID;
  if (VarType(AID) = varEmpty) or
     ((FSelectedObj.ObjType <> TEObj(Node.Data).EObjType) and not ((FSelectedObj.ObjType = eotRepr) and (TEObj(Node.Data).EObjType = eotCA))) then
    AID := Null;
    
  if (Node <> nil) and (TObject(Node.Data) is TEObj) then
  begin
    ABsn_ID := GetBsn;
    lbBsn.Caption := Node.Text;
    case TEObj(Node.Data).EObjType of
      eotBsn :
      begin
        SetTabSheet(tsBsn);
        fTreeChItem1.SetBsnNode(Node);
        ShowText('', 1);
        ShowText('', 2);
      end;
      eotFin :
      begin
        SetTabSheet(tsFin);
        if PageControl1.ActivePage.Tag <> ConvIDToTag(ABsn_ID) then
        begin
          with AccsFrame1 do
          begin
            Init(Null, ABsn_ID, FReadOnly, not FReadOnly);
          end;
        end;
      end;
      eotWH :
      begin
        SetTabSheet(tsWH);
        if PageControl1.ActivePage.Tag <> ConvIDToTag(ABsn_ID) then
        begin
          with WareHouseFrame1 do
          begin
            Init(Null, ABsn_ID, FReadOnly, not FReadOnly);
          end;
        end;
      end;
      eotManuf :
      begin
        SetTabSheet(tsManuf);
        if PageControl1.ActivePage.Tag <> ConvIDToTag(ABsn_ID) then
        begin
          with ManufactFrame1 do
          begin
            Init(Null, ABsn_ID, FReadOnly, not FReadOnly);
          end;
        end;
      end;
      eotCA :
      begin
        SetTabSheet(tsCA);
        if PageControl1.ActivePage.Tag <> ConvIDToTag(ABsn_ID) then
        begin
 //         if not FInSelect then
          if (FSelectedObj.ObjType = eotRepr) and (AID <> Null) and (AID <> -1) then
            fCaNavigator.InitializeRepr(AID, FDisabled, not FReadOnly)
          else
            fCaNavigator.Initialize(AID, ABsn_ID, FDisabled, not FReadOnly);
        end;
      end;
      eotSimplRepr :
      begin
        SetTabSheet(tsRepr);
        fReprList1.Initialize(Null, Null, FDisabled, ABsn_ID);
      end;
      eotGoods :
      begin
        SetTabSheet(tsGoods);
        if PageControl1.ActivePage.Tag <> ConvIDToTag(ABsn_ID) then
        begin
          if FID_WareHouse <> Null then
            fWareGoods.Initialize_WH(AID, ABsn_ID, FDisabled, FID_WareHouse)
          else
            fWareGoods.Initialize(AID, ABsn_ID, FDisabled);
        end;
      end;
    end;
    PageControl1.ActivePage.Tag := ConvIDToTag(ABsn_ID);
  end
  else
  begin
    fTreeChItem1.SetBsnNode(nil);
    lbBsn.Caption := '';
  end;
  aBsnProp.Enabled := (Node <> nil) and (TObject(Node.Data) is TEObj) and (TEObj(Node.Data).EObjType = eotBsn);
end;

procedure TfEForm.TrChange(Sender: TObject; Node: TTreeNode);
begin
  if CheckNode(Node) then
    SetNode(Node)
  else
  begin
    PageControl1.ActivePage := tsNoRights;
    ShowText('', 1);
    ShowText('', 2);
  end;
end;

procedure TfEForm.aShowTreeExecute(Sender: TObject);
begin
  TreeView1.Visible := not TreeView1.Visible;
  ToolButton1.Down := TreeView1.Visible;
end;

procedure TfEForm.TreeView1Deletion(Sender: TObject; Node: TTreeNode);
begin
  if Node.Data <> nil then
    TObject(Node.Data).Free;
end;

procedure TfEForm.aBsnPropExecute(Sender: TObject);
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

procedure TfEForm.aNewBsnExecute(Sender: TObject);
var
  ID : Variant;
  AName: OleVariant;
begin
  ID := -1;
  if ShowBusinessDetailForm(ID, false) then
  begin
    aRefresheBsn.Execute;
 //   cdsBusiness.Locate('id_Business', Id, [loCaseInsensitive]);
  end;
end;

procedure TfEForm.aRefresheBsnExecute(Sender: TObject);
var Need : TSelectedObj;
begin
  Need.ID := Null;
  Need.ObjType := eotNone;
  if isNeedObjSelected then
  begin
    Need.ObjType := SelObjType;
    Need.ID := SelObjID;
  end;
  Initialize(Need, Fid_Bsn, FDisabled, FEObjTypes);
end;

procedure TfEForm.Initialize2(ASelectedObj : TSelectedObj; UID: Variant; Disabled: Variant;
  AEObjTypes: TEObjTypes; AReadOnly : boolean; AShowAllBsn : boolean);
begin
  InternalInitialize(ASelectedObj, -13, UID, Disabled, AEObjTypes, AReadOnly, AShowAllBsn, Null);
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

procedure TfEForm.Initialize(ASelectedObj : TSelectedObj; id_Bsn, Disabled: Variant;
  AEObjTypes: TEObjTypes; AReadOnly : boolean; AShowAllBsn : boolean);
begin
  InternalInitialize(ASelectedObj, id_Bsn, Null, Disabled, AEObjTypes, AReadOnly, AShowAllBsn, Null);
end;

function TfEForm.GetEObjType: TEObjType;
var AControl : TWinControl;
begin
  Result := eotNone;
  if (TreeView1.Selected <> nil) and (TObject(TreeView1.Selected.Data) is TEObj) then
  begin
    Result := TEObj(TreeView1.Selected.Data).EObjType;
//    if (Result = eotOwnCA) and (eotOwnRepr in FEObjTypes) and fCaNavigatorOwn.ShowReprList   then
  //    Result := eotOwnRepr;
    if (Result = eotCA) and (eotRepr in FEObjTypes) and fCaNavigator.ShowReprList  then
      Result := eotRepr;
  end;
end;

function TfEForm.GetSelObjID: Variant;
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
      eotGoods :
      begin
        Result := fWareGoods.WareID;
      end;
    end;
end;

function TfEForm.GetObjName: String;
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
      eotGoods :
      begin
        Result := fWareGoods.WareName;
      end;
    end;
end;

function TfEForm.GetisNeedObjSelected: boolean;
begin
  Result := ((SelObjType in FEObjTypes) or
//     ((SelObjType = eotOwnRepr) and (SelObjType in FEObjTypes)) or
     ((SelObjType = eotRepr) and (SelObjType in FEObjTypes))
     ) and (SelObjID <> Null);
end;

procedure TfEForm.SetPosit(ASelectedObj: TSelectedObj);
  function SetBsn(ID : integer; ObjType : TEObjType) : boolean;
  var i, j : integer;
  begin
    Result := false;
    if ((FBsns.Count = 1) and (TBsnObj(FBsns[0]).ID = ID)) or (Fid_Bsn = ID)  then
    begin
      for j := 0 to TreeView1.Items.Count - 1 do
      begin
        if (TObject(TreeView1.Items.Item[j].Data) is TEObj) and (TEObj(TreeView1.Items.Item[j].Data).EObjType = ObjType) then
        begin
          Result := true;
          TreeView1.Items.Item[j].Selected := true;
   //       SetNode(TreeView1.Selected);

          Break;
        end;
      end;
    end
    else
    begin
      for i := 0 to TreeView1.Items.Count - 1 do
      begin
        if (TObject(TreeView1.Items[i].Data) is TEObj)
            and (TEObj(TreeView1.Items[i].Data).EObjType = eotBsn) 
            and (TEObj(TreeView1.Items[i].Data).id_Bsn = ID) then
        begin
          Result := true;
          TreeView1.Items[i].Selected := true;
     //     TreeView1.OnChange(TreeView1, TreeView1.Selected);

          // Ищем объект в бизнесе
          for j := 0 to TreeView1.Selected.Count - 1 do
          begin
            if (TObject(TreeView1.Selected.Item[j].Data) is TEObj)
               and (TEObj(TreeView1.Selected.Item[j].Data).EObjType = ObjType) then
            begin
              Result := true;
              TreeView1.Selected.Item[j].Selected := true;
       //       SetNode(TreeView1.Selected);

              Break;
            end;
          end;
          Break;
        end;
      end;
    end;
  end;
var ID : OleVariant;
    isOwn : WordBool;
    id_Group, id_Ca : OleVariant;
begin
  id_Group := Null;
  case ASelectedObj.ObjType of
    eotNone : SetTabSheet(tsEmpty);
    eotFin :
    begin
      if DM.rsCA.AppServer.UNSel_AccBsn(ASelectedObj.ID, ID, id_Group) = 1 then
      begin
        if SetBsn(ID, ASelectedObj.ObjType) then
        begin
          AccsFrame1.Init(ASelectedObj.ID, ID, FReadOnly, not FReadOnly);
       //   ID := AccsFrame1.ID_Business;
       //   SetBsn(ID, ASelectedObj.ObjType);
        end;
      end;
    end;
    eotWH :
    begin
      if DM.rsCA.AppServer.UNSel_WHBsn(ASelectedObj.ID, ID, id_Group) = 1 then
      begin
        if SetBsn(ID, ASelectedObj.ObjType) then
        begin
          WareHouseFrame1.Init(ASelectedObj.ID, ID, FReadOnly, not FReadOnly);
       //   ID := WareHouseFrame1.ID_Business;
       //   SetBsn(ID, ASelectedObj.ObjType);
        end;
      end;
{      ID := DM.rsCA.AppServer.UNSel_WHBsn(ASelectedObj.ID);
      if SetBsn(ID, ASelectedObj.ObjType) then
      begin
        WareHouseFrame1.cdsWareHouses.Locate('id_Warehouse', ASelectedObj.ID, []);
      end;  }
    end;
    eotManuf :
    begin
      if DM.rsCA.AppServer.UNSel_ManufBsn(ASelectedObj.ID, ID, id_Group) = 1 then
      begin
        if SetBsn(ID, ASelectedObj.ObjType) then
        begin
          ManufactFrame1.Init(ASelectedObj.ID, ID, FReadOnly, not FReadOnly);
       //   ID := ManufactFrame1.ID_Business;
       //   SetBsn(ID, ASelectedObj.ObjType);
        end;
      end;
    end;
    eotCA :
    begin          
      if ASelectedObj.ID <> -1 then
        ID := DM.rsCA.AppServer.UNSel_CABsn(ASelectedObj.ID, isOwn, id_Group)
      else
        ID := Fid_Bsn;
      if (ID <> -1) and SetBsn(ID, eotCA) then
      begin
        fCaNavigator.fCAGroupList1.ID := id_Group;
        fCaNavigator.CA_ID := ASelectedObj.ID;
      end;
    end;
    eotRepr :
    begin
      ID := DM.rsCA.AppServer.UNSel_ReprBsn(ASelectedObj.ID, isOwn, id_Group, id_Ca);
      if VarIsEmpty(id_Ca) then id_Ca := Null;
      if SetBsn(ID, eotCA) then
      begin
    {    if id_Ca = Null then
        begin
          fCaNavigator.fCAGroupList1.ID := -13;
          fCaNavigator.Repr_ID := ASelectedObj.ID;
        end
        else
        begin
          if id_Group = Null then
            id_Group := -2;
          fCaNavigator.fCAGroupList1.ID := id_Group;
          fCaNavigator.CA_ID := id_Ca;
          fCaNavigator.Repr_ID := ASelectedObj.ID;
        end; }
      end;
    end;
    eotGoods :
    begin
      ID := DM.rsCA.AppServer.UNSel_PL_GoodsInf(ASelectedObj.ID);
      if SetBsn(ID, ASelectedObj.ObjType) then
      begin
        //
      end;
    end;
    eotSimplRepr :
    begin
      ID := DM.rsCA.AppServer.UNSel_ReprBsn(ASelectedObj.ID, isOwn, id_Group, id_Ca);
        if SetBsn(ID, ASelectedObj.ObjType) then
        begin
          fReprList1.Repr_ID := ASelectedObj.ID;
        end;
      end;
  end;
end;

procedure TfEForm.fWareGoodsFilterEditChange(Sender: TObject);
begin
  fWareGoods.FilterEditChange(Sender);

end;

procedure TfEForm.Initialize_WH(ASelectedObj: TSelectedObj; id_Bsn,
  Disabled, AID_WareHouse: Variant; AEObjTypes: TEObjTypes; AReadOnly,
  AShowAllBsn: boolean);
begin
  FID_WareHouse := AID_WareHouse;
  InternalInitialize(ASelectedObj, id_Bsn, Null, Disabled, AEObjTypes, AReadOnly, AShowAllBsn, AID_WareHouse);
end;


end.
