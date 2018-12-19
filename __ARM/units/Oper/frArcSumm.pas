unit frArcSumm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, dbclient,
  foMyFunc,
  contnrs, ComCtrls, RxMemDS, Grids, DBGrids, RXDBCtrl, StdCtrls, ExtCtrls,
  Provider, ComObj, Menus, ImgList, dbgrideh;

type
  TfArcSumm = class(TFrame)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    dsTotalSum: TDataSource;
    cdsWHAmount: TRxMemoryData;
    dsWHAmount: TDataSource;
    rxWHSum: TRxMemoryData;
    dsWHSum: TDataSource;
    GroupBox1: TGroupBox;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    TabSheet4: TTabSheet;
    dsSvcSum: TDataSource;
    cdsSvcAmount: TRxMemoryData;
    dsSvcAmount: TDataSource;
    GroupBox3: TGroupBox;
    Splitter2: TSplitter;
    GroupBox4: TGroupBox;
    RxDBGrid5: TRxDBGrid;
    dsOfferSum: TDataSource;
    dsRateCHSum: TDataSource;
    TabSheet5: TTabSheet;
    cdsWHSum: TClientDataSet;
    dspWHSum: TDataSetProvider;
    cdsWHSumid_Currency: TIntegerField;
    cdsWHSumSum: TFloatField;
    cdsWHSumCurrencyName: TStringField;
    cdsWHSumisTotal: TBooleanField;
    cdsWHSumTotalNum: TIntegerField;
    cdsWHSumTotalName: TStringField;
    rxSvcSum: TRxMemoryData;
    dspSvcSum: TDataSetProvider;
    cdsSvcSum: TClientDataSet;
    cdsSvcSumid_Currency: TIntegerField;
    cdsSvcSumSum: TFloatField;
    cdsSvcSumCurrencyName: TStringField;
    cdsSvcSumisTotal: TBooleanField;
    cdsSvcSumTotalNum: TIntegerField;
    cdsSvcSumTotalName: TStringField;
    RxDBGrid4: TRxDBGrid;
    RxDBGrid1: TRxDBGrid;
    rxFinSum: TRxMemoryData;
    dspFinSum: TDataSetProvider;
    cdsFinSum: TClientDataSet;
    cdsFinSumid_Currency: TIntegerField;
    cdsFinSumSum: TFloatField;
    cdsFinSumCurrencyName: TStringField;
    cdsFinSumisTotal: TBooleanField;
    cdsFinSumTotalNum: TIntegerField;
    cdsFinSumTotalName: TStringField;
    RxDBGrid6: TRxDBGrid;
    rxOfferSum: TRxMemoryData;
    dspOfferSum: TDataSetProvider;
    cdsOfferSum: TClientDataSet;
    cdsOfferSumid_Currency: TIntegerField;
    cdsOfferSumSum: TFloatField;
    cdsOfferSumCurrencyName: TStringField;
    cdsOfferSumisTotal: TBooleanField;
    cdsOfferSumTotalNum: TIntegerField;
    cdsOfferSumTotalName: TStringField;
    rxRateCHSum: TRxMemoryData;
    dspRateCHSum: TDataSetProvider;
    cdsRateCHSum: TClientDataSet;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    StringField1: TStringField;
    BooleanField1: TBooleanField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    RxDBGrid7: TRxDBGrid;
    cdsSvcAmountisTotal: TBooleanField;
    cdsSvcAmountisIn: TBooleanField;
    cdsSvcAmountid_Service: TIntegerField;
    cdsSvcAmountWareName: TStringField;
    cdsSvcAmountAmount: TFloatField;
    cdsWHAmountisTotal: TBooleanField;
    cdsWHAmountisIn: TBooleanField;
    cdsWHAmountid_Goods: TIntegerField;
    cdsWHAmountid_Raw: TIntegerField;
    cdsWHAmountid_ExtRaw: TIntegerField;
    cdsWHAmountid_Service: TIntegerField;
    cdsWHAmountWareName: TStringField;
    cdsWHAmountAmount: TFloatField;
    cdsWHAmountid_Measure: TIntegerField;
    cdsWHAmountMeasureName: TStringField;
    PopupMenu2: TPopupMenu;
    ImageList1: TImageList;
    miExport: TMenuItem;
    TabSheet6: TTabSheet;
    RxDBGrid8: TRxDBGrid;
    cdsTotalSum: TClientDataSet;
    IntegerField3: TIntegerField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    BooleanField2: TBooleanField;
    IntegerField4: TIntegerField;
    StringField4: TStringField;
    dspTotalSum: TDataSetProvider;
    rxTotalSum: TRxMemoryData;
    dsFinSum: TDataSource;
    cdsSumm: TRxMemoryData;
    dsSumm: TDataSource;
    RxDBGrid9: TRxDBGrid;
    cdsSummAFName: TStringField;
    cdsSummASumm: TFloatField;
    procedure cdsWHSumSumGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure cdsWHSumCurrencyNameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure miExportClick(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure cdsSummASummGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    procedure DoCalcSumUN(CDS: TDataSet; RezDS : TDataSet; Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc: String; ATotalName : String; ATotalNum : Variant; AABS : boolean);

    procedure DoCalcFinSum(CDS: TDataSet);
    procedure DoCalcWHGoods(CDS: TDataSet);
    procedure DoCalcWHService(CDS: TDataSet);
    procedure DoCalcOffer(CDS: TDataSet);
    procedure DoCalcWHGoodsAmount(CDS: TDataSet);
    procedure DoCalcWHAmountUN(CDS, RezDS: TDataSet; Key, Val, ValMS,
      KeyMS, MSName, KeySrc, ValSrc, ValMSSrc, KeyMSSrc,
      MSNameSrc: String);
    procedure DoCalcRateCH(CDS: TDataSet);
    procedure DoCalcTotalSum(CDS: TDataSet);
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure DoCalc(CDS : TDataSet; ACalcVals : TCalcVals);
    procedure DoCalc2(AGridEh : TDBGridEh);

    procedure ExportToExcel;
  end;

implementation

uses uDM;

{$R *.DFM}

procedure TfArcSumm.DoCalc(CDS: TDataSet; ACalcVals : TCalcVals);
  procedure LockDS(CDS: TDataSet);
  begin
    CDS.Close;
    CDS.Open;
    CDS.DisableControls;
  end;
  procedure UnLockDS(CDS: TDataSet);
  begin
    CDS.EnableControls;
  end;
var OldRecNo : integer;
    OldCursor : TCursor;
begin
  if not CDS.Active or CDS.IsEmpty then
    Exit;
  LockDS(cdsTotalSum);

  LockDS(cdsFinSum);
  LockDS(cdsWHSum);
  LockDS(cdsWHAmount);

  LockDS(cdsSvcSum);
  LockDS(cdsSvcAmount);

  LockDS(cdsOfferSum);
  LockDS(cdsRateCHSum);

  CDS.DisableControls;
  OldRecNo := CDS.RecNo;
  OldCursor := Screen.Cursor;
  try
    with CDS do
    begin
      First;
      while not Eof do
      begin
        DoCalcTotalSum(CDS);
        if cvFinSum in ACalcVals then
          DoCalcFinSum(CDS);
        if cvWHWare in ACalcVals then
          DoCalcWHGoods(CDS);
        if cvWHService in ACalcVals then
          DoCalcWHService(CDS);

        if cvOffer in ACalcVals then
          DoCalcOffer(CDS);
           
        if cvRateCH in ACalcVals then
          DoCalcRateCH(CDS);

        Next;
      end;
    end;
  //  if cvFinSum in ACalcVals then
    begin
      DoCalcSumUN(nil, cdsTotalSum, '', '', '', '', '', '', 'Всего приходов', -1, true);
      DoCalcSumUN(nil, cdsTotalSum, '', '', '', '', '', '', 'Всего расходов', -2, true);
      DoCalcSumUN(nil, cdsTotalSum, '', '', '', '', '', '', 'Итого', -3, true);
      DoCalcSumUN(nil, cdsTotalSum, '', '', '', '', '', '', 'Прибыль', -4, true);

      DoCalcSumUN(nil, cdsTotalSum, '', '', '', '', '', '', 'Курсовые разницы операций', -5, true);

      cdsTotalSum.IndexDefs.Clear;
      cdsTotalSum.IndexDefs.Add('ixisTotal', 'TotalNum;isTotal', [ixDescending]);
      cdsTotalSum.IndexName := 'ixisTotal';    
    end;
    if cvFinSum in ACalcVals then
    begin
      DoCalcSumUN(nil, cdsFinSum, '', '', '', '', '', '', 'Всего приходов', -1, true);
      DoCalcSumUN(nil, cdsFinSum, '', '', '', '', '', '', 'Всего расходов', -2, true);
      DoCalcSumUN(nil, cdsFinSum, '', '', '', '', '', '', 'Итого', -3, true);
      DoCalcSumUN(nil, cdsFinSum, '', '', '', '', '', '', 'Прибыль', -4, true);

      DoCalcSumUN(nil, cdsFinSum, '', '', '', '', '', '', 'Курсовые разницы операций', -5, true);

      cdsFinSum.IndexDefs.Clear;
      cdsFinSum.IndexDefs.Add('ixisTotal', 'TotalNum;isTotal', [ixDescending]);
      cdsFinSum.IndexName := 'ixisTotal';
    end;
    if cvWHWare in ACalcVals then
    begin
      DoCalcSumUN(nil, cdsWHSum, '', '', '', '', '', '', 'Всего приходов', -1, true);
      DoCalcSumUN(nil, cdsWHSum, '', '', '', '', '', '', 'Всего отгрузок', -2, true);
      DoCalcSumUN(nil, cdsWHSum, '', '', '', '', '', '', 'Себестоимость', -3, true);
      DoCalcSumUN(nil, cdsWHSum, '', '', '', '', '', '', 'Прибыль', -4, true);

      DoCalcSumUN(nil, cdsWHSum, '', '', '', '', '', '', 'Курсовые разницы операций', -5, true);
      cdsWHSum.IndexDefs.Clear;
      cdsWHSum.IndexDefs.Add('ixisTotal', 'TotalNum;isTotal', [ixDescending]);
      cdsWHSum.IndexName := 'ixisTotal';
    end;
    if cvWHService in ACalcVals then
    begin
      DoCalcSumUN(nil, cdsSvcSum, '', '', '', '', '', '', 'Всего приходов', -1, true);
      DoCalcSumUN(nil, cdsSvcSum, '', '', '', '', '', '', 'Всего расходов', -2, true);
      DoCalcSumUN(nil, cdsSvcSum, '', '', '', '', '', '', 'Себестоимость', -3, true);
      DoCalcSumUN(nil, cdsSvcSum, '', '', '', '', '', '', 'Прибыль', -4, true);

      DoCalcSumUN(nil, cdsSvcSum, '', '', '', '', '', '', 'Курсовые разницы операций', -5, true);

      cdsSvcSum.IndexDefs.Clear;
      cdsSvcSum.IndexDefs.Add('ixisTotal', 'TotalNum;isTotal', [ixDescending]);
      cdsSvcSum.IndexName := 'ixisTotal';
    end;
    if cvOffer in ACalcVals then
    begin
      DoCalcSumUN(nil, cdsOfferSum, '', '', '', '', '', '', 'Всего приходов', -1, true);
      DoCalcSumUN(nil, cdsOfferSum, '', '', '', '', '', '', 'Всего расходов', -2, true);
      DoCalcSumUN(nil, cdsOfferSum, '', '', '', '', '', '', 'Итого', -3, true);
      DoCalcSumUN(nil, cdsOfferSum, '', '', '', '', '', '', 'Прибыль', -4, true);

      cdsOfferSum.IndexDefs.Clear;
      cdsOfferSum.IndexDefs.Add('ixisTotal', 'TotalNum;isTotal', [ixDescending]);
      cdsOfferSum.IndexName := 'ixisTotal';
    end;
    if cvRateCH in ACalcVals then
    begin
      DoCalcSumUN(nil, cdsRateCHSum, '', '', '', '', '', '', 'Всего приходов', -1, true);
      DoCalcSumUN(nil, cdsRateCHSum, '', '', '', '', '', '', 'Всего расходов', -2, true);
      DoCalcSumUN(nil, cdsRateCHSum, '', '', '', '', '', '', 'Итого', -3, true);

      cdsRateCHSum.IndexDefs.Clear;
      cdsRateCHSum.IndexDefs.Add('ixisTotal', 'TotalNum;isTotal', [ixDescending]);
      cdsRateCHSum.IndexName := 'ixisTotal';
    end;
  finally
    CDS.RecNo := OldRecNo;
    CDS.EnableControls;
    Screen.Cursor := OldCursor;

    UnLockDS(cdsTotalSum);

    UnLockDS(cdsFinSum);
    UnLockDS(cdsWHSum);
    UnLockDS(cdsWHAmount);
    UnLockDS(cdsSvcSum);
    UnLockDS(cdsSvcAmount);

    UnLockDS(cdsOfferSum);
    UnLockDS(cdsRateCHSum);
  end;
end;

procedure TfArcSumm.DoCalcSumUN(CDS: TDataSet; RezDS : TDataSet; Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc: String;
                                ATotalName : String; ATotalNum : Variant; AABS : boolean);
var    K : integer;
begin
  if CDS = nil then
  begin
    if RezDS.Locate('TotalNum;isTotal', VarArrayOf([ATotalNum, 0]), []) then
    begin
      if not RezDS.FieldByName('Sum').IsNull then
      begin
        RezDS.Append;
        RezDS.FieldByName('isTotal').Value := True;
        RezDS.FieldByName('TotalNum').Value := ATotalNum;
        RezDS.FieldByName('TotalName').Value := ATotalName;
      end;
    end;
    Exit;
  end;
  if CDS.FieldByName(KeySrc).IsNull or (CDS.FieldByName(ValSrc).AsFloat = 0) then
    Exit;
  with CDS do
  begin
    if (RezDS.FindField('TotalNum') <> nil) and (RezDS.Locate('TotalNum;' + Key + ';isTotal', VarArrayOf([ATotalNum, FieldByName(KeySrc).Value, 0]), [])) then
      RezDS.Edit
    else
    begin
      RezDS.Append;
    //  RezDS.FieldByName('isTotal').Value := false;
      if RezDS.FindField('TotalNum') <> nil then
        RezDS.FieldByName('TotalNum').Value := ATotalNum;
      RezDS.FieldByName(Key).Value := FieldByName(KeySrc).Value;
      RezDS.FieldByName(ValMS).Value := FieldByName(ValMSSrc).Value;
    end;

    if (FieldByName('OperTypeIn').AsBoolean) or (AABS) then
      K := 1
    else
      K := -1;
    RezDS.FieldByName(Val).AsFloat := RezDS.FieldByName(Val).AsFloat + K * FieldByName(ValSrc).AsFloat;
    RezDS.Post;
  end;
end;

procedure TfArcSumm.DoCalcWHAmountUN(CDS: TDataSet; RezDS : TDataSet; Key, Val, ValMS, KeyMS, MSName, KeySrc, ValSrc, ValMSSrc, KeyMSSrc, MSNameSrc: String);
var  K : integer;
begin
  if CDS.FieldByName(KeySrc).IsNull then
    Exit;
  with CDS do
  begin
    if RezDS.Locate(Key + ';' + KeyMS, VarArrayOf([FieldByName(KeySrc).Value,FieldByName(KeyMSSrc).Value]), []) then
      RezDS.Edit
    else
    begin
      RezDS.Append;
      RezDS.FieldByName(Key).Value := FieldByName(KeySrc).Value;
      RezDS.FieldByName(ValMS).Value := FieldByName(ValMSSrc).Value;
      RezDS.FieldByName(KeyMS).Value := FieldByName(KeyMSSrc).Value;
      RezDS.FieldByName(MSName).Value := FieldByName(MSNameSrc).Value;
    end;

    if FieldByName('OperTypeIn').AsBoolean then
      K := 1
    else
      K := -1;
    RezDS.FieldByName(Val).AsFloat := RezDS.FieldByName(Val).AsFloat + K * FieldByName(ValSrc).AsFloat;
    RezDS.Post;
  end;
end;

procedure TfArcSumm.DoCalcFinSum(CDS: TDataSet);
var RezDS : TDataSet;
    Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc: String;
begin
  if not (CDS.FieldByName('OperVid').AsInteger in [2, 102]) then
    Exit;
  RezDS := cdsFinSum;
  Key := 'id_Currency';
  Val := 'Sum';
  ValMS := 'CurrencyName';
  KeySrc := 'Id_CurrencyOper';
  ValSrc := 'SummOper';
  ValMSSrc := 'CurrencyOperShortName';

  DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -3, false);
  if CDS.FieldByName('OperTypeIn').AsBoolean then
  begin
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -1, true);
  end
  else
  begin
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -2, true);
  end;
  KeySrc := 'Id_CurrencyBsn';
  ValSrc := 'OperTotalDeltaCrn';
  ValMSSrc := 'CurrencyBsnName';
  DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -4, true);

  KeySrc := 'Id_CurrencyBsn';
  ValSrc := 'OperRateDeltaCrn';
  ValMSSrc := 'CurrencyBsnName';
  DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -5, true)
