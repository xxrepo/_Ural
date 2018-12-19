unit frCAGroupList;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, Db, DBClient, ActnList, ToolWin, Menus,
  dbgrids, frCntrAgentList, contnrs;

type
  TNodeObj = class
  private
    FID: integer;
    FName: String;
    FCnt: integer;
    FIDBsn: Variant;
    FShowInRoot: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    property ID : integer read FID write FID;
    property IDBsn : Variant read FIDBsn write FIDBsn;
    property Cnt : integer read FCnt write FCnt;
    property Name : String read FName write FName;
    property ShowInRoot : Boolean read FShowInRoot write FShowInRoot;
  end;

    TfCAGroupList = class(TFrame)
    OrgTreeView: TTreeView;
    ImageList1: TImageList;
    cdsCAGroup: TClientDataSet;
    cdsCAGroupid_CAGroup: TAutoIncField;
    cdsCAGroupName: TStringField;
    ActionList1: TActionList;
    aNew: TAction;
    aProperty: TAction;
    aArc: TAction;
    aRefreshe: TAction;
    aDelete: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
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
    cdsCAGroupCnt: TIntegerField;
    cdsCAGroupShowInRoot: TBooleanField;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    N1: TMenuItem;
    N2: TMenuItem;
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
  private
    FAll : boolean;
    FNoGroup : boolean;
    FNoCA, FAllRepr : boolean;
    FBsns : TObjectList;
    Fid_Bsn, FisOwn : Variant;
    FReadOnly : boolean;
    FShowToolBar : boolean;
    function GetID: Variant;
    procedure AddGrp(Node: TTreeNode; id_Bsn: Variant; isOwn : Variant);
    function GetGrpName: String;
    procedure SetID(Value: Variant);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function GetBsnID: integer;
    property ID : Variant read GetID write SetID;
    property GrpName : String read GetGrpName;
    procedure Initialize(AID : Variant; id_Bsn : Variant; isOwn : Variant; AReadOnly : boolean = false; AShowToolBar : boolean = true;
                       AAll : boolean = true;
                       ANoGroup : boolean = true;
                       ANoCA : boolean = true;
                       UID : integer= -1;
                       AAllRepr : boolean = true);
  end;

implementation

uses uDM, foMyFunc{$IFNDEF LC}, uFormApi_Oper, uMovCA_Adv{$ENDIF}, uInputQuery_Grp;

{$R *.DFM}

{ TfCAGroupList }

procedure TfCAGroupList.AddGrp(Node : TTreeNode; id_Bsn : Variant; isOwn : Variant);
var Obj : TNodeObj;
    N, N2 : TTreeNode;
begin
  if FNoGroup then
  begin
    Obj := TNodeObj.Create;
    Obj.FIDBsn := id_Bsn;
    Obj.ID := -1;
    Obj.Name := 'Без группы';
    N := OrgTreeView.Items.AddChildObject(Node, Obj.Name, Obj);
  end;
  
  with cdsCAGroup do
  begin
    Close;
    Params.ParamByName('@id_business').Value := id_Bsn;
    Params.ParamByName('@isOwn').Value := isOwn;
    Params.ParamByName('@id_User').Value := DM.IDUser;
    Open;
    First;
    while not Eof do
    begin
      Obj := TNodeObj.Create;
      Obj.ID := FieldByName('id_CAGroup').AsInteger;
      Obj.Cnt := FieldByName('Cnt').AsInteger;
      Obj.Name := FieldByName('Name').AsString;
      Obj.ShowInRoot := FieldByName('ShowInRoot').AsBoolean;
      Obj.FIDBsn := id_Bsn;

      N := OrgTreeView.Items.AddChildObject(Node, Obj.Name, Obj);
      if Obj.Cnt > 0 then
        N.Text :=  N.Text + ' (' + IntToStr(Obj.Cnt) + ')';
//        N.HasChildren := true;

      Next;
    end;
  end;

  if FAll then
  begin
    Obj := TNodeObj.Create;
    Obj.FIDBsn := id_Bsn;
    Obj.ID := -2;
    Obj.Name := 'Полный список контрагентов';
    N := OrgTreeView.Items.AddChildObject(Node, Obj.Name, Obj);
  end;
  
  if FAllRepr then
  begin
    Obj := TNodeObj.Create;
    Obj.FIDBsn := id_Bsn;
    Obj.ID := -3;
    Obj.Name := 'Все представители';
    N := OrgTreeView.Items.AddChildObject(Node, Obj.Name, Obj);
  end;

  if FNoCA then
  begin
    Obj := TNodeObj.Create;
    Obj.FIDBsn := id_Bsn;
    Obj.ID := -13;
    Obj.Name := 'Контрагент не определен';
    N := OrgTreeView.Items.AddChildObject(Node, Obj.Name, Obj);
  end;
