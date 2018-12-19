unit uLCOperEng;

interface
uses Controls, Forms, sysutils,
  Db, DBClient, uDM, foMyFunc, frExtDataValLC;

function SavePropOper(var AID_Oper : integer; ACDS, cdsOperWare : TClientDataSet; AReadOnly : boolean;
                        AExtDataVal : TfExtDataValLC = nil): boolean;

implementation

function SavePropOper(var AID_Oper : integer; ACDS, cdsOperWare : TClientDataSet; AReadOnly : boolean;
                        AExtDataVal : TfExtDataValLC): boolean;
var OldCursor : TCursor;
    OperVid: Integer;
    id_business: OleVariant;
    Correct, OperTypeIn: WordBool;
    Id_CurrencyOper,
    PriceFinOper, Id_CurrencySys, SummSysFin, id_Acc, id_Acc_Ext,
    id_Warehouse, id_Warehouse_Ext, id_Manufact, id_Manufact_Ext, id_Repr,
    id_UserCreator,     id_DocType, Imp_PayBasic, AccInv_PayAssignment, Contract,
    OpComment: OleVariant;
    Koeff: Integer;
    Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8, Dig9, Dig10, Dig11,
    Dig12, Dig13, Dig14, Dig15, Str1, Str2, Str3, Str4, Str5, Str6, Str7,
    Str8, Str9, Str10, Str11, Str12, Str13, Str14, Str15, Date1, Date2,
    Date3, Date4, Date5, Date6, Date7, Date8, Date9, Date10, Date11,
    Date12, Date13, Date14, Date15, id_FormalDistrib, id_FuncDistrib, id_LC_Oper_Ext : OleVariant;
    tmpID : integer;