end;

procedure TfArcSumm.DoCalcTotalSum(CDS: TDataSet);
var RezDS : TDataSet;
    Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc: String;
begin
  RezDS := cdsTotalSum;
  Key := 'id_Currency';
  Val := 'Sum';
  ValMS := 'CurrencyName';
  KeySrc := 'Id_CurrencyBsn';
  ValSrc := 'OperSum_OfferCalced';
  ValMSSrc := 'CurrencyBsnName';

  DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -3, false);
  if CDS.FieldByName('OperTypeIn').AsBoolean then
  begin
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -1, true);
  end
  else
  begin
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -2, true);
  end;
  KeySrc := 'Id_CurrencyBsn';
  ValSrc := 'OperTotalDeltaCrn';
  ValMSSrc := 'CurrencyBsnName';
  DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -4, true);

  KeySrc := 'Id_CurrencyBsn';
  ValSrc := 'OperRateDeltaCrn';
  ValMSSrc := 'CurrencyBsnName';
  DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -5, true)
end;

procedure TfArcSumm.DoCalcWHGoods(CDS: TDataSet);
var RezDS : TDataSet;
    Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc: String;
begin
  if not (CDS.FieldByName('OperVid').AsInteger in [1, 101]) then
    Exit;
  RezDS := cdsWHSum;
  Key := 'id_Currency';
  Val := 'Sum';
  ValMS := 'CurrencyName';
  KeySrc := 'Id_CurrencyOper';
  ValSrc := 'SummOper';
  ValMSSrc := 'CurrencyOperName';

  if CDS.FieldByName('OperTypeIn').AsBoolean then
  begin
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -1, true);

    KeySrc := 'Id_CurrencyBsn';
    ValSrc := 'OperRateDeltaCrn';
    ValMSSrc := 'CurrencyBsnName';
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -5, true)
  end
  else
  begin
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -2, true);
    
    KeySrc := 'Id_CurrencyInv';
    ValSrc := 'CRN_OperSum_Inv';
    ValMSSrc := 'CurrencyBsnName';
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -3, true);

    KeySrc := 'Id_CurrencyBsn';
    ValSrc := 'OperTotalDeltaCrn';
    ValMSSrc := 'CurrencyBsnName';
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -4, true);

    KeySrc := 'Id_CurrencyBsn';
    ValSrc := 'OperRateDeltaCrn';
    ValMSSrc := 'CurrencyBsnName';
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -5, true)
  end;
  
  DoCalcWHGoodsAmount(CDS);
