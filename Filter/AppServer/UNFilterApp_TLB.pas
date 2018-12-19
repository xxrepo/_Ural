unit UNFilterApp_TLB;

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
// File generated on 11.05.2005 12:25:37 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\projects\Ural\Wst\Filter\AppServer\UNFilterApp.tlb (1)
// IID\LCID: {4419013A-300A-40E9-B7C7-A3B0D9942532}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINNT\system32\midas.dll)
//   (2) v2.0 stdole, (C:\WINNT\system32\STDOLE2.TLB)
//   (3) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
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
  UNFilterAppMajorVersion = 1;
  UNFilterAppMinorVersion = 0;

  LIBID_UNFilterApp: TGUID = '{4419013A-300A-40E9-B7C7-A3B0D9942532}';

  IID_IUnFilter: TGUID = '{ABBB0ECE-5359-46A1-BF18-AAC71DDC44B2}';
  CLASS_UnFilter: TGUID = '{1955E435-8CCB-47D9-840E-7E95C08B28F8}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IUnFilter = interface;
  IUnFilterDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  UnFilter = IUnFilter;


// *********************************************************************//
// Interface: IUnFilter
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {ABBB0ECE-5359-46A1-BF18-AAC71DDC44B2}
// *********************************************************************//
  IUnFilter = interface(IAppServer)
    ['{ABBB0ECE-5359-46A1-BF18-AAC71DDC44B2}']
    function  DoLogin(UserName: OleVariant; Password: OleVariant): Integer; safecall;
    function  GetUnivObjID(id_Univ: Integer): Integer; safecall;
    procedure BeginTrans; safecall;
    procedure CommitTrans; safecall;
    procedure RollbackTrans; safecall;
    function  FilterDel(id_Filter: Integer): Integer; safecall;
    function  FLT_ColumnsAdd(id_Filter: Integer; id_Prop: Integer; id_Rel: OleVariant): Integer; safecall;
    function  FLT_GroupAdd(id_Filter: Integer; id_Rel: OleVariant; id_Obj: OleVariant; 
                           id_Prop: OleVariant): Integer; safecall;
    function  FLT_OrderAdd(id_Filter: Integer; id_Prop: Integer; id_Rel: OleVariant): Integer; safecall;
    function  FLT_FilterAdd(AName: OleVariant; id_Univ: Integer; id_business: OleVariant): Integer; safecall;
    function  FLT_FilterEdit(id_Filter: Integer; AName: OleVariant; id_business: OleVariant): Integer; safecall;
    function  FLT_CondAdd(id_Filter: Integer; id_Obj: OleVariant; id_Prop: OleVariant; 
                          id_Rel: OleVariant; CondCode: Integer; Par1: OleVariant; Par2: OleVariant): Integer; safecall;
    function  FLT_ObjGetProp(id_Obj: Integer; ID: Integer; out AName: OleVariant): Integer; safecall;
    function  Get_FIO: OleVariant; safecall;
    function  GetFilterName(id_Flt: Integer): OleVariant; safecall;
    function  FilterClear(id_Filter: Integer): Integer; safecall;
    function  FLT_CondAdd2(id_Filter: Integer; id_Obj: OleVariant; id_Prop: OleVariant; 
                           id_Rel: OleVariant; CondCode: Integer; Par1: OleVariant; 
                           Par2: OleVariant; CondNum: Integer): Integer; safecall;
    function  FLT_AggAdd(id_Filter: Integer; id_Rel: OleVariant; id_Prop: OleVariant; 
                         AggCode: Integer): Integer; safecall;
    procedure LC_SetBaseName(AName: OleVariant); safecall;
    procedure SetBaseName(ANAme: OleVariant; AUserName: OleVariant; APassword: OleVariant); safecall;
    property FIO: OleVariant read Get_FIO;
  end;

// *********************************************************************//
// DispIntf:  IUnFilterDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {ABBB0ECE-5359-46A1-BF18-AAC71DDC44B2}
// *********************************************************************//
  IUnFilterDisp = dispinterface
    ['{ABBB0ECE-5359-46A1-BF18-AAC71DDC44B2}']
    function  DoLogin(UserName: OleVariant; Password: OleVariant): Integer; dispid 2;
    function  GetUnivObjID(id_Univ: Integer): Integer; dispid 1;
    procedure BeginTrans; dispid 10;
    procedure CommitTrans; dispid 11;
    procedure RollbackTrans; dispid 12;
    function  FilterDel(id_Filter: Integer): Integer; dispid 3;
    function  FLT_ColumnsAdd(id_Filter: Integer; id_Prop: Integer; id_Rel: OleVariant): Integer; dispid 4;
    function  FLT_GroupAdd(id_Filter: Integer; id_Rel: OleVariant; id_Obj: OleVariant; 
                           id_Prop: OleVariant): Integer; dispid 7;
    function  FLT_OrderAdd(id_Filter: Integer; id_Prop: Integer; id_Rel: OleVariant): Integer; dispid 5;
    function  FLT_FilterAdd(AName: OleVariant; id_Univ: Integer; id_business: OleVariant): Integer; dispid 8;
    function  FLT_FilterEdit(id_Filter: Integer; AName: OleVariant; id_business: OleVariant): Integer; dispid 9;
    function  FLT_CondAdd(id_Filter: Integer; id_Obj: OleVariant; id_Prop: OleVariant; 
                          id_Rel: OleVariant; CondCode: Integer; Par1: OleVariant; Par2: OleVariant): Integer; dispid 6;
    function  FLT_ObjGetProp(id_Obj: Integer; ID: Integer; out AName: OleVariant): Integer; dispid 13;
    property FIO: OleVariant readonly dispid 14;
    function  GetFilterName(id_Flt: Integer): OleVariant; dispid 15;
    function  FilterClear(id_Filter: Integer): Integer; dispid 16;
    function  FLT_CondAdd2(id_Filter: Integer; id_Obj: OleVariant; id_Prop: OleVariant; 
                           id_Rel: OleVariant; CondCode: Integer; Par1: OleVariant; 
                           Par2: OleVariant; CondNum: Integer): Integer; dispid 36;
    function  FLT_AggAdd(id_Filter: Integer; id_Rel: OleVariant; id_Prop: OleVariant; 
                         AggCode: Integer): Integer; dispid 37;
    procedure LC_SetBaseName(AName: OleVariant); dispid 39;
    procedure SetBaseName(ANAme: OleVariant; AUserName: OleVariant; APassword: OleVariant); dispid 17;
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
// The Class CoUnFilter provides a Create and CreateRemote method to          
// create instances of the default interface IUnFilter exposed by              
// the CoClass UnFilter. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUnFilter = class
    class function Create: IUnFilter;
    class function CreateRemote(const MachineName: string): IUnFilter;
  end;

implementation

uses ComObj;

class function CoUnFilter.Create: IUnFilter;
begin
  Result := CreateComObject(CLASS_UnFilter) as IUnFilter;
end;

class function CoUnFilter.CreateRemote(const MachineName: string): IUnFilter;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UnFilter) as IUnFilter;
end;

end.
