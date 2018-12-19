unit frManufactList;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, ImgList, Db, DBClient,
  ActnList,
  foMyFunc, Menus, StdCtrls, ExtCtrls, Registry, frMNGroup;

type
  TfManufactList = class(TFrame)
    DataSource: TDataSource;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    cdsManufacts: TClientDataSet;
    ImageList: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    cdsManufactsid_Manufact: TAutoIncField;
    cdsManufactsid_business: TIntegerField;
    cdsManufactsName: TStringField;
    cdsManufactsBusinessName: TStringField;
    N5: TMenuItem;
    cdsManufactsID_Main: TIntegerField;
    Panel1: TPanel;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    Splitter1: TSplitter;
    fGroup: TfMNGroup;
    cdsManufactsid_Manufact_Group: TIntegerField;
    cdsManufactsGroupName: TStringField;
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
    procedure FrameDblClick(Sender: TObject);
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
    procedure cdsManufactsFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    procedure GetList(Node: TTreeNode);
    { Private declarations }
  public
    { Public declarations }
    ReadOnly:boolean;
    Id_Business:Variant;
    function Init(AID_Business, Aid_User, AUID:Variant; AReadOnly:boolean=false; ShowToolBar:boolean=false; AShowBsn : boolean = false):boolean;
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation
    uses uDM, uInputBox_LCObj, uFormApi_CA;

{$R *.DFM}
constructor TfManufactList.Create(AOwner:TComponent);
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

destructor TfManufactList.Destroy;
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

function TfManufactList.Init(AID_Business, Aid_User, AUID:Variant; AReadOnly:boolean=false; ShowToolBar:boolean=false; AShowBsn : boolean = false):boolean;
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
    if DM.rsCA.AppServer.UNSel_ManufBsn(AUID, ID_Bsn, id_Group) = 1 then
    begin
      ID_Business:=ID_Bsn;
      fGroup.Initialize(RxDBGrid1, id_Group, ID_Business, AReadOnly, ShowToolBar);
      cdsManufacts.Locate('id_Manufact', AUID, []);
    end;
  end;
end;

procedure TfManufactList.aAddExecute(Sender: TObject);
var
  ID:Variant;
  S : String;
  id_Bsn, id_Group : Variant;
begin
  ID:=-1;
  id_Group := fGroup.ID;
  if InputBox_LCObj(eotManuf, 'Новое производство - бизнес "' + DM.GetBusinessName(ID_Business) + '"', S, id_Group, ID_Business) then
  begin
    if ID_Business = -1 then
      id_Bsn := Null
    else
      id_Bsn := ID_Business;
      
    ID := DM.rsCA.AppServer.LC_MN_Add(S, id_Bsn, id_Group);
    with cdsManufacts do
    begin
      Close;
      Open;
      Locate('id_Manufact', ID, []);
    end;
  end;
end;

procedure TfManufactList.aEditExecute(Sender: TObject);
var
  ID:Variant;
  S : String;
  id_Bsn, id_Group : Variant;
begin
  ID := cdsManufacts.FieldByName('id_Manufact').Value ;
  S := cdsManufacts.FieldByName('Name').Value ;
  id_Group := cdsManufacts.FieldByName('id_Manufact_Group').Value;
  if InputBox_LCObj(eotManuf, 'Счет', S, id_Group, ID_Business) then
  begin
    if DM.rsCA.AppServer.LC_MN_Edit(ID, S, id_Group) = 1 then
      with cdsManufacts do
      begin
        Close;
        Open;
        Locate('id_Manufact', ID, []);
      end;
  end;
end;

procedure TfManufactList.aRefreshExecute(Sender: TObject);
 var
  id:Integer;
begin
 with cdsManufacts do
  begin
   Id:=FieldByName('id_Manufact').AsInteger;
   Close;
   Open;
   Locate('id_Manufact', Id, [loCaseInsensitive]);
  end;
end;

procedure TfManufactList.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
{  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').Value then
    begin
      AFont.Color := clGray;
      AFont.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;  }
end;

procedure TfManufactList.FrameDblClick(Sender: TObject);
begin
 aEditExecute(nil);
end;

procedure TfManufactList.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfManufactList.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfManufactList.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfManufactList.FilterEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfManufactList.FilterEditChange(Sender: TObject);
begin
  with cdsManufacts   do
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

procedure TfManufactList.DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  aEdit.Enabled := not cdsManufacts.IsEmpty and not ReadOnly
                   and (cdsManufacts.FieldByName('ID_Main').IsNull);
  aDel.Enabled := not cdsManufacts.IsEmpty and not ReadOnly
                   and (cdsManufacts.FieldByName('ID_Main').IsNull);
  aSetGrp.Enabled := not cdsManufacts.IsEmpty and not ReadOnly;
end;

procedure TfManufactList.RxDBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfManufactList.RxDBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if (ssLeft in Shift) and (THackGrid(Sender).RowHeights[0] < Y) then
    (Sender as TDBGrid).BeginDrag(true);
end;

procedure TfManufactList.fGroupOrgTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  fGroup.OrgTreeViewChange(Sender, Node);

  GetList(Node);
end;

procedure TfManufactList.GetList(Node: TTreeNode);
var id_Group : Variant;
begin
  cdsManufacts.Close;
  if (Node <> nil) and (TObject(Node.Data) is TNodeObj) then
  begin
    if TNodeObj(Node.Data).ID = -2 then
      id_Group := Null
    else
      id_Group := TNodeObj(Node.Data).ID;
      
    cdsManufacts.Params.ParamByName('@ID_Business').Value := TNodeObj(Node.Data).IDBsn;
    cdsManufacts.Params.ParamByName('@id_Group').Value := id_Group;
    cdsManufacts.Open;
  end;
end;

procedure TfManufactList.aSetGrpExecute(Sender: TObject);
var ASelectedObj : TSelectedObj;
    i : integer;
begin
  ASelectedObj.ID := -1;
  if SelectUnGroup(eotManufGroup, ID_Business, ASelectedObj.ID, ASelectedObj.Name, false, true) then
  begin
    if RxDBGrid1.SelectedRows.Count > 0 then
    begin
      for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
      begin
        RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
        DM.rsCA.AppServer.xxx_SetGrp(2, RxDBGrid1.DataSource.DataSet.FieldByName('id_Manufact').AsInteger, ASelectedObj.ID);
      end;
    end
    else
      DM.rsCA.AppServer.xxx_SetGrp(2, RxDBGrid1.DataSource.DataSet.FieldByName('id_Manufact').AsInteger, ASelectedObj.ID);
    fGroup.aRefreshe.Execute;
    aRefresh.Execute;
  end;
end;

procedure TfManufactList.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TfManufactList.cdsManufactsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

end.
