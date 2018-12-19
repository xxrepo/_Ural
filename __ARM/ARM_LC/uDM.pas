unit uDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,ToolEdit,
  Db, DBClient, ImgList, MConnect, SConnect,
  registry, inifiles, foMyFunc, uMeCrpt, RxLookup, RxDBComb, DBGridEh;

const  SRegPath = '\SOFTWARE\FO\LcMng';
       colorNonViza = clWindowText;

type

  TBsnObj = class (TDBObj);

  TDM = class(TDataModule)
    rsCA: TSocketConnection;
    ilMenu: TImageList;
    cdsBsnByFunc: TClientDataSet;
    cdsBsnByFuncid_business: TIntegerField;
    cdsBsnByFuncName: TStringField;
    cdsBusinessData: TClientDataSet;
    cdsOperFin: TClientDataSet;
    cdsOperFinid_Oper: TIntegerField;
    cdsOperFinid_OperParent: TIntegerField;
    cdsOperFinid_old_Oper: TIntegerField;
    cdsOperFinDateCreate: TDateTimeField;
    cdsOperFinid_LC_Oper: TIntegerField;
    cdsOperFinOperVid: TIntegerField;
    cdsOperFinid_UserCreator: TIntegerField;
    cdsOperFinCreatorFIO: TStringField;
    cdsOperFinid_business: TIntegerField;
    cdsOperFinId_CurrencyBsn: TIntegerField;
    cdsOperFinBusinessName: TStringField;
    cdsOperFinBusinessNum: TStringField;
    cdsOperFinDateLocal: TDateTimeField;
    cdsOperFinCorrect: TBooleanField;
    cdsOperFinOperTypeIn: TBooleanField;
    cdsOperFinId_CurrencyOper: TIntegerField;
    cdsOperFinCurrencyOperName: TStringField;
    cdsOperFinCurrencyOperShortName: TStringField;
    cdsOperFinPriceOper: TFloatField;
    cdsOperFinRateOper: TFloatField;
    cdsOperFinId_CurrencySys: TIntegerField;
    cdsOperFinCurrencySysName: TStringField;
    cdsOperFinCurrencySysShortName: TStringField;
    cdsOperFinSummSys: TFloatField;
    cdsOperFinRateSys: TFloatField;
    cdsOperFinid_Acc: TIntegerField;
    cdsOperFinid_Warehouse: TIntegerField;
    cdsOperFinid_Manufact: TIntegerField;
    cdsOperFinSrcName: TStringField;
    cdsOperFinSrcID_Main: TIntegerField;
    cdsOperFinid_Repr: TIntegerField;
    cdsOperFinid_Acc_Ext: TIntegerField;
    cdsOperFinid_Warehouse_Ext: TIntegerField;
    cdsOperFinid_Manufact_Ext: TIntegerField;
    cdsOperFinReprName: TStringField;
    cdsOperFinReprID_Main: TIntegerField;
    cdsOperFinId_CurrencyInv: TIntegerField;
    cdsOperFinRateInv: TFloatField;
    cdsOperFinCurrencyInvName: TStringField;
    cdsOperFinCurrencyInvShortName: TStringField;
    cdsOperFinKoeff: TIntegerField;
    cdsOperFinKoeffName: TStringField;
    cdsOperFinCheckDate: TDateTimeField;
    cdsOperFinCheckerFIO: TStringField;
    cdsOperFinid_FormalDistrib: TIntegerField;
    cdsOperFinFormalDistribName: TStringField;
    cdsOperFinid_FuncDistrib: TIntegerField;
    cdsOperFinFuncDistribName: TStringField;
    cdsOperFinDeleted: TBooleanField;
    cdsOperFinid_ContrAgent: TIntegerField;
    cdsOperFinContrAgentName: TStringField;
    cdsOperFinid_CAGroup: TIntegerField;
    cdsOperFinSummOper: TFloatField;
    cdsOperFinTypeName: TStringField;
    cdsOperFinHasViza: TBooleanField;
    cdsOperFinOperState: TIntegerField;
    cdsOperFinHidedOper: TBooleanField;
    cdsOperFinRateMain: TFloatField;
    cdsOperFinid_Repr_Ex: TIntegerField;
    cdsOperFinid_DocType: TIntegerField;
    cdsOperFinImp_PayBasic: TStringField;
    cdsOperFinAccInv_PayAssignment: TStringField;
    cdsOperFinContract: TStringField;
    cdsOperFinOperCrnName: TStringField;
    cdsOperFinBlocked: TBooleanField;
    cdsOperFinCurrencyBsnName: TStringField;
    cdsOperFinOpComment: TStringField;
    cdsOperFinRealDataCreate: TDateTimeField;
    cdsOperFinOperTypeSIGN: TIntegerField;
    cdsOperFinHasChild: TIntegerField;
    cdsOperFinDig1: TFloatField;
    cdsOperFinDig2: TFloatField;
    cdsOperFinDig3: TFloatField;
    cdsOperFinDig4: TFloatField;
    cdsOperFinDig5: TFloatField;
    cdsOperFinDig6: TFloatField;
    cdsOperFinDig7: TFloatField;
    cdsOperFinDig8: TFloatField;
    cdsOperFinDig9: TFloatField;
    cdsOperFinDig10: TFloatField;
    cdsOperFinDig11: TFloatField;
    cdsOperFinDig12: TFloatField;
    cdsOperFinDig13: TFloatField;
    cdsOperFinDig14: TFloatField;
    cdsOperFinDig15: TFloatField;
    cdsOperFinStr1: TStringField;
    cdsOperFinStr2: TStringField;
    cdsOperFinStr3: TStringField;
    cdsOperFinStr4: TStringField;
    cdsOperFinStr5: TStringField;
    cdsOperFinStr6: TStringField;
    cdsOperFinStr7: TStringField;
    cdsOperFinStr8: TStringField;
    cdsOperFinStr9: TStringField;
    cdsOperFinStr10: TStringField;
    cdsOperFinStr11: TStringField;
    cdsOperFinStr12: TStringField;
    cdsOperFinStr13: TStringField;
    cdsOperFinStr14: TStringField;
    cdsOperFinStr15: TStringField;
    cdsOperFinOperVidName: TStringField;
    cdsOperFinis_Mirr: TBooleanField;
    cdsOperFinid_Acc_Group: TIntegerField;
    cdsOperFinid_Warehouse_Group: TIntegerField;
    cdsOperFinid_Manufact_Group: TIntegerField;
    cdsOperFinOperNum: TStringField;
    cdsOperFinid_Replicator: TIntegerField;
    cdsOperFinVatIn: TBooleanField;
    cdsOperWare: TClientDataSet;
    cdsOperWareid_OperWare: TAutoIncField;
    cdsOperWareid_Oper: TIntegerField;
    cdsOperWareid_Measure: TIntegerField;
    cdsOperWareid_Goods: TIntegerField;
    cdsOperWareMeasureName: TStringField;
    cdsOperWareRealKoef: TFloatField;
    cdsOperWareAmountOperBaseMS: TFloatField;
    cdsOperWareWareName: TStringField;
    cdsOperWareWareID_Main: TIntegerField;
    cdsOperWareSummOper2: TFloatField;
    cdsOperWareNumb: TIntegerField;
    cdsOperWareAmountOper: TFloatField;
    cdsOperWarePriceOper: TFloatField;
    cdsOperWareSummSys: TFloatField;
    cdsOperWarePriceInv: TFloatField;
    cdsOperWareSS: TAggregateField;
    cdsDList: TClientDataSet;
    cdsDListid_OrgDet: TAutoIncField;
    cdsDListid_Doc_Org: TIntegerField;
    cdsDListVal: TStringField;
    cdsDListDT: TIntegerField;
    cdsDListDefDet: TBooleanField;
    cdsOperWare201: TClientDataSet;
    cdsOperWare201id_OperWare: TAutoIncField;
    cdsOperWare201id_Oper: TIntegerField;
    cdsOperWare201AmountOper: TFloatField;
    cdsOperWare201id_Measure: TIntegerField;
    cdsOperWare201PriceOper: TFloatField;
    cdsOperWare201SummSys: TFloatField;
    cdsOperWare201PriceInv: TFloatField;
    cdsOperWare201id_Goods: TIntegerField;
    cdsOperWare201MeasureName: TStringField;
    cdsOperWare201RealKoef: TFloatField;
    cdsOperWare201AmountOperBaseMS: TFloatField;
    cdsOperWare201WareName: TStringField;
    cdsOperWare201WareID_Main: TIntegerField;
    cdsOperWare201AmountOperBaseMS_2: TFloatField;
    cdsOperWare201AmountOperBaseMS_1: TFloatField;
    cdsOperWare201id_Raw: TIntegerField;
    cdsOperWare201id_ExtRaw: TIntegerField;
    cdsOperWare201id_Service: TIntegerField;
    cdsOperWare201SummOper_2: TFloatField;
    cdsOperWare201SummSys_2: TFloatField;
    cdsOperWare201PriceInv_2: TFloatField;
    cdsOperWare201DMName: TStringField;
    cdsOperWare201SummOper_1: TFloatField;
    cdsOperWare201SummSys_1: TFloatField;
    cdsOperWare201PriceInv_1: TFloatField;
    cdsOperWare201delta: TFloatField;
    cdsOperWare201SummOper2: TFloatField;
    cdsOperWare201Numb: TIntegerField;
    AggregateField1: TAggregateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure rsCAAfterConnect(Sender: TObject);
  private

    FIDUser : Variant;
    FUserName, FPassword : String;
    dbName, FFullFio : string;
    FNeedTerminate : boolean;
    function rsDoLogin: boolean;
  public
    FBsnList : TList;
    FisPPP, FFF201 : boolean;
    host, port : string;
    PIN, FMayRez: boolean;
    Capt : Variant;
    ShowComm: boolean;
    procedure CheckExcel;
    procedure GetBsnList(AList : TList; AIDUser : integer; AUID : Variant);
    property NeedTerminate : boolean read FNeedTerminate;
    property UserName : String read FUserName;
    property FullFIO : String read FFullFio;
    property IDUser : Variant read FIDUser;

    function GetBusinessName(Id: Variant): string;
    function GetBsnNum(Id: Variant): string;

    function CheckUserRights(id_Func: Integer; id_Business: OleVariant): boolean;
    procedure Rights_GetUserRights(id_Func: Integer; id_Business: OleVariant; NeedRaise: boolean = true);
    function GetRBLSumm(ASumm, AID: Variant): Variant;
    procedure cdsDocCurGetListOpen(CDS: TClientDataSet;
      ALC: TRxDBLookupCombo; id_business, id_Doc: integer;
      id_DocCur: Variant);
    procedure CDStoSL(id_Doc: integer; CB: TRxDBComboBox; DT,
      id_Doc_Org: Variant);
    procedure TrimCDS(AmountField: TField);
    procedure ColumnGetData(ACol: TColumnEh; id_Doc_Org, id_Doc: integer);
    function GetDefOrg(id_business: Integer; var id_Doc_Org, OrgName, INN,
      KPP, Chif, Buh, OKPO, OKPD, Address: OleVariant): boolean;
    procedure EditBookmark(ActiveDocument: Variant; AName, AText: String);
  end;

