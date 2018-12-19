unit frUsersListLC;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ToolWin, ComCtrls, Grids, DBGrids, RXDBCtrl, ActnList, ImgList,
  DBClient,
  foMyFunc, Menus, StdCtrls, ExtCtrls;

type
  TfUsersListLC = class(TFrame)
    DataSource: TDataSource;
    RxDBGrid1: TRxDBGrid;
    ImageList: TImageList;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
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
    cdsUsersLastUpdated: TBytesField;
    cdsUsersOrgPost: TStringField;
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
    procedure cdsUsersFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    { Private declarations }
  protected
  public
    { Public declarations }

    function Init(id_Bsn:Variant; AID : Variant):boolean;
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation
     uses  uDM;
{$R *.DFM}
constructor TfUsersListLC.Create(AOwner:TComponent);
begin
 inherited;
  if (Owner is TCustomForm) or (Owner is TCustomFrame) then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).Name + '\' + ClassName);
  end;
end;

destructor TfUsersListLC.Destroy;
begin
  if (Owner is TCustomForm) or (Owner is TCustomFrame) then
   begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).Name + '\' + ClassName);
  end;
 inherited;
end;

function TfUsersListLC.Init(id_Bsn:Variant; AID : Variant):boolean;
begin
  with cdsUsers do
  begin
    Close;
    Params.ParamByName('@ID_Business').Value:=id_Bsn;
    Open;
    if AID <> Null then
      Locate('id_user', AID, [])
  end;
end;


procedure TfUsersListLC.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
{  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').Value then
    begin
      AFont.Color := clGray;
      AFont.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;     }
end;

procedure TfUsersListLC.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfUsersListLC.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfUsersListLC.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfUsersListLC.FilterEditChange(Sender: TObject);
begin
  with cdsUsers    do
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

procedure TfUsersListLC.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfUsersListLC.cdsUsersFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('LastName').AsString)) > 0);
end;

end.
