unit frAccGroup;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, Db, DBClient, ActnList, ToolWin, Menus,
  dbgrids, contnrs, RXDBCtrl, RXCtrls;

const xxx = 0;
type
  TNodeObj = class
  private
    FID: integer;
    FName: String;
    FCnt: integer;
    FIDBsn: Variant;
    FShowInRoot: Boolean;
    FPID: Variant;
    FBlocked: boolean;
  public
    constructor Create;
    destructor Destroy; override;
    property ID : integer read FID write FID;
    property PID : Variant read FPID write FPID;
    property IDBsn : Variant read FIDBsn write FIDBsn;
    property Cnt : integer read FCnt write FCnt;
    property Name : String read FName write FName;
    property ShowInRoot : Boolean read FShowInRoot write FShowInRoot;
    property Blocked : boolean read FBlocked;
  end;

  TfAccGroup = class(TFrame)
    OrgTreeView: TTreeView;
    ImageList1: TImageList;
    cdsAccGroup: TClientDataSet;
    ActionList1: TActionList;
    aNew: TAction;
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
    N5: TMenuItem;
    MenuItem3: TMenuItem;
    cdsAccGroupid_Group: TIntegerField;
    cdsAccGroupName: TStringField;
    cdsAccGroupCnt: TIntegerField;
    cdsAccGroupShowInRoot: TBooleanField;
    N1: TMenuItem;
    N2: TMenuItem;
    cdsAccGroupPID: TIntegerField;
    pmServiceType: TPopupMenu;
    N3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N6: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    aNewCh: TAction;
    N4: TMenuItem;
    procedure aNewExecute(Sender: TObject);
    procedure aPropertyExecute(Sender: TObject);
    procedure aArcExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure OrgTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure OrgTreeViewDeletion(Sender: TObject; Node: TTreeNode);
    procedure OrgTreeViewGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure OrgTreeViewGetSelectedIndex(Sender: TObject;
      Node: TTreeNode);
    procedure OrgTreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure OrgTreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure aNewChExecute(Sender: TObject);
    procedure OrgTreeViewCustomDraw(Sender: TCustomTreeView;
      const ARect: TRect; var DefaultDraw: Boolean);
    procedure OrgTreeViewCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    FDisabledCtg : Variant;
    FAll : boolean;
    FNoGroup : boolean;
    FCustomDBGrid : TRxDBGrid;
    FBsns : TObjectList;
    Fid_Bsn : Variant;
    FReadOnly : boolean;
    FShowToolBar : boolean;
    function GetID: Variant;
    procedure AddGrp(Node: TTreeNode; id_Bsn: Variant);
    function GetGrpName: String;
    procedure SetID(Value: Variant);
    function GetPID: Variant;
    procedure aNewGrp(APID: Variant);
    function GetBlocked: boolean;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function GetBsnID: integer;
    property ID : Variant read GetID write SetID;
    property PID : Variant read GetPID;
    property Blocked : boolean read GetBlocked;
    property GrpName : String read GetGrpName;
    procedure Initialize(ACustomDBGrid : TRxDBGrid;
                        AID : Variant; id_Bsn : Variant;
                       AReadOnly : boolean = false; AShowToolBar : boolean = true;
                       AAll : boolean = true;
                       ANoGroup : boolean = true;
                       UID : integer= -1;
                       DisabledCtg : integer = -1);
  end;

implementation

uses uDM, foMyFunc{$IFNDEF LC}, uFormApi_Oper,
  uAccCard_Adv{$ENDIF}, uInputQuery_Grp, uInputQuery_AccGrp;

{$R *.DFM}

{ TfCAGroupList }

