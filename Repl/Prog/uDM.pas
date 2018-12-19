unit uDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  Db, ADODB, DBClient, MConnect, SConnect, uMainForm;

type
  THackCustomADODataSet = class(TCustomADODataSet)
    property Parameters;
  end;
  
  TAB = array of byte;
  TObjType = (otNone, otAcc, otCrn, otBsn, otRepr, otMN,
              otCtgGoods,
              otGoods,
              otMeasure, otWH,
              otUserInfos,
              otDic_Func, otUSR_User, otUSR_Group, otUSR_UserToGrp, otUSR_FunrRights,
              otOper,
              otLnk,
              otWHState,
              otEDN,
              otFormalDistr,
              otFuncDistr,
              otInvForm,
              otInvLines,
              otInvTimeDict,
              otInvProject,
              otInvProjectFact,

              otOper201,

              otRRR,
              otAccGrp,
              otCAGrp,
              otCA,
              otDocAccount,
              otDocAF,
              otDocFinalAct,
              otDocInvoice,
              otDocPay_In,
              otDocWarrant,
              otDocWBill,
              otDocWHOrd);
              
  TAddFunc = function (CDS : TClientDataSet) : boolean of object;
  TSendFunc = function (CDS : TCustomADODataSet) : boolean of object;

  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    spAccCLList: TADOStoredProc;
    spTSGet: TADOStoredProc;
    spTSFix: TADOStoredProc;
    spAcc_Add: TADOStoredProc;
    cdsAccTS: TClientDataSet;
    SocketConnection1: TSocketConnection;
    cdsAccList: TClientDataSet;
    spAcc_CH: TADOStoredProc;
    spCrn_Add: TADOStoredProc;
    cdsCrnTS: TClientDataSet;
    cdsCrnList: TClientDataSet;
    spCrn_CH: TADOStoredProc;
    spBSN_Add: TADOStoredProc;
    cdsBsnTS: TClientDataSet;
    cdsBsnList: TClientDataSet;
    spBsn_CH: TADOStoredProc;
    spReprLCList: TADOStoredProc;
    spRepr_Add: TADOStoredProc;
    cdsReprTS: TClientDataSet;
    cdsReprList: TClientDataSet;
    spRepr_CH: TADOStoredProc;
    spMNLCList: TADOStoredProc;
    spMn_Add: TADOStoredProc;
    cdsMNTS: TClientDataSet;
    cdsMNList: TClientDataSet;
    spMn_CH: TADOStoredProc;
    spCtgGoodsLCList: TADOStoredProc;
    spCtgGoods_Add: TADOStoredProc;
    cdsCtgGoodsTS: TClientDataSet;
    cdsCtgGoodsList: TClientDataSet;
    spCtgGoods_CH: TADOStoredProc;
    spMSLCList: TADOStoredProc;
    spMS_Add: TADOStoredProc;
    cdsMSTS: TClientDataSet;
    cdsMSList: TClientDataSet;
    spMS_CH: TADOStoredProc;
    spWHLCList: TADOStoredProc;
    spWH_Add: TADOStoredProc;
    cdsWHTS: TClientDataSet;
    cdsWHList: TClientDataSet;
    spWh_CH: TADOStoredProc;
    spGoodsLCList: TADOStoredProc;
    spGoods_Add: TADOStoredProc;
    cdsGoodsTS: TClientDataSet;
    cdsGoodsList: TClientDataSet;
    spGoods_CH: TADOStoredProc;
    spCAWHLCList: TADOStoredProc;
    spCAWH_Add: TADOStoredProc;
    cdsCAWHTS: TClientDataSet;
    cdsCAWHList: TClientDataSet;
    spCAWH_CH: TADOStoredProc;
    spFunc_Add: TADOStoredProc;
    cdsFuncTS: TClientDataSet;
    cdsFuncList: TClientDataSet;
    spUser_Add: TADOStoredProc;
    cdsUserTS: TClientDataSet;
    cdsUserList: TClientDataSet;
    spGroup_Add: TADOStoredProc;
    cdsGroupTS: TClientDataSet;
    cdsGroupList: TClientDataSet;
    spDelFromGroup: TADOStoredProc;
    spAddToGrp: TADOStoredProc;
    cdsGetGroup: TClientDataSet;
    cdsGetRights: TClientDataSet;
    spAddRights: TADOStoredProc;
    spDelRights: TADOStoredProc;
    spOper_LCList: TADOStoredProc;
    spOperTS: TADOStoredProc;
    spLNK_Add: TADOStoredProc;
    cdsLNKTS: TClientDataSet;
    cdsLNKList: TClientDataSet;
    spOper_CH: TADOStoredProc;
    spOper_Ware: TADOStoredProc;
    spOper_Add: TADOStoredProc;
    cdsOPList: TClientDataSet;
    cdsOpTS: TClientDataSet;
    cdsWhStateTS: TClientDataSet;
    ADOStoredProc2: TADOStoredProc;
    spTSClear: TADOStoredProc;
    spUser_LCList: TADOStoredProc;
    spUser_CH: TADOStoredProc;
    spWHState_Clear: TADOStoredProc;
    cdsWHStateList_2: TClientDataSet;
    spAddWare: TADOStoredProc;
    spWHStateAdd: TADOStoredProc;
    cdsWHS2: TClientDataSet;
    cdsWHSList: TClientDataSet;
    spEDAdd: TADOStoredProc;
    cdsEDList: TClientDataSet;
    cdsEDTS: TClientDataSet;
    spOper_Wareid_LC_Oper: TIntegerField;
    spOper_WareAmountOper: TFloatField;
    spOper_WarePriceOper: TFloatField;
    spOper_Wareid_Measure_Main: TIntegerField;
    spOper_WareSummSys: TFloatField;
    spOper_Wareid_Goods_Main: TIntegerField;
    spFormalDistribAdd: TADOStoredProc;
    cdsFormalDistribList: TClientDataSet;
    cdsFormalDistribTS: TClientDataSet;
    spFuncDistribAdd: TADOStoredProc;
    cdsFuncDistribList: TClientDataSet;
    cdsFuncDistribTS: TClientDataSet;
    spINV_FormAdd: TADOStoredProc;
    cdsINV_FormList: TClientDataSet;
    cdsINV_FormTS: TClientDataSet;
    spInv_LinesAdd: TADOStoredProc;
    cdsInv_LinesList: TClientDataSet;
    cdsInv_LinesTS: TClientDataSet;
    spINV_TimeDictAdd: TADOStoredProc;
    cdsINV_TimeDictList: TClientDataSet;
    cdsINV_TimeDictTS: TClientDataSet;
    spInv_Project_CH: TADOStoredProc;
    cdsRP_Inv_GetProp: TClientDataSet;
    spINVTimeItem: TADOStoredProc;
    spINVTimeItemid_TimeItem: TAutoIncField;
    spINVTimeItemid_TimeDict: TIntegerField;
    spINVTimeItemid_Project: TIntegerField;
    spINVTimeItemVal: TDateTimeField;
    spINVTimeItemTimePrice: TFloatField;
    spINVTimeItemValPlan: TDateTimeField;
    spINVTimeItemTimePricePlan: TFloatField;
    spINVTimeItemID_Main: TIntegerField;
    spINVTimeItemLastUpdated: TBytesField;
    spINVTimeItemid_TimeDict_Main: TIntegerField;
    spInvWare: TADOStoredProc;
    spInvWareid_Inv_Ware: TAutoIncField;
    spInvWareid_Project: TIntegerField;
    spInvWareid_Goods: TIntegerField;
    spInvWareid_Measure: TIntegerField;
    spInvWareid_Manufact: TIntegerField;
    spInvWareAmountPlan: TFloatField;
    spInvWarePricePlan: TFloatField;
    spInvWareAmount: TFloatField;
    spInvWareSumm: TFloatField;
    spInvWareID_Main: TIntegerField;
    spInvWareLastUpdated: TBytesField;
    spInvWareid_Goods_Main: TIntegerField;
    spInvWareid_Measure_Main: TIntegerField;
    spInvWareid_Manufact_Main: TIntegerField;
    spInv_LCList: TADOStoredProc;
    spInvTICH: TADOStoredProc;
    spInvWareCH: TADOStoredProc;
    cdsInvTimeList: TClientDataSet;
    cdsInvTimeListid_TimeItem: TAutoIncField;
    cdsInvTimeListVal: TDateTimeField;
    cdsInvTimeListValPlan: TDateTimeField;
    cdsInvWareList: TClientDataSet;
    cdsInvWareListid_Inv_Ware: TAutoIncField;
    cdsInvWareListAmountPlan: TFloatField;
    cdsInvWareListPricePlan: TFloatField;
    cdsInvWareListAmount: TFloatField;
    cdsInvWareListSumm: TFloatField;
    cdsInvProject: TClientDataSet;
    spUP_TimeItem: TADOStoredProc;
    spUP_Ware: TADOStoredProc;
    cdsInvProjectGetTS: TClientDataSet;
    cdsInvProjectGetTSLastUpdated: TBytesField;
    spAddOper201: TADOStoredProc;
    cdsOper201List: TClientDataSet;
    cdsOper201TS: TClientDataSet;
    cds201Ware: TClientDataSet;
    spAddOper201Ware: TADOStoredProc;
    spSendFact: TADOStoredProc;
    ADOStoredProc1: TADOStoredProc;
    spInv_FactList: TADOStoredProc;
    cdsInvProjectid_Project: TAutoIncField;
    cdsInvProjectLastUpdated: TBytesField;
    spGetID_Main: TADOQuery;
    spGetID_Mainid_Main: TIntegerField;
    qDelWare: TADOQuery;
    IntegerField1: TIntegerField;
    qDelOper: TADOQuery;
    IntegerField2: TIntegerField;
    spAccGrpAdd: TADOStoredProc;
    cdsAccGrpTS: TClientDataSet;
    cdsAccGrpList: TClientDataSet;
    spCAGrpAdd: TADOStoredProc;
    cdsCAGroupTS: TClientDataSet;
    cdsCAGroupGetList: TClientDataSet;
    spCAAdd: TADOStoredProc;
    cdsCATS: TClientDataSet;
    cdsCAList: TClientDataSet;
    spCALCList: TADOStoredProc;
    spCA_CH: TADOStoredProc;
    cdsRRRList: TClientDataSet;
    spRRRAdd: TADOStoredProc;
    cdsRRRTS: TClientDataSet;
    cdsDocTS: TClientDataSet;
    cdsDocCH: TClientDataSet;
    cdsDocList: TClientDataSet;
    qDoc: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
