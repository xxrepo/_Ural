unit foMyFuncDXTreeExcel;

interface


uses classes, Windows, Messages, Sysutils, graphics,
  Controls, stdctrls,
  Forms, Printers, comctrls, foMyFunc,
  ComObj, dxTL, dxDBTL, dxDBCtrl, uPrgForm, db, Registry, uDM,
  inifiles, uMain;


type
  THackTreeListControl = class(TCustomdxTreeListControl)
    property ShowBands;
  end;
procedure DBTreeListToExcel(ATree: TCustomdxTreeListControl; ACaption : string = ''; ANode : TdxTreeListNode = nil);
procedure CalcAggsNodes(AdxTreeList: TdxDBTreeList);

procedure LoadDXGridSettingsFromRegistry(const AGrid : TCustomdxTreeListControl; APath : String);
procedure SaveDXGridSettingsToRegistry(const AGrid : TCustomdxTreeListControl; APath : String);

implementation

function CalcININame : String;
begin
  Result := ExtractFilePath(ParamStr(0)) + 'Sett_' + IntToStr(DM.id_User) + '.ini';
end;

procedure SaveDXGridSettingsToRegistry_INI(const AGrid : TCustomdxTreeListControl; ASec : String);
var Reg : TIniFile;
    i : integer;
    S : String;
    AdxTreeListColumn : TdxTreeListColumn;
    NeedLog : boolean;
begin
  try
    NeedLog := true;
    S := CalcININame;
  //  if NeedLog then MainForm.AddToLogFile('имя файла' + S);
    Reg := TIniFile.Create(S);
 //   if NeedLog then MainForm.AddToLogFile('файл создан');
    try
    //  if NeedLog then MainForm.AddToLogFile('AGrid.ColumnCount = ' + InttoStr(AGrid.ColumnCount));
      for i := 0 to AGrid.ColumnCount - 1 do
      begin
  //      if NeedLog then MainForm.AddToLogFile('i = ' + InttoStr(i));
        AdxTreeListColumn := AGrid.Columns[i];
  //      if AdxTreeListColumn.tag <> -1 then
        begin
          S := AdxTreeListColumn.Name;
 //         if NeedLog then MainForm.AddToLogFile('AdxTreeListColumn.Name = ' + S);
          Reg.WriteInteger(ASec,  'Column_' + S, AdxTreeListColumn.Width);
          if AdxTreeListColumn.Visible then
            Reg.WriteString(ASec, 'VisibleColumn_' + S, '1')
          else
            Reg.WriteString(ASec, 'VisibleColumn_' + S, '0');
          Reg.WriteInteger(ASec, 'IndexColumn_' + S, AdxTreeListColumn.Index);
     //     if NeedLog then MainForm.AddToLogFile('сохранили колонку');
        end;
      end;
    finally
      Reg.Free;
 //     if NeedLog then MainForm.AddToLogFile('данные сохранены');
    end;
  except
    on E : Exception do
    begin
      Main.AddToLogFile('ошибка при сохранении колонок ' + E.Message);
    end;
  end;
end;

procedure LoadDXGridSettingsFromRegistry_INI(const AGrid : TCustomdxTreeListControl; ASec : String);
var Reg : TIniFile;
    i : integer;
    S, s2 : String;
    b : boolean;
    AdxTreeListColumn : TdxTreeListColumn;
    AColumnList : TList;
begin
  S := CalcININame;
  try
    Reg := TIniFile.Create(S);                  
    AColumnList := TList.Create;
    try
      begin
        for i := 0 to AGrid.ColumnCount - 1 do
          AColumnList.Add(AGrid.Columns[i]);

        for i := 0 to AColumnList.Count - 1 do
        begin
          AdxTreeListColumn := TdxTreeListColumn(AColumnList[i]);
          S := AdxTreeListColumn.Name;
          
          if Reg.ValueExists(ASec, 'Column_' + S) then
            AdxTreeListColumn.Width := Reg.ReadInteger(ASec, 'Column_' + S, AdxTreeListColumn.Width);

          if Reg.ValueExists(ASec, 'IndexColumn_' + S) then
            AdxTreeListColumn.Index := Reg.ReadInteger(ASec, 'IndexColumn_' + S, AdxTreeListColumn.Index);

          if Reg.ValueExists(ASec, 'VisibleColumn_' + S) then
          begin
            S2 := Reg.ReadString(ASec, 'VisibleColumn_' + S, '1');
            b := S2 = '1';
            AdxTreeListColumn.Visible := b;
          end;
        end;
      end;
    finally
      Reg.Free;
      AColumnList.Free;
    end;
  except
  end;
end;

