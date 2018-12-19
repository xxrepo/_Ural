unit UniverseFilterUnit2;


interface

uses controls, Windows, Messages, classes, 
     UniverseFilter, StrUtils, Sysutils, DB, dbclient, DateUtil, ADOdb,
     contnrs, mconnect;

function MakeGroupList(ADODataSet: TCustomADODataSet; AID: integer; AGroupList : TStrings) : boolean;
function MakeOrderList(ADODataSet: TCustomADODataSet; AID: integer; AOrderList : TStrings) : boolean;
function MakeWhereList(ADODataSet: TCustomADODataSet; AID: integer; AWhereList : TStrings) : boolean;
function MakeTableList(ADODataSet: TCustomADODataSet; AID: integer; ATableList : TStrings) : boolean;
function MakeFieldList(ADODataSet: TCustomADODataSet; AID: integer; AFieldList, AFieldNames : TStrings) : boolean;


function MakeWhereList222(AObjectList: TObjectList; AWhereList : TStrings; FltExtPatam: TStrings) : boolean;
function MakeTableList222(AObjectList: TObjectList; ATableList : TStrings) : boolean;
function MakeFltExtPatam222(AObjectList: TObjectList; AFltExtPatam : TStrings) : boolean;

function MakeSQLTree(AObjectList, AAggList: TObjectList; AColList, AGrpList, ATableList, AOrderList : TStrings) : boolean;

function MakeSQL(ADOQuery : TADOQuery; ASQL: TStringList; AID : integer) : boolean;

procedure BeginUpdateControl(AControl: TWinControl);
procedure EndUpdateControl(AControl: TWinControl);

function UFVarToStr(Value : Variant;
                    AFormatDigit : String = '0.##';
                    AFormatDate : String = 'dd-mm-yyyy';
                    AFormatTime : String = 'hh:nn:ss') : String;

function UFStrToFloatDef(Str : String) : Extended;
//function UFStrToDateTimeDef(Str : String) : TDateTime;
function UFFormatDateTimeEx(ADate : TDateTime) : String;

procedure UFCondTypesGetNameList(SL : TStrings; AUFType : TUFType; isDetail : boolean = false; isExtParam : boolean = false);
function UFCondGetName(AUFType : TUFType; AUFCondType : TUFCondType) : String;
function UFCondGetLabel1(AUFCondType : TUFCondType) : String;
function UFCondGetLabel2(AUFCondType : TUFCondType) : String;

function StrToUFType(S : String) : TUFType;
function UFCondGetSQL(DType : TUFType; AUFCondType : TUFCondType; Par1, Par2 : String) : String;
function UFCondGetSQLObj(AUFCondType : TUFCondType; Par1 : String) : String;
function UFCondGetSQLObj_2(AFltList : TFltList) : String;

procedure GetUniverseListID(WorkDS : TClientDataSet;
                            ID_Univ: Integer;
                            UniType : String;
                            ATaskMaster : TTaskMasterClass);

function CreateFilterItem(ATaskMaster : TTaskMasterClass; CDS : TClientDataSet) : boolean; overload;
function CreateFilterItem(ATaskMaster : TTaskMasterClass; FilterData : TFilterData) : boolean; overload;

function FilterToStringDoc(FilterData: TFilterData; AConnection: TCustomConnection): String;
procedure FilterToText(FilterData: TFilterData; ANeedRecalc: boolean; AConnection: TCustomConnection);
procedure GetNewFilterParams(AFilterData: TFilterData;
                              var P1, P2: String; SQLParam: Boolean); 
function FilterToStringDoc_GetVal(id_Obj, ID: Integer; AConnection: TCustomConnection): String;
function GetFilterTextToDoc(ATaskMaster : TTaskMasterClass): String;

procedure SetBsnId_UN(AID: Variant; WorkDS : TClientDataSet; ATaskMaster: TTaskMasterClass);

function CreateFilterItem_UN(ATaskMaster : TTaskMasterClass;
                             id_Prop, id_Obj, id_Rel : Variant;
                             CondCode : TUFCondType;
                             Par1, Par2 : String) : boolean;

