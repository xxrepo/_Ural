unit frDocDict;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ActnList, ImgList, Grids, DBGrids, RXDBCtrl, Menus,
  Db, DBClient, StdCtrls, ExtCtrls;

type
  TfDocDict = class(TFrame)
    ImageList: TImageList;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    dsDTList: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    aExcelExp: TAction;
    Excel1: TMenuItem;
    aSelAll: TAction;
    N5: TMenuItem;
    cdsDList: TClientDataSet;
    cdsDListName: TStringField;
    cdsDListUID: TIntegerField;
    cdsDListDef: TBooleanField;
    cdsDListType: TIntegerField;
    cdsDListMask: TStringField;
    cdsDTList: TClientDataSet;
    DataSource1: TDataSource;
    cdsDTListid_DT: TAutoIncField;
    cdsDTListName: TStringField;
    cdsDTListUID: TIntegerField;
    cdsDTListType: TIntegerField;
    cdsDTListMask: TStringField;
    RxDBGrid2: TRxDBGrid;
    Splitter1: TSplitter;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    FilterPanel2: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    cdsDListid_DD: TAutoIncField;
    aSetDef: TAction;
    N6: TMenuItem;
    aUnSetDef: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
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
    procedure dsDListDataChange(Sender: TObject; Field: TField);
    procedure aExcelExpExecute(Sender: TObject);
    procedure aSelAllExecute(Sender: TObject);
    procedure FilterEditChange(Sender: TObject);
    procedure cdsFormalFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure dsDTListDataChange(Sender: TObject; Field: TField);
    procedure aSetDefExecute(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure aUnSetDefExecute(Sender: TObject);
  private
    Fid_Bsn : integer;
  public
    procedure Initialize(id_Bsn : integer);
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses foMyFunc, uDM, uInputBoxDigit, uInputBoxStr;

{$R *.DFM}

procedure TfDocDict.aAddExecute(Sender: TObject);
var
  ID:Variant;
  S : Variant;
  R : boolean;
begin
  S := '';
  ID := -1;
  case cdsDTListType.AsInteger of
    0 :
    begin
      R := InputBoxStr(Handle, 'Новое значение', 'Значение', S, 255);
    end;
    1 :
    begin
      R := InputBoxDigit(Handle, 'Новое значение', 'Значение', S, cdsDTListMask.AsString);
    end;
  end;
  if R then
    ID := DM.rsCA.AppServer.DocDictEdit(-1, S, cdsDTListid_DT.AsInteger, Fid_Bsn);
  if ID <> -1 then
    with cdsDList do
    begin
      Close;
      Open;
      Locate('id_DD', ID, []);
    end;
end;

procedure TfDocDict.aEditExecute(Sender: TObject);
var
  ID:Variant;
  S : Variant;
  R : boolean;
begin
  S := cdsDListName.Value;
  ID := cdsDListid_DD.AsInteger;
  case cdsDTListType.AsInteger of
    0 :
    begin
      R := InputBoxStr(Handle, 'Редактирование значения', 'Значение', S, 255);
    end;
    1 :
    begin
      R := InputBoxDigit(Handle, 'Редактирование значения', 'Значение', S, cdsDTListMask.AsString);
    end;
  end;
  if R then
    DM.rsCA.AppServer.DocDictEdit(ID, S, cdsDTListid_DT.AsInteger, Fid_Bsn);
  with cdsDList do
  begin
    Close;
    Open;
    Locate('id_DD', ID, []);
  end;
end;

procedure TfDocDict.aDelExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if RxDBGrid1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(RxDBGrid1.SelectedRows.Count) + ' значений?'
  else
    S := 'Удалить значение?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if RxDBGrid1.SelectedRows.Count > 0 then
      begin
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
          DM.rsCA.AppServer.DocDictDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_DD').AsInteger);
        end;
      end
      else
        DM.rsCA.AppServer.DocDictDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_DD').AsInteger);
    finally
      aRefresh.Execute;
    end;
  end; 
end;

procedure TfDocDict.aRefreshExecute(Sender: TObject);
 var
  id:Integer;
begin
  ID := cdsDListid_DD.AsInteger;
  with cdsDList do
  begin
    Close;
    Open;
    Locate('id_DD', Id, [loCaseInsensitive]);
  end;
end;

procedure TfDocDict.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfDocDict.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfDocDict.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfDocDict.Initialize(id_Bsn : integer);
begin
  Fid_Bsn := id_Bsn;
  aAdd.Enabled := Fid_Bsn > 0;
  with cdsDTList do
  begin
    Close;
    Params.ParamByName('@id_User').Value := DM.IDUser;
    Open;
  end;
end;

procedure TfDocDict.dsDListDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsDList.IsEmpty;
  aDel.Enabled := not cdsDList.IsEmpty;
  aExcelExp.Enabled := not cdsDList.IsEmpty;
  aSetDef.Enabled := not cdsDList.IsEmpty and not cdsDListDef.AsBoolean;
  aUnSetDef.Enabled := not cdsDList.IsEmpty and cdsDListDef.AsBoolean;
end;

procedure TfDocDict.aExcelExpExecute(Sender: TObject);
begin
  GreedToExcel(RxDBGrid1, 'Формальные распределения бизнеса ' + DM.GetBusinessName(Fid_Bsn));
end;

procedure TfDocDict.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TfDocDict.FilterEditChange(Sender: TObject);
begin
  with cdsDList do
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

procedure TfDocDict.cdsFormalFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

procedure TfDocDict.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

constructor TfDocDict.Create(AOwner: TComponent);
begin
  inherited;
  if Owner is TCustomForm then
  begin
    LoadSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
end;

destructor TfDocDict.Destroy;
begin
  if Owner is TCustomForm then
  begin
    SaveSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
  inherited;    
end;

procedure TfDocDict.dsDTListDataChange(Sender: TObject; Field: TField);
begin
  with cdsDList do
  begin
    Close;
    Params.ParamByName('@id_business').Value := Fid_Bsn;
    Params.ParamByName('@id_User').Value := DM.IDUser;
    Params.ParamByName('@UID').Value := cdsDTListUID.AsInteger;
    Open;
  end;
end;

procedure TfDocDict.aSetDefExecute(Sender: TObject);
begin
  if DM.rsCA.AppServer.DocDictSetDef(cdsDListid_DD.AsInteger) = 1 then
    aRefresh.Execute;
end;

procedure TfDocDict.RxDBGrid1DrawColumnCell(Sender: TObject;
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
    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfDocDict.aUnSetDefExecute(Sender: TObject);
begin
  if DM.rsCA.AppServer.DocDictUnSetDef(cdsDListid_DD.AsInteger) = 1 then
    aRefresh.Execute;
end;

end.
