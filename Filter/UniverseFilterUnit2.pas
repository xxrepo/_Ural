unit UniverseFilterUnit2;


interface

uses controls, Windows, Messages, classes, 
     UniverseFilter, StrUtils, Sysutils, DB, dbclient, DateUtil, ADOdb;

function MakeGroupList(ADODataSet: TCustomADODataSet; AID: integer; AGroupList : TStrings) : boolean;
function MakeOrderList(ADODataSet: TCustomADODataSet; AID: integer; AOrderList : TStrings) : boolean;
function MakeWhereList(ADODataSet: TCustomADODataSet; AID: integer; AWhereList : TStrings) : boolean;
function MakeTableList(ADODataSet: TCustomADODataSet; AID: integer; ATableList : TStrings) : boolean;
function MakeFieldList(ADODataSet: TCustomADODataSet; AID: integer; AFieldList, AFieldNames : TStrings) : boolean;


procedure BeginUpdateControl(AControl: TWinControl);
procedure EndUpdateControl(AControl: TWinControl);

function UFVarToStr(Value : Variant;
                    AFormatDigit : String = '0.##';
                    AFormatDate : String = 'dd-mm-yyyy';
                    AFormatTime : String = 'hh:nn:ss') : String;

function UFStrToFloatDef(Str : String) : Extended;
//function UFStrToDateTimeDef(Str : String) : TDateTime;
function UFFormatDateTimeEx(ADate : TDateTime) : String;

procedure UFCondTypesGetNameList(SL : TStrings; AUFType : TUFType);
function UFCondGetName(AUFType : TUFType; AUFCondType : TUFCondType) : String;
function UFCondGetLabel1(AUFCondType : TUFCondType) : String;
function UFCondGetLabel2(AUFCondType : TUFCondType) : String;

function UFCondGetSQL(DType : TUFType; AUFCondType : TUFCondType; Par1, Par2 : String) : String;
function UFCondGetSQLObj(AUFCondType : TUFCondType; Par1 : String) : String;

procedure GetUniverseListID(WorkDS : TClientDataSet;
                            ID_Univ: Integer;
                            UniType : String;
                            ATaskMaster : TTaskMasterClass);

implementation

var   DateEditMask : String;

function UFCondGetSQL(DType : TUFType; AUFCondType : TUFCondType; Par1, Par2 : String) : String;
  function CaseToStr(Value : String) : String;
  var V : TDateTime;
  begin
    case DType of
      uftStr :
      begin
        Result := '''' + Value + '''';
      end;
      uftInt, uftFloat :
      begin
        Result := Value;
      end;
      uftDate :
      begin
        V := UFStrToFloatDef(Value);
        Result := '''' + UFVarToStr(V, '', 'yyyy.mm.dd', 'hh:nn:ss') + '''';
      end;
    end;
  end;
