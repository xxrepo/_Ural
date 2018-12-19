unit CrnCommon;

interface

uses
  Db, DBClient, Controls, ExtCtrls, classes,
  urlmon, WinInet, HyperParse, grids, SHDocVw, MSHTML, ActiveX;

type
  TURLParser = class
  private
    FParser: THyperParse;
    FSL : TStringList;
    FURL : String;
    function GetParser: THyperParse;
    function GetSL: TStringList;

    function GetTableCount: integer;
    property Parser : THyperParse read GetParser;
    property SL : TStringList read GetSL;
    function GetURL: string;
    function GetTableByNumFromHTMLFile_2(Num: integer; SrcSL,
      ARezSL: TStrings): boolean;
  public
    constructor Create;
    function SetURL(AURL : string) : boolean;
    function GetTableByNum(Num : integer) : TStrings;
    function VarTableByNumFromHTMLFile_2(Num : integer) : Variant;
    function OutputTable_2(ANum : integer; AStringGrid: TStringGrid) : boolean;

    property URL : string read GetURL;
    property TableCount : integer read GetTableCount;
  end;
  
procedure LoadImageFromCDS(CDS : TClientDataSet; ImageField : string;
  Image : TImage; ImageContainer : TWinControl);
procedure LoadImageFromFile(FileName : string; Image : TImage;
  ImageContainer : TWinControl);
function CheckNotNull(Base : TWinControl) : boolean;
procedure ImageResize(Image : TImage; ImageContainer : TWinControl);
//function GetInetFile(FileURL : string) : TMemoryStream;

function GetInetHTMLFile(FileURL : string; SL : TStrings) : boolean;
function GetTableByNumFromHTMLFile(Num : integer; SrcSL : TStrings; ARezSL : TStrings) : boolean;
function GetTableCountFromHTMLFile(SrcSL : TStrings) : integer;

function VarTableByNumFromHTMLFile(Num : integer; SrcSL : TStrings) : Variant;
function OutputTable(SL : TStringList; ARblNum : integer; AStringGrid: TStringGrid) : boolean;
procedure ShowHTMLText(AWebBrowser : TWebBrowser; const AText: String);
function URLWithDate(URL : string; ADate : TDateTime) : string;

procedure WriteToCell(Sender : TStringGrid; ACol, ARow : integer; Value : Variant; MaxWidths : integer = -1);

implementation

uses
  Windows, Graphics, RxGIF, JPEG, Dialogs, StdCtrls, SysUtils, Forms,
  ToolEdit, Math, RxLookup;

type TGrFile = byte;

const
  gftUnknown = 0;
  gftBMP = 1;
  gftGIF = 2;
  gftJPG = 3;


function GetInetFile(FileURL : string) : TMemoryStream;
const BufferSize = 1024*32;
var
  hSession, hURL : HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  sAppName: string;
  TOut : integer;
  R : integer;
  B : Bool;
  PIInfo : PInternetProxyInfo;
begin
  Result := TMemoryStream.Create;
  sAppName := ExtractFileName(Application.ExeName);
  hSession := InternetOpen(PChar(sAppName), INTERNET_OPEN_TYPE_DIRECT, nil, nil, 0);
  if GetLastError <> 0 then raise Exception.Create('Ошибка ' + SysErrorMessage(R));

  try
    TOut := 10000;
    B := InternetSetOption(hSession, INTERNET_OPTION_DATA_RECEIVE_TIMEOUT, @TOut, SizeOf(TOut));
    if GetLastError <> 0 then raise Exception.Create('Ошибка ' + SysErrorMessage(R));
    hURL := InternetOpenURL(hSession, PChar(fileURL), nil, 0, 0, 0);
    if hURL <> nil then
    begin
       try
        repeat
          InternetReadFile(hURL, @Buffer, SizeOf(Buffer), BufferLen);
          Result.WriteBuffer(Buffer, BufferLen);
        until BufferLen = 0;
      finally
        InternetCloseHandle(hURL);
      end;
    end;
  finally
    InternetCloseHandle(hSession);
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

