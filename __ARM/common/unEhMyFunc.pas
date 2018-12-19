unit unEhMyFunc;


interface

uses classes, Windows, Messages, Sysutils, graphics,
  registry,
  DB,
  dbclient, 
  Controls, stdctrls,
  Forms, Printers, comctrls,
  dialogs, DBGridEh;


//procedure SetRowHeightsEh(Rect : TRect; AField : TField; ASizeField : TField; AGrid : TCustomDBGridEh);

procedure SaveEhGridSettingsToRegistry(const AGrid : TDBGridEh; APath : String);
procedure LoadEhGridSettingsFromRegistry(const AGrid : TDBGridEh; APath : String);

implementation
{
procedure SetRowHeightsEh(Rect : TRect; AField : TField; ASizeField : TField; AGrid : TCustomDBGridEh);
var R : TRect;
    S : String;
    Y : integer;
begin
  R := Rect;
  S := ASizeField.AsString;
  Y := DrawText(THackGridEh(AGrid).Canvas.Handle, PChar(S), -1, R, DT_WORDBREAK or DT_CALCRECT);
  if Y > THackGridEh(AGrid).RowHeights[THackGridEh(AGrid).DataLink.ActiveRecord + 1] then
    THackGridEh(AGrid).RowHeights[THackGridEh(AGrid).DataLink.ActiveRecord + 1] := Y;

  R := Rect;
  R.Bottom := R.Top + Y;

//  DrawText(THackGridEh(AGrid).Canvas.Handle, PChar(AField.AsString), -1, R, DT_LEFT or DT_WORDBREAK);
end;
}
function GetBtnSortMarker(Field: TField): TSortMarkerEh;
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
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKey(APath, true) then
    begin
      for i := 0 to AGrid.Columns.Count - 1 do
      begin
        Reg.WriteInteger('Column_' + AGrid.Columns[i].FieldName, AGrid.Columns[i].Width);

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
begin
  try
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(APath, false) then
      begin
        for i := 0 to AGrid.Columns.Count - 1 do
          if Reg.ValueExists('Column_' + AGrid.Columns[i].FieldName) then
            AGrid.Columns[i].Width := Reg.ReadInteger('Column_' + AGrid.Columns[i].FieldName);

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
                AGrid.Columns[i].Title.SortMarker := GetBtnSortMarker(AGrid.Columns[i].Field);
                Break;
              end;
            end;
          end;
        end;
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  except
  end;
end;

end.
