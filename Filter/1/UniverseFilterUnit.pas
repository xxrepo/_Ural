unit UniverseFilterUnit;

interface

uses Classes, sysutils, UniverseFilter, UDataSet, USetSqlAct, UEtranConnection, DB,
     StrUtils, DateUtil;

function MakeCondByWhereStr(AWhereStr: String; ATreeData : TList): String;
procedure NewFillTree(WorkDS : TEtranDataSet;
                      UniverseID : integer;
                      AMainDataList: TList; ATreeData : TList;
                      ATaskMaster : TTaskMasterClass);
procedure GetUniverseListID(WorkDS : TEtranDataSet; Value: Integer; UniType : String; AList : TList; ATaskMaster : TTaskMasterClass);
function GetFilterList(WorkDS : TEtranDataSet;
                       UniverseID : integer; AMainData : TMainData; CondStr : String;
                       AList: TList; ATreeData : TList;
                       ATaskMaster : TTaskMasterClass): Boolean;

implementation

function MakeSQLValList(FilterData: TFilterData): String;
var
  S, S1, Rez: String;
  I, N        : Integer;
begin
  Result := '';
  if FilterData.OperCode < ArrMax - 1 then Exit;
  with FilterData do
  begin
    S1 := Par1;
    Result := SQLArray[OperCode];

    if FilterData.FTreeData.DType > 0 then
    begin
      if OperCode in [ArrMax - 1, ArrMax] then
      begin
        N := WordCount(S1, [';']);
        for I := 1 to N do
        begin
          S := ExtractWord(I, S1, [';']);
          if FilterData.FTreeData.DType = 2 then
            S := FormatDateTime(SQLDateMask, StrToDateFmt(DateMask, S));
          S := #39 + Trim(S) + #39;
          if Rez = '' then
            Rez := S
          else
            Rez := rez + ',' + S;
        end;
        S1 := ReplaceStr(S1, ';', ',');
        S1 := Rez;
      end;
    end
    else
      S1 := ReplaceStr(S1, ';', ',');
    if Pos('P1', Result) <> 0 then Result := ReplaceStr(Result, 'P1', S1);
  end;
end;

function NewFilterToSQL(FilterData: TFilterData): String;
var
  S1, S2: String;
//  S: String;
//  I, N        : Integer;
  ToDate: Boolean;
begin
  if FilterData.FTreeData.ObjType = 1 then
  begin
  with FilterData do
  begin
    ToDate := (OperCode < ArrMax - 1) and (FilterData.FTreeData.DType = 2);
    if Par1 <> '' then
    begin
      if ToDate then S1 := FormatDateTime(SQLDateMask, StrToFloat(Par1))
      else S1 := Par1
    end;
    if Par2 <> '' then
    begin
      if ToDate then S2 := FormatDateTime(SQLDateMask, StrToFloat(Par2))
      else S2 := Par2
    end;

    Result := IntToStr(FilterData.FTreeData.ID) + SQLArray[OperCode];
    if FilterData.FTreeData.DType > 0 then
    begin
      if (OperCode = ArrMax - 1) or (OperCode = ArrMax) then
      begin
        Result := IntToStr(FilterData.FTreeData.ID) + MakeSQLValList(FilterData);
      {
        N := WordCount(S1, [';']);
        for I := 1 to N do
        begin
          S := ExtractWord(I, S1, [';']);
          if FilterData.FTreeData.DType = 2 then
            S := FormatDateTime(SQLDateMask, StrToDateFmt(DateMask, S));
          S := #39 + S + #39;
          S1 := ReplaceStr(S1, ExtractWord(I, S1, [';']), S)
        end;
        S1 := ReplaceStr(S1, ';', ','); }
      end
      else
        if Pos('Like', Result) = 0 then
        begin
          if S1 <> '' then S1 := #39 + Trim(S1) + #39;
          if S2 <> '' then S2 := #39 + Trim(S2) + #39
        end;
    end
    else
      S1 := ReplaceStr(S1, ';', ',');
    if Pos('P1', Result) <> 0 then Result := ReplaceStr(Result, 'P1', S1);
    if Pos('P2', Result) <> 0 then Result := ReplaceStr(Result, 'P2', S2)
  end;
  Result := '(' + Result + ')';
  end
  else
    Result := '(c' + IntToStr(FilterData.FTreeData.ID) + ')';