end;

procedure TfCAGroupList.Initialize(AID, id_Bsn : Variant; isOwn : Variant;
                       AReadOnly, AShowToolBar: boolean;
                       AAll : boolean;
                       ANoGroup : boolean;
                       ANoCA : boolean;
                       UID : integer;
                       AAllRepr : boolean);
var Obj : TNodeObj;
    BsnObj : TBsnObj;
    N : TTreeNode;
    i, TmpID : integer;
begin
  FAll := AAll;
  FNoGroup := ANoGroup;
  FNoCA := ANoCA;
  FAllRepr := AAllRepr;

{$IFDEF LC}
  aArc.Visible := false;
{$ENDIF}
  Fid_Bsn := id_Bsn;
  FisOwn := isOwn;
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
        AddGrp(nil, TBsnObj(FBsns[0]).ID, isOwn);
      end
      else
      begin
        for i := 0 to DM.FBsnList.Count - 1 do
        begin
          BsnObj := TBsnObj.Create;
          BsnObj.ID := TBsnObj(DM.FBsnList[i]).ID;
          BsnObj.Name := TBsnObj(DM.FBsnList[i]).Name;
          N := OrgTreeView.Items.AddObject(nil, BsnObj.Name, BsnObj);
          AddGrp(N, TBsnObj(DM.FBsnList[i]).ID, isOwn);
        end;
      end;
    end
    else
    begin
      AddGrp(nil, Fid_Bsn, isOwn)
    end;
    if (FBsns.Count = 1) or (AID > 0) or (id_Bsn > 0) then
      ID := AID;
  finally
    OrgTreeView.Items.EndUpdate;
  {  with OrgTreeView do
      OnChange(OrgTreeView, Selected);  }
  end;
end;

function TfCAGroupList.GetID: Variant;
begin
  if (OrgTreeView.Selected <> nil) and (TObject(OrgTreeView.Selected.Data) is TNodeObj)  then
  begin
    Result := TNodeObj(OrgTreeView.Selected.Data).ID;
  end
  else
    Result := -2;
end;

procedure TfCAGroupList.SetID(Value: Variant);
var i : integer;
begin
  if Value = Null then
    Value := -1;
    if (Value <> -1) then
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
      OrgTreeView.Items[0].Selected := true;
      OrgTreeView.Selected.MakeVisible;
    end;
 //   OrgTreeView.OnChange(OrgTreeView, OrgTreeView.Selected);
end;

function TfCAGroupList.GetBsnID: integer;
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

function TfCAGroupList.GetGrpName: String;
begin
  if (OrgTreeView.Selected <> nil) and (TObject(OrgTreeView.Selected.Data) is TNodeObj)  then
  begin
    Result := TNodeObj(OrgTreeView.Selected.Data).Name;
  end
  else
    Result := '';
end;

constructor TfCAGroupList.Create(AOwner: TComponent);
begin
  inherited;
  {$IFDEF ACS_v2}
  aDelete.visible := false;
  aProperty.visible := false;
  {$ENDIF}
  FBsns := TObjectList.Create;
end;

destructor TfCAGroupList.Destroy;
begin
  FBsns.Free;
  inherited;
end;

{ TNodeObj }

constructor TNodeObj.Create;
begin
  inherited;
  FID := -1;
  FCnt := 0;
  FIDBsn := Null;
end;

destructor TNodeObj.Destroy;
begin
  inherited;

end;

procedure TfCAGroupList.aNewExecute(Sender: TObject);
var S : String;
    Obj : TNodeObj;
    Rez : integer;
    N : TTreeNode;
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
  if InputQuery_Grp('Группа', S, AShowInRoot) then
  begin
    if DM.rsCA.AppServer.UN_Check_CAGroup(GetBsnID, S, -1) = -1 then
      raise Exception.Create('Группа с таким название уже существует');
    Rez := DM.rsCA.AppServer.CAGroup_Add(GetBsnID, S, AShowInRoot);
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

procedure TfCAGroupList.aPropertyExecute(Sender: TObject);
var S : String;
    Obj : TNodeObj;
    Rez : integer;
    N : TTreeNode;
    AShowInRoot : boolean;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  DM.Rights_GetUserRights(10, Null);//555
  S := TNodeObj(OrgTreeView.Selected.Data).Name;
  AShowInRoot := TNodeObj(OrgTreeView.Selected.Data).ShowInRoot;
  if InputQuery_Grp('Группа', S, AShowInRoot) then
  begin
    if DM.rsCA.AppServer.UN_Check_CAGroup(GetBsnID, S, TNodeObj(OrgTreeView.Selected.Data).ID) = -1 then
      raise Exception.Create('Группа с таким название уже существует');
    Rez := DM.rsCA.AppServer.CAGroup_Edit(TNodeObj(OrgTreeView.Selected.Data).ID, S, AShowInRoot);
    if Rez <> -1 then
    begin
      aRefreshe.Execute;
    end
    else
      raise Exception.Create('Ошибка при сохранении');
  end;