begin
  case AUFCondType of
    uctBitTrue :
      begin
        Result := '=1';
      end;
    uctBitFalse :
      begin
        Result := '=0';
      end;
    uctEq :
      begin
        Result := '=' + CaseToStr(Par1);
      end;
    uctNotEq :
      begin
        Result := '<>' + CaseToStr(Par1);
      end;
    uctMax :
      begin
        Result := '>' + CaseToStr(Par1);
      end;
    uctMaxEq :
      begin
        Result := '>=' + CaseToStr(Par1);
      end;
    uctMin :
      begin
        Result := '<' + CaseToStr(Par1);
      end;
    uctMinEq :
      begin
        Result := '<=' + CaseToStr(Par1);
      end;
    uctBetween :
      begin
        Result := ' BETWEEN ' + CaseToStr(Par1) + ' AND ' + CaseToStr(Par2);
      end;
    uctNotBetween :
      begin
        Result := ' NOT BETWEEN ' + CaseToStr(Par1) + ' AND ' + CaseToStr(Par2);
      end;
    uctEmpty :
      begin
        Result := ' IS NULL';
      end;
    uctNotEmpty :
      begin
        Result := ' IS NOT NULL';
      end;
    uctLike :
      begin
        Result := ' LIKE ' + '''' + '%' + Trim(Par1) + '%' + '''';
      end;
    uctNotLike :
      begin
        Result := ' NOT LIKE ' + '''' + '%' + Trim(Par1) + '%' + '''';
      end;
    uctStart :
      begin
        Result := ' LIKE ' + '''' + Trim(Par1) + '%' + '''';
      end;
    uctNotStart :
      begin
        Result := ' NOT LIKE ' + '''' + Trim(Par1) + '%' + '''';
      end;
    uctFinish :
      begin
        Result := ' LIKE ' + '''' + '%' + Trim(Par1) + '''';
      end;
    uctNotFinish :
      begin
        Result := ' NOT LIKE ' + '''' + '%' + Trim(Par1) + '''';
      end;
    uctInList :
      begin
        Result := ' IN (' + StringReplace(Trim(Par1), ';', ',', [rfReplaceAll, rfIgnoreCase]) + ')';
      end;
    uctNotInList :
      begin
        Result := ' NOT IN (' + StringReplace(Trim(Par1), ';', ',', [rfReplaceAll, rfIgnoreCase]) + ')';
      end;
  end;
end;

function UFCondGetSQLObj(AUFCondType : TUFCondType; Par1 : String) : String;
begin
  case AUFCondType of
    uctEq :
      begin
        Result := '=' + Trim(Par1);
      end;
    uctNotEq :
      begin
        Result := '<>' + Trim(Par1);
      end;
    uctEmpty :
      begin
        Result := ' IS NULL';
      end;
    uctNotEmpty :
      begin
        Result := ' IS NOT NULL';
      end;
    uctInList :
      begin
        Result := ' IN (' + StringReplace(Trim(Par1), ';', ',', [rfReplaceAll, rfIgnoreCase]) + ')';
      end;
    uctNotInList :
      begin
        Result := ' NOT IN (' + StringReplace(Trim(Par1), ';', ',', [rfReplaceAll, rfIgnoreCase]) + ')';
      end;
  end;
end;

function UFCondGetLabel1(AUFCondType : TUFCondType) : String;
begin
  if AUFCondType in [uctNone, uctBitTrue, uctBitFalse, uctEmpty, uctNotEmpty] then
    Result := ''
  else
    if AUFCondType in [uctBetween, uctNotBetween] then
      Result := '1-е значение'
    else
      Result := 'Значение';
end;

function UFCondGetLabel2(AUFCondType : TUFCondType) : String;
begin
  if AUFCondType in [uctBetween, uctNotBetween] then
    Result := '2-е значение'
  else
    Result := '';
end;

function UFCondGetName(AUFType : TUFType; AUFCondType : TUFCondType) : String;
begin
  if AUFCondType in [uctEq, uctInList] then
    Result := ': '
  else
    if AUFCondType in [uctNotEq, uctNotInList] then
      Result := 'кроме: '
    else
      if AUFCondType = uctEmpty then
        Result := 'Пустое'
      else
        if AUFCondType = uctNotEmpty then
          Result := 'Не пустое'
        else
          if AUFCondType = uctBitTrue then
            Result := ': Да'
          else
            if AUFCondType = uctBitFalse then
              Result := ': Нет'
            else
            begin
              case AUFType of
                uftInt, uftFloat, uftStr :
                begin
                  if AUFCondType = uctMax then
                    Result := 'Больше '
                  else
                    if AUFCondType = uctMaxEq then
                      Result := 'Больше или равно '
                    else
                      if AUFCondType = uctMin then
                        Result := 'Меньше '
                      else
                        if AUFCondType = uctMinEq then
                          Result := 'Меньше или равно '
                        else
                          if AUFCondType = uctBetween then
                            Result := 'Находится между '
                          else
                            if AUFCondType = uctNotBetween then
                              Result := 'Не находится между '
                end;
                uftDate :
                begin
                  if AUFCondType = uctMax then
                    Result := 'с '
                  else
                    if AUFCondType = uctMaxEq then
                      Result := 'с(включительно) '
                    else
                      if AUFCondType = uctMin then
                        Result := 'до '
                      else
                        if AUFCondType = uctMinEq then
                          Result := 'до(включительно) '
                        else
                          if AUFCondType = uctBetween then
                            Result := 'в период '
                          else
                            if AUFCondType = uctNotBetween then
                              Result := 'Не в период '
                end;
            end;
  end;
