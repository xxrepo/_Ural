unit uOperImp_impex;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frBsnSelector, StdCtrls, Mask, ToolEdit, ExtCtrls, Db, DBClient, RxMemDS,
  Provider, Grids, DBGridEh, RxLookup, GridsEh;

type
  TDObj = class
    AType : integer;
    NumPrm : integer;
  end;

  TOperImp_impex = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    FilenameEdit1: TFilenameEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Memo2: TMemo;
    cdsExp2: TClientDataSet;
    dsExp: TDataSetProvider;
    cdsExp: TRxMemoryData;
    DataSource1: TDataSource;
    RxDBGrid1: TDBGridEh;
    SaveDialog1: TSaveDialog;
    cdsExtDataDict: TClientDataSet;
    cdsExtDataDictid_Oper_ExtDataNames: TIntegerField;
    cdsExtDataDictid_business: TIntegerField;
    cdsExtDataDictType: TIntegerField;
    cdsExtDataDictNumPrm: TIntegerField;
    cdsExtDataDictParName: TStringField;
    cdsExtDataDictVisible: TBooleanField;
    cdsCur: TClientDataSet;
    cdsCurId_Currency: TAutoIncField;
    cdsCurName: TStringField;
    cdsCurShortName: TStringField;
    cdsCurISOCode: TStringField;
    cdsCurNumberCode: TStringField;
    cdsCurFastAccess: TBooleanField;
    cdsCurValue: TIntegerField;
    cdsCurRate: TFloatField;
    cdsCurAvForPay: TBooleanField;
    cdsCurBase: TBooleanField;
    cdsCurLastUpdated: TBytesField;
    cdsCurId_URL: TIntegerField;
    lbRecordCount: TLabel;
    cdsExpOperDate: TDateTimeField;
    cdsExpSumm: TFloatField;
    cdsExpNarr: TStringField;
    cdsExpReprName: TStringField;
    cdsExpOperType: TStringField;
    cdsExpOperNum: TStringField;
    cdsExpAcc: TStringField;
    cdsExpOperNum2: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cdsExpBeforePost(DataSet: TDataSet);
  private
    AFSL : TStringList;
 
    Fxxx_Handle : HWnd;
    procedure Setid_business(const Value: Variant);
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;

    procedure Initialize(const AHandle : HWnd; id_business : Variant);
  end;

var
  OperImp_impex: TOperImp_impex;

procedure ShowOperImp_impex(const AHandle : HWnd; id_business : Variant);


implementation

uses foMyFunc, uDM, uPrgForm, uMeCrpt, HyperParse, uUnivSelector;

{$R *.DFM}

procedure ShowOperImp_impex(const AHandle : HWnd; id_business : Variant);
var F : TOperImp_impex;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  F := TOperImp_impex.Create(nil);
  try
    F.Show;
    F.Repaint;
    F.Initialize(AHandle, id_business);
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

{ TForm1 }

constructor TOperImp_impex.Create(AOwner: TCOmponent);
begin
  inherited;
  AFSL := TStringList.Create;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TOperImp_impex.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

destructor TOperImp_impex.Destroy;
begin
  AFSL.Free;
  inherited;

end;

procedure TOperImp_impex.FormShow(Sender: TObject);
begin
//  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
  lbRecordCount.Caption := '';
end;

procedure TOperImp_impex.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TOperImp_impex.Initialize(const AHandle : HWnd; id_business: Variant);
begin
  Fxxx_Handle := AHandle;
end;

procedure TOperImp_impex.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
//  if not cdsLog.IsEmpty then
//    SendMessage(Fxxx_Handle, xxx_RefrMsg, cdsLog.FieldByName('ID_Oper').AsInteger, 0);
end;

   
 type UTF8String = type string;


function Utf8ToUnicode_ex(Dest: PWideChar; MaxDestChars: Cardinal; Source: PChar; SourceBytes: Cardinal): Cardinal;
var
  i, count: Cardinal;
  c: Byte;
  wc: Cardinal;
