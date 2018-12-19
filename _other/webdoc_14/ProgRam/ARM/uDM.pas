unit uDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FileCtrl,
  Db, DBClient, MConnect, comctrls, registry, inifiles, sSkinManager, Menus, foMyFunc, MapiTags, ShellAPI, ShlObj, ClipBrd,
  ImgList, MapiDefs, ActiveX, ComObj, RxMemDS, SConnect;

const SRegPath = '\SOFTWARE\ADM-Lab\WebDoc2';  // Путь по которому в реестре сохраняются все настройки
  xxx_WD_RefrMsg = WM_User + 126;

  AddressTags: packed record
    Values: ULONG;
    PropTags: array[0..1] of ULONG;
  end = (Values: 2; PropTags: (PR_DISPLAY_NAME, PR_EMAIL_ADDRESS_A));

const
  AllLog = true;
  AttachmentTags: packed record
    Values: ULONG;
    PropTags: array[0..0] of ULONG;
  end = (Values: 1; PropTags: (PR_ATTACH_NUM));
  const
  MAPI_INIT_VERSION = 0;
  MAPI_MULTITHREAD_NOTIFICATIONS = $00000001;
  MAPI_NO_COINIT = $00000008;

  
type
  ExclList = array of integer;
  
  TMAPIINIT_0 =
    record
      Version: ULONG;
      Flags: ULONG;
    end;

  TDM = class(TDataModule)
    rsCA2: TDCOMConnection;
    sSkinManager1: TsSkinManager;
    PopupMenu1: TPopupMenu;
    ilImage: TImageList;
    cdsNS: TClientDataSet;
    cdsNSid_NS: TAutoIncField;
    cdsNSNSName: TStringField;
    cdsDDD: TClientDataSet;
    cdsDDDid_NameRules: TAutoIncField;
    cdsDDDid_NS: TIntegerField;
    cdsDDDColName: TStringField;
    cdsDDDParamName: TStringField;
    cdsDDDOrderID: TIntegerField;
    cdsDDDisInt: TBooleanField;
    cdsDDDinName: TIntegerField;
    cdsDDDisVisible: TBooleanField;
    mdOperBuff: TRxMemoryData;
    mdClipBrd: TRxMemoryData;
    mdClipBrdObjType: TIntegerField;
    mdClipBrdid_obj: TIntegerField;
    mdClipBrdObjName: TStringField;
    mdClipBrdItemType: TIntegerField;
    cdsFileList: TClientDataSet;
    cdsFindCAByEmail: TClientDataSet;
    cdsFindCAByEmailEmailFrom: TStringField;
    cdsFindCAByEmailid_CA: TIntegerField;
    cdsFindCAByEmailCAName: TStringField;
    cdsFindCAByEmailObjName: TStringField;
    rsCA: TSocketConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure sSkinManager1GetMenuExtraLineData(FirstItem: TMenuItem;
      var SkinSection, Caption: String; var Glyph: TBitmap;
      var LineVisible: Boolean);
    procedure DataModuleDestroy(Sender: TObject);
    procedure sSkinManager1SkinListChanged(Sender: TObject);
    procedure mdOperBuffAfterPost(DataSet: TDataSet);
    procedure cdsFindCAByEmailEmailFromGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    FIDUser : Variant;
    FUserName, FPassword : String;
    FFullFio : string;
    FNeedTerminate : boolean;
    Fis_Admin: boolean;
    procedure AppException(Sender: TObject; E: Exception);
    function Getid_NS: Variant;
    function GetSysKey: integer;
    function GetXStream(xAttachment: IAttach; AFileName: String; NotDel : boolean = false): TStream;
  public
    Email : String;
    NeedUpdate : TEObjTypes;
    FSysKey : integer;
    ZAttachment: IAttach;
    host, port, PasteDataHint, tmpFilePath, xImgViewer  :String;
    cbSkinVal : boolean;
    FAttList : TStringList;
    procedure SaveInLog(Atext: String; ALog: boolean = true);

    procedure InitToolBars(AForm : TControl);
    // Выполняет ввод и проверку пароля на сервере 3 раза
    // Если пароль невернуы выставляет свойство NeedTerminate
    function rsDoLogin: boolean;
    // Если true то программа закроется
    property NeedTerminate : boolean read FNeedTerminate;

    // Имя пользователя
    property FullFIO : String read FFullFio;
    // ID пользователя
    property ID_User : Variant read FIDUser;
    property id_NS : Variant read Getid_NS;
    property is_Admin : boolean read Fis_Admin;

    property SysKey : integer read GetSysKey;

    // Проверяет права пользователя на элементарную функцию и генерирует исключение
    // При ее вызове если нет прав, процедура прерывается
    procedure Rights_GetUserRights(id_Func: Integer // номер функции
            );
    // Проверяет права пользователя на элементарную функцию и возвращает результат
    function CheckUserRights(id_Func: Integer): boolean;

    function GetExtIdByType(EObjType: TEObjType): Integer;

    function GetRecTime(const AMessage: IMessage): TDateTime;
    function GetOneProp(const AMessage: IMessage; ulPropTag: ULONG): string;
    function GetAddrList(const AMessage: IMessage): string;
    procedure GetAttachmentsList(const AMessage: IMessage);
    function GetAttachmentStream(AFileName: String): TStream;

    function UplFile(id_File : integer; AFileName : String; AStream : TStream = nil) : boolean;
    function DownLoadFile(id_File: integer; AFileName: String; ACalcName : boolean = true): String;
    function DLDFile(id_File : integer; AFileName : String; aOpenWith : boolean = false) : boolean;

    procedure AddAttachment(Attachment: IAttach);

    procedure AddToClipBrd(ObjType : TEObjType; id_Obj : integer; ObjName : String; ItemType : integer = 0);
    procedure MakeMenuFromClipBrd(ObjType : TEObjType; aMenu : TMenu; aOnClick : TNotifyEvent);

    procedure AddToPopupMenu(aMenu : TMenu; aCaption : String; aTag : integer; aOnClick : TNotifyEvent);
    procedure CopyFilesToClipboard(FileList: string);
    procedure RefrBuffCount;
  end;

