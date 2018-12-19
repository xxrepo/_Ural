unit frFormalDict;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ActnList, ImgList, Grids, DBGrids, RXDBCtrl, Menus,
  Db, DBClient, StdCtrls, ExtCtrls;

type
  TfFormalDict = class(TFrame)
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
    cdsFormal: TClientDataSet;
    dsFltList: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cdsFormalid_FormalDistrib: TAutoIncField;
    cdsFormalName: TStringField;
    N4: TMenuItem;
    aExcelExp: TAction;
    Excel1: TMenuItem;
    aSelAll: TAction;
    N5: TMenuItem;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
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
    procedure cdsFormalFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
  private
    Fid_Bsn : integer;
  public
    procedure Initialize(id_Bsn : integer);
  end;

implementation

uses foMyFunc, uDM;

{$R *.DFM}

procedure TfFormalDict.aAddExecute(Sender: TObject);
var
  ID:Variant;
  S : String;
begin
  S := '';
  if InputBoxKrm('Новое распределения', 'Название', S) then
  begin
    ID := DM.rsCA.AppServer.OP_FormalDistribAdd(S, Fid_Bsn);
    if ID <> -1 then
      with cdsFormal do
      begin
        Close;
        Open;
        Locate('id_FormalDistrib', ID, []);
      end;
  end;
end;

procedure TfFormalDict.aEditExecute(Sender: TObject);
var
  ID:Variant;
  S : String;
  id_Bsn : Variant;
begin
  ID := cdsFormal.FieldByName('id_FormalDistrib').Value ;
  S := cdsFormal.FieldByName('Name').AsString ;
  if InputBoxKrm('Название распределения', 'Название', S) then
  begin
    if DM.rsCA.AppServer.OP_FormalDistribEdit(ID, S) = 1 then
      with cdsFormal do
      begin
        Close;
        Open;
        Locate('id_FormalDistrib', ID, []);
      end;
  end;
end;

procedure TfFormalDict.aDelExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if RxDBGrid1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(RxDBGrid1.SelectedRows.Count) + ' распределений?'
  else
    S := 'Удалить распределение?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if RxDBGrid1.SelectedRows.Count > 0 then
      begin
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
          DM.rsCA.AppServer.OP_FormalDistribDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_FormalDistrib').AsInteger);
        end;
      end
      else
        DM.rsCA.AppServer.OP_FormalDistribDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_FormalDistrib').AsInteger);
    finally
      aRefresh.Execute;
    end;
  end;
end;

procedure TfFormalDict.aRefreshExecute(Sender: TObject);
 var
  id:Integer;
begin
  ID := cdsFormalid_FormalDistrib.AsInteger;
  with cdsFormal do
  begin
    Close;
    Open;
   Locate('id_FormalDistrib', Id, [loCaseInsensitive]);
  end;
end;

procedure TfFormalDict.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfFormalDict.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfFormalDict.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfFormalDict.Initialize(id_Bsn : integer);
begin
  Fid_Bsn := id_Bsn;
  aAdd.Enabled := Fid_Bsn > 0;
  with cdsFormal do
  begin
    Close;
    Params.ParamByName('@id_Bsn').Value := id_Bsn;
    Open;
  end;
end;

procedure TfFormalDict.dsFltListDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsFormal.IsEmpty;
  aDel.Enabled := not cdsFormal.IsEmpty;
  aExcelExp.Enabled := not cdsFormal.IsEmpty;
end;

procedure TfFormalDict.aExcelExpExecute(Sender: TObject);
begin
  GreedToExcel(RxDBGrid1, 'Формальные распределения бизнеса ' + DM.GetBusinessName(Fid_Bsn));
end;

procedure TfFormalDict.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TfFormalDict.FilterEditChange(Sender: TObject);
begin
  with cdsFormal   do
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

procedure TfFormalDict.cdsFormalFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

procedure TfFormalDict.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

end.
