unit uMeCrpt;

interface
uses
  Windows, Messages, SysUtils, Classes, StdCtrls;

type
  V_Inv = packed record
    id_DocCur : integer;
    Acc : string[255];
    Address : string[255];
    Bank : string[255];
    Base : string[255];
    Base_Date : Variant;
    Base_Num : string[20];
    BIK : Variant;
    Buh : string[255];
    CBL_Date : Variant;
    CBL_Num : string[20];
    Chif_FIO : string[255];
    Chif_Post : string[255];
    CorAcc : string[255];
    Dept : string[255];
    Doc_Date : Variant;
    Doc_Num : string[50];
    ExtDoc_Count : Variant;
    Geter_FIO : string[255];
    Geter_Post : string[255];
    id_Oper : Variant;
    id_UserCreator : Variant;
    OKPD : string[20];
    OKPO : string[20];
    OKPO2 : string[20];
    OKPO3 : string[20];
    OKPO4 : string[20];
    OrgName : string[255];
    Payer_Acc : string[255];
    Payer_Address : string[255];
    Payer_Bank : string[255];
    Payer_BIK : Variant;
    Payer_CorAcc : string[255];
    Payer_Name : string[255];
    Puter_Date : Variant;
    Puter_Name : string[255];
    Puter_post : string[255];
    RC_Acc : string[255];
    RC_Address : string[255];
    RC_Bank : string[255];
    RC_BIK : Variant;
    RC_CorAcc : string[255];
    RC_Date : Variant;
    RC_FIO : string[255];
    RC_Name : string[255];
    RC_Post : string[255];
    War_Date : Variant;
    War_Name : string[255];
    War_Num : string[20];
    War_Owner : string[255];

    VAT : Variant;
  end;

  V_AF = packed record
    id_DocCur : integer;
    id_Oper : integer;
    Doc_Date : Variant;
    Doc_Num : string[50];
    id_UserCreator : Variant;

    OrgName : string[255];
    Address : string[255];
    INN : Variant;
    KPP : Variant;

    Sender_Name : string[255];
    Sender_Address2 : string[255];

    RC_Name : string[255];
    RC_Address2 : string[255];

    ExtDocDate : Variant;
    ExtDocNum : string[50];

    Bayer_Name : string[255];
    Bayer_Address : string[255];
    Bayer_INN : Variant;
    Bayer_KPP : Variant;

    PBUL : string[255];
    Chif : string[255];
    Buh : string[255];
    VAT : Variant;
  end;

  V_UPD = packed record
    id_DocCur : integer;
    id_Oper : integer;
    Doc_Date : Variant;
    Doc_Num : string[50];
    id_UserCreator : Variant;

    OrgName : string[255];
    Address : string[255];
    INN : Variant;
    KPP : Variant;

    Sender_Name : string[255];
    Sender_Address2 : string[255];

    ExtDocDate : Variant;
    ExtDocNum : string[50];

    Bayer_Name : string[255];
    Bayer_Address : string[255];
    Bayer_INN : Variant;
    Bayer_KPP : Variant;

    Chif : string[255];
    Buh : string[255];
    VAT : Variant;
  end;

  V_WBill = packed record
    id_DocCur : integer;
    id_Oper : integer;
    Doc_Date : Variant;
    Doc_Num : string[50];
    id_UserCreator : Variant;

    OrgName : string[255];
    Address : string[255];
    Bank : string[255];
    BIK : Variant;
    CorAcc : string[255];
    Acc : string[255];

    OKPO : string[20];
    OKPO2 : string[20];
    OKPO3 : string[20];

    RC_Name : string[255];
    RC_Address : string[255];
    RC_Bank : string[255];
    RC_BIK : Variant;
    RC_Acc : string[255];
    RC_CorAcc : string[255];

    Payer_Name : string[255];
    Payer_Address : string[255];
    Payer_Bank : string[255];
    Payer_BIK : Variant;
    Payer_Acc : string[255];
    Payer_CorAcc : string[255];

    Buh : string[255];

    Checker_post, Checker_Name,
    Puter_post, Puter_Name,
    Geter_Post, Geter_FIO : string[255];
    VAT : Variant;
  end;

  V_Arc_OP_Oper = packed record
    id_OperParent, id_Arc,id_Oper,DateCreate,RealDataCreate,id_LC_Oper,OperVid,
    id_Replicator,id_UserCreator,id_business,DateLocal,Correct,OperTypeIn,Id_CurrencyOper,
    PriceFinOper,RateOper,Id_CurrencySys,SummSysFin,
    RateSys, id_Acc, id_Warehouse, id_Manufact, id_Repr, id_ContrAgent_ex, id_Acc_Ext,
    id_Warehouse_Ext, id_Manufact_Ext, id_FormalDistrib, id_FuncDistrib,
    id_UserChecker, CheckDate, Koeff, Id_CurrencyInv,
    RateInv, OrdNum, RateMain,
    Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15,
    Date1, Date2, Date3, Date4, Date5, Date6, Date7, Date8, Date9, Date10, Date11, Date12, Date13, Date14, Date15, VatIn, AutoGen : Variant;
    Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14, Str15 : String[100];
  end;

  V_Arc_OP_Oper_Ware = packed record
    id_OperWare, id_Oper, id_Measure, id_Goods : integer;
    AmountOper, PriceOper, PriceInv, SummSys : Variant;
  end;


