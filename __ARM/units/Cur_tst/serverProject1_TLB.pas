unit serverProject1_TLB;

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
// File generated on 21.06.2003 13:17:56 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\projects\Ural\Wst\units\Cur_tst\CurrServer.tlb (1)
// IID\LCID: {2AB8DFA0-8750-44F5-AD02-B6CD25EE1FDD}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINNT\System32\midas.dll)
//   (2) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
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
  serverProject1MajorVersion = 1;
  serverProject1MinorVersion = 0;

  LIBID_serverProject1: TGUID = '{2AB8DFA0-8750-44F5-AD02-B6CD25EE1FDD}';

  IID_IRDM: TGUID = '{85AB2AC9-1960-4395-B3A5-5E2692555F5B}';
  CLASS_RDM: TGUID = '{C5E4A3C9-2583-464B-AFF0-B704EFB56BB6}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IRDM = interface;
  IRDMDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  RDM = IRDM;


// *********************************************************************//
// Interface: IRDM
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {85AB2AC9-1960-4395-B3A5-5E2692555F5B}
// *********************************************************************//
  IRDM = interface(IAppServer)
    ['{85AB2AC9-1960-4395-B3A5-5E2692555F5B}']
  end;

// *********************************************************************//
// DispIntf:  IRDMDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {85AB2AC9-1960-4395-B3A5-5E2692555F5B}
// *********************************************************************//
  IRDMDisp = dispinterface
    ['{85AB2AC9-1960-4395-B3A5-5E2692555F5B}']
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
// The Class CoRDM provides a Create and CreateRemote method to          
// create instances of the default interface IRDM exposed by              
// the CoClass RDM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRDM = class
    class function Create: IRDM;
    class function CreateRemote(const MachineName: string): IRDM;
  end;

implementation

uses ComObj;

class function CoRDM.Create: IRDM;
begin
  Result := CreateComObject(CLASS_RDM) as IRDM;
end;

class function CoRDM.CreateRemote(const MachineName: string): IRDM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RDM) as IRDM;
end;

end.