procedure SaveDXGridSettingsToRegistry(const AGrid : TCustomdxTreeListControl; APath : String);
var Reg : TRegistry;
    i : integer;
    S : String;
    AdxTreeListColumn : TdxTreeListColumn;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKey(APath, true) then
    begin
      for i := 0 to AGrid.ColumnCount - 1 do
      begin
        AdxTreeListColumn := AGrid.Columns[i];
        S := AdxTreeListColumn.Name;
        Reg.WriteInteger('Column_' + S, AdxTreeListColumn.Width);
        Reg.WriteBool('VisibleColumn_' + S, AdxTreeListColumn.Visible);
        Reg.WriteInteger('IndexColumn_' + S, AdxTreeListColumn.Index);

      end;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;  
end;

procedure LoadDXGridSettingsFromRegistry(const AGrid : TCustomdxTreeListControl; APath : String);
var Reg : TRegistry;
    i : integer;
    S : String;
    AdxTreeListColumn : TdxTreeListColumn;
    AColumnList : TList;
begin
//  LoadDXGridSettingsFromRegistry_INI(AGrid, APath);
 // CheckGrid(AGrid);
  try
    Reg := TRegistry.Create;
    AColumnList := TList.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(APath, false) then
      begin
        for i := 0 to AGrid.ColumnCount - 1 do
          AColumnList.Add(AGrid.Columns[i]);

        for i := 0 to AColumnList.Count - 1 do
        begin
          AdxTreeListColumn := TdxTreeListColumn(AColumnList[i]);
          S := AdxTreeListColumn.Name;

          if Reg.ValueExists('Column_' + S) then
            AdxTreeListColumn.Width := Reg.ReadInteger('Column_' + S);

          if Reg.ValueExists('IndexColumn_' + S) then
            AdxTreeListColumn.Index := Reg.ReadInteger('IndexColumn_' + S);

          if Reg.ValueExists('VisibleColumn_' + S) then
            AdxTreeListColumn.Visible := Reg.ReadBool('VisibleColumn_' + S);
        end;
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
      AColumnList.Free;
    end;
  except
  end;  
end;

procedure CalcNode(ANode : TdxTreeListNode; Index : Integer);
var i : integer;
    N : integer;
    F1 : Variant;
    tmpNode : TdxTreeListNode;
    S : String;
begin
  F1 := Null;
  N := ANode.Count;
  for i := 0 to N - 1 do
  begin
    tmpNode := ANode.Items[i];

    CalcNode(tmpNode, Index);
    S := tmpNode.Strings[Index];
    if F1 = Null then F1 := 0;
    F1 := F1 + StrToFloatAdv(S);
  end;
             
  if ANode.Count > 0 then
  begin
    if TdxDBTreeList(ANode.Owner).Columns[Index].Field is TFloatField then
    begin
      if TdxDBTreeList(ANode.Owner).DataSource.DataSet.Locate(TdxDBTreeList(ANode.Owner).KeyField, 
                       ANode.Strings[TdxDBTreeList(ANode.Owner).ColumnByFieldName(TdxDBTreeList(ANode.Owner).KeyField).Index], []) then
      TdxDBTreeList(ANode.Owner).DataSource.DataSet.Edit;
      TdxDBTreeList(ANode.Owner).Columns[Index].Field.AsFloat := F1;
      TdxDBTreeList(ANode.Owner).DataSource.DataSet.Post;
    end;
  end;
end;

procedure CalcAggsNodes(AdxTreeList: TdxDBTreeList);
var j, i : integer;
    tmpNode : TdxTreeListNode;
    Handle : HWnd;
begin
  try
    if Screen.ActiveForm <> nil then
      Handle := Screen.ActiveForm.Handle
    else
      Handle := 0;
    for j := 0 to AdxTreeList.Count - 1 do
    begin
      ShowProgressForm(Handle, j, AdxTreeList.Count, 'Загрузка данных');
      tmpNode := AdxTreeList.Items[j];
      for i := 0 to AdxTreeList.ColumnCount - 1 do
      begin
        if AdxTreeList.Columns[i].Field is TFloatField then
          CalcNode(tmpNode, i);
      end;
    end;
   finally
    CloseProgressForm;
   end;
end;


