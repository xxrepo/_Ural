unit uWareHouseFrame;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, ImgList, ActnList, Db,
  DBClient,
  foMyFunc, Menus, StdCtrls, ExtCtrls, frWHGroup, Registry;

type
  TWareHouseFrame = class(TFrame)
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
    cdsWareHousesid_Warehouse: TAutoIncField;
    cdsWareHousesid_business: TIntegerField;
    cdsWareHousesName: TStringField;
    cdsWareHousesAddr: TStringField;
    cdsWareHousesDisabled: TBooleanField;
    cdsWareHousesLastUpdated: TBytesField;
    cdsWareHousesID_Main: TIntegerField;
    cdsWareHousesBusinessName: TStringField;
    cdsWareHousesNeedSend: TBooleanField;
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
    fWHGroup1: TfWHGroup;
    cdsWareHousesid_Warehouse_Group: TIntegerField;
    cdsWareHousesGroupName: TStringField;
    N4: TMenuItem;
    aExport: TAction;
    aSetGrp: TAction;
    aSelAll: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    aExcelExp: TAction;
    Excel1: TMenuItem;
    Splitter1: TSplitter;
    aWHMow: TAction;
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
    procedure cdsWareHousesAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure fWHGroup1OrgTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure aExportExecute(Sender: TObject);
    procedure aSetGrpExecute(Sender: TObject);
    procedure aSelAllExecute(Sender: TObject);
    procedure aExcelExpExecute(Sender: TObject);
    procedure cdsWareHousesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure aWHMowExecute(Sender: TObject);
  private
    { Private declarations }
    procedure CheckEmptyDS;
    procedure GetList;
  public
    { Public declarations }
    ReadOnly:boolean;
    ID_Business:Integer;
    function Init (AID : Variant; AId_Business:Variant; AReadOnly:boolean=false; AShowToolBar:boolean=false):boolean;
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation
    uses uDM, uNSIDetailFormsAPI, uFormApi_CA, uMovWH;
{$R *.DFM}
constructor TWareHouseFrame.Create(AOwner:TComponent);
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
end;

destructor TWareHouseFrame.Destroy;
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

function TWareHouseFrame.Init(AID : Variant; AId_Business:Variant; AReadOnly:boolean=false; AShowToolBar:boolean=false):boolean;
var
   v:string;
   ID_Bsn : OleVariant;
   id_Group : OleVariant;
begin
  ReadOnly:=AReadOnly;
  if AID = Null then
  begin
    ID_Business:=-1;
    if AId_Business<>NULL then
    begin
      ID_Business:=AId_Business;
    end;
    fWHGroup1.Initialize(RxDBGrid1, Null, AId_Business, AReadOnly, AShowToolBar)
  end
  else
  begin
    if DM.rsCA.AppServer.UNSel_WHBsn(AID, ID_Bsn, id_Group) = 1 then
    begin
      ID_Business:=ID_Bsn;
      fWHGroup1.Initialize(RxDBGrid1, id_Group, ID_Business, AReadOnly, AShowToolBar);
      cdsWareHouses.Locate('id_WareHouse', AID, []);
    end;
  end;
  ToolBar.Visible:=AShowToolBar;
  if ReadOnly then
  begin
    aAdd.Enabled:=False;
    aDel.Enabled:=False;
  end;
end;

procedure TWareHouseFrame.aAddExecute(Sender: TObject);
var
 ID, id_Group:Variant;
begin
  if (fWHGroup1.OrgTreeView.Selected <> nil) and (TObject(fWHGroup1.OrgTreeView.Selected.Data) is TNodeObj) then
  begin
    if TNodeObj(fWHGroup1.OrgTreeView.Selected.Data).ID = -2 then
      id_Group := -1
    else
      id_Group := TNodeObj(fWHGroup1.OrgTreeView.Selected.Data).ID;
 end;
 ID:=-1;
 if ShowWareHouseDetailForm(ID, ReadOnly, Id_Business, id_Group) then
  begin
   aRefreshExecute(nil);
   cdsWareHouses.Locate('id_WareHouse', Id, [loCaseInsensitive]);
  end;
end;

procedure TWareHouseFrame.aEditExecute(Sender: TObject);
var
 ID:Variant;
begin
 ID:=cdsWareHouses.FieldByname('id_WareHouse').Value;
 if ShowWareHouseDetailForm(ID, ReadOnly,Id_Business) then
 aRefreshExecute(nil);
 cdsWareHouses.Locate('id_WareHouse', Id, [loCaseInsensitive]);
end;

