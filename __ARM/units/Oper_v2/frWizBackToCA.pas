unit frWizBackToCA;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, foMyFunc,
  frCurSelector, ActnList, ImgList, ComCtrls, ToolWin, Grids, DBGridEh,
  GridsEh;

type
  TfWizBackToCA = class(TFrame)
    cdsOperFin: TClientDataSet;
    dsOperFin: TDataSource;
    cdsOperWare: TClientDataSet;
    cdsOperWareid_OperWare: TAutoIncField;
    cdsOperWareid_Oper: TIntegerField;
    cdsOperWareAmountOper: TFloatField;
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
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn4: TBitBtn;
    edRepr: TEdit;
    edCA: TEdit;
    cdsOperWareBackSumm: TFloatField;
    cdsOperWareSummBackSumm: TAggregateField;
    cdsOperWareSSPrice: TFloatField;
    Panel2: TPanel;
    fCurSelector1: TfCurSelector;
    fCurSelector2: TfCurSelector;
    fCurSelectorBsn: TfCurSelector;
    aCalcAmount: TAction;
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
    procedure dsOperWareDataChange(Sender: TObject; Field: TField);
    procedure aCalcAmountExecute(Sender: TObject);
    procedure DBGridEh1ColEnter(Sender: TObject);
  private
    FID_Oper : integer;
    ASelectedObj : TSelectedObj;
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

procedure TfWizBackToCA.Initialize(ID_Oper: integer);
begin
  fCurSelector1.Enabled := false;
  fCurSelector2.Enabled := false;
  fCurSelectorBsn.Enabled := false;
  with cdsOperFin do
  begin
    Close;
    Params.ParamByName('@id_Oper').Value := ID_Oper;
    Open;
    if not (FieldByName('OperTypeIn').AsBoolean and not FieldByName('id_repr').IsNull) then
      raise Exception.Create('Это не приход от контрагента, невозможно оформить возврат');
    fCurSelector1.Initialize(FieldByName('id_business').AsInteger);
    fCurSelector2.Initialize(FieldByName('id_business').AsInteger);
    fCurSelectorBsn.Initialize(FieldByName('id_business').AsInteger);

    fCurSelector1.ID_Curr := FieldByName('Id_CurrencyOper').Value;
    fCurSelector2.ID_Curr := FieldByName('Id_CurrencySys').Value;
    fCurSelectorBsn.ID_Curr := FieldByName('Id_CurrencyBsn').Value;
{    if FieldByName('Id_CurrencySys').IsNull then
      fCurSelector1.ID_Curr := FieldByName('Id_CurrencyOper').Value
    else
      fCurSelector1.ID_Curr := FieldByName('Id_CurrencySys').Value;   }
    Edit;
    FieldByName('OpComment').AsString := 'Возврат контагенту - авт.';
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

procedure TfWizBackToCA.BitBtn4Click(Sender: TObject);
begin
  if SelectObjUnBsn(Owner, cdsOperFin.FieldByName('id_business').AsInteger, ASelectedObj, 0, [eotRepr]) then
  begin
    edRepr.Text := ASelectedObj.Name;
    edCA.Text := ASelectedObj.CA_Name;

  end;
end;

procedure TfWizBackToCA.aDelWareExecute(Sender: TObject);
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

procedure TfWizBackToCA.aCalcSysExecute(Sender: TObject);
begin
//*
end;

procedure TfWizBackToCA.aSummExecute(Sender: TObject);
begin
//*
end;

