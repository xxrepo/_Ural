unit foMyFunc;


interface

uses classes, Windows, Messages, Sysutils, graphics,
  registry, DBGrids, DB, dbclient, RXDBCtrl,
  SHDocVw, ActiveX, Controls, stdctrls,DBGridEh, GridsEh,
  Forms, Printers, comctrls,
  JPEG, RxGIF,
  MSHTML, dialogs, mconnect, menus,
  uInputBox,
  Grids, RxMemDS, ComObj, uPrgForm, Clipbrd, extctrls, ShellAPI;

const
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

  TBJType = (bjtNone, bjtGrp, bjtItem, bjtAcc, bjtCA);
    TLossDetailData = record
    id_business : integer;
    RepNum : integer;
    Year : integer;
    Str3 : Variant;
    Str4 : Variant;
    M : integer;
  end;
  
  TParamz201 = record
    id_business : Variant;
    DateFrom : Variant;
    DateTo : Variant;
    id_ContrAgent,
    id_Goods,
    id_Repr,
    id_Warehouse,
    id_Manufact,
    HasDept: Variant;
  end;

    TOperParamz = record
    ID_Oper, xxxID : integer;
    Is_Mirr : boolean;
    ReadOnly : boolean;
    id_OperParent: Variant;
    Correct, Copy, Offset, DoPay : boolean;
    DelMode : boolean;
    RezMode : boolean;
    Viza : boolean;
    ALevel : integer;
    CalcPrice : boolean;
    xxx : boolean;
    id_Cur, OperTypeIn, Summ : Variant;
  end;

  TDocParamz = record
    ID_Doc : integer;
    ID_Oper : integer;
    Is_Mirr : boolean;
    ReadOnly : boolean;
    Copy : boolean;
    DelMode : boolean;
    OnlyDelta : boolean;
  end;

  IOper = class(TForm)
    function PrevViza(var AText, ACaption: String): boolean; virtual; abstract;
    function SaveProp: boolean; virtual; abstract;
    function GetID_Oper: integer; virtual; abstract;
    procedure Initialize(const AHandle : HWnd; AOperParamz : TOperParamz); virtual; abstract;
    function GetbtnVisaEnabled: boolean; virtual; abstract;
    function GetSelf : TForm; virtual; abstract;
    function GetOperCDS : TClientDataSet; virtual; abstract;
    function CheckAmount(var Amount : Extended) : boolean; virtual; abstract;

    function GetbtnVisaEn : boolean; virtual; abstract;
//    function ChangeData : boolean; virtual; abstract;
 end;


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

  TParamBlnc = record
    id_business : Variant;
    HasViza : Variant;
    DateFrom : Variant;//TDateTime;
    DateTo : Variant;//TDateTime;
    id_ContrAgent : Variant;
    id_CAGroup : Variant;
    id_Repr : Variant;
    id_Warehouse : Variant;
    id_WarehouseGroup : Variant;
    id_Acc : Variant;
    id_AccGroup : Variant;
    id_Manufact : Variant;
    id_ManufactGroup : Variant;

    Correct : Variant;
    Deleted : Variant;
    OperVid : Variant;
    Koeff : Variant;

    DoUP : Variant;
    DoDOWN : Variant;

    id_Goods : Variant;
  end;

  TBlnDetailData = record
    id_business : Variant;
    id_Rep : Variant;
    id_X : Variant;
    OrdNum : integer;
    DateFrom : Variant;
    DateTo : Variant;

    isRawZ : boolean;
    isNotRawZ : boolean;
    isCRN : boolean;
    isUp : boolean;
    isDown : boolean;
    isPPP : boolean;
    isInFromManuf : boolean;

    id_Acc, id_Manufact, id_CA : Variant;
  end;

  TPL_DetailData = record
    id_business : integer;
    Date : Variant;
    DateFrom : Variant;
    id_Oper : Variant;
    id_Goods : Variant;
    id_ContrAgent : Variant;

    WareProff : boolean;
    WareLoss : boolean;

    FinProff : boolean;
    FinLoss : boolean;

    OffProff : boolean;
    OffLoss : boolean;

    CurProff : boolean;
    CurLoss : boolean;
  end;

  TCalcVal = (cvFinSum, cvWHWare, cvWHService, cvOffer, cvRateCH);
  TCalcVals = set of TCalcVal;

  TEObjType = (eotNone, eotBsn, eotFin, eotWH, eotManuf, eotCA, eotCAGroup,
               eotRepr,
               eotGoods,
               eotSimplRepr,
               eotFinGroup, eotWHGroup, eotManufGroup,
               eotReprGroup, eotEQGroup, eotGoodsGroup
               );

  TEObjTypes = set of TEObjType;

  TCatObj = (coNone, coGoods);

  TSelectedObj = record
    Bsn_id : Variant;
    Bsn_Name : String;

    ID : Variant;
    id_Cat : integer;
    Name : String;
