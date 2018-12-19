unit frCRepTree;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, Menus, Db, DBClient, ImgList, ComCtrls, ToolWin, uDM, ExtCtrls,
  Grids, DBGrids, RXDBCtrl, Registry, foMyFunc, frTreeChItem,
  contnrs, StdCtrls, Buttons, RXCtrls, uWareFinder;

type
  TDBObjectParented = class(TDBObj)
  private
    FIDParent, Fid_Rep: Variant;
    FCnt: integer;
    FDeleted: boolean;
    FCldCnt: integer;
    FBlocked: boolean;

    procedure SetIDParent(const Value: Variant);
    procedure Setid_Rep(const Value: Variant);
  public
    constructor Create;
    property IDParent : Variant read FIDParent write SetIDParent;
    property id_Rep : Variant read Fid_Rep write Setid_Rep;
    property Cnt : integer read FCnt write FCnt;
    property CldCnt : integer read FCldCnt write FCldCnt;
    property Deleted : boolean read FDeleted write FDeleted;

    property Blocked : boolean read FBlocked;
  end;

  TfCRepTree = class(TFrame)
    ImageList1: TImageList;
    pmServiceType: TPopupMenu;
    N3: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    ActionList1: TActionList;
    aNew: TAction;
    aNewChild: TAction;
    aProp: TAction;
    aDel: TAction;
    TreeView1: TTreeView;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    aRefreshe: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    pmNew: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    ToolButton6: TToolButton;
    RxSpeedButton1: TRxSpeedButton;
    cdsCCP: TClientDataSet;
    cdsCCPid_Cat: TAutoIncField;
    cdsCCPid_Rep: TIntegerField;
    cdsCCPName: TStringField;
    cdsCCPPID: TIntegerField;
    cdsCCPF_OperVid: TStringField;
    cdsCCPF_id_ContrAgent: TStringField;
    cdsCCPOrdNum: TIntegerField;
    cdsCCPGrpOper: TBooleanField;
    cdsCCPExtStr: TStringField;
    cdsCCPid_FormalDistrib: TIntegerField;
    cdsCCPid_FuncDistrib: TIntegerField;
    cdsCCPid_Acc: TIntegerField;
    cdsCCPisCat: TBooleanField;
    cdsCCPAPlan: TFloatField;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure aNewExecute(Sender: TObject);
    procedure aNewChildExecute(Sender: TObject);
    procedure aPropExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure aRefresheExecute(Sender: TObject);
    procedure TreeView1Expanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure TreeView1CustomDraw(Sender: TCustomTreeView;
      const ARect: TRect; var DefaultDraw: Boolean);
    procedure TreeView1CustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TreeView1Deletion(Sender: TObject; Node: TTreeNode);
  private
    FSelObjType : TClass;
    FSelObjID : integer;

    FDisabled : Variant;
    FReadOnly, FShowToolBar : boolean;
    Fid_Rep : Variant;
    Fid_Ctg : Variant;

    FBsns : TObjectList;

    FBsnNum : String;

    FDisabledCtg : Variant;

    procedure GetServiceTypeTree(Node : TTreeNode; id_Rep : Variant; ParentID: Variant; ATree: TTreeView);

    function GetID: Variant;

    function Getid_Rep: Variant;

    procedure SaveTreeState;
    procedure RestoreTreeState;

    procedure InitializeNode(AID : Variant; Node : TTreeNode; NeedExpand : boolean = false);
    function GetWareCatName: Variant;
    procedure TreeView1GetImageIndexAdv(Node: TTreeNode);

  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SetCtgWareID(ACtgID: Variant): boolean;
    procedure SetDisabledCtg(xxxCtgID: Variant);
    procedure Initialize(AID : Variant; id_Rep : Variant);

    property WareCatID : Variant read GetID;
    property WareCatName : Variant read GetWareCatName;
    property id_Rep : Variant read Getid_Rep;
  end;

implementation

uses uFormApi_Ware;

{$R *.DFM}

function TfCRepTree.GetID : Variant;
begin
  if (TreeView1.Selected <> nil) and (TObject(TreeView1.Selected.Data) is TDBObjectParented) then
    Result := TDBObjectParented(TreeView1.Selected.Data).ID
  else
    Result := Null;
end;