end;

procedure TfArcSumm.DoCalcWHService(CDS: TDataSet);
var RezDS : TDataSet;
    Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc: String;
begin
  if CDS.FieldByName('OperVid').Value <> 3 then
    Exit;

  RezDS := cdsSvcSum;
  Key := 'id_Currency';
  Val := 'Sum';
  ValMS := 'CurrencyName';
  KeySrc := 'Id_CurrencyOper';
  ValSrc := 'SummOper';
  ValMSSrc := 'CurrencyOperShortName';

  if CDS.FieldByName('OperTypeIn').AsBoolean then
  begin
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -1, true);

    KeySrc := 'Id_CurrencyBsn';
    ValSrc := 'OperRateDeltaCrn';
    ValMSSrc := 'CurrencyBsnName';
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -5, true)
  end
  else
  begin
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -2, true);
    
    KeySrc := 'Id_CurrencyInv';
    ValSrc := 'CRN_OperSum_Inv';
    ValMSSrc := 'CurrencyBsnName';
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -3, true);

    KeySrc := 'Id_CurrencyBsn';
    ValSrc := 'OperTotalDeltaCrn';
    ValMSSrc := 'CurrencyBsnName';
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -4, true);

    KeySrc := 'Id_CurrencyBsn';
    ValSrc := 'OperRateDeltaCrn';
    ValMSSrc := 'CurrencyBsnName';
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -5, true)
  end;

  Key := 'id_Service';
  KeySrc := 'id_Service';
  ValMS := 'WareName';
  ValMSSrc := 'WareName';
  Val := 'Amount';
  ValSrc := 'AmountOper';
  DoCalcSumUN(CDS, cdsSvcAmount, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', Null, true);
end;

procedure TfArcSumm.DoCalcOffer(CDS: TDataSet);
var RezDS : TDataSet;
    Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc: String;
begin
  if CDS.FieldByName('OperVid').Value <> 4 then
    Exit;

  RezDS := cdsOfferSum;
  Key := 'id_Currency';
  Val := 'Sum';
  ValMS := 'CurrencyName';
  KeySrc := 'Id_CurrencyOper';
  ValSrc := 'SummOper';
  ValMSSrc := 'CurrencyOperShortName';

  DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -3, false);
  if CDS.FieldByName('OperTypeIn').AsBoolean then
  begin
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -1, true);
  end
  else
  begin
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -2, true);
  end;
  KeySrc := 'Id_CurrencyBsn';
  ValSrc := 'OperTotalDeltaCrn';
  ValMSSrc := 'CurrencyBsnName';
  DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -4, true);
