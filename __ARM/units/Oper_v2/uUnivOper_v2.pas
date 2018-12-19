unit uUnivOper_v2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Dialogs,
  Db, DBClient, ExtCtrls, StdCtrls, DBCtrls, foMyFunc, Forms, uDM, frExtDataVal,
  ComCtrls, frBJByOper;

  function SavePropOper(var AID_Oper : integer;
                        ACDS : TClientDataSet;
                        cdsWare : TClientDataSet;
                        AExtDataVal : TfExtDataVal {= nil};
                        ABJByOper : TfBJByOper;
                        ANeedTrun : boolean = true) : boolean;

  function wp_OP_OperAdd_v2(OperVid: Integer; id_business: OleVariant; Correct,
      OperTypeIn: WordBool; Id_CurrencyOper, PriceFinOper: OleVariant;
      RateOper: Double; Id_CurrencySys, SummSysFin, RateSys, id_Repr,
      id_Acc, id_Acc_Ext, id_Warehouse, id_Warehouse_Ext, id_Manufact,
      id_Manufact_Ext, id_FormalDistrib, id_FuncDistrib, Koeff,
      Id_CurrencyInv, id_OperParent: OleVariant; OperState: Integer;
      id_UserCreator, id_DocType, Imp_PayBasic, AccInv_PayAssignment,
      Contract, OpComment, Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8,
      Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, Str1, Str2, Str3,
      Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13,
      Str14, Str15, Date1, Date2, Date3, Date4, Date5, Date6, Date7, Date8,
      Date9, Date10, Date11, Date12, Date13, Date14, Date15: OleVariant;
      VatIn, AutoGen: WordBool): Integer;
implementation

function wp_OP_OperAdd_v2(OperVid: Integer; id_business: OleVariant; Correct,
      OperTypeIn: WordBool; Id_CurrencyOper, PriceFinOper: OleVariant;
      RateOper: Double; Id_CurrencySys, SummSysFin, RateSys, id_Repr,
      id_Acc, id_Acc_Ext, id_Warehouse, id_Warehouse_Ext, id_Manufact,
      id_Manufact_Ext, id_FormalDistrib, id_FuncDistrib, Koeff,
      Id_CurrencyInv, id_OperParent: OleVariant; OperState: Integer;
      id_UserCreator, id_DocType, Imp_PayBasic, AccInv_PayAssignment,
      Contract, OpComment, Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8,
      Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, Str1, Str2, Str3,
      Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13,
      Str14, Str15, Date1, Date2, Date3, Date4, Date5, Date6, Date7, Date8,
      Date9, Date10, Date11, Date12, Date13, Date14, Date15: OleVariant;
      VatIn, AutoGen: WordBool): Integer;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}

  Result := DM.rsCA.AppServer.OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyOper,
                                               PriceFinOper, RateOper, Id_CurrencySys, SummSysFin, RateSys,
                                               id_Repr, id_Acc, id_Acc_Ext, id_Warehouse, id_Warehouse_Ext,
                                               id_Manufact, id_Manufact_Ext,
                                               id_FormalDistrib, id_FuncDistrib, Koeff,
                                               Id_CurrencyInv, id_OperParent, OperState,
                                               id_UserCreator, id_DocType,
                                               Imp_PayBasic, AccInv_PayAssignment, Contract, OpComment,
                                               Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8,
                                               Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15,
                                               Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8,
                                               Str9, Str10, Str11, Str12, Str13, Str14, Str15,
                                               Date1, Date2, Date3, Date4, Date5, Date6, Date7,
                                               Date8, Date9, Date10, Date11, Date12, Date13, Date14, Date15, VATIn, AutoGen);

end;

function SavePropOper(var AID_Oper : integer; ACDS, cdsWare : TClientDataSet;
                      AExtDataVal : TfExtDataVal; ABJByOper : TfBJByOper; ANeedTrun : boolean) : boolean;
