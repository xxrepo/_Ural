unit frAccList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, ActnList, ImgList, Db,
  DBClient,
  foMyFunc, Menus, ExtCtrls, StdCtrls, frAccGroup, Registry;

type
  TfAccList = class(TFrame)
    DataSource: TDataSource;
    ImageList: TImageList;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cdsAccs: TClientDataSet;
    cdsAccsid_Acc: TAutoIncField;
    cdsAccsid_business: TIntegerField;
    cdsAccsName: TStringField;
    cdsAccsBusinessName: TStringField;
    N4: TMenuItem;
    aAccCard: TAction;
    cdsAccsDisabled: TBooleanField;
    cdsAccsID_Main: TIntegerField;
    N5: TMenuItem;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    Panel2: TPanel;
    aAddRgp: TAction;
    aEditRgp: TAction;
    aDelRgp: TAction;
    aRefreshRgp: TAction;
    fGroup: TfAccGroup;
    Splitter1: TSplitter;
    cdsAccsGroupName: TStringField;
    cdsAccsid_Acc_Group: TAutoIncField;
    aSetGrp: TAction;
    aSelAll: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
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
    procedure aAccCardExecute(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure fAccGroup1OrgTreeViewChange(Sender: TObject;
      Node: TTreeNode);
    procedure aSetGrpExecute(Sender: TObject);
    procedure aSelAllExecute(Sender: TObject);
    procedure cdsAccsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    ReadOnly:boolean;
    procedure GetList(Node: TTreeNode);
  public
    { Public declarations }

    ID_Business:Variant;
    function Init(AID_Business, Aid_User, AUID:Variant; AReadOnly:boolean=false; ShowToolBar:boolean=false; AShowBsn : boolean = false):boolean;
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation
    uses uDM, uInputBox_LCObj, uFormApi_CA;

{$R *.DFM}

constructor TfAccList.Create(AOwner:TComponent);
var TmpOwner: TCustomForm;
    Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
begin
  inherited;
  ID_Business := -1;
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
end;

destructor TfAccList.Destroy;
var TmpOwner: TCustomForm;
    Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
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

function TfAccList.Init(AID_Business, Aid_User, AUID :Variant; AReadOnly:boolean; ShowToolBar:boolean; AShowBsn : boolean):boolean;
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
    if DM.rsCA.AppServer.UNSel_AccBsn(AUID, ID_Bsn, id_Group) = 1 then
    begin
      ID_Business:=ID_Bsn;
      fGroup.Initialize(RxDBGrid1, id_Group, ID_Business, AReadOnly, ShowToolBar);
      cdsAccs.Locate('id_Acc', AUID, []);
    end;
  end;
end;

procedure TfAccList.aAddExecute(Sender: TObject);
var
  ID:Variant;
  S : String;
  id_Bsn, id_Group : Variant;
begin
  ID:=-1;
  id_Group := fGroup.ID;
  if DM.FisPPP and not (id_Group > 0) then
  begin
    raise Exception.Create('Вы можете создавать счета только в доступных вам группах.');
  end;
  if InputBox_LCObj(eotFin, 'Новый счет - бизнес "' + DM.GetBusinessName(ID_Business) + '"', S, id_Group, ID_Business) then
  begin
    if ID_Business = -1 then
      id_Bsn := Null
    else
      id_Bsn := ID_Business;
      
    ID := DM.rsCA.AppServer.LC_Acc_Add(S, id_Bsn, id_Group);
    with cdsAccs do
    begin
      Close;
      Open;
      Locate('Id_Acc', ID, []);
    end;
  end;
end;

procedure TfAccList.aEditExecute(Sender: TObject);
var
  ID:Variant;
  S : String;
  id_Bsn, id_Group : Variant;
begin
  ID := cdsAccs.FieldByName('Id_Acc').Value;
  S := cdsAccs.FieldByName('Name').Value;
  id_Group := cdsAccs.FieldByName('Id_Acc_Group').Value;
  if InputBox_LCObj(eotFin, 'Счет', S, id_Group, ID_Business) then
  begin
    if DM.rsCA.AppServer.LC_Acc_Edit(ID, S, id_Group) = 1 then
      with cdsAccs do
      begin
        Close;
        Open;
        Locate('Id_Acc', ID, []);
      end;
  end;
end;

procedure TfAccList.aDelExecute(Sender: TObject);
begin
 aRefreshExecute(nil)
end;

procedure TfAccList.aRefreshExecute(Sender: TObject);
 var
  id:Integer;
begin
 Id:=cdsAccs.FieldByName('id_Acc').AsInteger;
 cdsAccs.Close;
 cdsAccs.Open;
 cdsAccs.Locate('id_Acc', Id, [loCaseInsensitive]);
end;

procedure TfAccList.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
 { if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').Value then
    begin
      AFont.Color := clGray;
      AFont.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end; }
end;

procedure TfAccList.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfAccList.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfAccList.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfAccList.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfAccList.FilterEditChange(Sender: TObject);
begin
  with cdsAccs  do
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

procedure TfAccList.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsAccs.IsEmpty and not ReadOnly
                   and (cdsAccs.FieldByName('ID_Main').IsNull);
  aDel.Enabled := not cdsAccs.IsEmpty and not ReadOnly
                   and (cdsAccs.FieldByName('ID_Main').IsNull);
  aAccCard.Enabled := not cdsAccs.IsEmpty;
  aSetGrp.Enabled := not cdsAccs.IsEmpty;
end;

procedure TfAccList.aAccCardExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
{  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_Acc := cdsAccs.FieldByName('id_Acc').AsInteger;
  ShowAccCard(AParamBlnc);   }
end;

procedure TfAccList.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;

  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('id_Main').IsNull then
  begin
  //  if not (gdSelected in State) then
  //    (Sender as TDBGrid).Canvas.Font.Color := colorNonViza;
    (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
  end;
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfAccList.RxDBGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if (ssLeft in Shift) and (THackGrid(Sender).RowHeights[0] < Y) then
    (Sender as TDBGrid).BeginDrag(true);
end;

procedure TfAccList.fAccGroup1OrgTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  fGroup.OrgTreeViewChange(Sender, Node);

  GetList(Node);
end;

procedure TfAccList.GetList(Node: TTreeNode);
var id_Group : Variant;
begin
  cdsAccs.Close;
  if (Node <> nil) and (TObject(Node.Data) is TNodeObj) then
  begin
    if TNodeObj(Node.Data).ID = -2 then
      id_Group := Null
    else
      id_Group := TNodeObj(Node.Data).ID;
      
    cdsAccs.Params.ParamByName('@ID_Business').Value := TNodeObj(Node.Data).IDBsn;
    cdsAccs.Params.ParamByName('@id_Group').Value := id_Group;
    cdsAccs.Params.ParamByName('@id_User').Value := DM.IDUser;
    cdsAccs.Open;
  end
end;
procedure TfAccList.aSetGrpExecute(Sender: TObject);
var ASelectedObj : TSelectedObj;
    i : integer;
begin
  ASelectedObj.ID := -1;
  if SelectUnGroup(eotFinGroup, ID_Business, ASelectedObj.ID, ASelectedObj.Name, false, true) then
  begin
    if RxDBGrid1.SelectedRows.Count > 0 then
    begin
      for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
      begin
        RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
        DM.rsCA.AppServer.xxx_SetGrp(0, RxDBGrid1.DataSource.DataSet.FieldByName('id_Acc').AsInteger, ASelectedObj.ID);
      end;
    end
    else
      DM.rsCA.AppServer.xxx_SetGrp(0, RxDBGrid1.DataSource.DataSet.FieldByName('id_Acc').AsInteger, ASelectedObj.ID);
    fGroup.aRefreshe.Execute;
    aRefresh.Execute;
  end;
end;

procedure TfAccList.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TfAccList.cdsAccsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

end.
