unit uRDM_RM2;

interface
                               
uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, svcRM_TLB, StdVcl, MtUPDPrv, ADODB, Db, Provider;

type
  TRDM_RM2 = class(TRemoteDataModule, IRDM_RM2)
    ADOConnection1: TADOConnection;
    dsUsers: TDataSetProvider;
    spUser: TADOQuery;
    spWhoIAm: TADOQuery;
    spWhoIAmID_USER: TBCDField;
    spWhoIAmFIO: TWideStringField;
    spWhoIAmDELETED: TBCDField;
    spWhoIAmISADMIN: TBCDField;
    spWhoIAmLOGIN: TWideStringField;
    spWhoIAmPSW: TWideStringField;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    Fid_User : variant;
    XXXIsManual : integer;
    procedure LogMessage(Message: String; EventType: DWord = 1; Category: Word = 0; ID: DWord = 0);

    procedure AddToProt(AMsg : String; id_prsn : integer = -1);
    function ExecSQL(ASQL: String) : Boolean;
    function GetMaxID(ASQL: String): integer;
    function GetMaxVal(ASQL: String): Variant;
    function ExecSQLText(ASQL: OleVariant): Integer; safecall;
    procedure SaveInlll(BONUSRULESNAME, SSS: string;
      id_BonusRules, isManual: integer);
    function GetAccSumm(id_Acc: integer; AAll : boolean = true): integer;
    procedure DoBonusByBall(id_BonusRules: Integer; id_Bill: OleVariant);
    procedure DoUpdateStatAcc(id_Acc: Integer); safecall;
    procedure UpdateStatAcc(id_Acc: integer);
    function Int_DoBonus(id_BonusRules: Integer; id_Bill,
      ADate: OleVariant): Integer;
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function DoLogin(UserName, Password: OleVariant): Integer; safecall;
     procedure BeginTruns; safecall;
    procedure CommitTrans; safecall;
    procedure RollbackTrans; safecall;
    procedure SetUserGroups(ID: Integer; IDs: OleVariant); safecall;

    function PL_CatEdit(id_Cat: Integer; PID, AName: OleVariant;
      AType: Integer): Integer; safecall;
    function PL_CatDel(id_Cat: Integer): Integer; safecall;
    function PL_GoodsDel(id_Goods: Integer): Integer; safecall;
    function PL_GoodsEdit(id_Goods: Integer; GOODSNAME, BarCode, id_GoodsCat,
      Price, Ball, ExtKey, ExtKey2, AInfo: OleVariant): Integer; safecall;
    function PrsnEdit(ID_PRSN: Integer; FIO_F, FIO_I, FIO_O, ID_SRC, PRSNNUM,
      PST_INDEX, PST_STREET, PST_HOME, PST_FLAT, DATEOPEN, PRSNCOMMENT,
      PRSNINFO, ID_CITY, BORNDATE, ID_ACC, STOPACTIVITY, FAMAMOUNT,
      SALARYBYPERSON, PHONEHOME, PHONEW, PHONEMOB: OleVariant;
      HASANKT: Integer; PPP_PRSNNUM, id_CityReg, X_Sex, email, p0, P1, P2,
      P3, P4, P5, P6, P7, P8, P9, AnctDate: OleVariant): Integer; safecall;
    procedure SetSQL(ASQL: OleVariant); safecall;
    function PrsnDel(id_Prsn: Integer): Integer; safecall;
    function AddAcc(AccNum: OleVariant): Integer; safecall;
    function RM_BillItemsEdit(id_BillItems: Integer; id_Bill, id_Goods, Amount,
      PriceBill, BallPrice, GoodsComment, BC: OleVariant): Integer;
      safecall;
    function RM_BillEdit(id_Bill: Integer; BillType, BillDate, ID_ACC, ID_PRSN,
      b0, b1, b2, b3, b4, b5, b6, b7, b8, b9: OleVariant): Integer;
      safecall;
    function GetConsts(ANAme: OleVariant): OleVariant; safecall;
    procedure SetConst(CnName, Val: OleVariant); safecall;
    procedure DoUpdateStat(id_Prsn: Integer); safecall;
    function EditMSG(id_Msg: Integer; MsgComment, ID_PRSN, isOK,
      id_Action: OleVariant): Integer; safecall;
    procedure DoIns(WHEIT, GoodsName, Price, Ball, BC, Grp: OleVariant);
      safecall;
    function BillDel(id_Bill: Integer): Integer; safecall;
    function BonusRulesDel(id_BonusRules: Integer): Integer; safecall;
    function BonusRulesEdit(id_BonusRules: Integer; id_Goods, id_GoodsCat,
      MinBCCount, MinBCAmountInLetter, MinPrice, MinGoodsCount, MinSumm,
      MinSummByPriod, MinBallSummInLetter, MinLetterCount, FirstCount,
      Ball, Ball_K, IsManual, BonusRulesName, BR_DateFrom, BR_DateTo, ASQL,
      Max_Val, is_DR: OleVariant): Integer; safecall;
    function DoBonus(id_BonusRules: Integer; id_Bill,
      ADate: OleVariant): Integer; safecall;
    function Get_NEXTVAL: Integer; safecall;
    function RM_BonusBill2Del(ID_BONUSBILL: Integer): Integer; safecall;
    function RM_BonusBill2Add(ID_BONUSBILL: Integer; BBName,
      BB_Date: OleVariant; BBall, ID_PRSN: Integer;
      id_P: OleVariant): Integer; safecall;
    function GetMaxID_XXX(ASQL: OleVariant): Integer; safecall;
    function RegEdit(id_Reg: Integer; RegName: OleVariant;
      RG_X: Integer): Integer; safecall;
    function RegDel(id_Reg: Integer): Integer; safecall;
    function CityEdit(id_City, id_Reg: Integer; CityNAme, PH_Code,
      PS_index: OleVariant): Integer; safecall;
    function CityDel(id_City: Integer): Integer; safecall;
    function ActEdit(id_Act: Integer; ActName, ActDateFrom, ActDateTo,
      AccDescr, ID_CITY: OleVariant; Param8: Integer): Integer; safecall;
    function ActDel(id_Act: Integer): Integer; safecall;
    procedure CityRegAdd; safecall;
    function Get_FIO: OleVariant; safecall;
    function Get_id_User: Integer; safecall;
    function GetCityFullName(id_City: Integer): OleVariant; safecall;
    function ListEdit(id_list: Integer; ListName: OleVariant): Integer;
      safecall;
    function GetVVVer: Integer; safecall;
    function ActionEdit(id_Action: Integer; ActName, ActDateFrom, ActDateTo,
      AccDescr, id_City: OleVariant): Integer; safecall;
    procedure DelBB(id_Bill: Integer); safecall;
    procedure DoMaxBonus(id_Bill: Integer); safecall;
    procedure SetSQLArc(SQL1, SQL2, SQL3: OleVariant); safecall;
    procedure SetIsManual(AIsManual: Integer); safecall;

  public
    FUserName, FPassword: String;
    FFullFIO : String;
    CreateDate : TDateTime;
    procedure SQLUpdateDSUpdateError(Sender: TObject;
      DataSet: TClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    function GetNEXTVAL: Integer;
    procedure SetUser(ADataSet : TDataSet = nil);

    procedure UpdateStat(id_Prsn : integer);
  end;

implementation

uses tstSvcForm, uEventLogger, uMeCrpt;

{$R *.DFM}
function TRDM_RM2.ExecSQLText(ASQL: OleVariant): Integer;
begin
  ExecSQL(ASQL);
end;

function TRDM_RM2.GetMaxID(ASQL: String): integer;
begin
  try
    with ADOQueryTmp do
    begin
      Close;
      try
        SQL.Clear;
        SQL.Add(ASQL);
        Open;
        Result := Fields[0].AsInteger
      finally
        Close;
      end;
    end;
  except
    Result := -1;
  end;

end;

function TRDM_RM2.GetMaxVal(ASQL: String): Variant;
begin
  try
    with ADOQueryTmp do
    begin
      Close;
      try
        SQL.Clear;
        SQL.Add(ASQL);
        Open;
        Result := Fields[0].AsVariant
      finally
        Close;
      end;
    end;
  except
    Result := -1;
  end;

end;

function TRDM_RM2.ExecSQL(ASQL: String) : boolean;
begin
  try
    with ADOQueryTmp do
    begin
      Close;
      try
        SQL.Clear;
        SQL.Add(ASQL);
        ExecSQL;
        Result := true;;
      finally
        Close;
      end;
    end;
  except
    on E : Exception do
    begin
      Result := false;
      LogMessage(ASQL + ' ' + E.Message);
    end;
  end;
end;


procedure TRDM_RM2.AddToProt(AMsg: String; id_prsn : integer);
var S : String;
    id_Prot : integer;
begin
  id_Prot := -1;
  with qqqTmpPRot do
  begin
    try
      Close;
      SQL.Text := 'select * from RM_Prot where id_Prot=' + IntToStr(id_Prot);
      Open;
      if id_Prot = -1 then
      begin
        id_Prot := GetNEXTVAL;
        Append;
        FieldByName('id_Prot').Value := id_Prot;
        SetUser(qqqTmpPRot);
      end
      else
        Edit;

      FieldByName('Msg').Value := AMsg;
      if id_prsn > 0 then
        FieldByName('id_prsn').Value := id_prsn;
 
      Post;
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage(E.Message);
   //     raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

procedure TRDM_RM2.LogMessage(Message: String; EventType: DWord;
  Category: Word; ID: DWord);
begin
  FEventLogger.LogMessage(Message, EventType, Category, ID);
  SaveInlll('ERROR_', Message, 0, 0);
end;

class procedure TRDM_RM2.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

procedure TRDM_RM2.SQLUpdateDSUpdateError(Sender: TObject;
  DataSet: TClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  LogMessage(E.Message, EVENTLOG_ERROR_TYPE);

end;

function TRDM_RM2.GetAccSumm(id_Acc: integer; AAll : boolean) : integer;
begin
  if AAll then
  begin
    with spBallCount do
    begin

      Close;
      Parameters.ParamByName('id_Acc').Value := id_Acc;
      Parameters.ParamByName('id_Prsn').Value := -1;
      Open ;

      Result   := FieldByName('cnt_In').AsInteger - FieldByName('CNT_OUT').AsInteger;
      Close;

    end;
  end
  else
  begin
    with spLetterCount do
    begin

      Close;
      Parameters.ParamByName('id_Acc').Value := id_Acc;
      Parameters.ParamByName('id_Prsn').Value := -1;
      Open ;

      Result   := FieldByName('cnt_In_OLD').AsInteger;// - FieldByName('CNT_OUT').AsInteger;
      Close;

    end;
  end;
end;

procedure TRDM_RM2.RemoteDataModuleCreate(Sender: TObject);
var Buffer : PChar;
    Len : DWORD;
    CmpName : String;
    i : integer;

    S : String;
    SL : TStringList;
begin
  XXXIsManual := -1;
  Fid_User := Null;
  CreateDate := Now;
  SvcForm.AddRDM(Self);

 // THackAdoDataSet(spArc2).CommandTimeout := 60*3;
 // THackAdoDataSet(spBal_v2).CommandTimeout := 60*3;

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
  FUserName := 'rm';
  FPassword := 'rm';

  S := ChangeFileExt(ParamStr(0), '.key');
  if  FileExists(S) then
  begin
    SL := TStringList.Create;
    try
      SL.Text := FileToStr(S);
      with SL do
      begin
        S := SL.Text;//Values['ConnectionString'];
      end;
      ADOConnection1.Close;
      ADOConnection1.ConnectionString := S;
    finally
      SL.Free;
    end;
  end;
//  else
 //   raise Exception.Create('Не найден файл-ключ ' + S);
// **************************************************************************** end;
{  with ADOConnection1 do
  begin
   Connected := false;
   ConnectionString := 'Provider=OraOLEDB.Oracle.1;Password=' +
     String(FPassword) + ';Persist Security Info=True;User ID=' +
     String(FUserName) + ';Data Source=orcl;Extended Properties=""';
   end; }
end;

function TRDM_RM2.GetNEXTVAL: Integer;
begin
  Result := -1;
  with qqqNEXTVAL do
  begin
    Open;
    Result := qqqNEXTVALID.AsInteger;
    Close;
  end;

end;

procedure TRDM_RM2.SetUser(ADataSet: TDataSet);
var AField : TField;
begin
  if ADataSet = nil then ADataSet := qqqTMP;
  AField := ADataSet.FindField('id_User');
  if AField <> nil then
    AField.AsInteger := Fid_User;
end;

procedure TRDM_RM2.UpdateStat(id_Prsn: integer);
var    XXXid_Acc, xxxAcSummm : integer;
begin
  with spStat do
  begin
    Parameters.ParamByName('pid_Prsn').Value := id_Prsn;
    try
      ExecProc;
    except
    end;

      XXXid_Acc := GetMaxID('select max(id_Acc) FROM RM_Prsn where ID_PRSN=' + IntToStr(id_Prsn));
      UpdateStatAcc(XXXid_Acc);

  end;
end;

procedure TRDM_RM2.DoUpdateStatAcc(id_Acc: Integer);
begin
  UpdateStatAcc(id_Acc);
end;

procedure TRDM_RM2.UpdateStatAcc(id_Acc: integer);
var  xxxAcSummm : integer;
begin
  xxxAcSummm := GetAccSumm(id_Acc);
  ExecSQL('update RM_Acc set ACCSUMM=' + IntToStr(xxxAcSummm) + ' where id_Acc=' + IntToStr(id_Acc));
end;


function TRDM_RM2.DoLogin(UserName, Password: OleVariant): Integer;
var S, FConnectionString, SSS : String;
    SL : TStringList;
begin
  S := ChangeFileExt(ParamStr(0), '.key');
  if not FileExists(S) then
  begin
    raise Exception.Create('Не найден файл-ключ ' + S);
    Exit;
  end;
  with ADOConnection1 do
  begin
   Connected := false;
{   ConnectionString := 'Provider=SQLOLEDB.1;Password="' +
     String(FPassword) + '";Persist Security Info=True;User ID=' +
     String(FUserName) + ';Initial Catalog=' +
     String(FDataBaseName)
     + ';Data Source=' + FBaseName +
                        ';Use Procedure for Prepare=1;Auto Translate=True;Application Name=' +Self.Name + '4.0;Packet Size=4096;';
 }
{    ConnectionString := 'Provider=SQLOLEDB.1;Integrated Security=SSPI' +
     ';Persist Security Info=True;User ID=' +
     String(FUserName) + ';Initial Catalog=' +
     String(FDataBaseName)
     + ';Data Source=' + FBaseName +
                        ';Use Procedure for Prepare=1;Auto Translate=True;Application Name=' +Self.Name + '4.0;Packet Size=4096;';
}
  try
     try
  S := ChangeFileExt(ParamStr(0), '.key');
  if  FileExists(S) then
  begin
    SL := TStringList.Create;
    try
      SL.Text := FileToStr(S);
      with SL do
      begin
        FConnectionString := SL.Text;//Values['ConnectionString'];
      end;
      ADOConnection1.Close;
      ADOConnection1.ConnectionString := FConnectionString;
    finally
      SL.Free;
    end;
  end
  else
      raise Exception.Create('Не найден файл-ключ ' + S);


       Connected := true;
     except
       on E : Exception do
       begin
         raise Exception.Create('*** Ошибка соединения с базой ConnectionString="' + ConnectionString+ '" ' + #13 + #10 +
         'path= "' + S + '"' + #13 + #10 + E.Message);
       end;
     end;
     with spWhoIAm do
     begin
       Close;
       try
         Parameters.ParamByName('Login').Value := UserName;
         Parameters.ParamByName('Password').Value := Password;
         Open;
      //   if IsEmpty then
      //     raise Exception.Create('Неверный пароль для пользователя ' + UserName);
         if IsEmpty then
         begin
           AddToProt('Пользователь ' + UserName + ' пытался войти в систему c ошибочным паролем');
           Exit;
         end;
         if FieldByName('deleted').AsInteger = 1 then
         begin
           AddToProt('Заблокированный пользователь ' + UserName + ' пытался войти в систему');
           raise Exception.Create('Запрещен вход пользователю ' + UserName);
         end;
         Fid_User := FieldByName('id_User').AsVariant;
         FFullFio := FieldByName('fio').AsString;
         Result := 1;                    
         AddToProt('Пользователь вошел в систему');
       finally
         Close;
       end;
     end;
   except
     on E : Exception do
     begin
       Result := 26;
       LogMessage('Ошибка при подключени к базе ' + FUserName+ ' '  + FPassword + ' '  + E.Message, EVENTLOG_ERROR_TYPE, 1, 1);
       raise Exception.Create('Ошибка при входе в базу '  + E.Message);
     end;
   end;
 end;
end;

 
procedure TRDM_RM2.BeginTruns;
begin
  ADOConnection1.BeginTrans;
end;

procedure TRDM_RM2.CommitTrans;
begin
  ADOConnection1.CommitTrans;
end;

procedure TRDM_RM2.RollbackTrans;
begin
  ADOConnection1.RollbackTrans;
end;

procedure TRDM_RM2.SetUserGroups(ID: Integer; IDs: OleVariant);
begin
 end;


function TRDM_RM2.Get_FIO: OleVariant;
begin
  Result := FFullFIO;

end;

function TRDM_RM2.Get_id_User: Integer;
begin
  Result := Fid_User;
end;

procedure TRDM_RM2.RemoteDataModuleDestroy(Sender: TObject);
begin
  try
//    AddToProt('Пользователь вышел из системы');
  except
  end;
end;


function TRDM_RM2.PL_GoodsDel(id_Goods: Integer): Integer;
begin
  Result := ORD(ExecSQL('update RM_Goods set deleted = 1 where id_Goods=' + IntToStr(id_Goods)));
end;


function TRDM_RM2.PL_CatEdit(id_Cat: Integer; PID, AName: OleVariant;
  AType: Integer): Integer;
begin
      if id_Cat = -1 then
        AddToProt('Добавлена категория ' + AName)
      else
        AddToProt('Отредактирована категория ' + AName);

  Result := -1;
  with qqqTMP do
  begin
    try
      Close;
      SQL.Text := 'select * from RM_GoodsCat where id_GoodsCat=' + IntToStr(id_Cat);
      Open;
      if id_Cat = -1 then
      begin
        id_Cat := GetNEXTVAL;
        Append;
        FieldByName('id_GoodsCat').Value := id_Cat;
        FieldByName('Type').Value := AType;
        SetUser;
      end
      else
        Edit;

      FieldByName('GoodsCatName').Value := AName;
      FieldByName('PID').Value := PID;

      Post;
      Result := id_Cat;
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(E.Message);
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

function TRDM_RM2.PL_CatDel(id_Cat: Integer): Integer;
begin
  Result := ORD(ExecSQL('update RM_GoodsCat set deleted = 1 where id_GoodsCat=' + IntToStr(id_Cat)));
end;


function TRDM_RM2.PL_GoodsEdit(id_Goods: Integer; GOODSNAME, BarCode,
  id_GoodsCat, Price, Ball, ExtKey, ExtKey2, AInfo: OleVariant): Integer;
begin
      if id_Goods = -1 then
        AddToProt('Добавлен товар ' + GOODSNAME)
      else
        AddToProt('Отредактирован товар ' + GOODSNAME);

  Result := -1;
  with qqqTMP do
  begin
    try
      Close;
      SQL.Text := 'select * from RM_Goods where id_Goods=' + IntToStr(id_Goods);
      Open;
      if id_Goods = -1 then
      begin
        id_Goods := GetNEXTVAL;
        Append;
        FieldByName('id_Goods').Value := id_Goods;
        SetUser;
      end
      else
        Edit;

        FieldByName('id_GoodsCat').Value := id_GoodsCat;
      FieldByName('GOODSNAME').Value := GOODSNAME;
      FieldByName('BarCode').Value := BarCode;
      FieldByName('Price').Value := Price;
      FieldByName('Ball').Value := Ball;
      FieldByName('ExtKey').Value := ExtKey;
      FieldByName('ExtKey2').Value := ExtKey2;
      FieldByName('AInfo').Value := AInfo;

      Post;
      Result := id_Goods;
      Close;
      if VarToStr(BarCode) <> '' then
      begin
        Self.ExecSQL('UPDATE RM_BillItems SET BallPrice=(SELECT MAX(F.Ball) FROM RM_Goods F WHERE F.BARCODE = BC) WHERE id_Goods is null and BC = ' + VarToStr(BarCode));
        Self.ExecSQL('UPDATE RM_BillItems SET PriceBill=(SELECT MAX(F.Price) FROM RM_Goods F WHERE F.BARCODE = BC) WHERE id_Goods is null and BC = ' + VarToStr(BarCode));
        Self.ExecSQL('UPDATE RM_BillItems SET id_Goods=(SELECT MAX(F.id_Goods) FROM RM_Goods F WHERE F.BARCODE = BC) WHERE id_Goods is null and BC = ' + VarToStr(BarCode));
      end;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(E.Message);
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

 
function TRDM_RM2.PrsnEdit(ID_PRSN: Integer; FIO_F, FIO_I, FIO_O, ID_SRC,
  PRSNNUM, PST_INDEX, PST_STREET, PST_HOME, PST_FLAT, DATEOPEN,
  PRSNCOMMENT, PRSNINFO, ID_CITY, BORNDATE, ID_ACC, STOPACTIVITY,
  FAMAMOUNT, SALARYBYPERSON, PHONEHOME, PHONEW, PHONEMOB: OleVariant;
  HASANKT: Integer; PPP_PRSNNUM, id_CityReg, X_Sex, email, p0, P1, P2, P3,
  P4, P5, P6, P7, P8, P9, AnctDate: OleVariant): Integer;
var X, ZZZ : integer;
    S : String;
begin

  Result := -1;
  with qqqTMP do
  begin
    try
      Close;
      SQL.Text := 'select * from RM_Prsn where id_Prsn=' + IntToStr(id_Prsn);
      Open;
      if id_Prsn = -1 then
        AddToProt('Добавлен потребитель ' + vartostr(FIO_F) + ' ' + vartostr(FIO_I) + ' ' + vartostr(FIO_O))
      else
        AddToProt('Отредактирован потребитель ' + FieldByName('FIO_F').AsString + ' ' +
          FieldByName('FIO_I').AsString + ' ' +
          FieldByName('FIO_O').AsString + '->' +
           vartostr(FIO_F) + ' ' + vartostr(FIO_I) + ' ' + vartostr(FIO_O), id_Prsn);

      if id_Prsn = -1 then
      begin
        id_Prsn := GetNEXTVAL;
        Append;
        FieldByName('id_Prsn').Value := id_Prsn;
        SetUser;
      end
      else
        Edit;

      if VarToStr(PPP_PRSNNUM) > '' then
      begin
        X := GetMaxID('select max(id_Prsn) as ID from RM_Prsn WHERE PrsnNum=' + '''' + VarToStr(PPP_PRSNNUM) + '''');
        if X > 0 then
        begin
          FieldByName('PPP').Value := X;
          ExecSQLText('delete from RM_BonusBill2 where id_P = ' + IntToStr(id_Prsn) + ' AND id_Prsn=' + IntToStr(X));
          RM_BonusBill2Add(-1, 'За привлечение клиента "' + vartostr(FIO_F) + ' ' + vartostr(FIO_I) + ' ' + vartostr(FIO_O) + '"', Now, 100, X, id_Prsn)
        end;
      end;

      FieldByName('FIO_F').Value := FIO_F;
      FieldByName('FIO_I').Value := FIO_I;
      FieldByName('FIO_O').Value := FIO_O;
      FieldByName('ID_SRC').Value := ID_SRC;
      FieldByName('PRSNNUM').Value := PRSNNUM;
      FieldByName('PST_INDEX').Value := PST_INDEX;
      FieldByName('PST_STREET').Value := PST_STREET;
      FieldByName('PST_HOME').Value := PST_HOME;
      FieldByName('PST_FLAT').Value := PST_FLAT;
      FieldByName('DATEOPEN').Value := DATEOPEN;
      FieldByName('PRSNCOMMENT').Value := PRSNCOMMENT;
      FieldByName('PRSNINFO').Value := PRSNINFO;
      FieldByName('ID_CITY').Value := ID_CITY;
      FieldByName('BORNDATE').Value := BORNDATE;
      FieldByName('ID_ACC').Value := ID_ACC;
      FieldByName('STOPACTIVITY').Value := STOPACTIVITY;
      FieldByName('FAMAMOUNT').Value := FAMAMOUNT;
      FieldByName('SALARYBYPERSON').Value := SALARYBYPERSON;
      FieldByName('PHONEHOME').Value := PHONEHOME;
      FieldByName('PHONEW').Value := PHONEW;
      FieldByName('PHONEMOB').Value := PHONEMOB;
      FieldByName('HASANKT').Value := HASANKT;

      FieldByName('id_CityReg').Value := id_CityReg;
      FieldByName('X_Sex').Value := X_Sex;
      FieldByName('email').Value := email;
      FieldByName('p0').Value := p0;
      FieldByName('p1').Value := p1;
      FieldByName('p2').Value := p2;
      FieldByName('p3').Value := p3;
      FieldByName('p4').Value := p4;
      FieldByName('p5').Value := p5;
      FieldByName('p6').Value := p6;
      FieldByName('p7').Value := p7;
      FieldByName('p8').Value := p8;
      FieldByName('p9').Value := p9;
      
   //   FieldByName('AnctDate').Value := AnctDate;

      Post;
      Result := id_Prsn;
      Close;

      if id_Acc > 0 then
        X := GetMaxID('select count(id_Acc) as ID from RM_Prsn WHERE id_Acc=' + '''' + Vartostr(id_Acc) + '''')
      else
        X := 0;
      if X > 1 then
      begin
        ZZZ := GetMaxID('select max(id_Prsn) as ID from RM_Prsn WHERE PRSNNUM=(select max(accnum) from RM_Acc WHERE id_Acc=' + inttostr(ID_ACC) + ')');
        if ZZZ > 0 then
          S := IntToStr(ZZZ)
        else
          S := 'Null';
         ExecSQLText('update RM_Acc set ISFAMILY = 1, id_Prsn= + ' + S + ' where id_Acc=' + inttostr(id_Acc));
      end;
      if X > 0 then
      begin
         ExecSQLText('update RM_Prsn set id_xxx = ' + inttostr(X) + ' where id_Prsn=' + inttostr(id_Prsn));
      end;
 // UpdateStat(id_Prsn);
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(E.Message);
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

procedure TRDM_RM2.SetSQL(ASQL: OleVariant);
begin
  qCheck.Close;
  qCheck.SQL.Clear;
  qCheck.SQL.Add(qqq.SQL.Text);
  qCheck.SQL.Add(ASQL);
end;

function TRDM_RM2.PrsnDel(id_Prsn: Integer): Integer;
begin
 AddToProt('Удален потребитель ', id_Prsn);
  Result := ORD(ExecSQL('update RM_PRsn set deleted = 1 where id_Prsn=' + IntToStr(id_Prsn)));

  UpdateStat(id_Prsn);
end;

function TRDM_RM2.AddAcc(AccNum: OleVariant): Integer;
var id_Acc : integer;
begin
 AddToProt('Отредактирован счет ' + AccNum);

  Result := -1;
  with qqqTMP do
  begin
    try
      Close;
      SQL.Text := 'select * from RM_Acc where id_Acc=-1';
      Open;
      id_Acc := GetNEXTVAL;
      Append;
      FieldByName('id_Acc').Value := id_Acc;
      SetUser;

      FieldByName('AccNum').Value := AccNum;

      Post;
      Result := id_Acc;
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(E.Message);
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

function TRDM_RM2.RM_BillItemsEdit(id_BillItems: Integer; id_Bill, id_Goods,
  Amount, PriceBill, BallPrice, GoodsComment, BC: OleVariant): Integer;
begin
  Result := -1;
  with qqqTMP do
  begin
    try
      Close;
      SQL.Text := 'select * from RM_BillItems where id_BillItems=' + IntToStr(id_BillItems);
      Open;
      if id_BillItems <= 0 then
      begin
        id_BillItems := GetNEXTVAL;
        Append;
        FieldByName('id_BillItems').Value := id_BillItems;
        SetUser;
      end
      else
        Edit;

      FieldByName('GoodsComment').Value := GoodsComment;
      FieldByName('BallPrice').Value := BallPrice;
      FieldByName('id_Bill').Value := id_Bill;
      FieldByName('id_Goods').Value := id_Goods;
      FieldByName('PriceBill').Value := PriceBill;
      FieldByName('Amount').Value := Amount;
      FieldByName('BC').Value := BC;

      Post;
      Result := id_BillItems;
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(E.Message);
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

function TRDM_RM2.RM_BillEdit(id_Bill: Integer; BillType, BillDate, ID_ACC,
  ID_PRSN, b0, b1, b2, b3, b4, b5, b6, b7, b8, b9: OleVariant): Integer;
var Z : integer;
begin
  Result := -1;
  ID_ACC := GetMaxID('select max(id_Acc) FROM RM_Prsn where ID_PRSN=' + IntToStr(ID_PRSN));
  Z := GetMaxID('select max(id_Acc) FROM RM_Acc where id_Acc=' + IntToStr(id_Acc));
  if Z = 0 then
    id_Acc := null;
  with qqqTMP do
  begin
    try
      Close;
      SQL.Text := 'select * from RM_Bill where id_Bill=' + IntToStr(id_Bill);
      Open;
      if id_Bill = -1 then
      begin
        id_Bill := GetNEXTVAL;
        Append;
        FieldByName('id_Bill').Value := id_Bill;
        SetUser;
      end
      else
        Edit;

      FieldByName('BillType').Value := BillType;
      FieldByName('BillDate').Value := BillDate;
      FieldByName('id_Acc').Value := id_Acc;
      FieldByName('id_Prsn').Value := id_Prsn;

      FieldByName('b0').Value := b1;
      FieldByName('b2').Value := b2;
      FieldByName('b3').Value := b3;
      FieldByName('b4').Value := b4;
      FieldByName('b5').Value := b5;
      FieldByName('b6').Value := b6;
      FieldByName('b7').Value := b7;
      FieldByName('b8').Value := b8;
      FieldByName('b9').Value := b9;

      Post;
      Result := id_Bill;
      Close;
   //   UpdateStat(id_Prsn);
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(E.Message);
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

function TRDM_RM2.GetConsts(ANAme: OleVariant): OleVariant;
begin
  with spSys do
  begin
    Close;
    Parameters.ParamByName('CnName').Value := ANAme;
    Open;
    Result := spSysVAL.AsVariant;
    Close;
  end;
end;

procedure TRDM_RM2.SetConst(CnName, Val: OleVariant);
begin
  with spSetSys do
  begin
    Close;
    Parameters.ParamByName('Val').Value := Val;
    Parameters.ParamByName('CnName').Value := CnName;
    if ExecSQL = 0 then
    begin
      spInsSys.Parameters.ParamByName('Val').Value := Val;
      spInsSys.Parameters.ParamByName('CnName').Value := CnName;
      spInsSys.ExecSQL;
    end;
  end;
end;

procedure TRDM_RM2.DoUpdateStat(id_Prsn: Integer);
begin
  UpdateStat(id_Prsn);
end;

function TRDM_RM2.EditMSG(id_Msg: Integer; MsgComment, ID_PRSN, isOK,
  id_Action: OleVariant): Integer;
begin
  {    if id_Goods = -1 then
        AddToProt('Добавлен товар ' + GOODSNAME)
      else
        AddToProt('Отредактирован товар ' + GOODSNAME);}

  Result := -1;
  with qqqTMP do
  begin
    try
      Close;
      SQL.Text := 'select * from RM_Msg where id_Msg=' + IntToStr(id_Msg);
      Open;
      if id_Msg = -1 then
      begin
        id_Msg := GetNEXTVAL;
        Append;
        FieldByName('id_Msg').Value := id_Msg;
        SetUser;
      end
      else
        Edit;

      FieldByName('MsgComment').Value := MsgComment;
      FieldByName('id_Prsn').Value := id_Prsn;
      FieldByName('isOK').Value := isOK;
      FieldByName('id_Action').Value := id_Action;

      Post;
      Result := id_Msg;
      Close;

    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(E.Message);
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

procedure TRDM_RM2.DoIns(WHEIT, GoodsName, Price, Ball, BC,
  Grp: OleVariant);
  function GetIDGC(AName : String; PID : Variant) : integer;
  var X : integer;
      S : String;
  begin
    S := 'Select id_GoodsCat FROM RM_GoodsCat WHERE deleted=0 and Upper(GoodsCatName) = ' + '''' +
      AnsiUpperCase(AName) + '''';
    if PID = NULL Then
      S := S + ' AND PID IS NULL'
    else
      S := S + ' AND PID = ' + IntToStr(PID);
      
    X := GetMaxID(S);
    if X > 0 then
      Result := X
    else
    begin
      Result := PL_CatEdit(-1, PID, AName, 0);
    end;
  end;
  function GetIDGoods(id_GoodsCat : Variant) : integer;
  var X : integer;
      S : String;
  begin
    S := 'Select id_Goods FROM RM_Goods WHERE deleted=0 and Upper(GoodsName) = ' + '''' +
      AnsiUpperCase(GoodsName) + '''';
    S := S + ' AND id_GoodsCat = ' + IntToStr(id_GoodsCat);
      
    X := GetMaxID(S);
    if X > 0 then
    //  Result := X
      Result := PL_GoodsEdit(X, GoodsName, BC, id_GoodsCat, Price, Ball, Null, Null, Null)
    else
    begin
      Result := PL_GoodsEdit(-1, GoodsName, BC, id_GoodsCat, Price, Ball, Null, Null, Null);
    end;
  end;
var isBB : boolean;
    i : integer;
    PID, id1, id11, id2 : Variant;
begin
  isBB := POS('BIGBON', AnsiUpperCase(Grp)) > 0;
  i := POS(' ', WHEIT);
  if i > 0 then
  begin
    WHEIT := trim(Copy(WHEIT, 1, i));
  end;
  if Trim(WHEIT) = '' then
    WHEIT := '...'
  else
    WHEIT := formatfloat('000', StrToInt(WHEIT)) + ' гр';
  PID := Null;
  if isBB then
  begin
    id1 := GetIDGC('BIGBON', Null);
  end
  else
  begin
    id1 := GetIDGC('Rollton', Null);
  end;
  id11 := GetIDGC(Grp, id1);
  id2 := GetIDGC(WHEIT, id11);
  if id2 > 0 then
    GetIDGoods(id2);
end;

function TRDM_RM2.BillDel(id_Bill: Integer): Integer;
var id_Prsn : integer;
begin
  id_Prsn := GetMaxID('select max(id_Prsn) FROM RM_Bill WHERE id_Bill=' + IntToStr(id_Bill));
  Result := ORD(ExecSQL('update RM_Bill set deleted = 1 where id_Bill=' + IntToStr(id_Bill)));
  DelBB(id_Bill);
  UpdateStat(id_Prsn);
end;

function TRDM_RM2.BonusRulesDel(id_BonusRules: Integer): Integer;
begin
  Result := ORD(ExecSQL('update RM_BonusRules2 set deleted = 1 where id_BonusRules=' + IntToStr(id_BonusRules)));
end;

function TRDM_RM2.BonusRulesEdit(id_BonusRules: Integer; id_Goods,
  id_GoodsCat, MinBCCount, MinBCAmountInLetter, MinPrice, MinGoodsCount,
  MinSumm, MinSummByPriod, MinBallSummInLetter, MinLetterCount, FirstCount,
  Ball, Ball_K, IsManual, BonusRulesName, BR_DateFrom, BR_DateTo, ASQL,
  Max_Val, is_DR: OleVariant): Integer;
begin

  Result := -1;
  with qqqTMP do
  begin
    try
      Close;
      SQL.Text := 'select * from RM_BonusRules2 where id_BonusRules=' + IntToStr(id_BonusRules);
      Open;
      if id_BonusRules = -1 then
      begin
        id_BonusRules := GetNEXTVAL;
        Append;
        FieldByName('id_BonusRules').Value := id_BonusRules;
        SetUser;
      end
      else
        Edit;

      FieldByName('id_Goods').Value := id_Goods;
      FieldByName('id_GoodsCat').Value := id_GoodsCat;
      FieldByName('MinBCCount').Value := MinBCCount;
      FieldByName('MinBCAmountInLetter').Value := MinBCAmountInLetter;
      FieldByName('MinPrice').Value := MinPrice;
      FieldByName('MinGoodsCount').Value := MinGoodsCount;
      FieldByName('MinSumm').Value := MinSumm;
      FieldByName('MinSummByPriod').Value := MinSummByPriod;
      FieldByName('MinBallSummInLetter').Value := MinBallSummInLetter;
      FieldByName('MinLetterCount').Value := MinLetterCount;
      FieldByName('FirstCount').Value := FirstCount;
      FieldByName('Ball').Value := Ball;
      FieldByName('Ball_K').Value := Ball_K;
      FieldByName('IsManual').Value := IsManual;
      FieldByName('BonusRulesName').Value := BonusRulesName;

      FieldByName('BR_DateFrom').Value := BR_DateFrom;
      FieldByName('BR_DateTo').Value := BR_DateTo;

      FieldByName('ASQL').Value := ASQL;

      FieldByName('Max_Val').Value := Max_Val;
      FieldByName('is_DR').Value := is_DR;
      Post;
      Result := id_BonusRules;
      Close;
   //   UpdateStat(id_Prsn);
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(E.Message);
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

  procedure TRDM_RM2.SaveInlll(BONUSRULESNAME, SSS : string; id_BonusRules, isManual : integer);
  var SL : TStringList;
      S : String;
  begin
    try
      S := ExtractFilePath(ParamStr(0)) + 'sql_' + FormatDateTime('yyyy-mm-dd hh.nn.ss', Now) + '-' + BONUSRULESNAME + '-id_BonusRules_' + Vartostr(id_BonusRules) + IntToStr(isManual)  + '.sql';
      SL := TStringList.Create;
      try
        SL.Text := SSS;
      ////  if SL.Count > 1 then
         // SL.Delete(0);
//        SL.SaveToFile(S);
      finally
        SL.Free;
      end;
    except
    end;
  end;

procedure TRDM_RM2.DoBonusByBall(id_BonusRules: Integer;
  id_Bill: OleVariant);
begin
end;

 
    
function TRDM_RM2.Int_DoBonus(id_BonusRules: Integer;
  id_Bill: OleVariant; ADate : OleVariant): Integer;
var isManual, id_Goods, id_GoodsCat, X, X2, MinBCCount, xxx_id_BonusBill : integer;
    AD1, AD2 : Variant;
    DS1, DS2, S_T, S_Where, S_Grp, SSS, S2, BONUSRULESNAME, ID_BILLStr, ID_P, ADateSQL : String;
    MINSUMM, Max_Val, Ball, Ball_K, BBName : Variant;

    XXXid_Acc, XXXid_Prsn, xxxAcSummm, i, ZZZ : integer;

  procedure DoNach;
  begin
      ID_P := 'NULL';
      xxxAcSummm := GetAccSumm(XXXid_Acc, false);
      
      if (Ball_K > 0) and
         ((xxxAcSummm >= MINSUMM)) then
      begin
        xxx_id_BonusBill :=
        GetMaxID('select max(id_BonusBill) as ID from RM_BonusBill2 where deleted=0 and ' +
        ' (id_Prsn in (select id_prsn from RM_Prsn where id_Acc=' + IntToStr(XXXid_Acc) + ') ' +
        ' or id_Acc=' + IntToStr(XXXid_Acc) + ') ' +
        ' and ID_BONUSRULES=' +
        IntToStr(id_BonusRules));
         xxx_id_BonusBill := 0;
        if (xxx_id_BonusBill = 0) or (id_Bill = -1) then
        begin
          SSS := 'delete from RM_BonusBill2 where (' +
          ' id_Prsn in (select id_prsn from RM_Prsn where id_Acc=' + IntToStr(XXXid_Acc) + ') ' +
          ' or id_Acc=' + IntToStr(XXXid_Acc) + ') ' +
      //    ' and ID_BONUSRULES <> ' + IntToStr(id_BonusRules) +
          ' and ID_BONUSRULES in (select ID_BONUSRULES FROM RM_BONUSRULES2 WHERE isManual=1313)';
          ExecSQL(SSS);

        // Первый раз перешли за черту - начисляем по всем письмам
          SSS := 'INSERT INTO RM_BonusBill2 (id_Bill, ID_P, ID_BONUSRULES, BB_Date, BBall, id_Acc)  ' + #13 + #10 +
             ' select null, ' + ID_P + ' as ID_P, ' +
            IntToStr(ID_BONUSRULES) + ' as ID_BONUSRULES, sysdate as BB_Date, ' + Formatfloat('0', (Ball_K - 1) * xxxAcSummm) +
            ' as BBall, ' + IntToStr(XXXid_Acc) + ' from dual';
          SaveInlll('бонус ' + IntToStr(MINSUMM), SSS, id_BonusRules, 1313);
          Result := ORD(ExecSQL(SSS));
        end
        else
        begin
          SSS := 'delete from RM_BonusBill2 where (' +
          ' id_Prsn in (select id_prsn from RM_Prsn where id_Acc=' + IntToStr(XXXid_Acc) + ') ' +
          ' or id_Acc=' + IntToStr(XXXid_Acc) + ') ' +
          ' and ID_BONUSRULES <> ' + IntToStr(id_BonusRules) +
          ' and ID_BONUSRULES in (select ID_BONUSRULES FROM RM_BONUSRULES2 WHERE isManual=1313)';
          ExecSQL(SSS);


        //  начисляем только по этому письму
          SSS := 'INSERT INTO RM_BonusBill2 (id_Bill, ID_P, ID_BONUSRULES, BB_Date, BBall, id_Acc, id_Prsn)' + #13 + #10 +
             'select B.id_Bill, Null as ID_P, ' +
                IntToStr(ID_BONUSRULES) + ', sysdate, ' + Formatfloat('0', Ball_K - 1)  + '*SUM(BallPrice*Amount),' + IntToStr(XXXid_Acc) + ', id_Prsn' +
                '  FROM RM_Bill B, RM_BillItems BI WHERE ISHIDE=0 and B.deleted=0 AND B.id_Bill=BI.id_Bill ' +
                ' AND B.id_Bill=' + IntToStr(id_Bill) +
                ' group by B.id_Bill, B.id_Prsn'
                ;
          SaveInlll('бонус ' + IntToStr(MINSUMM), SSS, id_BonusRules, 1313);
          Result := ORD(ExecSQL(SSS));
        end;
      end;
    end;

begin
  isManual := GetMaxID('select max(isManual) FROM RM_BonusRules2 WHERE id_BonusRules=' + IntToStr(id_BonusRules));
  if (XXXIsManual > 0) and (XXXIsManual <> isManual) then
    Exit;
    
  ADateSQL := '';
  if ADate <> null then
    ADateSQL := 'and b.id_Bill <=' + IntToStr(id_Bill) + 'and B.billdate <= to_Date(' + '''' + FormatDateTime('DD.MM.YYYY', ADate) + '''' + ', ' + '''' + 'DD.MM.YYYY' + '''' + ')' ;

  if id_Bill > 0 then
    ID_BILLStr := IntToStr(id_Bill)
  else
    ID_BILLStr := 'Null';
  Result := -1;
  try
  ID_P := IntToStr(GetTickCount);
  BONUSRULESNAME :=  GetMaxVal('select max(BONUSRULESNAME) FROM RM_BonusRules2 WHERE id_BonusRules=' + IntToStr(id_BonusRules));
  if id_Bill <> Null then
    BONUSRULESNAME := BONUSRULESNAME + '-' + VarToStr(id_Bill);
    
  MinBCCount := GetMaxID('select max(MinBCCount) FROM RM_BonusRules2 WHERE id_BonusRules=' + IntToStr(id_BonusRules));

  BBName := GetMaxVal('select max(BonusRulesName) FROM RM_BonusRules2 WHERE id_BonusRules=' + IntToStr(id_BonusRules));
  id_Goods := GetMaxID('select max(id_Goods) FROM RM_BonusRules2 WHERE id_BonusRules=' + IntToStr(id_BonusRules));
  id_GoodsCat := GetMaxID('select max(id_GoodsCat) FROM RM_BonusRules2 WHERE id_BonusRules=' + IntToStr(id_BonusRules));
  MINSUMM := GetMaxVal('select max(MINSUMM) FROM RM_BonusRules2 WHERE id_BonusRules=' + IntToStr(id_BonusRules));
  Max_Val := GetMaxVal('select max(MINprice) FROM RM_BonusRules2 WHERE id_BonusRules=' + IntToStr(id_BonusRules));

  Ball := (GetMaxVal('select max(Ball) FROM RM_BonusRules2 WHERE id_BonusRules=' + IntToStr(id_BonusRules)));
  Ball_K := (GetMaxVal('select max(Ball_K) FROM RM_BonusRules2 WHERE id_BonusRules=' + IntToStr(id_BonusRules)));
  if Max_Val = null then
    Max_Val := 0;
  if MINSUMM = null then
    MINSUMM := 0;
  if Ball = null then
    Ball := 0;
  if Ball_K = null then
    Ball_K := 0;

  Ball := abs(Ball);
  Ball_K := abs(Ball_K);

  AD1 := GetMaxVal('select max(BR_DateFrom) FROM RM_BonusRules2 WHERE id_BonusRules=' + IntToStr(id_BonusRules));
  if AD1 = null then Exit;
  DS1 := 'to_Date(' + '''' + FormatDateTime('dd.mm.yyyy', AD1) + '''' + ', ' + '''' + 'DD.MM.YYYY' + '''' + ')';

  AD2 := GetMaxVal('select max(BR_DateTo) FROM RM_BonusRules2 WHERE id_BonusRules=' + IntToStr(id_BonusRules));
  if AD2 = null then Exit;
  DS2 := 'to_Date(' + '''' + FormatDateTime('dd.mm.yyyy', AD2) + '''' + ', ' + '''' + 'DD.MM.YYYY' + '''' + ')';

  S_T := 'RM_Bill B, RM_BillItems BI';
  S_Where := ' WHERE ISHIDE=0 and b.deleted=0 and b.BILLTYPE=0 and (B.BillDate >=' + DS1 + ' AND B.BillDate <=' + DS2 + ') AND BI.id_Bill= B.id_Bill ';
  S_Where := S_Where + ' AND B.id_Bill not in (SELECT Z.id_Bill FROM RM_BonusBill2 Z WHERE Z.id_Bill is not null and Z.deleted=0 and Z.id_BonusRules=' + IntToStr(id_BonusRules) + ')';
  S_Where := S_Where + ' AND BI.id_BillItems not in (SELECT Z.id_BillItems FROM RM_BonusBill2 Z WHERE Z.id_BillItems is not null and Z.deleted=0 and Z.id_BonusRules=' + IntToStr(id_BonusRules) + ')';
  if id_Bill <> Null then
  begin
     S_Where := S_Where + ' AND B.id_Bill=' + IntToStr(id_Bill);
     ExecSQLText('delete from RM_BonusBill2 WHERE id_Bill=' + IntToStr(id_Bill) + ' and id_BonusRules=' + IntToStr(id_BonusRules));
  end;
  if id_Goods > 0 then
  begin
    S_Where := S_Where + ' AND BI.id_Goods=' + IntToStr(id_Goods);
  end;
  if id_GoodsCat > 0 then
  begin
    S_Where := S_Where + ' AND BI.id_Goods in (SELECT id_Goods FROM RM_Goods WHERE id_GoodsCat=' + IntToStr(id_GoodsCat) + ')';
  end;
  
      XXXid_Prsn := GetMaxID('select max(ID_PRSN) FROM RM_Bill where id_Bill=' + IntToStr(id_Bill));
      XXXid_Acc := GetMaxID('select max(id_Acc) FROM RM_Prsn where ID_PRSN=' + IntToStr(XXXid_Prsn));
  if MinBCCount = 1 then
     ID_P := 'NULL';
  case isManual of
    13666 :
    begin
      DoNach;
    end;

    1313 :
    begin
      ZZZ := GetMaxID('select max(minsumm) as ID from RM_BonusBill2 B, RM_BONUSRULES2 BR ' +
        ' where B.deleted=0 and (id_Prsn in (select id_prsn from RM_Prsn where id_Acc=' + IntToStr(XXXid_Acc) + ') ' +
      ' or id_Acc=' + IntToStr(XXXid_Acc) + ') and B.ID_BONUSRULES = BR.ID_BONUSRULES');
      if ZZZ > MINSUMM then Exit;
      ID_P := 'NULL';
      xxxAcSummm := GetAccSumm(XXXid_Acc, false);

      if //((xxxAcSummm >= MINSUMM) or (MINSUMM = 0))  and
         ((xxxAcSummm >= MINSUMM)) then
      begin
        xxx_id_BonusBill := GetMaxID('select max(id_BonusBill) as ID from RM_BonusBill2 where deleted=0 and id_Prsn in (select id_prsn from RM_Prsn where id_Acc=' + IntToStr(XXXid_Acc) + ') and ID_BONUSRULES=' +
        IntToStr(id_BonusRules));
        if (MINSUMM >= 5000) and (Ball_K > 0) then
          xxx_id_BonusBill := 0;
        if xxx_id_BonusBill = 0 then
        begin
          if (Ball_K > 0) then
          begin
            DoNach;
          end
          else
          if (Ball > 0) then
          begin
            SSS := 'INSERT INTO RM_BonusBill2 (id_Bill, ID_P, ID_BONUSRULES, BB_Date, BBall, id_Prsn)  ' + #13 + #10 +
               ' select id_Bill, ' + ID_P + ' as ID_P, ' +
              IntToStr(ID_BONUSRULES) + ' as ID_BONUSRULES, sysdate as BB_Date, ' + Formatfloat('0', Ball) +
              ' as BBall, B.id_Prsn FROM RM_Bill B WHERE B.deleted=0 and id_Bill =' + IntToStr(id_Bill);
            SaveInlll(BONUSRULESNAME, SSS, id_BonusRules, isManual);
            Result := ORD(ExecSQL(SSS));
          end;
        end;
      end;
    end;
    100 :
    begin
      S_Where := S_Where + ' AND EXISTS(Select ID_PRSN FROM RM_PRSN P WHERE ' +
        ' P.id_Prsn = B.id_Prsn AND to_Char(P.BORNDATE, ' + '''' + 'MM' + '''' + ') =' +
      ' to_Char(B.BillDate, ' + '''' + 'MM' + '''' + ') ' +
      ')';
      S_Grp := 'B.id_Prsn';
    end;
    10 :
    begin
      S_Where := S_Where + ' AND BI.Amount>=' + Formatfloat('0', MINSUMM);
      if Max_Val > 0 then
        S_Where := S_Where + ' AND BI.Amount<=' + Formatfloat('0', Max_Val);
      S_Grp := 'B.id_Prsn';

      S_Where := S_Where + ADateSQL ;
    end;
    50 :
    begin
      S_Where := S_Where + ' AND BI.Amount>=' + Formatfloat('0', MINSUMM);
      if Max_Val > 0 then
        S_Where := S_Where + ' AND BI.Amount<=' + Formatfloat('0', Max_Val);
      S_Grp := 'B.id_Prsn';
    end;
    40 :
    begin
      S_Where := S_Where + ' AND BI.PriceBill>=' + Formatfloat('0', MINSUMM);
      if Max_Val > 0 then
        S_Where := S_Where + ' AND BI.PriceBill<=' + Formatfloat('0', Max_Val);
      S_Grp := 'B.id_BillItems';
    end;
    12 :
    begin
      S_Where := S_Where + ' HAVING (COUNT(distinct B.id_Bill))>=' + Formatfloat('0', MINSUMM);
      if Max_Val > 0 then
        S_Where := S_Where + ' AND (COUNT(distinct B.id_Bill))<=' + Formatfloat('0', Max_Val);
      S_Grp := 'B.id_Prsn';
      S_Where := S_Where + ADateSQL ;
    end;
    20 :
    begin
      S_Where := S_Where + ' HAVING sum( BI.Amount)>=' + Formatfloat('0', MINSUMM);
      if Max_Val > 0 then
        S_Where := S_Where + ' AND sum( BI.Amount)<=' + Formatfloat('0', Max_Val);
      S_Grp := 'B.id_Prsn';
      S_Where := S_Where + ADateSQL ;
    end;
    70 :
    begin
      S_Where := S_Where + ' HAVING sum( BI.PriceBill)>=' + Formatfloat('0', MINSUMM);
      if Max_Val > 0 then
        S_Where := S_Where + ' AND sum( BI.PriceBill)<=' + Formatfloat('0', Max_Val);
      S_Grp := 'B.id_Prsn';

      S_Where := S_Where + ADateSQL ;
    end;

    60 :            // Приславшие более чем на сумму M в письме
    begin
      S_Where := S_Where + ' HAVING sum( BI.PriceBill)>=' + Formatfloat('0', MINSUMM);
      if Max_Val > 0 then
        S_Where := S_Where + ' AND sum( BI.PriceBill)<=' + Formatfloat('0', Max_Val);

      S2 := 'select B.id_Bill ' +
       ' FROM ' + S_T + ' ' +  
       S_Where +  ' ' +
       ' GROUP BY B.id_Bill';
       
      SSS := 'INSERT INTO RM_BonusBill2 (id_Bill, ID_P, ID_BONUSRULES, BB_Date, BBall, id_Prsn)  ' + #13 + #10 +
         ' select ' + ID_BILLStr + ', ' + ID_P + ' as ID_P, ' +
        IntToStr(ID_BONUSRULES) + ' as ID_BONUSRULES, sysdate as BB_Date, ' + Formatfloat('0', Ball) +
        ' as BBall, B.id_Prsn FROM RM_Bill B WHERE B.deleted=0 and B.id_Bill in (' + S2 + ') group by id_Bill, id_Prsn';
      SaveInlll(BONUSRULESNAME, SSS, id_BonusRules, isManual);
      Result := ORD(ExecSQL(SSS));
    end;

    80 :            // Приславшие письмо на K баллов
    begin
      S_Where := S_Where + ' HAVING sum( BI.PriceBill)>=' + Formatfloat('0', MINSUMM);
      if Max_Val > 0 then
        S_Where := S_Where + ' AND sum( BI.PriceBill)<=' + Formatfloat('0', Max_Val);

      S2 := 'select B.id_Bill ' +
       ' FROM ' + S_T + ' ' +  
       S_Where +  ' ' +
       ' GROUP BY B.id_Bill';
       
      SSS := 'INSERT INTO RM_BonusBill2 (id_Bill, ID_P, ID_BONUSRULES, BB_Date, BBall, id_Prsn)  ' + #13 + #10 +
         ' select id_Bill, ' + ID_P + ' as ID_P, ' +
        IntToStr(ID_BONUSRULES) + ' as ID_BONUSRULES, sysdate as BB_Date, ' + Formatfloat('0', Ball) +
        ' as BBall, B.id_Prsn FROM RM_Bill B WHERE B.deleted=0 and B.id_Bill in (' + S2 + ') group by id_Bill, id_Prsn';
      SaveInlll(BONUSRULESNAME, SSS, id_BonusRules, isManual);
      Result := ORD(ExecSQL(SSS));
    end;

    30 :            // Приславшие более X кодов в одном письме
    begin
      S_Where := S_Where + ' HAVING sum( BI.Amount)>=' + Formatfloat('0', MINSUMM);
      if Max_Val > 0 then
        S_Where := S_Where + ' AND sum( BI.Amount)<=' + Formatfloat('0', Max_Val);

      S2 := 'select B.id_Bill ' +
       ' FROM ' + S_T + ' ' +
       S_Where +  ' ' +
       ' GROUP BY B.id_Bill';
       
      SSS := 'INSERT INTO RM_BonusBill2 (id_Bill, ID_P, ID_BONUSRULES, BB_Date, BBall, id_Prsn)  ' + #13 + #10 +
         ' select B.id_Bill, ' + ID_P + ' as ID_P, ' +
        IntToStr(ID_BONUSRULES) + ' as ID_BONUSRULES, sysdate as BB_Date, ' + Formatfloat('0', Ball) +
        ' as BBall, B.id_Prsn FROM RM_Bill B, RM_BillItems BI WHERE B.deleted=0 and B.id_Bill in (' + S2 + ') group by B.id_Bill, B.id_Prsn';
      SaveInlll(BONUSRULESNAME, SSS, id_BonusRules, isManual);
      Result := ORD(ExecSQL(SSS));
    end;

    90 :            // Первые N приславших
    begin
     // S_Where := S_Where + ' AND BI.Amount>=' + Formatfloat('0', MINSUMM);
     // if Max_Val > 0 then
     //   S_Where := S_Where + ' AND BI.Amount<=' + Formatfloat('0', Max_Val);
    SSS := S_Grp + #13 + #10 +
       ' FROM ' + S_T + #13 + #10 +
       S_Where + #13 + #10  + ADateSQL +
       ' GROUP BY B.id_Prsn order by min(B.BillDate)';
      SSS := 'select ' + ID_P + ' as ID_P, ' + IntToStr(ID_BONUSRULES) + ' as ID_BONUSRULES, sysdate as BB_Date, ' + Formatfloat('0', Ball) + ' as BBall, id_Prsn, B.id_Bill' + SSS;

      SSS := 'INSERT INTO RM_BonusBill2 (ID_P, ID_BONUSRULES, BB_Date, BBall, id_Prsn)' + #13 + #10 + ' select ID_P, ID_BONUSRULES, BB_Date, BBall, id_Prsn FROM (' + SSS + ') T WHERE 1=1 ' +
      ' AND rownum >=' + Formatfloat('0', MINSUMM) +
      ' AND rownum <=' + Formatfloat('0', Max_Val);
      SaveInlll(BONUSRULESNAME, SSS, id_BonusRules, isManual);
      Result := ORD(ExecSQL(SSS));
    end;
  end;
  if S_Grp <> '' then
  begin
    SSS := S_Grp + #13 + #10 +
       ' FROM ' + S_T + #13 + #10 +
       S_Where + #13 + #10 +
       ' GROUP BY ' + S_Grp;
    if S_Grp = 'B.id_Prsn' then
    begin
      if Ball_K > 0 then
        SSS := 'INSERT INTO RM_BonusBill2 (id_Bill, ID_P, ID_BONUSRULES, BB_Date, BBall, id_Prsn)' + #13 + #10 + 'select ' + ID_BILLStr + ', ' + ID_P + ' as ID_P, ' + IntToStr(ID_BONUSRULES) + ', sysdate, ' + Formatfloat('0', Ball_K - 1)  + '*SUM(BallPrice*Amount), ' + SSS
      else
        SSS := 'INSERT INTO RM_BonusBill2 (id_Bill, ID_P, ID_BONUSRULES, BB_Date, BBall, id_Prsn)' + #13 + #10 + 'select  ' + ID_BILLStr + ', ' + ID_P + ' as ID_P, ' + IntToStr(ID_BONUSRULES) + ', sysdate, ' + Formatfloat('0', Ball) + ', ' + SSS;
    end;
    if S_Grp = 'B.id_BillItems' then
    begin
      if Ball_K > 0 then
        SSS := 'INSERT INTO RM_BonusBill2 (id_Bill, ID_P, ID_BONUSRULES, BB_Date, BBall, id_BillItems)' + #13 + #10 + 'select ' + ID_BILLStr + ', ' + ID_P + ' as ID_P, ' + IntToStr(ID_BONUSRULES) + ', sysdate, ' + Formatfloat('0', Ball_K - 1)  + '*BallPrice*Amount, ' + SSS
      else
        SSS := 'INSERT INTO RM_BonusBill2 (id_Bill, ID_P, ID_BONUSRULES, BB_Date, BBall, id_BillItems)' + #13 + #10 + 'select ' + ID_BILLStr + ', ' + ID_P + ' as ID_P, ' + IntToStr(ID_BONUSRULES) + ', sysdate, ' + Formatfloat('0', Ball) + ', ' + SSS;
    end
    else
    begin

    end;
    SaveInlll(BONUSRULESNAME, SSS, id_BonusRules, isManual);
    Result := ORD(ExecSQL(SSS));//
  end;
 { with qPRSNList do
  begin
    Close;
    Parameters.ParamByName('ID_P').value := ID_P;
    Open;
    First;
    while not Eof do
    begin
      UpdateStat(FieldByName('id_Prsn').AsInteger);
      Next;
    end;

  end;   }
  UpdateStat(xxxid_Prsn);
    Result := GetMaxID('select count(ID_BonusBill) as ID FROM RM_BonusBill2 WHERE ID_P=' + ID_P);
    ExecSQL(' update RM_BonusBill2 set BBAll=round(BBAll, 0) where ID_BonusBill=' + IntToStr(Result));
    IF (id_Bill > 0) and (ID_P <> 'NULL') then
    begin
      X := GetMaxID('select sum(BBall) as ID FROM RM_BonusBill2 WHERE ID_P=' + ID_P);
      X2 := GetMaxID('select sum(BBall) as ID FROM RM_BonusBill2 WHERE id_Bill = ' + IntToStr(id_Bill) + ' AND ID_P<>' + ID_P);
      if X < X2 then
        ExecSQL('DELETE FROM RM_BonusBill2 WHERE ID_P is not null and ID_P=' + ID_P)
      else
      begin
        ExecSQL('DELETE FROM RM_BonusBill2 WHERE ID_P is not null and id_Bill = ' + IntToStr(id_Bill) + ' AND ID_P<>' + ID_P);
      end;
    end;
        ExecSQL('update RM_BonusBill2 set BBName = ' + '''' + BBName + '''' + ' WHERE ID_P=' + ID_P);

  except
  end;
end;

function TRDM_RM2.Get_NEXTVAL: Integer;
begin
  Result := -1;
  with qGNV do
  begin
    Open;
    Result := qGNVID.AsInteger;
    Close;
  end;
end;

function TRDM_RM2.RM_BonusBill2Del(ID_BONUSBILL: Integer): Integer;
begin
  Result := ORD(ExecSQL('update RM_BonusBill2 set deleted = 1 where ID_BONUSBILL=' + IntToStr(ID_BONUSBILL)));
end;

function TRDM_RM2.RM_BonusBill2Add(ID_BONUSBILL: Integer; BBName,
  BB_Date: OleVariant; BBall, ID_PRSN: Integer; id_P: OleVariant): Integer;
begin
  Result := -1;
  with ADOQueryTmp do
  begin
    try
      Close;
      SQL.Text := 'select id_P, id_BonusBill, id_Prsn, BBName, BB_Date, BBall from RM_BonusBill2 where id_BonusBill=' + IntToStr(id_BonusBill);
      Open;
      if id_BonusBill = -1 then
      begin
        id_BonusBill := GetNEXTVAL;
        Append;
        FieldByName('id_BonusBill').Value := id_BonusBill;
        SetUser;
      end
      else
        Edit;

      FieldByName('id_Prsn').Value := id_Prsn;
      FieldByName('BBName').Value := BBName;
      FieldByName('BB_Date').Value := BB_Date;
      FieldByName('BBall').Value := BBall;
      FieldByName('id_P').Value := id_P;
    //  FieldByName('XXX_ID').Value := XXX_ID;
      Post;
      Result := id_BonusBill;
      Close;

    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(E.Message);
        raise Exception.Create(E.Message);
      end;
    end;
  end;end;


function TRDM_RM2.RegEdit(id_Reg: Integer; RegName: OleVariant;
  RG_X: Integer): Integer;
begin
  Result := -1;
  with ADOQueryTmp do
  begin
    try
      Close;
      SQL.Text := 'select * from RM_Reg where id_Reg=' + IntToStr(id_Reg);
      Open;
      if id_Reg = -1 then
      begin
        id_Reg := GetNEXTVAL;
        Append;
        FieldByName('id_Reg').Value := id_Reg;
        SetUser;
      end
      else
        Edit;

      FieldByName('RegName').Value := RegName;
      FieldByName('RG_X').Value := RG_X;

      Post;
      Result := id_Reg;
      Close;

    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(E.Message);
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

function TRDM_RM2.RegDel(id_Reg: Integer): Integer;
begin
  Result := ORD(ExecSQL('update RM_Reg set deleted = 1 where id_Reg=' + IntToStr(id_Reg)));
end;

function TRDM_RM2.CityEdit(id_City, id_Reg: Integer; CityNAme, PH_Code,
  PS_index: OleVariant): Integer;
begin
  Result := -1;
  with ADOQueryTmp do
  begin
    try
      Close;
      SQL.Text := 'select * from RM_City where id_City=' + IntToStr(id_City);
      Open;
      if id_City = -1 then
      begin
        id_City := GetNEXTVAL;
        Append;
        FieldByName('id_City').Value := id_City;
        SetUser;
      end
      else
        Edit;

      FieldByName('id_Reg').Value := id_Reg;
      FieldByName('CityNAme').Value := CityNAme;
      FieldByName('PH_Code').Value := PH_Code;
      FieldByName('PS_index').Value := PS_index;

      Post;
      Result := id_City;
      Close;

    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(E.Message);
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

function TRDM_RM2.CityDel(id_City: Integer): Integer;
begin
  Result := ORD(ExecSQL('update RM_City set deleted = 1 where id_City=' + IntToStr(id_City)));
end;

function TRDM_RM2.ActEdit(id_Act: Integer; ActName, ActDateFrom, ActDateTo,
  AccDescr, ID_CITY: OleVariant; Param8: Integer): Integer;
begin

end;

function TRDM_RM2.ActDel(id_Act: Integer): Integer;
begin

end;

procedure TRDM_RM2.CityRegAdd;
begin

end;

function TRDM_RM2.GetMaxID_XXX(ASQL: OleVariant): Integer;
begin
  try
    with ADOQueryTmp do
    begin
      Close;
      try
        SQL.Clear;
        SQL.Add(ASQL);
        Open;
        Result := Fields[0].AsInteger
      finally
        Close;
      end;
    end;
  except
    Result := -1;
  end;
end;


function TRDM_RM2.GetCityFullName(id_City: Integer): OleVariant;
begin
  try
    with ADOQueryTmp do
    begin
      Close;
      try
        SQL.Clear;
        SQL.Add('select R.RegName, RRR.RegName as RegName2, C.CITYNAME FROM RM_ReG R, RM_ReG RRR, RM_City C WHERE C.id_Reg = R.id_Reg(+) '
// + ' and R.PID= RRR.id_Reg(+) AND C.id_City=' + IntToStr(id_City));
 + ' and R.PID= RRR.id_Reg(+) AND (C.id_City=' + IntToStr(id_City) + ' OR R.id_Reg=' + IntToStr(id_City) + ')');
        Open;
        if FieldByNAme('RegName').AsString <> '' then
        begin
          Result := FieldByNAme('RegName2').AsString;
          if FieldByNAme('RegName2').AsString <> '' then
             Result := Result + '/' + FieldByNAme('RegName').AsString
          else
            Result := FieldByNAme('RegName').AsString;
     //     if (FieldByNAme('CITYNAME').AsString <> FieldByNAme('RegName').AsString) then
          Result := Result + '/' + FieldByNAme('CITYNAME').AsString;
        end
        else
          Result := '';
      finally
        Close;
      end;
    end;
  except
    Result := -1;
  end;
end;

function TRDM_RM2.ListEdit(id_list: Integer;
  ListName: OleVariant): Integer;
begin
  Result := -1;
  with ADOQueryTmp do
  begin
    try
      Close;
      SQL.Text := 'select * from RM_List where id_List=' + IntToStr(id_list);
      Open;
      if id_list = -1 then
      begin
        id_list := GetNEXTVAL;
        Append;
        FieldByName('id_list').Value := id_list;
        SetUser;
      end
      else
        Edit;

      FieldByName('ListName').Value := ListName;

      Post;
      Result := id_list;
      Close;

    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(E.Message);
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

function TRDM_RM2.GetVVVer: Integer;
begin
   Result := VVVer;
end;

function TRDM_RM2.ActionEdit(id_Action: Integer; ActName, ActDateFrom,
  ActDateTo, AccDescr, id_City: OleVariant): Integer;
begin
 AddToProt('Отредактирована акция ' + ActName);

  Result := -1;
  with qqqTMP do
  begin
    try
      Close;
      SQL.Text := 'select * from RM_Action where id_Action=' + IntToStr(id_Action);
      Open;
      if id_Action = -1 then
      begin
        id_Action := GetNEXTVAL;
        Append;
        FieldByName('id_Action').Value := id_Action;
        SetUser;
      end
      else
        Edit;

      FieldByName('ActName').Value := ActName;
      FieldByName('ActDateFrom').Value := ActDateFrom;
      FieldByName('ActDateTo').Value := ActDateTo;
      FieldByName('AccDescr').Value := AccDescr;
      FieldByName('id_City').Value := id_City;

      Post;
      Result := id_Action;
      Close;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(E.Message);
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

procedure TRDM_RM2.DelBB(id_Bill: Integer);
begin
  ExecSQL('delete from RM_BonusBill2 where id_Bill=' + IntToStr(id_Bill));
  ExecSQL('delete from RM_BonusBill2 where id_BillItems  in (select id_BillItems FROM RM_Bill where id_Bill=' + IntToStr(id_Bill) + ')');
end;

procedure TRDM_RM2.DoMaxBonus(id_Bill: Integer);
begin

end;

procedure TRDM_RM2.SetSQLArc(SQL1, SQL2, SQL3: OleVariant);
begin
  qAAA2.Close;
  qAAA2.SQL.Clear;
  qAAA2.SQL.Add(qAAA3.SQL.Text);
  qAAA2.SQL.Text := StringReplace(qAAA2.SQL.Text, '1=1', '(' + SQL1 + ')', [rfReplaceAll, rfIgnoreCase]);
  if SQL2 = '' then
    SQL2 := '1=2';
  qAAA2.SQL.Text := StringReplace(qAAA2.SQL.Text, '2=2', '(' + SQL2 + ')', [rfReplaceAll, rfIgnoreCase]);
  qAAA2.SQL.Text := StringReplace(qAAA2.SQL.Text, '3=3', '(' + SQL3 + ')', [rfReplaceAll, rfIgnoreCase]);

  SaveInlll('123', qAAA2.SQL.Text, 777, 111);
end;

function TRDM_RM2.DoBonus(id_BonusRules: Integer; id_Bill,
  ADate: OleVariant): Integer;
begin
  Int_DoBonus(id_BonusRules, id_Bill, ADate);
end;

procedure TRDM_RM2.SetIsManual(AIsManual: Integer);
begin
  XXXIsManual := AIsManual;
  spBRList.SQL.Insert(3, 'and IsManual=' + IntToStr(XXXIsManual));
end;

initialization
  TComponentFactory.Create(ComServer, TRDM_RM2,
    Class_RDM_RM2, ciMultiInstance, tmApartment);
end.
