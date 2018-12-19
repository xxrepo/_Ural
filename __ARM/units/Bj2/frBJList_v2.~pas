unit frBJList_v2;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ActnList, ImgList, Grids, DBGrids, RXDBCtrl, Menus,
  Db, DBClient, StdCtrls, foMyFunc, ExtCtrls, DBGridEh, frBsnSelector,
  Buttons, GridsEh, frBJTree_v2;

type
  TfBJList_v2 = class(TFrame)
    RxDBGrid1: TDBGridEh;
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
    cdsBJList: TClientDataSet;
    dsFltList: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    aExcelExp: TAction;
    aSelAll: TAction;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    aCopy: TAction;
    ToolButton6: TToolButton;
    cdsBJListid_BJ_Obj: TAutoIncField;
    cdsBJListid_business: TIntegerField;
    cdsBJListName: TStringField;
    cdsBJListDateCreate: TDateTimeField;
    cdsBJListid_Creator: TIntegerField;
    cdsBJListDateCheck: TDateTimeField;
    cdsBJListid_Checker: TIntegerField;
    cdsBJListDisabled: TBooleanField;
    cdsBJListStartDate: TDateTimeField;
    cdsBJListStopDate: TDateTimeField;
    cdsBJListid_ClosedBy: TIntegerField;
    cdsBJListCloseDate: TDateTimeField;
    cdsBJListCreatorFIO: TStringField;
    cdsBJListCheckerFIO: TStringField;
    cdsBJListClosedByFIO: TStringField;
    pnDate: TPanel;
    Splitter1: TSplitter;
    fBsnSelector1: TfBsnSelector;
    aSetCh: TAction;
    aUnSetCh: TAction;
    N5: TMenuItem;
    Label2: TLabel;
    lcYear: TComboBox;
    fBJTree1: TfBJTree_v2;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure dsFltListDataChange(Sender: TObject; Field: TField);
    procedure aSelAllExecute(Sender: TObject);
    procedure FilterEditChange(Sender: TObject);
    procedure cdsBJListFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure aCopyExecute(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
      IsDown: Boolean);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure aSetChExecute(Sender: TObject);
    procedure aUnSetChExecute(Sender: TObject);
  private
    Rights_Add, Rights_Edit, Rights_Del  : boolean;
    procedure aRefresh_int(id_BJ_Obj: Integer);
    procedure BJ_Ch(ACheck: boolean);
  public
    procedure Initialize;
    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    function GetYear : integer;
  end;

implementation

uses uDM, uAPCond, foMyFuncEh, uBJTree, uBJTreeEdit_v2, foMyFuncDXTreeExcel;

{$R *.DFM}

procedure TfBJList_v2.aAddExecute(Sender: TObject);
var
  id:Integer;
begin
  ID := -1;
  ShowBJTreeEdit_v2(Handle, ID, fBsnSelector1.ID, false);
  aRefresh_int(ID);
end;

procedure TfBJList_v2.aEditExecute(Sender: TObject);
var
  id:Integer;
begin
  ID := cdsBJListid_BJ_Obj.AsInteger;
  if ShowBJTreeEdit_v2(Handle, ID, fBsnSelector1.ID, false) then
    aRefresh_int(ID);
end;

procedure TfBJList_v2.aDelExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if RxDBGrid1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(RxDBGrid1.SelectedRows.Count) + ' условий?'
  else
    S := 'Удалить бюджет?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if RxDBGrid1.SelectedRows.Count > 0 then
      begin
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
          DM.rsCA.AppServer.BJ_ObjDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_BJ_Obj').AsInteger);
        end;
      end
      else
        DM.rsCA.AppServer.BJ_ObjDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_BJ_Obj').AsInteger);
    finally
      aRefresh.Execute;
    end;
  end;
end;

procedure TfBJList_v2.aRefreshExecute(Sender: TObject);
begin
  aRefresh_int(-1);
end;

procedure TfBJList_v2.aRefresh_int(id_BJ_Obj: Integer);
var OldDataChangeEvent : TDataChangeEvent;
begin
  Rights_Add := DM.CheckUserRights(100, fBsnSelector1.ID);
  Rights_Edit := DM.CheckUserRights(102, fBsnSelector1.ID);
  Rights_Del := DM.CheckUserRights(101, fBsnSelector1.ID);

  if id_BJ_Obj = -1 then
    id_BJ_Obj := cdsBJListid_BJ_Obj.AsInteger;
  with cdsBJList do
  begin

    Close;
    Params.ParamByName('@id_business').Value := fBsnSelector1.ID;
    Params.ParamByName('@Year').Value := GetYear;
    
    OldDataChangeEvent := dsFltList.OnDataChange;
    dsFltList.OnDataChange := nil;
    Screen.Cursor := crSQLWait;
    try
      Open;
    finally
      dsFltList.OnDataChange := OldDataChangeEvent;
      Screen.Cursor := crDefault;
    end;
   // if id_BJ_Obj > 0 then
     // if
      Locate('id_BJ_Obj', id_BJ_Obj, [loCaseInsensitive]);
        dsFltList.OnDataChange(dsFltList, nil); 
  end;