var
  DM: TDM;
  IniName : string;
  MFHandle : integer;
  ShowSplash : boolean;

 
procedure ShowText(AMessage : String);
procedure GetFileList(SL : TStrings; RootDir : String; FileMask : String);

implementation

uses LogInUnit, uMainForm, uSplashForm, uMeCrpt, uPrgForm,
  uSettings, MAPIUtil, tnef, uStr, uDataList;

{$R *.DFM}

procedure GetFileList(SL : TStrings; RootDir : String; FileMask : String);
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
  SL.Clear;
  INTGetFileList(SL, RootDir, FileMask);
end;


procedure ShowText(AMessage : String);
begin
  try
    if MainForm <> nil then     
      SendMessage(MFHandle, WM_ShowText, Integer(PChar(AMessage)), 0);
//    if Assigned(FProgrEvent) then FProgrEvent(AMessage);
  except
  end;
end;

{ TDM }
function TDM.GetRecTime(const AMessage: IMessage): TDateTime;
var
  Prop: PSPropValue;
begin            
  if (Succeeded(HrGetOneProp(AMessage, PR_MESSAGE_DELIVERY_TIME, Prop))) then
    try
      if (Prop.ulPropTag and PT_SYSTIME = PT_SYSTIME) then
      begin

        Result := FileTimeToDateTime( Prop.Value.ft.dwLowDateTime, Prop.Value.ft.dwHighDateTime );
      end;
    finally
      MAPIFreeBuffer(Prop);
    end
  else
    Result := 0;
end;



function TDM.GetOneProp(const AMessage: IMessage; ulPropTag:ULONG): string;
var
  Prop: PSPropValue;
begin            
  if (Succeeded(HrGetOneProp(AMessage, ulPropTag, Prop))) then
    try
      if (Prop.ulPropTag and PT_UNICODE = PT_UNICODE) then
        { TODO : TSPropValue.Value.lpszW is declared wrong }
        Result := String(PWideChar(Prop.Value.lpszW))
      else
        Result := String(Prop.Value.lpszA);
    finally
      MAPIFreeBuffer(Prop);
    end
  else
    Result := '';
end;

function TDM.GetAddrList(const AMessage: IMessage): string;
var
  Table: IMAPITable;
  Rows: PSRowSet;
  Value: string;
  i, j: integer;
begin
  Result := '';
  if (Succeeded(AMessage.GetRecipientTable(0, Table))) then
  begin
    if (Succeeded(HrQueryAllRows(Table, PSPropTagArray(@AddressTags), nil, nil, 0, Rows))) then
      try
        for i := 0 to integer(Rows.cRows)-1 do
        begin
          if Result <> '' then Result := Result + '; ';

          for j := Rows.aRow[i].cValues-1 downto 0 do
          begin
            if (Rows.aRow[i].lpProps[j].ulPropTag and PT_UNICODE = PT_UNICODE) then
              Value := String(PWideChar(Rows.aRow[i].lpProps[j].Value.lpszW))
            else
              Value := String(Rows.aRow[i].lpProps[j].Value.lpszA);
            if (j = 0) then
              Result := Result + ' (' + Value + ')'
            else
              Result := Result + Value;
          end;
        end;
      finally
        FreePRows(Rows);
      end;
    Table := nil;
  end;
end;