procedure TfAccGroup.AddGrp(Node : TTreeNode; id_Bsn : Variant);
var Obj : TNodeObj;
    N, N2 : TTreeNode;
    List : TList;
  procedure GetTree2(ParentID : Variant; ATreeNode : TTreeNode);
  var  N : TTreeNode;
       i : integer;
  begin
    for i := 0 to List.Count - 1 do
    begin
      if TNodeObj(List[i]).PID = ParentID then
      begin
         N := OrgTreeView.Items.AddChildObject(ATreeNode, TNodeObj(List[i]).Name, List[i]);

         if (ATreeNode <> nil) and (TObject(ATreeNode.Data) is TNodeObj) and not TNodeObj(List[i]).FBlocked then
         begin
           TNodeObj(List[i]).FBlocked := TNodeObj(ATreeNode.Data).Blocked;
         end;     
    //     N.HasChildren := TDBObjectParented(AList[i]).CldCnt > 0;
         GetTree2(TNodeObj(List[i]).ID, N);
      end;
    end;
  end;
begin
  List := TList.Create;
  try
    if FNoGroup then
    begin
      Obj := TNodeObj.Create;
      Obj.FIDBsn := id_Bsn;
      Obj.ID := -1;
      Obj.Name := 'Без группы';
      N := OrgTreeView.Items.AddChildObject(Node, Obj.Name, Obj);
    end;
  
    with cdsAccGroup do
    begin
      Close;
      Params.ParamByName('@id_business').Value := id_Bsn;
      Params.ParamByName('@id_User').Value := DM.IDUser;
      Open;
      First;
      while not Eof do
      begin
        Obj := TNodeObj.Create;
        Obj.ID := FieldByName('id_Group').AsInteger;
        Obj.PID := FieldByName('PID').AsVariant;
        Obj.Cnt := FieldByName('Cnt').AsInteger;
        Obj.Name := FieldByName('Name').AsString;
        Obj.ShowInRoot := FieldByName('ShowInRoot').AsBoolean;
        Obj.FIDBsn := id_Bsn;
        Obj.FBlocked := ((Obj.ID = FDisabledCtg) and (FDisabledCtg > 0));

        List.Add(Obj);
     {   N := OrgTreeView.Items.AddChildObject(Node, Obj.Name, Obj);
        if Obj.Cnt > 0 then
          N.Text :=  N.Text + ' (' + IntToStr(Obj.Cnt) + ')';  }

        Next;
      end;
      GetTree2(Null, nil);
    end;

    if FAll then
    begin
      Obj := TNodeObj.Create;
      Obj.FIDBsn := id_Bsn;
      Obj.ID := -2;
      Obj.Name := 'Полный список';
      N := OrgTreeView.Items.AddChildObject(Node, Obj.Name, Obj);
    end;
  finally
    List.Free;
  end;
end;

procedure TfAccGroup.Initialize(ACustomDBGrid : TRxDBGrid;
                       AID, id_Bsn : Variant;
                       AReadOnly, AShowToolBar: boolean;
                       AAll : boolean;
                       ANoGroup : boolean;
                       UID : integer;
                       DisabledCtg : integer);
var Obj : TNodeObj;
    BsnObj : TBsnObj;
    N : TTreeNode;
    i, TmpID : integer;
begin
  if Fid_Bsn <> id_Bsn then
  begin
    FDisabledCtg := DisabledCtg;

    FCustomDBGrid := ACustomDBGrid;
    FAll := AAll;
    FNoGroup := ANoGroup;

    Fid_Bsn := id_Bsn;
    FReadOnly := AReadOnly;
    FShowToolBar := AShowToolBar;

    aNew.Enabled := Fid_Bsn >= 0;
  //  aRefreshe.Enabled := Fid_Bsn >= 0;

    ToolBar1.Visible := FShowToolBar;
    OrgTreeView.Items.BeginUpdate;
    try
      OrgTreeView.Items.Clear;
      if (Fid_Bsn = -13) then
      begin
        if UID <> -1 then
          DM.GetBsnList(FBsns, DM.IDUser, UID)
        else
          DM.GetBsnList(FBsns, DM.IDUser, Null);
        if FBsns.Count = 1 then
        begin
          AddGrp(nil, TBsnObj(FBsns[0]).ID);
        end
        else
        begin
          for i := 0 to DM.FBsnList.Count - 1 do
          begin
            BsnObj := TBsnObj.Create;
            BsnObj.ID := TBsnObj(DM.FBsnList[i]).ID;
            BsnObj.Name := TBsnObj(DM.FBsnList[i]).Name;
            N := OrgTreeView.Items.AddObject(nil, BsnObj.Name, BsnObj);
            AddGrp(N, TBsnObj(DM.FBsnList[i]).ID);
          end;
        end;
      end
      else
      begin
        AddGrp(nil, Fid_Bsn)
      end;

    finally
      OrgTreeView.Items.EndUpdate;
  {  with OrgTreeView do
      OnChange(OrgTreeView, Selected);  }
    end;
  end;
  ID := AID;