begin
  if Source = nil then
  begin
    Result := 0;
    Exit;
  end;
  Result := Cardinal(-1);
  count := 0;
  i := 0;
  if Dest <> nil then
  begin
    while (i < SourceBytes) and (count < MaxDestChars) do
    begin
      wc := Cardinal(Source[i]);
      Inc(i);
      if (wc and $80) <> 0 then
      begin
        if i >= SourceBytes then Exit;          // incomplete multibyte char
        wc := wc and $3F;
        if (wc and $20) <> 0 then
        begin
          c := Byte(Source[i]);
          Inc(i);
          if (c and $C0) <> $80 then Exit;      // malformed trail byte or out of range char
          if i >= SourceBytes then Exit;        // incomplete multibyte char
          wc := (wc shl 6) or (c and $3F);
        end;
        c := Byte(Source[i]);
        Inc(i);
        if (c and $C0) <> $80 then Exit;       // malformed trail byte

        Dest[count] := WideChar((wc shl 6) or (c and $3F));
      end
      else
        Dest[count] := WideChar(wc);
      Inc(count);
    end;
    if count >= MaxDestChars then count := MaxDestChars-1;
    Dest[count] := #0;
  end
  else
  begin
    while (i < SourceBytes) do
    begin
      c := Byte(Source[i]);
      Inc(i);
      if (c and $80) <> 0 then
      begin
        if i >= SourceBytes then Exit;          // incomplete multibyte char
        c := c and $3F;
        if (c and $20) <> 0 then
        begin
          c := Byte(Source[i]);
          Inc(i);
          if (c and $C0) <> $80 then Exit;      // malformed trail byte or out of range char
          if i >= SourceBytes then Exit;        // incomplete multibyte char
        end;
        c := Byte(Source[i]);
        Inc(i);
        if (c and $C0) <> $80 then Exit;       // malformed trail byte
      end;
      Inc(count);
    end;
  end;
  Result := count+1;
end;

function Utf8ToUnicode(Dest: PWideChar; Source: PChar; MaxChars: Integer): Integer;
var
  len: Cardinal;
begin
  len := 0;
  if Source <> nil then
    while Source[len] <> #0 do
      Inc(len);
  Result := Utf8ToUnicode_ex(Dest, MaxChars, Source, len);
end;
 function Utf8Decode(const S: UTF8String): WideString;
var
  L: Integer;
  Temp: WideString;
begin
  Result := '';
  if S = '' then Exit;
  SetLength(Temp, Length(S));

  L := Utf8ToUnicode_ex(PWideChar(Temp), Length(Temp)+1, PChar(S), Length(S));
  if L > 0 then
    SetLength(Temp, L-1)
  else
    Temp := '';
  Result := Temp;
end;


function Utf8Encode(const WS: WideString): UTF8String;
var
  L: Integer;
  Temp: UTF8String;
begin
  Result := '';
  if WS = '' then Exit;
  SetLength(Temp, Length(WS) * 3); // SetLength includes space for null terminator

  L := Utf8ToUnicode_ex(PWideChar(Temp), Length(Temp)+1, PChar(WS), Length(WS));
  if L > 0 then
    SetLength(Temp, L-1)
  else
    Temp := '';
  Result := Temp;
end;

 
function AnsiToUtf8(const S: string): UTF8String;
begin
  Result := Utf8Encode(S);
end;

function Utf8ToAnsi(const S: UTF8String): string;
begin
  Result := Utf8Decode(S);
end;


function ExtrVal(const S: String): string;
var X, X2 : integer;
    S1,S1_2, S2 : String;
begin
  S1 := 'nowrap">';
  S1_2 := '<SPAN>';
  S2 := '</SPAN>';
  X := POS(AnsiUpperCase(S1), AnsiUpperCase(S));
  if X = 0 then  X := POS(AnsiUpperCase(S1_2), AnsiUpperCase(S));
  X := X + Length(S1);
  X2 := POS(AnsiUpperCase(S2), AnsiUpperCase(S));
  Result := copy(S, X, X2 - X);

  X := POS('>', Result);
  while X > 0 do
  begin
    Result := copy(Result, X + 1, 255);
    X := POS('>', Result);
  end;
  Result := StringReplace(Result, '&nbsp;', ' ', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '<br>', ' ', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '<BR>', ' ', [rfReplaceAll, rfIgnoreCase]);
end;