function TDM.CheckUserRights(id_Func: Integer): boolean;
begin

end;

procedure TDM.InitToolBars(AForm: TControl);
  procedure InitToolBar(AToolBar: TToolBar);
  var i : integer;
  begin
    for i := 0 to AToolBar.ButtonCount - 1 do
      if AToolBar.Buttons[i].Hint = '' then
        AToolBar.Buttons[i].Hint := StringReplace(AToolBar.Buttons[i].Caption, '&', '', []);
    AToolBar.ShowHint := true;

  end;
var i : integer;
begin
  for i := 0 to AForm.ComponentCount - 1 do
    if AForm.Components[i] is TToolBar then
      InitToolBar(TToolBar(AForm.Components[i]));
end;

procedure TDM.Rights_GetUserRights(id_Func: Integer);
begin

end;

function TDM.rsDoLogin: boolean;
var LogInForm : TLogInForm;
    Reg: TRegistry;
    N : integer;
    b1 : boolean;
begin
  N := 0;
  Result := false;
  LogInForm := TLogInForm.Create(Self);
  LogInForm.edUserID.Text := FUserName;
  Screen.Cursor := crSQLWait;
  try
    repeat
      if LogInForm.ShowModal = mrCancel then
      begin
        rsCA.Close;
        Exit;
      end;
      
    rsCA.Host := host;
   // if port <> '' then
   //   rsCA.Port := StrToInt(port);

 {   if ShowSplash and not Assigned(SplashForm) then
    begin
      LogInForm.Hide;
      ShowSplashForm(10000);
    end;  }
           
//  ShowProgressForm(0, -1, -1, 'Соединение с базой...');
  Screen.Cursor := crSQLWait;
     if not rsCA.Connected then rsCA.Open;
    N := rsCA.AppServer.GetVVVer;
    if N <> VVVer then
    begin
      Raise Exception.Create('Несоответствие версий ' + #13 + #10 +
                             'версия сервиса ' + IntToStr(N) + #13 + #10 +
                             'версия программы ' + IntToStr(VVVer) + #13 + #10// +
                     //        'ComputerName= ' + rsCA.ComputerName + #13 + #10 +
                    //         'servername= ' + rsCA.ServerName + #13 + #10 +

                     //        'Программа будет закрыта.'
                             );
    end;
    FUserName := LogInForm.UserID;
    FPassword := LogInForm.Password;
    b1 := rsCA.AppServer.DoLogin(FUserName, FPassword) <> 1;
    if b1 then
    begin
      ShowMessage('Неверное имя или пароль');
      inc(N);
    end
    else
    begin
      FFullFio := rsCA.AppServer.FIO;
      FIDUser := rsCA.AppServer.id_User;
      Fis_Admin := rsCA.AppServer.is_Admin;



      Reg := TRegistry.Create;
      try
        Reg.RootKey := HKEY_CURRENT_USER;
        if Reg.OpenKey(SRegPath, True) then
        begin
          Reg.WriteString('UserID', FUserName);
        end;
        Result := true;
      finally
        Reg.Free;
      end;
    end;
    if N = 3 then
    begin
      MessageBox(Application.Handle, 'Вы трижды неверно ввели пароль. Число попыток исчерпано. Обратитесь к админисратору системы', 'В доступе отказано!!!', MB_ICONERROR + MB_OK);
      Break;
    end;
    until Result = true;
    KillSplashForm;
  except
    on E : Exception do
    begin
      KillSplashForm;
      Raise Exception.Create('Произошла ошибка при соединении с сервером. ' + #13 + #10 +
                             E.Message + #13 + #10 +
                             'ComputerName= ' + rsCA.Host + #13 + #10 +
                             'servername= ' + rsCA.ServerName + #13 + #10 +
                             'host=' + host + #13 + #10 +
                             'Программа будет закрыта.');
    end;
  end;
    Screen.Cursor := crDefault;
 //   dsWhoIAm.Close;
  LogInForm.Free;  
  SaveInLog('Логин ОК' , AllLog);
end;

procedure TDM.DataModuleCreate(Sender: TObject);
  procedure GetRegVal(AReg: TRegistry; AName: String; ADefVal : boolean; var V : boolean);
  begin
    if AReg.ValueExists(AName) then
      V := AReg.ReadBool(AName)
    else
      V := ADefVal;
  end;

var Reg: TRegistry;
    Buffer : PChar;
    Len : DWORD;
    CmpName : String;
    IniFile : TIniFile;
    S : String;
    i : integer;
    V : Variant;