end;

procedure TfArcSumm.DoCalcRateCH(CDS: TDataSet);
var RezDS : TDataSet;
    Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc: String;
begin
  if CDS.FieldByName('OperVid').Value <> -1 then
    Exit;

  RezDS := cdsRateCHSum;
  Key := 'id_Currency';
  Val := 'Sum';
  ValMS := 'CurrencyName';
  KeySrc := 'Id_CurrencyOper';
  ValSrc := 'SummOper';
  ValMSSrc := 'CurrencyOperShortName';

  DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -3, false);
  if CDS.FieldByName('OperTypeIn').AsBoolean then
  begin
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -1, true);
  end
  else
  begin
    DoCalcSumUN(CDS, RezDS, Key, Val, ValMS, KeySrc, ValSrc, ValMSSrc, '', -2, true);
  end;
end;

procedure TfArcSumm.DoCalcWHGoodsAmount(CDS: TDataSet);
var RezDS : TDataSet;
    Key, Val, ValMS, KeyMS, MSName,
    KeySrc, ValSrc, ValMSSrc, KeyMSSrc, MSNameSrc: String;
begin
  if CDS.FieldByName('OperVid').Value <> 1 then
    Exit;
  RezDS := cdsWHAmount;
  Key := 'id_Goods';
  Val := 'Amount';
  ValMS := 'WareName';
  KeyMS := 'id_Measure';
  MSName := 'MeasureName';

  KeySrc := 'Id_Goods';
  ValSrc := 'AmountOper';
  ValMSSrc := 'WareName';
  KeyMSSrc := 'id_Measure';
  MSNameSrc := 'MeasureName';

  DoCalcWHAmountUN(CDS, RezDS, Key, Val, ValMS, KeyMS, MSName, KeySrc, ValSrc, ValMSSrc, KeyMSSrc, MSNameSrc);

  Key := 'id_Raw';
  KeySrc := 'id_Raw';
  DoCalcWHAmountUN(CDS, RezDS, Key, Val, ValMS, KeyMS, MSName, KeySrc, ValSrc, ValMSSrc, KeyMSSrc, MSNameSrc);

  Key := 'id_ExtRaw';
  KeySrc := 'id_ExtRaw';
  DoCalcWHAmountUN(CDS, RezDS, Key, Val, ValMS, KeyMS, MSName, KeySrc, ValSrc, ValMSSrc, KeyMSSrc, MSNameSrc);
