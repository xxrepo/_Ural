unit uGroupsFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, Db, ActnList, ImgList,
  DBClient, ExtCtrls, uUsersFrame, Registry,
  foMyFunc, Menus, StdCtrls;

type
  TGroupsFrame = class(TFrame)
    ImageList: TImageList;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    DataSource: TDataSource;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    RxDBGrid1: TRxDBGrid;
    cdsGroups: TClientDataSet;
    Splitter1: TSplitter;
    UsersFrame1: TUsersFrame;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    cdsGroupsid_Group: TAutoIncField;
    cdsGroupsName: TStringField;
    cdsGroupsDisabled: TBooleanField;
    cdsGroupsLastUpdated: TBytesField;
    cdsGroupsid_Main: TIntegerField;
    cdsGroupsisAdmin: TBooleanField;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
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
    procedure cdsGroupsAfterScroll(DataSet: TDataSet);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure cdsGroupsFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  protected
    procedure AddGroup;
    procedure EditGroup;
    procedure CheckEmptyDS;
    procedure  ReloadUsers;
    procedure LoadSplitterSettingsFromRegistry(const ASplitter : TSplitter; APath : String);
    procedure SaveSplitterSettingsFromRegistry(const ASplitter : TSplitter; APath : String);

  public
    ReadOnly:boolean;
    function Init:boolean;
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation
     uses uDM,  uFormsAPI_Users, uUsersDetailFormsAPI;
{$R *.DFM}


procedure TGroupsFrame.LoadSplitterSettingsFromRegistry(const ASplitter : TSplitter; APath : String);
var Reg : TRegistry;
    NewOptions : TIndexOptions;
    S : String;
begin
  try
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(APath, false) then
          if Reg.ValueExists(ASplitter.Name+'_Top') then
            RxDBGrid1.Height:= Reg.ReadInteger(ASplitter.Name+'_Top');
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  except
  end;
end;


procedure TGroupsFrame.SaveSplitterSettingsFromRegistry(const ASplitter : TSplitter; APath : String);
var Reg : TRegistry;
    NewOptions : TIndexOptions;
    S : String;
begin
  try
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(APath, true) then
            Reg.WriteInteger(ASplitter.Name+'_Top',RxDBGrid1.Height);
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  except
  end;
end;

constructor TGroupsFrame.Create(AOwner:TComponent);
begin
 inherited;
  if Owner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
end;

destructor TGroupsFrame.Destroy;
begin
  if Owner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
    SaveSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
 inherited;
end;

function TGroupsFrame.Init:boolean;
begin
 if ReadOnly then
  begin
    aAdd.Enabled:=False;
    aDel.Enabled:=False;
  end;
  DataSource.DataSet.Open;
  LoadSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
end;

procedure TGroupsFrame.aAddExecute(Sender: TObject);
begin
 AddGroup;
end;

procedure TGroupsFrame.AddGroup;
var
 Id:Variant;
begin
  Id:=-1;
  if  ShowGroupDetailForm(Id) then
  begin
    aRefreshExecute(nil);
    cdsGroups.Locate('Id_Group', Id, []);
  end;
end;

procedure TGroupsFrame.aEditExecute(Sender: TObject);
begin
  EditGroup;
end;

procedure TGroupsFrame.EditGroup;
var
 Id:Variant;
begin
  Id:=cdsGroups.FieldByname('id_Group').Value;
  if  ShowGroupDetailForm(Id, ReadOnly) then
  begin
    aRefreshExecute(nil);
    cdsGroups.Locate('id_Group', Id, []);
  end;
end;
procedure TGroupsFrame.aRefreshExecute(Sender: TObject);
 var
  id:Integer;
begin
  Id:=cdsGroups.FieldByName('id_Group').AsInteger;
  cdsGroups.Close;
  cdsGroups.Open;
  cdsGroups.Locate('id_Group', Id, [loCaseInsensitive]);
end;

procedure TGroupsFrame.aDelExecute(Sender: TObject);
 var
  Act, Id:Variant;
begin
  if UsersFrame1.cdsUsers.RecordCount>0 then
    begin
     ShowMessage('В группе существуют неудаленные пользователи.'+#10+#13+'Группу можно удалить только после их удаления!');
     Exit;
    end;
 if MessageBox(Handle, 'Вы действительно хотите удалить запись?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idYes then
    Exit;

  Act:=2;
  Id:=cdsGroups.FieldByname('id_Group').Value;
  DM.rsCA.AppServer.SetGroupDetail(
    Act,
    Id,
    NULL, true);
  aRefreshExecute(nil);
end;

procedure TGroupsFrame.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').Value then
    begin
      AFont.Color := clGray;
      AFont.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;
end;

procedure TGroupsFrame.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TGroupsFrame.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TGroupsFrame.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TGroupsFrame.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TGroupsFrame.FilterEditChange(Sender: TObject);
begin
  with cdsGroups  do
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

procedure TGroupsFrame.CheckEmptyDS;
begin
 if cdsGroups.IsEmpty then
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

procedure TGroupsFrame.cdsGroupsAfterScroll(DataSet: TDataSet);
begin
 ReloadUsers;
end;

procedure  TGroupsFrame.ReloadUsers;
begin
 UsersFrame1.cdsUsers.Params.ParamByName('CallType').Value:=2;
 UsersFrame1.Init(cdsGroups.FieldByName('id_Group').AsInteger);
end;

procedure TGroupsFrame.DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  CheckEmptyDS;
end;

procedure TGroupsFrame.cdsGroupsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

end.
