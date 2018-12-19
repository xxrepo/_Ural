unit svcRM_TLB;

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
// File generated on 01.03.2013 15:22:48 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\prj\webdoc\ProgRam\AppServer\svcWebDoc.tlb (1)
// IID\LCID: {763EB9F5-675B-465F-B5F3-D678BE24B104}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (C:\Windows\SysWOW64\midas.dll)
//   (2) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (3) v4.0 StdVCL, (C:\Windows\SysWOW64\stdvcl40.dll)
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
  svcRMMajorVersion = 1;
  svcRMMinorVersion = 0;

  LIBID_svcRM: TGUID = '{763EB9F5-675B-465F-B5F3-D678BE24B104}';

  IID_IrdmWebDoc: TGUID = '{D0F6E821-608E-4D5B-B90C-FBFD2D11F3B0}';
  CLASS_rdmWebDoc: TGUID = '{A9E4CBBA-B56D-4606-B0C9-F2E0E40F27FC}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IrdmWebDoc = interface;
  IrdmWebDocDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  rdmWebDoc = IrdmWebDoc;


// *********************************************************************//
// Interface: IrdmWebDoc
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D0F6E821-608E-4D5B-B90C-FBFD2D11F3B0}
// *********************************************************************//
  IrdmWebDoc = interface(IAppServer)
    ['{D0F6E821-608E-4D5B-B90C-FBFD2D11F3B0}']
    function  DoLogin(UserName: OleVariant; Password: OleVariant): Integer; safecall;
    procedure BeginTruns; safecall;
    procedure CommitTrans; safecall;
    procedure RollbackTrans; safecall;
    procedure FileDLD_OpenFile(FileName: OleVariant); safecall;
    function  FileDLD_GetFileData(out Data: OleVariant; ArraySize: Integer): Integer; safecall;
    procedure FileDLD_CloseFile; safecall;
  end;

// *********************************************************************//
// DispIntf:  IrdmWebDocDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D0F6E821-608E-4D5B-B90C-FBFD2D11F3B0}
// *********************************************************************//
  IrdmWebDocDisp = dispinterface
    ['{D0F6E821-608E-4D5B-B90C-FBFD2D11F3B0}']
    function  DoLogin(UserName: OleVariant; Password: OleVariant): Integer; dispid 3;
    procedure BeginTruns; dispid 4;
    procedure CommitTrans; dispid 5;
    procedure RollbackTrans; dispid 6;
    procedure FileDLD_OpenFile(FileName: OleVariant); dispid 1;
    function  FileDLD_GetFileData(out Data: OleVariant; ArraySize: Integer): Integer; dispid 2;
    procedure FileDLD_CloseFile; dispid 7;
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
// The Class CordmWebDoc provides a Create and CreateRemote method to          
// create instances of the default interface IrdmWebDoc exposed by              
// the CoClass rdmWebDoc. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CordmWebDoc = class
    class function Create: IrdmWebDoc;
    class function CreateRemote(const MachineName: string): IrdmWebDoc;
  end;

implementation

uses ComObj;

class function CordmWebDoc.Create: IrdmWebDoc;
begin
  Result := CreateComObject(CLASS_rdmWebDoc) as IrdmWebDoc;
end;

class function CordmWebDoc.CreateRemote(const MachineName: string): IrdmWebDoc;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_rdmWebDoc) as IrdmWebDoc;
end;

end.
