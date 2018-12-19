unit uMeasuresFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, Db, DBClient, ActnList,
  ImgList,
  foMyFunc, Menus, StdCtrls, ExtCtrls;

type
  TMeasuresFrame = class(TFrame)
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
    cdsMeasures: TClientDataSet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    cdsMeasuresid_Measure: TAutoIncField;
    cdsMeasuresid_business: TIntegerField;
    cdsMeasuresName: TStringField;
    cdsMeasuresShortName: TStringField;
    cdsMeasuresid_BaseMeasure: TIntegerField;
    cdsMeasuresKoef: TFloatField;
    cdsMeasuresDisabled: TBooleanField;
    cdsMeasuresLastUpdated: TBytesField;
    cdsMeasuresID_Main: TIntegerField;
    cdsMeasuresOKEI: TStringField;
    procedure aAddExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
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
    procedure cdsMeasuresAfterOpen(DataSet: TDataSet);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure cdsMeasuresFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
    procedure CheckEmptyDS;
  public
    FId_Business : Variant;
    ReadOnly:boolean;
    Id_BaseMeasure:Integer;
    BaseName:String;
    procedure Init(AId_Business:Variant );
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.DFM}
    uses uDM, uNSIDetailFormsAPI;

constructor TMeasuresFrame.Create(AOwner:TComponent);
begin
 BaseName:='';
 Id_BaseMeasure:=-1;
 inherited;
  if Owner is TCustomForm then
   begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
end;

destructor TMeasuresFrame.Destroy;
begin
  if Owner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
 inherited;
end;

procedure TMeasuresFrame.Init(AId_Business:Variant );
begin
  if AId_Business = Null then AId_Business := -333;
  FId_Business := AId_Business;
 if ReadOnly then
  begin
    aAdd.Enabled:=False;
    aDel.Enabled:=False;
  end;
  with cdsMeasures do
   begin
    Close;
    if AId_Business<>NULL then
      Params.ParamByName('Id_Business').AsInteger:=FId_Business;
      Params.ParamByName('Id_Base').AsInteger:=Id_BaseMeasure;
    Open;
   end;

  aAdd.Enabled := not ReadOnly and (Id_BaseMeasure <> -13) and (AId_Business > 0);
end;

procedure TMeasuresFrame.aAddExecute(Sender: TObject);
var
 ID:Variant;
begin
 ID:=-1;
 if ShowMeasureDetailForm(ID, ReadOnly, Id_BaseMeasure, BaseName, FId_Business) then
  begin
   aRefreshExecute(nil);
   cdsMeasures.Locate('id_Measure', Id, [loCaseInsensitive]);
  end;
end;

procedure TMeasuresFrame.aRefreshExecute(Sender: TObject);
var
 Id:Integer;
begin
 with cdsMeasures do
  begin
   Id:=FieldByName('id_Measure').AsInteger;
   Close;
   Open;
   Locate('id_Measure', Id, [loCaseInsensitive]);
  end;
end;

procedure TMeasuresFrame.aEditExecute(Sender: TObject);
var
 ID:Variant;
begin
 ID:=cdsMeasures.FieldByName('id_Measure').Value;
 if ShowMeasureDetailForm(ID, ReadOnly, Id_BaseMeasure, BaseName, FId_Business) then
   aRefreshExecute(nil);
 cdsMeasures.Locate('id_Measure', Id, [loCaseInsensitive]);
end;

procedure TMeasuresFrame.aDelExecute(Sender: TObject);
  var
  Act:Variant;
  ID:Variant;
begin
 if MessageBox(Handle, 'Вы действительно хотите удалить запись?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idYes then
    Exit;

    Act:=2;
    ID:=cdsMeasures.FieldByName('id_Measure').Value;
   DM.rsCA.AppServer.SetMeasureDetail(
    Act,
    Id,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
    );
 aRefreshExecute(nil)
end;

procedure TMeasuresFrame.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').Value then
    begin
      AFont.Color := clGray;
      AFont.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;
end;

procedure TMeasuresFrame.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TMeasuresFrame.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TMeasuresFrame.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TMeasuresFrame.FilterEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TMeasuresFrame.FilterEditChange(Sender: TObject);
begin
  with cdsMeasures    do
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

procedure TMeasuresFrame.CheckEmptyDS;
begin
 if cdsMeasures.IsEmpty then
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
procedure TMeasuresFrame.cdsMeasuresAfterOpen(DataSet: TDataSet);
begin
 CheckEmptyDS;
end;

procedure TMeasuresFrame.DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  aEdit.Enabled := not ReadOnly and not cdsMeasures.IsEmpty;
  aDel.Enabled := not ReadOnly and not cdsMeasures.IsEmpty;
end;

procedure TMeasuresFrame.cdsMeasuresFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

end.