var OldCursor : TCursor;
    OperVid: Integer; 
    id_business: OleVariant; Correct, OperTypeIn: WordBool; Id_CurrencyOper,
    PriceFinOper: OleVariant; RateOper: Double; Id_CurrencySys, SummSysFin,
    RateSys, id_Repr, id_Acc, id_Acc_Ext, id_Warehouse, id_Warehouse_Ext,
    id_Manufact, id_Manufact_Ext, id_FormalDistrib, id_FuncDistrib, Koeff,
    Id_CurrencyInv, id_OperParent: OleVariant; OperState,
    id_UserCreator, id_DocType, Imp_PayBasic, AccInv_PayAssignment,
    Contract, OpComment, Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8,
    Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, Str1, Str2, Str3, Str4,
    Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14, Str15,
    Date1, Date2, Date3, Date4, Date5, Date6, Date7, Date8, Date9, Date10,
    Date11, Date12, Date13, Date14, Date15, CheckDate, VATIn, AutoGen: OleVariant;
    V : Variant;
    tmpID : integer;
    AField : TField;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
 { DM.AddTextToBuff(TStringField(ACDS.FieldByName('Imp_PayBasic')));
  DM.AddTextToBuff(TStringField(ACDS.FieldByName('AccInv_PayAssignment')));
  DM.AddTextToBuff(TStringField(ACDS.FieldByName('Contract')));
   }
  tmpID := AID_Oper;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  with ACDS do
  begin
    AField := FindField('VATIn');
    if AField <> nil then
      VATIn := AField.AsBoolean
    else
      VATIn := true;
    OperVid := FieldByName('OperVid').AsInteger;
    id_business := FieldByName('id_business').Value;
    Correct := FieldByName('Correct').AsBoolean;
    OperTypeIn := FieldByName('OperTypeIn').AsBoolean;
    Id_CurrencyOper := FieldByName('Id_CurrencyOper').Value;
    PriceFinOper := FieldByName('PriceOper').AsFloat;
    RateOper := FieldByName('RateOper').AsFloat;
    Id_CurrencySys := FieldByName('Id_CurrencySys').Value;
    SummSysFin := FieldByName('SummSys').Value;
    RateSys := FieldByName('RateSys').Value;

    id_Repr := FieldByName('id_Repr').Value;
    id_Acc := FieldByName('id_Acc').Value;
    id_Acc_Ext := FieldByName('id_Acc_Ext').Value;
    id_Warehouse := FieldByName('id_Warehouse').Value;
    id_Warehouse_Ext := FieldByName('id_Warehouse_Ext').Value;
    id_Manufact := FieldByName('id_Manufact').Value;
    id_Manufact_Ext := FieldByName('id_Manufact_Ext').Value;

    id_FormalDistrib := FieldByName('id_FormalDistrib').Value;
    id_FuncDistrib := FieldByName('id_FuncDistrib').Value;

    Koeff := FieldByName('Koeff').AsInteger;

    Id_CurrencyInv := FieldByName('Id_CurrencyInv').Value;

    id_OperParent := FieldByName('id_OperParent').Value;
    OperState := FieldByName('OperState').AsInteger;
    id_UserCreator := FieldByName('id_UserCreator').Value;

    id_DocType := FieldByName('id_DocType').Value;

    Imp_PayBasic := FieldByName('Imp_PayBasic').Value;
    AccInv_PayAssignment := FieldByName('AccInv_PayAssignment').Value;
    Contract := FieldByName('Contract').Value;

    OpComment := FieldByName('OpComment').Value;

    CheckDate := FieldByName('CheckDate').Value;

    if (Imp_PayBasic <> Null) and (trim(Imp_PayBasic) = '') then
      Imp_PayBasic := Null;
    if (AccInv_PayAssignment <> Null) and (trim(AccInv_PayAssignment) = '') then
      AccInv_PayAssignment := Null;
    if (Contract <> Null) and (trim(Contract) = '') then
      Contract := Null;
    if ACDS.FieldByName('is_Mirr').AsBoolean and
       ((not FieldByName('id_Warehouse').IsNull and not FieldByName('id_Warehouse_Ext').IsNull) or
        (not FieldByName('id_Acc').IsNull and not FieldByName('id_Acc_Ext').IsNull) or
        (not FieldByName('id_Manufact').IsNull and not FieldByName('id_Manufact_Ext').IsNull)) then
    begin
      OperTypeIn := not OperTypeIn;
      V := id_Acc;
      id_Acc := id_Acc_Ext;
      id_Acc_Ext := V;

      V := id_Manufact;
      id_Manufact := id_Manufact_Ext;
      id_Manufact_Ext := V;

      V := id_Warehouse;
      id_Warehouse := id_Warehouse_Ext;
      id_Warehouse_Ext := V;
    end;
  end;

  if AExtDataVal <> nil then
    AExtDataVal.GetExtDate(Dig1, Dig2, Dig3, Dig4, Dig5, Dig6,
  Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, Str1, Str2,
  Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13,
  Str14, Str15, Date1, Date2, Date3, Date4, Date5, Date6, Date7, Date8,
  Date9, Date10, Date11, Date12, Date13, Date14, Date15);
  if ANeedTrun then
    BeginTruns(DM.rsCA);
  AutoGen := false;
  try
    if AID_Oper = -1 then // Добавляется
    begin
      AID_Oper := wp_OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyOper,
                                               PriceFinOper, RateOper, Id_CurrencySys, SummSysFin, RateSys,
                                               id_Repr, id_Acc, id_Acc_Ext, id_Warehouse, id_Warehouse_Ext,
                                               id_Manufact, id_Manufact_Ext,
                                               id_FormalDistrib, id_FuncDistrib, Koeff,
                                               Id_CurrencyInv, id_OperParent, OperState,
                                               id_UserCreator, id_DocType,
                                               Imp_PayBasic, AccInv_PayAssignment, Contract, OpComment,
                                               Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8,
                                               Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15,
                                               Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8,
                                               Str9, Str10, Str11, Str12, Str13, Str14, Str15,
                                               Date1, Date2, Date3, Date4, Date5, Date6, Date7,
                                               Date8, Date9, Date10, Date11, Date12, Date13, Date14, Date15, VATIn, AutoGen);

      if AID_Oper = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    end
    else
    begin
   //   if ACDS.ChangeCount > 0 then
      begin
        if DM.rsCA.AppServer.OP_OperEdit_v2(AID_Oper,
                                         OperVid, id_business, Correct, OperTypeIn, Id_CurrencyOper,
                                         PriceFinOper, RateOper, Id_CurrencySys, SummSysFin, RateSys,
                                         id_Repr, id_Acc, id_Acc_Ext, id_Warehouse, id_Warehouse_Ext,
                                         id_Manufact, id_Manufact_Ext,
                                         id_FormalDistrib, id_FuncDistrib, Koeff,
                                         Id_CurrencyInv, id_OperParent, OperState,
                                         id_UserCreator, id_DocType,
                                         Imp_PayBasic, AccInv_PayAssignment, Contract, OpComment,
                                         Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8,
                                         Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15,
                                         Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8,
                                         Str9, Str10, Str11, Str12, Str13, Str14, Str15,
                                         Date1, Date2, Date3, Date4, Date5, Date6, Date7,
                                         Date8, Date9, Date10, Date11, Date12, Date13, Date14, Date15,
                                         CheckDate, VATIn, AutoGen) <> 1 then
          raise Exception.Create('Ошибка при сохранении свойств');
      end;
    end;

  {  if cdsExtDataVal <> nil then
      if not CDSApplyUpdates(cdsExtDataVal, 'id_Oper', AID_Oper, true) then
        raise Exception.Create('Ошибка при сохранении дополнительных параметров');}
    if cdsWare <> nil then
      if not CDSApplyUpdates(cdsWare, 'id_Oper', AID_Oper, true) then
        raise Exception.Create('Ошибка при сохранении перечня товаров');

    if ABJByOper <> nil then
    begin
      ABJByOper.SaveData(AID_Oper);
    end;

    if ANeedTrun then
      CommitTrans(DM.rsCA);
    Result := true;
    DM.LastID_Oper := AID_Oper;
  except
    on E : Exception do
    begin
      Screen.Cursor := OldCursor;
      if ANeedTrun then
        RollbackTrans(DM.rsCA);
      AID_Oper := tmpID;
      raise Exception.Create(E.Message);
    end;
  end;
  Screen.Cursor := OldCursor;
end;

end.
