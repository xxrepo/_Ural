unit frOperCommon;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ExtCtrls, StdCtrls, Mask, DBCtrls, foMyFunc, Buttons;

type
  TfOperCommon = class(TFrame)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    cdsOperCmn: TClientDataSet;
    cdsOperCmnid_OperCommon: TAutoIncField;
    cdsOperCmnid_Replicator: TIntegerField;
    cdsOperCmnReplicatorShortName: TStringField;
    cdsOperCmnid_UserCreator: TIntegerField;
    cdsOperCmnCreatorFIO: TStringField;
    cdsOperCmnid_Manager: TIntegerField;
    cdsOperCmnManagerFIO: TStringField;
    cdsOperCmnid_business: TIntegerField;
    cdsOperCmnBusinessName: TStringField;
    cdsOperCmnBusinessNum: TStringField;
    cdsOperCmnDateCreate: TDateTimeField;
    cdsOperCmnDateLocal: TDateTimeField;
    cdsOperCmnOperNumber: TIntegerField;
    cdsOperCmnCorrect: TBooleanField;
    cdsOperCmnOperTypeIn: TBooleanField;
    cdsOperCmnId_CurrencyOper: TIntegerField;
    cdsOperCmnCurrencyOperName: TStringField;
    cdsOperCmnCurrencyOperShortName: TStringField;
    cdsOperCmnAmountOper: TFloatField;
    cdsOperCmnPriceOper: TFloatField;
    cdsOperCmnRateOper: TFloatField;
    cdsOperCmnId_CurrencySys: TIntegerField;
    cdsOperCmnCurrencySysName: TStringField;
    cdsOperCmnCurrencySysShortName: TStringField;
    cdsOperCmnSummSys: TFloatField;
    cdsOperCmnRateSys: TFloatField;
    cdsOperCmnid_Repr: TIntegerField;
    cdsOperCmnReprName: TStringField;
    cdsOperCmnCheckDate: TDateTimeField;
    cdsOperCmnid_UserChecker: TIntegerField;
    cdsOperCmnCheckerFIO: TStringField;
    cdsOperCmnKoeff: TIntegerField;
    cdsOperCmnOld_OperTypeIn: TIntegerField;
    cdsOperCmnOld_Id_CurrencyOper: TIntegerField;
    cdsOperCmnOld_CurrencyOperName: TStringField;
    cdsOperCmnOld_CurrencyOperShortName: TStringField;
    cdsOperCmnOld_AmountOper: TFloatField;
    cdsOperCmnOld_PriceOper: TFloatField;
    cdsOperCmnOld_RateOper: TFloatField;
    cdsOperCmnOld_Id_CurrencySys: TIntegerField;
    cdsOperCmnOld_CurrencySysName: TStringField;
    cdsOperCmnOld_CurrencySysShortName: TStringField;
    cdsOperCmnOld_SummSys: TFloatField;
    cdsOperCmnOld_RateSys: TFloatField;
    dsOperCmn: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    FID_Common : integer;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    procedure Initialize(ID_Common : integer; AOper: TOper; AReadOnly : boolean = false);
  end;

implementation

uses uDM;

{$R *.DFM}

{ TfOperCommon }


{ TfOperCommon }

function TfOperCommon.CheckData: boolean;
begin

end;

function TfOperCommon.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsOperCmn;
  Result := true;
  UpdateData;
  if (FID_Common <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'Name', 'Наименование', SL);
        CompareField(CDS, 'Disabled', 'Заблокировать', SL, false);
        CompareField(CDS, 'CurrencyName', 'Валюта', SL);

        CompareField(CDS, 'Addr', 'адрес', SL, false);
        CompareField(CDS, 'Descr', 'описание', SL, false);
      end;