procedure CheckEmptyControl(Handle : hWnd; AWC : TWinControl);
var
  DM: TDM;

  ShowSplash : boolean;
  AReadOneObj : boolean;

  HideFin: boolean;
  HideWH: boolean;
  HideMnf: boolean;
  HideCA: boolean;
  HideWare: boolean;
  HideAllWares, FVatIn, FOpenDay, FAP, FArcOptim: boolean;

  implementation

uses LogInUnit, uSettings;

{$R *.DFM}
procedure CheckEmptyControl(Handle : hWnd; AWC : TWinControl);
var B : boolean;
    S : String;
begin
  if AWC is TCustomDateEdit then
    b := TCustomDateEdit(AWC).Date = 0
  else
  begin
    S := TWinHackControl(AWC).Text;
    B := trim(S) = '';
  end;
  if B then
  begin
    Windows.SetFocus(TWinHackControl(AWC).Handle);
    MessageBox(Handle, 'Введены не все данные. Заполните все неоходимые поля', 'Введены не все данные', MB_OK + MB_ICONERROR);
    Abort;
  end;
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
    SL : TStringList;
begin
  FMayRez := true;
  PIN := true;
  FFF201 := true;
  ShowComm := false;
  
  S := ExtractFilePath(ParamStr(0)) + 'RezKey.acs';
  if  FileExists(S) then
  begin
    SL := TStringList.Create;
    try
      SL.Text := FileToStr(S);
      with SL do
      begin
        FMayRez := Values['Val'] = 'gopapopa26';
      end;
    finally
      SL.Free;
    end;
  end;
  FMayRez := true;

  Capt := Null;
  FBsnList := TList.Create;
  try
    Len := 256;
    Buffer := AllocMem(Len);
    GetComputerName(Buffer, Len);
    CmpName := StrPas(Buffer);
  finally
    FreeMem(Buffer, Len);
  end;
