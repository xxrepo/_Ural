unit frWareCtgProp;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ComCtrls, Grids, DBGrids, RXDBCtrl, ExtCtrls,
  StdCtrls, DBCtrls, Mask, ActnList,
  frCurSelector, uDM, foMyFunc, Buttons;

type
  TfWareCtgProp = class(TFrame)
    cdsCtgGoodsProp: TClientDataSet;
    dsCtgGoodsProp: TDataSource;
    pBase: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    cbDisabled: TDBCheckBox;
    cdsCtgGoodsPropid_Ctg_Goods: TAutoIncField;
    cdsCtgGoodsPropid_business: TIntegerField;
    cdsCtgGoodsPropid_BaseCtg_Goods: TIntegerField;
    cdsCtgGoodsPropDisabled: TBooleanField;
    cdsCtgGoodsPropLastUpdated: TBytesField;
    cdsCtgGoodsPropBusinessName: TStringField;
    cdsCtgGoodsPropCurrencyName: TStringField;
    cdsCtgGoodsPropParentName: TStringField;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    cdsCtgGoodsPropName: TStringField;
    cdsCtgGoodsPropShortName: TStringField;
    cdsCtgGoodsPropID_Main: TIntegerField;
    BitBtn1: TBitBtn;
    procedure dbgContactCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure dbgContactGetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    cdsCtgProp: TClientDataSet;

    Fid_Bsn : integer;
    Fid_Ctg : integer;
    Fid_BaseCtg : Variant;

    function Getid_Bsn: integer;
    function Getid_Ctg: Variant;

  public
    FBaseCtgField : TField;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    procedure Initialize(id_Ctg : integer; id_Bsn : integer; id_BaseCtg : Variant);
    property id_Ctg : Variant read Getid_Ctg;
    property id_Bsn : integer read Getid_Bsn;
  end;

implementation

uses uFormApi_Ware, uWareCtgSelector;

{$R *.DFM}

{ TfCntrAgentProp }