//    RealName : String;
    ObjType : TEObjType;
    CA_Name : Variant;
    CA_ID : Variant;
  end;

  TOper = record
    id_Base : integer; 
  end;

  TLBItem = class(TCollectionItem)
  public
   Id:Integer;
   Name:string;
  end;

  TDBObj = class
  private
    FID: Variant;
    FName: String;
  public
    constructor Create;
    destructor Destroy; override;
    property ID : Variant read FID write FID;
    property Name : String read FName write FName;
  end;

  THackDispatchConnection = class(TDispatchConnection)
    property AppServer;
  end;

  TIDList = class(TList)
  private
    function GetID(Index: integer): integer;
    procedure SetID(Index: integer; const Value: integer);
  public
    function Add(const Value : Integer): Integer;
    property ID[Index : integer] : integer read GetID write SetID; default;
    function IndexOf(Value : integer) : integer;
    procedure AssignList(AList : TIDList);
  end;

  TVariantList = class(TList)
  private
    function GetID(Index: integer): Variant;
    procedure SetID(Index: integer; const Value: Variant);
  public
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
    function Add(const Value : Variant): Integer;
    property Val[Index : integer] : Variant read GetID write SetID; default;
    function IndexOf(Value : Variant) : integer;
    procedure AssignList(AList : TVariantList);
  end;

    GrFileType = (gftNone, gftBMP, gftGIF, gftJPG);

    THackControl = class(TControl)
      property Text;
      property Color;
    end;


function GetEmptyDocParamz : TDocParamz;
function GetEmptyOperParamz : TOperParamz;
function GetEmptyParamz201 : TParamz201;

procedure GreedToExcel(Grid: TDBGrid; ACaption : string = '');
procedure CheckExcel;
function SetExcelBMVal(ARange : Variant; BMName : String; AVal : Variant;
                       ACanvas : TCanvas = nil; AAddDot : boolean = false) : boolean;
procedure CDSToExcel(CDS : TClientDataSet; ARange: Variant; ACanvas : TCanvas = nil; AAddDot : boolean = false);
procedure CDSToExcelTable(CDS : TClientDataSet; ARange: Variant; KeyName : String; AAddDot : boolean = false);
function FormatDateTimeNull(const Format: string; ADateTime: TDateTime): string;

function MayVized(CDS : TDataSet) : boolean;

procedure RebildComment(CDS: TClientDataSet);
procedure RebildExtData(CDS: TClientDataSet);
procedure RebildWareData(CDS: TClientDataSet);
procedure RebildWareData_LC(CDS: TClientDataSet);
procedure RebildBJ(CDS: TClientDataSet);


function GetControlOwner(AControl : TComponent) : TCustomForm;
function GetControlFormHHH(AControl : TComponent) : HWnd;
procedure CloneCDS(Source, Dest: TClientDataSet);

function GetEmptyParamBlnc : TParamBlnc;
function GetEmptyBlnDetail : TBlnDetailData;
function GetEmptyPL_DetailData : TPL_DetailData;


function StrToFloatAdv(S: string): Extended;

procedure BeginTruns(Conn : TDispatchConnection);
procedure CommitTrans(Conn : TDispatchConnection);
procedure RollbackTrans(Conn : TDispatchConnection);

function Lunh10(ACode : String) : integer;
function TestByLunh10(ACode : String) : boolean;


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
function DetType(STR : TStream) : GrFileType;
procedure mrWebBrowserFind(AWB : TWebBrowser);
procedure mrWebBrowserPrint(AWB : TWebBrowser; PrintWithSetup : boolean);
procedure mrWebBrowserSelectAll(AWB : TWebBrowser);
procedure mrWebBrowserCopySelected(AWB : TWebBrowser);
procedure CompareField(ADataSet : TClientDataSet; AName, ARusName : String; SL : TStringList; AddValue : boolean = true; AFormatFloat : String = '0.##');
procedure CompareDate(OldValue, NewValue : Variant; ARusName : String; SL : TStringList; AddValue : boolean; AFormatFloat : String);

procedure DisableControl(AControl : TControl);
procedure EnableControl(AControl : TControl);

procedure PrintStrings(S: TStrings; Font: TFont; Title: string);
procedure BeginUpdateControl(AControl: TWinControl);
procedure EndUpdateControl(AControl: TWinControl);
procedure NewFilterValue(CB : TComboBox; Value : String);
function CDSApplyUpdates(CDS : TClientDataSet; IDFieldName : String; IDFieldValue : integer; ChCountIgnore : boolean = false) : boolean;
procedure SetObjState(ADataSet : TDataSet; AFieldName : String; Value : boolean);
function GetFileSizeByName(FileName: String): Integer;

procedure FixIdRefresh(CDS : TClientDataSet; IdField : String; Val : integer = -1);
function InputBoxKrm(const ACaption, APrompt: string; var Value: string;
                     AllowChars : TSetOfChar = [Char(0)..Char(255)];
                     NeedDigit : boolean = false; AOwner : TObject = nil): boolean;