// ****************************************************************************
  S := Application.ExeName;
  Delete(S, Length(S) - 2, 3);
  S := S + 'ini';
  if  FileExists(S) then
  begin
    IniFile := TIniFile.Create(S);
    with IniFile do
    begin
      host := ReadString('AppServer', 'HostName', 'OVK');
      port := ReadString('AppServer', 'Port', '211');
      dbName := ReadString('AppServer', 'DBName', '');
      if ValueExists('AppServer', 'Capt') then
        Capt := ReadString('AppServer', 'Capt', '');
    end;
    rsCA.Host := host;
    IniFile.Free;
  if Capt <> Null then
  begin
    Application.Title :=DM.Capt ;
  end;

  end                                                                             
  else
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
    if Reg.OpenKey(SRegPath, false) then
    begin
      if Reg.ValueExists('UserID') then FUserName := Reg.ReadString('UserID');
      GetRegVal(Reg, 'ShowSplash', true, ShowSplash);
      GetRegVal(Reg, 'ReadOneObj', true, AReadOneObj);

      GetRegVal(Reg, 'HideFin', false, HideFin);
      GetRegVal(Reg, 'HideWH', false, HideWH);
      GetRegVal(Reg, 'HideMnf', false, HideMnf);
      GetRegVal(Reg, 'HideCA', false, HideCA);
      GetRegVal(Reg, 'HideWare', false, HideWare);
      GetRegVal(Reg, 'HideAllWares', false, HideAllWares);
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  FNeedTerminate := true;
  FNeedTerminate := not rsDoLogin;
