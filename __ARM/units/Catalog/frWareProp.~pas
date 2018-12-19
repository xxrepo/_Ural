unit frWareProp;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frCurSelector, Mask, DBCtrls, foMyFunc, ToolEdit,
  CurrEdit, Db, DBClient, Buttons, RXDBCtrl;

type
  TfWareProp = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cdsGoodsProp: TClientDataSet;
    DataSource1: TDataSource;
    edName: TDBEdit;
    DBEdit2: TDBEdit;
    edBarCode: TDBEdit;
    cdsGoodsPropid_Goods: TAutoIncField;
    cdsGoodsPropid_Ctg_Goods: TIntegerField;
    cdsGoodsPropName: TStringField;
    cdsGoodsPropShortName: TStringField;
    cdsGoodsPropBarCode: TStringField;
    cdsGoodsPropDisabled: TBooleanField;
    cdsGoodsPropLastUpdated: TBytesField;
    pBase: TPanel;
    Label5: TLabel;
    edCatName: TEdit;
    cdsGoodsPropid_Measure: TIntegerField;
    cdsGoodsPropMeasureName: TStringField;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    cbDisabled: TDBCheckBox;
    SpeedButton1: TSpeedButton;
    cdsGoodsPropGTD: TStringField;
    cdsGoodsPropCountry: TStringField;
    cdsGoodsPropDocNomCode: TStringField;
    cdsGoodsPropDocPriceCode: TStringField;
    cdsGoodsPropDocArt: TStringField;
    cdsGoodsPropDocNumber: TStringField;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    cdsGoodsPropPrice: TFloatField;
    lbUsePrice: TLabel;
    edUsePrice: TRxDBCalcEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    Fid_Bsn : integer;
    FOldBarCode : String;
    FID, Fid_Ctg: Variant;
    function GetIDObj: Variant;
  public
    constructor Create(AOwner : TComponent); override;

    function MakeBarCode: String;

    procedure UpdateData;
    function SaveProp : boolean;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    procedure Initialize(id_Ctg : Variant; AID : integer; id_Bsn : integer);
    property IDObj : Variant read GetIDObj;
    procedure MakeSimple;

  end;

implementation

uses uDM, uFormApi_Ware, uWareCtgSelector, uMainForm;

{$R *.DFM}

{ TfWareProp }

