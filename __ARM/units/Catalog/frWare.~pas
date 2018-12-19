unit frWare;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, Menus, Db, DBClient, ImgList, ComCtrls, ToolWin, uDM, ExtCtrls,
  Grids, DBGrids, RXDBCtrl, Registry, foMyFunc, frTreeChItem,
  contnrs, StdCtrls, Buttons, RXCtrls, uWareFinder, frWareCtgTree,
  frWareFinder;

type
  TfWare = class(TFrame)
    ImageList1: TImageList;
    ActionList1: TActionList;
    aDel: TAction;
    ToolBar1: TToolBar;
    aRefreshe: TAction;
    ToolButton5: TToolButton;
    Splitter1888: TSplitter;
    dsWaresList: TDataSource;
    pmWares: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    aNewWare: TAction;
    aDelWare: TAction;
    aPropWare: TAction;
    tsCtg: TTabSheet;
    tsWare: TTabSheet;
    grdList: TRxDBGrid;
    pcCldObj: TPageControl;
    fTreeChItem1: TfTreeChItem;
    ToolBar2: TToolBar;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton8: TToolButton;
    aRefresheWare: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton12: TSpeedButton;
    edFilter: TComboBox;
    FilterPanel: TPanel;
    Label2: TLabel;
    FilterEdit: TEdit;
    SpeedButton22: TSpeedButton;
    fWareCtgTree1: TfWareCtgTree;
    cdsGoods: TClientDataSet;
    cdsGoodsid_Goods: TAutoIncField;
    cdsGoodsid_Ctg_Goods: TIntegerField;
    cdsGoodsName: TStringField;
    cdsGoodsShortName: TStringField;
    cdsGoodsBarCode: TStringField;
    cdsGoodsPrice: TFloatField;
    cdsGoodsDisabled: TBooleanField;
    cdsGoodsLastUpdated: TBytesField;
    cdsGoodsBC: TStringField;
    aGreedToExcel: TAction;
    cdsPriceList_G: TClientDataSet;
    Splitter2: TSplitter;
    dsAmount: TDataSource;
    pnAmount: TPanel;
    RxDBGrid1: TRxDBGrid;
    Label3: TLabel;
    cdsGoodsID_Main: TIntegerField;
    aReVal: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    aReValWH: TAction;
    pmRevalWH: TPopupMenu;
    N9: TMenuItem;
    Excel1: TMenuItem;
    aMov: TAction;
    N10: TMenuItem;
    aRepRez: TAction;
    N1: TMenuItem;
    cdsPriceList_GID_Warehouse: TAutoIncField;
    cdsPriceList_GMeasureName: TStringField;
    cdsPriceList_GWarehouseName: TStringField;
    cdsPriceList_GPrice: TFloatField;
    cdsPriceList_GTotalAmount: TBCDField;
    cdsPriceList_GTotalSum: TBCDField;
    cdsPriceList_GTotalAmountRez: TBCDField;
    cdsPriceList_GTotalSumRez: TBCDField;
    cdsPriceList_GFlag: TIntegerField;
    cdsPriceList_GId_Currency: TIntegerField;
    spFind3: TSplitter;
    pnFind: TPanel;
    cdsPriceList_GTotalAmountSend: TBCDField;
    cdsPriceList_GDelta: TFloatField;
    cdsPriceList_GDeltaRez: TFloatField;
    fWareFinder1: TfWareFinder;
    Timer1: TTimer;
    aNewWareMM: TAction;
    N2: TMenuItem;
    procedure aRefresheExecute(Sender: TObject);
    procedure grdListCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure grdListDblClick(Sender: TObject);
    procedure grdListDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdListGetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure dsWaresListDataChange(Sender: TObject; Field: TField);
    procedure aNewWareExecute(Sender: TObject);
    procedure aDelWareExecute(Sender: TObject);
    procedure aPropWareExecute(Sender: TObject);
    procedure aRefresheWareExecute(Sender: TObject);
    procedure cdsGoodsCalcFields(DataSet: TDataSet);
    procedure SpeedButton12Click(Sender: TObject);
    procedure edFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FilterEditChange(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure fWareCtgTree1TreeView1Change(Sender: TObject;
      Node: TTreeNode);
    procedure aGreedToExcelExecute(Sender: TObject);
    procedure fTreeChItem1tvChildDblClick(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsPriceList_GCalcFields(DataSet: TDataSet);
    procedure aReValExecute(Sender: TObject);
    procedure aReValWHExecute(Sender: TObject);
    procedure dsAmountDataChange(Sender: TObject; Field: TField);
    procedure cdsGoodsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure aMovExecute(Sender: TObject);
    procedure aRepRezExecute(Sender: TObject);
    procedure fWareFinder1SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure aNewWareMMExecute(Sender: TObject);
  private
    FSelObjType : TClass;
    FSelObjID : integer;

    FDisabled : Variant;
    FReadOnly, FShowToolBar : boolean;
    Fid_Bsn : Variant;
    Fid_Ctg : Variant;
    FSLCode : TStringList;
    FID_WareHouse : Variant;

    FBsns : TObjectList;

    FBsnNum : String;
    function GetWareID: Variant;
    function GetWareName: String;
    function GetID: Variant;
    procedure InitializeWare(AID, id_Ctg: Variant);
    procedure RefresheData;
    function GetBsn_ID: Variant;

    procedure SaveTreeState;
    procedure RestoreTreeState;

    function SetWareID(AID: Variant) : boolean;
    function DoFindWare(AID: String) : boolean;
    procedure SelectEvent(ID, ID_Ctg : integer);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure BeforeDestruction; override;
    procedure Initialize(AID : Variant; id_Bsn : Variant; Disabled : Variant;
                   AReadOnly : boolean = false; AShowToolBar : boolean = true);
    procedure Initialize_WH(AID : Variant; id_Bsn : Variant; Disabled : Variant;
                   AID_WareHouse : Variant;
                   AReadOnly : boolean = false; AShowToolBar : boolean = true);

    property WareName : String read GetWareName;
    property WareID : Variant read GetWareID;
    property WareCatID : Variant read GetID;
    property Bsn_ID : Variant read GetBsn_ID;

    procedure GetAmountList;
  end;

implementation

uses {$IFNDEF LC} uWizReVal, uMovWH, uRepRez,{$ENDIF}uFormApi_Ware,
  uWareMemo;

{$R *.DFM}

function TfWare.GetID : Variant;
begin
  if Fid_Ctg = Null then
    Result := -1
  else
    Result := Fid_Ctg;//cdsGoodsid_Ctg_Goods.AsInteger;
//  Result := fWareCtgTree1.WareCatID;
end;

procedure TfWare.InitializeWare(AID, id_Ctg: Variant);
var OldID : Variant;
begin
  Fid_Ctg := id_Ctg;
  if Bsn_ID <> Null then
    FBsnNum := DM.GetBsnNum(Bsn_ID)
  else
    FBsnNum := '';
//  aNewWare.Enabled := Fid_Ctg > 0;
  if dsWaresList.DataSet <> nil then
  begin
    with TClientDataSet(dsWaresList.DataSet) do
    begin
      if AID = -1 then
        OldID := WareID
      else
        OldID := AID;
        
      Close;
      Params.ParamByName('@Disabled').Value := FDisabled;
      Params.ParamByName('@id_business').Value := GetBsn_ID;

      Params.ParamByName('@id_Ctg_Goods').Value := id_Ctg;

      Open;
      aNewWare.Enabled := Fid_Ctg > 0;
      aNewWareMM.Enabled := Fid_Ctg > 0;
      Locate('id_Goods', OldID, [])
    end;
  end;
end;

procedure TfWare.aRefresheExecute(Sender: TObject);
begin
   Initialize(Null, Fid_Bsn, FDisabled, FReadOnly, FShowToolBar);
end;

procedure TfWare.Initialize(AID : Variant; id_Bsn : Variant; Disabled : Variant;
                   AReadOnly : boolean; AShowToolBar : boolean);
var i : integer;
    N : TTreeNode;
    BsnObj : TBsnObj;
    UID : integer;

    Reg : TRegistry;
    FullRegPathName : String;
begin
  fWareCtgTree1.Initialize(Null, id_Bsn, Disabled, AReadOnly, AShowToolBar);

  Fid_Bsn := id_Bsn;
  FDisabled := Disabled;
  FReadOnly := AReadOnly;
  FShowToolBar := AShowToolBar;

  fWareCtgTree1.aNew.Enabled := Fid_Bsn >= 0;

  SetWareID(AID);
    FilterEdit.Focused;

end;

constructor TfWare.Create(AOwner: TComponent);
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
    Own : TCustomForm;
begin
  inherited;
  if not FUsePrice then
  begin
    for i := 0 to grdList.Columns.Count - 1 do
    begin
      if grdList.Columns[i].Field = cdsGoodsPrice then
      begin
        grdList.Columns[i].Visible := false;
        Break;
      end;
    end;

  end;

  LoadGridSettingsFromRegistry(grdList, SRegPath + '\grdList');
  LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\RxDBGrid1');
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin                               
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      FullRegPathName := SRegPath + '\' + TForm(Own).ClassName + ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        if Reg.ValueExists('TreeView1Width') then
          fWareCtgTree1.Width := Reg.ReadInteger('TreeView1Width');
        if fWareCtgTree1.Width < fWareCtgTree1.Constraints.MinWidth then
          fWareCtgTree1.Width := fWareCtgTree1.Constraints.MinWidth;///!!!
        if Reg.ValueExists('RxDBGrid1Height') then
          pnAmount.Height := Reg.ReadInteger('RxDBGrid1Height');
        if Reg.ValueExists('fWareFinder1Width') then
          pnFind.Width := Reg.ReadInteger('fWareFinder1Width');

        GetValues(Reg, edFilter.Items, 'WareValue');
     //   GetValues(Reg, FSLCode, 'WareValue' + IntToStr(ORD(FCatObj)));

      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;

  if not DM.FMayRez then
  begin
    for i := 0 to RxDBGrid1.Columns.Count - 1 do
      if (RxDBGrid1.Columns[i].Field = cdsPriceList_GTotalAmountRez) or
         (RxDBGrid1.Columns[i].Field = cdsPriceList_GTotalSumRez) then
         RxDBGrid1.Columns[i].Visible := false;
  end;
  FSLCode := TStringList.Create;
  aPropWare.Caption := 'Свойства товара';
  aDelWare.Caption := 'Удалить товар';
  aNewWare.Caption := 'Новый товар';

  with TClientDataSet(dsAmount.DataSet) do
  begin
    IndexDefs.Clear;
    IndexDefs.Add('ixFLAG', 'FLAG', [ixCaseInsensitive]);
    IndexName := 'ixFLAG';
  end;

  {$IFDEF LC}
    for i := 0 to RxDBGrid1.Columns.Count - 1 do
      if (RxDBGrid1.Columns[i].Field = cdsPriceList_GTotalAmountRez) or
         (RxDBGrid1.Columns[i].Field = cdsPriceList_GTotalSumRez) then
         RxDBGrid1.Columns[i].Visible := false;
   for i := 0 to RxDBGrid1.Columns.Count - 1 do
   begin
     if RxDBGrid1.Columns[i].Field = cdsPriceList_GTotalAmountSend then
     begin
       RxDBGrid1.Columns[i].Visible := false;
     end;
     if RxDBGrid1.Columns[i].Field = cdsPriceList_GDeltaRez then
     begin
       RxDBGrid1.Columns[i].Title.Caption := 'Резерв';
     end;
   end;
//  aNew.Visible := false;
  aDel.Visible := false;

//  aProp.Visible := false;
  aDelWare.Visible := false;
  aReVal.Visible := false;
  aReValWH.Visible := false;
  aMov.Visible := false;
  aRepRez.Visible := false;
{$ENDIF}

  FBsnNum := '';
  FID_WareHouse := Null;
  FBsns := TObjectList.Create(true);
  Fid_Ctg := -1;

  for i := pcCldObj.PageCount - 1 downto 0 do
  begin
    pcCldObj.Pages[i].TabVisible := false;
    pcCldObj.Pages[i].Tag := -26;
  end;
  aRepRez.Visible := DM.FMayRez;
end;

destructor TfWare.Destroy;
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
    Own : TCustomForm;
begin
  FBsns.Free;
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin                               
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;

      FullRegPathName := SRegPath + '\' + TForm(Own).ClassName + ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        Reg.WriteInteger('TreeView1Width', fWareCtgTree1.Width);
        Reg.WriteInteger('RxDBGrid1Height', pnAmount.Height);
        Reg.WriteInteger('fWareFinder1Width', pnFind.Width);

        SaveValues(Reg, FSLCode, 'WareValue');
  //      SaveValues(Reg, edFilter.Items, 'WareValue' + IntToStr(ORD(FCatObj)));
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  SaveGridSettingsToRegistry(grdList,  SRegPath + '\grdList');
  SaveGridSettingsToRegistry(RxDBGrid1,  SRegPath + '\RxDBGrid1');
  FSLCode.Free;
  inherited;
end;

function TfWare.GetWareID: Variant;
begin
  Result := Null;
  if dsWaresList.DataSet.Active then
    Result := dsWaresList.DataSet.FieldByName('id_Goods').Value;
end;

function TfWare.GetWareName: String;
begin
  Result := dsWaresList.DataSet.FieldByName('Name').AsString;
end;

procedure TfWare.grdListCheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfWare.grdListDblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aPropWare.Execute;
end;

procedure TfWare.grdListDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;

  if Column.Field is TBooleanField then
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
 //     if not (gdSelected in State) then
   //     (Sender as TDBGrid).Canvas.Font.Color := colorNonViza;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
    end;
    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfWare.grdListGetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfWare.RefresheData;
var OldID : Variant;
begin
  with dsWaresList.DataSet do
  begin
    OldID := GetWareID;
    Close;
    Open;
    Locate(Fields[0].FieldName, OldID, []);
  end;
end;


procedure TfWare.aNewWareExecute(Sender: TObject);
var
  AID, Aid_Ctg : integer;
begin
  AID := -1;
  Aid_Ctg := WareCatID;
{$IFDEF LC}
//    Aid_Ctg := -13;
{$ENDIF}
  if EditWaresProp(Aid_Ctg, AID, Bsn_ID) then
  begin
    InitializeWare(AID, Aid_Ctg);
  end;
end;

procedure TfWare.aDelWareExecute(Sender: TObject);
var AID, id_Cat : Variant;
    Rez : integer;

    TotalAmount : Double;
    Price, ID_Cur : OLeVariant;
    Koef :  Double;
    ID_Warehouse : Variant;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
{$IFNDEF LC}
  if DM.PL_GetDefWarePrice(cdsGoodsid_Goods.AsInteger, Null, Price, ID_Cur, TotalAmount) <> -1 then
  begin
    if ABS(TotalAmount) > 0.005 then
    begin
      MessageBox(Handle, 'Остаток товара не равен нулю. Товар удалить нельзя', 'Удаление невозможно', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
{$ENDIF}
  if MessageBox(Handle, 'Удалить?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    AID := cdsGoodsid_Goods.AsInteger;
    Rez := DM.rsCA.AppServer.PL_GoodsDel(AID);
    id_Cat := WareCatID;

    if id_Cat = -1 then
      id_Cat := Null;
    if Rez = 1 then
    begin
      FixIdRefresh(cdsGoods, 'id_Goods', AID);
    end;
  end;
end;

procedure TfWare.aPropWareExecute(Sender: TObject);
var
  AID : integer;
  Aid_Ctg : integer;
begin
  AID := cdsGoodsid_Goods.AsInteger;

  if EditWaresProp(WareCatID, AID, Bsn_ID) then
  begin
    InitializeWare(AID, WareCatID);
  end;
end;

function TfWare.GetBsn_ID: Variant;
begin
  Result := fWareCtgTree1.Bsn_ID;
end;

procedure TfWare.RestoreTreeState;
begin

end;

procedure TfWare.SaveTreeState;
begin

end;

function TfWare.SetWareID(AID: Variant) : boolean;
var i, j : integer;
    Node, Node2 : TTreeNode;
    S : String;
    Fid_Ctg : integer;
begin
  Result := false;
  if AID = Null then Exit;
  Fid_Ctg := DM.rsCA.AppServer.UN_Sel_PL_GoodsCtg(AID);
  if fWareCtgTree1.SetCtgWareID(Fid_Ctg) then
  begin
    with TClientDataSet(dsWaresList.DataSet) do
    begin
      if Active then
        Result := Locate('id_Goods', AID, []);
    end;
  end;
end;

procedure TfWare.aRefresheWareExecute(Sender: TObject);
begin
  InitializeWare(cdsGoodsid_Goods.AsInteger, Fid_Ctg);
end;

procedure TfWare.cdsGoodsCalcFields(DataSet: TDataSet);
var S : String;
begin
  if DataSet.FieldByName('BarCode').AsString = '' then
//    DataSet.FieldByName('BC').AsString := FBsnNum + '-' + S + '-' + FormatFloat('00000', FWareID_Field.AsInteger)
  else
    DataSet.FieldByName('BC').AsString := DataSet.FieldByName('BarCode').AsString;
end;

procedure TfWare.SpeedButton12Click(Sender: TObject);
begin
  if trim(edFilter.Text) = '' then
  begin
    edFilter.SetFocus;
    raise Exception.Create('Не введен код'); 
  end;

  FilterEdit.Text := '';
  FilterEditChange(nil);
  if not DoFindWare(edFilter.Text) then
    MessageBox(Handle, 'Ничего не найдено', '', MB_ICONWARNING);
end;

function TfWare.DoFindWare(AID : String): boolean;
var Rez : integer;
begin
  NewFilterValue(edFilter, edFilter.Text);
  FSLCode.Assign(edFilter.Items);
  Result := false;
  Rez := DM.rsCA.AppServer.CheckGoods(AID);
  if Rez = -1 then
  begin
    if Length(AID) > 8 then
    try
      Rez := StrToInt(Copy(AID, Length(AID) - 4, 6));
    except
    end;
  end;

  Result := SetWareID(Rez)
end;

procedure TfWare.edFilterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 13) then
    if not DoFindWare(edFilter.Text) then
      MessageBox(Handle, 'Ничего не найдено', '', MB_ICONWARNING);
end;

procedure TfWare.FilterEditChange(Sender: TObject);
begin
  with dsWaresList.DataSet do
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

procedure TfWare.SelectEvent(ID, ID_Ctg : integer);
begin
  FilterEdit.Text := '';
  FilterEditChange(nil);
  if ID > 0 then
    SetWareID(ID)
  else
    fWareCtgTree1.SetCtgWareID(ID_Ctg);
end;

procedure TfWare.SpeedButton22Click(Sender: TObject);
begin
  {$IFDEF LC}
  ShowWareFinder(Null, GetBsn_ID, SelectEvent, Self, false);
{$ELSE}

  pnFind.Visible := not pnFind.Visible;
  spFind3.Visible := pnFind.Visible;
  fWareFinder1.Visible := pnFind.Visible;
  fWareFinder1.Initialize(Null, GetBsn_ID, SelectEvent, false);
  spFind3.Left := Width - fWareFinder1.Width - 1;
{$ENDIF}
end;

procedure TfWare.fWareCtgTree1TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
  fWareCtgTree1.TreeView1Change(Sender, Node);

  aNewWare.Enabled := (Node <> nil) and (TObject(Node.Data) is TDBObjectParented)
                       and (TDBObjectParented(Node.Data).CldCnt = 0)
                       and (TDBObjectParented(Node.Data).ID >= 0);

  if (Node <> nil) and (TObject(Node.Data) is frWareCtgTree.TDBObjectParented) and (TDBObjectParented(Node.Data).CldCnt = 0) then
  begin
    fTreeChItem1.SetBsnNode(nil);
    pcCldObj.ActivePage := tsWare;
    InitializeWare(Null, fWareCtgTree1.WareCatID);
  end
  else
  begin
//    if (Node <> nil) and ((Node.Count = 0) and Node.HasChildren) and (TObject(Node.Data) is TDBObjectParented) then
//      GetServiceTypeTree(Node, TDBObjectParented(Node.Data).IDBsn, TDBObjectParented(Node.Data).ID, TreeView1);
    pcCldObj.ActivePage := tsCtg;
    fTreeChItem1.SetBsnNode(Node);
  end;
end;

procedure TfWare.aGreedToExcelExecute(Sender: TObject);
begin
  Enabled := false;
  aGreedToExcel.Enabled := false;
  Repaint;
  try
    GreedToExcel(grdList, fWareCtgTree1.WareCatName)
  finally
    Enabled := true;
    aGreedToExcel.Enabled := true;
  end;
end;

procedure TfWare.fTreeChItem1tvChildDblClick(Sender: TObject);
begin
  fTreeChItem1.tvChildDblClick(Sender);

end;


procedure TfWare.dsWaresListDataChange(Sender: TObject; Field: TField);
begin
  Timer1.Enabled := false;
  Timer1.Enabled := true;
  aDelWare.Enabled := not dsWaresList.DataSet.IsEmpty
                      and (not dsWaresList.DataSet.FieldByName('Disabled').AsBoolean)
{$IFDEF LC}
                      and (dsWaresList.DataSet.FieldByName('ID_Main').IsNull)
{$ENDIF}
                      ;
  aPropWare.Enabled := not dsWaresList.DataSet.IsEmpty
{$IFDEF LC}
   //                   and (dsWaresList.DataSet.FieldByName('ID_Main').IsNull)
{$ENDIF}
                      ;

  aReVal.Enabled := not dsWaresList.DataSet.IsEmpty
{$IFDEF LC}
                      and (dsWaresList.DataSet.FieldByName('ID_Main').IsNull)
{$ENDIF}
                      ;
  aGreedToExcel.Enabled := not dsWaresList.DataSet.IsEmpty;

  ShowText('Всего товаров: ' + IntToStr((Sender as TDataSource).DataSet.RecordCount), 1);
end;

procedure TfWare.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;

  with TDBGrid(Sender).DataSource.DataSet do
    if DM.FMayRez and (TDBGrid(Sender).DataSource.DataSet.FieldByName('Delta').AsFloat < 0) then
    begin
      (Sender as TDBGrid).Canvas.Brush.Color := clRed;
      (Sender as TDBGrid).Canvas.FillRect(Rect);
   //   TDBGrid(Sender).Canvas.Font.Color := clRed;
    end;
    if TDBGrid(Sender).DataSource.DataSet.FieldByName('Flag').AsInteger = 0 then
    begin
  //    TDBGrid(Sender).Canvas.Font.Color :=
      TDBGrid(Sender).Canvas.Font.Style := [fsBold];
    end;
    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfWare.Initialize_WH(AID, id_Bsn, Disabled,
  AID_WareHouse: Variant; AReadOnly, AShowToolBar: boolean);
begin
  FID_WareHouse := AID_WareHouse;
  Initialize(AID, id_Bsn, Disabled, AReadOnly, AShowToolBar);
end;

procedure TfWare.cdsPriceList_GCalcFields(DataSet: TDataSet);
begin
  if (FID_WareHouse <> null) and (DataSet.FieldByName('ID_WareHouse').Value = FID_WareHouse) then
    DataSet.FieldByName('Flag').AsInteger := 0
  else
    DataSet.FieldByName('Flag').AsInteger := 1;
 {$IFNDEF LC}
    if DataSet.FieldByName('TotalAmountRez').AsVariant >= DataSet.FieldByName('TotalAmountSend').AsVariant then
      DataSet.FieldByName('DeltaRez').AsVariant := DataSet.FieldByName('TotalAmountRez').AsVariant - DataSet.FieldByName('TotalAmountSend').AsVariant;
    DataSet.FieldByName('Delta').AsVariant := DataSet.FieldByName('TotalAmount').AsFloat -  DataSet.FieldByName('DeltaRez').AsFloat;
 {$ELSE}
    if DataSet.FieldByName('TotalAmountRez').AsVariant >= DataSet.FieldByName('TotalAmountSend').AsVariant then
      DataSet.FieldByName('DeltaRez').AsVariant := -DataSet.FieldByName('TotalAmountRez').AsVariant;
    DataSet.FieldByName('Delta').AsVariant := DataSet.FieldByName('TotalAmount').AsFloat -  DataSet.FieldByName('DeltaRez').AsFloat;
 {$ENDIF}

end;

procedure TfWare.aReValExecute(Sender: TObject);
var OldWH : integer;
begin
 {$IFNDEF LC}
  ShowWizReVal(Handle, null, WareID);
  with RxDBGrid1.DataSource.DataSet do
  begin
    Close;
    Open;
    Locate('id_Warehouse', OldWH, []);
  end;
 {$ENDIF}
end;

procedure TfWare.aReValWHExecute(Sender: TObject);
var OldWH : integer;
begin
 {$IFNDEF LC}
  OldWH := RxDBGrid1.DataSource.DataSet.fieldByName('id_Warehouse').AsInteger;
  ShowWizReVal(Handle, OldWH, WareID);
  with RxDBGrid1.DataSource.DataSet do
  begin
    Close;
    Open;
    Locate('id_Warehouse', OldWH, []);
  end;
 {$ENDIF}
end;

procedure TfWare.dsAmountDataChange(Sender: TObject; Field: TField);
begin
  aReValWH.Enabled := not RxDBGrid1.DataSource.DataSet.IsEmpty;
  aMov.Enabled := not RxDBGrid1.DataSource.DataSet.IsEmpty;
  aRepRez.Enabled := not RxDBGrid1.DataSource.DataSet.IsEmpty and (RxDBGrid1.DataSource.DataSet.FieldByName('TotalAmountRez').AsFloat > 0);
end;

procedure TfWare.cdsGoodsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

procedure TfWare.aMovExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
    ACatObj : TCatObj;
    OldWH : integer;
begin
 {$IFNDEF LC}
  OldWH := RxDBGrid1.DataSource.DataSet.fieldByName('id_Warehouse').AsInteger;
  AParamBlnc := GetEmptyParamBlnc;
  with dsWaresList.DataSet do
  begin
    AParamBlnc.id_business := Fid_Bsn;
    AParamBlnc.id_Warehouse := OldWH;
    AParamBlnc.DateFrom := Date;
    AParamBlnc.DateTo := Date;

    AParamBlnc.id_Goods := FieldByName('id_Goods').AsInteger;
    ShowMovWH(AParamBlnc, true);
  end;
 {$ENDIF}
end;

procedure TfWare.aRepRezExecute(Sender: TObject);
begin
 {$IFNDEF LC}
  with dsWaresList.DataSet do
    ShowRepRez(FieldByName('id_Goods').AsInteger, cdsPriceList_GID_Warehouse.AsInteger);
 {$ENDIF}
end;

procedure TfWare.BeforeDestruction;
begin
  inherited;
//  fWareFinder1.saveStng;

end;

procedure TfWare.fWareFinder1SpeedButton1Click(Sender: TObject);
begin
  pnFind.Visible := not pnFind.Visible;
end;

procedure TfWare.GetAmountList;
begin
  if dsAmount.DataSet <> nil then
  begin
    with TClientDataSet(dsAmount.DataSet) do
    begin
      Close;

      Params.ParamByName('@id_Goods').Value := dsWaresList.DataSet.FieldByName('id_Goods').Value;
      Screen.Cursor := crSQLWait;
      try
        Open;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfWare.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  GetAmountList;
end;

procedure TfWare.aNewWareMMExecute(Sender: TObject);
var
  AID, Aid_Ctg : integer;
begin
  AID := -1;
  Aid_Ctg := WareCatID;
  if EditWareMemo(Bsn_ID, Aid_Ctg, AID) then
  begin
    InitializeWare(AID, Aid_Ctg);
  end;

end;

end.
