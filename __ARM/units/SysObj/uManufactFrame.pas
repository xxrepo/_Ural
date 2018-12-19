unit uManufactFrame;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, ImgList, Db, DBClient,
  ActnList,
  foMyFunc, Menus, StdCtrls, ExtCtrls, frMNGroup, Registry;

type
  TManufactFrame = class(TFrame)
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
    Panel1: TPanel;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    fMNGroup1: TfMNGroup;
    cdsManufactsid_Manufact: TAutoIncField;
    cdsManufactsid_business: TIntegerField;
    cdsManufactsName: TStringField;
    cdsManufactsAddr: TStringField;
    cdsManufactsDisabled: TBooleanField;
    cdsManufactsID_Main: TIntegerField;
    cdsManufactsLastUpdated: TBytesField;
    cdsManufactsNeedSend: TBooleanField;
    cdsManufactsid_Manufact_Group: TIntegerField;
    cdsManufactsBusinessName: TStringField;
    cdsManufactsGroupName: TStringField;
    Action1: TAction;
    N4: TMenuItem;
    ToolBar5: TToolBar;
    aSetGrp: TAction;
    aSelAll: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    aExcelExp: TAction;
    Excel1: TMenuItem;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
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
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure fMNGroup1OrgTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure RxDBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure aSelAllExecute(Sender: TObject);
    procedure aSetGrpExecute(Sender: TObject);
    procedure aExcelExpExecute(Sender: TObject);
    procedure cdsManufactsFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
   procedure CheckEmptyDS;
    procedure GetList;
  public
    { Public declarations }
    ReadOnly:boolean;
    Id_Business:Variant;
    procedure Init(AID : Variant; AId_Business:Variant; AReadOnly:boolean=false; ShowToolBar:boolean=false);
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation
    uses uDM, uNSIDetailFormsAPI, uFormApi_CA;

{$R *.DFM}
constructor TManufactFrame.Create(AOwner:TComponent);
var TmpOwner: TCustomForm;
    Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
begin
  inherited;
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
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
end;

destructor TManufactFrame.Destroy;
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

procedure TManufactFrame.Init(AID : Variant; AId_Business:Variant; AReadOnly:boolean=false; ShowToolBar:boolean=false);
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
    fMNGroup1.Initialize(RxDBGrid1, Null, AId_Business, AReadOnly, ShowToolBar)
  end
  else
  begin
    if DM.rsCA.AppServer.UNSel_ManufBsn(AID, ID_Bsn, id_Group) = 1 then
    begin
      ID_Business:=ID_Bsn;
      fMNGroup1.Initialize(RxDBGrid1, id_Group, ID_Business, AReadOnly, ShowToolBar);
      cdsManufacts.Locate('id_Manufact', AID, []);
    end;
  end;
  ToolBar5.Visible:=ShowToolBar;
  if ReadOnly then
  begin
    aAdd.Enabled:=False;
    aDel.Enabled:=False;
  end;
end;

procedure TManufactFrame.aAddExecute(Sender: TObject);
var
 ID, id_Group:Variant;
begin
  if (fMNGroup1.OrgTreeView.Selected <> nil) and (TObject(fMNGroup1.OrgTreeView.Selected.Data) is TNodeObj) then
  begin
    if TNodeObj(fMNGroup1.OrgTreeView.Selected.Data).ID = -2 then
      id_Group := -1
    else
      id_Group := TNodeObj(fMNGroup1.OrgTreeView.Selected.Data).ID;
 end;
 ID:=-1;
 if ShowManufactDetailForm(ID, ReadOnly, Id_Business, id_Group) then
  begin
   aRefreshExecute(nil);
   cdsManufacts.Locate('id_Manufact', Id, [loCaseInsensitive]);
  end;
end;

procedure TManufactFrame.aEditExecute(Sender: TObject);
var
 ID:Variant;
begin
 ID:=cdsManufacts.FieldByName('id_Manufact').Value ;
 if ShowManufactDetailForm(ID, ReadOnly) then
 aRefreshExecute(nil);
 cdsManufacts.Locate('id_Manufact', Id, [loCaseInsensitive]);
end;

procedure TManufactFrame.aRefreshExecute(Sender: TObject);
var
  id, OldRecNo :Integer;
begin
  with cdsManufacts do
  begin
     if Active and not IsEmpty then
       OldRecNo := RecNo
     else
       OldRecNo := -1;
    Id:=FieldByName('id_Manufact').AsInteger;
    Close;
    Open;
    if not Locate('id_Manufact', Id, [loCaseInsensitive]) and (OldRecNo <> -1) then
    begin
      if (OldRecNo <= RecordCount) then
        RecNo := OldRecNo
      else
        Last;
    end;
  end;
