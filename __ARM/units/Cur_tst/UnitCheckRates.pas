unit UnitCheckRates;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, Grids, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TFormCheckRates = class(TForm)
    QueryRatesInet: TADOQuery;
    QueryRates: TADOQuery;
    StringGridRates: TStringGrid;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    sp_SetNewRate: TADOStoredProc;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ColName : integer;
    ColISO : integer;
    ColCode : integer;
    ColPieces : integer;
    ColRate : integer;
  end;

var
  FormCheckRates: TFormCheckRates;

implementation

{$R *.DFM}

uses
  ShellAPI, Common, Unit1, UnitParser, UnitSelectSite, Pinger;

procedure WriteToCell(Sender : TStringGrid; ACol, ARow : integer; Value : Variant);
var
  Len: TSize;
begin
  with Sender do
    begin
    Cells[ACol, ARow] := value;
    Win32Check(GetTextExtentPoint32(Canvas.Handle, Pchar(Cells[ACol, ARow]),
    Length(Cells[ACol, ARow]), Len));
    if Len.cx > ColWidths[ACol] then
      ColWidths[ACol] := Len.cx+6;
    end;
end;

procedure TFormCheckRates.FormActivate(Sender: TObject);
var i, j, k : integer;
  Rates, Errors : TStringList;
  aRate : TRate;
  sRate : string;
  URLParsed : boolean;
  CountParsedURLs : integer;
  RRR : integer;
