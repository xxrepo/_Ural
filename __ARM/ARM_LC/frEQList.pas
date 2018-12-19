unit frEQList;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, ImgList, Db, DBClient,
  ActnList,
  foMyFunc, Menus, StdCtrls, ExtCtrls;

type
  TfEQList = class(TFrame)
    DataSource: TDataSource;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    cdsEquips: TClientDataSet;
    ImageList: TImageList;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    RxDBGrid1: TRxDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameDblClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure FilterEditChange(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    ReadOnly:boolean;
    ID_Business:Integer;
  public
    { Public declarations }
    function Init(AID_Business, Aid_User, AUID:Variant; AReadOnly:boolean=false; ShowToolBar:boolean=false; AShowBsn : boolean = true):boolean;
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation
    uses uDM;

{$R *.DFM}
constructor TfEQList.Create(AOwner:TComponent);
var TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
{$IFDEF LC}
  aDel.Visible := false;
{$ENDIF}
end;

destructor TfEQList.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if GetControlOwner(self) is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
 inherited;
end;

function TfEQList.Init(AID_Business, Aid_User, AUID:Variant; AReadOnly:boolean=false; ShowToolBar:boolean=false; AShowBsn : boolean = true) : boolean;
var
 v:string;
begin
  ID_Business:=-1;
  ReadOnly := AReadOnly;
  ToolBar.Visible:=ShowToolBar;
  aAdd.Enabled := not AReadOnly;
  RxDBGrid1.Columns[1].Visible := AShowBsn;
  with cdsEquips do
  begin
    Close;
    ID_Business := AId_Business;
    Params.ParamByName('@ID_Business').Value := Id_Business;
    Params.ParamByName('@id_User').Value := DM.IDUser;
    Params.ParamByName('@UID').Value := AUID;

    Open;
  end;
end;

procedure TfEQList.aAddExecute(Sender: TObject);
var
  ID:Variant;
  S : String;
  id_Bsn : Variant;
begin
  ID:=-1;
  if InputBoxKrm('Новое оборудование - бизнес "' + DM.GetBusinessName(ID_Business) + '"', 'Название', S) then
  begin
    if ID_Business = -1 then
      id_Bsn := Null
    else
      id_Bsn := ID_Business;
      
    ID := DM.rsCA.AppServer.LC_EQ_Add(S, id_Bsn);
    with cdsEquips do
    begin
      Close;
      Open;
      Locate('id_Equipment', ID, []);
    end;
  end;
end;

procedure TfEQList.aEditExecute(Sender: TObject);
var
  ID:Variant;
  S : String;
  id_Bsn : Variant;
begin
  ID := cdsEquips.FieldByName('id_Equipment').Value ;
  S := cdsEquips.FieldByName('Name').Value ;
  if InputBoxKrm('Оборудование', 'Название', S) then
  begin
    if DM.rsCA.AppServer.LC_EQ_Edit(ID, S) = 1 then
      with cdsEquips do
      begin
        Close;
        Open;
        Locate('id_Equipment', ID, []);
      end;
  end;
end;

procedure TfEQList.aRefreshExecute(Sender: TObject);
var
 ID:Variant;
begin
 ID:=cdsEquips.FieldByName('id_Equipment').Value ;
 with cdsEquips do
  begin
   FieldByName('id_Equipment').AsInteger;
   Close;
   Open;
   Locate('id_Equipment', Id, [loCaseInsensitive]);
  end;
end;

procedure TfEQList.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
{  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').Value then
    begin
      AFont.Color := clGray;
      AFont.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end; }
end;

procedure TfEQList.FrameDblClick(Sender: TObject);
begin
 aEditExecute(nil);
end;

procedure TfEQList.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfEQList.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfEQList.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfEQList.FilterEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfEQList.FilterEditChange(Sender: TObject);
begin
  with cdsEquips   do
  begin
    DisableControls;
    try
      Filtered := False;
      if Trim(FilterEdit.Text) = '' then
        Filter := ''
      else
        Filter := '(Name) LIKE ''%' + Trim(FilterEdit.Text) + '%''' + ' OR Upper(Name)=' + '''' + AnsiUpperCase(Trim(FilterEdit.Text)) + '''';
      FilterOptions := [foCaseInsensitive];

      Filtered := Filter <> '';
    finally
      EnableControls;
    end;
  end;
end;


procedure TfEQList.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsEquips.IsEmpty and not ReadOnly
                   and (cdsEquips.FieldByName('ID_Main').IsNull);
  aDel.Enabled := not cdsEquips.IsEmpty and not ReadOnly
                   and (cdsEquips.FieldByName('ID_Main').IsNull);
end;

procedure TfEQList.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var R : TRect;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;

  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('id_Main').IsNull then
  begin
    if not (gdSelected in State) then
      (Sender as TDBGrid).Canvas.Font.Color := colorNonViza;
    (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
  end;
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