end;

function TDM.rsDoLogin: boolean;
var LogInForm : TLogInForm;
    Reg: TRegistry;
    N : integer;
    isDir : integer;
    b1, b2, b3 : boolean;
begin
  FisPPP := false;
  N := 0;
  Result := false;
  LogInForm := TLogInForm.Create(Self);
  LogInForm.edUserID.Text := FUserName;
  Screen.Cursor := crSQLWait;
  try
    rsCA.Host := host;
    rsCA.Port := StrToInt(port);
    repeat
      if LogInForm.ShowModal = mrCancel then
      begin
        rsCA.Close;
        Exit;
      end;
    rsCA.Open;
      FUserName := LogInForm.UserID;
      FPassword := LogInForm.Password;
      if dbName <> '' then
        rsCA.AppServer.LC_SetBaseName(dbName);
      try
        b1 := rsCA.AppServer.DoLogin(FUserName, FPassword) <> 1;
      except
        b1 := true;
      end;
      
      if b1 then
      begin

        ShowMessage('Неверное имя или пароль');
        inc(N);
      end
      else
      begin
        FFullFio := rsCA.AppServer.FIO;
        FIDUser := rsCA.AppServer.id_User;
        FisPPP := rsCA.AppServer.isPPP;
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
        GetBsnList(FBsnList, FIDUser, Null);
      end;
      if N = 3 then
      begin
        Application.MessageBox('Вы трижды неверно ввели пароль. Число попыток исчерпано. Обратитесь к админисратору системы', 'В доступе отказано!!!', MB_ICONERROR + MB_OK);
        Break;
      end;
    until Result = true;                           
  except
    on E : Exception do
      Raise Exception.Create('Произошла ошибка при соединении с сервером. ' + #13 + #10 +
                             E.Message + #13 + #10 +
                             'host=' + host + ' dbName=' + dbName +  #13 + #10 +
                             'Программа будет закрыта.');
  end;
    Screen.Cursor := crDefault;
 //   dsWhoIAm.Close;
    LogInForm.Free;
