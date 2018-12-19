unit frReprListLC;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, db, ActnList, DBClient, registry, ComCtrls,
  ToolWin, Menus, StdCtrls, ExtCtrls, frReprGroup;

type
  TfReprListLC = class(TFrame)
    ActionList1: TActionList;
    aNew: TAction;
    aProperty: TAction;
    aArc: TAction;
    cdsPepr: TClientDataSet;
    dsCAgent: TDataSource;
    aRefreshe: TAction;
    aDelete: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    cdsPeprid_Repr: TAutoIncField;
    cdsPeprid_ContrAgent: TIntegerField;
    cdsPeprisJur: TBooleanField;
    cdsPeprDisabled: TBooleanField;
    cdsPeprName: TStringField;
    cdsPeprCAName: TStringField;
    cdsPeprId_Currency: TIntegerField;
    cdsPeprCurrencyName: TStringField;
    cdsPeprid_business: TIntegerField;
    cdsPeprID_Main: TIntegerField;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    fGroup: TfReprGroup;
    cdsPeprNeedSend: TBooleanField;
    cdsPeprGroupName: TStringField;
    cdsPeprid_Repr_Group: TIntegerField;
    cdsPeprBusinessName: TStringField;
    aSetGrp: TAction;
    aSelAll: TAction;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Splitter1: TSplitter;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure aNewExecute(Sender: TObject);
    procedure aPropertyExecute(Sender: TObject);
    procedure aArcExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure dsCAgentDataChange(Sender: TObject; Field: TField);
    procedure FilterEditChange(Sender: TObject);
    procedure RxDBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure fReprGroup1OrgTreeViewChange(Sender: TObject;
      Node: TTreeNode);
    procedure aSetGrpExecute(Sender: TObject);
    procedure aSelAllExecute(Sender: TObject);
    procedure cdsPeprFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    FReadOnly : boolean;
    FShowToolBar : boolean;

    FDisabled : Variant;
    FID_Business : OleVariant;
    
    function GetRepr_ID: Variant;
    function GetRepr_Name: String;
    procedure SetRepr_ID(const Value: Variant);
    procedure GetList(Node: TTreeNode);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Initialize(AID, Disabled : Variant; AID_Business : Variant;
                   AReadOnly : boolean = false; AShowToolBar : boolean = true; AShowBsn : boolean = false);
    property Repr_ID : Variant read GetRepr_ID write SetRepr_ID;
    property Repr_Name : String read GetRepr_Name;
  end;

implementation

uses uDM, foMyFunc, uReprPropLC, uFormApi_CA;

{$R *.DFM}

procedure TfReprListLC.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfReprListLC.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aProperty.Execute;
end;

procedure TfReprListLC.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfReprListLC.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;
    
  if (Column.Field is TBooleanField) then
  begin
    if Column.Field.AsBoolean then
      Style := DFCS_CHECKED
    else
      Style := DFCS_BUTTONCHECK;

    R := Rect;
    cbSize := 15;
    if R.Bottom - R.Top > cbSize then
    begin
      R.Top := R.Top + (R.Bottom - R.Top - cbSize) div 2;
      R.Bottom := R.Top + cbSize;
    end;
    if R.Right - R.Left < cbSize then
    begin
      R.Right := R.Left + cbSize;
    end;

    if gdSelected in State then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clHighlight;
      TDBGrid(Sender).Canvas.FillRect(Rect);
    end;
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, Style);
  end
  else
  begin
    if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').AsBoolean then
    begin
      (Sender as TDBGrid).Canvas.Font.Color := clGray;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('id_Main').IsNull then
  begin
 //   if not (gdSelected in State) then
 ///     (Sender as TDBGrid).Canvas.Font.Color := colorNonViza;
    (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
  end;
    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfReprListLC.aNewExecute(Sender: TObject);
var ID, id2 : Variant;
    isOwn : boolean;
begin
  ID := -1;
  id2 := Null;
  if EditReprPropLC(ID, fGroup.GetBsnID, fGroup.ID) then
  begin
    with cdsPepr do
    begin
      Close;
      Open;
      Locate('id_Repr', ID, []);
    end;
  end;  
end;

procedure TfReprListLC.aPropertyExecute(Sender: TObject);
var ID, ID2 : Variant;
    isOwn : boolean;
begin
  id2 := Null;
  ID :=  cdsPepr.fieldbyName('id_Repr').AsInteger;

  if EditReprPropLC(ID, Null, fGroup.ID) then
  begin
    aRefreshe.Execute;
  end;  
end;

procedure TfReprListLC.aArcExecute(Sender: TObject);
begin
//*
end;


procedure TfReprListLC.Initialize(AID, Disabled : Variant; AID_Business : Variant;
                               AReadOnly : boolean; AShowToolBar : boolean; AShowBsn : boolean);
var id_Group : OleVariant;
   isOwn: WordBool;
   id_CAGroup, id_Ca: OleVariant;
begin
  RxDBGrid1.Columns[2].Visible := AShowBsn;
  FReadOnly := AReadOnly;
  aNew.Enabled := not AReadOnly;
  ToolBar1.Visible:=AShowToolBar;

   if VarIsEmpty(AID) or (AID = Null) then
  begin
    FID_Business:=-1;
    if AId_Business<>NULL then
    begin
      FID_Business:=AId_Business;
    end;
    fGroup.Initialize(RxDBGrid1, Null, FId_Business, AReadOnly, AShowToolBar)
  end
  else
    Repr_ID := AID;
end;

constructor TfReprListLC.Create(AOwner: TComponent);
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
    TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, true) then
    begin
      if Reg.ValueExists('Panel2Width') then
        Panel2.Width := Reg.ReadInteger('Panel2Width');
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
{$IFDEF LC}
  aDelete.Visible := false;
{$ENDIF}
end;

