unit frCnstItem;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ActnList, ImgList, Grids, DBGrids, RXDBCtrl, Clipbrd, Menus,
  Db, DBClient, StdCtrls, ExtCtrls;

type
  TfCnstItem = class(TFrame)
    RxDBGrid1: TRxDBGrid;
    ImageList: TImageList;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    cdsAPCnstItemGetList: TClientDataSet;
    dsFltList: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    aExcelExp: TAction;
    Excel1: TMenuItem;
    aSelAll: TAction;
    N5: TMenuItem;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    cdsAPCnstItemGetListid_CnstItem: TAutoIncField;
    cdsAPCnstItemGetListName: TStringField;
    cdsAPCnstItemGetListVal: TFloatField;
    cdsAPCnstItemGetListDateCreate: TDateTimeField;
    cdsAPCnstItemGetListDisabled: TBooleanField;
    cdsAPCnstItemGetListid_Business: TIntegerField;
    N6: TMenuItem;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure dsFltListDataChange(Sender: TObject; Field: TField);
    procedure aExcelExpExecute(Sender: TObject);
    procedure aSelAllExecute(Sender: TObject);
    procedure FilterEditChange(Sender: TObject);
    procedure cdsAPCnstItemGetListFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure N6Click(Sender: TObject);
  private
    Fid_Bsn : integer;
  public
    destructor Destroy; override;
    constructor Create(AOwner: TComponent); override;
    procedure Initialize(id_Bsn : integer);
  end;

implementation

uses foMyFunc, uDM, uInputBoxAP, foMyFuncEh;

{$R *.DFM}

procedure TfCnstItem.aAddExecute(Sender: TObject);
var
  ID:Variant;
  S : String;
  V : Extended;
begin
  S := '';
  V := 0;
  if InputBoxKrmAP('Новый параметр', S, V) then
  begin
    ID := DM.rsCA.AppServer.AP_CnstItemEdit(-1, S, V, Fid_Bsn);
    if ID <> -1 then
      with cdsAPCnstItemGetList do
      begin
        Close;
        Open;
        Locate('id_CnstItem', ID, []);
      end;
  end;
end;

procedure TfCnstItem.aEditExecute(Sender: TObject);
var
  ID:integer;
  S : String;
  V : Extended;
begin
  S := cdsAPCnstItemGetListName.AsString;
  V := cdsAPCnstItemGetListVal.AsFloat;
  ID := cdsAPCnstItemGetList.FieldByName('id_CnstItem').AsInteger;
  
  if InputBoxKrmAP('Новый параметр', S, V) then
  begin
    ID := DM.rsCA.AppServer.AP_CnstItemEdit(ID, S, V, Fid_Bsn);
    if ID <> -1 then
      with cdsAPCnstItemGetList do
      begin
        Close;
        Open;
        Locate('id_CnstItem', ID, []);
      end;
  end;
end;

procedure TfCnstItem.aDelExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if RxDBGrid1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(RxDBGrid1.SelectedRows.Count) + ' параметров?'
  else
    S := 'Удалить параметр?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if RxDBGrid1.SelectedRows.Count > 0 then
      begin
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
          DM.rsCA.AppServer.AP_CnstItemDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_CnstItem').AsInteger);
        end;
      end
      else
        DM.rsCA.AppServer.AP_CnstItemDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_CnstItem').AsInteger);
    finally
      aRefresh.Execute;
    end;
  end;
end;

procedure TfCnstItem.aRefreshExecute(Sender: TObject);
 var
  id:Integer;
begin
  ID := cdsAPCnstItemGetListid_CnstItem.AsInteger;
  with cdsAPCnstItemGetList do
  begin
    Close;
    Open;
   Locate('id_CnstItem', Id, [loCaseInsensitive]);
  end;
end;

procedure TfCnstItem.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfCnstItem.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfCnstItem.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfCnstItem.Initialize(id_Bsn : integer);
begin
  Fid_Bsn := id_Bsn;
  aAdd.Enabled := Fid_Bsn > 0;
  with cdsAPCnstItemGetList do
  begin
    Close;
    Params.ParamByName('@id_Business').Value := id_Bsn;
    Open;
  end;
end;

procedure TfCnstItem.dsFltListDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsAPCnstItemGetList.IsEmpty;
  aDel.Enabled := not cdsAPCnstItemGetList.IsEmpty;
  aExcelExp.Enabled := not cdsAPCnstItemGetList.IsEmpty;
end;

procedure TfCnstItem.aExcelExpExecute(Sender: TObject);
begin
  GreedToExcel(RxDBGrid1, 'Параметры ' + DM.GetBusinessName(Fid_Bsn));
end;

procedure TfCnstItem.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TfCnstItem.FilterEditChange(Sender: TObject);
begin
  with cdsAPCnstItemGetList   do
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

procedure TfCnstItem.cdsAPCnstItemGetListFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

procedure TfCnstItem.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

constructor TfCnstItem.Create(AOwner: TComponent);
var TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
end;

destructor TfCnstItem.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
  inherited;
end;

function GridSelectionAsText(AGrid: TDBGrid): String;
var bm : TBookmarkStr;
    i,j,DLIndex : Integer;
    ss : TStringStream;
    function StringTab(s:String; Index, Count:Integer):String;
    begin
      if Index <> Count then
        Result := s + #09
      else
        Result := s; 
    end;
begin
  Result := '';
  with AGrid do
  begin

      if (THackGrid(AGrid).col > 0) and (THackGrid(AGrid).col <= AGrid.Columns.Count) and (AGrid.Columns[THackGrid(AGrid).col - 1].Field <> nil) then
        Result := AGrid.Columns[THackGrid(AGrid).col - 1].Field.DisplayText;
  end;
end;

procedure TfCnstItem.N6Click(Sender: TObject);
begin
  Clipboard.AsText:=GridSelectionAsText(RxDBGrid1)

end;

end.