implementation

var   DateEditMask : String;


procedure SetBsnId_UN(AID: Variant; WorkDS: TClientDataSet; ATaskMaster: TTaskMasterClass);
var i : integer;
    PropData : TPropData;
    S : String;
begin
  try
    with WorkDS do
    begin
      Close;
      ProviderName := 'dsOperExtDataNamez';
      Params.Clear;
      FetchParams;
      Params.ParamByName('@id_business').Value := AID;
      try
        Open;
      except
        on E: Exception do begin
          raise Exception.Create('Не могу получить список объектов  ' + E.Message);
        end;
      end;
//        for i := 0 to FTaskMaster.PropDataCount - 1 do
//         FTaskMaster.PropData[i].ParamSeted := false;
      First;
      while Not Eof do
      begin
        case FieldByName('Type').AsInteger of
          1 : S := 'Dig';
          2 : S := 'Str';
          3 : S := 'Date';
        end;
        S := S + FieldByName('NumPrm').AsString;
        S := UpperCase(S);

        for i := 0 to ATaskMaster.PropDataCount - 1 do
        begin
          PropData := ATaskMaster.PropData[i];
          if PropData.NeedAlias then
          begin
            if (UpperCase(PropData.Un_FieldName) = S) then
            begin
              if FieldByName('Visible').AsBoolean and (not FieldByName('ParName').IsNull) then
              begin
                PropData.ObjName := FieldByName('ParName').AsString;
                PropData.ParamSeted := true;
              end
              else
              begin
              {  case FieldByName('Type').AsInteger of
                  1 : S := 'Числовой параметр ';
                  2 : S := 'Строковый параметр ';
                  3 : S := 'Дата ';
                end;
                PropData.ObjName := S + FieldByName('NumPrm').AsString; }
                PropData.ParamSeted := false;
              end;
            end;
         //   else
         //
          end;
        end;
        Next;
      end;
    end;
  finally
    WorkDS.Close;
  end;
end;

function GetFilterTextToDoc(ATaskMaster : TTaskMasterClass): String;
var i: Integer;
    N: Integer;
begin
  Result := '';
  N := ATaskMaster.FilterDataCount;
  for i := 0 to N - 1 do
  begin
    if Result <> '' then Result := Result + #13 + #10;
    if ATaskMaster.FilterData[i].Text = '' then FilterToText(ATaskMaster.FilterData[i], true, ATaskMaster.Connection);
    Result := Result + ATaskMaster.FilterData[i].Text;
    //FilterToStringDoc(FTaskMaster.FilterData[i]);
  end;
end;

procedure GetNewFilterParams(AFilterData: TFilterData;
  var P1, P2: String; SQLParam: Boolean);
var
  ToDate: Boolean;
  E : Extended;
begin
  P1 := '';
  P2 := '';
  with AFilterData do
  begin
    if ObjData = nil then Exit;
    ToDate := (ObjData.DType = uftDate);
    if Par1 <> '' then
    begin
      if ToDate then
        P1 := UFFormatDateTimeEx(UFStrToFloatDef(Par1))
      else
        P1 := Par1;
    end;
    if CondCode in [uctBetween, uctNotBetween] then
    begin
      if (Par2 <> '') {and (OperCode in [9, 12])} then
      begin
        if ToDate then
          P2 := UFFormatDateTimeEx(UFStrToFloatDef(Par2))
        else
          P2 := Par2;
      end;
    end
    else
      P2 := '';  
  end;
end;

procedure FilterToText(FilterData: TFilterData; ANeedRecalc: boolean; AConnection: TCustomConnection);
begin
  if ANeedRecalc or (FilterData.FText = '') then
    FilterData.FText := FilterToStringDoc(FilterData, AConnection);
end;

function FilterToStringDoc_GetVal(id_Obj, ID: Integer; AConnection: TCustomConnection): String;
var S : OleVariant;
begin
  if TDispatchConnection(AConnection).AppServer.FLT_ObjGetProp(id_Obj, ID, S) = 1 then
    Result := S
  else
    Result := '';
