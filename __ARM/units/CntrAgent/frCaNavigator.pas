unit frCaNavigator;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, frCAGroupList, frReprList, frCntrAgentList, comctrls, db, registry,
  StdCtrls, dbgrids, Buttons;

type
  TfCaNavigator = class(TFrame)
    fCAGroupList1: TfCAGroupList;
    Splitter2: TSplitter;
    Panel2: TPanel;
    Splitter3: TSplitter;
    GroupBox1: TGroupBox;
    fReprList1: TfReprList;
    fCntrAgentList1: TfCntrAgentList;
    procedure fCntrAgentList1dsCAgentDataChange(Sender: TObject;
      Field: TField);
    procedure fReprList1RxDBGrid1CellClick(Column: TColumn);
    procedure fCAGroupList1OrgTreeViewChange(Sender: TObject;
      Node: TTreeNode);
    procedure fCntrAgentList1ToolButton2Click(Sender: TObject);
    procedure fCntrAgentList1aSetGrpExecute(Sender: TObject);
  private
    FInitialized : boolean;
    FSelPepr : boolean;
    FAllRepr : boolean;
    Fid_Bsn : Variant;
    FDisabled : Variant;
    FisOwn : Variant;
    FReadOnly, FShowToolBar : boolean;
    function GetShowReprList: boolean;
    procedure SetShowReprList(const Value: boolean);
    function GetCA_ID: Variant;
    function GetCA_Name: String;
    function GetRepr_ID: Variant;
    function GetRepr_Name: String;
    procedure SetCA_ID(const Value: Variant);
    procedure SetRepr_ID(const Value: Variant);
    function Getid_Bsn: Variant;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure InitializeRepr(Aid_Repr : Variant; AReadOnly : boolean = false; AShowToolBar : boolean = true;
                       UID : integer = -1;
                       AAllRepr : boolean = true);
    procedure Initialize(AID : Variant; id_Bsn : Variant; Disabled : Variant; isOwn : Variant;
                         AReadOnly : boolean = false; AShowToolBar : boolean = true;
                       UID : integer = -1;
                       AAllRepr : boolean = true);
    function WasInitialized: boolean;

    property ShowReprList : boolean read GetShowReprList write SetShowReprList;

    property id_Bsn : Variant read Getid_Bsn;
    property CA_Name : String read GetCA_Name;
    property CA_ID : Variant read GetCA_ID write SetCA_ID;

    property Repr_Name : String read GetRepr_Name;
    property Repr_ID : Variant read GetRepr_ID write SetRepr_ID;
    property SelPepr : boolean read FSelPepr;
  end;

implementation

uses uDM, uFormApi_CA;

{$R *.DFM}

constructor TfCaNavigator.Create(AOwner: TComponent);
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
begin
  inherited;
  FSelPepr := false;
  FInitialized := false;
  
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, true) then
    begin
      if Reg.ValueExists('fCAGroupList1Width') then
        fCAGroupList1.Width := Reg.ReadInteger('fCAGroupList1Width');
      if Reg.ValueExists('fCntrAgentList1dbgCommentHeight') then
        fCntrAgentList1.dbgComment.Height := Reg.ReadInteger('fCntrAgentList1dbgCommentHeight');

      if Reg.ValueExists('fCntrAgentList1Height') then
      begin
        i := Reg.ReadInteger('fCntrAgentList1Height');
        fCntrAgentList1.Height := i;
      end;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;

end;

destructor TfCaNavigator.Destroy;
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
      Reg.WriteInteger('fCAGroupList1Width', fCAGroupList1.Width);
      Reg.WriteInteger('fCntrAgentList1Height', fCntrAgentList1.Height);

      Reg.WriteInteger('fCntrAgentList1dbgCommentHeight', fCntrAgentList1.dbgComment.Height);
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  inherited;

end;

procedure TfCaNavigator.fCntrAgentList1dsCAgentDataChange(Sender: TObject;
  Field: TField);
var CaID : integer; 
begin
  FSelPepr := false;
  fCntrAgentList1.dsCAgentDataChange(Sender, Field);
  CaId := -1;
  if not fCntrAgentList1.cdsCAgent.IsEmpty then
    CaID := fCntrAgentList1.cdsCAgentid_ContrAgent.AsInteger;
  fReprList1.Initialize(Null, CaID, FDisabled, Null, FReadOnly, FShowToolBar);

end;


function TfCaNavigator.GetCA_ID: Variant;
begin
  if fCntrAgentList1.Visible then
    Result := fCntrAgentList1.cdsCAgent.FieldByName('id_ContrAgent').Value
  else
    Result := Null;
end;

function TfCaNavigator.GetCA_Name: String;
begin
  if fCntrAgentList1.Visible then
    Result := fCntrAgentList1.cdsCAgentName.AsString
  else
    Result := '';
end;

function TfCaNavigator.GetRepr_ID: Variant;
begin
  Result := fReprList1.Repr_ID;
end;

function TfCaNavigator.GetRepr_Name: String;
begin
  Result := fReprList1.Repr_Name;
end;

function TfCaNavigator.GetShowReprList: boolean;
begin
  Result := GroupBox1.Visible;
end;

procedure TfCaNavigator.Initialize(AID : Variant; id_Bsn, Disabled: Variant;
  isOwn: Variant;
  AReadOnly : boolean;
  AShowToolBar : boolean;
  UID : integer;
  AAllRepr : boolean);
var id_Group{, id_Ca} : Variant;
    AisOwn : WordBool;