end;

procedure TfCAGroupList.aArcExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  {$IFNDEF LC}
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_business := Fid_Bsn;
  AParamBlnc.id_CAGroup := ID;
  ShowMovCA_Adv(eotCAGroup, AParamBlnc);
  {$ENDIF}
end;

procedure TfCAGroupList.aRefresheExecute(Sender: TObject);
var ID : integer;
    i : integer;
begin
  ID := -13;
  if (OrgTreeView.Selected <> nil) and (TObject(OrgTreeView.Selected.Data) is TNodeObj) then
    ID := TNodeObj(OrgTreeView.Selected.Data).ID;
  Initialize(ID, Fid_Bsn, FisOwn, FReadOnly, FShowToolBar);
end;

procedure TfCAGroupList.aDeleteExecute(Sender: TObject);
var
    Rez : integer;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  if MessageBox(Handle, PChar('Удалить группу "' + TNodeObj(OrgTreeView.Selected.Data).Name + '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    Rez := DM.rsCA.AppServer.CAGroup_Del(TNodeObj(OrgTreeView.Selected.Data).ID);
    if Rez <> -1 then
    begin
      OrgTreeView.Selected.Delete;
 //     TreeView1.Repaint;
    end
    else
      raise Exception.Create('Ошибка при удалении');
  end;
end;

procedure TfCAGroupList.OrgTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  aProperty.Enabled := (Node <> nil) and (TObject(Node.Data) is TNodeObj)
                       and (TNodeObj(Node.Data).ID <> -2) and (TNodeObj(Node.Data).ID <> -1)
                       and (TNodeObj(Node.Data).ID <> -13);
  aDelete.Enabled :=  (Node <> nil) and ((TObject(Node.Data) is TNodeObj)
                       and (TNodeObj(Node.Data).ID <> -2) and (TNodeObj(Node.Data).ID <> -1)) and (TNodeObj(Node.Data).Cnt = 0)
                       and (TNodeObj(Node.Data).ID <> -13);

  aNew.Enabled := (Node <> nil);
  aRefreshe.Enabled := (Node <> nil);

  aArc.Enabled := (Node <> nil) and (TObject(Node.Data) is TNodeObj)
                  and (TNodeObj(Node.Data).ID <> -2)
                  and (TNodeObj(Node.Data).ID <> -1)
                 { and (TNodeObj(Node.Data).ID <> -13)};

end;

procedure TfCAGroupList.OrgTreeViewDeletion(Sender: TObject;
  Node: TTreeNode);
begin
  if (TObject(Node.Data) is TObject) then
    TObject(Node.Data).Free;
end;

procedure TfCAGroupList.OrgTreeViewGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
  if (TObject(Node.Data) is TNodeObj) then
  begin
    if not (TNodeObj(Node.Data).ID > 0) then
      Node.ImageIndex := 3
    else
      if Node.Selected then
        Node.ImageIndex := 1
      else
        Node.ImageIndex := 0;
  end
  else
    Node.ImageIndex := 4;
end;

procedure TfCAGroupList.OrgTreeViewGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TfCAGroupList.OrgTreeViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var Node : TTreeNode;
begin
  Node := OrgTreeView.GetNodeAt(X, Y);
  Accept := (TControl(Source).Parent is TfCntrAgentList)
            and (Node <> nil)
            and (TObject(Node.Data) is TNodeObj)
            and (TNodeObj(Node.Data).ID <> -2)
            and (TNodeObj(Node.Data).ID <> -13)
            and (TNodeObj(Node.Data).IDBsn = TfCntrAgentList(TControl(Source).Parent).cdsCAgent.FieldByName('id_business').Value);
end;

procedure TfCAGroupList.OrgTreeViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var Node : TTreeNode;
    id_CAGroup : Variant;
begin
  Node := OrgTreeView.GetNodeAt(X, Y);
  id_CAGroup := Null;
  if TNodeObj(Node.Data).ID >= 0 then
    id_CAGroup := TNodeObj(Node.Data).ID;
  if DM.rsCA.AppServer.ContrAgentSetGrp(TfCntrAgentList(TControl(Source).Parent).cdsCAgentid_ContrAgent.AsInteger, id_CAGroup) = 1 then
    aRefreshe.Execute;
end;

end.

