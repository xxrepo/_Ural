unit frReprPropLC;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ComCtrls, Grids, DBGrids, RXDBCtrl, ExtCtrls,
  StdCtrls, DBCtrls, Mask, frCAGroupSelect, ActnList, ToolWin, frReprList,
  frCurSelector, Menus,
  uCAContact, Buttons, RxLookup;

type
  TfReprPropLC = class(TFrame)
    cdsReprProp: TClientDataSet;
    cdsReprPropName: TStringField;
    cdsReprPropDisabled: TBooleanField;
    dsProp: TDataSource;
    cdsReprPropAddr: TStringField;
    cdsReprPropDescr: TStringField;
    dsReprContact: TDataSource;
    cdsReprPropid_Repr: TAutoIncField;
    cdsReprPropid_ContrAgent: TIntegerField;
    cdsReprPropisJur: TBooleanField;
    cdsReprPropFirstName: TStringField;
    cdsReprPropMiddleName: TStringField;
    cdsReprPropLastName: TStringField;
    cdsReprPropCAName: TStringField;
    cdsReprPropId_Currency: TIntegerField;
    cdsReprPropCurrencyName: TStringField;
    cdsReprPropNeedSend: TBooleanField;
    cdsReprGroup: TClientDataSet;
    cdsAccGroupid_Group: TIntegerField;
    cdsAccGroupName: TStringField;
    cdsAccGroupCnt: TIntegerField;
    DataSource1: TDataSource;
    pnCA: TPanel;
    Label8: TLabel;
    DBLookupComboBox1: TRxDBLookupCombo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    cbIsJur: TComboBox;
    cdsReprPropGroupName: TStringField;
    cdsReprPropid_Repr_Group: TIntegerField;
    cdsReprPropid_Bsn: TIntegerField;
    procedure cbIsJurChange(Sender: TObject);
    procedure cdsReprPropisJurChange(Sender: TField);
  private
    Fid_Repr: integer;
    Fid_Bsn: Variant;
    Fid_Group: Variant;
    procedure Setid_Repr(const Value: integer);
    function GerRepName: String;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    property id_Repr : integer read Fid_Repr write Setid_Repr;
    property RepName : String read GerRepName;

    procedure Initialize(Aid_Repr : integer; Aid_Bsn : Variant; Aid_Group : Variant);
  end;

implementation

uses foMyFunc, uDM,uComment, uCASelector;

{$R *.DFM}

{ TfCntrAgentProp }