procedure TWareHouseFrame.aDelExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if RxDBGrid1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(RxDBGrid1.SelectedRows.Count) + ' складов?'
  else
    S := 'Удалить склад?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if RxDBGrid1.SelectedRows.Count > 0 then
      begin
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
          DM.rsCA.AppServer.WH_Del(RxDBGrid1.DataSource.DataSet.FieldByName('id_WareHouse').AsInteger);
        end;
      end
      else
        DM.rsCA.AppServer.WH_Del(RxDBGrid1.DataSource.DataSet.FieldByName('id_WareHouse').AsInteger);
    finally
      aRefresh.Execute;
    end;
  end;
end;

procedure TWareHouseFrame.aRefreshExecute(Sender: TObject);
var
  id, OldRecNo :Integer;
begin
  with cdsWareHouses do
  begin
     if Active and not IsEmpty then
       OldRecNo := RecNo
     else
       OldRecNo := -1;
    Id:=FieldByName('id_WareHouse').AsInteger;
    Close;
    Open;
    if not Locate('id_WareHouse', Id, [loCaseInsensitive]) and (OldRecNo <> -1) then
    begin
      if (OldRecNo <= RecordCount) then
        RecNo := OldRecNo
      else
        Last;
    end;
  end;
end;

procedure TWareHouseFrame.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').Value then
    begin
      AFont.Color := clGray;
      AFont.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;
end;

procedure TWareHouseFrame.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TWareHouseFrame.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TWareHouseFrame.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TWareHouseFrame.FilterEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TWareHouseFrame.FilterEditChange(Sender: TObject);
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
   CheckEmptyDS;
end;

procedure TWareHouseFrame.CheckEmptyDS;
begin
end;


procedure TWareHouseFrame.cdsWareHousesAfterOpen(DataSet: TDataSet);
begin
 CheckEmptyDS;
end;

procedure TWareHouseFrame.RxDBGrid1DrawColumnCell(Sender: TObject;
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

procedure TWareHouseFrame.RxDBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if (ssLeft in Shift) and (THackGrid(Sender).RowHeights[0] < Y) then
    (Sender as TDBGrid).BeginDrag(true);
end;

procedure TWareHouseFrame.DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  aWHMow.Enabled := not cdsWareHouses.IsEmpty;
  aExcelExp.Enabled := not cdsWareHouses.IsEmpty;
  aEdit.Enabled := not cdsWareHouses.IsEmpty and not ReadOnly;
  aDel.Enabled := not cdsWareHouses.IsEmpty and not ReadOnly;
  aSetGrp.Enabled := not cdsWareHouses.IsEmpty  and not ReadOnly;
  ShowText('Всего складов: ' + IntToStr((Sender as TDataSource).DataSet.RecordCount), 1);
end;

procedure TWareHouseFrame.fWHGroup1OrgTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  fWHGroup1.OrgTreeViewChange(Sender, Node);

  GetList;
end;

procedure TWareHouseFrame.GetList;
var id_Group : Variant;
begin
  cdsWareHouses.Close;
  if (fWHGroup1.OrgTreeView.Selected <> nil) and (TObject(fWHGroup1.OrgTreeView.Selected.Data) is TNodeObj) then
  begin
    if TNodeObj(fWHGroup1.OrgTreeView.Selected.Data).ID = -2 then
      id_Group := Null
    else
      id_Group := TNodeObj(fWHGroup1.OrgTreeView.Selected.Data).ID;

    cdsWareHouses.Params.ParamByName('@ID_Business').Value := TNodeObj(fWHGroup1.OrgTreeView.Selected.Data).IDBsn;
    cdsWareHouses.Params.ParamByName('@id_Group').Value := id_Group;
    cdsWareHouses.Open;
  end
end;

procedure TWareHouseFrame.aExportExecute(Sender: TObject);
begin
//*
end;

procedure TWareHouseFrame.aSetGrpExecute(Sender: TObject);
var ASelectedObj : TSelectedObj;
    i : integer;
begin
  ASelectedObj.ID := -1;
  if SelectUnGroup(eotWHGroup, ID_Business, ASelectedObj.ID, ASelectedObj.Name, false, true) then
  begin
    if RxDBGrid1.SelectedRows.Count > 0 then
    begin
      try
        RxDBGrid1.DataSource.DataSet.DisableControls;
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
      finally
        RxDBGrid1.DataSource.DataSet.EnableControls;
        fWHGroup1.aRefreshe.Execute;
        aRefresh.Execute;
      end;
    end;
  end;
end;

procedure TWareHouseFrame.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TWareHouseFrame.aExcelExpExecute(Sender: TObject);
begin
  GreedToExcel(RxDBGrid1, 'Склады');
end;

procedure TWareHouseFrame.cdsWareHousesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

procedure TWareHouseFrame.aWHMowExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_Warehouse := cdsWareHousesid_Warehouse.AsInteger;
  ShowMovWH(AParamBlnc, true);
end;

end.