procedure TOperImp_impex.Button1Click(Sender: TObject);
var id_Bsn, OperDate, Summ: OleVariant;
        Narr, ReprName, OperType, OperNum, OperNum2, Acc : String;
    AID : integer;
    S : String;
  procedure GetDataFromHTML;
  var i, RowN : integer;
      SIn, Sout : String;
      SL : TStringList;
      inData : boolean;
      ColNum, CN,
      ColNumIn, ColNumOut, ColNumNarr, ColNumCA, ColNumOperType, ColNumOperNum, ColNumRN, ColNumAcc, ColNumDate : integer;
  begin
    inData := false;
    ColNum := 0;
    CN := 0;
    ColNumIn := -1;//4;
    ColNumOut := -1;//5;
    ColNumNarr := -1;//6;
    ColNumCA := -1;//7;
    ColNumOperType := -1;//8;
    ColNumOperNum := -1;//9;
    ColNumRN := -1;
    ColNumAcc := -1;
    ColNumDate := -1;
    
    cdsExp.Close;
    cdsExp.Open;
    SL := TStringList.Create;
    try
      SL.LoadFromFile(FilenameEdit1.FileName);
      SL.Text := Utf8ToAnsi(SL.Text);
      RowN := 0;
      for i := 0 to  SL.Count - 1  do
      begin
          S := SL[i];
          ShowProgressForm(Handle, i, SL.Count - 1, 'Проверка данных');

          if (POS('<TR', AnsiUpperCase(S)) > 0) then CN := 0;
          if (POS('<TD', AnsiUpperCase(S)) > 0) then
            CN := CN + 1;

          if (POS('TD CLASS="R0C0"', AnsiUpperCase(SL[i])) > 0) and (not inData) then
          begin
            if (POS(AnsiUpperCase('Поступило'), AnsiUpperCase(S)) > 0) then ColNumIn := CN;
            if (POS(AnsiUpperCase('Списано'), AnsiUpperCase(S)) > 0) then ColNumOut := CN;
            if (POS(AnsiUpperCase('Назначение'), AnsiUpperCase(S)) > 0) then ColNumNarr := CN;
            if (POS(AnsiUpperCase('Контрагент'), AnsiUpperCase(S)) > 0) then ColNumCA := CN;
            if (POS(AnsiUpperCase('Вх.&nbsp;номер'), AnsiUpperCase(S)) > 0) then ColNumOperNum := CN;
            if (POS(AnsiUpperCase('Вид&nbsp;операции'), AnsiUpperCase(S)) > 0) then ColNumOperType := CN;
            if (POS(AnsiUpperCase('Рег.&nbsp;номер'), AnsiUpperCase(S)) > 0) then ColNumRN := CN;
            if (POS(AnsiUpperCase('Банк.&nbsp;счет'), AnsiUpperCase(S)) > 0) then ColNumAcc := CN;
            if (POS(AnsiUpperCase('Дата'), AnsiUpperCase(S)) > 0) and (POS(AnsiUpperCase('Вх.'), AnsiUpperCase(S)) <= 0) then ColNumDate := CN;

          end;

          if (POS('TD CLASS="R1C0"', AnsiUpperCase(SL[i])) > 0) and (not inData) then
          begin
            inData := true;
            cdsExp.Append;
          end;
          if inData and (POS('<TD', AnsiUpperCase(S)) > 0) then
          begin
            ColNum := ColNum + 1;
          end;
 
          if inData and (POS('<TR', AnsiUpperCase(S)) > 0) then
          begin
            ColNum := 0;
            if dsBrowse <> cdsExp.State then
              cdsExp.Post;
// if cdsExp.RecordCount > 100 then exit;
            cdsExp.Append;
          end;
          S := ExtrVal(S);
          if (S <> '') and inData and (ColNum >=1) then
          begin

            if (ColNum = ColNumDate) then
              cdsExpOperDate.AsDateTime := StrToDate(StringReplace(S, '/', '.', [rfReplaceAll, rfIgnoreCase]));

            if (ColNum = ColNumIn) and (cdsExpSumm.AsFloat = 0) then
              cdsExpSumm.AsFloat := StrToFloatAdv(S);
            if (ColNum = ColNumOut) and (cdsExpSumm.AsFloat = 0) then
              cdsExpSumm.AsFloat := -StrToFloatAdv(S);
 

            if ColNum = ColNumNarr then
              cdsExpNarr.AsString := S;
            if ColNum = ColNumCA then
              cdsExpReprName.AsString := S;
            if ColNum = ColNumOperType then
              cdsExpOperType.AsString := S;
            if ColNum = ColNumOperNum then
              cdsExpOperNum.AsString := S;
            if ColNum = ColNumRN then
              cdsExpOperNum2.AsString := S;
            if ColNum = ColNumAcc then
              cdsExpAcc.AsString := S;
          end;
        end;

    finally
      SL.Free;
      CloseProgressForm;
              if dsBrowse <> cdsExp.State then
                cdsExp.Post;
    end;

  end;


  var i : integer;
