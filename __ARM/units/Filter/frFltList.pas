unit frFltList;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ActnList, ImgList, Grids, DBGrids, RXDBCtrl, Menus,
  Db, DBClient, UniverseFilterForm, UniverseFilter, mconnect, StdCtrls,
  ExtCtrls;

type
  TfFltList = class(TFrame)
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
    dsFltList: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    aFind: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    aCopy: TAction;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    cdsFltList: TClientDataSet;
    cdsFltListid_Filter: TAutoIncField;
    cdsFltListName: TStringField;
    cdsFltListUnivName: TStringField;
    cdsFltListBsnName: TStringField;
    cdsFltListid_business: TIntegerField;
    cdsFltListLastModified: TDateTimeField;
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
    procedure aFindExecute(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure FilterEditChange(Sender: TObject);
    procedure cdsFltListFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    FID_User : integer;
    FConnection : TCustomConnection;

    FSelectObjEvent : TSelectObjEvent;
    procedure IntRefr(id_Filter: integer);
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(AConnection : TCustomConnection; ID_User : integer;
                      ASelectObjEvent : TSelectObjEvent);

    procedure MSG_RefrList(var Msg : TMessage); message WM_RefrList;

  end;

implementation

uses foMyFunc, uSearchResult;

{$R *.DFM}

procedure TfFltList.aAddExecute(Sender: TObject);
var ID : integer;
begin
  ID := -1;
  EditFilter(FConnection, 1, FID_User, Handle,ID, FSelectObjEvent, [ufsObjView, ufsCondList, ufsMayChangeCond]);
end;

procedure TfFltList.aEditExecute(Sender: TObject);
var ID : integer;
begin
  ID := cdsFltList.fieldByName('id_Filter').AsInteger;
  EditFilter(FConnection, 1, FID_User, Handle, ID, FSelectObjEvent, [ufsObjView, ufsCondList, ufsMayChangeCond]);
end;

procedure TfFltList.aDelExecute(Sender: TObject);
var ID : integer;
begin
  if MessageBox(Handle, 'Вы действительно хотите удалить фильтр?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    ID := cdsFltList.fieldByName('id_Filter').AsInteger;
    if TDispatchConnection(FConnection).AppServer.FilterDel(ID) = 1 then
      aRefresh.Execute;
  end;
end;

procedure TfFltList.aRefreshExecute(Sender: TObject);
 var
  id:Integer;
begin
  ID := cdsFltList.fieldByName('id_Filter').AsInteger;
  IntRefr(ID);
end;

procedure TfFltList.IntRefr(id_Filter : integer);
begin
  Screen.Cursor := crSQLWait;
  try
    with cdsFltList do
    begin
      Close;
      Open;
      Locate('id_Filter', id_Filter, [loCaseInsensitive]);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfFltList.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfFltList.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfFltList.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfFltList.Initialize(AConnection : TCustomConnection; ID_User : integer;
                      ASelectObjEvent : TSelectObjEvent);
begin
  FConnection := AConnection;
  FID_User := ID_User;
  FSelectObjEvent := ASelectObjEvent;
  with cdsFltList do
  begin
    RemoteServer := TCustomRemoteServer(FConnection);
    Close;
    Params.ParamByName('@id_User').Value := ID_User;
    Open;
  end;
end;

procedure TfFltList.dsFltListDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsFltList.IsEmpty;
  aDel.Enabled := not cdsFltList.IsEmpty;
  aFind.Enabled := not cdsFltList.IsEmpty;
  aCopy.Enabled := not cdsFltList.IsEmpty;
end;

procedure TfFltList.MSG_RefrList(var Msg: TMessage);
begin
  IntRefr(Msg.WParam);
end;

procedure TfFltList.aFindExecute(Sender: TObject);
begin
  ShowSearchResult(FConnection, cdsFltList.fieldByName('id_Filter').AsInteger, FID_User);
end;

constructor TfFltList.Create(AOwner: TCOmponent);
begin
  inherited;
  if Owner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, '\SOFTWARE\FO\' + ExtractFileName(Application.ExeName) + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
end;

destructor TfFltList.Destroy;
begin
  if Owner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, '\SOFTWARE\FO\' + ExtractFileName(Application.ExeName) + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
  inherited;

end;



procedure TfFltList.aCopyExecute(Sender: TObject);
var ID : integer;
begin
  ID := cdsFltList.fieldByName('id_Filter').AsInteger;
  EditFilter(FConnection, 1, FID_User, Handle, ID, FSelectObjEvent, [ufsObjView, ufsCondList, ufsMayChangeCond], true);
end;

procedure TfFltList.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfFltList.FilterEditChange(Sender: TObject);
begin
  with cdsFltList  do
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

procedure TfFltList.cdsFltListFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

end.

