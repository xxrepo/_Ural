unit foMyFuncEh;
// Модуль с набором функций для работы с TDBGridEh

interface

uses classes, Windows, Messages, Sysutils, graphics,
  registry, DBGrids, DB, dbclient, Grids, DBGridEh, {$IFDEF VER150} Variants,{$ENDIF}foMyFunc;

type
  THackDBGridEh = class(TDBGridEh)
    procedure BeginLayout;
    procedure EndLayout;  
  end;

// Сохраняет в реестре размеры колонок грида и параметры сортировки
procedure SaveEhGridSettingsToRegistry(const AGrid : TDBGridEh; APath : String);
// Читает из реестра размеры колонок грида и параметры сортировки
procedure LoadEhGridSettingsFromRegistry(const AGrid : TDBGridEh; APath : String);

// Определяет какую стрелку отображать на заголовке столба в гриде, в зависимости от сортировки
function GetBtnSortMarkerEh(Field: TField): TSortMarkerEh;

// Сортирует данные в TClientDataSet по указанной колонке по возрастанию и убыванию
procedure ReOrderCDSEh(AColumn: TColumnEh;
                       AKey : String // Имя поля, по значению которого будет восстановлена позация курсора после сортировки
                                     // для устранения глюка компонента
                                    );

procedure ReOrderCDSEh2(CDS: TClientDataSet; OrdField : String; const AGrid : TDBGridEh; AKey : String);
function GridSelectionAsExcelText(AGrid: TDBGridEh): PWideChar;

implementation


function GridSelectionAsText(AGrid: TDBGridEh): String;
var bm : TBookmarkStr;
    i,j,DLIndex : Integer;
    ss : TStringStream;
    function StringTab(s:String; Index, Count:Integer):String;
    begin
      if Index <> Count then
        Result := s + #09
      else
        Result := s; 
    end;
