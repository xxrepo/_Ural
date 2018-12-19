unit foMyFunc;


interface

uses classes, Windows, Messages, Sysutils, graphics,
  registry, DBGrids, DB, dbclient, RXDBCtrl,
  SHDocVw, ActiveX, Controls, stdctrls,DBGridEh, GridsEh,  FileCtrl,
  Forms, Printers, comctrls,
  JPEG, RxGIF, uInputBox,
  MSHTML, dialogs, mconnect, menus,
//  uInputBox,
  Grids, RxMemDS, ComObj, uPrgForm, Clipbrd, extctrls, ShellAPI;

const
  xxx_DelMeMsg = WM_User + 666;
  xxx_RefrMsg = WM_User + 13;
  xxx_Cancel = WM_User + 14;
  xxx_ClearIDList = WM_User + 15;
  xxx_RefrOptim = WM_User + 16;
  xxx_DelMsg = WM_User + 17;
  WM_ShowText  = WM_User + 26;

  CGID_IE4: TGUID = '{ed016940-bd5b-11cf-ba4e-00c04fd70816}';
  CGID_MSHTML: TGUID = '{DE4BA900-59CA-11CF-9592-444553540000}';
  IDM_FIND = 67;
  RStngPath = 'StngPath';

  redColor : TColor = $009FFFFF;
  
type
  PHICON = ^HICON;

  TSetOfChar = set of char;




  {  THackCustomDBGrid = class(TCustomDBGrid)
    property SelectedRows;
  end;}
  TWinHackControl = class(TWinControl)
     property Text;
  end;
  
  THackGrid = class(TCustomDBGrid)
  public
    property RowHeights;
    property DataLink;
    property Canvas;
    property Col;
    property Row;
    procedure MouseToCell(X, Y: Integer; var ACol, ARow: Longint);
  end;

  THackGridEh = class(TDBGridEh)
  public
    property RowHeights;
    property DataLink;
    property Canvas;
    property Col;
    property Row;
    procedure MouseToCell(X, Y: Integer; var ACol, ARow: Longint);
  end;



  
  TEObjType = (eotNone, eotNS, eotCrn, eotCA, eotOper, eotDocType, eotWorkType, eotDocState,
                eotUsers, eotUsersGroup,
                eotExtNames,

                eotD1, eotD2, eotD3, eotD4, eotD5, eotD6, eotD7, eotD8, eotD9, eotD10,
                eotF1, eotF2, eotF3, eotF4, eotF5, eotF6, eotF7, eotF8, eotF9, eotF10);

  TEObjTypes = set of TEObjType;

  TCatObj = (coNone, coGoods);

  TSelectedObj = record
    id_NS : Variant;
    NSName : String;

    ID : Variant;
    Name : String;
    ObjType : TEObjType;
    PID : integer;
    PIDName : Variant;
  end;


  TLBItem = class(TCollectionItem)
  public
   Id:Integer;
   Name:string;
  end;
 
  THackDispatchConnection = class(TDispatchConnection)
    property AppServer;
  end;

 
    THackControl = class(TControl)
      property Text;
      property Color;
    end;

 procedure GreedToExcel(Grid: TDBGrid; ACaption : string = '');
procedure CheckExcel;
function SetExcelBMVal(ARange : Variant; BMName : String; AVal : Variant;
                       ACanvas : TCanvas = nil; AAddDot : boolean = false) : boolean;
procedure CDSToExcel(CDS : TClientDataSet; ARange: Variant; ACanvas : TCanvas = nil; AAddDot : boolean = false);
procedure CDSToExcelTable(CDS : TClientDataSet; ARange: Variant; KeyName : String; AAddDot : boolean = false);
function FormatDateTimeNull(const Format: string; ADateTime: TDateTime): string;



function GetControlOwner(AControl : TComponent) : TCustomForm;
procedure CloneCDS(Source, Dest: TClientDataSet);

 

function StrToFloatAdv(S: string): Extended;

procedure BeginTruns(Conn : TDispatchConnection);
procedure CommitTrans(Conn : TDispatchConnection);
procedure RollbackTrans(Conn : TDispatchConnection);

function TestEMail(AEmail : String) : boolean;
function TestPhone(AChar : Char) : boolean;
function TestNumber(AChar : Char) : boolean;

procedure GetValues(Reg : TRegistry; SL : TStrings; Preff : String);
procedure SaveValues(Reg : TRegistry; SL : TStrings; Preff : String);

procedure SetParamVal(AParam : TParam; AVal : String); overload;
procedure SetParamVal(AParam : TParam; AControl : TCheckBox); overload;
procedure SetParamVal(AParam : TParam; AControl :  TDateTimePicker); overload;

procedure SaveSplitterSettingsFromRegistry(const ASplitter : TSplitter; APath : String);
procedure LoadSplitterSettingsFromRegistry(const ASplitter : TSplitter; APath : String);

procedure SaveValToRegistry(const Val : Variant; APath, AValName : String);
procedure SaveValToRegistry_CalcPath(AControl : TControl; const Val : Variant; AValName : String);
procedure LoadValFromRegistry(var Val : Variant; APath, AValName : String);
procedure LoadValFromRegistry_CalcPath(AControl : TControl; var Val : Variant; AValName : String);

procedure SaveFormSettingsToRegistry(const AForm : TForm; APath : String);
procedure LoadFormSettingsToRegistry(const AForm : TForm; APath : String);

procedure LoadPopupMenuFromRegistry(const APopupMenu : TPopupMenu; APath : String);
procedure SavePopupMenuToRegistry(const APopupMenu : TPopupMenu; APath : String);

procedure SaveGridSettingsToRegistry(const AGrid : TDBGrid; APath : String);
procedure LoadGridSettingsFromRegistry(const AGrid : TDBGrid; APath : String);

procedure ReOrderCDS(AField : TField); overload;
procedure ReOrderCDS(CDS: TClientDataSet; OrdField : String); overload;
function GetBtnSortMarker(Field: TField): TSortMarker;
procedure ShowHTMLText(AWebBrowser : TWebBrowser; const AText: String);
 
procedure mrWebBrowserFind(AWB : TWebBrowser);
procedure mrWebBrowserPrint(AWB : TWebBrowser; PrintWithSetup : boolean);
procedure mrWebBrowserSelectAll(AWB : TWebBrowser);
procedure mrWebBrowserCopySelected(AWB : TWebBrowser);
procedure CompareField(ADataSet : TClientDataSet; AName, ARusName : String; SL : TStringList; AddValue : boolean = true; AFormatFloat : String = '0.##');
procedure CompareDate(OldValue, NewValue : Variant; ARusName : String; SL : TStringList; AddValue : boolean; AFormatFloat : String);

procedure DisableControl(AControl : TControl);
procedure EnableControl(AControl : TControl);

procedure BeginUpdateControl(AControl: TWinControl);
procedure EndUpdateControl(AControl: TWinControl);
procedure NewFilterValue(CB : TComboBox; Value : String);
function CDSApplyUpdates(CDS : TClientDataSet; IDFieldName : String; IDFieldValue : integer; ChCountIgnore : boolean = false) : boolean;

procedure FixIdRefresh(CDS : TClientDataSet; IdField : String; Val : integer = -1);
function GetFieldData(Value : Variant; NeedCav : boolean = true; AFormatFloat : String = '0.##') : String;

procedure SetRowHeights(Rect : TRect; AField : TField; ASizeField : TField; AGrid : TCustomDBGrid);

procedure CloneCDS2(Source: TDataSet; Dest : TDataSet; OnlyCurRec : boolean = false);
procedure CloneRow(Source: TDataSet; Dest : TDataSet; ExclField, ExclField2 : TField);