procedure TfCRepTree.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
//  aNew.Enabled := (Node <> nil);

  aNewChild.Enabled := (Node <> nil) and (TObject(Node.Data) is TDBObjectParented)
                       and (TDBObjectParented(Node.Data).Cnt = 0)
                       and (TDBObjectParented(Node.Data).ID >= 0);
  aProp.Enabled := (Node <> nil) and (TObject(Node.Data) is TDBObjectParented) and (TDBObjectParented(Node.Data).ID >= 0);
  aDel.Enabled := (Node <> nil) and (TObject(Node.Data) is TDBObjectParented)
                   and (TDBObjectParented(Node.Data).Cnt = 0)
                   and (TDBObjectParented(Node.Data).CldCnt = 0)
                   and (not TDBObjectParented(Node.Data).Deleted)
                   and (TDBObjectParented(Node.Data).ID >= 0);

  if (Node <> nil) and ((Node.Count = 0) and Node.HasChildren) and (TObject(Node.Data) is TDBObjectParented) then
      GetServiceTypeTree(Node, TDBObjectParented(Node.Data).id_Rep, TDBObjectParented(Node.Data).ID, TreeView1);
end;

procedure TfCRepTree.aNewExecute(Sender: TObject);
var AID : Variant;
begin
  AID := -1;
  if EditWaresCat(AID, id_Rep, Null) then
  begin
  {  if TreeView1.Selected <> nil then
      InitializeNode(AID, TreeView1.Selected.Parent)
    else }
      InitializeNode(AID, nil);
  end;
end;

procedure TfCRepTree.aNewChildExecute(Sender: TObject);
var AID : Variant;
begin
  AID := -1;
  if EditWaresCat(AID, id_Rep, WareCatID) then
  begin
    InitializeNode(AID, TreeView1.Selected, true);
  end;
end;

procedure TfCRepTree.aPropExecute(Sender: TObject);
var AID : Variant;
begin
  AID := WareCatID;
  if EditWaresCat(AID, id_Rep, Null) then
    InitializeNode(AID, TreeView1.Selected.Parent);
end;

procedure TfCRepTree.aDelExecute(Sender: TObject);
var AID : Variant;
    Rez : integer;
