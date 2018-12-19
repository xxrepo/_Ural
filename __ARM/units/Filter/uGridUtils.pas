unit uGridUtils;

interface
uses
  SysUtils, Classes, Controls, Dialogs, dbgrids, Windows,
  StdCtrls, Grids;

type
  TKrmDBGrid = class(TCustomDBGrid)
  private
    function GetCellValue(ACol, ARow: integer): string;
    function GetCurCell: string;
    function GetScrollRowCount: integer;
    function GetScrollColCount: integer;
  public
    property Row;
    property TopRow;
    property Col;
    property LeftCol;
    property RowCount;
    property VisibleRowCount;
    property VisibleColCount;

    property ScrollColCount : integer read GetScrollColCount;
    property ScrollRowCount : integer read GetScrollRowCount;
    property Cell[ACol, ARow : integer] : string read GetCellValue;
    property CurCell : string read GetCurCell;    // “екст из выбранной €чейки
    procedure CalcSomeColumnWidth(Index: integer; MinWidth : integer = 40; MaxWidth : integer = 250);
    procedure CalcColumnsWidth(MinWidth : integer = 40; MaxWidth : integer = 250);
  end;

implementation


{ TKrmDBGrid }

procedure TKrmDBGrid.CalcColumnsWidth(MinWidth, MaxWidth: integer);
var i : integer;
begin
  for i := 0 to Columns.Count - 1 do
  begin
    CalcSomeColumnWidth(DataToRawColumn(i), MinWidth, MaxWidth);
  end;
end;

procedure TKrmDBGrid.CalcSomeColumnWidth(Index, MinWidth, MaxWidth: integer);
var i, aWidth, RealIndex : integer;
    S : String;
    R : TRect;                   
begin
  RealIndex := RawToDataColumn(Index);
  aWidth := MinWidth;
  // *** —читаем ширину заголовка
  S := Columns[RealIndex].Title.Caption;
  DrawText(Canvas.Handle, PChar(S), -1, R, DT_CALCRECT);
  if (aWidth < (R.Right - R.Left)) then
    aWidth := R.Right - R.Left ;
  //***
  for i := 0 to VisibleRowCount do
  begin
    S := Cell[Index, i];
    DrawText(Canvas.Handle, PChar(S), -1, R, DT_CALCRECT);
    if (aWidth < (R.Right - R.Left)) then
      aWidth := R.Right - R.Left ;
  end;
  aWidth := aWidth + 5;
  if (aWidth < MinWidth) and (MinWidth > 0) then
    Columns[RealIndex].Width := MinWidth
  else
    if (aWidth > MaxWidth) and (MaxWidth > 0)  then
      Columns[RealIndex].Width := MaxWidth 
    else
      Columns[RealIndex].Width := aWidth;
end;

function TKrmDBGrid.GetCellValue(ACol, ARow: integer): string;
var OldActive : integer;
begin
  Result := '';
  if DataLink.Active then
  begin
    OldActive := DataLink.ActiveRecord;
    try
      if not (dgTitles in Options) then Inc(ARow);
      DataLink.ActiveRecord := ARow;
      Result := Columns[RawToDataColumn(ACol)].Field.DisplayText;
    finally
      DataLink.ActiveRecord := OldActive;
    end;
  end;
end;

function TKrmDBGrid.GetCurCell: string;
begin
  Result := Cell[Col, Row - 1];
end;

function TKrmDBGrid.GetScrollColCount: integer;
begin
  Result := LeftCol - IndicatorOffset;
end;

function TKrmDBGrid.GetScrollRowCount: integer;
begin
  Result := GetScrollPos(Handle, SB_VERT) - Row;
end;

end.
 