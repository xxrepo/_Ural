unit uRDM;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ReplSvc_TLB, StdVcl, Db, ADODB, inifiles, Provider, MtUPDPrv;

type
  THackCustomADODataSet = class(TCustomADODataSet)
    property CommandTimeout;
  end;
  TReplDM = class(TRemoteDataModule, IReplDM)
    ADOConnection1: TADOConnection;
    spWhoIAm: TADOStoredProc;
    ADOStoredProc1: TADOStoredProc;
    SQLUpdateDSProvider1: TSQLUpdateDSProvider;
    dsAccTS: TDataSetProvider;
    spAccTS: TADOStoredProc;
    dsAccList: TDataSetProvider;
    spAccList: TADOStoredProc;
    spAccListid_Acc: TAutoIncField;
    spAccListid_business: TIntegerField;
    spAccListName: TStringField;
    spAccListBank: TStringField;
    spAccListPrsnAccName: TStringField;
    spAccListCorrAccName: TStringField;
    spAccListINN: TStringField;
    spAccListBIK: TStringField;
    spAccListDisabled: TBooleanField;
    spAccListLastUpdated: TBytesField;
    spAccListID_Main: TIntegerField;
    spWhoIAmid_Replicator: TAutoIncField;
    dsBsnList: TDataSetProvider;
    spBsnList: TADOStoredProc;
    spBsnListid_business: TAutoIncField;
    spBsnListId_Currency: TIntegerField;
    spBsnListName: TStringField;
    spBsnListShortName: TStringField;
    spBsnListNum: TStringField;
    spBsnListDisabled: TBooleanField;
    spBsnListLastUpdated: TBytesField;
    spBsnListID_Main: TIntegerField;
    dsBsnTS: TDataSetProvider;
    spBsnTS: TADOStoredProc;
    dsCrnList: TDataSetProvider;
    spCrnList: TADOStoredProc;
    dsCrnTS: TDataSetProvider;
    spCrnTS: TADOStoredProc;
    spCrnListId_Currency: TAutoIncField;
    spCrnListName: TStringField;
    spCrnListShortName: TStringField;
    spCrnListISOCode: TStringField;
    spCrnListNumberCode: TStringField;
    spCrnListFastAccess: TBooleanField;
    spCrnListValue: TIntegerField;
    spCrnListRate: TFloatField;
    spCrnListAvForPay: TBooleanField;
    spCrnListId_URL: TIntegerField;
    spCrnListBase: TBooleanField;
    spCrnListLastUpdated: TBytesField;
    spCrnListid_Main: TIntegerField;
    dsReprList: TDataSetProvider;
    spReprList: TADOStoredProc;
    dsReprTS: TDataSetProvider;
    srReprTS: TADOStoredProc;
    dsMNList: TDataSetProvider;
    spMNList: TADOStoredProc;
    dsMNTS: TDataSetProvider;
    spMNTS: TADOStoredProc;
    dsMSList: TDataSetProvider;
    spMSList: TADOStoredProc;
    dsMSTS: TDataSetProvider;
    spMSTS: TADOStoredProc;
    dsWHList: TDataSetProvider;
    spWHList: TADOStoredProc;
    dsWHTS: TDataSetProvider;
    spWHTS: TADOStoredProc;
    dsCtgGoodsList: TDataSetProvider;
    spCtgGoodsList: TADOStoredProc;
    dsCtgGoodsTS: TDataSetProvider;
    spCtgGoodsTS: TADOStoredProc;
    dsGoodsList: TDataSetProvider;
    spGoodsList: TADOStoredProc;
    dsGoodsTS: TDataSetProvider;
    spGoodsTS: TADOStoredProc;
    dsCAWHList: TDataSetProvider;
    spCAWHList: TADOStoredProc;
    dsCAWHTS: TDataSetProvider;
    spCAWHTS: TADOStoredProc;
    dsFuncList: TDataSetProvider;
    spFuncList: TADOStoredProc;
    dsFuncTS: TDataSetProvider;
    spFuncTS: TADOStoredProc;
    dsUserList: TDataSetProvider;
    spUserList: TADOStoredProc;
    dsUserTS: TDataSetProvider;
    spUserTS: TADOStoredProc;
    dsGroupList: TDataSetProvider;
    spGroupList: TADOStoredProc;
    dsGroupTS: TDataSetProvider;
    spGroupTS: TADOStoredProc;
    dsGetGroup: TDataSetProvider;
    spGetGroup: TADOStoredProc;
    dsGetRights: TDataSetProvider;
    spGetRights: TADOStoredProc;
    dsLNKList: TDataSetProvider;
    spLNKList: TADOStoredProc;
    dsLNKTS: TDataSetProvider;
    spLNKTS: TADOStoredProc;
    spBsnListCrn_Name: TStringField;
    spBsnListCrn_ShortName: TStringField;
    spBsnListCrn_ISOCode: TStringField;
    spBsnListCrn_NumberCode: TStringField;
    spBsnListCrn_FastAccess: TBooleanField;
    spBsnListCrn_Value: TIntegerField;
    spBsnListCrn_Rate: TBCDField;
    spBsnListCrn_AvForPay: TBooleanField;
    spCrnListid_Bsn: TIntegerField;
    spCrnListId_CurrencyUnData: TIntegerField;
    dsOPList: TDataSetProvider;
    spOPList: TADOStoredProc;
    dsOpTS: TDataSetProvider;
    spOpTS: TADOStoredProc;
    dsWhStateTS: TDataSetProvider;
    spWhStateTS: TADOStoredProc;
    spLog: TADOStoredProc;
    spWHSList: TADOStoredProc;
    dsWHSList: TDataSetProvider;
    spWHS2: TADOStoredProc;
    dsWHS2: TDataSetProvider;
    spEDTS: TADOStoredProc;
    spEDList: TADOStoredProc;
    dsEDList: TDataSetProvider;
    dsEDTS: TDataSetProvider;
    spAddOper_v22: TADOStoredProc;
    spAddWare: TADOStoredProc;
    spWHS_3: TADOStoredProc;
    dsWHS_3: TDataSetProvider;
    dsFuncDistribList: TDataSetProvider;
    spFuncDistribList: TADOStoredProc;
    dsFuncDistribTS: TDataSetProvider;
    spFuncDistribTS: TADOStoredProc;
    dsFormalDistribList: TDataSetProvider;
    spFormalDistribList: TADOStoredProc;
    dsFormalDistribTS: TDataSetProvider;
    spFormalDistribTS: TADOStoredProc;
    dsINV_FormList: TDataSetProvider;
    spINV_FormList: TADOStoredProc;
    dsINV_FormTS: TDataSetProvider;
    spINV_FormTS: TADOStoredProc;
    dsInv_LinesList: TDataSetProvider;
    spInv_LinesList: TADOStoredProc;
    dsInv_LinesTS: TDataSetProvider;
    spInv_LinesTS: TADOStoredProc;
    dsINV_TimeDictList: TDataSetProvider;
    spINV_TimeDictList: TADOStoredProc;
    dsINV_TimeDictTS: TDataSetProvider;
    spINV_TimeDictTS: TADOStoredProc;
    dsRP_Inv_GetProp: TDataSetProvider;
    spRP_Inv_GetProp: TADOQuery;
    spInvTimeList: TADOStoredProc;
    dsInvTimeList: TDataSetProvider;
    dsInvWareList: TDataSetProvider;
    spInvWareList: TADOStoredProc;
    spInvProject: TADOStoredProc;
    dsInvProject: TDataSetProvider;
    spInvProjectid_Project: TAutoIncField;
    spInvProjectGetTS: TADOStoredProc;
    dsInvProjectGetTS: TDataSetProvider;
    spInvProjectGetTSLastUpdated: TBytesField;
    ds201List: TDataSetProvider;
    sp201List: TADOStoredProc;
    ds201TS: TDataSetProvider;
    sp201TS: TADOStoredProc;
    ds201Ware: TDataSetProvider;
    sp201Ware: TADOStoredProc;
    spInvProjectLastUpdated: TBytesField;
    dsAccGrpGetList: TDataSetProvider;
    spAccGrpGetList: TADOStoredProc;
    dsAccGrpTS: TDataSetProvider;
    spAccGrpTS: TADOStoredProc;
    dsCAGroupGetList: TDataSetProvider;
    spCAGroupGetList: TADOStoredProc;
    dsCAGroupTS: TDataSetProvider;
    spCAGroupTS: TADOStoredProc;
    dsCAList: TDataSetProvider;
    spCAList: TADOStoredProc;
    dsCATS: TDataSetProvider;
    spCATS: TADOStoredProc;
    spAccListid_Acc_Group: TIntegerField;
    spRRRTS: TADOStoredProc;
    dsRRRTS: TDataSetProvider;
    spRRRList: TADOStoredProc;
    dsRRRList: TDataSetProvider;
    dsDocList: TDataSetProvider;
    spDocList: TADOStoredProc;
    dsDocTS: TDataSetProvider;
    spDocTS: TADOStoredProc;
    dsDocCH: TDataSetProvider;
    spDocCH: TADOStoredProc;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure SQLUpdateDSUpdateError(Sender: TObject;
      DataSet: TClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
  private
    Fid_Replicator : Variant;

    FBaseName : String;
    FUserName, FPassword: String;
    IC : String;
    procedure LogMessage(Message: String; EventType: DWord = 1; Category: Word = 0; ID: DWord = 0);
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function DoLogin(UserName, Password: OleVariant): Integer; safecall;
    procedure BeginTrans; safecall;
    procedure CommitTrans; safecall;
    procedure RollbackTrans; safecall;
    function RP_Acc_Add(AName, id_Bsn: OleVariant): Integer; safecall;
    function RP_ReprAdd(id_ContrAgent: OleVariant; isJur: WordBool; AName,
      FirstName, MiddleName, LastName, Id_Currency: OleVariant;
      Disabled: WordBool; Addr, Descr, id_Bsn_ex: OleVariant): Integer;
      safecall;
    function RP_EQ_Add(AName, id_Bsn: OleVariant): Integer; safecall;
    function RP_MN_Add(AName, id_Bsn: OleVariant): Integer; safecall;
    function Ctg_GoodsAdd(id_business: Integer; id_BaseCtg, AName,
      ShortName: OleVariant; Disabled: WordBool): Integer; safecall;
    function RP_MS_Add_Rep(AName, ShortName, id_BaseMeasure, Koef: OleVariant;
      Disabled: WordBool; id_Business: Integer): Integer; safecall;
    function LC_WH_Add(AName, id_Bsn, Addr: OleVariant): Integer; safecall;
    function GoodsAdd(id_Ctg, AName, ShortName, BarCode,
      Id_Measure: OleVariant; Disabled: WordBool): Integer; safecall;
    function RP_ReplicatorDelPeriod(id_Replicator: Integer): Integer; safecall;
    function RP_User_New(FirstName, MiddleName, LastName: OleVariant): Integer;
      safecall;
    function RP_OperWare(id_Oper: Integer; id_Goods, Id_Measure: OleVariant;
      AmountOper: Double; PriceOper, SummSys: OleVariant): Integer;
      safecall;
    function RP_OperAdd_v22(OperVid: Integer; DateLocal,
      id_business: OleVariant; Correct, OperTypeIn: WordBool;
      Id_CurrencyOper, PriceFinOper, Id_CurrencySys, SummSysFin, id_Acc,
      id_Acc_Ext, id_Warehouse, id_Warehouse_Ext, id_Manufact,
      id_Manufact_Ext, id_Repr, id_UserCreator: OleVariant;
      id_Replicator: Integer; id_DocType, Imp_PayBasic,
      AccInv_PayAssignment, Contract, OpComment, id_LC_Oper: OleVariant;
      Koeff: Integer; Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8, Dig9,
      Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, Str1, Str2, Str3, Str4,
      Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14,
      Str15, Date1, Date2, Date3, Date4, Date5, Date6, Date7, Date8, Date9,
      Date10, Date11, Date12, Date13, Date14, Date15, id_FormalDistrib,
      id_FuncDistrib: OleVariant): Integer; safecall;
    function PR_OPerComment(id_LC_Oper, CommentType: Integer; Comment,
      id_User: OleVariant): Integer; safecall;
    procedure Inv_ProjectAdd(AName: OleVariant; id_User, PrjNum, PrjDate,
      CalcDate, Amount1, Amount2, Inv1, Inv2, Price, Param11: Integer);
      safecall;
    function Inv_GetID(id_lc: Integer): Integer; safecall;
    function INV_TimeItemAdd(Val, ValPlan, id_TimeDict,
      id_Project: OleVariant): Integer; safecall;
    function Inv_WareAdd(id_Project, id_Goods, id_Measure, id_Manufact,
      AmountPlan, PricePlan, Amount, Summ: OleVariant): Integer; safecall;
    procedure SetFBaseName(AAA: OleVariant); safecall;
    procedure SetFPassword(Param1: OleVariant); safecall;
    procedure SetIC(Param1: OleVariant); safecall;
    function INV_TimeItemEdit_F(id_TimeItem: Integer;
      Val: OleVariant): Integer; safecall;
    function RP_OperAdd_v223(OperVid: Integer; DateLocal,
      id_business: OleVariant; Correct, OperTypeIn: WordBool;
      Id_CurrencyOper, PriceFinOper, Id_CurrencySys, SummSysFin, id_Acc,
      id_Acc_Ext, id_Warehouse, id_Warehouse_Ext, id_Manufact,
      id_Manufact_Ext, id_Repr, id_UserCreator: OleVariant;
      id_Replicator: Integer; id_DocType, Imp_PayBasic,
      AccInv_PayAssignment, Contract, OpComment, id_LC_Oper: OleVariant;
      Koeff: Integer; Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8, Dig9,
      Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, Str1, Str2, Str3, Str4,
      Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14,
      Str15, Date1, Date2, Date3, Date4, Date5, Date6, Date7, Date8, Date9,
      Date10, Date11, Date12, Date13, Date14, Date15, id_FormalDistrib,
      id_FuncDistrib, id_OperParent: OleVariant): Integer; safecall;
    function RP_v2_ContrAgent_Add_X(AName: OleVariant; id_Business: Integer;
      Deleted: WordBool; id_CAGroup: OleVariant; ID_ContrAgent: Integer;
      Addr, Descr: OleVariant): Integer; safecall;
  public
    procedure AddToDBLog(S : String);
  end;

implementation

uses uSvc, uMeCrpt;

{$R *.DFM}

class procedure TReplDM.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TReplDM.RemoteDataModuleCreate(Sender: TObject);
var Buffer : PChar;
    Len : DWORD;
    CmpName : String;
    i : integer;

    IniFile : TIniFile;
    S : String;
    SL : TStringList;
begin
//  AddToDBLog('связь установлена');
  ural_Replicator.LogMessage('связь установлена', 3, 1);
  Fid_Replicator := Null;
  THackCustomADODataSet(spWHS_3).CommandTimeout := 60*5;
  THackCustomADODataSet(spOPList).CommandTimeout := 60*5;
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TSQLUpdateDSProvider) and (Assigned(TSQLUpdateDSProvider(Components[i]))) then
      TSQLUpdateDSProvider(Components[i]).OnUpdateError := SQLUpdateDSUpdateError;
  end;

  try
    Len := 256;
    Buffer := AllocMem(Len);
    GetComputerName(Buffer, Len);
    CmpName := StrPas(Buffer);
  finally
    FreeMem(Buffer, Len);
  end;
