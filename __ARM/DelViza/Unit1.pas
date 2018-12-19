unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, ADODB;

type
  TForm1 = class(TForm)
    ceOper: TEdit;
    Label1: TLabel;
    Button1: TButton;
    ADOConnection1: TADOConnection;
    qRez: TADOQuery;
    qRezid_rez: TIntegerField;
    ADOQueryTmp: TADOQuery;
    qOper: TADOQuery;
    qOperid_Oper: TAutoIncField;
    qOperid_business: TIntegerField;
    qOperOperVid: TIntegerField;
    qOperOperTypeIn: TBooleanField;
    qOperId_CurrencyOper: TIntegerField;
    qOperId_CurrencySys: TIntegerField;
    qOperid_Warehouse: TIntegerField;
    qOperKoeff: TIntegerField;
    qOperCheckDate: TDateTimeField;
    qDelV: TADOQuery;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    BooleanField1: TBooleanField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    DateTimeField1: TDateTimeField;
    qChWH: TADOQuery;
    qChWHCNT: TIntegerField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function GetMaxID(ASQL: String): integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
function GetID_Oper(AText: String): Variant;
var SL : TStringList;
    i : integer;
begin
  if Trim(AText) = '' then
  begin
    result := Null;
    Exit;
  end;
  try
    Result := StrToInt(AText);
  except
    Result := -1;
    SL := TStringList.Create;
    try
     SL.Text := Trim(StringReplace(AText, '-', #13 + #10, [rfReplaceAll, rfIgnoreCase]));
     for i := 1 to 3 do
     begin
       if i <= SL.Count then
       begin
         try
           Result := StrToInt(SL[SL.Count - i]);
           Break;
         except

         end;
       end;
       if SL.Count > 0 then
         SL.Delete(SL.Count - 1);
     end;
    finally
      SL.Free;
    end;
  end;
end;

function TForm1.GetMaxID(ASQL: String): integer;
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

procedure TForm1.Button1Click(Sender: TObject);
var AID : integer;
begin
  if trim(ceOper.Text) = '' then
  begin
    ShowMessage('А номер Пушкин вводить будет???');
    Exit;
  end;
  AID :=  GetID_Oper(trim(ceOper.Text));

  with qOper do
  begin
    Close;
    Parameters.ParamByName('id_Oper').Value := AID;
    Open;
  end;
  if qOperid_business.AsInteger <> 24 then
  begin
    begin
      Application.MessageBox('Это операция не по Флексу', 'нельзя снять визу', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  with qRez do
  begin
    Close;
    Parameters.ParamByName('id_Oper').Value := AID;
    Open;
    if qRezid_rez.AsInteger > 0 then
    begin
      Application.MessageBox('Это последняя парижская мода - снимать визу с операций, по которым баланс уже закрыт???', 'нельзя снять визу', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  if qOperOperVid.AsInteger = 1 then // Склад
  begin
    if qOperId_CurrencyOper.AsInteger <> 117 then
    begin
      Application.MessageBox('Складская операция не в валюте бизнеса', 'нельзя снять визу', MB_OK + MB_ICONERROR);
      Exit;
    end;
    if not qOperId_CurrencySys.IsNull and (qOperId_CurrencySys.AsInteger <> 117) and (qOperKoeff.AsInteger = 0) then
    begin
      Application.MessageBox('Складская операция зачтена не в валюте бизнеса', 'нельзя снять визу', MB_OK + MB_ICONERROR);
      Exit;
    end;

    with qChWH do
    begin
      Close;
      Parameters.ParamByName('id_Oper').Value := AID;
      Open;
      if qChWHCNT.AsInteger > 0 then
      begin
        if qOperOperTypeIn.AsBoolean then
          Application.MessageBox('Были отгрузки после этой операции', 'нельзя снять визу', MB_OK + MB_ICONERROR)
        else
          Application.MessageBox('Были приходы после этой операции', 'нельзя снять визу', MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
  end;
  if qOperOperVid.AsInteger = 2 then // финансы
  begin
    if qOperId_CurrencyOper.AsInteger <> 117 then
    begin
      Application.MessageBox('Финансовая операция не в валюте бизнеса', 'нельзя снять визу', MB_OK + MB_ICONERROR);
      Exit;
    end;
    
    if not qOperId_CurrencySys.IsNull and (qOperId_CurrencySys.AsInteger <> 117) and (qOperKoeff.AsInteger = 0) then
    begin
      Application.MessageBox('Финансовая операция зачтена не в валюте бизнеса', 'нельзя снять визу', MB_OK + MB_ICONERROR);
      Exit;
    end;

  end;
  if qOperOperVid.AsInteger = 4 then // Зачет
  begin
    if qOperId_CurrencyOper.AsInteger <> 117 then
    begin
      Application.MessageBox('Зачет не в валюте бизнеса', 'нельзя снять визу', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;

  with qDelV do
  begin
    Close;
    Parameters.ParamByName('id_Oper').Value := AID;
    ExecSQL;
  end;
end;

end.