function URLWithDate(URL : string; ADate : TDateTime) : string;
var YearPos, MonthPos, DayPos,
    YearLen, MonthLen, DayLen : integer;
    YearStr, MonthStr, DayStr : string;
    Year, Month, Day : word;
  i : integer;
const
  Fmts : array[1..7] of string[4] = ('y', 'yy', 'yyyy', 'm', 'mm', 'd', 'dd');
begin
  DecodeDate(ADate, Year, Month, Day);
  Result := LowerCase(URL);
  YearPos := 0;
  MonthPos := 0;
  DayPos := 0;
  YearLen := 0;
  MonthLen := 0;
  DayLen := 0;
  for i := 1 to 3 do
    begin
    if Pos('*'+Fmts[i], Result)<>0 then
      begin
      YearPos := Pos(Fmts[i], Result);
      YearLen := Length(Fmts[i]);
      end;
    end;
  for i := 4 to 5 do
    begin
    if Pos('*'+Fmts[i], Result)<>0 then
      begin
      MonthPos := Pos(Fmts[i], Result);
      MonthLen := Length(Fmts[i]);
      end;
    end;
  for i := 6 to 7 do
    begin
    if Pos('*'+Fmts[i], Result)<>0 then
      begin
      DayPos := Pos(Fmts[i], Result);
      DayLen := Length(Fmts[i]);
      end;
    end;
  if YearLen<>0 then
    begin
    YearStr := IntToStr(Year);
    YearStr := Copy(YearStr, 5-YearLen, YearLen);
    Result := Copy(Result, 1, YearPos-2) + YearStr +
      Copy(Result, YearPos+YearLen, Length(Result)-YearPos-YearLen);
    end;
  if MonthLen<>0 then
    begin
    MonthStr := IntToStr(Month);
    if Month<10 then MonthStr := '0'+MonthStr;
    MonthStr := Copy(MonthStr, 3-MonthLen, MonthLen);
    Result := Copy(Result, 1, MonthPos-2) + MonthStr +
      Copy(Result, MonthPos+MonthLen, Length(Result)-MonthPos-MonthLen+1);
    end;
  if DayLen<>0 then
    begin
    DayStr := IntToStr(Day);
    if Day<10 then DayStr := '0'+DayStr;
    DayStr := Copy(DayStr, 3-DayLen, DayLen);
    Result := Copy(Result, 1, DayPos-2) + DayStr +
      Copy(Result, DayPos+DayLen, Length(Result)-DayPos-DayLen+1);
    end;
end;

function GetInetHTMLFile(FileURL : string; SL : TStrings) : boolean;
const BufferSize = 1024*32;
var
  hSession, hURL : HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  sAppName: string;
  TOut : integer;
  R : integer;
  B : Bool;
  P : PChar;
  PIInfo : PInternetProxyInfo;
  S : String;