function TfReprPropLC.CheckData: boolean;
var S : String;
begin
  Result := false;
  UpdateData;
  if cdsReprPropisJur.AsBoolean then
  begin
    with DBEdit1 do
      if trim(Text) = '' then
      begin
        MessageBox(Handle, 'Не введено наименование', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Windows.SetFocus(Handle);
        Exit;
      end;
  end
  else
  begin
    with DBEdit4 do
      if (trim(Text) = '') and (trim(DBEdit2.Text) = '') and (trim(DBEdit3.Text) = '') then
      begin
        MessageBox(Handle, 'Не введены фамилия, имя и отчество. Заполните хотя бы одно из этих полей.', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Windows.SetFocus(Handle);
        Exit;
      end;
  end;
{  with fCurSelector1.cbCur do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбрана валюта расчета', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end; }
  S := '';
  if cdsReprProp.FieldByName('isJur').AsBoolean then
  begin
    S := cdsReprProp.FieldByName('Name').Value;
  end
  else
  begin
    S := cdsReprProp.FieldByName('FirstName').Value;
    if S <> '' then S := S + ' ';
    S := S + cdsReprProp.FieldByName('MiddleName').Value;
    if S <> '' then S := S + ' ';
    S := S + cdsReprProp.FieldByName('LastName').Value;
  end;


  Result := true;
end;



function TfReprPropLC.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsReprProp;
  Result := true;
  UpdateData;
  if (Fid_Repr <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'Name', 'Наименование', SL);
        CompareField(CDS, 'Disabled', 'Заблокировать', SL, false);
 //       CompareField(CDS, 'CurrencyName', 'Валюта', SL);

        CompareField(CDS, 'Addr', 'адрес', SL, false);
        CompareField(CDS, 'Descr', 'описание', SL, false);
      end;
      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfReprPropLC.Create(AOwner: TComponent);
begin
  inherited;
  Fid_Bsn := Null;
  Fid_Group := Null;

end;

destructor TfReprPropLC.Destroy;
begin
  inherited;

end;

function TfReprPropLC.SaveProp: boolean;
var OldCursor : TCursor;
    id_Group: OleVariant;
    isJur, Disabled: WordBool;
    AName, FirstName, MiddleName, LastName, Id_Currency, Addr, Descr, id_Bsn_ex: OleVariant;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
    AName := cdsReprPropName.AsString;

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

    id_Bsn_ex := Fid_Bsn;

    if DBLookupComboBox1.KeyValue = '' then
      id_Group := Null
    else
      id_Group := DBLookupComboBox1.KeyValue;

    if Fid_Repr = -1 then // Добавляется
    begin
//      Vip := cdsGetClientProp.FieldByName('Vip').AsBoolean;
  //    RealAddr := cdsGetClientProp.FieldByName('RealAddr').Value;
      Fid_Repr := DM.rsCA.AppServer.ReprAdd_LC(isJur, AName, FirstName, MiddleName,
                                            LastName, Id_Currency, Disabled, Addr, Descr, id_Bsn_ex, id_Group);

      if Fid_Repr = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    end
    else
    begin
      if DM.rsCA.AppServer.ReprEdit_LC(Fid_Repr, isJur, AName, FirstName, MiddleName, LastName, Id_Currency, Disabled, Addr, Descr, id_Group) <> 1 then
        raise Exception.Create('Ошибка при сохранении свойств');
    end;

    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;
end;

procedure TfReprPropLC.Setid_Repr(const Value: integer);
begin
  Fid_Repr := Value;

  with cdsReprProp do
  begin
    Close;
    Params.ParamByName('@id_Repr').AsInteger := Fid_Repr;
    Open;
    if Fid_Repr = -1 then
    begin
      Edit;
      FieldByName('Disabled').AsBoolean := false;
      FieldByName('isJur').AsBoolean := true;
      FieldByName('NeedSend').AsBoolean := true;
      cbIsJur.ItemIndex := 0;
      Post;
    end
    else
    begin
      if FieldByName('IsJur').AsBoolean then
        cbIsJur.ItemIndex := 0
      else
        cbIsJur.ItemIndex := 1;
      cdsReprPropisJurChange(nil);
      Fid_Group := FieldByName('id_Repr_Group').Value;
      Fid_Bsn := FieldByName('id_Bsn').Value;
    end;
  end;
end;

procedure TfReprPropLC.UpdateData;
var CDS : TClientDataSet;
    Flag : boolean;
    IDTourType, IDFoodType : Variant;
begin
  CDS := cdsReprProp;

  if CDS.State <> dsEdit then
    CDS.Edit;


  CDS.FieldByName('IsJur').AsBoolean := cbIsJur.ItemIndex = 0;
//  CDS.FieldByName('Id_Currency').Value := fCurSelector1.ID_Curr;
//  CDS.FieldByName('CurrencyName').Value := fCurSelector1.CurName;
  CDS.Post;
end;

procedure TfReprPropLC.cbIsJurChange(Sender: TObject);
begin
  with cdsReprProp do
  begin
    if (FieldByName('isJur').AsBoolean and (cbIsJur.ItemIndex = 1)) or
       (not FieldByName('isJur').AsBoolean and (cbIsJur.ItemIndex = 0)) then
    begin
      Edit;
      FieldByName('IsJur').AsBoolean := cbIsJur.ItemIndex = 0;
      Post;
    end
  end;
end;

function TfReprPropLC.GerRepName: String;
begin
  if cdsReprPropisJur.AsBoolean then
    Result := cdsReprPropName.AsString
  else
    Result := cdsReprPropLastName.AsString + ' ' +
              cdsReprPropFirstName.AsString + ' ' +
              cdsReprPropMiddleName.AsString + ' ';
end;

procedure TfReprPropLC.cdsReprPropisJurChange(Sender: TField);
begin
  if cdsReprPropisJur.AsBoolean then
  begin
    EnableControl(DBEdit1);
    DisableControl(DBEdit4);
    DisableControl(DBEdit2);
    DisableControl(DBEdit3);
  end
  else
  begin
    DisableControl(DBEdit1);
    EnableControl(DBEdit4);
    EnableControl(DBEdit2);
    EnableControl(DBEdit3);
  end;

end;

procedure TfReprPropLC.Initialize(Aid_Repr: integer; Aid_Bsn,
  Aid_Group: Variant);
begin
  Fid_Bsn := Aid_Bsn;
  Fid_Group := Aid_Group;
  id_Repr := Aid_Repr;

  with cdsReprGroup do
  begin
    Close;
    Params.ParamByName('@id_business').Value := Fid_Bsn;
    Open;
  end;
  if not VarIsEmpty(Fid_Group) and not VarIsNull(Fid_Group)  then
    DBLookupComboBox1.KeyValue := Fid_Group;

end;

end.
