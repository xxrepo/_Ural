unit frBJTree;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, Db, DBClient, ActnList, ToolWin, Menus,
  dbgrids, contnrs, RXDBCtrl, RXCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner,
  dxDBTL, StdCtrls, foMyFunc;

const xxx = 0;
type
 
  TNodeObj = class
  private
    FID : integer;
    FName: String;
    FPID: Variant;
    FBlocked: boolean;
    FBJType : TBJType;
    ID_Acc, id_ContrAgent: Variant;
    FisDeb: boolean;
  public
    constructor Create;
    destructor Destroy; override;
    property ID : integer read FID write FID;
    property PID : Variant read FPID write FPID;
    property Name : String read FName write FName;
    property Blocked : boolean read FBlocked;
    property isDeb : boolean read FisDeb;
    property BJType : TBJType read FBJType;
  end;

  TfBJTree = class(TFrame)
    ActionList1: TActionList;
    aNewDeb: TAction;
    aProperty: TAction;
    aArc: TAction;
    aRefreshe: TAction;
    aDelete: TAction;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    N1: TMenuItem;
    pmServiceType: TPopupMenu;
    N3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N6: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    aNewCh: TAction;
    N4: TMenuItem;
    ImgList: TImageList;
    cdsBJTec: TClientDataSet;
    aBJ_ItemAdd: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    aAddAcc: TAction;
    aAddCA: TAction;
    N7: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N2: TMenuItem;
    aNewCred: TAction;
    N5: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    dxDBTreeList1: TdxDBTreeList;
    dsBJTree: TDataSource;
    dxDBTreeList1id_BJ_Tree: TdxDBTreeListMaskColumn;
    dxDBTreeList1Name: TdxDBTreeListMaskColumn;
    dxDBTreeList1PID: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_BJ_Item: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_SimpleRel: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Acc: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_ContrAgent: TdxDBTreeListMaskColumn;
    dxDBTreeList1isDeb: TdxDBTreeListCheckColumn;
    dxDBTreeList1ExtID: TdxDBTreeListMaskColumn;
    dxDBTreeList1OrderNum: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanIn: TdxDBTreeListMaskColumn;
    dxDBTreeList1PlanDelta: TdxDBTreeListMaskColumn;
    cdsBJTree: TClientDataSet;
    N16: TMenuItem;
    aAddDeb: TAction;
    aAddKred: TAction;
    aAddAcz: TAction;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    ToolButton1: TToolButton;
    dxDBTreeList1Plan: TdxDBTreeListColumn;
    aClearGrp: TAction;
    N24: TMenuItem;
    N25: TMenuItem;
    aExcel: TAction;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    aItemUP: TAction;
    aItemDown: TAction;
    aSort: TAction;
    ToolButton12: TToolButton;
    dxDBTreeList1Column14: TdxDBTreeListColumn;
    dxDBTreeList1S_Pay: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_Off: TdxDBTreeListMaskColumn;
    dxDBTreeList1Trez: TdxDBTreeListColumn;
    ToolButton10: TToolButton;
    ceOper: TEdit;
    Label32: TLabel;
    aDet: TAction;
    N26: TMenuItem;
    N27: TMenuItem;
    cdsBJTreeSSS: TFloatField;
    dxDBTreeList1Column18: TdxDBTreeListColumn;
    dtTo: TDateTimePicker;
    Label2: TLabel;
    ToolButton11: TToolButton;
    cdsBJTreeOrderNum: TIntegerField;
    cdsBJTreeisDeb: TBooleanField;
    cdsBJTreeName: TStringField;
    cdsBJTreeid_Acc: TIntegerField;
    cdsBJTreeid_ContrAgent: TIntegerField;
    cdsBJTreeid_BJ_Tree: TIntegerField;
    cdsBJTreePID: TIntegerField;
    cdsBJTreeid_BJ_Item: TIntegerField;
    cdsBJTreeExtID: TIntegerField;
    cdsBJTreePlanIn: TFloatField;
    cdsBJTreePlanDelta: TFloatField;
    cdsBJTreePlanCorrect: TFloatField;
    cdsBJTreeAPlan: TFloatField;
    cdsBJTreeALevel: TIntegerField;
    cdsBJTreeS_Pay: TFloatField;
    cdsBJTreeS_Off: TFloatField;
    cdsBJTreeTrez: TFloatField;
    cdsBJTreeisInState: TBooleanField;
    cdsBJTreePRC: TFloatField;
    dxDBTreeList1Column19: TdxDBTreeListColumn;
    aAccCard: TAction;
    aBalance: TAction;
    N28: TMenuItem;
    N29: TMenuItem;
    ToolButton13: TToolButton;
    aExpandNode: TAction;
    aCollapseNode: TAction;
    aExpandAll: TAction;
    aCollapseAll: TAction;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    aNodeExp: TAction;
    N35: TMenuItem;
    aSetisDirect: TAction;
    aSetisInState: TAction;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    procedure aNewDebExecute(Sender: TObject);
    procedure aPropertyExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aNewChExecute(Sender: TObject);
    procedure aBJ_ItemAddExecute(Sender: TObject);
    procedure aAddAccExecute(Sender: TObject);
    procedure aAddCAExecute(Sender: TObject);
    procedure aNewCredExecute(Sender: TObject);
    procedure dxDBTreeList1GetSelectedIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure dxDBTreeList1GetImageIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure pmServiceTypePopup(Sender: TObject);
    procedure aAddDebExecute(Sender: TObject);
    procedure aAddKredExecute(Sender: TObject);
    procedure aAddAczExecute(Sender: TObject);
    procedure aClearGrpExecute(Sender: TObject);
    procedure aExcelExecute(Sender: TObject);
    procedure dxDBTreeList1CustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure aItemUPExecute(Sender: TObject);
    procedure aItemDownExecute(Sender: TObject);
    procedure aSortExecute(Sender: TObject);
    procedure aDetExecute(Sender: TObject);
    procedure cdsBJTreeCalcFields(DataSet: TDataSet);
    procedure aAccCardExecute(Sender: TObject);
    procedure aBalanceExecute(Sender: TObject);
    procedure aExpandNodeExecute(Sender: TObject);
    procedure aCollapseNodeExecute(Sender: TObject);
    procedure aExpandAllExecute(Sender: TObject);
    procedure aCollapseAllExecute(Sender: TObject);
    procedure aNodeExpExecute(Sender: TObject);
    procedure aSetisDirectExecute(Sender: TObject);
    procedure aSetisInStateExecute(Sender: TObject);
  private
    Rights_Add_Del, Rights_Edit, Rights_Corr  : boolean;

    FFFNode : TdxTreeListNode;
    FMode : integer;
    
    FAll : boolean;
    Fid_BlockSelf, Fid_BlockCh : Variant;
    Fid_Bsn, Fid_BJ_Obj, FisDeb : Variant;
    FReadOnly : boolean;
    FBJType : TBJType;
    function GetID: Variant;
    procedure AddGrp(Node: TTreeNode);
    function GetGrpName: String;
    function GetPID: Variant;
    procedure aNewGrp(APID: Variant; AisDeb : boolean);
    function GetBJType: TBJType;
    procedure AddSimpleRel(AID : integer; ABT: TBJType);
    function GetisDeb: boolean;
    procedure GetIDS(var id_BJ_Item, id_BJ_Tree: Variant);
    procedure SelectEvent(id_BJ_Item, id_BJ_Tree: Variant);
    procedure aAddSys(TechMode: integer);

    procedure SelCA(AID: integer; AName : String);
    procedure SelAcc(AID: integer; AName : String);
    procedure SelCAWS(AID: integer; AName : String; ASumm : Variant);
    procedure SelAccWS(AID: integer; AName : String; ASumm : Variant);
    function GetID_BJ_Item: Variant;

    function BJ_ItemEdit_Check(isDirect, isInState: OleVariant): Integer; 
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function GetBsnID: integer;
    function GetBJDate : Variant;
    property ID : Variant read GetID;
    property ID_BJ_Item : Variant read GetID_BJ_Item;
    property isDeb : boolean read GetisDeb;
    property PID : Variant read GetPID;
    property GrpName : String read GetGrpName;
    property BJType : TBJType read GetBJType;
    procedure Initialize(AID : Variant; AMode : integer; ABJType : TBJType; id_BJ_Obj : integer;
                       AReadOnly : boolean;
                       id_BlockSelf, id_BlockCh : Variant; AisDeb, Aid_Bsn : Variant);
  end;