end;


procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  while FBsnList.Count > 0 do
  begin
    TObject(FBsnList[FBsnList.Count - 1]).Free;
    FBsnList.Delete(FBsnList.Count - 1);
  end;
  FBsnList.Free;
end;

procedure TDM.GetBsnList(AList : TList; AIDUser : integer; AUID : Variant);
var Obj : TBsnObj;
begin
  AList.Clear;
  with cdsBsnByFunc do
  begin
    Close;
    try
      Params.ParamByName('@id_User').Value := AIDUser;
      Params.ParamByName('@UID').Value := AUID;
      Open;
      First;
      while not Eof do
      begin
        Obj := TBsnObj.Create;
        Obj.ID := FieldByName('id_business').AsInteger;
        Obj.Name := FieldByName('Name').AsString;
        AList.Add(Obj);
        Next;
      end;
    finally
      Close;
    end;
  end;
end;


function TDM.GetBsnNum(Id: Variant): string;
var
  ID2 : Variant;
  AName: OleVariant;
begin
  ID2 := id;
  if DM.rsCA.AppServer.BsnNumByID(Id2, AName) = 1 then
    Result := AName
  else
    Result := '';
end;

function TDM.GetBusinessName(Id: Variant): string;
var
  ID2 : Variant;
  AName: OleVariant;
begin
  ID2 := id;
  if DM.rsCA.AppServer.BsnByID(Id2, AName) = 1 then
    Result := AName
  else
    Result := '';
end;

function TDM.CheckUserRights(id_Func: Integer; id_Business: OleVariant) : boolean;
begin
  Result := true;
  try
    Result := DM.rsCA.AppServer.Rights_GetUserRights(id_Func, id_Business, FIDUser) >= 1;
  except
    on E : Exception do
    begin
      Result := false;
      if FUserName = '777' then
        raise Exception.Create('Ошибка при чтении прав - ' + E.Message);
    end;
  end;
end;

procedure TDM.Rights_GetUserRights(id_Func: Integer; id_Business: OleVariant; NeedRaise : boolean);
var NNN : OleVariant;
begin
  if not CheckUserRights(id_Func, id_Business) then
  begin
    NNN := DM.rsCA.AppServer.Rights_GetFuncName(id_Func);
    raise Exception.Create('У вас нет прав на операцию "' + VarToStr(NNN) + '"');
  end;
end;

procedure TDM.CheckExcel;
begin

end;

procedure TDM.rsCAAfterConnect(Sender: TObject);
begin
  tag := 0;
end;


function TDM.GetDefOrg(id_business: Integer; var id_Doc_Org, OrgName, INN,
  KPP, Chif, Buh, OKPO, OKPD, Address: OleVariant): boolean;
begin
  Result := false;
  Result := rsCA.AppServer.GetDefOrg(id_business, id_Doc_Org, OrgName, INN,
  KPP, Chif, Buh, OKPO, OKPD, Address) = 1;
end;