function GetFieldData(Value : Variant; NeedCav : boolean = true; AFormatFloat : String = '0.##') : String;

procedure SetRowHeights(Rect : TRect; AField : TField; ASizeField : TField; AGrid : TCustomDBGrid);

procedure CloneCDS2(Source: TDataSet; Dest : TDataSet);
procedure PutStringIntoClipBoard(const Str: WideString);

function GetDateAdv(ADate : TDateTime; ALastSec : boolean) : TDateTime; overload;
function GetDateAdv(ADate : integer; ALastSec : boolean) : TDateTime;  overload;

procedure ShowText(AMessage : String; APos : integer = 1);
procedure OpenURL(Url: string); 
procedure QuickSortSL(List: TStrings; L, R: Integer; ACase : boolean);
procedure QuickSortSLWP(List: TStrings; ACase : boolean = true);

function DayOfWeekName(Date: TDateTime): String;
function CalcFirstDayOfWeek(Date: TDateTime): TDateTime;

function VarToFloat(V : Variant) : Extended;

procedure MakeCDSCopy(CDS : TClientDataSet; AParamName, AKeyName : String);
function GetFloatFromClipBoadr : Extended;
procedure SetCDSParamVal(CDS : TClientDataSet; AParamName : String; Value : Variant);

procedure SetCDSFormat(CDS : TClientDataSet; DisplayFormat, EditFormat : String);
procedure LoadDocFiles(PM : TPopupMenu; aDocMask : String; aClick : TNotifyEvent);


var  MainFormHandle : HWnd;

implementation


uses uMainForm, uDM;

procedure LoadDocFiles(PM : TPopupMenu; aDocMask : String; aClick : TNotifyEvent);
var RootDir, S : String;
    sr: TSearchRec;
    MI : TMenuItem;
begin
  MI := nil;
  RootDir := ExtractFilePath(Application.EXEName) + 'docs_templ';
  RootDir := RootDir + '\' + aDocMask + '*.xlt';
  if FindFirst(RootDir, faAnyFile - fadirectory, sr) = 0 then
  begin
    repeat
      if (sr.Name <> '.') and (sr.Name <> '..') then
      begin
        if MI = nil then
        begin
          MI := TMenuItem.Create(PM);
          PM.Items.Add(MI);
          MI.Caption := '-';
        end;

        S := StringReplace(StringReplace(sr.Name, aDocMask, '', [rfReplaceAll, rfIgnoreCase]), '.xlt', '', [rfReplaceAll, rfIgnoreCase]);
        MI := TMenuItem.Create(PM);
        PM.Items.Add(MI);
        MI.Caption := S;
        MI.OnClick := aClick;
      end;
    until FindNext(sr) <> 0;
    Sysutils.FindClose(sr);
  end;
end;

procedure SetCDSFormat(CDS : TClientDataSet; DisplayFormat, EditFormat : String);
var i : integer;
begin
  for i := 0 to CDS.Fields.Count - 1 do
  begin
    if CDS.Fields[i] is TFloatField then
    begin
      TFloatField(CDS.Fields[i]).DisplayFormat := DisplayFormat;
      TFloatField(CDS.Fields[i]).EditFormat := EditFormat;
    end;
  end;
end;
procedure SetCDSParamVal(CDS : TClientDataSet; AParamName : String; Value : Variant);
var Prm : TParam;
begin
  Prm := CDS.Params.FindParam(AParamName);
  if (Prm <> nil) then
    Prm.Value := Value;
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


procedure QuickSortSLWP(List: TStrings; ACase : boolean);
begin
  QuickSortSL(List, 0, List.Count - 1, ACase);
end;

procedure QuickSortSL(List: TStrings; L, R: Integer; ACase : boolean);
  function StringListAnsiCompare(Index1, Index2: Integer): Integer;
  var S1, S2 : String;
  begin
    S1 := List[Index1];
    S2 := List[Index2];
    if not ACase then
    begin
      S1 := AnsiUpperCase(S1);
      S2 := AnsiUpperCase(S2);
    end;
    Result := AnsiCompareText(S1,
                              S2);
  end;
var
  I, J, P: Integer;
begin
  repeat
    I := L;
    J := R;
    P := (L + R) shr 1;
    repeat
      while StringListAnsiCompare(I, P) < 0 do Inc(I);
      while StringListAnsiCompare(J, P) > 0 do Dec(J);
      if I <= J then
      begin
        List.Exchange(I, J);
        if P = I then
          P := J
        else if P = J then
          P := I;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then QuickSortSL(List, L, J, ACase);
    L := I;
  until I >= R;
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