implementation

uses uDM, uBJTreeProp, uInputBoxStr, uUnivSelector, uBJItemProp,
  uMultiSelectCA, uMultiSelectAcc, uBalanceSel, foMyFuncDXTreeExcel,
  uBJSort, uBJdet, uAccCard_v2, uBalance_v2;

{$R *.DFM}

{ TfCAGroupList }

procedure TfBJTree.AddGrp(Node : TTreeNode);
var Obj : TNodeObj;
    N, N2 : TTreeNode;
    List : TList;
  procedure GetTree2(ParentID : Variant; ATreeNode : TTreeNode);
  var  N : TTreeNode;
       i : integer;
  begin
 {   for i := 0 to List.Count - 1 do
    begin
      if TNodeObj(List[i]).PID = ParentID then
      begin
         N := OrgTreeView.Items.AddChildObject(ATreeNode, TNodeObj(List[i]).Name, List[i]);

         if (ATreeNode <> nil) and (TObject(ATreeNode.Data) is TNodeObj)
         and not TNodeObj(List[i]).FBlocked then
         begin
           TNodeObj(List[i]).FBlocked := TNodeObj(ATreeNode.Data).Blocked;
         end;     
    //     N.HasChildren := TDBObjectParented(AList[i]).CldCnt > 0;
         if TNodeObj(List[i]).FBJType = bjtGrp then
           GetTree2(TNodeObj(List[i]).ID, N);
      end;
    end;   }
  end;
begin
  List := TList.Create;
  try
    with cdsBJTree do
    begin
      Close;
      Params.ParamByName('@id_BJ_Obj').Value := Fid_BJ_Obj;
      Params.ParamByName('@isDeb').Value := FisDeb;
      Params.ParamByName('@Mode').Value := FMode;
      Params.ParamByName('@id_Oper').Value := DM.GetID_Oper(ceOper.Text) ;
      if dtTo.Checked then
        Params.ParamByName('@DateRep').Value := GetDateAdv(dtTo.Date, true)
      else
        Params.ParamByName('@DateRep').Value := Null;

      Open;
   {   First;
      while not Eof do
      begin
        Obj := TNodeObj.Create;
        if not FieldByName('id_BJ_Tree').IsNull then
        begin
          Obj.ID := FieldByName('id_BJ_Tree').AsInteger
        end
        else
        if not FieldByName('id_BJ_Item').IsNull then
        begin
          Obj.ID := FieldByName('id_BJ_Item').AsInteger;
          Obj.FBJType := bjtItem;
        end
        else
        begin
          Obj.ID := cdsBJTreeid_SimpleRel.AsInteger;
          if not cdsBJTreeid_Acc.IsNull then
          begin
            Obj.ID_Acc := cdsBJTreeid_Acc.AsInteger;
            Obj.FBJType := bjtAcc;
          end;
          if not cdsBJTreeid_ContrAgent.IsNull then
          begin
            Obj.id_ContrAgent := cdsBJTreeid_ContrAgent.AsInteger;
            Obj.FBJType := bjtCA;
          end;
        end;

        Obj.FisDeb := FieldByName('isDeb').AsBoolean;
        Obj.PID := FieldByName('PID').AsVariant;
        Obj.Name := FieldByName('Name').AsString;
        Obj.FBlocked := (Obj.ID = Fid_BlockSelf) or ((Fid_BlockCh <> Null) and (Obj.PID = Fid_BlockCh));

        List.Add(Obj);

        Next;
      end;
      GetTree2(Null, nil);  }
    end;
           
  finally
    List.Free;
  end;
