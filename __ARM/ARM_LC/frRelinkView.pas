unit frRelinkView;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, Db, DBClient, ImgList, ActnList, ComCtrls,
  ToolWin;

type
  TfRelinkView = class(TFrame)
    RxDBGrid1: TRxDBGrid;
    cdsEquips: TClientDataSet;
    DataSource: TDataSource;
    ilEM: TImageList;
    ImageList: TImageList;
    ToolBar: TToolBar;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    cdsEquipsid_link: TIntegerField;
    cdsEquipsType: TIntegerField;
    cdsEquipsTypeName: TStringField;
    cdsEquipsID_old: TIntegerField;
    cdsEquipsName_Old: TStringField;
    cdsEquipsID_New: TIntegerField;
    cdsEquipsName_New: TStringField;
    cdsEquipsLastUpdated: TBytesField;
    cdsEquipsid_business_Old: TIntegerField;
    cdsEquipsid_business_New: TIntegerField;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure aRefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;

    procedure Initialize;
  end;

implementation

uses uDM, foMyFunc;

{$R *.DFM}

procedure TfRelinkView.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfRelinkView.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfRelinkView.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;

  if Column.Field = cdsEquipsType then
  begin
    case Column.Field.AsInteger of
      1 : ImgIndex := 0;
      2 : ImgIndex := 1;
      3 : ImgIndex := 2;
      4 : ImgIndex := 2;
      5 : ImgIndex := 3;
      6 : ImgIndex := 4;
      7 : ImgIndex := 5;
      8 : ImgIndex := 6;
      9 : ImgIndex := 7;
      10 : ImgIndex := 8;
      11..14 : ImgIndex := 9;
      else
        ImgIndex := -1;
    end;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    ilEM.Draw(TDBGrid(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
  end
  else
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

constructor TfRelinkView.Create(AOwner: TComponent);
var TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
end;

destructor TfRelinkView.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if GetControlOwner(self) is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
 inherited;
end;

procedure TfRelinkView.Initialize;
begin
  cdsEquips.Open;
end;

procedure TfRelinkView.aRefreshExecute(Sender: TObject);
begin
  cdsEquips.Close;
  cdsEquips.Open;
end;

end.
