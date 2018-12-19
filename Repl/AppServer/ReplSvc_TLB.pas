unit ReplSvc_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.88.1.0.1.0  $
// File generated on 31.08.2006 1:35:48 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\project\_Ural\Repl\AppServer\ReplSvc.tlb (1)
// IID\LCID: {45548D70-407B-44B4-BC2C-A702CD8A9B59}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINDOWS\system32\midas.dll)
//   (2) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
//   (3) v4.0 StdVCL, (C:\WINDOWS\system32\stdvcl40.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL, 
  MIDAS;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ReplSvcMajorVersion = 1;
  ReplSvcMinorVersion = 0;

  LIBID_ReplSvc: TGUID = '{45548D70-407B-44B4-BC2C-A702CD8A9B59}';

  IID_IReplDM: TGUID = '{51C5FB78-0553-46DB-BA7E-C61FF3F32AE7}';
  CLASS_ReplDM: TGUID = '{67884D55-9085-474F-B7AF-14F2836208ED}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IReplDM = interface;
  IReplDMDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ReplDM = IReplDM;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PInteger1 = ^Integer; {*}


// *********************************************************************//
// Interface: IReplDM
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {51C5FB78-0553-46DB-BA7E-C61FF3F32AE7}
// *********************************************************************//
  IReplDM = interface(IAppServer)
    ['{51C5FB78-0553-46DB-BA7E-C61FF3F32AE7}']
    function  DoLogin(UserName: OleVariant; Password: OleVariant): Integer; safecall;
    procedure BeginTrans; safecall;
    procedure CommitTrans; safecall;
    procedure RollbackTrans; safecall;
    function  RP_Acc_Add(AName: OleVariant; id_Bsn: OleVariant): Integer; safecall;
    function  RP_ReprAdd(id_ContrAgent: OleVariant; isJur: WordBool; AName: OleVariant; 
                         FirstName: OleVariant; MiddleName: OleVariant; LastName: OleVariant; 
                         Id_Currency: OleVariant; Disabled: WordBool; Addr: OleVariant; 
                         Descr: OleVariant; id_Bsn_ex: OleVariant): Integer; safecall;
    function  RP_MN_Add(AName: OleVariant; id_Bsn: OleVariant): Integer; safecall;
    function  Ctg_GoodsAdd(id_business: Integer; id_BaseCtg: OleVariant; AName: OleVariant; 
                           ShortName: OleVariant; Disabled: WordBool): Integer; safecall;
    function  RP_MS_Add_Rep(AName: OleVariant; ShortName: OleVariant; id_BaseMeasure: OleVariant; 
                            Koef: OleVariant; Disabled: WordBool; id_business: Integer): Integer; safecall;
    function  LC_WH_Add(AName: OleVariant; id_Bsn: OleVariant; Addr: OleVariant): Integer; safecall;
    function  GoodsAdd(id_Ctg: OleVariant; AName: OleVariant; ShortName: OleVariant; 
                       BarCode: OleVariant; Id_Measure: OleVariant; Disabled: WordBool): Integer; safecall;
    function  RP_ReplicatorDelPeriod(id_Replicator: Integer): Integer; safecall;
    function  PR_OPerComment(id_LC_Oper: Integer; CommentType: Integer; Comment: OleVariant; 
                             id_User: OleVariant): Integer; safecall;
    function  RP_User_New(FirstName: OleVariant; MiddleName: OleVariant; LastName: OleVariant): Integer; safecall;
    function  RP_OperWare(id_Oper: Integer; id_Goods: OleVariant; Id_Measure: OleVariant; 
                          AmountOper: Double; PriceOper: OleVariant; SummSys: OleVariant): Integer; safecall;
    function  RP_OperAdd_v22(OperVid: Integer; DateLocal: OleVariant; id_business: OleVariant; 
                             Correct: WordBool; OperTypeIn: WordBool; Id_CurrencyOper: OleVariant; 
                             PriceFinOper: OleVariant; Id_CurrencySys: OleVariant; 
                             SummSysFin: OleVariant; id_Acc: OleVariant; id_Acc_Ext: OleVariant; 
                             id_Warehouse: OleVariant; id_Warehouse_Ext: OleVariant; 
                             id_Manufact: OleVariant; id_Manufact_Ext: OleVariant; 
                             id_Repr: OleVariant; id_UserCreator: OleVariant; 
                             id_Replicator: Integer; id_DocType: OleVariant; 
                             Imp_PayBasic: OleVariant; AccInv_PayAssignment: OleVariant; 
                             Contract: OleVariant; OpComment: OleVariant; id_LC_Oper: OleVariant; 
                             Koeff: Integer; Dig1: OleVariant; Dig2: OleVariant; Dig3: OleVariant; 
                             Dig4: OleVariant; Dig5: OleVariant; Dig6: OleVariant; 
                             Dig7: OleVariant; Dig8: OleVariant; Dig9: OleVariant; 
                             Dig10: OleVariant; Dig11: OleVariant; Dig12: OleVariant; 
                             Dig13: OleVariant; Dig14: OleVariant; Dig15: OleVariant; 
                             Str1: OleVariant; Str2: OleVariant; Str3: OleVariant; 
                             Str4: OleVariant; Str5: OleVariant; Str6: OleVariant; 
                             Str7: OleVariant; Str8: OleVariant; Str9: OleVariant; 
                             Str10: OleVariant; Str11: OleVariant; Str12: OleVariant; 
                             Str13: OleVariant; Str14: OleVariant; Str15: OleVariant; 
                             Date1: OleVariant; Date2: OleVariant; Date3: OleVariant; 
                             Date4: OleVariant; Date5: OleVariant; Date6: OleVariant; 
                             Date7: OleVariant; Date8: OleVariant; Date9: OleVariant; 
                             Date10: OleVariant; Date11: OleVariant; Date12: OleVariant; 
                             Date13: OleVariant; Date14: OleVariant; Date15: OleVariant; 
                             id_FormalDistrib: OleVariant; id_FuncDistrib: OleVariant): Integer; safecall;
    procedure Inv_ProjectAdd(AName: OleVariant; id_User: Integer; PrjNum: Integer; 
                             PrjDate: Integer; CalcDate: Integer; Amount1: Integer; 
                             Amount2: Integer; Inv1: Integer; Inv2: Integer; Price: Integer; 
                             Param11: Integer); safecall;
    function  Inv_GetID(id_lc: Integer): Integer; safecall;
    function  INV_TimeItemAdd(Val: OleVariant; ValPlan: OleVariant; id_TimeDict: OleVariant; 
                              id_Project: OleVariant): Integer; safecall;
    function  Inv_WareAdd(id_Project: OleVariant; id_Goods: OleVariant; Id_Measure: OleVariant; 
                          id_Manufact: OleVariant; AmountPlan: OleVariant; PricePlan: OleVariant; 
                          Amount: OleVariant; Summ: OleVariant): Integer; safecall;
    procedure SetFBaseName(AAA: OleVariant); safecall;
    procedure SetFPassword(Param1: OleVariant); safecall;
    procedure SetIC(Param1: OleVariant); safecall;
    function  INV_TimeItemEdit_F(id_TimeItem: Integer; Val: OleVariant): Integer; safecall;
    function  RP_OperAdd_v223(OperVid: Integer; DateLocal: OleVariant; id_business: OleVariant; 
                              Correct: WordBool; OperTypeIn: WordBool; Id_CurrencyOper: OleVariant; 
                              PriceFinOper: OleVariant; Id_CurrencySys: OleVariant; 
                              SummSysFin: OleVariant; id_Acc: OleVariant; id_Acc_Ext: OleVariant; 
                              id_Warehouse: OleVariant; id_Warehouse_Ext: OleVariant; 
                              id_Manufact: OleVariant; id_Manufact_Ext: OleVariant; 
                              id_Repr: OleVariant; id_UserCreator: OleVariant; 
                              id_Replicator: Integer; id_DocType: OleVariant; 
                              Imp_PayBasic: OleVariant; AccInv_PayAssignment: OleVariant; 
                              Contract: OleVariant; OpComment: OleVariant; id_LC_Oper: OleVariant; 
                              Koeff: Integer; Dig1: OleVariant; Dig2: OleVariant; Dig3: OleVariant; 
                              Dig4: OleVariant; Dig5: OleVariant; Dig6: OleVariant; 
                              Dig7: OleVariant; Dig8: OleVariant; Dig9: OleVariant; 
                              Dig10: OleVariant; Dig11: OleVariant; Dig12: OleVariant; 
                              Dig13: OleVariant; Dig14: OleVariant; Dig15: OleVariant; 
                              Str1: OleVariant; Str2: OleVariant; Str3: OleVariant; 
                              Str4: OleVariant; Str5: OleVariant; Str6: OleVariant; 
                              Str7: OleVariant; Str8: OleVariant; Str9: OleVariant; 
                              Str10: OleVariant; Str11: OleVariant; Str12: OleVariant; 
                              Str13: OleVariant; Str14: OleVariant; Str15: OleVariant; 
                              Date1: OleVariant; Date2: OleVariant; Date3: OleVariant; 
                              Date4: OleVariant; Date5: OleVariant; Date6: OleVariant; 
                              Date7: OleVariant; Date8: OleVariant; Date9: OleVariant; 
                              Date10: OleVariant; Date11: OleVariant; Date12: OleVariant; 
                              Date13: OleVariant; Date14: OleVariant; Date15: OleVariant; 
                              id_FormalDistrib: OleVariant; id_FuncDistrib: OleVariant; 
                              id_OperParent: OleVariant): Integer; safecall;
    function  RP_v2_ContrAgent_Add_X(AName: OleVariant; id_Business: Integer; Deleted: WordBool; 
                                     id_CAGroup: OleVariant; ID_ContrAgent: Integer; 
                                     Addr: OleVariant; Descr: OleVariant): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IReplDMDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {51C5FB78-0553-46DB-BA7E-C61FF3F32AE7}