end;

procedure UFCondTypesGetNameList(SL : TStrings; AUFType : TUFType);
var P : Pointer;
begin
  SL.Clear;
  case AUFType of
    uftObj :
    begin
      SL.AddObject('Равно', Pointer(uctEq));
      SL.AddObject('Не равно', Pointer(uctNotEq));

      SL.AddObject('Пустое', Pointer(uctEmpty));
      SL.AddObject('Не пустое', Pointer(uctNotEmpty));
      SL.AddObject('Входит в список', Pointer(uctInList));
      SL.AddObject('Не входит в список', Pointer(uctNotInList));
    end;
    uftBit :
    begin
      SL.AddObject('Да', Pointer(uctBitTrue));
      SL.AddObject('Нет', Pointer(uctBitFalse));

      SL.AddObject('Пустое', Pointer(uctEmpty));
      SL.AddObject('Не пустое', Pointer(uctNotEmpty));
    end;
    uftInt, uftFloat, uftDate :
    begin
      SL.AddObject('Равно', Pointer(uctEq));
      SL.AddObject('Не равно', Pointer(uctNotEq));
      SL.AddObject('Больше', Pointer(uctMax));
      SL.AddObject('Больше или равно', Pointer(uctMaxEq));
      SL.AddObject('Меньше', Pointer(uctMin));
      SL.AddObject('Меньше или равно', Pointer(uctMinEq));
      SL.AddObject('Находится между', Pointer(uctBetween));
      SL.AddObject('Не находится между', Pointer(uctNotBetween));

      SL.AddObject('Пустое', Pointer(uctEmpty));
      SL.AddObject('Не пустое', Pointer(uctNotEmpty));

      SL.AddObject('Входит в список', Pointer(uctInList));
      SL.AddObject('Не входит в список', Pointer(uctNotInList));
    end;
    uftStr:
    begin
      SL.AddObject('Равно', Pointer(uctEq));
      SL.AddObject('Не равно', Pointer(uctNotEq));
{      SL.AddObject('Больше', Pointer(uctMax));
      SL.AddObject('Больше или равно', Pointer(uctMaxEq));
      SL.AddObject('Меньше', Pointer(uctMin));
      SL.AddObject('Меньше или равно', Pointer(uctMinEq));  
      SL.AddObject('Находится между', Pointer(uctBetween));
      SL.AddObject('Не находится между', Pointer(uctNotBetween));  }

      SL.AddObject('Пустое', Pointer(uctEmpty));
      SL.AddObject('Не пустое', Pointer(uctNotEmpty));

      SL.AddObject('Входит в список', Pointer(uctInList));
      SL.AddObject('Не входит в список', Pointer(uctNotInList));

      SL.AddObject('Содержит', Pointer(uctLike));
      SL.AddObject('Не содержит', Pointer(uctNotLike));

      SL.AddObject('Начинается с', Pointer(uctStart));
      SL.AddObject('Не начинается с', Pointer(uctNotStart));

      SL.AddObject('Заканчивается на', Pointer(uctFinish));
      SL.AddObject('Не заканчивается на', Pointer(uctNotFinish));
    end;
  end;
end;

procedure GetUniverseListID(WorkDS : TClientDataSet;
                            ID_Univ: Integer;
                            UniType : String;
                            ATaskMaster : TTaskMasterClass);
var
  ObjData : TObjData;
  PropData : TPropData;
  Cnt, i : integer;
  S : String;
