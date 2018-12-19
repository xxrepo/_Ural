unit frCurProp;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ComCtrls, Grids, DBGrids, RXDBCtrl, StdCtrls, DBCtrls, Mask,
  RxLookup, ToolEdit, CurrEdit, RXCtrls;

type
  TfCurProp = class(TFrame)
    cdsCurProp: TClientDataSet;
    cdsCurPropId_Currency: TAutoIncField;
    cdsCurPropName: TStringField;
    cdsCurPropShortName: TStringField;
    cdsCurPropISOCode: TStringField;
    cdsCurPropNumberCode: TStringField;
    cdsCurPropFastAccess: TBooleanField;
    cdsCurPropValue: TIntegerField;
    cdsCurPropRate: TFloatField;
    cdsCurPropAvForPay: TBooleanField;
    cdsCurPropId_URL: TIntegerField;
    cdsCurPropBase: TBooleanField;
    cdsCurPropLastUpdated: TBytesField;
    cdsCurPropURLName: TStringField;
    cdsCurPropURL: TStringField;
    cdsUrl: TClientDataSet;
    dsCurProp: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    dsUrl: TDataSource;
    Label7: TLabel;
    cdsUrlId_URL: TAutoIncField;
    cdsUrlUseTable: TSmallintField;
    cdsUrlName: TStringField;
    cdsUrlURL: TStringField;
    cdsCurPropID_Main: TIntegerField;
    cdsCurPropid_Bsn: TIntegerField;
    DBEdit6: TRxDBCalcEdit;
    cdsCurPropDocCurPartName: TStringField;
    cdsCurPropId_CurrencyUnData: TIntegerField;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    RxSpeedButton2: TRxSpeedButton;
    procedure dbgContactCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure dbgContactGetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure cdsUrlNameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    FIDObj: integer;
    function GetObjName: String;
    { Private declarations }
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure initialize(AID : integer; id_Bsn : integer);
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    property ObjID : integer read FIDObj;
    property ObjName : String read GetObjName;
  end;

implementation

uses foMyFunc, uDM;

{$R *.DFM}

{ TfCntrAgentProp }