end;


function MakeCondByWhereStr(AWhereStr: String; ATreeData : TList): String;
var WorkList: TStringList;
    i, j, Num, cnt: Integer;
    S: String;
    D: TFilterData;
begin
  Result := '';
  WorkList := TStringList.Create;
  D := TFilterData.Create(nil);
  try
    WorkList.Text := ReplaceStr(AWhereStr, '|', #13#10);
    for i := 0 to WorkList.Count - 1 do
    begin
      S := WorkList[I];
      cnt := WordCount(S, [',']);
      Num := StrToInt(ExtractWord(1, S, [',']));
      for j := 0 to ATreeData.Count - 1 do
        if (not TTreeData(ATreeData[j]).PrClass) and  // Объект (Не класс)
           (TTreeData(ATreeData[j]).ID = Num) and  // ID
           (((cnt > 1) and (TTreeData(ATreeData[j]).ObjType = 1)) or // Объект
           ((cnt = 1) and (TTreeData(ATreeData[j]).ObjType = 2))) then  // Предопределенный фильтр
        begin
          D.FTreeData := TTreeData(ATreeData[j]);
          Break;
        end;
      if cnt > 1 then
      begin
        D.OperCode := StrToInt(ExtractWord(2, S, [',']));
        if cnt >= 3 then
          D.Par1 := ExtractWord(3, S, [',']);
        if cnt = 4 then
          D.Par2 := ExtractWord(4, S, [',']);
        if Result <> '' then
          Result := Result + '|';
      end;
      Result := Result + NewFilterToSQL(D);
    end;
  finally
    WorkList.Free;
    D.Free;
  end;
end;

procedure GetUniverseListID(WorkDS : TEtranDataSet; Value: Integer; UniType : String; AList : TList; ATaskMaster : TTaskMasterClass);
var
  D : TTreeData;
  ClID: Integer;
begin
  if AList <> nil then
    AList.Clear;
  if ATaskMaster <> nil then
    ATaskMaster.ClearTreeDataList;
  try
    with WorkDS do
    begin
      if Active then Close;
      NameSQL := 'Get_Class_List';
      Params.Clear;
      Params.CreateParam(ftInteger, 'UNID', ptInput).AsInteger := Value;
      Params.CreateParam(ftString, 'UNTYPE', ptInput).AsString := UniType; 
      try
        Open;
      except
        on E: Exception do begin
          raise Exception.Create('Не могу получить список классов  ' + E.Message);
        end;
      end;
      First;
      ClID := - 1;
      while not EOF do
      begin
        if ClID <> FieldByName('CLASS_ID').AsInteger then
        begin
          D := TTreeData.Create(ATaskMaster);
          AList.Add(D);
          with D do
          begin
            ID := FieldByName('CLASS_ID').AsInteger;
            PID := FieldByName('CLS_BASECLASSID').AsInteger;
            ObjName := FieldByName('CLS_NAME').AsString;
            ObjHidden := FieldByName('OBJ_HIDDEN').AsString = 'Y';
            DetParent := FieldByName('DETPARENT').AsInteger;
            ObjID := FieldByName('OBJECT_ID').AsInteger;
            PrClass := True;
          end;
          ClID := D.ID
        end;
        if FieldByName('OBJ_HIDDEN').AsString = 'N' then
        begin
          D := TTreeData.Create(ATaskMaster);
          AList.Add(D);
          with D do
          begin
            ObjType := FieldByName('ObjectType').AsInteger;
            ID := FieldByName('OBJECT_ID').AsInteger;
            PID := FieldByName('CLASS_ID').AsInteger;
            ObjName := FieldByName('OBJ_NAME').AsString;
            ObjHidden := FieldByName('OBJ_HIDDEN').AsString = 'Y';
            DetParent := FieldByName('DETPARENT').AsInteger;
            ObjID := FieldByName('OBJECT_ID').AsInteger;
            Large := Odd(FieldByName('Large').AsInteger);
            if FieldByName('FIELDDATATYPE').AsString = 'Num' then
              DType := 0
            else
              if FieldByName('FIELDDATATYPE').AsString = 'Char' then
                DType := 1
              else
                DType := 2;

            FieldKind := FieldByName('FIELDKIND').AsString;
          end;
        end;
        Next;
      end;
      Close;
    end;
  finally
  end;
end;

function GetFilterList(WorkDS : TEtranDataSet;
                       UniverseID : integer; AMainData : TMainData; CondStr : String;
                       AList: TList; ATreeData : TList;
                       ATaskMaster : TTaskMasterClass): Boolean;
var
  J, K: Integer;
  WorkList : TStringList;
  FList    : TList;
  S, S2 : String;
  M        : TMainData;
  D        : TFilterData;
  i: Integer;
begin

end;

procedure NewFillTree(WorkDS : TEtranDataSet;
                      UniverseID : integer;
                      AMainDataList: TList; ATreeData : TList;
                      ATaskMaster : TTaskMasterClass);
var
  M: TMainData;
//  D       : TFilterData;
  I, J, Num: Integer;
  WorkList: TStringList;
//  S, S2   : String;
//  K: Integer;
begin
  try
    AMainDataList.Clear;
    WorkList := TStringList.Create;
    with WorkDS do
    begin
      if Active then Close;
      NameSQL := 'Get_User_Filter_List';
      Params.Clear;
      Params.CreateParam(ftInteger,'UNID',ptInput).Value := UniverseID;
      Params.CreateParam(ftInteger,'FILT_ID',ptInput).AsInteger := - 1;
      try
        Open;
      except
        on E: Exception do
        begin
          raise Exception.Create('Не могу получить список фильтров для выбранной схемы ' + E.Message);
        end;
      end;
      First;
      while not EOF do
      begin
        M := TMainData.Create(ATaskMaster);
        AMainDataList.Add(M);
        with M do
        begin
          ID := FieldByName('FILTER_ID').AsInteger;
          Name := FieldByName('NAME').AsString;
          ThisUser := FieldByName('USER_ID').AsString <> '';
          if FieldByName('PARENT_ID').AsString <> '' then
            ParentID := FieldByName('PARENT_ID').AsInteger;
          GrStr := FieldByName('GROUPSTR').AsString;
          CondStr := MakeCondByWhereStr(FieldByName('WHERESTR').AsString, ATreeData);

        end;
        Next;
      end;
      Close;
    end;
    for i := 0 to AMainDataList.Count - 1 do
      if TMainData(AMainDataList[i]).ParentID <> NoParent then
      begin
        for j := 0 to AMainDataList.Count - 1 do
          if TMainData(AMainDataList[j]).ID = TMainData(AMainDataList[i]).ParentID then
          begin
            TMainData(AMainDataList[j]).HasSubFilter := true;
            Break;
          end;
      end;

 {   for i := 0 to AMainDataList.Count - 1 do
    begin
      M := TMainData(AMainDataList[i]);
      if (M.ID <> -1) and (M.ParentID = NoParent) then
      begin
        N := TTreeView(MainNode.TreeView).Items.AddChildObject(MainNode, M.Name, M);
        N.HasChildren := (M.GrStr <> '') or (M.HasSubFilter);
        MainViewSetNodeImageIndex(N);
      end;
    end; }

  {  if (IDList <> nil) and (SelectedFilter <> -1) then
    begin
      Node := MainNode;
      for i := IDList.Count - 1 downto 0 do
      begin
        Num := Integer(IDList[i]);
        for j := 0 to Node.Count - 1 do
        begin
          if TMainData(Node.Item[j].Data).ID = Num then
          begin
            Node := Node.Item[j];
            Node.Expand(false);
            Break;
          end;
        end;
      end; 
    end;    }
  finally
    WorkList.Free;
  end;
//  if Assigned(fOnFillTree) then fOnFillTree(Self);
end;
end.
