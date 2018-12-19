unit KmMngSvc_TLB;

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
// File generated on 21.04.2003 11:47:25 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\Projects\FO\AppServers\svc\KntMngSvc.tlb (1)
// IID\LCID: {25ECFA17-4B83-46A5-A8BC-2D92A39655D8}\0
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
  KmMngSvcMajorVersion = 1;
  KmMngSvcMinorVersion = 0;

  LIBID_KmMngSvc: TGUID = '{25ECFA17-4B83-46A5-A8BC-2D92A39655D8}';

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
    function  CountryAdd(AName: OleVariant; Name_Eng: OleVariant; Code3: OleVariant; 
                         atKP: WordBool; atSite: WordBool; Deleted: WordBool; 
                         ForeignPassport: WordBool; Descr: OleVariant): Integer; safecall;
    function  CityAdd(ID_Country: Integer; id_CityType: OleVariant; AName: OleVariant; 
                      Name_Eng: OleVariant; Code3: OleVariant; atKP: WordBool; atSite: WordBool; 
                      Deleted: WordBool; Descr: OleVariant): Integer; safecall;
    function  HotelAdd(ID_City: Integer; ID_HotelType: OleVariant; AName: OleVariant; 
                       Name_Eng: OleVariant; atKP: WordBool; atSite: WordBool; Deleted: WordBool; 
                       Descr: OleVariant): Integer; safecall;
    procedure MessageEdit(ID: Integer; Subj: OleVariant; Body: OleVariant; ID_Parent: OleVariant; 
                          Deleted: WordBool; Readed: WordBool; Marked: WordBool); safecall;
    function  MessageAdd(Subj: OleVariant; Body: OleVariant; ID_Parent: OleVariant): Integer; safecall;
    procedure AdviceEdit(ID: Integer; Subj: OleVariant; Body: OleVariant; Deleted: WordBool; 
                         Readed: WordBool; Marked: WordBool; ID_Type: OleVariant); safecall;
    function  AdviceAdd(Subj: OleVariant; Body: OleVariant; ID_Type: OleVariant): Integer; safecall;
    procedure NewzEdit(ID: Integer; Subj: OleVariant; Body: OleVariant; Deleted: WordBool; 
                       Readed: WordBool; Marked: WordBool); safecall;
    function  NewzAdd(Subj: OleVariant; Body: OleVariant): Integer; safecall;
    function  TourAdd(AName: OleVariant; id_TourType: OleVariant; DateFrom: TDateTime; 
                      DateTo: TDateTime; offer_num: OleVariant; id_Currency: Integer; sngl: Single; 
                      dbl: Single; trpl: Single; chld: Single; chld2: Single; adult3: Single; 
                      adult4: Single; infant: Single; atKP: WordBool; atSite: WordBool; 
                      Deleted: WordBool; id_Provider: OleVariant; Descr: OleVariant): Integer; safecall;
    function  TourEdit(id_tour: Integer; AName: OleVariant; id_TourType: OleVariant; 
                       DateFrom: TDateTime; DateTo: TDateTime; offer_num: OleVariant; 
                       id_Currency: Integer; sngl: Single; dbl: Single; trpl: Single; chld: Single; 
                       chld2: Single; adult3: Single; adult4: Single; infant: Single; 
                       atKP: WordBool; atSite: WordBool; Deleted: WordBool; 
                       id_Provider: OleVariant; Descr: OleVariant): Integer; safecall;
    function  VKSMessageAdd(id_UserTo: Integer; Subj: OleVariant; Body: OleVariant): Integer; safecall;
    function  VKSMessageEdit(id_Message: Integer; Subj: OleVariant; Body: OleVariant; 
                             Readed: WordBool; Marked: WordBool): Integer; safecall;
    function  VKSMessageDel(id_Message: Integer): Integer; safecall;
    function  ServiceAdd(id_ServiceType: Integer; id_Provider: Integer; AName: OleVariant; 
                         Price: Single; id_Currency: Integer; Deleted: WordBool; Hide: WordBool; 
                         atSite: WordBool; atKP: WordBool): Integer; safecall;
    function  ServiceEdit(id_Service: Integer; id_ServiceType: Integer; id_Provider: Integer; 
                          AName: OleVariant; Price: Single; id_Currency: Integer; 
                          Deleted: WordBool; Hide: WordBool; atSite: WordBool; atKP: WordBool): Integer; safecall;
    procedure UpdateTourName(IdTour: Integer); safecall;
    function  DelTour(ID: Integer): Integer; safecall;
    function  RestoreTour(ID: Integer): Integer; safecall;
    procedure AddTransportItem(id_tour: Integer; ID_AviaItem: OleVariant; ID_TrainItem: OleVariant; 
                               ID_WaterItem: OleVariant; ID_BusItem: OleVariant; 
                               ID_OtherItem: OleVariant); safecall;
    function  ServiceTypeAdd(id_ServiceTypeParent: OleVariant; AName: OleVariant; 
                             Deleted: WordBool; Hide: WordBool; atSite: WordBool; atKP: WordBool; 
                             MustHave: WordBool): Integer; safecall;
    function  Advice_TypeAdd(AName: OleVariant): Integer; safecall;
    function  Advice_TypeEdit(ID: Integer; AName: OleVariant; Deleted: WordBool): Integer; safecall;
    function  KPMsgAdd(Body: OleVariant): Integer; safecall;
    function  KPMsgGet: OleVariant; safecall;
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
    function  CountryAdd(AName: OleVariant; Name_Eng: OleVariant; Code3: OleVariant; 
                         atKP: WordBool; atSite: WordBool; Deleted: WordBool; 
                         ForeignPassport: WordBool; Descr: OleVariant): Integer; dispid 8;
    function  CityAdd(ID_Country: Integer; id_CityType: OleVariant; AName: OleVariant; 
                      Name_Eng: OleVariant; Code3: OleVariant; atKP: WordBool; atSite: WordBool; 
                      Deleted: WordBool; Descr: OleVariant): Integer; dispid 12;
    function  HotelAdd(ID_City: Integer; ID_HotelType: OleVariant; AName: OleVariant; 
                       Name_Eng: OleVariant; atKP: WordBool; atSite: WordBool; Deleted: WordBool; 
                       Descr: OleVariant): Integer; dispid 13;
    procedure MessageEdit(ID: Integer; Subj: OleVariant; Body: OleVariant; ID_Parent: OleVariant; 
                          Deleted: WordBool; Readed: WordBool; Marked: WordBool); dispid 14;
    function  MessageAdd(Subj: OleVariant; Body: OleVariant; ID_Parent: OleVariant): Integer; dispid 15;
    procedure AdviceEdit(ID: Integer; Subj: OleVariant; Body: OleVariant; Deleted: WordBool; 
                         Readed: WordBool; Marked: WordBool; ID_Type: OleVariant); dispid 16;
    function  AdviceAdd(Subj: OleVariant; Body: OleVariant; ID_Type: OleVariant): Integer; dispid 17;
    procedure NewzEdit(ID: Integer; Subj: OleVariant; Body: OleVariant; Deleted: WordBool; 
                       Readed: WordBool; Marked: WordBool); dispid 18;
    function  NewzAdd(Subj: OleVariant; Body: OleVariant): Integer; dispid 19;
    function  TourAdd(AName: OleVariant; id_TourType: OleVariant; DateFrom: TDateTime; 
                      DateTo: TDateTime; offer_num: OleVariant; id_Currency: Integer; sngl: Single; 
                      dbl: Single; trpl: Single; chld: Single; chld2: Single; adult3: Single; 
                      adult4: Single; infant: Single; atKP: WordBool; atSite: WordBool; 
                      Deleted: WordBool; id_Provider: OleVariant; Descr: OleVariant): Integer; dispid 11;
    function  TourEdit(id_tour: Integer; AName: OleVariant; id_TourType: OleVariant; 
                       DateFrom: TDateTime; DateTo: TDateTime; offer_num: OleVariant; 
                       id_Currency: Integer; sngl: Single; dbl: Single; trpl: Single; chld: Single; 
                       chld2: Single; adult3: Single; adult4: Single; infant: Single; 
                       atKP: WordBool; atSite: WordBool; Deleted: WordBool; 
                       id_Provider: OleVariant; Descr: OleVariant): Integer; dispid 61;
    function  VKSMessageAdd(id_UserTo: Integer; Subj: OleVariant; Body: OleVariant): Integer; dispid 20;
    function  VKSMessageEdit(id_Message: Integer; Subj: OleVariant; Body: OleVariant; 
                             Readed: WordBool; Marked: WordBool): Integer; dispid 21;
    function  VKSMessageDel(id_Message: Integer): Integer; dispid 22;
    function  ServiceAdd(id_ServiceType: Integer; id_Provider: Integer; AName: OleVariant; 
                         Price: Single; id_Currency: Integer; Deleted: WordBool; Hide: WordBool; 
                         atSite: WordBool; atKP: WordBool): Integer; dispid 23;
    function  ServiceEdit(id_Service: Integer; id_ServiceType: Integer; id_Provider: Integer; 
                          AName: OleVariant; Price: Single; id_Currency: Integer; 
                          Deleted: WordBool; Hide: WordBool; atSite: WordBool; atKP: WordBool): Integer; dispid 24;
    procedure UpdateTourName(IdTour: Integer); dispid 25;
    function  DelTour(ID: Integer): Integer; dispid 26;
    function  RestoreTour(ID: Integer): Integer; dispid 27;
    procedure AddTransportItem(id_tour: Integer; ID_AviaItem: OleVariant; ID_TrainItem: OleVariant; 
                               ID_WaterItem: OleVariant; ID_BusItem: OleVariant; 
                               ID_OtherItem: OleVariant); dispid 28;
    function  ServiceTypeAdd(id_ServiceTypeParent: OleVariant; AName: OleVariant; 
                             Deleted: WordBool; Hide: WordBool; atSite: WordBool; atKP: WordBool; 
                             MustHave: WordBool): Integer; dispid 29;
    function  Advice_TypeAdd(AName: OleVariant): Integer; dispid 35;
    function  Advice_TypeEdit(ID: Integer; AName: OleVariant; Deleted: WordBool): Integer; dispid 36;
    function  KPMsgAdd(Body: OleVariant): Integer; dispid 37;
    function  KPMsgGet: OleVariant; dispid 38;
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