begin
//  for i := 0 to sSkinManager1.AnimEffects.co
  NeedUpdate := [eotCA, eotDocState, eotWorkType, eotDocType];
  cdsDDD.Params.ParamByName('@id_NS').Value := -1;
  FAttList := TStringList.Create;
  FSysKey := GetTickCount;
  Application.OnException := AppException;
  Port := '211';
  try
    Len := 256;
    Buffer := AllocMem(Len);
    GetComputerName(Buffer, Len);
    CmpName := StrPas(Buffer);
  finally
    FreeMem(Buffer, Len);
  end;
// ****************************************************************************
  IniName := ChangeFileExt(ExpandFileName(ParamStr(0)), '.ini');

  if  FileExists(IniName) then
  begin
    IniFile := TIniFile.Create(IniName);
    with IniFile do
    begin
      host := ReadString('AppServer', 'HostName', 'OVK');
      port := ReadString('AppServer', 'Port', '211');
      cbSkinVal := ReadBool('AppServer', 'cbSkinVal', true);
      LoadValFromRegistry(V, SRegPath, 'tmpFilePath');
      if V <> Null then
        DM.tmpFilePath := V;
      LoadValFromRegistry(V, SRegPath, 'xImgViewer');
      if V <> Null then
        DM.xImgViewer := V;

      S := ReadString('Skin', 'SkinDirectory', IniName);
      if S <> '' then sSkinManager1.SkinDirectory := S;
      sSkinManager1.Active := cbSkinVal;
    {  if not DirectoryExists(sSkinManager1.SkinDirectory) then sSkinManager1.SkinDirectory := ExtractFilePath(Application.ExeName) + 'Skins';

      S := ReadString('Skin', 'SkinName', 'нет');
      if i > 0 then S := S;
      if S <> 'нет' then sSkinManager1.SkinName := S;

      sSkinManager1.Active := s <> 'нет';   }
    end;

    IniFile.Free;
  end
  else
  begin
  //  ChangeStng(true);
  {  if (host = '') or (port='') then
    begin
      MessageBox(0, 'Не введены параметры сервера. Программа будет закрыта', 'Необходимо ввести параметры сервера', MB_ICONERROR + mb_ok);
      Application.Terminate;
    end; } 
  end;
  if (host = '') or (port='') then
  begin
    ChangeStng(true);
    if (host = '') or (port='') then
    begin
      MessageBox(0, 'Не введены параметры сервера. Программа будет закрыта', 'Необходимо ввести параметры сервера', MB_ICONERROR + mb_ok);
      Application.Terminate;
    end;  
  end;
// ****************************************************************************
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(SRegPath, true) then
    begin
      if Reg.ValueExists('UserID') then
        FUserName := Reg.ReadString('UserID');

      if Reg.ValueExists('ShowSplash') then
        ShowSplash := Reg.ReadBool('ShowSplash')
      else
        ShowSplash := true;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  FNeedTerminate := true; 
  FNeedTerminate := not rsDoLogin;
end;

procedure TDM.AppException(Sender: TObject; E: Exception);
var SL : TStringList;
    S : String;
    FileHandle : Integer;
begin
  Application.OnException := nil;
  try
    try
        SaveInLog(E.Message, true);
    finally
   //   Application.MessageBox(Pchar(E.Message), 'Ошибка', IDOK and MB_ICONERROR);
      Application.ShowException(E);
    //  SL.Free;
    end;
  finally
    Application.OnException := AppException;
  end;
end;


procedure TDM.SaveInLog(Atext : String; ALog : boolean);
var SL : TStringList;
    S, SSS : String;
    FileHandle : Integer;
begin
  if not ALog then Exit;
  SSS := 'nnn';
  if DM <> nil then SSS := DM.FullFIO;
  try
    S := ExtractFilePath(ParamStr(0)) + 'Error.log';
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

procedure TDM.sSkinManager1GetMenuExtraLineData(FirstItem: TMenuItem;
  var SkinSection, Caption: String; var Glyph: TBitmap;
  var LineVisible: Boolean);
begin
  LineVisible := false;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  try
    FAttList.Free;
    ZAttachment := nil;
  except
    tag := 0;
  end;
  SaveStng;
end;

procedure TDM.sSkinManager1SkinListChanged(Sender: TObject);
var
  i : integer;
  b : boolean;
begin
  if Assigned(MainForm) then
    MainForm.SkinManager1SkinListChanged;
end;