procedure TfWizBackToCA.DBGridEh1DrawColumnCell(Sender: TObject;
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

procedure TfWizBackToCA.cdsOperWareCalcFields(DataSet: TDataSet);
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

procedure TfWizBackToCA.DBGridEh1GetCellParams(Sender: TObject;
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

procedure TfWizBackToCA.ToolButton13Click(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить товар "' + cdsOperWareWareName.AsString+ '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    cdsOperWare.Delete;
  end;
end;

procedure TfWizBackToCA.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
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

procedure TfWizBackToCA.CheckFooter;
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

function TfWizBackToCA.CheckData: boolean;
begin
  Result := false;
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

function TfWizBackToCA.SaveProp: boolean;
var OldCursor : TCursor;
    id_Goods,
    id_Measure, PriceOper: OleVariant;
    Amount, PriceOperIn, PriceOperOut: OleVariant;
    i : integer;

    OperVid, id_business, Correct,
    OperTypeIn, Id_CurrencyOper, id_Repr, OpComment, id_Warehouse, Id_CurrencyInv : OleVariant;

    Price, ID_Cur: OleVariant;
    TotalAmount, OfferSumm : Double;
    Id_in, Id_out : integer;
    CrossCurs : Double;
    Rate : Double;
    NeedInOut : boolean;
begin
  OfferSumm := 0;
  NeedInOut := false;                 
  id_business := cdsOperFin.FieldByName('id_business').AsInteger;
  Id_CurrencyOper := cdsOperFin.FieldByName('Id_CurrencyOper').AsInteger;
  Id_CurrencyInv := cdsOperFin.FieldByName('Id_CurrencyBsn').AsInteger;
{  if fCurSelector2.ID_Curr <> Null then
  begin
    ID_Cur := fCurSelector2.ID_Curr;
    Rate := fCurSelector2.RateRBL;
  end
  else
  begin
    ID_Cur := fCurSelector1.ID_Curr;
    Rate := fCurSelector1.RateRBL;
  end;
  if ID_Cur <> fCurSelectorBsn.ID_Curr then
    Rate := Rate/fCurSelectorBsn.RateRBL
  else
    Rate := 1;  }

 { if fCurSelector2.ID_Curr <> Null then
  begin
    ID_Cur := fCurSelector2.ID_Curr;
    Rate := fCurSelector2.RateRBL;
  end
  else  }
  begin
    ID_Cur := fCurSelector1.ID_Curr;
    Rate := fCurSelector1.RateRBL;
  end;
  if ID_Cur <> fCurSelectorBsn.ID_Curr then
    Rate := Rate/fCurSelectorBsn.RateRBL
  else
    Rate := 1;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  cdsOperWare.DisableControls;
  try
    Result := false;
    FID_Oper := -1;
    BeginTruns(DM.rsCA);
    try
      // Создаем возврат
      OperVid := 1;
      Correct := true;
      OperTypeIn := false;
      id_Repr := cdsOperFin.FieldByName('id_Repr').AsInteger;
      OpComment := 'Возврат отгрузки - авт.';
      id_Warehouse := cdsOperFin.FieldByName('id_Warehouse').AsInteger;
      FID_Oper := wp_OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyOper,
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

            PriceOper := cdsOperWare.FieldByName('BackSumm').AsFloat/cdsOperWare.FieldByName('BackAmount').AsFloat;
          
            if DM.rsCA.AppServer.OP_OperWareAdd_BackToCA(FID_Oper,
                                 id_Goods,
                                 id_Measure, Amount,
                                 PriceOper,
                                 Null,
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
      // Создаем переоценку

      with cdsOperWare do
      begin
        First;
        while not Eof do
        begin
          xxxOne(ID_Warehouse, Price, ID_Cur, TotalAmount);
          if TotalAmount > 0 then
          begin
            NeedInOut := true;
            Break;
          end;
          Next;
        end;
      end;

      if NeedInOut then
      begin
        Id_in := -1;
        Id_out := -1;

        Correct := false;
        OperVid := 1;
        id_Repr := ASelectedObj.ID;
        OpComment := 'Возврат отгрузки, переоценка - авт.';
        id_Warehouse := cdsOperFin.FieldByName('id_Warehouse').AsInteger;

        OperTypeIn := false;
        Id_out := wp_OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyInv,
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
        Id_in := wp_OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyInv,
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
              xxxOne(ID_Warehouse, Price, ID_Cur, TotalAmount);
              if TotalAmount > 0 then
              begin
                id_Goods := cdsOperWare.FieldByName('id_Goods').Value;

                id_Measure := cdsOperWare.FieldByName('id_Measure').Value;

                Amount := TotalAmount;

                PriceOperOut := Price;

    //            PriceOperIn := Price - (cdsOperWare.FieldByName('BackSumm').AsFloat*Rate - Price * cdsOperWare.FieldByName('BackAmount').AsFloat)/TotalAmount;
                PriceOperIn := Price - (cdsOperWare.FieldByName('PriceOper').AsFloat * cdsOperWare.FieldByName('BackAmount').AsFloat*Rate  - Price * cdsOperWare.FieldByName('BackAmount').AsFloat)/TotalAmount;


                OfferSumm := OfferSumm - (Price - PriceOperIn)*TotalAmount;
            
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
                end;
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
          OperTypeIn := OfferSumm < 0;
          id_Repr := ASelectedObj.ID;
          OpComment := 'Возврат, взаимозачет - авт.';
          FID_Oper := wp_OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyInv,
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
            raise Exception.Create('Ошибка при создании переоценки');;
        end;

      end;
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
  finally
    cdsOperWare.EnableControls;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfWizBackToCA.xxxOne(ID_Warehouse : Variant;
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

procedure TfWizBackToCA.dsOperWareDataChange(Sender: TObject;
  Field: TField);
begin
  aDelWare.Enabled := not cdsOperWare.IsEmpty;
  aCalcAmount.Enabled := not cdsOperWare.IsEmpty;
end;

procedure TfWizBackToCA.aCalcAmountExecute(Sender: TObject);
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

procedure TfWizBackToCA.DBGridEh1ColEnter(Sender: TObject);
begin
  if cdsOperWare.State = dsEdit then
    cdsOperWare.Post;

end;

end.
