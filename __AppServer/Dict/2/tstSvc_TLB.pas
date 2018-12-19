unit tstSvc_TLB;

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
// File generated on 24.09.2002 11:22:07 from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Projects\FO\AppServers\svc\KntMngSvc.tlb (1)
// IID\LCID: {25ECFA17-4B83-46A5-A8BC-2D92A39655D8}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINNT\System32\midas.dll)
//   (2) v2.0 stdole, (C:\WINNT\System32\STDOLE2.TLB)
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
  tstSvcMajorVersion = 1;
  tstSvcMinorVersion = 0;

  LIBID_tstSvc: TGUID = '{25ECFA17-4B83-46A5-A8BC-2D92A39655D8}';

  IID_IDMKM: TGUID = '{33F6CA45-2F23-4739-9CB9-6FCCC48CA535}';
  CLASS_DMKM: TGUID = '{28FBB912-6443-4CB7-AF63-84F146005061}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDMKM = interface;
  IDMKMDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DMKM = IDMKM;


// *********************************************************************//
// Interface: IDMKM
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {33F6CA45-2F23-4739-9CB9-6FCCC48CA535}
// *********************************************************************//
  IDMKM = interface(IAppServer)
    ['{33F6CA45-2F23-4739-9CB9-6FCCC48CA535}']
    function  DoLogin(UserName: OleVariant; Password: OleVariant): Integer; safecall;
    function  SetCountryState(ID_Country: Integer; Deleted: WordBool; atSite: WordBool; 
                              atKP: WordBool): Integer; safecall;
    function  SetCityState(ID_City: Integer; Deleted: WordBool; atSite: WordBool; atKP: WordBool): Integer; safecall;
    function  SetHotelState(ID_Hotel: Integer; Deleted: WordBool; atSite: WordBool; atKP: WordBool): Integer; safecall;
    function  BeginTruns: Integer; safecall;
    procedure CommitTrans; safecall;
    procedure RollbackTrans; safecall;
    function  InTransaction: WordBool; safecall;
    function  AddCountryComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; safecall;
    function  AddCityComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; safecall;
    function  AddHotelComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; safecall;
    function  AddTourComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; safecall;
    function  AddClientComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; safecall;
    function  AddContragentComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; safecall;
    function  AddServiceComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; safecall;
    function  GetCountryComment(ID_Comment: Integer; out Sign: Integer): OleVariant; safecall;
    function  GetCityComment(ID_Comment: Integer; out Sign: Integer): OleVariant; safecall;
    function  GetHotelComment(ID_Comment: Integer; out Sign: Integer): OleVariant; safecall;
    function  GetTourComment(ID_Comment: Integer; out Sign: Integer): OleVariant; safecall;
    function  GetContragentComment(ID_Comment: Integer; out Sign: Integer): OleVariant; safecall;
    function  GetServiceComment(ID_Comment: Integer; out Sign: Integer): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IDMKMDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {33F6CA45-2F23-4739-9CB9-6FCCC48CA535}
// *********************************************************************//
  IDMKMDisp = dispinterface
    ['{33F6CA45-2F23-4739-9CB9-6FCCC48CA535}']
    function  DoLogin(UserName: OleVariant; Password: OleVariant): Integer; dispid 2;
    function  SetCountryState(ID_Country: Integer; Deleted: WordBool; atSite: WordBool; 
                              atKP: WordBool): Integer; dispid 5;
    function  SetCityState(ID_City: Integer; Deleted: WordBool; atSite: WordBool; atKP: WordBool): Integer; dispid 6;
    function  SetHotelState(ID_Hotel: Integer; Deleted: WordBool; atSite: WordBool; atKP: WordBool): Integer; dispid 4;
    function  BeginTruns: Integer; dispid 3;
    procedure CommitTrans; dispid 7;
    procedure RollbackTrans; dispid 9;
    function  InTransaction: WordBool; dispid 10;
    function  AddCountryComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; dispid 1;
    function  AddCityComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; dispid 30;
    function  AddHotelComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; dispid 31;
    function  AddTourComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; dispid 32;
    function  AddClientComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; dispid 33;
    function  AddContragentComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; dispid 34;
    function  AddServiceComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; dispid 100;
    function  GetCountryComment(ID_Comment: Integer; out Sign: Integer): OleVariant; dispid 40;
    function  GetCityComment(ID_Comment: Integer; out Sign: Integer): OleVariant; dispid 41;
    function  GetHotelComment(ID_Comment: Integer; out Sign: Integer): OleVariant; dispid 42;
    function  GetTourComment(ID_Comment: Integer; out Sign: Integer): OleVariant; dispid 43;
    function  GetContragentComment(ID_Comment: Integer; out Sign: Integer): OleVariant; dispid 44;
    function  GetServiceComment(ID_Comment: Integer; out Sign: Integer): OleVariant; dispid 45;
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
// The Class CoDMKM provides a Create and CreateRemote method to          
// create instances of the default interface IDMKM exposed by              
// the CoClass DMKM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDMKM = class
    class function Create: IDMKM;
    class function CreateRemote(const MachineName: string): IDMKM;
  end;

implementation

uses ComObj;

class function CoDMKM.Create: IDMKM;
begin
  Result := CreateComObject(CLASS_DMKM) as IDMKM;
end;

class function CoDMKM.CreateRemote(const MachineName: string): IDMKM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DMKM) as IDMKM;
end;

end.
