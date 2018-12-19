unit svcWebDoc_TLB;

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
// File generated on 11.05.2015 13:09:33 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\prj\webdoc_14\ProgRam\AppServer\svcWebDoc.tlb (1)
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
  svcWebDocMajorVersion = 1;
  svcWebDocMinorVersion = 0;

  LIBID_svcWebDoc: TGUID = '{763EB9F5-675B-465F-B5F3-D678BE24B104}';

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
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PInteger1 = ^Integer; {*}


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
    function  FileDLD_OpenFile(id_File: Integer): Integer; safecall;
    function  FileDLD_GetFileData(out Data: OleVariant; ArraySize: Integer): Integer; safecall;
    procedure FileDLD_CloseFile; safecall;
    procedure FileUpl_OpenFile(id_File: Integer; FileName: OleVariant); safecall;
    procedure FileUpl_SaveFile; safecall;
    function  FileUpl_SetFileData(Data: OleVariant): Integer; safecall;
    function  GetVVVer: Integer; safecall;
    function  Get_FIO: OleVariant; safecall;
    function  Get_id_User: Integer; safecall;
    function  ObjDel(id_Obj: Integer): Integer; safecall;
    function  WD_Obj_UnEdit(id_Obj: OleVariant; id_NS: OleVariant; PID: OleVariant; 
                            ExtID: OleVariant; ObjName: OleVariant; FileName: OleVariant; 
                            DateStart: OleVariant; DateStop: OleVariant; isBayer: OleVariant; 
                            isSeller: OleVariant; isDef: OleVariant; Obj_Digit1: OleVariant; 
                            Obj_Digit2: OleVariant; Obj_Digit3: OleVariant; Obj_Digit4: OleVariant; 
                            Obj_Digit5: OleVariant; Obj_Digit6: OleVariant; Obj_Digit7: OleVariant; 
                            Obj_Digit8: OleVariant; Obj_Digit9: OleVariant; 
                            Obj_Digit10: OleVariant; Obj_Date1: OleVariant; Obj_Date2: OleVariant; 
                            Obj_Date3: OleVariant; Obj_Date4: OleVariant; Obj_Date5: OleVariant; 
                            Obj_Date6: OleVariant; Obj_Date7: OleVariant; Obj_Date8: OleVariant; 
                            Obj_Date9: OleVariant; Obj_Date10: OleVariant; EmailList: OleVariant; 
                            id_Dic1: OleVariant; id_Dic2: OleVariant; id_Dic3: OleVariant; 
                            id_Dic4: OleVariant; id_Dic5: OleVariant; id_Dic6: OleVariant; 
                            id_Dic7: OleVariant; id_Dic8: OleVariant; id_Dic9: OleVariant; 
                            id_Dic10: OleVariant): Integer; safecall;
    function  WD_File_UnEdit(id_File: OleVariant; EmailDate: OleVariant; EmailFrom: OleVariant; 
                             EmailName: OleVariant; EmailTo: OleVariant; Subj: OleVariant; 
                             xID_NS: OleVariant; id_DocType: OleVariant; id_WorkType: OleVariant; 
                             id_Seller: OleVariant; id_Bayer: OleVariant; id_Org3: OleVariant; 
                             id_Org4: OleVariant; DocNum: OleVariant; DocDate: OleVariant; 
                             DocDateStop: OleVariant; isAutoLong: OleVariant; DocSumm: OleVariant; 
                             id_Crn: OleVariant; id_State: OleVariant; Comment: OleVariant; 
                             xVers: OleVariant; OrigName: OleVariant; FileInfo: OleVariant; 
                             FileSize: OleVariant; Adv_Digit1: OleVariant; Adv_Digit2: OleVariant; 
                             Adv_Digit3: OleVariant; Adv_Digit4: OleVariant; 
                             Adv_Digit5: OleVariant; Adv_Digit6: OleVariant; 
                             Adv_Digit7: OleVariant; Adv_Digit8: OleVariant; 
                             Adv_Digit9: OleVariant; Adv_Digit10: OleVariant; 
                             Adv_Date1: OleVariant; Adv_Date2: OleVariant; Adv_Date3: OleVariant; 
                             Adv_Date4: OleVariant; Adv_Date5: OleVariant; Adv_Date6: OleVariant; 
                             Adv_Date7: OleVariant; Adv_Date8: OleVariant; Adv_Date9: OleVariant; 
                             Adv_Date10: OleVariant; id_DicFile1: OleVariant; 
                             id_DicFile2: OleVariant; id_DicFile3: OleVariant; 
                             id_DicFile4: OleVariant; id_DicFile5: OleVariant; 
                             id_DicFile6: OleVariant; id_DicFile7: OleVariant; 
                             id_DicFile8: OleVariant; id_DicFile9: OleVariant; 
                             id_DicFile10: OleVariant): Integer; safecall;
    function  NS_NSEdit(id_NS: OleVariant; NSName: OleVariant; FileNameRules: OleVariant): Integer; safecall;
    function  GetId_FileByGUID(FileGUID: OleVariant): Integer; safecall;
    function  WD_ObjSetWT(id_Obj: OleVariant; IDList: OleVariant): Integer; safecall;
    function  WD_CheckEmail(Email: OleVariant; id_Obj: OleVariant): OleVariant; safecall;
    function  USR_UserDel(id_User: Integer): Integer; safecall;
    function  USR_USER_UnEdit(id_User: OleVariant; FIO: OleVariant; UserName: OleVariant; 
                              LC_PSW: OleVariant; IDNSList: OleVariant; id_UADM: OleVariant): Integer; safecall;
    function  NS_NSDel(id_NS: Integer): Integer; safecall;
    function  FileDel(id_File: Integer): Integer; safecall;
    function  WD_Obj_Check(id_Obj: OleVariant; id_NS: OleVariant; ExtID: OleVariant; 
                           ObjName: OleVariant; FileName: OleVariant): Integer; safecall;
    function  NS_NameRules_UnEdit(id_NameRules: OleVariant; id_NS: OleVariant; ColName: OleVariant; 
                                  ParamName: OleVariant; OrderID: OleVariant; isInt: OleVariant; 
                                  isVisible: OleVariant; inName: OleVariant): Integer; safecall;
    function  is_Admin: WordBool; safecall;
    procedure WD_FileSetRead(id_File: Integer; id_User: Integer); safecall;
    procedure CheckFileExists(id_File: Integer); safecall;
    function  WD_File_UnEdit_v2(id_File: OleVariant; EmailDate: OleVariant; EmailFrom: OleVariant; 
                                EmailName: OleVariant; EmailTo: OleVariant; Subj: OleVariant; 
                                xID_NS: OleVariant; id_DocType: OleVariant; 
                                id_WorkType: OleVariant; id_WorkType2: OleVariant; 
                                id_WorkType3: OleVariant; id_WorkType4: OleVariant; 
                                id_WorkType5: OleVariant; id_Seller: OleVariant; 
                                id_Bayer: OleVariant; id_Org3: OleVariant; id_Org4: OleVariant; 
                                DocNum: OleVariant; DocDate: OleVariant; DocDateStop: OleVariant; 
                                isAutoLong: OleVariant; DocSumm: OleVariant; id_Crn: OleVariant; 
                                id_State: OleVariant; Comment: OleVariant; xVers: OleVariant; 
                                OrigName: OleVariant; FileInfo: OleVariant; FileSize: OleVariant; 
                                Adv_Digit1: OleVariant; Adv_Digit2: OleVariant; 
                                Adv_Digit3: OleVariant; Adv_Digit4: OleVariant; 
                                Adv_Digit5: OleVariant; Adv_Digit6: OleVariant; 
                                Adv_Digit7: OleVariant; Adv_Digit8: OleVariant; 
                                Adv_Digit9: OleVariant; Adv_Digit10: OleVariant; 
                                Adv_Date1: OleVariant; Adv_Date2: OleVariant; 
                                Adv_Date3: OleVariant; Adv_Date4: OleVariant; 
                                Adv_Date5: OleVariant; Adv_Date6: OleVariant; 
                                Adv_Date7: OleVariant; Adv_Date8: OleVariant; 
                                Adv_Date9: OleVariant; Adv_Date10: OleVariant; 
                                id_DicFile1: OleVariant; id_DicFile2: OleVariant; 
                                id_DicFile3: OleVariant; id_DicFile4: OleVariant; 
                                id_DicFile5: OleVariant; id_DicFile6: OleVariant; 
                                id_DicFile7: OleVariant; id_DicFile8: OleVariant; 
                                id_DicFile9: OleVariant; id_DicFile10: OleVariant): Integer; safecall;
    procedure WD_BuffAdd(id_File: Integer; isAdd: WordBool); safecall;
    function  WD_BuffCnt: Integer; safecall;
    procedure WD_BuffClear; safecall;
    property FIO: OleVariant read Get_FIO;
    property id_User: Integer read Get_id_User;
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
    function  FileDLD_OpenFile(id_File: Integer): Integer; dispid 1;
    function  FileDLD_GetFileData(out Data: OleVariant; ArraySize: Integer): Integer; dispid 2;
    procedure FileDLD_CloseFile; dispid 7;
    procedure FileUpl_OpenFile(id_File: Integer; FileName: OleVariant); dispid 12;
    procedure FileUpl_SaveFile; dispid 15;
    function  FileUpl_SetFileData(Data: OleVariant): Integer; dispid 23;
    function  GetVVVer: Integer; dispid 8;
    property FIO: OleVariant readonly dispid 9;
    property id_User: Integer readonly dispid 10;
    function  ObjDel(id_Obj: Integer): Integer; dispid 11;
    function  WD_Obj_UnEdit(id_Obj: OleVariant; id_NS: OleVariant; PID: OleVariant; 
                            ExtID: OleVariant; ObjName: OleVariant; FileName: OleVariant; 
                            DateStart: OleVariant; DateStop: OleVariant; isBayer: OleVariant; 
                            isSeller: OleVariant; isDef: OleVariant; Obj_Digit1: OleVariant; 
                            Obj_Digit2: OleVariant; Obj_Digit3: OleVariant; Obj_Digit4: OleVariant; 
                            Obj_Digit5: OleVariant; Obj_Digit6: OleVariant; Obj_Digit7: OleVariant; 
                            Obj_Digit8: OleVariant; Obj_Digit9: OleVariant; 
                            Obj_Digit10: OleVariant; Obj_Date1: OleVariant; Obj_Date2: OleVariant; 
                            Obj_Date3: OleVariant; Obj_Date4: OleVariant; Obj_Date5: OleVariant; 
                            Obj_Date6: OleVariant; Obj_Date7: OleVariant; Obj_Date8: OleVariant; 
                            Obj_Date9: OleVariant; Obj_Date10: OleVariant; EmailList: OleVariant; 
                            id_Dic1: OleVariant; id_Dic2: OleVariant; id_Dic3: OleVariant; 
                            id_Dic4: OleVariant; id_Dic5: OleVariant; id_Dic6: OleVariant; 
                            id_Dic7: OleVariant; id_Dic8: OleVariant; id_Dic9: OleVariant; 
                            id_Dic10: OleVariant): Integer; dispid 13;
    function  WD_File_UnEdit(id_File: OleVariant; EmailDate: OleVariant; EmailFrom: OleVariant; 
                             EmailName: OleVariant; EmailTo: OleVariant; Subj: OleVariant; 
                             xID_NS: OleVariant; id_DocType: OleVariant; id_WorkType: OleVariant; 
                             id_Seller: OleVariant; id_Bayer: OleVariant; id_Org3: OleVariant; 
                             id_Org4: OleVariant; DocNum: OleVariant; DocDate: OleVariant; 
                             DocDateStop: OleVariant; isAutoLong: OleVariant; DocSumm: OleVariant; 
                             id_Crn: OleVariant; id_State: OleVariant; Comment: OleVariant; 
                             xVers: OleVariant; OrigName: OleVariant; FileInfo: OleVariant; 
                             FileSize: OleVariant; Adv_Digit1: OleVariant; Adv_Digit2: OleVariant; 
                             Adv_Digit3: OleVariant; Adv_Digit4: OleVariant; 
                             Adv_Digit5: OleVariant; Adv_Digit6: OleVariant; 
                             Adv_Digit7: OleVariant; Adv_Digit8: OleVariant; 
                             Adv_Digit9: OleVariant; Adv_Digit10: OleVariant; 
                             Adv_Date1: OleVariant; Adv_Date2: OleVariant; Adv_Date3: OleVariant; 
                             Adv_Date4: OleVariant; Adv_Date5: OleVariant; Adv_Date6: OleVariant; 
                             Adv_Date7: OleVariant; Adv_Date8: OleVariant; Adv_Date9: OleVariant; 
                             Adv_Date10: OleVariant; id_DicFile1: OleVariant; 
                             id_DicFile2: OleVariant; id_DicFile3: OleVariant; 
                             id_DicFile4: OleVariant; id_DicFile5: OleVariant; 
                             id_DicFile6: OleVariant; id_DicFile7: OleVariant; 
                             id_DicFile8: OleVariant; id_DicFile9: OleVariant; 
                             id_DicFile10: OleVariant): Integer; dispid 16;
    function  NS_NSEdit(id_NS: OleVariant; NSName: OleVariant; FileNameRules: OleVariant): Integer; dispid 14;
    function  GetId_FileByGUID(FileGUID: OleVariant): Integer; dispid 17;
    function  WD_ObjSetWT(id_Obj: OleVariant; IDList: OleVariant): Integer; dispid 18;
    function  WD_CheckEmail(Email: OleVariant; id_Obj: OleVariant): OleVariant; dispid 19;
    function  USR_UserDel(id_User: Integer): Integer; dispid 20;
    function  USR_USER_UnEdit(id_User: OleVariant; FIO: OleVariant; UserName: OleVariant; 
                              LC_PSW: OleVariant; IDNSList: OleVariant; id_UADM: OleVariant): Integer; dispid 21;
    function  NS_NSDel(id_NS: Integer): Integer; dispid 22;
    function  FileDel(id_File: Integer): Integer; dispid 24;
    function  WD_Obj_Check(id_Obj: OleVariant; id_NS: OleVariant; ExtID: OleVariant; 
                           ObjName: OleVariant; FileName: OleVariant): Integer; dispid 25;
    function  NS_NameRules_UnEdit(id_NameRules: OleVariant; id_NS: OleVariant; ColName: OleVariant; 
                                  ParamName: OleVariant; OrderID: OleVariant; isInt: OleVariant; 
                                  isVisible: OleVariant; inName: OleVariant): Integer; dispid 26;
    function  is_Admin: WordBool; dispid 27;
    procedure WD_FileSetRead(id_File: Integer; id_User: Integer); dispid 28;
    procedure CheckFileExists(id_File: Integer); dispid 29;
    function  WD_File_UnEdit_v2(id_File: OleVariant; EmailDate: OleVariant; EmailFrom: OleVariant; 
                                EmailName: OleVariant; EmailTo: OleVariant; Subj: OleVariant; 
                                xID_NS: OleVariant; id_DocType: OleVariant; 
                                id_WorkType: OleVariant; id_WorkType2: OleVariant; 
                                id_WorkType3: OleVariant; id_WorkType4: OleVariant; 
                                id_WorkType5: OleVariant; id_Seller: OleVariant; 
                                id_Bayer: OleVariant; id_Org3: OleVariant; id_Org4: OleVariant; 
                                DocNum: OleVariant; DocDate: OleVariant; DocDateStop: OleVariant; 
                                isAutoLong: OleVariant; DocSumm: OleVariant; id_Crn: OleVariant; 
                                id_State: OleVariant; Comment: OleVariant; xVers: OleVariant; 
                                OrigName: OleVariant; FileInfo: OleVariant; FileSize: OleVariant; 
                                Adv_Digit1: OleVariant; Adv_Digit2: OleVariant; 
                                Adv_Digit3: OleVariant; Adv_Digit4: OleVariant; 
                                Adv_Digit5: OleVariant; Adv_Digit6: OleVariant; 
                                Adv_Digit7: OleVariant; Adv_Digit8: OleVariant; 
                                Adv_Digit9: OleVariant; Adv_Digit10: OleVariant; 
                                Adv_Date1: OleVariant; Adv_Date2: OleVariant; 
                                Adv_Date3: OleVariant; Adv_Date4: OleVariant; 
                                Adv_Date5: OleVariant; Adv_Date6: OleVariant; 
                                Adv_Date7: OleVariant; Adv_Date8: OleVariant; 
                                Adv_Date9: OleVariant; Adv_Date10: OleVariant; 
                                id_DicFile1: OleVariant; id_DicFile2: OleVariant; 
                                id_DicFile3: OleVariant; id_DicFile4: OleVariant; 
                                id_DicFile5: OleVariant; id_DicFile6: OleVariant; 
                                id_DicFile7: OleVariant; id_DicFile8: OleVariant; 
                                id_DicFile9: OleVariant; id_DicFile10: OleVariant): Integer; dispid 44;
    procedure WD_BuffAdd(id_File: Integer; isAdd: WordBool); dispid 35;
    function  WD_BuffCnt: {??PInteger1} OleVariant; dispid 30;
    procedure WD_BuffClear; dispid 31;
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