begin
  ATaskMaster.ClearObjDataList;
  try
    with WorkDS do
    begin
      if Active then Close;
      ProviderName := 'dsGetObj';
      Params.Clear;
      FetchParams;
      Params.ParamByName('@id_univ').Value := ID_Univ;
      try
        Open;
      except
        on E: Exception do begin
          raise Exception.Create('Не могу получить список объектов  ' + E.Message);
        end;
      end;
//      ID_Univ := TDispatchConnection(FConnection).AppServer.GetUnivObjID(ID_Univ);
      First;

//      ObjData := TObjData.Create(FTaskMaster);
//      ObjData.ID := FUnivObjID;

      while not EOF do
      begin
        ObjData := TObjData.Create(ATaskMaster);
        with ObjData do
        begin
          ID_DBObj := FieldByName('id_Obj').AsInteger;
          ID_Rel := FieldByName('ID_Rel').Value;
          PID := FieldByName('id_RelParent').Value;
          ObjName := FieldByName('RelName').AsString;
          
        end;
        Next;
      end;
      Close;
      
      ProviderName := 'dsGetUnivPropList';
      Params.Clear;
      FetchParams;
      Params.ParamByName('@id_univ').Value := ID_Univ;
      try
        Open;
      except
        on E: Exception do begin
          raise Exception.Create('Не могу получить список объектов  ' + E.Message);
        end;
      end;

      Cnt := ATaskMaster.ObjDataCount;
      while not EOF do
      begin
        for i := 0 to Cnt - 1 do
        begin
          ObjData := ATaskMaster.ObjData[i];
          if (ObjData.ID_DBObj = WorkDS.FieldByName('id_Obj').AsInteger) then
          begin
            PropData := TPropData.Create(ATaskMaster);
            PropData.ID_DBObj := FieldByName('id_Prop').AsInteger;
 //           PropData.FieldType := FieldByName('FieldType').AsString;
            PropData.ObjName := FieldByName('FieldDescr').AsString;

            S := Trim(UpperCase(FieldByName('FieldType').AsString));

            if S = 'INT' then
              PropData.DType := uftInt
            else
              if S = 'FLOAT' then
                PropData.DType := uftFloat
              else
                if S = 'DATE' then
                  PropData.DType := uftDate
                else
                  if S = 'STR' then
                    PropData.DType := uftStr
                  else
                    if S = 'BIT' then
                      PropData.DType := uftBit
                    else
                      PropData.DType := uftError;

            ObjData.FPropList.Add(PropData);
            PropData.FObjData := ObjData;
          end;
        end;
        Next;
      end;
      Close;

    end;
  finally
    WorkDS.Close;
//    GetNodeTDListCover(nil);
  end; 
end;

procedure BeginUpdateControl(AControl: TWinControl);
begin
  SendMessage(AControl.Handle, WM_SETREDRAW, 0, 0);
end;

procedure EndUpdateControl(AControl: TWinControl);
begin
  SendMessage(AControl.Handle, WM_SETREDRAW, 1, 0);
  AControl.Refresh;
end;

function UFFormatDateTimeEx(ADate : TDateTime) : String;
var intX : integer;
    RealX : Extended;
    S : String; 
begin
  if Int(ADate) <> 0 then
    S := SQLDateMask;

  if Frac(ADate) <> 0 then
  begin
    if S = '' then
      S := SQLTimeMask
    else
      S := S + ' ' + SQLTimeMask;
  end;

  if S <> '' then
    Result := FormatDateTime(S, ADate)
  else
    Result := '';
end;

function UFStrToFloatDef(Str : String) : Extended;
var S : String;
begin
  if DecimalSeparator = '.' then
    S := ','
  else
    S := '.';
  S := ReplaceStr(Str, S, DecimalSeparator);
  S := trim(S);
  if S <> '' then
  begin
    if Pos(';', S) > 0 then
      S := trim(Copy(S, 1, Pos(';', S) - 1));
    try
      Result := StrToFloat(S)
    except
    end;
  end
  else
    Result := 0;