end;

procedure TfArcSumm.cdsWHSumSumGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.DataSet.FieldByName('isTotal').AsBoolean then
  begin
    Text := Sender.DataSet.FieldByName('TotalName').AsString;
  end
  else
    if (Sender is TFloatField) and (not Sender.DataSet.IsEmpty) then
      Text := FormatFloat('### ### ### ##0.##', (Sender as TFloatField).AsFloat);
end;

constructor TfArcSumm.Create(AOwner: TCOmponent);
var i : integer;
begin
  inherited;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TRxDBGrid then
      TRxDBGrid(Components[i]).PopupMenu := PopupMenu2;
  if Owner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + RxDBGrid1.Name);
    LoadGridSettingsFromRegistry(RxDBGrid2, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + RxDBGrid2.Name);
    LoadGridSettingsFromRegistry(RxDBGrid3, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + RxDBGrid3.Name);
    LoadGridSettingsFromRegistry(RxDBGrid4, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + RxDBGrid7.Name);
    LoadGridSettingsFromRegistry(RxDBGrid5, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + RxDBGrid5.Name);
    LoadGridSettingsFromRegistry(RxDBGrid6, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + RxDBGrid6.Name);
    LoadGridSettingsFromRegistry(RxDBGrid7, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + RxDBGrid7.Name);
  end;
