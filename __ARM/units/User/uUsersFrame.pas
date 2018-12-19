unit uUsersFrame;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ToolWin, ComCtrls, Grids, DBGrids, RXDBCtrl, ActnList, ImgList,
  DBClient,
  foMyFunc, Menus, StdCtrls, ExtCtrls;

type
  TUsersFrame = class(TFrame)
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
    cdsUsers: TClientDataSet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    cdsUsersid_User: TAutoIncField;
    cdsUsersFirstName: TStringField;
    cdsUsersMiddleName: TStringField;
    cdsUsersLastName: TStringField;
    cdsUsersLogin: TStringField;
    cdsUsersPassword: TStringField;
    cdsUsersDisabled: TBooleanField;
    cdsUsersPspSeries: TStringField;
    cdsUsersPspNumber: TStringField;
    cdsUsersPspPlace: TStringField;
    cdsUsersPspDate: TDateTimeField;
    cdsUsersPspAddr: TStringField;
    cdsUsersAddrReal: TStringField;
    cdsUsersPhones: TStringField;
    cdsUsersEmails: TStringField;
    cdsUsersOrgPost: TStringField;
    cdsUsersLastUpdated: TBytesField;
    cdsUsersid_Main: TIntegerField;
    cdsUsersisRelp: TBooleanField;
    cdsUsersid_UADM: TBooleanField;
    cdsUsersisPPP: TBooleanField;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure FilterEditChange(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure cdsUsersAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
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
     uses  uDM, uUsersDetailFormsAPI, uGroupsFrame;
{$R *.DFM}
constructor TUsersFrame.Create(AOwner:TComponent);
var TmpOwner: TCustomForm;
    i : integer;
begin
  inherited;
  if not DM.CheckUserRights(-13, -1) then
  begin
    for i := 0 to RxDBGrid1.Columns.Count - 1 do
    begin
      if RxDBGrid1.Columns[i].Field = cdsUsersid_UADM then
      begin
        RxDBGrid1.Columns[i].Free;
        Break;
      end;
    end;
  end;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
end;

destructor TUsersFrame.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if GetControlOwner(self) is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
 inherited;
end;

function TUsersFrame.Init(id_Group:integer=-1):boolean;
begin
 if ReadOnly then
  begin
    aAdd.Enabled:=False;
    aDel.Enabled:=False;
  end;
   cdsUsers.Close;
    if Id_Group>-1 then
     cdsUsers.Params.ParamByName('id_Group').AsInteger:=Id_Group;
   cdsUsers.Open;
end;
procedure TUsersFrame.aAddExecute(Sender: TObject);
begin
  AddUser;
end;

procedure TUsersFrame.AddUser;
var
 Id:Variant;
begin
 Id:=-1;
 if  ShowUserDetailForm(Id, ReadOnly) then
  begin
   aRefreshExecute(nil);
   cdsUsers.Locate('Id_User',Id,[loCaseInsensitive]);
  end;
end;

procedure TUsersFrame.aEditExecute(Sender: TObject);
begin
  EditUser;
end;

procedure TUsersFrame.EditUser;
var
 Id:Variant;
begin
 Id:=cdsUsers.FieldByname('Id_User').Value;
 if ShowUserDetailForm(Id,ReadOnly) then
    aRefreshExecute(nil);
 cdsUsers.Locate('id_User', Id, [loCaseInsensitive]);
end;

procedure TUsersFrame.aDelExecute(Sender: TObject);
var
 Act:Variant;
begin
 if MessageBox(Handle, 'Вы действительно хотите удалить запись?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idYes then
    Exit;
  Act:=2;
  DM.rsCA.AppServer.SetUserDetail_2(Act, DataSource.DataSet.FieldByname('Id_User').Value,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  true,
  true,
  true);
  aRefreshExecute(nil);
end;

procedure TUsersFrame.aRefreshExecute(Sender: TObject);
var
 id:Integer;
begin
with cdsUsers do
   begin
    Id:=FieldByName('id_User').AsInteger;
    Close;
    Open;
    Locate('id_User', Id, [loCaseInsensitive]);
  end;
end;

procedure TUsersFrame.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').Value then
    begin
      AFont.Color := clGray;
      AFont.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;
end;

procedure TUsersFrame.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TUsersFrame.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TUsersFrame.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TUsersFrame.FilterEditChange(Sender: TObject);
begin
  with cdsUsers    do
  begin
    DisableControls;
    try
      Filtered := False;
      if Trim(FilterEdit.Text) = '' then
        Filter := ''
      else
        Filter := '(LastName) LIKE ''%' + Trim(FilterEdit.Text) + '%''' + ' OR Upper(LastName)=' + '''' + AnsiUpperCase(Trim(FilterEdit.Text)) + '''';
      FilterOptions := [foCaseInsensitive	];

      Filtered := Filter <> '';
    finally
      EnableControls;
    end;
  end;
  CheckEmptyDS;
end;

procedure TUsersFrame.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TUsersFrame.CheckEmptyDS;
begin
 if cdsUsers.IsEmpty then
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

procedure TUsersFrame.cdsUsersAfterOpen(DataSet: TDataSet);
begin
 CheckEmptyDS;
end;

end.
