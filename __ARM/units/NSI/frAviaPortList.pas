unit frAviaPortList;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ImgList, ActnList, Db,
  DBClient, StdCtrls, ExtCtrls;

type
  TfAviaPortList = class(TFrame)
    ActionList1: TActionList;
    aNew: TAction;
    aRefreshe: TAction;
    aEdit: TAction;
    aDelete: TAction;
    ImageList1: TImageList;
    RxDBGrid1: TRxDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    cdsAV_AviaPortGetList: TClientDataSet;
    cdsAV_AviaPortGetListid_AviaPort: TAutoIncField;
    cdsAV_AviaPortGetListCode: TStringField;
    cdsAV_AviaPortGetListName: TStringField;
    cdsAV_AviaPortGetListid_City: TIntegerField;
    cdsAV_AviaPortGetListCityName: TStringField;
    cdsAV_AviaPortGetListid_Country: TIntegerField;
    cdsAV_AviaPortGetListCountryNAme: TStringField;
    cdsAV_AviaPortGetListAviaPortNameFull: TStringField;
    dsAV_AviaPortGetList: TDataSource;
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    procedure aNewExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure dsAV_AviaPortGetListDataChange(Sender: TObject;
      Field: TField);
  private
    { Private declarations }
  public
    procedure Initialize;
  end;

implementation

uses foMyFunc, foClasses, uDM, uManagerFormsAPI;

{$R *.DFM}

procedure TfAviaPortList.aNewExecute(Sender: TObject);
var ID : integer;
begin
  ID := -1;
  if EditAviaPort(ID) then
  begin
    aRefreshe.Execute;
    cdsAV_AviaPortGetList.Locate('id_AviaPort', ID, []);
  end;
end;

procedure TfAviaPortList.aRefresheExecute(Sender: TObject);
var ID : Variant;
begin
  with cdsAV_AviaPortGetList do
  begin
    DisableControls;
    try
      ID := FieldByName('id_AviaPort').Value;
      Close;
      Open;
      Locate('id_AviaPort', ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfAviaPortList.aEditExecute(Sender: TObject);
var ID : integer;
begin
  ID := cdsAV_AviaPortGetList.FieldByName('id_AviaPort').AsInteger;
  if EditAviaPort(ID) then
  begin
    aRefreshe.Execute;
  end;
end;

procedure TfAviaPortList.aDeleteExecute(Sender: TObject);
begin
//*
end;

procedure TfAviaPortList.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfAviaPortList.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfAviaPortList.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aEdit.Execute;
end;

procedure TfAviaPortList.Initialize;
begin
  with cdsAV_AviaPortGetList do
  begin
    Close;
    Open;
  end;
end;

procedure TfAviaPortList.Edit1Change(Sender: TObject);
begin
  with cdsAV_AviaPortGetList do
  begin
    DisableControls;
    try
      Filtered := False;
      if Trim(Edit1.Text) = '' then
        Filter := ''
      else
        cdsAV_AviaPortGetList.Filter := 'UPPER(Code) LIKE ''' + Trim(AnsiUpperCase(Edit1.Text)) + '%''';
      Filtered := Filter <> '';
    finally
      EnableControls;
    end;
  end;
end;

procedure TfAviaPortList.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfAviaPortList.dsAV_AviaPortGetListDataChange(Sender: TObject;
  Field: TField);
begin
  aEdit.Enabled := not cdsAV_AviaPortGetList.IsEmpty;
end;

end.