end;

procedure TfArcSumm.RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if  (Sender as TRxDBGrid).DataSource.DataSet.FieldByName('isTotal').AsBoolean then
  begin
    if (not Highlight) then
      Background := clScrollBar;
    AFont.Style := AFont.Style + [fsBold];
  end;
end;

procedure TfArcSumm.cdsWHSumCurrencyNameGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.DataSet.FieldByName('isTotal').AsBoolean then
  begin
    Text := '';
  end
  else
    Text := Sender.AsString;
end;

procedure GreedToExcel_Ext(Grid: TDBGrid; Sheet: Variant; BeginCol: integer = 1; BeginRow: integer = 1; ACaption : string = '');
var i, j, MaxColWdth, ColumnsCnt, XXX : integer;
    ExcelApp, Workbook, OldValue : Variant;
    DataValues : Variant;
    Column, Cell1, Cell2, Range : Variant;
    S : String;
    B : boolean;
    isTotalField : TField;
begin
  B := false;
  isTotalField := Grid.DataSource.DataSet.FindField('isTotal');
  if VarIsNull(Sheet) then
  begin
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.DisplayAlerts := false;
//    ExcelApp.Visible := true;
    try Workbook := ExcelApp.WorkBooks.Add; except end;
    Sheet := ExcelApp.Workbooks[1].WorkSheets[1];
    B := true;
  end;
  with Grid.DataSource.DataSet do
  begin
    MaxColWdth := 100;
    
    DisableControls;
    try
      if (trim(ACaption) <> '') then
        BeginRow := BeginRow + 1;

      ColumnsCnt := 0;
      for i := 0 to Grid.Columns.Count - 1 do
       if Grid.Columns[i].Visible then inc(ColumnsCnt);
       
      DataValues := VarArrayCreate([0, RecordCount + 0, 0, ColumnsCnt - 1], varVariant);

      XXX := -1;
      for i := 0 to Grid.Columns.Count - 1 do
      begin
        if Grid.Columns[i].Visible then
        begin
          inc(XXX);
          DataValues[0, XXX] := Grid.Columns[i].Title.Caption;
        end;
      end;

      j := 1;
      First;
      while not EOF do
      begin
        XXX := -1;
        for i := 0 to Grid.Columns.Count - 1 do
        begin
          if Grid.Columns[i].Visible then
          begin
            inc(XXX);

            if trim(Grid.Columns[i].Title.Caption) <> '' then
            begin
              if Assigned(Grid.Columns[i].Field.OnGetText) then
                DataValues[j, XXX] := Grid.Columns[i].Field.DisplayText
              else
              begin
                if not (Grid.Columns[i].Field is TBooleanField) then
                begin
                  if (Grid.Columns[i].Field is TFloatField) then
                  begin
                    if not Grid.Columns[i].Field.IsNull then
                    begin
                      S := TFloatField(Grid.Columns[i].Field).DisplayFormat;
                      if S = '' then
                        S := '0.##';
                      DataValues[j, XXX] := StrToFloat(FormatFloat(S, Grid.Columns[i].Field.AsFloat))
                    end;
                  end
                  else
                    DataValues[j, XXX] := Grid.Columns[i].Field.Value
                end
                else
                begin
                  if Grid.Columns[i].Field.AsBoolean then
                    DataValues[j, XXX] := 'Да'
                  else
                    DataValues[j, XXX] := 'Нет'
                end;
              end;
            end;
          end;
        end;
        inc(j);
        Next;
      end;
      Cell1 := Sheet.Cells[BeginRow, BeginCol];
      Cell2 := Sheet.Cells[BeginRow + RecordCount + 0, BeginCol + ColumnsCnt - 1];
      Range := Sheet.Range[Cell1, Cell2];
      Range.Value := DataValues;
      Range.Borders.LineStyle := 1;

      Cell1 := Sheet.Cells[BeginRow, BeginCol];
      Cell2 := Sheet.Cells[BeginRow, BeginCol + ColumnsCnt - 1];
      Range := Sheet.Range[Cell1, Cell2];
      Range.Font.Bold := true;
        
      j := 1;
      First;
      while not EOF do
      begin
        if (isTotalField <> nil) and (isTotalField.AsBoolean) then
        begin
          Cell1 := Sheet.Cells[BeginRow + j, BeginCol];
          Cell2 := Sheet.Cells[BeginRow + j, BeginCol + ColumnsCnt - 1];
          Range := Sheet.Range[Cell1, Cell2];
          Range.Font.Bold := true;
          Range.Interior.Color := 12632256;
        end;
        inc(j);
        Next;
      end;

      for i := 0 to ColumnsCnt - 1 do
      begin
        Column := Sheet.Columns[BeginCol + i];
        Column.AutoFit;
        if Column.ColumnWidth > MaxColWdth then
          Column.ColumnWidth := MaxColWdth;
      end;
      
      if (trim(ACaption) <> '') then
      begin
        Cell1 := Sheet.Cells[BeginRow - 1, BeginCol];
        Cell1.Font.Bold := true;
        Cell1.Font.Size := 12;
        Cell1.Value := ACaption;
      end;
      if B then
        ExcelApp.Visible := true; 
    except

    end;