begin
  FAllRepr := AAllRepr;
  FInitialized := true;
  FShowToolBar := AShowToolBar;

  Fid_Bsn := id_Bsn;
  FDisabled := Disabled;
  FisOwn := isOwn;
  FReadOnly := AReadOnly;
  id_Group := Null;
  
  if (AID > 0)  then
    id_Bsn := DM.rsCA.AppServer.UNSel_CABsn(AID, AisOwn, id_Group);

  fCAGroupList1.Initialize(id_Group, id_Bsn, FisOwn, AReadOnly, AShowToolBar, true, true, true, UID, FAllRepr);
  CA_ID := AID;
end;

procedure TfCaNavigator.SetShowReprList(const Value: boolean);
begin
  GroupBox1.Visible := Value;
  if not Value then
    fCntrAgentList1.Align := alClient;
end;

function TfCaNavigator.WasInitialized: boolean;
begin
  Result := FInitialized;
end;

procedure TfCaNavigator.fReprList1RxDBGrid1CellClick(Column: TColumn);
begin
  FSelPepr := true;
end;

procedure TfCaNavigator.SetCA_ID(const Value: Variant);
begin
  if (fCntrAgentList1.cdsCAgent.Active) and (Value > 0) then
    fCntrAgentList1.cdsCAgent.Locate('id_ContrAgent', Value, []);
end;

procedure TfCaNavigator.SetRepr_ID(const Value: Variant);
begin
  fReprList1.Repr_ID := Value;
end;

procedure TfCaNavigator.fCAGroupList1OrgTreeViewChange(Sender: TObject;
  Node: TTreeNode);
var id_CAGroup : Variant;
begin
  fCAGroupList1.OrgTreeViewChange(Sender, Node);
  if (Node <> nil) and (TObject(Node.Data) is TNodeObj) then
  begin                            
    if TNodeObj(Node.Data).ID = -2 then
      id_CAGroup := Null
    else
      id_CAGroup := TNodeObj(Node.Data).ID;
    if (id_CAGroup <> -13) and (id_CAGroup <> -3) then
    begin
      fCntrAgentList1.Visible := true;
      fCntrAgentList1.Initialize(Null, TNodeObj(Node.Data).IDBsn, FDisabled, FisOwn, id_CAGroup, FReadOnly, FShowToolBar);
    end
    else
    begin
      fCntrAgentList1.Visible := false;
      if id_CAGroup = -3 then
        id_CAGroup := Null;
      fReprList1.Initialize(Null, id_CAGroup, FDisabled, TNodeObj(Node.Data).IDBsn, FReadOnly, FShowToolBar);
      ShowReprList := true;
    end;
  end
  else
    fCntrAgentList1.Initialize(Null, -5, FDisabled, FisOwn, id_CAGroup, FReadOnly, FShowToolBar);    
end;

procedure TfCaNavigator.fCntrAgentList1ToolButton2Click(Sender: TObject);
begin
  fCntrAgentList1.aPropertyExecute(Sender);

end;

function TfCaNavigator.Getid_Bsn: Variant;
begin
  Result := fCAGroupList1.GetBsnID;
end;

procedure TfCaNavigator.fCntrAgentList1aSetGrpExecute(Sender: TObject);
var AID : Variant;
    AName : String;
    i : integer;
begin
  fCntrAgentList1.aSetGrpExecute(Sender);
  AID := -1;
  AName := '';
  if SelectCAGroup(Fid_Bsn, AID, AName) then
  begin
    if fCntrAgentList1.RxDBGrid1.SelectedRows.Count > 0 then
    begin
      for i := 0 to fCntrAgentList1.RxDBGrid1.SelectedRows.Count - 1 do
      begin
        fCntrAgentList1.RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(fCntrAgentList1.RxDBGrid1.SelectedRows.Items[i]));
        DM.rsCA.AppServer.ContrAgentSetGrp(fCntrAgentList1.RxDBGrid1.DataSource.DataSet.FieldByName('id_ContrAgent').AsInteger, AID);
      end;
    end
    else
      DM.rsCA.AppServer.ContrAgentSetGrp(fCntrAgentList1.RxDBGrid1.DataSource.DataSet.FieldByName('id_ContrAgent').AsInteger, AID);
    fCAGroupList1.aRefreshe.Execute;
//    fCntrAgentList1.aRefreshe.Execute;
  end;
end;

procedure TfCaNavigator.InitializeRepr(Aid_Repr : Variant;
  AReadOnly, AShowToolBar: boolean; UID: integer;
                       AAllRepr : boolean);
var id_Group, id_Ca, id_Bsn : Variant;
    isOwn : WordBool;
begin
  FAllRepr := AAllRepr;
  FInitialized := true;

  Fid_Bsn := id_Bsn;
  FReadOnly := AReadOnly;
  FShowToolBar := AShowToolBar;
  FDisabled := false;
  
  id_Bsn := DM.rsCA.AppServer.UNSel_ReprBsn(Aid_Repr, isOwn, id_Group, id_Ca);
  if VarIsEmpty(id_Ca) then id_Ca := Null;

  if id_Ca = Null then
  begin
    fCAGroupList1.Initialize(-13, id_Bsn, FisOwn, AReadOnly, AShowToolBar, true, true, true, UID, FAllRepr);
  end
  else
  begin
    if id_Group = Null then
      id_Group := -2;
    fCAGroupList1.Initialize(id_Group, id_Bsn, FisOwn, AReadOnly, AShowToolBar, true, true, true, UID, FAllRepr);
    CA_ID := id_Ca;
  end;
  Repr_ID := Aid_Repr;
end;

end.