function TDM.GetExtIdByType(EObjType: TEObjType): Integer;
begin
  case EObjType of
      eotExtNames : Result := -666;
      eotD1 : Result := -101;
      eotD2 : Result := -102;
      eotD3 : Result := -103;
      eotD4 : Result := -104;
      eotD5 : Result := -105;
      eotD6 : Result := -106;
      eotD7 : Result := -107;
      eotD8 : Result := -108;
      eotD9 : Result := -109;
      eotD10 : Result := -110;

      eotF1 : Result := 5001;
      eotF2 : Result := 5002;
      eotF3 : Result := 5003;
      eotF4 : Result := 5004;
      eotF5 : Result := 5005;
      eotF6 : Result := 5006;
      eotF7 : Result := 5007;
      eotF8 : Result := 5008;
      eotF9 : Result := 5009;
      eotF10 : Result :=5010;

      eotCrn : Result := 1000;
      eotCA : Result := 300;
      eotOper : Result := 250;
      eotDocType : Result := 100;
      eotWorkType : Result := 200;
      eotDocState : Result := 600;
  else
    Result := -1
  end;
end;

function TDM.Getid_NS: Variant;
begin
  if Assigned(MainForm) then
    Result := MainForm.Getid_NS2
  else
    Result := -666;
end;

function TDM.GetSysKey: integer;
begin
  if FSysKey = 0 then FSysKey := GetTickCount;
  Result := FSysKey;
end;

function TDM.UplFile(id_File : integer; AFileName: String; AStream : TStream): boolean;
var P, P1 : pointer;
    buff : OleVariant;
    fs : TStream;
    Z : integer;
begin
//  DM.SaveInLog('UplFile - 1' , true);

  try
  if AStream = nil then
    fs := TFileStream.Create(AFileName, fmOpenRead)
  else
    fs := AStream;
  fs.Position := 0;
  
 // DM.SaveInLog('UplFile - 2' , true);
  GetMem(P, fs.size);
  fs.ReadBuffer(P^, fs.size); // читаем из потока в P^
  buff := VarArrayCreate([0, fs.size], varByte);
  P1 := VarArrayLock(buff);
  move(P^, P1^, fs.size); // перемещаем из P^ в массив buff
  VarArrayUnLock(buff);
  FreeMem(P, fs.size);
  if AStream = nil then
    fs.Free;

//  DM.SaveInLog('UplFile - 3' , true);
  rsCA.AppServer.FileUpl_OpenFile(id_File, ExtractFileName(AFileName));
//  DM.SaveInLog('UplFile - 4' , true);
  Z := rsCA.AppServer.FileUpl_SetFileData(buff);
//  DM.SaveInLog('UplFile - 5 = ' + IntToStr(Z) , true);
  rsCA.AppServer.FileDLD_CloseFile;
//   DM.SaveInLog('UplFile - 6' , true);

  except
    // on E : Exception
    //    do  ShowMessage('Ошибка при заливке файла. ' + E.Message);
  end;
  if Z = -1 then raise Exception.Create('Ошибка при заливке файла. Запись в базе создана, но файл не сохранен.');
end;

procedure TDM.GetAttachmentsList(const AMessage: IMessage);
var
  Attachment: IAttach;
  Attachments : TInterfaceList;
  Rows: PSRowSet;
  Table: IMAPITable;
  i : integer;
  Prop: PSPropValue;
  Size: integer;
  Method: integer;
  Stream: IStream;
  Pos: Largeint;
  S : String;
begin
  try
    FAttList.Free;
  except
    tag := 0;
  end;
  FAttList := TStringList.Create;
  try
    ZAttachment := nil;
  except
    tag := 0;
  end;
  if (Succeeded(AMessage.GetAttachmentTable(0, Table))) then
  begin
    if (Succeeded(HrQueryAllRows(Table, PSPropTagArray(@AttachmentTags), nil, nil, 0, Rows))) then
      try
        for i := 0 to integer(Rows.cRows)-1 do
        begin
          if (Rows.aRow[i].lpProps[0].ulPropTag and PROP_TYPE_MASK <> PT_ERROR) then
            if (Succeeded(AMessage.OpenAttach(Rows.aRow[i].lpProps[0].Value.l, IAttach, 0, Attachment))) then
              begin
 
                AddAttachment(Attachment);
                if i = integer(Rows.cRows) - 1 then
                  ZAttachment := Attachment
                else
                  ZAttachment := nil;
              end;

        end;

      finally
        FreePRows(Rows);
      end;
    Table := nil;
  end;
end;


function TDM.GetAttachmentStream(AFileName : String): TStream;
var
  Attachments : TInterfaceList;
  Rows: PSRowSet;
  Table: IMAPITable;
  xAttachment: IAttach;
  i : integer;
  Prop: PSPropValue;
  Size: integer;
  Method: integer;
  Stream: IStream;
  Pos: Largeint;
  S, FileName : String;
  SourceStream, DestStream: IStream;
  Dummy: int64;
  P : pointer;
  N : integer;
begin
  Result := nil;
  N := FAttList.IndexOf(AFileName);
  if N >= 0 then
  begin
    try
      P := FAttList.Objects[N];
      xAttachment := ZAttachment;
      if N <> FAttList.Count - 1 then
        xAttachment := IAttach(P);
      Result := GetXStream(xAttachment, AFileName);
    except
      ShowMessage('Ошибка, невозможно прочитать вложение. Попробуйте залить файл вручную.');
    end;
  end;