//      ExcelApp := Null;
   // Grid.DataSource.DataSet.Locate(Grid.DataSource.DataSet.Fields[0].FieldName, OldValue, [loCaseInsensitive]);
    EnableControls;
  end;
end;

procedure TfArcSumm.ExportToExcel;
var BeginCol: integer;
    BeginRow: integer;
    ExcelApp, Workbook, Sheet : Variant;
begin
  BeginCol := 1;
  BeginRow := 1;
  Screen.Cursor := crSQLWait;
  try
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.DisplayAlerts := false;

    try Workbook := ExcelApp.WorkBooks.Add; except end;
    Sheet := ExcelApp.Workbooks[1].WorkSheets[1];
    
    GreedToExcel_Ext(RxDBGrid8, Sheet, BeginCol, BeginRow, 'Итоги');
    BeginRow := BeginRow + RxDBGrid8.DataSource.DataSet.RecordCount + 2;

    if not RxDBGrid1.DataSource.DataSet.IsEmpty then
    begin
      GreedToExcel_Ext(RxDBGrid1, Sheet, BeginCol, BeginRow, 'Финансы');
      BeginRow := BeginRow + RxDBGrid1.DataSource.DataSet.RecordCount + 2;
    end;
    
    if not RxDBGrid2.DataSource.DataSet.IsEmpty then
    begin
      GreedToExcel_Ext(RxDBGrid2, Sheet, BeginCol, BeginRow, 'Склад - суммы');
      BeginRow := BeginRow + RxDBGrid2.DataSource.DataSet.RecordCount + 2;
    end;
    
    if not RxDBGrid4.DataSource.DataSet.IsEmpty then
    begin
      GreedToExcel_Ext(RxDBGrid4, Sheet, BeginCol, BeginRow, 'Услуги - суммы');
      BeginRow := BeginRow + RxDBGrid4.DataSource.DataSet.RecordCount + 2;
    end;

    if not RxDBGrid6.DataSource.DataSet.IsEmpty then
    begin
      GreedToExcel_Ext(RxDBGrid6, Sheet, BeginCol, BeginRow, 'Взаимозачеты');
      BeginRow := BeginRow + RxDBGrid6.DataSource.DataSet.RecordCount + 2;
    end;

    if not RxDBGrid7.DataSource.DataSet.IsEmpty then
    begin
      GreedToExcel_Ext(RxDBGrid7, Sheet, BeginCol, BeginRow, 'Курсовые изменения');
      BeginRow := BeginRow + RxDBGrid7.DataSource.DataSet.RecordCount + 2;
    end;

    ExcelApp.Visible := true;
    Screen.Cursor := crDefault;
  except
    on E : Exception do
    begin
      Screen.Cursor := crDefault;
      ExcelApp.Quit;
      ExcelApp := Null;

      raise Exception.Create('Произошла ошибка при выгрузке данных в Excel' + #13 + #10 + E.Message);
    end;
  end;
//  Sheet := Null;
//  Workbook := Null;
//  ExcelApp := Null;
//      ExcelApp := Null;
end;

procedure TfArcSumm.miExportClick(Sender: TObject);
var C : TWinControl;
    S : String;
begin
  if PopupMenu2.PopupComponent is TRxDBGrid then
  begin
    C := TRxDBGrid(PopupMenu2.PopupComponent).Parent;
    while not (C is TTabSheet) do
    begin
      if C = nil then
        Break;
      C := C.Parent;
    end;
    if C is TTabSheet then
      S := TTabSheet(C).Caption
    else
      S := '';
    GreedToExcel_Ext(TRxDBGrid(PopupMenu2.PopupComponent), Null, 1, 1, S)
  end;
end;

procedure TfArcSumm.PopupMenu2Popup(Sender: TObject);
begin
  miExport.Enabled := (PopupMenu2.PopupComponent is TRxDBGrid) and (not TRxDBGrid(PopupMenu2.PopupComponent).DataSource.DataSet.IsEmpty);
end;

destructor TfArcSumm.Destroy;
begin
  if Owner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + RxDBGrid1.Name);
    SaveGridSettingsToRegistry(RxDBGrid2, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + RxDBGrid2.Name);
    SaveGridSettingsToRegistry(RxDBGrid3, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + RxDBGrid3.Name);
    SaveGridSettingsToRegistry(RxDBGrid4, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + RxDBGrid7.Name);
    SaveGridSettingsToRegistry(RxDBGrid5, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + RxDBGrid5.Name);
    SaveGridSettingsToRegistry(RxDBGrid6, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + RxDBGrid6.Name);
    SaveGridSettingsToRegistry(RxDBGrid7, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + RxDBGrid7.Name);
  end;
  inherited;

