unit foMyFuncAdvStrGrigExcel;

interface

uses classes, Windows, Messages, Sysutils, graphics,
  Controls, stdctrls,
  Forms, Printers, comctrls,
  ComObj, AdvGrid, Grids, uPrgForm, foMyFunc, ActiveX, Registry, AdvCGrid;

procedure LoadGridSettingsFromRegistryTMS(const AGrid : TAdvColumnGrid; APath : String);
procedure SaveGridSettingsToRegistryTMS(const AGrid : TAdvColumnGrid; APath : String);

procedure AdvStringGridToExcel(Grid: TAdvStringGrid; ACaption : string = ''; AFormatFloat: string = '0.##');

function CalcSummAdvSringGrid(AGrid: TAdvStringGrid): extended;

implementation

procedure SaveGridSettingsToRegistryTMS(const AGrid : TAdvColumnGrid; APath : String);
var Reg : TRegistry;
    i : integer;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKey(APath, true) then
    begin
      for i := 0 to AGrid.Columns.Count - 1 do
      begin
        Reg.WriteInteger('Column_' + Inttostr(i), AGrid.Columns[i].Width);
    {    Reg.WriteBool('Column_' + Inttostr(i) + 'hide', AGrid.IsHiddenColumn(i)); }

      end;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure LoadGridSettingsFromRegistryTMS(const AGrid : TAdvColumnGrid; APath : String);
var Reg : TRegistry;
    i : integer;
begin
  try
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(APath, false) then
      begin
        for i := 0 to AGrid.Columns.Count - 1 do
        begin
          if Reg.ValueExists('Column_' + Inttostr(i)) then
            AGrid.Columns[i].Width := Reg.ReadInteger('Column_' + Inttostr(i));
        {  if Reg.ValueExists('Column_' + Inttostr(i) + 'hide') then
            if Reg.ReadBool('Column_' + Inttostr(i) + 'hide') then
              AGrid.HideColumn(i);  }
        end;
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  except
  end;
end;

function LineFeedsToXLS(s:Variant; AFormatFloat: string):Variant;
var VT : integer;
    FFF: Double;
