unit frUsers;

interface

uses 
  Windows, Menus, Classes, ActnList, ImgList, Controls, DB, StdCtrls,
  ExtCtrls, Forms, Graphics, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, DBTables, foMyFunc,
  ADODB, {$IFDEF VER150} Variants,{$ENDIF} SysUtils, AdvMenus;

type
  TfUsers = class(TFrame)
    DataSource: TDataSource;
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
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    PopupMenu1: TAdvPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    qryUsers: TADOQuery;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure cdsUsersAfterOpen(DataSet: TDataSet);
    procedure qryUsersAfterOpen(DataSet: TDataSet);
    procedure qryUsersBeforeClose(DataSet: TDataSet);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure qryUsersFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FilterEditChange(Sender: TObject);
  private
    ASort : String;
    procedure CheckEmptyDS;
  protected
     procedure   AddUser;
     procedure   EditUser;

  public
    { Public declarations }
    ReadOnly:boolean;
    function Init(id_Group:integer=-1):boolean;
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation
     uses  uDM, uUserProp;
{$R *.DFM}
constructor TfUsers.Create(AOwner:TComponent);
var TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
end;

destructor TfUsers.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if GetControlOwner(self) is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
 inherited;
end;

function TfUsers.Init(id_Group:integer=-1):boolean;
var V : Variant;
begin
 if ReadOnly then
  begin
    aAdd.Enabled:=False;
    aDel.Enabled:=False;
  end;
   qryUsers.Close;
   if Id_Group > -1 then
     V := Id_Group
   else
     V := Null;
   qryUsers.Open;
end;
procedure TfUsers.aAddExecute(Sender: TObject);
begin
  AddUser;
end;

procedure TfUsers.AddUser;
var
 Id:Variant;
begin
  DM.Rights_GetUserRights(2, true);
 Id:=-1;
 if  ShowUserDetailForm(Id, ReadOnly) then
  begin
   aRefreshExecute(nil);
   qryUsers.Locate('Id_User',Id,[loCaseInsensitive]);
  end;
end;

procedure TfUsers.aEditExecute(Sender: TObject);
begin
  EditUser;
end;

procedure TfUsers.EditUser;
var
 Id:Variant;
begin
  DM.Rights_GetUserRights(2, true);
 Id:=qryUsers.FieldByname('Id_User').Value;
 if ShowUserDetailForm(Id, false) then
    aRefreshExecute(nil);
 qryUsers.Locate('id_User', Id, [loCaseInsensitive]);
end;

procedure TfUsers.aDelExecute(Sender: TObject);
var ID : integer;
begin
  DM.Rights_GetUserRights(2, true);
  ID := qryUsers.FieldByName('Id_User').AsInteger;
  if ID = Dm.id_User then
  begin
    MessageBox(Handle, 'Нельзя удалить самого себя.', '', MB_ICONERROR + MB_Ok);
    Exit;
  end;
  if MessageBox(Handle, PChar('Удалить пользователя "' + qryUsers.FieldByName('FIO').AsString + '"?'), '', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    if DM.ExecSQL('update DW_User set AccDisabled = 1 WHERE id_User=' + IntToStr(ID)) then
    begin
      aRefresh.Execute;
    end
    else
      raise Exception.Create('Error');   
  end;
end;

procedure TfUsers.aRefreshExecute(Sender: TObject);
var
 id:Integer;
begin
  with qryUsers do
   begin
    Id:=FieldByName('id_User').AsInteger;
    Close;
    Open;
    Locate('id_User', Id, [loCaseInsensitive]);
  end;
end;

procedure TfUsers.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfUsers.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderadoCDS(Field, ASort);
end;

procedure TfUsers.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfUsers.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfUsers.CheckEmptyDS;
begin
end;

procedure TfUsers.cdsUsersAfterOpen(DataSet: TDataSet);
begin
 CheckEmptyDS;
end;

procedure TfUsers.qryUsersAfterOpen(DataSet: TDataSet);
begin
  qryUsers.Sort := ASort;
end;

procedure TfUsers.qryUsersBeforeClose(DataSet: TDataSet);
begin
  ASort := qryUsers.Sort;
end;

procedure TfUsers.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not qryUsers.IsEmpty;
  aDel.Enabled := not qryUsers.IsEmpty;
end;

procedure TfUsers.qryUsersFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(DataSet.FieldByName('FIO').AsString)) > 0); 
end;

procedure TfUsers.FilterEditChange(Sender: TObject);
begin
  with qryUsers do
  begin
    try
      Filtered := False;
      Filtered := Trim(FilterEdit.Text) <> '';
    finally
    end;
  end;
end;

end.