end;

procedure TfArcSumm.DoCalc2(AGridEh : TDBGridEh);
var i : integer;
    AList : TList;
    OldRecNo : integer;
    V : Variant;
begin
  cdsSumm.Close;
  cdsSumm.Open;
  with AGridEh do
  begin
    DataSource.DataSet.DisableControls;
    OldRecNo := DataSource.DataSet.RecNo;
    AList := TList.Create;
    try
      for i := 0 to Columns.Count - 1 do
        if (Columns[i].Field is TFloatField) and (Pos('Бюджет|', Columns[i].Title.Caption) = 0) then
        begin
          AList.Add(AGridEh.Columns[i]);
        end;

        V := VarArrayCreate([0, AList.Count - 1], varDouble);
        
      DataSource.DataSet.First;
      while not DataSource.DataSet.Eof do
      begin
        for i := 0 to AList.Count - 1 do
          V[i] := V[i] + TColumnEh(AList[i]).Field.AsFloat;

        DataSource.DataSet.Next;
      end;
      for i := 0 to AList.Count - 1 do
      begin
        cdsSumm.Append;
        cdsSummAFName.AsString := TColumnEh(AList[i]).Title.Caption;
        cdsSummASumm.AsFloat := V[i];
        cdsSumm.Post;
      end;
      cdsSumm.First;
    finally
      DataSource.DataSet.RecNo := OldRecNo;
      DataSource.DataSet.EnableControls;
      AList.Free;
    end;
  end;
end;

procedure TfArcSumm.cdsSummASummGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
var S : String;
begin
  S := Trim(FormatFloat('### ### ### ### ##0.00', ABS(Sender.AsFloat)));
  if Sender.AsFloat < 0 then
    S := '-' + S;
  Text := S;
end;

end.
