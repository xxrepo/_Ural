unit uRDM_RDM;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, svcWebDoc_TLB, StdVcl, Db, ADODB, Provider, MtUPDPrv, FileCtrl, inifiles;

type
  TrdmWebDoc = class(TRemoteDataModule, IrdmWebDoc)
    ADOConnection1: TADOConnection;
    spWhoIAm: TADOStoredProc;
    spObjGetList: TADOStoredProc;
    dsObjGetList: TSQLUpdateDSProvider;
    ADOStoredProc1: TADOStoredProc;
    dsObjProp: TADOStoredProc;
    cdsObjProp: TSQLUpdateDSProvider;
    dsNS: TSQLUpdateDSProvider;
    spNS: TADOStoredProc;
    spValList: TADOStoredProc;
    dsValList: TSQLUpdateDSProvider;
    spValListVal: TStringField;
    spCAList: TADOStoredProc;
    dsCAList: TSQLUpdateDSProvider;
    spFileList: TADOStoredProc;
    dsFileList: TSQLUpdateDSProvider;
    dsFileProp: TSQLUpdateDSProvider;
    spFileProp: TADOStoredProc;
    spWT: TADOStoredProc;
    dsWT: TSQLUpdateDSProvider;
    spCAInfo: TADOStoredProc;
    dsCAInfo: TSQLUpdateDSProvider;
    spCAListCAName: TStringField;
    spCAListisBayerStr: TStringField;
    spCAListisSellerStr: TStringField;
    spCAListisUsedStr: TStringField;
    spCAListid_Obj: TIntegerField;
    spCAListid_NS: TIntegerField;
    spCAListPID: TIntegerField;
    spCAListid_ObjType: TIntegerField;
    spCAListObjName: TStringField;
    spCAListFileName: TStringField;
    spCAListDeleted: TBooleanField;
    spCAListDateStart: TDateTimeField;
    spCAListDateStop: TDateTimeField;
    spCAListisBayer: TBooleanField;
    spCAListisSeller: TBooleanField;
    spCAListisDef: TBooleanField;
    spCAListObj_Digit1: TBCDField;
    spCAListObj_Digit2: TBCDField;
    spCAListObj_Digit3: TBCDField;
    spCAListObj_Digit4: TBCDField;
    spCAListObj_Digit5: TBCDField;
    spCAListObj_Digit6: TBCDField;
    spCAListObj_Digit7: TBCDField;
    spCAListObj_Digit8: TBCDField;
    spCAListObj_Digit9: TBCDField;
    spCAListObj_Digit10: TBCDField;
    spCAListObj_Str1: TStringField;
    spCAListObj_Str2: TStringField;
    spCAListObj_Str3: TStringField;
    spCAListObj_Str4: TStringField;
    spCAListObj_Str5: TStringField;
    spCAListObj_Str6: TStringField;
    spCAListObj_Str7: TStringField;
    spCAListObj_Str8: TStringField;
    spCAListObj_Str9: TStringField;
    spCAListObj_Str10: TStringField;
    spCAListObj_Date1: TDateTimeField;
    spCAListObj_Date2: TDateTimeField;
    spCAListObj_Date3: TDateTimeField;
    spCAListObj_Date4: TDateTimeField;
    spCAListObj_Date5: TDateTimeField;
    spCAListObj_Date6: TDateTimeField;
    spCAListObj_Date7: TDateTimeField;
    spCAListObj_Date8: TDateTimeField;
    spCAListObj_Date9: TDateTimeField;
    spCAListObj_Date10: TDateTimeField;
    spCAListWorkType: TStringField;
    spCAListRealWorkType: TStringField;
    dsObjPropPname: TStringField;
    dsObjPropObjTypeName: TStringField;
    dsObjPropExtID: TIntegerField;
    dsObjPropid_Obj: TIntegerField;
    dsObjPropid_NS: TIntegerField;
    dsObjPropPID: TIntegerField;
    dsObjPropid_ObjType: TIntegerField;
    dsObjPropObjName: TStringField;
    dsObjPropFileName: TStringField;
    dsObjPropDeleted: TBooleanField;
    dsObjPropDateStart: TDateTimeField;
    dsObjPropDateStop: TDateTimeField;
    dsObjPropisBayer: TBooleanField;
    dsObjPropisSeller: TBooleanField;
    dsObjPropisDef: TBooleanField;
    dsObjPropObj_Digit1: TBCDField;
    dsObjPropObj_Digit2: TBCDField;
    dsObjPropObj_Digit3: TBCDField;
    dsObjPropObj_Digit4: TBCDField;
    dsObjPropObj_Digit5: TBCDField;
    dsObjPropObj_Digit6: TBCDField;
    dsObjPropObj_Digit7: TBCDField;
    dsObjPropObj_Digit8: TBCDField;
    dsObjPropObj_Digit9: TBCDField;
    dsObjPropObj_Digit10: TBCDField;
    dsObjPropObj_Date1: TDateTimeField;
    dsObjPropObj_Date2: TDateTimeField;
    dsObjPropObj_Date3: TDateTimeField;
    dsObjPropObj_Date4: TDateTimeField;
    dsObjPropObj_Date5: TDateTimeField;
    dsObjPropObj_Date6: TDateTimeField;
    dsObjPropObj_Date7: TDateTimeField;
    dsObjPropObj_Date8: TDateTimeField;
    dsObjPropObj_Date9: TDateTimeField;
    dsObjPropObj_Date10: TDateTimeField;
    dsObjPropEmailList: TStringField;
    dsObjPropid_Dic1: TIntegerField;
    dsObjPropid_Dic2: TIntegerField;
    dsObjPropid_Dic3: TIntegerField;
    dsObjPropid_Dic4: TIntegerField;
    dsObjPropid_Dic5: TIntegerField;
    dsObjPropid_Dic6: TIntegerField;
    dsObjPropid_Dic7: TIntegerField;
    dsObjPropid_Dic8: TIntegerField;
    dsObjPropid_Dic9: TIntegerField;
    dsObjPropid_Dic10: TIntegerField;
    spFilePropid_File: TIntegerField;
    spFilePropid_email: TIntegerField;
    spFilePropFileGUID: TStringField;
    spFilePropDeleted: TBooleanField;
    spFilePropid_DocType: TIntegerField;
    spFilePropid_WorkType: TIntegerField;
    spFilePropid_Seller: TIntegerField;
    spFilePropid_Bayer: TIntegerField;
    spFilePropid_Org3: TIntegerField;
    spFilePropid_Org4: TIntegerField;
    spFilePropDocNum: TStringField;
    spFilePropDocDate: TDateTimeField;
    spFilePropDocDateStop: TDateTimeField;
    spFilePropDateCreate: TDateTimeField;
    spFilePropisAutoLong: TBooleanField;
    spFilePropDocSumm: TBCDField;
    spFilePropid_Crn: TIntegerField;
    spFilePropid_State: TIntegerField;
    spFilePropComment: TStringField;
    spFilePropxVers: TIntegerField;
    spFilePropCalcName: TStringField;
    spFilePropOrigName: TStringField;
    spFilePropFileInfo: TStringField;
    spFilePropFileSize: TIntegerField;
    spFilePropAdv_Digit1: TBCDField;
    spFilePropAdv_Digit2: TBCDField;
    spFilePropAdv_Digit3: TBCDField;
    spFilePropAdv_Digit4: TBCDField;
    spFilePropAdv_Digit5: TBCDField;
    spFilePropAdv_Digit6: TBCDField;
    spFilePropAdv_Digit7: TBCDField;
    spFilePropAdv_Digit8: TBCDField;
    spFilePropAdv_Digit9: TBCDField;
    spFilePropAdv_Digit10: TBCDField;
    spFilePropAdv_Date1: TDateTimeField;
    spFilePropAdv_Date2: TDateTimeField;
    spFilePropAdv_Date3: TDateTimeField;
    spFilePropAdv_Date4: TDateTimeField;
    spFilePropAdv_Date5: TDateTimeField;
    spFilePropAdv_Date6: TDateTimeField;
    spFilePropAdv_Date7: TDateTimeField;
    spFilePropAdv_Date8: TDateTimeField;
    spFilePropAdv_Date9: TDateTimeField;
    spFilePropAdv_Date10: TDateTimeField;
    spFilePropid_DicFile1: TIntegerField;
    spFilePropid_DicFile2: TIntegerField;
    spFilePropid_DicFile3: TIntegerField;
    spFilePropid_DicFile4: TIntegerField;
    spFilePropid_DicFile5: TIntegerField;
    spFilePropid_DicFile6: TIntegerField;
    spFilePropid_DicFile7: TIntegerField;
    spFilePropid_DicFile8: TIntegerField;
    spFilePropid_DicFile9: TIntegerField;
    spFilePropid_DicFile10: TIntegerField;
    spFilePropID_NS: TIntegerField;
    spFilePropBayerName: TStringField;
    spFilePropBayerCAName: TStringField;
    spFilePropBayerID_CA: TIntegerField;
    spFilePropSellerName: TStringField;
    spFilePropSellerCAName: TStringField;
    spFilePropSellerID_CA: TIntegerField;
    spFilePropisBayer: TBooleanField;
    spFilePropisSeller: TBooleanField;
    spFilePropOrg3Name: TStringField;
    spFilePropOrg4Name: TStringField;
    spFilePropWorkTypeName: TStringField;
    spFilePropDocTypeName: TStringField;
    spFilePropStateName: TStringField;
    spFilePropCrnName: TStringField;
    spFilePropEmailDateCreate: TDateTimeField;
    spFilePropEmailDate: TDateTimeField;
    spFilePropEmailFrom: TStringField;
    spFilePropEmailName: TStringField;
    spFilePropEmailTo: TStringField;
    spFilePropSubj: TStringField;
    spFilePropAdv_Str1: TStringField;
    spFilePropAdv_Str2: TStringField;
    spFilePropAdv_Str3: TStringField;
    spFilePropAdv_Str4: TStringField;
    spFilePropAdv_Str5: TStringField;
    spFilePropAdv_Str6: TStringField;
    spFilePropAdv_Str7: TStringField;
    spFilePropAdv_Str8: TStringField;
    spFilePropAdv_Str9: TStringField;
    spFilePropAdv_Str10: TStringField;
    spUsers: TADOStoredProc;
    dsUsers: TSQLUpdateDSProvider;
    dsUserProp: TSQLUpdateDSProvider;
    spUserProp: TADOStoredProc;
    spUserPropid_User: TAutoIncField;
    spUserPropFIO: TStringField;
    spUserPropUSERNAME: TStringField;
    spUserPropid_UADM: TBooleanField;
    spDDD: TADOStoredProc;
    dsDDD: TSQLUpdateDSProvider;
    spFileCalcName: TADOStoredProc;
    spFileCalcNameCalcName: TStringField;
    spWhoIAmid_user: TAutoIncField;
    spWhoIAmFIO: TStringField;
    spWhoIAmUSERNAME: TStringField;
    spWhoIAmLC_deleted: TBooleanField;
    spWhoIAmid_UADM: TBooleanField;
    spErr: TADOStoredProc;
    dsFindCAByEmail: TSQLUpdateDSProvider;
    spFindCAByEmail: TADOStoredProc;
    spFilePropxID_NS: TIntegerField;
    spFilePropid_User_F: TIntegerField;
    spFilePropid_User_L: TIntegerField;
    spFilePropLastEdit: TDateTimeField;
    spFilePropid_WorkType2: TIntegerField;
    spFilePropid_WorkType3: TIntegerField;
    spFilePropid_WorkType4: TIntegerField;
    spFilePropid_WorkType5: TIntegerField;
    spFilePropBayerDeleted: TBooleanField;
    spFilePropSellerDeleted: TBooleanField;
    spFilePropFIO: TStringField;
    spFilePropLastFIO: TStringField;
    spFilePropWorkTypeName1: TStringField;
    spFilePropWorkTypeName2: TStringField;
    spFilePropWorkTypeName3: TStringField;
    spFilePropWorkTypeName4: TStringField;
    spFilePropWorkTypeName5: TStringField;
    spBuffCnt: TADOStoredProc;
    spBuffCntCnt: TIntegerField;
    spMSG: TADOStoredProc;
    StringField1: TStringField;
    procedure RemoteDataModuleCreate(Sender: TObject);
  private

    procedure SQLUpdateDSUpdateError(Sender: TObject;
      DataSet: TClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure LogMessage(Message: String; EventType: DWord = 1; Category: Word = 0; ID: DWord = 0);
    function GetFileP(id_File: Integer): String;
    function FileCalcName(id_File: integer): String;
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function DoLogin(UserName, Password: OleVariant): Integer; safecall;
    procedure BeginTruns; safecall;
    procedure CommitTrans; safecall;
    procedure RollbackTrans; safecall;
    function FileDLD_OpenFile(id_File: Integer): Integer; safecall;
    function FileDLD_GetFileData(out Data: OleVariant;
      ArraySize: Integer): Integer; safecall;
    procedure FileDLD_CloseFile; safecall;
    procedure FileUpl_OpenFile(id_File: Integer; FileName: OleVariant);
      safecall;
    procedure FileUpl_SaveFile; safecall;
    function FileUpl_SetFileData(Data: OleVariant): Integer; safecall;
    function GetVVVer: Integer; safecall;
    function Get_FIO: OleVariant; safecall;
    function Get_id_User: Integer; safecall;
    function ObjDel(id_Obj: Integer): Integer; safecall;
    function WD_Obj_UnEdit(id_Obj, id_NS, PID, ExtID, ObjName, FileName,
      DateStart, DateStop, isBayer, isSeller, isDef, Obj_Digit1,
      Obj_Digit2, Obj_Digit3, Obj_Digit4, Obj_Digit5, Obj_Digit6,
      Obj_Digit7, Obj_Digit8, Obj_Digit9, Obj_Digit10, Obj_Date1,
      Obj_Date2, Obj_Date3, Obj_Date4, Obj_Date5, Obj_Date6, Obj_Date7,
      Obj_Date8, Obj_Date9, Obj_Date10, EmailList, id_Dic1, id_Dic2,
      id_Dic3, id_Dic4, id_Dic5, id_Dic6, id_Dic7, id_Dic8, id_Dic9,
      id_Dic10: OleVariant): Integer; safecall;
    function NS_NSEdit(id_NS, NSName, FileNameRules: OleVariant): Integer;
      safecall;
    function WD_File_UnEdit(id_File, EmailDate, EmailFrom, EmailName, EmailTo,
      Subj, xID_NS, id_DocType, id_WorkType, id_Seller, id_Bayer, id_Org3,
      id_Org4, DocNum, DocDate, DocDateStop, isAutoLong, DocSumm, id_Crn,
      id_State, Comment, xVers, OrigName, FileInfo, FileSize, Adv_Digit1,
      Adv_Digit2, Adv_Digit3, Adv_Digit4, Adv_Digit5, Adv_Digit6,
      Adv_Digit7, Adv_Digit8, Adv_Digit9, Adv_Digit10, Adv_Date1,
      Adv_Date2, Adv_Date3, Adv_Date4, Adv_Date5, Adv_Date6, Adv_Date7,
      Adv_Date8, Adv_Date9, Adv_Date10, id_DicFile1, id_DicFile2,
      id_DicFile3, id_DicFile4, id_DicFile5, id_DicFile6, id_DicFile7,
      id_DicFile8, id_DicFile9, id_DicFile10: OleVariant): Integer;
      safecall;
    function GetId_FileByGUID(FileGUID: OleVariant): Integer; safecall;
    function WD_ObjSetWT(id_Obj, IDList: OleVariant): Integer; safecall;
    function WD_CheckEmail(Email, id_Obj: OleVariant): OleVariant; safecall;
    function USR_UserDel(id_User: Integer): Integer; safecall;
    function USR_USER_UnEdit(id_User, FIO, UserName, LC_PSW, IDNSList,
      id_UADM: OleVariant): Integer; safecall;
    function NS_NSDel(id_NS: Integer): Integer; safecall;
    function FileDel(id_File: Integer): Integer; safecall;
    function WD_Obj_Check(id_Obj, id_NS, ExtID, ObjName,
      FileName: OleVariant): Integer; safecall;
    function NS_NameRules_UnEdit(id_NameRules, id_NS, ColName, ParamName,
      OrderID, isInt, isVisible, inName: OleVariant): Integer; safecall;
    function is_Admin: WordBool; safecall;
    procedure WD_FileSetRead(id_File, id_User: Integer); safecall;
    procedure CheckFileExists(id_File: Integer); safecall;
    function WD_File_UnEdit_v2(id_File, EmailDate, EmailFrom, EmailName,
      EmailTo, Subj, xID_NS, id_DocType, id_WorkType, id_WorkType2,
      id_WorkType3, id_WorkType4, id_WorkType5, id_Seller, id_Bayer,
      id_Org3, id_Org4, DocNum, DocDate, DocDateStop, isAutoLong, DocSumm,
      id_Crn, id_State, Comment, xVers, OrigName, FileInfo, FileSize,
      Adv_Digit1, Adv_Digit2, Adv_Digit3, Adv_Digit4, Adv_Digit5,
      Adv_Digit6, Adv_Digit7, Adv_Digit8, Adv_Digit9, Adv_Digit10,
      Adv_Date1, Adv_Date2, Adv_Date3, Adv_Date4, Adv_Date5, Adv_Date6,
      Adv_Date7, Adv_Date8, Adv_Date9, Adv_Date10, id_DicFile1,
      id_DicFile2, id_DicFile3, id_DicFile4, id_DicFile5, id_DicFile6,
      id_DicFile7, id_DicFile8, id_DicFile9,
      id_DicFile10: OleVariant): Integer; safecall;
    procedure WD_BuffAdd(id_File: Integer; isAdd: WordBool); safecall;
    function WD_BuffCnt: Integer; safecall;
    procedure WD_BuffClear; safecall;
  public
    FS : TFileStream;
    FS_Upl : TMemoryStream;
    Fid_User, CreateDate : variant;
    FFullFIO, xDefPath : String;
    FIs_Admin : boolean;

    xid_File, xid_NS: Integer;
    xFileName: OleVariant;
    FBaseName, FUserName, FPassword, FDataBaseName: Variant;

    procedure AddToProt(AMsg : String; id_prsn : integer = -1);
    function Un_Del(AProcedureName, ParamName: String; AID: Integer): Integer;
    procedure OnGetParamVal(Sender: TObject; AParam: TParam);

    procedure SetTParametersVal(AParameters: TParameters; AName: String;
      AVal: Variant);
    procedure SetProcedureName(AProcedureName: String);
    function ExecSP : integer;

    function GetFileStoragePath : String;
    procedure SaveInLogFile(Atext: String; ALog: boolean);
  end;

implementation

uses tstSvcForm, uMeCrpt, uEventLogger;

{$R *.DFM}

class procedure TrdmWebDoc.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;


procedure GetFileList(SL : TStrings; RootDir : String; FileMask : String; AClearList : boolean = true);
  procedure INTGetFileList(SL : TStrings; RootDir : String; FileMask : String);
  var
    sr: TSearchRec;
  begin
    if FindFirst(RootDir + '\' + FileMask, faAnyFile, sr) = 0 then
    begin
      repeat
        if (sr.Name <> '.') and (sr.Name <> '..') then
        begin
          if (sr.Attr and faDirectory = 0) then
            SL.Add(RootDir + '\' + sr.Name);
        end;
      until FindNext(sr) <> 0;
      Sysutils.FindClose(sr);
    end;
    
    if FindFirst(RootDir + '\*.*', faDirectory, sr) = 0 then
    begin
      repeat
        if (sr.Name <> '.') and (sr.Name <> '..') then
        begin
            INTGetFileList(SL, RootDir + '\' + sr.Name, FileMask);
        end;
      until FindNext(sr) <> 0;
      Sysutils.FindClose(sr);
    end;
  end;
begin
  if AClearList then
    SL.Clear;
  INTGetFileList(SL, RootDir, FileMask);
end;



procedure TrdmWebDoc.RemoteDataModuleCreate(Sender: TObject);
var Buffer : PChar;
    Len : DWORD;
    CmpName : String;
    i : integer;

    S : String;
    SL : TStringList;
    IniFile : TIniFile;
begin
  Fid_User := Null;
  CreateDate := Now;
  SvcForm.AddRDM(Self);

 // THackAdoDataSet(spArc2).CommandTimeout := 60*3;
 // THackAdoDataSet(spBal_v2).CommandTimeout := 60*3;

  Fid_User := Null;
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TSQLUpdateDSProvider) and (Assigned(TSQLUpdateDSProvider(Components[i]))) then
      TSQLUpdateDSProvider(Components[i]).OnUpdateError := SQLUpdateDSUpdateError;

    if (Components[i] is TSQLUpdateDSProvider) then //and (Assigned(TSQLUpdateDSProvider(Components[i]))) then
      TSQLUpdateDSProvider(Components[i]).OnGetParamVal := OnGetParamVal;

  end;

  try
    Len := 256;
    Buffer := AllocMem(Len);
    GetComputerName(Buffer, Len);
    CmpName := StrPas(Buffer);
  finally
    FreeMem(Buffer, Len);
  end;
// ****************************************************************************
  FUserName := 'rm';
  FPassword := 'rm';

  S := ChangeFileExt(ParamStr(0), '.key');
  if  FileExists(S) then
  begin
    SL := TStringList.Create;
    try
      SL.Text := FileToStr(S);
      with SL do
      begin
        S := SL.Text;//Values['ConnectionString'];
      end;
      ADOConnection1.Close;
      ADOConnection1.ConnectionString := S;
    finally
      SL.Free;
    end;
  end;

  S := ChangeFileExt(ParamStr(0), '.ini');
  if  FileExists(S) then
  begin
    IniFile := TIniFile.Create(S);
    with IniFile do
    begin
      if ValueExists('FileStorage', 'DefPath') then
        xDefPath := ReadString('FileStorage', 'DefPath', '');

      if ValueExists('FDataBaseName', 'FDataBaseName') then
        FDataBaseName := ReadString('FDataBaseName', 'FDataBaseName', 'WebDoc');


    end;

    IniFile.Free;
  end
end;

function TrdmWebDoc.DoLogin(UserName, Password: OleVariant): Integer;
var S, FConnectionString, SSS : String;
    SL : TStringList;
begin
  S := ExtractFilePath(ParamStr(0)) + 'Key.ack';

  if not FileExists(S) then
  begin
    raise Exception.Create('Не найден файл-ключ ' + S);
    Exit;
  end;
  with ADOConnection1 do
  begin
   Connected := false;
{   ConnectionString := 'Provider=SQLOLEDB.1;Password="' +
     String(FPassword) + '";Persist Security Info=True;User ID=' +
     String(FUserName) + ';Initial Catalog=' +
     String(FDataBaseName)
     + ';Data Source=' + FBaseName +
                        ';Use Procedure for Prepare=1;Auto Translate=True;Application Name=' +Self.Name + '4.0;Packet Size=4096;';
 }
{    ConnectionString := 'Provider=SQLOLEDB.1;Integrated Security=SSPI' +
     ';Persist Security Info=True;User ID=' +
     String(FUserName) + ';Initial Catalog=' +
     String(FDataBaseName)
     + ';Data Source=' + FBaseName +
                        ';Use Procedure for Prepare=1;Auto Translate=True;Application Name=' +Self.Name + '4.0;Packet Size=4096;';
}
  try
     try
 
  if  FileExists(S) then
  begin
    SL := TStringList.Create;
    try
      SL.Text := FileToStr(S);
      with SL do
      begin
        FBaseName := Values['DB'];
        FUserName := Values['UserName'];
        FPassword := Values['Password'];
      end;
    finally
      SL.Free;
    end;
  end               

  else
      raise Exception.Create('Не найден файл-ключ ' + S);
  {  if POS('26', FBaseName) > 0 then
     FDataBaseName := 'WDoc'
    else
     FDataBaseName := 'WebDoc'; }
   ConnectionString := 'Provider=SQLOLEDB.1;Password="' +
     String(FPassword) + '";Persist Security Info=True;User ID=' +
     String(FUserName) + ';Initial Catalog=' +
     String(FDataBaseName)
     + ';Data Source=' + FBaseName +
                        ';Use Procedure for Prepare=1;Auto Translate=True;Application Name=' + Self.Name {+ '*' + UserName} + '*4.0;Packet Size=4096;';
       Connected := true;
     except
       on E : Exception do
       begin
         raise Exception.Create('*** Ошибка соединения с базой ConnectionString="' + ConnectionString+ '" ' + #13 + #10 +
         'path= "' + S + '"' + #13 + #10 + E.Message);
       end;
     end;
     with spWhoIAm do
     begin
       Close;
       try
         Parameters.ParamByName('@Login').Value := UserName;
         Parameters.ParamByName('@Password').Value := Password;
         Open;
      //   if IsEmpty then
      //     raise Exception.Create('Неверный пароль для пользователя ' + UserName);
         if IsEmpty then
         begin
           AddToProt('Пользователь ' + UserName + ' пытался войти в систему c ошибочным паролем');
           Exit;
         end;
         if FieldByName('lc_deleted').AsBoolean then
         begin
           AddToProt('Заблокированный пользователь ' + UserName + ' пытался войти в систему');
           raise Exception.Create('Запрещен вход пользователю ' + UserName);
         end;
         Fid_User := FieldByName('id_User').AsVariant;
         FIs_Admin := spWhoIAmid_UADM.AsBoolean;
         
         FFullFio := FieldByName('fio').AsString;
         Result := 1;
         AddToProt('Пользователь вошел в систему');
       finally
         Close;
       end;
     end;
   except
     on E : Exception do
     begin
       Result := 26;
       LogMessage('Ошибка при подключени к базе ' + FUserName+ ' '  + FPassword + ' '  + E.Message, EVENTLOG_ERROR_TYPE, 1, 1);
       raise Exception.Create('Ошибка при входе в базу '  + E.Message);
     end;
   end;
 end;

end;

procedure TrdmWebDoc.LogMessage(Message: String; EventType: DWord;
  Category: Word; ID: DWord);
begin

  FEventLogger.LogMessage(Message, EventType, Category, ID);
end;


procedure TrdmWebDoc.SQLUpdateDSUpdateError(Sender: TObject;
  DataSet: TClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  LogMessage(E.Message, EVENTLOG_ERROR_TYPE);

end;


procedure TrdmWebDoc.BeginTruns;
begin
  ADOConnection1.BeginTrans;
end;

procedure TrdmWebDoc.CommitTrans;
begin
  ADOConnection1.CommitTrans;
end;

procedure TrdmWebDoc.RollbackTrans;
begin
  ADOConnection1.RollbackTrans;
end;

procedure TrdmWebDoc.AddToProt(AMsg: String; id_prsn: integer);
begin

end;

function TrdmWebDoc.FileDLD_OpenFile(id_File: Integer): Integer;
var SPath, S : String;
    Buffer : PChar;
    Len : DWORD;
begin
  Result := 0;
  SPath := GetFileP(id_File);

  if FileExists(SPath) then
  begin
     FS := TFileStream.Create(SPath, fmOpenRead or fmShareDenyWrite);
     Result := FS.Size;
  end
  else
  begin
    try
      Len := 256;
      Buffer := AllocMem(Len);
      GetComputerName(Buffer, Len);
    finally
  //    FreeMem(Buffer, Len);
    end;
    if (SPath = '') then
    begin
        raise Exception.Create('Не определен путь к файлу №' + IntToStr(id_File) + #13 + #10 +
                                'Компьютер: ' + StrPas(Buffer) + #13 + #10 +
                                'Хранилище: ' + GetFileStoragePath);
    end;

    if not FileExists(SPath) then
      S :=  #13 + #10 + 'Не найден файл ' + SPath
    else
      S := '';
    
    raise Exception.Create('Не найден файл №' + IntToStr(id_File) + #13 + #10 +
                                'Компьютер: ' + StrPas(Buffer) + #13 + #10 +
                                'Хранилище: ' + GetFileStoragePath + S);
  end;
end;

function TrdmWebDoc.GetFileP(id_File: Integer): String;
var SL : TStringList;
    
begin
  Result := '';
  SL := TStringList.Create;
  try
    GetFileList(SL, GetFileStoragePath, 'id_' + IntToStr(id_File) + '-*', true);

    if SL.Count > 0 then
    begin
      Result := SL[0];
    end;
  finally
    SL.Free;
  end;
end;


function TrdmWebDoc.FileDLD_GetFileData(out Data: OleVariant;
  ArraySize: Integer): Integer;
var
  PData: PByteArray;
begin
  Data := VarArrayCreate([0, ArraySize - 1], varByte);
  PData := VarArrayLock(Data);
  try
    Result := FS.Read(PData^, VarArrayHighBound(Data, 1) + 1);
  finally
    VarArrayUnlock(Data);
  end;  
end;

procedure TrdmWebDoc.FileDLD_CloseFile;
begin
 if Assigned(FS) then
  begin
    FS.Free;
    FS := nil;
  end;
end;

procedure TrdmWebDoc.FileUpl_OpenFile(id_File: Integer;
  FileName: OleVariant);
var SPath : String;
begin
  SPath := GetFileP(id_File);
  if FileExists(SPath) then DeleteFile(SPath);

  xid_File := id_File;
  xFileName := FileName;
  
  FS_Upl := TMemoryStream.Create();
end;

procedure TrdmWebDoc.FileUpl_SaveFile;
begin
  FS_Upl.SaveToFile('c:\prj\webdoc\ProgRam\AppServer\' + xFileName);
end;

function TrdmWebDoc.FileUpl_SetFileData(Data: OleVariant): Integer;
var PData: PByteArray;
    SPath, sPPP : String;
begin
  SaveInLogFile('FileUpl_SetFileData - 000', true);
  Result := -1;
  try
    PData := VarArrayLock(Data);
    FS_Upl.Write(PData^, VarArrayHighBound(Data, 1));
    SPath := GetFileStoragePath + '\' + IntToStr(xID_NS) + '\' + FormatDateTime('yyyy-mm', now);
    if not DirectoryExists(SPath) then
      ForceDirectories(SPath);

    SPath := SPath + '\id_' + IntToStr(xid_File) + '-' + FileCalcName(xid_File);
    SaveInLogFile('FileUpl_SetFileData - ' + SPath, true);
  //  sPPP := ExtractFilePath(SPath);
  //  if not DirectoryExists(sPPP) then ForceDirectories(sPPP);
    
    FS_Upl.SaveToFile(SPath);
    SaveInLogFile('FileUpl_SetFileData - 2', true);
    if FileExists(SPath) then Result := 1;
    SaveInLogFile('FileUpl_SetFileData - Result = ' + IntToStr(Result), true);
    CheckFileExists(xid_File);
  except
    on E : Exception
        do SaveInLogFile('Ошибка при заливке файла. ' + E.Message, true);
  end;
end;

function TrdmWebDoc.GetVVVer: Integer;
begin
  Result := VVVer;

end;

function TrdmWebDoc.Get_FIO: OleVariant;
begin
  Result := FFullFio;
end;

function TrdmWebDoc.Get_id_User: Integer;
begin
  Result := Fid_User;
end;

function TrdmWebDoc.ObjDel(id_Obj: Integer): Integer;
begin
  Result := Un_Del('WD_ObjDel', '@id_Obj', id_Obj);
end;

procedure TrdmWebDoc.SaveInLogFile(Atext : String; ALog : boolean);
var SL : TStringList;
    S, SSS : String;
    FileHandle : Integer;
begin
  Exit;
  spMSG.Parameters.ParamByName('@msg').Value := Atext;
  spMSG.ExecProc; 
  Exit;
  
  if not ALog then Exit;
  SSS := 'nnn';
   try
    S := ExtractFilePath(ParamStr(0)) + 'ErrorSvc.log';
    if FileExists(S) then
    begin
      try
        FileHandle := FileOpen(S, fmOpenReadWrite or fmShareDenyNone);
      finally
        FileClose(FileHandle);
      end;
    end
    else
      FileHandle := 1;
    if FileHandle > 0 then
    begin
      try
        SL := TStringList.Create;
        if FileExists(S) then
          SL.LoadFromFile(S);
        SL.Insert(0, DateTimeToStr(Now) + ' - ' + SSS + ' - ' + Atext);
        while SL.Count > 100 do
          SL.Delete(0);
        SL.SaveToFile(S);
      finally
        SL.Free;
      end;
    end;
  finally

  end;
end;

function TrdmWebDoc.Un_Del(AProcedureName, ParamName: String;
  AID: Integer): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := AProcedureName;
      Parameters.Refresh;

      SetTParametersVal(Parameters, ParamName, AID);

      ExecProc;
      Result := 1;
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(AProcedureName + ' ' + E.Message);
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

procedure TrdmWebDoc.OnGetParamVal(Sender: TObject; AParam: TParam);
begin
  if LowerCase(AParam.Name) = 'id_user' then
    AParam.Value := Fid_User;
end;

procedure TrdmWebDoc.SetTParametersVal(AParameters: TParameters;
  AName: String; AVal: Variant);
var AParam : TParameter;
begin
  AParam := AParameters.FindParam(AName);
  if AParam <> nil then
    AParameters.FindParam(AName).Value := AVal;
end;

procedure TrdmWebDoc.SetProcedureName(AProcedureName: String);
begin
  with ADOStoredProc1 do
  begin
      Close;
      ProcedureName := AProcedureName;
      Parameters.Refresh;
      SetTParametersVal(Parameters, '@id_User', Fid_User);
  end;
end;

function TrdmWebDoc.WD_Obj_UnEdit(id_Obj, id_NS, PID, ExtID, ObjName,
  FileName, DateStart, DateStop, isBayer, isSeller, isDef, Obj_Digit1,
  Obj_Digit2, Obj_Digit3, Obj_Digit4, Obj_Digit5, Obj_Digit6, Obj_Digit7,
  Obj_Digit8, Obj_Digit9, Obj_Digit10, Obj_Date1, Obj_Date2, Obj_Date3,
  Obj_Date4, Obj_Date5, Obj_Date6, Obj_Date7, Obj_Date8, Obj_Date9,
  Obj_Date10, EmailList, id_Dic1, id_Dic2, id_Dic3, id_Dic4, id_Dic5,
  id_Dic6, id_Dic7, id_Dic8, id_Dic9, id_Dic10: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'WD_Obj_UnEdit';
      Parameters.Refresh;

      SetTParametersVal(Parameters, '@id_Obj', id_Obj);
      SetTParametersVal(Parameters, '@id_NS', id_NS);
      SetTParametersVal(Parameters, '@PID', PID);
      SetTParametersVal(Parameters, '@ExtID', ExtID);
      SetTParametersVal(Parameters, '@ObjName', ObjName);
      SetTParametersVal(Parameters, '@FileName', FileName);
      SetTParametersVal(Parameters, '@DateStart', DateStart);
      SetTParametersVal(Parameters, '@DateStop', DateStop);
      SetTParametersVal(Parameters, '@isBayer', isBayer);
      SetTParametersVal(Parameters, '@isSeller', isSeller);
      SetTParametersVal(Parameters, '@isDef', isDef);
      SetTParametersVal(Parameters, '@Obj_Digit1', Obj_Digit1);
      SetTParametersVal(Parameters, '@Obj_Digit2', Obj_Digit2);
      SetTParametersVal(Parameters, '@Obj_Digit3', Obj_Digit3);
      SetTParametersVal(Parameters, '@Obj_Digit4', Obj_Digit4);
      SetTParametersVal(Parameters, '@Obj_Digit5', Obj_Digit5);
      SetTParametersVal(Parameters, '@Obj_Digit6', Obj_Digit6);
      SetTParametersVal(Parameters, '@Obj_Digit7', Obj_Digit7);
      SetTParametersVal(Parameters, '@Obj_Digit8', Obj_Digit8);
      SetTParametersVal(Parameters, '@Obj_Digit9', Obj_Digit9);
      SetTParametersVal(Parameters, '@Obj_Digit10', Obj_Digit10);
      SetTParametersVal(Parameters, '@Obj_Date1', Obj_Date1);
      SetTParametersVal(Parameters, '@Obj_Date2', Obj_Date2);
      SetTParametersVal(Parameters, '@Obj_Date3', Obj_Date3);
      SetTParametersVal(Parameters, '@Obj_Date4', Obj_Date4);
      SetTParametersVal(Parameters, '@Obj_Date5', Obj_Date5);
      SetTParametersVal(Parameters, '@Obj_Date6', Obj_Date6);
      SetTParametersVal(Parameters, '@Obj_Date7', Obj_Date7);
      SetTParametersVal(Parameters, '@Obj_Date8', Obj_Date8);
      SetTParametersVal(Parameters, '@Obj_Date9', Obj_Date9);
      SetTParametersVal(Parameters, '@Obj_Date10', Obj_Date10);
      SetTParametersVal(Parameters, '@EmailList', EmailList);
      SetTParametersVal(Parameters, '@id_Dic1', id_Dic1);
      SetTParametersVal(Parameters, '@id_Dic2', id_Dic2);
      SetTParametersVal(Parameters, '@id_Dic3', id_Dic3);
      SetTParametersVal(Parameters, '@id_Dic4', id_Dic4);
      SetTParametersVal(Parameters, '@id_Dic5', id_Dic5);
      SetTParametersVal(Parameters, '@id_Dic6', id_Dic6);
      SetTParametersVal(Parameters, '@id_Dic7', id_Dic7);
      SetTParametersVal(Parameters, '@id_Dic8', id_Dic8);
      SetTParametersVal(Parameters, '@id_Dic9', id_Dic9);
      SetTParametersVal(Parameters, '@id_Dic10', id_Dic10);

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];


    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TrdmWebDoc.NS_NSEdit(id_NS, NSName,
  FileNameRules: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    SetProcedureName('NS_NSUnEdit');
    SetTParametersVal(Parameters, '@NSName', NSName);
    SetTParametersVal(Parameters, '@FileNameRules', FileNameRules);
    SetTParametersVal(Parameters, '@id_NS', id_NS);
    Result := ExecSP;
  end;


{  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'NS_NSUnEdit';
      Parameters.Refresh;

      SetTParametersVal(Parameters, '@NSName', NSName);
      SetTParametersVal(Parameters, '@id_NS', id_NS);

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;  }
end;

function TrdmWebDoc.WD_File_UnEdit(id_File, EmailDate, EmailFrom,
  EmailName, EmailTo, Subj, xID_NS, id_DocType, id_WorkType, id_Seller,
  id_Bayer, id_Org3, id_Org4, DocNum, DocDate, DocDateStop, isAutoLong,
  DocSumm, id_Crn, id_State, Comment, xVers, OrigName, FileInfo, FileSize,
  Adv_Digit1, Adv_Digit2, Adv_Digit3, Adv_Digit4, Adv_Digit5, Adv_Digit6,
  Adv_Digit7, Adv_Digit8, Adv_Digit9, Adv_Digit10, Adv_Date1, Adv_Date2,
  Adv_Date3, Adv_Date4, Adv_Date5, Adv_Date6, Adv_Date7, Adv_Date8,
  Adv_Date9, Adv_Date10, id_DicFile1, id_DicFile2, id_DicFile3,
  id_DicFile4, id_DicFile5, id_DicFile6, id_DicFile7, id_DicFile8,
  id_DicFile9, id_DicFile10: OleVariant): Integer;
begin
  Result := WD_File_UnEdit_v2(id_File, EmailDate, EmailFrom,
  EmailName, EmailTo, Subj, xID_NS, id_DocType, id_WorkType, null,
  null, null, null, id_Seller, id_Bayer, id_Org3,
  id_Org4, DocNum, DocDate, DocDateStop, isAutoLong, DocSumm, id_Crn,
  id_State, Comment, xVers, OrigName, FileInfo, FileSize, Adv_Digit1,
  Adv_Digit2, Adv_Digit3, Adv_Digit4, Adv_Digit5, Adv_Digit6, Adv_Digit7,
  Adv_Digit8, Adv_Digit9, Adv_Digit10, Adv_Date1, Adv_Date2, Adv_Date3,
  Adv_Date4, Adv_Date5, Adv_Date6, Adv_Date7, Adv_Date8, Adv_Date9,
  Adv_Date10, id_DicFile1, id_DicFile2, id_DicFile3, id_DicFile4,
  id_DicFile5, id_DicFile6, id_DicFile7, id_DicFile8, id_DicFile9,
  id_DicFile10);
end;

function TrdmWebDoc.WD_ObjSetWT(id_Obj, IDList: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'WD_ObjSetWT';
      Parameters.Refresh;

      SetTParametersVal(Parameters, '@id_Obj', id_Obj);
      SetTParametersVal(Parameters, '@IDList', IDList);

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TrdmWebDoc.WD_CheckEmail(Email, id_Obj: OleVariant): OleVariant;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    SetProcedureName('WD_CheckEmail');
    SetTParametersVal(Parameters, '@Email', Email);
    SetTParametersVal(Parameters, '@id_Obj', id_Obj);
    Open;
    Result := fieldByName('CAList').asstring;
    Close;
  end;
end;

function TrdmWebDoc.ExecSP: integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

function TrdmWebDoc.USR_UserDel(id_User: Integer): Integer;
begin
  Result := Un_Del('USR_UserDel', '@id_User', id_User);
end;

function TrdmWebDoc.USR_USER_UnEdit(id_User, FIO, UserName, LC_PSW,
  IDNSList, id_UADM: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    SetProcedureName('USR_USER_UnEdit');
    SetTParametersVal(Parameters, '@id_User', id_User);
    SetTParametersVal(Parameters, '@FIO', FIO);
    SetTParametersVal(Parameters, '@USERNAME', USERNAME);
    SetTParametersVal(Parameters, '@LC_PSW', LC_PSW);
    SetTParametersVal(Parameters, '@id_UADM', id_UADM);
    SetTParametersVal(Parameters, '@IDNSList', IDNSList);
    Result := ExecSP;
  end;
end;

function TrdmWebDoc.NS_NSDel(id_NS: Integer): Integer;
begin
  Result := Un_Del('NS_NSDel', '@id_NS', id_NS);
end;

function TrdmWebDoc.FileDel(id_File: Integer): Integer;
var SPath : String;
begin
  SPath := GetFileP(id_File);
  if FileExists(SPath) then
    RenameFile(SPath, StringReplace(SPath, 'id_', 'deleted_id_', []));

  Result := Un_Del('WD_File_Del', '@id_File', id_File);
end;

function TrdmWebDoc.WD_Obj_Check(id_Obj, id_NS, ExtID, ObjName,
  FileName: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    SetProcedureName('WD_Obj_Check');
    SetTParametersVal(Parameters, '@id_Obj', id_Obj);
    SetTParametersVal(Parameters, '@id_NS', id_NS);
    SetTParametersVal(Parameters, '@ExtID', ExtID);
    SetTParametersVal(Parameters, '@ObjName', ObjName);
    SetTParametersVal(Parameters, '@FileName', FileName);
    Open;
    Result := FieldByName('CNT').AsInteger;
    Close;
  end;
end;

function TrdmWebDoc.NS_NameRules_UnEdit(id_NameRules, id_NS, ColName,
  ParamName, OrderID, isInt, isVisible, inName: OleVariant): Integer;
begin
  with ADOStoredProc1 do
  begin
    SetProcedureName('NS_NameRules_UnEdit');
    SetTParametersVal(Parameters, '@id_NameRules', id_NameRules);
    SetTParametersVal(Parameters, '@id_NS', id_NS);
    SetTParametersVal(Parameters, '@ColName', ColName);
    SetTParametersVal(Parameters, '@ParamName', ParamName);
    SetTParametersVal(Parameters, '@OrderID', OrderID);
    SetTParametersVal(Parameters, '@isInt', isInt);
    SetTParametersVal(Parameters, '@isVisible', isVisible);
    SetTParametersVal(Parameters, '@inName', inName);
    Result := ExecSP;
  end;
end;

function TrdmWebDoc.FileCalcName(id_File : integer): String;
begin
  Result := '';
  with spFileCalcName do
  begin
    SetTParametersVal(Parameters, '@id_File', id_File);
    Open;
    Result := spFileCalcNameCalcName.AsString;
    Close;
  end;
end;


function TrdmWebDoc.is_Admin: WordBool;
begin
  Result := FIs_Admin;
end;

function TrdmWebDoc.GetFileStoragePath: String;
begin
  Result := xDefPath;
  if Result = '' then
  begin
    Result := ExtractFilePath(ParamStr(0)) + 'FStore';
  end;
end;

procedure TrdmWebDoc.WD_FileSetRead(id_File, id_User: Integer);
begin
  with ADOStoredProc1 do
  begin
    SetProcedureName('WD_FileSetRead');
    SetTParametersVal(Parameters, '@id_File', id_File);
    SetTParametersVal(Parameters, '@id_User', id_User);
    ExecSP;
    Close;
  end;
end;

function GetFileSizeByName(FileName: String): Integer;
var
  FindData: TWin32FindData; 
  hFind: THandle; 
begin 
  Result := -1;
  hFind := FindFirstFile(PChar(FileName), FindData); 
  if hFind <> INVALID_HANDLE_VALUE then 
  begin 
    Windows.FindClose(hFind); 
    if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then 
      Result := FindData.nFileSizeHigh * MAXDWORD + FindData.nFileSizeLow; 
  end; 
end;

procedure TrdmWebDoc.CheckFileExists(id_File: Integer);
  function GetFileSizeByName(FileName: String): Integer;
  var
    FindData: TWin32FindData;
    hFind: THandle;
  begin
    Result := -1;
    hFind := FindFirstFile(PChar(FileName), FindData);
    if hFind <> INVALID_HANDLE_VALUE then
    begin
      Windows.FindClose(hFind);
      if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
        Result := FindData.nFileSizeHigh * MAXDWORD + FindData.nFileSizeLow;
    end;
  end;
var isAutoLong : boolean;
    SPath : String;
    xFileSize : integer;
begin
 // SPath := GetFileStoragePath + '\' + IntToStr(ID_NS) + '\' + FormatDateTime('yyyy-mm', now);
 // SPath := SPath + '\id_' + IntToStr(id_File) + '-' + FileCalcName(id_File);

      try
  SPath := GetFileP(id_File);
  isAutoLong := not FileExists(SPath);
  if isAutoLong then
    xFileSize := 0
  else
    xFileSize := GetFileSizeByName(SPath);

  if not isAutoLong then
    isAutoLong := GetFileSizeByName(SPath) = 0;
    
      with spErr do
      begin
        Parameters.ParamByName('@id_File').Value := id_File;
        Parameters.ParamByName('@isAutoLong').Value := isAutoLong;
        Parameters.ParamByName('@FileSize').Value := xFileSize;
        ExecProc;
      end;
    except
    end;
end;

function TrdmWebDoc.WD_File_UnEdit_v2(id_File, EmailDate, EmailFrom,
  EmailName, EmailTo, Subj, xID_NS, id_DocType, id_WorkType, id_WorkType2,
  id_WorkType3, id_WorkType4, id_WorkType5, id_Seller, id_Bayer, id_Org3,
  id_Org4, DocNum, DocDate, DocDateStop, isAutoLong, DocSumm, id_Crn,
  id_State, Comment, xVers, OrigName, FileInfo, FileSize, Adv_Digit1,
  Adv_Digit2, Adv_Digit3, Adv_Digit4, Adv_Digit5, Adv_Digit6, Adv_Digit7,
  Adv_Digit8, Adv_Digit9, Adv_Digit10, Adv_Date1, Adv_Date2, Adv_Date3,
  Adv_Date4, Adv_Date5, Adv_Date6, Adv_Date7, Adv_Date8, Adv_Date9,
  Adv_Date10, id_DicFile1, id_DicFile2, id_DicFile3, id_DicFile4,
  id_DicFile5, id_DicFile6, id_DicFile7, id_DicFile8, id_DicFile9,
  id_DicFile10: OleVariant): Integer;
var SPath, S2 : String;
begin
  Result := -1;
  Self.xid_NS := xID_NS;
  with ADOStoredProc1 do
  begin
    SetProcedureName('WD_File_UnEdit');

    SetTParametersVal(Parameters, '@id_WorkType2', id_WorkType2);
    SetTParametersVal(Parameters, '@id_WorkType3', id_WorkType3);
    SetTParametersVal(Parameters, '@id_WorkType4', id_WorkType4);
    SetTParametersVal(Parameters, '@id_WorkType5', id_WorkType5);

    SetTParametersVal(Parameters, '@id_File', id_File);
    SetTParametersVal(Parameters, '@EmailDate', EmailDate);
    SetTParametersVal(Parameters, '@EmailFrom', EmailFrom);
    SetTParametersVal(Parameters, '@EmailName', EmailName);
    SetTParametersVal(Parameters, '@EmailTo', EmailTo);
    SetTParametersVal(Parameters, '@Subj', Subj);
    SetTParametersVal(Parameters, '@xID_NS', xID_NS);
    SetTParametersVal(Parameters, '@id_DocType', id_DocType);
    SetTParametersVal(Parameters, '@id_WorkType', id_WorkType);
    SetTParametersVal(Parameters, '@id_Seller', id_Seller);
    SetTParametersVal(Parameters, '@id_Bayer', id_Bayer);
    SetTParametersVal(Parameters, '@id_Org3', id_Org3);
    SetTParametersVal(Parameters, '@id_Org4', id_Org4);
    SetTParametersVal(Parameters, '@DocNum', DocNum);
    SetTParametersVal(Parameters, '@DocDate', DocDate);
    SetTParametersVal(Parameters, '@DocDateStop', DocDateStop);
    SetTParametersVal(Parameters, '@isAutoLong', isAutoLong);
    SetTParametersVal(Parameters, '@DocSumm', DocSumm);
    SetTParametersVal(Parameters, '@id_Crn', id_Crn);
    SetTParametersVal(Parameters, '@id_State', id_State);
    SetTParametersVal(Parameters, '@Comment', Comment);
    SetTParametersVal(Parameters, '@xVers', xVers);
    SetTParametersVal(Parameters, '@OrigName', OrigName);
    SetTParametersVal(Parameters, '@FileInfo', FileInfo);
    SetTParametersVal(Parameters, '@FileSize', FileSize);
    SetTParametersVal(Parameters, '@Adv_Digit1', Adv_Digit1);
    SetTParametersVal(Parameters, '@Adv_Digit2', Adv_Digit2);
    SetTParametersVal(Parameters, '@Adv_Digit3', Adv_Digit3);
    SetTParametersVal(Parameters, '@Adv_Digit4', Adv_Digit4);
    SetTParametersVal(Parameters, '@Adv_Digit5', Adv_Digit5);
    SetTParametersVal(Parameters, '@Adv_Digit6', Adv_Digit6);
    SetTParametersVal(Parameters, '@Adv_Digit7', Adv_Digit7);
    SetTParametersVal(Parameters, '@Adv_Digit8', Adv_Digit8);
    SetTParametersVal(Parameters, '@Adv_Digit9', Adv_Digit9);
    SetTParametersVal(Parameters, '@Adv_Digit10', Adv_Digit10);
    SetTParametersVal(Parameters, '@Adv_Date1', Adv_Date1);
    SetTParametersVal(Parameters, '@Adv_Date2', Adv_Date2);
    SetTParametersVal(Parameters, '@Adv_Date3', Adv_Date3);
    SetTParametersVal(Parameters, '@Adv_Date4', Adv_Date4);
    SetTParametersVal(Parameters, '@Adv_Date5', Adv_Date5);
    SetTParametersVal(Parameters, '@Adv_Date6', Adv_Date6);
    SetTParametersVal(Parameters, '@Adv_Date7', Adv_Date7);
    SetTParametersVal(Parameters, '@Adv_Date8', Adv_Date8);
    SetTParametersVal(Parameters, '@Adv_Date9', Adv_Date9);
    SetTParametersVal(Parameters, '@Adv_Date10', Adv_Date10);
    SetTParametersVal(Parameters, '@id_DicFile1', id_DicFile1);
    SetTParametersVal(Parameters, '@id_DicFile2', id_DicFile2);
    SetTParametersVal(Parameters, '@id_DicFile3', id_DicFile3);
    SetTParametersVal(Parameters, '@id_DicFile4', id_DicFile4);
    SetTParametersVal(Parameters, '@id_DicFile5', id_DicFile5);
    SetTParametersVal(Parameters, '@id_DicFile6', id_DicFile6);
    SetTParametersVal(Parameters, '@id_DicFile7', id_DicFile7);
    SetTParametersVal(Parameters, '@id_DicFile8', id_DicFile8);
    SetTParametersVal(Parameters, '@id_DicFile9', id_DicFile9);
    SetTParametersVal(Parameters, '@id_DicFile10', id_DicFile10);

    Result := ExecSP;

    if id_File > 0 then
    begin
      CheckFileExists(id_File);
      SPath := GetFileP(id_File);
      if SPath <> '' then
      begin
        S2 := ExtractFilePath(SPath) + 'id_' + IntToStr(id_File) + '-' + FileCalcName(id_File);
        RenameFile(SPath, S2);
      end;
    end;
  end;
end;

function TrdmWebDoc.GetId_FileByGUID(FileGUID: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'WD_File_GetID';
      Parameters.Refresh;

      SetTParametersVal(Parameters, '@FileGUID', FileGUID);

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
    except
      on E : Exception do
      begin
        Result := -1;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

procedure TrdmWebDoc.WD_BuffAdd(id_File: Integer; isAdd: WordBool);
begin
  with ADOStoredProc1 do
  begin
    SetProcedureName('WD_BuffAdd');
    SetTParametersVal(Parameters, '@id_File', id_File);
    SetTParametersVal(Parameters, '@id_User', Fid_User);
    SetTParametersVal(Parameters, '@isAdd', isAdd);
    ExecSP;
    Close;
  end;
end;

function TrdmWebDoc.WD_BuffCnt: Integer;
begin
  Result := 0;
  with spBuffCnt do
  begin
    try
      Close;

      SetTParametersVal(Parameters, '@id_User', Fid_User);

      Open;
      Result := spBuffCntCnt.AsInteger;
      Close;
    except
      on E : Exception do
      begin
        Result := 0;
        Close;
        LogMessage(ProcedureName + ' ' + E.Message);
      end;
    end;
  end;
end;

procedure TrdmWebDoc.WD_BuffClear;
begin
  with ADOStoredProc1 do
  begin
    SetProcedureName('WD_BuffClear');
    SetTParametersVal(Parameters, '@id_User', Fid_User);
    ExecSP;
    Close;
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TrdmWebDoc,
    Class_rdmWebDoc, ciMultiInstance, tmApartment);
end.
