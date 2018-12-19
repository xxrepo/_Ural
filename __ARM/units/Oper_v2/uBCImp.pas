unit uBCImp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, RxMemDS, StdCtrls, Mask, ToolEdit, Grids, DBGrids, RXDBCtrl, ComCtrls, ComObj,
  BaseGrid, AdvGrid, AdvEdit, AdvEdBtn, AdvFileNameEdit, Placemnt, ADODB,
  RxLookup, Menus, frBsnSelector, DBClient, ExtCtrls, DBGridEh;

type
  TBCImp = class(TForm)
    RxMemoryData1: TRxMemoryData;
    PageControl1: TPageControl;
    tsFile: TTabSheet;
    tsData: TTabSheet;
    RxDBGrid1: TDBGridEh;
    FormStorage1: TFormStorage;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    Excel1: TMenuItem;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnParse1: TButton;
    btnSave1: TButton;
    AdvFileNameEdit1: TAdvFileNameEdit;
    AdvFileNameEdit3: TAdvFileNameEdit;
    btnSave3: TButton;
    AdvFileNameEdit4: TAdvFileNameEdit;
    btnParse3: TButton;
    btnParse4: TButton;
    btnSave4: TButton;
    cbMode: TCheckBox;
    tsRep: TTabSheet;
    tsCorr: TTabSheet;
    Jcnfnrb: TLabel;
    AdvFileNameEdit2: TAdvFileNameEdit;
    btnParse2: TButton;
    btnSave2: TButton;
    Label1: TLabel;
    Label5: TLabel;
    cdsBCRep: TClientDataSet;
    cdsBCRepid_WareHouse: TIntegerField;
    cdsBCRepid_Goods: TIntegerField;
    cdsBCRepTotalAmount: TBCDField;
    cdsBCRepTotalSum: TBCDField;
    cdsBCRepid_Session: TIntegerField;
    cdsBCRepcomment: TStringField;
    cdsBCRepeventType: TIntegerField;
    cdsBCRepWHName: TStringField;
    cdsBCRepGoodsName: TStringField;
    dsBCRep: TDataSource;
    RxDBGrid2: TDBGridEh;
    cdsBCRepName: TStringField;
    Panel1: TPanel;
    lbRep: TLabel;
    cdsSelRep: TClientDataSet;
    dsSelRep: TDataSource;
    RxDBGrid3: TDBGridEh;
    cdsSelRepWHName: TStringField;
    cdsSelRepTotalAmount: TBCDField;
    cdsSelRepTotalSum: TBCDField;
    cdsSelRepAmountFile: TBCDField;
    cdsSelRepTotalFile: TBCDField;
    cdsSelRepDelta_A: TFloatField;
    cdsSelRepDelta_S: TFloatField;
    fBsnSelector1: TfBsnSelector;
    procedure btnParse1Click(Sender: TObject);
    procedure btnSave1Click(Sender: TObject);
    procedure btnParse2Click(Sender: TObject);
    procedure btnSave2Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure btnSave3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AdvFileNameEdit1Change(Sender: TObject);
    procedure AdvFileNameEdit2Change(Sender: TObject);
    procedure AdvFileNameEdit3Change(Sender: TObject);
    procedure btnParse3Click(Sender: TObject);
    procedure btnParse4Click(Sender: TObject);
    procedure btnSave4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsSelRepCalcFields(DataSet: TDataSet);
  private
    WH1_Amount, WH1_Summ, WH2_Amount, WH2_Summ : Variant;

    procedure AddG(WHNAme : String; Amount, Price : Variant);
    procedure CheckBTN;
    procedure DoSale(ACAName: String; AType : String);
    procedure DoParse(AFile: String);
    function GetMode : integer;
    procedure ShowRep(id_Session, Mode : integer);
    procedure ClWH;

    
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    procedure CreateParams(var Params: TCreateParams); override;

    procedure AutoSizeCol;
  end;

procedure ShowBCImp;

implementation

uses uDM, uPrgForm, foMyFuncEhExcel;

