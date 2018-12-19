unit uRDM;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, CurrServer_TLB, StdVcl, Db, ADODB, Provider, MtUPDPrv, inifiles;

type
  TDM_Cur = class(TRemoteDataModule, I_Cur)
    ADOConnection1: TADOConnection;
    spUrl: TADOStoredProc;
    spRates: TADOStoredProc;
    spUrlId_URL: TAutoIncField;
    spUrlName: TStringField;
    spUrlURL: TStringField;
    spUrlColName: TSmallintField;
    spUrlColISO: TSmallintField;
    spUrlColCode: TSmallintField;
    spUrlColRate: TSmallintField;
    spUrlColPieces: TSmallintField;
    dsUrl: TDataSetProvider;
    dsRates: TSQLUpdateDSProvider;
    spUrlUseTable: TSmallintField;
    spRatesId_Currency: TIntegerField;
    spRatesName: TStringField;
    spRatesISOCode: TStringField;
    spRatesNumberCode: TStringField;
    spRatesValue: TIntegerField;
    spRatesRate: TFloatField;
    spRatesid_URL: TIntegerField;
    spRatesNewRate: TFloatField;
    spCur: TADOStoredProc;
    spCurId_Currency: TAutoIncField;
    spCurName: TStringField;
    spCurShortName: TStringField;
    spCurISOCode: TStringField;
    spCurNumberCode: TStringField;
    spCurFastAccess: TBooleanField;
    spCurValue: TIntegerField;
    spCurRate: TFloatField;
    spCurAvForPay: TBooleanField;
    spCurBase: TBooleanField;
    spCurLastUpdated: TBytesField;
    spCurId_URL: TIntegerField;
    dsCur: TDataSetProvider;
    spCurProp: TADOStoredProc;
    dsCurProp: TDataSetProvider;
    spCurPropId_Currency: TAutoIncField;
    spCurPropName: TStringField;
    spCurPropShortName: TStringField;
    spCurPropISOCode: TStringField;
    spCurPropNumberCode: TStringField;
    spCurPropFastAccess: TBooleanField;
    spCurPropValue: TIntegerField;
    spCurPropRate: TFloatField;
    spCurPropAvForPay: TBooleanField;
    spCurPropId_URL: TIntegerField;
    spCurPropBase: TBooleanField;
    spCurPropLastUpdated: TBytesField;
    spCurPropURLName: TStringField;
    spCurPropURL: TStringField;
    ADOStoredProc1: TADOStoredProc;
    SQLUpdateDSProvider1: TSQLUpdateDSProvider;
    spWhoIAm: TADOStoredProc;
    spWhoIAmid_user: TAutoIncField;
    spWhoIAmLogin: TStringField;
    spWhoIAmFirstName: TStringField;
    spWhoIAmLastName: TStringField;
    spWhoIAmMiddleName: TStringField;
    spWhoIAmDisabled: TBooleanField;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure SQLUpdateDSUpdateError(Sender: TObject;
      DataSet: TClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
  private
    Fid_User : Variant;
    FFullFio : String;
    
    FBaseName : String;
    FUserName, FPassword: String;
    function DoLogin(UserName, Password: OleVariant): Integer; safecall;
    procedure LogMessage(Message: String; EventType: DWord = 1; Category: Word = 0; ID: DWord = 0);
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function CurrencyAdd(AName, ShortName, ISOCode, NumberCode: OleVariant;
      FastAccess: WordBool; AValue: Integer; Rate: Single;
      AvForPay: WordBool; Id_URL: OleVariant): Integer; safecall;
    function CurrencyEdit(Id_Currency: Integer; AName, ShortName, ISOCode,
      NumberCode: OleVariant; FastAccess: WordBool; AValue: Integer;
      Rate: Single; AvForPay: WordBool; Id_URL: OleVariant): Integer;
      safecall;
  public
    { Public declarations }
  end;

implementation

uses uSvc;

{$R *.DFM}

class procedure TDM_Cur.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

function TDM_Cur.CurrencyAdd(AName, ShortName, ISOCode,
  NumberCode: OleVariant; FastAccess: WordBool; AValue: Integer;
  Rate: Single; AvForPay: WordBool; Id_URL: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'Crn_CurrencyAdd';
      Parameters.Refresh;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@ShortName').Value := ShortName;
      Parameters.ParamByName('@ISOCode').Value := ISOCode;
      Parameters.ParamByName('@NumberCode').Value := NumberCode;
      Parameters.ParamByName('@FastAccess').Value := FastAccess;
      Parameters.ParamByName('@Value').Value := AValue;
      Parameters.ParamByName('@Rate').Value := Rate;
      Parameters.ParamByName('@AvForPay').Value := AvForPay;
      Parameters.ParamByName('@Id_URL').Value := Id_URL;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
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

function TDM_Cur.CurrencyEdit(Id_Currency: Integer; AName, ShortName, ISOCode,
  NumberCode: OleVariant; FastAccess: WordBool; AValue: Integer;
  Rate: Single; AvForPay: WordBool; Id_URL: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'Crn_CurrencyEdit';
      Parameters.Refresh;
      Parameters.ParamByName('@Id_Currency').Value := Id_Currency;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@ShortName').Value := ShortName;
      Parameters.ParamByName('@ISOCode').Value := ISOCode;
      Parameters.ParamByName('@NumberCode').Value := NumberCode;
      Parameters.ParamByName('@FastAccess').Value := FastAccess;
      Parameters.ParamByName('@Value').Value := AValue;
      Parameters.ParamByName('@Rate').Value := Rate;
      Parameters.ParamByName('@AvForPay').Value := AvForPay;
      Parameters.ParamByName('@Id_URL').Value := Id_URL;

      ExecProc;
      Result := 1;
      Close;
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

procedure TDM_Cur.LogMessage(Message: String; EventType: DWord;
  Category: Word; ID: DWord);
begin
  ural_Curr.LogMessage(Message, EventType, Category, ID);
end;

procedure TDM_Cur.RemoteDataModuleCreate(Sender: TObject);
var Buffer : PChar;
    Len : DWORD;
    CmpName : String;
    i : integer;
    
    IniFile : TIniFile;
    S : String;
begin
  Fid_User := Null;
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TSQLUpdateDSProvider) and (Assigned(TSQLUpdateDSProvider(Components[i]))) then
      TSQLUpdateDSProvider(Components[i]).OnUpdateError := SQLUpdateDSUpdateError;
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
  FBaseName := 'OVK';
  FUserName := 'sa';
  FPassword := '1';
  
  S := ParamStr(0);
  S := ExpandFileName(S);
  Delete(S, Length(S) - 2, 3);
  S := S + 'ini';
  if  FileExists(S) then
  begin
    IniFile := TIniFile.Create(S);
    with IniFile do
    begin
      FBaseName := ReadString('Base', 'DB', 'OVK');
      FUserName := ReadString('Base', 'UserName', 'sa');
      FPassword := ReadString('Base', 'Password', '1');
    end;
    IniFile.Free;
  end;
// ****************************************************************************
end;

function TDM_Cur.DoLogin(UserName, Password: OleVariant): Integer;
begin
  with ADOConnection1 do
  begin
   Connected := false;
   ConnectionString := 'Provider=SQLOLEDB.1;Password="' +
     String(FPassword) + '";Persist Security Info=True;User ID=' +
     String(FUserName) + ';Initial Catalog=ACS_MBase;Data Source=' + FBaseName + 
                        ';Use Procedure for Prepare=1;Auto Translate=True;Application Name=' + Name + '4.0;Packet Size=4096;';
   try                
     Connected := true;
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
           Exit; 
         if FieldByName('Disabled').AsBoolean then
           raise Exception.Create('Запрещен вход пользователю ' + UserName);

         Fid_User := FieldByName('id_User').AsVariant;
         FFullFio := FieldByName('LastName').AsString + ' ' + FieldByName('FirstName').AsString + ' ' + FieldByName('MiddleName').AsString;
         Result := 1;
       finally
         Close;
       end;
     end;  
   except
     on E : Exception do
     begin
       Result := 26;
       LogMessage('DoLogin, ' + FUserName+ ' '  + FPassword + ' '  + E.Message, EVENTLOG_ERROR_TYPE, 1, 1);
       raise Exception.Create(E.Message);
     end;
   end;
 end;

end;

procedure TDM_Cur.SQLUpdateDSUpdateError(Sender: TObject;
  DataSet: TClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
//*
end;

initialization
  TComponentFactory.Create(ComServer, TDM_Cur,
    Class_DM_Cur, ciMultiInstance, tmApartment);
end.