function UnPackRec_Arc_OP_Oper(A : OleVariant) : V_Arc_OP_Oper;    
function PackRec_Arc_OP_Oper (A : V_Arc_OP_Oper) : OleVariant;

function PackRec_Arc_OP_Oper_Ware (A : V_Arc_OP_Oper_Ware) : OleVariant;
function UnPackRec_Arc_OP_Oper_Ware(A : OleVariant) : V_Arc_OP_Oper_Ware;

function PackRecV_WBill (A : V_WBill) : OleVariant;
function UnPackRecV_WBill (A : OleVariant) : V_WBill;

function PackRecV_Inv (A : V_Inv) : OleVariant;
function UnPackRecV_Inv (A : OleVariant) : V_Inv;

function PackRecV_AF (A : V_AF) : OleVariant;
function UnPackRecV_AF (A : OleVariant) : V_AF;

function StreamToStr(AStream : TStream) : String;
function StrToStream(AString : String) : TMemoryStream;
function FileToStr(AFileName : String) : String;

function UnPackRecV_UPD (A : OleVariant) : V_UPD;
function PackRecV_UPD (A : V_UPD) : OleVariant;


implementation

function PackRec_Arc_OP_Oper (A : V_Arc_OP_Oper) : OleVariant;
var P : pointer;
begin
  Result := VarArrayCreate([0, sizeOf(V_Arc_OP_Oper)], varByte);
  P := VarArrayLock(Result);
  try
    Move(A, P^, sizeOf(A));
  finally
    VarArrayUnlock(Result);
  end;
end;

function UnPackRec_Arc_OP_Oper(A : OleVariant) : V_Arc_OP_Oper;
var P : pointer;
begin
  P := VarArrayLock(A);
  try
    Move(P^, Result, sizeOf(V_Arc_OP_Oper));
  finally
    VarArrayUnlock(A);
  end;
end;


function PackRec_Arc_OP_Oper_Ware (A : V_Arc_OP_Oper_Ware) : OleVariant;
var P : pointer;
begin
  Result := VarArrayCreate([0, sizeOf(V_Arc_OP_Oper_Ware)], varByte);
  P := VarArrayLock(Result);
  try
    Move(A, P^, sizeOf(A));
  finally
    VarArrayUnlock(Result);
  end;
end;

function UnPackRec_Arc_OP_Oper_Ware(A : OleVariant) : V_Arc_OP_Oper_Ware;
var P : pointer;
begin
  P := VarArrayLock(A);
  try
    Move(P^, Result, sizeOf(V_Arc_OP_Oper_Ware));
  finally
    VarArrayUnlock(A);
  end;
end;