begin
  SL.Clear;
  Result := false;
  if POS('d:\', FileURL) > 0 then
  begin
    SL.LoadFromFile(FileURL);
    Result := true;
    exit;
  end;
  sAppName := ExtractFileName(Application.ExeName);
  hSession := InternetOpen(PChar(sAppName), INTERNET_OPEN_TYPE_DIRECT, nil, nil, 0);
//  hSession := InternetOpen(PChar(sAppName), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  R := GetLastError;
  if R <> 0 then raise Exception.Create('Ошибка ' + SysErrorMessage(R));

  try
    TOut := 10000;
    B := InternetSetOption(hSession, INTERNET_OPTION_DATA_RECEIVE_TIMEOUT, @TOut, SizeOf(TOut));
    R := GetLastError;
    if R <> 0 then raise Exception.Create('Ошибка ' + SysErrorMessage(R));
    hURL := InternetOpenURL(hSession, PChar(fileURL), nil, 0, 0, 0);
//    R := GetLastError;
//    if R <> 0 then raise Exception.Create('Ошибка ' + SysErrorMessage(R));
    if hURL <> nil then
    begin
       try
        repeat
          InternetReadFile(hURL, @Buffer, SizeOf(Buffer), BufferLen);
          if BufferLen > 0 then
          begin
            P := @Buffer;
            S := String(P);
            SL.Add(S);
          end;
       //   Result.WriteBuffer(Buffer, BufferLen);
        until BufferLen = 0;
        Result := true;
      finally
        InternetCloseHandle(hURL);
      end;
    end;
  finally
    InternetCloseHandle(hSession);
  end;
end;

function GetTableByNumFromHTMLFile(Num : integer; SrcSL : TStrings; ARezSL : TStrings) : boolean;
var
  Parser: THyperParse;
  S : String;
  i, j, N, insTable : integer;
begin
  ARezSL.Clear;
  
  Parser := THyperParse.Create;
  try
    Parser.Execute(SrcSL.Text);
    N := 0;
    insTable := 0;
    for i := 0 to Parser.Count - 1 do
    begin
      if (Parser[i].IsTag) then
      begin
        if (TRIM(Parser[i].TagName) = 'TABLE') and (N = Num) then
          Inc(insTable);          // Вложенная таблица

        if (TRIM(Parser[i].TagName) = 'TABLE') and (insTable = 0) then
          Inc(N);

        if (TRIM(Parser[i].TagName) = '/TABLE') and (N = Num) and (insTable = 0) then
          Break;
        if (TRIM(Parser[i].TagName) = '/TABLE') and (N = Num) then
          Dec(insTable);
        if (N = Num) then
        begin
          S := '<' + Parser[i].TagName;
          for j := 0 to Parser[i].ParamCount - 1 do
            S := S + ' ' + Parser[i].Params[j].Name + '=' + Parser[i].Params[j].Value;// Parser[i].Params[j].Param;        ;
          ARezSL.Add(S  + '>');
        end
      end
      else
        if (N = Num) then
          ARezSL.Add(' ' + Parser[i].Text);
    end;
  finally
    Parser.Free;
  end;
end;

function VarTableByNumFromHTMLFile(Num : integer; SrcSL : TStrings) : Variant;
var
  Parser: THyperParse;
  S : String;
  i, N, insTable : integer;
  ColCount, RowCount, CurColCount : integer;
  ColIndex, RowIndex : integer;
  IndexFrom, IndexTo : integer;
  InRow, CalcCol, inCell : boolean;
  V : Variant;
begin
  Result := Null;
  try
    Parser := THyperParse.Create;
    try
      Parser.Execute(SrcSL.Text);
      N := 0;
      insTable := 0;
      IndexFrom := -1;
      IndexTo := -1;
      ColCount := 0;
      CurColCount := 0;
      RowCount := 0;
      InRow := false;
      CalcCol := true;
      inCell := false;

      for i := 0 to Parser.Count - 1 do
      begin
        if (Parser[i].IsTag) then
        begin
          if (TRIM(Parser[i].TagName) = 'TABLE') and (N = Num) then
          begin
            IndexFrom := -1;
            Break;          // Вложенная таблица
          end;

          if (TRIM(Parser[i].TagName) = 'TR') and (N = Num) then
          begin
            InRow := true;
            CurColCount := 0;
            Inc(RowCount);
          end;
          if (TRIM(Parser[i].TagName) = '/TR') and (InRow) then
          begin
            if (not CalcCol) and (CurColCount <> ColCount) then
            begin
              IndexFrom := -1;
              Break;          // Вложенная ячейка
            end;
            InRow := false;
            CalcCol := false;
          end;
          if (TRIM(Parser[i].TagName) = 'TD') and (InRow) and (CalcCol)  then
            Inc(ColCount);

          if (TRIM(Parser[i].TagName) = 'TD') and (InRow) then
            inc(CurColCount);


          if (TRIM(Parser[i].TagName) = 'TABLE') {and (insTable = 0)} then
            Inc(N);

          if (TRIM(Parser[i].TagName) = '/TABLE') and (N = Num) and (insTable = 0) then
          begin
            IndexTo := i;
            Break;
          end;
          if (TRIM(Parser[i].TagName) = '/TABLE') and (N = Num) then
            Dec(insTable);
          if (TRIM(Parser[i].TagName) = 'TABLE') and (N = Num) then
          begin
            IndexFrom := i;
        //    Break;
          end
        end;
      end;
      if (IndexFrom > -1) then // С этого тега начинается нужная таблица
      begin
        V := VarArrayCreate([0, RowCount - 1, 0, ColCount - 1], varVariant);
        ColIndex := -1;
        RowIndex := -1;
        inCell := false;
        for i := IndexFrom to IndexTo do
        begin
          if Parser[i].IsTag then
          begin
            if (TRIM(Parser[i].TagName) = 'TR') then
            begin
              Inc(RowIndex);
              ColIndex := -1;
            end;
            if (TRIM(Parser[i].TagName) = 'TD') then
            begin
              Inc(ColIndex);
              inCell := True;
            end;
            if (TRIM(Parser[i].TagName) = '/TD') then
              inCell := false;
          end
          else
            if inCell then
              V[RowIndex, ColIndex] := VarToStr(V[RowIndex, ColIndex]) + Trim(Parser[i].Text);
        end;
        Result := V;
      end;
    finally
      Parser.Free;
    end;
  except

  end;
end;

function OutputTable(SL : TStringList; ARblNum : integer; AStringGrid: TStringGrid) : boolean;
var i, j, TblCnt : integer;
  ColCount, RowCount : integer;
  V : Variant;
begin
  Result := false;
//  TblCnt := GetTableCountFromHTMLFile(SL);
  if (ARblNum > 0) {and (ARblNum <= TblCnt)} then
  begin
    V := VarTableByNumFromHTMLFile(ARblNum, SL);
    if VarType(V) <> varNull then
    begin
      RowCount := VarArrayHighBound(V, 1);
      ColCount := VarArrayHighBound(V, 2);

      AStringGrid.ColCount := ColCount + 1;
      AStringGrid.RowCount := RowCount + 2;
      AStringGrid.FixedRows := 1;
      AStringGrid.RowHeights[AStringGrid.RowCount - 1] := 0;

      for i := 0 to RowCount do
      begin
        for j := 0 to ColCount do
          AStringGrid.Cells[j, i] := V[i, j]
      end;
      Result := true;
    end
    else
    begin
      AStringGrid.ColCount := 0;
      AStringGrid.RowCount := 0;
      AStringGrid.Cells[0, 0] := 'Разбор невозможен';
      AStringGrid.ColWidths[0] := 120;
    end;
  end;
end;

function GetTableCountFromHTMLFile(SrcSL : TStrings) : integer;
var
  Parser: THyperParse;
  i : integer;
begin
  Parser := THyperParse.Create;
  try
    Parser.Execute(SrcSL.Text);
    Result := 0;
    for i := 0 to Parser.Count - 1 do
    begin
      if (Parser[i].IsTag) then
      begin
        if (TRIM(Parser[i].TagName) = 'TABLE') then
          Inc(Result);
      end;
    end;
  finally
    Parser.Free;
  end;
end;

function DetGFType(MS : TMemoryStream) : TGrFile;
var Buf : array[1..4] of byte;
begin
  MS.Position:=0;
  MS.Read(Buf, 4);
  if (Chr(Buf[1])='B') and (Chr(Buf[2])='M') then
    Result:=gftBMP
  else if (Chr(Buf[1])='G') and (Chr(Buf[2])='I') and (Chr(Buf[3])='F') then
    Result:=gftGIF
  else if (Buf[1]=$FF) and (Buf[2]=$D8) and (Buf[3]=$FF) and (Buf[4]=$E0) then
    Result:=gftJPG
  else
    Result:=gftUnknown;
  MS.Position:=0;
end;

procedure LoadImageFromCDS(CDS : TClientDataSet; ImageField : string;
  Image : TImage; ImageContainer : TWinControl);
var
  PicField : TField;
  MemStream : TMemoryStream;
  Pic : TGraphic;
  GrFile : TGrFile;
begin
  PicField:=CDS.FindField(ImageField);
  if (PicField <> nil) and PicField.IsBlob and not PicField.IsNull then
    begin
    MemStream:=TMemoryStream.Create;
    try
      TBlobField(PicField).SaveToStream(MemStream);
      GrFile := DetGFType(MemStream);
      MemStream.Position := 0;
      Pic := nil;
      case GrFile of
        gftBMP :
          Pic := TBitmap.Create;
        gftGIF :
          Pic := TGIFImage.Create;
        gftJPG :
          Pic := TJPEGImage.Create;
        end;
      Pic.LoadFromStream(MemStream);
      Image.Picture.Graphic := Pic;
      ImageResize(Image, ImageContainer);
    finally
      MemStream.Free;
      end;
    Image.Visible:=True;
    end
  else
    Image.Visible:=False;
end;

procedure LoadImageFromFile(FileName : string; Image : TImage;
  ImageContainer : TWinControl);
var
  MemStream : TMemoryStream;
  Pic : TGraphic;
  GrFile : TGrFile;
begin
  MemStream:=TMemoryStream.Create;
  MemStream.LoadFromFile(FileName);
  try
    GrFile := DetGFType(MemStream);
    MemStream.Position := 0;
    Pic := nil;
    case GrFile of
      gftBMP :
        Pic := TBitmap.Create;
      gftGIF :
        Pic := TGIFImage.Create;
      gftJPG :
        Pic := TJPEGImage.Create;
      end;
    Pic.LoadFromStream(MemStream);
    Image.Picture.Graphic := Pic;
    Image.Visible:=True;
  finally
    MemStream.Free;
    end;
end;

function CheckNotNull(Base : TWinControl) : boolean;
var i : integer;
  List : TList;
begin
  Result:=True;
  i:=0;
  List:=TList.Create;
  Base.GetTabOrderList(List);
  while (i < List.Count) and Result do
    begin
    if (TWinControl(List.Items[i]).Tag<>0)
    and TWinControl(List.Items[i]).Visible then
      begin
      if (TWinControl(List.Items[i]) is TEdit)
        and (Trim((TWinControl(List.Items[i]) as TEdit).Text)='')
      or ((TWinControl(List.Items[i]) is TDateEdit)
        and ((TWinControl(List.Items[i]) as TDateEdit).Date=0))
      or ((TWinControl(List.Items[i]) is TRxDBLookupCombo)
        and (Trim((TWinControl(List.Items[i]) as TRxDBLookupCombo).Value)='')) then
        begin
        MessageBox(Application.Handle, 'Обязательное поле не заполнено', 'Ошибка', mb_Ok);
        Result:=False;
        TWinControl(List.Items[i]).SetFocus;
        end;
      end;
    inc(i);
    end;
end;

procedure ImageResize(Image : TImage; ImageContainer : TWinControl);
begin
  if (Image.Picture.Width > ImageContainer.ClientWidth) and
  (Image.Picture.Height > ImageContainer.ClientHeight) then
    Image.AutoSize:=True
  else
    begin
    Image.AutoSize:=False;
{    Image.Width:=Image.Picture.Width;
    Image.Height:=Image.Picture.Height;
    if Image.Width < ImageContainer.ClientWidth then
      Image.Width := ImageContainer.ClientWidth;
    if Image.Height < ImageContainer.ClientHeight then
      Image.Height := ImageContainer.ClientHeight;}
    Image.Width := Max(ImageContainer.ClientWidth, Image.Picture.Width);
    Image.Height := Max(ImageContainer.ClientHeight, Image.Picture.Height);
    end;
end;

procedure WriteToCell(Sender : TStringGrid; ACol, ARow : integer; Value : Variant; MaxWidths : integer);
var
  Len: TSize;
begin
  with Sender do
  begin
    Sender.Cells[ACol, ARow] := VarToStr(Value);
    Win32Check(GetTextExtentPoint32(Canvas.Handle, Pchar(Cells[ACol, ARow]),
    Length(Cells[ACol, ARow]), Len));
    if (Len.cx > ColWidths[ACol]) then
    begin
      if (Len.cx <= MaxWidths) or (MaxWidths < 0) then
        ColWidths[ACol] := Len.cx + 10
      else
        ColWidths[ACol] := MaxWidths;
    end;
  end;
end;

{ TURLParser }

constructor TURLParser.Create;
begin
  inherited;
  FParser := nil;
  FSL := nil;
end;

function TURLParser.GetParser: THyperParse;
begin
  if FParser = nil then
    FParser := THyperParse.Create;
  if FParser.Count = 0 then
    FParser.Execute(SL.Text);
  Result := FParser;
end;

function TURLParser.GetSL: TStringList;
begin
  if FSL = nil then
    FSL := TStringList.Create;
  Result := FSL;
end;

function TURLParser.GetTableByNum(Num: integer): TStrings;
var tmpRez : TStringList;
begin
  Result := nil;
  tmpRez := TStringList.Create;
  try
    if GetTableByNumFromHTMLFile_2(Num, SL, tmpRez) then
    begin        
      Result := TStringList.Create;
      Result.AddStrings(tmpRez);
    end;
  finally
    tmpRez.Free;
  end;
end;

function TURLParser.GetTableCount: integer;
var
  i : integer;
begin
  Result := 0;
  if FURL <> '' then
  begin
    for i := 0 to Parser.Count - 1 do
    begin
      if (Parser[i].IsTag) then
      begin
        if (TRIM(Parser[i].TagName) = 'TABLE') then
          Inc(Result);
      end;
    end;
  end;
end;

function TURLParser.GetURL: string;
begin
  Result := FURL;
end;

function TURLParser.SetURL(AURL: string): boolean;
var S : String;
begin
  Result := false;
  S := URLWithDate(AURL, Date);
  if GetInetHTMLFile(S, SL) then
  begin
    FURL := AURL;
    FreeAndNil(FParser);
    Result := true;
  end;
end;

function TURLParser.GetTableByNumFromHTMLFile_2(Num : integer; SrcSL : TStrings; ARezSL : TStrings) : boolean;
var
  S : String;
  i, j, N, insTable : integer;
begin
  ARezSL.Clear;
  
  try
    N := 0;
    insTable := 0;
    for i := 0 to Parser.Count - 1 do
    begin
      if (Parser[i].IsTag) then
      begin
        if (TRIM(Parser[i].TagName) = 'TABLE') and (N = Num) then
          Inc(insTable);          // Вложенная таблица

        if (TRIM(Parser[i].TagName) = 'TABLE') and (insTable = 0) then
          Inc(N);

        if (TRIM(Parser[i].TagName) = '/TABLE') and (N = Num) and (insTable = 0) then
          Break;
        if (TRIM(Parser[i].TagName) = '/TABLE') and (N = Num) then
          Dec(insTable);
        if (N = Num) then
        begin
          S := '<' + Parser[i].TagName;
          for j := 0 to Parser[i].ParamCount - 1 do
            S := S + ' ' + Parser[i].Params[j].Name + '=' + Parser[i].Params[j].Value;// Parser[i].Params[j].Param;        ;
          ARezSL.Add(S  + '>');
        end
      end
      else
        if (N = Num) then
          ARezSL.Add(' ' + Parser[i].Text);
    end;
  finally

  end;
end;

function TURLParser.VarTableByNumFromHTMLFile_2(Num: integer): Variant;
var
  S : String;
  i, N, insTable : integer;
  ColCount, RowCount, CurColCount : integer;
  ColIndex, RowIndex : integer;
  IndexFrom, IndexTo : integer;
  InRow, CalcCol, inCell : boolean;
  V : Variant;
begin
  Result := Null;
  try
    try
      N := 0;
      insTable := 0;
      IndexFrom := -1;
      IndexTo := -1;
      ColCount := 0;
      CurColCount := 0;
      RowCount := 0;
      InRow := false;
      CalcCol := true;
      inCell := false;

      for i := 0 to Parser.Count - 1 do
      begin
        if (Parser[i].IsTag) then
        begin
          if (TRIM(Parser[i].TagName) = 'TABLE') and (N = Num) then
          begin
            IndexFrom := -1;
            Break;          // Вложенная таблица
          end;

          if (TRIM(Parser[i].TagName) = 'TR') and (N = Num) then
          begin
            InRow := true;
            CurColCount := 0;
            Inc(RowCount);
          end;
          if (TRIM(Parser[i].TagName) = '/TR') and (InRow) then
          begin
            if (not CalcCol) and (CurColCount <> ColCount) then
            begin
              IndexFrom := -1;
              Break;          // Вложенная ячейка
            end;
            InRow := false;
            CalcCol := false;
          end;
          if (TRIM(Parser[i].TagName) = 'TD') and (InRow) and (CalcCol)  then
            Inc(ColCount);

          if (TRIM(Parser[i].TagName) = 'TD') and (InRow) then
            inc(CurColCount);


          if (TRIM(Parser[i].TagName) = 'TABLE') {and (insTable = 0)} then
            Inc(N);

          if (TRIM(Parser[i].TagName) = '/TABLE') and (N = Num) and (insTable = 0) then
          begin
            IndexTo := i;
            Break;
          end;
          if (TRIM(Parser[i].TagName) = '/TABLE') and (N = Num) then
            Dec(insTable);
          if (TRIM(Parser[i].TagName) = 'TABLE') and (N = Num) then
          begin
            IndexFrom := i;
        //    Break;
          end
        end;
      end;
      if (IndexFrom > -1) then // С этого тега начинается нужная таблица
      begin
        V := VarArrayCreate([0, RowCount - 1, 0, ColCount - 1], varVariant);
        ColIndex := -1;
        RowIndex := -1;
        inCell := false;
        for i := IndexFrom to IndexTo do
        begin
          if Parser[i].IsTag then
          begin
            if (TRIM(Parser[i].TagName) = 'TR') then
            begin
              Inc(RowIndex);
              ColIndex := -1;
            end;
            if (TRIM(Parser[i].TagName) = 'TD') then
            begin
              Inc(ColIndex);
              inCell := True;
            end;
            if (TRIM(Parser[i].TagName) = '/TD') then
              inCell := false;
          end
          else
            if inCell then
              V[RowIndex, ColIndex] := VarToStr(V[RowIndex, ColIndex]) + Trim(Parser[i].Text);
        end;
        Result := V;
      end;
    finally

    end;
  except

  end;
end;

function TURLParser.OutputTable_2(ANum: integer;
  AStringGrid: TStringGrid): boolean;
var i, j, TblCnt : integer;
  ColCount, RowCount : integer;
  V : Variant;
begin
  Result := false;

  if (ANum > 0) {and (ARblNum <= TblCnt)} then
  begin
    V := VarTableByNumFromHTMLFile_2(ANum);
    if VarType(V) <> varNull then
    begin
      RowCount := VarArrayHighBound(V, 1);
      ColCount := VarArrayHighBound(V, 2);

      AStringGrid.ColCount := ColCount + 1;
      AStringGrid.RowCount := RowCount + 2;
      AStringGrid.FixedRows := 1;
      AStringGrid.RowHeights[AStringGrid.RowCount - 1] := 0;

      for i := 0 to RowCount do
      begin
        for j := 0 to ColCount do
          AStringGrid.Cells[j, i] := V[i, j]
      end;
      Result := true;
    end
    else
    begin
      AStringGrid.ColCount := 0;
      AStringGrid.RowCount := 0;
      AStringGrid.Cells[0, 0] := 'Разбор невозможен';
      AStringGrid.ColWidths[0] := 120;
    end;
  end;
end;

end.