end;

function UFStrToDateTimeDef(Str : String) : TDateTime;
var S : String;
begin
{  if DecimalSeparator = '.' then
    S := ','
  else
    S := '.';
  S := ReplaceStr(Str, S, DecimalSeparator);  }
  S := trim(Str);
  if S <> '' then
  begin
    if Pos(';', S) > 0 then
      S := trim(Copy(S, 1, Pos(';', S) - 1));
    try
      Result := StrToDateDef(S, 0);
    except
    end;
  end
  else
    Result := 0;
end;

function UFVarToStr(Value : Variant;
                    AFormatDigit : String;
                    AFormatDate : String;
                    AFormatTime : String) : String;
var VT : integer;
    S : String;
begin
  Result := '';
  VT := varType(Value);
  case VT of
    varSmallint, varInteger, varOleStr, varString : Result := VarToStr(Value);  
    varSingle, varDouble, varCurrency :
    begin
      Result := FormatFloat(AFormatDigit, Value);
    end;
    varDate:
    begin
      S := '';
      if Int(Value) <> 0 then
        S := AFormatDate;

      if Frac(Value) <> 0 then
      begin
        S := S + ' ' + AFormatTime;
      end;

      if S <> '' then
        Result := FormatDateTime(S, Value)
      else
        Result := '';
    end;
    varBoolean:
    begin
      if Value then
        Result := 'Да'
      else
        Result := 'Нет';
    end;
  end;
end;

function MakeFieldList(ADODataSet: TCustomADODataSet; AID: integer; AFieldList, AFieldNames : TStrings) : boolean;
var S, S2 : String;

    SL : TStringList;
