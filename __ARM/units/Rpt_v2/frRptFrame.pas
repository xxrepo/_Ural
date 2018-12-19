unit frRptFrame;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, RxMemDS, Provider, DBClient, Grids, DBGrids, RXDBCtrl, ExtCtrls,
  frArc, frBsnSelector,
  Registry, ComCtrls, StdCtrls, Buttons, Mask, ToolEdit;

type
  TfRptFrame = class(TFrame)
    mtUser: TRxMemoryData;
    dsUser: TDataSource;
    cdsUser: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    RxDBGrid1: TRxDBGrid;
    Splitter1: TSplitter;
    Panel3: TPanel;
    fBsnSelector1: TfBsnSelector;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    dtFrom: TDateEdit;
    dtTo: TDateEdit;
    fArc1: TfArc;
    cdsArcOld: TClientDataSet;
    cdsArcOldid_Oper: TIntegerField;
    cdsArcOldDateCreate: TDateTimeField;
    cdsArcOldOperVid: TIntegerField;
    cdsArcOldBusinessName: TStringField;
    cdsArcOldCorrect: TBooleanField;
    cdsArcOldOperTypeIn: TBooleanField;
    cdsArcOldCurrencyOperShortName: TStringField;
    cdsArcOldAmountOper: TFloatField;
    cdsArcOldAmountOper2: TFloatField;
    cdsArcOldPriceOper: TFloatField;
    cdsArcOldMeasureName: TStringField;
    cdsArcOldCurrencySysShortName: TStringField;
    cdsArcOldSummSys: TFloatField;
    cdsArcOldid_Acc: TIntegerField;
    cdsArcOldid_Warehouse: TIntegerField;
    cdsArcOldid_Manufact: TIntegerField;
    cdsArcOldSrcName: TStringField;
    cdsArcOldSrcID_Main: TIntegerField;
    cdsArcOldid_Repr: TIntegerField;
    cdsArcOldid_Acc_Ext: TIntegerField;
    cdsArcOldid_Warehouse_Ext: TIntegerField;
    cdsArcOldid_Manufact_Ext: TIntegerField;
    cdsArcOldReprName: TStringField;
    cdsArcOldReprID_Main: TIntegerField;
    cdsArcOldPriceInv: TFloatField;
    cdsArcOldCurrencyInvShortName: TStringField;
    cdsArcOldid_Goods: TIntegerField;
    cdsArcOldWareName: TStringField;
    cdsArcOldWareID_Main: TIntegerField;
    cdsArcOldKoeff: TIntegerField;
    cdsArcOldKoeffName: TStringField;
    cdsArcOldCheckDate: TDateTimeField;
    cdsArcOldid_UserChecker: TIntegerField;
    cdsArcOldFormalDistribName: TStringField;
    cdsArcOldFuncDistribName: TStringField;
    cdsArcOldDeleted: TBooleanField;
    cdsArcOldid_ContrAgent: TIntegerField;
    cdsArcOldContrAgentName: TStringField;
    cdsArcOldSummOper: TFloatField;
    cdsArcOldTypeName: TStringField;
    cdsArcOldOperNum: TStringField;
    cdsArcOldOperDelta: TFloatField;
    cdsArcOldOperRateDelta: TFloatField;
    cdsArcOldOperTotalDelta: TFloatField;
    cdsArcOldDTDiff: TIntegerField;
    cdsArcOldHasViza: TBooleanField;
    cdsArcOldOperState: TIntegerField;
    cdsArcOldOperSummSys: TFloatField;
    cdsArcOldImp_PayBasic: TStringField;
    cdsArcOldAccInv_PayAssignment: TStringField;
    cdsArcOldContract: TStringField;
    cdsArcOldOperDeltaCrn: TFloatField;
    cdsArcOldOperRateDeltaCrn: TFloatField;
    cdsArcOldOperTotalDeltaCrn: TFloatField;
    cdsArcOldOperCrnName: TStringField;
    cdsArcOldOperSum_Offer: TFloatField;
    cdsArcOldCRN_OLD_OperSum: TFloatField;
    cdsArcOldCRN_OLD_OperSum_Offer: TFloatField;
    cdsArcOldCRN_OperSum_Inv: TFloatField;
    cdsArcOldOperSumCalced: TFloatField;
    cdsArcOldOperSum_OfferCalced: TFloatField;
    cdsArcOldBlocked: TBooleanField;
    cdsArcOldCurrencyBsnName: TStringField;
    cdsArcOldOpComment: TStringField;
    cdsArcOldRealDataCreate: TDateTimeField;
    cdsArcOldDig1: TFloatField;
    cdsArcOldDig2: TFloatField;
    cdsArcOldDig3: TFloatField;
    cdsArcOldDig4: TFloatField;
    cdsArcOldDig5: TFloatField;
    cdsArcOldDig6: TFloatField;
    cdsArcOldDig7: TFloatField;
    cdsArcOldDig8: TFloatField;
    cdsArcOldDig9: TFloatField;
    cdsArcOldDig10: TFloatField;
    cdsArcOldDig11: TFloatField;
    cdsArcOldDig12: TFloatField;
    cdsArcOldDig13: TFloatField;
    cdsArcOldDig14: TFloatField;
    cdsArcOldDig15: TFloatField;
    cdsArcOldStr1: TStringField;
    cdsArcOldStr2: TStringField;
    cdsArcOldStr3: TStringField;
    cdsArcOldStr4: TStringField;
    cdsArcOldStr5: TStringField;
    cdsArcOldStr6: TStringField;
    cdsArcOldStr7: TStringField;
    cdsArcOldStr8: TStringField;
    cdsArcOldStr9: TStringField;
    cdsArcOldStr10: TStringField;
    cdsArcOldStr11: TStringField;
    cdsArcOldStr12: TStringField;
    cdsArcOldStr13: TStringField;
    cdsArcOldStr14: TStringField;
    cdsArcOldStr15: TStringField;
    cdsArcOldOperVidName: TStringField;
    cdsArcOldCRN_OperSumRez: TFloatField;
    cdsArcOldOnlyDate: TDateTimeField;
    cdsArcOldis_Mirr: TBooleanField;
    cdsArcOldid_Repr_Ex: TIntegerField;
    cdsArcOldid_OperParent: TIntegerField;
    cdsArcOldid_old_Oper: TIntegerField;
    cdsArcOldid_LC_Oper: TIntegerField;
    cdsArcOldid_Replicator: TIntegerField;
    cdsArcOldReplicatorShortName: TStringField;
    cdsArcOldid_UserCreator: TIntegerField;
    cdsArcOldid_business: TIntegerField;
    cdsArcOldId_CurrencyBsn: TIntegerField;
    cdsArcOldBusinessNum: TStringField;
    cdsArcOldDateLocal: TDateTimeField;
    cdsArcOldId_CurrencyOper: TIntegerField;
    cdsArcOldCurrencyOperName: TStringField;
    cdsArcOldRateOper: TFloatField;
    cdsArcOldid_Measure: TIntegerField;
    cdsArcOldRealKoef: TFloatField;
    cdsArcOldAmountOperBaseMS: TFloatField;
    cdsArcOldId_CurrencySys: TIntegerField;
    cdsArcOldCurrencySysName: TStringField;
    cdsArcOldRateSys: TFloatField;
    cdsArcOldId_CurrencyInv: TIntegerField;
    cdsArcOldRateInv: TFloatField;
    cdsArcOldCurrencyInvName: TStringField;
    cdsArcOldid_FormalDistrib: TIntegerField;
    cdsArcOldid_FuncDistrib: TIntegerField;
    cdsArcOldid_CAGroup: TIntegerField;
    cdsArcOldHidedOper: TBooleanField;
    cdsArcOldRateMain: TFloatField;
    cdsArcOldid_DocType: TIntegerField;
    cdsArcOldid_Ctg_Goods_2: TIntegerField;
    cdsArcOldOperTypeSIGN: TIntegerField;
    cdsArcOldHasChild: TIntegerField;
    cdsArcOldid_OperWare: TAutoIncField;
    cdsArcOldid_Acc_Group: TIntegerField;
    cdsArcOldid_Warehouse_Group: TIntegerField;
    cdsArcOldid_Manufact_Group: TIntegerField;
    cdsArcOldCreatorFIO: TStringField;
    cdsArcOldCheckerFIO: TStringField;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure dsUserDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FKeySrc : String;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure DoCalcFIO(CDS, RezDS: TDataSet; Key, Val, KeySrc, ValSrc: String);
  public
    procedure CalcFIOList(CDS: TDataSet; KeySrc, ValSrc: String);
  end;