//    id_RepJrnOper : integer;

    function GetTS(ObjName: String): TAB;
    function SetTS(ObjName: String; V: TAB): boolean;

    function GetUpdatesDataSet(var CDS : TClientDataSet;
                               ATaskName : String;
                               AObjType : TObjType;
                               LastUpdated1, LastUpdated2 : TAB) : boolean;
    function GetLCDataSet(var CDS : TCustomADODataSet;
                               ATaskName : String;
                               AObjType : TObjType;
                               LastUpdated1, LastUpdated2 : TAB;
                               ID_Main : Variant) : boolean;


    function GetServerTS(AObjType : TObjType) : TAB;
    function SelectUpdatesDataSet(AObjType : TObjType) : TClientDataSet;
    function SelectLCDataSet(AObjType : TObjType) : TCustomADODataSet;
    
    function GetParentID_Main(AObjType : TObjType; AID : integer) : Variant;

    function AddAcc(CDS : TClientDataSet) : boolean;
    function SendAcc(CDS : TCustomADODataSet) : boolean;

    function AddCrn(CDS : TClientDataSet) : boolean;

    function AddBsn(CDS : TClientDataSet) : boolean;

    function AddRepr(CDS : TClientDataSet) : boolean;
    function SendRepr(CDS : TCustomADODataSet) : boolean;

    function AddMN(CDS : TClientDataSet) : boolean;
    function SendMN(CDS : TCustomADODataSet) : boolean;

    function AddMeasure(CDS : TClientDataSet) : boolean;
    function SendMeasure(CDS : TCustomADODataSet) : boolean;

    function AddWH(CDS : TClientDataSet) : boolean;
    function SendWH(CDS : TCustomADODataSet) : boolean;

    function AddCtgGoods(CDS : TClientDataSet) : boolean;
    function SendCtgGoods(CDS : TCustomADODataSet) : boolean;

    function AddGoods(CDS : TClientDataSet) : boolean;
    function SendGoods(CDS : TCustomADODataSet) : boolean;

    function AddFunc(CDS : TClientDataSet) : boolean;

    function UpdateOper(CDS : TClientDataSet) : boolean;     
    function SendOper2(CDS : TCustomADODataSet) : boolean;

    function UpdateWHState(CDS : TClientDataSet) : boolean;

    function AddLnk(CDS : TClientDataSet) : boolean;
    procedure DoRepObj(ATaskName : String; AObjType : TObjType; AAddFunc : TAddFunc; ASendFunc : TSendFunc; ASaveCDS : boolean = false);

    function AddUser(CDS: TClientDataSet): boolean;
    function SendUser(CDS : TCustomADODataSet) : boolean;

    function AddGroup(CDS: TClientDataSet): boolean;

    function AddEDName(CDS: TClientDataSet): boolean;

    function UpdateInv_Project(CDS: TClientDataSet): boolean;
    function SendInv(CDS : TCustomADODataSet) : boolean;

    function UpdateDoc_UN(CDS: TClientDataSet): boolean;

    function AddOper201(CDS: TClientDataSet): boolean;

    procedure GetLastUpdateds(var LU1, LU2: TAB);
    procedure ClearArray(var A: TAB);
    function LC_RepJrnOperAdd: integer;
    procedure LC_RepJrnOperDetailAdd(id_RepJrnOper, id_LC_Oper: integer);
    procedure ShowText(AMessage: String);
    procedure AddToLog(LogType: TLogType; S: String);
    function AddFormalDistr(CDS: TClientDataSet): boolean;
    function AddFuncDistr(CDS: TClientDataSet): boolean;
    function AddInvForm(CDS: TClientDataSet): boolean;
    function AddInvLines(CDS: TClientDataSet): boolean;
    function AddInvTimeDict(CDS: TClientDataSet): boolean;
    procedure DoLog(S: String);
    function SendInvFact(CDS: TCustomADODataSet): boolean;

    function AddRRR(CDS: TClientDataSet): boolean;
    function AddAccGrp(CDS: TClientDataSet): boolean;
    function AddCAGrp(CDS: TClientDataSet): boolean;
    function AddCA(CDS: TClientDataSet): boolean;
    function SendCA(CDS: TCustomADODataSet): boolean;
  public
    MFHandle : HWnd;
    FID_Rep : integer;
    procedure DoRepEDName(ATaskName: String);
    procedure DoRepFormalDistr(ATaskName: String);
    procedure DoRepFuncDistr(ATaskName: String);

    function ClearTS(AObjType: TObjType): boolean;
    procedure DoClear(DelPeriod : integer);

    procedure DoRepOper201(ATaskName: String);

    procedure DoRepLnk(ATaskName: String);

    procedure DoRepCrn(ATaskName: String);
    procedure DoRepBsn(ATaskName: String);
    procedure DoRepAcc(ATaskName : String; ASaveCDS : boolean = false);
    procedure DoRepRepr(ATaskName: String; ASaveCDS : boolean = false);

    procedure DoRepMN(ATaskName: String; ASaveCDS : boolean = false);

    procedure DoRepCtgGoods(ATaskName: String; ASaveCDS : boolean = false);

    procedure DoRepGoods(ATaskName: String; ASaveCDS : boolean = false);

    procedure DoRepMeasure(ATaskName: String);
    procedure DoRepWH(ATaskName: String; ASaveCDS : boolean = false);

    procedure DoRepUserInfos(ATaskName: String);

    procedure DoRepOper(ATaskName: String; ASaveCDS : boolean = false);

    procedure DoRepInv(ATaskName: String; ASaveCDS: boolean = false);
    procedure DoRepInvFact(ATaskName: String; ASaveCDS: boolean = false);

    procedure DoRepWHState(ATaskName: String);

    procedure DoRepInvForm(ATaskName: String);
    procedure DoRepInvLines(ATaskName: String);
    procedure DoRepTimeDict(ATaskName: String);

    procedure DoRepAccGrp(ATaskName: String);
    procedure DoRepCAGrp(ATaskName: String);
    procedure DoRepCA(ATaskName: String);
    procedure DoRepRRR(ATaskName: String);

    procedure DoRepDocs(AObjType: TObjType; ATaskName: String; TKey : String; AHasCh : boolean);
  end;

var
  DataModule1: TDataModule1;

procedure AddToLog_un(const AHandle : HWnd; LogType: TLogType; S: String);
procedure DoLog_un(const AHandle : HWnd; S: String);
procedure ShowText_un(const AHandle : HWnd; AMessage : String);


implementation

uses uEventLogger;

{$R *.DFM}

procedure DoLog_un(const AHandle : HWnd; S: String);
begin
  try
    SendMessage(AHandle, WM_DoLog, Integer(PChar(S)), 3);
  except
  end;
end;

procedure AddToLog_un(const AHandle : HWnd; LogType: TLogType; S: String);
begin
  try
    SendMessage(AHandle, WM_AddToLog, Integer(PChar(S)), ORD(LogType));
  except
  end;
end;

procedure ShowText_un(const AHandle : HWnd; AMessage : String);
begin
  try
    SendMessage(AHandle, WM_ShowText, Integer(PChar(AMessage)), 0);
  except
  end;
end;

{ TDataModule1 }

function CastTimeStampToInt64(V : TAB) : Variant;
var i, Koef, m, N : integer;
begin
  Result := 0;
  Koef := 1;
  m := High(V);
  N := Low(V);
  for i := m downto N do
  begin
    Result := Result + V[i] * Koef;
    Koef := Koef * 256;
  end;
  if Result = 0 then
    Result := Null;
end;

function TimeStampisEQ(V, V2 : TAB) : boolean;
var i, m, m2, N, N2 : integer;
begin
  Result := false;

  m := High(V);
  N := Low(V);
  m2:= High(V2);
  N2 := Low(V2);

  if (m = m2) and (m > 0) then
  begin
    for i := m downto N do
    begin
      if V[i] <> V2[i] then
        Exit; 
    end;
    Result := true;
  end;
end;

function TDataModule1.GetTS(ObjName : String) : TAB;
begin
  with spTSGet do
  begin
    Close;
    try
      Parameters.ParamByName('@TName').Value := ObjName;

      Open;
      if not IsEmpty then
        Result := FieldByName('TS').Value;
    finally
      Close;
    end;
  end;
end;

function TDataModule1.SetTS(ObjName : String; V : TAB) : boolean;
begin
  Result := false;
  with spTSFix do
  begin
    Close;
    Parameters.ParamByName('@TName').Value := ObjName;
    Parameters.ParamByName('@TS').Value := V;
    
    ExecProc;
    Result := true;
    Close;  
  end;
end;

procedure TDataModule1.ClearArray(var A: TAB);
var
  I: Integer;
begin
  for I := 0 to High(A) do
    A[I] := 0;
end;

procedure TDataModule1.GetLastUpdateds(var LU1, LU2 : TAB);
begin
  with spTSGet do
  begin
    Close;
    try
      Parameters.ParamByName('@TName').Value := IntToStr(integer(otOper));

      Open;
      if not IsEmpty then
        LU1 := FieldByName('TS').Value
      else
        ClearArray(LU1);
    finally
      Close;
    end;
  end;

  with spOperTS do
  begin
    Close;
    Open;
    try
      if not FieldByName('LastUpdated').IsNull then
        LU2 := FieldByName('LastUpdated').Value
      else
        ClearArray(LU2);
    finally
      Close;
    end;
  end;
end;

procedure TDataModule1.DoRepObj(ATaskName: String;
  AObjType: TObjType; AAddFunc : TAddFunc; ASendFunc : TSendFunc; ASaveCDS : boolean);
var LU1, LU2 : TAB;
    LastUpdated1, LastUpdated2, V : TAB;
    b, UpdateTS : boolean;
    CDS : TClientDataSet;
    LCds : TCustomADODataSet;
begin
try
  UpdateTS := false;
  ShowText(ATaskName + ' операция начата');
  b := false;
  AddToLog(ltNone, ATaskName + ' - операция начата');
  try
//*** Передаем в центральную базу
    if Assigned(ASendFunc) then
    begin
      ClearArray(LU1);
      ClearArray(LU2);

    //  if AObjType = otOper then
    //    GetLastUpdateds(LU1, LU2);
      if GetLCDataSet(LCds, ATaskName, AObjType, LU1, LU2, Null) then
      begin
        if ASaveCDS then
        begin

        end
        else
        begin
          with LCds do
          begin
            First;
            while not Eof do
            begin
              try
                ASendFunc(LCds);
              except
                on E : Exception do
                  AddToLog(ltError, ATaskName + ' - ASendFunc - ' + E.Message);
              end;

              ShowText(ATaskName + ' передано ' + FormatFloat('0', RecNo/RecordCount * 100) + '%');
              Next;
            end;
            if RecordCount > 0 then
              AddToLog(ltNone, 'передано записей ' + FormatFloat('0', RecordCount))
            else
              AddToLog(ltOk, ATaskName + ' - передача данных завершена');
            LCds.Close;
          end;
        end;
      end;
    end;
// ***********************************************

//*** Качаем апдейты
    if Assigned(AAddFunc) and not ASaveCDS then
    begin
      if (AObjType = otWHState) then    // Состояние склада качается целиком
      begin
        ClearArray(LastUpdated1);
        ClearArray(LastUpdated2);
      end
      else
      begin
        LastUpdated1 := GetTS(IntToStr(ORD(AObjType)));  // Последний обновленный
        AddToLog(ltNone, ATaskName + ' - запрос времени обновления');
        LastUpdated2 := GetServerTS(AObjType);
        AddToLog(ltOk, ATaskName + ' - ответ получен');
      end;
      AddToLog(ltNone, ATaskName + ' - Отправлен запрос на получение данных...');
      if GetUpdatesDataSet(CDS, ATaskName, AObjType, LastUpdated1, LastUpdated2) then
      begin
        AddToLog(ltOK, ATaskName + ' - Получен ответ');
        with CDS do
        begin
          AddToLog(ltNone, ATaskName + ' - Обновление данных начато');
          First;  // Качаем данные с сервака
          while not Eof do
          begin
            UpdateTS := true;
         //*** сохраняем запись
            try
              if AAddFunc(CDS) then
              begin
                V := CDS.FieldByName('LastUpdated').Value;
              end
              else
              begin
                LastUpdated2 := V;
                b := true;
                Break;
              end;
            except
              on E : Exception do
                AddToLog(ltError, ATaskName + ' - AAddFunc - ' + E.Message);
            end;

            ShowText(ATaskName + ' обновлено записей ' + FormatFloat('0', CDS.RecNo/CDS.RecordCount * 100) + '%');
            Next;
          end;
          if CDS.RecordCount > 0 then
            AddToLog(ltNone, ATaskName + ' - обновлено записей ' + FormatFloat('0', RecordCount));

          CDS.Close;
        end;
      end
      else
        AddToLog(ltNone, ATaskName + ' - Нет ответа');
      ShowText('');
    end;
    if (AObjType = otWHState) or (AObjType = otOper) then
    begin                                      
      UpdateTS := true;
      V := LastUpdated2;
    end;
    if UpdateTS then
      SetTS(IntToStr(ORD(AObjType)), V);
  finally
    ShowText('');
    if b then
      AddToLog(ltError, ATaskName + ' - Ошибка')
    else
      AddToLog(ltOK, ATaskName + ' - обновление завершено');
  end;
except
                on E : Exception do
                  AddToLog(ltError, ATaskName + ' - ' + E.Message);
end;
end;

function TDataModule1.GetServerTS(AObjType : TObjType) : TAB;
var CDS : TClientDataSet;
begin
  case AObjType of
    otAcc : CDS := cdsAccTS;
    otCrn : CDS := cdsCrnTS;
    otBsn : CDS := cdsBsnTS;
    otRepr : CDS := cdsReprTS;
    otMN : CDS := cdsMNTS;
    otCtgGoods : CDS := cdsCtgGoodsTS;

    otGoods : CDS := cdsGoodsTS;

    otDic_Func : CDS := cdsFuncTS;
    otUSR_User : CDS := cdsUserTS;
    otUSR_Group : CDS := cdsGroupTS;

    otMeasure : CDS := cdsMSTS;
    otWH : CDS := cdsWHTS;

    otLnk : CDS := cdsLNKTS;
    otOper : CDS := cdsOpTS;
    otWHState : CDS := cdsWhStateTS;
    otEDN : CDS := cdsEDTS;

    otFormalDistr : CDS := cdsFormalDistribTS;
    otFuncDistr : CDS := cdsFuncDistribTS;

    otInvForm : CDS := cdsINV_FormTS;
    otInvLines : CDS := cdsInv_LinesTS;
    otInvTimeDict : CDS := cdsINV_TimeDictTS;
    otInvProject, otInvProjectFact : CDS := cdsInvProjectGetTS;

    otOper201 : CDS := cdsOper201TS;

    otRRR : CDS := cdsRRRTS;
    otAccGrp : CDS := cdsAccGrpTS;
    otCAGrp : CDS := cdsCAGroupTS;
    otCA : CDS := cdsCATS;
    otDocAccount,
              otDocAF,
              otDocFinalAct,
              otDocInvoice,
              otDocPay_In,
              otDocWarrant,
              otDocWBill,
              otDocWHOrd : CDS := cdsDocTS;
  else
    CDS := nil;
  end;
  if CDS <> nil then
  begin
    with CDS do
    begin
      Close;
      Open;
      if not FieldByName('LastUpdated').IsNull then
        Result := FieldByName('LastUpdated').Value;
      Close;
    end;
  end;
