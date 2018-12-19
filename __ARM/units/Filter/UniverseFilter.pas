unit UniverseFilter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, menus,
  ExtCtrls, ComCtrls, StdCtrls, RxGrids, RXCtrls, Db,
  dbclient, mconnect;

{$R UFREZ2.RES}
const
  NoParent = -2;
  
  DateMask                                   = 'dd-mm-yyyy';
  SQLDateMask                                = 'dd-mm-yyyy';
  SQLTimeMask                                = 'hh:nn:ss';

  ArrMax                                     = 13;
  CondArray:  array[0..ArrMax] of String     = ('Не пусто', 'Пусто', 'Не равно', 'Равно', 'Больше или равно', 'Меньше или равно', 'Больше', 'Меньше', 'Включает в себя', 'Находится между', 'Начинается с', 'Заканчивается', 'Входит в список', 'Не входит в список');
  SQLArray:   array[0..ArrMax] of String     = (' Is not Null ', ' Is Null ', ' <> P1 ', ' = P1 ', ' >= P1 ', ' <= P1 ', ' > P1 ', ' < P1 ', ' Like ' + #39 + '%P1%' + #39 + ' ', ' Between P1 and P2 ', ' Like ' + #39 + 'P1%' + #39 + ' ', ' Like ' + #39 + '%P1' + #39 + ' ', ' In (P1) ', ' Not In (P1) ');
  Par1Capt  : array[0..ArrMax] of String     = ('', '', 'Значение', 'Значение', 'Значение', 'Значение', 'Значение', 'Значение', 'Значение', '1-е значение', 'Значение', 'Значение', 'Значение', 'Значение');
  Par2Capt  : array[0..ArrMax] of String     = ('', '', '', '', '', '', '', '', '', '2-е значение', '', '', '', '');
  TypeArray : array[0..ArrMax, 0..2] of Byte = ((1, 1, 1), (1, 1, 1), (1, 1, 1), (1, 1, 1), (1, 0, 1), (1, 0, 1), (1, 0, 1), (1, 0, 1), (0, 1, 0), (1, 0, 1), (0, 1, 0), (0, 1, 0), (1, 1, 0), (1, 1, 0));

  CondArrayStr : array[0..ArrMax] of String     = ('указан(а)', 'не указан(а)', 'кроме: ', ': ', 'Больше или равно', 'Меньше или равно', 'Больше', 'Меньше', 'Включает в себя', 'Находится между', 'Начинается с', 'Заканчивается', ': ', 'кроме: ');
  CondArrayDate: array[0..ArrMax] of String     = ('указан(а)', 'не указан(а)', 'кроме: ', ': ', 'с(включительно)', 'до(включительно)', 'с', 'до', 'Включает в себя', 'в период', 'Начинается с', 'Заканчивается', ': ', 'кроме: ');
  CondArrayNum : array[0..ArrMax] of String     = ('указан(а)', 'не указан(а)', 'кроме: ', ': ', 'Больше или равно', 'Меньше или равно', 'Больше', 'Меньше', 'Включает в себя', 'Находится между', 'Начинается с', 'Заканчивается', ': ', 'кроме: ');

type
  TFilterData = class;
  TTaskMasterClass = class;
  TObjData = class;
  TPropData = class;
  TMainData = class;

  TSelectObjEvent = procedure (Sender: TObject;
                               var AID : integer;
                               var AName: string;
                               var DefSelector: boolean;
                               var Rez: boolean;
                               ExtID : Variant;
                               id_Bsn : Variant) of object;

  TUFType = (uftNone, uftError, uftObj, uftBit, uftStr, uftInt, uftFloat, uftDate);

  TUniverseFilterStyle = (ufsMainTree, // Показывать дерево фильтров
                          ufsObjView,  // Показывать дерево объектов
                          ufsSaveBtn,  // Доступна кнопка "Сохранить"
                          ufsFieldsList, // Показывать закладку "Поля"
                          ufsCondList,   // Показывать закладку "Условия"
                          ufsGroupList,  // Показывать закладку "Группировка"
                          ufsOrderList,  // Показывать закладку "Сортировка"
                          ufsMayChangeFields,  // Можно менять набор полей
                          ufsMayChangeCond,    // Можно менять условия
                          ufsMayChangeGroup,   // Можно менять группировку
                          ufsMayChangeOrder,   // Можно менять сортировку
                          fsMayCreateNew,      // Можно создавать новые фильтры
                          fsMayDelete);        // Можно удалять фильтры
                          

  TUFCondType = (
    uctNone,
    uctBitTrue, //  равно
    uctBitFalse,      //  не равно
    uctEq, //  равно
    uctNotEq,      //  не равно
    uctMax,  //  больше
    uctMaxEq, //  больше или равно
    uctMin, //  меньше
    uctMinEq, //  меньше или равно
    uctBetween, //  находится между
    uctNotBetween, //  не находится между
    uctEmpty, //  пустое
    uctNotEmpty, //  не пустое
    uctLike, //  содержит
    uctNotLike, //  не содержит
    uctStart, //  начинается с
    uctNotStart, //  не начинается с
    uctFinish, //  заканчивается на
    uctNotFinish, //  не заканчивается на
    uctInList, //  входит в список
    uctNotInList //  не входит в список
  );

  TUFCondTypes = set of TUFCondType;

  TUFAggs = (
    uagSum,
    uagAvg,
    uagCount,
    uagMax,
    uagMin
  );

  TUniverseFilterStyles = set of TUniverseFilterStyle;

  // *** Класс-контейнер для всех объектов, порождаемых фильтром.
  // Отслеживает их количество, позволяет отлавливать утечки памяти
  TTaskMasterClass = class
  private
    FConnection: TCustomConnection;
    FObjList: TList;
    FObjDataList: TList;
    FPropDataList: TList;

    FFilterList: TList;
    FMainDataList: TList;

    procedure CustomObjAdd(AObject: TObject; AList: TList);
    procedure CustomObjDel(AObject: TObject; AList: TList);
    function GetObject(i: Integer): TObject;
    procedure SetObject(i: Integer; const Value: TObject);
    function GetObjectsCount: Integer;
    function GetObjData(i: Integer): TObjData;
    function GetObjDataCount: Integer;
    procedure SetObjData(i: Integer; const Value: TObjData);
    function GetFilterData(i: Integer): TFilterData;
    function GetFilterDataCount: Integer;
    procedure SetFilterData(i: Integer; const Value: TFilterData);
    function GetMainData(i: Integer): TMainData;
    function GetMainDataCount: Integer;
    procedure SetMainData(i: Integer; const Value: TMainData);
    function GetPropData(i: Integer): TPropData;
    function GetPropDataCount: Integer;
    procedure SetPropData(i: Integer; const Value: TPropData);
    function GetMainObjData: TObjData;
    function GetFilterNotEnter: Integer;
    function GetPropDataByID(ID: Integer; AID_Rel : integer): TPropData;
    function GetObjDataByID(ID: Integer; AID_Rel : integer): TObjData;
  public
    constructor Create(AConnection : TCustomConnection = nil);
    destructor Destroy; override;

    procedure ObjAdd(AObject: TObject);
    procedure ObjDel(AObject: TObject);

    procedure ClearObjList;     // Удалить все объекты
    procedure ClearObjDataList;   // Удалить объекты TObjData
    procedure ClearPropDataList;   // Удалить объекты TObjData
    procedure ClearFilterList;     // Удалить объекты TFilterData
    procedure ClearMainDataList;   // Удалить объекты TMainData

    procedure ExchangeFilterList(Index1, Index2: Integer);    

    property Connection: TCustomConnection read FConnection;

    // Все объекты фильтра
    property Objects[i: Integer]: TObject read GetObject write SetObject;
    property ObjectsCount: Integer read GetObjectsCount;

    // Объекты TObjData
    property MainObjData: TObjData read GetMainObjData;
    property ObjData[i: Integer]: TObjData read GetObjData write SetObjData;
    property ObjDataCount: Integer read GetObjDataCount;
    property ObjDataByID[ID: Integer; AID_Rel : integer]: TObjData read GetObjDataByID;

    // Объекты TPropData
    property PropData[i: Integer]: TPropData read GetPropData write SetPropData;
    property PropDataCount: Integer read GetPropDataCount;
    property PropDataByID[ID: Integer; AID_Rel : integer]: TPropData read GetPropDataByID;

    // Объекты TFilterData
    property FilterData[i: Integer]: TFilterData read GetFilterData write SetFilterData;
    property FilterDataCount: Integer read GetFilterDataCount;
    property FilterNotEnter : Integer read GetFilterNotEnter;

    // Объекты TMainData
    property MainData[i: Integer]: TMainData read GetMainData write SetMainData;
    property MainDataCount: Integer read GetMainDataCount;
  end;

  // *** Предок для всех объектов, порождаемых фильтром
  // Добавляет себя при создании в нужные списки и автоматически удаляется из них при дестрое 
  TUnFltObj = class
    id_Rel : integer;
  end;

  TTableList = class(TUnFltObj)
    constructor Create;
    destructor Destroy; override;
  public
    id_RelParent : Variant;
    TableName: String;
    RelField: String;
    KeyField: String;

    isDetail : boolean;
    isExtParam : boolean;
  end;

  TFltList = class(TUnFltObj)
    constructor Create;
    destructor Destroy; override;
  public
    id_RelParent : Variant;
    TableName: String;
    RelField: String;
    KeyField: String;
    ObjNameField: Variant;

    id_Prop : Variant;
    Par1: String;
    Par2: String;
    CondCode: Variant;
    isDetail : boolean;
    FieldName: String;

    FieldType: String;
    DType : TUFType;

    isExtParam : boolean;
    function MakeWhere : String;
  end;

  TAggList = class(TUnFltObj)
  public
//    id_RelParent : Variant;
//    TableName: String;
//    RelField: String;
//    KeyField: String;

//    id_Prop : Variant;
    FieldName: String;

    AggsType : TUFAggs;
    function MakeAgg : String;
  end;

  TNamedClass = class
    ObjName: String;
    xxxLevel : integer;
  end;
  
  TUFClass = class(TNamedClass)
    FOwner: TTaskMasterClass;
    constructor Create(AOwner: TTaskMasterClass);
    destructor Destroy; override;
  end;

  TMainData = class(TUFClass)
  public
    ID            : Integer;   // Идентификатор
    Name: String;
    constructor Create(AOwner: TTaskMasterClass);
  end;

  TUFDBObj = class(TUFClass)
  private
    FID_Rel : Variant;
    FisSelect: boolean;
    
    function GetUnid_Obj: Variant;
    function GetUnid_Prop: Variant;
    function GetUnid_Rel: Variant;
    function GetFullName: String;
    function GetUnid_RelParent: Variant;
    function GetUnTableName: String;
    function GetUnKeyField: String;
    function GetUnRelField: String;
    procedure SetUnid_Rel(const Value: Variant);
    procedure SetUnid_RelParent(const Value: Variant);
    function GetisDetail: boolean;
    procedure SetisDetail(const Value: boolean);
    procedure SetTableName(const Value: String);
    procedure SetRelField(const Value: String);
    procedure SetKeyField(const Value: String);
    function GetUnFieldName: String;
    procedure SetUnFieldName(const Value: String);
    function GetUn_MinLen: integer;
    function GetisExtParam: boolean;
    procedure SetisExtParam(const Value: boolean);
    function GetisSelect: boolean;
    function GetUn_ObjNameField: Variant;
    procedure SetUn_ObjNameField(const Value: Variant);
  public
    ID_DBObj : Integer;

    DType : TUFType;
    constructor Create(AOwner: TTaskMasterClass);
    property Un_MinLen: integer read GetUn_MinLen;

    property Un_id_Obj: Variant read GetUnid_Obj;
    property Un_id_Prop: Variant read GetUnid_Prop;
    property Un_id_Rel: Variant read GetUnid_Rel write SetUnid_Rel;
    property FullName: String read GetFullName;

    property Un_id_RelParent: Variant read GetUnid_RelParent write SetUnid_RelParent;
    property Un_isDetail: boolean read GetisDetail write SetisDetail;
    property Un_isExtParam: boolean read GetisExtParam write SetisExtParam;

    property Un_TableName: String read GetUnTableName write SetTableName;
    property Un_RelField: String read GetUnRelField write SetRelField;
    property Un_KeyField: String read GetUnKeyField write SetKeyField;

    property Un_FieldName: String read GetUnFieldName write SetUnFieldName;
    property Un_ObjNameField: Variant read GetUn_ObjNameField write SetUn_ObjNameField;

    property isSelect : boolean read GetisSelect;
  end;

  TPropGrp = class(TNamedClass)
    FPropList : TList;
    FObjData : TObjData;
  public
    constructor Create(AObjData : TObjData);
    destructor Destroy; override;
    procedure AddProp(APropData : TPropData);
  end;
  
  TObjData = class(TUFDBObj)
  private
    Fid_RelParent, FRelField, FNameField : Variant;
    FisDetail : boolean;
    FTableName, FKeyField : String;
    function GetPropGrpCount: integer;
    function GetPropGrp(index: integer): TPropGrp;
    procedure SetPropGrp(index: integer; const Value: TPropGrp);
  public
    FPropList, FPropGrpList : TList;
    DetParent, ObjID : Integer;
    MinLen : Integer;
    ExtID : Variant;
    FisExtParam : boolean;
    constructor Create(AOwner: TTaskMasterClass);
    destructor Destroy; override;

    property PropGrpCount : integer read GetPropGrpCount;
    property PropGrp[index : integer] : TPropGrp read GetPropGrp write SetPropGrp;
    function PropGrpByName(AName: String): TPropGrp;

    procedure AddPropGrp(APropGrp : TPropGrp);
  end;

  TPropData = class(TUFDBObj)
  private
    FFieldName : String;
  public
    FObjData : TObjData;
    FPropGrp : TPropGrp;
//    isSelect: boolean;
    NeedAlias, ParamSeted: boolean;
    constructor Create(AOwner: TTaskMasterClass);
  end;

  TFilterData = class(TUFClass)
  private
    FObjData2: TUFDBObj;
    FPar1: String;
    function GetText: String;
    function GetCondValue: String;
    function GetObjData: TUFDBObj;
    procedure SetObjData(const Value: TUFDBObj);
    function GetPar1: String;
  public
    FText : String;
    FSL : TStringList;

    CondCode: TUFCondType;
    Par1, FPar2 : String; // Условия фильтра
    property Par2 : String read GetPar1 write FPar1; // Текст фильтра
    property Text : String read GetText; // Текст фильтра
    property CondValue : String read GetCondValue;
    property ObjData: TUFDBObj read GetObjData write SetObjData;
    constructor Create(AOwner: TTaskMasterClass); 
    destructor Destroy; override;
  end;

procedure ClearList(AList: TList);

implementation

uses
  CurrEdit, DateUtil, StrUtils, ToolEdit, ToolWin,
  UniverseFilterForm, UniverseFilterUnit2;

var   DateEditMask : String;

procedure ClearList(AList: TList);
var Obj: TObject;
begin
  while AList.Count > 0 do
  begin
    Obj := TObject(AList[AList.Count - 1]);
    AList.Delete(AList.Count - 1);
    Obj.Free;
  end;
end;

function UFFormatDateTimeEx(ADate : TDateTime) : String;
var intX : integer;
    RealX : Extended;
    S : String; 
begin
  // Преобразует дату-время в строку
  if Int(ADate) <> 0 then
    S := SQLDateMask;

  if Frac(ADate) <> 0 then
  begin
    if S = '' then
      S := SQLTimeMask     // Если это время то дату не показываем
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
  // Преобразует строку в целое число, по умолчанию возвращает ноль
  if DecimalSeparator = '.' then
    S := ','
  else
    S := '.';
  S := ReplaceStr(Str, S, DecimalSeparator);
  if trim(S) <> '' then
    Result := StrToFloat(S)
  else
    Result := 0;
end;

{ TUFClass }

constructor TUFClass.Create(AOwner: TTaskMasterClass);
begin
  inherited Create;
  FOwner := AOwner;
  if FOwner is TTaskMasterClass then
    FOwner.ObjAdd(self);
end;

destructor TUFClass.Destroy;
begin
  if FOwner is TTaskMasterClass then
    FOwner.ObjDel(self);
  inherited;        
end;

{ TMainData }

constructor TMainData.Create(AOwner: TTaskMasterClass);
begin
  inherited;
  ID := -1;
end;

{ TObjData }

constructor TObjData.Create(AOwner: TTaskMasterClass);
begin
  inherited;
  ExtID := Null;
  FisExtParam := false;
  MinLen := 0;
  FID_Rel := Null;
  Fid_RelParent := Null;

  DType := uftObj;
  FPropList := TList.Create;
  FPropGrpList := TList.Create;
  xxxLevel := 10;
end;

destructor TObjData.Destroy;
var Obj: TObject;
begin
  while FPropList.Count > 0 do
  begin
    Obj := TObject(FPropList[FPropList.Count - 1]);
    FPropList.Delete(FPropList.Count - 1);
    Obj.Free;
  end;
  FPropList.Free;

  while FPropGrpList.Count > 0 do
  begin
    Obj := TObject(FPropGrpList[FPropGrpList.Count - 1]);
    FPropGrpList.Delete(FPropGrpList.Count - 1);
    Obj.Free;
  end;
  FPropGrpList.Free;
  inherited;
end;

function TObjData.GetPropGrp(index: integer): TPropGrp;
begin
  Result := TPropGrp(FPropGrpList[index]);
end;

function TObjData.PropGrpByName(AName: String): TPropGrp;
var i : integer;
begin
  for i := 0 to FPropGrpList.Count - 1 do
  begin
    Result := TPropGrp(FPropGrpList[i]);
    if Result.ObjName = AName then
      Exit;
  end;
  Result := nil;
end;

function TObjData.GetPropGrpCount: integer;
begin
  Result := FPropGrpList.Count;
end;

procedure TObjData.SetPropGrp(index: integer; const Value: TPropGrp);
begin
  FPropGrpList[index] := Value;
end;

procedure TObjData.AddPropGrp(APropGrp: TPropGrp);
begin
  FPropGrpList.Add(APropGrp);
  APropGrp.FObjData := Self;
end;

{ TTaskMasterClass }

constructor TTaskMasterClass.Create(AConnection: TCustomConnection);
begin
  inherited Create;
  FConnection := AConnection;

  FObjList := TList.Create;
  FObjDataList := TList.Create;
  FPropDataList := TList.Create;

  FFilterList := TList.Create;
  FMainDataList := TList.Create;
end;

destructor TTaskMasterClass.Destroy;
begin
  ClearList(FObjList);
  FObjList.Free;
  ClearList(FObjDataList);
  FObjDataList.Free;
  ClearList(FPropDataList);
  FPropDataList.Free;

  ClearList(FFilterList);
  FFilterList.Free;
  ClearList(FMainDataList);
  FMainDataList.Free;
  inherited;
end;

procedure TTaskMasterClass.ObjAdd(AObject: TObject);
begin
  if AObject is TObjData then
    CustomObjAdd(AObject, FObjDataList)
  else
    if AObject is TFilterData then
      CustomObjAdd(AObject, FFilterList)
    else
      if AObject is TMainData then
        CustomObjAdd(AObject, FMainDataList)
      else
        if AObject is TPropData then
          CustomObjAdd(AObject, FPropDataList)
        else
          CustomObjAdd(AObject, FObjList);
end;

procedure TTaskMasterClass.ObjDel(AObject: TObject);
begin
  if AObject is TObjData then
    CustomObjDel(AObject, FObjDataList)
  else
    if AObject is TFilterData then
      CustomObjDel(AObject, FFilterList)
    else
      if AObject is TMainData then
        CustomObjDel(AObject, FMainDataList)
      else
        if AObject is TPropData then
          CustomObjDel(AObject, FPropDataList)
        else
          CustomObjDel(AObject, FObjList);
end;

procedure TTaskMasterClass.CustomObjAdd(AObject: TObject; AList: TList);
var N: Integer;
begin
  if Assigned(AObject) and Assigned(AList) then
  begin
    N := AList.IndexOf(AObject);
    if N = -1 then
      AList.Add(AObject);
  end;
end;

procedure TTaskMasterClass.CustomObjDel(AObject: TObject; AList: TList);
var N: Integer;
begin
  if Assigned(AObject) and Assigned(AList) then
  begin
    N := AList.IndexOf(AObject);
    if N <> -1 then
      AList.Delete(N);
  end;
end;

function TTaskMasterClass.GetObject(i: Integer): TObject;
begin
  Result := TObject(FObjList[i]);
end;

procedure TTaskMasterClass.SetObject(i: Integer; const Value: TObject);
begin
  FObjList[i] := Value;
end;

function TTaskMasterClass.GetObjectsCount: Integer;
begin
  Result := FObjList.Count;
end;

function TTaskMasterClass.GetObjData(i: Integer): TObjData;
begin
  Result := TObjData(FObjDataList[i]);
end;

function TTaskMasterClass.GetObjDataCount: Integer;
begin
  Result := FObjDataList.Count;
end;

procedure TTaskMasterClass.SetObjData(i: Integer; const Value: TObjData);
begin
  FObjDataList[i] := Value;
end;

function TTaskMasterClass.GetFilterData(i: Integer): TFilterData;
begin
  Result := TFilterData(FFilterList[i]);
end;

function TTaskMasterClass.GetFilterDataCount: Integer;
begin
  Result := FFilterList.Count;
end;

procedure TTaskMasterClass.SetFilterData(i: Integer; const Value: TFilterData);
begin
  FFilterList[i] := Value;
end;

function TTaskMasterClass.GetMainData(i: Integer): TMainData;
begin
  Result := TMainData(FMainDataList[i]);
end;

function TTaskMasterClass.GetMainDataCount: Integer;
begin
  Result := FMainDataList.Count;
end;

procedure TTaskMasterClass.SetMainData(i: Integer; const Value: TMainData);
begin
  FMainDataList[i] := Value;
end;

procedure TTaskMasterClass.ClearObjList;
begin
  ClearList(FObjList);
end;

procedure TTaskMasterClass.ClearObjDataList;
begin
  ClearList(FObjDataList);
end;

procedure TTaskMasterClass.ClearFilterList;
begin
  ClearList(FFilterList);
end;

procedure TTaskMasterClass.ClearMainDataList;
begin
  ClearList(FMainDataList);
end;

procedure TTaskMasterClass.ClearPropDataList;
begin
  ClearList(FPropDataList);
end;

function TTaskMasterClass.GetPropData(i: Integer): TPropData;
begin
  Result := TPropData(FPropDataList[i]);
end;

function TTaskMasterClass.GetPropDataCount: Integer;
begin
  Result := FPropDataList.Count;
end;

procedure TTaskMasterClass.SetPropData(i: Integer; const Value: TPropData);
begin
  FPropDataList[i] := Value;
end;

function TTaskMasterClass.GetMainObjData: TObjData;
var i : integer;
begin
  result := nil;
  for i := 0 to FObjDataList.Count - 1 do
  begin
    if TObjData(FObjDataList[i]).Un_id_RelParent = Null then
    begin
      Result := TObjData(FObjDataList[i]);
      Break;
    end;
  end;
end;

function TTaskMasterClass.GetFilterNotEnter: Integer;
var i : integer;
begin
  Result := -1;
  for i := 0 to FFilterList.Count - 1 do
  begin
    if (TFilterData(FFilterList[i]).CondCode = uctNone) or
       ((TFilterData(FFilterList[i]).CondCode in [uctEq, uctNotEq,
                                                  uctMax, uctMaxEq, uctMin, uctMinEq,
                                                  uctLike, uctNotLike, uctStart, uctNotStart,
                                                  uctFinish, uctNotFinish, uctInList, uctNotInList])
       and (TFilterData(FFilterList[i]).Par1 = '')) or
       ((TFilterData(FFilterList[i]).CondCode in [uctBetween, uctNotBetween])
       and ((TFilterData(FFilterList[i]).Par1 = '') or (TFilterData(FFilterList[i]).Par2 = ''))) then
    begin
      Result := i;
      Break;
    end;
  end;
end;

procedure TTaskMasterClass.ExchangeFilterList(Index1, Index2: Integer);
begin
  FFilterList.Exchange(Index1, Index2);
end;

function TTaskMasterClass.GetPropDataByID(ID: Integer; AID_Rel : integer): TPropData;
var i : integer;
    APropData : TPropData;
begin
  Result := nil;
  for i := 0 to PropDataCount - 1 do
  begin
    APropData := PropData[i];
    if (APropData.ID_DBObj = ID) and (APropData.Un_id_Rel = AID_Rel) then
    begin
      Result := APropData;
      Break;
    end;
  end;
end;

function TTaskMasterClass.GetObjDataByID(ID: Integer; AID_Rel : integer): TObjData;
var i : integer;
    AObjData : TObjData;
begin
  Result := nil;
  for i := 0 to ObjDataCount - 1 do
  begin
    AObjData := ObjData[i];
    if (AObjData.ID_DBObj = ID) and (AObjData.FID_Rel = AID_Rel) then
    begin
      Result := AObjData;
      Break;
    end;
  end;
end;

{ TPropData }

constructor TPropData.Create(AOwner: TTaskMasterClass);
begin
  inherited;
  FObjData := nil;
 // isSelect := false;
  NeedAlias := false;
  ParamSeted := false;
  xxxLevel := 30;
end;

{ TFilterData }

constructor TFilterData.Create(AOwner: TTaskMasterClass);
begin
  inherited;
  FSL := TStringList.Create;
end;

destructor TFilterData.Destroy;
begin
  FSL.Free;
  FObjData2.FisSelect := false;
  inherited;

end;

function TFilterData.GetCondValue: String;
begin
  if FSL.Count > 0 then
    Result := FSL[0]
  else
    Result := ''
end;

function TFilterData.GetObjData: TUFDBObj;
begin
  Result := FObjData2;
end;

function TFilterData.GetPar1: String;
begin
  if CondCode in [uctBetween, uctNotBetween] then
    Result := FPar1
  else
    Result := '';
end;

function TFilterData.GetText: String;
begin
  if (FText = '') and (FOwner <> nil) and (FOwner.FConnection <> nil) then
    FText := FilterToStringDoc(Self, FOwner.FConnection);
  Result := FText;
end;

procedure TFilterData.SetObjData(const Value: TUFDBObj);
begin
  if FObjData2 <> nil then
    FObjData2.FisSelect := false;
  FObjData2 := Value;
  if FObjData2 <> nil then
    FObjData2.FisSelect := true; 
end;

{ TUFDBObj }

constructor TUFDBObj.Create(AOwner: TTaskMasterClass);
begin
  inherited;
  DType := uftNone;
  FisSelect := false;
  FID_Rel := Null;
end;

function TUFDBObj.GetFullName: String;
begin
  if Self is TObjData then
    Result := ObjName
  else
    if Self is TPropData then
    begin
      if (TPropData(Self).FObjData <> nil) and (TPropData(Self).FObjData.Un_id_RelParent <> Null) then
      begin
        Result := TPropData(Self).FObjData.ObjName + '.';
      end;
      if TPropData(Self).FPropGrp <> nil then
        Result := Result + TPropData(Self).FPropGrp.ObjName + '/';
      Result := Result + ObjName;
    end;
end;

function TUFDBObj.GetisDetail: boolean;
begin
  if Self is TObjData then
    Result := TObjData(Self).FisDetail
  else
    if (Self is TPropData) and (TPropData(Self).FObjData <> nil) then
      Result := TPropData(Self).FObjData.FisDetail;
end;

function TUFDBObj.GetisExtParam: boolean;
begin
  if Self is TObjData then
    Result := TObjData(Self).FisExtParam
  else
    if (Self is TPropData) and (TPropData(Self).FObjData <> nil) then
      Result := TPropData(Self).FObjData.FisExtParam;
end;

function TUFDBObj.GetisSelect: boolean;
var i : integer;
begin
  Result := FisSelect;
{  if FOwner <> nil then
  begin
    if 
  end; }
end;

function TUFDBObj.GetUnFieldName: String;
begin
  if Self is TPropData then
    Result := TPropData(Self).FFieldName
  else
    Result := '';
end;

function TUFDBObj.GetUnid_Obj: Variant;
begin
  if Self is TObjData then
    Result := Self.ID_DBObj
  else
    if Self is TPropData then
      Result := TPropData(Self).FObjData.ID_DBObj;
end;

function TUFDBObj.GetUnid_Prop: Variant;
begin
  if Self is TPropData then
    Result := Self.ID_DBObj
  else
    Result := Null;
end;

function TUFDBObj.GetUnid_Rel: Variant;
begin
  if Self is TObjData then
    Result := Self.Fid_Rel
  else
    if (Self is TPropData) and (TPropData(Self).FObjData <> nil) then
      Result := TPropData(Self).FObjData.Fid_Rel
    else
      Result := Null;
end;

function TUFDBObj.GetUnid_RelParent: Variant;
begin
  if Self is TObjData then
    Result := TObjData(Self).Fid_RelParent
  else
    if (Self is TPropData) and (TPropData(Self).FObjData <> nil) then
      Result := TPropData(Self).FObjData.Fid_RelParent
    else
      Result := Null;
end;

function TUFDBObj.GetUnKeyField: String;
begin
  if Self is TObjData then
    Result := TObjData(Self).FKeyField
  else
    if (Self is TPropData) and (TPropData(Self).FObjData <> nil) then
      Result := TPropData(Self).FObjData.FKeyField
    else
      Result := '';
end;

function TUFDBObj.GetUnRelField: String;
begin
  if Self is TObjData then
    Result := TObjData(Self).FRelField
  else
    if (Self is TPropData) and (TPropData(Self).FObjData <> nil) then
      Result := TPropData(Self).FObjData.FRelField
    else
      Result := '';
end;

function TUFDBObj.GetUnTableName: String;
begin
  if Self is TObjData then
    Result := TObjData(Self).FTableName
  else
    if (Self is TPropData) and (TPropData(Self).FObjData <> nil) then
      Result := TPropData(Self).FObjData.FTableName
    else
      Result := '';
end;

function TUFDBObj.GetUn_MinLen: integer;
begin
  if Self is TObjData then
    Result := TObjData(Self).MinLen
  else
    raise Exception.Create('Неверное обращение к объекту');
end;

function TUFDBObj.GetUn_ObjNameField: Variant;
begin
  if Self is TObjData then
    Result := TObjData(Self).FNameField
  else
    Result := Null;
end;

procedure TUFDBObj.SetisDetail(const Value: boolean);
begin
  if Self is TObjData then
    TObjData(Self).FisDetail := Value
  else
    raise Exception.Create('Неверное обращение к объекту');
end;

procedure TUFDBObj.SetisExtParam(const Value: boolean);
begin
  if Self is TObjData then
    TObjData(Self).FisExtParam := Value
  else
    if (Self is TPropData) and (TPropData(Self).FObjData <> nil) then
      TPropData(Self).FObjData.FisExtParam := Value;
end;

procedure TUFDBObj.SetKeyField(const Value: String);
begin
  if Self is TObjData then
    TObjData(Self).FKeyField := Value
  else
    raise Exception.Create('Неверное обращение к объекту');
end;

procedure TUFDBObj.SetRelField(const Value: String);
begin
  if Self is TObjData then
    TObjData(Self).FRelField := Value
  else
    raise Exception.Create('Неверное обращение к объекту');
end;

procedure TUFDBObj.SetTableName(const Value: String);
begin
  if Self is TObjData then
    TObjData(Self).FTableName := Value
  else
    raise Exception.Create('Неверное обращение к объекту');
end;

procedure TUFDBObj.SetUnFieldName(const Value: String);
begin
  if Self is TPropData then
    TPropData(Self).FFieldName := Value
  else
    raise Exception.Create('Неверное обращение к объекту');
end;

procedure TUFDBObj.SetUnid_Rel(const Value: Variant);
begin
  if Self is TObjData then
    TObjData(Self).Fid_Rel := Value
  else
    raise Exception.Create('Неверное обращение к объекту');
end;

procedure TUFDBObj.SetUnid_RelParent(const Value: Variant);
begin
  if Self is TObjData then
    TObjData(Self).Fid_RelParent := Value
  else
    raise Exception.Create('Неверное обращение к объекту');
end;

procedure TUFDBObj.SetUn_ObjNameField(const Value: Variant);
begin
  if Self is TObjData then
    TObjData(Self).FNameField := Value
  else
    raise Exception.Create('Неверное обращение к объекту');
end;

{ TTableList }

constructor TTableList.Create;
begin
  inherited;
  isExtParam := false;
end;

destructor TTableList.Destroy;
begin
  inherited;

end;

{ TFltList }

constructor TFltList.Create;
begin
  inherited;
  DType := uftNone;
  isExtParam := false;
end;

destructor TFltList.Destroy;
begin
  inherited;

end;

function TFltList.MakeWhere: String;
var S, S2, Sxxx : String;
    AAA_CondCode: TUFCondType;
begin
  Result := '';
  if (CondCode <> Null) and (not isExtParam) then
  begin
    if  id_Prop = Null then
    begin
      // Это объект
      S := 'T' + IntToStr(id_RelParent) + '.' +  RelField
    end
    else
    begin
      S := 'T' + IntToStr(id_Rel) + '.' +  FieldName;
      if FieldName = '' then
        S := S + KeyField;
    end;
    if DType = uftNone then
    begin
      S2 := Trim(UpperCase(FieldType));
      DType := StrToUFType(S2);
    end;
    AAA_CondCode := TUFCondType(CondCode);
    if (DType = uftStr) and not (AAA_CondCode in [uctEmpty, uctNotEmpty]) then
    begin
      S := 'ISNULL(' + S + ',' + '''' + '''' + ')';
    end;
    if (DType = uftDate)
    and (Frac(UFStrToFloatDef(VarToStr(Par1))) = 0)
    and (Frac(UFStrToFloatDef(VarToStr(Par2))) = 0)
    and (AAA_CondCode in [uctEq, uctNotEq,
                          uctMax, uctMaxEq, uctMin, uctMinEq,
                //          uctBetween, uctNotBetween,
                          uctInList, uctNotInList])  then
    begin
      S := 'CAST(CONVERT(VARCHAR, '+ S + ', 1) AS DATETIME)';
    end;
    if  id_Prop = Null then
    begin
      // Это объект
      S := S + UFCondGetSQLObj(AAA_CondCode,  Par1);
    end
    else
    begin
      S := S + UFCondGetSQL(DType, AAA_CondCode,  Par1,  Par2);
    end;
    if  isDetail then
    begin
      if AAA_CondCode in [uctNotEq, uctNotInList, uctNotLike] then
      begin
        Sxxx := 'NOT ';
        S := StringReplace(S, 'not', '', [rfReplaceAll, rfIgnoreCase]);
        S := StringReplace(S, '<>', '=', [rfReplaceAll, rfIgnoreCase]);
      end
      else
        Sxxx := '';
      S := Sxxx + ' EXISTS(SELECT * FROM ' +  TableName + ' T' + IntToStr(id_Rel) + ' (NOLOCK)'
       + ' WHERE '
       + 'T' +   VarToStr(Id_RelParent) + '.' + RelField + ' = T' + IntToStr(id_Rel) + '.' + KeyField
       + ' AND ' + S + ')';
    end;
    Result := S;
  end;
end;

{ TAggList }

function TAggList.MakeAgg: String;
begin
  Result := 'T' + VarToStr(id_Rel) + '.' + FieldName;
  case AggsType of
    uagSum : Result := 'SUM(' + Result + ')';
    uagAvg : Result := 'AVG(' + Result + ')';
    uagCount : Result := 'COUNT(' + Result + ')';
    uagMax : Result := 'MAX(' + Result + ')';
    uagMin : Result := 'MIN(' + Result + ')';
  end;
end;

{ TPropGrp }

procedure TPropGrp.AddProp(APropData: TPropData);
begin
  FPropList.Add(APropData);
  APropData.FPropGrp := Self;
end;

constructor TPropGrp.Create(AObjData : TObjData);
begin
  inherited Create;
  FPropList := TList.Create;
  if AObjData <> nil then
    AObjData.AddPropGrp(Self);
  xxxLevel := 10;
end;

destructor TPropGrp.Destroy;
begin
  FPropList.Free;
  inherited;
end;

initialization
  DateEditMask := 'dd' + DateSeparator +'mm'+ DateSeparator + 'yyyy';

end.