implementation

uses foMyFunc, uDM;

{$R *.DFM}

procedure TfRptFrame.DoCalcFIO(CDS: TDataSet; RezDS : TDataSet; Key, Val, KeySrc, ValSrc: String);
begin
  FKeySrc := KeySrc;
  with CDS do
  begin
 //   if FieldByName(KeySrc).IsNull then
   //   Exit;
    if RezDS.Locate(Key, FieldByName(KeySrc).Value, []) then
      RezDS.Edit
    else
    begin
      RezDS.Append;
      RezDS.FieldByName(Key).Value := FieldByName(KeySrc).Value;
      if not FieldByName(ValSrc).IsNull then
        RezDS.FieldByName(Val).Value := FieldByName(ValSrc).Value
      else
        RezDS.FieldByName(Val).Value := 'не задано';
    end;

    RezDS.FieldByName('Cnt').AsInteger := RezDS.FieldByName('Cnt').AsInteger + 1;
    RezDS.Post;
  end;
end;

procedure TfRptFrame.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfRptFrame.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfRptFrame.fBsnSelector1Button1Click(Sender: TObject);
begin
  fBsnSelector1.Button1Click(Sender);

end;

constructor TfRptFrame.Create(AOwner: TCOmponent);
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
begin
  inherited;
  if Owner is TForm then
  begin
    dtFrom.Date := Now - 0;
    dtTo.Date := Now;
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      FullRegPathName := SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        if Reg.ValueExists('RxDBGrid1Height') then
          RxDBGrid1.Height := Reg.ReadInteger('RxDBGrid1Height');
        
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  fArc1.dsArc.DataSet := cdsArcOld;
  fArc1.ListMode;