end;

function TDataModule1.SelectLCDataSet(
  AObjType: TObjType): TCustomADODataSet;
begin
  case AObjType of
    otAcc : Result := spAccCLList;
    otRepr : Result := spReprLCList;
    otMN : Result := spMNLCList;

    otCtgGoods  : Result := spCtgGoodsLCList;

    otGoods  : Result := spGoodsLCList;

    otMeasure  : Result := spMSLCList;
    otWH  : Result := spWHLCList;

    otOper  : Result := spOper_LCList;

    otUSR_User  : Result := spUser_LCList;
    otInvProject  : Result := spInv_LCList;
    otInvProjectFact  : Result := spInv_FactList;
    otCA : Result := spCALCList;

  else
    Result := nil;
  end;
end;

function TDataModule1.SelectUpdatesDataSet(
  AObjType: TObjType): TClientDataSet;
begin
  case AObjType of
    otAcc : Result := cdsAccList;
    otCrn : Result := cdsCrnList;
    otBsn : Result := cdsBsnList;
    otRepr  : Result := cdsReprList;
    otMN  : Result := cdsMNList;
    otCtgGoods  : Result := cdsCtgGoodsList;

    otGoods  : Result := cdsGoodsList;

    otDic_Func  : Result := cdsFuncList;
    otUSR_User  : Result := cdsUserList;
    otUSR_Group  : Result := cdsGroupList;

    otMeasure  : Result := cdsMSList;
    otWH  : Result := cdsWHList;
    otLnk  : Result := cdsLnkList;

    otOper  : Result := cdsOpList;
    otWHState  : Result := cdsWHStateList_2;
    otEDN  : Result := cdsEDList;

    otFormalDistr  : Result := cdsFormalDistribList;
    otFuncDistr  : Result := cdsFuncDistribList;

    otInvForm  : Result := cdsINV_FormList;
    otInvLines  : Result := cdsInv_LinesList;
    otInvTimeDict  : Result := cdsINV_TimeDictList;

    otInvProject  : Result := cdsInvProject;

    otOper201 : Result := cdsOper201List;

    otRRR : Result := cdsRRRList;
    otAccGrp : Result := cdsAccGrpList;
    otCAGrp : Result := cdsCAGroupGetList;
    otCA : Result := cdsCAList;

    otDocAccount,
              otDocAF,
              otDocFinalAct,
              otDocInvoice,
              otDocPay_In,
              otDocWarrant,
              otDocWBill,
              otDocWHOrd : Result := cdsDocList;
  else
    Result := nil;
  end;
end;

function TDataModule1.GetUpdatesDataSet(var CDS : TClientDataSet;
                                        ATaskName : String;
                                        AObjType: TObjType;
                                        LastUpdated1, LastUpdated2: TAB): boolean;
begin
  Result := false;
  CDS := SelectUpdatesDataSet(AObjType);
  try
    if CDS <> nil then
    begin
      with CDS do
      begin
        if TimeStampisEQ(LastUpdated1, LastUpdated2) then
        begin
          AddToLog(ltOK, ATaskName + ' - Нет новых данных');
          Exit;
        end;

        Close;

        Params.ParamByName('@LastUpdated1').Value := CastTimeStampToInt64(LastUpdated1);
        Params.ParamByName('@LastUpdated2').Value := CastTimeStampToInt64(LastUpdated2);
        Params.ParamByName('@ID_Rep').Value := FID_Rep;
        Open;
        Result := true;
      end;
    end;
  except
     Result := false;
  end;
end;