function TfCurProp.CheckData: boolean;
begin
  Result := false;
  with DBEdit1 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введено название', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with DBEdit2 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введено короткое название', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
 { with DBEdit3 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен код ISO', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end; }
  with DBEdit5 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введено "единиц к обмену"', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with DBEdit5 do
    if (cdsCurPropValue.AsInteger <= 0) and (Enabled) then
    begin
      MessageBox(Handle, 'Число "единиц к обмену" должно быть больше нуля', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with DBEdit6 do
    if (trim(Text) = '') and (Enabled) then
    begin
      MessageBox(Handle, 'Не введен курс', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  Result := true;
end;



function TfCurProp.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsCurProp;
  Result := true;
  UpdateData;
  if (FIDObj <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'Name', 'название', SL);
        CompareField(CDS, 'ShortName', 'короткое название', SL);
        CompareField(CDS, 'ISOCode', 'код ISO', SL);
        CompareField(CDS, 'NumberCode', 'цифровой код', SL);
        CompareField(CDS, 'Value', 'единиц к обмену', SL);
        CompareField(CDS, 'Rate', 'курс', SL, true, '0.0000');
        CompareField(CDS, 'FastAccess', 'быстрый доступ', SL);
        CompareField(CDS, 'AvForPay', 'использование разрешено', SL);

        CompareField(CDS, 'URLName', 'Обновлять с сайта', SL);

      end;
      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfCurProp.Create(AOwner: TComponent);
begin
  inherited;
  
end;

destructor TfCurProp.Destroy;
begin
  inherited;

end;

function TfCurProp.SaveProp: boolean;
var OldCursor : TCursor;
    AName, ShortName, ISOCode, NumberCode: OleVariant;
    FastAccess: WordBool;
    AValue: Integer;
    Rate: OleVariant;
    AvForPay: WordBool;
    Id_URL, DocCurPartName: OleVariant;
    Id_Bsn : integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  UpdateData;
  BeginTruns(DM.rsCA);
  try
    AName := cdsCurProp.FieldByName('Name').AsString;
    ShortName := cdsCurProp.FieldByName('ShortName').AsString;
    ISOCode := cdsCurProp.FieldByName('ISOCode').AsString;
    NumberCode := cdsCurProp.FieldByName('NumberCode').AsString;

    FastAccess := TRUE;
    AvForPay := TRUE;

    AValue := cdsCurProp.FieldByName('Value').AsInteger;

    if not cdsCurProp.FieldByName('Base').AsBoolean then
      Rate := cdsCurProp.FieldByName('Rate').AsFloat
    else
      Rate := Null;
    Id_URL := cdsCurProp.FieldByName('Id_URL').Value;
    Id_Bsn := cdsCurProp.FieldByName('Id_Bsn').AsInteger;
    DocCurPartName := cdsCurPropDocCurPartName.AsVariant;
    if FIDObj = -1 then // Добавляется
    begin
      FIDObj := DM.rsCA.AppServer.CurrencyAdd_2(AName, ShortName, ISOCode, NumberCode, FastAccess, AValue, Rate, AvForPay, Id_URL, Id_Bsn, DocCurPartName);
      if FIDObj = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    end
    else
    begin
      if DM.rsCA.AppServer.CurrencyEdit_2(FIDObj, AName, ShortName, ISOCode, NumberCode, FastAccess, AValue, Rate, AvForPay, Id_URL, Id_Bsn, DocCurPartName) <> 1 then
        raise Exception.Create('Ошибка при сохранении свойств');
    end;

    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;
end;

procedure TfCurProp.UpdateData;
var CDS : TClientDataSet;
    Flag : boolean;
    IDTourType, IDFoodType : Variant; 
begin
  CDS := cdsCurProp;

  if CDS.State <> dsEdit then
    CDS.Edit;        

  CDS.FieldByName('URLName').AsString := RxDBLookupCombo1.Text;
  CDS.Post;
end;

procedure TfCurProp.dbgContactCheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfCurProp.dbgContactGetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfCurProp.initialize(AID: integer; id_Bsn : integer);
begin
  FIDObj := AID;
  cdsUrl.Open;
  with cdsCurProp do
  begin
    Close;
    Params.ParamByName('@Id_Currency').AsInteger := FIDObj;
    Open;
    if FIDObj = -1 then
    begin
      Edit;
      FieldByName('FastAccess').AsBoolean := false;
      FieldByName('AvForPay').AsBoolean := false;
      FieldByName('id_Bsn').AsInteger := id_Bsn;
      FieldByName('Value').AsInteger := 1;
      Post;
    end;
    DBEdit5.Enabled := not FieldByName('Base').AsBoolean;
    DBEdit6.Enabled := not FieldByName('Base').AsBoolean;
//    DBCheckBox1.Enabled := not FieldByName('Base').AsBoolean;
//    DBCheckBox2.Enabled := not FieldByName('Base').AsBoolean;
    RxDBLookupCombo1.Enabled := not FieldByName('Base').AsBoolean;
  end;
end;

procedure TfCurProp.cdsUrlNameGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := cdsUrlName.AsString + ' (' + cdsUrlURL.AsString + ')';
end;

function TfCurProp.GetObjName: String;
begin
  Result := cdsCurPropName.AsString;
end;

procedure TfCurProp.Button1Click(Sender: TObject);
var V : Variant;
begin
  V := GetFloatFromClipBoadr;
  if V <> 0 then
  begin
    if cdsCurProp.State <> dsEdit then
      cdsCurProp.Edit;
    cdsCurPropRate.AsFloat := V;
    cdsCurProp.Post;
  end;
end;

end.
