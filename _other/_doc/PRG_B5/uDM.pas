unit uDM;

interface

uses
  SysUtils, Classes, DB, extctrls, Printers, ADODB, FileCtrl, Forms, ComCtrls, Controls, Windows,
  Graphics, IniFiles, Registry, frDoc, AdoConEd, foMyFunc, DBClient, dxDBGrid, Clipbrd,
  RxMemDS, Provider, DBGridEh, AdvOfficePager, AdvOfficePagerStylers,
  AdvPanel, AdvMenus, AdvMenuStylers, AdvToolBar, AdvToolBarStylers,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficeStatusBar,  TaskDialog,
  AdvOfficeStatusBarStylers;
  
  const SRegPath = '\SOFTWARE\TNPP\DW';
  redColor : TColor = $009FFFFF;
  redGreen : TColor = clGreen;


type
  PPalEntriesArray = ^TPalEntriesArray; {for palette re-construction}
  TPalEntriesArray = array[0..0] of TPaletteEntry;

  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQueryTmp: TADOQuery;
    qryWhoIAm: TADOQuery;
    qryFuncName: TADOQuery;
    qGetPic: TADOQuery;
    qGetPicID_ICONS: TBCDField;
    qGetPicPIC: TBlobField;
    rxIC: TRxMemoryData;
    rxICName: TWideStringField;
    rxICID_ICONS: TIntegerField;
    rxICIndex: TIntegerField;
    qRate: TADOQuery;
    qProt: TADOQuery;
    qDTProp: TADOQuery;
    getCA: TADOQuery;
    DateTimeField1: TDateTimeField;
    qSysDate: TADOQuery;
    qSysDateDDD: TDateTimeField;
    qList2: TADOQuery;
    dsList: TDataSetProvider;
    cdsList: TClientDataSet;
    cdsListid_LIST: TAutoIncField;
    cdsListID_USER: TIntegerField;
    cdsListID_DOCBASE: TIntegerField;
    spBSN: TADOQuery;
    spBSNid_BSN: TAutoIncField;
    spBSNBsnName: TStringField;
    AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    AdvPanelStyler1: TAdvPanelStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    cdsListid_BSN: TIntegerField;
    AdvInputTaskDialog1: TAdvInputTaskDialog;
    procedure DataModuleCreate(Sender: TObject);
    procedure ADOConnection1BeforeConnect(Sender: TObject);
    procedure ADOConnection1AfterConnect(Sender: TObject);
    procedure cdsListAfterOpen(DataSet: TDataSet);
    procedure cdsListAfterPost(DataSet: TDataSet);
    procedure cdsListAfterDelete(DataSet: TDataSet);
    procedure cdsListBeforeOpen(DataSet: TDataSet);
  private
    FNeedTerminate,FisAdmin: boolean;
    FUserName, FPassword, FFullFio : String;
    Fid_User : integer;
    
    function rsDoLogin: boolean;
    function DoLogin(AUserName, APassword: String): boolean;
    procedure REshowB;
    function Getid_Bsn: Variant;
  public
    Color_Red, Color_Green : TColor;
    procedure InitToolBar(AToolBar : TToolBar);

    
    function GetName(ASQL: String): String;
    function GetRate(id_Cur: integer): Extended;
    function GetRateByDate(id_Cur: integer; ADate : TDatetime): Extended;
    function GetMaxID(ASQL: String): integer;
    function xxx_Group_Check_v2(ASQL: String): boolean;
    function AddItem(ASQL: String; AKF : String = ''; ATable : String = ''): integer;
    function CheckUserRights(ExtID: Integer): boolean;
    function GetFuncName(ExtID: Integer): String;
    function Rights_GetUserRights(ExtID: Integer; NeedRaise : boolean = true) : boolean;
    function ExecSQL(ASQL: String): boolean;

    property NeedTerminate : boolean read FNeedTerminate;
    property FullFio : String read FFullFio;
    property id_User : integer read Fid_User;
    property isAdmin : boolean read FisAdmin;
    property id_Bsn : Variant read Getid_Bsn;

    function VarToStrNull(V : Variant) : String;
    procedure DoEditConnectionString;

    function SetViza(AEObjType: TEObjType; AID : integer; AViza : boolean; AFile : boolean = false): boolean;
    procedure UpdateTreeRoot(ID : integer);
    function GetFullGoodsName(ID : integer) : String;
    function GetR_GL(ID_GoodsList : integer; ARTType : TRTType; ANeedRaise : boolean) : boolean;
    function GetR_Goods(ID_Goods, id_Grp  : integer; ARTType : TRTType; ANeedRaise : boolean) : boolean;

    function CDSApplyUpdates(CDS : TClientDataSet; IDFieldName : String; IDFieldValue : integer; ChCountIgnore : boolean = false) : boolean;

    function GetWorkDayInPeriod(D1, D2: TDate): integer;
    function GetWorkDayInMonth(D1: TDate): integer;
    function GetTempName(const Extension: string): string;
    function GetTmpDirName: String;

    function IconIn(ID_ICONS : integer; AImage: TImage; AImageList : TImageList) : integer;

    procedure GetColorBG;
    procedure SaveColorBG;

    procedure DoTNumericField(ADataSet : TDataSet);

    procedure AddToProtocol(id_CA, id_CAT, P_Action : Variant);

    function GetTypeName(id_DocType : integer) : String;

    function GetSysDate : TDatetime;

    procedure MakeCAList(var sysKey : integer; ADate : Variant; ADateSet : TDataSet = nil);
    function MaleCLFloat: String;
     function InputBox_ObjName(const ATitle, AContent : string; var AInputText : string): boolean;
  end;

var
  DM: TDM;
  Cur : HCursor;
  Cur_Def : HCursor;
procedure CheckGrid(dxDBGrid1: TdxDBGrid);
procedure DoMakeMT(AMode : TRegMode; AGrid : TDBGridEh; ADataSet : TDataSet; AUseCLosed : boolean = true);

