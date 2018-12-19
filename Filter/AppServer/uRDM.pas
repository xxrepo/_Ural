unit uRDM;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, UNFilterApp_TLB, StdVcl, Db, ADODB,
  inifiles, Provider, MtUPDPrv, RxMemDS;

type
  THackAdoDataSet = class(TCustomADODataSet)
    property CommandTimeout;
  end;
  TUnFilter = class(TRemoteDataModule, IUnFilter)
    ADOConnection1: TADOConnection;
    ADOStoredProc1: TADOStoredProc;
    SQLUpdateDSProvider1: TSQLUpdateDSProvider;
    spWhoIAm: TADOStoredProc;
    spWhoIAmid_user: TAutoIncField;
    spWhoIAmLogin: TStringField;
    spWhoIAmFirstName: TStringField;
    spWhoIAmLastName: TStringField;
    spWhoIAmMiddleName: TStringField;
    spWhoIAmDisabled: TBooleanField;
    spGetObj: TADOStoredProc;
    dsGetObj: TDataSetProvider;
    spGetUnivPropList: TADOStoredProc;
    dsGetUnivPropList: TDataSetProvider;
    dsGrp: TDataSetProvider;
    spGrp: TADOStoredProc;
    dsAggs: TDataSetProvider;
    spAggs: TADOStoredProc;
    dsFltProp: TDataSetProvider;
    spFltProp: TADOStoredProc;
    spFltPropid_Filter: TAutoIncField;
    spFltPropName: TStringField;
    spFltPropid_User: TIntegerField;
    spFltPropDateCreate: TDateTimeField;
    spFltPropLastModified: TDateTimeField;
    dsCond: TDataSetProvider;
    spCond: TADOStoredProc;
    dsObj: TDataSetProvider;
    spObj: TADOStoredProc;
    spObjID: TIntegerField;
    spObjName: TStringField;
    spGetObjid_Rel: TAutoIncField;
    spGetObjid_Obj: TIntegerField;
    spGetObjid_RelParent: TIntegerField;
    spGetObjRelName: TStringField;
    spGetObjisDetail: TBooleanField;
    dsFltList: TDataSetProvider;
    spFltList: TADOStoredProc;
    spGetObjTableName: TStringField;
    spGetObjRelField: TStringField;
    spGetObjKeyField: TStringField;
    spGetObjMinLen: TIntegerField;
    spGetData: TADOStoredProc;
    dsGetData: TDataSetProvider;
    dsSQLStr: TDataSetProvider;
    spSQLStr: TADOStoredProc;
    spSQLStrisDetail: TBooleanField;
    spSQLStrid_RelParent: TIntegerField;
    spSQLStrid_Prop: TIntegerField;
    spSQLStrFieldName: TStringField;
    spSQLStrFieldType: TStringField;
    spSQLStrid_Rel: TIntegerField;
    spSQLStrCondCode: TIntegerField;
    spSQLStrPar1: TStringField;
    spSQLStrPar2: TStringField;
    spSQLStrTableName: TStringField;
    spSQLStrRelField: TStringField;
    spSQLStrKeyField: TStringField;
    spSQLStrid_Obj: TIntegerField;
    spFltPropid_univ: TIntegerField;
    spFltPropid_business: TIntegerField;
    spFltPropBsnName: TStringField;
    spSQLStrid_business: TIntegerField;
    dsOperExtDataNamez: TDataSetProvider;
    spOperExtDataNamez: TADOStoredProc;
    spGetUnivPropListid_Obj: TIntegerField;
    spGetUnivPropListid_Prop: TAutoIncField;
    spGetUnivPropListFieldType: TStringField;
    spGetUnivPropListFieldDescr: TStringField;
    spGetUnivPropListFieldName: TStringField;
    spGetUnivPropListNeedAlias: TBooleanField;
    spGetObjisExtParam: TBooleanField;
    spSQLStrisExtParam: TBooleanField;
    spGetObjExtID: TIntegerField;
    dsCondList: TDataSetProvider;
    spCondList: TADOStoredProc;
    spCondListCondNum: TIntegerField;
    spCondid_Cond: TAutoIncField;
    spCondid_Filter: TIntegerField;
    spCondid_Obj: TIntegerField;
    spCondid_Prop: TIntegerField;
    spCondid_Rel: TIntegerField;
    spCondCondCode: TIntegerField;
    spCondPar1: TStringField;
    spCondPar2: TStringField;
    spCondCondNum: TIntegerField;
    spCond_v2: TADOStoredProc;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField6: TIntegerField;
    dsCond_v2: TDataSetProvider;
    spGetData2: TADOStoredProc;
    dsGetData2: TDataSetProvider;
    spSQLStrCondNum: TIntegerField;
    spObjid_bsn: TIntegerField;
    spGetObjNameField: TStringField;
    spGrpid_Filter: TIntegerField;
    spGrpid_Prop: TIntegerField;
    spGrpid_Obj: TIntegerField;
    spGrpid_Rel: TIntegerField;
    spAggsid_Aggs: TAutoIncField;
    spAggsid_Filter: TIntegerField;
    spAggsid_Prop: TIntegerField;
    spAggsid_Rel: TIntegerField;
    spAggsAggCode: TIntegerField;
    spGetDataTree: TADOStoredProc;
    dsGetDataTree: TDataSetProvider;
    spGetData2id_Oper: TIntegerField;
    spGetData2id_OperParent: TIntegerField;
    spGetData2id_old_Oper: TIntegerField;
    spGetData2DateCreate: TDateTimeField;
    spGetData2id_LC_Oper: TIntegerField;
    spGetData2OperVid: TIntegerField;
    spGetData2id_Replicator: TIntegerField;
    spGetData2ReplicatorShortName: TStringField;
    spGetData2id_UserCreator: TIntegerField;
    spGetData2id_business: TIntegerField;
    spGetData2Id_CurrencyBsn: TIntegerField;
    spGetData2BusinessName: TStringField;
    spGetData2BusinessNum: TStringField;
    spGetData2DateLocal: TDateTimeField;
    spGetData2Correct: TBooleanField;
    spGetData2OperTypeIn: TBooleanField;
    spGetData2Id_CurrencyOper: TIntegerField;
    spGetData2CurrencyOperName: TStringField;
    spGetData2CurrencyOperShortName: TStringField;
    spGetData2AmountOper: TFloatField;
    spGetData2AmountOper2: TFloatField;
    spGetData2PriceOper: TFloatField;
    spGetData2RateOper: TFloatField;
    spGetData2id_Measure: TIntegerField;
    spGetData2MeasureName: TStringField;
    spGetData2RealKoef: TFloatField;
    spGetData2AmountOperBaseMS: TFloatField;
    spGetData2Id_CurrencySys: TIntegerField;
    spGetData2CurrencySysName: TStringField;
    spGetData2CurrencySysShortName: TStringField;
    spGetData2SummSys: TFloatField;
    spGetData2RateSys: TFloatField;
    spGetData2id_Acc: TIntegerField;
    spGetData2id_Warehouse: TIntegerField;
    spGetData2id_Manufact: TIntegerField;
    spGetData2SrcName: TStringField;
    spGetData2SrcID_Main: TIntegerField;
    spGetData2id_Repr: TIntegerField;
    spGetData2id_Acc_Ext: TIntegerField;
    spGetData2id_Warehouse_Ext: TIntegerField;
    spGetData2id_Manufact_Ext: TIntegerField;
    spGetData2ReprName: TStringField;
    spGetData2ReprID_Main: TIntegerField;
    spGetData2Id_CurrencyInv: TIntegerField;
    spGetData2PriceInv: TFloatField;
    spGetData2RateInv: TFloatField;
    spGetData2CurrencyInvName: TStringField;
    spGetData2CurrencyInvShortName: TStringField;
    spGetData2id_Goods: TIntegerField;
    spGetData2WareName: TStringField;
    spGetData2WareID_Main: TIntegerField;
    spGetData2Koeff: TIntegerField;
    spGetData2KoeffName: TStringField;
    spGetData2CheckDate: TDateTimeField;
    spGetData2id_UserChecker: TIntegerField;
    spGetData2id_FormalDistrib: TIntegerField;
    spGetData2FormalDistribName: TStringField;
    spGetData2id_FuncDistrib: TIntegerField;
    spGetData2FuncDistribName: TStringField;
    spGetData2Deleted: TBooleanField;
    spGetData2id_ContrAgent: TIntegerField;
    spGetData2ContrAgentName: TStringField;
    spGetData2id_CAGroup: TIntegerField;
    spGetData2SummOper: TFloatField;
    spGetData2TypeName: TStringField;
    spGetData2OperNum: TStringField;
    spGetData2OperDelta: TFloatField;
    spGetData2OperRateDelta: TFloatField;
    spGetData2OperTotalDelta: TFloatField;
    spGetData2DTDiff: TIntegerField;
    spGetData2HasViza: TBooleanField;
    spGetData2OperState: TIntegerField;
    spGetData2HidedOper: TBooleanField;
    spGetData2OperSummSys: TFloatField;
    spGetData2RateMain: TFloatField;
    spGetData2id_Repr_Ex: TIntegerField;
    spGetData2id_DocType: TIntegerField;
    spGetData2Imp_PayBasic: TStringField;
    spGetData2AccInv_PayAssignment: TStringField;
    spGetData2Contract: TStringField;
    spGetData2OperDeltaCrn: TFloatField;
    spGetData2OperRateDeltaCrn: TFloatField;
    spGetData2OperTotalDeltaCrn: TFloatField;
    spGetData2OperCrnName: TStringField;
    spGetData2OperSum_Offer: TFloatField;
    spGetData2CRN_OLD_OperSum: TFloatField;
    spGetData2CRN_OLD_OperSum_Offer: TFloatField;
    spGetData2CRN_OperSum_Inv: TFloatField;
    spGetData2OperSumCalced: TFloatField;
    spGetData2OperSum_OfferCalced: TFloatField;
    spGetData2Blocked: TBooleanField;
    spGetData2CurrencyBsnName: TStringField;
    spGetData2id_Ctg_Goods_2: TIntegerField;
    spGetData2OpComment: TStringField;
    spGetData2RealDataCreate: TDateTimeField;
    spGetData2OperTypeSIGN: TIntegerField;
    spGetData2HasChild: TIntegerField;
    spGetData2Dig1: TFloatField;
    spGetData2Dig2: TFloatField;
    spGetData2Dig3: TFloatField;
    spGetData2Dig4: TFloatField;
    spGetData2Dig5: TFloatField;
    spGetData2Dig6: TFloatField;
    spGetData2Dig7: TFloatField;
    spGetData2Dig8: TFloatField;
    spGetData2Dig9: TFloatField;
    spGetData2Dig10: TFloatField;
    spGetData2Dig11: TFloatField;
    spGetData2Dig12: TFloatField;
    spGetData2Dig13: TFloatField;
    spGetData2Dig14: TFloatField;
    spGetData2Dig15: TFloatField;
    spGetData2Str1: TStringField;
    spGetData2Str2: TStringField;
    spGetData2Str3: TStringField;
    spGetData2Str4: TStringField;
    spGetData2Str5: TStringField;
    spGetData2Str6: TStringField;
    spGetData2Str7: TStringField;
    spGetData2Str8: TStringField;
    spGetData2Str9: TStringField;
    spGetData2Str10: TStringField;
    spGetData2Str11: TStringField;
    spGetData2Str12: TStringField;
    spGetData2Str13: TStringField;
    spGetData2Str14: TStringField;
    spGetData2Str15: TStringField;
    spGetData2id_OperWare: TAutoIncField;
    spGetData2OperVidName: TStringField;
    spGetData2CRN_OperSumRez: TFloatField;
    spGetData2OnlyDate: TDateTimeField;
    spGetData2is_Mirr: TBooleanField;
    spGetData2id_Acc_Group: TIntegerField;
    spGetData2id_Warehouse_Group: TIntegerField;
    spGetData2id_Manufact_Group: TIntegerField;
    spGetData2VatIn: TBooleanField;
    spGetData2AutoGen: TBooleanField;
    spGetData2CreatorFIO: TStringField;
    spGetData2CheckerFIO: TStringField;
    spGetData2ID_Oper_1: TIntegerField;
    spGetData2id_OperWare_1: TIntegerField;
    spGetData2is_Mirr_1: TBooleanField;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure SQLUpdateDSUpdateError(Sender: TObject;
      DataSet: TClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    FDataBaseName : String;
    procedure LogMessage(Message: String; EventType: DWord = 1; Category: Word = 0; ID: DWord = 0);
  protected
    Fid_User : Variant;

    FBaseName : String;
    FUserName, FPassword: String;
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function DoLogin(UserName, Password: OleVariant): Integer; safecall;
    function GetUnivObjID(id_Univ: Integer): Integer; safecall;
    procedure BeginTrans; safecall;
    procedure CommitTrans; safecall;
    procedure RollbackTrans; safecall;
    function FilterDel(id_Filter: Integer): Integer; safecall;
    function FLT_ColumnsAdd(id_Filter, id_Prop: Integer;
      id_Rel: OleVariant): Integer; safecall;
    function FLT_GroupAdd(id_Filter: Integer; id_Rel, id_Obj,
      id_Prop: OleVariant): Integer; safecall;
    function FLT_OrderAdd(id_Filter, id_Prop: Integer;
      id_Rel: OleVariant): Integer; safecall;
    function FLT_FilterAdd(AName: OleVariant; id_Univ: Integer;
      id_business: OleVariant): Integer; safecall;
    function FLT_FilterEdit(id_Filter: Integer; AName,
      id_business: OleVariant): Integer; safecall;
    function FLT_CondAdd(id_Filter: Integer; id_Obj, id_Prop,
      id_Rel: OleVariant; CondCode: Integer; Par1,
      Par2: OleVariant): Integer; safecall;
    function FLT_ObjGetProp(id_Obj, ID: Integer;
      out AName: OleVariant): Integer; safecall;
    function Get_FIO: OleVariant; safecall;
    function GetFilterName(id_Flt: Integer): OleVariant; safecall;
    function FilterClear(id_Filter: Integer): Integer; safecall;
    function FLT_CondAdd2(id_Filter: Integer; id_Obj, id_Prop,
      id_Rel: OleVariant; CondCode: Integer; Par1, Par2: OleVariant;
      CondNum: Integer): Integer; safecall;
    function FLT_AggAdd(id_Filter: Integer; id_Rel, id_Prop: OleVariant;
      AggCode: Integer): Integer; safecall;
    procedure LC_SetBaseName(AName: OleVariant); safecall;
    procedure SetBaseName(AName, AUserName, APassword: OleVariant); safecall;
  public
    FFullFio : String;
    CreateDate : TDateTime;
  end;

implementation

uses uSvc, uMeCrpt, tstSvcForm;

{$R *.DFM}

class procedure TUnFilter.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

function TUnFilter.DoLogin(UserName, Password: OleVariant): Integer;
begin
  with ADOConnection1 do
  begin
   Connected := false;
   ConnectionString := 'Provider=SQLOLEDB.1;Password="' +
     String(FPassword) + '";Persist Security Info=True;User ID=' +
     String(FUserName) + ';Initial Catalog=' +
     String(FDataBaseName)
     + ';Data Source=' + FBaseName +
                        ';Use Procedure for Prepare=1;Auto Translate=True;Application Name=' +Self.Name + '4.0;Packet Size=4096;';
     if String(FPassword) = '' then
    ConnectionString := 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;User ID=sa;Initial Catalog=ACS_MBase;Data Source=coalserv';

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
         if FieldByName('Disabled').AsBoolean then
           raise Exception.Create('Запрещен вход пользователю ' + UserName);

         Fid_User := FieldByName('id_User').AsVariant;
         FFullFio := FieldByName('LastName').AsString + ' ' + FieldByName('FirstName').AsString + ' ' + FieldByName('MiddleName').AsString;
         Result := 1;
       finally
         Close;
       end;
     end;  
   except
     on E : Exception do
     begin
       Result := 26;
       LogMessage('DoLogin, ' + FUserName+ ' '  + FPassword + ' '  + E.Message, EVENTLOG_ERROR_TYPE, 1, 1);
       raise Exception.Create('DoLogin, ' + FUserName+ ' '  + FPassword + ' ' + FDataBaseName + ' ' + E.Message);
     end;
   end;
 end;
end;

procedure TUnFilter.RemoteDataModuleCreate(Sender: TObject);
var Buffer : PChar;
    Len : DWORD;
    CmpName : String;
    i : integer;

    IniFile : TIniFile;
    S : String;
    SL : TStringList;
begin
  CreateDate := Now;
  SvcForm.AddRDM(Self);
  FDataBaseName := 'ACS_MBase';
  THackAdoDataSet(spGetData2).CommandTimeout := 60*3;
  Fid_User := Null;
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
  FPassword := 'trustnoone';
  
  S := ExtractFilePath(ParamStr(0)) + 'Key.ack';
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
    S := ExpandFileName(ParamStr(0));
    Delete(S, Length(S) - 2, 3);
    S := S + 'ini';
    if  FileExists(S) then
    begin
      IniFile := TIniFile.Create(S);
      try
        with IniFile do
        begin
          FBaseName := ReadString('Base', 'DB', '127.0.0.1');
          FUserName := ReadString('Base', 'UserName', 'sa');
          FPassword := ReadString('Base', 'Password', 'trustnoone');
        end;
      finally
        IniFile.Free;
      end;
    end;
  end;
// ****************************************************************************
end;

procedure TUnFilter.LogMessage(Message: String; EventType: DWord;
  Category: Word; ID: DWord);
begin
  ural_FLT.LogMessage(Message, EventType, Category, ID);
end;

procedure TUnFilter.SQLUpdateDSUpdateError(Sender: TObject;
  DataSet: TClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
//*
end;

function TUnFilter.GetUnivObjID(id_Univ: Integer): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'FLT_GetUnivObjID';
      Parameters.Refresh;
      Parameters.ParamByName('@id_Univ').Value := id_Univ;

      Open;
      if (not IsEmpty) and not FieldByName('id_Obj').IsNull then
        Result := FieldByName('id_Obj').AsInteger;
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

procedure TUnFilter.BeginTrans;
begin
  ADOConnection1.BeginTrans;
end;

procedure TUnFilter.CommitTrans;
begin
  ADOConnection1.CommitTrans;
end;

procedure TUnFilter.RollbackTrans;
begin
  ADOConnection1.RollbackTrans;
end;

function TUnFilter.FilterDel(id_Filter: Integer): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'FLT_FLT_FilterDel_All';
      Parameters.Refresh;
      Parameters.ParamByName('@id_Filter').Value := id_Filter;

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

function TUnFilter.FLT_ColumnsAdd(id_Filter, id_Prop: Integer;
  id_Rel: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'FLT_FLT_ColumnsAdd';
      Parameters.Refresh;
      Parameters.ParamByName('@id_Filter').Value := id_Filter;
      Parameters.ParamByName('@id_Prop').Value := id_Prop;
      Parameters.ParamByName('@id_Rel').Value := id_Rel;

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

function TUnFilter.FLT_GroupAdd(id_Filter: Integer; id_Rel, id_Obj,
  id_Prop: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'FLT_FLT_GroupAdd';
      Parameters.Refresh;
      Parameters.ParamByName('@id_Filter').Value := id_Filter;
      Parameters.ParamByName('@id_Rel').Value := id_Rel;
      Parameters.ParamByName('@id_Obj').Value := id_Obj;
      Parameters.ParamByName('@id_Prop').Value := id_Prop;

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

function TUnFilter.FLT_OrderAdd(id_Filter, id_Prop: Integer;
  id_Rel: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'FLT_FLT_OrderAdd';
      Parameters.Refresh;
      Parameters.ParamByName('@id_Filter').Value := id_Filter;
      Parameters.ParamByName('@id_Prop').Value := id_Prop;
      Parameters.ParamByName('@id_Rel').Value := id_Rel;

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

function TUnFilter.FLT_FilterAdd(AName: OleVariant; id_Univ: Integer;
  id_business: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'FLT_FLT_FilterAdd';
      Parameters.Refresh;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@id_Univ').Value := id_Univ;
      Parameters.ParamByName('@id_User').Value := Fid_User;
      Parameters.ParamByName('@id_business').Value := id_business;

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

function TUnFilter.FLT_FilterEdit(id_Filter: Integer; AName,
  id_business: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'FLT_FLT_FilterEdit';
      Parameters.Refresh;
      Parameters.ParamByName('@id_Filter').Value := id_Filter;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@id_User').Value := Fid_User;
      Parameters.ParamByName('@id_business').Value := id_business;

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

function TUnFilter.FLT_CondAdd(id_Filter: Integer; id_Obj, id_Prop,
  id_Rel: OleVariant; CondCode: Integer; Par1, Par2: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'FLT_FLT_CondAdd';
      Parameters.Refresh;
      Parameters.ParamByName('@id_Filter').Value := id_Filter;
      Parameters.ParamByName('@id_Obj').Value := id_Obj;
      Parameters.ParamByName('@id_Prop').Value := id_Prop;
      Parameters.ParamByName('@id_Rel').Value := id_Rel;

      Parameters.ParamByName('@CondCode').Value := CondCode;
      Parameters.ParamByName('@Par1').Value := Par1;
      Parameters.ParamByName('@Par2').Value := Par2;

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

function TUnFilter.FLT_ObjGetProp(id_Obj, ID: Integer;
  out AName: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'FLT_FLT_ObjGetProp';
      Parameters.Refresh;
      Parameters.ParamByName('@id_Obj').Value := id_Obj;
      Parameters.ParamByName('@ID').Value := ID;

      Open;
      Result := 1;
      AName := FieldByName('Name').AsString;
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

function TUnFilter.Get_FIO: OleVariant;
begin
  Result := FFullFio;
end;

function TUnFilter.GetFilterName(id_Flt: Integer): OleVariant;
begin
  Result := '';
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'FLT_FLT_FilterGetProp';
      Parameters.Refresh;
      Parameters.ParamByName('@id_Filter').Value := id_Flt;

      Open;
      try
        Result := FieldByName('Name').AsString;
        if not FieldByName('BsnName').IsNull then
          Result := Result + ', бизнес ' + FieldByName('BsnName').AsString;
      finally
        Close;
      end;
    except
      on E : Exception do
      begin
        Result := '';
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TUnFilter.FilterClear(id_Filter: Integer): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'FLT_FLT_FilterDel';
      Parameters.Refresh;
      Parameters.ParamByName('@id_Filter').Value := id_Filter;

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

function TUnFilter.FLT_CondAdd2(id_Filter: Integer; id_Obj, id_Prop,
  id_Rel: OleVariant; CondCode: Integer; Par1, Par2: OleVariant;
  CondNum: Integer): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'FLT_FLT_CondAdd';
      Parameters.Refresh;
      Parameters.ParamByName('@id_Filter').Value := id_Filter;
      Parameters.ParamByName('@id_Obj').Value := id_Obj;
      Parameters.ParamByName('@id_Prop').Value := id_Prop;
      Parameters.ParamByName('@id_Rel').Value := id_Rel;

      Parameters.ParamByName('@CondCode').Value := CondCode;
      Parameters.ParamByName('@Par1').Value := Par1;
      Parameters.ParamByName('@Par2').Value := Par2;
      Parameters.ParamByName('@CondNum').Value := CondNum;

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

function TUnFilter.FLT_AggAdd(id_Filter: Integer; id_Rel,
  id_Prop: OleVariant; AggCode: Integer): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'FLT_FLT_AggsAdd';
      Parameters.Refresh;
      Parameters.ParamByName('@id_Filter').Value := id_Filter;
      Parameters.ParamByName('@id_Rel').Value := id_Rel;
      Parameters.ParamByName('@id_Prop').Value := id_Prop;
      Parameters.ParamByName('@AggCode').Value := AggCode;

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

procedure TUnFilter.LC_SetBaseName(AName: OleVariant);
begin
  FDataBaseName := AName;
end;

procedure TUnFilter.RemoteDataModuleDestroy(Sender: TObject);
begin
  SvcForm.RemoveRDM(Self);
end;

procedure TUnFilter.SetBaseName(AName, AUserName, APassword: OleVariant);
begin
  FBaseName := AName;
  FUserName := AUserName;
  FPassword := APassword;
end;

initialization
  TComponentFactory.Create(ComServer, TUnFilter, Class_UnFilter, ciMultiInstance, tmApartment);
end.