end;


function TDM.GetXStream(xAttachment: IAttach; AFileName : String; NotDel : boolean = false): TStream;
var
  i : integer;
  Prop: PSPropValue;
  Size, Size2: integer;
  Method: integer;
  Stream: IStream;
  Pos: Largeint;
  S, FileName : String;
  SourceStream, DestStream: IStream;
  Dummy: int64;
  P : pointer;
begin
  Result := nil;
    if (not Succeeded(HrGetOneProp(xAttachment, PR_ATTACH_METHOD, Prop))) then
      exit;
    try
      Method := Prop.Value.l;
    finally
      MAPIFreeBuffer(Prop);
    end;

            case Method of
              ATTACH_BY_VALUE:
                // Attachment is a file stored in an IStream object
                begin
                   OleCheck(xAttachment.OpenProperty(PR_ATTACH_DATA_BIN, IStream, STGM_READ, 0, IUnknown(SourceStream)));

               {    SourceStream.Seek(0, STREAM_SEEK_END, Dummy);
                   GetMem(P, Dummy);
                   Size := Dummy;
                   SourceStream.Seek(0, STREAM_SEEK_SET, Dummy);
                   SourceStream.Read(P, Dummy, @Size2);
                                           
                   Result := TMemoryStream.Create;
                   Result.Write(P, Size);

                  SourceStream.Seek(0, STREAM_SEEK_SET, Dummy);
                   Result := TMemoryStream.Create;
                   SourceStream.CopyTo(TStreamAdapter.Create(Result, soOwned) as IStream, -1, Dummy, Dummy);
                         }
          FileName := AnsiString({ExtractFilePath(Application.ExeName)} GetTempDir +  AFileName);
                                                
          if FileExists(FileName) then
            DeleteFile(FileName);
          
          OleCheck(OpenStreamOnFile(PAllocateBuffer(@MAPIAllocateBuffer), PFreeBuffer(@MAPIFreeBuffer),
            STGM_CREATE or STGM_READWRITE, PAnsiChar(FileName), nil, DestStream));
                              
          SourceStream.CopyTo(DestStream, -1, Dummy, Dummy);

          DestStream := nil;
          Result := TFileStream.Create(FileName, fmOpenRead);

          if not NotDel then
            DeleteFile(FileName);
   
       //   ShellExecute(0, nil, PChar(FileName), nil, nil, SW_NORMAL);
             {  }

                end;

              end;
end;

procedure TDM.AddAttachment(Attachment: IAttach);
var
  Method: integer;
  Item: TListItem;
  Prop: PSPropValue;
  s: string;
  Size: integer;
  Stream: IStream;
  Pos: Largeint;
  Msg: IMessage;
begin
               if (Succeeded(HrGetOneProp(Attachment, PR_ATTACH_SIZE, Prop))) then
                  try
                    Size := Prop.Value.l;
                  finally
                    MAPIFreeBuffer(Prop);
                  end
                else
                  Size := 0;

                if (Succeeded(HrGetOneProp(Attachment, PR_ATTACH_METHOD, Prop))) then
                  try
                    Method := Prop.Value.l;
                  finally
                    MAPIFreeBuffer(Prop);
                  end
                else
                  Method := -1;



            case Method of
              ATTACH_BY_VALUE:
              begin
                  if (Succeeded(HrGetOneProp(Attachment, PR_ATTACH_LONG_FILENAME {PR_ATTACH_FILENAME}, Prop))) then
                    try
                      if (Prop.ulPropTag and PT_UNICODE = PT_UNICODE) then
                            s := String(PWideChar(Prop.Value.lpszW))
                      else
                        s := String(Prop.Value.lpszA);
                    finally
                      MAPIFreeBuffer(Prop);
                    end
                  else
                    s := '';

                  FAttList.AddObject(s, pointer(Attachment));

                 // Attachment := iattach(pointer(FAttList.Objects[0]));
                //  GetXStream(Attachment, S, true);
                end;
    end;
end;

function TDM.DownLoadFile(id_File: integer; AFileName : String; ACalcName : boolean = true): String;
var
  VData: Variant;
  PData: PByteArray;
  FS: TMemoryStream;
  ByteCount, FileSize: Integer;
