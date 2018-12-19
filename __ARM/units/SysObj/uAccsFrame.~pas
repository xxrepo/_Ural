unit uAccsFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, ActnList, ImgList, Db,
  DBClient,
  foMyFunc, Menus, ExtCtrls, StdCtrls, frAccGroup,
  Registry;

type
  TAccsFrame = class(TFrame)
    DataSource: TDataSource;
    cdsAccs: TClientDataSet;
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
    aAccCard: TAction;
    N4: TMenuItem;
    cdsAccsid_Acc: TAutoIncField;
    cdsAccsid_business: TIntegerField;
    cdsAccsName: TStringField;
    cdsAccsBank: TStringField;
    cdsAccsPrsnAccName: TStringField;
    cdsAccsCorrAccName: TStringField;
    cdsAccsINN: TStringField;
    cdsAccsBIK: TStringField;
    cdsAccsDisabled: TBooleanField;
    cdsAccsLastUpdated: TBytesField;
    cdsAccsID_Main: TIntegerField;
    cdsAccsBusinessName: TStringField;
    cdsAccsNeedSend: TBooleanField;
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
    fAccGroup1: TfAccGroup;
    Splitter1: TSplitter;
    cdsAccsid_Acc_Group: TIntegerField;
    cdsAccsGroupName: TStringField;
    aAccRep: TAction;
    N5: TMenuItem;
    N21: TMenuItem;
    aSetGrp: TAction;
    N6: TMenuItem;
    aSelAll: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    aExcelExp: TAction;
    Excel1: TMenuItem;
    aA2: TAction;
    a: TMenuItem;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
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
    procedure aAccCardExecute(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure fAccGroup1OrgTreeViewChange(Sender: TObject;
      Node: TTreeNode);
    procedure RxDBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure aAccRepExecute(Sender: TObject);
    procedure aSetGrpExecute(Sender: TObject);
    procedure aSelAllExecute(Sender: TObject);
    procedure aExcelExpExecute(Sender: TObject);
    procedure cdsAccsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure aA2Execute(Sender: TObject);
    procedure fAccGroup1MenuItem1Click(Sender: TObject);
  private
    { Private declarations }
    procedure GetList;
  public
    { Public declarations }
    ReadOnly:boolean;
    ID_Business:Integer;
    function Init(AID : Variant; AId_Business:Variant; AReadOnly:boolean=false; ShowToolBar:boolean=true):boolean;
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation
    uses uDM, uNSIDetailFormsAPI, uAccCard, uAccCard_Adv, uFormApi_CA,
  uAccCard_v2, foMyFuncEh;

{$R *.DFM}

constructor TAccsFrame.Create(AOwner:TComponent);
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

destructor TAccsFrame.Destroy;
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

function TAccsFrame.Init(AID : Variant; AId_Business:Variant; AReadOnly:boolean; ShowToolBar:boolean):boolean;
var
   v:string;
   ID_Bsn : OleVariant;
   id_Group : OleVariant;
begin
  ReadOnly:=AReadOnly;
  if (AID = Null) or (AID = -1) then
  begin
    ID_Business:=-1;
    if AId_Business<>NULL then
    begin
      ID_Business:=AId_Business;
    end;
    fAccGroup1.Initialize(RxDBGrid1, Null, AId_Business, AReadOnly, ShowToolBar)
  end
  else
  begin
    if DM.rsCA.AppServer.UNSel_AccBsn(AID, ID_Bsn, id_Group) = 1 then
    begin
      ID_Business:=ID_Bsn;
      fAccGroup1.Initialize(RxDBGrid1, id_Group, ID_Business, AReadOnly, ShowToolBar);
      cdsAccs.Locate('id_Acc', AID, []);
    end;
  end;
  ToolBar.Visible:=ShowToolBar;
  if ReadOnly then
  begin
    aAdd.Enabled:=False;
    aDel.Enabled:=False;
  end;
end;

procedure TAccsFrame.aAddExecute(Sender: TObject);
var
 ID, id_Group:Variant;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}

  if (fAccGroup1.OrgTreeView.Selected <> nil) and (TObject(fAccGroup1.OrgTreeView.Selected.Data) is TNodeObj) then
  begin
    if TNodeObj(fAccGroup1.OrgTreeView.Selected.Data).ID = -2 then
      id_Group := -1
    else
      id_Group := TNodeObj(fAccGroup1.OrgTreeView.Selected.Data).ID;
  end;
  if DM.FisPPP and not (id_Group > 0) then
  begin
    raise Exception.Create('Вы можете создавать счета только в доступных вам группах.');
  end;

  ID:=-1;
  if ShowAccsDetailForm(ID, ReadOnly, ID_Business, id_Group) then
  begin
    aRefreshExecute(nil);
    cdsAccs.Locate('Id_Acc', ID, [loCaseInsensitive]);
  end;
end;

procedure TAccsFrame.aEditExecute(Sender: TObject);
var
 ID:Variant;
begin
  ID:=cdsAccs.FieldByName('Id_Acc').Value ;
  if ShowAccsDetailForm(ID, ReadOnly) then
  begin
     //fAccGroup1.aRefreshe.Execute;
    aRefreshExecute(nil);
    cdsAccs.Locate('Id_Acc', ID, [loCaseInsensitive]);
  end;
