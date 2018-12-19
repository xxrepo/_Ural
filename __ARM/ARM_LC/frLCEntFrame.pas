unit frLCEntFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ExtCtrls, StdCtrls,
  registry, db, foMyFunc,
  ActnList, ToolWin, RXCtrls,   
  Menus, frTreeChItem, contnrs, frAccList, frWare, frWHList, 
  frManufactList, frReprListLC, frCaNavigator, jpeg;

type
 
  TEObj = class
    EObjType : TEObjType;
    id_Bsn : Variant;
    Name  : String;
    constructor Create(ATEObjType : TEObjType; Aid_Bsn : Variant);
  end;

  TfLCEntFrame = class(TFrame)
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
    tsBsn: TTabSheet;
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
    fAccList1: TfAccList;
    fWareGoods: TfWare;
    fWHList1: TfWHList;
    fManufactList1: TfManufactList;
    fReprListLC1: TfReprListLC;
    tsNoRights: TTabSheet;
    Label2: TLabel;
    Label1: TLabel;
    Image2: TImage;
    tsCA: TTabSheet;
    fCaNavigator1: TfCaNavigator;
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
    FID_WareHouse : Variant;
    FSelectedObj : TSelectedObj;
    Fid_Bsn : Variant;
    FDisabled : Variant;
    FEObjTypes : TEObjTypes;
    FReadOnly : boolean;
    procedure GetTree(Node : TTreeNode; id_Bsn : Variant);
    procedure SetTabSheet(ATabSheet: TTabSheet);
    procedure GetNodeImageIndex(Node: TTreeNode);
    function GetObjType: TEObjType;
    procedure InternalInitialize(ASelectedObj : TSelectedObj; id_Bsn : Variant; UID : Variant; Disabled : Variant; AEObjTypes : TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, eotGoods, eotSimplRepr]; AReadOnly : Boolean = false; AShowAllBsn : boolean = true; AID_WareHouse: integer = -1);
    function GetEObjType: TEObjType;
    function GetSelObjID: Variant;
    function GetObjName: String;
    function GetisNeedObjSelected: boolean;
    procedure SetPosit(ASelectedObj: TSelectedObj);
    procedure SetNode(Node: TTreeNode);
    function CheckNode(Node: TTreeNode): boolean;
  public
    function GetBsn: Variant;
    function GetBsn_v2: Variant;
    function GetBsnName: String;

    procedure Initialize(ASelectedObj : TSelectedObj; id_Bsn : Variant; Disabled : Variant; AEObjTypes : TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, eotGoods, eotSimplRepr]; AReadOnly : boolean = false; AShowAllBsn : boolean = true; AID_WareHouse: integer = -1);
    procedure Initialize_WH(ASelectedObj : TSelectedObj; id_Bsn : Variant; Disabled : Variant; AEObjTypes : TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, eotGoods, eotSimplRepr]; AReadOnly : boolean = false; AShowAllBsn : boolean = true; AID_WareHouse: integer = -1);
    procedure Initialize2(ASelectedObj : TSelectedObj; UID : integer; Disabled : Variant; AEObjTypes : TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, eotGoods, eotSimplRepr]; AReadOnly : boolean = false; AShowAllBsn : boolean = true; AID_WareHouse: integer = -1);
    destructor Destroy; override;
    constructor Create(AOwner: TComponent); override;

    property EObjTypes : TEObjTypes read FEObjTypes;

    property SelObjType : TEObjType read GetEObjType;
    property SelObjID : Variant read GetSelObjID;
    property SelObjName : String read GetObjName;

    property isNeedObjSelected : boolean read GetisNeedObjSelected;
  end;


implementation

uses uMainForm, uDM;
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
    eotCA : Name := 'Контрагенты';
    eotGoods : Name := 'Товар';
    eotSimplRepr : Name := 'Представители';
    eotRepr : Name := 'Представители';
  end;
end;

{ TEForm }
destructor TfLCEntFrame.Destroy;
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
  with fWareGoods do SaveGridSettingsToRegistry(grdList, SRegPath + Name + '\grdList');
  FBsns.Free;
  inherited;
end;