end;


procedure TfBJList_v2.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrideh(Sender).ScreenToClient(P);
  if P.y<=THackGridEh(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfBJList_v2.Initialize;
begin
 
end;

procedure TfBJList_v2.dsFltListDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsBJList.IsEmpty and Rights_Edit;
  aCopy.Enabled := not cdsBJList.IsEmpty and Rights_Add;
  aDel.Enabled := not cdsBJList.IsEmpty and Rights_Del;
  aExcelExp.Enabled := not cdsBJList.IsEmpty;

  aSetCh.Enabled := not cdsBJList.IsEmpty and cdsBJListDateCheck.IsNull  and Rights_Edit;
  aUnSetCh.Enabled := not cdsBJList.IsEmpty and not cdsBJListDateCheck.IsNull  and Rights_Edit;

  aAdd.Enabled := (fBsnSelector1.ID >= 0) and Rights_Add;
  fBJTree1.Initialize_v2(GetYear, -1, 1, bjtNone, cdsBJListid_BJ_Obj.AsInteger, false, Null, Null, Null, fBsnSelector1.ID);
  fBJTree1.Enabled := not cdsBJList.IsEmpty;
end;

procedure TfBJList_v2.aSelAllExecute(Sender: TObject);
begin
//  RxDBGrid1.SelectAll;
end;

procedure TfBJList_v2.FilterEditChange(Sender: TObject);
begin
  with cdsBJList   do
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

procedure TfBJList_v2.cdsBJListFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

procedure TfBJList_v2.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfBJList_v2.DoRefrMsg(var Msg: TMessage);
begin
{  with cdsBJList do
  begin
    Close;
    Open;
    Locate('id_BJ_Obj', Msg.WParam, [loCaseInsensitive]);
  end; }
end;

procedure TfBJList_v2.aCopyExecute(Sender: TObject);
var
  id, OLD_ID:Integer;
begin
  ID := cdsBJListid_BJ_Obj.AsInteger;

  OLD_ID := cdsBJListid_BJ_Obj.AsInteger;
  if ShowBJTreeEdit_v2(Handle, ID, fBsnSelector1.ID, true) then
  begin
    Screen.Cursor := crSQLWait;
    try
      DM.rsCA.AppServer.BJ_Copy(OLD_ID, ID);
    finally
      Screen.Cursor := crDefault;
    end;
    aRefresh_int(ID);
  end;                                   
end;

constructor TfBJList_v2.Create(AOwner: TCOmponent);
var Own : TCustomForm;
    Year, Month, Day: Word;
    i : integer;
begin
  inherited;

  DecodeDate(now, Year, Month, Day);
  for i := 2011 to Year do
    lcYear.Items.Add(IntToStr(i));
  lcYear.ItemIndex := 0; //lcYear.Items.Count - 1;
    
  fBsnSelector1.UID := 110;
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin                                          
    LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName);
    LoadSplitterSettingsFromRegistry(Splitter1, SRegPath + '\Splitter1' + TForm(Own).ClassName + '\' + ClassName);
  end;

  if fBsnSelector1.ID > 0 then
    aRefresh_int(-1);
end;

destructor TfBJList_v2.Destroy;
var    Own : TCustomForm;
begin
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin                                          
    SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName);
    SaveSplitterSettingsFromRegistry(Splitter1, SRegPath + '\Splitter1' + TForm(Own).ClassName + '\' + ClassName);
  end;
  inherited;

end;

procedure TfBJList_v2.fBsnSelector1Button1Click(Sender: TObject);
var OldID : integer;
begin
  OldID := fBsnSelector1.id;
  fBsnSelector1.Button1Click(Sender);
  if OldID <> fBsnSelector1.id then
  begin
    DM.Rights_GetUserRights(110, fBsnSelector1.id);
    aRefresh.Execute;
  end;
end;

procedure TfBJList_v2.RxDBGrid1GetBtnParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarkerEh; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarkerEh(Column.Field);
end;

procedure TfBJList_v2.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  ReOrderCDSEh(Column, '');
end;

procedure TfBJList_v2.aSetChExecute(Sender: TObject);
begin
  BJ_Ch(true);
end;

procedure TfBJList_v2.aUnSetChExecute(Sender: TObject);
begin
  BJ_Ch(false);
end;

procedure TfBJList_v2.BJ_Ch(ACheck: boolean);
var S : String;
    aid_User: OleVariant;
begin
  if ACheck then
  begin
    aid_User := DM.IDUser;
    S := 'Списать остатки?';
  end
  else
  begin
    aid_User := Null;
    S := 'Отменить списание?';
  end;

  if MessageBox(Handle, PChar(S), 'Подтвердите действие', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      DM.rsCA.AppServer.BJ_Ch(RxDBGrid1.DataSource.DataSet.FieldByName('id_BJ_Obj').AsInteger, aid_User);
    finally
      aRefresh.Execute;
    end;
  end;
end;

function TfBJList_v2.GetYear: integer;
begin
    if lcYear.Text > '' then
      Result := StrToInt(lcYear.Text)
    else
      Result := -1;

end;

end.