function TDataModule1.AddAcc(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spAcc_Add do
  begin
    Close;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@id_Business_Main').Value := CDS.FieldByName('id_Business').Value;
    Parameters.ParamByName('@Disabled').Value := CDS.FieldByName('Disabled').Value;
    Parameters.ParamByName('@ID_Main').Value := CDS.FieldByName('ID_Acc').Value;
    Parameters.ParamByName('@id_Acc_Group_Main').Value := CDS.FieldByName('id_Acc_Group').Value;

    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

function TDataModule1.SendAcc(CDS: TCustomADODataSet): boolean;
var R : integer;
begin
  Result := false;
  R := SocketConnection1.AppServer.RP_Acc_Add(CDS.FieldByName('Name').AsString,
                                              CDS.FieldByName('id_Business_Main').AsInteger);
  if R <> -1 then
  begin
    with spAcc_CH do
    begin
      Parameters.ParamByName('@id_Acc').Value := CDS.FieldByName('id_Acc').AsInteger;
      Parameters.ParamByName('@id_Main').Value := R;
      ExecProc;
    end;
    Result := true;
  end;
end;

function TDataModule1.GetLCDataSet(var CDS: TCustomADODataSet; ATaskName: String;
  AObjType: TObjType; LastUpdated1, LastUpdated2: TAB;
  ID_Main: Variant): boolean;
begin
  Result := false;
  CDS := SelectLCDataSet(AObjType);
  if CDS <> nil then
  begin
    if not TimeStampisEQ(LastUpdated1, LastUpdated2) then
    begin
      with THackCustomADODataSet(CDS) do
      begin                                                
        Close;                                          // CastTimeStampToInt64(LastUpdated2);
     //   Parameters.ParamByName('@LastUpdated1').Value := LastUpdated1;  // Читаем все новый для передачи в центр
     //   Parameters.ParamByName('@LastUpdated2').Value := LastUpdated2;
        Parameters.ParamByName('@LastUpdated1').Value := CastTimeStampToInt64(LastUpdated1);
        Parameters.ParamByName('@LastUpdated2').Value := CastTimeStampToInt64(LastUpdated2);
        Parameters.ParamByName('@ID_Main').Value := ID_Main;
        Open;
        Result := true;
      end;
    end;
  end;
end;

procedure TDataModule1.DoRepAcc(ATaskName: String; ASaveCDS : boolean);
begin
  DoRepObj(ATaskName, otAcc, AddAcc, SendAcc, ASaveCDS);
end;

procedure TDataModule1.DoRepCrn(ATaskName: String);
begin
  DoRepObj(ATaskName, otCrn, AddCrn, nil);
end;


function TDataModule1.AddCrn(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spCrn_Add do
  begin
    Close;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@ShortName').Value := CDS.FieldByName('ShortName').Value;
    Parameters.ParamByName('@ISOCode').Value := CDS.FieldByName('ISOCode').Value;
    Parameters.ParamByName('@NumberCode').Value := CDS.FieldByName('NumberCode').Value;
    Parameters.ParamByName('@FastAccess').Value := CDS.FieldByName('FastAccess').Value;
    Parameters.ParamByName('@Value').Value := CDS.FieldByName('Value').Value;
    Parameters.ParamByName('@Rate').Value := CDS.FieldByName('Rate').Value;
    Parameters.ParamByName('@AvForPay').Value := CDS.FieldByName('AvForPay').Value;

    Parameters.ParamByName('@ID_Main').Value := CDS.FieldByName('Id_Currency').Value;
    Parameters.ParamByName('@id_BsnMain').Value := CDS.FieldByName('id_Bsn').Value;
    Parameters.ParamByName('@Base').Value := CDS.FieldByName('Base').Value;

    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

procedure TDataModule1.DoRepBsn(ATaskName: String);
begin
  DoRepObj(ATaskName, otBsn, AddBsn, nil);
end;

function TDataModule1.AddBsn(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spBsn_Add do
  begin
    Close;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@ShortName').Value := CDS.FieldByName('ShortName').Value;
    Parameters.ParamByName('@Id_Currency_Main').Value := CDS.FieldByName('Id_Currency').Value;
    Parameters.ParamByName('@Num').Value := CDS.FieldByName('Num').Value;
    Parameters.ParamByName('@Disabled').Value := CDS.FieldByName('Disabled').Value;

    Parameters.ParamByName('@ID_Main').Value := CDS.FieldByName('ID_Business').Value;

    Parameters.ParamByName('@Crn_Name').Value := CDS.FieldByName('Crn_Name').Value;
    Parameters.ParamByName('@Crn_ShortName').Value := CDS.FieldByName('Crn_ShortName').Value;
    Parameters.ParamByName('@Crn_ISOCode').Value := CDS.FieldByName('Crn_ISOCode').Value;
    Parameters.ParamByName('@Crn_NumberCode').Value := CDS.FieldByName('Crn_NumberCode').Value;
    Parameters.ParamByName('@Crn_FastAccess').Value := CDS.FieldByName('Crn_FastAccess').Value;
    Parameters.ParamByName('@Crn_Value').Value := CDS.FieldByName('Crn_Value').Value;
    Parameters.ParamByName('@Crn_Rate').Value := CDS.FieldByName('Crn_Rate').Value;
    Parameters.ParamByName('@Crn_AvForPay').Value := CDS.FieldByName('Crn_AvForPay').Value;
    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

procedure TDataModule1.DoRepRepr(ATaskName: String; ASaveCDS : boolean);
begin
  DoRepObj(ATaskName, otRepr, AddRepr, SendRepr, ASaveCDS);
end;

function TDataModule1.AddRepr(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spRepr_Add do
  begin
    Close;
    Parameters.ParamByName('@isJur').Value := CDS.FieldByName('isJur').Value;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@FirstName').Value := CDS.FieldByName('FirstName').Value;
    Parameters.ParamByName('@MiddleName').Value := CDS.FieldByName('MiddleName').Value;
    Parameters.ParamByName('@LastName').Value := CDS.FieldByName('LastName').Value;

    Parameters.ParamByName('@id_ContrAgent_Main').Value := CDS.FieldByName('id_ContrAgent').Value;
    Parameters.ParamByName('@id_Bsn_ex_Main').Value := CDS.FieldByName('ID_Business').Value;

    Parameters.ParamByName('@Addr').Value := CDS.FieldByName('Addr').Value;
    Parameters.ParamByName('@Descr').Value := CDS.FieldByName('Descr').Value;

    Parameters.ParamByName('@Id_Currency_Main').Value := Null;
    Parameters.ParamByName('@Disabled').Value := CDS.FieldByName('Disabled').Value;
    Parameters.ParamByName('@ID_Main').Value := CDS.FieldByName('ID_Repr').Value;

    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

function TDataModule1.SendRepr(CDS: TCustomADODataSet): boolean;
var R : integer;
    id_ContrAgent: OleVariant; isJur: WordBool; AName,
    FirstName, MiddleName, LastName, Id_Currency: OleVariant;
    Disabled: WordBool; Addr, Descr, id_Bsn_ex: OleVariant;
begin
  Result := false;
  id_ContrAgent := CDS.FieldByName('id_ContrAgent_Main').Value;
  isJur := CDS.FieldByName('isJur').AsBoolean;
  AName := CDS.FieldByName('Name').Value;
  FirstName := CDS.FieldByName('FirstName').Value;
  MiddleName := CDS.FieldByName('MiddleName').Value;
  LastName := CDS.FieldByName('LastName').Value;
  Id_Currency := CDS.FieldByName('Id_Currency_Main').Value;
  Disabled := CDS.FieldByName('Disabled').AsBoolean;
  if CDS.FieldByName('Addr').IsNull then
    Addr := Null
  else
    Addr := CDS.FieldByName('Addr').Value;
  if CDS.FieldByName('Descr').IsNull then
    Descr := Null
  else
    Descr := CDS.FieldByName('Descr').Value;

  id_Bsn_ex := CDS.FieldByName('id_Business_Main').Value;

  R := SocketConnection1.AppServer.RP_ReprAdd(id_ContrAgent, isJur, AName,
                                              FirstName, MiddleName, LastName,
                                              Id_Currency, Disabled, Addr, Descr, id_Bsn_ex);
  if R <> -1 then
  begin
    with spRepr_CH do
    begin
      Parameters.ParamByName('@id_Repr').Value := CDS.FieldByName('id_Repr').AsInteger;
      Parameters.ParamByName('@id_Main').Value := R;
      ExecProc;
    end;
    Result := true;
  end;
end;

procedure TDataModule1.DoRepMN(ATaskName: String; ASaveCDS : boolean);
begin
  DoRepObj(ATaskName, otMN, AddMN, SendMN, ASaveCDS);
end;

function TDataModule1.AddMN(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spMN_Add do
  begin
    Close;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@id_Business_Main').Value := CDS.FieldByName('id_Business').Value;
    Parameters.ParamByName('@Disabled').Value := CDS.FieldByName('Disabled').Value;
    Parameters.ParamByName('@ID_Main').Value := CDS.FieldByName('id_Manufact').Value;

    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

function TDataModule1.SendMN(CDS: TCustomADODataSet): boolean;
var R : integer;
begin
  Result := false;
  R := SocketConnection1.AppServer.RP_MN_Add(CDS.FieldByName('Name').AsString,
                                              CDS.FieldByName('id_Business_Main').AsInteger);
  if R <> -1 then
  begin
    with spMN_CH do
    begin
      Parameters.ParamByName('@id_Manufact').Value := CDS.FieldByName('id_Manufact').AsInteger;
      Parameters.ParamByName('@id_Main').Value := R;
      ExecProc;
    end;
    Result := true;
  end;
end;

procedure TDataModule1.DoRepCtgGoods(ATaskName: String; ASaveCDS : boolean);
begin
  DoRepObj(ATaskName, otCtgGoods, AddCtgGoods, SendCtgGoods, ASaveCDS);
end;

function TDataModule1.AddCtgGoods(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spCtgGoods_Add do
  begin
    Close;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@ShortName').Value := CDS.FieldByName('ShortName').Value;
//    Parameters.ParamByName('@DefPrice').Value := CDS.FieldByName('DefPrice').Value;

//   Parameters.ParamByName('@Id_Currency_Main').Value := CDS.FieldByName('Id_Currency').Value;
//    Parameters.ParamByName('@id_Measure_Main').Value := CDS.FieldByName('id_Measure').Value;
    Parameters.ParamByName('@id_BaseCtg_Goods_Main').Value := CDS.FieldByName('id_BaseCtg_Goods').Value;
    Parameters.ParamByName('@id_Business_Main').Value := CDS.FieldByName('id_Business').Value;

    Parameters.ParamByName('@Disabled').Value := CDS.FieldByName('Disabled').Value;
    Parameters.ParamByName('@ID_Main').Value := CDS.FieldByName('id_Ctg_Goods').Value;

    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

function TDataModule1.SendCtgGoods(CDS: TCustomADODataSet): boolean;
var R : integer;
    id_business: Integer;
    id_BaseCtg, AName, ShortName: OleVariant;
    Disabled: WordBool;
begin
  Result := false;
  id_business := CDS.FieldByName('id_business_Main').Value;
  id_BaseCtg := CDS.FieldByName('ParentID_Main').Value;
  AName := CDS.FieldByName('Name').Value;
  ShortName := CDS.FieldByName('ShortName').Value;
  Disabled := CDS.FieldByName('Disabled').Value;

  if id_BaseCtg = Null then
    id_BaseCtg := GetParentID_Main(otCtgGoods, CDS.FieldByName('id_Ctg_Goods').AsInteger);

  R := SocketConnection1.AppServer.Ctg_GoodsAdd(id_business, id_BaseCtg, AName, ShortName, Disabled);
  if R <> -1 then
  begin
    with spCtgGoods_CH do
    begin
      Parameters.ParamByName('@id_Ctg_Goods').Value := CDS.FieldByName('id_Ctg_Goods').AsInteger;
      Parameters.ParamByName('@id_Main').Value := R;
      ExecProc;
    end;
    Result := true;
  end;
end;


procedure TDataModule1.DoRepMeasure(ATaskName: String);
begin
  DoRepObj(ATaskName, otMeasure, AddMeasure, SendMeasure);
end;

function TDataModule1.AddMeasure(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spMS_Add do
  begin
    Close;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@ShortName').Value := CDS.FieldByName('ShortName').Value;
    Parameters.ParamByName('@id_BaseMeasure_Main').Value := CDS.FieldByName('id_BaseMeasure').Value;
    Parameters.ParamByName('@id_Business_Main').Value := CDS.FieldByName('id_Business').Value;

    Parameters.ParamByName('@Koef').Value := CDS.FieldByName('Koef').Value;
    Parameters.ParamByName('@Disabled').Value := CDS.FieldByName('Disabled').Value;
    Parameters.ParamByName('@ID_Main').Value := CDS.FieldByName('id_Measure').Value;

    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

function TDataModule1.SendMeasure(CDS: TCustomADODataSet): boolean;
var R : integer;
    AName, ShortName, id_BaseMeasure, Koef : OleVariant;
    Disabled: WordBool;
    id_Business : integer;
begin
  Result := false;
  id_BaseMeasure := CDS.FieldByName('id_BaseMeasure').Value;

  AName := CDS.FieldByName('Name').Value;
  ShortName := CDS.FieldByName('ShortName').Value;
  Koef := CDS.FieldByName('Koef').Value;
  Disabled := CDS.FieldByName('Disabled').Value;
  id_Business := CDS.FieldByName('id_Business_Main').AsInteger;

  R := SocketConnection1.AppServer.RP_MS_Add_Rep(AName, ShortName, id_BaseMeasure, Koef, Disabled, id_Business);
  if R <> -1 then
  begin
    with spMS_CH do
    begin
      Parameters.ParamByName('@id_Measure').Value := CDS.FieldByName('id_Measure').AsInteger;
      Parameters.ParamByName('@id_Main').Value := R;
      ExecProc;
    end;
    Result := true;
  end;
end;

procedure TDataModule1.DoRepWH(ATaskName: String; ASaveCDS : boolean);
begin
  DoRepObj(ATaskName, otWH, AddWH, SendWH, ASaveCDS);
end;

function TDataModule1.AddWH(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spWH_Add do
  begin
    Close;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@Addr').Value := CDS.FieldByName('Addr').Value;
    Parameters.ParamByName('@id_Business_Main').Value := CDS.FieldByName('id_Business').Value;

    Parameters.ParamByName('@Disabled').Value := CDS.FieldByName('Disabled').Value;
    Parameters.ParamByName('@ID_Main').Value := CDS.FieldByName('id_Warehouse').Value;

    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

function TDataModule1.SendWH(CDS: TCustomADODataSet): boolean;
var R : integer;
    AName, id_Bsn, Addr: OleVariant;
begin
  Result := false;

  AName := CDS.FieldByName('Name').Value;
  if CDS.FieldByName('Addr').IsNull then
    Addr := Null
  else
    Addr := CDS.FieldByName('Addr').Value;

//  Disabled := CDS.FieldByName('Disabled').Value;
  id_Bsn := CDS.FieldByName('id_Business_Main').AsInteger;

  R := SocketConnection1.AppServer.LC_WH_Add(AName, id_Bsn, Addr);
  if R <> -1 then
  begin
    with spWH_CH do
    begin
      Parameters.ParamByName('@id_Warehouse').Value := CDS.FieldByName('id_Warehouse').AsInteger;
      Parameters.ParamByName('@id_Main').Value := R;
      ExecProc;
    end;
    Result := true;
  end;
end;

function TDataModule1.GetParentID_Main(AObjType: TObjType; AID : integer): Variant;
begin
  Result := Null;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'PL_Ctg_UN_GoodsGetProp';

      Parameters.Refresh;
      Parameters.ParamByName('@ID_Ctg').Value := AID;

      Open;
      Result := FieldByName('ParentID_Main').Value;
      Close;
    except
      on E : Exception do
      begin
        Result := Null;
        Close;
      end;
    end;
  end;

end;

procedure TDataModule1.DoRepGoods(ATaskName: String; ASaveCDS : boolean);
begin
  DoRepObj(ATaskName, otGoods, AddGoods, SendGoods, ASaveCDS);
end;

function TDataModule1.AddGoods(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spGoods_Add do
  begin
    Close;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@ShortName').Value := CDS.FieldByName('ShortName').Value;
    Parameters.ParamByName('@BarCode').Value := CDS.FieldByName('BarCode').Value;

//    Parameters.ParamByName('@Price').Value := CDS.FieldByName('Price').Value;
    
    Parameters.ParamByName('@Id_Measure_Main').Value := CDS.FieldByName('Id_Measure').Value;
    Parameters.ParamByName('@id_Ctg_Goods_Main').Value := CDS.FieldByName('id_Ctg_Goods').Value;

    Parameters.ParamByName('@Disabled').Value := CDS.FieldByName('Disabled').Value;
    Parameters.ParamByName('@ID_Main').Value := CDS.FieldByName('id_Goods').Value;

    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

function TDataModule1.SendGoods(CDS: TCustomADODataSet): boolean;
var R : integer;
    id_Ctg: OleVariant; AName, ShortName, BarCode, Id_Measure: OleVariant;
    Disabled: WordBool;
begin
  Result := false;
  id_Ctg := CDS.FieldByName('id_Ctg_Main').Value;
  Id_Measure := CDS.FieldByName('id_Measure_Main').Value;

  AName := CDS.FieldByName('Name').Value;
  ShortName := CDS.FieldByName('ShortName').Value;
  BarCode := CDS.FieldByName('BarCode').Value;

  Disabled := CDS.FieldByName('Disabled').Value;

//  if id_BaseCtg = Null then id_BaseCtg := GetParentID_Main(otCtgGoods, CDS.FieldByName('id_Ctg_Goods').AsInteger);
  R := SocketConnection1.AppServer.GoodsAdd(id_Ctg, AName, ShortName, BarCode, Id_Measure, Disabled);
  if R <> -1 then
  begin
    with spGoods_CH do
    begin
      Parameters.ParamByName('@id_Goods').Value := CDS.FieldByName('id_Goods').AsInteger;
      Parameters.ParamByName('@id_Main').Value := R;
      ExecProc;
    end;
    Result := true;
  end;
end;

function TDataModule1.AddFunc(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spFunc_Add do
  begin
    Close;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@UID').Value := CDS.FieldByName('UID').Value;
    Parameters.ParamByName('@Descr').Value := CDS.FieldByName('Descr').Value;
    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

function TDataModule1.AddUser(CDS: TClientDataSet): boolean;
var ID_User : integer;
begin
  Result := false;
  with spUser_Add do
  begin
    Close;
    Parameters.ParamByName('@FirstName').Value := CDS.FieldByName('FirstName').Value;
    Parameters.ParamByName('@MiddleName').Value := CDS.FieldByName('MiddleName').Value;
    Parameters.ParamByName('@LastName').Value := CDS.FieldByName('LastName').Value;

    Parameters.ParamByName('@Login').Value := CDS.FieldByName('Login').Value;
    Parameters.ParamByName('@Password').Value := CDS.FieldByName('Password').Value;

    Parameters.ParamByName('@PspSeries').Value := CDS.FieldByName('PspSeries').Value;
    Parameters.ParamByName('@PspNumber').Value := CDS.FieldByName('PspNumber').Value;
    Parameters.ParamByName('@PspPlace').Value := CDS.FieldByName('PspPlace').Value;
    Parameters.ParamByName('@PspDate').Value := CDS.FieldByName('PspDate').Value;
    Parameters.ParamByName('@PspAddr').Value := CDS.FieldByName('PspAddr').Value;

    Parameters.ParamByName('@AddrReal').Value := CDS.FieldByName('AddrReal').Value;
    Parameters.ParamByName('@Phones').Value := CDS.FieldByName('Phones').Value;
    Parameters.ParamByName('@Emails').Value := CDS.FieldByName('Emails').Value;

    Parameters.ParamByName('@OrgPost').Value := CDS.FieldByName('OrgPost').Value;
    Parameters.ParamByName('@Disabled').Value := CDS.FieldByName('Disabled').Value;
    Parameters.ParamByName('@id_Main').Value := CDS.FieldByName('id_User').Value;
    Parameters.ParamByName('@isPPP').Value := CDS.FieldByName('isPPP').Value;

    ID_User := CDS.FieldByName('id_User').AsInteger;
    try
      ExecProc;
      Result := true;
    except
    end;
  end;
  ADOConnection1.BeginTrans;
  try
    with spDelFromGroup do
    begin
      Close;
      Parameters.ParamByName('@id_User_Main').Value := ID_User;
      ExecProc;
    end;
    with cdsGetGroup do
    begin
      Close;
      Params.ParamByName('@id_User').Value := ID_User;
      Open;
      try
        First;
        while not Eof do
        begin
          spAddToGrp.Close;
          spAddToGrp.Parameters.ParamByName('@id_User_Main').Value := ID_User;
          spAddToGrp.Parameters.ParamByName('@id_Group_Main').Value := FieldByName('id_Group').Value;
          spAddToGrp.ExecProc;

          Next;
        end;
      finally
        Close;
      end;
    end;

    ADOConnection1.CommitTrans;
  except

    ADOConnection1.RollbackTrans;
  end;
end;

function TDataModule1.AddGroup(CDS: TClientDataSet): boolean;
var ID_Group : integer;
begin
  Result := false;
  with spGroup_Add do
  begin
    Close;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@Disabled').Value := CDS.FieldByName('Disabled').Value;
    Parameters.ParamByName('@id_Main').Value := CDS.FieldByName('id_Group').Value;
    ID_Group := CDS.FieldByName('id_Group').AsInteger;
    try
      ExecProc;
      Result := true;
    except
    end;
  end;
//  ADOConnection1.BeginTrans;
  try
    with spDelRights do
    begin
      Close;
      Parameters.ParamByName('@id_Group_Main').Value := ID_Group;
      ExecProc;
    end;
    with cdsGetRights do
    begin
      Close;
      Params.ParamByName('@id_Group').Value := ID_Group;
      Open;
      try
        First;
        while not Eof do
        begin
          spAddRights.Close;
          spAddRights.Parameters.ParamByName('@id_Group_Main').Value := ID_Group;
          spAddRights.Parameters.ParamByName('@id_Business_Main').Value := cdsGetRights.FieldByName('id_Business').Value;
          spAddRights.Parameters.ParamByName('@UID').Value := cdsGetRights.FieldByName('UID').Value;
          try
            spAddRights.ExecProc;
          except

          end;
          Next;
        end;
      finally
        Close;
      end;
    end;

 //   ADOConnection1.CommitTrans;
  except

 //   ADOConnection1.RollbackTrans;
  end;
end;

procedure TDataModule1.DoRepUserInfos(ATaskName: String);
begin
  DoRepObj(ATaskName, otDic_Func, AddFunc, nil);
  DoRepObj(ATaskName, otUSR_Group, AddGroup, nil);
  DoRepObj(ATaskName, otUSR_User, AddUser, SendUser);
end;

procedure TDataModule1.DoRepOper(ATaskName: String; ASaveCDS : boolean);
begin
  try
    DoRepObj(ATaskName, otOper, UpdateOper, SendOper2, ASaveCDS);
  finally                              
//    id_RepJrnOper := -1;
  end;
end;

procedure TDataModule1.DoClear(DelPeriod: integer);
begin
  ShowText('Очистка базы начата');
  AddToLog(ltNone, 'Очистка базы начата');
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'RP_OperDel';
      Parameters.Refresh;
      Parameters.ParamByName('@DelPeriod').Value := DelPeriod;

      ExecProc;
      Close;
      AddToLog(ltOK, 'Очистка базы завершена');
      ShowText('');
    except
      on E : Exception do
      begin
        ShowText('');
        AddToLog(ltError, 'Ошибка при очистке базы');
        Close;
      end;
    end;
  end;    
end;                

function TDataModule1.LC_RepJrnOperAdd : integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'LC_RepJrnOperAdd';
      Parameters.Refresh;
      Parameters.ParamByName('@id_Repl').Value := FID_Rep;

      ExecProc;
      Close;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
      end;
    end;
  end;
end;

procedure TDataModule1.LC_RepJrnOperDetailAdd(id_RepJrnOper, id_LC_Oper : integer);
begin
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'LC_RepJrnOperDetailAdd';
      Parameters.Refresh;
      Parameters.ParamByName('@id_RepJrnOper').Value := id_RepJrnOper;
      Parameters.ParamByName('@id_LC_Oper').Value := id_LC_Oper;

      ExecProc;
      Close;
    except
      on E : Exception do
      begin
        Close;
      end;
    end;
  end;
end;

procedure TDataModule1.DoRepLnk(ATaskName: String);
begin
  DoRepObj(ATaskName, otLnk, AddLnk, nil);
end;

function TDataModule1.AddLnk(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spLnk_Add do
  begin
    Close;
    Parameters.ParamByName('@id_Acc_Old_Main').Value := CDS.FieldByName('id_Acc_Old').Value;
    Parameters.ParamByName('@id_Acc_New_Main').Value := CDS.FieldByName('id_Acc_New').Value;
    Parameters.ParamByName('@id_Warehouse_Old_Main').Value := CDS.FieldByName('id_Warehouse_Old').Value;
    Parameters.ParamByName('@id_Warehouse_New_Main').Value := CDS.FieldByName('id_Warehouse_New').Value;
    Parameters.ParamByName('@id_Manufact_Old_Main').Value := CDS.FieldByName('id_Manufact_Old').Value;
    Parameters.ParamByName('@id_Manufact_New_Main').Value := CDS.FieldByName('id_Manufact_New').Value;
    Parameters.ParamByName('@id_Repr_Old_Main').Value := CDS.FieldByName('id_Repr_Old').Value;
    Parameters.ParamByName('@id_Repr_New_Main').Value := CDS.FieldByName('id_Repr_New').Value;
    Parameters.ParamByName('@id_Goods_Old_Main').Value := CDS.FieldByName('id_Goods_Old').Value;
    Parameters.ParamByName('@id_Goods_New_Main').Value := CDS.FieldByName('id_Goods_New').Value;
    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  with ADOConnection1 do
  begin
   Connected := false;
   ADOConnection1.ConnectionString := 'Provider=SQLOLEDB.1;Password="' +
     String(xxxDBPassword) + '";User ID=' +
     String(xxxDBUserName) + ';Initial Catalog=' +
     String(xxxCatalog) + ';Data Source=' +
     String(xxxDBBaseName) +
     ';Use Procedure for Prepare=1;Auto Translate=True;Application Name=Replicator;Packet Size=4096';  
   try
     AddToLog(ltWarning, 'Установка связи с сервером');
     Connected := true;
     AddToLog(ltWarning, 'Связь установлена');
   except
     on E : Exception do
     begin
       AddToLog(ltWarning, E.Message + ' ' + ADOConnection1.ConnectionString);
       raise Exception.Create('DoLogin, ' + E.Message + ' ' + ADOConnection1.ConnectionString);
     end;
   end;
 end;

end;

function TDataModule1.UpdateOper(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spOper_Add do
  begin
    Close;
    Parameters.ParamByName('@CheckDate').Value := CDS.FieldByName('CheckDate').Value;
    Parameters.ParamByName('@ID_Main').Value := CDS.FieldByName('id_Oper').Value;

    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

procedure TDataModule1.DoRepWHState(ATaskName: String);
var id_Business, ID_Warehouse, OperVid : Variant;
    id_Oper : Integer;
begin
  try
    qDelWare.ExecSQL;
    qDelOper.ExecSQL;
  //  DoRepObj(ATaskName, otWHState, UpdateWHState, nil);
    id_Business := -1;
    ID_Warehouse := -1;
    OperVid := -1;
    id_Oper := 0;
    AddToLog(ltNone, 'Начато обновление состояния склада');
    cdsWHSList.Params.ParamByName('@ID_Rep').Value := FID_Rep;
    cdsWHSList.Open;
//    AddToLog(ltNone, 'всего складов ' + IntToStr(cdsWHSList.RecordCount));
    cdsWHSList.First;
    while not cdsWHSList.Eof do
    begin
      with cdsWHS2 do
      begin
        Close;
      //  PacketRecords := 100;
        Params.ParamByName('@LastUpdated1').Value := Null;
        Params.ParamByName('@LastUpdated2').Value := Null;
        Params.ParamByName('@ID_Rep').Value := FID_Rep;
        Params.ParamByName('@ID_Warehouse').Value := cdsWHSList.FieldByName('ID_Warehouse').Value;
        Open;
        First;
     //   AddToLog(ltNone, 'всего записей ' + IntToStr(RecordCount));
        while not Eof do
        begin
          if (id_Business <> FieldByName('id_Business').Value) or
             (ID_Warehouse <> FieldByName('ID_Warehouse').Value) or
             (OperVid <> FieldByName('OperVid').Value) then
          begin
            try
              id_Business := FieldByName('id_Business').Value;
              ID_Warehouse := FieldByName('ID_Warehouse').Value;
              OperVid := FieldByName('OperVid').Value;

              spWHStateAdd.Close;
              spWHStateAdd.Parameters.ParamByName('@id_Business_Main').Value := cdsWHS2.FieldByName('id_Business').Value;
              spWHStateAdd.Parameters.ParamByName('@ID_Warehouse_Main').Value := cdsWHS2.FieldByName('ID_Warehouse').Value;
              spWHStateAdd.Parameters.ParamByName('@OperVid').Value := cdsWHS2.FieldByName('OperVid').Value;

              spWHStateAdd.ExecProc;
              id_Oper := spWHStateAdd.Parameters.ParamValues['@RETURN_VALUE'];
              spWHStateAdd.Close;
            except
              on E : Exception do
              begin
                FEventLogger.LogMessage('Произошла ошибка ' + E.Message, EVENTLOG_ERROR_TYPE, 0, 1);
                AddToLog(ltError, 'Ошибка - ' + E.Message);
                id_Oper := -1;
                spWHStateAdd.Close;
              end;
            end;
          end;
          if id_Oper <= 0 then
          begin
            AddToLog(ltError, 'Ошибка при обновлении состояния склада');
          end
          else
          begin
            spAddWare.Parameters.ParamByName('@id_Oper').Value := id_oper;
            spAddWare.Parameters.ParamByName('@AmountOper').Value := FieldByName('TotalAmount').Value;
            spAddWare.Parameters.ParamByName('@id_Measure_Main').Value := FieldByName('id_Measure').Value;
            if ABS(FieldByName('TotalAmount').AsFloat) > 0.005 then
              spAddWare.Parameters.ParamByName('@PriceOper').Value := FieldByName('TotalSum').Value/FieldByName('TotalAmount').Value
            else
              spAddWare.Parameters.ParamByName('@PriceOper').Value := FieldByName('TotalSum').Value;
            spAddWare.Parameters.ParamByName('@id_Goods_Main').Value := cdsWHS2.FieldByName('id_Goods').Value;
            try
         //     AddToLog(ltNone, 'запускаем заливку товара');
              spAddWare.ExecProc;
              if spAddWare.Parameters.ParamValues['@RETURN_VALUE'] = 0 then
                raise Exception.Create('ошибка при заливке состояния по товару');
            except
              on E : Exception do
              begin
                FEventLogger.LogMessage('Произошла ошибка при заливке состояния по товару ' + E.Message, EVENTLOG_ERROR_TYPE, 0, 1); 
                AddToLog(ltError, 'Ошибка при заливке состояния по товару - ' + E.Message);
                spAddWare.Close;
              end;
            end;
          end;
          Next;
          ShowText(ATaskName + ' передано ' + FormatFloat('0', RecNo/RecordCount * 100) + '% для склада №' + IntToStr(cdsWHSList.RecNo) + ' из '  + IntToStr(cdsWHSList.RecordCount));
        end;
        cdsWHSList.Next;
      end;
    end;
    cdsWHSList.Close;
    cdsWHS2.Close;
  except
    on E : Exception do
    begin
      cdsWHSList.Close;
      cdsWHS2.Close;
      FEventLogger.LogMessage('Произошла ошибка ' + E.Message, EVENTLOG_ERROR_TYPE, 0, 1);
      AddToLog(ltError, 'Ошибка - ' + E.Message);
    end;
  end;
end;

function TDataModule1.UpdateWHState(CDS: TClientDataSet): boolean;
var S : String;
begin
  Result := false;

  with ADOStoredProc1 do
  begin
    try
      Close;
      S := 'RP_WHState_Add_2';    
      if ProcedureName <> S then
      begin
        ProcedureName := S;
        Parameters.Refresh;
      end;
      Parameters.ParamByName('@OperVid').Value := 101;
      Parameters.ParamByName('@id_business_Main').Value := CDS.FieldByName('id_business').Value;
      Parameters.ParamByName('@OperTypeIn').Value := CDS.FieldByName('OperTypeIn').Value;
      Parameters.ParamByName('@Id_CurrencyOper_Main').Value := CDS.FieldByName('Id_Currency').Value;
      Parameters.ParamByName('@AmountOper').Value := CDS.FieldByName('TotalAmount').Value;
      Parameters.ParamByName('@id_Measure_Main').Value := CDS.FieldByName('id_Measure').Value;
      Parameters.ParamByName('@PriceOper').Value := CDS.FieldByName('TotalSum').Value;
      Parameters.ParamByName('@Id_CurrencySys_Main').Value := Null;
      Parameters.ParamByName('@SummSys').Value := Null;
      Parameters.ParamByName('@id_Warehouse_Main').Value := CDS.FieldByName('id_Warehouse').Value;

      Parameters.ParamByName('@id_Goods_Main').Value := CDS.FieldByName('id_Goods').Value;
 
      Parameters.ParamByName('@Koeff').Value := 0;
      Parameters.ParamByName('@id_Service_Main').Value := CDS.FieldByName('id_Service').Value;


      ExecProc; 
      Result := true;//Parameters.ParamValues['@RETURN_VALUE'] > 0;
      Close;
    except
      on E : Exception do
      begin
        AddToLog(ltError, 'UpdateWHState - Ошибка ' + E.Message)
       // Close;
      end;
    end;
  end;
end;


function TDataModule1.ClearTS(AObjType: TObjType): boolean;
begin
  with spTSClear do
  begin
    Close;
    try
      Parameters.ParamByName('@TName').Value := IntToStr(ORD(AObjType));

      ExecProc;
      Result := true;
    finally
      Close;
    end;
  end;
end;

function TDataModule1.SendUser(CDS: TCustomADODataSet): boolean;
var R : integer;
    FirstName, MiddleName, LastName: String;
begin
{  Result := false;
  try
    FirstName := CDS.FieldByName('FirstName').AsString;
    MiddleName := CDS.FieldByName('MiddleName').AsString;
    LastName := CDS.FieldByName('LastName').AsString;


    R := SocketConnection1.AppServer.RP_User_New(FirstName, MiddleName, LastName);
    if R <> -1 then
    begin
      with spUser_CH do
      begin
        Parameters.ParamByName('@id_user').Value := CDS.FieldByName('id_user').AsInteger;
        Parameters.ParamByName('@id_Main').Value := R;
        ExecProc;
      end;
      Result := true;
    end;
  except

  end;   }
end;

function TDataModule1.SendOper2(CDS: TCustomADODataSet): boolean;
var R, R_W : integer;
    OperVid: Integer; DateLocal,
    id_business: OleVariant; Correct, OperTypeIn: WordBool; Id_CurrencyOper,
    PriceFinOper, Id_CurrencySys, SummSysFin, id_Acc, id_Acc_Ext,
    id_Warehouse, id_Warehouse_Ext, id_Manufact, id_Manufact_Ext, id_Repr,
    id_UserCreator: OleVariant; id_Replicator: Integer;
    id_DocType, Imp_PayBasic, AccInv_PayAssignment, Contract,
    OpComment, id_LC_Oper : OleVariant;

    LastID : integer;

    id_Goods, id_Measure: OleVariant;
    AmountOper: Double;
    PriceOper, SummSys: OleVariant;
    Koeff: Integer;
    Dig1, Dig2, Dig3, Dig4, Dig5,
    Dig6, Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, Str1,
    Str2, Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12,
    Str13, Str14, Str15, Date1, Date2, Date3, Date4, Date5, Date6, Date7,
    Date8, Date9, Date10, Date11, Date12, Date13, Date14,
    Date15,
  id_FormalDistrib, id_FuncDistrib, id_OperParent: OleVariant;
begin
  Result := false;
  LastID := -1;
  with CDS do
  begin
    id_Replicator := FID_Rep;
    id_LC_Oper := FieldByName('id_LC_Oper').AsInteger;
    if LastID <> id_LC_Oper then
    begin
      OperVid := FieldByName('OperVid').AsInteger;
      DateLocal := FieldByName('DateLocal').Value;
      id_UserCreator := FieldByName('id_UserCreator_Main').Value;

      id_business := FieldByName('id_business_Main').Value;

      Correct := FieldByName('Correct').AsBoolean;
      OperTypeIn := FieldByName('OperTypeIn').AsBoolean;

      Id_CurrencyOper := FieldByName('Id_CurrencyOper_Main').Value;


      PriceFinOper := FieldByName('PriceOper').Value;

      Id_CurrencySys := FieldByName('Id_CurrencySys_Main').Value;
      SummSysFin := FieldByName('SummSys').Value;

      id_Acc := FieldByName('id_Acc_Main').Value;
      id_Warehouse := FieldByName('id_Warehouse_Main').Value;
      id_Repr := FieldByName('id_Repr_Main').Value;
      id_Warehouse_Ext := FieldByName('id_Warehouse_Ext_Main').Value;
      id_Acc_Ext := FieldByName('id_Acc_Ext_Main').Value;
      id_Manufact := FieldByName('id_Manufact_Main').Value;
      id_Manufact_Ext := FieldByName('id_Manufact_Ext_Main').Value;

      id_DocType := FieldByName('id_DocType').Value;
      Imp_PayBasic := FieldByName('Imp_PayBasic').Value;
      AccInv_PayAssignment := FieldByName('AccInv_PayAssignment').Value;
      Contract := FieldByName('Contract').Value;
      OpComment := FieldByName('OpComment').Value;

      Koeff := FieldByName('Koeff').AsInteger;

      Dig1 := FieldByName('Dig1').Value;
      Dig2 := FieldByName('Dig2').Value;
      Dig3 := FieldByName('Dig3').Value;
      Dig4 := FieldByName('Dig4').Value;
      Dig5 := FieldByName('Dig5').Value;
      Dig6 := FieldByName('Dig6').Value;
      Dig7 := FieldByName('Dig7').Value;
      Dig8 := FieldByName('Dig8').Value;
      Dig9 := FieldByName('Dig9').Value;
      Dig10 := FieldByName('Dig10').Value;
      Dig11 := FieldByName('Dig11').Value;
      Dig12 := FieldByName('Dig12').Value;
      Dig13 := FieldByName('Dig13').Value;
      Dig14 := FieldByName('Dig14').Value;
      Dig15 := FieldByName('Dig15').Value;

      Str1 := FieldByName('Str1').Value;
      Str2 := FieldByName('Str2').Value;
      Str3 := FieldByName('Str3').Value;
      Str4 := FieldByName('Str4').Value;
      Str5 := FieldByName('Str5').Value;
      Str6 := FieldByName('Str6').Value;
      Str7 := FieldByName('Str7').Value;
      Str8 := FieldByName('Str8').Value;
      Str9 := FieldByName('Str9').Value;
      Str10 := FieldByName('Str10').Value;
      Str11 := FieldByName('Str11').Value;
      Str12 := FieldByName('Str12').Value;
      Str13 := FieldByName('Str13').Value;
      Str14 := FieldByName('Str14').Value;
      Str15 := FieldByName('Str15').Value;

      Date1 := FieldByName('Date1').Value;
      Date2 := FieldByName('Date2').Value;
      Date3 := FieldByName('Date3').Value;
      Date4 := FieldByName('Date4').Value;
      Date5 := FieldByName('Date5').Value;
      Date6 := FieldByName('Date6').Value;
      Date7 := FieldByName('Date7').Value;
      Date8 := FieldByName('Date8').Value;
      Date9 := FieldByName('Date9').Value;
      Date10 := FieldByName('Date10').Value;
      Date11 := FieldByName('Date11').Value;
      Date12 := FieldByName('Date12').Value;
      Date13 := FieldByName('Date13').Value;
      Date14 := FieldByName('Date14').Value;
      Date15 := FieldByName('Date15').Value;

      id_FormalDistrib := FieldByName('id_FormalDistrib_Main').Value;
      id_FuncDistrib := FieldByName('id_FuncDistrib_Main').Value;

      id_OperParent := Null;
      if (not FieldByName('id_LC_Oper_Ext').IsNull) then
      begin
        DoLog('Вызов spGetID_Main');
        spGetID_Main.Close;
        spGetID_Main.Parameters.ParamByName('id_LC_Oper').Value := FieldByName('id_LC_Oper_Ext').Value;
        try
          try
            spGetID_Main.Open;
            id_OperParent := spGetID_Mainid_Main.AsVariant;
          finally
            spGetID_Main.Close;
          end;
          DoLog('spGetID_Main = ' + IntToStr(id_OperParent));
        except
        end;
      end;


      LastID := id_LC_Oper;
      DoLog('Вызов RP_OperAdd_v223 ' + IntToStr(id_LC_Oper));
try
      R := SocketConnection1.AppServer.RP_OperAdd_v223(OperVid, DateLocal,
                                                     id_business, Correct, OperTypeIn, Id_CurrencyOper,
                                                     PriceFinOper, Id_CurrencySys, SummSysFin, id_Acc, id_Acc_Ext,
                                                     id_Warehouse, id_Warehouse_Ext, id_Manufact, id_Manufact_Ext, id_Repr,
                                                     id_UserCreator, id_Replicator,
                                                     id_DocType, Imp_PayBasic, AccInv_PayAssignment, Contract, OpComment,
                                                     id_LC_Oper,
                                                     Koeff,
                                                     Dig1, Dig2, Dig3, Dig4, Dig5,
                                                     Dig6, Dig7, Dig8, Dig9, Dig10,
                                                     Dig11, Dig12, Dig13, Dig14, Dig15,
                                                     Str1, Str2, Str3, Str4, Str5,
                                                     Str6, Str7, Str8, Str9, Str10,
                                                     Str11, Str12, Str13, Str14, Str15,
                                                     Date1, Date2, Date3, Date4, Date5,
                                                     Date6, Date7, Date8, Date9, Date10,
                                                     Date11, Date12, Date13, Date14, Date15,
                                                     id_FormalDistrib, id_FuncDistrib, id_OperParent);
      DoLog('КP_OperAdd_v2233333=' + Inttostr(R));
      if R <= 0 then
      begin
      DoLog('Вызов RP_OperAdd_v22 ' + IntToStr(id_LC_Oper));
        R := SocketConnection1.AppServer.RP_OperAdd_v22(OperVid, DateLocal,
                                                     id_business, Correct, OperTypeIn, Id_CurrencyOper,
                                                     PriceFinOper, Id_CurrencySys, SummSysFin, id_Acc, id_Acc_Ext,
                                                     id_Warehouse, id_Warehouse_Ext, id_Manufact, id_Manufact_Ext, id_Repr,
                                                     id_UserCreator, id_Replicator,
                                                     id_DocType, Imp_PayBasic, AccInv_PayAssignment, Contract, OpComment,
                                                     id_LC_Oper,
                                                     Koeff,
                                                     Dig1, Dig2, Dig3, Dig4, Dig5,
                                                     Dig6, Dig7, Dig8, Dig9, Dig10,
                                                     Dig11, Dig12, Dig13, Dig14, Dig15,
                                                     Str1, Str2, Str3, Str4, Str5,
                                                     Str6, Str7, Str8, Str9, Str10,
                                                     Str11, Str12, Str13, Str14, Str15,
                                                     Date1, Date2, Date3, Date4, Date5,
                                                     Date6, Date7, Date8, Date9, Date10,
                                                     Date11, Date12, Date13, Date14, Date15,
                                                     id_FormalDistrib, id_FuncDistrib);
          DoLog('КP_OperAdd_v22=' + Inttostr(R));
        end;

            except
              on E : Exception do
              begin
                DoLog('Error RP_OperWare ' + E.Message);
                raise Exception.Create(E.Message);
              end;

            end;
    end
    else
      R := id_LC_Oper;

    if R > 0 then
      with spOper_CH do
      begin
        Parameters.ParamByName('@id_LC_Oper').Value := CDS.FieldByName('id_LC_Oper').AsInteger;
        Parameters.ParamByName('@id_Main').Value := R;
        ExecProc;
      end;
          DoLog('333');

    if (OperVid in [1, 3, 201]) and (R > 0) then
    begin
          DoLog('EWare');

      with spOper_Ware do
      begin
        Parameters.ParamByName('@id_LC_Oper').Value := id_LC_Oper;
        Open;
        try
          First;
          while not Eof do
          begin
            id_Goods := FieldByName('id_Goods_Main').Value;
            id_Measure := FieldByName('id_Measure_Main').Value;
            AmountOper := FieldByName('AmountOper').Value;
            PriceOper := FieldByName('PriceOper').Value;
            SummSys := FieldByName('SummSys').Value;

            try
            //DoLog('Вызов RP_OperWare');
              R_W := SocketConnection1.AppServer.RP_OperWare(R, id_Goods, id_Measure, AmountOper, PriceOper, SummSys);
            except
              on E : Exception do
                      DoLog('Error RP_OperWare ' + E.Message);

            end;
            Next;
          end;
        finally
          Close;
        end;
      end;
    end;
  end;
  Result := R > 0;
end;

procedure TDataModule1.AddToLog(LogType: TLogType; S: String);
begin
  try
    AddToLog_un(MFHandle, LogType, S);
  except
  end;
end;

procedure TDataModule1.DoLog(S: String);
begin
  try
    DoLog_un(MFHandle, S);
  except
  end;
end;

procedure TDataModule1.ShowText(AMessage : String);
begin
  try
    ShowText_UN(MFHandle, AMessage);
  except
  end;
end;

procedure TDataModule1.DoRepOper201(ATaskName: String);
begin
  DoRepObj(ATaskName, otOper201, AddOper201, nil);
end;

procedure TDataModule1.DoRepEDName(ATaskName: String);
begin
  DoRepObj(ATaskName, otEDN, AddEDName, nil);
end;

procedure TDataModule1.DoRepFormalDistr(ATaskName: String);
begin
  DoRepObj(ATaskName, otFormalDistr, AddFormalDistr, nil);
end;

procedure TDataModule1.DoRepRRR(ATaskName: String);
begin
  DoRepObj(ATaskName, otRRR, AddRRR, nil);
end;

procedure TDataModule1.DoRepAccGrp(ATaskName: String);
begin
  DoRepObj(ATaskName, otAccGrp, AddAccGrp, nil);
end;

procedure TDataModule1.DoRepCAGrp(ATaskName: String);
begin
  DoRepObj(ATaskName, otCAGrp, AddCAGrp, nil);
end;

procedure TDataModule1.DoRepCA(ATaskName: String);
begin
  DoRepObj(ATaskName, otCA, AddCA, SendCA);
end;

procedure TDataModule1.DoRepFuncDistr(ATaskName: String);
begin
  DoRepObj(ATaskName, otFuncDistr, AddFuncDistr, nil);
end;

procedure TDataModule1.DoRepInvForm(ATaskName: String);
begin
  DoRepObj(ATaskName, otInvForm, AddInvForm, nil);
end;

procedure TDataModule1.DoRepInvLines(ATaskName: String);
begin
  DoRepObj(ATaskName, otInvLines, AddInvLines, nil);
end;

procedure TDataModule1.DoRepTimeDict(ATaskName: String);
begin
  DoRepObj(ATaskName, otInvTimeDict, AddInvTimeDict, nil);
end;

function TDataModule1.AddEDName(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spEDAdd do
  begin
    Close;
    Parameters.ParamByName('@id_Business_Main').Value := CDS.FieldByName('id_Business').Value;
    Parameters.ParamByName('@Type').Value := CDS.FieldByName('Type').Value;
    Parameters.ParamByName('@NumPrm').Value := CDS.FieldByName('NumPrm').Value;
    Parameters.ParamByName('@ParName').Value := CDS.FieldByName('ParName').Value;
    Parameters.ParamByName('@OrdNum').Value := CDS.FieldByName('OrdNum').Value;
    if CDS.FieldByName('NeedSend').AsBoolean then
      Parameters.ParamByName('@Visible').Value := CDS.FieldByName('Visible').Value
    else
      Parameters.ParamByName('@Visible').Value := false;
    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

function TDataModule1.AddFormalDistr(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spFormalDistribAdd do
  begin
    Close;
    Parameters.ParamByName('@id_Business_Main').Value := CDS.FieldByName('id_Business').Value;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@Deleted').Value := CDS.FieldByName('Deleted').Value;
    Parameters.ParamByName('@id_Main').Value := CDS.FieldByName('id_FormalDistrib').Value;
    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

function TDataModule1.AddFuncDistr(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spFuncDistribAdd do
  begin
    Close;
    Parameters.ParamByName('@id_Business_Main').Value := CDS.FieldByName('id_Business').Value;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@Deleted').Value := CDS.FieldByName('Deleted').Value;
    Parameters.ParamByName('@id_Main').Value := CDS.FieldByName('id_FuncDistrib').Value;
    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;


function TDataModule1.AddInvForm(CDS: TClientDataSet): boolean;
var i : integer;
    AParameter : TParameter;
begin
  Result := false;
  with spINV_FormAdd do
  begin
    Close;
    for i := 0 to CDS.Fields.Count - 1 do
    begin
      AParameter := Parameters.FindParam('@' + CDS.Fields[i].FieldName);
      if AParameter <> nil then
        AParameter.Value := CDS.Fields[i].Value;

      AParameter := Parameters.FindParam('@' + CDS.Fields[i].FieldName + '_Main');
      if AParameter <> nil then
        AParameter.Value := CDS.Fields[i].Value;
    end;

    Parameters.ParamByName('@id_Main').Value := CDS.FieldByName('id_Form').Value;
    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

function TDataModule1.AddInvLines(CDS: TClientDataSet): boolean;
var i : integer;
    AParameter : TParameter;
begin
  Result := false;
  with spInv_LinesAdd do
  begin
    Close;
    for i := 0 to CDS.Fields.Count - 1 do
    begin
      AParameter := Parameters.FindParam('@' + CDS.Fields[i].FieldName);
      if AParameter <> nil then
        AParameter.Value := CDS.Fields[i].Value;

      AParameter := Parameters.FindParam('@' + CDS.Fields[i].FieldName + '_Main');
      if AParameter <> nil then
        AParameter.Value := CDS.Fields[i].Value;
    end;

    Parameters.ParamByName('@id_Main').Value := CDS.FieldByName('id_Lines').Value;
    try
      ExecProc;
       Result := true;
    except
    end;
  end;
end;


function TDataModule1.AddInvTimeDict(CDS: TClientDataSet): boolean;
var i : integer;
    AParameter : TParameter;
begin
  Result := false;
  with spINV_TimeDictAdd do
  begin
    Close;
    for i := 0 to CDS.Fields.Count - 1 do
    begin
      AParameter := Parameters.FindParam('@' + CDS.Fields[i].FieldName);
      if AParameter <> nil then
        AParameter.Value := CDS.Fields[i].Value;

      AParameter := Parameters.FindParam('@' + CDS.Fields[i].FieldName + '_Main');
      if AParameter <> nil then
        AParameter.Value := CDS.Fields[i].Value;
    end;

    Parameters.ParamByName('@id_Main').Value := CDS.FieldByName('id_TimeDict').Value;
    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;


function TDataModule1.UpdateInv_Project(CDS: TClientDataSet): boolean;
var ID_Project : integer;
begin
  Result := false;
    ID_Project := CDS.FieldByName('ID_Project').AsInteger;
//  ADOConnection1.BeginTrans;
  try
    with cdsInvTimeList do
    begin
      Close;
      Params.ParamByName('@ID_Project').Value := ID_Project;
      Open;
      try
        First;
        while not Eof do
        begin
          spUP_TimeItem.Close;
          spUP_TimeItem.Parameters.ParamByName('@id_Main').Value := cdsInvTimeListid_TimeItem.AsVariant;
          spUP_TimeItem.Parameters.ParamByName('@Val').Value := cdsInvTimeListVal.AsVariant;
          spUP_TimeItem.Parameters.ParamByName('@ValPlan').Value := cdsInvTimeListValPlan.AsVariant;
          try
            spUP_TimeItem.ExecProc;
          except

          end;
          Next;
        end;
      finally
        Close;
      end;
    end;

    with cdsInvWareList do
    begin
      Close;
      Params.ParamByName('@ID_Project').Value := ID_Project;
      Open;
      try
        First;
        while not Eof do
        begin
          spUP_Ware.Close;
          spUP_Ware.Parameters.ParamByName('@id_Main').Value := cdsInvWareListid_Inv_Ware.AsVariant;
          spUP_Ware.Parameters.ParamByName('@AmountPlan').Value := cdsInvWareListAmountPlan.AsVariant;
          spUP_Ware.Parameters.ParamByName('@PricePlan').Value := cdsInvWareListPricePlan.AsVariant;
          spUP_Ware.Parameters.ParamByName('@Amount').Value := cdsInvWareListAmount.AsVariant;
          spUP_Ware.Parameters.ParamByName('@Summ').Value := cdsInvWareListSumm.AsVariant;
          try
            spUP_Ware.ExecProc;
          except

          end;
          Next;
        end;
      finally
        Close;
      end;
    end;
 //   ADOConnection1.CommitTrans;
  except

 //   ADOConnection1.RollbackTrans;
  end;
  Result := true;
end;


function TDataModule1.SendInv(CDS: TCustomADODataSet): boolean;
var i, ID_Main, id_Inv_Ware, id_TimeItem : integer;
    AField : TField;

    id_Project, id_Goods, id_Measure, id_Manufact,
  AmountPlan, PricePlan, Amount, Summ: OleVariant;
begin
  Result := false;
  with cdsRP_Inv_GetProp do
  begin
    Close;
  //  Params.ParamByName('@id_Project').Value := -1;
    Open;
    Append;
    for i := 0 to Fields.Count - 1 do
    begin
      if (Fields[i] <> FieldByName('id_Project')) and
         (Fields[i] <> FieldByName('LastUpdated')) then
      begin
        AField := CDS.Fields.FindField(Fields[i].FieldName);
        if AField <> nil then
          Fields[i].Value := AField.Value;

        AField := CDS.Fields.FindField(Fields[i].FieldName + '_Main');
        if AField <> nil then
          Fields[i].Value := AField.Value;
      end;
    end;

    FieldByName('id_Inv').Value := 1;
    FieldByName('ID_Main').Value := 1;
    FieldByName('CheckDate').Value := Null;

    FieldByName('ID_LC').Value := CDS.FieldByName('id_Project').AsInteger;
    Post;
    ApplyUpdates(0);
    ID_Main := SocketConnection1.AppServer.Inv_GetID(CDS.FieldByName('id_Project').AsInteger);

    if ID_Main > 0 then
    begin
      with spInv_Project_CH do
      begin
        Close;
        Parameters.ParamByName('@id_Project').Value := CDS.FieldByName('id_Project').Value;
        Parameters.ParamByName('@ID_Main').Value := ID_Main;

        try
          ExecProc;
          Result := true;
        except
        end;
      end;

      with spINVTimeItem do
      begin
        Parameters.ParamByName('@id_Project').Value := CDS.FieldByName('id_Project').Value;
        Open;
        try
          First;
          while not Eof do
          begin
            try    
              id_TimeItem := SocketConnection1.AppServer.INV_TimeItemAdd(Null, //spINVTimeItemVal.AsVariant,
                spINVTimeItemValPlan.AsVariant,
                spINVTimeItemid_TimeDict_Main.AsVariant,
                ID_Main);

              with spInvTICH do
              begin
                Close;
                Parameters.ParamByName('@id_TimeItem').Value := spINVTimeItemid_TimeItem.Value;
                Parameters.ParamByName('@ID_Main').Value := id_TimeItem;

                try
                  ExecProc;
                  Result := true;
                except
                end;
              end;
            except
            end;
            Next;
          end;
        finally
          Close;
        end;
      end;

      with spInvWare do
      begin
        Parameters.ParamByName('@id_Project').Value := CDS.FieldByName('id_Project').Value;
        Open;
        try
          First;
          while not Eof do
          begin
            try
              id_Project := ID_Main;
              id_Goods := spInvWareid_Goods_Main.AsVariant;
              id_Measure := spInvWareid_Measure_Main.AsVariant;
              id_Manufact := spInvWareid_Manufact_Main.AsVariant;
  AmountPlan := spInvWareAmountPlan.AsVariant;
  PricePlan := spInvWarePricePlan.AsVariant;
  Amount := Null;
  Summ  := Null;


              id_Inv_Ware := SocketConnection1.AppServer.Inv_WareAdd(id_Project, id_Goods, id_Measure, id_Manufact,
  AmountPlan, PricePlan, Amount, Summ

  );
  {ID_Main,
                spInvWareid_Goods_Main.AsVariant,
                spInvWareid_Measure_Main.AsVariant,
                spInvWareid_Manufact_Main.AsVariant,
                spInvWareAmountPlan.AsVariant,
                spInvWarePricePlan.AsVariant,
                Null, //spInvWareAmount.AsVariant,
                Null, //spInvWareSumm.AsVariant
                ); }

              with spInvWareCH do
              begin
                Close;
                Parameters.ParamByName('@id_Inv_Ware').Value := spInvWareid_Inv_Ware.Value;
                Parameters.ParamByName('@ID_Main').Value := id_Inv_Ware;

                try
                  ExecProc;
                  Result := true;
                except
                end;
              end;
            except
            end;
            Next;
          end;
        finally
          Close;
        end;
      end;
    end;


    Result := ID_Main > 0;
  end;
end;

function TDataModule1.SendInvFact(CDS: TCustomADODataSet): boolean;
var i, ID_Main, id_Inv_Ware, id_TimeItem : integer;
    AField : TField;
begin
  Result := false;
  ID_Main := CDS.FieldByName('ID_Main').AsInteger;


  if ID_Main > 0 then
  begin
    with spINVTimeItem do
    begin
      Parameters.ParamByName('@id_Project').Value := CDS.FieldByName('id_Project').Value;
      Open;
      try
        First;
        while not Eof do
        begin
          id_TimeItem := spINVTimeItemID_Main.AsInteger;
          try
            SocketConnection1.AppServer.INV_TimeItemEdit_F(id_TimeItem,
              spINVTimeItemVal.AsVariant);
          except
          end;
          Next;
        end;
      finally
        Close;
      end;
    end;

      with spSendFact do
      begin
        Close;
        Parameters.ParamByName('@id_Project').Value := CDS.FieldByName('id_Project').Value;

        try
          ExecProc;
          Result := true;
        except
        end;
      end;

    Result := ID_Main > 0;
  end;
end;

procedure TDataModule1.DoRepInv(ATaskName: String; ASaveCDS : boolean);
begin
  try
    DoRepObj(ATaskName, otInvProject, UpdateInv_Project, SendInv, ASaveCDS);
  finally
//    id_RepJrnOper := -1;
  end;
end;

procedure TDataModule1.DoRepInvFact(ATaskName: String; ASaveCDS : boolean);
begin
  try
    DoRepObj(ATaskName, otInvProjectFact, nil, SendInvFact, ASaveCDS);
  finally
//    id_RepJrnOper := -1;
  end;
end;


function TDataModule1.AddOper201(CDS: TClientDataSet): boolean;
var id_OPer : integer;
begin
  Result := false;
  id_OPer := -1;
  with spAddOper201 do
  begin
    Close;
    Parameters.ParamByName('@id_oper').Value := CDS.FieldByName('id_oper').Value;
    Parameters.ParamByName('@id_business').Value := CDS.FieldByName('id_business').Value;
    Parameters.ParamByName('@Id_CurrencyOper').Value := CDS.FieldByName('Id_CurrencyOper').Value;
    Parameters.ParamByName('@id_Warehouse').Value := CDS.FieldByName('id_Warehouse').Value;
    Parameters.ParamByName('@id_Repr').Value := CDS.FieldByName('id_Repr').Value;
    Parameters.ParamByName('@id_UserCreator').Value := CDS.FieldByName('id_UserCreator').Value;
    Parameters.ParamByName('@Imp_PayBasic').Value := CDS.FieldByName('Imp_PayBasic').Value;
    Parameters.ParamByName('@AccInv_PayAssignment').Value := CDS.FieldByName('AccInv_PayAssignment').Value;
    Parameters.ParamByName('@Contract').Value := CDS.FieldByName('Contract').Value;
    Parameters.ParamByName('@OpComment').Value := CDS.FieldByName('OpComment').Value;
    Parameters.ParamByName('@Deleted').Value := CDS.FieldByName('Deleted').Value;
    Parameters.ParamByName('@DateCreate').Value := CDS.FieldByName('DateCreate').Value;

  end;
    try
      try
        spAddOper201.ExecProc;
    except
                on E : Exception do
                  AddToLog(ltError, 'spAddOper201 - ' + E.Message);
    end;
      id_OPer := spAddOper201.Parameters.ParamValues['@RETURN_VALUE'];

      if id_OPer = -5 then
      begin
        Result := true;
        Exit;
      end;
      if id_OPer = 0 then
        raise Exception.Create('spAddOper201 - ошибка');
        
      cds201Ware.Close;
      cds201Ware.Params.ParamByName('@id_oper').Value := CDS.FieldByName('id_oper').Value;
      cds201Ware.Open;
      cds201Ware.First;
      while not cds201Ware.Eof do
      begin
        with spAddOper201Ware do
        begin
          Close;
          Parameters.ParamByName('@id_Oper').Value := id_OPer;
          Parameters.ParamByName('@AmountOper').Value := cds201Ware.FieldByName('AmountOper').Value;
          Parameters.ParamByName('@id_Measure').Value := cds201Ware.FieldByName('id_Measure').Value;
          Parameters.ParamByName('@PriceOper').Value := cds201Ware.FieldByName('PriceOper').Value;
          Parameters.ParamByName('@id_Goods').Value := cds201Ware.FieldByName('id_Goods').Value;

          ExecProc;
        end;
        cds201Ware.Next;
      end;

      Result := true;
    except
                on E : Exception do
                  AddToLog(ltError, 'AddOper201 - ' + E.Message);
    end;
end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
  DataModule1 := nil;
end;

function TDataModule1.AddAccGrp(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spAccGrpAdd do
  begin
    Close;
    Parameters.ParamByName('@id_Business_Main').Value := CDS.FieldByName('id_Business').Value;
    Parameters.ParamByName('@PID').Value := CDS.FieldByName('PID').Value;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@Deleted').Value := CDS.FieldByName('Deleted').Value;
    Parameters.ParamByName('@id_Main').Value := CDS.FieldByName('id_Acc_Group').Value;
    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

function TDataModule1.AddCA(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spCAAdd do
  begin
    Close;
    Parameters.ParamByName('@id_Business_Main').Value := CDS.FieldByName('id_Business').Value;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@Deleted').Value := CDS.FieldByName('Deleted').Value;
    Parameters.ParamByName('@id_Main').Value := CDS.FieldByName('id_ContrAgent').Value;
    Parameters.ParamByName('@id_CAGroup_Main').Value := CDS.FieldByName('id_CAGroup_Main').Value;
    Parameters.ParamByName('@Addr').Value := CDS.FieldByName('Addr').Value;
    Parameters.ParamByName('@Descr').Value := CDS.FieldByName('Descr').Value;
    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

function TDataModule1.SendCA(CDS: TCustomADODataSet): boolean;
var R : integer;
    AName: OleVariant;
  id_Business: Integer; Deleted: WordBool; id_CAGroup: OleVariant;
  ID_ContrAgent: Integer; Addr, Descr: OleVariant;
begin
  Result := false;
  id_ContrAgent := -1;
  AName := CDS.FieldByName('Name').Value;
  id_Business := CDS.FieldByName('id_Business_Main').Value;
  id_CAGroup := CDS.FieldByName('id_CAGroup_Main').Value;
  Deleted := CDS.FieldByName('Disabled').AsBoolean;
  if CDS.FieldByName('Addr').AsString = '' then
    Addr := Null
  else
    Addr := CDS.FieldByName('Addr').Value;
  if CDS.FieldByName('Descr').AsString = '' then
    Descr := Null
  else
    Descr := CDS.FieldByName('Descr').Value;


  R := SocketConnection1.AppServer.RP_v2_ContrAgent_Add_X(AName,
  id_Business, Deleted, id_CAGroup, ID_ContrAgent, Addr, Descr);
  if R <> -1 then
  begin
    with spCA_CH do
    begin
      Parameters.ParamByName('@id_ContrAgent').Value := CDS.FieldByName('id_ContrAgent').AsInteger;
      Parameters.ParamByName('@id_Main').Value := R;
      ExecProc;
    end;
    Result := true;
  end;
end;


function TDataModule1.AddCAGrp(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spCAGrpAdd do
  begin
    Close;
    Parameters.ParamByName('@id_Business_Main').Value := CDS.FieldByName('id_Business').Value;
    Parameters.ParamByName('@Name').Value := CDS.FieldByName('Name').Value;
    Parameters.ParamByName('@Deleted').Value := CDS.FieldByName('Deleted').Value;
    Parameters.ParamByName('@id_Main').Value := CDS.FieldByName('id_CAGroup').Value;
    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

function TDataModule1.AddRRR(CDS: TClientDataSet): boolean;
begin
  Result := false;
  with spRRRAdd do
  begin
    Close;
    Parameters.ParamByName('@id_Business_Main').Value := CDS.FieldByName('id_Business').Value;
    Parameters.ParamByName('@id_Acc_Main').Value := CDS.FieldByName('id_Acc').Value;
    Parameters.ParamByName('@id_Acc_Group_Main').Value := CDS.FieldByName('id_Acc_Group').Value;
    Parameters.ParamByName('@id_ContrAgent_Main').Value := CDS.FieldByName('id_ContrAgent').Value;
    Parameters.ParamByName('@id_CAGroup_Main').Value := CDS.FieldByName('id_CAGroup').Value;
    Parameters.ParamByName('@id_Group_Main').Value := CDS.FieldByName('id_Group').Value;
    Parameters.ParamByName('@id_Main').Value := CDS.FieldByName('id_Permit').Value;
    try
      ExecProc;
      Result := true;
    except
    end;
  end;
end;

procedure TDataModule1.DoRepDocs(AObjType: TObjType; ATaskName: String; TKey : String; AHasCh : boolean);
begin
  try
    cdsDocTS.Close;
    cdsDocList.Close;
    cdsDocCH.Close;
    cdsDocTS.Params.ParamByName('@TName').Value := 'DOC_' + TKey;
    cdsDocList.Params.ParamByName('@TName').Value := cdsDocTS.Params.ParamByName('@TName').Value;
    cdsDocCH.Params.ParamByName('@TKey').Value := 'id_' + TKey;

    if AHasCh then
    begin
      cdsDocCH.Params.ParamByName('@TName_CH').Value := cdsDocTS.Params.ParamByName('@TName').Value + 'Ware';
    end
    else
    begin
      cdsDocCH.Params.ParamByName('@TName_CH').Value := '';
    end;

    DoRepObj(ATaskName, AObjType, UpdateDoc_UN, nil);
  finally
    cdsDocCH.Close;
    cdsDocCH.Filtered := false;
  end;
end;

function TDataModule1.UpdateDoc_UN(CDS: TClientDataSet): boolean;
var TName, TKey, TName_CH : String;
    i, AID_XXX, id_Doc, id_UserCreator : integer;
    AField : TField;
    id_DocCur, id_business : Variant;
begin
  Result := false;
  
  TName := CDS.Params.parambyName('@TName').value;
  TKey := cdsDocCH.Params.ParamByName('@TKey').Value;
  TName_CH := cdsDocCH.Params.ParamByName('@TName_CH').Value;
  id_Doc := CDS.FieldByName(TKey).AsInteger;


  with qDoc do
  begin
    Close;
    SQL.Text := 'select max(' + TKey + ') from ' + TName + ' WHERE id_Main=' + IntToStr(id_Doc);
    Open;
    AID_XXX := qDoc.Fields[0].AsInteger;

    Close;
    SQL.Text := 'select max(id_User) from USR_USer';
    Open;
    id_UserCreator := qDoc.Fields[0].AsInteger;


    if TName_CH <> '' then
    begin
      Close;
      SQL.Text := 'delete from ' + TName_CH + ' WHERE ' + TKey + ' = ' + IntToStr(AID_XXX);
      ExecSQL;
    end;
    
    Close;
    SQL.Text := 'delete from ' + TName + ' WHERE id_MAin = ' + IntToStr(id_Doc);
    ExecSQL;

    if CDS.FieldByName('Disabled').AsBoolean then
    begin
      Result := true;
      Exit;
    end;
    AID_XXX := 0;
    try
      if CDS.FindField('id_DocCur') <> nil then
      begin
        Close;
        SQL.Text := 'select id_Currency FROM Crn_Currency (NOLOCK) WHERE id_MAin = ' + IntToStr( CDS.FieldByName('id_DocCur').AsInteger);
        Open;
        id_DocCur :=  qDoc.Fields[0].AsVariant;
      end;
      
      Close;
      SQL.Text := 'select id_business FROM Dic_business (NOLOCK) WHERE id_MAin = ' + IntToStr( CDS.FieldByName('id_business').AsInteger);
      Open;
      id_business :=  qDoc.Fields[0].AsVariant;

      Close;
      SQL.Text := 'select * from ' + TName + ' WHERE 1 = 0';
      Open;

      Append;
      for i:= 0 to Fields.Count - 1 do
      begin
        if (Fields[i] <> FieldByName(TKey)) then
        begin
          AField := CDS.Fields.FindField(Fields[i].FieldName);
          if (AField <> nil) and (not Fields[i].ReadOnly) then
            Fields[i].Value := AField.Value;
        end;
      end;
//      FieldByName(TKey).Value := Null;
      FieldByName('id_Doc_Org').Value := Null;
      FieldByName('id_Oper').Value := Null;
      FieldByName('id_Main').Value := id_Doc;
      if CDS.FindField('id_DocCur') <> nil then
        FieldByName('id_DocCur').Value := id_DocCur;
      FieldByName('id_business').Value := id_business;
      FieldByName('id_UserCreator').Value := id_UserCreator;


   //   FieldByName('LastUpdated').Value := Null;
      Post;
    //  ApplyUpdates(0);

      Close;
      SQL.Text := 'select max(' + TKey + ') from ' + TName + ' WHERE id_Main=' + IntToStr(id_Doc);
      Open;
      AID_XXX := qDoc.Fields[0].Value;

  if (cdsDocCH.Params.ParamByName('@TName_CH').Value <> '')  then
  begin
      cdsDocCH.Close;
    cdsDocCH.Params.ParamByName('@ID').Value := id_Doc;
    try
   //   AddToLog(ltNone, ' читаются дочерние записи');
      cdsDocCH.Open;
   //   AddToLog(ltOK, ' данные прочитаны');
    except
    end;
  end;

      if cdsDocCH.Active then
      begin
        cdsDocCH.First;
        Close;
        SQL.Text := 'select * from ' + TName_CH + ' WHERE 1 = 0';
        Open;

        while not cdsDocCH.Eof do
        begin
          Append;
          for i:= 0 to Fields.Count - 1 do
          begin
            AField := cdsDocCH.Fields.FindField(Fields[i].FieldName);
            if (AField <> nil) and (not Fields[i].ReadOnly) then
              Fields[i].Value := AField.Value;
          end;
          FieldByName(TKey).Value := AID_XXX;
      //    FieldByName(TKey + 'Ware').Value := Null;
      //    FieldByName('LastUpdated').Value := Null;
          Post;
          cdsDocCH.Next;
        end;
      end;
      Result := true;
    finally
      Close;
    end;
  end;
end;

end.