begin
  tmpID := AID_Oper;
  Result := false;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
    with ACDS do
    begin
      OperVid := FieldByName('OperVid').Value;
      id_UserCreator := DM.IDUser;

      id_business := FieldByName('id_business').Value;


      Correct := FieldByName('Correct').AsBoolean;
      OperTypeIn := FieldByName('OperTypeIn').AsBoolean;

      Id_CurrencyOper := FieldByName('Id_CurrencyOper').Value;
      if OperVid in [2, 102, 4] then
        PriceFinOper := FieldByName('PriceOper').Value
      else
        PriceFinOper := Null;

      Id_CurrencySys := FieldByName('Id_CurrencySys').Value;
      SummSysFin := FieldByName('SummSys').Value;

      id_Repr := FieldByName('id_Repr').Value;

      id_Acc := FieldByName('id_Acc').Value;
      id_Warehouse := FieldByName('id_Warehouse').Value;
      id_Repr := FieldByName('id_Repr').Value;
      id_Warehouse_Ext := FieldByName('id_Warehouse_Ext').Value;
      id_Acc_Ext := FieldByName('id_Acc_Ext').Value;

      id_Manufact := FieldByName('id_Manufact').Value;
      id_Manufact_Ext := FieldByName('id_Manufact_Ext').Value;

      id_DocType := FieldByName('id_DocType').Value;
      
      Imp_PayBasic := FieldByName('Imp_PayBasic').Value;
      AccInv_PayAssignment := FieldByName('AccInv_PayAssignment').Value;
      Contract := FieldByName('Contract').Value;
      OpComment := FieldByName('OpComment').Value;

      if (Imp_PayBasic <> Null) and (trim(Imp_PayBasic) = '') then
        Imp_PayBasic := Null; 
      if (AccInv_PayAssignment <> Null) and (trim(AccInv_PayAssignment) = '') then
        AccInv_PayAssignment := Null; 
      if (Contract <> Null) and (trim(Contract) = '') then
        Contract := Null; 
      if (OpComment <> Null) and (trim(OpComment) = '') then
        OpComment := Null;
      Koeff := FieldByName('Koeff').AsInteger;
     id_FormalDistrib := FieldByName('id_FormalDistrib').Value;
     id_FuncDistrib := FieldByName('id_FuncDistrib').Value;

     if FindField('id_LC_Oper_Ext') <> nil then
      id_LC_Oper_Ext := FieldByName('id_LC_Oper_Ext').Value
     else
       id_LC_Oper_Ext := Null;
    end;

    if AExtDataVal <> nil then
      AExtDataVal.GetExtDate(Dig1, Dig2, Dig3, Dig4, Dig5, Dig6,
    Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, Str1, Str2,
    Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13,
    Str14, Str15, Date1, Date2, Date3, Date4, Date5, Date6, Date7, Date8,
    Date9, Date10, Date11, Date12, Date13, Date14, Date15);

 //   if not AReadOnly then
    begin
      if AID_Oper = -1 then // Добавляется
      begin
        AID_Oper := DM.rsCA.AppServer.LC_OP_OperAdd_v2(OperVid, id_business, Correct,
                               OperTypeIn, Id_CurrencyOper,
                               PriceFinOper, Id_CurrencySys,
                               SummSysFin, id_Acc, id_Acc_Ext,
                               id_Warehouse, id_Warehouse_Ext,
                               id_Manufact, id_Manufact_Ext, 
                               id_Repr, id_UserCreator, 
                               id_DocType, 
                               Imp_PayBasic, AccInv_PayAssignment, 
                               Contract, OpComment, Koeff,
                               Dig1, Dig2, Dig3, 
                               Dig4, Dig5, Dig6, 
                               Dig7, Dig8, Dig9, 
                               Dig10, Dig11, Dig12, 
                               Dig13, Dig14, Dig15, 
                               Str1, Str2, Str3, 
                               Str4, Str5, Str6, 
                               Str7, Str8, Str9, 
                               Str10, Str11, Str12, 
                               Str13, Str14, Str15, 
                               Date1, Date2, Date3, 
                               Date4, Date5, Date6, 
                               Date7, Date8, Date9, 
                               Date10, Date11, Date12, 
                               Date13, Date14, Date15, 
                               id_FormalDistrib, id_FuncDistrib, id_LC_Oper_Ext);

        if AID_Oper = -1 then
          raise Exception.Create('Ошибка при сохранении операции'); 
      end
      else
      begin
        if DM.rsCA.AppServer.LC_OP_OperEdit_v2(AID_Oper,
                                               OperVid, id_business, Correct,
                               OperTypeIn, Id_CurrencyOper,
                               PriceFinOper, Id_CurrencySys,
                               SummSysFin, id_Acc, id_Acc_Ext,
                               id_Warehouse, id_Warehouse_Ext,
                               id_Manufact, id_Manufact_Ext, 
                               id_Repr, id_UserCreator, 
                               id_DocType, 
                               Imp_PayBasic, AccInv_PayAssignment, 
                               Contract, OpComment, Koeff,
                               Dig1, Dig2, Dig3, 
                               Dig4, Dig5, Dig6, 
                               Dig7, Dig8, Dig9, 
                               Dig10, Dig11, Dig12, 
                               Dig13, Dig14, Dig15, 
                               Str1, Str2, Str3, 
                               Str4, Str5, Str6, 
                               Str7, Str8, Str9, 
                               Str10, Str11, Str12, 
                               Str13, Str14, Str15, 
                               Date1, Date2, Date3, 
                               Date4, Date5, Date6, 
                               Date7, Date8, Date9, 
                               Date10, Date11, Date12, 
                               Date13, Date14, Date15, 
                               id_FormalDistrib, id_FuncDistrib, id_LC_Oper_Ext) <> 1 then
          raise Exception.Create('Ошибка при сохранении операции');
      end;
    end;
    if cdsOperWare <> nil then
    begin
      if not CDSApplyUpdates(cdsOperWare, 'id_LC_Oper', AID_Oper) then
        raise Exception.Create('Ошибка при сохранении списка комментариев');
    end;
{    if cdsExtDataVal <> nil then
      if not CDSApplyUpdates(cdsExtDataVal, 'id_LC_Oper', AID_Oper, true) then
        raise Exception.Create('Ошибка при сохранении дополнительных параметров');  }
    
    CommitTrans(DM.rsCA);
    Result := true;
  except
    on E : Exception do
    begin
      RollbackTrans(DM.rsCA);
      AID_Oper := tmpID;
      raise Exception.Create('Ошибка при сохранении операции ' + E.Message);
    end;
  end;
  Screen.Cursor := OldCursor;
end;
end.
 