// ****************************************************************************
  FBaseName := 'OVK';
  FUserName := 'sa';
  FPassword := '1';
  
  S := ParamStr(0);
  S := ExpandFileName(S);
  Delete(S, Length(S) - 2, 3);
  S := S + 'ack';
  S := ExtractFilePath(ParamStr(0)) + S;
  if  FileExists(S) then
  begin
    SL := TStringList.Create;
    try
      SL.Text := FileToStr(S);
      with SL do
      begin
        FBaseName := Values['DB'];
        FUserName := Values['UserName'];
        FPassword := Values['Password'];
      end;  
    finally
      SL.Free;
    end;
  end
  else
  begin
    S := ParamStr(0);
    S := ExpandFileName(S);
    Delete(S, Length(S) - 2, 3);
    S := S + 'ini';
    if  FileExists(S) then
    begin
      IniFile := TIniFile.Create(S);
      with IniFile do
      begin
        FBaseName := ReadString('Base', 'DB', 'OVK');
        FUserName := ReadString('Base', 'UserName', 'sa');
        FPassword := ReadString('Base', 'Password', '1');
        IC := ReadString('Base', 'IC', 'ACS_MBase');

      end;
      IniFile.Free;
    end;
  end;
// ****************************************************************************
end;

procedure TReplDM.SQLUpdateDSUpdateError(Sender: TObject;
  DataSet: TClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
//*
end;

procedure TReplDM.LogMessage(Message: String; EventType: DWord;
  Category: Word; ID: DWord);
begin
  ural_Replicator.LogMessage(Message, EventType, Category, ID);
end;

function TReplDM.DoLogin(UserName, Password: OleVariant): Integer;
begin
  Result := -1;
  with ADOConnection1 do
  begin
   Connected := false;
   ConnectionString := 'Provider=SQLOLEDB.1;Password="' +
     String(FPassword) + '";Persist Security Info=True;User ID=' +
     String(FUserName) + ';Initial Catalog=' + IC + ';Data Source=' + FBaseName +
                        ';Use Procedure for Prepare=1;Auto Translate=True;Application Name=' + Self.Name + '4.0;Packet Size=4096;';
   try
     Connected := true;
     with spWhoIAm do
     begin
       Close;
       try
         Parameters.ParamByName('@Login').Value := UserName;
         Parameters.ParamByName('@Password').Value := Password;
         Open;
      //   if IsEmpty then
      //     raise Exception.Create('Неверный пароль для пользователя ' + UserName);
         if IsEmpty then
           Exit;

         Fid_Replicator := FieldByName('id_Replicator').AsVariant;
         Result := Fid_Replicator;
       finally
         Close;
       end;
     end;
     AddToDBLog('связь установлена - ' + UserName);
   except
     on E : Exception do
     begin
       Result := -1;
       LogMessage('DoLogin, ' + FUserName+ ' '  + FPassword + ' '  + E.Message, EVENTLOG_ERROR_TYPE, 1, 1);
       raise Exception.Create('DoLogin, ' + FUserName+ ' '  + FPassword + ' '  + E.Message);
     end;
   end;
 end;
end;

procedure TReplDM.BeginTrans;
begin
  ADOConnection1.BeginTrans;
end;

procedure TReplDM.CommitTrans;
begin
  ADOConnection1.CommitTrans;
end;

procedure TReplDM.RollbackTrans;
begin
  ADOConnection1.RollbackTrans;
end;

function TReplDM.RP_Acc_Add(AName, id_Bsn: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'LC_Acc_Add';
      Parameters.Refresh;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@id_Bsn').Value := id_Bsn;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TReplDM.RP_ReprAdd(id_ContrAgent: OleVariant; isJur: WordBool;
  AName, FirstName, MiddleName, LastName, Id_Currency: OleVariant;
  Disabled: WordBool; Addr, Descr, id_Bsn_ex: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'CA_ReprAdd';
      Parameters.Refresh;
      Parameters.ParamByName('@id_ContrAgent').Value := id_ContrAgent;
      Parameters.ParamByName('@isJur').Value := isJur;
      Parameters.ParamByName('@Name').Value := AName;

      Parameters.ParamByName('@FirstName').Value := FirstName;
      Parameters.ParamByName('@MiddleName').Value := MiddleName;
      Parameters.ParamByName('@LastName').Value := LastName;

      Parameters.ParamByName('@Id_Currency').Value := Null;
      Parameters.ParamByName('@Disabled').Value := Disabled;
      Parameters.ParamByName('@Addr').Value := Addr;
      Parameters.ParamByName('@Descr').Value := Descr;
      Parameters.ParamByName('@id_Bsn_ex').Value := id_Bsn_ex;

      Parameters.ParamByName('@isRepr').Value := 1;
      
      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TReplDM.RP_EQ_Add(AName, id_Bsn: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'LC_EQ_Add';
      Parameters.Refresh;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@id_Bsn').Value := id_Bsn;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TReplDM.RP_MN_Add(AName, id_Bsn: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'LC_MN_Add';
      Parameters.Refresh;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@id_Bsn').Value := id_Bsn;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TReplDM.Ctg_GoodsAdd(id_business: Integer; id_BaseCtg, AName,
  ShortName: OleVariant; Disabled: WordBool): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'PL_Ctg_GoodsAdd';
      Parameters.Refresh;
      Parameters.ParamByName('@id_business').Value := id_business;
      Parameters.ParamByName('@id_BaseCtg_Goods').Value := id_BaseCtg;
      Parameters.ParamByName('@Name').Value := AName;

      Parameters.ParamByName('@ShortName').Value := ShortName;
//      Parameters.ParamByName('@DefPrice').Value := DefPrice;
//      Parameters.ParamByName('@Id_Currency').Value := Id_Currency;

//      Parameters.ParamByName('@id_Measure').Value := id_Measure;
      Parameters.ParamByName('@Disabled').Value := Disabled;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;



function TReplDM.RP_MS_Add_Rep(AName, ShortName, id_BaseMeasure,
  Koef: OleVariant; Disabled: WordBool; id_Business: Integer): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'RP_MS_Add_Rep';
      Parameters.Refresh;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@ShortName').Value := ShortName;
      Parameters.ParamByName('@id_BaseMeasure').Value := id_BaseMeasure;

      Parameters.ParamByName('@Koef').Value := Koef;
      Parameters.ParamByName('@Disabled').Value := Disabled;
      Parameters.ParamByName('@id_Business').Value := id_Business;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TReplDM.LC_WH_Add(AName, id_Bsn, Addr: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'LC_WH_Add';
      Parameters.Refresh;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@id_Bsn').Value := id_Bsn;
      Parameters.ParamByName('@Addr').Value := Addr;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;


function TReplDM.GoodsAdd(id_Ctg, AName, ShortName, BarCode,
  Id_Measure: OleVariant; Disabled: WordBool): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'PL_GoodsAdd';
      Parameters.Refresh;
      Parameters.ParamByName('@id_Ctg_Goods').Value := id_Ctg;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@ShortName').Value := ShortName;
      Parameters.ParamByName('@BarCode').Value := BarCode;
      Parameters.ParamByName('@Id_Measure').Value := Id_Measure;

      Parameters.ParamByName('@Disabled').Value := Disabled;

      Parameters.ParamByName('@isRepr').Value := 1;
      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TReplDM.RP_ReplicatorDelPeriod(id_Replicator: Integer): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    Close;
    ProcedureName := 'RP_ReplicatorDelPeriod';
    Parameters.Refresh;
    Parameters.ParamByName('@id_Replicator').Value := id_Replicator;
    try
      Open;
      if not IsEmpty then
        Result := FieldByName('DelPeriod').AsInteger;
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TReplDM.RP_User_New(FirstName, MiddleName,
  LastName: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'RP_User_New';
      Parameters.Refresh;
      Parameters.ParamByName('@FirstName').Value := FirstName;
      Parameters.ParamByName('@MiddleName').Value := MiddleName;
      Parameters.ParamByName('@LastName').Value := LastName;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

procedure TReplDM.AddToDBLog(S: String);
begin
  try
    with spLog do
    begin
      Close;
      Parameters.ParamByName('@Msg').Value := S;
      ExecProc;
    end;
  except
  end;
end;

function TReplDM.RP_OperWare(id_Oper: Integer; id_Goods,
  Id_Measure: OleVariant; AmountOper: Double; PriceOper,
  SummSys: OleVariant): Integer;
begin
  Result := -1;
  with spAddWare do
  begin
    try
      Close;
      Parameters.ParamByName('@id_Oper').Value := id_Oper;
      Parameters.ParamByName('@id_Goods').Value := id_Goods;
      Parameters.ParamByName('@id_Measure').Value := id_Measure;
      Parameters.ParamByName('@AmountOper').Value := AmountOper;
      Parameters.ParamByName('@PriceOper').Value := PriceOper;
      Parameters.ParamByName('@SummSys').Value := SummSys;

      ExecProc;
      Result := 1;
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TReplDM.RP_OperAdd_v22(OperVid: Integer; DateLocal,
  id_business: OleVariant; Correct, OperTypeIn: WordBool; Id_CurrencyOper,
  PriceFinOper, Id_CurrencySys, SummSysFin, id_Acc, id_Acc_Ext,
  id_Warehouse, id_Warehouse_Ext, id_Manufact, id_Manufact_Ext, id_Repr,
  id_UserCreator: OleVariant; id_Replicator: Integer; id_DocType,
  Imp_PayBasic, AccInv_PayAssignment, Contract, OpComment,
  id_LC_Oper: OleVariant; Koeff: Integer; Dig1, Dig2, Dig3, Dig4, Dig5,
  Dig6, Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, Str1,
  Str2, Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12,
  Str13, Str14, Str15, Date1, Date2, Date3, Date4, Date5, Date6, Date7,
  Date8, Date9, Date10, Date11, Date12, Date13, Date14, Date15,
  id_FormalDistrib, id_FuncDistrib: OleVariant): Integer;
begin
  Result := -1;
  with spAddOper_v22 do
  begin
    try
      Close;
      Parameters.ParamByName('@OperVid').Value := OperVid;
      Parameters.ParamByName('@DateLocal').Value := DateLocal;
      Parameters.ParamByName('@id_business').Value := id_business;
      Parameters.ParamByName('@Correct').Value := Correct;
      Parameters.ParamByName('@OperTypeIn').Value := OperTypeIn;
      Parameters.ParamByName('@Id_CurrencyOper').Value := Id_CurrencyOper;
      Parameters.ParamByName('@PriceFinOper').Value := PriceFinOper;
      Parameters.ParamByName('@Id_CurrencySys').Value := Id_CurrencySys;
      Parameters.ParamByName('@SummSysFin').Value := SummSysFin;
      Parameters.ParamByName('@id_Acc').Value := id_Acc;
      Parameters.ParamByName('@id_Acc_Ext').Value := id_Acc_Ext;
      Parameters.ParamByName('@id_Warehouse').Value := id_Warehouse;
      Parameters.ParamByName('@id_Warehouse_Ext').Value := id_Warehouse_Ext;
      Parameters.ParamByName('@id_Manufact').Value := id_Manufact;
      Parameters.ParamByName('@id_Manufact_Ext').Value := id_Manufact_Ext;
      Parameters.ParamByName('@id_Repr').Value := id_Repr;
      Parameters.ParamByName('@id_UserCreator').Value := id_UserCreator;
      Parameters.ParamByName('@id_Replicator').Value := id_Replicator;
      Parameters.ParamByName('@id_DocType').Value := id_DocType;
      Parameters.ParamByName('@Imp_PayBasic').Value := Imp_PayBasic;
      Parameters.ParamByName('@AccInv_PayAssignment').Value := AccInv_PayAssignment;
      Parameters.ParamByName('@Contract').Value := Contract;
      Parameters.ParamByName('@OpComment').Value := OpComment;
      Parameters.ParamByName('@id_LC_Oper').Value := id_LC_Oper;

      Parameters.ParamByName('@Koeff').Value := Koeff;

      Parameters.ParamByName('@Dig1').Value := Dig1;
      Parameters.ParamByName('@Dig2').Value := Dig2;
      Parameters.ParamByName('@Dig3').Value := Dig3;
      Parameters.ParamByName('@Dig4').Value := Dig4;
      Parameters.ParamByName('@Dig5').Value := Dig5;
      Parameters.ParamByName('@Dig6').Value := Dig6;
      Parameters.ParamByName('@Dig7').Value := Dig7;
      Parameters.ParamByName('@Dig8').Value := Dig8;
      Parameters.ParamByName('@Dig9').Value := Dig9;
      Parameters.ParamByName('@Dig10').Value := Dig10;
      Parameters.ParamByName('@Dig11').Value := Dig11;
      Parameters.ParamByName('@Dig12').Value := Dig12;
      Parameters.ParamByName('@Dig13').Value := Dig13;
      Parameters.ParamByName('@Dig14').Value := Dig14;
      Parameters.ParamByName('@Dig15').Value := Dig15;

      Parameters.ParamByName('@Str1').Value := Str1;
      Parameters.ParamByName('@Str2').Value := Str2;
      Parameters.ParamByName('@Str3').Value := Str3;
      Parameters.ParamByName('@Str4').Value := Str4;
      Parameters.ParamByName('@Str5').Value := Str5;
      Parameters.ParamByName('@Str6').Value := Str6;
      Parameters.ParamByName('@Str7').Value := Str7;
      Parameters.ParamByName('@Str8').Value := Str8;
      Parameters.ParamByName('@Str9').Value := Str9;
      Parameters.ParamByName('@Str10').Value := Str10;
      Parameters.ParamByName('@Str11').Value := Str11;
      Parameters.ParamByName('@Str12').Value := Str12;
      Parameters.ParamByName('@Str13').Value := Str13;
      Parameters.ParamByName('@Str14').Value := Str14;
      Parameters.ParamByName('@Str15').Value := Str15;

      Parameters.ParamByName('@Date1').Value := Date1;
      Parameters.ParamByName('@Date2').Value := Date2;
      Parameters.ParamByName('@Date3').Value := Date3;
      Parameters.ParamByName('@Date4').Value := Date4;
      Parameters.ParamByName('@Date5').Value := Date5;
      Parameters.ParamByName('@Date6').Value := Date6;
      Parameters.ParamByName('@Date7').Value := Date7;
      Parameters.ParamByName('@Date8').Value := Date8;
      Parameters.ParamByName('@Date9').Value := Date9;
      Parameters.ParamByName('@Date10').Value := Date10;
      Parameters.ParamByName('@Date11').Value := Date11;
      Parameters.ParamByName('@Date12').Value := Date12;
      Parameters.ParamByName('@Date13').Value := Date13;
      Parameters.ParamByName('@Date14').Value := Date14;
      Parameters.ParamByName('@Date15').Value := Date15;

      Parameters.ParamByName('@id_FormalDistrib').Value := id_FormalDistrib;
      Parameters.ParamByName('@id_FuncDistrib').Value := id_FuncDistrib;

      Parameters.ParamByName('@id_OperParent').Value := Null;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TReplDM.PR_OPerComment(id_LC_Oper, CommentType: Integer; Comment,
  id_User: OleVariant): Integer;
begin

end;

procedure TReplDM.Inv_ProjectAdd(AName: OleVariant; id_User, PrjNum,
  PrjDate, CalcDate, Amount1, Amount2, Inv1, Inv2, Price,
  Param11: Integer);
begin

end;

function TReplDM.Inv_GetID(id_lc: Integer): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'RP_Inv_GetID';
      Parameters.Refresh;
      Parameters.ParamByName('@id_lc').Value := id_lc;

      Open;
      if not IsEmpty then
        Result := FieldByName('id_Project').AsInteger;
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TReplDM.INV_TimeItemAdd(Val, ValPlan, id_TimeDict,
  id_Project: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'INV_TimeItemAdd';
      Parameters.Refresh;

      Parameters.ParamByName('@Val').Value := Val;
      Parameters.ParamByName('@ValPlan').Value := ValPlan;
      Parameters.ParamByName('@id_TimeDict').Value := id_TimeDict;
      Parameters.ParamByName('@id_Project').Value := id_Project;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TReplDM.Inv_WareAdd(id_Project, id_Goods, id_Measure, id_Manufact,
  AmountPlan, PricePlan, Amount, Summ: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'Inv_WareAdd';
      Parameters.Refresh;

      Parameters.ParamByName('@id_Project').Value := id_Project;
      Parameters.ParamByName('@id_Goods').Value := id_Goods;
      Parameters.ParamByName('@id_Measure').Value := id_Measure;
      Parameters.ParamByName('@id_Manufact').Value := id_Manufact;

      Parameters.ParamByName('@AmountPlan').Value := AmountPlan;
      Parameters.ParamByName('@PricePlan').Value := PricePlan;
      Parameters.ParamByName('@Amount').Value := Amount;
      Parameters.ParamByName('@Summ').Value := Summ;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

procedure TReplDM.SetFBaseName(AAA: OleVariant);
begin
  FBaseName := AAA;
end;

procedure TReplDM.SetFPassword(Param1: OleVariant);
begin
  FPassword := Param1;
end;

procedure TReplDM.SetIC(Param1: OleVariant);
begin
  IC := Param1;
end;

function TReplDM.INV_TimeItemEdit_F(id_TimeItem: Integer;
  Val: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'INV_TimeItemEdit_F';
      Parameters.Refresh;

      Parameters.ParamByName('@Val').Value := Val;
      Parameters.ParamByName('@id_TimeItem').Value := id_TimeItem;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TReplDM.RP_OperAdd_v223(OperVid: Integer; DateLocal,
  id_business: OleVariant; Correct, OperTypeIn: WordBool; Id_CurrencyOper,
  PriceFinOper, Id_CurrencySys, SummSysFin, id_Acc, id_Acc_Ext,
  id_Warehouse, id_Warehouse_Ext, id_Manufact, id_Manufact_Ext, id_Repr,
  id_UserCreator: OleVariant; id_Replicator: Integer; id_DocType,
  Imp_PayBasic, AccInv_PayAssignment, Contract, OpComment,
  id_LC_Oper: OleVariant; Koeff: Integer; Dig1, Dig2, Dig3, Dig4, Dig5,
  Dig6, Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, Str1,
  Str2, Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12,
  Str13, Str14, Str15, Date1, Date2, Date3, Date4, Date5, Date6, Date7,
  Date8, Date9, Date10, Date11, Date12, Date13, Date14, Date15,
  id_FormalDistrib, id_FuncDistrib, id_OperParent: OleVariant): Integer;
begin
  Result := -1;
  with spAddOper_v22 do
  begin
    try
      Close;
      Parameters.ParamByName('@OperVid').Value := OperVid;
      Parameters.ParamByName('@DateLocal').Value := DateLocal;
      Parameters.ParamByName('@id_business').Value := id_business;
      Parameters.ParamByName('@Correct').Value := Correct;
      Parameters.ParamByName('@OperTypeIn').Value := OperTypeIn;
      Parameters.ParamByName('@Id_CurrencyOper').Value := Id_CurrencyOper;
      Parameters.ParamByName('@PriceFinOper').Value := PriceFinOper;
      Parameters.ParamByName('@Id_CurrencySys').Value := Id_CurrencySys;
      Parameters.ParamByName('@SummSysFin').Value := SummSysFin;
      Parameters.ParamByName('@id_Acc').Value := id_Acc;
      Parameters.ParamByName('@id_Acc_Ext').Value := id_Acc_Ext;
      Parameters.ParamByName('@id_Warehouse').Value := id_Warehouse;
      Parameters.ParamByName('@id_Warehouse_Ext').Value := id_Warehouse_Ext;
      Parameters.ParamByName('@id_Manufact').Value := id_Manufact;
      Parameters.ParamByName('@id_Manufact_Ext').Value := id_Manufact_Ext;
      Parameters.ParamByName('@id_Repr').Value := id_Repr;
      Parameters.ParamByName('@id_UserCreator').Value := id_UserCreator;
      Parameters.ParamByName('@id_Replicator').Value := id_Replicator;
      Parameters.ParamByName('@id_DocType').Value := id_DocType;
      Parameters.ParamByName('@Imp_PayBasic').Value := Imp_PayBasic;
      Parameters.ParamByName('@AccInv_PayAssignment').Value := AccInv_PayAssignment;
      Parameters.ParamByName('@Contract').Value := Contract;
      Parameters.ParamByName('@OpComment').Value := OpComment;
      Parameters.ParamByName('@id_LC_Oper').Value := id_LC_Oper;

      Parameters.ParamByName('@Koeff').Value := Koeff;

      Parameters.ParamByName('@Dig1').Value := Dig1;
      Parameters.ParamByName('@Dig2').Value := Dig2;
      Parameters.ParamByName('@Dig3').Value := Dig3;
      Parameters.ParamByName('@Dig4').Value := Dig4;
      Parameters.ParamByName('@Dig5').Value := Dig5;
      Parameters.ParamByName('@Dig6').Value := Dig6;
      Parameters.ParamByName('@Dig7').Value := Dig7;
      Parameters.ParamByName('@Dig8').Value := Dig8;
      Parameters.ParamByName('@Dig9').Value := Dig9;
      Parameters.ParamByName('@Dig10').Value := Dig10;
      Parameters.ParamByName('@Dig11').Value := Dig11;
      Parameters.ParamByName('@Dig12').Value := Dig12;
      Parameters.ParamByName('@Dig13').Value := Dig13;
      Parameters.ParamByName('@Dig14').Value := Dig14;
      Parameters.ParamByName('@Dig15').Value := Dig15;

      Parameters.ParamByName('@Str1').Value := Str1;
      Parameters.ParamByName('@Str2').Value := Str2;
      Parameters.ParamByName('@Str3').Value := Str3;
      Parameters.ParamByName('@Str4').Value := Str4;
      Parameters.ParamByName('@Str5').Value := Str5;
      Parameters.ParamByName('@Str6').Value := Str6;
      Parameters.ParamByName('@Str7').Value := Str7;
      Parameters.ParamByName('@Str8').Value := Str8;
      Parameters.ParamByName('@Str9').Value := Str9;
      Parameters.ParamByName('@Str10').Value := Str10;
      Parameters.ParamByName('@Str11').Value := Str11;
      Parameters.ParamByName('@Str12').Value := Str12;
      Parameters.ParamByName('@Str13').Value := Str13;
      Parameters.ParamByName('@Str14').Value := Str14;
      Parameters.ParamByName('@Str15').Value := Str15;

      Parameters.ParamByName('@Date1').Value := Date1;
      Parameters.ParamByName('@Date2').Value := Date2;
      Parameters.ParamByName('@Date3').Value := Date3;
      Parameters.ParamByName('@Date4').Value := Date4;
      Parameters.ParamByName('@Date5').Value := Date5;
      Parameters.ParamByName('@Date6').Value := Date6;
      Parameters.ParamByName('@Date7').Value := Date7;
      Parameters.ParamByName('@Date8').Value := Date8;
      Parameters.ParamByName('@Date9').Value := Date9;
      Parameters.ParamByName('@Date10').Value := Date10;
      Parameters.ParamByName('@Date11').Value := Date11;
      Parameters.ParamByName('@Date12').Value := Date12;
      Parameters.ParamByName('@Date13').Value := Date13;
      Parameters.ParamByName('@Date14').Value := Date14;
      Parameters.ParamByName('@Date15').Value := Date15;

      Parameters.ParamByName('@id_FormalDistrib').Value := id_FormalDistrib;
      Parameters.ParamByName('@id_FuncDistrib').Value := id_FuncDistrib;

      Parameters.ParamByName('@id_OperParent').Value := id_OperParent;
      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TReplDM.RP_v2_ContrAgent_Add_X(AName: OleVariant;
  id_Business: Integer; Deleted: WordBool; id_CAGroup: OleVariant;
  ID_ContrAgent: Integer; Addr, Descr: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'RP_v2_ContrAgent_Add_X';
      Parameters.Refresh;

      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@id_Business').Value := id_Business;
      Parameters.ParamByName('@Deleted').Value := Deleted;
      Parameters.ParamByName('@id_CAGroup').Value := id_CAGroup;
      Parameters.ParamByName('@ID_ContrAgent').Value := ID_ContrAgent;
      Parameters.ParamByName('@Addr').Value := Addr;
      Parameters.ParamByName('@Descr').Value := Descr;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TReplDM,
    Class_ReplDM, ciMultiInstance, tmApartment);
end.