destructor TfReprListLC.Destroy;
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
    TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, true) then
    begin
      Reg.WriteInteger('Panel2Width', Panel2.Width);
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  inherited;
end;

procedure TfReprListLC.aRefresheExecute(Sender: TObject);
var OldID : integer;
begin
  OldID := cdsPepr.fieldbyName('id_Repr').AsInteger;
  try
    with cdsPepr do
    begin
      Close;
      Open;
      Locate('id_Repr', OldID, []);
    end;
  finally

  end;
//*
end;

procedure TfReprListLC.aDeleteExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Удалить представителя?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    if DM.rsCA.AppServer.CA_ReprDel(Repr_ID) = 1 then
      aRefreshe.Execute;
  end;
end;

procedure TfReprListLC.dsCAgentDataChange(Sender: TObject;
  Field: TField);
begin
  aProperty.Enabled := not (Sender as TDataSource).DataSet.IsEmpty and not FReadOnly
                   and ((Sender as TDataSource).DataSet.FieldByName('ID_Main').IsNull);
  aArc.Enabled := not (Sender as TDataSource).DataSet.IsEmpty and not FReadOnly;
  aDelete.Enabled := not (Sender as TDataSource).DataSet.IsEmpty and not FReadOnly
                   and ((Sender as TDataSource).DataSet.FieldByName('ID_Main').IsNull);
  aSetGrp.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
end;

function TfReprListLC.GetRepr_ID: Variant;
begin
  Result := cdsPepr.FieldByName('id_Repr').Value;
end;

function TfReprListLC.GetRepr_Name: String;
begin
  Result := cdsPepr.FieldByNAme('Name').AsString;
end;

procedure TfReprListLC.SetRepr_ID(const Value: Variant);
var
   ID_Business : OleVariant;
   id_Group : OleVariant;
   isOwn: WordBool;                       
   id_CAGroup, id_Ca: OleVariant;
begin
  ID_Business:=-1;
  if VarIsEmpty(Value) or (Value = Null) then
  begin
    
  end
  else
  begin
    if DM.rsCA.AppServer.UNSel_ReprBsn_v2(Value, isOwn, id_CAGroup, id_Ca, id_Group, ID_Business) = 1 then
    begin
      fGroup.Initialize(RxDBGrid1, id_Group, ID_Business, FReadOnly, FShowToolBar);
      cdsPepr.Locate('id_Repr', Value, []);
    end;
  end;
end;

procedure TfReprListLC.FilterEditChange(Sender: TObject);
begin
  with cdsPepr   do
  begin
    DisableControls;
    try
      Filtered := False;
      FilterOptions := [foCaseInsensitive];
      Filtered := Trim(FilterEdit.Text) <> '';
    finally
      EnableControls;
    end;
  end;
end;

procedure TfReprListLC.RxDBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if (ssLeft in Shift) and (THackGrid(Sender).RowHeights[0] < Y) then
    (Sender as TDBGrid).BeginDrag(true);
end;

procedure TfReprListLC.fReprGroup1OrgTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  fGroup.OrgTreeViewChange(Sender, Node);

  GetList(Node);
end;

procedure TfReprListLC.GetList(Node: TTreeNode);
var id_Group : Variant;
begin
  cdsPepr.Close;
  if (Node <> nil) and (TObject(Node.Data) is TNodeObj) then
  begin
    if TNodeObj(Node.Data).ID = -2 then
      id_Group := Null
    else
      id_Group := TNodeObj(Node.Data).ID;

    cdsPepr.Params.ParamByName('@id_ContrAgent').Value := Null;
    cdsPepr.Params.ParamByName('@Disabled').Value := false;

    cdsPepr.Params.ParamByName('@id_Bsn').Value := TNodeObj(Node.Data).IDBsn;
    cdsPepr.Params.ParamByName('@id_Group').Value := id_Group;
    cdsPepr.Open;
  end;
end;

procedure TfReprListLC.aSetGrpExecute(Sender: TObject);
var ASelectedObj : TSelectedObj;
    i : integer;
begin
  ASelectedObj.ID := -1;
  if SelectUnGroup(eotReprGroup, FID_Business, ASelectedObj.ID, ASelectedObj.Name, false, true) then
  begin
    if RxDBGrid1.SelectedRows.Count > 0 then
    begin
      for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
      begin
        RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
        DM.rsCA.AppServer.xxx_SetGrp(1, RxDBGrid1.DataSource.DataSet.FieldByName('id_Repr').AsInteger, ASelectedObj.ID);
      end;
    end
    else
      DM.rsCA.AppServer.xxx_SetGrp(1, RxDBGrid1.DataSource.DataSet.FieldByName('id_Repr').AsInteger, ASelectedObj.ID);
    fGroup.aRefreshe.Execute;
    aRefreshe.Execute;
  end;
end;

procedure TfReprListLC.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TfReprListLC.cdsPeprFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

end.
