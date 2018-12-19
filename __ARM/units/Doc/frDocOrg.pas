unit frDocOrg;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ActnList, ImgList, Db, DBClient, ComCtrls, ToolWin, StdCtrls,
  ExtCtrls, Grids, DBGrids, RXDBCtrl;

type
  TfDocOrg = class(TFrame)
    ImageList: TImageList;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    aSelAll: TAction;
    aExcelExp: TAction;
    aSetDef: TAction;
    aUnSetDef: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N8: TMenuItem;
    N3: TMenuItem;
    cdsDocOrg: TClientDataSet;
    DataSource1: TDataSource;
    cdsDocOrgid_Doc_Org: TAutoIncField;
    cdsDocOrgOrgName: TStringField;
    cdsDocOrgAddress: TStringField;
    cdsDocOrgChif: TStringField;
    cdsDocOrgBuh: TStringField;
    cdsDocOrgOKPO: TStringField;
    cdsDocOrgOKPD: TStringField;
    cdsDocOrgINN: TBCDField;
    cdsDocOrgid_business: TIntegerField;
    cdsDocOrgKPP: TStringField;
    cdsDocOrgDefOrg: TBooleanField;
    cdsDocOrgVAT: TBCDField;
    RxDBGrid1: TRxDBGrid;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    cdsDocOrgDisabledOrg: TBooleanField;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FilterEditChange(Sender: TObject);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure cdsDocOrgFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
  private
    Fid_Bsn : integer;
  public
    procedure Initialize(id_Bsn : integer);

    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses uDM, foMyFunc, uDocOrg;

{$R *.DFM}

procedure TfDocOrg.aAddExecute(Sender: TObject);
var id_Doc_Org : integer;
begin
  id_Doc_Org := -1;
  if EditDocOrg(Fid_Bsn, id_Doc_Org) then
  begin
    aRefresh.Execute;
    cdsDocOrg.Locate('id_Doc_Org', id_Doc_Org, []);
  end;
end;

procedure TfDocOrg.aEditExecute(Sender: TObject);
var id_Doc_Org : integer;
begin
  id_Doc_Org := cdsDocOrgid_Doc_Org.AsInteger;
  if EditDocOrg(Fid_Bsn, id_Doc_Org) then
  begin
    aRefresh.Execute;
    cdsDocOrg.Locate('id_Doc_Org', id_Doc_Org, []);
  end;
end;

procedure TfDocOrg.aDelExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить значение?'), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    DM.rsCA.AppServer.Doc_OrgDel(cdsDocOrgid_Doc_Org.AsInteger);
  end;
end;

procedure TfDocOrg.aRefreshExecute(Sender: TObject);
var id_Doc_Org : integer;
begin
  id_Doc_Org := cdsDocOrgid_Doc_Org.AsInteger;
  cdsDocOrg.Close;
  cdsDocOrg.Open;
  cdsDocOrg.Locate('id_Doc_Org', id_Doc_Org, []);
end;

procedure TfDocOrg.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsDocOrg.IsEmpty;
  aDel.Enabled := not cdsDocOrg.IsEmpty;
end;

procedure TfDocOrg.Initialize(id_Bsn: integer);
begin
  Fid_Bsn := id_Bsn;
  aAdd.Enabled := Fid_Bsn > 0;
  with cdsDocOrg do
  begin
    Close;
    Params.ParamByName('@id_business').Value := Fid_Bsn;
    Open;
  end;
end;

procedure TfDocOrg.FilterEditChange(Sender: TObject);
begin
  with cdsDocOrg do
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

procedure TfDocOrg.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfDocOrg.cdsDocOrgFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('OrgName').AsString)) > 0);
end;

procedure TfDocOrg.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfDocOrg.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfDocOrg.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;
    
  if (Column.Field is TBooleanField) then
  begin
    if Column.Field.AsBoolean then
      Style := DFCS_CHECKED
    else
      Style := DFCS_BUTTONCHECK;

    R := Rect;
    cbSize := 15;
    if R.Bottom - R.Top > cbSize then
    begin
      R.Top := R.Top + (R.Bottom - R.Top - cbSize) div 2;
      R.Bottom := R.Top + cbSize;
    end;
    if R.Right - R.Left < cbSize then
    begin
      R.Right := R.Left + cbSize;
    end;

    if gdSelected in State then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clHighlight;
      TDBGrid(Sender).Canvas.FillRect(Rect);
    end;
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, Style);
  end
  else
  begin
    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfDocOrg.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

constructor TfDocOrg.Create(AOwner: TComponent);
begin
  inherited;
  if Owner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
end;

destructor TfDocOrg.Destroy;
begin
  if Owner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
  inherited;
end;

end.
