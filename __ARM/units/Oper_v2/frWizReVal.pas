unit frWizReVal;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, foMyFunc,
  frCurSelector, ActnList, ImgList, ComCtrls, ToolWin, Grids, DBGridEh,
  GridsEh;

type
  TfWizReVal = class(TFrame)
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
    dsOperWare: TDataSource;
    ilImage: TImageList;
    ActionList1: TActionList;
    aDelWare: TAction;
    aCalcSys: TAction;
    aSumm: TAction;
    gbWare: TGroupBox;
    DBGridEh1: TDBGridEh;
    ToolBar3: TToolBar;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn4: TBitBtn;
    edRepr: TEdit;
    edCA: TEdit;
    cdsOperWareBackSumm: TFloatField;
    cdsOperWareSSPrice: TFloatField;
    edWH: TEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    ToolButton1: TToolButton;
    aAddWare: TAction;
    cdsOperWareDelta: TFloatField;
    cdsOperWareAmountOper: TFloatField;
    cdsOperWarePriceOper: TFloatField;
    cdsOperWareSummSys: TFloatField;
    cdsOperWarePriceInv: TFloatField;
    procedure BitBtn4Click(Sender: TObject);
    procedure aDelWareExecute(Sender: TObject);
    procedure aCalcSysExecute(Sender: TObject);
    procedure aSummExecute(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure cdsOperWareCalcFields(DataSet: TDataSet);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ToolButton13Click(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure aAddWareExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure dsOperWareDataChange(Sender: TObject; Field: TField);
    procedure DBGridEh1ColEnter(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    ASelectedRepr, ASelectedWH : TSelectedObj;
    FID_Oper: integer;
    procedure AddWare;
    procedure xxxOne;
    function SaveProp: boolean;
  public
    function CheckData : boolean;
    procedure Initialize(id_WareHouse : Variant; AID : integer);
    function SaveProp2: boolean;

    property ID_Oper : integer read FID_Oper;
  end;

implementation

uses uUnivSelector, uUnivOper_v2, uDM;

{$R *.DFM}

{ TfWizBackToCA }

procedure TfWizReVal.Initialize(id_WareHouse : Variant; AID : integer);
var id_Bsn, id_Group, AName, ABsnName, id_Mes, V, id_Business : OleVariant;
begin
  SetCDSFormat(cdsOperWare, '### ### ### ##0.00', '0.##');

  ASelectedWH.ID := id_WareHouse;
  if id_WareHouse <> Null then
  begin
    if DM.rsCA.AppServer.UNSel_WHBsn(id_WareHouse, id_Bsn, id_Group) = 1 then
    begin
      if DM.rsCA.AppServer.GetWH(id_WareHouse, AName, ABsnName, id_Business) <> -1 then
      begin
        ASelectedWH.Bsn_id := id_Bsn;
        ASelectedWH.Bsn_Name := ABsnName;
        edWH.Text := AName;
        ASelectedWH.Name := AName;
      end;
    end;
  end;
  with cdsOperWare do
  begin
    Close;
    Params.ParamByName('@id_Oper').Value := -1;
    Open;
    if AID > 0 then
    begin
      Append;

   // FieldByName('WareName').Value := ASelectedObj.Name;
      FieldByName('id_Goods').Value := AID;

      if DM.rsCA.AppServer.PL_WareMeasureGet(FieldByName('id_Goods').Value,
                                             ID_Mes, AName) = 1 then
      begin
        FieldByName('id_Measure').AsInteger := ID_Mes;
        FieldByName('MeasureName').AsString := AName;
        FieldByName('RealKoef').AsInteger := 1;
      end;
      if DM.rsCA.AppServer.PL_WareNameGet(FieldByName('id_Goods').Value,
                                             AName, V) = 1 then
      begin
        FieldByName('WareName').AsString := AName;
      end;

      xxxOne;
      Post;
    end;
  end;
end;

procedure TfWizReVal.BitBtn4Click(Sender: TObject);
begin
  if ASelectedWH.ID = Null then
    with edWH do
    begin
      Windows.SetFocus(Handle);
      MessageBox(Handle, 'Не выбран склад', 'Сначала выберите склад', MB_OK + MB_ICONERROR);
      Exit;
    end;

  if SelectObjUnBsn(Owner, ASelectedWH.Bsn_id, ASelectedRepr, 0, [eotRepr]) then
  begin
    edRepr.Text := ASelectedRepr.Name;
    edCA.Text := ASelectedRepr.CA_Name;
  end;
end;

procedure TfWizReVal.aDelWareExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить товар "' + cdsOperWareWareName.AsString+ '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    cdsOperWare.Delete;
  end;
end;

procedure TfWizReVal.aCalcSysExecute(Sender: TObject);
begin
//*
end;

procedure TfWizReVal.aSummExecute(Sender: TObject);
var S : String;
    F : Extended;
begin
  if cdsOperWare.FieldByName('AmountOper').AsFloat = 0 then
    Exit;
  F := cdsOperWare.FieldByName('SummOper2').AsFloat;
  S := FloatToStr(F);
  if InputBoxKrm('Сумма товара "' + cdsOperWareWareName.AsString + '"', 'Сумма', S, [], true, Owner) then
  begin
    F := StrToFloat(S);
    F := F / cdsOperWare.FieldByName('AmountOper').AsFloat;
    with cdsOperWare do
    begin
      Edit;
      FieldByName('SSPrice').AsFloat := F;
      Post;
    end;
  end;    
end;

procedure TfWizReVal.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
    S : String;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.IsEmpty then
    Exit;

  if Column.Field = cdsOperWare.FieldByName('WareName') then
  begin
    ImgIndex := 2;
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
    R := Rect;
    R.Top := R.Top + 2;
    R.Left := R.Left + 2 + ilImage.Width;
    TDBGridEh(Sender).DefaultDrawColumnCell(R, DataCol, Column, State);
  end
  else
  begin
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

    // Красим незаполненные ячейки
    if ((Column.Field = cdsOperWareSSPrice) and
       (cdsOperWareSSPrice.AsFloat = 0))
        then
    begin
      TDBGridEh(Sender).Canvas.Brush.Color := clWindow;

      TDBGridEh(Sender).Canvas.Font.Color := clRed;
      TDBGridEh(Sender).Canvas.Font.Style := TDBGridEh(Sender).Canvas.Font.Style + [fsBold];

      TDBGridEh(Sender).Canvas.Brush.Style := bsClear;
      TDBGridEh(Sender).Canvas.Pen.Color := clRed;
      TDBGridEh(Sender).Canvas.Rectangle(Rect.Left + 0, Rect.Top + 0, Rect.Right - 0, Rect.Bottom - 0);
    end;    
  end; 
end;

procedure TfWizReVal.cdsOperWareCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('Numb').AsInteger := DataSet.RecNo;
  if DataSet.FieldByName('AmountOper').AsFloat = 0 then
    DataSet.FieldByName('SummOper2').Value := Null
  else
    DataSet.FieldByName('SummOper2').AsFloat := DataSet.FieldByName('AmountOper').AsFloat * DataSet.FieldByName('PriceOper').AsFloat;

  if DataSet.FieldByName('AmountOper').AsFloat = 0 then
    DataSet.FieldByName('SSSumm').Value := Null
  else
    DataSet.FieldByName('SSSumm').AsFloat := DataSet.FieldByName('AmountOper').AsFloat * DataSet.FieldByName('SSPrice').AsFloat;
    
  DataSet.FieldByName('Delta').AsFloat := DataSet.FieldByName('SSSumm').AsFloat - DataSet.FieldByName('SummOper2').AsFloat;
end;

procedure TfWizReVal.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
{  if (Column.Field = cdsOperWareBackAmount) then
  begin
    if (cdsOperWareBackAmount.AsFloat > cdsOperWareAmountOper.AsFloat) then
    begin
      AFont.Color := clRed;
      AFont.Style := [fsBold];
    end
  end
  else
  begin
    if (cdsOperFinId_CurrencySys.IsNull) and (Column.Field = cdsOperWareSummSys) then
      AFont.Color := clGrayText;
    if (not cdsOperFinId_CurrencySys.IsNull) and ((Column.Field = cdsOperWareSummOper2) or (Column.Field = cdsOperWarePriceOper)) then
      AFont.Color := clGrayText;
  end;   }
end;

procedure TfWizReVal.ToolButton13Click(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить товар "' + cdsOperWareWareName.AsString+ '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    cdsOperWare.Delete;
  end;
end;

procedure TfWizReVal.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
var tmpCol : TColumnEh;
    S, S2 : String;
begin
  if (Key = '.') then
  begin
    S := DecimalSeparator;
    if S = ',' then S2 := '.' else S2 := ',';
    tmpCol := TDBGridEh(Sender).Columns[TDBGridEh(Sender).col];
    if (Key = S2[1]) and ((tmpCol.Field = cdsOperWareAmountOper) or
     (tmpCol.Field = cdsOperWarePriceOper) or
     (tmpCol.Field = cdsOperWareSSPrice) or
     (tmpCol.Field = cdsOperWareSummSys)) then
      Key := S[1];
  end;
  if (Key = #13) and (cdsOperWare.State in [dsinsert, dsEdit]) then
    cdsOperWare.post;
end;


function TfWizReVal.CheckData: boolean;
begin
  Result := false;
  with edWH do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран склад', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with edRepr do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен представитель', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;

  with cdsOperWare do
  begin
    if IsEmpty then
    begin
      Windows.SetFocus(Handle);
      MessageBox(Handle, 'Список товаров пуст!', 'Ошибка в данных', MB_OK + MB_ICONERROR);
      Exit;
    end;

    First;
    while not Eof do
    begin
      if FieldByName('AmountOper').AsFloat <= 0 then
      begin
        Windows.SetFocus(Handle);
        MessageBox(Handle, 'Остаток на складе должен быть больше нуля', 'Ошибка в данных', MB_OK + MB_ICONERROR);
        Exit;
      end;
      if FieldByName('SSPrice').AsFloat < 0 then
      begin
        DBGridEh1.col := DBGridEh1.Columns.Count - 1;
        MessageBox(Handle, 'Новое значение средней цены должно быть больше или равно нулю', 'Ошибка в данных', MB_OK + MB_ICONERROR);
        Exit;
      end;
      if FieldByName('SSPrice').AsFloat = FieldByName('PriceOper').AsFloat then
      begin
        DBGridEh1.col := DBGridEh1.Columns.Count - 3;
        MessageBox(Handle, 'Не изменена цена', 'Ошибка в данных', MB_OK + MB_ICONERROR);
        Exit;
      end;

      Next;
    end;
    First;
  end;
  Result := true;
end;

function TfWizReVal.SaveProp: boolean;
var OldCursor : TCursor;
    id_Goods, id_Measure, Amount,
    PriceOper: OleVariant;
    i : integer;

    OperVid, id_business, Correct,
    OperTypeIn, Id_CurrencyOper, id_Repr, OpComment, id_Warehouse, Id_CurrencyInv : OleVariant;

    OfferSumm : Double;
    NeedIn, NeedOut : boolean;
    Id_in, Id_out, FID_Oper : integer;
    CrossCurs : Double;
begin
end;

function TfWizReVal.SaveProp2: boolean;
var OldCursor : TCursor;
    id_Goods, id_Measure : OleVariant;
    i : integer;

    OperVid, id_business, Correct,
    OperTypeIn, Id_CurrencyOper, id_Repr, OpComment, id_Warehouse, Id_CurrencyInv : OleVariant;

    OfferSumm : Double;
    Id_in, Id_out, FID_Oper : integer;
    Amount, PriceOperIn, PriceOperOut: OleVariant;
    CrossCurs : Double;
begin
  OfferSumm := 0;
  id_business := ASelectedWH.Bsn_id;
  id_Warehouse := ASelectedWH.id;
  Id_CurrencyOper := DM.rsCA.AppServer.GetBsnCur(id_business);
  Id_CurrencyInv := Id_CurrencyOper;
  Correct := false;
  id_Repr := ASelectedRepr.ID;
  OpComment := 'Переоценка - авт.';

  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
    // Создаем переоценку
    Id_in := -1;
    Id_out := -1;

    OperVid := 1;

    OperTypeIn := false;
    Id_out := wp_OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyOper,
                                               0, 0, Null, Null, Null,
                                               id_Repr, Null, Null, id_Warehouse, Null,
                                               Null, Null,
                                               Null, Null, 0,
                                               Id_CurrencyInv, Null, 0,
                                               DM.IDUser, Null,
                                               Null, Null, Null, OpComment,
                                               Null, Null, Null, Null, Null, Null, Null, Null,
                                               Null, Null, Null, Null, Null, Null, Null,
                                               Null, Null, Null, Null, Null, Null, Null, Null,
                                               Null, Null, Null, Null, Null, Null, Null,
                                               Null, Null, Null, Null, Null, Null, Null,
                                               Null, Null, Null, Null, Null, Null, Null, Null, true, false);

    OperTypeIn := true;
    Id_in := wp_OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyOper,
                                               0, 0, Null, Null, Null,
                                               id_Repr, Null, Null, id_Warehouse, Null,
                                               Null, Null,
                                               Null, Null, 0,
                                               Null, Null, 0,
                                               DM.IDUser, Null,
                                               Null, Null, Null, OpComment,
                                               Null, Null, Null, Null, Null, Null, Null, Null,
                                               Null, Null, Null, Null, Null, Null, Null,
                                               Null, Null, Null, Null, Null, Null, Null, Null,
                                               Null, Null, Null, Null, Null, Null, Null,
                                               Null, Null, Null, Null, Null, Null, Null,
                                               Null, Null, Null, Null, Null, Null, Null, Null, true, false);

    if (Id_in > -1) and (Id_out > -1) then
    begin
      with cdsOperWare do
      begin
        First;
        while not Eof do
        begin
          id_Goods := cdsOperWare.FieldByName('id_Goods').Value;

          id_Measure := cdsOperWare.FieldByName('id_Measure').Value;
          Amount := cdsOperWare.FieldByName('AmountOper').AsFloat;

          PriceOperOut := cdsOperWare.FieldByName('PriceOper').AsFloat;
          PriceOperIn := cdsOperWare.FieldByName('SSPrice').AsFloat;

          OfferSumm := OfferSumm +
                       cdsOperWare.FieldByName('SummOper2').AsFloat -
                       cdsOperWare.FieldByName('SSSumm').AsFloat;


          if DM.rsCA.AppServer.OP_OperWareAdd_BackToCA(Id_out,
                               id_Goods,
                               id_Measure, Amount,
                               ABS(PriceOperOut),
                               Null,
                               true) = -1 then
            raise Exception.Create('Ошибка при создании переоценки - списание');

          if DM.rsCA.AppServer.OP_OperWareAdd_BackToCA(Id_In,
                               id_Goods, 
                               id_Measure, Amount,
                               ABS(PriceOperIn),
                               Null,
                               false) = -1 then
            raise Exception.Create('Ошибка при создании переоценки - прием');
          Next;
        end;
        First;
      end;
      if DM.rsCA.AppServer.OP_OperSetCheckDate_v2(Id_out, DM.IDUser) <> 1 then
        raise Exception.Create('Ошибка при автоматическом визировании переоценки');
      if DM.rsCA.AppServer.OP_OperSetCheckDate_v2(Id_In, DM.IDUser) <> 1 then
        raise Exception.Create('Ошибка при автоматическом визировании переоценки');
    end
    else
      raise Exception.Create('Ошибка при создании переоценки');

    // Создаем взаимозачет
    if OfferSumm <> 0 then
    begin
      FID_Oper := -1;
      OperVid := 4;
      Correct := false;
      OperTypeIn := OfferSumm > 0;
      OpComment := 'Возврат, взаимозачет - авт.';
      FID_Oper := wp_OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyOper,
                                                 ABS(OfferSumm), 0, Null, Null, Null,
                                                 id_Repr, Null, Null, Null, Null,
                                                 Null, Null,
                                                 Null, Null, 0,
                                                 Null, Null, 0,
                                                 DM.IDUser, Null,
                                                 Null, Null, Null, OpComment,
                                                 Null, Null, Null, Null, Null, Null, Null, Null,
                                                 Null, Null, Null, Null, Null, Null, Null,
                                                 Null, Null, Null, Null, Null, Null, Null, Null,
                                                 Null, Null, Null, Null, Null, Null, Null,
                                                 Null, Null, Null, Null, Null, Null, Null,
                                                 Null, Null, Null, Null, Null, Null, Null, Null, true, false);
      if FID_Oper > 0 then
      begin
        if DM.rsCA.AppServer.OP_OperSetCheckDate_v2(FID_Oper, DM.IDUser) <> 1 then
          raise Exception.Create('Ошибка при автоматическом визировании переоценки');
      end
      else
        raise Exception.Create('Ошибка при создании переоценки');
    end
    else
        raise Exception.Create('Ошибка при создании операций переоценки');;

    CommitTrans(DM.rsCA);

    Result := true;
  except
    on E : Exception do
    begin
      Screen.Cursor := OldCursor;
      RollbackTrans(DM.rsCA);
      raise Exception.Create(E.Message);
    end;
  end;
  Screen.Cursor := OldCursor;
  FID_Oper := Id_out;
end;

procedure TfWizReVal.BitBtn1Click(Sender: TObject);
begin
  if SelectObjUn(Owner, 1, ASelectedWH, 0, [eotWH]) then
  begin
    edWH.Text := ASelectedWH.Name;
  end;
end;

procedure TfWizReVal.aAddWareExecute(Sender: TObject);
begin
  AddWare;
end;

procedure TfWizReVal.xxxOne;
var ASelObj : TSelectedObj;
    Price, ID_Warehouse : OleVariant;
    ID_Cur: OleVariant;
    TotalAmount : Double;
begin
  ASelObj.ID := Null;
  with cdsOperWare do
  begin
    if not FieldByName('id_Goods').IsNull then
    begin
      ASelObj.ID := FieldByName('id_Goods').Value;
      ASelObj.ObjType := eotGoods;
    end;

    if ASelObj.ID <> Null then
    begin
      ID_Warehouse := ASelectedWH.ID;
      if DM.PL_GetDefWarePrice(ASelObj.ID, ID_Warehouse, Price, ID_Cur, TotalAmount) = -1 then
        raise Exception.Create('Ошибка при подсчете себестоимости');
      FieldByName('AmountOper').AsFloat := TotalAmount;
      FieldByName('PriceOper').AsFloat := Price;
      FieldByName('SSPrice').AsFloat := Price;
    end;
  end;
end;

procedure TfWizReVal.AddWare;
var ASelectedObj : TSelectedObj;
    Price, ID_Cur: OleVariant;
    TotalAmount : Double;
    id_Warehouse : integer;
    AID, AName : OleVariant;
    S : String;
    EObjTypes : TEObjTypes;
begin
  if ASelectedWH.ID = Null then
    with edWH do
    begin
      Windows.SetFocus(Handle);
      MessageBox(Handle, 'Не выбран склад', 'Сначала выберите склад', MB_OK + MB_ICONERROR);
      Exit;
    end;

  Screen.Cursor := crSQLWait;
  EObjTypes := [eotGoods];
  with cdsOperWare do
  begin
    if not FieldByName('id_Goods').IsNull then
    begin
      ASelectedObj.ID := FieldByName('id_Goods').Value;
      ASelectedObj.ObjType := eotGoods;
    end;

    id_Warehouse := ASelectedWH.ID;
//    ASelectedObj.ID := -1;
    if SelectObjUnBsn(Owner, ASelectedWH.Bsn_id, ASelectedObj, 0, EObjTypes, true, id_Warehouse) then
    begin
      if Locate('id_Goods', ASelectedObj.ID, []) then
      begin
        MessageBox(Handle, 'Этот товар уже выбран. Вы можете изменить его количество', 'Этот товар уже выбран', MB_ICONWARNING + MB_OK);
        DBGridEh1.Col := 2;
        Exit;
      end;

      Append;
   
      FieldByName('WareName').Value := ASelectedObj.Name;

      FieldByName('id_Goods').Value := ASelectedObj.ID;

      if DM.rsCA.AppServer.PL_WareMeasureGet(FieldByName('id_Goods').Value,
                                             AID, AName) = 1 then
      begin
        FieldByName('id_Measure').AsInteger := AID;
        FieldByName('MeasureName').AsString := AName;
        FieldByName('RealKoef').AsInteger := 1;
      end;
      xxxOne;
      Post;
    end;
  end;
 // CheckMeasure;
{  if cdsWMes.Locate('id_BaseMeasure', Null, []) then
  begin
    lcbWMes.KeyValue := cdsWMesid_Measure.AsInteger;
  end;}
end;

procedure TfWizReVal.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  aAddWare.Enabled := ASelectedWH.ID <> Null;
end;

procedure TfWizReVal.dsOperWareDataChange(Sender: TObject; Field: TField);
begin
  aDelWare.Enabled := not cdsOperWare.IsEmpty;
  aSumm.Enabled := not cdsOperWare.IsEmpty;
end;

procedure TfWizReVal.DBGridEh1ColEnter(Sender: TObject);
begin
  if cdsOperWare.State = dsEdit then
    cdsOperWare.Post;

end;

procedure TfWizReVal.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var tmpCol : TColumnEh;
    S, S2 : String;
    V : Variant;
begin
  if (ssCtrl in Shift) and (Key = 86) then
  begin
    S := DecimalSeparator;
    if S = ',' then S2 := '.' else S2 := ',';
    tmpCol := TDBGridEh(Sender).Columns[TDBGridEh(Sender).col];

    V := GetFloatFromClipBoadr;

    if (V <> 0) and ((tmpCol.Field = cdsOperWareAmountOper) or
     (tmpCol.Field = cdsOperWarePriceOper) or
     (tmpCol.Field = cdsOperWareSSPrice) or
     (tmpCol.Field = cdsOperWareSummSys)) then
     begin
       if cdsOperWare.State <> dsEdit then
         cdsOperWare.Edit;
       tmpCol.Field.AsFloat := V;
       cdsOperWare.Post;
       Key := 0;
     end;
  end;
end;

end.
