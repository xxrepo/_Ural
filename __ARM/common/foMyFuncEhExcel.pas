unit foMyFuncEhExcel;

interface

uses classes, Windows, Messages, Sysutils, graphics,
  registry, DBGrids, DB, dbclient,
  Controls, stdctrls,
  Forms, Printers, comctrls, ComObj,
  DBGridEh, uDM, uPrgForm, foMyFunc;

procedure GreedToExcel(Grid: TDBGridEh; ACaption : string = '');

implementation


procedure GreedToExcel(Grid: TDBGridEh; ACaption : string);
var i, j, k, MaxColWdth, BWSM : integer;
    OldValue, ExcelApp, DataValues, Workbook, Column, Sheet, Cell1, Cell2, Range : Variant;
    BeginCol, BeginRow, BR, BC, MaxMultiTitle: integer;
    S, S2 : String;
    SL : TStringList;
    FFF: Double;
    AHandle : HWnd;
begin
  BWSM := -1;
  if not Grid.DataSource.DataSet.Active then
    Exit;
  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;
  CheckExcel;

  Screen.Cursor := crSQLWait;
  with Grid.DataSource.DataSet do
  begin
    OldValue := Grid.DataSource.DataSet.Fields[0].AsVariant;
    MaxColWdth := 100;
    
