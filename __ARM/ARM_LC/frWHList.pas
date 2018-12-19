unit frWHList;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, ImgList, ActnList, Db,
  DBClient,
  foMyFunc, Menus, StdCtrls, ExtCtrls, Registry, frWHGroup;

type
  TfWHList = class(TFrame)
    DataSource: TDataSource;
    cdsWareHouses: TClientDataSet;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    ImageList: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    cdsWareHousesid_Warehouse: TAutoIncField;
    cdsWareHousesid_business: TIntegerField;
    cdsWareHousesName: TStringField;
    cdsWareHousesBusinessName: TStringField;
    cdsWareHousesID_Main: TIntegerField;
    N5: TMenuItem;
    Panel1: TPanel;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    Splitter1: TSplitter;
    fGroup: TfWHGroup;
    cdsWareHousesid_Warehouse_Group: TIntegerField;
    cdsWareHousesGroupName: TStringField;
    aSetGrp: TAction;
    aSelAll: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure FilterEditChange(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure fGroupOrgTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure aSetGrpExecute(Sender: TObject);
    procedure aSelAllExecute(Sender: TObject);
    procedure cdsWareHousesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    ReadOnly:boolean;
    ID_Business:Variant;
    procedure GetList(Node: TTreeNode);
  public
    { Public declarations }
    function Init(AID_Business, Aid_User, AUID:Variant; AReadOnly:boolean=false; ShowToolBar:boolean=false; AShowBsn : boolean = false):boolean;
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation
    uses uDM, uInputBox_LCObj, uFormApi_CA;
{$R *.DFM}
constructor TfWHList.Create(AOwner:TComponent);
var TmpOwner: TCustomForm;
    Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
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
  aDel.Visible := false;
{$ENDIF}
end;

destructor TfWHList.Destroy;
var TmpOwner: TCustomForm;
    Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
begin
  TmpOwner := GetControlOwner(self);
  if GetControlOwner(self) is TCustomForm then
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

function TfWHList.Init(AID_Business, Aid_User, AUID:Variant; AReadOnly:boolean; ShowToolBar:boolean; AShowBsn : boolean):boolean;
var
   ID_Bsn : OleVariant;
   id_Group : OleVariant;
begin
//  if ID_Business = AID_Business then  exit;
  ID_Business:=-1;
  ReadOnly := AReadOnly;
  aAdd.Enabled := not AReadOnly;
  ToolBar.Visible:=ShowToolBar;
  RxDBGrid1.Columns[2].Visible := AShowBsn;
  if AUID = Null then
  begin
    ID_Business:=-1;
    if AId_Business<>NULL then
    begin
      ID_Business:=AId_Business;
    end;
    fGroup.Initialize(RxDBGrid1, Null, AId_Business, AReadOnly, ShowToolBar)
  end
  else
  begin
    if DM.rsCA.AppServer.UNSel_WHBsn(AUID, ID_Bsn, id_Group) = 1 then
    begin
      ID_Business:=ID_Bsn;
      fGroup.Initialize(RxDBGrid1, id_Group, ID_Business, AReadOnly, ShowToolBar);
      cdsWareHouses.Locate('id_WareHouse', AUID, []);
    end;
  end;
end;

procedure TfWHList.aAddExecute(Sender: TObject);
var
  ID:Variant;
  S : String;
  id_Bsn, id_Group : Variant;
begin
  ID:=-1;
  id_Group := fGroup.ID;
  if InputBox_LCObj(eotWH, 'Новый склад - бизнес "' + DM.GetBusinessName(ID_Business) + '"', S, id_Group, ID_Business) then
  begin
    if ID_Business = -1 then
      id_Bsn := Null
    else
      id_Bsn := ID_Business;
      
    ID := DM.rsCA.AppServer.LC_WH_Add(S, id_Bsn, id_Group);
    with cdsWareHouses do
    begin
      Close;
      Open;
      Locate('id_WareHouse', ID, []);
    end;
  end;
end;

procedure TfWHList.aEditExecute(Sender: TObject);
var
  ID:Variant;
  S : String;
  id_Bsn, id_Group : Variant;
begin
  ID := cdsWareHouses.FieldByName('id_WareHouse').Value ;
  S := cdsWareHouses.FieldByName('Name').Value ;
  id_Group := cdsWareHouses.FieldByName('id_Warehouse_Group').Value;
  if InputBox_LCObj(eotWH, 'Склад', S, id_Group, ID_Business) then
  begin
    if DM.rsCA.AppServer.LC_WH_Edit(ID, S, id_Group) = 1 then
      with cdsWareHouses do
      begin
        Close;
        Open;
        Locate('id_WareHouse', ID, []);
      end;
  end;
end;

procedure TfWHList.aRefreshExecute(Sender: TObject);
var
 Id:Integer;
begin
with cdsWareHouses do
   begin
    Id:=FieldByName('id_WareHouse').AsInteger;
    Close;
    Open;
    Locate('id_WareHouse', Id, [loCaseInsensitive]);
  end;
end;

procedure TfWHList.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
{  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').Value then
    begin
      AFont.Color := clGray;
      AFont.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;   }
end;

procedure TfWHList.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfWHList.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfWHList.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfWHList.FilterEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfWHList.FilterEditChange(Sender: TObject);
begin
  with cdsWareHouses     do
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

procedure TfWHList.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsWareHouses.IsEmpty and not ReadOnly
                   and (cdsWareHouses.FieldByName('ID_Main').IsNull);
  aDel.Enabled := not cdsWareHouses.IsEmpty and not ReadOnly
                   and (cdsWareHouses.FieldByName('ID_Main').IsNull);
  aSetGrp.Enabled := not cdsWareHouses.IsEmpty;
end;

procedure TfWHList.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var R : TRect;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;

  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('id_Main').IsNull then
  begin
 //   if not (gdSelected in State) then
 //     (Sender as TDBGrid).Canvas.Font.Color := colorNonViza;
    (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
  end;
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfWHList.RxDBGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if (ssLeft in Shift) and (THackGrid(Sender).RowHeights[0] < Y) then
    (Sender as TDBGrid).BeginDrag(true);
end;

procedure TfWHList.fGroupOrgTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  fGroup.OrgTreeViewChange(Sender, Node);

  GetList(Node);
end;

procedure TfWHList.GetList(Node: TTreeNode);
var id_Group : Variant;
begin
  cdsWareHouses.Close;
  if (Node <> nil) and (TObject(Node.Data) is TNodeObj) then
  begin
    if TNodeObj(Node.Data).ID = -2 then
      id_Group := Null
    else
      id_Group := TNodeObj(Node.Data).ID;

    cdsWareHouses.Params.ParamByName('@ID_Business').Value := TNodeObj(Node.Data).IDBsn;
    cdsWareHouses.Params.ParamByName('@id_Group').Value := id_Group;
    cdsWareHouses.Open;
  end;
end;

procedure TfWHList.aSetGrpExecute(Sender: TObject);
var ASelectedObj : TSelectedObj;
    i : integer;
begin
  ASelectedObj.ID := -1;
  if SelectUnGroup(eotWHGroup, ID_Business, ASelectedObj.ID, ASelectedObj.Name, false, true) then
  begin
    if RxDBGrid1.SelectedRows.Count > 0 then
    begin
      for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
      begin
        RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
        DM.rsCA.AppServer.xxx_SetGrp(3, RxDBGrid1.DataSource.DataSet.FieldByName('id_WareHouse').AsInteger, ASelectedObj.ID);
      end;
    end
    else
      DM.rsCA.AppServer.xxx_SetGrp(3, RxDBGrid1.DataSource.DataSet.FieldByName('id_WareHouse').AsInteger, ASelectedObj.ID);
    fGroup.aRefreshe.Execute;
    aRefresh.Execute;
  end;
end;

procedure TfWHList.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TfWHList.cdsWareHousesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

end.