procedure CloneCDS2(Source: TDataSet; Dest : TDataSet);
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
    Dest.FieldDefs.Clear;
    Dest.FieldDefs := Source.FieldDefs;

    for I := 0 to Dest.FieldDefList.Count - 1 do
    begin
      ShowProgressForm(0, i, Dest.FieldDefList.Count - 1, 'Копирование структуры данных');
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
    CloseProgressForm;
    with Dest do
    begin
      Open;
      try
        Source.DisableControls;
        OldRecNo := Source.RecNo;
        Source.First;
        Cnt := Source.RecordCount;
        i := 0;
        while not Source.EOF do
        begin
          ShowProgressForm(0, i, Cnt, 'Копирование данных');
          Append;
          AssignRecord2(Source, Dest);
          Post;
          Source.Next;
          inc(i)
        end;
        Source.RecNo := OldRecNo;
      finally
        Source.EnableControls;
        First;
      end;
    end;
  finally
    CloseProgressForm;
  end;
end;

function GetEmptyParamBlnc : TParamBlnc;
begin
  Result.id_business := Null;
  Result.HasViza := Null;
  Result.DateFrom := Date;
  Result.DateTo := Date;
  Result.id_ContrAgent := Null;

  Result.id_CAGroup := Null;

  Result.id_Repr := Null;
  Result.id_Warehouse := Null;
  Result.id_WarehouseGroup := Null;
  Result.id_Acc := Null;
  Result.id_AccGroup := Null;
  Result.id_Manufact := Null;
  Result.id_ManufactGroup := Null;

  Result.Correct := Null;
  Result.Deleted := 0;
  Result.OperVid := Null;
  Result.Koeff := Null;

  Result.DoUP := Null;
  Result.DoDOWN := Null;

  Result.id_Goods := Null;
end;

function GetEmptyOperParamz : TOperParamz;
begin
  Result.ID_Oper := -1;
  Result.xxxID := -1;

  Result.Is_Mirr := false;
  Result.ReadOnly := false;
  Result.id_OperParent := Null;
  Result.Correct := false;
  Result.Copy := false;
  Result.DelMode := false;
  Result.Viza := false;
  Result.RezMode := false;
  Result.ALevel := 0;
  Result.CalcPrice := false;
  Result.Offset := false;
  Result.DoPay := false;
  Result.xxx := false;

  Result.id_Cur := Null;
  Result.Summ := Null;
  Result.OperTypeIn := Null;

end;

function GetEmptyParamz201 : TParamz201;
begin
  Result.id_business := Null;
  Result.DateFrom := Null;
  Result.DateTo := Null;
  Result.id_ContrAgent := Null;
  Result.id_Goods := Null;
  Result.id_Repr := Null;
  Result.id_Warehouse := Null;
  Result.id_Manufact := Null;
  Result.HasDept := Null;
end;


function GetEmptyDocParamz : TDocParamz;
begin
  Result.ID_Doc := -1;
  Result.ID_Oper := -1;
  Result.Is_Mirr := false;
  Result.ReadOnly := false;
  Result.Copy := false;
  Result.DelMode := false;
  Result.OnlyDelta := false;    
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
          if UpperCase(AField.FieldName) = 'INN' then
          begin
            S := DM.acsINN(AField);
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

function GetEmptyBlnDetail : TBlnDetailData;
var Year, Month, Day : Word;
begin
  Result.id_Rep := Null;
  Result.id_X := Null;

  Result.id_business := Null;
  DecodeDate(Date, Year, Month, Day);
  Result.DateFrom := EncodeDate(Year, Month, 1);
  Result.DateTo := Date;

  Result.isRawZ := false;
  Result.isNotRawZ := false;
  Result.isCRN := false;
  Result.isUp := false;
  Result.isDown := false;
  Result.isInFromManuf := false;
  Result.isPPP := false;

  Result.id_Acc := Null;
  Result.id_Manufact := Null;
  Result.id_CA := Null;
  Result.OrdNum := 0;

end;

function GetEmptyPL_DetailData : TPL_DetailData;
begin
  Result.id_business := -1;
  Result.Date := Null;
  Result.DateFrom := Null;
  Result.id_Oper := Null;
  Result.id_Goods := Null;
  Result.id_ContrAgent := Null;

  Result.WareProff := false;
  Result.WareLoss := false;
  Result.FinProff := false;
  Result.FinLoss := false;
  Result.OffProff := false;
  Result.OffLoss := false;
  Result.CurProff := false;
  Result.CurLoss := false;
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
   //   Result := StrToFloat(S);
      if not TextToFloat(PChar(S), Result, fvExtended) then
        Result := 0;
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

function Lunh10(ACode : String) : integer;
var i, N, T : integer;
begin
  Result := 0;
  N := Length(ACode);

  for i := 1 to N do
  begin
    T := StrToInt(ACode[i]);
    T := T * (1 + (i mod 2));
    if T < 10 then
      Result := Result + T
    else
      Result := Result + T - 9;
  end;
  Result := 10 - (Result mod 10);
  if Result = 10 then      // ????????????
    Result := 0;