//ExcelApp.Visible := true;

    try
      DisableControls;
      ShowProgressForm(AHandle, 0, 0, 'Экспорт в Excel');
      ExcelApp := CreateOleObject('Excel.Application');
      ExcelApp.DisplayAlerts := false;
      
      try Workbook := ExcelApp.WorkBooks.Add; except end;
      Sheet := ExcelApp.Workbooks[1].WorkSheets[1];

      if (trim(ACaption) <> '') then
        BR := 3
      else
        BR := 1;

      BC := 1;

      BeginCol := BC;
      BeginRow := BR;
      MaxMultiTitle := 1;
 //     if Grid.UseMultiTitle then
      begin
        SL := TStringList.Create;
        try
          for i := 0 to Grid.VisibleColumns.Count - 1 do
          begin
            S := Trim(Grid.VisibleColumns[i].Title.Caption);
            SL.Text := StringReplace(S, '|', #13 + #10, []);
            if SL.Count > MaxMultiTitle then
              MaxMultiTitle := SL.Count;
          end;
          for i := 0 to Grid.VisibleColumns.Count - 1 do
          begin
            ShowProgressForm(AHandle, i + 1, Grid.VisibleColumns.Count, 'Создание таблицы');

            BeginRow := BR;
            BeginCol := BC + i;
            S := Trim(Grid.VisibleColumns[i].Title.Caption);
            SL.Text := StringReplace(S, '|', #13 + #10, []);
            for j := 0 to SL.Count - 1 do
            begin
              Cell1 := Sheet.Cells[BeginRow + j, BeginCol];
              Cell1.Value := SL[j];
              Cell1.Borders.LineStyle := 1;
              if Grid.VisibleColumns[i].Title.Orientation = tohVertical then
                Cell1.Orientation := -4171;
              if ((SL.Count) > 1)  then // Надо объединять ячейки
              begin
                for k := 1 to BeginCol - 1 do
                begin
                  Cell2 := Sheet.Cells[BeginRow + j, BeginCol - k];
                  S2 := VarToStr(Cell2.Value);
                  if (S2 <> SL[j]) and (S2 <> '') then
                    Break
                  else
                    if (S2 = SL[j]) then
                    begin
                      Range := Sheet.Range[Cell1, Cell2];
                      Range.Merge;
                      Range.HorizontalAlignment := 3;
                      Range.Borders.LineStyle := 1;
                      Break;
                    end;
                end;
              end;
              if SL.Count < MaxMultiTitle then
              begin
                Cell2 := Sheet.Cells[BeginRow + (MaxMultiTitle - SL.Count), BeginCol];
                Range := Sheet.Range[Cell1, Cell2];
                Range.Merge;
                Range.VerticalAlignment := 2;
                Range.Borders.LineStyle := 1;
              end;
            end;
          end;
        finally
          SL.Free;
        end;
      end;
      
      BeginCol := BC;
      BeginRow := BR + MaxMultiTitle + 0;

      Cell1 := Sheet.Cells[BR, BC];
      Cell2 := Sheet.Cells[BR + MaxMultiTitle - 1, BC + Grid.VisibleColumns.Count - 1];
      Range := Sheet.Range[Cell1, Cell2];
      Range.Font.Bold := true;

      DataValues := VarArrayCreate([0, RecordCount - 1, 0, Grid.VisibleColumns.Count - 1], varVariant);

      j := 0;
      First;
      while not EOF do
      begin
        ShowProgressForm(AHandle, RecNo, RecordCount, 'Экспорт в Excel');
        for i := 0 to Grid.VisibleColumns.Count - 1 do
        begin
          if Grid.VisibleColumns[i].Field <> nil then
          begin
            if not (Grid.VisibleColumns[i].Field is TBooleanField) then
            begin
              if (Grid.VisibleColumns[i].Field is TFloatField) or (Grid.VisibleColumns[i].Field is TBCDField) then
              begin
                if not Grid.VisibleColumns[i].Field.IsNull then
                begin
                //  S := TFloatField(Grid.Columns[i].Field).DisplayFormat;
                //  if S = '' then
                  if LowerCase(Grid.VisibleColumns[i].Field.FieldName) = 'worksum' then
                  begin
                    S := '0.########';
                    BWSM := i;
                  end
                  else
                    S := '0.##';
                  FFF := StrToFloat(FormatFloat(S, Grid.VisibleColumns[i].Field.AsFloat));
                  DataValues[j, i] := FFF;
            //      if LowerCase(Grid.VisibleColumns[i].Field.FieldName) = 'worksum' then
              //      DataValues[j, i].NumberFormat := '0.00'
                end;
              end

              else
                DataValues[j, i] := StringReplace(Trim(Grid.VisibleColumns[i].Field.AsString), #13 + #10, '; ',[rfReplaceAll]);
            end
            else
            begin
              if Grid.VisibleColumns[i].Field.AsBoolean then
                DataValues[j, i] := 'Да'
              else
                DataValues[j, i] := 'Нет'
            end;
          end;
        end;
        inc(j);
        Next;
      end;
      Cell1 := Sheet.Cells[BeginRow, BeginCol];
      Cell2 := Sheet.Cells[BeginRow + RecordCount -1, BeginCol + Grid.VisibleColumns.Count - 1];
      Range := Sheet.Range[Cell1, Cell2];
      Range.Value := DataValues;
      if BWSM > -1 then
        Sheet.Columns[BeginCol + BWSM].NumberFormat := '0,00';
      Range.Borders.LineStyle := 1;

      for i := 0 to Grid.VisibleColumns.Count - 1 do
      begin
        Column := Sheet.Columns[BeginCol + i];
        Column.AutoFit;
        if Column.ColumnWidth > MaxColWdth then
          Column.ColumnWidth := MaxColWdth;
      end;

      if (trim(ACaption) <> '') then
      begin
        Cell1 := Sheet.Cells[1, BeginCol];
        Cell1.Font.Bold := true;
        Cell1.Font.Size := 14;
        Cell1.Value := ACaption;
      end;

      if Grid.FooterRowCount = 1 then
      begin
        BeginRow := BeginRow + RecordCount - 1;
        inc(BeginRow);
   //     inc(BeginRow);

        Cell1 := Sheet.Cells[BeginRow, BeginCol];
        Cell1.Font.Bold := true;
        Cell1.Value := 'Итого';
        j := 0;
        for i := 0 to Grid.Columns.Count - 1 do
        begin
          if Grid.Columns[i].Visible then
          begin
            if (Grid.Columns[i].Footer.ValueType = fvtSum) then
            begin
                Cell1 := Sheet.Cells[BeginRow, BeginCol + j];
                Cell1.Font.Bold := true;
                try
                  S := Grid.GetFooterValue(1, Grid.Columns[i]);
                  Cell1.Value := StrToFloatAdv(S);
                except
                end;
                Cell1.NumberFormat := '# ##0,00';
            end;
          end;
          inc(j);
        end;
      end;

      CloseProgressForm;
      ExcelApp.DisplayAlerts := true; 
      ExcelApp.Visible := true;
      Screen.Cursor := crDefault;
    except
      on E : Exception do
      begin
        Screen.Cursor := crDefault;
        CloseProgressForm;
        ExcelApp.Quit;
        ExcelApp := Null;
    Grid.DataSource.DataSet.Locate(Grid.DataSource.DataSet.Fields[0].FieldName, OldValue, [loCaseInsensitive]);
    EnableControls;
        raise Exception.Create('Произошла ошибка при выгрузке данных в Excel' + #13 + #10 + E.Message);
      end;
    end;

//      ExcelApp := Null;
    Grid.DataSource.DataSet.Locate(Grid.DataSource.DataSet.Fields[0].FieldName, OldValue, [loCaseInsensitive]);
    EnableControls;
  end;
end;

end.