procedure PutStringIntoClipBoard(const Str: WideString);

function GetDateAdv(ADate : TDateTime; ALastSec : boolean) : TDateTime; overload;
function GetDateAdv(ADate : integer; ALastSec : boolean) : TDateTime;  overload;

procedure ShowText(AMessage : String; APos : integer = 1);
procedure OpenURL(Url: string); 

function DayOfWeekName(Date: TDateTime): String;

function VarToFloat(V : Variant) : Extended;

procedure MakeCDSCopy(CDS : TClientDataSet; AParamName, AKeyName : String);
function GetFloatFromClipBoadr : Extended;
function CalcFirstDayOfWeek(Date: TDateTime): TDateTime;
function GetGUIDStr(Simple: boolean=false): string;
procedure GetAssociatedIcon(FileExt: string; PLargeIcon, PSmallIcon: PHICON);

function FileTimeToDateTime(dwLowDateTime : DWORD; dwHighDateTime : DWORD): TDateTime;
function xStringReplace(S: string; OldPattern: array of string; NewPattern: string): string;
function GetTempDir: string;
procedure GetFileList(SL : TStrings; RootDir : String; FileMask : String; AClearList : boolean = true);

function isFileAv(AFileName : String) : boolean;
function GetFileSizeByName(FileName: String): Integer;


var  MainFormHandle : HWnd;

implementation


uses uMainForm, uDM;

function isFileAv(AFileName : String) : boolean;
var FHandle: Integer;
begin
  Result := false;
  if FileExists(AFileName) then
  begin
    FHandle := FileOpen(AFileName, fmOpenReadWrite or fmShareExclusive);
    Result := FHandle > 0;
    if Result then
      FileClose(FHandle);
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

function GetTempDir: string;
var
   Path: array[0..MAX_PATH] of Char;
