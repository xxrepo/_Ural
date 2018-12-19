unit frBSN;

interface

uses 
  Windows, Menus, Classes, ActnList, ImgList, Controls, DB, StdCtrls,
  ExtCtrls, Forms, Graphics, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, DBTables, foMyFunc,
  ADODB, {$IFDEF VER150} Variants,{$ENDIF} SysUtils, AdvMenus;

type
  TfBSN = class(TFrame)
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
    qryBSN: TADOQuery;
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
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
  private
    ASort : String;
    procedure CheckEmptyDS;
  protected
     procedure   AddUser;
     procedure   EditUser;

  public
    { Public declarations }
    ReadOnly:boolean;
    function Init :boolean;
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation
     uses  uDM, uUserProp, uMain;
{$R *.DFM}
constructor TfBSN.Create(AOwner:TComponent);
var TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
end;

destructor TfBSN.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if GetControlOwner(self) is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
 inherited;
end;

function TfBSN.Init :boolean;
var V : Variant;
begin
 if ReadOnly then
  begin
    aAdd.Enabled:=False;
    aDel.Enabled:=False;
  end;
   qryBSN.Close;
   qryBSN.Parameters.ParamByName('id_User').Value := DM.id_User;
   qryBSN.Open;
end;
procedure TfBSN.aAddExecute(Sender: TObject);
begin
  AddUser;
end;

procedure TfBSN.AddUser;
var AName : String;
    aID : integer;
begin
  AName := '';

  if DM.InputBox_ObjName('Название', 'Новый Бизнес', AName) then
  begin
    DM.ExecSQL('insert into dw_Bsn(BsnName) values(' + '''' + AName + '''' + ')');
    aID := DM.GetMaxID('select max(Id_BSN) as ID from dw_Bsn');
    DM.ExecSQL('insert into DW_UTB(Id_BSN, id_User) values(' + IntToStr(AID) + ', ' + IntToStr(DM.id_User) + ')');
     aRefreshExecute(nil);
    qryBSN.Locate('Id_BSN',aID,[loCaseInsensitive]);
    Main.GetBSNList(aID);
  end;
end;

procedure TfBSN.aEditExecute(Sender: TObject);
begin
  EditUser;
end;

procedure TfBSN.EditUser;
var AName : String;
    aID : integer;
begin
  AName := qryBSN.FieldByName('BsnName').AsString;
  aID := qryBSN.FieldByName('Id_BSN').AsInteger;
  if DM.InputBox_ObjName('Название', 'Бизнес', AName) then
  begin
    DM.ExecSQL('update dw_Bsn set BsnName=' + '''' + AName + '''' + ' where Id_BSN=' + qryBSN.FieldByName('Id_BSN').AsString);
    aRefreshExecute(nil);
    qryBSN.Locate('Id_BSN',aID,[loCaseInsensitive]);
    Main.GetBSNList(aID);
  end;
end;

procedure TfBSN.aDelExecute(Sender: TObject);
var ID : integer;
begin
  DM.Rights_GetUserRights(2, true);
  ID := qryBSN.FieldByName('Id_BSN').AsInteger;
  if MessageBox(Handle, PChar('Удалить бизнес "' + qryBSN.FieldByName('BsnName').AsString + '"?'), '', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    if DM.ExecSQL('update DW_BSN set BSNDeleted = 1 WHERE id_BSN=' + IntToStr(ID)) then
    begin
      aRefresh.Execute;
      Main.GetBSNList(Null);
    end
    else
      raise Exception.Create('Error');   
  end;   
end;

procedure TfBSN.aRefreshExecute(Sender: TObject);
var
 id:Integer;
begin
  with qryBSN do
   begin
    Id:=FieldByName('id_BSN').AsInteger;
    Close;
    Open;
    Locate('id_BSN', Id, [loCaseInsensitive]);
  end;
end;

procedure TfBSN.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfBSN.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderadoCDS(Field, ASort);
end;

procedure TfBSN.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfBSN.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfBSN.CheckEmptyDS;
begin
end;

procedure TfBSN.cdsUsersAfterOpen(DataSet: TDataSet);
begin
 CheckEmptyDS;
end;

procedure TfBSN.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not qryBSN.IsEmpty;
  aDel.Enabled := not qryBSN.IsEmpty;
end;

end.
