unit uEquipFrame;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, ImgList, Db, DBClient,
  ActnList,
  foMyFunc, Menus, StdCtrls, ExtCtrls;

type
  TEquipFrame = class(TFrame)
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
    cdsEquipsid_Equipment: TAutoIncField;
    cdsEquipsid_business: TIntegerField;
    cdsEquipsDisabled: TBooleanField;
    cdsEquipsName: TStringField;
    cdsEquipsDescr: TStringField;
    cdsEquipsLastUpdated: TBytesField;
    cdsEquipsID_Main: TIntegerField;
    cdsEquipsBusinessName: TStringField;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
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
    procedure cdsEquipsAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure CheckEmptyDS;
  public
    { Public declarations }
    ReadOnly:boolean;
    ID_Business:Variant;
    procedure Init(AId_Business:Variant; AReadOnly:boolean=false; ShowToolBar:boolean=false);
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation
    uses uDM, uNSIDetailFormsAPI;

{$R *.DFM}
constructor TEquipFrame.Create(AOwner:TComponent);
var TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
end;

destructor TEquipFrame.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if Owner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
 inherited;
end;

procedure TEquipFrame.Init(AId_Business:Variant; AReadOnly:boolean=false; ShowToolBar:boolean=false);
begin
 ID_Business:=-1;
 ReadOnly:=AReadOnly;
 ToolBar.Visible:=ShowToolBar;
 if ReadOnly then
  begin
    aAdd.Enabled:=False;
    aDel.Enabled:=False;
  end;
  cdsEquips.Close;
  // if AId_Business<>NULL then
    begin
     ID_Business:=AId_Business;
     cdsEquips.Params.ParamByName('@Id_Business').Value:=AId_Business;
    end;
  cdsEquips.Open;
end;

procedure TEquipFrame.aAddExecute(Sender: TObject);
var
 ID:Variant;
begin
 ID:=-1;
 if ShowEquipDetailForm(ID, ReadOnly, ID_Business) then
  begin
    aRefreshExecute(nil);
    cdsEquips.Locate('id_Equipment', Id, [loCaseInsensitive]);
  end;
end;

procedure TEquipFrame.aEditExecute(Sender: TObject);
var
 ID:Variant;
begin
 ID:=cdsEquips.FieldByName('id_Equipment').Value ;
 if ShowEquipDetailForm(ID, ReadOnly,ID_Business) then
 aRefreshExecute(nil);
 cdsEquips.Locate('id_Equipment', Id, [loCaseInsensitive]);
end;

procedure TEquipFrame.aRefreshExecute(Sender: TObject);
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

procedure TEquipFrame.aDelExecute(Sender: TObject);
var
 ID:Variant;
 Act:Variant;
begin
 ID:=cdsEquips.FieldByName('id_Equipment').Value ;
 if MessageBox(Handle, 'Вы действительно хотите удалить запись?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idYes then
    Exit;

    Act:=2;
   DM.SocketConnection.AppServer.SetEquipDetail(
    Act,
    Id,
    NULL,
    NULL,
    NULL,
    NULL
    );
  aRefreshExecute(nil)
end;

procedure TEquipFrame.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').Value then
    begin
      AFont.Color := clGray;
      AFont.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;
end;

procedure TEquipFrame.FrameDblClick(Sender: TObject);
begin
 aEditExecute(nil);
end;

procedure TEquipFrame.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TEquipFrame.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TEquipFrame.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TEquipFrame.FilterEditKeyPress(Sender: TObject;
  var Key: Char);
begin
//  Key := AnsiUpperCase(Key)[1];
end;

procedure TEquipFrame.FilterEditChange(Sender: TObject);
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
  CheckEmptyDS;
end;

procedure TEquipFrame.CheckEmptyDS;
begin
 if cdsEquips.IsEmpty then
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

procedure TEquipFrame.cdsEquipsAfterOpen(DataSet: TDataSet);
begin
 CheckEmptyDS;
end;

procedure TEquipFrame.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
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