begin
  if MessageBox(Handle, 'Удалить категорию?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    AID := WareCatID;
    Rez := DM.rsCA.AppServer.PL_Ctg_GoodsDel(AID);
    if TreeView1.Selected.Parent <> nil then
      TDBObjectParented(TreeView1.Selected.Parent.Data).CldCnt := TDBObjectParented(TreeView1.Selected.Parent.Data).CldCnt - 1;
    if Rez = 1 then
      InitializeNode(AID, TreeView1.Selected.Parent);
  end;
end;

procedure TfCRepTree.TreeView1GetImageIndexAdv(Node: TTreeNode);
var isBSN : boolean;
begin
  if (TObject(Node.Data) is TBsnObj) then
    Node.ImageIndex := 16
  else
  begin
    isBSN := false;
    if (TObject(Node.Data) is TDBObjectParented) and
       (VarType(TDBObjectParented(Node.Data).ID) = varInteger) then
    begin
      if (TDBObjectParented(Node.Data).ID = -13) then
      begin
        isBSN := true;
      end
    end;
    if isBSN or (TDBObjectParented(Node.Data).ID = Null) then
      Node.ImageIndex := 0
    else
    begin
      if Node.Expanded then
        Node.ImageIndex := 5
      else
        Node.ImageIndex := 4;
    end;
  end;
end;

procedure TfCRepTree.TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
var isBSN : boolean;
begin
{  if (TObject(Node.Data) is TBsnObj) then
    Node.ImageIndex := 16
  else
  begin
    isBSN := false;
    if (TObject(Node.Data) is TDBObjectParented) and
       (VarType(TDBObjectParented(Node.Data).ID) = varInteger) then
    begin
      if (TDBObjectParented(Node.Data).ID = -13) then
      begin
        isBSN := true;
      end
    end;
    if isBSN or (TDBObjectParented(Node.Data).ID = Null) then
      Node.ImageIndex := 0
    else
    begin
      if Node.Expanded then
        Node.ImageIndex := 5
      else
        Node.ImageIndex := 4;
    end;
  end;   }
end;

procedure TfCRepTree.TreeView1GetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

{ TDBObjectParented }

constructor TDBObjectParented.Create;
begin
  inherited;
  FBlocked := false;
  FDeleted := false;
  FIDParent := Null;
  Cnt := 0;
  ID := Null;
end;

procedure TDBObjectParented.Setid_Rep(const Value: Variant);
begin
  Fid_Rep := Value;
end;

procedure TDBObjectParented.SetIDParent(const Value: Variant);
begin
  FIDParent := Value;
end;

procedure TfCRepTree.aRefresheExecute(Sender: TObject);
var AID : Variant;
begin
  Initialize(WareCatID, id_Rep);
end;

procedure TfCRepTree.Initialize(AID : Variant; id_Rep : Variant);
var i : integer;
    N : TTreeNode;
    BsnObj : TBsnObj;
    UID : integer;
    OldOnChange : TTVChangedEvent;
begin
  Fid_Rep := id_Rep;
  aNew.Enabled := Fid_Rep >= 0;
//  aRefreshe.Enabled := Fid_Bsn >= 0;

  TreeView1.Items.BeginUpdate;
  OldOnChange := TreeView1.OnChange;
  TreeView1.OnChange := nil;
  Screen.Cursor := crSQLWait;
  try
    TreeView1.Items.Clear;
    if (id_Rep = -13) then
    begin
      UID := 1;
      
      DM.GetBsnList(FBsns, DM.IDUser, UID);
      if FBsns.Count = 1 then
      begin
        GetServiceTypeTree(nil, TBsnObj(FBsns[0]).ID, Null, TreeView1);
      end
      else
      begin
        for i := 0 to FBsns.Count - 1 do
        begin
          BsnObj := TBsnObj.Create;
          BsnObj.ID := TBsnObj(FBsns[i]).ID;
          BsnObj.Name := TBsnObj(FBsns[i]).Name;
          N := TreeView1.Items.AddObject(nil, BsnObj.Name, BsnObj);
          TreeView1GetImageIndexAdv(N);
          GetServiceTypeTree(N, BsnObj.ID, Null, TreeView1);
        end;
      end;
    end
    else
    begin
      GetServiceTypeTree(nil, id_Rep, Null, TreeView1);
    end;
  finally
    Screen.Cursor := crDefault;
    TreeView1.Items.EndUpdate;
    TreeView1.OnChange := OldOnChange;
  //  with TreeView1 do OnChange(TreeView1, Selected);
    SetCtgWareID(AID);
 //   CheckMenus;
  end;
end;

procedure TfCRepTree.GetServiceTypeTree(Node : TTreeNode; id_Rep : Variant; ParentID : Variant; ATree : TTreeView);
  procedure GetServiceTypeTree2(ParentID : Variant; ATree : TTreeView; ATreeNode : TTreeNode; AList : TList);
  var  N : TTreeNode;
       i : integer;
  begin
    for i := 0 to AList.Count - 1 do
    begin
      if TDBObjectParented(AList[i]).IDParent = ParentID then
      begin
         N := ATree.Items.AddChildObject(ATreeNode, TDBObjectParented(AList[i]).Name, AList[i]);
         TreeView1GetImageIndexAdv(N);
         if (ATreeNode <> nil) and (TObject(ATreeNode.Data) is TDBObjectParented)
         and not TDBObjectParented(AList[i]).FBlocked then
         begin
           TDBObjectParented(AList[i]).FBlocked := TDBObjectParented(ATreeNode.Data).Blocked;
         end;
         N.HasChildren := true;
         GetServiceTypeTree2(TDBObjectParented(AList[i]).ID, ATree, N, AList);
      end;
    end;
  end;
var i, j : integer;
    STO : TDBObjectParented;
    OldPos : integer;
    List : TList;

    NNN : TTreeNode;
begin
//  ATree.Items.Clear;
  List := TList.Create;
  with cdsCCP do
  begin
    Params.ParamByName('@id_Cat').Value := -1;
    Params.ParamByName('@id_Rep').Value := id_Rep;
    Open;
    try
      ATree.Items.BeginUpdate;
      First;
      while not Eof do
      begin
        STO := TDBObjectParented.Create;
        STO.id_Rep := id_Rep;
      //  STO.Cnt := FieldByName('Cnt').AsInteger;
        STO.Name := FieldByName('Name').AsString;
        STO.ID := FieldByName('id_Cat').Value;

        STO.FBlocked := (FDisabledCtg <> Null) and (STO.ID = FDisabledCtg);
        STO.IDParent := FieldByName('PID').Value;

        List.Add(STO);
        Next;
      end;
      GetServiceTypeTree2(ParentID, ATree, Node, List);
    finally
      ATree.Items.EndUpdate;
      List.Free;
      Close;
    end;
  end;
end;

procedure TfCRepTree.TreeView1Expanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
var i, j : integer;
    STO : TDBObjectParented;
    N : TTreeNode;
begin

  if (Node <> nil) and ((Node.Count = 0) and Node.HasChildren) and (TObject(Node.Data) is TDBObjectParented) then
  begin
    GetServiceTypeTree(Node, TDBObjectParented(Node.Data).id_Rep, TDBObjectParented(Node.Data).ID, TreeView1);
  end;
end;

constructor TfCRepTree.Create(AOwner: TComponent);
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
begin
  inherited;
  FDisabledCtg := Null;
{$IFDEF LC}
  aNewChild.Visible := false;
  aNew.Visible := false;
  aDel.Visible := false;

  aProp.Visible := false;
  RxSpeedButton1.Visible := false;
{$ENDIF}

  FBsnNum := '';
  
  FBsns := TObjectList.Create(true);
  Fid_Ctg := -1;

end;

destructor TfCRepTree.Destroy;
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
begin
  FBsns.Free;
  inherited;
end;

function TfCRepTree.Getid_Rep: Variant;
begin
  if (TreeView1.Selected <> nil) then
  begin
    if (TObject(TreeView1.Selected.Data) is TDBObjectParented) then
      Result := TDBObjectParented(TreeView1.Selected.Data).id_Rep
    else
      if (TObject(TreeView1.Selected.Data) is TBsnObj) then
        Result := TBsnObj(TreeView1.Selected.Data).ID
  end
  else
    Result := Fid_Rep;
end;

procedure TfCRepTree.TreeView1CustomDraw(Sender: TCustomTreeView;
  const ARect: TRect; var DefaultDraw: Boolean);
begin
  Sender.Canvas.FillRect(ARect);
end;

procedure TfCRepTree.TreeView1CustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if (cdsSelected in State) and (cdsFocused in State) then
    Sender.Canvas.Font.Style := Sender.Canvas.Font.Style + [fsBold];
  if TObject(Node.Data) is TDBObjectParented and TDBObjectParented(Node.Data).Deleted then
  begin
    Sender.Canvas.Font.Color := clGray;
    Sender.Canvas.Font.Style := Sender.Canvas.Font.Style + [fsStrikeOut];
  end;
end;

procedure TfCRepTree.RestoreTreeState;
begin

end;

procedure TfCRepTree.SaveTreeState;
begin

end;

procedure TfCRepTree.InitializeNode(AID: Variant; Node: TTreeNode; NeedExpand : boolean);
var i : integer;
    b : boolean;
    ANode : TTreeNode;
begin
  ANode := Node;

  if ANode <> nil then
  begin
    TreeView1.Items.BeginUpdate;
    try
      b := ANode.Expanded or NeedExpand;
   //   ANode.DeleteChildren;
      for i := ANode.Count - 1 downto 0 do
        ANode.Item[i].Free;
      ANode.HasChildren := true;
      if TObject(ANode.Data) is TDBObjectParented then
        GetServiceTypeTree(ANode, TDBObjectParented(ANode.Data).id_Rep, TDBObjectParented(ANode.Data).ID, TreeView1);
      if TObject(Node.Data) is TBsnObj then
        GetServiceTypeTree(ANode, TBsnObj(ANode.Data).ID, Null, TreeView1);

      if b then
      begin
        ANode.Expand(false);
        if TObject(ANode.Data) is TDBObjectParented then
        begin
          TDBObjectParented(Node.Data).CldCnt := ANode.Count;
          ANode.HasChildren := ANode.Count > 0;
        end;
      
        for i := 0 to ANode.Count - 1 do
        begin
          if (TObject(ANode.Item[i].Data) is TDBObj) and (TDBObj(ANode.Item[i].Data).ID = AID) then
          begin
            ANode.Item[i].Selected := true;
            Break;
          end;
        end;
      end
      else
      begin
      end;
    finally
      TreeView1.Selected := nil;
      TreeView1.Items.EndUpdate;
      TreeView1.Selected := ANode;
    end;
  end
  else
  begin
    Initialize(Null, id_Rep);
    for i := 0 to TreeView1.Items.Count - 1 do
    begin
      if (TreeView1.Items[i].Parent = nil) and (TObject(TreeView1.Items[i].Data) is TDBObj) and (TDBObj(TreeView1.Items[i].Data).ID = AID) then
      begin
        TreeView1.Items[i].Selected := true;
        Break;
      end;
    end;
  end;
end;

procedure TfCRepTree.TreeView1Deletion(Sender: TObject; Node: TTreeNode);
begin
  if Node.Data <> nil then
  begin
    TObject(Node.Data).Free;
    Node.Data := nil;
  end;
end;

function TfCRepTree.SetCtgWareID(ACtgID: Variant) : boolean;
var i, j : integer;
    Node, Node2 : TTreeNode;
    S : String;
begin
  Result := false;
  if ACtgID = Null then Exit;
  if ACtgID = -13 then
  begin
    for i := 0 to TreeView1.Items.Count - 1 do // Ищем категорию
    begin
      if (TObject(TreeView1.Items[i].Data) is TDBObjectParented) and
         (TDBObjectParented(TreeView1.Items[i].Data).ID = ACtgID) then
      begin
        TreeView1.Items[i].Selected := true;
        TreeView1.Items[i].MakeVisible;

        Result := true;
        Break;
      end;
    end;
    Exit;
  end;
end;

function TfCRepTree.GetWareCatName: Variant;
begin
  if (TreeView1.Selected <> nil) and (TObject(TreeView1.Selected.Data) is TDBObjectParented) then
    Result := TDBObjectParented(TreeView1.Selected.Data).Name
  else
    Result := '';
end;

procedure TfCRepTree.SetDisabledCtg(xxxCtgID: Variant);
begin
  FDisabledCtg := xxxCtgID;
end;

end.
