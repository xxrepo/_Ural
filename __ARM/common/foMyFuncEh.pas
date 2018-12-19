unit foMyFuncEh;

interface

uses classes, Windows, Messages, Sysutils, graphics,
  registry, DBGrids, DB, dbclient, Grids, DBGridEh, foMyFunc, {$IFNDEF SEINV} uValListDistinct, {$ENDIF}
  ADOdb, uDM;

type
  THackDBGridEh = class(TDBGridEh)
    procedure BeginLayout;
    procedure EndLayout;  
  end;

procedure SaveEhGridSettingsToRegistry(const AGrid : TDBGridEh; APath : String);
procedure LoadEhGridSettingsFromRegistry(const AGrid : TDBGridEh; APath : String);

function GetBtnSortMarkerEh(Field: TField): TSortMarkerEh;

procedure ReOrderCDSEh(AColumn: TColumnEh; AKey : String);
//procedure ReOrderCDSEh2(CDS: TClientDataSet; OrdField : String; const AGrid : TDBGridEh);

procedure ShowValListDistinct(AField : TField; ACaption : String = '');
function GridSelectionSumm(AGrid: TDBGridEh; AIgnoreNonDigit : boolean): Variant;
function GridSelectionAsText(AGrid: TDBGridEh): String;
function GridSelectionAsExcelText(AGrid: TDBGridEh): PWideChar;

implementation

function GridSelectionSumm(AGrid: TDBGridEh; AIgnoreNonDigit : boolean): Variant;
var
    j : Integer;
    AColumn : TColumnEh;
begin
  Result := Null;
  if AGrid.Datasource = nil then
    Exit;
  if AGrid.Selection.SelectionType = gstRecordBookmarks then
    Exit;
  try
  with AGrid do
  begin
    if AGrid.Selection.SelectionType = gstNon then
    begin
      AColumn := Columns[Col - 1];
      if AColumn.Visible and (AColumn.Field is TNumericField)  then
        Result := AColumn.Field.AsFloat;
      Exit;
    end;
    with AGrid.Datasource.Dataset do
    try
      SaveBookmark;

      DisableControls;
      try
        if Selection.SelectionType = gstRectangle then
        begin
          Bookmark := Selection.Rect.TopRow;
          while True do
          begin
            for j := AGrid.Selection.Rect.LeftCol to Selection.Rect.RightCol do
            begin
              if (j < 0) or (Columns.Count <= j) then
                Exit;
              AColumn := Columns[j];
              if AColumn.Visible then
              begin
                if (AColumn.Field is TNumericField) or AIgnoreNonDigit then
                begin
                  if (AColumn.Field is TNumericField) then
                  begin
                    if Result = Null then
                      Result := 0;
                    Result := Result + AColumn.Field.AsFloat;
                  end;
                end
                else
                begin
                  Result := Null;
                  Exit;
                end;
              end;
            end;
            if CompareBookmarks(Pointer(Selection.Rect.BottomRow), Pointer(Bookmark)) = 0 then
              Break;
            Next;
            if Eof then Break;
          end;
        end;
      finally
        RestoreBookmark;

        EnableControls;
      end;
    finally
    end;
  end;
  except
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

procedure ShowValListDistinct(AField : TField; ACaption : String = '');
begin

  uValListDistinct.ShowValListDistinct(AField, ACaption);
 
end;

procedure ReOrderCDSEh2(CDS: TClientDataSet; OrdField : String; const AGrid : TDBGridEh; AKey : String);
var OldIndex : TIndexDef;
    NewOptions : TIndexOptions;
    OldCol : integer;
    AField : TField;
    AOldKey : Variant;
begin
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

procedure ReOrderADOEh(CDS:  TADOStoredProc; OrdField : String; const AGrid : TDBGridEh; AKey : String);
var OldIndex : TIndexDef;
    NewOptions : TIndexOptions;
    OldCol : integer;
    AField : TField;
    AOldKey : Variant;
    S : String;