// *********************************************************************//
  IReplDMDisp = dispinterface
    ['{51C5FB78-0553-46DB-BA7E-C61FF3F32AE7}']
    function  DoLogin(UserName: OleVariant; Password: OleVariant): Integer; dispid 2;
    procedure BeginTrans; dispid 3;
    procedure CommitTrans; dispid 4;
    procedure RollbackTrans; dispid 5;
    function  RP_Acc_Add(AName: OleVariant; id_Bsn: OleVariant): Integer; dispid 35;
    function  RP_ReprAdd(id_ContrAgent: OleVariant; isJur: WordBool; AName: OleVariant; 
                         FirstName: OleVariant; MiddleName: OleVariant; LastName: OleVariant; 
                         Id_Currency: OleVariant; Disabled: WordBool; Addr: OleVariant; 
                         Descr: OleVariant; id_Bsn_ex: OleVariant): Integer; dispid 13;
    function  RP_MN_Add(AName: OleVariant; id_Bsn: OleVariant): Integer; dispid 50;
    function  Ctg_GoodsAdd(id_business: Integer; id_BaseCtg: OleVariant; AName: OleVariant; 
                           ShortName: OleVariant; Disabled: WordBool): Integer; dispid 16;
    function  RP_MS_Add_Rep(AName: OleVariant; ShortName: OleVariant; id_BaseMeasure: OleVariant; 
                            Koef: OleVariant; Disabled: WordBool; id_business: Integer): Integer; dispid 9;
    function  LC_WH_Add(AName: OleVariant; id_Bsn: OleVariant; Addr: OleVariant): Integer; dispid 44;
    function  GoodsAdd(id_Ctg: OleVariant; AName: OleVariant; ShortName: OleVariant; 
                       BarCode: OleVariant; Id_Measure: OleVariant; Disabled: WordBool): Integer; dispid 24;
    function  RP_ReplicatorDelPeriod(id_Replicator: Integer): Integer; dispid 1;
    function  PR_OPerComment(id_LC_Oper: Integer; CommentType: Integer; Comment: OleVariant; 
                             id_User: OleVariant): Integer; dispid 6;
    function  RP_User_New(FirstName: OleVariant; MiddleName: OleVariant; LastName: OleVariant): Integer; dispid 7;
    function  RP_OperWare(id_Oper: Integer; id_Goods: OleVariant; Id_Measure: OleVariant; 
                          AmountOper: Double; PriceOper: OleVariant; SummSys: OleVariant): Integer; dispid 96;
    function  RP_OperAdd_v22(OperVid: Integer; DateLocal: OleVariant; id_business: OleVariant; 
                             Correct: WordBool; OperTypeIn: WordBool; Id_CurrencyOper: OleVariant; 
                             PriceFinOper: OleVariant; Id_CurrencySys: OleVariant; 
                             SummSysFin: OleVariant; id_Acc: OleVariant; id_Acc_Ext: OleVariant; 
                             id_Warehouse: OleVariant; id_Warehouse_Ext: OleVariant; 
                             id_Manufact: OleVariant; id_Manufact_Ext: OleVariant; 
                             id_Repr: OleVariant; id_UserCreator: OleVariant; 
                             id_Replicator: Integer; id_DocType: OleVariant; 
                             Imp_PayBasic: OleVariant; AccInv_PayAssignment: OleVariant; 
                             Contract: OleVariant; OpComment: OleVariant; id_LC_Oper: OleVariant; 
                             Koeff: Integer; Dig1: OleVariant; Dig2: OleVariant; Dig3: OleVariant; 
                             Dig4: OleVariant; Dig5: OleVariant; Dig6: OleVariant; 
                             Dig7: OleVariant; Dig8: OleVariant; Dig9: OleVariant; 
                             Dig10: OleVariant; Dig11: OleVariant; Dig12: OleVariant; 
                             Dig13: OleVariant; Dig14: OleVariant; Dig15: OleVariant; 
                             Str1: OleVariant; Str2: OleVariant; Str3: OleVariant; 
                             Str4: OleVariant; Str5: OleVariant; Str6: OleVariant; 
                             Str7: OleVariant; Str8: OleVariant; Str9: OleVariant; 
                             Str10: OleVariant; Str11: OleVariant; Str12: OleVariant; 
                             Str13: OleVariant; Str14: OleVariant; Str15: OleVariant; 
                             Date1: OleVariant; Date2: OleVariant; Date3: OleVariant; 
                             Date4: OleVariant; Date5: OleVariant; Date6: OleVariant; 
                             Date7: OleVariant; Date8: OleVariant; Date9: OleVariant; 
                             Date10: OleVariant; Date11: OleVariant; Date12: OleVariant; 
                             Date13: OleVariant; Date14: OleVariant; Date15: OleVariant; 
                             id_FormalDistrib: OleVariant; id_FuncDistrib: OleVariant): Integer; dispid 97;
    procedure Inv_ProjectAdd(AName: OleVariant; id_User: Integer; PrjNum: Integer; 
                             PrjDate: Integer; CalcDate: Integer; Amount1: Integer; 
                             Amount2: Integer; Inv1: Integer; Inv2: Integer; Price: Integer; 
                             Param11: Integer); dispid 8;
    function  Inv_GetID(id_lc: Integer): Integer; dispid 10;
    function  INV_TimeItemAdd(Val: OleVariant; ValPlan: OleVariant; id_TimeDict: OleVariant; 
                              id_Project: OleVariant): Integer; dispid 11;
    function  Inv_WareAdd(id_Project: OleVariant; id_Goods: OleVariant; Id_Measure: OleVariant; 
                          id_Manufact: OleVariant; AmountPlan: OleVariant; PricePlan: OleVariant; 
                          Amount: OleVariant; Summ: OleVariant): Integer; dispid 12;
    procedure SetFBaseName(AAA: OleVariant); dispid 14;
    procedure SetFPassword(Param1: OleVariant); dispid 15;
    procedure SetIC(Param1: OleVariant); dispid 17;
    function  INV_TimeItemEdit_F(id_TimeItem: Integer; Val: OleVariant): Integer; dispid 18;
    function  RP_OperAdd_v223(OperVid: Integer; DateLocal: OleVariant; id_business: OleVariant; 
                              Correct: WordBool; OperTypeIn: WordBool; Id_CurrencyOper: OleVariant; 
                              PriceFinOper: OleVariant; Id_CurrencySys: OleVariant; 
                              SummSysFin: OleVariant; id_Acc: OleVariant; id_Acc_Ext: OleVariant; 
                              id_Warehouse: OleVariant; id_Warehouse_Ext: OleVariant; 
                              id_Manufact: OleVariant; id_Manufact_Ext: OleVariant; 
                              id_Repr: OleVariant; id_UserCreator: OleVariant; 
                              id_Replicator: Integer; id_DocType: OleVariant; 
                              Imp_PayBasic: OleVariant; AccInv_PayAssignment: OleVariant; 
                              Contract: OleVariant; OpComment: OleVariant; id_LC_Oper: OleVariant; 
                              Koeff: Integer; Dig1: OleVariant; Dig2: OleVariant; Dig3: OleVariant; 
                              Dig4: OleVariant; Dig5: OleVariant; Dig6: OleVariant; 
                              Dig7: OleVariant; Dig8: OleVariant; Dig9: OleVariant; 
                              Dig10: OleVariant; Dig11: OleVariant; Dig12: OleVariant; 
                              Dig13: OleVariant; Dig14: OleVariant; Dig15: OleVariant; 
                              Str1: OleVariant; Str2: OleVariant; Str3: OleVariant; 
                              Str4: OleVariant; Str5: OleVariant; Str6: OleVariant; 
                              Str7: OleVariant; Str8: OleVariant; Str9: OleVariant; 
                              Str10: OleVariant; Str11: OleVariant; Str12: OleVariant; 
                              Str13: OleVariant; Str14: OleVariant; Str15: OleVariant; 
                              Date1: OleVariant; Date2: OleVariant; Date3: OleVariant; 
                              Date4: OleVariant; Date5: OleVariant; Date6: OleVariant; 
                              Date7: OleVariant; Date8: OleVariant; Date9: OleVariant; 
                              Date10: OleVariant; Date11: OleVariant; Date12: OleVariant; 
                              Date13: OleVariant; Date14: OleVariant; Date15: OleVariant; 
                              id_FormalDistrib: OleVariant; id_FuncDistrib: OleVariant; 
                              id_OperParent: OleVariant): Integer; dispid 222;
    function  RP_v2_ContrAgent_Add_X(AName: OleVariant; id_Business: Integer; Deleted: WordBool; 
                                     id_CAGroup: OleVariant; ID_ContrAgent: Integer; 
                                     Addr: OleVariant; Descr: OleVariant): {??PInteger1} OleVariant; dispid 19;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames: OleVariant; dispid 20000003;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoReplDM provides a Create and CreateRemote method to          
// create instances of the default interface IReplDM exposed by              
// the CoClass ReplDM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoReplDM = class
    class function Create: IReplDM;
    class function CreateRemote(const MachineName: string): IReplDM;
  end;

implementation

uses ComObj;

class function CoReplDM.Create: IReplDM;
begin
  Result := CreateComObject(CLASS_ReplDM) as IReplDM;
end;

class function CoReplDM.CreateRemote(const MachineName: string): IReplDM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ReplDM) as IReplDM;
end;

end.