begin
   if DirectoryExists(DM.tmpFilePath) then
     Result := DM.tmpFilePath + '\'
   else
   begin
     GetTempPath(MAX_PATH, Path);
     Result := Path;
  end;
  Result := xStringReplace(Result, ['\\'], '\');
end;

function xStringReplace(S: string; OldPattern: array of string; NewPattern: string): string;
var i : integer;
begin
  Result := S;
  for i := 0 to High(OldPattern) do
    Result := StringReplace(Result, OldPattern[i], NewPattern, [rfReplaceAll, rfIgnoreCase]);
end;

function FileTimeToDateTime(dwLowDateTime : DWORD; dwHighDateTime : DWORD): TDateTime;
 var
   ModifiedTime: TFileTime;
   SystemTime: TSystemTime;

   FileTime : TFileTime;
 begin
   Result := 0;
   FileTime.dwLowDateTime := dwLowDateTime;
   FileTime.dwHighDateTime := dwHighDateTime;

   if (dwLowDateTime = 0) and (dwHighDateTime = 0) then
     Exit;
   try
     FileTimeToLocalFileTime(FileTime, ModifiedTime);
     FileTimeToSystemTime(ModifiedTime, SystemTime);
     Result := SystemTimeToDateTime(SystemTime);
   except
     Result := Now;  // Something to return in case of error 
  end;
 end;



procedure GetAssociatedIcon(FileExt: string; PLargeIcon, PSmallIcon: PHICON);
var
  IconIndex: UINT;  // Position of the icon in the file
  FileName, FileType: string;
  Reg: TRegistry;
  p: integer;
  p1, p2: pchar;

    Info: TSHFileInfo;
   Flags: Cardinal;
begin
   if FileExt = '' then
     PSmallIcon^ := 0
   else
   begin
     Flags := SHGFI_ICON or SHGFI_SMALLICON or SHGFI_USEFILEATTRIBUTES;
     SHGetFileInfo(PChar(FileExt), FILE_ATTRIBUTE_NORMAL, Info, SizeOf(TSHFileInfo), Flags);
     PSmallIcon^ := Info.hIcon;
   end;
   
   Exit;

   
  IconIndex := 0;
  // Get the extension of the file
  if ((FileExt <> '.EXE') and (FileExt <> '.ICO')) then
  begin
    Reg := nil;
    try
      Reg := TRegistry.Create(KEY_QUERY_VALUE);
      Reg.RootKey := HKEY_CLASSES_ROOT;
      if FileExt = '.EXE' then FileExt := '.COM';
      if Reg.OpenKeyReadOnly(FileExt) then
        try
          FileType := Reg.ReadString('');
        finally
          Reg.CloseKey;
        end;
      if (FileType <> '') and Reg.OpenKeyReadOnly(
          FileType + '\DefaultIcon') then
        try
          FileName := Reg.ReadString('');
        finally
          Reg.CloseKey;
        end;
    finally
      Reg.Free;
    end;

    // If we couldn't find the association, we will
    // try to get the default icons
    if FileName <> '' then
    begin
      p1 := PChar(FileName);
      p2 := StrRScan(p1, ',');
      if p2 <> nil then
      begin
        p := p2 - p1 + 1; // Position of the comma
        IconIndex := StrToInt(Copy(FileName, p + 1, Length(FileName) - p));
        SetLength(FileName, p - 1);
      end;
    end;
  end;
  // Attempt to get the icon
  if ExtractIconEx(pchar(FileName), IconIndex, PLargeIcon^, PSmallIcon^, 1) <> 1 then
  begin
    if      (FileExt = '.DOC') then IconIndex := 1
    else if (FileExt = '.EXE')
         or (FileExt = '.COM') then IconIndex := 2
    else if (FileExt = '.HLP') then IconIndex := 23
    else if (FileExt = '.INI')
         or (FileExt = '.INF') then IconIndex := 63
    else if (FileExt = '.TXT') then IconIndex := 64
    else if (FileExt = '.BAT') then IconIndex := 65
    else if (FileExt = '.DLL')
         or (FileExt = '.SYS')
         or (FileExt = '.VBX')
         or (FileExt = '.OCX')
         or (FileExt = '.VXD') then IconIndex := 66
    else if (FileExt = '.FON') then IconIndex := 67
    else if (FileExt = '.TTF') then IconIndex := 68
    else if (FileExt = '.FOT') then IconIndex := 69
    else
      IconIndex := 0;
    // Attempt to get the icon.
    if ExtractIconEx(pchar(FileName), IconIndex,
        PLargeIcon^, PSmallIcon^, 1) <> 1 then
    begin
      // Failed to get the icon. Just "return" zeroes.
      if PLargeIcon <> nil then PLargeIcon^ := 0;
      if PSmallIcon <> nil then PSmallIcon^ := 0;
    end;
  end;
end;


function GetGUIDStr(Simple: boolean=false): string;
  var GUID: TGUID;
begin
  Result:='';
  if CoCreateGuid(GUID) = 0 then
    Result := GUIDToString(GUID);
  if Simple then
  begin
    Result:=StringReplace(Result,'{','',[]);
    Result:=StringReplace(Result,'}','',[]);
    Result:=StringReplace(Result,'-','',[rfReplaceAll]);
  end;
end;


function CalcFirstDayOfWeek(Date: TDateTime): TDateTime;
var X, N : integer;
begin
  X := DayOfWeek(Date);
  case X of
    1 : N := -7;
    2 : N := 0;
    3 : N := -1;
    4 : N := -2;
    5 : N := -3;
    6 : N := -4;
    7 : N := -5;
  end;
  Result := Date + N;
end;


function GetFloatFromClipBoadr : Extended;
var S : String;
begin
  Result := 0;
  try
  S := Clipboard.AsText;
  S := StringReplace(S, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, ',', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '.', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);

  if not TextToFloat(PChar(S), Result, fvExtended) then
     Result := 0;
  except
     Result := 0;
  end;
end;



procedure MakeCDSCopy(CDS : TClientDataSet; AParamName, AKeyName : String);
var V : Variant;
    i, j, N : integer;
    AOnCalcFields: TDataSetNotifyEvent;
    AAfterPost: TDataSetNotifyEvent;
begin
  with CDS do
  begin
    AOnCalcFields := OnCalcFields;
    AAfterPost := AfterPost;

    OnCalcFields := nil;
    AfterPost := nil;
    DisableControls;
    try
      N := RecordCount - 1;
      V := VarArrayCreate([0, N, 0, FieldCount - 1], varVariant);
      First;
      while not Eof do
      begin
        for i := 0 to FieldCount - 1 do
          V[RecNo - 1, i] := Fields[i].Value;

        Next;
      end;
      Close;
      Params.ParamByName('@' + AParamName).Value := -888;
      Open;
      while not IsEmpty do
        Delete;
      for j := 0 to N do
      begin
        Append;
        for i := 0 to FieldCount - 1 do
          if (UpperCase(Fields[i].FieldName) <> UpperCase(AKeyName)) and
            not Fields[i].ReadOnly then
            Fields[i].AsVariant := V[j, i];
        Post;
      end;
    finally
      First;
      OnCalcFields := AOnCalcFields;
      AfterPost := AAfterPost;
      EnableControls;
    end;
  end;
end;

function VarToFloat(V : Variant) : Extended;
begin
  if (V = Null) or VarIsEmpty(V) then
    Result := 0
  else
    Result := V;
end;

function DayOfWeekName(Date: TDateTime): String;
var X : integer;
begin
  X := DayOfWeek(Date);
  case X of
    1 : Result := 'воскресение';
    2 : Result := 'понедельник';
    3 : Result := 'вторник';
    4 : Result := 'среда';
    5 : Result := 'четверг';
    6 : Result := 'пятница';
    7 : Result := 'суббота';
  end;
end;


procedure OpenURL(Url: string); 
var 
 ts: string; 
begin 
 with TRegistry.Create do 
   try 
     rootkey := HKEY_CLASSES_ROOT; 
     OpenKey('\htmlfile\shell\open\command', False); 
     try 
       ts := ReadString(''); 
     except 
       ts := ''; 
     end; 
     CloseKey; 
   finally 
     Free; 
   end; 
 if ts = '' then Exit; 
 // remove quotes and commandline parameters 
 ts := Copy(ts, Pos('"', ts) + 1, Length(ts)); 
 ts := Copy(ts, 1, Pos('"', ts) - 1); 
 ShellExecute(0, 'open', PChar(ts), PChar(url), nil, SW_SHOW); 
end; 



procedure ShowText(AMessage : String; APos : integer);
var S : String;
begin
  try
    S := AMessage;
   // MainForm.ShowText(AMessage, APos);
    SendMessage(MainFormHandle, WM_ShowText, Integer(PChar(S)), APos);
//    if Assigned(FProgrEvent) then FProgrEvent(AMessage);
  except
  end;
end;


function GetDateAdv(ADate : TDateTime; ALastSec : boolean) : TDateTime;
var Hour, Min, Sec, MSec: Word;
    Year, Month, Day: Word;
begin
  DecodeDate(ADate, Year, Month, Day);
  if ALastSec then
  begin
    Hour := 23;
    Min := 59;
    Sec := 59;
    MSec := 999;
  end
  else
  begin
    Hour := 0;
    Min := 0;
    Sec := 0;
    MSec := 0;
  end;
  Result := EncodeDate(Year, Month, Day) + EncodeTime(Hour, Min, Sec, MSec);
end;

function GetDateAdv(ADate : integer; ALastSec : boolean) : TDateTime;
begin

end;

procedure PutStringIntoClipBoard(const Str: WideString);
var
  Size: Integer;
  Data: THandle;
  DataPtr: Pointer;
begin
  Size:=Length(Str);
  if Size = 0 then exit;
  if not IsClipboardFormatAvailable(CF_UNICODETEXT) then
    Clipboard.AsText:=Str
  else
  begin
    Size:=Size shl 1 + 2;
    Data := GlobalAlloc(GMEM_MOVEABLE+GMEM_DDESHARE, Size);
    try
      DataPtr := GlobalLock(Data);
      try
        Move(Pointer(Str)^, DataPtr^, Size);
        Clipboard.SetAsHandle(CF_UNICODETEXT, Data);
      finally
        GlobalUnlock(Data);
      end;
    except
      GlobalFree(Data);
      raise;
    end;
  end;
end;

procedure CloneRow(Source: TDataSet; Dest : TDataSet; ExclField, ExclField2 : TField);
var i : integer;
    Field : TField;
begin
   Dest.Edit;
   for i := 0 to Dest.FieldCount - 1 do
   begin
     if (ExclField <> Dest.Fields[i]) and (ExclField2 <> Dest.Fields[i]) then
     begin
       Field := Source.FindField(Dest.Fields[i].FieldName);
       if Field <> nil then
         Dest.Fields[i].AsVariant := Field.AsVariant;
     end;
   end;
   Dest.Post;
end;

procedure CloneCDS2(Source: TDataSet; Dest : TDataSet; OnlyCurRec : boolean);
  procedure AssignRecord2(Source, Dest: TDataSet);
  var
    j: Integer;
    F, FSrc: TField;
    Hour, Min, Sec, MSec: Word;
  begin
    for j := 0 to Source.FieldCount - 1 do
    begin
      FSrc := Source.Fields[j];
      F := Dest.FindField(FSrc.FieldName);
      if F <> nil then
      begin
        if (F is TDateTimeField) and not (FSrc.IsNull) then
        begin
          DecodeTime(FSrc.AsDateTime, Hour, Min, Sec, MSec);
          F.AsDateTime := int(FSrc.AsDateTime) + EncodeTime(Hour, Min, 0, 0);
        end
        else
          F.Value := FSrc.Value;
      end;
    end;
  end;
var Stream : TMemoryStream;
    i, Cnt  :integer;
    OldRecNo : integer;
    AField : TField;
begin
  try
    Dest.Close;
    Dest.FieldDefs.Clear;
    Dest.FieldDefs := Source.FieldDefs;
    Dest.Fields.Clear;
    
    for I := 0 to Dest.FieldDefList.Count - 1 do
    begin
 //     ShowProgressForm(0, i, Dest.FieldDefList.Count - 1, 'Копирование структуры данных');
      if Dest.FieldDefList[I].DataType = ftAutoInc then
         Dest.FieldDefList[I].DataType := ftInteger;
      Dest.FieldDefList[I].Attributes := Dest.FieldDefList[I].Attributes - [faReadOnly];

      with Dest.FieldDefList[I] do
      begin
        if (DataType <> ftUnknown) and not (DataType in ObjectFieldTypes) and
          not ((faHiddenCol in Attributes) and not Dest.FIeldDefs.HiddenFields) then
        begin
          AField := CreateField(Dest, nil, Dest.FieldDefList.Strings[I]);

          if AField is TDateTimeField then
          begin
            TDateTimeField(AField).DisplayFormat := 'dd.mm.yyyy hh.mm';
          end;
          if AField is TFloatField then
          begin
            TFloatField(AField).DisplayFormat := '0.00';
          end;

        end;
      end;
    end;
 //   CloseProgressForm;
    with Dest do
    begin
      Open;
      try
        Source.DisableControls;
        OldRecNo := Source.RecNo;
        if not OnlyCurRec then
        begin
          Source.First;
          Cnt := Source.RecordCount;
          i := 0;
          while not Source.EOF do
          begin
       //     ShowProgressForm(0, i, Cnt, 'Копирование данных');
            Append;
            AssignRecord2(Source, Dest);
            Post;
            Source.Next;
            inc(i);
            Source.RecNo := OldRecNo;
          end;
        end
        else
        begin
          Append;
          AssignRecord2(Source, Dest);
          Post;
        end;

      finally
        Source.EnableControls;
        First;
      end;
    end;
  finally
//    CloseProgressForm;
  end;
end;
 

procedure CheckExcel;
var AHandle : HWnd;
    ClassID: TCLSID; Rez : HRESULT;
begin
  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;
  Rez := CLSIDFromProgID(PWideChar(WideString('Excel.Application')), ClassID);
  if Rez <> S_OK then
  begin
    MessageBox(AHandle, 'Excel не установлен!', '', MB_ICONERROR);
    Abort;
  end;
end;

procedure CDSToExcel(CDS : TClientDataSet; ARange: Variant; ACanvas : TCanvas; AAddDot : boolean);
var i, j : integer;
    AField : TField;
    function GetFVal : Variant;
    var S : String;
    begin
      if AField is TBCDField then
      begin
        if TBCDField(AField).Size = 0 then
        begin
          S := AField.AsString;
          if UpperCase(AField.FieldName) = 'BIK' then
          begin
            if Length(S) < 9 then
              S := StringOfChar('0', 9 - Length(S)) + S;
          end;
          Result := '''' + S;
        end
        else
          Result := AField.AsCurrency;
        if (UpperCase(AField.FieldName) = 'VAT') and (Result=0) then
          Result := 'без НДС'
        else
          if (UpperCase(AField.FieldName) = 'VAT') and (Result>0) and (AField is TNumericField) and (TNumericField(AField).DisplayFormat <> '') then
            Result := '''  ' + AField.DisplayText;
        if (UpperCase(AField.FieldName) = 'VATVAL') and (Result=0) then
          Result := 'без НДС';
      end
      else
      if AField is TStringField then
      begin
        Result := '''' + AField.AsString;
      end
      else
      if AField is TDateTimeField then
      begin
        if AField.IsNull then
          Result := ''
        else
          Result := AField.AsDateTime;
      end
      else
        Result := AField.Value;
    end;
begin
  for i := 0 to CDS.Fields.Count - 1 do
  begin
    AField := CDS.Fields[i];
    if SetExcelBMVal(ARange, '^' + AField.FieldName, GetFVal, ACanvas, AAddDot) then
//    if SetExcelBMVal(ARange, '^' + AField.FieldName, AField.AsString, ACanvas) then
    begin
      j := 2;
      while true do
      begin
        if not SetExcelBMVal(ARange, '^' + AField.FieldName + IntToStr(j), GetFVal, ACanvas, AAddDot) then
//        if not SetExcelBMVal(ARange, '^' + AField.FieldName + IntToStr(j), AField.AsString, ACanvas) then
          Break;
        inc(j);
      end;
    end;
  end;
end;





function FormatDateTimeNull(const Format: string; ADateTime: TDateTime): string;
var  Year, Month, Day : Word;
begin
  if ADateTime > 0 then
  begin
    Result := FormatDateTime(Format, ADateTime);
    Decodedate(ADateTime, Year, Month, Day);
    case Month of
      1, 9, 10, 11, 12 : Result := StringReplace(result, 'рь', 'ря', [rfReplaceAll, rfIgnoreCase]);
      2, 4, 7 : Result := StringReplace(result, 'ль', 'ля', [rfReplaceAll, rfIgnoreCase]);
      3 : Result := StringReplace(result, 'Март', 'Марта', [rfReplaceAll, rfIgnoreCase]);
      5 : Result := StringReplace(result, 'Май', 'Мая', [rfReplaceAll, rfIgnoreCase]);
      6 : Result := StringReplace(result, 'Июнь', 'Июня', [rfReplaceAll, rfIgnoreCase]);
      8 : Result := StringReplace(result, 'Август', 'Августа', [rfReplaceAll, rfIgnoreCase]);
    end;
  end;
end;

procedure CDSToExcelTable(CDS : TClientDataSet; ARange: Variant; KeyName : String; AAddDot : boolean = false);
var i, j, ACol, ARow, AColCount : integer;
    AField : TField;
    V, Cell1, Cell2 : Variant;
    ACanvas : TCanvas;
begin
  AColCount := 0;
  ACanvas := TCanvas.Create;
  ACanvas.Handle := GetDC(0);
  try
   // V := ARange.Find(KeyName, Null, 1, 1);
    V := ARange.Find(What := KeyName, LookAt := 1);

    if not VarIsEmpty(V) then
    begin
      ACol := V.Column;
      ARow := V.Row;
      while true do
      begin
        V := ARange.Cells[ARow, ACol + AColCount + 1];
        if (V.MergeCells) or (VarToStr(V.Value) <> '') then
          inc(AColCount)
        else
          Break;
      end;
      if CDS.IsEmpty then
      begin
        V := ARange.Worksheet.Rows[ARow];
        Cell1 := ARange.Worksheet.Cells[ARow, ACol];
        Cell2 := ARange.Worksheet.Cells[ARow, ACol + AColCount];
        V := ARange.Worksheet.Range[Cell1, Cell2];
        CDSToExcel(CDS, V, ACanvas);
      end;
      with CDS do
      begin
        First;
        while not Eof do
        begin
          V := ARange.Worksheet.Rows[ARow];
          if RecNo <> recordCount then
          begin
            V.Copy;
            Cell1 := ARange.Worksheet.Rows[ARow];
            Cell1.Insert(2);
          end;  
       {   V := ARange.Worksheet.Range[Cell1, Cell2];
          if RecNo <> recordCount then
          begin
            V.Copy;
            Cell1 := ARange.Worksheet.Cells[ARow, ACol + i];
            Cell1.Insert(2);
          end;  }
          Cell1 := ARange.Worksheet.Cells[ARow, ACol];
          Cell2 := ARange.Worksheet.Cells[ARow, ACol + AColCount];
          V := ARange.Worksheet.Range[Cell1, Cell2];
          if ACanvas = nil then
            V.RowHeight := 25.5
          else
            V.RowHeight := 12.75;
          CDSToExcel(CDS, V, ACanvas, AAddDot);
          Next;
          inc(ARow);
        end;
        ARange.Application.CutCopyMode := False;
      end;
    end;
  finally
    ReleaseDC(0, ACanvas.Handle);
    ACanvas.Free;
  end;
end;


function SetExcelBMVal(ARange : Variant; BMName : String; AVal : Variant;
                       ACanvas : TCanvas; AAddDot : boolean) : boolean;
var V, V2 : Variant;
    R, R2 : TRect;
    Y, Y0 : integer;
    i : integer;
    S : String;
begin
  case Vartype(AVal) of
    varBoolean : if AVal then V2 := 'Да' else V2 := 'Нет';
    else
      V2 := AVal;
  end;
  
  Result := false;
//  V := ARange.Replace(BMName, V2, 1);
//  V := ARange.Find(BMName, Null, 1, 1);
  V := ARange.Find(What := BMName, LookAt := 1);

  if not VarIsEmpty(V) then
  begin
    Result := true;
    case Vartype(AVal) of
      varCurrency : V.Value2 := V2;
      else
        V.Value := V2;
    end;
 //   V.Value := V2;

    if ACanvas <> nil then
    begin
      ACanvas.Font.Name := V.Font.Name;
      ACanvas.Font.Size := V.Font.Size;
      if V.Font.Bold then
        ACanvas.Font.Style := ACanvas.Font.Style + [fsBold]
      else
        ACanvas.Font.Style := ACanvas.Font.Style - [fsBold];

      if (V.MergeCells) then
      begin
        R.Right := 0;
        for i := 1 to V.MergeArea.Cells.Count do
          R.Right := R.Right + V.MergeArea.Cells[i].Width;
        R.Right := (R.Right * Screen.PixelsPerInch) div 72;
      end
      else
        R.Right := (V.Width * Screen.PixelsPerInch) div 72;
//      R.Bottom := V.RowHeight * 1.255189255;
      R.Bottom := 10;
      S := Trim(VarToStr(V2));

      R2 := R;
      if AAddDot and (Length(S) > 10) then S := S + ' .';
      
      Y := DrawText(ACanvas.Handle, PChar(S), -1, R, DT_WORDBREAK or DT_CALCRECT);
      Y0 := DrawText(ACanvas.Handle, 'W', -1, R2, DT_WORDBREAK or DT_CALCRECT);
      if (Y0 <> Y) and (V.RowHeight < 12.75 * Y/Y0) then
        V.RowHeight := 12.75 * Y/Y0;    
   {   if V.RowHeight < Y/Screen.PixelsPerInch * 72 then
        V.RowHeight := Y/Screen.PixelsPerInch * 72;   }
    end; 
  end;
end;


procedure GreedToExcel(Grid: TDBGrid; ACaption : string);
var i, j, MaxColWdth : integer;
    OldValue : Variant;
    ExcelApp, DataValues : Variant;
    Workbook, Column, Sheet, Cell1, Cell2, Range : Variant;
    BeginCol, BeginRow, ColumnsCnt, XXX: integer;
    S : String;
    AHandle : HWnd;
begin
  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;
  CheckExcel;
   with Grid.DataSource.DataSet do
  begin
    OldValue := Grid.DataSource.DataSet.Fields[0].AsVariant;
    BeginCol := 1;
    BeginRow := 1;

    MaxColWdth := 100;
    
    DisableControls;
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Application.EnableEvents := false;

    try
      try Workbook := ExcelApp.WorkBooks.Add; except end;
      Sheet := ExcelApp.Workbooks[1].WorkSheets[1];

      if (trim(ACaption) <> '') then
        BeginRow := 3;
      ColumnsCnt := 0;
      for i := 0 to Grid.Columns.Count - 1 do
       if Grid.Columns[i].Visible then inc(ColumnsCnt);
       
      DataValues := VarArrayCreate([0, RecordCount + 0, 0, ColumnsCnt - 1], varVariant);

      XXX := -1;
      for i := 0 to Grid.Columns.Count - 1 do
      begin
        if Grid.Columns[i].Visible then
        begin
          inc(XXX);
          DataValues[0, XXX] := Grid.Columns[i].Title.Caption;
        end;
      end;

      j := 1;
      First;
      while not EOF do
      begin
        XXX := -1;
        for i := 0 to Grid.Columns.Count - 1 do
        begin
          if Grid.Columns[i].Visible then
          begin
            inc(XXX);

            if trim(Grid.Columns[i].Title.Caption) <> '' then
            begin
              if Assigned(Grid.Columns[i].Field.OnGetText) then
                DataValues[j, XXX] := Grid.Columns[i].Field.DisplayText
              else
              begin
                if not (Grid.Columns[i].Field is TBooleanField) then
                begin
                  if (Grid.Columns[i].Field is TFloatField) then
                  begin
                    if not Grid.Columns[i].Field.IsNull then
                    begin
                      S := TFloatField(Grid.Columns[i].Field).DisplayFormat;
                      if S = '' then
                        S := '0.##';
                      DataValues[j, XXX] := StrToFloat(FormatFloat(S, Grid.Columns[i].Field.AsFloat))
                    end;
                  end
                  else
                    DataValues[j, XXX] := Grid.Columns[i].Field.Value
                end
                else
                begin
                  if Grid.Columns[i].Field.AsBoolean then
                    DataValues[j, XXX] := 'Да'
                  else
                    DataValues[j, XXX] := 'Нет'
                end;
              end;
            end;
          end;
        end;

        inc(j);
        Next;
      end;
      Cell1 := Sheet.Cells[BeginRow, BeginCol];
      Cell2 := Sheet.Cells[BeginRow + RecordCount + 0, BeginCol + ColumnsCnt - 1];
      Range := Sheet.Range[Cell1, Cell2];
      Range.Value := DataValues;
      Range.Borders.LineStyle := 1;

      Cell1 := Sheet.Cells[BeginRow, BeginCol];
      Cell2 := Sheet.Cells[BeginRow, BeginCol + ColumnsCnt - 1];
      Range := Sheet.Range[Cell1, Cell2];
      Range.Font.Bold := true;
        
      for i := 0 to ColumnsCnt - 1 do
      begin
        Column := Sheet.Columns[BeginCol + i];
        Column.AutoFit;
        if Column.ColumnWidth > MaxColWdth then
          Column.ColumnWidth := MaxColWdth;
      end;

      if (trim(ACaption) <> '') then
      begin
        Cell1 := Sheet.Cells[1, BeginCol];
        Cell1.Font.Bold := true;
        Cell1.Font.Size := 14;
        Cell1.Value := ACaption;
      end;
      ExcelApp.Visible := true;
    except
      ExcelApp.Quit;
      ExcelApp := Null;

    end;

//      ExcelApp := Null;
    Grid.DataSource.DataSet.Locate(Grid.DataSource.DataSet.Fields[0].FieldName, OldValue, [loCaseInsensitive]);
    EnableControls;
  end;
end;
 
procedure SetRowHeights(Rect : TRect; AField : TField; ASizeField : TField; AGrid : TCustomDBGrid);
var R : TRect;
    S : String;
    Y : integer;
begin
  R := Rect;
  S := ASizeField.AsString;
  Y := DrawText(THackGrid(AGrid).Canvas.Handle, PChar(S), -1, R, DT_WORDBREAK or DT_CALCRECT);
  if Y > THackGrid(AGrid).RowHeights[THackGrid(AGrid).DataLink.ActiveRecord + 1] then
    THackGrid(AGrid).RowHeights[THackGrid(AGrid).DataLink.ActiveRecord + 1] := Y;

  R := Rect;
  R.Bottom := R.Top + Y;
  DrawText((AGrid as THackGrid).Canvas.Handle, PChar(S), -1, R, DT_LEFT or DT_WORDBREAK);

end;


procedure FixIdRefresh(CDS : TClientDataSet; IdField : String; Val : integer);
var Id : integer;
    OldRecNo :Integer;
begin
  OldRecNo := -1;
  Id := -1;
  with CDS do
  begin
    if Active then
    begin
      OldRecNo := RecNo;
      if Val > 0 then
        Id := Val
      else
        Id := FieldByName(IdField).AsInteger;
    end;

    Close;
    Open;

    if not Locate(IdField, Id, [loCaseInsensitive]) and (OldRecNo > 0) then
    begin
      if (OldRecNo <= CDS.RecordCount) then
        RecNo := OldRecNo
      else
        Last;
    end;
  end;
end;

function StrToFloatAdv(S: string): Extended;
begin
  S := trim(S);
  S := StringReplace(S, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, CHR(160), '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  if S = '' then
    Result := 0
  else
  begin
    if (DecimalSeparator = '.') then
      S := StringReplace(Trim(S), ',', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
    if (DecimalSeparator = ',') then
      S := StringReplace(Trim(S), '.', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
    try
      Result := StrToFloat(S);
    except
      Result := 0;
    end;
  end;
end;


procedure BeginTruns(Conn : TDispatchConnection);
begin
  THackDispatchConnection(Conn).AppServer.BeginTruns;
end;

procedure CommitTrans(Conn : TDispatchConnection);
begin
  THackDispatchConnection(Conn).AppServer.CommitTrans
end;

procedure RollbackTrans(Conn : TDispatchConnection);
begin
  THackDispatchConnection(Conn).AppServer.RollbackTrans
end;
 

function HackFindControl(const ASplitter : TSplitter): TControl;
var
  P: TPoint;
  I: Integer;
  R: TRect;
begin
  with ASplitter do
  begin
    Result := nil;
    P := Point(Left, Top);
    case Align of
      alLeft: Dec(P.X);
      alRight: Inc(P.X, Width);
      alTop: Dec(P.Y);
      alBottom: Inc(P.Y, Height);
    else
      Exit;
    end;
    for I := 0 to Parent.ControlCount - 1 do
    begin
      Result := Parent.Controls[I];
      if Result.Visible and Result.Enabled then
      begin
        R := Result.BoundsRect;
        if (R.Right - R.Left) = 0 then
          if Align in [alTop, alLeft] then
            Dec(R.Left)
          else
            Inc(R.Right);
        if (R.Bottom - R.Top) = 0 then
          if Align in [alTop, alLeft] then
            Dec(R.Top)
          else
            Inc(R.Bottom);
        if PtInRect(R, P) then Exit;
      end;
    end;
    Result := nil;
  end;
end;

procedure SaveSplitterSettingsFromRegistry(const ASplitter : TSplitter; APath : String);
var Reg : TRegistry;
    S : String;
    AControl : TControl;
    Val : integer;
begin
  try
    AControl := HackFindControl(ASplitter);
    if AControl = nil then
      Exit;
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      case ASplitter.Align of
        alLeft, alRight: Val := AControl.Width;
        alTop, alBottom: Val := AControl.Height;
      end;
      if Reg.OpenKey(APath, true) then
        Reg.WriteInteger(ASplitter.Name + '_Val2', Val);
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  except
  end;
end;

procedure LoadSplitterSettingsFromRegistry(const ASplitter : TSplitter; APath : String);
var Reg : TRegistry;
    S : String;
    AControl : TControl;
    Val : integer;
begin
  try
    AControl := HackFindControl(ASplitter);
    if AControl = nil then
      Exit;
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(APath, false) then
          if Reg.ValueExists(ASplitter.Name + '_Val2') then
          begin
            Val := Reg.ReadInteger(ASplitter.Name + '_Val2');
            case ASplitter.Align of
              alLeft, alRight: AControl.Width := Val;
              alTop, alBottom: AControl.Height := Val;
            end;
          end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  except
  end;
end;

procedure SaveFormSettingsToRegistry(const AForm : TForm; APath : String);
var Reg : TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKey(APath, true) then
    begin
      Reg.WriteInteger('WindowState', ORD(AForm.WindowState));
      if AForm.WindowState <> wsMaximized then
      begin
        Reg.WriteInteger('Top', AForm.Top);
        Reg.WriteInteger('Left', AForm.Left);
        Reg.WriteInteger('Height', AForm.Height);
        Reg.WriteInteger('Width', AForm.Width);
      end;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure LoadFormSettingsToRegistry(const AForm : TForm; APath : String);
var Reg : TRegistry;
begin
//  AForm.Position := poDefault;
  
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKey(APath, false) then
    begin
      if Reg.ValueExists('Top') then
        AForm.Top := Reg.ReadInteger('Top');
      if Reg.ValueExists('Left') then
        AForm.Left := Reg.ReadInteger('Left');
      if Reg.ValueExists('Height') then
        AForm.Height := Reg.ReadInteger('Height');
      if Reg.ValueExists('Width') then
        AForm.Width := Reg.ReadInteger('Width');
      if Reg.ValueExists('WindowState') then
        AForm.WindowState := TWindowState(Reg.ReadInteger('WindowState'));
    end
    else
    begin
   {   if AForm.Top > 100 then AForm.Top := 100;
      if AForm.Left > 100 then AForm.Left := 100;
      if AForm.Width > 800 then AForm.Width := 800;   }
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure GetValues(Reg : TRegistry; SL : TStrings; Preff : String);
var  i : integer;
begin
  i := 0;
  while (i < 9) and (Reg.ValueExists(Preff + IntToStr(i))) do
  begin
    SL.Add(Reg.ReadString(Preff + IntToStr(i)));
    Inc(i);
  end;
end;

procedure SaveValues(Reg : TRegistry; SL : TStrings; Preff : String);
var  i : integer;
begin
  for i := 0 to SL.Count - 1 do
    Reg.WriteString(Preff + IntToStr(i), SL[i]);
end;


procedure SetParamVal(AParam : TParam; AVal : String);
begin
  if AVal <> '' then
    AParam.AsString := AVal
  else
    AParam.AsString := ' ';
end;

procedure SetParamVal(AParam : TParam; AControl : TCheckBox);
begin
  if AControl.State <> cbGrayed then
    AParam.AsBoolean := AControl.Checked
  else
    AParam.Value := Null;
end;

procedure SetParamVal(AParam : TParam; AControl :  TDateTimePicker);
begin
  if AControl.Checked then
    AParam.AsDate := trunc(AControl.DateTime)
  else
    AParam.Value := Null;
end;

procedure NewFilterValue(CB : TComboBox; Value : String);
var i : integer;
begin
  if (Value <> '') then
  begin
    for i := 0 to CB.Items.Count - 1 do
    begin
      if CB.Items[i] = Value then
      begin
        CB.Items.Delete(i);
        Break;
      end;
    end;
    if CB.Items.Count = 10 then
      CB.Items.Delete(9);
    CB.Items.Insert(0, Value);
    CB.ItemIndex := 0;
  end;
end;

procedure mrWebBrowserFind(AWB : TWebBrowser);
var
  A, B: OleVariant;
  Target: IOleCommandTarget;
  OleCmd: TOLECMD;
begin
  // Получаем интерфейс IOleCommandTarget
  Target := AWB.Document as IOLECommandtarget;
  with OleCmd do
  begin
    cmdId := IDM_FIND;
    cmdf  := 0;
  end;
  // Запрашиваем, поддерживается ли команда
  Target.QueryStatus(@CGID_MSHTML, 1, @OleCmd, NIL);
  if (OleCmd.cmdf and OLECMDF_SUPPORTED) = OLECMDF_SUPPORTED then
    // Да, у нас IE5+, поэтому вызываем документированным способом
    Target.Exec(@CGID_MSHTML, IDM_FIND,
      OLECMDEXECOPT_DODEFAULT, A, B)
  else
    // Нет, у нас IE4, поэтому вызываем недокументированным способом
    Target.Exec(@CGID_IE4, 1, OLECMDEXECOPT_DODEFAULT, A, B);
end;

procedure mrWebBrowserPrint(AWB : TWebBrowser; PrintWithSetup : boolean);
var
  A, B: OleVariant;
  UserAction: Cardinal;
begin
  if PrintWithSetup then
    UserAction := OLECMDEXECOPT_PROMPTUSER
  else
    UserAction := OLECMDEXECOPT_DONTPROMPTUSER;
  try
    AWB.ExecWB(OLECMDID_PRINT, UserAction, A, B);
  except
  end;
end;

procedure mrWebBrowserSelectAll(AWB : TWebBrowser);
begin
  try
    AWB.ExecWB(OLECMDID_SELECTALL, 0);
  except
  end;
end;

procedure mrWebBrowserCopySelected(AWB : TWebBrowser);
var
  vInput, vOutput: OleVariant;
begin
  try
    AWB.ExecWB(OLECMDID_COPY, 0, vInput, vOutput);
  except
  end;
end;

function GetBtnSortMarker(Field: TField): TSortMarker;
var Index : TIndexDef;
begin
  Result := smNone;
  if (Field = nil) or ((Field.DataSet as TClientDataSet).IndexName = '') then Exit;

  Index := (Field.DataSet as TClientDataSet).IndexDefs.Find((Field.DataSet as TClientDataSet).IndexName);
  if Index.Fields = Field.FieldName then
    if not (ixDescending in Index.Options) then
      Result := smUp
    else
      Result := smDown;
end;

procedure ReOrderCDS(AField : TField);
begin
  if (AField <> nil) and (AField.DataSet <> nil) then
    ReOrderCDS(AField.DataSet as TClientDataSet, AField.FieldName);
end;

procedure ReOrderCDS(CDS: TClientDataSet; OrdField : String);
var OldIndex : TIndexDef;
    NewOptions : TIndexOptions;
begin
  try
    if CDS.FindField(OrdField) = nil then
      Exit;

    CDS.DisableControls;
    try
      NewOptions := [ixCaseInsensitive];
      if CDS.IndexName <> '' then
      begin
        OldIndex := CDS.IndexDefs.Find(CDS.IndexName);
        if OldIndex.Fields = OrdField then
          if not (ixDescending in OldIndex.Options) then
            NewOptions := NewOptions + [ixDescending];
   //     OldIndex.Free;
        CDS.DeleteIndex(OldIndex.Name);
      end;
      if (CDS.FieldByName(OrdField) <> nil) and (CDS.FieldByName(OrdField).FieldKind <> fkCalculated) then
      begin
        CDS.IndexDefs.Clear;
        CDS.IndexDefs.Add('ix' + OrdField, OrdField, NewOptions);
        CDS.IndexName := 'ix' + OrdField;
      end;
    finally
      CDS.EnableControls;
    end;
  except

  end;
end;
procedure SavePopupMenuToRegistry(const APopupMenu : TPopupMenu; APath : String);
var Reg : TRegistry;
    i : integer;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKey(APath, true) then
    begin
        with APopupMenu do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            Reg.WriteBool(Items[i].Name, Items[i].Checked)
          end;
        end;
     end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure LoadPopupMenuFromRegistry(const APopupMenu : TPopupMenu; APath : String);
var Reg : TRegistry;
    i : integer;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKey(APath, true) then
    begin
        with APopupMenu do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            if Reg.ValueExists(Items[i].Name) then
              Items[i].Checked := Reg.ReadBool(Items[i].Name);
          end;
        end;
     end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure SaveGridSettingsToRegistry(const AGrid : TDBGrid; APath : String);
var Reg : TRegistry;
    i : integer;
    CDS : TClientDataSet;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKey(APath, true) then
    begin
      for i := 0 to AGrid.Columns.Count - 1 do
      begin
        Reg.WriteInteger('Column_' + AGrid.Columns[i].FieldName, AGrid.Columns[i].Width);

      end;
      if (AGrid.DataSource <> nil) and (AGrid.DataSource.DataSet <> nil) and (AGrid.DataSource.DataSet is TClientDataSet) then
      begin
         CDS := TClientDataSet(AGrid.DataSource.DataSet);
         for i := 0 to CDS.IndexDefs.Count - 1 do
         begin
           Reg.WriteString('IndexDefs_Fields' + IntToStr(i), CDS.IndexDefs[i].Fields);
           Reg.WriteBool('IndexDefs_Descending' + IntToStr(i), (ixDescending in CDS.IndexDefs[i].Options));
         end;
      end;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure LoadGridSettingsFromRegistry(const AGrid : TDBGrid; APath : String);
var Reg : TRegistry;
    i : integer;
    CDS : TClientDataSet;
    NewOptions : TIndexOptions;
    S : String;
begin
  try
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(APath, false) then
      begin
        for i := 0 to AGrid.Columns.Count - 1 do
          if Reg.ValueExists('Column_' + AGrid.Columns[i].FieldName) then
            AGrid.Columns[i].Width := Reg.ReadInteger('Column_' + AGrid.Columns[i].FieldName);

        if (AGrid.DataSource <> nil) and (AGrid.DataSource.DataSet <> nil) and (AGrid.DataSource.DataSet is TClientDataSet) then
        begin
           i := 0;
           CDS := TClientDataSet(AGrid.DataSource.DataSet);
           while Reg.ValueExists('IndexDefs_Fields' + IntToStr(i)) do
           begin
             NewOptions := [ixCaseInsensitive];
             if Reg.ValueExists('IndexDefs_Descending' + IntToStr(i)) then
               if Reg.ReadBool('IndexDefs_Descending' + IntToStr(i)) then
                 NewOptions := NewOptions + [ixDescending];
             S := Reg.ReadString('IndexDefs_Fields' + IntToStr(i));
             if (CDS.FindField(S) <> nil) and (CDS.FieldByName(S).FieldKind <> fkCalculated) then
             begin
               CDS.IndexDefs.Clear;
               CDS.IndexDefs.Add('ix' + S, S, NewOptions);
               CDS.IndexName := 'ix' + S;
             end;
             inc(i);
           end;
         end;
        end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  except
  end;
end;

procedure ShowHTMLText(AWebBrowser : TWebBrowser; const AText: String);
var
  HTMLDocument : IHTMLDocument2;
  OldCursor : TCursor;
  V : Variant;
  FOnBeforeNavigate2: TWebBrowserBeforeNavigate2;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    FOnBeforeNavigate2 := AWebBrowser.OnBeforeNavigate2;
    AWebBrowser.OnBeforeNavigate2 := nil;
    AWebBrowser.Navigate('about:blank');
    while AWebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;

    HTMLDocument := IHTMLDocument2(AWebBrowser.Document);
    if Assigned(HTMLDocument) then
    begin 
      V := VarArrayCreate([0, 0], varVariant);
      v[0] := AText; 
      HTMLDocument.Write(PSafeArray(TVarData(v).VArray));
      HTMLDocument.Close;
      while AWebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;
    end;
{    AWebBrowser.Navigate('about:blank');
    while AWebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;  

    V := AWebBrowser.Document;
    V.Write(AText);
    while AWebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;   }
  finally
    Screen.Cursor := OldCursor;
    AWebBrowser.OnBeforeNavigate2 := FOnBeforeNavigate2;
  end;
end;

 

function GetFieldData(Value : Variant; NeedCav : boolean; AFormatFloat : String) : String;
var VT : integer;
    S : String;
begin
  if NeedCav then
    S := '"'
  else
    S := '';
  VT := TVarData(Value).VType;
  if (VT in [varEmpty, varNull]) or (trim(VarToStr(Value))='') then
    Result := S + 'не задано' + S
  else
    if VT in [varBoolean] then
    begin
      if Value then
        Result := S + 'Да' + S
      else
        Result := S + 'Нет' + S;
    end
    else
      if VT in [ varSmallint, varInteger, varSingle, varDouble, varCurrency] then
      begin
        Result := {S +} FormatFloat(AFormatFloat, Value){ + S};
      end
      else
        Result := S + trim(VarToStr(Value)) + S;
end;

procedure CompareDate(OldValue, NewValue : Variant; ARusName : String; SL : TStringList; AddValue : boolean; AFormatFloat : String);
begin
  if (Trim(VarToStr(OldValue)) <> Trim(VarToStr(NewValue))) then
  begin
    if AddValue then
      SL.Add('изменено ' + ARusName + ': ' + GetFieldData(OldValue, true, AFormatFloat) + ' -> ' + GetFieldData(NewValue, true, AFormatFloat))
    else
      SL.Add('изменено ' + ARusName);
  end;
end;

procedure CompareField(ADataSet : TClientDataSet; AName, ARusName : String; SL : TStringList; AddValue : boolean; AFormatFloat : String );
var  Field : TField;
begin
  if ADataSet.ChangeCount <> 0 then
  begin
    Field := ADataSet.FindField(AName);
    if Field <> nil then
      CompareDate(Field.OldValue, Field.NewValue, ARusName, SL, AddValue, AFormatFloat)
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

 
procedure DisableControl(AControl : TControl);
var i : integer;
begin
  AControl.Enabled := false;
  if (AControl is TWinControl {TCustomEdit}) or (AControl is TCustomComboBox) {or (AControl is TCustomControl) }then
    THackControl(AControl).Color := clInactiveBorder;
  if AControl is TWinControl then
    for i := 0 to TWinControl(AControl).ControlCount - 1 do
      DisableControl(TWinControl(AControl).Controls[i]);
end;

procedure EnableControl(AControl : TControl);
var i : integer;
begin
  AControl.Enabled := true;
  if (AControl is TWinControl {TCustomEdit}) or (AControl is TCustomComboBox) {or (AControl is TCustomControl)} then
    THackControl(AControl).Color := clWindow;
  if AControl is TWinControl then
    for i := 0 to TWinControl(AControl).ControlCount - 1 do
      EnableControl(TWinControl(AControl).Controls[i]);
end;

procedure BeginUpdateControl(AControl: TWinControl);
begin
  SendMessage(AControl.Handle, WM_SETREDRAW, 0, 0);
end;

procedure EndUpdateControl(AControl: TWinControl);
begin
  SendMessage(AControl.Handle, WM_SETREDRAW, 1, 0);
  AControl.Refresh;
end;

function CDSApplyUpdates(CDS : TClientDataSet; IDFieldName : String; IDFieldValue : integer; ChCountIgnore : boolean) : boolean;
var Field : TField;
    OldAfterPost: TDataSetNotifyEvent;
begin
  Result := false;
  if CDS.State in [dsEdit, dsInsert] then CDS.Post;
  if (CDS.ChangeCount = 0) and (not ChCountIgnore) then
  begin
    Result := true;
    Exit;
  end;
  with CDS do
  begin
    try
      Filtered := false;
      OldAfterPost := AfterPost;
      AfterPost := nil;
      if IDFieldName <> '' then
      begin
        DisableControls;
        try
          Field := FieldByName(IDFieldName);
          First;
          while not EOF do
          begin
            Edit;
            Field.AsInteger := IDFieldValue;
            Post;
            Next;
          end;
        finally
          EnableControls;
        end;
      end;
      AfterPost := OldAfterPost;
      Result := ApplyUpdates(0) = 0;
    except
      AfterPost := OldAfterPost;
    end;
  end;
end;

function TestEMail(AEmail : String) : boolean;
var PosDot, PosAt, Ln : integer;
    i : integer;
begin
  PosDot := -1;
  for i := Length(AEmail) downto 1 do
    if AEmail[i] = '.' then
    begin
      PosDot := i;
      Break;
    end;
  PosAt := Pos('@', AEmail);
  Ln := Length(AEmail);
  Result := (PosAt > 0) and (PosDot > 0) and (Ln >= 7) and ((Ln - PosDot) in [2, 3]) and ((PosDot - PosAt) > 2);
end;

function TestPhone(AChar : Char) : boolean;
begin
  Result := AChar in ['0'..'9', '-', ' ', '+', '(', ')', #8];
end;

function TestNumber(AChar : Char) : boolean;
begin
  Result := AChar in ['0'..'9', #8];
end;

 
 
 
{ THackGrid }

procedure THackGrid.MouseToCell(X, Y: Integer; var ACol, ARow: Integer);
var
  Coord: TGridCoord;
begin
  Coord := MouseCoord(X, Y);
  ACol := Coord.X;
  ARow := Coord.Y;
end;


procedure CloneCDS(Source, Dest: TClientDataSet);
var Stream : TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    Source.SaveToStream(Stream, dfBinary);
    Stream.Position := 0;
    Dest.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;
 

function GetControlOwner(AControl : TComponent) : TCustomForm;
var C : TComponent;
begin
  Result := nil;
  if AControl <> nil then
  begin
    if AControl is TCustomForm then
      Result := AControl as TCustomForm
    else
    begin
      C := AControl.Owner;
      if C is TCustomForm then
        Result := C as TCustomForm
      else
        Result := nil;
      while (Result = nil) and (C <> nil) do
      begin
        if C is TCustomForm then
          Result := C as TCustomForm;
        C := C.Owner;//Owner;
      end;
    end;
  end;
end;

procedure SaveValToRegistry_CalcPath(AControl : TControl; const Val : Variant; AValName : String);
var APath : String;
    Own : TCustomForm;
begin
  Own := GetControlOwner(AControl);
  if Own is TCustomForm then
  begin                               
    APath := SRegPath + '\' + TCustomForm(Own).ClassName + AControl.ClassName;
    SaveValToRegistry(Val, APath, AValName);
  end;
end;

procedure SaveValToRegistry(const Val : Variant; APath, AValName : String);
var Reg : TRegistry;
begin
  try
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;

      if Reg.OpenKey(APath, true) then
      begin
        case VarType(Val) of
          varSmallint, varInteger : Reg.WriteInteger(AValName, Val);
          varSingle, varDouble, varCurrency, varDate : Reg.WriteFloat(AValName, Val);
          varEmpty, varNull : Reg.DeleteValue(AValName);
          else Reg.WriteString(AValName, VarToStr(Val));
        end;
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  except
  end;
end;

procedure LoadValFromRegistry_CalcPath(AControl : TControl; var Val : Variant; AValName : String);
var APath : String;
    Own : TCustomForm;
begin
  Own := GetControlOwner(AControl);
  if Own is TCustomForm then
  begin                               
    APath := SRegPath + '\' + TCustomForm(Own).ClassName + AControl.ClassName;
    LoadValFromRegistry(Val, APath, AValName);
  end;
end;

procedure LoadValFromRegistry(var Val : Variant; APath, AValName : String);
var Reg : TRegistry;
    RRR : TRegDataType;
begin
  Val := Null;
  try
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;

      if Reg.OpenKey(APath, false) then
      begin
        if Reg.ValueExists(AValName) then
        begin
          RRR := Reg.GetDataType(AValName);
        case RRR of
          rdString : Val := Reg.ReadString(AValName);
          rdInteger: Val := Reg.ReadInteger(AValName);
      //    varDate : Reg.WriteDateTime(AValName, Val);
          else Val := Reg.ReadFloat(AValName);
        end;

        end;
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  except
  end;
end;

{ THackGridEh }

procedure THackGridEh.MouseToCell(X, Y: Integer; var ACol, ARow: Integer);
var
  Coord: GridsEh.TGridCoord;
begin
  Coord := MouseCoord(X, Y);
  ACol := Coord.X;
  ARow := Coord.Y;
end;

end.