end;

function TestByLunh10(ACode : String) : boolean;
var Sgn, Code : String;
    N : integer;
begin
  Result := false;
  N := Length(ACode);
  if N > 1 then
  begin
    Sgn := Copy(ACode, N, 1);
    Code := Copy(ACode, 1, N - 1);
    Result := StrToInt(Sgn) = Lunh10(Code);
  end;
end;

function ElexGetID(ACode : String; var Obj : integer; var ID : integer) : boolean;
var Sgn, Code, AObj, AID : String;
    N : integer;
begin
  Result := false;
  Obj := -1;
  ID := -1;
  N := Length(ACode);
  if N > 4 then
  begin
    Sgn := Copy(ACode, N, 1);
    AObj := Copy(ACode, 1, 2); // Тип объекта
    AID := Copy(ACode, 3, N - 3);
    Code := Copy(ACode, 1, N - 1);
    Result := StrToInt(Sgn) = Lunh10(Code);
    if Result then
    begin
      Obj := StrToInt(AObj);
      ID := StrToInt(AID);
    end;
  end;
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

function DetType(STR : TStream) : GrFileType;
var B0, B1, B2, B3 : BYTE;
begin
  STR.Position := 0;
  STR.Read(B0, 1);
  STR.Position := 1;
  STR.Read(B1, 1);
  STR.Position := 2;
  STR.Read(B2, 1);
  STR.Position := 3;
  STR.Read(B3, 1);
  STR.Position := 0;
  Result := gftNone;
  if (B0 = $42) and (B1 = $4D) then
     Result := gftBMP
  else
    if (B0 = $47) and (B1 = $49) and (B2 = $46) then
       Result := gftGIF
    else
      if (B0 = $FF) and (B1 = $D8) and (B2 = $FF) and (B3 = $E0) then
         Result := gftJPG;
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

procedure PrintStrings(S: TStrings; Font: TFont; Title: string);
var
  LeftMargin, TopMargin, LineCoord, LineOnPage, LinesOnDoc,
  CurrentLine, TextHeight, LinesPerPage, LineInterval: integer;
 
  procedure StartDoc;
  begin
    LinesOnDoc := S.Count;
    Printer.Canvas.Font.Assign(Font);
    Printer.Canvas.TextOut(0, 0, ' ');
    LeftMargin := (Printer.Canvas.Font.PixelsPerInch) div 2;
    TopMargin  := (Printer.Canvas.Font.PixelsPerInch) div 2;
    TextHeight := Abs(Printer.Canvas.Font.Height);
    LineInterval := TextHeight + (TextHeight div 2);
    LinesPerPage := (Printer.PageHeight - TopMargin) div LineInterval;
    CurrentLine := 0;
  end;
 
  function MorePages:boolean;
  begin
    Result := (CurrentLine < LinesOnDoc) and
              not Printer.Aborted;
  end;
 
  procedure StartPage;
  begin
    LineOnPage := 0;
    LineCoord := TopMargin;
  end;
 
  procedure NextPage;
  begin
    if MorePages then Printer.NewPage;
  end;
 
  function MoreLines:boolean;
  begin
    Result := (LineOnPage < LinesPerPage) and
              (LineOnPage < LinesOnDoc) and
              not Printer.Aborted;
  end;
 
  procedure NextLine;
  begin
    Inc(LineOnPage);
    Inc(LineCoord, LineInterval);
    Inc(CurrentLine);
  end;
 
  procedure PrintLine;
  begin
    Printer.Canvas.TextOut(LeftMargin, LineCoord, S.Strings[CurrentLine]);
  end;
var NeedDel : boolean;
    PSD : TPrinterSetupDialog;
begin
  PSD := TPrinterSetupDialog.Create(nil);
  try
    if PSD.Execute then
    begin
      NeedDel := false;
      if Font = nil then
      begin
        Font := TFont.Create;
        Font.Size := 10;
        NeedDel := true;
      end;
      try
        Printer.Title := Title;
        Printer.BeginDoc;
        StartDoc;
        while MorePages do
        begin
          StartPage;
          while MoreLines do
          begin
            PrintLine;
            NextLine;
            Application.ProcessMessages;
          end;
          NextPage;
        end;
        Printer.EndDoc;
      finally
        if NeedDel then
          Font.Free;
      end;
    end;
  finally
    PSD.Free;
  end;
end;

procedure DisableControl(AControl : TControl);
var i : integer;
begin
  AControl.Enabled := false;
  if (AControl is TCustomEdit) or (AControl is TCustomComboBox) {or (AControl is TCustomControl) }then
    THackControl(AControl).Color := clInactiveBorder;
  if AControl is TWinControl then
    for i := 0 to TWinControl(AControl).ControlCount - 1 do
      DisableControl(TWinControl(AControl).Controls[i]);
end;