end;

procedure TfBJTree.Initialize(AID : Variant; AMode : integer; ABJType : TBJType; id_BJ_Obj : integer;
                       AReadOnly : boolean;
                       id_BlockSelf, id_BlockCh : Variant; AisDeb, Aid_Bsn : Variant);
var Obj : TNodeObj;
    BsnObj : TBsnObj;
    N : TTreeNode;
    i, TmpID : integer;
begin
  Rights_Add_Del := DM.CheckUserRights(104, Aid_Bsn);
  Rights_Edit := DM.CheckUserRights(102, Aid_Bsn);
  Rights_Corr := DM.CheckUserRights(103, Aid_Bsn);

  dxDBTreeList1.RegistryPath := SRegPath + '\' + ClassName + '\wwq' + dxDBTreeList1.Name;
  if dxDBTreeList1S_Pay.Visible then
    dxDBTreeList1.OptionsBehavior := dxDBTreeList1.OptionsBehavior + [etoStoreToRegistry];

  if trunc(dtTo.Date) = 0 then
  begin
    dtTo.Date := Now;
    dtTo.Checked := false;
  end;
  
  FFFNode := nil;
//  if Fid_Bsn <> id_Bsn then
  begin
    FMode := AMode;
    Fid_Bsn := Aid_Bsn;
    Fid_BlockSelf := id_BlockSelf;
    Fid_BlockCh := id_BlockCh;
    FBJType := ABJType;
    Fid_BJ_Obj := id_BJ_Obj;
    FReadOnly := AReadOnly;
    FisDeb := AisDeb;

    aNewDeb.Enabled := true;
    aNewCred.Enabled := true;
  //  aRefreshe.Enabled := Fid_Bsn >= 0;

    ToolBar1.Visible := not AReadOnly;
    try
      Screen.Cursor := crSQLWait;
      AddGrp(nil);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
//  ID := AID;
  dxDBTreeList1.FullCollapse;
  dxDBTreeList1.OnChangeNode := nil;

  if AID > 0 then
    SelectEvent(-13, AID)
  else
    if AID <> -1 then
      SelectEvent(-AID, -13);
  dxDBTreeList1.OnChangeNode := dxDBTreeList1ChangeNode;
  if not DM.CheckUserRights(110, Null) then
  begin
     dxDBTreeList1.PopupMenu := nil;
     ToolBar1.Visible := false;
     for i := 0 to dxDBTreeList1.ColumnCount - 1 do
     begin

       if dxDBTreeList1.Columns[i] <> dxDBTreeList1Name then dxDBTreeList1.Columns[i].Visible := false;
     end;
     dxDBTreeList1.ShowBands := false;
 
  end;
end;

function TfBJTree.GetID: Variant;
begin
  if (FFFNode<> nil) then
  begin
    Result := FFFNode.Values[dxDBTreeList1id_BJ_Tree.Index];
  end
  else
    Result := -2;
end;

function TfBJTree.GetBsnID: integer;
begin
  if Fid_Bsn > 0 then
    Result := Fid_Bsn
  else
    Result := 24
end;

function TfBJTree.GetGrpName: String;
begin
  if (FFFNode<> nil) then
  begin
    Result := FFFNode.Values[dxDBTreeList1Name.Index];
  end
  else
    Result := '';
end;

constructor TfBJTree.Create(AOwner: TComponent);
begin
  inherited;
  FFFNode := nil;
  Fid_BlockSelf := Null;
  Fid_BlockCh := Null;
  Fid_Bsn := -1;
  dtTo.Checked := false;
  dtTo.Date := 0;
end;

destructor TfBJTree.Destroy;
begin
  inherited;
end;

{ TNodeObj }

constructor TNodeObj.Create;
begin
  inherited;
  FisDeb := true;
  FID := -1;
  FPID := Null;
  FBlocked := false;
  FBJType := bjtGrp;
  ID_Acc := Null;
  id_ContrAgent := Null;
end;

destructor TNodeObj.Destroy;
begin
  inherited;

end;

procedure TfBJTree.aNewDebExecute(Sender: TObject);
begin
  aNewGrp(Null, true);
end;

procedure TfBJTree.aNewGrp(APID : Variant; AisDeb : boolean);
var AID : integer;
begin
  AID := -1;
  if ShowBJTreeProp(AID, Fid_BJ_Obj, APID, AisDeb, Fid_Bsn) then
  begin
  //  Fid_Bsn := 0;
    aRefreshe.Execute;
    SelectEvent(-8, AID);
    if FFFNode <> nil then FFFNode.Expand(false);
  end;
end;

procedure TfBJTree.aPropertyExecute(Sender: TObject);
var AID : integer;
    Value: Variant;