procedure BltTBitmapAsDib(DestDc: hdc; {Handle of where to blt}
  x: word; {Bit at x}
  y: word; {Blt at y}
  Width: word; {Width to stretch}
  Height: word; {Height to stretch}
  bm: TBitmap); {the TBitmap to Blt}

implementation

uses LogInUnit, {$IFDEF VER150} Variants, {$ENDIF} uMeCrpt, uMain,
  uSplash, uDocList, uPrgForm;

{$R *.dfm}

procedure DoMakeMT(AMode : TRegMode; AGrid : TDBGridEh; ADataSet : TDataSet; AUseCLosed : boolean);
procedure AddToBuff2(I : integer);
begin
  if not ADataSet.Active then ADataSet.Open;
  if not ADataSet.Locate('ID_DOCBASE', AGrid.DataSource.DataSet.FieldByName('ID_DOCBASE').AsInteger, [loCaseInsensitive, loPartialKey])
     and (AUseCLosed or AGrid.DataSource.DataSet.FieldByName('DateClosed').IsNull) then
  begin
              ADataSet.Append;
              ADataSet.FieldByName('ID_DOCBASE').AsInteger := AGrid.DataSource.DataSet.FieldByName('ID_DOCBASE').AsInteger;
              ADataSet.FieldByName('Num').AsInteger := ADataSet.RecordCount + 1;
              ADataSet.FieldByName('Rep').AsString := AGrid.DataSource.DataSet.FieldByName('RepName').AsString;//dxDBGDocList1.SelectedNodes[i].Values[dxDBGrid2RepName.index];
              ADataSet.FieldByName('Org').AsString := AGrid.DataSource.DataSet.FieldByName('OrgName').AsString;//dxDBGDocList1.SelectedNodes[i].Values[dxDBGrid2OrgName.index];
              ADataSet.FieldByName('Doc').AsString := AGrid.DataSource.DataSet.FieldByName('DTName').AsString + ' №' + AGrid.DataSource.DataSet.FieldByName('NUM').AsString;//dxDBGDocList1.SelectedNodes[i].Values[dxDBGrid2DTName.index] + ' ' + dxDBGDocList1.SelectedNodes[i].Values[dxDBGrid2NUM.index];
              ADataSet.FieldByName('DocDate').AsVariant :=  AGrid.DataSource.DataSet.FieldByName('DOCDATE').AsVariant;//dxDBGDocList1.SelectedNodes[i].Values[dxDBGrid2DOCDATE.index];
              ADataSet.FieldByName('Summ').AsString := AGrid.DataSource.DataSet.FieldByName('SUMM').AsString + ' ' + AGrid.DataSource.DataSet.FieldByName('CurName').AsString;//dxDBGDocList1.SelectedNodes[i].Values[dxDBGrid2SUMM.index] + ' ' + dxDBGDocList1.SelectedNodes[i].Values[dxDBGrid2CurName.index];
              ADataSet.FieldByName('Amount').AsVariant := AGrid.DataSource.DataSet.FieldByName('Amount').AsVariant;//dxDBGDocList1.SelectedNodes[i].Values[dxDBGrid2Amount.index];
              ADataSet.FieldByName('DOCCOMMENT2').AsVariant := AGrid.DataSource.DataSet.FieldByName('DOCCOMMENT2').AsVariant;
              ADataSet.Post;
  end;
end;
var i : integer;
begin
  ADataSet.Close;
  if AMode = rmAll then
    AGrid.SelectedRows.SelectAll;
    
  with AGrid.DataSource.DataSet do
  begin
    if (AGrid.SelectedRows.Count = 0) and (not AGrid.DataSource.DataSet.IsEmpty) then
      AddToBuff2(AGrid.DataSource.DataSet.FieldByName('ID_DOCBASE').AsInteger);
    for i := 0 to AGrid.SelectedRows.Count - 1 do
    begin
      GotoBookmark(Pointer(AGrid.SelectedRows.Items[i]));
      AddToBuff2(AGrid.DataSource.DataSet.FieldByName('ID_DOCBASE').AsInteger);
      ShowProgressForm(Screen.ActiveForm.Handle, i + 1, AGrid.SelectedRows.Count, 'Добавление в буфер...');
    end;
  end;
  CloseProgressForm;
end;

procedure BltTBitmapAsDib(DestDc: hdc; {Handle of where to blt}
  x: word; {Bit at x}
  y: word; {Blt at y}
  Width: word; {Width to stretch}
  Height: word; {Height to stretch}
  bm: TBitmap); {the TBitmap to Blt}
var
  OriginalWidth: LongInt; {width of BM}
  dc: hdc; {screen dc}
  IsPaletteDevice: bool; {if the device uses palettes}
  IsDestPaletteDevice: bool; {if the device uses palettes}
  BitmapInfoSize: integer; {sizeof the bitmapinfoheader}
  lpBitmapInfo: PBitmapInfo; {the bitmap info header}
  hBm: hBitmap; {handle to the bitmap}
  hPal: hPalette; {handle to the palette}
  OldPal: hPalette; {temp palette}
  hBits: THandle; {handle to the DIB bits}
  pBits: pointer; {pointer to the DIB bits}
  lPPalEntriesArray: PPalEntriesArray; {palette entry array}
  NumPalEntries: integer; {number of palette entries}
  i: integer; {looping variable}