function TfWareProp.CheckData: boolean;
var Rez, WareType : integer;
begin
  UpdateData;
  Result := false;
  with edName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбрано наименование', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  WareType := 1;

  if DM.rsCA.AppServer.UN_Check_Ware(WareType, Fid_Ctg, edName.Text, FID) = -1 then
  begin
    MessageBox(Handle, 'Такое название уже существует. Измените его', 'Такое название уже существует', MB_OK + MB_ICONERROR);
    Windows.SetFocus(edName.Handle);
    Exit;
  end;

  if trim(edBarCode.Text) <> '' then
  begin
    Rez := DM.rsCA.AppServer.CheckGoods(trim(edBarCode.Text));
    if (Rez <> -1) and (Rez <> FID) then
    begin
      MessageBox(Handle, PChar('Код ' + edBarCode.Text + ' уже используется! Введите уникальный код.'), 'Код должен быть уникальным', MB_OK + MB_ICONERROR);
      Windows.SetFocus(edBarCode.Handle);
      Exit;
    end;
  end;
  with DBEdit4 do
    if Enabled and (trim(Text) = '') then
    begin
      MessageBox(Handle, 'Не выбрана единица измерения', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;

  Result := true;
end;

function TfWareProp.ConfirmChanges: boolean;
var SL : TStringList;
begin
  Result := false;
  if not CheckData then
    Exit;
  Result := true;
  if (Fid <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (TClientDataSet(DataSource1.DataSet).ChangeCount > 0) then
      begin
        CompareField(TClientDataSet(DataSource1.DataSet), 'Name', 'Название', SL);
        CompareField(TClientDataSet(DataSource1.DataSet), 'ShortName', 'Короткое название', SL);
        CompareField(TClientDataSet(DataSource1.DataSet), 'BarCode', 'Код', SL);
        CompareField(TClientDataSet(DataSource1.DataSet), 'Disabled', 'Заблокировано', SL);

        CompareField(TClientDataSet(DataSource1.DataSet), 'Country', 'Страна', SL);
        CompareField(TClientDataSet(DataSource1.DataSet), 'GTD', 'ГТД', SL);
        CompareField(TClientDataSet(DataSource1.DataSet), 'DocNomCode', 'Код продукции', SL);
        CompareField(TClientDataSet(DataSource1.DataSet), 'DocPriceCode', 'Номер прейскуранта', SL);
        CompareField(TClientDataSet(DataSource1.DataSet), 'DocArt', 'Артикул', SL);
        CompareField(TClientDataSet(DataSource1.DataSet), 'DocNumber', '№ по складской картотеке', SL);

//        CompareField(TClientDataSet(DataSource1.DataSet), 'Price', 'Цена', SL);
//        CompareField(TClientDataSet(DataSource1.DataSet), 'CurrencyName', 'Валюта', SL);
      end;

      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;


function TfWareProp.GetIDObj: Variant;
begin
  Result := FID;
end;

function TfWareProp.SaveProp: boolean;
var OldCursor : TCursor;
    AType: Integer;
    AName, ShortName, BarCode, id_Ctg, id_Measure,
    GTD, Country, DocNomCode, DocPriceCode, DocArt, DocNumber, Price: OleVariant;
    Disabled: WordBool;
    Rez : integer;
begin
  if (TClientDataSet(DataSource1.DataSet).ChangeCount = 0) then
  begin
    Result := true;
    Exit;
  end;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
    AType := 0;
    id_Ctg := Fid_Ctg;
    if id_Ctg = -13 then
      id_Ctg := Null;
    AName := cdsGoodsProp.FieldByName('Name').AsString;
    ShortName := cdsGoodsProp.FieldByName('ShortName').Value;
    BarCode := cdsGoodsProp.FieldByName('BarCode').Value;
    Disabled := cdsGoodsProp.FieldByName('Disabled').Value;
    if cdsGoodsProp.FindField('id_Measure') <> nil then
      id_Measure := cdsGoodsProp.FieldByName('id_Measure').Value
    else
      id_Measure := Null;

    GTD := cdsGoodsProp.FieldByName('GTD').Value;
    Country := cdsGoodsProp.FieldByName('Country').Value;
    DocNomCode := cdsGoodsProp.FieldByName('DocNomCode').Value;
    DocPriceCode := cdsGoodsProp.FieldByName('DocPriceCode').Value;
    DocArt := cdsGoodsProp.FieldByName('DocArt').Value;
    DocNumber := cdsGoodsProp.FieldByName('DocNumber').Value;
    Price := cdsGoodsPropPrice.Value;
    if FUsePrice then
    begin
      Rez := DM.rsCA.AppServer.WareUnEdit(FID, id_Ctg, AName, ShortName, BarCode, Disabled, id_Measure,
                     GTD, Country, DocNomCode, DocPriceCode, DocArt, DocNumber, Price);
        if Rez = -1 then
          raise Exception.Create('Ошибка при сохранении свойств');

      if FID = -1 then  FID := Rez;
    end
    else
    begin
      if FID = -1 then // Добавляется
      begin
        FID := DM.rsCA.AppServer.WareAdd(AType, id_Ctg, AName, ShortName, BarCode, Disabled, id_Measure,
                     GTD, Country, DocNomCode, DocPriceCode, DocArt, DocNumber);

        if FID = -1 then
          raise Exception.Create('Ошибка при сохранении свойств');

      end
      else
      begin
        Rez := DM.rsCA.AppServer.WareEdit(AType, FID, id_Ctg, AName, ShortName, BarCode, Disabled, id_Measure,
                GTD, Country, DocNomCode, DocPriceCode, DocArt, DocNumber);
        if Rez <> 1 then
          raise Exception.Create('Ошибка при сохранении свойств');
      end;
    end;
           
    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;    
end;

procedure TfWareProp.Initialize(id_Ctg : Variant; AID: integer; id_Bsn : integer);
var S : OleVariant;
    IDBsn : integer;
    Price, ID_Cur: OleVariant;
    Rez : boolean;
begin
{$IFDEF LC}
  Fid_Ctg := Null;

  if AID > 0 then
  begin
    pBase.Enabled := false;
    edCatName.ReadOnly := true;
    edName.ReadOnly := true;
    edCatName.Color := clInactiveCaptionText;

    BitBtn1.Enabled := false;
    SpeedButton1.Enabled := false;
  end;
//  edBarCode.ReadOnly := true;
//  edBarCode.Color := clInactiveCaptionText;
{$ENDIF}

  Fid_Bsn := id_Bsn;

  FID := AID;
  Fid_Ctg := id_Ctg;
  if Fid_Ctg = -13 then
    Fid_Ctg := Null;
  with cdsGoodsProp do
  begin
    Close;
    Params.ParamByName('@id_Goods').AsInteger := FID;
    Open;
    if FID = -1 then
    begin
      cbDisabled.Enabled := false;
      Edit;
      FieldByName('Disabled').AsBoolean := false;
      FieldByName('id_Ctg_Goods').AsInteger := id_Ctg;
      Post;
    end
    else
    begin
      Fid_Ctg := FieldByName('id_Ctg_Goods').AsInteger;
    end;
    Rez := false;
    if (Fid_Ctg > 0) and (id_Ctg <> -13) then
    begin
      Rez := DM.rsCA.AppServer.CtgByID(0, Fid_Ctg, S);
    end;
    if Rez then
      edCatName.Text := S;
  end;
end;

function TfWareProp.MakeBarCode : String;
var S : String;
    IDBsn : integer;
begin
  Result := '';
  // Формирование кода
  IDBsn := DM.rsCA.AppServer.UNSel_PL_GoodsInf(FID);
  S := DM.GetBsnNum(IDBsn) + '-1';
  Result := S + '-' + FormatFloat('00000', FID);
end;

procedure TfWareProp.UpdateData;
var CDS : TClientDataSet;
    Flag : boolean;
    IDTourType, IDFoodType : Variant;
begin
  CDS := cdsGoodsProp;

  if CDS.State <> dsEdit then
    CDS.Edit;

  CDS.Post;
end;

constructor TfWareProp.Create(AOwner: TComponent);
begin
  inherited;
  if not FUsePrice then
  begin
    lbUsePrice.Visible := false;
    edUsePrice.Visible := false;
  end;
  MakeSimple;
end;

procedure TfWareProp.SpeedButton1Click(Sender: TObject);
var
 AID:Variant;
 AName:string;
begin
  AID := cdsGoodsProp.FieldByName('id_Measure').Value;
  AName := cdsGoodsProp.FieldByName('MeasureName').AsString;
  if SelectMeasure(Fid_Bsn, AID, AName) then
  begin
    with cdsGoodsProp do
    begin
      Edit;
      FieldByName('MeasureName').AsString := AName;
      FieldByName('id_Measure').Value := AID;
      Post;
    end;
  end;
end;

procedure TfWareProp.BitBtn1Click(Sender: TObject);
var xxx_id_Ctg, xxx_id_Ctg2 : Variant;
    xxx_AName, S : String;
begin
  xxx_id_Ctg := Fid_Ctg;

  if ShowWareCtgSelector(Fid_Bsn, xxx_id_Ctg, xxx_AName, false, true, Null) then
  begin
    with TClientDataSet(DataSource1.DataSet) do
    begin
      Edit;
      Fid_Ctg := xxx_id_Ctg;
      edCatName.Text := xxx_AName;

      S := 'id_Ctg_Goods';
      FieldByName(S).AsInteger := Fid_Ctg;
      Post;
    end;
  end;
end;

procedure TfWareProp.MakeSimple;
begin
  if DM.IsSimple then
  begin
    DBEdit2.Enabled := false;
    Label2.Enabled := false;
    edBarCode.Enabled := false;
    Label3.Enabled := false;

    Label7.Enabled := false;
    DBEdit3.Enabled := false;

    Label4.Enabled := false;
    DBEdit1.Enabled := false;

    Label8.Enabled := false;
    DBEdit5.Enabled := false;

    Label9.Enabled := false;
    DBEdit6.Enabled := false;

    Label10.Enabled := false;
    DBEdit7.Enabled := false;

    Label11.Enabled := false;
    DBEdit8.Enabled := false;

  end;

end;

end.