constructor TfLCEntFrame.Create(AOwner: TComponent);
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
    ID_Bsn : Variant;
    ObjType : TEObjType;
begin
  inherited;
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
  with fWareGoods do LoadGridSettingsFromRegistry(grdList, SRegPath + Name + '\grdList');
  finally
    ToolButton1.Down := TreeView1.Visible;
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TfLCEntFrame.GetTree(Node: TTreeNode; id_Bsn: Variant);
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
 { if (eotOwnCA in FEObjTypes) or (eotOwnRepr in FEObjTypes) then
  begin
    Obj := TEObj.Create(eotOwnCA, id_Bsn);
    N := TreeView1.Items.AddChildObject(Node, Obj.Name, Obj);
  end;  }
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

procedure TfLCEntFrame.InternalInitialize(ASelectedObj : TSelectedObj; id_Bsn : Variant; UID : Variant; Disabled : Variant; AEObjTypes : TEObjTypes; AReadOnly : boolean; AShowAllBsn : boolean; AID_WareHouse: integer);
var i : integer;
    Obj : TEObj;
    N : TTreeNode;
begin
      {$IFDEF ACS_v2}
        if eotSimplRepr in AEObjTypes then
        begin
          AEObjTypes := AEObjTypes - [eotSimplRepr];
          AEObjTypes := AEObjTypes + [eotRepr];
        end;
       {$ENDIF}

  Screen.Cursor := crSQLWait;
  try
  //  if (eotCA in AEObjTypes) or
  //     (eotRepr in AEObjTypes) then
  //     raise Exception.Create('Вызов функции с недопустимыми параметрами');   

    Fid_Bsn := id_Bsn;
    FDisabled := Disabled;
    FEObjTypes := AEObjTypes;
    FReadOnly := AReadOnly;

    FSelectedObj := ASelectedObj;

    if (id_Bsn = -13) then
    begin
      DM.GetBsnList(FBsns, DM.IDUser, UID);
      if FBsns.Count = 0 then
        raise Exception.Create('Нет прав на работу ни с одним бизнесом');
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
      {{  if AShowAllBsn and (TreeView1.Items.Count > 0) then
        begin
          Obj := TEObj.Create(eotBsn, Null);
          Obj.Name := 'Все бизнесы';
          N := TreeView1.Items.AddObject(nil, Obj.Name, Obj);
          GetTree(N, Obj.id_Bsn);
        end;  }
      end;
    end
    else
    begin
      GetTree(nil, id_Bsn);
    end;
    try
      SetPosit(ASelectedObj);
    except
    end;
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
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TfLCEntFrame.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfLCEntFrame.TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  GetNodeImageIndex(Node);
end;

procedure TfLCEntFrame.GetNodeImageIndex(Node: TTreeNode);
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
  end;
end;

procedure TfLCEntFrame.TreeView1GetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TfLCEntFrame.SetTabSheet(ATabSheet: TTabSheet);
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

function TfLCEntFrame.GetBsn : Variant;
begin
  Result := -1;
  if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) and (TObject(TreeView1.Selected.Data) is TEObj) then
  begin
    Result := TEObj(TreeView1.Selected.Data).id_Bsn;
  end;
end;

function TfLCEntFrame.GetBsnName : String;
begin
  Result := DM.GetBusinessName(GetBsn);
end;

function TfLCEntFrame.GetObjType : TEObjType;
begin
  Result := eotNone;
  if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) and (TObject(TreeView1.Selected.Data) is TEObj) then
  begin
    Result := TEObj(TreeView1.Selected.Data).EObjType;
  end;
end;

function TfLCEntFrame.CheckNode(Node: TTreeNode) : boolean;
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
      Result := DM.CheckUserRights(2, ABsn_ID);
    end;
    eotWH :
    begin
      Result := DM.CheckUserRights(1, ABsn_ID)
            {$IFDEF LC}
     or DM.CheckUserRights(1001, ABsn_ID)
      {$ENDIF}
;
    end;
    eotManuf :
    begin
      Result := DM.CheckUserRights(1, ABsn_ID)
;
    end;
    eotCA :
    begin
      Result := DM.CheckUserRights(1, ABsn_ID)
                or DM.CheckUserRights(2, ABsn_ID)
                or DM.CheckUserRights(3, ABsn_ID)