end;

function TfAccGroup.GetID: Variant;
begin
  if (OrgTreeView.Selected <> nil) and (TObject(OrgTreeView.Selected.Data) is TNodeObj)  then
  begin
    Result := TNodeObj(OrgTreeView.Selected.Data).ID;
  end
  else
    Result := -2;
end;

procedure TfAccGroup.SetID(Value: Variant);
var i : integer;
begin
  if Value = Null then
    Value := -1;
    if Value <> Null then
    begin
    // ** позиционируемся
      for i := 0 to OrgTreeView.Items.Count - 1 do
      begin
        if (TObject(OrgTreeView.Items[i].Data) is TNodeObj) and
           (TNodeObj(OrgTreeView.Items[i].Data).ID = Value) then
        begin
          OrgTreeView.Items[i].Selected := true;
          OrgTreeView.Items[i].MakeVisible;
          Break;
        end;
      end;
    end
    else
    begin
   //   OrgTreeView.Items[OrgTreeView.Items.Count - 1].Selected := true;
   //   OrgTreeView.Selected.MakeVisible;
    end;
  //  OrgTreeView.OnChange(OrgTreeView, OrgTreeView.Selected);
end;

function TfAccGroup.GetBsnID: integer;
begin
  if (OrgTreeView.Selected <> nil) then
  begin
    if (TObject(OrgTreeView.Selected.Data) is TNodeObj)  then
      Result := TNodeObj(OrgTreeView.Selected.Data).IDBsn
    else
      if (TObject(OrgTreeView.Selected.Data) is TBsnObj)  then
        Result := TBsnObj(OrgTreeView.Selected.Data).ID;
  end
  else
    Result := Fid_Bsn;
end;

function TfAccGroup.GetGrpName: String;
begin
  if (OrgTreeView.Selected <> nil) and (TObject(OrgTreeView.Selected.Data) is TNodeObj)  then
  begin
    Result := TNodeObj(OrgTreeView.Selected.Data).Name;
  end
  else
    Result := '';
end;

constructor TfAccGroup.Create(AOwner: TComponent);
begin
  inherited;
  FDisabledCtg := -555;
  {$IFDEF LC}
   aArc.Visible := false;
  {$ENDIF}

  FBsns := TObjectList.Create;
  Fid_Bsn := -1;
end;

destructor TfAccGroup.Destroy;
begin
  FBsns.Free;
  inherited;
end;

{ TNodeObj }

constructor TNodeObj.Create;
begin
  inherited;
  FID := -1;
  FPID := Null;
  FCnt := 0;
  FIDBsn := Null;
  FBlocked := false;
end;

destructor TNodeObj.Destroy;
begin
  inherited;

end;

procedure TfAccGroup.aNewExecute(Sender: TObject);
var S : String;
    Obj : TNodeObj;
    Rez : integer;
    i : integer;
    AShowInRoot : boolean;
    APID : Variant;
begin
  aNewGrp(-1);
{P  DM.Rights_GetUserRights(10, Null);//555
  S := '';
  APID := PID;
  AShowInRoot := false;
  if InputQuery_AccGrp('Группа', Fid_Bsn, S, AShowInRoot, APID) then
  begin
    if DM.rsCA.AppServer.xxx_Group_Check_v2(xxx, GetBsnID, S, Null, APID) = -1 then
      raise Exception.Create('Группа с таким название уже существует');
    Rez := DM.rsCA.AppServer.xxx_Group_Add_v2(xxx, GetBsnID, S, AShowInRoot, APID);
    if Rez <> -1 then
    begin
      aRefreshe.Execute;
      for i := 0 to OrgTreeView.Items.Count - 1 do
      begin
        SetId(Rez);
      end;
    end
    else
      raise Exception.Create('Ошибка при сохранении');
  end;  }