begin
  cdsExp.Close;
  cdsExp.Open;
  if fBsnSelector1.ID < 0 then
  begin
    MessageBox(Self.Handle, 'Не выбран бизнес, в который надо импортировать операции.', 'Выберите бизнес', MB_OK + MB_ICONERROR);
    Windows.SetFocus(fBsnSelector1.edName.Handle);
    Exit;
  end;


  if FilenameEdit1.FileName = '' then
  begin
    MessageBox(Self.Handle, 'Не выбран файл данных.', 'Выберите файл', MB_OK + MB_ICONERROR);
    Windows.SetFocus(FilenameEdit1.Handle);
    Exit;
  end;

  // *********************************
  if pos('.htm', AnsiLowerCase( FilenameEdit1.FileName)) > 0 then
    GetDataFromHTML
  else
  begin
  //  if pos('.xml', AnsiLowerCase(FilenameEdit1.FileName)) > 0 then
  //    GetDataFromXML

  end;
  // *********************************

 
  with cdsExp do
  begin
    try
      lbRecordCount.Caption := 'Всего проводок ' + IntToStr(cdsExp.RecordCount);
      if MessageBox(Self.Handle, 'Импортировать операции?', 'Подтвердите импорт', MB_YESNO + MB_ICONQUESTION + mb_DefButton2) = idYes then
      begin
        Memo2.Lines.Clear;
        First;
        Memo2.Lines.Clear;
    //    Memo1.Lines.BeginUpdate;
        DM.rsCA.AppServer.BeginTruns;

        while not Eof do
        begin
          try
            ShowProgressForm(Handle, RecNo, RecordCount, 'Импорт данных');

            id_Bsn := fBsnSelector1.ID;
            OperDate := cdsExpOperDate.AsVariant;
            Summ := cdsExpSumm.AsVariant;
            Narr := cdsExpNarr.AsString;
            ReprName := trim(cdsExpReprName.AsString);
            OperType := cdsExpOperType.AsVariant;
            OperNum := cdsExpOperNum.AsString;
            OperNum2 := cdsExpOperNum2.AsString;
            Acc := cdsExpAcc.AsString;
            
            AID := DM.rsCA.AppServer.Imp_Oper_UnEdit(id_Bsn, OperDate, Summ, Narr, ReprName, OperType, OperNum, OperNum2, Acc);
            if AID = -1 then
              raise Exception.Create('Ошибка при импорте операций');

            if AID > 0 then
            begin
               Memo2.Lines.Add(IntToStr(AID));
               Tag := AID;
            end
            else
            begin
              Tag := 0;
            end;
          except
              DM.rsCA.AppServer.RollbackTrans;
              Exit;
          end;
          Next;
        end;
        DM.rsCA.AppServer.CommitTrans;
        FilenameEdit1.FileName := '';
        fBsnSelector1.ID := -1;
        CloseProgressForm;
        MessageBox(Self.Handle, PChar('Операции успешно импортированы. Всего ' + IntToStr(Memo2.Lines.Count) + ' операций из '
           + IntToStr(cdsExp.RecordCount) + '. Их номера приведены в списке'), 'Импорт завершен', MB_OK + MB_ICONINFORMATION);
               
      end;
    finally
    //  RecNo := OldRecNo;
      EnableControls;
      CloseProgressForm;

 ///     Memo1.Lines.EndUpdate;
    end;
  end;
end;

procedure TOperImp_impex.Setid_business(const Value: Variant);
var i : integer;
    AField: TField;
    S : String;
    ADObj : TDObj;
begin
  AFSL.Clear;
  with cdsExtDataDict do
  begin
    Close;
    Params.ParamByName('@id_business').Value := Value;
    Open;
    try
      First;
      while Not Eof do
      begin
        case FieldByName('Type').AsInteger of
          1 : S := 'Dig';
          2 : S := 'Str';
          3 : S := 'Date';
        end;
        S := S + FieldByName('NumPrm').AsString;
        S := UpperCase(S);
        for i := 0 to cdsExp.Fields.Count - 1 do
        begin
          AField := cdsExp.Fields[i];
          if UpperCase(AField.FieldName) = S then
          begin
            S := 'Бюджет|' + trim(FieldByName('ParName').AsString);
            case FieldByName('Type').AsInteger of
              1 : S := S + '@1';
              2 : S := S + '@2';
              3 : S := S + '@3';
            end;
            ADObj := TDObj.Create;
            ADObj.AType := FieldByName('Type').AsInteger;
            ADObj.NumPrm := FieldByName('NumPrm').AsInteger;
            AFSL.AddObject(S, ADObj);
          end;
        end;
        Next;
      end;
    finally
      Close;
    end;
  end;
end;

procedure TOperImp_impex.fBsnSelector1Button1Click(Sender: TObject);
begin
  fBsnSelector1.Button1Click(Sender);
end;


procedure TOperImp_impex.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TOperImp_impex.cdsExpBeforePost(DataSet: TDataSet);
begin
  if cdsExpAcc.AsString = '' then cdsExpAcc.AsString := 'Б/счет не указан';
  if cdsExpReprName.AsString = '' then cdsExpReprName.AsString := 'Контрагент не указан';
  if cdsExpOperNum2.AsString = '' then cdsExpOperNum2.AsString := '-';

end;

end.