end;

destructor TfRptFrame.Destroy;
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
begin
  if Owner is TForm then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;

      FullRegPathName := SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        Reg.WriteInteger('RxDBGrid1Height', RxDBGrid1.Height);
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  inherited;

end;

procedure TfRptFrame.CalcFIOList(CDS: TDataSet; KeySrc, ValSrc: String);
var FilterOld : String;
    FilteredOld : boolean;
begin
  if CDS = nil then
    CDS := fArc1.dsArc.DataSet;
  cdsUser.Close;
  cdsUser.Open;
  dsUser.OnDataChange := nil;
  try
    CDS.DisableControls;
    FilterOld := CDS.Filter;
    FilteredOld := CDS.Filtered;
    CDS.Filtered := false;
    with CDS do
    begin
      First;
      while not Eof do
      begin
        DoCalcFIO(CDS, cdsUser, 'id_User', 'FIO', KeySrc, ValSrc);
        Next;
      end;
    end;
    with cdsUser do
    begin
      Append;
      FieldByName('id_User').Value := -1;
      FieldByName('FIO').Value := 'Все операции';
      FieldByName('Cnt').Value := CDS.RecordCount;
      Post;
    end;
  finally
    CDS.EnableControls;
    CDS.Filter := '';
    CDS.Filtered := false;
    dsUser.OnDataChange := dsUserDataChange;
    dsUser.DataSet.First;
  end;
end;

procedure TfRptFrame.dsUserDataChange(Sender: TObject; Field: TField);
begin
  if FKeySrc <> '' then
  begin
    fArc1.RemakeFilter;
    if cdsUser.FieldByName('id_User').AsString = '' then
      fArc1.EhGridFilter1.DefFilter := fArc1.EhGridFilter1.DefFilter + ' AND ' + FKeySrc + ' IS NULL'
    else
      if cdsUser.FieldByName('id_User').AsString <> '-1' then
        fArc1.EhGridFilter1.DefFilter := fArc1.EhGridFilter1.DefFilter + ' AND ' + FKeySrc + '=' + '''' + cdsUser.FieldByName('id_User').AsString + '''';
  end;
end;

procedure TfRptFrame.SpeedButton1Click(Sender: TObject);
begin
  if fBsnSelector1.ID > 0 then
  begin

  end
  else
  begin
    Windows.SetFocus(fBsnSelector1.edName.Handle);
    MessageBox(Handle, 'Сначала необходимо выбрать бизнес!', 'Не выбран бизнес!', MB_OK + MB_ICONWARNING);
    Abort;
  end;
end;

end.