;
    end;
    eotSimplRepr :
    begin
      Result := DM.CheckUserRights(1, ABsn_ID)
                or DM.CheckUserRights(2, ABsn_ID)
                or DM.CheckUserRights(3, ABsn_ID);
    end;
    eotGoods :
    begin
      Result := DM.CheckUserRights(1, ABsn_ID)      {$IFDEF LC}
     or DM.CheckUserRights(1001, ABsn_ID)
      {$ENDIF}
;
    end;
  end;
end;

procedure TfLCEntFrame.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if CheckNode(Node) then
    SetNode(Node)
  else
    PageControl1.ActivePage := tsNoRights;
end;

procedure TfLCEntFrame.SetNode(Node: TTreeNode);
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
  if VarType(AID) = varEmpty then
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
      end;
      eotFin :
      begin
        SetTabSheet(tsFin);
        if PageControl1.ActivePage.Tag <> ConvIDToTag(ABsn_ID) then
        begin
          with fAccList1 do
          begin
            Init(ABsn_ID, Null, Null, FReadOnly, not FReadOnly, false);
          end;
        end;
      end;
      eotWH :
      begin
        SetTabSheet(tsWH);
        if PageControl1.ActivePage.Tag <> ConvIDToTag(ABsn_ID) then
        begin
          with fWHList1 do
          begin
            Init(ABsn_ID, Null, Null, FReadOnly, not FReadOnly, false);
          end;
        end;
      end;
      eotManuf :
      begin
        SetTabSheet(tsManuf);
        if PageControl1.ActivePage.Tag <> ConvIDToTag(ABsn_ID) then
        begin
          with fManufactList1 do
          begin
            Init(ABsn_ID, Null, Null, FReadOnly, not FReadOnly, false);
          end;
        end;
      end;
      eotCA:
      begin
        SetTabSheet(tsCA);
        fCaNavigator1.Initialize(Null, ABsn_ID, false, null);
      end;
      eotSimplRepr :
      begin
        SetTabSheet(tsRepr);
        fReprListLC1.Initialize(Null, FDisabled, ABsn_ID);
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
  end;
  aBsnProp.Enabled := (Node <> nil) and (TObject(Node.Data) is TEObj) and (TEObj(Node.Data).EObjType = eotBsn);
end;

procedure TfLCEntFrame.aShowTreeExecute(Sender: TObject);
begin
  TreeView1.Visible := not TreeView1.Visible;
  ToolButton1.Down := TreeView1.Visible;
end;

procedure TfLCEntFrame.TreeView1Deletion(Sender: TObject; Node: TTreeNode);
begin
  if Node.Data <> nil then
    TObject(Node.Data).Free;
end;

procedure TfLCEntFrame.aBsnPropExecute(Sender: TObject);
var
  ID, ID2 : Variant;
  AName: OleVariant;
begin
  ID := GetBsn;
  ID2 := ID;
{  if ShowBusinessDetailForm(ID, false) then
  begin
    if DM.rsCA.AppServer.BsnByID(ID2, AName) = 1 then
      TreeView1.Selected.Text := 'Бизнес: ' + AName;
 //   aRefreshExecute(nil);
 //   cdsBusiness.Locate('id_Business', Id, [loCaseInsensitive]);
  end; }
end;

procedure TfLCEntFrame.aNewBsnExecute(Sender: TObject);
var
  ID : Variant;
  AName: OleVariant;
begin
{  ID := -1;
  if ShowBusinessDetailForm(ID, false) then
  begin
    if DM.rsCA.AppServer.BsnByID(ID, AName) = 1 then
      TreeView1.Selected.Text := 'Бизнес: ' + AName;
   aRefreshExecute(nil);
   cdsBusiness.Locate('id_Business', Id, [loCaseInsensitive]);
  end;  }
end;

procedure TfLCEntFrame.aRefresheBsnExecute(Sender: TObject);
begin
  Initialize(FSelectedObj, Fid_Bsn, FDisabled, FEObjTypes);
end;