end;

procedure TAccsFrame.aDelExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if RxDBGrid1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(RxDBGrid1.SelectedRows.Count) + ' счетов?'
  else
    S := 'Удалить счет?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if RxDBGrid1.SelectedRows.Count > 0 then
      begin
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
          DM.rsCA.AppServer.Acc_Del(RxDBGrid1.DataSource.DataSet.FieldByName('Id_Acc').AsInteger);
        end;
      end
      else
        DM.rsCA.AppServer.Acc_Del(RxDBGrid1.DataSource.DataSet.FieldByName('Id_Acc').AsInteger);
    finally
      aRefresh.Execute;
    end;
  end;
end;

procedure TAccsFrame.aRefreshExecute(Sender: TObject);
var
  id, OldRecNo :Integer;
begin
  with cdsAccs do
  begin
     if Active and not IsEmpty then
       OldRecNo := RecNo
     else
       OldRecNo := -1;
    Id:=FieldByName('id_Acc').AsInteger;
    Close;
    Open;
    if not Locate('id_Acc', Id, [loCaseInsensitive]) and (OldRecNo <> -1) then
    begin
      if (OldRecNo <= RecordCount) then
        RecNo := OldRecNo
      else
        Last;
    end;
  end;
end;

procedure TAccsFrame.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').Value then
    begin
      AFont.Color := clGray;
      AFont.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;
end;

procedure TAccsFrame.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TAccsFrame.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TAccsFrame.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TAccsFrame.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TAccsFrame.FilterEditChange(Sender: TObject);
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

procedure TAccsFrame.aAccCardExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_Acc := cdsAccs.FieldByName('Id_Acc').Value;
  ShowAccCard(AParamBlnc);
end;

procedure TAccsFrame.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  aExcelExp.Enabled := not cdsAccs.IsEmpty;

  aEdit.Enabled := not cdsAccs.IsEmpty and not ReadOnly;
  aDel.Enabled := not cdsAccs.IsEmpty and not ReadOnly;
  aA2.Enabled := not cdsAccs.IsEmpty;
  aAccCard.Enabled := not cdsAccs.IsEmpty;
  aAccRep.Enabled := not cdsAccs.IsEmpty;
  aSetGrp.Enabled := not cdsAccs.IsEmpty and not ReadOnly;

  ShowText('Всего счетов: ' + IntToStr((Sender as TDataSource).DataSet.RecordCount), 1);
end;

procedure TAccsFrame.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;

  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('id_Main').IsNull then
  begin
//    if not (gdFocused in State) then
//      (Sender as TDBGrid).Canvas.Font.Color := colorNonViza;
    (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
  end;
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TAccsFrame.fAccGroup1OrgTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  fAccGroup1.OrgTreeViewChange(Sender, Node);

  GetList;
end;

procedure TAccsFrame.GetList;
var id_Group : Variant;
begin
  cdsAccs.Close;
  if (fAccGroup1.OrgTreeView.Selected <> nil) and (TObject(fAccGroup1.OrgTreeView.Selected.Data) is TNodeObj) then
  begin
    if TNodeObj(fAccGroup1.OrgTreeView.Selected.Data).ID = -2 then
      id_Group := Null
    else
      id_Group := TNodeObj(fAccGroup1.OrgTreeView.Selected.Data).ID;
      
    cdsAccs.Params.ParamByName('@ID_Business').Value := TNodeObj(fAccGroup1.OrgTreeView.Selected.Data).IDBsn;
    cdsAccs.Params.ParamByName('@id_Group').Value := id_Group;
    cdsAccs.Params.ParamByName('@id_User').Value := DM.IDUser;
    cdsAccs.Open;
  end
end;

procedure TAccsFrame.RxDBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if (ssLeft in Shift) and (THackGrid(Sender).RowHeights[0] < Y) then
   (Sender as TDBGrid).BeginDrag(true);
end;

procedure TAccsFrame.aAccRepExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_Acc := cdsAccs.FieldByName('Id_Acc').Value;
  AParamBlnc.id_business := fAccGroup1.GetBsnID;
  ShowAccCard_Adv(AParamBlnc);
end;

procedure TAccsFrame.aSetGrpExecute(Sender: TObject);
var ASelectedObj : TSelectedObj;
    i : integer;
begin
  ASelectedObj.ID := -1;
  if SelectUnGroup(eotFinGroup, ID_Business, ASelectedObj.ID, ASelectedObj.Name, false, true) then
  begin
    try
      RxDBGrid1.DataSource.DataSet.DisableControls;
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
    finally
      RxDBGrid1.DataSource.DataSet.EnableControls;
      fAccGroup1.aRefreshe.Execute;
      aRefresh.Execute;
    end;
  end;
end;

procedure TAccsFrame.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TAccsFrame.aExcelExpExecute(Sender: TObject);
begin
  GreedToExcel(RxDBGrid1, 'Счета');
end;

procedure TAccsFrame.cdsAccsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

procedure TAccsFrame.aA2Execute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_Acc := cdsAccs.FieldByName('Id_Acc').Value;
  ShowAccCard_v2(AParamBlnc);
end;

procedure TAccsFrame.fAccGroup1MenuItem1Click(Sender: TObject);
begin
  fAccGroup1.aNewExecute(Sender);

end;

end.