begin
  AFieldList.Clear;
  AFieldNames.Clear;
  Result := false;
  SL := TStringList.Create;
  try
    // Формируем список полей
    with ADODataSet do
    begin
      Close;
      TADOQuery(ADODataSet).SQL.Text := 'EXEC FLT_Eng_FieldStr ' + IntToStr(AID);
      Open;
      First;
      while not Eof do
      begin
        S := 'T' + FieldByName('id_Rel').AsString + '.' + FieldByName('FieldName').AsString;
        SL.Add(S);
        AFieldNames.Add(FieldByName('Name').AsString);

        Next;
      end;
    end;
    S := StringReplace(Trim(SL.Text), #13 + #10, ',' + #13 + #10, [rfReplaceAll, rfIgnoreCase]);

    if S <> '' then
      AFieldList.Add(S);
    Result := true;
  finally
    SL.Free;
  end;
end;

function MakeTableList(ADODataSet: TCustomADODataSet; AID: integer; ATableList : TStrings) : boolean;
var S, S2 : String;

    SL : TStringList;
begin
  ATableList.Clear;
  Result := false;
  SL := TStringList.Create;
  try
    // Список таблиц
    with ADODataSet do
    begin
      Close;
      TADOQuery(ADODataSet).SQL.Text := 'EXEC FLT_Eng_2_2 ' + IntToStr(AID);
      Open;
      First;
      while not Eof do
      begin
        S := FieldByName('TableName').AsString + ' T' + FieldByName('id_Rel').AsString + ' (NOLOCK)';
        if not FieldByName('id_RelParent').IsNull then
          S := 'LEFT JOIN ' + S + ' ON T' + FieldByName('id_RelParent').AsString + '.' + FieldByName('RelField').AsString + ' = T' + FieldByName('id_Rel').AsString + '.' + FieldByName('KeyField').AsString;
        SL.Add(S);

        Next;
      end;

      Close;
    end;
    if S <> '' then
      ATableList.AddStrings(SL);
    Result := true;
    // ***
  finally
    SL.Free;
  end;
end;

function MakeWhereList(ADODataSet: TCustomADODataSet; AID: integer; AWhereList : TStrings) : boolean;
var S, S2 : String;

    SL : TStringList;
    CondCode: TUFCondType;
    DType : TUFType;
begin
  AWhereList.Clear;
  Result := false;
  SL := TStringList.Create;
  try
    // Формируем строку WHERE
    with ADODataSet do
    begin
      Close;
      TADOQuery(ADODataSet).SQL.Text := 'EXEC FLT_Eng_CondStr ' + IntToStr(AID);
      Open;
      First;
      while not Eof do
      begin
        S := 'T' + FieldByName('id_Rel').AsString + '.' + FieldByName('FieldName').AsString;
        S2 := Trim(UpperCase(FieldByName('FieldType').AsString));
        if S2 = 'INT' then
          DType := uftInt
        else
          if S2 = 'FLOAT' then
            DType := uftFloat
          else
            if S2 = 'DATE' then
              DType := uftDate
            else
              if S2 = 'STR' then
                DType := uftStr
              else
                if S2 = 'BIT' then
                  DType := uftBit
                else
                  DType := uftError;
        CondCode := TUFCondType(FieldByName('CondCode').AsInteger);

        if FieldByName('id_Prop').IsNull then
        begin
          // Это объект
          S := S + UFCondGetSQLObj(CondCode, FieldByName('Par1').AsString);
        end
        else
        begin
          S := S + UFCondGetSQL(DType, CondCode, FieldByName('Par1').AsString, FieldByName('Par2').AsString);
        end;
        SL.Add(S);

        Next;
      end;
    end;

    if SL.Text <> '' then
    begin
      S := StringReplace(Trim(SL.Text), #13 + #10, ' AND' + #13 + #10, [rfReplaceAll, rfIgnoreCase]);
      if S <> '' then
        AWhereList.Add(S);
    end;
    Result := true;
    // ***
  finally
    SL.Free;
  end;
end;

function MakeOrderList(ADODataSet: TCustomADODataSet; AID: integer; AOrderList : TStrings) : boolean;
var S, S2 : String;

    SL : TStringList;
begin
  AOrderList.Clear;
  Result := false;
  SL := TStringList.Create;
  try
    // Список таблиц
    with ADODataSet do
    begin
      Close;
      TADOQuery(ADODataSet).SQL.Text := 'EXEC FLT_Eng_OrderStr ' + IntToStr(AID);
      Open;
      First;
      while not Eof do
      begin
        S := 'T' + FieldByName('id_Rel').AsString + '.' + FieldByName('FieldName').AsString;
        SL.Add(S);

        Next;
      end;

      Close;
    end;
    S := StringReplace(Trim(SL.Text), #13 + #10, ',' + #13 + #10, [rfReplaceAll, rfIgnoreCase]);
    if S <> '' then
      AOrderList.Add(S);
    Result := true;
    // ***
  finally
    SL.Free;
  end;
end;

function MakeGroupList(ADODataSet: TCustomADODataSet; AID: integer; AGroupList : TStrings) : boolean;
var S, S2 : String;

    SL : TStringList;
begin
  AGroupList.Clear;
  Result := false;
  SL := TStringList.Create;
  try
    // Список таблиц
    with ADODataSet do
    begin
      Close;
      TADOQuery(ADODataSet).SQL.Text := 'EXEC FLT_Eng_GroupStr ' + IntToStr(AID);
      Open;
      First;
      while not Eof do
      begin
        S := 'T' + FieldByName('id_Rel').AsString + '.' + FieldByName('FieldName').AsString;
        SL.Add(S);

        Next;
      end;

      Close;
    end;
    S := StringReplace(Trim(SL.Text), #13 + #10, ',' + #13 + #10, [rfReplaceAll, rfIgnoreCase]);
    if S <> '' then
      AGroupList.Add(S);
    Result := true;
    // ***
  finally
    SL.Free;
  end;
end;

initialization
  DateEditMask := 'dd' + DateSeparator +'mm'+ DateSeparator + 'yyyy';

end.
