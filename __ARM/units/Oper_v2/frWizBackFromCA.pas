unit frWizBackFromCA;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, foMyFunc,
  frCurSelector, ActnList, ImgList, ComCtrls, ToolWin, Grids, DBGridEh,
  GridsEh;

type
  TfWizBackFromCA = class(TFrame)
    cdsOperFin: TClientDataSet;
    dsOperFin: TDataSource;
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
    GroupBox1: TGroupBox;
    lbReprName: TLabel;
    Label3: TLabel;
    lbSrcName: TLabel;
    Label19: TLabel;
    DBEdit3: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit8: TDBEdit;
    ed: TDBEdit;
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
    ToolButton15: TToolButton;
    cdsOperWareBackAmount: TFloatField;
    cdsOperWareBackSumm: TFloatField;
    cdsOperWareSummBackSumm: TAggregateField;
    cdsOperWareSSPrice: TFloatField;
    Panel2: TPanel;
    fCurSelector1: TfCurSelector;
    fCurSelector2: TfCurSelector;
    BitBtn1: TBitBtn;
    aCalcAmount: TAction;
    cdsOperWareAmountOper: TFloatField;
    cdsOperWarePriceOper: TFloatField;
    cdsOperWareSummSys: TFloatField;
    cdsOperWarePriceInv: TFloatField;
    procedure aDelWareExecute(Sender: TObject);
    procedure aCalcSysExecute(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure cdsOperWareCalcFields(DataSet: TDataSet);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ToolButton13Click(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure aCalcAmountExecute(Sender: TObject);
    procedure dsOperWareDataChange(Sender: TObject; Field: TField);
    procedure DBGridEh1ColEnter(Sender: TObject);
  private
    FID_Oper : integer;

    procedure CheckFooter;
    procedure xxxOne(ID_Warehouse: Variant; var Price, ID_Cur: OleVariant;
      var TotalAmount: Double);
  public
    function CheckData : boolean;
    procedure Initialize(ID_Oper : integer);
    function SaveProp: boolean;

    property ID_Oper : integer read FID_Oper;
  end;

implementation

uses uUnivSelector, uUnivOper_v2, uDM, uInputBoxDigit;

{$R *.DFM}

{ TfWizBackToCA }

procedure TfWizBackFromCA.Initialize(ID_Oper: integer);
begin
  fCurSelector1.Enabled := false;
  fCurSelector2.Enabled := false;
  with cdsOperFin do
  begin
    Close;
    Params.ParamByName('@id_Oper').Value := ID_Oper;
    Open;
    if not (not FieldByName('OperTypeIn').AsBoolean and not FieldByName('id_repr').IsNull) then
      raise Exception.Create('Это не отгрузка, невозможно оформить возврат');
    fCurSelector1.Initialize(FieldByName('id_business').AsInteger);
    fCurSelector2.Initialize(FieldByName('id_business').AsInteger);

    fCurSelector1.ID_Curr := FieldByName('Id_CurrencyOper').Value;
    fCurSelector2.ID_Curr := FieldByName('Id_CurrencySys').Value;
{    if FieldByName('Id_CurrencySys').IsNull then
      fCurSelector1.ID_Curr := FieldByName('Id_CurrencyOper').Value
    else
      fCurSelector1.ID_Curr := FieldByName('Id_CurrencySys').Value;   }
    Edit;
    FieldByName('OpComment').AsString := 'Возврат отгрузки - авт.';
    FieldByName('Correct').AsBoolean := true;
    FieldByName('OperTypeIn').AsBoolean := false;
    if not FieldByName('Id_CurrencySys').IsNull then
      FieldByName('Id_CurrencyOper').Value := FieldByName('Id_CurrencySys').Value;
    Post;
  end;
  with cdsOperWare do
  begin
    Close;
    Params.ParamByName('@id_Oper').Value := ID_Oper;
    Open;
    First;
    while not Eof do
    begin
      Edit;
      FieldByName('BackAmount').Value := FieldByName('AmountOper').Value;
      Post;
      Next;
    end;
    First;
  end;
  CheckFooter;
end;

procedure TfWizBackFromCA.aDelWareExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if DBGridEh1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(DBGridEh1.SelectedRows.Count) + ' товаров?'
  else
    S := 'Удалить товар "' + dsOperWare.DataSet.FieldByName('WareName').AsString+ '"?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if DBGridEh1.SelectedRows.Count > 0 then
      begin
        for i := 0 to DBGridEh1.SelectedRows.Count - 1 do
        begin
          DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
          dsOperWare.DataSet.Delete;
        end;
      end
      else
        dsOperWare.DataSet.Delete;
    finally

    end;


  end;
end;

procedure TfWizBackFromCA.aCalcSysExecute(Sender: TObject);
begin
//*
end;

procedure TfWizBackFromCA.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var Style, cbSize : Integer;
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
    if ((Column.Field = cdsOperWareBackAmount) and
       (cdsOperWareBackAmount.AsFloat = 0))
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

procedure TfWizBackFromCA.cdsOperWareCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('Numb').AsInteger := DataSet.RecNo;
  if DataSet.FieldByName('AmountOper').AsFloat = 0 then
    DataSet.FieldByName('SummOper2').AsFloat := DataSet.FieldByName('PriceOper').AsFloat
  else
    DataSet.FieldByName('SummOper2').AsFloat := DataSet.FieldByName('AmountOper').AsFloat * DataSet.FieldByName('PriceOper').AsFloat;

  if cdsOperFin.FieldByName('Id_CurrencySys').IsNull then
  begin
    DataSet.FieldByName('BackSumm').AsFloat := DataSet.FieldByName('PriceOper').AsFloat * DataSet.FieldByName('BackAmount').AsFloat;
  end
  else
  begin
    DataSet.FieldByName('BackSumm').AsFloat := DataSet.FieldByName('SummSys').AsFloat *
                                               DataSet.FieldByName('BackAmount').AsFloat/
                                               DataSet.FieldByName('AmountOper').AsFloat;
  end; 
end;

procedure TfWizBackFromCA.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Column.Field = cdsOperWareBackAmount) then
  begin
    if (cdsOperWareBackAmount.AsFloat > cdsOperWareAmountOper.AsFloat) then
    begin
      AFont.Color := clRed;
      AFont.Style := [fsBold];
    end
  end
  else
  begin
    if (cdsOperFin.FieldByName('Id_CurrencySys').IsNull) and (Column.Field = cdsOperWareSummSys) then
      AFont.Color := clGrayText;
    if (not cdsOperFin.FieldByName('Id_CurrencySys').IsNull) and ((Column.Field = cdsOperWareSummOper2) or (Column.Field = cdsOperWarePriceOper)) then
      AFont.Color := clGrayText;
  end;
end;

procedure TfWizBackFromCA.ToolButton13Click(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить товар "' + cdsOperWareWareName.AsString+ '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    cdsOperWare.Delete;
  end;
end;

procedure TfWizBackFromCA.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
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
     (tmpCol.Field = cdsOperWareBackAmount) or
     (tmpCol.Field = cdsOperWareSummSys)) then
      Key := S[1];
  end;
  if (Key = #13) and (cdsOperWare.State in [dsinsert, dsEdit]) then
    cdsOperWare.post;  
end;

procedure TfWizBackFromCA.CheckFooter;
var i : integer;
begin
  for i := 0 to DBGridEh1.Columns.Count - 1 do
  begin
    if DBGridEh1.Columns[i].Field = cdsOperWareSummOper2 then
    begin
      if cdsOperFin.FieldByName('Id_CurrencySys').IsNull then
        DBGridEh1.Columns[i].Footer.Font.Style := [fsBold]
      else
        DBGridEh1.Columns[i].Footer.Font.Style := [];
    end;
    if DBGridEh1.Columns[i].Field = cdsOperWareSummSys then
    begin
      if not cdsOperFin.FieldByName('Id_CurrencySys').IsNull then
        DBGridEh1.Columns[i].Footer.Font.Style := [fsBold]
      else
        DBGridEh1.Columns[i].Footer.Font.Style := [];
    end;
  end; 
end;

function TfWizBackFromCA.CheckData: boolean;
begin
  Result := false;
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
      if FieldByName('BackAmount').AsFloat <= 0 then
      begin
        Windows.SetFocus(Handle);
        MessageBox(Handle, 'Возвращаемое количество должно быть больше нуля', 'Ошибка в данных', MB_OK + MB_ICONERROR);
        Exit;
      end;
      if FieldByName('BackAmount').AsFloat > FieldByName('AmountOper').AsFloat then
      begin
        DBGridEh1.col := DBGridEh1.Columns.Count - 1;;
        MessageBox(Handle, 'Возвращаемое количество не может превышать количество отгруженного', 'Ошибка в данных', MB_OK + MB_ICONERROR);
        Exit;
      end;

      Next;
    end;
    First;
  end;
  Result := true;
end;

function TfWizBackFromCA.SaveProp: boolean;
var OldCursor : TCursor;
    id_Goods, id_Measure, Amount,
    PriceOper, SummSys: OleVariant;
    i : integer;

    OperVid, id_business, Correct,
    OperTypeIn, Id_CurrencyOper, Id_CurrencyInv, id_Repr, OpComment, id_Warehouse, Id_CurrencySys : OleVariant;

    Price, ID_Cur: OleVariant;
    TotalAmount : Double;
begin
  id_business := cdsOperFin.FieldByName('id_business').AsInteger;
  Id_CurrencyOper := cdsOperFin.FieldByName('Id_CurrencyOper').AsInteger;

  if cdsOperFin.FieldByName('Id_CurrencyOper').IsNull then
    Id_CurrencySys := cdsOperFin.FieldByName('Id_CurrencySys').AsInteger
  else
    Id_CurrencySys := cdsOperFin.FieldByName('Id_CurrencyOper').AsInteger;
  Id_CurrencyInv := cdsOperFin.FieldByName('Id_CurrencyBsn').AsInteger;
    
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  FID_Oper := -1;
  BeginTruns(DM.rsCA);
  cdsOperWare.DisableControls;
  try
    // Создаем возврат
    OperVid := 1;
    Correct := true;
    OperTypeIn := true;
    id_Repr := cdsOperFin.FieldByName('id_Repr').AsInteger;
    OpComment := 'Возврат - авт.';
    id_Warehouse := cdsOperFin.FieldByName('id_Warehouse').AsInteger;
    FID_Oper := wp_OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyInv,
                                               0, 0, Id_CurrencySys, Null, Null,
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
    if FID_Oper > 0 then
    begin
      with cdsOperWare do
      begin
        First;
        while not Eof do
        begin
          id_Goods := cdsOperWare.FieldByName('id_Goods').Value;
          
          id_Measure := cdsOperWare.FieldByName('id_Measure').Value;
          Amount := cdsOperWare.FieldByName('BackAmount').Value;
          xxxOne(ID_Warehouse, Price, ID_Cur, TotalAmount);

          if Price = 0 then
            PriceOper := cdsOperWare.FieldByName('PriceInv').Value
          else
            PriceOper := Price;
          SummSys := cdsOperWare.FieldByName('BackSumm').AsFloat;
          
          if DM.rsCA.AppServer.OP_OperWareAdd_BackToCA(FID_Oper,
                               id_Goods,
                               id_Measure, Amount,
                               PriceOper,
                               SummSys,
                               false) = -1 then
            raise Exception.Create('Ошибка при создании возвратной операции - товары');
          Next;
        end;
        First;
      end;
      if DM.rsCA.AppServer.OP_OperSetCheckDate_v2(FID_Oper, DM.IDUser) <> 1 then
        raise Exception.Create('Ошибка при автоматическом визировании возвратной операции');
    end
    else
      raise Exception.Create('Ошибка при создании возвратной операции');

    CommitTrans(DM.rsCA);

    Result := true;
    cdsOperWare.EnableControls;
  except
    on E : Exception do
    begin
      cdsOperWare.EnableControls;
      Screen.Cursor := OldCursor;
      RollbackTrans(DM.rsCA);
      raise Exception.Create(E.Message);
    end;
  end;
  Screen.Cursor := OldCursor;
end;

procedure TfWizBackFromCA.xxxOne(ID_Warehouse : Variant;
                               var Price: OleVariant;
                               var ID_Cur: OleVariant;
                               var TotalAmount : Double);
var ASelObj : TSelectedObj;
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
      if DM.PL_GetDefWarePrice(ASelObj.ID, ID_Warehouse, Price, ID_Cur, TotalAmount) = -1 then
        raise Exception.Create('Ошибка при подсчете себестоимости');
    end;
  end;
end;

procedure TfWizBackFromCA.BitBtn1Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
begin
  with cdsOperFin do
  begin
    ASelectedObj.ID := FieldByName('id_Warehouse').Value;
    ASelectedObj.ObjType := eotWH;
    if SelectObjUnBsn(Owner, FieldByName('id_business').AsInteger, ASelectedObj, 0, [eotWH]) then
    begin
      Edit;

      case ASelectedObj.ObjType of
        eotWH : FieldByName('id_Warehouse').Value := ASelectedObj.ID;
      else
        raise Exception.Create('Неверный тип возвращаемого значения');
      end;
      FieldByName('SrcName').Value := ASelectedObj.Name;
    end;
  end;
end;

procedure TfWizBackFromCA.aCalcAmountExecute(Sender: TObject);
var F : Variant;
begin
  F := cdsOperWare.FieldByName('BackAmount').AsFloat;
  if InputBoxDigit(Handle, 'Количество товара "' + cdsOperWareWareName.AsString + '"', 'Количество', F) then
  begin
    with cdsOperWare do
    begin
      Edit;
      FieldByName('BackAmount').AsFloat := F;
      Post;
    end;
  end;   
end;

procedure TfWizBackFromCA.dsOperWareDataChange(Sender: TObject;
  Field: TField);
begin
  aDelWare.Enabled := not cdsOperWare.IsEmpty;
  aCalcAmount.Enabled := not cdsOperWare.IsEmpty;
end;

procedure TfWizBackFromCA.DBGridEh1ColEnter(Sender: TObject);
begin
  if cdsOperWare.State = dsEdit then
    cdsOperWare.Post;
end;

end.