end;

procedure TfAccGroup.aNewGrp(APID : Variant);
var S : String;
    Obj : TNodeObj;
    Rez : integer;
    i : integer;
    AShowInRoot : boolean;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  DM.Rights_GetUserRights(10, Null);//555
  S := '';
  AShowInRoot := false;
  if InputQuery_AccGrp(0, 'Группа', Fid_Bsn, S, AShowInRoot, APID) then
  begin
    if DM.rsCA.AppServer.xxx_Group_Check_v2(xxx, GetBsnID, S, Null, APID) = -1 then
      raise Exception.Create('Группа с таким название уже существует');
    Rez := DM.rsCA.AppServer.xxx_Group_Add_v2(xxx, GetBsnID, S, AShowInRoot, APID);
    if Rez <> -1 then
    begin
      aRefreshe.Execute;
      for i := 0 to OrgTreeView.Items.Count - 1 do
      begin
        SetId(Rez);
      end;
    end
    else
      raise Exception.Create('Ошибка при сохранении');
  end;
end;

procedure TfAccGroup.aPropertyExecute(Sender: TObject);
var S : String;
    Obj : TNodeObj;
    Rez : integer;
    APID : Variant;
    AShowInRoot : boolean;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  DM.Rights_GetUserRights(10, Null);//555
  S := TNodeObj(OrgTreeView.Selected.Data).Name;
  APID := PID;
  AShowInRoot := TNodeObj(OrgTreeView.Selected.Data).ShowInRoot;
  if InputQuery_AccGrp(TNodeObj(OrgTreeView.Selected.Data).ID, 'Группа', Fid_Bsn, S, AShowInRoot, APID) then
  begin
    if DM.rsCA.AppServer.xxx_Group_Check_v2(xxx, GetBsnID, S, TNodeObj(OrgTreeView.Selected.Data).ID, APID) = -1 then
      raise Exception.Create('Группа с таким название уже существует');
    Rez := DM.rsCA.AppServer.xxx_Group_Edit_v2(xxx, TNodeObj(OrgTreeView.Selected.Data).ID, S, AShowInRoot, APID);
    if Rez <> -1 then
    begin
      aRefreshe.Execute;
    end
    else
      raise Exception.Create('Ошибка при сохранении');
  end;
end;

procedure TfAccGroup.aArcExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  {$IFNDEF LC}
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_AccGroup := ID;
  AParamBlnc.id_business := GetBsnID;
  
  ShowAccCard_Adv(AParamBlnc);
  {$ENDIF}
end;

procedure TfAccGroup.aRefresheExecute(Sender: TObject);
var ID : integer;
    i : integer;
    OldID : integer;
begin
  ID := -13;
  if (OrgTreeView.Selected <> nil) and (TObject(OrgTreeView.Selected.Data) is TNodeObj) then
    ID := TNodeObj(OrgTreeView.Selected.Data).ID;
  OldID := Fid_Bsn;
  Fid_Bsn := 0;
  Initialize(FCustomDBGrid, ID, OldID, FReadOnly, FShowToolBar);
end;