begin
  Result := trim(StringReplace(VarToStr(S), #13, ' ', [rfReplaceAll, rfIgnoreCase]));
  if Result = '' then Exit;
  try
    VT := TVarData(S).VType;
    if VT in [varBoolean] then
    begin
      if S then
        Result := 'Да'
      else
        Result := 'Нет';
    end
    else
//      if VT in [ varSmallint, varInteger, varSingle, varDouble, varCurrency] then
      begin
        if (DecimalSeparator = '.') then
          S := StringReplace(Trim(S), ',', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
        if (DecimalSeparator = ',') then
          S := StringReplace(Trim(S), '.', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
        FFF := StrToFloat(FormatFloat(AFormatFloat, S));
        Result := FFF;
      end
  //    else
  //      Result := trim(StringReplace(VarToStr(S), #13, ' ', [rfReplaceAll, rfIgnoreCase]));
  except
 //   Result := S;
  end;
end;

function CalcSummAdvSringGrid(AGrid : TAdvStringGrid) : extended;
var Rez :Real;
    V : Variant;
    S : String;
    i, Code : integer;
    gc: TGridCoord;
begin
  Result := 0;
  for i := 0 to AGrid.SelectedCellsCount - 1 do
  begin
    gc := AGrid.SelectedCell[i];
    V := AGrid.Cells[gc.x, gc.y];
    V := StringReplace(VarToStr(V), ',', '.', [rfReplaceAll, rfIgnoreCase]);
    V := StringReplace(VarToStr(V), ' ', '', [rfReplaceAll, rfIgnoreCase]);
    System.Val(V, Rez, Code);
    if Code = 0 then
      Result := Result + Rez;
  end;
end;

procedure CheckExcel;
var AHandle : HWnd;
    ClassID: TCLSID; Rez : HRESULT;
begin
  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;
  Rez := CLSIDFromProgID(PWideChar(WideString('Excel.Application')), ClassID);
  if Rez <> S_OK then
  begin
    MessageBox(AHandle, 'Excel не установлен!', '', MB_ICONERROR);
    Abort;
  end;
end;


procedure AdvStringGridToExcel(Grid: TAdvStringGrid; ACaption : string; AFormatFloat: string);
var i, j, k, MaxColWdth : integer;
    ExcelApp, DataValues : Variant;
    Workbook, Column, Row, Sheet, Cell1, Cell2, Range, V : Variant;
    BeginCol, BeginRow: integer;
    inMerg : boolean;

    FFF: Double;
    AHandle : HWnd;
begin
  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;
  CheckExcel;

  Screen.Cursor := crSQLWait;
  Range := Null;
  MaxColWdth := 100;
  inMerg := false;
    if (trim(ACaption) <> '') then
      BeginRow := 3
    else
      BeginRow := 1;

    BeginCol := 1;
    ShowProgressForm(AHandle, 0, 0, 'Экспорт в Excel');
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.DisplayAlerts := false;
  //  ExcelApp.visible := true;
    try
      try Workbook := ExcelApp.WorkBooks.Add; except end;
      Sheet := ExcelApp.Workbooks[1].WorkSheets[1];

      for i := 0 to Grid.RowCount - 1 do
      begin
        ShowProgressForm(AHandle, i + 1, Grid.RowCount, 'Экспорт в Excel');
        Cell1 := Sheet.Cells[BeginRow + i, BeginCol + j];
        for j := Grid.FixedCols to Grid.ColCount - 1 do
        begin
          Cell2 := Sheet.Cells[BeginRow + i, BeginCol + j];
          if Grid.IsXMergedCell(j, i) then
          begin
            if (not inMerg) or (Grid.IsBaseCell(j, i)) then
            begin
              Cell1 := Sheet.Cells[BeginRow + i, BeginCol + j];
              inMerg := true;
            end;
          end
          else
          begin
            inMerg := false;
            Cell1 := Sheet.Cells[BeginRow + i, BeginCol + j];
          end;
          Range := Sheet.Range[Cell1, Cell2];
          Range.Merge;
          Range.HorizontalAlignment := 3;
          Range.VerticalAlignment := 2;
          Range.Borders.LineStyle := 1;
          if (Grid.IsBaseCell(j, i) or not Grid.IsYMergedCell(j, i)) then
          begin
            V := LineFeedsToXLS(Grid.Cells[j, i], AFormatFloat);
            Range.Value := V;
          end;

          if (Grid.RowHeights[i] <> Grid.DefaultRowHeight) and (Grid.RowHeights[i] <> 24) then
            Range.RowHeight := Grid.RowHeights[i];
        end;
      end;

      for i := Grid.FixedCols to Grid.ColCount - 1 do
      begin
        Column := Sheet.Columns[BeginCol + i];
        Column.AutoFit;
        if Column.ColumnWidth > MaxColWdth then
          Column.ColumnWidth := MaxColWdth;
      end;

{      for i := 0 to Grid.RowCount - 1 do
      begin
        Row := Sheet.Rows[BeginRow + i];
        Row.WrapText := true;
        Row.AutoFit;
      end;   }

      if (trim(ACaption) <> '') then
      begin
        Cell1 := Sheet.Cells[2, BeginCol];
        Cell1.Font.Bold := true;
        Cell1.Font.Size := 14;
        Cell1.Value := ACaption;
      end;
      ExcelApp.DisplayAlerts := true; 
      ExcelApp.Visible := true;
      Screen.Cursor := crDefault;
      CloseProgressForm;
    except
      on E : Exception do
      begin
        CloseProgressForm;
        Screen.Cursor := crDefault;
        ExcelApp.Quit;
        ExcelApp := Null;
        raise Exception.Create('Произошла ошибка при выгрузке данных в Excel' + #13 + #10 + E.Message);
      end;
    end;
end;


end.