begin
  {If range checking is on - lets turn it off for now}
  {we will remember if range checking was on by defining}
  {a define called CKRANGE if range checking is on.}
  {We do this to access array members past the arrays}
  {defined index range without causing a range check}
  {error at runtime. To satisfy the compiler, we must}
  {also access the indexes with a variable. ie: if we}
  {have an array defined as a: array[0..0] of byte,}
  {and an integer i, we can now access a[3] by setting}
  {i := 3; and then accessing a[i] without error}
{$IFOPT R+}
{$DEFINE CKRANGE}
{$R-}
{$ENDIF}

  {Save the original width of the bitmap}
  OriginalWidth := bm.Width;

  {Get the screen's dc to use since memory dc's are not reliable}
  dc := GetDc(0);
  {Are we a palette device?}
  IsPaletteDevice :=
    GetDeviceCaps(dc, RASTERCAPS) and RC_PALETTE = RC_PALETTE;
  {Give back the screen dc}
  dc := ReleaseDc(0, dc);

  {Allocate the BitmapInfo structure}
  if IsPaletteDevice then
    BitmapInfoSize := sizeof(TBitmapInfo) + (sizeof(TRGBQUAD) * 255)
  else
    BitmapInfoSize := sizeof(TBitmapInfo);
  GetMem(lpBitmapInfo, BitmapInfoSize);

  {Zero out the BitmapInfo structure}
  FillChar(lpBitmapInfo^, BitmapInfoSize, #0);

  {Fill in the BitmapInfo structure}
  lpBitmapInfo^.bmiHeader.biSize := sizeof(TBitmapInfoHeader);
  lpBitmapInfo^.bmiHeader.biWidth := OriginalWidth;
  lpBitmapInfo^.bmiHeader.biHeight := bm.Height;
  lpBitmapInfo^.bmiHeader.biPlanes := 1;
  if IsPaletteDevice then
    lpBitmapInfo^.bmiHeader.biBitCount := 8
  else
    lpBitmapInfo^.bmiHeader.biBitCount := 24;
  lpBitmapInfo^.bmiHeader.biCompression := BI_RGB;
  lpBitmapInfo^.bmiHeader.biSizeImage :=
    ((lpBitmapInfo^.bmiHeader.biWidth *
    longint(lpBitmapInfo^.bmiHeader.biBitCount)) div 8) *
    lpBitmapInfo^.bmiHeader.biHeight;
  lpBitmapInfo^.bmiHeader.biXPelsPerMeter := 0;
  lpBitmapInfo^.bmiHeader.biYPelsPerMeter := 0;
  if IsPaletteDevice then
  begin
    lpBitmapInfo^.bmiHeader.biClrUsed := 256;
    lpBitmapInfo^.bmiHeader.biClrImportant := 256;
  end
  else
  begin
    lpBitmapInfo^.bmiHeader.biClrUsed := 0;
    lpBitmapInfo^.bmiHeader.biClrImportant := 0;
  end;

  {Take ownership of the bitmap handle and palette}
  hBm := bm.ReleaseHandle;
  hPal := bm.ReleasePalette;

  {Get the screen's dc to use since memory dc's are not reliable}
  dc := GetDc(0);

  if IsPaletteDevice then
  begin
    {If we are using a palette, it must be}
    {selected into the dc during the conversion}
    OldPal := SelectPalette(dc, hPal, TRUE);
    {Realize the palette}
    RealizePalette(dc);
  end;
  {Tell GetDiBits to fill in the rest of the bitmap info structure}
  GetDiBits(dc,
    hBm,
    0,
    lpBitmapInfo^.bmiHeader.biHeight,
    nil,
    TBitmapInfo(lpBitmapInfo^),
    DIB_RGB_COLORS);

  {Allocate memory for the Bits}
  hBits := GlobalAlloc(GMEM_MOVEABLE,
    lpBitmapInfo^.bmiHeader.biSizeImage);
  pBits := GlobalLock(hBits);
  {Get the bits}
  GetDiBits(dc,
    hBm,
    0,
    lpBitmapInfo^.bmiHeader.biHeight,
    pBits,
    TBitmapInfo(lpBitmapInfo^),
    DIB_RGB_COLORS);

  if IsPaletteDevice then
  begin
    {Lets fix up the color table for buggy video drivers}
    GetMem(lPPalEntriesArray, sizeof(TPaletteEntry) * 256);
{$IFDEF VER100}
    NumPalEntries := GetPaletteEntries(hPal,
      0,
      256,
      lPPalEntriesArray^);
{$ELSE}
    NumPalEntries := GetSystemPaletteEntries(dc,
      0,
      256,
      lPPalEntriesArray^);
{$ENDIF}
    for i := 0 to (NumPalEntries - 1) do
    begin
      lpBitmapInfo^.bmiColors[i].rgbRed :=
        lPPalEntriesArray^[i].peRed;
      lpBitmapInfo^.bmiColors[i].rgbGreen :=
        lPPalEntriesArray^[i].peGreen;
      lpBitmapInfo^.bmiColors[i].rgbBlue :=
        lPPalEntriesArray^[i].peBlue;
    end;
    FreeMem(lPPalEntriesArray, sizeof(TPaletteEntry) * 256);
  end;

  if IsPaletteDevice then
  begin
    {Select the old palette back in}
    SelectPalette(dc, OldPal, TRUE);
    {Realize the old palette}
    RealizePalette(dc);
  end;

  {Give back the screen dc}
  dc := ReleaseDc(0, dc);

  {Is the Dest dc a palette device?}
  IsDestPaletteDevice :=
    GetDeviceCaps(DestDc, RASTERCAPS) and RC_PALETTE = RC_PALETTE;

  if IsPaletteDevice then
  begin
    {If we are using a palette, it must be}
    {selected into the dc during the conversion}
    OldPal := SelectPalette(DestDc, hPal, TRUE);
    {Realize the palette}
    RealizePalette(DestDc);
  end;

  {Do the blt}
  StretchDiBits(DestDc,
    x,
    y,
    Width,
    Height,
    0,
    0,
    OriginalWidth,
    lpBitmapInfo^.bmiHeader.biHeight,
    pBits,
    lpBitmapInfo^,
    DIB_RGB_COLORS,
    SrcCopy);

  if IsDestPaletteDevice then
  begin
    {Select the old palette back in}
    SelectPalette(DestDc, OldPal, TRUE);
    {Realize the old palette}
    RealizePalette(DestDc);
  end;

  {De-Allocate the Dib Bits}
  GlobalUnLock(hBits);
  GlobalFree(hBits);

  {De-Allocate the BitmapInfo}
  FreeMem(lpBitmapInfo, BitmapInfoSize);

  {Set the ownership of the bimap handles back to the bitmap}
  bm.Handle := hBm;
  bm.Palette := hPal;

  {Turn range checking back on if it was on when we started}
{$IFDEF CKRANGE}
{$UNDEF CKRANGE}
{$R+}
{$ENDIF}
end;

function TDM.xxx_Group_Check_v2(ASQL: String) : boolean;
begin
  Result := true;
  try
    with ADOQueryTmp do
    begin
      Close;
      try
        SQL.Clear;
        SQL.Add(ASQL);
        Open;
        Result := not IsEmpty;
      finally
        Close;
      end;
    end;
  except
    Result := false;
  end;       
end;


function TDM.CheckUserRights(ExtID: Integer) : boolean;
begin
  Result := true;
{  try
    with qryRT do
    begin
      Result := false;
      Close;
      try
        Parameters.ParamByName('ExtID').Value := ExtID;
        Parameters.ParamByName('ExtID2').Value := ExtID;
        Parameters.ParamByName('id_User').Value := Fid_User;
        Parameters.ParamByName('id_User2').Value := Fid_User;
        Open;
        Result := not IsEmpty;
      finally
        Close;
      end;
    end;
  except
    Result := false;
  end;        }
end;


function TDM.GetFuncName(ExtID: Integer): String;
begin
  with qryFuncName do
  begin
    Result := '';
    Close;
    try
      Parameters.ParamByName('ExtID').Value := ExtID;
      Open;
      Result := qryFuncName.FieldByName('Name').AsString;
    finally
      Close;
    end;
  end;
end;

function TDM.Rights_GetUserRights(ExtID: Integer; NeedRaise: boolean) : boolean;
var AHWnd : HWnd;
    NNN : String;
begin
  Result := CheckUserRights(ExtID);
  if NeedRaise and not Result then
  begin
    NNN := GetFuncName(ExtID);
    if Screen.ActiveForm = nil then
      AHWnd := 0
    else
      AHWnd := Screen.ActiveForm.Handle;
    MessageBox(AHWnd, PChar('You have not permission to operation "' + NNN + '"'), 'You have not permission!!!', MB_ICONERROR + mb_Ok);
    Abort;
  end;
end;

function TDM.AddItem(ASQL: String; AKF : String; ATable : STring): integer;
begin
  try
    with ADOQueryTmp do
    begin
      Close;
      try
        SQL.Clear;
        SQL.Add(ASQL);
        ExecSQL;
        Result := 0;
        if AKF <> '' then
        begin
          SQL.Clear;
          SQL.Add('SELECT MAX(' + AKF + ') AS ID FROM ' + ATable);
          Open;
          Result := FieldByName('ID').AsInteger
        end;
      finally
        Close;
      end;
    end;
  except
    Result := -1;
  end;       
end;

function TDM.GetMaxID(ASQL: String): integer;
begin
  try
    with ADOQueryTmp do
    begin
      Close;
      try
        SQL.Clear;
        SQL.Add(ASQL);
        Open;
        Result := FieldByName('ID').AsInteger
      finally
        Close;
      end;
    end;
  except
    Result := -1;
  end;
end;

function TDM.GetRate(id_Cur : integer): Extended;
begin
  try
    with ADOQueryTmp do
    begin
      Close;
      try
        SQL.Clear;
        SQL.Add('select rate from rf_Cur where id_Cur=' + IntToStr(id_Cur));
        Open;
        Result := FieldByName('Rate').AsFloat;
      finally
        Close;
      end;
    end;
  except
    Result := -1;
  end;       
end;


function TDM.ExecSQL(ASQL: String): boolean;
begin
  try
    with ADOQueryTmp do
    begin
      Close;
      try
        SQL.Clear;
        SQL.Add(ASQL);
        ExecSQL;
        Result := true;
      finally
        Close;
      end;
    end;
  except
    Result := false;
  end;       
end;


procedure TDM.DoEditConnectionString;
var S : String;
    FS : TMemoryStream;
    b : boolean;
begin
  b := ADOConnection1.Connected;
  ADOConnection1.Close;
  if EditConnectionString(DM.ADOConnection1) then
  begin
    S := ChangeFileExt(ParamStr(0), '.key');

    try

      FS := StrToStream(Trim(ADOConnection1.ConnectionString));
      FS.SaveToFile(S);
    finally
      FS.Free;
    end;
    ADOConnection1.Connected := b;

  end;                                            
end;

procedure TDM.DataModuleCreate(Sender: TObject);
  function DefineCursor(Identifier: PChar): TCursor;
  var Handle: HCursor;
  begin
    Handle := LoadCursor(hInstance, Identifier);
    if Handle = 0 then raise EOutOfResources.Create('Cannot load cursor resource');
    for Result := 1 to High(TCursor) do
      if Screen.Cursors[Result] = Screen.Cursors[crArrow] then
      begin
        Screen.Cursors[Result] := Handle;
        Exit;
      end;
    raise EOutOfResources.Create('Too many user-defined cursors');
  end;
var INIF : TIniFile;
    IniName, S : String;
    Reg : TRegistry;
    SL : TStringList;
begin
 // Cur := DefineCursor('HHH');
 // Cur_Def := DefineCursor('H1');
  rxIC.Open;
  GetColorBG;
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
      DM.ADOConnection1.Close;
      DM.ADOConnection1.ConnectionString := S;
    finally
      SL.Free;
    end;
  end
  else
  begin
    IniName := ChangeFileExt(ParamStr(0), '.ini');

    if FileExists(IniName) then
    begin
      INIF := TIniFile.Create(IniName);
      try
        DM.ADOConnection1.Close;
        S := INIF.ReadString('DB', 'CNS', DM.ADOConnection1.ConnectionString);
        DM.ADOConnection1.ConnectionString := S;
      finally
        INIF.Free;
      end;
    end;
  end;
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(SRegPath, false) then
      begin
        if Reg.ValueExists('UserName') then
          FUserName := Reg.ReadString('UserName');

      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  FNeedTerminate := true;
  FNeedTerminate := not rsDoLogin;
end;

function TDM.DoLogin(AUserName, APassword : String): boolean;
begin
  Result := false;
   try
     with qryWhoIAm do
     begin
       Close;
       try
         Parameters.ParamByName('Login').Value := AUserName;
         Parameters.ParamByName('Password').Value := APassword;
         Open;
         if IsEmpty then
           Exit;
         Fid_User := FieldByName('id_User').AsVariant;
         FFullFio := FieldByName('FIO').AsString;
         FisAdmin := FieldByName('isAdmin').AsInteger = 1;
         Result := true;

      {   cdsList.Close;
         cdsList.Params.ParamByName('id_User').Value := Fid_User;
         cdsList.Open;  }
       finally
         Close;
       end;
     end;
   except
     on E : Exception do
     begin
       Result := false;
       raise Exception.Create('Ошибка при соединении с базой ' + FUserName+ ' '  + FPassword + ' ' + E.Message);
     end;
   end;
end;

function TDM.rsDoLogin: boolean;
var LogInForm : TLogInForm;
    Reg: TRegistry;
    N : integer;
    isDir : integer;
    b1, b2, b3 : boolean;
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
        Exit;
      end;
      
      FUserName := LogInForm.UserID;
      FPassword := LogInForm.Password;
      b1 := DoLogin(FUserName, FPassword);
      if not b1 then
      begin
        Application.MessageBox('Неверный пароль или логин', '', MB_ICONERROR + mb_OK);
        inc(N);
      end
      else
      begin
        Reg := TRegistry.Create;
        try
          Reg.RootKey := HKEY_CURRENT_USER;
          if Reg.OpenKey(SRegPath, True) then
          begin
            Reg.WriteString('UserName', FUserName);
          end;
          Result := true;
        finally
          Reg.Free;
        end;
      end;
      if N = 3 then
      begin
     //   Application.MessageBox('Вы трижды неверно ввели пароль. Число попыток исчерпано. Обратитесь к админисратору системы', 'В доступе отказано!!!', MB_ICONERROR + MB_OK);
        Break;
      end;
    until Result = true;
  except
    on E : Exception do
      Raise Exception.Create('Ошибка соединения с сервером. ' + #13 + #10 +
                             E.Message);
  end;
    Screen.Cursor := crDefault;
 //   dsWhoIAm.Close;
    LogInForm.Free;
end;



function TDM.VarToStrNull(V: Variant): String;
begin
  if V = Null then
    Result := 'Null'
  else
    Result := VarToStr(V);
end;


procedure TDM.ADOConnection1BeforeConnect(Sender: TObject);
begin
  Splash := TSplash.Create(Self);
  Splash.Show;
  Splash.RePaint
end;

procedure TDM.ADOConnection1AfterConnect(Sender: TObject);
begin
  Splash.Free;
end;

function TDM.SetViza(AEObjType: TEObjType; AID: integer;
  AViza: boolean; AFile : boolean): boolean;
var S, TName, IDName, GetDateName : String;
begin
{
  case AEObjType of
    eotSupp : TName := 'INV_Supp';
    eotRaw : TName := 'INV_Raw';
    eotEQ : TName := 'INV_EQ';
    eotPack : TName := 'INV_Pack';
    eotGoodsVar : TName := 'INV_Goods';
  end;
  case AEObjType of
    eotSupp : IDName := 'ID_Supp';
    eotRaw : IDName := 'ID_Raw';
    eotEQ : IDName := 'ID_EQ';
    eotPack : IDName := 'ID_Pack';
    eotGoodsVar : IDName := 'ID_Goods';
  end;  }
    GetDateName := 'SysDate';
  if AFile then
  begin
    TName := TName + 'File';
    IDName := 'id_File';
  end;
  if AViza then
  begin
    S := 'UPDATE ' + TName + ' SET CheckDate = ' + GetDateName + ' , id_Visa=' + IntToStr(id_User) + ' WHERE ' + IDName + '=' + IntToStr(AID);
  end
  else
  begin
    S := 'UPDATE ' + TName + ' SET CheckDate = Null, id_Visa=Null WHERE ' + IDName + '=' + IntToStr(AID); 
  end;
  ADOQueryTmp.SQL.Text := S;
  Result := ADOQueryTmp.ExecSQL > 0;
end;

procedure TDM.UpdateTreeRoot(ID: integer);
begin
end;

function TDM.GetFullGoodsName(ID: integer): String;
begin
{  if ID = -1 then
  begin
    Result := 'Без группы';
    Exit;
  end;
  Result := '';
  if IsOracle  then
  begin
    with qryTreeFullName do
    begin
      Close;
      Parameters.ParamByName('id_GoodsLine').Value := ID;
      try
        Open;
        First;
        while not Eof do
        begin
          if Result <> '' then
            Result := '/' + Result;
          Result := FieldByName('Name').AsString + Result;

          Next;
        end;
      finally
        Close;
      end;

    end;
  end
  else
  begin
    with qryTreeRootMS do
    begin
      Close;
      Parameters.ParamByName('@id_GoodsLine').Value := ID;
      Parameters.ParamByName('@WName').Value := true;
      try
        Open;
        First;
        while not Eof do
        begin
          if Result <> '' then
            Result := '/' + Result;
          Result := FieldByName('Name').AsString + Result;

          Next;
        end;
      finally
        Close;
      end;

    end;
  end; }
end;

function TDM.GetR_GL(ID_GoodsList: integer; ARTType: TRTType; ANeedRaise : boolean): boolean;
var AHWnd : HWnd;
    S, S2 : String;
begin
{  Result := false;
  if IsOracle  then
  begin
    with qryRT_GL do
    begin
      Close;
      Parameters.ParamByName('id_GoodsLine').Value := ID_GoodsList;
      Parameters.ParamByName('id').Value := id_User;
      Parameters.ParamByName('ID2').Value := id_User;
      Parameters.ParamByName('ID3').Value := id_User;
      try
        Open;
        case ARTType of
          rtEdit : Result := FieldByName('R_Edit').AsInteger > 0;
          rtDel : Result := FieldByName('R_Del').AsInteger > 0;
          rtViza : Result := FieldByName('R_Viza').AsInteger > 0;
        end; 
      finally
        Close;
      end;
    end;
  end
  else
  begin
    with qryRT_GLMS do
    begin
      Close;
      Parameters.ParamByName('@id_GoodsLine').Value := ID_GoodsList;
      Parameters.ParamByName('@id_User').Value := id_User;
      try
        Open;
        case ARTType of
          rtEdit : Result := FieldByName('R_Edit').AsInteger > 0;
          rtDel : Result := FieldByName('R_Del').AsInteger > 0;
          rtViza : Result := FieldByName('R_Viza').AsInteger > 0;
        end; 
      finally
        Close;
      end;
    end;
  end;

  if not Result and ANeedRaise then
  begin
    case ARTType of
      rtEdit : S := 'ввод/редактирование данных';
      rtDel : S := 'удаление';
      rtViza : S := 'утверждение';
    end;
    S2 := GetFullGoodsName(ID_GoodsList);
    if Screen.ActiveForm = nil then
      AHWnd := 0
    else
      AHWnd := Screen.ActiveForm.Handle;
    MessageBox(AHWnd, PChar('У вас нет прав на операцию "' + S + '" в категории "' + S2 + '"'), 'Нет прав!!!', MB_ICONERROR + mb_Ok);
    Abort;
  end;    }
end;

function TDM.GetR_Goods(ID_Goods, id_Grp : integer; ARTType: TRTType;
  ANeedRaise: boolean): boolean;
var ID_GoodsList: integer;
begin
 { if ID_Goods = -1 then
    ID_GoodsList := id_Grp
  else
  begin
    with qryGrp do
    begin
      Close;
      Parameters.ParamByName('id_Goods').Value := ID_Goods;
      Open;
      try
        if FieldByName('ID_GOODSLINE').IsNull then
          ID_GoodsList := -1
        else
          ID_GoodsList := FieldByName('ID_GOODSLINE').AsVariant;
      finally
        Close;
      end;
    end;
  end;
  Result := GetR_GL(ID_GoodsList, ARTType, ANeedRaise);    }
end;

function TDM.CDSApplyUpdates(CDS: TClientDataSet; IDFieldName: String;
  IDFieldValue: integer; ChCountIgnore: boolean): boolean;
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
      Result := CDS.ApplyUpdates(0) = 0;
    except
      AfterPost := OldAfterPost;
    end;
  end;
end;


procedure TDM.InitToolBar(AToolBar: TToolBar);
var i : integer;
begin
  for i := 0 to AToolBar.ButtonCount - 1 do
    AToolBar.Buttons[i].Hint := AToolBar.Buttons[i].Caption;
  AToolBar.ShowHint := true;
end;

function TDM.GetWorkDayInPeriod(D1, D2 : TDate) : integer;
var i, DOW : integer;
    TmpD : TDate;
    Year, Month, Day: Word;   
begin
  Result := 0;
  D1 := Trunc(D1);
  D2 := Trunc(D2);
  for i := 0 to Trunc(D2 - D1) + 0 do
  begin
    TmpD := D1 + i;
    DOW := DayOfWeek(TmpD);
    if (DOW <> 1) and (DOW <> 7) then
    begin
      DecodeDate(TmpD, Year, Month, Day);
      if not (
        ((Month = 1) and (Day in [1..9])) or   // Новый год
        ((Month = 2) and (Day = 23)) or   // 23 февр
        ((Month = 3) and (Day = 8)) or   // 8 марта
        ((Month = 5) and (Day = 1)) or   // 1 мая
        ((Month = 5) and (Day = 9)) or   // 9 мая
        ((Month = 6) and (Day = 12)) or   // 12 июня
        ((Month = 11) and (Day = 04))    // поляки
        ) then
        inc(Result);
    end;
  end;
end;

function TDM.GetWorkDayInMonth(D1: TDate): integer;
var Year, Month, Day: Word;
    D2: TDate;
begin
  DecodeDate(D1, Year, Month, Day);
  D2 := EncodeDate(Year, Month, 1);
  D2 := IncMonth(D2, 1);
  Result := GetWorkDayInPeriod(D1, D2);
end;

function TDM.GetTmpDirName: String;
var
    buf: array[0..255] of char;
begin
  begin
    GetTempPath(sizeof(buf), buf);
    Result := buf;
  end;
  if Length(Result) > 0 then
  begin
    if Result[Length(Result) - 0] <> '\' then
      Result := Result + '\';
  end;
  ForceDirectories(Result);
end;

function TDM.GetTempName(const Extension: string) : string;
var i : integer;
  Buffer: array[0..MAX_PATH] of Char;
begin
  i := 1;
  repeat
    GetTempPath(SizeOf(Buffer) - 1, Buffer);
    GetTempFileName(Buffer, '~', i, Buffer);
    Result := ChangeFileExt(Buffer, Extension);
    inc(i);
  until not FileExists(Result);
  Result := ExtractFileName(Result);
end;


function TDM.IconIn(ID_ICONS : integer; AImage: TImage; AImageList : TImageList): integer;
  function GetIC : integer;
  begin
     with rxIC do
     begin
       Result := -1;
    {   if Locate('Name;ID_ICONS', VarArrayOf([AImageList.Owner.ClassName, ID_ICONS]), [loCaseInsensitive, loPartialKey]) then
       begin
         if AImageList.Count > rxICIndex.AsInteger then
           Result := rxICIndex.AsInteger
         else
           Result := -1;
       end;  } 
     end;
  end;
var S : String;
    AIcon : TIcon;
    i : integer;
begin
  if ID_ICONS = 0 then
  begin
    Result := -1;
    exit;
  end;
  try
    with DM.qGetPic do
    begin
      Close;
      Parameters.ParamByName('ID_ICONS').Value := ID_ICONS;
      Open;
      S := DM.GetTempName('.ico');
      DM.qGetPicPIC.SaveToFile(S);
      if AImageList <> nil then
      begin
        i := GetIC;
        if i = -1 then
        begin
          AIcon := TIcon.Create;
          try
            AIcon.LoadFromFile(S);
            AImageList.AddIcon(AIcon);
          finally
            AIcon.Free;
          end;
          Result := AImageList.Count - 1;
     rxIC.Append;
     rxICName.AsString := AImageList.Owner.ClassName;
     rxICID_ICONS.AsInteger := ID_ICONS;
     rxICIndex.AsInteger := Result;
     rxIC.Post;

        end
        else
           Result := i;
      end
      else
      if AImage <> nil then
      begin
        AImage.Picture.LoadFromFile(S);
      end;
      Sysutils.DeleteFile(S);
    end;
  except
  end;

end;

procedure TDM.SaveColorBG;
var Reg : TRegistry;
    i : integer;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKey(SRegPath, true) then
    begin
      Reg.WriteInteger('Color_Red', ORD(Color_Red));
      Reg.WriteInteger('Color_Green', ORD(Color_Green));
     end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TDM.GetColorBG;
var Reg : TRegistry;
    i : integer;
begin
  DM.Color_Red := redColor;
  DM.Color_Green := redGreen;

  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKey(SRegPath, true) then
    begin
      if Reg.ValueExists('Color_Red') then
        Color_Red := TColor(Reg.ReadInteger('Color_Red'));
      if Reg.ValueExists('Color_Green') then
        Color_Green := TColor(Reg.ReadInteger('Color_Green'));
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TDM.DoTNumericField(ADataSet: TDataSet);
var i : integer;
begin
  for i := 0 to ADataSet.FieldCount - 1 do
    if ADataSet.Fields[i] is TNumericField then
      TNumericField(ADataSet.Fields[i]).DisplayFormat := '### ### ### ##0.00';
end;

function TDM.GetRateByDate(id_Cur: integer; ADate: TDatetime): Extended;
begin
  with qRate do
  begin
    Result := 0;
    Close;
    try
      Parameters.ParamByName('id_Cur').Value := id_Cur;
      Parameters.ParamByName('DateCancel1').Value := ADate;
      Parameters.ParamByName('DateCancel2').Value := ADate;
      Open;
      Result := FieldByName('Rate').AsFloat;
    finally
      Close;
    end;
  end;
end;

procedure TDM.AddToProtocol(id_CA, id_CAT, P_Action: Variant);
begin
{  with qProt do
  begin
    Close;
    Parameters.ParamByName('id_CA').Value := id_CA;
    Parameters.ParamByName('id_CAT').Value := id_CAT;
    Parameters.ParamByName('P_Action').Value := P_Action;
    Parameters.ParamByName('id_USER').Value := Fid_USER;
    ExecSQL;
  end;  }
end;

function TDM.GetName(ASQL: String): String;
begin
  try
    with ADOQueryTmp do
    begin
      Close;
      try
        SQL.Clear;
        SQL.Add(ASQL);
        Open;
        Result := FieldByName('Name').AsString;
      finally
        Close;
      end;
    end;
  except
    Result := '';
  end;
end;

function TDM.GetTypeName(id_DocType: integer): String;
begin
  qDTProp.Close;
  qDTProp.Parameters.ParamByName('id_DocType').Value := id_DocType;
  qDTProp.Open;
  Result := qDTProp.fieldByName('Name').AsString;
  qDTProp.Close;
end;

function TDM.GetSysDate: TDatetime;
begin
  with qSysDate do
  begin
    Close;
    Open;
    try
      Result := qSysDateDDD.AsDateTime;
    finally
      Close;
    end;
  end;
end;

procedure CheckGrid(dxDBGrid1: TdxDBGrid);
var i, j : integer;
    b : boolean;
begin
  for i := 0 to dxDBGrid1.Bands.Count - 1 do
  begin
    with dxDBGrid1.Bands[i] do
    begin
      B := false;
      for j := 0 to dxDBGrid1.ColumnCount - 1 do
      begin
        if (dxDBGrid1.Columns[j].BandIndex = i) and (dxDBGrid1.Columns[j].Visible) then
        begin
          B := true;
          break;
        end;
      end;
      Visible := B;
    end;
  end;
end;

procedure TDM.MakeCAList(var sysKey: integer; ADate : Variant; ADateSet: TDataSet);
var S, DS1 : String;
begin
  SysKey := GetTickCount;
  DM.ExecSQL('delete from DW_FAV_CA where id_User=' + IntToStr(DM.id_User));
  DM.ExecSQL('delete from DW_FAV_CA_X where id_User=' + IntToStr(DM.id_User));
  DM.ExecSQL('delete from DW_FAV_REL where id_User=' + IntToStr(DM.id_User));
  if ADate <> Null then
  begin
    DS1 := 'to_Date(' + '''' + FormatDateTime('dd.mm.yyyy', ADate) + '''' + ', ' + '''' + 'DD.MM.YYYY' + '''' + ')';

  end
  else
    DS1 := 'sysdate';

  S := S + ' Deleted = 0 AND (StartActivity IS NULL OR StartActivity <=' + DS1 + ')';
  S := S + ' AND (DeletedFrom IS NULL OR DeletedFrom >' + DS1 + ')';
  DM.ExecSQL('insert into DW_FAV_CA(id_CA, sysKey, id_User) SELECT id_CA, ' + IntToStr(sysKey) + ',' + IntToStr(DM.id_User) + ' FROM DW_CA WHERE ' + S);
  DM.ExecSQL('UPDATE DW_FAV_CA SET OnDate = (SELECT MAX(DateFrom) FROM DW_Rel WHERE DW_Rel.id_CA = DW_FAV_CA.id_CA AND DateFrom <= ' + DS1 + ' ) where id_User=' + IntToStr(DM.id_User) + ' AND sysKey=' + IntToStr(sysKey));

  DM.ExecSQL('UPDATE DW_FAV_CA SET ActAmount = (SELECT MAX(ActAmount) FROM DW_Rel WHERE DW_Rel.id_CA = DW_FAV_CA.id_CA AND DateFrom = OnDate) where id_User=' + IntToStr(DM.id_User) + ' AND sysKey=' + IntToStr(sysKey));


  DM.ExecSQL('INSERT INTO DW_FAV_REL(sysKey, id_User, id_CA, id_Parent, APrc) ' +
    ' SELECT FCA.sysKey, FCA.id_User, FCA.id_CA, id_Parent, APrc ' +
    ' FROM DW_FAV_CA FCA, DW_Rel R, DW_RelItems I WHERE R.id_Rel = I.id_Rel AND R.DateFrom = FCA.OnDate AND R.id_CA = FCA.id_CA');

  if (ADateSet = nil) or (ADateSet.IsEmpty) then
  begin
  end
  else
  begin
    with ADateSet do
    begin
      First;
      while not Eof do
      begin
        getCA.Parameters.ParamByName('id_CA').Value := ADateSet.FieldByName('id_CA').Value;
        getCA.Parameters.ParamByName('id_CA2').Value := ADateSet.FieldByName('id_CA').Value;
        getCA.Parameters.ParamByName('id_CA3').Value := ADateSet.FieldByName('id_CA').Value;
        getCA.Parameters.ParamByName('id_CA4').Value := ADateSet.FieldByName('id_CA').Value;
        getCA.Parameters.ParamByName('sysKey').Value := sysKey;
        getCA.Parameters.ParamByName('sysKey2').Value := sysKey;
        getCA.Parameters.ParamByName('sysKey3').Value := sysKey;
        getCA.Parameters.ParamByName('sysKey4').Value := sysKey;
        getCA.Parameters.ParamByName('id_User').Value := DM.id_User;
        getCA.Parameters.ParamByName('id_User2').Value := DM.id_User;
        getCA.Parameters.ParamByName('id_User3').Value := DM.id_User;
        getCA.Parameters.ParamByName('id_User4').Value := DM.id_User;
        getCA.ExecSQL;
        Next;
      end;
    end;
    DM.ExecSQL('delete FROM DW_FAV_CA where id_User=' + IntToStr(DM.id_User) + ' AND sysKey=' + IntToStr(sysKey) + ' AND id_CA not in (SELECT id_CA FROM DW_FAV_CA_X where id_User=' + IntToStr(DM.id_User) + ' AND sysKey=' + IntToStr(sysKey) + ')');
    DM.ExecSQL('delete FROM DW_FAV_REL where id_User=' + IntToStr(DM.id_User) + ' AND sysKey=' + IntToStr(sysKey) + ' AND id_CA not in (SELECT id_CA FROM DW_FAV_CA_X where id_User=' + IntToStr(DM.id_User) + ' AND sysKey=' + IntToStr(sysKey) + ')');
    DM.ExecSQL('delete FROM DW_FAV_REL where id_User=' + IntToStr(DM.id_User) + ' AND sysKey=' + IntToStr(sysKey) + ' AND id_Parent not in (SELECT id_CA FROM DW_FAV_CA_X where id_User=' + IntToStr(DM.id_User) + ' AND sysKey=' + IntToStr(sysKey) + ')');

  end;
