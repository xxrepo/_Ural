unit frGrp;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF VER150} Variants,{$ENDIF}  Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, DBGrids, RXDBCtrl, DB, ADODB, ActnList, ImgList,
  ComCtrls, ToolWin, StdCtrls, ExtCtrls, DBCtrls, Menus, foMyFunc, RXCtrls, frDoc, AdvMenus,
  AdvToolBar;

type
  TNodeObj = class
  private
    IDParent: Variant;
    FID: integer;
    FName: String;
  public
    isGrp : boolean;
    Blocked : boolean;
    constructor Create;
    destructor Destroy; override;
    property ID : integer read FID write FID;
    property Name : String read FName write FName;
  end;

  TfGrp = class(TFrame)
    DataSource1: TDataSource;
    ImageList: TImageList;
    ActionList1: TActionList;
    aAddGrp: TAction;
    aEditGrp: TAction;
    aDelGrp: TAction;
    aRefreshGrp: TAction;
    pmGrp: TAdvPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    aNewChild: TAction;
    N9: TMenuItem;
    ToolBar12: TToolBar;
    RxSpeedButton1: TRxSpeedButton;
    ToolButton7: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    OrgTreeView: TTreeView;
    pmNew: TAdvPopupMenu;
    MenuItem10: TMenuItem;
    N8: TMenuItem;
    N4: TMenuItem;
    N7: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    aSort: TAction;
    aUPnode: TAction;
    aDownNode: TAction;
    spList: TADOStoredProc;
    ToolButton6: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    qDocProp2: TADOQuery;
    ToolButton4: TToolButton;
    N5: TMenuItem;
    ToolBar1: TAdvDockPanel;
    ToolBar2: TAdvToolBar;
    AdvToolBarButton1: TAdvToolBarButton;
    AdvToolBarButton2: TAdvToolBarButton;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    AdvToolBarSeparator2: TAdvToolBarSeparator;
    AdvToolBarButton3: TAdvToolBarButton;
    AdvToolBarSeparator3: TAdvToolBarSeparator;
    AdvToolBarButton4: TAdvToolBarButton;
    AdvToolBarMenuButton1: TAdvToolBarMenuButton;
    AdvToolBarSeparator4: TAdvToolBarSeparator;
    AdvToolBarMenuButton2: TAdvToolBarMenuButton;
    AdvToolBarSeparator5: TAdvToolBarSeparator;
    Edit1: TEdit;
    Button3: TButton;
    procedure aAddGrpExecute(Sender: TObject);
    procedure aEditGrpExecute(Sender: TObject);
    procedure aDelGrpExecute(Sender: TObject);
    procedure aRefreshGrpExecute(Sender: TObject);
    procedure OrgTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure OrgTreeViewDeletion(Sender: TObject; Node: TTreeNode);
    procedure OrgTreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure OrgTreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure OrgTreeViewGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure OrgTreeViewGetSelectedIndex(Sender: TObject;
      Node: TTreeNode);
    procedure RxDBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure aNewChildExecute(Sender: TObject);
    procedure OrgTreeViewCustomDraw(Sender: TCustomTreeView;
      const ARect: TRect; var DefaultDraw: Boolean);
    procedure OrgTreeViewCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure aSortExecute(Sender: TObject);
    procedure OrgTreeViewCompare(Sender: TObject; Node1, Node2: TTreeNode;
      Data: Integer; var Compare: Integer);
    procedure aDownNodeExecute(Sender: TObject);
    procedure aUPnodeExecute(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FfDoc: TfDoc;
    procedure DoMove(AStep : integer);
    function GetID_grp: Variant;
    procedure GetServiceTypeTree(Node: TTreeNode; ParentID: Variant; ATree: TTreeView; ASelType : boolean);
    procedure InitializeNode(AID: Variant; Node: TTreeNode;
      NeedExpand: boolean);
    function SetCtgWareID(ACtgID: Variant): boolean;
    function GetGrpName: Variant;
    function GetFullName: Variant;

    procedure SelectEvent(id_CA, id_CAT: Variant);
    procedure SaveOrderID(ANode: TTreeNode);
    procedure SetID_grp(Value: Variant);
    procedure SetfDoc(const Value: TfDoc);
  public
    FType, Fmode, FShowAll : integer;
    procedure Initialize(AType : integer; AID: Variant; ASelType : boolean = false; id_DOCBASE : integer = -1);
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;


    property GrpName : Variant read GetGrpName;
    property FullName : Variant read GetFullName;
    function GetIDS: Variant;

    property fDoc : TfDoc read FfDoc write SetfDoc;

    procedure AddSysNode(AParent : Variant; List : TList);
  end;

implementation

uses uDM, uMain, uDTProp, uPrgForm, uCATProp;

{$R *.dfm}

{ TFrame1 }

procedure TfGrp.SetID_grp(Value: Variant);
var i : integer;
    b : boolean;
begin
  b := true;
  if Value = Null then
    Value := -1;
  for i := 0 to OrgTreeView.Items.Count - 1 do
  begin
    if (TObject(OrgTreeView.Items[i].Data) is TNodeObj) and
       (TNodeObj(OrgTreeView.Items[i].Data).ID = Value)  then
    begin
      if OrgTreeView.Items[i].Selected then
      begin
        b := false;
        if Assigned(OrgTreeView.OnChange) then
          OrgTreeView.OnChange(OrgTreeView, OrgTreeView.Selected);
      end
      else
      begin
        OrgTreeView.Items[i].Selected := true;
        OrgTreeView.Items[i].MakeVisible;
        b := false;
      end;
      Break;
    end;
  end;
  if b and (Value <> -2) then
  begin
    SetID_grp(-2)
  end;
end;

procedure TfGrp.GetServiceTypeTree(Node : TTreeNode; ParentID : Variant; ATree : TTreeView; ASelType : boolean);
  procedure GetServiceTypeTree2(ParentID : Variant; ATree : TTreeView; ATreeNode : TTreeNode; AList : TList);
  var  N : TTreeNode;
       i : integer;
  begin
    for i := 0 to AList.Count - 1 do
    begin
      if TNodeObj(AList[i]).IDParent = ParentID then
      begin
         N := ATree.Items.AddChildObject(ATreeNode, TNodeObj(AList[i]).Name, AList[i]);
       //  TreeView1GetImageIndexAdv(N);
         if (ATreeNode <> nil) and (TObject(ATreeNode.Data) is TNodeObj) and
             not TNodeObj(AList[i]).Blocked then
         begin
           TNodeObj(AList[i]).Blocked := TNodeObj(ATreeNode.Data).Blocked;
         end;
      //   N.HasChildren := TNodeObj(AList[i]).CldCnt > 0;
           GetServiceTypeTree2(TNodeObj(AList[i]).ID, ATree, N, AList);
      end;
    end;
  end;
var i, j : integer;
    STO : TNodeObj;
    OldPos : integer;
    List : TList;

    NNN : TTreeNode;
    FLAG : integer;
begin
//  ATree.Items.Clear;
  List := TList.Create;
  if DM.id_Bsn = Null then
    with DM.spBSN do
    begin
      Close;
      Parameters.ParamByName('id_User').Value := DM.id_User;
      Open;
      First;
      while not Eof do
      begin
            STO := TNodeObj.Create;
            STO.ID := -DM.spBSNid_BSN.AsInteger;
            STO.Name := DM.spBSNBsnName.AsString;
            STO.IDParent := Null;
            STO.isGrp := true;
            List.Add(STO);

            AddSysNode(STO.ID, List);
        Next;
      end;
    end;

  with spList do
  begin
    Close;
    Parameters.ParamByName('@AType').value := FType;
    Parameters.ParamByName('@mode').value := Fmode;
    Parameters.ParamByName('@id_BSN').value := DM.id_Bsn;
    Open;
    
    try
      ATree.Items.BeginUpdate;

      if FShowAll = 1 then
      begin
        Edit1.Visible := false;
        Button3.Visible := false;
        if DM.id_Bsn <> Null then
          AddSysNode(Null, List);
      end;


      First;
      while not Eof do
      begin
        if not ASelType or (FieldByName('IS_GRP').AsInteger = 1) then
        begin
          STO := TNodeObj.Create;
          STO.ID := FieldByName('ID_DocType').AsInteger;
          STO.Name := FieldByName('Name').AsString;
          STO.IDParent := FieldByName('PID').AsVariant;
          STO.isGrp := FieldByName('IS_GRP').AsInteger = 1;
          if (STO.IDParent = Null) and (DM.id_Bsn = Null) then
            STO.IDParent := -FieldByName('ID_BSN').AsInteger;
            
          List.Add(STO);
        end;

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

procedure TfGrp.InitializeNode(AID: Variant; Node: TTreeNode; NeedExpand : boolean);
var i : integer;
    b : boolean;
    ANode : TTreeNode;
begin
  ANode := Node;

  if ANode <> nil then
  begin
    OrgTreeView.Items.BeginUpdate;
    try
      b := ANode.Expanded or NeedExpand;
   //   ANode.DeleteChildren;
      for i := ANode.Count - 1 downto 0 do
        ANode.Item[i].Free;
      ANode.HasChildren := true;
      if TObject(ANode.Data) is TNodeObj then
        GetServiceTypeTree(ANode, TNodeObj(ANode.Data).ID, OrgTreeView, true);

      if b then
      begin
        ANode.Expand(false);
        if TObject(ANode.Data) is TNodeObj then
        begin
          ANode.HasChildren := ANode.Count > 0;
        end;
     
      end
      else
      begin
      end;
    finally
      OrgTreeView.Selected := nil;
      OrgTreeView.Items.EndUpdate;
      OrgTreeView.Selected := ANode;
    end;
  end
  else
  begin
    Initialize(FType, Null);
{    for i := 0 to OrgTreeView.Items.Count - 1 do
    begin
      if (OrgTreeView.Items[i].Parent = nil) and (TObject(OrgTreeView.Items[i].Data) is TDBObj) and (TNodeObj(OrgTreeView.Items[i].Data).ID = AID) then
      begin
        OrgTreeView.Items[i].Selected := true;
        Break;
      end;
    end; }
  end;
end;

procedure TfGrp.Initialize(AType : integer; AID : Variant; ASelType : boolean; id_DOCBASE : integer);
var i : integer;
    N : TTreeNode;
    UID : integer;
    OLDOnChange : TTVChangedEvent;
begin
  FType := AType;
  case FType of
    0 :
    begin

    end;
    5 :
    begin
      aAddGrp.Caption := 'Добавить клиента';
      aNewChild.Caption := 'Добавить юрлицо';
    end;
    6 :
    begin
      aAddGrp.Caption := 'Добавить оператора';
      aNewChild.Caption := 'Добавить беляка';
    end;
    13 :
    begin
      aAddGrp.Visible := false;
      aNewChild.Caption := 'Добавить вид события';
    end;
    26 :
    begin
      aAddGrp.Visible := false;
      aNewChild.Caption := 'Добавить описание события';
    end;
  end;

  OrgTreeView.Items.BeginUpdate;
  Screen.Cursor := crSQLWait;
  if id_DOCBASE > 0 then
  begin
    with qDocProp2 do
    begin
      Close;
      Parameters.ParamByName('id_DocBase').Value := id_DOCBASE;
      Parameters.ParamByName('id_BSN').Value := DM.id_Bsn;
      Open;
      AID := qDocProp2.fieldByName('ID_DOCTYPE').AsInteger;
      Close;
    end;
  end;
  try
    if (GetIDS <> AID) or (id_DOCBASE > 0) then
    begin
      OLDOnChange := OrgTreeView.OnChange;
      OrgTreeView.OnChange := nil;
      OrgTreeView.Items.Clear;
      GetServiceTypeTree(nil, Null, OrgTreeView, ASelType);
    end;
  finally
    Screen.Cursor := crDefault;
    OrgTreeView.Items.EndUpdate;
    OrgTreeView.OnChange := OLDOnChange;
    OrgTreeView.FullExpand;
    SetCtgWareID(AID);
  end;
end;


function TfGrp.SetCtgWareID(ACtgID: Variant) : boolean;
var i, j : integer;
    Node, Node2 : TTreeNode;
    S : String;
begin
  Result := false;
  if (ACtgID = Null) or (ACtgID = 0) or (OrgTreeView.Items.Count = 0) then
  begin
    OrgTreeView.Selected := nil;
    OrgTreeViewChange(OrgTreeView, OrgTreeView.Selected);
    Exit;
  end;
  if ACtgID <> Null then
  begin
    for i := 0 to OrgTreeView.Items.Count - 1 do // Ищем категорию
    begin
      if (TObject(OrgTreeView.Items[i].Data) is TNodeObj) and
         (TNodeObj(OrgTreeView.Items[i].Data).ID = ACtgID) then
      begin
        Node := OrgTreeView.Items[i];
        Node.Selected := true;
        Node.MakeVisible;
        Result := true;
     end;
    end;
  end;
end;

constructor TfGrp.Create(AOwner: TComponent);
var TmpOwner: TCustomForm;
    i : integer;
begin
  inherited;
  Fmode := 1;
  FShowAll := 0;
  
 // dm.InitToolBar(ToolBar1);
  for i := 0 to ActionList1.ActionCount - 1 do
    with ActionList1.Actions[i] do
      Hint := Caption;
end;

destructor TfGrp.Destroy;
begin
   inherited;
end;


procedure TfGrp.aAddGrpExecute(Sender: TObject);
var Obj : TNodeObj;
    ID : integer;
begin
  ID := -1;
    if ShowCATProp(FType,ID) then
    begin
      aRefreshGrp.Execute;
      SetID_grp(ID);
    end;
end;

procedure TfGrp.aEditGrpExecute(Sender: TObject);
var S, S2, S3 : String;
    ID : integer;
    IDParent: Variant;
    Obj : TNodeObj;
    Rez, XXX, ID_CA : integer;
    B : Boolean;
begin
  Obj := TNodeObj(OrgTreeView.Selected.Data);
  ID := Obj.ID;

  S := Obj.Name;
  if Obj.isGrp then
  begin
    if ShowCATProp(FType, ID) then
    begin
      aRefreshGrp.Execute;
      SetID_grp(ID);
    end;
  end
  else
  begin
    ID := Obj.ID;
    IDParent := Null;
    if ShowDTProp(FType, ID, -1, fDoc) then
    begin
      aRefreshGrp.Execute;
      SetID_grp(ID);
      
    end;
  end;
end;

procedure TfGrp.aDelGrpExecute(Sender: TObject);
var S, S2, S3 : String;
    ID, IDParent: Variant;
    Obj : TNodeObj;
    Rez, XXX : integer;
    B : Boolean;
begin
  Obj := TNodeObj(OrgTreeView.Selected.Data);
  ID := Obj.ID;
  XXX := DM.GetMaxID('select count(*) as ID from DW_DocBAse where DELETED=0 and id_DocType=' + IntToStr(ID));
  if XXX > 0 then
    raise Exception.Create('Сначала удалите документы типа "' + Obj.Name + '"');
  XXX := DM.GetMaxID('select count(*) as ID from DW_DocType where Deleted=0 and PID=' + IntToStr(ID));
  if XXX > 0 then
    raise Exception.Create('Сначала удалите дочерние элементы');
  if MessageBox(Handle, PChar('Удалить "' + Obj.Name + '"?'), '?', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
//    if ShowConf(Obj.Name) then
    begin
      S2 := 'UPDATE DW_DocType SET Deleted=1 WHERE id_DocType=' + IntToStr(ID);
      DM.ExecSQL(S2);
      aRefreshGrp.Execute;
      OrgTreeView.Selected := nil;
      OrgTreeViewChange(OrgTreeView, Nil);
    end;
  end;
end;

procedure TfGrp.aNewChildExecute(Sender: TObject);
var Obj : TNodeObj;
    ID : integer;
    IDParent : integer;
begin
  ID := -1;
  if OrgTreeView.Selected <> nil then
  begin
    Obj := TNodeObj(OrgTreeView.Selected.Data);
    if Obj.isGrp then
      IDParent := Obj.FID
    else
    begin
      if Obj.IDParent = Null then
        IDParent := 0
      else
        IDParent := Obj.IDParent;
    end;
  end
  else
    IDParent := -1;
  if ShowDTProp(FType, ID, IDParent, fDoc) then
  begin
    aRefreshGrp.Execute;
    SetID_grp(ID);
    
  end;
end;

procedure TfGrp.aRefreshGrpExecute(Sender: TObject);
var id_CAT : Variant;
    b : boolean;
begin
  OrgTreeView.Items.BeginUpdate;
  try
    id_CAT := GetIDS;
    if OrgTreeView.Selected <> nil then
      b := OrgTreeView.Selected.Expanded
    else
      b := false;

  Initialize(FType, -1);
  finally
    SelectEvent(-1, id_CAT);
    if b and (OrgTreeView.Selected <> nil) then
      OrgTreeView.Selected.Expand(false);
    OrgTreeView.Items.EndUpdate;
  end;
end;

{ TNodeObj }

constructor TNodeObj.Create;
begin
  inherited;
  IDParent := Null;
  Blocked := false;
end;

destructor TNodeObj.Destroy;
begin

  inherited;
end;

function TfGrp.GetID_grp: Variant;
begin
  if (OrgTreeView.Selected <> nil) and (TObject(OrgTreeView.Selected.Data) is TNodeObj)  then
  begin
    Result := TNodeObj(OrgTreeView.Selected.Data).ID;
  end
  else
    Result := -2;
end;


procedure TfGrp.OrgTreeViewChange(Sender: TObject; Node: TTreeNode);
var AID : integer;
    xPrevNode, xNextNode : TTreeNode;
begin
  aEditGrp.Enabled := (Node <> nil) and (TObject(Node.Data) is TNodeObj)
                       and (TNodeObj(Node.Data).ID <> -2) and (TNodeObj(Node.Data).ID <> -1)
                       and (TNodeObj(Node.Data).ID <> -13);
                       
  aDelGrp.Enabled :=  (Node <> nil) and ((TObject(Node.Data) is TNodeObj)
                       and (TNodeObj(Node.Data).ID <> -2) and (TNodeObj(Node.Data).ID <> -1))
                       and (TNodeObj(Node.Data).ID <> -13);
                       
  aNewChild.Enabled := aEditGrp.Enabled or (FType = 13) or (FType = 26);

  aUPnode.Enabled := false;
  aDownNode.Enabled := false;

  if Node <> nil then
  begin
    xPrevNode := Node.getPrevSibling;
    xNextNode := Node.getNextSibling;
    aUPnode.Enabled := (Node <> nil)
          and ((xPrevNode <> nil) and (TObject(xPrevNode.Data) is TNodeObj) and (TNodeObj(xPrevNode.Data).ID > 0))
          and ((TObject(Node.Data) is TNodeObj) and (TNodeObj(Node.Data).ID > 0));
    aDownNode.Enabled := (Node <> nil)
         and ((xNextNode <> nil) and (TObject(xNextNode.Data) is TNodeObj) and (TNodeObj(xNextNode.Data).ID > 0))
         and ((TObject(Node.Data) is TNodeObj) and (TNodeObj(Node.Data).ID > 0));
  end;
  aSort.Enabled := aUPnode.Enabled or aDownNode.Enabled;
end;


procedure TfGrp.OrgTreeViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var Node : TTreeNode;
    id_Grp, ID : String;
    i, XXX, Z : integer;
begin
 { Node := OrgTreeView.GetNodeAt(X, Y);
  id_Grp := 'Null';
  if TNodeObj(Node.Data).ID >= 0 then
  begin
    Z := TNodeObj(Node.Data).ID;
    id_Grp := IntToStr(TNodeObj(Node.Data).ID);
  end;
  



//  if
  DM.ExecSQL('UPDATE ' + GetChildTableDName + ' SET ' + GetIDName + '= ' + id_Grp + ' WHERE ' + GetChildKeyDName + '=' + (Source as TRxDBGrid).dataSource.DataSet.FieldByName('ID').AsString)
}
end;

procedure TfGrp.OrgTreeViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var Node : TTreeNode;
begin
//*
end;

procedure TfGrp.OrgTreeViewGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
  if (TObject(Node.Data) is TNodeObj) then
  begin
    if not TNodeObj(Node.Data).isGrp then
        Node.ImageIndex := 15
    else
      if Node.Selected then
        Node.ImageIndex := 9
      else
        Node.ImageIndex := 8;
  end
  else
    Node.ImageIndex := -1;

end;

procedure TfGrp.OrgTreeViewGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TfGrp.RxDBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (ssLeft in Shift) and (THackGrid(Sender).RowHeights[0] < Y) then
   (Sender as TDBGrid).BeginDrag(true);
end;

function TfGrp.GetGrpName: Variant;
begin
  if (OrgTreeView.Selected <> nil) and (TObject(OrgTreeView.Selected.Data) is TNodeObj)  then
  begin
    Result := TNodeObj(OrgTreeView.Selected.Data).Name;
  end
  else
    Result := '';
end;

procedure TfGrp.OrgTreeViewCustomDraw(Sender: TCustomTreeView;
  const ARect: TRect; var DefaultDraw: Boolean);
begin
  Sender.Canvas.FillRect(ARect);
end;

procedure TfGrp.OrgTreeViewCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if (cdsSelected in State) and (cdsFocused in State) then
    Sender.Canvas.Font.Style := Sender.Canvas.Font.Style + [fsBold];
  if TObject(Node.Data) is TNodeObj and TNodeObj(Node.Data).Blocked then
  begin
    Sender.Canvas.Font.Color := clGray;
  end;

end;

function TfGrp.GetFullName: Variant;
var Node : TTreeNode;
begin
  Result := '';
  if (OrgTreeView.Selected <> nil) and (TObject(OrgTreeView.Selected.Data) is TNodeObj)  then
  begin
    Node := OrgTreeView.Selected;
    while Node <> nil do
    begin
      if Result <> '' then Result := Result + '/';
      if TObject(Node.Data) is TNodeObj then
        Result := Result + TNodeObj(Node.Data).Name;
      Node := Node.Parent;
    end;
  end
  else
    Result := '';
end;

function TfGrp.GetIDS: Variant;
var
    Obj : TNodeObj;
begin
  Result := -13;
  if OrgTreeView.Selected <> nil then
  begin
    Obj := TNodeObj(OrgTreeView.Selected.Data);

      Result := Obj.ID;
  end;
end;


procedure TfGrp.SelectEvent(id_CA, id_CAT: Variant);
var i : integer;
    Node : TTreeNode;
begin
  if (abs(id_CA) = -1) and (id_CAT = -1) then
  begin
    if OrgTreeView.Items.Count > 0 then
    begin
      Node := OrgTreeView.Items[0];
      Node.Selected := true;
      Node.Focused := true;
      Node.MakeVisible;
    end;
    Exit;
  end;
  Node := OrgTreeView.Items.GetFirstNode;
  while Node <> nil do
  begin
    if (TNodeObj(Node.Data).ID = id_CAT) then
    begin
      Node.Selected := true;
      Node.Focused := true;
      Node.MakeVisible;
      Break;
    end;

    Node := Node.GetNext;
  end;

end;


function CustomSortProc(Node1, Node2: TTreeNode; Data: Longint): Integer; stdcall;
begin
  Result := AnsiCompareText(Node1.Text, Node2.Text)
end;

function CustomSortProc2(Node1, Node2: TTreeNode; Data: Integer): Integer; stdcall;
begin
  Result := AnsiCompareText(Node1.Text, Node2.Text);
end;

procedure TfGrp.aSortExecute(Sender: TObject);
var S, S2, S3 : String;
    ID, IDParent: Variant;
    Obj : TNodeObj;
    ANode, N : TTreeNode;
    Rez, XXX : integer;
    B : Boolean;
begin
  ANode := OrgTreeView.Selected.Parent;
  if ANode = nil then
    S := 'Сортировать по алфавиту?'
  else
  begin
    Obj := TNodeObj(ANode.Data);
    S := 'Сортировать по алфавиту содержимое группы "' + Obj.Name + '"?';
  end;
  if MessageBox(Handle, PChar(S), '?', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    if ANode <> nil then
    begin
      ANode.CustomSort(@CustomSortProc, 0);
    end
    else
      OrgTreeView.CustomSort(@CustomSortProc2, 0);
    SaveOrderID(nil);

  end;
end;

procedure TfGrp.OrgTreeViewDeletion(Sender: TObject; Node: TTreeNode);
begin
  if (TObject(Node.Data) is TObject) then
    TObject(Node.Data).Free;

end;

procedure TfGrp.SaveOrderID(ANode : TTreeNode);
var //NP : TTreeNode;
    i, K : integer;
    Obj : TNodeObj;
begin
//  if ANode <> nil then
  begin
 //   NP := ANode.Parent;
    k := 0;
    for i := 0 to OrgTreeView.Items.Count - 1 do
    begin
      begin
        inc(k);
        Obj := TNodeObj(OrgTreeView.Items[i].Data);
        DM.ExecSQL('UPDATE DW_DocType SET OrdID=' + IntToStr(k) + ' WHERE id_DocType = ' + IntToStr(Obj.ID));
      end;
    end;
  end;  
end;

procedure TfGrp.DoMove(AStep: integer);
var bNode, bN3 : boolean;
    i : integer;
    ANode, N3: TTreeNode;
    P : Pointer;
    AName : String;
    AList : TList;
begin
  ANode := OrgTreeView.Selected;
  if ANode <> nil then
  begin
    OrgTreeView.Items.BeginUpdate;
    try

      bNode := ANode.Expanded;
      P := ANode.data;
      AName := ANode.Text;
      if AStep = 1 then
      begin
        N3 := ANode.getNextSibling;
   //     N3 := OrgTreeView.Items.InsertObject(ANode.Parent, ANode.Text, ANode.data);
      end;
      if AStep = -1 then
      begin
        N3 := ANode.getPrevSibling;
      //  N3 := OrgTreeView.Items.InsertObject(ANode.Parent, ANode.Text, ANode.data);
      end;
      if N3 <> nil then
      begin
        bN3 := N3.Expanded;
        ANode.Data := N3.Data;
        ANode.Text := N3.Text;
      
        N3.Data := P;
        N3.Text := AName;
        N3.Selected := true;
        N3.Focused := true;
        N3.MakeVisible;
      
        if ANode.HasChildren or N3.HasChildren then
        begin
          AList := TList.Create;
          for i := 0 to N3.Count - 1 do
            AList.Add(N3.Item[i]);

          try
            while ANode.Count > 0 do
            begin
              OrgTreeView.Items.AddChildObjectFirst(N3,
                    ANode.Item[ANode.Count - 1].Text,
                    ANode.Item[ANode.Count - 1].Data);
              ANode.Item[ANode.Count - 1].Data := nil;
              ANode.Item[ANode.Count - 1].Free;
            end;
            while AList.Count > 0 do
            begin
              OrgTreeView.Items.AddChildObjectFirst(ANode,
                    TTreeNode(AList[AList.Count - 1]).Text,
                    TTreeNode(AList[AList.Count - 1]).Data);
              TTreeNode(AList[AList.Count - 1]).Data := nil;
              TTreeNode(AList[AList.Count - 1]).Free;
              AList.Delete(AList.Count - 1);
            end;
          finally
            AList.Free;
          end;
        end;
        if N3 <> nil then
          N3.Expanded := bNode;
        if ANode <> nil then
          ANode.Expanded := bN3;
      end;
       OrgTreeView.Repaint;
       SaveOrderID(ANode);
     //  aRefreshGrp.Execute;
    finally
      OrgTreeView.Items.EndUpdate;
    end;
  end;
end;

procedure TfGrp.OrgTreeViewCompare(Sender: TObject; Node1,
  Node2: TTreeNode; Data: Integer; var Compare: Integer);
begin
  tag := 0;
end;

procedure TfGrp.aDownNodeExecute(Sender: TObject);
begin
  DoMove(1)
end;

procedure TfGrp.aUPnodeExecute(Sender: TObject);
begin
  DoMove(-1)
end;

procedure TfGrp.SetfDoc(const Value: TfDoc);
begin
  FfDoc := Value;
end;

procedure TfGrp.Button3Click(Sender: TObject);
var ANode : TTreeNode;
    AIndex, i, N : integer;
begin
  if OrgTreeView.Selected <> nil then
    ANode := OrgTreeView.Selected.GetNext
  else
    ANode := OrgTreeView.TopItem;
      i := 0;
      N := OrgTreeView.Items.Count;
      while ANode <> nil do
      begin
        ShowProgressForm(0, i, N, 'Поиск...');
        inc(i);
        if POS(AnsiUpperCase(edit1.Text), AnsiUpperCase(ANode.Text)) > 0 then
        begin
      ANode.Selected := true;
      ANode.Focused := true;
      ANode.MakeVisible;
          CloseProgressForm;
          Exit;
        end;
        ANode := ANode.GetNext;
      end;

      ANode := OrgTreeView.Items.GetFirstNode;
      i := 0;
      
      while ANode <> nil do
      begin
        ShowProgressForm(0, i, N, 'Поиск...');
        inc(i);
        if POS(AnsiUpperCase(edit1.Text), AnsiUpperCase(ANode.Text)) > 0 then
        begin
      ANode.Selected := true;
      ANode.Focused := true;
      ANode.MakeVisible;
          CloseProgressForm;
          Break;
        end;
        ANode := ANode.GetNext;
      end;
  CloseProgressForm;
end;

procedure TfGrp.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    Button3.Click;
end;

procedure TfGrp.AddSysNode(AParent: Variant; List : TList);
var STO : TNodeObj;
begin
        STO := TNodeObj.Create;
        STO.ID := -26;
        STO.Name := 'Все документы';
        STO.isGrp := false;
        STO.IDParent := AParent;
        
        List.Add(STO);

        STO := TNodeObj.Create;
        STO.ID := -126;
        STO.Name := 'Из буфера';
        STO.isGrp := false;
        STO.IDParent := AParent;

        List.Add(STO);

        STO := TNodeObj.Create;
        STO.ID := -666;
        STO.Name := 'Только красные';
        STO.isGrp := false;
        STO.IDParent := AParent;

        List.Add(STO);
end;

end.