begin
  AID := ID;
  if BJType = bjtGrp then
  begin
    if ShowBJTreeProp(AID, Fid_BJ_Obj, -1, false, Fid_Bsn) then
    begin
      aRefreshe.Execute;
    end;
  end
  else
    AddSimpleRel(FFFNode.Values[dxDBTreeList1id_BJ_Item.Index], BJType);
end;

procedure TfBJTree.aRefresheExecute(Sender: TObject);
var id_BJ_Item, id_BJ_Tree : Variant;
    b : boolean;
begin
  dxDBTreeList1.OnChangeNode := nil;
  try
    if FFFNode <> nil then
      b := FFFNode.Expanded
    else
      b := false;
    GetIDS(id_BJ_Item, id_BJ_Tree);
    Initialize(ID, FMode, BJType, Fid_BJ_Obj, FReadOnly, Fid_BlockSelf, Fid_BlockCh, Null, Fid_Bsn);
  finally
    dxDBTreeList1.OnChangeNode := dxDBTreeList1ChangeNode;
    SelectEvent(id_BJ_Item, id_BJ_Tree);
    if b and (FFFNode <> nil) then
      FFFNode.Expand(false);
  end;


end;

procedure TfBJTree.aDeleteExecute(Sender: TObject);
var
    Rez : integer;
    id_BJ_Item, id_BJ_Tree : Variant;
    P : TdxTreeListNode;
    procedure GetSuxxxNode;
    var NeedLast : boolean;
    begin
      P := FFFNode;
  //    NeedLast := false;
      FFFNode := P.GetNextSibling;
      NeedLast := FFFNode = nil;
      if FFFNode = nil then
        FFFNode := P.Parent;
      P.Free;
        
      if NeedLast and (FFFNode <> nil) and (FFFNode.HasChildren) then
        FFFNode := FFFNode.GetLastChild;
      if FFFNode <> nil then
      begin
        FFFNode.Focused := true;
        FFFNode.MakeVisible;
      end;
    end;