procedure EnableControl(AControl : TControl);
var i : integer;
begin
  AControl.Enabled := true;
  if (AControl is TCustomEdit) or (AControl is TCustomComboBox) {or (AControl is TCustomControl)} then
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

procedure SetObjState(ADataSet : TDataSet; AFieldName : String; Value : boolean);
var F : TField;
begin
  F := ADataSet.FindField(AFieldName);
  if F <> nil then
  begin
    ADataSet.Edit;
    F.AsBoolean := Value;
    ADataSet.Post;
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

function InputBoxKrm(const ACaption, APrompt: string; var Value: string; AllowChars : TSetOfChar; NeedDigit : boolean; AOwner : TObject): boolean;
begin
  Result := uInputBox.InputBoxKrm(ACaption, APrompt, Value, AllowChars, NeedDigit, AOwner);
end;

{ TIDList }

function TIDList.Add(const Value: Integer): Integer;
begin
  Result := inherited Add(Pointer(Value));
end;

function TIDList.GetID(Index: integer): integer;
begin
  Result := integer(Items[index]);
end;

function TIDList.IndexOf(Value: integer): integer;
begin
  Result := inherited IndexOf(Pointer(Value));
end;

procedure TIDList.SetID(Index: integer; const Value: integer);
begin
  Items[index] := Pointer(Value);
end;

procedure TIDList.AssignList(AList : TIDList);
var i : integer;
begin
  if AList <> nil then
  begin
    AList.Clear;
    for i := 0 to Count - 1 do
    begin
      AList.Add(ID[i]);
    end;
  end;
end;

{ TDBObj }

constructor TDBObj.Create;
begin
  inherited;
  FID := Null;
end;

destructor TDBObj.Destroy;
begin
  inherited;

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

{ TVariantList }

function TVariantList.Add(const Value: Variant): Integer;
begin
  Val[Count - 1] := Value;
  Result := Count - 1; 
end;

procedure TVariantList.AssignList(AList: TVariantList);
var i : integer;
begin
  if AList <> nil then
  begin
    AList.Clear;
    for i := 0 to Count - 1 do
    begin
      AList.Add(Val[i]);
    end;
  end;
end;

function TVariantList.GetID(Index: integer): Variant;
begin
  Result := Variant(Items[index]^);
end;

function TVariantList.IndexOf(Value: Variant): integer;
var i : integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  begin
    if Val[Count - 1] = Value then
    begin
      Result := i;
      Break;
    end;
  end;
end;

procedure TVariantList.Notify(Ptr: Pointer; Action: TListNotification);
begin
  if Action = lnDeleted then
    Dispose(Ptr);
  inherited Notify(Ptr, Action);
end;

procedure TVariantList.SetID(Index: integer; const Value: Variant);
var P : PVariant;
begin
  New(P);
  P^ := Value;
  Items[index] := P;
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

procedure RebildComment(CDS: TClientDataSet);
var
    RxMemoryData1: TRxMemoryData;
    i : integer;
    AField : TField;
begin
  if not CDS.IsEmpty then
  begin
    RxMemoryData1 := TRxMemoryData.Create(nil);
    try
      CDS.First;
  //    RxMemoryData1.FieldDefs.Add('id_Oper', ftInteger);
      RxMemoryData1.FieldDefs.Add('CommentType', ftInteger);
      RxMemoryData1.FieldDefs.Add('id_User', ftInteger);
      RxMemoryData1.FieldDefs.Add('Comment', ftString, 50);
      RxMemoryData1.LoadFromDataSet(CDS, CDS.RecordCount, lmAppend);
      CDS.EmptyDataSet;
      with RxMemoryData1 do
      begin
        First;
        while not Eof do
        begin
          CDS.Append;
          for i := 0 to Fields.Count - 1 do
          begin
            AField := CDS.FindField(RxMemoryData1.Fields[i].FieldName);
            if (AField <> nil) and (AField.CanModify) and (not AField.ReadOnly) then
              AField.Value := Fields[i].Value;
          end;
          CDS.Post;
          Next;
        end;
      end;
      RxMemoryData1.Close;
    finally
      RxMemoryData1.Free;
    end;
  end;
end;

procedure RebildExtData(CDS: TClientDataSet);
var
    RxMemoryData1: TRxMemoryData;
    i : integer;
    AField : TField;