procedure TfLCEntFrame.Initialize2(ASelectedObj : TSelectedObj; UID: integer; Disabled: Variant;
  AEObjTypes: TEObjTypes; AReadOnly : boolean; AShowAllBsn : boolean; AID_WareHouse: integer);
begin
  InternalInitialize(ASelectedObj, -13, UID, Disabled, AEObjTypes, AReadOnly, AShowAllBsn);
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

procedure TfLCEntFrame.Initialize(ASelectedObj : TSelectedObj; id_Bsn, Disabled: Variant;
  AEObjTypes: TEObjTypes; AReadOnly : boolean; AShowAllBsn : boolean; AID_WareHouse: integer);
begin
  InternalInitialize(ASelectedObj, id_Bsn, Null, Disabled, AEObjTypes, AReadOnly, AShowAllBsn, AID_WareHouse);
end;

function TfLCEntFrame.GetEObjType: TEObjType;
var AControl : TWinControl;
begin
  Result := eotNone;
  if (TreeView1.Selected <> nil) and (TObject(TreeView1.Selected.Data) is TEObj) then
  begin
    Result := TEObj(TreeView1.Selected.Data).EObjType;
    if (Result = eotCA) and (eotRepr in FEObjTypes) and fCaNavigator1.ShowReprList  then
      Result := eotRepr;
  end;
{  if (TreeView1.Selected <> nil) and (TObject(TreeView1.Selected.Data) is TEObj) then
  begin
    Result := TEObj(TreeView1.Selected.Data).EObjType;
  end; }
end;

function TfLCEntFrame.GetSelObjID: Variant;
begin
  Result := Null;
    case SelObjType of
      eotBsn :
      begin
      end;
      eotFin :
      begin
        if fAccList1.cdsAccs.Active then
          Result := fAccList1.cdsAccs.FieldByName('id_Acc').Value;     
      end;
      eotWH :
      begin
        if fWHList1.cdsWareHouses.Active then
          Result :=  fWHList1.cdsWareHouses.FieldByName('id_WareHouse').Value;   
      end;
      eotManuf :
      begin
        if fManufactList1.cdsManufacts.Active then
          Result :=  fManufactList1.cdsManufacts.FieldByName('id_Manufact').Value;
      end;
      eotSimplRepr :
      begin
        Result := fReprListLC1.Repr_ID;
      end;
      eotCA :
      begin
        Result := fCaNavigator1.CA_ID;
      end;
      eotRepr :
      begin
        Result := fCaNavigator1.Repr_ID;
      end;
      eotGoods :
      begin
        Result := fWareGoods.WareID;
      end;
    end;
end;

function TfLCEntFrame.GetObjName: String;
begin
  Result := '';
    case SelObjType of
      eotBsn :
      begin
      end;
      eotFin :
      begin
        if fAccList1.cdsAccs.Active then
          Result := fAccList1.cdsAccs.FieldByName('Name').AsString;
      end;
      eotWH :
      begin
        if fWHList1.cdsWareHouses.Active then
          Result :=  fWHList1.cdsWareHouses.FieldByName('Name').AsString;
      end;
      eotManuf :
      begin
        if fManufactList1.cdsManufacts.Active then
          Result :=  fManufactList1.cdsManufacts.FieldByName('Name').AsString;
      end;
      eotSimplRepr :
      begin
        Result := fReprListLC1.Repr_Name; 
      end;
      eotRepr :
      begin
        Result := fCaNavigator1.Repr_Name; 
      end;
      eotCA :
      begin
        Result := fCaNavigator1.CA_Name; 
      end;
      eotGoods :
      begin
        Result := fWareGoods.WareName;
      end;
    end;
end;

function TfLCEntFrame.GetisNeedObjSelected: boolean;
begin
  Result := ((SelObjType in FEObjTypes) or
     ((SelObjType = eotRepr) and (SelObjType in FEObjTypes))
     ) and (SelObjID <> Null);
end;

procedure TfLCEntFrame.SetPosit(ASelectedObj: TSelectedObj);
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
            and (TEObj(TreeView1.Items[j].Data).EObjType = eotBsn) 
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
var
    isOwn : WordBool;
    ID, id_CAGroup, id_Group, id_Ca : OleVariant;