end;

function FilterToStringDoc(FilterData: TFilterData; AConnection: TCustomConnection): String;
var S1, S2, S: String;
    i: Integer;
    SL: TStringList;
begin
  if FilterData.ObjData is TObjData then
    S1 := FilterData.Par1
  else
    GetNewFilterParams(FilterData, S1, S2, False);
  with FilterData do
  begin
    if ObjData = nil then
      Exit;
    Result := ObjData.FullName;
    if CondCode <> uctNone then
    begin
      Result := Result + ' ' + UFCondGetName(ObjData.DType, CondCode);
    end;
    if (S1 <> '') and (CondCode in [uctEq..uctNotEq, uctInList, uctNotInList]) and
       (FilterData.ObjData.DType <> uftDate) and
       (ObjData is TObjData) then
    begin
      SL := TStringList.Create;
      try
        SL.Text := ReplaceStr(S1, ';', #13 + #10);
        S := '';
        FSL.Clear;
        for i := 0 to SL.Count - 1 do
        begin        //000
          if S = '' then
            S := FilterToStringDoc_GetVal(ObjData.ID_DBObj, StrToInt(SL[i]), AConnection)
          else
            S := S + '; ' + FilterToStringDoc_GetVal(ObjData.ID_DBObj, StrToInt(SL[i]), AConnection);
            
          FSL.Add(S);
        end;
        Result := Result + ' ' + S;
      finally
        SL.Free;
      end; 
    end
    else
    begin

//*************
      if (CondCode < uctInList) and (ObjData.DType = uftDate) then
      begin
        if FilterData.Par1 <> '' then
          S1 := UFFormatDateTimeEx(UFStrToFloatDef(Par1));
        if (FilterData.Par2 <> '')
      //    and (FilterData.CondCode in [9, 12])
          then
          S2 := UFFormatDateTimeEx(UFStrToFloatDef(Par2));
      end;
//*************

      if S1 <> '' then Result := Result + ' ' + S1;
      if S2 <> '' then Result := Result + ' и ' + S2;
    end;
  end;
end;

function CreateFilterItem_UN(ATaskMaster : TTaskMasterClass;
                             id_Prop, id_Obj, id_Rel : Variant;
                             CondCode : TUFCondType;
                             Par1, Par2 : String) : boolean;
var AFilterData : TFilterData;
    i : integer;
    ADBObj, ADBObjRez : TUFDBObj;
begin
  Result := false;
  ADBObjRez := nil;
  if id_Prop = Null then
  begin
    // *** Это объект
    for i := 0 to ATaskMaster.ObjDataCount - 1 do
    begin
      ADBObj := ATaskMaster.ObjData[i];
      if (ADBObj.ID_DBObj = id_Obj) and
         (ADBObj.Un_id_Rel = id_Rel)  then
      begin
        ADBObjRez := ADBObj;
        Break;
      end;
    end;
  end
  else
  begin
    // *** Это свойство
    for i := 0 to ATaskMaster.PropDataCount - 1 do
    begin
      ADBObj := ATaskMaster.PropData[i];
      if (ADBObj.ID_DBObj = id_Prop) and
         (ADBObj.Un_id_Rel = id_Rel)  then
      begin
        ADBObjRez := ADBObj;
        Break;
      end;
    end;
  end;
  if ADBObjRez <> nil then
  begin
    AFilterData := TFilterData.Create(ATaskMaster);
    AFilterData.ObjData := ADBObjRez;
    AFilterData.CondCode := CondCode;
    AFilterData.Par1 := Par1;
    AFilterData.Par2 := Par2;

    Result := True;
  end;
end;

function CreateFilterItem(ATaskMaster : TTaskMasterClass; CDS : TClientDataSet) : boolean;
var AFilterData : TFilterData;
    i : integer;
    ADBObj, ADBObjRez : TUFDBObj;
begin
  Result := CreateFilterItem_UN(ATaskMaster,
                                CDS.FieldByName('id_Prop').Value,
                                CDS.FieldByName('id_Obj').Value,
                                CDS.FieldByName('id_Rel').Value,
                                TUFCondType(CDS.FieldByName('CondCode').AsInteger),
                                CDS.FieldByName('Par1').AsString,
                                CDS.FieldByName('Par2').AsString);
end;

function CreateFilterItem(ATaskMaster : TTaskMasterClass; FilterData : TFilterData) : boolean;
var AFilterData : TFilterData;
    i : integer;
    ADBObj, ADBObjRez : TUFDBObj;
begin
  Result := CreateFilterItem_UN(ATaskMaster,
                                FilterData.ObjData.Un_id_Prop,
                                FilterData.ObjData.Un_id_Obj,
                                FilterData.ObjData.Un_id_Rel,
                                FilterData.CondCode,
                                FilterData.Par1,
                                FilterData.Par2);
end;

function StrToUFType(S : String) : TUFType;
begin
  S := Trim(UpperCase(S));
  if S = 'INT' then
    Result := uftInt
  else
    if S = 'FLOAT' then
      Result := uftFloat
    else
      if S = 'DATE' then
        Result := uftDate
      else
        if S = 'STR' then
          Result := uftStr
        else
          if S = 'BIT' then
            Result := uftBit
          else
            Result := uftError;
end;

function UFCondGetSQL(DType : TUFType; AUFCondType : TUFCondType; Par1, Par2 : String) : String;
var tmpS, S : String;
  function CaseToStr(Value : String; IsEnd : boolean = false) : String;
  var V : TDateTime;
      S : String; 
  begin
    case DType of
      uftStr :
      begin
        S := ReplaceStr(Value, '''', '''' + '''');
        Result := S;
        if AUFCondType in [uctLike, uctNotLike, uctStart, uctNotStart, uctFinish, uctNotFinish] then
          Result := S
        else
          Result := '''' + S + '''';
      end;
      uftInt, uftFloat :
      begin
        S := ReplaceStr(Value, ',', '.');
        Result := S;
      end;
      uftDate :
      begin
        V := UFStrToFloatDef(Value);
        if IsEnd and (Frac(V) = 0) then V := V + 1 - 1/(24*3600); 
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
//        Result := ' BETWEEN ' + CaseToStr(Par1) + ' AND ' + CaseToStr(Par2, true);
        Result := ' BETWEEN ' + CaseToStr(Par1) + ' AND ' + CaseToStr(Par2, true);
      end;
    uctNotBetween :
      begin
//        Result := ' NOT BETWEEN ' + CaseToStr(Par1) + ' AND ' + CaseToStr(Par2, true);
        Result := ' NOT BETWEEN ' + CaseToStr(Par1) + ' AND ' + CaseToStr(Par2, true);
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
        Result := ' LIKE ' + '''' + '%' + CaseToStr(Par1) + '%' + '''';
      end;
    uctNotLike :
      begin
        Result := ' NOT LIKE ' + '''' + '%' + CaseToStr(Par1) + '%' + '''';
      end;
    uctStart :
      begin
        Result := ' LIKE ' + '''' + CaseToStr(Par1) + '%' + '''';
      end;
    uctNotStart :
      begin
        Result := ' NOT LIKE ' + '''' + CaseToStr(Par1) + '%' + '''';
      end;
    uctFinish :
      begin
        Result := ' LIKE ' + '''' + '%' + CaseToStr(Par1) + '''';
      end;
    uctNotFinish :
      begin
        Result := ' NOT LIKE ' + '''' + '%' + CaseToStr(Par1) + '''';
      end;
    uctInList :
      begin
        if DType = uftStr then
          tmpS := ''''
        else
          tmpS := '';     
        S := StringReplace(Trim(Par1), '; ', ';', [rfReplaceAll, rfIgnoreCase]);
        Result := ' IN (' + tmpS + StringReplace(Trim(S), ';', tmpS + ',' + tmpS, [rfReplaceAll, rfIgnoreCase]) + tmpS + ')';
      end;
    uctNotInList :
      begin
        if DType = uftStr then
          tmpS := ''''
        else
          tmpS := '';
        Result := ' NOT IN (' + tmpS + StringReplace(Trim(Par1), '; ', tmpS + ',' + tmpS, [rfReplaceAll, rfIgnoreCase]) + tmpS + ')';
      end;
  end;
end;

function UFCondGetSQLObj_2(AFltList : TFltList) : String;
var
    AAA_CondCode: TUFCondType;
    S, S2 : String;
begin
  S := 'T' + IntToStr(AFltList.id_Rel) + '.' +  AFltList.FieldName;
  if AFltList.FieldName = '' then
    S := S + AFltList.KeyField;
  if AFltList.DType = uftNone then
  begin
    S2 := Trim(UpperCase(AFltList.FieldType));
    AFltList.DType := StrToUFType(S2);
  end;
  AAA_CondCode := TUFCondType(AFltList.CondCode);
  if (AFltList.DType = uftDate)
  and (Frac(UFStrToFloatDef(VarToStr(AFltList.Par1))) = 0)
  and (Frac(UFStrToFloatDef(VarToStr(AFltList.Par2))) = 0)
  and (AAA_CondCode in [uctEq, uctNotEq,
                        uctMax, uctMaxEq, uctMin, uctMinEq,
                        uctBetween, uctNotBetween,
                        uctInList, uctNotInList])  then
  begin
    S := 'CAST(CONVERT(VARCHAR, '+ S + ', 1) AS DATETIME)';
  end;
  if  AFltList.id_Prop = Null then
  begin
      // Это объект
    case AAA_CondCode of
      uctEq :
        begin
          Result := '=' + Trim(AFltList.Par1);
        end;
      uctNotEq :
        begin
          Result := '<>' + Trim(AFltList.Par1);
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
          Result := ' IN (' + StringReplace(Trim(AFltList.Par1), ';', ',', [rfReplaceAll, rfIgnoreCase]) + ')';
        end;
      uctNotInList :
        begin
          Result := ' NOT IN (' + StringReplace(Trim(AFltList.Par1), ';', ',', [rfReplaceAll, rfIgnoreCase]) + ')';
        end;
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

procedure UFCondTypesGetNameList(SL : TStrings; AUFType : TUFType; isDetail : boolean; isExtParam : boolean);
begin
  SL.Clear;
  case AUFType of
    uftObj :
    begin
      SL.AddObject('Равно', Pointer(uctEq));
      if not isExtParam then
      begin
        SL.AddObject('Не равно', Pointer(uctNotEq));

        SL.AddObject('Пустое', Pointer(uctEmpty));
        SL.AddObject('Не пустое', Pointer(uctNotEmpty));
      end;
      SL.AddObject('Входит в список', Pointer(uctInList));
      if not isExtParam then
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

 //     if not isDetail then
      begin
        SL.AddObject('Пустое', Pointer(uctEmpty));
        SL.AddObject('Не пустое', Pointer(uctNotEmpty));
      end;
      
      if not isDetail then
      begin
        SL.AddObject('Входит в список', Pointer(uctInList));
        SL.AddObject('Не входит в список', Pointer(uctNotInList));
      end;
      
      SL.AddObject('Содержит', Pointer(uctLike));
      SL.AddObject('Не содержит', Pointer(uctNotLike));

      if not isDetail then
      begin
        SL.AddObject('Начинается с', Pointer(uctStart));
        SL.AddObject('Не начинается с', Pointer(uctNotStart));

        SL.AddObject('Заканчивается на', Pointer(uctFinish));
        SL.AddObject('Не заканчивается на', Pointer(uctNotFinish));
      end;
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
  APropGrp : TPropGrp;
  Cnt, i, APos : integer;
  S, SGrp, SName : String;
  id_business : Variant;
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
          Un_ID_Rel := FieldByName('ID_Rel').Value;
          Un_id_RelParent := FieldByName('id_RelParent').Value;
          ObjName := FieldByName('RelName').AsString;
          Un_isDetail := FieldByName('isDetail').AsBoolean;

          Un_TableName := FieldByName('TableName').AsString;
          Un_RelField := FieldByName('RelField').AsString;
          Un_KeyField := FieldByName('KeyField').AsString;
          
          MinLen := FieldByName('MinLen').AsInteger;
          ExtID := FieldByName('ExtID').Value;   
          UN_isExtParam := WorkDS.FieldByName('isExtParam').AsBoolean;
          Un_ObjNameField := WorkDS.FieldByName('NameField').Value;
       end;
        Next;
      end;
      Close;

      ProviderName := 'dsGetUnivPropList';
      Params.Clear;
      FetchParams;
      Params.ParamByName('@id_univ').Value := ID_Univ;
   //   Params.ParamByName('@id_business').Value := Null;
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
    //        PropData.FObjData.ID_Rel := FieldByName('ID_Rel').AsInteger;
 //           PropData.FieldType := FieldByName('FieldType').AsString;
            PropData.Un_FieldName := FieldByName('FieldName').AsString;
            PropData.NeedAlias := FieldByName('NeedAlias').AsBoolean;

            S := Trim(UpperCase(FieldByName('FieldType').AsString));
            PropData.DType := StrToUFType(S);
            ObjData.FPropList.Add(PropData);
            PropData.FObjData := ObjData;

            S := FieldByName('FieldDescr').AsString;
            APos := Pos('|', S);
            if APos = 0 then
              PropData.ObjName := S
            else
            begin
              SGrp := Copy(S, 0, APos - 1);
              SName := Copy(S, APos + 1, Length(S));
              APropGrp := ObjData.PropGrpByName(SGrp);
              if APropGrp = nil then
              begin
                APropGrp := TPropGrp.Create(ObjData);
                APropGrp.ObjName := SGrp; 
              end;
              APropGrp.AddProp(PropData);
              PropData.ObjName := SName;
            end;
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
var S : String; 
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
var S : String;

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
begin
end;

function MakeWhereList(ADODataSet: TCustomADODataSet; AID: integer; AWhereList : TStrings) : boolean;
begin

end;

function MakeTableList222(AObjectList: TObjectList; ATableList : TStrings) : boolean;
var S, S_First, S_ID : String;

    SL : TStringList;
    Obj : TTableList;
    i : integer;
begin
  SL := TStringList.Create;
  try
    // Список таблиц
    for i := 0 to AObjectList.Count - 1 do
    begin
      Obj := TTableList(AObjectList[i]);
      S := Obj.TableName + ' T' + InttoStr(Obj.id_Rel) + ' (NOLOCK)';
      if (not Obj.isDetail) and (not Obj.isExtParam) then
      begin
        if VarToStr(Obj.id_RelParent) <> '' then
        begin
          S := 'LEFT JOIN ' + S + ' ON T' + VarToStr(Obj.id_RelParent) + '.' + Obj.RelField + ' = T' + IntToStr(Obj.id_Rel) + '.' + Obj.KeyField;
          SL.Add(S);
        end
        else
        begin
          S_First := S;
          S_ID := ' T' + InttoStr(Obj.id_Rel) + '.' + Obj.KeyField;
        end;
      end;
    end;
    SL.Insert(0, S_First);
    SL.Insert(0, 'SELECT ' + S_ID + ' FROM ');
    ATableList.AddStrings(SL);
    Result := true;
    // ***
  finally
    SL.Free;
  end;
end;

function MakeSQLTree(AObjectList, AAggList: TObjectList; AColList, AGrpList, ATableList, AOrderList : TStrings) : boolean;
  function Indexid_Rel(AList : TList; id_Rel : integer) : integer;
  var j : integer;
  begin
    Result := -1;
    for j := 0 to AList.Count - 1 do
    begin
      if integer(AList[j]) = id_Rel then
      begin
        Result := j;
        Break;
      end;
    end;
  end;

  procedure AddToList(AList : TStrings; S : String);
  begin
    if AList.Count > 0 then
      AList[AList.Count - 1] := AList[AList.Count - 1] + ', ';
    AList.Add(S);
  end;
var S, S_First, S_TName : String;

    TableObj : TFltList;
    AggObj : TAggList;
    i : integer;
    AIDList : TList;
begin
  AColList.Clear;
  ATableList.Clear;
  AGrpList.Clear;
  AOrderList.Clear;
  AIDList := TList.Create;

  try
    // Список таблиц
    for i := 0 to AObjectList.Count - 1 do
    begin
      TableObj := TFltList(AObjectList[i]);
      S_TName := ' T' + InttoStr(TableObj.id_Rel);

      if TableObj.id_Prop = Null then
        S := S_TName + '.' + VarToStr(TableObj.ObjNameField)
      else
        S := S_TName + '.' + TableObj.FieldName;

      if i > 0 then
      begin
        AddToList(AColList, S);
        AddToList(AGrpList, S);
        AddToList(AOrderList, IntToStr(i));
      end;

      if Indexid_Rel(AIDList, TableObj.id_Rel) = -1 then
      begin
        if VarToStr(TableObj.id_RelParent) <> '' then
        begin
          S := 'LEFT JOIN ' + TableObj.TableName + ' T' + InttoStr(TableObj.id_Rel) + ' (NOLOCK) ON T' + VarToStr(TableObj.id_RelParent) + '.' + TableObj.RelField + ' = T' + IntToStr(TableObj.id_Rel) + '.' + TableObj.KeyField;
          ATableList.Add(S);
        end
        else
        begin
          S_First := TableObj.TableName + S_TName + ' (NOLOCK)';
        end;
        AIDList.Add(Pointer(TableObj.id_Rel));
      end;
    end;
    ATableList.Insert(0, S_First);
    
    for i := 0 to AAggList.Count - 1 do
    begin
      AggObj := TAggList(AAggList[i]);
      AddToList(AColList, 'F' + IntToStr(i) + '=' + AggObj.MakeAgg);
    end;

    Result := true;
    // ***
  finally
    AIDList.Free;
  end;
end;


function MakeWhereList222(AObjectList: TObjectList; AWhereList : TStrings; FltExtPatam: TStrings) : boolean;
var S : String;
    Obj : TFltList;
    SL : TStringList;
    CondCode: TUFCondType;
    i : integer;
begin
  SL := TStringList.Create;
  try
    // Формируем строку WHERE
      for i := 0 to AObjectList.Count - 1 do
      begin
        Obj := TFltList(AObjectList[i]);
        S := Obj.MakeWhere;
        if S <> '' then
          SL.Add(S);
      end;

    if SL.Text <> '' then
    begin
      S := StringReplace(Trim(SL.Text), #13 + #10, ' AND' + #13 + #10, [rfReplaceAll, rfIgnoreCase]);
      if S <> '' then
        AWhereList.Add(S);
    end;
    if AWhereList.Count = 0 then
      AWhereList.Add('1=1');
    MakeFltExtPatam222(AObjectList, FltExtPatam); 
    Result := true;
    // ***
  finally
    SL.Free;
  end;
end;

function MakeOrderList(ADODataSet: TCustomADODataSet; AID: integer; AOrderList : TStrings) : boolean;
var S : String;

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

procedure MakeSelectFrom(ADOQuery : TADOQuery; ATableList : TStrings);
var
    Obj : TTableList;
    ObjList : TObjectList;
    ID : integer;
  function Indexid_Rel(id_Rel : integer) : integer;
  var j : integer;
  begin
    Result := -1;
    for j := 0 to ObjList.Count - 1 do
    begin
      if TTableList(ObjList[j]).id_Rel = id_Rel then
      begin
        Result := j;
        Break;
      end;
    end;
  end;
begin
  ObjList := TObjectList.Create(true);
  with ADOQuery do
  begin
    First;
    try
      while not Eof do
      begin
        if not FieldByName('isDetail').AsBoolean then
        begin
          if Indexid_Rel(FieldByName('id_Rel').AsInteger) = -1 then
          begin
            Obj := TTableList.Create;
            ObjList.Add(Obj);
            Obj.id_Rel := FieldByName('id_Rel').AsInteger;
            Obj.id_RelParent := FieldByName('id_RelParent').Value;
            Obj.TableName := FieldByName('TableName').AsString;
            Obj.RelField := FieldByName('RelField').AsString;
            Obj.KeyField := FieldByName('KeyField').AsString;
          end;
        end;
        Next;
      end;

      MakeTableList222(ObjList, ATableList);
    finally
      ObjList.Free;
    end;
  end;
end;

procedure MakeWhere(ADOQuery : TADOQuery; AWhereList : TStrings);
var
    ID, i : integer;
    Obj : TFltList;
    ObjList : TObjectList;
begin
{  ObjList := TObjectList.Create(true);
  with ADOQuery do
  begin
    First;
    try
      while not Eof do
      begin
        if not FieldByName('CondCode').IsNull then
        begin
          Obj := TFltList.Create;
          ObjList.Add(Obj);
          Obj.id_Rel := FieldByName('id_Rel').AsInteger;
          Obj.id_RelParent := FieldByName('id_RelParent').Value;
          Obj.TableName := FieldByName('TableName').AsString;
          Obj.RelField := FieldByName('RelField').AsString;
          Obj.KeyField := FieldByName('KeyField').AsString;

          Obj.id_Prop := FieldByName('id_Prop').Value;
          Obj.Par1 := FieldByName('Par1').AsString;
          Obj.Par2 := FieldByName('Par2').AsString;
          Obj.CondCode := FieldByName('CondCode').Value;
          Obj.isDetail := FieldByName('isDetail').AsBoolean;
          Obj.FieldType := FieldByName('FieldType').AsString;
          Obj.FieldName := FieldByName('FieldName').AsString;
        end;
        Next;
      end;

      MakeWhereList222(ObjList, AWhereList);
    finally
      ObjList.Free;
    end;
  end;    }
end;

function MakeSQL(ADOQuery : TADOQuery; ASQL: TStringList; AID : integer) : boolean;
var SL : TStringList;
begin
  Result := false;
  SL := TStringList.Create;
  ADOQuery.Close;
  ADOQuery.SQL.Text := 'EXEC FLT_Eng_CondStr_Ext ' + IntToStr(AID);
  ADOQuery.Open;
  try
// Создаем SLECT... FROM
    MakeSelectFrom(ADOQuery, SL);
    ASQL.AddStrings(SL);

// Создаем WHERE
    SL.Clear;
    MakeWhere(ADOQuery, SL);
    if SL.Count > 0 then
    begin
      ASQL.Add('WHERE');
      ASQL.AddStrings(SL);
    end;
  finally
    Result := true;
    ADOQuery.Close;
    SL.Free;
  end;
end;

function MakeFltExtPatam222(AObjectList: TObjectList; AFltExtPatam : TStrings) : boolean;
var i : integer;
    FilterData : TFltList;
    S : String;
    AAA_CondCode: TUFCondType;
begin
  AFltExtPatam.Clear;
  for i := 0 to AObjectList.Count - 1 do
  begin
    FilterData := TFltList(AObjectList[i]);
    if FilterData.isExtParam then
    begin
      AAA_CondCode := TUFCondType(FilterData.CondCode);
      S := FilterData.KeyField + '</>';
      if AAA_CondCode in [uctNotEq, uctEmpty, uctNotEmpty, uctNotInList] then
        S := S + '1' + '</>'
      else
        S := S + '0' + '</>';
      S := S + UFCondGetSQLObj(AAA_CondCode, FilterData.Par1) + '</>';
      AFltExtPatam.Add(S);
    end;
  end;
end;

initialization
  DateEditMask := 'dd' + DateSeparator +'mm'+ DateSeparator + 'yyyy';

end.