begin
  Self.Cursor:=crHourGlass;
  Application.ProcessMessages;

  Rates:=TStringList.Create;
  Errors:=TStringList.Create;
  Rates.Sorted:=True;
  // Чтение текущих настроек из базы
  with QueryRates do
  begin
    Open;
    First;
    while not Eof do
    begin
      Rates.Add(FieldByName('ISOCode').AsString);
      aRate:=TRate.Create;
      aRate.Name:=FieldByName('Name').AsString;
      aRate.Code:=FieldByName('NumberCode').AsString;
      aRate.Rate:=FieldByName('aValue').AsFloat;
      aRate.Pieces:=FieldByName('Pieces').AsInteger;
      Rates.AddObject(FieldByName('ISOCode').AsString, aRate);
      Next;
    end;
  end;
  // Загрузка с сайтов
  with TFormParser.Create(Self) do
  begin
    QueryRatesInet.Open;
    CountParsedURLs:=0;
    with StringGridRates do
    begin
      ColCount := 5 + 1;
      ColWidths[5] := 0;
    end;
    QueryRatesInet.First;
    while not QueryRatesInet.Eof do
    begin
      StatusBar1.Panels[0].Text:='Обращение к сайту  '+QueryRatesInet.FieldValues['URL'];
      Application.ProcessMessages;

  //    RRR := Ping(URLWithDate(QueryRatesInet.FieldValues['URL'], Date));
      RRR := 0;//Ping(URLWithDate(QueryRatesInet.FieldValues['URL'], Date));
      if RRR <> 0 then
        begin
        Errors.Add('Сайт '+URLWithDate(QueryRatesInet.FieldValues['URL'], Date)+' недоступен');
        Errors.Add('Ошибка ' + SysErrorMessage(RRR));
        QueryRatesInet.Next;
        Continue;
      end;

      ColName:=QueryRatesInet.FieldValues['ColName'];
      ColISO:=QueryRatesInet.FieldValues['ColISO'];
      ColCode:=QueryRatesInet.FieldValues['ColCode'];
      ColPieces:=QueryRatesInet.FieldValues['ColPieces'];
      ColRate:=QueryRatesInet.FieldValues['ColRate'];

      WriteToCell(StringGridRates, 5 + i, 0, QueryRatesInet.FieldValues['Name']);
      if URLParsed then
      begin
        inc(CountParsedURLs);
        StringGridRates.ColCount := 5 + 1 + CountParsedURLs;
        // Разбор считанных данных
        for j:=1 to StringGrid1.RowCount-1 do
        begin
          k:=Rates.IndexOf(StringGrid1.Cells[ColISO-1, j]);
          if k <> -1 then
          begin
            sRate:=StringGrid1.Cells[ColRate-1, j];
            TRate(Rates.Objects[k]).SiteRates.Add(sRate);
          end
          else
          begin
            aRate:=TRate.Create;
            aRate.Name:=StringGrid1.Cells[ColName-1, j];
            aRate.Code:=StringGrid1.Cells[ColCode-1, j];
            aRate.Pieces:=StrToInt(StringGrid1.Cells[ColPieces-1, j]);
            aRate.Rate:=0.0;
            Rates.AddObject(StringGrid1.Cells[ColISO-1, j], aRate);
            k:=Rates.IndexOf(StringGrid1.Cells[ColISO-1, j]);
            sRate:=StringGrid1.Cells[ColRate-1, j];
            TRate(Rates.Objects[k]).SiteRates.Add(sRate);
          end;
        end;
      end
      else
        Errors.Add('Документ "'+QueryRatesInet.FieldValues['URL']+'" не удалось прочитать');
      QueryRatesInet.Next;
    end;
    Free;
  end;
  if CountParsedURLs < QueryRatesInet.RecordCount then
  begin
    Errors.Add(Format('Из %d адресов сайтов прочитано %d', [QueryRatesInet.RecordCount, CountParsedURLs]));
  end;
  BitBtn1.Enabled := CountParsedURLs > 0;

  StringGridRates.RowCount:=Rates.Count+1;
  WriteToCell(StringGridRates, 0, 0, 'Наименование');
  WriteToCell(StringGridRates, 1, 0, 'ISO');
  WriteToCell(StringGridRates, 2, 0, 'Цифр. код');
  WriteToCell(StringGridRates, 3, 0, 'Единиц к обмену');
  WriteToCell(StringGridRates, 4, 0, 'Тек. курс');
  for i:=0 to Rates.Count-1 do
    begin
    WriteToCell(StringGridRates, 0, i+1, TRate(Rates.Objects[i]).Name);
    WriteToCell(StringGridRates, 1, i+1, Rates.Strings[i]);
    WriteToCell(StringGridRates, 2, i+1, TRate(Rates.Objects[i]).Code);
    WriteToCell(StringGridRates, 3, i+1, TRate(Rates.Objects[i]).Pieces);
    WriteToCell(StringGridRates, 4, i+1, FormatFloat('#0.00', TRate(Rates.Objects[i]).Rate));
    for j:=0 to TRate(Rates.Objects[i]).SiteRates.Count-1 do
      try
        sRate:=TRate(Rates.Objects[i]).SiteRates.Strings[j];
        if (Pos('.', sRate)<>0) and(DecimalSeparator<>'.') then
          sRate:=StringReplace(sRate, '.', DecimalSeparator, [])
        else if (Pos(',', sRate)<>0) and(DecimalSeparator<>',') then
          sRate:=StringReplace(sRate, ',', DecimalSeparator, []);
        WriteToCell(StringGridRates, 6+j, i+1, FormatFloat('#0.00', StrToFloat(sRate)));
      except on EConvertError do
        Errors.Add(Format('Ячейка [%d, %d] содержит нечисловое выражение: %s', [i, j, sRate]));
        end;
    end;
  Self.Cursor:=crDefault;
  StatusBar1.Panels[0].Text:='Загрузка данных завершена';
  Application.ProcessMessages;

  Rates.Free;
  if Errors.Count > 0 then
    begin
    Errors.SaveToFile('c:\ErrorLog.txt');
    if Application.MessageBox(PChar('При попытке загрузить курсы валют с сайтов произошли ошибки.'+
      #13+'Протокол сохранен в файле c:\ErrorLog.txt'+
      #13+'Показать протокол?'), 'Внимание', mb_OkCancel)=mrOk then
        ShellExecute(0, nil, 'c:\ErrorLog.txt', nil, nil, 1);
    end;
end;

procedure TFormCheckRates.BitBtn1Click(Sender: TObject);
var i, j, k, RateColumn : integer;
  Equal : boolean;
begin
  RateColumn:=6;   

  if RateColumn <> 0 then
  begin
    for i:=1 to StringGridRates.RowCount-StringGridRates.FixedRows do
    begin
      if Trim(StringGridRates.Cells[RateColumn, i]) <> '' then
      begin
        with sp_SetNewRate, Parameters do
        begin
          ParamByName('@Name').Value:=StringGridRates.Cells[0, i];
          ParamByName('@ISOCode').Value:=StringGridRates.Cells[1, i];
          ParamByName('@NumberCode').Value:=StringGridRates.Cells[2, i];
          ParamByName('@Pieces').Value:=StringGridRates.Cells[3, i];
          ParamByName('@Rate').Value:=StringGridRates.Cells[RateColumn, i];
          ExecProc;
        end;
      end;
    end;  
  end;  
end;

end.