{$R *.DFM}
procedure ShowBCImp;
var F : TBCImp;
begin
  F := TBCImp.Create(nil);
  try
    with F do
    begin
      F.Show;
    end;
  except
    F.Free;
  end;
end;


function GetMes(AStr : String) : String;
var S : String;
begin
  if POS(' (', AStr) > 0 then
  begin
    S := Copy(AStr, POS(' (', AStr) + 2, 1000);
    S := StringReplace(S, ')', '', []);
    Result := trim(S);
    if POS(' (', Result) > 0 then
      Result := GetMes(Result);
  end;
end;


procedure SplitName(AStr : String; var AName, AMes : String);
var S : String;
    i, x : integer;
begin
  i := POS(' (', AStr);
  S := Copy(AStr, i + 2, 1000);
  x := POS('(', S);
  if x > 0 then
    i := i + x;

  if i > 0 then
  begin
    S := Copy(AStr, 1, i - 1);
    AName := trim(S);

    S := Copy(AStr, i + 2, 1000);
    S := StringReplace(S, ')', '', []);
    AMes := trim(S);
    if POS(' (', AMes) > 0 then
      AMes := GetMes(AMes);
  end;
      AName := StringReplace(AName, #10, ' ', []);
      AMes := StringReplace(AMes, #10, ' ', []);
end;


function GetGoodsName(AStr : String) : String;
var S : String;
begin
  if POS('(', AStr) > 0 then
  begin
    S := Copy(AStr, 1, POS('(', AStr) - 1);
    Result := trim(S);
  end;
end;

procedure TrimDataSet(AFirstWord, ADelWord1, ADelWord2, ADelWord3, ADelWord4 : String; ADataSet: TDataSet);
var i, j, XXX : integer;
    b : boolean;
begin
  b := true;
  ADataSet.First;
  while not ADataSet.Eof do
  begin
        ShowProgressForm(0, -1, -1, 'Идет загрузка ' + IntToStr(ADataSet.RecNo), ADataSet.RecNo, ADataSet.RecordCount);
      XXX := -1;
      for i := 0 to ADataSet.FieldCount - 1 do
      begin
        if POS('Дата печати', ADataSet.Fields[i].AsString) > 0 then
        begin
          ADataSet.Edit;
          ADataSet.FieldByName('isEmpty').AsInteger := 1;
          ADataSet.Post;
        end;
        if POS('Итого по группе', ADataSet.Fields[i].AsString) > 0 then
        begin
          ADataSet.Edit;
          ADataSet.FieldByName('isEmpty').AsInteger := 1;
          ADataSet.Post;
        end;
        if ADataSet.Fields[i].AsString = ADelWord1 then
        begin
          ADataSet.Edit;
          ADataSet.FieldByName('isEmpty').AsInteger := 1;
          ADataSet.Post;
        end;
        if ADataSet.Fields[i].AsString = ADelWord2 then
        begin
          ADataSet.Edit;
          ADataSet.FieldByName('isEmpty').AsInteger := 1;
          ADataSet.Post;
        end;
        if ADataSet.Fields[i].AsString = ADelWord3 then
        begin
          ADataSet.Edit;
          ADataSet.FieldByName('isEmpty').AsInteger := 1;
          ADataSet.Post;
        end;
        if ADataSet.Fields[i].AsString = ADelWord4 then
        begin
          ADataSet.Edit;
          ADataSet.FieldByName('isEmpty').AsInteger := 1;
          ADataSet.Post;
        end;
    {    if ADataSet.Fields[i].AsString = AFirstWord then
        begin
        ADataSet.Edit;
        ADataSet.FieldByName('isEmpty').AsInteger := 1;
        ADataSet.Post;
          XXX := i;
          b := false;
          Break;
        end; }
      end;   
     { if (XXX = -1) and B then
      begin
        ADataSet.Edit;
        ADataSet.FieldByName('isEmpty').AsInteger := 1;
        ADataSet.Post;
      end;  }


    if ADataSet.FieldByName('isEmpty').Value = 1 then
    begin
      ADataSet.delete;
    end
    else  
      ADataSet.Next;
  end;
//  ADataSet.Fields.Remove(ADataSet.Fields[0]);
  ADataSet.First;
    CloseProgressForm;
end;

procedure TrimDataSet2(ADataSet: TDataSet; AField1, AField2  : TField);
var i, j, XXX : integer;
    b : boolean;
begin
  b := true;
  ADataSet.First;
  while not ADataSet.Eof do
  begin
        ShowProgressForm(0, -1, -1, 'Идет чтение данных ' + IntToStr(ADataSet.RecNo), ADataSet.RecNo, ADataSet.RecordCount);
    if (AField1.asstring = '') and (AField2.asstring = '') then
        begin
          ADataSet.delete;
        end
        else
      ADataSet.Next;

  end;
  for i := ADataSet.FieldCount - 1 downto 0 do
  begin
    ADataSet.First;
    b := false;
        ShowProgressForm(0, -1, -1, 'Идет чтение данных ' + IntToStr(i), i, ADataSet.FieldCount);
    while not ADataSet.Eof do
    begin
       if ADataSet.Fields[i].AsString <> '' then
       begin
         b := true;
         Break;
       end;
      ADataSet.Next;
    end;
    if not b then
      ADataSet.Fields.Remove(ADataSet.Fields[i]);
  end;
    ADataSet.First;
    CloseProgressForm;
end;

procedure ExcelToDataSet(APath : String; ADataSet: TDataSet; AColCount : integer = -1; AClear : boolean = true; AText : String = '33');
var i, j, MaxColWdth : integer;
    OldValue : Variant;
    Column, Sheet, Cell1, Cell2, Range,
    DataValues, ExcelApp : Variant;
    BeginCol, BeginRow, k, xStep, EmptyRows: integer;
    S, SSS : String;
    AHandle : HWnd;
begin
  if FileExists(APath) then
  begin
    try
      Screen.Cursor := crSQLWait;
      ShowProgressForm(0, -1, -1, 'Идет открытие файла...');
      ExcelApp := CreateOleObject('Excel.Application');
      ExcelApp.Visible := true;
      try ExcelApp.WorkBooks.Add(APath); except end;
  //    ExcelApp.Visible := true;
      Application.BringToFront;
      if AColCount = -1 then AColCount := 25;

      Sheet := ExcelApp.Workbooks[1].WorkSheets[1];
      BeginCol := 1;
      BeginRow := 1;

      if AClear then
      begin
        ADataSet.Close;
        ADataSet.Fields.Clear;
        ADataSet.FieldDefs.Clear;
        ADataSet.FieldDefs.Add('isEmpty', ftInteger);
        ADataSet.FieldDefs.Add('RecNo', ftInteger);
        ADataSet.FieldDefs.Add('AText', ftString, 255);


        for i := 0 to AColCount + 0 do
        begin
          ADataSet.FieldDefs.Add('Col_' + Chr(ORD('A') + i), ftString, 255);
        end;
        ADataSet.Open;
      end;
      xStep := 100;
      k := 1;

      while true do
      begin
        ShowProgressForm(0, -1, -1, 'Идет декодирование файла. Читается блок ' + Inttostr(k));

        Cell1 := Sheet.Cells[BeginRow + (k - 1) * xStep, BeginCol];
        Cell2 := Sheet.Cells[BeginRow + k * xStep - 1, BeginCol + AColCount];
        Range := Sheet.Range[Cell1, Cell2];
   //   DataValues := VarArrayCreate([1, xStep, 1, AColCount], varVariant);
        DataValues := Range.Value;

        for i := 1 to VarArrayHighBound(DataValues, 1) do
        begin
          ADataSet.Append;
          ADataSet.FieldByName('isEmpty').AsInteger := 1;
          ADataSet.FieldByName('AText').AsString := AText;
          ADataSet.FieldByName('RecNo').AsInteger := ADataSet.RecordCount + 1;
          for j := 1 to VarArrayHighBound(DataValues, 2) do
          begin
            S := DataValues[i, j];
       //     ADataSet.Fields[j + 1].Value := S;
            if ADataSet.FindField('Col_' + Chr(ORD('A') + j)) <> nil then
              ADataSet.FieldByName('Col_' + Chr(ORD('A') + j)).Value := S;

            if trim(VarToStr(S)) <> '' then
              ADataSet.Fields[0].Value := 0;
          end;
          ADataSet.Post;
          if ADataSet.Fields[0].Value = 0 then
            EmptyRows := 0
          else
            EmptyRows := EmptyRows + 1;
        end;
        if EmptyRows > xStep then
        begin
          inc(k);
          Break;
        end;

        
        inc(k);
      end;
      Screen.Cursor := crDefault;
      CloseProgressForm;
    finally
      CloseProgressForm;
      Screen.Cursor := crDefault;
      ExcelApp.Workbooks[1].Close(false);
      ExcelApp.Quit;
      ExcelApp := Null;
    end;
  end;
end;


procedure TBCImp.btnParse1Click(Sender: TObject);
var i : integer;
begin
  RxDBGrid1.DataSource := nil;
  ExcelToDataSet(AdvFileNameEdit1.FileName, RxMemoryData1);
  TrimDataSet2(RxMemoryData1, RxMemoryData1.fieldbyName('Col_d'), RxMemoryData1.fieldbyName('Col_e'));
  TrimDataSet('Получатель', 'с/вyy', 'Колич.', 'Итого:', 'екнруыипк', RxMemoryData1);
  RxDBGrid1.DataSource := DataSource1;
  AutoSizeCol;
  btnSave1.Enabled := true;
  (Sender as TButton).Enabled := false;
  RxDBGrid1.DataSource.Dataset.First;
end;

procedure TBCImp.btnSave1Click(Sender: TObject);
var id_business: Variant;
    GoodsName,
  BarCode, MeasureName, CAName, SPer: String; AmountOper, PriceOper,
  PriceInv, DateLocal: Variant; id_UserCreator,
  id_Session, WHName, Contract: Variant;
  D, D2, DDelta : TDateTime;
begin
try  D := Now;
  ClWH;
  id_Session := -1;
  if fBsnSelector1.ID = -1 then
    raise Exception.Create('Не выбран бизнес');
  id_business := fBsnSelector1.ID;
    DateLocal := now;
    id_UserCreator := Null;
  RxMemoryData1.First;
  while not RxMemoryData1.eof do
  begin
    if RxMemoryData1.RecNo mod 10 = 1 then
      DDelta := Now - D2;

        ShowProgressForm(0, -1, -1, 'Идет загрузка ' + IntToStr(RxMemoryData1.RecNo) + ' из ' + IntToStr(RxMemoryData1.RecordCount) + ' ' + FormatDatetime('время загрузки одной операции zzz миллисекунд', DDelta), RxMemoryData1.RecNo, RxMemoryData1.RecordCount);
    AmountOper := 0;
    PriceOper := 0;
    if (POS('Период', RxMemoryData1.fieldbyName('Col_D').AsString)> 0) then
    begin
      SPer := RxMemoryData1.fieldbyName('Col_D').AsString;
      SPer := StringReplace(SPer, 'Периодс', 'Период с', []);
    end;
    if RxMemoryData1.fieldbyName('Col_E').AsString = '' then
    begin
      SplitName(RxMemoryData1.fieldbyName('Col_D').AsString, GoodsName, MeasureName);
    //   := GetGoodsName();
      BarCode := '';
    //   := GetMes(RxMemoryData1.fieldbyName('Col_D').AsString);
    end
    else
    begin
      if ((RxMemoryData1.fieldbyName('Col_D').AsString = 'в/п') and (RxMemoryData1.fieldbyName('Col_M').AsFloat > 0)) or
         (RxMemoryData1.fieldbyName('Col_D').AsString = 'а/п') or
         (RxMemoryData1.fieldbyName('Col_D').AsString = 'к') or
         (RxMemoryData1.fieldbyName('Col_D').AsString = 'с/в') or
         (RxMemoryData1.fieldbyName('Col_D').AsString = 'р/н') or
         (RxMemoryData1.fieldbyName('Col_D').AsString = 'п/н') then
      begin
        CAName := RxMemoryData1.fieldbyName('Col_j').AsString;
        WHName := RxMemoryData1.fieldbyName('Col_L').AsString;
        if RxMemoryData1.fieldbyName('Col_M').AsString <> '' then
          AmountOper := (RxMemoryData1.fieldbyName('Col_M').AsFloat)
        else
          AmountOper := 0;
        if (RxMemoryData1.fieldbyName('Col_P').AsString <> '') and (AmountOper <> 0) then
          PriceOper := ABS(RxMemoryData1.fieldbyName('Col_P').AsFloat/AmountOper);
        PriceInv := Null;
        DateLocal := RxMemoryData1.fieldbyName('Col_F').AsDateTime;
        Contract := RxMemoryData1.fieldbyName('Col_D').AsString + ' №' + RxMemoryData1.fieldbyName('Col_E').AsString +
                    ' от ' + RxMemoryData1.fieldbyName('Col_F').AsString;

      Contract := StringReplace(Contract, #10, ' ', []);

        if (RxMemoryData1.fieldbyName('Col_D').AsString = 'р/н') then
        begin
          CAName := RxMemoryData1.fieldbyName('Col_l').AsString;
          WHName := RxMemoryData1.fieldbyName('Col_j').AsString;
        end;
        if (RxMemoryData1.fieldbyName('Col_D').AsString = 'а/п') then
        begin
          CAName := 'Переработка продукта';
          WHName := RxMemoryData1.fieldbyName('Col_j').AsString;
        end;
        if (RxMemoryData1.fieldbyName('Col_D').AsString = 'с/в') then
        begin
          CAName := 'с/в ' + RxMemoryData1.fieldbyName('Col_j').AsString;
          WHName := RxMemoryData1.fieldbyName('Col_j').AsString;
        end;
        if (RxMemoryData1.fieldbyName('Col_D').AsString = 'к') then
        begin
          CAName := 'Калькуляционные нормы';
          WHName := RxMemoryData1.fieldbyName('Col_j').AsString;
        end;
        if ((RxMemoryData1.fieldbyName('Col_D').AsString = 'в/п') and (RxMemoryData1.fieldbyName('Col_M').AsFloat > 0)) then
        begin
          tag := 0;
        //  AmountOper := -AmountOper;
        end;

      end;
    end;

    if (AmountOper <> 0) and (CAName<>'реализация') then
    begin
      D2 := Now;
            AddG(WHName, AmountOper, PriceOper);
      if id_Session = -1 then  id_Session := DM.rsCA.AppServer.Getid_Session(fBsnSelector1.ID, false, 'Движение ' + SPer);

          DM.rsCA.AppServer.AddOper(id_business, WHName, GoodsName, BarCode, MeasureName,
  CAName, AmountOper, PriceOper, DateLocal, id_Session, Contract, GetMode);
      AmountOper := 0;
    end;
    RxMemoryData1.Next;
  end;
  CloseProgressForm;
  btnSave1.Enabled := false;
  ShowRep(-1, 2);
  MessageBox(handle, pchar(FormatDatetime('Операция завершена. Затрачено времени nn.ss', Now - D)), '', MB_OK );
finally
  CloseProgressForm;
  Screen.Cursor := crDefault;
end;
end;

procedure TBCImp.btnParse2Click(Sender: TObject);
var i : integer;
begin
  RxDBGrid1.DataSource := nil;
  ExcelToDataSet(AdvFileNameEdit2.FileName, RxMemoryData1);
  TrimDataSet2(RxMemoryData1, RxMemoryData1.fieldbyName('Col_B'), RxMemoryData1.fieldbyName('Col_C'));
  TrimDataSet('ooooooo', 'Товар', 'Код', 'Итого по группе', 'Итого', RxMemoryData1);
  RxDBGrid1.DataSource := DataSource1;

  AutoSizeCol;        
  btnSave2.Enabled := true;
  (Sender as TButton).Enabled := false;
  RxDBGrid1.DataSource.Dataset.First;
end;

procedure TBCImp.btnSave2Click(Sender: TObject);
var id_business: Variant;
    GoodsName, BarCode, MeasureName, CAName: String; AmountOper, PriceOper,
  PriceInv, DateLocal: Variant; id_UserCreator,
  id_Session, WHName: Variant;
  D : TDateTime;
begin
try
  ClWH;
  D := Now;
  if fBsnSelector1.ID = -1 then
    raise Exception.Create('Не выбран бизнес');
  id_Session := -1;
  id_business := fBsnSelector1.ID;

    id_UserCreator := Null;
  RxMemoryData1.First;
  AmountOper := 0;
  while not RxMemoryData1.eof do
  begin
        ShowProgressForm(0, -1, -1, 'Идет загрузка. Операция ' + IntToStr(RxMemoryData1.RecNo), RxMemoryData1.RecNo, RxMemoryData1.RecordCount);
    if (RxMemoryData1.fieldbyName('Col_B').AsString = 'На дату:') then
      DateLocal := RxMemoryData1.fieldbyName('Col_E').AsDateTime - 1;
    if (RxMemoryData1.fieldbyName('Col_C').AsString = '') and (POS('Склад', RxMemoryData1.fieldbyName('Col_B').AsString)> 0) then
      WHName := RxMemoryData1.fieldbyName('Col_B').AsString;
    if RxMemoryData1.fieldbyName('Col_C').AsString <> '' then
    begin
      GoodsName := trim(RxMemoryData1.fieldbyName('Col_C').AsString);
      GoodsName := StringReplace(GoodsName, #10, ' ', []);
      BarCode := RxMemoryData1.fieldbyName('Col_B').AsString;
      MeasureName := trim(RxMemoryData1.fieldbyName('Col_F').AsString);
      MeasureName := StringReplace(MeasureName, #10, ' ', []);

      AmountOper := RxMemoryData1.fieldbyName('Col_H').AsVariant;
      if AmountOper <> 0 then
      begin
        PriceOper := RxMemoryData1.fieldbyName('Col_J').AsVariant/AmountOper;
      end
      else
      begin
        PriceOper := Null;
      end;
    end;

    if AmountOper <> 0 then
    begin
            AddG(WHName, AmountOper, PriceOper);
                if id_Session = -1 then  id_Session := DM.rsCA.AppServer.Getid_Session(fBsnSelector1.ID, true, 'Ревизия от ' + FormatDateTime('dd-mm-yyyy', DateLocal));

          DM.rsCA.AppServer.CI_WareCorrect(id_business, WHName, GoodsName, BarCode,
  MeasureName, AmountOper, PriceOper, DateLocal, id_Session, GetMode);
      AmountOper := 0;
    end;
    RxMemoryData1.Next;
  end;
  CloseProgressForm;
  btnSave2.Enabled := false;

  ShowRep(id_Session, 1);
  MessageBox(handle, pchar(FormatDatetime('Операция завершена. Затрачено времени nn.ss', Now - D)), '', MB_OK );
finally
  CloseProgressForm;
  Screen.Cursor := crDefault;
end;
end;
procedure TBCImp.ShowRep(id_Session, Mode : integer);
begin
  PageControl1.ActivePage := tsRep;

  cdsSelRep.Close;
  cdsSelRep.Params.ParamByName('@id_Session').Value := id_Session;
  cdsSelRep.Params.ParamByName('@Mode').Value := Mode;
  cdsSelRep.Params.ParamByName('@WH1_Amount').Value := WH1_Amount;
  cdsSelRep.Params.ParamByName('@WH2_Amount').Value := WH2_Amount;
  cdsSelRep.Params.ParamByName('@WH1_Summ').Value := WH1_Summ;
  cdsSelRep.Params.ParamByName('@WH2_Summ').Value := WH2_Summ;
  cdsSelRep.Open;

  cdsBCRep.Close;
  cdsBCRep.Params.ParamByName('@id_Session').Value := id_Session;
  cdsBCRep.Open;

  if cdsBCRep.IsEmpty then
    lbRep.Caption := 'Нет ошибок или сообщений'
  else
    lbRep.Caption := 'Обратите внимание на сообщения!!!'
end;

procedure TBCImp.Excel1Click(Sender: TObject);
begin
  foMyFuncEhExcel.GreedToExcel(RxDBGrid1, '');
end;

procedure TBCImp.btnSave3Click(Sender: TObject);
begin
  DoSale('Реализация - КАРТЫ', 'КАРТЫ');
  btnSave3.Enabled := false;
end;

procedure TBCImp.DoSale(ACAName : String; AType : String);
var id_business, GoodsName, BarCode, MeasureName, CAName, AmountOper, PriceOper,
      PriceInv, DateLocal, id_UserCreator, id_Session, WHName: Variant;
  D : TDateTime;
       S, SPer : String;
begin
try
  ClWH;
  D := Now;
  if fBsnSelector1.ID = -1 then
    raise Exception.Create('Не выбран бизнес');
  id_Session := -1;
  id_business := fBsnSelector1.ID;

    id_UserCreator := Null;
  RxMemoryData1.First;
      AmountOper := 0;
      GoodsName := '';
  while not RxMemoryData1.eof do
  begin
        ShowProgressForm(0, -1, -1, 'Идет загрузка. Операция ' + IntToStr(RxMemoryData1.RecNo), RxMemoryData1.RecNo, RxMemoryData1.RecordCount);
    if (RxMemoryData1.fieldbyName('Col_C').AsString = '') and (POS('Склад', RxMemoryData1.fieldbyName('Col_B').AsString)> 0) then
    begin
      WHName := RxMemoryData1.fieldbyName('Col_B').AsString;
    end;

    if (POS('Период', RxMemoryData1.fieldbyName('Col_B').AsString)> 0) then
    begin
      S := RxMemoryData1.fieldbyName('Col_B').AsString;
      SPer := S;
      SPer := StringReplace(SPer, 'Периодс', 'Период с', []);
      if POS(' по ', S) > 0 then
        S := COPY(S, POS(' по ', S) + 4, 1000);
        try
          DateLocal := StrToDate(S);
        except
          DateLocal := now;
        end;
    end;
      if RxMemoryData1.fieldbyName('Col_C').AsString <> '' then
      begin
        GoodsName := (RxMemoryData1.fieldbyName('Col_C').AsString);
        BarCode := RxMemoryData1.fieldbyName('Col_B').AsString;
        MeasureName := (RxMemoryData1.fieldbyName('Col_G').AsString);
        AmountOper := 0;

          CAName := ACAName + '-' + WHName;
          AmountOper := RxMemoryData1.fieldbyName('Col_I').AsString;

          if (AmountOper <> 0) and (RxMemoryData1.fieldbyName('Col_K').AsString <> '') then
          begin
            PriceOper := RxMemoryData1.fieldbyName('Col_K').AsFloat/AmountOper;
            PriceInv := RxMemoryData1.fieldbyName('Col_Q').AsFloat/AmountOper;
          end
          else
          begin
            PriceOper := 0;
            PriceInv := 0;
          end;
      end;

    if AmountOper > 0 then
    begin
      AddG(WHName, AmountOper, PriceOper);
                if id_Session = -1 then
                id_Session := DM.rsCA.AppServer.Getid_Session(fBsnSelector1.ID, false, 'Марочный ' + AType + ' ' + SPer);

          DM.rsCA.AppServer.AddMov(id_business, WHName, GoodsName, BarCode, MeasureName,
  CAName, AmountOper, PriceOper, PriceInv, DateLocal, id_Session, GetMode);

      AmountOper := 0;
    end;
    RxMemoryData1.Next;
  end;
  CloseProgressForm;
  ShowRep(id_Session, 2);
  MessageBox(handle, pchar(FormatDatetime('Операция завершена. Затрачено времени nn.ss', Now - D)), '', MB_OK );
finally
  CloseProgressForm;
  Screen.Cursor := crDefault;
end;
end;

procedure TBCImp.FormShow(Sender: TObject);
begin
  CheckBTN;
end;
procedure TBCImp.CheckBTN;
begin
  btnParse1.Enabled := AdvFileNameEdit1.Filename <> '';
  btnParse2.Enabled := AdvFileNameEdit2.Filename <> '';
  btnParse3.Enabled := (AdvFileNameEdit3.Filename <> '');
  btnParse4.Enabled := (AdvFileNameEdit3.Filename <> '');
end;

procedure TBCImp.AdvFileNameEdit1Change(Sender: TObject);
begin
  CheckBTN;
end;

procedure TBCImp.AdvFileNameEdit2Change(Sender: TObject);
begin
 CheckBTN;
end;

procedure TBCImp.AdvFileNameEdit3Change(Sender: TObject);
begin
  CheckBTN;
end;

procedure TBCImp.btnParse3Click(Sender: TObject);
begin
  DoParse(AdvFileNameEdit3.FileName);
  btnSave3.Enabled := true;
  (Sender as TButton).Enabled := false;
end;

procedure TBCImp.DoParse(AFile : String);
var i : integer;
begin
  RxDBGrid1.DataSource := nil;
  ExcelToDataSet(AFile, RxMemoryData1);
  TrimDataSet2(RxMemoryData1, RxMemoryData1.fieldbyName('Col_B'), RxMemoryData1.fieldbyName('Col_D'));
  TrimDataSet('ooooooo', 'Наименование', 'Порча продуктов', 'Итого по группе', 'Итого', RxMemoryData1);
  RxDBGrid1.DataSource := DataSource1;

  AutoSizeCol;
  RxDBGrid1.DataSource.Dataset.First;
end;

procedure TBCImp.btnParse4Click(Sender: TObject);
begin
  DoParse(AdvFileNameEdit4.FileName);
  btnSave4.Enabled := true;
  (Sender as TButton).Enabled := false;
  AutoSizeCol;
end;

procedure TBCImp.btnSave4Click(Sender: TObject);
begin
  DoSale('Реализация - НАЛ', 'НАЛ');
  btnSave4.Enabled := false;

end;

function TBCImp.GetMode: integer;
begin
  if cbMode.Checked then
    Result := 0
  else
    Result := 1;
end;

procedure TBCImp.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

constructor TBCImp.Create(AOwner: TCOmponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);

end;

procedure TBCImp.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TBCImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TBCImp.AddG(WHNAme: String; Amount, Price: Variant);
begin
  if POS('КУХНЯ', AnsiUpperCase(WHNAme)) > 0 then
  begin
    WH1_Amount := WH1_Amount + Amount;
    WH1_Summ := WH1_Summ + Amount*Price;
  end
  else
  begin
    WH2_Amount := WH2_Amount + Amount;
    WH2_Summ := WH2_Summ + Amount*Price;
  end;
end;


procedure TBCImp.ClWH;
begin
  WH1_Amount := 0;
  WH1_Summ := 0;
  WH2_Amount := 0;
  WH2_Summ := 0;
end;

procedure TBCImp.cdsSelRepCalcFields(DataSet: TDataSet);
begin
  cdsSelRepDelta_A.AsFloat := cdsSelRepTotalAmount.AsFloat - cdsSelRepAmountFile.AsFloat;
  cdsSelRepDelta_S.AsFloat := cdsSelRepTotalSum.AsFloat - cdsSelRepTotalFile.AsFloat;
end;

procedure TBCImp.AutoSizeCol;
var i : integer;
begin
 try
  for i := 0 to RxDBGrid1.Columns.Count - 1 do
  begin
    if RxDBGrid1.Columns[i].Width > 120 then
      RxDBGrid1.Columns[i].Width := 120;
  end;
 except
 end;

end;

end.