begin
  case ASelectedObj.ObjType of
    eotFin :
    begin
      if DM.rsCA.AppServer.UNSel_AccBsn(ASelectedObj.ID, ID, id_Group) = 1 then
      begin
        if SetBsn(ID, ASelectedObj.ObjType) then
        begin
          fAccList1.Init(ID, DM.IDUser, ASelectedObj.ID);
     //     ID := fAccList1.ID_Business;
     //     SetBsn(ID, ASelectedObj.ObjType);
        end;
      end;
    end;
    eotWH :
    begin
      if DM.rsCA.AppServer.UNSel_WHBsn(ASelectedObj.ID, ID, id_Group) = 1 then
      begin
        if SetBsn(ID, ASelectedObj.ObjType) then
        begin
          fWHList1.Init(ID, DM.IDUser, ASelectedObj.ID);
     //     ID := fAccList1.ID_Business;
     //     SetBsn(ID, ASelectedObj.ObjType);
        end;
      end;
    end;
    eotManuf :
    begin
      if DM.rsCA.AppServer.UNSel_ManufBsn(ASelectedObj.ID, ID, id_Group) = 1 then
      begin
        if SetBsn(ID, ASelectedObj.ObjType) then
        begin
          fManufactList1.Init(ID, DM.IDUser, ASelectedObj.ID);
     //     ID := fAccList1.ID_Business;
     //     SetBsn(ID, ASelectedObj.ObjType);
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
        fCaNavigator1.fCAGroupList1.ID := id_Group;
        fCaNavigator1.CA_ID := ASelectedObj.ID;
      end;
    end;
    eotRepr :
    begin
      ID := DM.rsCA.AppServer.UNSel_ReprBsn(ASelectedObj.ID, isOwn, id_Group, id_Ca);
      if VarIsEmpty(id_Ca) then id_Ca := Null;
      if SetBsn(ID, eotCA) then
      begin
        if id_Ca = Null then
        begin
          fCaNavigator1.fCAGroupList1.ID := -13;
          fCaNavigator1.Repr_ID := ASelectedObj.ID;
        end
        else
        begin
          if id_Group = Null then
            id_Group := -2;
          fCaNavigator1.fCAGroupList1.ID := id_Group;
          fCaNavigator1.CA_ID := id_Ca;
          fCaNavigator1.Repr_ID := ASelectedObj.ID;
        end; 
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
      if DM.rsCA.AppServer.UNSel_ReprBsn_v2(ASelectedObj.ID, isOwn, id_CAGroup, id_Ca, id_Group, ID) = 1 then
      begin
        if SetBsn(ID, ASelectedObj.ObjType) then
        begin
          fReprListLC1.Repr_ID := ASelectedObj.ID;
        end;
      end;
    end;
  end;
end;

function TfLCEntFrame.GetBsn_v2: Variant;
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
            if fAccList1.cdsAccs.Active then
              Result := fAccList1.cdsAccs.FieldByName('id_business').Value;
          end;
          eotWH :
          begin
            if fWHList1.cdsWareHouses.Active then
              Result :=  fWHList1.cdsWareHouses.FieldByName('id_business').Value;
          end;
          eotManuf :
          begin
            if fManufactList1.cdsManufacts.Active then
              Result :=  fManufactList1.cdsManufacts.FieldByName('id_business').Value;
          end;
          eotSimplRepr :
          begin
            Result := fReprListLC1.cdsPepr.FieldByName('id_business').Value;
          end;
          eotRepr :
          begin
            Result := fCaNavigator1.fCntrAgentList1.cdsCAgentid_business.Value;
          end;
          eotGoods :
          begin
     //       Result := fWareGoods.WareID;
          end;
        end;
    end;
  end;
end;

procedure TfLCEntFrame.Initialize_WH(ASelectedObj: TSelectedObj; id_Bsn,
  Disabled: Variant; AEObjTypes: TEObjTypes; AReadOnly,
  AShowAllBsn: boolean; AID_WareHouse: integer);
begin
  FID_WareHouse := AID_WareHouse;
  InternalInitialize(ASelectedObj, id_Bsn, Null, Disabled, AEObjTypes, AReadOnly, AShowAllBsn, AID_WareHouse);
end;

end.
