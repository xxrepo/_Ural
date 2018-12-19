unit uReplicatorsFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, ImgList, ActnList, Db,
  DBClient,
  foMyFunc, StdCtrls, ExtCtrls, Menus;

type
  TReplicatorsFrame = class(TFrame)
    DataSource: TDataSource;
    cdsReplicators: TClientDataSet;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    ImageList: TImageList;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    RxDBGrid1: TRxDBGrid;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
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
    procedure cdsReplicatorsAfterOpen(DataSet: TDataSet);
    procedure cdsReplicatorsFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
    procedure CheckEmptyDS;
  public
    { Public declarations }
    ReadOnly:boolean;
    function Init(Aid_Business: Variant):boolean;
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation
    uses uDM, uNSIDetailFormsAPI;
{$R *.DFM}
constructor TReplicatorsFrame.Create(AOwner:TComponent);
begin
 inherited;
  if Owner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
end;

destructor TReplicatorsFrame.Destroy;
begin
  if Owner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
 inherited;
end;

function TReplicatorsFrame.Init(Aid_Business: Variant):boolean;
begin
 if ReadOnly then
  begin
    aAdd.Enabled:=False;
    aDel.Enabled:=False;
  end;
 with cdsReplicators do
    begin
    Close;
    if AId_Business<>NULL then
     Params.ParamByName('Id_Business').Value:=AId_Business;
    Open;
   end;

end;

procedure TReplicatorsFrame.aAddExecute(Sender: TObject);
var
 ID:Variant;
begin
 ID:=-1;
 if ShowReplicatorDetailForm(ID, ReadOnly) then
  begin
   aRefreshExecute(nil);
   cdsReplicators.Locate('id_Replicator', Id, [loCaseInsensitive]);
  end;
end;

procedure TReplicatorsFrame.aEditExecute(Sender: TObject);
var
 ID:Variant;
begin
 ID:=cdsReplicators.FieldByName('id_Replicator').Value;
 if ShowReplicatorDetailForm(ID, ReadOnly) then
 aRefreshExecute(nil);
 cdsReplicators.Locate('id_Replicator', Id, [loCaseInsensitive]);
end;

procedure TReplicatorsFrame.aRefreshExecute(Sender: TObject);
 var
  Id:Integer;
begin
with  cdsReplicators do
   begin
   Id:=FieldByName('id_Replicator').AsInteger;
   Close;
   Open;
   Locate('id_Replicator', Id, [loCaseInsensitive]);
  end;
end;

procedure TReplicatorsFrame.aDelExecute(Sender: TObject);
  var
  Act:Variant;
  ID:Variant;
begin
 if MessageBox(Handle, 'Вы действительно хотите удалить запись?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idYes then
    Exit;

    Act:=2;
   ID:=cdsReplicators.FieldByName('id_Replicator').Value;
   DM.rsCA.AppServer.SetReplicatorDetail(
    Act,
    Id,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
    );
 aRefreshExecute(nil)
end;

procedure TReplicatorsFrame.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').Value then
    begin
      AFont.Color := clGray;
      AFont.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;
end;

procedure TReplicatorsFrame.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TReplicatorsFrame.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TReplicatorsFrame.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TReplicatorsFrame.FilterEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TReplicatorsFrame.FilterEditChange(Sender: TObject);
begin
  with cdsReplicators     do
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
  CheckEmptyDS;
end;

procedure TReplicatorsFrame.CheckEmptyDS;
begin
 if cdsReplicators.IsEmpty then
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

procedure TReplicatorsFrame.cdsReplicatorsAfterOpen(DataSet: TDataSet);
begin
 CheckEmptyDS;
end;

procedure TReplicatorsFrame.cdsReplicatorsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

end.