procedure TfAccGroup.aDeleteExecute(Sender: TObject);
var
    Rez : integer;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  if MessageBox(Handle, PChar('Удалить группу "' + TNodeObj(OrgTreeView.Selected.Data).Name + '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    Rez := DM.rsCA.AppServer.xxx_Group_Del_v2(xxx, TNodeObj(OrgTreeView.Selected.Data).ID);
    if Rez <> -1 then
    begin
      OrgTreeView.Selected.Delete;
 //     TreeView1.Repaint;
    end
    else
      raise Exception.Create('Ошибка при удалении');
  end;
end;

procedure TfAccGroup.OrgTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  aProperty.Enabled := (Node <> nil) and (TObject(Node.Data) is TNodeObj)
                       and (TNodeObj(Node.Data).ID <> -2) and (TNodeObj(Node.Data).ID <> -1)
                       and (TNodeObj(Node.Data).ID <> -13);
  aDelete.Enabled :=  (Node <> nil) and ((TObject(Node.Data) is TNodeObj)
                       and (TNodeObj(Node.Data).ID <> -2) and (TNodeObj(Node.Data).ID <> -1)) //and (TNodeObj(Node.Data).Cnt = 0)
                       and (TNodeObj(Node.Data).ID <> -13);

  aNewCh.Enabled := aDelete.Enabled;
  aNew.Enabled := (Node <> nil);
  aRefreshe.Enabled := (Node <> nil);

  aArc.Enabled := (Node <> nil) and (TObject(Node.Data) is TNodeObj)
                  and (TNodeObj(Node.Data).ID <> -2)
                  and (TNodeObj(Node.Data).ID <> -13);

end;

procedure TfAccGroup.OrgTreeViewDeletion(Sender: TObject;
  Node: TTreeNode);
begin
  if (TObject(Node.Data) is TObject) then
    TObject(Node.Data).Free;
end;

procedure TfAccGroup.OrgTreeViewGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
  if (TObject(Node.Data) is TNodeObj) then
  begin
    if (TNodeObj(Node.Data).ID = -2) or (TNodeObj(Node.Data).ID = -1) or (TNodeObj(Node.Data).ID = -13) then
      Node.ImageIndex := 6
    else
      if Node.Selected then
        Node.ImageIndex := 1
      else
        Node.ImageIndex := 0;
  end
  else
    Node.ImageIndex := 4;
end;

procedure TfAccGroup.OrgTreeViewGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TfAccGroup.OrgTreeViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var Node : TTreeNode;
begin
  Node := OrgTreeView.GetNodeAt(X, Y);
  Accept := (Source = FCustomDBGrid)
            and (Node <> nil)
            and (TObject(Node.Data) is TNodeObj)
            and (TNodeObj(Node.Data).ID <> -2)
            and (TNodeObj(Node.Data).ID <> -13)
            and (
            (TNodeObj(Node.Data).IDBsn = FCustomDBGrid.DataSource.DataSet.FieldByName('id_business').Value));
end;

procedure TfAccGroup.OrgTreeViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var Node : TTreeNode;
    id_CAGroup : Variant;
    i : integer;
begin
  Node := OrgTreeView.GetNodeAt(X, Y);
  id_CAGroup := Null;
  if TNodeObj(Node.Data).ID >= 0 then
    id_CAGroup := TNodeObj(Node.Data).ID;
  if DM.rsCA.AppServer.xxx_SetGrp(xxx, FCustomDBGrid.DataSource.DataSet.FieldByName('id_Acc').AsInteger, id_CAGroup) = 1 then
    aRefreshe.Execute;
end;

function TfAccGroup.GetPID: Variant;
begin
  if (OrgTreeView.Selected <> nil) and (OrgTreeView.Selected.Parent <> nil) and (TObject(OrgTreeView.Selected.Parent.Data) is TNodeObj)  then
  begin
    Result := TNodeObj(OrgTreeView.Selected.Parent.Data).ID;
  end
  else
    Result := Null;
end;

procedure TfAccGroup.aNewChExecute(Sender: TObject);
begin
  aNewGrp(ID);
end;

function TfAccGroup.GetBlocked: boolean;
begin
  if (OrgTreeView.Selected <> nil) and (TObject(OrgTreeView.Selected.Data) is TNodeObj)  then
  begin
    Result := TNodeObj(OrgTreeView.Selected.Data).FBlocked;
  end
  else
    Result := true;
end;

procedure TfAccGroup.OrgTreeViewCustomDraw(Sender: TCustomTreeView;
  const ARect: TRect; var DefaultDraw: Boolean);
begin
  Sender.Canvas.FillRect(ARect);
end;

procedure TfAccGroup.OrgTreeViewCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if (cdsSelected in State) and (cdsFocused in State) then
    Sender.Canvas.Font.Style := Sender.Canvas.Font.Style + [fsBold];
  if TObject(Node.Data) is TNodeObj and TNodeObj(Node.Data).FBlocked then
  begin
    Sender.Canvas.Font.Color := clGray;
  end;
end;

end.

