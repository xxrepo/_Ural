unit GDSSvc_TLB;

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
// File generated on 31.08.2006 0:15:48 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\project\_Ural\Repl\Prog\DataRelp_v2.tlb (1)
// IID\LCID: {6D0A42DA-4297-4787-AFE5-A88B6243105A}\0
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
  GDSSvcMajorVersion = 1;
  GDSSvcMinorVersion = 0;

  LIBID_GDSSvc: TGUID = '{6D0A42DA-4297-4787-AFE5-A88B6243105A}';

  IID_IGDSDM: TGUID = '{F70E8C6B-CA78-4801-B7D5-F050B2EB2A2D}';
  CLASS_GDSDM: TGUID = '{0919F77E-1C02-41A6-AC5F-811B3E661E97}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IGDSDM = interface;
  IGDSDMDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  GDSDM = IGDSDM;


// *********************************************************************//
// Interface: IGDSDM
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F70E8C6B-CA78-4801-B7D5-F050B2EB2A2D}
// *********************************************************************//
  IGDSDM = interface(IAppServer)
    ['{F70E8C6B-CA78-4801-B7D5-F050B2EB2A2D}']
    function  DoLogin(UserName: OleVariant; Password: OleVariant): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IGDSDMDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F70E8C6B-CA78-4801-B7D5-F050B2EB2A2D}
// *********************************************************************//
  IGDSDMDisp = dispinterface
    ['{F70E8C6B-CA78-4801-B7D5-F050B2EB2A2D}']
    function  DoLogin(UserName: OleVariant; Password: OleVariant): Integer; dispid 2;
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
// The Class CoGDSDM provides a Create and CreateRemote method to          
// create instances of the default interface IGDSDM exposed by              
// the CoClass GDSDM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGDSDM = class
    class function Create: IGDSDM;
    class function CreateRemote(const MachineName: string): IGDSDM;
  end;

implementation

uses ComObj;

class function CoGDSDM.Create: IGDSDM;
begin
  Result := CreateComObject(CLASS_GDSDM) as IGDSDM;
end;

class function CoGDSDM.CreateRemote(const MachineName: string): IGDSDM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_GDSDM) as IGDSDM;
end;

end.