function StrToFloatAdv2(S: Variant): Variant;
  function StrToFloatAdv(S: string): Extended;
  begin
    S := trim(S);
    if S = '' then
      Result := 0
    else
    begin
      if (DecimalSeparator = '.') then
        S := StringReplace(Trim(S), ',', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
      if (DecimalSeparator = ',') then
        S := StringReplace(Trim(S), '.', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
      Result := StrToFloat(S);
    end;
  end;

var VT : integer;
    FFF: Double;
begin
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
      if VT in [ varSmallint, varInteger, varSingle, varDouble, varCurrency] then
      begin
        if (DecimalSeparator = '.') then
          S := StringReplace(Trim(S), ',', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
        if (DecimalSeparator = ',') then
          S := StringReplace(Trim(S), '.', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
        FFF := StrToFloat(FormatFloat('0.##', S));
        Result := FFF;
      end
      else
      begin
        Result := StrToFloatAdv(VarToStr(S));
      end;
  except
    Result := trim(VarToStr(S));
  end;
end;

function LineFeedsToXLS(s:string):string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(s) do
    if (s[i] <> #13) {and (s[i] <> #10)} then
      Result := Result + s[i]
    else
      Result := Result + ' ';
end;

procedure DBTreeListToExcel(ATree: TCustomdxTreeListControl; ACaption : string; ANode : TdxTreeListNode);
var i, j, k, N, MaxColWdth : integer;
    ExcelApp, DataValues : Variant;
    Workbook, Column, Row, Sheet, Cell1, Cell2, Range : Variant;
    BeginCol, BeginRow: integer;
    inMerg : boolean;
    Node : TdxTreeListNode;
    V : Variant;
    S : String;

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
//    ExcelApp.visible := true;
    try
      try Workbook := ExcelApp.WorkBooks.Add; except end;
      Sheet := ExcelApp.Workbooks[1].WorkSheets[1];

      j := 0;
      if THackTreeListControl(ATree).ShowBands then
      begin
        Cell1 := Sheet.Cells[BeginRow, BeginCol];
        N := 0;
        for i := 0 to ATree.Bands.Count - 1 do
        begin
          for k := 0 to ATree.VisibleColumnCount - 1 do
          begin
            if ATree.VisibleColumns[k].BandIndex = ATree.Bands[i].Index then
              Inc(N);
          end;
          Cell2 := Sheet.Cells[BeginRow, BeginCol + N - 1];
          Range := Sheet.Range[Cell1, Cell2];
          Range.Merge;
          Range.HorizontalAlignment := 3;
          Range.VerticalAlignment := 2;
          Range.Borders.LineStyle := 1;
          Range.Value := ATree.Bands[i].Caption;
          Range.Interior.Color := 12632256;
          Cell1 := Sheet.Cells[BeginRow, BeginCol + N];
        end;
        inc(BeginRow);
      end;
      for i := 0 to ATree.VisibleColumnCount - 1 do
      begin
        Cell1 := Sheet.Cells[BeginRow, BeginCol + j];
        Cell1.Value := (ATree.VisibleColumns[i].Caption);
        Cell1.HorizontalAlignment := 3;
        Cell1.VerticalAlignment := 2;
        Cell1.Borders.LineStyle := 1;
        Cell1.Font.Bold := true;
        Cell1.Interior.Color := 12632256;
        inc(j);
      end;
      inc(BeginRow);
      Node := ATree.TopNode;
      while Node <> nil do
      begin
        ShowProgressForm(AHandle, Node.Index, ATree.Count, 'Экспорт в Excel');
        if Node.HasAsParent(ANode) or (Node = ANode) or (ANode = nil) then
        begin
          j := 0;
          for i := 0 to ATree.ColumnCount - 1 do
          begin
            if ATree.Columns[i].Visible then
            begin
              Cell1 := Sheet.Cells[BeginRow, BeginCol + j];
              V := StrToFloatAdv2(Node.Values[i]);
              if j = 0 then
                V := StringOfChar(' ', Node.Level*4) + VarToStr(V);
              Cell1.Value := V;
              Cell1.Borders.LineStyle := 1;
              if Node.Level = 0 then
              begin
                Cell1.Interior.Color := 16777164;
                Cell1.Font.Bold := true;
              end;
              inc(j);
            end;
          end;
          inc(BeginRow);
        end;
        Node := ATree.GetNextVisible(Node);
      end;

      j := 0;
      for i := 0 to ATree.ColumnCount - 1 do
      begin
        if ATree.Columns[i].Visible then
        begin
          Column := Sheet.Columns[BeginCol + j];
          Column.AutoFit;
          if Column.ColumnWidth > MaxColWdth then
            Column.ColumnWidth := MaxColWdth;
          inc(j);
        end;
     end;
             
      if (trim(ACaption) <> '') then
      begin
        Cell1 := Sheet.Cells[1, BeginCol];
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
        Screen.Cursor := crDefault;
        CloseProgressForm;
        ExcelApp.Quit;
        ExcelApp := Null;
        raise Exception.Create('Произошла ошибка при выгрузке данных в Excel' + #13 + #10 + E.Message);
      end;
    end;
end;


end.