//      if cdsReprComment.ChangeCount > 0 then
//        SL.Add('изменены комментарии');

      if SL.Count > 0 then
        Result := Application.MessageBox(PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfOperCommon.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TfOperCommon.Destroy;
begin
  inherited;

end;

procedure TfOperCommon.Initialize(ID_Common: integer; AOper: TOper;
  AReadOnly: boolean);
begin
  FID_Common := ID_Common;
  with cdsOperCmn do
  begin
    Close;
    Params.ParamByName('@id_OperCommon').AsInteger := FID_Common;
    Open;
  end;
end;

function TfOperCommon.SaveProp: boolean;
var OldCursor : TCursor;
    id_ContrAgent: OleVariant;
    isJur, Disabled: WordBool;
    AName, FirstName, MiddleName, LastName, Id_Currency, Addr, Descr: OleVariant;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
 {   AName := cdsReprPropName.AsString;
    id_ContrAgent := cdsReprProp.FieldByName('id_ContrAgent').Value;

    Disabled := cdsReprProp.FieldByName('Disabled').AsBoolean;
    isJur := cdsReprProp.FieldByName('isJur').AsBoolean;
    Id_Currency := cdsReprProp.FieldByName('Id_Currency').Value;

    AName := Null;
    FirstName := Null;
    MiddleName := Null;
    LastName := Null;
    
    if cdsReprProp.FieldByName('isJur').AsBoolean then
    begin
      AName := cdsReprProp.FieldByName('Name').Value;
    end
    else
    begin
      FirstName := cdsReprProp.FieldByName('FirstName').Value;
      MiddleName := cdsReprProp.FieldByName('MiddleName').Value;
      LastName := cdsReprProp.FieldByName('LastName').Value;
    end;

    if trim(cdsReprProp.FieldByName('Addr').AsString) = '' then
      Addr := Null
    else
      Addr := cdsReprProp.FieldByName('Addr').Value;
      
    if trim(cdsReprProp.FieldByName('Descr').AsString) = '' then
      Descr := Null
    else
      Descr := cdsReprProp.FieldByName('Descr').Value;

    if Fid_Repr = -1 then // Добавляется
    begin
//      Vip := cdsGetClientProp.FieldByName('Vip').AsBoolean;
  //    RealAddr := cdsGetClientProp.FieldByName('RealAddr').Value;
      Fid_Repr := DM.rsCA.AppServer.ReprAdd(id_ContrAgent, isJur, AName, FirstName, MiddleName, LastName, Id_Currency, Disabled, Addr, Descr);

      if Fid_Repr = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    end
    else
    begin
      if DM.rsCA.AppServer.ReprEdit(Fid_Repr, id_ContrAgent, isJur, AName, FirstName, MiddleName, LastName, Id_Currency, Disabled, Addr, Descr) <> 1 then
        raise Exception.Create('Ошибка при сохранении свойств');
    end;
    if not CDSApplyUpdates(cdsReprComment, 'id_Repr', Fid_Repr) then
      raise Exception.Create('Ошибка при сохранении списка комментариев');

    if not CDSApplyUpdates(cdsReprContact, 'id_Repr', Fid_Repr) then
      raise Exception.Create('Ошибка при сохранении контактных данных');      }
    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;
end;

procedure TfOperCommon.UpdateData;
var CDS : TClientDataSet;
begin
  CDS := cdsOperCmn;

  if CDS.State <> dsEdit then
    CDS.Edit;


//  CDS.FieldByName('IsJur').AsBoolean := cbIsJur.ItemIndex = 0;
//  CDS.FieldByName('Id_Currency').Value := fCurSelector1.ID_Curr;
//  CDS.FieldByName('CurrencyName').Value := fCurSelector1.CurName;
  CDS.Post;
end;

procedure TfOperCommon.BitBtn1Click(Sender: TObject);
begin
//*
end;

procedure TfOperCommon.BitBtn2Click(Sender: TObject);
begin
//*
end;

procedure TfOperCommon.CheckBox1Click(Sender: TObject);
begin
  GroupBox1.Enabled := CheckBox1.Checked;
  if CheckBox1.Checked then
  begin
    EnableControl(DBEdit4);
    EnableControl(DBEdit5);
  end
  else
  begin
    DisableControl(DBEdit4);
    DisableControl(DBEdit5);
  end;
end;

end.