begin
  Result := '';
  with AGrid do begin
    if Selection.SelectionType = gstNon then
    begin
      if (AGrid.col > 0) and (AGrid.col < AGrid.Columns.Count) and (AGrid.Columns[AGrid.col - 1].Field <> nil) then
        Result := AGrid.Columns[AGrid.col - 1].Field.DisplayText;

      Exit;
    end;
    with Datasource.Dataset do
    try
      ss := TStringStream.Create('');
      bm := Bookmark;
      DisableControls;
      try
        case Selection.SelectionType of
          gstRecordBookmarks:
          begin
            for I := 0 to Selection.Rows.Count-1 do

            begin
              Bookmark := Selection.Rows[I];
              for j := 0 to VisibleColumns.Count - 1 do
                ss.WriteString(StringTab(VisibleColumns[j].DisplayText,
                    j,VisibleColumns.Count - 1));
              ss.WriteString(#13#10);
            end;
          end;
          gstRectangle: begin
             Bookmark := Selection.Rect.TopRow;
             while True do begin

               for j := Selection.Rect.LeftCol to Selection.Rect.RightCol do
                 if Columns[j].Visible then
                   ss.WriteString(StringTab(Columns[j].DisplayText,
                      j,Selection.Rect.RightCol));
               if CompareBookmarks(Pointer(Selection.Rect.BottomRow),Pointer(Bookmark)) = 0 then
                 Break;
               Next;
               if Eof then Break;

               ss.WriteString(#13#10);
             end;
          end;
          gstColumns: begin
             for j := 0 to Selection.Columns.Count-1 do
                 ss.WriteString(StringTab(Selection.Columns[j].Title.Caption,
                     j,Selection.Columns.Count-1));
             ss.WriteString(#13#10);
             First;
             while  EOF = False do begin

               for j := 0 to Selection.Columns.Count-1 do
                 ss.WriteString(StringTab(Selection.Columns[j].DisplayText,
                     j,Selection.Columns.Count-1));
               ss.WriteString(#13#10);
               Next;
             end;
             for i := 0 to FooterRowCount-1 do begin
               for j := 0 to Selection.Columns.Count-1 do

                   ss.WriteString(StringTab(GetFooterValue(i,Selection.Columns[j]),
                      j,Selection.Columns.Count-1));
               ss.WriteString(#13#10);
             end;
          end;
          gstAll: begin
             for j := 0 to VisibleColumns.Count-1 do
                 ss.WriteString(StringTab(VisibleColumns[j].Title.Caption,
                     j,VisibleColumns.Count-1));
             ss.WriteString(#13#10);

             First;
             while  EOF = False do begin
               for j := 0 to VisibleColumns.Count-1 do
                 ss.WriteString(StringTab(VisibleColumns[j].DisplayText,
                     j,VisibleColumns.Count-1));
               ss.WriteString(#13#10);
               Next;
             end;
             for i := 0 to FooterRowCount-1 do begin
               for j := 0 to VisibleColumns.Count-1 do

                   ss.WriteString(StringTab(GetFooterValue(i,VisibleColumns[j]),
                      j,VisibleColumns.Count-1));
               ss.WriteString(#13#10);
             end;
          end;
        end;
        Result := ss.DataString;
      finally
        Bookmark := bm;
        EnableControls;
      end;
    finally
      ss.Free;
    end;
  end;
end;

function GridSelectionAsExcelText(AGrid: TDBGridEh): PWideChar;
var S : String;
    Buffer: PWideChar;
    SourceLen: Integer;
begin
  S := GridSelectionAsText(AGrid);
  SourceLen := Length(S);
  Buffer := AllocMem((SourceLen + 1) * sizeof(WideChar));

  MultiByteToWideChar(CP_ACP, 0, PChar(S), SourceLen, Buffer, (SourceLen + 1) * sizeof(WideChar));
  Result := Buffer;
end;

procedure ReOrderCDSEh2(CDS: TClientDataSet; OrdField : String; const AGrid : TDBGridEh; AKey : String);
var OldIndex : TIndexDef;
    NewOptions : TIndexOptions;
    OldCol : integer;
    AField : TField;
    AOldKey : Variant;
begin
  if not CDS.Active then Exit;
  AField := CDS.FindField(AKey);
  if AField <> nil then
    AOldKey := AField.Value
  else
    AOldKey := Null;
  THackDBGridEh(AGrid).BeginLayout;
  OldCol := AGrid.LeftCol;
  BeginUpdateControl(AGrid);
  try
    if CDS.FindField(OrdField) = nil then
      Exit;

    CDS.DisableControls;
    try
      NewOptions := [ixCaseInsensitive];
      if CDS.IndexName <> '' then
      begin
        OldIndex := CDS.IndexDefs.Find(CDS.IndexName);
        if OldIndex.Fields = OrdField then
          if not (ixDescending in OldIndex.Options) then
            NewOptions := NewOptions + [ixDescending];
   //     OldIndex.Free;
        CDS.DeleteIndex(OldIndex.Name);
      end;
      if (CDS.FieldByName(OrdField) <> nil) and (CDS.FieldByName(OrdField).FieldKind <> fkCalculated) then
      begin
        CDS.IndexDefs.Clear;
        CDS.IndexDefs.Add('ix' + OrdField, OrdField, NewOptions);
        CDS.IndexName := 'ix' + OrdField;
      end;
    finally
      AGrid.SelectedRows.Clear;
      if AField <> nil then
        CDS.Locate(AKey, AOldKey, [loCaseInsensitive]);
      THackDBGridEh(AGrid).EndLayout;
      CDS.EnableControls;
      AGrid.LeftCol := OldCol;
      EndUpdateControl(AGrid);
    end;
  except

  end;
end;

procedure ReOrderCDSEh(AColumn: TColumnEh; AKey : String);
begin
  if (AColumn <> nil) and (AColumn.Field <> nil) and (AColumn.Field.DataSet <> nil) and
  (AColumn.Field.FieldKind <> fkCalculated) and (AColumn.Field.FieldKind <> fkLookup) then
  begin
    ReOrderCDSEh2(AColumn.Grid.DataSource.DataSet as TClientDataSet, AColumn.Field.FieldName, TDBGridEh(AColumn.Grid), AKey);
    AColumn.Title.SortMarker := GetBtnSortMarkerEh(AColumn.Field);
  end;
end;

function GetBtnSortMarkerEh(Field: TField): TSortMarkerEh;
var Index : TIndexDef;
begin
  Result := smNoneEh;
  if (Field.DataSet as TClientDataSet).IndexName = '' then Exit;

  Index := (Field.DataSet as TClientDataSet).IndexDefs.Find((Field.DataSet as TClientDataSet).IndexName);
  if Index.Fields = Field.FieldName then
    if not (ixDescending in Index.Options) then
      Result := smUpEh
    else
      Result := smDownEh;
end;

procedure SaveEhGridSettingsToRegistry(const AGrid : TDBGridEh; APath : String);
var Reg : TRegistry;
    i : integer;
    CDS : TClientDataSet;
    S : String;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKey(APath, true) then
    begin
      for i := 0 to AGrid.Columns.Count - 1 do
      begin
        S := AGrid.Columns[i].FieldName;
        Reg.WriteInteger('Column_' + S, AGrid.Columns[i].Width);
        Reg.WriteBool('VisibleColumn_' + S, AGrid.Columns[i].Visible);
        Reg.WriteInteger('IndexColumn_' + S, i);

      end;
      if (AGrid.DataSource <> nil) and (AGrid.DataSource.DataSet <> nil) and (AGrid.DataSource.DataSet is TClientDataSet) then
      begin
         CDS := TClientDataSet(AGrid.DataSource.DataSet);
         for i := 0 to CDS.IndexDefs.Count - 1 do
         begin
           Reg.WriteString('IndexDefs_Fields' + IntToStr(i), CDS.IndexDefs[i].Fields);
           Reg.WriteBool('IndexDefs_Descending' + IntToStr(i), (ixDescending in CDS.IndexDefs[i].Options));
         end;
      end;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure LoadEhGridSettingsFromRegistry(const AGrid : TDBGridEh; APath : String);
var Reg : TRegistry;
    i : integer;
    CDS : TClientDataSet;
    NewOptions : TIndexOptions;
    S : String;
    AColumn : TColumnEh;
    AColumnList : TList;
    AOldFrozen, AIndex : integer;
begin
  try
    AOldFrozen := AGrid.FrozenCols;
    AGrid.FrozenCols := 0;
    Reg := TRegistry.Create;                  
    AColumnList := TList.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(APath, false) then
      begin
        for i := 0 to AGrid.Columns.Count - 1 do
        begin
          AColumnList.Add(AGrid.Columns[i]);
          AGrid.Columns[i].Title.TitleButton := true;
          AGrid.Columns[i].Title.EndEllipsis := true;
          AGrid.Columns[i].EndEllipsis := true;
        end;
        
        for i := 0 to AColumnList.Count - 1 do
        begin
          AColumn := TColumnEh(AColumnList[i]);
          S := AColumn.FieldName;
          if Reg.ValueExists('Column_' + S) then
            AColumn.Width := Reg.ReadInteger('Column_' + S);
          if AColumn.Width > 300 then AColumn.Width := 300;
          if Reg.ValueExists('IndexColumn_' + S) then
          begin
            AIndex := Reg.ReadInteger('IndexColumn_' + S);
            if AIndex < AGrid.Columns.Count then
              AColumn.Index := AIndex;
          end;                                                                

          if Reg.ValueExists('VisibleColumn_' + S) then
            AColumn.Visible := Reg.ReadBool('VisibleColumn_' + S);
        end;
        if (AGrid.DataSource <> nil) and (AGrid.DataSource.DataSet <> nil) and (AGrid.DataSource.DataSet is TClientDataSet) then
        begin
          i := 0;
          CDS := TClientDataSet(AGrid.DataSource.DataSet);
          while Reg.ValueExists('IndexDefs_Fields' + IntToStr(i)) do
          begin
            NewOptions := [ixCaseInsensitive];
            if Reg.ValueExists('IndexDefs_Descending' + IntToStr(i)) then
              if Reg.ReadBool('IndexDefs_Descending' + IntToStr(i)) then
                NewOptions := NewOptions + [ixDescending];
            S := Reg.ReadString('IndexDefs_Fields' + IntToStr(i));
            if (CDS.FindField(S) <> nil) and (CDS.FieldByName(S).FieldKind <> fkCalculated)
            and (CDS.FieldByName(S).FieldKind <> fkLookup)
            then
            begin
              CDS.IndexDefs.Clear;
              CDS.IndexDefs.Add('ix' + S, S, NewOptions);
              CDS.IndexName := 'ix' + S;
            end;
            if (CDS.FindField(S) = nil) then
            begin
              CDS.IndexDefs.Clear;
              CDS.IndexDefs.Add('ix' + S, S, NewOptions);
              CDS.IndexName := 'ix' + S;
            end;
            inc(i);
          end;
          if CDS.IndexDefs.Count = 1 then
          begin
            for i := 0 to AGrid.Columns.Count - 1 do
            begin
              if CDS.IndexDefs[0].Fields = AGrid.Columns[i].FieldName then
              begin
                if AGrid.Columns[i].Field <> nil  then
                  AGrid.Columns[i].Title.SortMarker := GetBtnSortMarkerEh(AGrid.Columns[i].Field);
                Break;
              end;
            end;
          end;
        end;
      end;
    finally
      AGrid.FrozenCols := AOldFrozen;
      Reg.CloseKey;
      Reg.Free;
      AColumnList.Free;
    end;
  except
  end;
end;

{ THackDBGridEh }

procedure THackDBGridEh.BeginLayout;
begin
  inherited;

end;

procedure THackDBGridEh.EndLayout;
begin
  inherited;

end;

end.
 