begin
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
      if CDS.Sort <> '' then
      begin
        if CDS.Sort = OrdField then
          S := CDS.Sort + ' DESC'
        else
          S := OrdField;
      end
      else
        S := OrdField;
      CDS.Sort := S;
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
  if (AColumn <> nil) and (AColumn.Field <> nil) and (AColumn.Field.DataSet <> nil) and (AColumn.Grid.DataSource.DataSet is TClientDataSet) then
  begin
    ReOrderCDSEh2(AColumn.Grid.DataSource.DataSet as TClientDataSet, AColumn.Field.FieldName, TDBGridEh(AColumn.Grid), AKey);
    AColumn.Title.SortMarker := GetBtnSortMarkerEh(AColumn.Field);
  end;
  if (AColumn <> nil) and (AColumn.Field <> nil) and (AColumn.Field.DataSet <> nil) and (AColumn.Grid.DataSource.DataSet is  TADOStoredProc) then
  begin
    ReOrderADOEh(AColumn.Grid.DataSource.DataSet as  TADOStoredProc, AColumn.Field.FieldName, TDBGridEh(AColumn.Grid), AKey);
    AColumn.Title.SortMarker := GetBtnSortMarkerEh(AColumn.Field);
  end;
end;

function GetBtnSortMarkerEh(Field: TField): TSortMarkerEh;
var Index : TIndexDef;
begin
  Result := smNoneEh;

  if (Field.DataSet is TClientDataSet) then
  begin
    if ((Field.DataSet as TClientDataSet).IndexName = '') then Exit;

    Index := (Field.DataSet as TClientDataSet).IndexDefs.Find((Field.DataSet as TClientDataSet).IndexName);
    if Index.Fields = Field.FieldName then
      if not (ixDescending in Index.Options) then
        Result := smUpEh
      else
        Result := smDownEh;
  end
  else
  begin
    if (Field.DataSet is TCustomADODataSet) then
    begin                                
      if (TCustomADODataSet(Field.DataSet).Sort = '') then Exit;

      if (Field.DataSet as TCustomADODataSet).Sort = Field.FieldName then
        Result := smUpEh
      else
        if (Field.DataSet as TCustomADODataSet).Sort = Field.FieldName + ' DESC' then
          Result := smDownEh;
    end; 
  end;

end;

procedure SaveEhGridSettingsToRegistry(const AGrid : TDBGridEh; APath : String);
var Reg : TRegistry;
    i : integer;
    CDS : TClientDataSet;
    S : String;
begin
  if UpperCase(DM.host) = 'SP' then
    APath := APath + 'SP';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKey(APath, true) then
    begin
      for i := 0 to AGrid.Columns.Count - 1 do
      begin
        S := AGrid.Columns[i].Title.Caption;//AGrid.Columns[i].FieldName
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
    OldMovedEvent : TMovedEvent;
    OldColWidthsChanged : TNotifyEvent;
begin
  if UpperCase(DM.host) = 'SP' then
    APath := APath + 'SP';
  try
    AOldFrozen := AGrid.FrozenCols;
    AGrid.FrozenCols := 0;

    OldMovedEvent := AGrid.OnColumnMoved;
    AGrid.OnColumnMoved := nil;
    
    OldColWidthsChanged := AGrid.OnColWidthsChanged;
    AGrid.OnColWidthsChanged := nil;

    Reg := TRegistry.Create;
    AColumnList := TList.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(APath, false) then
      begin
        AColumnList.Count := AGrid.Columns.Count;
      //  for i := 0 to AGrid.Columns.Count - 1 do
        //  AColumnList.Add(AGrid.Columns[i]);

 //       for i := 0 to AColumnList.Count - 1 do
        for i := 0 to AGrid.Columns.Count - 1 do
        begin
          AColumn := AGrid.Columns[i];
          AColumn.EndEllipsis := true;
          AColumn.Title.EndEllipsis := true;
          AColumn.Title.TitleButton := true;

          S := AColumn.Title.Caption;//AColumn.FieldName;
          if Reg.ValueExists('Column_' + S) then
            AColumn.Width := Reg.ReadInteger('Column_' + S);

          if Reg.ValueExists('IndexColumn_' + S) then
          begin
            AIndex := Reg.ReadInteger('IndexColumn_' + S);
            if AIndex < AGrid.Columns.Count then
              AColumnList[AIndex] := AColumn;
  //            AColumn.Index := AIndex;
          end;

          if Reg.ValueExists('VisibleColumn_' + S) then
            AColumn.Visible := Reg.ReadBool('VisibleColumn_' + S);
        end;
        for i := 0 to AColumnList.Count - 1 do
        begin
          if AColumnList[i] <> nil then
            TColumnEh(AColumnList[i]).Index := i;
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
            if (CDS.FindField(S) <> nil) and (CDS.FieldByName(S).FieldKind <> fkCalculated) then
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

      AGrid.OnColumnMoved := OldMovedEvent;
      AGrid.OnColWidthsChanged := OldColWidthsChanged;
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
 