end;

procedure TDM.cdsListAfterOpen(DataSet: TDataSet);
begin
  REshowB;
end;

procedure TDM.REshowB;
begin
  if assigned(doclist) then
  begin
    doclist.fDoc1.pnBuff.Caption := IntToStr(cdsList.RecordCount) ;
    if DM.cdsList.RecordCount = 0 then
      doclist.fDoc1.pnBuff.Color := clBtnFace
    else
      doclist.fDoc1.pnBuff.Color := clRed;

  end;
end;


procedure TDM.cdsListAfterPost(DataSet: TDataSet);
begin
  REshowB;
end;

procedure TDM.cdsListAfterDelete(DataSet: TDataSet);
begin
  REshowB;
end;

function TDM.MaleCLFloat : String;
var S : String;
begin
  S := trim(Clipboard.AsText);
  S := StringReplace(S, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '.', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, ',', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
end;

function TDM.Getid_Bsn: Variant;
begin
  Result := Main.GetID_Bsn;
end;

procedure TDM.cdsListBeforeOpen(DataSet: TDataSet);
begin
  cdsList.Params.ParamByName('id_user').Value := DM.id_User;
  cdsList.Params.ParamByName('id_BSN').Value := DM.id_Bsn;
end;

function TDM.InputBox_ObjName(const ATitle, AContent: string;
  var AInputText: string): boolean;
var XXX : String;
begin
  XXX := AInputText;

  AdvInputTaskDialog1.title := Atitle;
  AdvInputTaskDialog1.Content := AContent;
  AdvInputTaskDialog1.InputText := AInputText;
  AdvInputTaskDialog1.CommonButtons := [cbOK, cbCancel];
  if AdvInputTaskDialog1.Execute = mrOk then
  begin
    AInputText := AdvInputTaskDialog1.InputText;
    Result := AInputText <> XXX;
  end
  else
    Result := false;
end;

end.