function PackRecV_WBill (A : V_WBill) : OleVariant;
var P : pointer;
begin
  Result := VarArrayCreate([0, sizeOf(V_WBill)], varByte);
  P := VarArrayLock(Result);
  try
    Move(A, P^, sizeOf(A));
  finally
    VarArrayUnlock(Result);
  end;
end;

function UnPackRecV_WBill (A : OleVariant) : V_WBill;
var P : pointer;
begin
  P := VarArrayLock(A);
  try
    Move(P^, Result, sizeOf(V_WBill));
  finally
    VarArrayUnlock(A);
  end;
end;

//*****************************************
 function PackRecV_UPD (A : V_UPD) : OleVariant;
var P : pointer;
begin
  Result := VarArrayCreate([0, sizeOf(V_UPD)], varByte);
  P := VarArrayLock(Result);
  try
    Move(A, P^, sizeOf(A));
  finally
    VarArrayUnlock(Result);
  end;
end;

function UnPackRecV_UPD (A : OleVariant) : V_UPD;
var P : pointer;
begin
  P := VarArrayLock(A);
  try
    Move(P^, Result, sizeOf(V_UPD));
  finally
    VarArrayUnlock(A);
  end;
end;
//*****************************************
function PackRecV_Inv (A : V_Inv) : OleVariant;
var P : pointer;
begin
  Result := VarArrayCreate([0, sizeOf(V_Inv)], varByte);
  P := VarArrayLock(Result);
  try
    Move(A, P^, sizeOf(A));
  finally
    VarArrayUnlock(Result);
  end;
end;

function UnPackRecV_Inv (A : OleVariant) : V_Inv;
var P : pointer;
begin
  P := VarArrayLock(A);
  try
    Move(P^, Result, sizeOf(V_Inv));
  finally
    VarArrayUnlock(A);
  end;
end;

//*************************************************************
function PackRecV_AF (A : V_AF) : OleVariant;
var P : pointer;
begin
  Result := VarArrayCreate([0, sizeOf(V_AF)], varByte);
  P := VarArrayLock(Result);
  try
    Move(A, P^, sizeOf(A));
  finally
    VarArrayUnlock(Result);
  end;
end;

function UnPackRecV_AF (A : OleVariant) : V_AF;
var P : pointer;
begin
  P := VarArrayLock(A);
  try
    Move(P^, Result, sizeOf(V_AF));
  finally
    VarArrayUnlock(A);
  end;
end;

procedure EnCrypt(SrcStream, DestStream : TStream; ADigit : byte = 13);
var BT : byte;
begin
  with SrcStream do
  begin
//    DestStream.Position := 0;
    DestStream.Size := 0;
    Position := 0;
    while SrcStream.Position < SrcStream.Size do
    begin
      Read(BT, 1);
      BT := BT xor ADigit;
      DestStream.Write(BT, 1);
    end;
  end;
end;

function StrToStream(AString : String) : TMemoryStream;
var FS, FS2 : TMemoryStream;
begin
  AString := trim(AString);
  Result := nil;
  FS := TMemoryStream.Create;
  FS2 := TMemoryStream.Create;
  try
    FS.Write(PChar(AString)^, Length(AString));
    EnCrypt(FS, FS2);
    Result := FS2;
  finally
    FS.Free;
  end;
end;

function StreamToStr(AStream : TStream) : String;
var FS : TStream;
    P : PChar;//Pointer;
begin
  Result := '';
  FS := TMemoryStream.Create;
  try
    EnCrypt(AStream, FS);
    FS.Position := 0;
    GetMem(P, FS.Size + 1);
    FillChar(P^, FS.Size + 1, 0);

    FS.Read(P^, FS.Size);
  //  SetString(Result, PChar(P), FS.Size);
    Result := trim(String(P));
  finally
    FS.Free;
  end;
end;

function FileToStr(AFileName : String) : String;
var FS : TMemoryStream;
begin
  try
    FS := TMemoryStream.Create;
    FS.LoadFromFile(AFileName);

    Result := StreamToStr(FS);
  finally
    FS.Free;
  end;
end;


end.