begin
  SaveInLog('Файл ID = ' + IntToStr(id_File));
  Screen.Cursor := crSQLWait;
  Result := '';
  try
    if ACalcName then
      AFileName := AnsiString(GetTempDir + AFileName);

    with rsCA do
    begin
      FS := TMemoryStream.Create;
      {Connect to the Midas server and empty the memo component.}
      if not Connected then
        Open;
 
      try
        FileSize := AppServer.FileDLD_OpenFile(id_File);
      except
        on E : Exception do
        begin
          ShowMessage(E.Message);
          Exit;

      end;
      end;
      if FileSize = 0 then
        raise Exception.Create('Ошибка при скачивании файла ' + AFileName + #13 + #10 + 'Размер нулевой!');

      {Read data from the server until the entire file has been read.}
      while True do
      begin
        VData := Unassigned;
        ByteCount := AppServer.FileDLD_GetFileData(VData, FileSize {ArraySize});
        {If the number of bytes read is zero the end of the file has been reached.}
        if ByteCount = 0 then
          Break;
        {Lock the variant array and get a pointer to the array values.}
        PData := VarArrayLock(VData);
        try
         FS.Write(PData^, ByteCount);
        finally
          VarArrayUnlock(VData);
        end; //try
      end; //while
      AppServer.FileDLD_CloseFile;
      if FS.Size = 0 then
        raise Exception.Create('Ошибка при скачивании файла ' + AFileName);
      SaveInLog('Файл размер/имя - ' + IntToStr(FS.Size) + ' ' + AFileName);
      if AFileName <> '' then
      begin
        FileSetAttr(AFileName, 0);
        DeleteFile(AFileName);
      end;
      FS.SaveToFile(AFileName);
      SaveInLog('Файл сохранен - ' + AFileName);
      Result := AFileName;
    //  Memo.Lines.LoadFromFile('c:\prj\webdoc\ProgRam\Test\Dld\zzz.zz');
  end;
  finally
    FS.Free;
    Screen.Cursor := crDefault;
  end;
end;

function TDM.DLDFile(id_File: integer; AFileName : String; aOpenWith : boolean = false): boolean;
var
  S, SExt : String;
begin
  Screen.Cursor := crSQLWait;
  try
    S := DownLoadFile(id_File, AFileName, true);
    FileSetAttr(S, 1);

 //   SaveInLog('Файл имечко = ' + S);
    if S <> '' then
    begin
      if aOpenWith then
      begin
        ShellExecute(Application.Handle, 'open', PChar('rundll32.exe'), PChar('shell32.dll,OpenAs_RunDLL ' + S), nil, SW_SHOWNORMAL);
      end
      else
      begin
        SExt := AnsiLowerCase(ExtractFileExt(S));
        if FileExists(xImgViewer) and (
        (SExt = '.bmp') or (SExt = '.gif') or (SExt = '.jpg') or (SExt = '.jpeg') or (SExt = '.tiff') or (SExt = '.psd') //or (SExt = '.psd')
        ) then
          ShellExecute(Application.Handle, 'open', PChar(xImgViewer), PChar(S), nil, SW_NORMAL)
        else
          ShellExecute(Application.Handle, 'open', PChar(S), nil, nil, SW_NORMAL);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;

end;


procedure TDM.mdOperBuffAfterPost(DataSet: TDataSet);
  procedure AddToHint(AFiledName, AParamName : String; xTag : String = '');
  var S1, S2 : String;
  begin
    if xTag <> '' then S2 := xStringReplace(xTag, ['<'], '</');
    if not mdOperBuff.FieldByName(AFiledName).IsNull then
    begin
      if PasteDataHint <> '' then PasteDataHint := PasteDataHint + '<br>' + #13 + #10;
      PasteDataHint := PasteDataHint + AParamName + ': ' + xTag + mdOperBuff.FieldByName(AFiledName).AsString + S2;
    end;
  end;

begin
  PasteDataHint := '<u>Данные в буфере</u>';
  AddToHint('Sellername', 'Продавец', '<b>');
  AddToHint('Bayername', 'Покупатель', '<b>');
  AddToHint('WorkTypeName', 'Тематика', '<b>');
  AddToHint('StateName', 'Статус');
  AddToHint('DocTypeName', 'Тип документа', '<b>');
  AddToHint('DocNum', 'Номер', '<b>');
  AddToHint('DocDate', 'Дата', '<b>');
  AddToHint('DocSumm', 'Сумма');
  AddToHint('CrnName', 'Валюта');
  AddToHint('Comment', 'Описание', '<b>');
end;

procedure TDM.AddToClipBrd(ObjType: TEObjType; id_Obj: integer;
  ObjName: String; ItemType : integer);
var N : integer;
begin
//  NeedUpdate := NeedUpdate + [ObjType];
  with mdClipBrd do
  begin
    if not Active then Open;
    First;
    while not Eof do
    begin
      if (mdClipBrdObjType.AsInteger = integer(ObjType))
      and (mdClipBrdid_obj.AsInteger = id_Obj) and (mdClipBrdItemType.AsInteger = ItemType) then
      begin
        Exit;
      end
      else
        Next;
    end;
  end;

  mdClipBrd.First;
  mdClipBrd.Insert;
  mdClipBrdObjType.AsInteger := integer(ObjType);
  mdClipBrdid_obj.AsInteger := id_Obj;
  mdClipBrdObjName.AsString := ObjName;
  mdClipBrdItemType.AsInteger := ItemType;
  mdClipBrd.Post;

  with mdClipBrd do
  begin
    First;
    N := 0;
    while not Eof do
    begin
      if (mdClipBrdObjType.AsInteger = integer(ObjType))
      and (mdClipBrdItemType.AsInteger = ItemType) then
      begin
        inc(N);
        if N > 3 then
        begin
          Delete;
          Next;
        end
        else
          Next;
      end
      else
        Next;
    end;
  end;

end;

procedure TDM.MakeMenuFromClipBrd(ObjType: TEObjType; aMenu: TMenu; aOnClick : TNotifyEvent);
begin
//  if not (ObjType in NeedUpdate) then Exit;
//  NeedUpdate := NeedUpdate - [ObjType];
 // sSkinManager1.SkinnedPopups := false;
  while aMenu.Items.Count > 2 do
    aMenu.Items.Delete(2);
  with mdClipBrd do
  begin
    if not Active then Open;
    First;
    while not Eof do
    begin
      if (mdClipBrdObjType.AsInteger = integer(ObjType)) and (mdClipBrdItemType.AsInteger = 1) then
      begin
        AddToPopupMenu(aMenu, mdClipBrdObjName.AsString, mdClipBrdid_obj.AsInteger, aOnClick);
      end;
      Next;
    end;
    AddToPopupMenu(aMenu, '-', -1, nil);
    First;
    while not Eof do
    begin
      if (mdClipBrdObjType.AsInteger = integer(ObjType)) and (mdClipBrdItemType.AsInteger = 0) then
      begin
        AddToPopupMenu(aMenu, mdClipBrdObjName.AsString, mdClipBrdid_obj.AsInteger, aOnClick);
      end;
      Next;
    end;
  end;
//  sSkinManager1.SkinnedPopups := true;
end;

procedure TDM.AddToPopupMenu(aMenu: TMenu; aCaption: String; aTag : integer;
  aOnClick: TNotifyEvent);
var MI : TMenuItem;
begin
  MI := TMenuItem.Create(aMenu);
  aMenu.Items.Add(MI);
  MI.Caption := aCaption;
  Mi.Tag := aTag;
  MI.OnClick := aOnClick;
end;

procedure TDM.CopyFilesToClipboard(FileList: string);
var 
  DropFiles: PDropFiles;
  hGlobal: THandle; 
  iLen: Integer; 
begin 
  iLen := Length(FileList) + 2; 
  FileList := FileList + #0#0; 
  hGlobal := GlobalAlloc(GMEM_SHARE or GMEM_MOVEABLE or GMEM_ZEROINIT, 
    SizeOf(TDropFiles) + iLen); 
  if (hGlobal = 0) then raise Exception.Create('Could not allocate memory.'); 
  begin 
    DropFiles := GlobalLock(hGlobal); 
    DropFiles^.pFiles := SizeOf(TDropFiles); 
    Move(FileList[1], (PChar(DropFiles) + SizeOf(TDropFiles))^, iLen); 
    GlobalUnlock(hGlobal); 
    Clipboard.SetAsHandle(CF_HDROP, hGlobal); 
  end; 
end; 


procedure TDM.cdsFindCAByEmailEmailFromGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := Sender.AsString;
  if POS(Email, Text) > 0 then
  begin
    Text := xStringReplace(Text, [Email], '<b>' + Email + '</b>');
  end
  else
  if POS(Text, Email) > 0 then
  begin
    Text := '<b>' + Text + '</b>';
  end;

end;

procedure TDM.RefrBuffCount;
var S : String;
    N, i : integer;
begin
  N := DM.rsCA.AppServer.WD_BuffCnt;
  S := '';
  if N > 0 then
    S := '<a href="#">Буфер: ' + IntToStr(N) + ' файлов</a>';
  if MainForm <> nil then
    MainForm.MainStatusBar.Panels[1].Text := S;
  if DataList <> nil then
  begin
    for i := 0 to DataList.fltTree.Items.Count - 1 do
    begin
      if DataList.fltTree.Items[i].ImageIndex = iconBuff then
      begin
        DataList.fltTree.Items[i].Text := 'Буфер';
        if (N > 0) then DataList.fltTree.Items[i].Text := 'Буфер (' + IntToStr(N) + ' файлов)';
      end;
    end;
  end;
end;


end.