end;

procedure TManufactFrame.aDelExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if RxDBGrid1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(RxDBGrid1.SelectedRows.Count) + ' производств?'
  else
    S := 'Удалить производство?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if RxDBGrid1.SelectedRows.Count > 0 then
      begin
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
          DM.rsCA.AppServer.MN_Del(RxDBGrid1.DataSource.DataSet.FieldByName('id_Manufact').AsInteger);
        end;
      end
      else
        DM.rsCA.AppServer.MN_Del(RxDBGrid1.DataSource.DataSet.FieldByName('id_Manufact').AsInteger);
    finally
      aRefresh.Execute;
    end;
  end;
end;

procedure TManufactFrame.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').Value then
    begin
      AFont.Color := clGray;
      AFont.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;
end;

procedure TManufactFrame.FrameDblClick(Sender: TObject);
begin
 aEditExecute(nil);
end;

procedure TManufactFrame.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TManufactFrame.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TManufactFrame.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TManufactFrame.FilterEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TManufactFrame.FilterEditChange(Sender: TObject);
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
  CheckEmptyDS;
end;
procedure TManufactFrame.CheckEmptyDS;
begin
 if cdsManufacts.IsEmpty then
  begin
    aEdit.Enabled:=False;
    aDel.Enabled:=False;
  end
  else
  begin
    aEdit.Enabled:=True;
  if not ReadOnly then  
    aDel.Enabled:=True;
  end;
end;

procedure TManufactFrame.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
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

procedure TManufactFrame.fMNGroup1OrgTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  fMNGroup1.OrgTreeViewChange(Sender, Node);

  GetList;
end;

procedure TManufactFrame.GetList;
var id_Group : Variant;
begin
  cdsManufacts.Close;
  if (fMNGroup1.OrgTreeView.Selected <> nil) and (TObject(fMNGroup1.OrgTreeView.Selected.Data) is TNodeObj) then
  begin
    if TNodeObj(fMNGroup1.OrgTreeView.Selected.Data).ID = -2 then
      id_Group := Null
    else
      id_Group := TNodeObj(fMNGroup1.OrgTreeView.Selected.Data).ID;
      
    cdsManufacts.Params.ParamByName('@ID_Business').Value := TNodeObj(fMNGroup1.OrgTreeView.Selected.Data).IDBsn;
    cdsManufacts.Params.ParamByName('@id_Group').Value := id_Group;
    cdsManufacts.Open;
  end
end;

procedure TManufactFrame.RxDBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if (ssLeft in Shift) and (THackGrid(Sender).RowHeights[0] < Y) then
    (Sender as TDBGrid).BeginDrag(true);
end;

procedure TManufactFrame.DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  aExcelExp.Enabled := not cdsManufacts.IsEmpty;
  aEdit.Enabled := not cdsManufacts.IsEmpty and not ReadOnly;
  aDel.Enabled := not cdsManufacts.IsEmpty and not ReadOnly;
  aSetGrp.Enabled := not cdsManufacts.IsEmpty and not ReadOnly;
  ShowText('Всего производств: ' + IntToStr((Sender as TDataSource).DataSet.RecordCount), 1);
end;

procedure TManufactFrame.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TManufactFrame.aSetGrpExecute(Sender: TObject);
var ASelectedObj : TSelectedObj;
    i : integer;
begin
  ASelectedObj.ID := -1;
  if SelectUnGroup(eotManufGroup, ID_Business, ASelectedObj.ID, ASelectedObj.Name, false, true) then
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
            DM.rsCA.AppServer.xxx_SetGrp(2, RxDBGrid1.DataSource.DataSet.FieldByName('id_Manufact').AsInteger, ASelectedObj.ID);
          end;
        end
        else
          DM.rsCA.AppServer.xxx_SetGrp(2, RxDBGrid1.DataSource.DataSet.FieldByName('id_Manufact').AsInteger, ASelectedObj.ID);
      finally
        RxDBGrid1.DataSource.DataSet.EnableControls;
        fMNGroup1.aRefreshe.Execute;
        aRefresh.Execute;
      end;
    end;
  end;
end;

procedure TManufactFrame.aExcelExpExecute(Sender: TObject);
begin
  GreedToExcel(RxDBGrid1, 'Производства');
end;

procedure TManufactFrame.cdsManufactsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

end.