begin
  if not CDS.IsEmpty then
  begin
    RxMemoryData1 := TRxMemoryData.Create(nil);
    try
      CDS.First;
 //     RxMemoryData1.FieldDefs.Add('id_Oper', ftInteger);
      RxMemoryData1.FieldDefs.Add('Type', ftInteger);
      RxMemoryData1.FieldDefs.Add('NumPrm', ftInteger);
      RxMemoryData1.FieldDefs.Add('DigVal', ftFloat);
      RxMemoryData1.FieldDefs.Add('StrVal', ftString, 100);
      RxMemoryData1.FieldDefs.Add('DateVal', ftDateTime);

      RxMemoryData1.FieldDefs.Add('ParName', ftString, 100);

      RxMemoryData1.FieldDefs.Add('CommentType', ftInteger);
      RxMemoryData1.FieldDefs.Add('id_User', ftInteger);
      RxMemoryData1.FieldDefs.Add('Comment', ftString, 50);
      RxMemoryData1.LoadFromDataSet(CDS, CDS.RecordCount, lmAppend);
      CDS.EmptyDataSet;
      with RxMemoryData1 do
      begin
        First;
        while not Eof do
        begin
          CDS.Append;
          for i := 0 to Fields.Count - 1 do
          begin
            AField := CDS.FindField(Fields[i].FieldName);
            if (AField <> nil) and (AField.CanModify) and (not AField.ReadOnly) then
              AField.Value := Fields[i].Value;
          end;
          CDS.Post;
          Next;
        end;
      end;
      RxMemoryData1.Close;
    finally
      RxMemoryData1.Free;
    end;
  end;
end;

procedure RebildWareData(CDS: TClientDataSet);
var
    RxMemoryData1: TRxMemoryData;
    i : integer;
    AField : TField;
    ABeforeInsert: TDataSetNotifyEvent;
begin
  if not CDS.IsEmpty then
  begin
    RxMemoryData1 := TRxMemoryData.Create(nil);
    try
      CDS.First;
      RxMemoryData1.FieldDefs.Add('AmountOper', ftFloat);
      RxMemoryData1.FieldDefs.Add('id_Measure', ftInteger);
      RxMemoryData1.FieldDefs.Add('PriceOper', ftFloat);
      RxMemoryData1.FieldDefs.Add('SummSys', ftFloat);
      RxMemoryData1.FieldDefs.Add('PriceInv', ftFloat);

      RxMemoryData1.FieldDefs.Add('id_Goods', ftInteger);

      RxMemoryData1.FieldDefs.Add('MeasureName', ftString, 100);
      RxMemoryData1.FieldDefs.Add('RealKoef', ftFloat);

      RxMemoryData1.FieldDefs.Add('WareName', ftString, 255);
      RxMemoryData1.LoadFromDataSet(CDS, CDS.RecordCount, lmAppend);
//      CDS.EmptyDataSet;
      CDS.Close;
      CDS.Params.ParamByName('@id_oper').Value := -1;
      CDS.Open;

      ABeforeInsert := CDS.BeforeInsert;
      CDS.BeforeInsert := nil;
      with RxMemoryData1 do
      begin
        First;
        while not Eof do
        begin
          CDS.Append;
          for i := 0 to Fields.Count - 1 do
          begin
            AField := CDS.FindField(Fields[i].FieldName);
            if (AField <> nil) and (AField.CanModify) and (not AField.ReadOnly) then
              AField.Value := Fields[i].Value;
          end;
          CDS.Post;
          Next;
        end;
      end;
      RxMemoryData1.Close;
    finally
      CDS.BeforeInsert := ABeforeInsert;
      RxMemoryData1.Free;
    end;
  end;
end;

procedure RebildBJ(CDS: TClientDataSet);
var
    RxMemoryData1: TRxMemoryData;
    i : integer;
    AField : TField;
    ABeforeInsert: TDataSetNotifyEvent;
begin
  if not CDS.IsEmpty then
  begin
    RxMemoryData1 := TRxMemoryData.Create(nil);
    try
      CDS.First;
      RxMemoryData1.FieldDefs.Add('id_BJ_Obj', ftInteger);
      RxMemoryData1.FieldDefs.Add('NotUse', ftBoolean);
      RxMemoryData1.FieldDefs.Add('id_BJ_Item', ftInteger);
      RxMemoryData1.FieldDefs.Add('id_Oper', ftInteger);

      RxMemoryData1.FieldDefs.Add('BJ_Name', ftString, 255);
      RxMemoryData1.FieldDefs.Add('Name', ftString, 255);

      RxMemoryData1.LoadFromDataSet(CDS, CDS.RecordCount, lmAppend);
//      CDS.EmptyDataSet;
      CDS.Close;
      CDS.Params.ParamByName('@id_oper').Value := -1;
      CDS.Params.ParamByName('@id_business').Value := -1;
      CDS.Open;

      ABeforeInsert := CDS.BeforeInsert;
      CDS.BeforeInsert := nil;
      with RxMemoryData1 do
      begin
        First;
        while not Eof do
        begin
          CDS.Append;
          for i := 0 to Fields.Count - 1 do
          begin
            AField := CDS.FindField(RxMemoryData1.Fields[i].FieldName);
            if (AField <> nil) and (AField.CanModify) and (not AField.ReadOnly) then
              AField.Value := RxMemoryData1.Fields[i].Value;
          end;

     //     CDS.FieldByName('NotUse').AsBoolean := CDS.FieldByName('Name').IsNull;

          CDS.Post;
          Next;
        end;
      end;
      RxMemoryData1.Close;
    {  with CDS do
      begin
        First;
        while not Eof do
        begin
          Edit;
          FieldByName('NotUse').AsBoolean := FieldByName('BJ_Name').IsNull;
          Post;

          Next;
        end;  
      end;   }
    finally
      CDS.BeforeInsert := ABeforeInsert;
      RxMemoryData1.Free;
    end;
  end;