function TDM.GetRBLSumm(ASumm, AID : Variant): Variant;
var AName, AShortName, RateRBL: Variant;
begin
  Result := Null;
  if AID <> Null then
  begin
    if DM.rsCA.AppServer.CurByID(AID, AName, AShortName, RateRBL) = 1 then
      Result := RateRBL * ASumm;
  end;
end;

procedure TDM.cdsDocCurGetListOpen(CDS : TClientDataSet; ALC : TRxDBLookupCombo; id_business, id_Doc: integer;
                            id_DocCur : Variant);
begin
  with CDS do
  begin
    Close;
    Params.ParamByName('@id_bsn').Value := id_business;
    Open;
    Locate('id_DocCur', id_DocCur, [loCaseInsensitive, loPartialKey]);
  end;
  with ALC.DataSource.DataSet do
  begin
    if Active and (id_Doc = -1) then
    begin
      Edit;
      FieldByName(ALC.DataField).Value := CDS.fieldByName('id_DocCur').Value;
      Post;
    end;
  end;
end;



procedure TDM.CDStoSL(id_Doc : integer; CB: TRxDBComboBox; DT, id_Doc_Org : Variant);
var B : boolean;
    V : Variant;
begin
  V := Null;
  B := CB.DataSource.DataSet.Active;
  with cdsDList do
  begin
    Close;
    Params.ParamByName('@DT').AsInteger := DT;
    Params.ParamByName('@id_Doc_Org').Value := id_Doc_Org;
    Open;
    try
      First;
      CB.items.Clear;
      V := cdsDListVal.AsVariant;
      while not Eof do
      begin
        CB.items.Add(cdsDListVal.AsString);
        if B and (id_Doc = -1) and cdsDListDefDet.AsBoolean then
        begin
          CB.DataSource.DataSet.Edit;
          CB.Field.Value := cdsDListVal.AsVariant;
          CB.DataSource.DataSet.Post;
          B := false;
        end;
        Next;
      end;
    finally
      Close;
    end;
  end;
  if B and (id_Doc = -1) and (CB.itemindex = -1) and (CB.Field.isNull) then
  begin
    CB.DataSource.DataSet.Edit;
    CB.Field.Value := V;
    CB.DataSource.DataSet.Post;
  end;
end;

procedure TDM.TrimCDS(AmountField : TField);
begin
  with AmountField.DataSet do
  begin
    Last;
    while not Bof do
    begin
      if AmountField.IsNull or (ABS(AmountField.AsFloat) < 0.005) then
        Delete
      else
        Prior;
    end;
  end;

end;

procedure TDM.ColumnGetData(ACol : TColumnEh; id_Doc_Org, id_Doc: integer);
var B : boolean;
    V : Variant;
begin
  B := ACol.Field.DataSet.Active;
  V := Null;
  with cdsDList do
  begin
    Close;
    Params.ParamByName('@DT').AsInteger := 1;
    Params.ParamByName('@id_Doc_Org').Value := id_Doc_Org;
    Open;
    try
      First;
      ACol.PickList.Clear;
      V := cdsDListVal.AsVariant;
      while not Eof do
      begin
        ACol.PickList.Add(cdsDListVal.AsString);
        if B and (id_Doc = -1) and cdsDListDefDet.AsBoolean then
        begin
          V := cdsDListVal.AsVariant;
        end;
        Next;
      end;
    finally
      Close;
    end;
  end;
  if B and (id_Doc = -1) {and (ACol.Field.AsString = '')} then
  begin
    with ACol.Field.DataSet do
    begin
      First;
      DisableControls;
      while not Eof do
      begin
        Edit;
        if ACol.Field.IsNull then
          ACol.Field.Value := V;
        Post;
        
        Next;
      end;
      First;
      EnableControls;
    end;
  end;
end;

procedure TDM.EditBookmark(ActiveDocument: Variant; AName, AText: String);
var V : Variant;
begin
  try
    if ActiveDocument.bookmarks.Exists(AName) then
    begin
      V := ActiveDocument.bookmarks.item(AName);
      V.Select;
      V.Application.Selection.text := AText;
    end;
  except

  end;
end;
end.
