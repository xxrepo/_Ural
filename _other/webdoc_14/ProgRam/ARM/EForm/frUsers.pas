unit frUsers;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, Db, DBClient, ImgList, ActnList, StdCtrls,
  ExtCtrls, ComCtrls, ToolWin, Menus, AdvMenus,  TaskDialog;

type
  TfUsers = class(TFrame)
    RxDBGrid1: TRxDBGrid;
    dsNS: TDataSource;
    cdsUsers: TClientDataSet;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    PopupMenu1: TAdvPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cdsUsersid_User: TAutoIncField;
    cdsUsersFIO: TStringField;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure dsNSDataChange(Sender: TObject; Field: TField);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aAccCardExecute(Sender: TObject);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure FilterEditChange(Sender: TObject);
    procedure cdsUsersFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    FReadOnly : boolean;
  public
    procedure Initialize;
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses uDM, foMyFunc, uMainForm, uUserProp;

{$R *.DFM}

procedure TfUsers.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
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

procedure TfUsers.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfUsers.dsNSDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsUsers.IsEmpty and not FReadOnly;
  aDel.Enabled := not cdsUsers.IsEmpty and not FReadOnly;
 
end;

procedure TfUsers.aAddExecute(Sender: TObject);
var
  Id : integer;
begin
 // DM.Rights_GetUserRights(2, true);
  Id := -1;
  if ShowUserDetailForm(Id, false) then
  begin
    aRefreshExecute(nil);
    cdsUsers.Locate('Id_User', Id, [loCaseInsensitive]);
  end;
end;

procedure TfUsers.aEditExecute(Sender: TObject);
var
  Id : integer;
begin
 // DM.Rights_GetUserRights(2, true);
  Id := cdsUsersid_User.AsInteger;
  if ShowUserDetailForm(Id, false) then
  begin
    aRefreshExecute(nil);
    cdsUsers.Locate('Id_User', Id, [loCaseInsensitive]);
  end;
end;

procedure TfUsers.aDelExecute(Sender: TObject);
var i : integer;
    S : String;
    b : boolean;
begin
  S := 'Удалить пользователя ' + cdsUsersFIO.AsString + '?';
  if AdvMessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      DM.rsCA.AppServer.USR_UserDel(cdsUsersid_User.AsInteger);
    finally
      aRefresh.Execute;
    end;
  end;
end;

procedure TfUsers.aRefreshExecute(Sender: TObject);
begin
  FixIdRefresh(cdsUsers, 'id_user');
end;

procedure TfUsers.aAccCardExecute(Sender: TObject);
begin
//*
end;

constructor TfUsers.Create(AOwner: TComponent);
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
  if TmpOwner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
  inherited;

end;

procedure TfUsers.Initialize;
begin
  cdsUsers.Close;
  cdsUsers.Params.ParamByName('@id_User').Value := DM.ID_User;
  cdsUsers.Open;
end;

procedure TfUsers.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfUsers.FilterEditChange(Sender: TObject);
begin
  with cdsUsers do
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

procedure TfUsers.cdsUsersFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('FIO').AsString)) > 0);
end;

end.