end;

procedure RebildWareData_LC(CDS: TClientDataSet);
var
    RxMemoryData1: TRxMemoryData;
    i : integer;
    AField : TField;
    ABeforeInsert: TDataSetNotifyEvent;
begin
  if not CDS.IsEmpty then
  begin
    RxMemoryData1 := TRxMemoryData.Create(nil);
    try
      CDS.First;
      RxMemoryData1.FieldDefs.Add('AmountOper', ftFloat);
      RxMemoryData1.FieldDefs.Add('id_Measure', ftInteger);
      RxMemoryData1.FieldDefs.Add('PriceOper', ftFloat);
      RxMemoryData1.FieldDefs.Add('SummSys', ftFloat);
//      RxMemoryData1.FieldDefs.Add('PriceInv', ftFloat);

      RxMemoryData1.FieldDefs.Add('id_Goods', ftInteger);

      RxMemoryData1.FieldDefs.Add('MeasureName', ftString, 100);
      RxMemoryData1.FieldDefs.Add('RealKoef', ftFloat);

      RxMemoryData1.FieldDefs.Add('WareName', ftString, 255);
      RxMemoryData1.LoadFromDataSet(CDS, CDS.RecordCount, lmAppend);
//      CDS.EmptyDataSet;
      CDS.Close;
      CDS.Params.ParamByName('@id_LC_oper').Value := -1;
      CDS.Open;
      
      ABeforeInsert := CDS.BeforeInsert;
      CDS.BeforeInsert := nil;
      with RxMemoryData1 do
      begin
        First;
        while not Eof do
        begin
          CDS.Append;
          for i := 0 to Fields.Count - 1 do
          begin
            AField := CDS.FindField(Fields[i].FieldName);
            if (AField <> nil) and (AField.CanModify) and (not AField.ReadOnly) then
              AField.Value := Fields[i].Value;
          end;
          CDS.Post;
          Next;
        end;
      end;
      RxMemoryData1.Close;
    finally
      CDS.BeforeInsert := ABeforeInsert;
      RxMemoryData1.Free;
    end;
  end;
end;

function GetControlFormHHH(AControl : TComponent) : HWnd;
var F : TCustomForm;
begin
  F := GetControlOwner(AControl);
  if (F <> nil) then Result := F.Handle
  else
    Result := 0;
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

function MayVized(CDS : TDataSet) : boolean;
var id_Repr_Ex_isNull : boolean;
    Fid_Repr_Ex : TField;
begin
  if CDS.FieldByName('OperVid').AsInteger = 0 then
  begin
    Result := false;
    Exit;
  end;
  Fid_Repr_Ex := CDS.FindField('id_Repr_Ex');
  if Fid_Repr_Ex <> nil then
    id_Repr_Ex_isNull := Fid_Repr_Ex.IsNull
  else
    id_Repr_Ex_isNull := true;
  if CDS.FieldByName('OperVid').AsInteger in [101, 102, 103] then
  begin
    Result := true {not (
         ((CDS.FieldByName('ContrAgentName').IsNull) and
         (not CDS.FieldByName('id_Repr').IsNull or
         not CDS.FieldByName('id_Repr_Ex').IsNull))
         or
         ((CDS.FieldByName('BusinessName').IsNull))
         or
         ((CDS.FieldByName('id_Repr').IsNull or not CDS.FieldByName('id_Repr_Ex').IsNull) and
         (not CDS.FieldByName('ReprName').IsNull))); }
  end
  else
  Result := not (
       ((CDS.FieldByName('ContrAgentName').IsNull) and (not CDS.FieldByName('id_Repr').IsNull or not id_Repr_Ex_isNull))
       or
       ((CDS.FieldByName('BusinessName').IsNull))
   //    or
     //  ((CDS.FieldByName('FormalDistribName').IsNull) and (CDS.FieldByName('Koeff').AsInteger <> 0) and (CDS.FieldByName('OperVid').AsInteger <> 4))
     //  or
       //((CDS.FieldByName('FuncDistribName').IsNull) and (CDS.FieldByName('Koeff').AsInteger <> 0) and (CDS.FieldByName('OperVid').AsInteger <> 4))
       or
       ((CDS.FieldByName('id_Repr').IsNull) and (not id_Repr_Ex_isNull) and (not CDS.FieldByName('ReprName').IsNull)));
//  if CDS.FindField('HasChild') <> nil then
//    Result := Result or (CDS.FieldByName('HasChild').AsInteger = 1);
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