function TfWareCtgProp.CheckData: boolean;
var WareType, Rez, PP : integer;
begin
  Result := false;
  UpdateData;
  with DBEdit1 do
  begin
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбрано наименование', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
    PP := Pos('/', Text);
    if PP > 0 then
    begin
      MessageBox(Handle, 'В названиях категорий недопустимо использовать символ "/" - знак деления. Замените его на другой символ.', 'Ошибка в названии', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      SelStart := PP - 1;
      SelLength := 1;
      Exit;
    end;
  end;
  WareType := 1;

  if DM.rsCA.AppServer.UN_Check_Ctg_Ware(WareType, id_Bsn, FBaseCtgField.Value, DBEdit1.Text, Fid_Ctg) = -1 then
  begin
    MessageBox(Handle, 'Такое название категории уже существует. Измените его', 'Такое название категории уже существует', MB_OK + MB_ICONERROR);
    Windows.SetFocus(DBEdit1.Handle);
    Exit;
  end;

  Result := true;
end;



function TfWareCtgProp.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsCtgProp;
  Result := true;
  UpdateData;
  if (Fid_Ctg <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'Name', 'Название', SL);
        CompareField(CDS, 'ShortName', 'Короткое название', SL);
        CompareField(CDS, 'Disabled', 'Заблокировать', SL, false);
//        CompareField(CDS, 'DefPrice', 'Цена', SL);
//        CompareField(CDS, 'CurrencyName', 'Валюта', SL);
        CompareField(CDS, 'MeasureName', 'Единица измерения', SL);

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

constructor TfWareCtgProp.Create(AOwner: TComponent);
begin
  inherited;
  cdsCtgProp := nil;
end;

destructor TfWareCtgProp.Destroy;
begin
  inherited;

end;

function TfWareCtgProp.SaveProp: boolean;
var OldCursor : TCursor;
    id_business: Integer;
    id_BaseCtg, AName, ShortName : OleVariant;
    Disabled: WordBool;
    Rez : integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
    id_business := cdsCtgProp.FieldByName('id_business').Value;
    id_BaseCtg := FBaseCtgField.Value;
    AName := cdsCtgProp.FieldByName('Name').AsString;
    ShortName := cdsCtgProp.FieldByName('ShortName').AsString;
    Disabled := cdsCtgProp.FieldByName('Disabled').asboolean;

    if Fid_Ctg = -1 then // Добавляется
    begin

      Fid_Ctg := DM.rsCA.AppServer.Ctg_GoodsAdd(id_business, id_BaseCtg, AName, ShortName, Disabled);

      if Fid_Ctg = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');
          
    end    
    else
    begin
      Rez := DM.rsCA.AppServer.Ctg_GoodsEdit(Fid_Ctg, id_business, id_BaseCtg, AName, ShortName, Disabled);
      if Rez <> 1 then
        raise Exception.Create('Ошибка при сохранении свойств');
    end;
           
    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;
end;

procedure TfWareCtgProp.UpdateData;
var CDS : TClientDataSet;
    Flag : boolean;
    IDTourType, IDFoodType : Variant;
begin
  CDS := cdsCtgProp;

  if CDS.State <> dsEdit then
    CDS.Edit;

  CDS.Post;
end;

procedure TfWareCtgProp.dbgContactCheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfWareCtgProp.dbgContactGetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfWareCtgProp.Initialize(id_Ctg,
  id_Bsn: integer; id_BaseCtg : Variant);
var S : OleVariant;
    Rez : boolean;
    i : integer; 
    Price, ID_Cur: OleVariant;
begin
  Fid_Ctg := id_Ctg;
  Fid_Bsn := id_Bsn;
  Fid_BaseCtg := id_BaseCtg;
  if Fid_BaseCtg = -13 then
    Fid_BaseCtg := Null;

  cdsCtgProp := cdsCtgGoodsProp;
  FBaseCtgField := cdsCtgGoodsPropid_BaseCtg_Goods;

  dsCtgGoodsProp.DataSet := cdsCtgProp;

  with cdsCtgProp do
  begin
    Close;
    Params.ParamByName('@id_Ctg').AsInteger := Fid_Ctg;
    Open;

    if Fid_Ctg = -1 then
    begin
      cbDisabled.Enabled := false;
      Edit;
      FieldByName('Disabled').AsBoolean := false;
      FieldByName('id_business').AsInteger := Fid_Bsn;

      FBaseCtgField.Value := Fid_BaseCtg;
      if Fid_BaseCtg <> Null then
      begin
    {    
        cdsCtgProp.FieldByName('ParentName').AsString := DM.rsCA.AppServer.PL_UN_WareCtgGetProp(Fid_BaseCtg, i);
        }
        Rez := false;
        Rez := DM.rsCA.AppServer.CtgByID(0, Fid_BaseCtg, S);
        if Rez then
          FieldByName('ParentName').AsString := S;
      end;
      Post;
    end
    else
    begin
    end;
  end;
end;

function TfWareCtgProp.Getid_Bsn: integer;
begin
  Result := Fid_Bsn;
end;

function TfWareCtgProp.Getid_Ctg: Variant;
begin
  Result := Fid_Ctg;
//  if dsCtgGoodsProp.DataSet.Active then
  //  Result := dsCtgGoodsProp.DataSet.FieldByName('id_Ctg_Goods').Value;
end;

procedure TfWareCtgProp.BitBtn1Click(Sender: TObject);
var xxx_id_Ctg, xxx_id_Ctg2 : Variant;
    xxx_AName : String;
begin
  xxx_id_Ctg := Null;//FBaseCtgField.Value;
  if xxx_id_Ctg = Null then
    xxx_id_Ctg2 := Fid_Ctg
  else
    xxx_id_Ctg2 := xxx_id_Ctg;

  if ShowWareCtgSelector(Fid_Bsn, xxx_id_Ctg, xxx_AName, true, false, xxx_id_Ctg2) then
  begin
    with cdsCtgProp do
    begin
      Edit;
      FBaseCtgField.Value := xxx_id_Ctg;
      cdsCtgProp.FieldByName('ParentName').AsString := xxx_AName;
      Post;
    end;
  end;
end;

procedure TfWareCtgProp.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '/' then
  begin
    MessageBeep(MB_ICONEXCLAMATION);
    MessageBox(Handle, 'В названиях категорий недопустимо использовать символ "/" - знак деления. Замените его на другой символ.', 'Ошибка в названии', MB_OK + MB_ICONERROR);
    Key := Char(0);
  end;
end;

end.