begin
  GetIDS(id_BJ_Item, id_BJ_Tree);

  if BJType = bjtGrp then
  begin
    if MessageBox(Handle, PChar('Удалить группу "' + GetGrpName + '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
    begin
      Rez := DM.rsCA.AppServer.BJ_TreeDel(id_BJ_Tree);
      if Rez <> -1 then
      begin
        GetSuxxxNode;
      //  OrgTreeView.Selected.Delete;
      end
      else
        raise Exception.Create('Ошибка при удалении');
    end;   
  end
  else
    if BJType = bjtItem then
    begin
      if MessageBox(Handle, PChar('Удалить статью "' + GetGrpName + '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
      begin
        Rez := DM.rsCA.AppServer.BJ_ItemDel(id_BJ_Item);
        if Rez <> -1 then
        begin
          GetSuxxxNode;
        end
        else
          raise Exception.Create('Ошибка при удалении');
      end;   
    end
    else
      if (BJType = bjtAcc) or (BJType = bjtCA) then
      begin
        if MessageBox(Handle, PChar('Удалить объект "' + GetGrpName + '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
        begin
          Rez := DM.rsCA.AppServer.BJ_ItemDel(id_BJ_Item);
          if Rez <> -1 then
          begin
            GetSuxxxNode;
          end
          else
            raise Exception.Create('Ошибка при удалении');
        end;
      end;
  if (FFFNode = Nil) and (dxDBTreeList1.Count > 0) then
  begin
    FFFNode := dxDBTreeList1.Items[0];
    FFFNode.Focused := true;
    FFFNode.MakeVisible;
  end;
end;

function TfBJTree.GetPID: Variant;
begin
  if (FFFNode<> nil) then
  begin
    Result := FFFNode.Values[dxDBTreeList1PID.Index];
  end
  else
    Result := Null;
end;

procedure TfBJTree.aNewChExecute(Sender: TObject);
begin
  aNewGrp(ID, isDeb);
end;

function TfBJTree.GetBJType: TBJType;
begin
  if (FFFNode<> nil) then
  begin
    if FFFNode.Values[dxDBTreeList1id_Acc.Index] <> Null then
      Result := bjtAcc
    else
      if FFFNode.Values[dxDBTreeList1id_ContrAgent.Index] <> Null then
        Result := bjtCA
      else
        if FFFNode.Values[dxDBTreeList1id_BJ_Item.Index] <> Null then
          Result := bjtItem
        else
          Result := bjtGrp
  end
  else
    Result := bjtNone; 
end;

procedure TfBJTree.aBJ_ItemAddExecute(Sender: TObject);
var Value: Variant;
    I, id_BJ_Tree : integer;
begin
  AddSimpleRel(-1, bjtItem);
end;

procedure TfBJTree.aAddAccExecute(Sender: TObject);
var ASelectedObj : TSelectedObj;
    I, id_BJ_Tree : integer;
    id_ContrAgent, id_Acc: OleVariant;
    BT : TBJType;
begin
  if ShowMultiSelectAcc(Fid_Bsn, SelAcc) then
    aRefreshe.Execute;
end;

procedure TfBJTree.AddSimpleRel(AID : integer; ABT : TBJType);
var id_BJ_Tree : integer;
begin
  id_BJ_Tree := AID;
  if ShowBJItemProp(id_BJ_Tree, GetBsnID, ABT, ID, isDeb)  then
  begin
    cdsBJTree.Close;
    cdsBJTree.Open;
    dxDBTreeList1.FullCollapse;
    SelectEvent(id_BJ_Tree, -13);
  end;
end;

procedure TfBJTree.SelectEvent(id_BJ_Item, id_BJ_Tree : Variant);
var i : integer;
    Node : TdxTreeListNode;
begin
  FFFNode := nil;
  for i := dxDBTreeList1.SelectedCount - 1 downto 0 do
    dxDBTreeList1.SelectedNodes[i].Selected := false;
  if (id_BJ_Item < 0) and (id_BJ_Tree < 0) then
  begin
    if dxDBTreeList1.Count > 0 then
    begin
      FFFNode := dxDBTreeList1.Items[0];
      dxDBTreeList1.MakeNodeVisible(FFFNode);
      FFFNode.Selected := true;
      FFFNode.Focused := true;
      FFFNode.MakeVisible;
    end;
    Exit;
  end;
  Node := dxDBTreeList1.TopNode;
  while Node <> nil do
  begin
    if (Node.Values[dxDBTreeList1id_BJ_Item.Index] = id_BJ_Item) or
       (Node.Values[dxDBTreeList1id_BJ_Tree.Index] = id_BJ_Tree) then
    begin
      dxDBTreeList1.MakeNodeVisible(Node);
      Node.Selected := true;
      Node.Focused := true;
      FFFNode := Node;
      Break;
    end;

    Node := Node.GetNext;
  end;
//  if (FFFNode = nil) and (dxDBTreeList1.Count)
end;

procedure TfBJTree.GetIDS(var id_BJ_Item, id_BJ_Tree : Variant);
begin
  if (FFFNode <> nil) {and (dxDBTreeList1.SelectedCount > 0)} then
  begin
    id_BJ_Item := FFFNode.Values[dxDBTreeList1id_BJ_Item.Index];
    id_BJ_Tree := FFFNode.Values[dxDBTreeList1id_BJ_Tree.Index];
    if id_BJ_Tree = -1 then id_BJ_Tree := -13;
    if id_BJ_Item = Null then id_BJ_Item := -13;
    if id_BJ_Item <> -13 then
      id_BJ_Tree := -13; 
  end
  else
  begin
    id_BJ_Item := -13;
    id_BJ_Tree := -13;
  end;
end;

procedure TfBJTree.SelCA(AID: integer; AName: String);
var ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta: OleVariant;
   id_BJ_Tree : integer;
begin
  ANameX := AName;
  id_ContrAgent := AID;
  id_Acc := Null;
  id_BJ_Tree := ID;

  PlanIn := Null;
  PlanDelta := Null;
  DM.rsCA.AppServer.BJ_ItemEdit(-1, id_BJ_Tree, ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta, true, Null, false, false);
end;

procedure TfBJTree.SelCAWS(AID: integer; AName : String; ASumm : Variant);
var ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta: OleVariant;
   id_BJ_Tree : integer;
begin
  ANameX := AName;
  id_ContrAgent := AID;
  id_Acc := Null;
  id_BJ_Tree := ID;

  PlanIn := ABS(ASumm);
  PlanDelta := Null;
  DM.rsCA.AppServer.BJ_ItemEdit(-1, id_BJ_Tree, ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta, false, Null, false, false);
end;


procedure TfBJTree.SelAcc(AID: integer; AName: String);
var ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta: OleVariant;
   id_BJ_Tree : integer;
begin
  ANameX := AName;
  id_ContrAgent := Null;
  id_Acc := AID;
  id_BJ_Tree := ID;

  PlanIn := Null;
  PlanDelta := Null;
  DM.rsCA.AppServer.BJ_ItemEdit(-1, id_BJ_Tree, ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta, true, Null, false, false);
end;

procedure TfBJTree.SelAccWS(AID: integer; AName : String; ASumm : Variant);
var ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta: OleVariant;
   id_BJ_Tree : integer;
begin
  ANameX := AName;
  id_ContrAgent := Null;
  id_Acc := AID;
  id_BJ_Tree := ID;

  PlanIn := ASumm;
  PlanDelta := Null;
  DM.rsCA.AppServer.BJ_ItemEdit(-1, id_BJ_Tree, ANameX, id_ContrAgent, id_Acc, PlanIn, PlanDelta, false, Null, false, false);
end;


procedure TfBJTree.aAddCAExecute(Sender: TObject);
begin
  if ShowMultiSelectCA(Fid_Bsn, SelCA) then
    aRefreshe.Execute;

 // AddSimpleRel(-1, bjtCA);
end;

procedure TfBJTree.aNewCredExecute(Sender: TObject);
begin
  aNewGrp(Null, false);
end;

function TfBJTree.GetisDeb: boolean;
begin
  if (FFFNode<> nil) then
  begin
    Result := FFFNode.Values[dxDBTreeList1isDeb.Index];
  end
  else
    Result := false;
end;

procedure TfBJTree.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  Index := Node.ImageIndex;
  if Index = 1 then
    Index := 0; 
end;

procedure TfBJTree.dxDBTreeList1GetImageIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
var
  ColInd: Integer;
begin
  Index := -1;
  if (Node <> nil) then
  begin
 {   if (Node.Values[dxDBTreeList1ExtID.Index] = 3) then
      Index := 17
    else
    if (Node.Values[dxDBTreeList1ExtID.Index] = 1) or (Node.Values[dxDBTreeList1ExtID.Index] = 2) then
      Index := 16
    else   }
    if (Node.Values[dxDBTreeList1ExtID.Index] = -13) then
      Index := 3
    else     
    if (Node.Values[dxDBTreeList1OrderNum.Index] = -1) then
      Index := 18
    else     
    if (Node.Values[dxDBTreeList1OrderNum.Index] = 3000) then
      Index := 18
    else     
    if Node.Values[dxDBTreeList1id_BJ_Tree.Index] > 0 then
      Index := 1
    else
      if (Node.Values[dxDBTreeList1OrderNum.Index] = 4000) then
        Index := -1
      else
        if Node.Values[dxDBTreeList1id_ContrAgent.Index] <> Null then
          Index := 16
        else
          if Node.Values[dxDBTreeList1id_Acc.Index] <> Null then
            Index := 17
          else
            Index := 2;
  end;     
end;

procedure TfBJTree.dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
var T_Node, B_Node : TdxTreeListNode;
begin    
  FFFNode := Node;
  T_Node := nil;
  B_Node := nil;
  if Node <> nil then
  begin
    T_Node := Node.GetPrevSibling;
    B_Node := Node.GetNextSibling;
  end;
 aProperty.Enabled := (FFFNode <> nil) and
    ((FFFNode.Values[dxDBTreeList1id_BJ_Item.Index] > 0) or
     (FFFNode.Values[dxDBTreeList1id_BJ_Tree.Index] > 0)
    )
    and (FFFNode.Values[dxDBTreeList1ExtID.Index] <> -13)
     and (Rights_Edit or Rights_Corr);
    
  aDelete.Enabled :=  aProperty.Enabled and Rights_Add_Del;

  aItemUP.Enabled := aProperty.Enabled and Rights_Edit;
  aItemDown.Enabled := aProperty.Enabled and Rights_Edit;
 { if FFFNode <> nil then
  begin
    if FFFNode.Values[dxDBTreeList1id_BJ_Item.Index] > 0 then
    begin
      aItemUP.Enabled := aProperty.Enabled and ((T_Node <> nil)
        and (T_Node.Values[dxDBTreeList1id_BJ_Item.Index] > 0)
        and (T_Node.Values[dxDBTreeList1id_BJ_Item.Index] <> Null));
      aItemDown.Enabled := aProperty.Enabled and ((B_Node <> nil)
        and (B_Node.Values[dxDBTreeList1id_BJ_Item.Index] > 0)
        and (B_Node.Values[dxDBTreeList1id_BJ_Item.Index] <> Null));
    end;
    if FFFNode.Values[dxDBTreeList1id_BJ_Tree.Index] > 0 then
    begin
      aItemUP.Enabled := aProperty.Enabled and ((T_Node <> nil)
        and (T_Node.Values[dxDBTreeList1id_BJ_Tree.Index] > 0)
        and (T_Node.Values[dxDBTreeList1id_BJ_Tree.Index] <> Null));
      aItemDown.Enabled := aProperty.Enabled and ((B_Node <> nil)
        and (B_Node.Values[dxDBTreeList1id_BJ_Tree.Index] > 0)
        and (B_Node.Values[dxDBTreeList1id_BJ_Tree.Index] <> Null));
    end;
  end;   }
  aSort.Enabled := aProperty.Enabled and Rights_Edit;//aItemUP.Enabled or aItemDown.Enabled;
end;

procedure TfBJTree.pmServiceTypePopup(Sender: TObject);
begin
  aNewDeb.Enabled := Rights_Add_Del;
  aNewCred.Enabled := Rights_Add_Del;
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);


 aProperty.Enabled := (FFFNode <> nil) and
    ((FFFNode.Values[dxDBTreeList1id_BJ_Item.Index] > 0) or
     (FFFNode.Values[dxDBTreeList1id_BJ_Tree.Index] > 0)
    )
    and (FFFNode.Values[dxDBTreeList1ExtID.Index] <> -13)
     and (Rights_Edit or Rights_Corr);


//  aProperty.Enabled := (FFFNode <> nil) and (FFFNode.Values[dxDBTreeList1ExtID.Index] <> -13) and (Rights_Edit or Rights_Corr);

  aDelete.Enabled :=  (FFFNode <> nil) and (FFFNode.Values[dxDBTreeList1ExtID.Index] <> -13) and Rights_Add_Del;

  aNewCh.Enabled := (FFFNode <> nil) and (FFFNode.Values[dxDBTreeList1id_BJ_Item.Index] = Null)
  and (FFFNode.Values[dxDBTreeList1id_BJ_Tree.Index] > 0) and (FFFNode.Values[dxDBTreeList1ExtID.Index] <> -13)
   and Rights_Add_Del;

  aSetisDirect.Enabled := aNewCh.Enabled and (Rights_Edit);
  aSetisInState.Enabled := aNewCh.Enabled and (Rights_Edit);

  aBJ_ItemAdd.Enabled := aNewCh.Enabled  and Rights_Add_Del;// and (Node.Values[dxDBTreeList1id_BJ_Item.Index] = Null);
  aAddAcc.Enabled := aNewCh.Enabled  and Rights_Add_Del;//  and (Node.Values[dxDBTreeList1id_BJ_Item.Index] = Null);
  aAddCA.Enabled := aNewCh.Enabled  and Rights_Add_Del;//  and (Node.Values[dxDBTreeList1id_BJ_Item.Index] = Null);

  aAddDeb.Enabled := aNewCh.Enabled  and Rights_Add_Del;
  aAddKred.Enabled := aNewCh.Enabled  and Rights_Add_Del;
  aAddAcz.Enabled := aNewCh.Enabled  and Rights_Add_Del;
  aClearGrp.Enabled := aNewCh.Enabled  and Rights_Add_Del;

  aDet.Enabled := (FFFNode <> nil) and (
                   (FFFNode.Values[dxDBTreeList1id_BJ_Item.Index] <> Null) or
                   (FFFNode.Values[dxDBTreeList1id_Acc.Index] <> Null) or
                   (FFFNode.Values[dxDBTreeList1id_ContrAgent.Index] <> Null)
                  ) ;

  aAccCard.Enabled := (FFFNode <> nil) and (
                   (FFFNode.Values[dxDBTreeList1id_Acc.Index] <> Null)
                  );
  aBalance.Enabled := (FFFNode <> nil) and (
                   (FFFNode.Values[dxDBTreeList1id_ContrAgent.Index] <> Null)
                  );
end;

procedure TfBJTree.aAddDebExecute(Sender: TObject);
begin
  if ShowSelectBsn(Fid_Bsn, GetBJDate, 1, SelCAWS) then
    aRefreshe.Execute;
//  aAddSys(1);
end;

procedure TfBJTree.aAddKredExecute(Sender: TObject);
begin
  if ShowSelectBsn(Fid_Bsn, GetBJDate, 2, SelCAWS) then
    aRefreshe.Execute;
//  aAddSys(2);
end;

procedure TfBJTree.aAddAczExecute(Sender: TObject);
begin
  if ShowSelectBsn(Fid_Bsn, GetBJDate, 4, SelAccWS) then
    aRefreshe.Execute;
//  aAddSys(4);
end;

procedure TfBJTree.aAddSys(TechMode: integer);
var Rez, i, ExtID : integer;
    isDeb : boolean;
    AName, id_ContrAgent, id_Acc, PlanIn, PlanDelta: OleVariant;
begin
  Screen.Cursor := crSQLWait;
  try
    with cdsBJTec do
    begin
      Close;
      Params.ParamByName('@id_business').Value := Fid_Bsn;
      Params.ParamByName('@id_BJ_Obj').Value := Fid_BJ_Obj;
      Params.ParamByName('@TechMode').Value := TechMode;

      if TechMode = 1 then
      begin
        AName := 'Дебиторы';
        isDeb := true;
        ExtID := 1;
      end
      else
        if TechMode = 2 then
        begin
          AName := 'Кредиторы';
          isDeb := false;
          ExtID := 2;
        end
        else
          if TechMode = 4 then
          begin
            AName := 'Остатки денежных средств';
            isDeb := false;
            ExtID := 3;
          end;
      Open;
      First;
      BeginTruns(DM.rsCA);
      try
        Rez := DM.rsCA.AppServer.BJ_TreeEdit(-1, Fid_BJ_Obj, AName, Null, isDeb, ExtID);
        while not Eof do
        begin
          AName := cdsBJTec.FieldByName('Name').AsString;
          id_ContrAgent := cdsBJTec.FieldByName('id_ContrAgent').AsVariant;
          id_Acc := cdsBJTec.FieldByName('id_Acc').AsVariant;
          PlanIn := ABS(cdsBJTec.FieldByName('Summ').AsFloat);
          PlanDelta := Null;
          i := DM.rsCA.AppServer.BJ_ItemEdit(-1, Rez, AName, id_ContrAgent, id_Acc, PlanIn, PlanDelta, false, Null, false, false);
          if i = -1 then
           raise Exception.Create('Ошибка при сохранении');

          Next;
        end;
        CommitTrans(DM.rsCA);
      except
        on E : Exception do
        begin
          RollbackTrans(DM.rsCA);
          raise Exception.Create(E.Message);
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    aRefreshe.Execute;
    SelectEvent(-8, Rez);
  end;
end;


function TfBJTree.GetBJDate: Variant;
begin
  result := DM.rsCA.AppServer.BJ_ObjDateStart(Fid_BJ_Obj);
end;

procedure TfBJTree.aClearGrpExecute(Sender: TObject);
var Node : TdxTreeListNode;
begin
  if MessageBox(Handle, PChar('Очистить группу "' + GetGrpName + '"?'), 'Подтвердите очистку', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    Node := FFFNode.GetFirstChild;
    while Node <> nil do
    begin
      if Node.Values[dxDBTreeList1id_BJ_Tree.Index] > 0 then
        DM.rsCA.AppServer.BJ_TreeDel(Node.Values[dxDBTreeList1id_BJ_Tree.Index])
      else
        if Node.Values[dxDBTreeList1id_BJ_Item.Index] > 0 then
          DM.rsCA.AppServer.BJ_ItemDel(Node.Values[dxDBTreeList1id_BJ_Item.Index]);
      Node := Node.GetNextSibling;
    end;
    aRefreshe.Execute;
  end;
end;

procedure TfBJTree.aExcelExecute(Sender: TObject);
var S : String;
begin
  S := 'Бюджет ';
  DBTreeListToExcel(dxDBTreeList1, S);
end;

procedure TfBJTree.dxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if ANode.Values[dxDBTreeList1id_BJ_Tree.Index] > 0 then
      AFont.Style := AFont.Style + [fsBold];
  if (ANode.Values[dxDBTreeList1OrderNum.Index] = 4000) then
  begin
    if ((ANode.Values[dxDBTreeList1Plan.Index] <> Null) AND (ABS(ANode.Values[dxDBTreeList1Plan.Index]) > 0.005))
    or ((ANode.Values[dxDBTreeList1Trez.Index] <> Null) AND (ABS(ANode.Values[dxDBTreeList1Trez.Index]) > 0.005)) then
    begin
      AColor := clRed;
    end
    else
    begin
      AColor := $00D7D700;
    end;
  end;
  if AFont.Style = [fsBold] then
    ANode.Data := Pointer(1013);
end;

procedure TfBJTree.aItemUPExecute(Sender: TObject);
var i : integer;
begin
  if FFFNode <> nil then
  begin
    if FFFNode.Parent = nil then
    begin
  //    for i := 
    end
    else
    begin

    end;
//    DM.
  end;
end;

procedure TfBJTree.aItemDownExecute(Sender: TObject);
begin
//*
end;

procedure TfBJTree.aSortExecute(Sender: TObject);
var Aid_BJ_Item, Aid_BJ_Tree : integer;
begin
  Aid_BJ_Item := -1;
  Aid_BJ_Tree := -1;
  if BJType = bjtGrp then
  begin
    Aid_BJ_Tree := ID;
  end
  else
    Aid_BJ_Item := FFFNode.Values[dxDBTreeList1id_BJ_Item.Index];
  if ShowBJSort(Aid_BJ_Item, Aid_BJ_Tree) then
    aRefreshe.Execute;
end;

function TfBJTree.GetID_BJ_Item: Variant;
begin
  if (FFFNode<> nil) then
  begin
    Result := FFFNode.Values[dxDBTreeList1id_BJ_Item.Index];
  end
  else
    Result := -2;

end;

procedure TfBJTree.aDetExecute(Sender: TObject);
var id_acc, id_ContrAgent, id_BJ_Item, id_Oper, VVV : Variant;
    S : String;
begin
  id_acc := FFFNode.Values[dxDBTreeList1id_Acc.Index];
  id_ContrAgent := FFFNode.Values[dxDBTreeList1id_ContrAgent.Index];
  id_BJ_Item := FFFNode.Values[dxDBTreeList1id_BJ_Item.Index] ;
  if (id_acc <> Null) or (id_ContrAgent <> Null ) then
    id_BJ_Item := Null;
  id_Oper := DM.GetID_Oper(ceOper.Text) ;
  if id_acc <> Null then
    S := 'по счету "' + FFFNode.Values[dxDBTreeList1Name.Index] + '"';
  if id_ContrAgent <> Null then
    S := 'по контрагенту "' + FFFNode.Values[dxDBTreeList1Name.Index] + '"';
  if id_BJ_Item <> Null then
    S := 'по статье "' + FFFNode.Values[dxDBTreeList1Name.Index] + '"';

  if dtTo.Checked then
    VVV := GetDateAdv(dtTo.Date, true)
  else
    VVV := Null;
  ShowBJdet('Детализация ' + S, Fid_Bsn, Fid_BJ_Obj, id_acc, id_ContrAgent, id_BJ_Item, id_Oper, VVV);

//*
end;

procedure TfBJTree.cdsBJTreeCalcFields(DataSet: TDataSet);
begin
  if not DataSet.FieldByName('S_Pay').IsNull or
     not DataSet.FieldByName('S_Off').IsNull then
  DataSet.FieldByName('SSS').AsFloat :=
          DataSet.FieldByName('S_Pay').AsFloat +
          DataSet.FieldByName('S_Off').AsFloat;

  if (abs(DataSet.FieldByName('APlan').AsFloat) >= 0.005) and (DataSet.FieldByName('OrderNum').Asinteger <> 4000) then
    DataSet.FieldByName('PRC').AsFloat :=
            (DataSet.FieldByName('APlan').AsFloat - DataSet.FieldByName('Trez').AsFloat) /
            DataSet.FieldByName('APlan').AsFloat*100;
end;

procedure TfBJTree.aAccCardExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_acc := FFFNode.Values[dxDBTreeList1id_Acc.Index];
  if dtTo.Checked then
  begin
    AParamBlnc.DateFrom := dtTo.Date;
    AParamBlnc.DateTo := dtTo.Date;
  end;
  ShowAccCard_v2(AParamBlnc);
end;

procedure TfBJTree.aBalanceExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_ContrAgent := FFFNode.Values[dxDBTreeList1id_ContrAgent.Index];
  if dtTo.Checked then
  begin
    AParamBlnc.DateFrom := dtTo.Date;
    AParamBlnc.DateTo := dtTo.Date;
  end;
  ShowBalance_v2(AParamBlnc);
end;

procedure TfBJTree.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TfBJTree.aCollapseNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TfBJTree.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TfBJTree.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TfBJTree.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  S := FFFNode.Values[dxDBTreeList1Name.Index];
  DBTreeListToExcel(dxDBTreeList1, S, FFFNode);
end;

procedure TfBJTree.aSetisDirectExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Пометить все элементы в группе "' + GetGrpName + '" как постоянные величины?'), 'Подтвердите действие', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    BJ_ItemEdit_Check(true, Null)
  end;
end;

procedure TfBJTree.aSetisInStateExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Пометить все элементы в группе "' + GetGrpName + '" как входящее состояние?'), 'Подтвердите действие', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    BJ_ItemEdit_Check(Null, true)
  end;
end;

function TfBJTree.BJ_ItemEdit_Check(isDirect, isInState: OleVariant): Integer;
var Node : TdxTreeListNode;
    id_BJ_Item, N: Integer;
begin
  Screen.Cursor := crSQLWait;
  try
    N := 0;
    Node := FFFNode;
    while Node <> nil do
    begin
      if (Node.Values[dxDBTreeList1id_BJ_Item.Index] > 0) and (Node.HasAsParent(FFFNode))  then
      begin
        id_BJ_Item := Node.Values[dxDBTreeList1id_BJ_Item.Index];

        DM.rsCA.AppServer.BJ_ItemEdit_Check(id_BJ_Item, isDirect, isInState);
        inc(N);
      end;

      Node := Node.GetNext;
    end;
    MessageBox(Handle, PChar('Помечено ' + IntToStr(N) + ' элементов'), '', MB_ICONINFORMATION + MB_OK);
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.

