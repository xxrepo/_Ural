unit frMov_Goods;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons,
  dxPSGlbl, Menus, DBGridEh, ToolWin, Mask, DBCtrls, frArc, Registry,
  RXCtrls, foMyFunc
  ;

type
  TfMov_Goods = class(TFrame)
    DataSource1: TDataSource;
    dxDBTreeList1: TdxDBTreeList;
    dxPrintDialog1: TdxPrintDialog;
    ActionList1: TActionList;
    ilButtons: TImageList;
    aPrint: TAction;
    dxComponentPrinter2: TdxComponentPrinter;
    dxComponentPrinter1Link2: TdxDBTreeListReportLink;
    aPreview: TAction;
    aClosePeriod: TAction;
    aSave: TAction;
    cdsMovGoods: TClientDataSet;
    Panel3: TPanel;
    lbInfo: TLabel;
    aShowAccCard: TAction;
    aShowBalance: TAction;
    aCollapseAll: TAction;
    dxDBTreeList1id_Ctg_Goods: TdxDBTreeListMaskColumn;
    dxDBTreeList1Name: TdxDBTreeListMaskColumn;
    dxDBTreeList1TotalAmount: TdxDBTreeListMaskColumn;
    dxDBTreeList1TotalSum: TdxDBTreeListMaskColumn;
    dxDBTreeList1MeasureName: TdxDBTreeListMaskColumn;
    dxDBTreeList1CurrencyName: TdxDBTreeListMaskColumn;
    Splitter1: TSplitter;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    dxDBTreeList1TotalSumOld: TdxDBTreeListMaskColumn;
    dxDBTreeList1TotalSumIn: TdxDBTreeListMaskColumn;
    dxDBTreeList1TotalSumOut: TdxDBTreeListMaskColumn;
    dxDBTreeList1TotalAmountOld: TdxDBTreeListMaskColumn;
    dxDBTreeList1TotalAmountIn: TdxDBTreeListMaskColumn;
    dxDBTreeList1TotalAmountOut: TdxDBTreeListMaskColumn;
    pnDate: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    dtTo: TDateTimePicker;
    dtFrom: TDateTimePicker;
    BitBtn2: TBitBtn;
    dxDBTreeList1id_BaseCtg_Goods: TdxDBTreeListColumn;
    cdsArcWare: TClientDataSet;
    fArc1: TfArc;
    dxDBTreeList1id_Goods: TdxDBTreeListColumn;
    ilImage: TImageList;
    PopupMenu1: TPopupMenu;
    dxDBTreeList1AvgPrice: TdxDBTreeListMaskColumn;
    aExpandNode: TAction;
    aExpandAll: TAction;
    aCollapseNode: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    aCollapseAll1: TMenuItem;
    Action2: TAction;
    ToolButton4: TToolButton;
    aNodeExp: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    SpeedButton2: TSpeedButton;
    cbMove: TCheckBox;
    aExpOper: TAction;
    ToolButton5: TToolButton;
    RxSpeedButton1: TRxSpeedButton;
    cbSumm: TCheckBox;
    ToolButton6: TToolButton;
    aReVal: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    dxDBTreeList1TotalSumRez: TdxDBTreeListMaskColumn;
    dxDBTreeList1TotalAmountRez: TdxDBTreeListMaskColumn;
    dxDBTreeList1AmountDelta: TdxDBTreeListColumn;
    cbRez: TCheckBox;
    cdsMovGoodsid_Ctg_Goods: TIntegerField;
    cdsMovGoodsid_BaseCtg_Goods: TIntegerField;
    cdsMovGoodsid_Goods: TIntegerField;
    cdsMovGoodsName: TStringField;
    cdsMovGoodsTotalSumOld: TFloatField;
    cdsMovGoodsTotalSumIn: TFloatField;
    cdsMovGoodsTotalSumOut: TFloatField;
    cdsMovGoodsTotalSum: TFloatField;
    cdsMovGoodsId_Currency: TIntegerField;
    cdsMovGoodsTotalAmountOld: TFloatField;
    cdsMovGoodsTotalAmountIn: TFloatField;
    cdsMovGoodsTotalAmountOut: TFloatField;
    cdsMovGoodsTotalAmount: TFloatField;
    cdsMovGoodsTotalAmountRez: TFloatField;
    cdsMovGoodsTotalSumRez: TFloatField;
    cdsMovGoodsid_Measure: TIntegerField;
    cdsMovGoodsMeasureName: TStringField;
    cdsMovGoodsCurrencyName: TStringField;
    cdsMovGoodsAvgPrice: TFloatField;
    cdsMovGoodsAmountDelta: TFloatField;
    cdsArcWareid_Oper: TIntegerField;
    cdsArcWareid_OperParent: TIntegerField;
    cdsArcWareid_old_Oper: TIntegerField;
    cdsArcWareDateCreate: TDateTimeField;
    cdsArcWareid_LC_Oper: TIntegerField;
    cdsArcWareOperVid: TIntegerField;
    cdsArcWareid_Replicator: TIntegerField;
    cdsArcWareReplicatorShortName: TStringField;
    cdsArcWareid_UserCreator: TIntegerField;
    cdsArcWareid_business: TIntegerField;
    cdsArcWareId_CurrencyBsn: TIntegerField;
    cdsArcWareBusinessName: TStringField;
    cdsArcWareBusinessNum: TStringField;
    cdsArcWareDateLocal: TDateTimeField;
    cdsArcWareCorrect: TBooleanField;
    cdsArcWareOperTypeIn: TBooleanField;
    cdsArcWareId_CurrencyOper: TIntegerField;
    cdsArcWareCurrencyOperName: TStringField;
    cdsArcWareCurrencyOperShortName: TStringField;
    cdsArcWareAmountOper: TFloatField;
    cdsArcWareAmountOper2: TFloatField;
    cdsArcWarePriceOper: TFloatField;
    cdsArcWareRateOper: TFloatField;
    cdsArcWareid_Measure: TIntegerField;
    cdsArcWareMeasureName: TStringField;
    cdsArcWareRealKoef: TFloatField;
    cdsArcWareAmountOperBaseMS: TFloatField;
    cdsArcWareId_CurrencySys: TIntegerField;
    cdsArcWareCurrencySysName: TStringField;
    cdsArcWareCurrencySysShortName: TStringField;
    cdsArcWareSummSys: TFloatField;
    cdsArcWareRateSys: TFloatField;
    cdsArcWareid_Acc: TIntegerField;
    cdsArcWareid_Warehouse: TIntegerField;
    cdsArcWareid_Manufact: TIntegerField;
    cdsArcWareSrcName: TStringField;
    cdsArcWareSrcID_Main: TIntegerField;
    cdsArcWareid_Repr: TIntegerField;
    cdsArcWareid_Acc_Ext: TIntegerField;
    cdsArcWareid_Warehouse_Ext: TIntegerField;
    cdsArcWareid_Manufact_Ext: TIntegerField;
    cdsArcWareReprName: TStringField;
    cdsArcWareReprID_Main: TIntegerField;
    cdsArcWareId_CurrencyInv: TIntegerField;
    cdsArcWarePriceInv: TFloatField;
    cdsArcWareRateInv: TFloatField;
    cdsArcWareCurrencyInvName: TStringField;
    cdsArcWareCurrencyInvShortName: TStringField;
    cdsArcWareid_Goods: TIntegerField;
    cdsArcWareWareName: TStringField;
    cdsArcWareWareID_Main: TIntegerField;
    cdsArcWareKoeff: TIntegerField;
    cdsArcWareKoeffName: TStringField;
    cdsArcWareCheckDate: TDateTimeField;
    cdsArcWareid_UserChecker: TIntegerField;
    cdsArcWareid_FormalDistrib: TIntegerField;
    cdsArcWareFormalDistribName: TStringField;
    cdsArcWareid_FuncDistrib: TIntegerField;
    cdsArcWareFuncDistribName: TStringField;
    cdsArcWareDeleted: TBooleanField;
    cdsArcWareid_ContrAgent: TIntegerField;
    cdsArcWareContrAgentName: TStringField;
    cdsArcWareid_CAGroup: TIntegerField;
    cdsArcWareSummOper: TFloatField;
    cdsArcWareTypeName: TStringField;
    cdsArcWareOperNum: TStringField;
    cdsArcWareOperDelta: TFloatField;
    cdsArcWareOperRateDelta: TFloatField;
    cdsArcWareOperTotalDelta: TFloatField;
    cdsArcWareDTDiff: TIntegerField;
    cdsArcWareHasViza: TBooleanField;
    cdsArcWareOperState: TIntegerField;
    cdsArcWareHidedOper: TBooleanField;
    cdsArcWareOperSummSys: TFloatField;
    cdsArcWareRateMain: TFloatField;
    cdsArcWareid_Repr_Ex: TIntegerField;
    cdsArcWareid_DocType: TIntegerField;
    cdsArcWareImp_PayBasic: TStringField;
    cdsArcWareAccInv_PayAssignment: TStringField;
    cdsArcWareContract: TStringField;
    cdsArcWareOperDeltaCrn: TFloatField;
    cdsArcWareOperRateDeltaCrn: TFloatField;
    cdsArcWareOperTotalDeltaCrn: TFloatField;
    cdsArcWareOperCrnName: TStringField;
    cdsArcWareOperSum_Offer: TFloatField;
    cdsArcWareCRN_OLD_OperSum: TFloatField;
    cdsArcWareCRN_OLD_OperSum_Offer: TFloatField;
    cdsArcWareCRN_OperSum_Inv: TFloatField;
    cdsArcWareOperSumCalced: TFloatField;
    cdsArcWareOperSum_OfferCalced: TFloatField;
    cdsArcWareBlocked: TBooleanField;
    cdsArcWareCurrencyBsnName: TStringField;
    cdsArcWareid_Ctg_Goods_2: TIntegerField;
    cdsArcWareOpComment: TStringField;
    cdsArcWareRealDataCreate: TDateTimeField;
    cdsArcWareOperTypeSIGN: TIntegerField;
    cdsArcWareHasChild: TIntegerField;
    cdsArcWareDig1: TFloatField;
    cdsArcWareDig2: TFloatField;
    cdsArcWareDig3: TFloatField;
    cdsArcWareDig4: TFloatField;
    cdsArcWareDig5: TFloatField;
    cdsArcWareDig6: TFloatField;
    cdsArcWareDig7: TFloatField;
    cdsArcWareDig8: TFloatField;
    cdsArcWareDig9: TFloatField;
    cdsArcWareDig10: TFloatField;
    cdsArcWareDig11: TFloatField;
    cdsArcWareDig12: TFloatField;
    cdsArcWareDig13: TFloatField;
    cdsArcWareDig14: TFloatField;
    cdsArcWareDig15: TFloatField;
    cdsArcWareStr1: TStringField;
    cdsArcWareStr2: TStringField;
    cdsArcWareStr3: TStringField;
    cdsArcWareStr4: TStringField;
    cdsArcWareStr5: TStringField;
    cdsArcWareStr6: TStringField;
    cdsArcWareStr7: TStringField;
    cdsArcWareStr8: TStringField;
    cdsArcWareStr9: TStringField;
    cdsArcWareStr10: TStringField;
    cdsArcWareStr11: TStringField;
    cdsArcWareStr12: TStringField;
    cdsArcWareStr13: TStringField;
    cdsArcWareStr14: TStringField;
    cdsArcWareStr15: TStringField;
    cdsArcWareid_OperWare: TAutoIncField;
    cdsArcWareOperVidName: TStringField;
    cdsArcWareCRN_OperSumRez: TFloatField;
    cdsArcWareOnlyDate: TDateTimeField;
    cdsArcWareis_Mirr: TBooleanField;
    cdsArcWareid_Acc_Group: TIntegerField;
    cdsArcWareid_Warehouse_Group: TIntegerField;
    cdsArcWareid_Manufact_Group: TIntegerField;
    cdsArcWareVatIn: TBooleanField;
    cdsArcWareAutoGen: TBooleanField;
    cdsArcWareCreatorFIO: TStringField;
    cdsArcWareCheckerFIO: TStringField;
    cdsMovGoodsDeltaRez: TFloatField;
    dxDBTreeList1DeltaRez: TdxDBTreeListColumn;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxDBTreeList1CustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure aPrintExecute(Sender: TObject);
    procedure aPreviewExecute(Sender: TObject);
    procedure cdsBalBeforeClose(DataSet: TDataSet);
    procedure dtToChange(Sender: TObject);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure cdsCalcGDetTotalAmountGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure dxDBTreeList1GetSelectedIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure dxDBTreeList1GetImageIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure aExpandNodeExecute(Sender: TObject);
    procedure aExpandAllExecute(Sender: TObject);
    procedure aCollapseNodeExecute(Sender: TObject);
    procedure aCollapseAllExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure aNodeExpExecute(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cbMoveClick(Sender: TObject);
    procedure aExpOperExecute(Sender: TObject);
    procedure fArc1dsArcDataChange(Sender: TObject; Field: TField);
    procedure cdsMovGoodsFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure aReValExecute(Sender: TObject);
    procedure fArc1N31Click(Sender: TObject);
    procedure fArc1N36Click(Sender: TObject);
    procedure cdsMovGoodsCalcFields(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
  private
    FFFNode : TdxTreeListNode;
    FID_Warehouse : Variant;
    FID_Bsn : Variant;
    FShowNull : boolean;
    procedure GetAGPrinterInfo;
    procedure SelectEvent(ID, ID_Ctg : integer);
    procedure GetIDS(var ID, ID_Ctg: Variant);
    procedure GetGoods;
    { Private declarations }
  public
    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    procedure Initialize(ID_Warehouse, ID_Bsn : Variant; AShowNull : boolean = false); overload;
    procedure Initialize(AParamBlnc : TParamBlnc; AShowNull : boolean = false); overload;
  end;

implementation

uses uDM, foMyFuncDXTreeExcel, uWareFinder, foMyFuncEh, uWizReVal;

{$R *.DFM}

procedure TfMov_Goods.Initialize(AParamBlnc : TParamBlnc; AShowNull : boolean);
begin
  dxDBTreeList1.OnChangeNode := nil;
  try
    if AParamBlnc.DateFrom <> Null then
      dtFrom.Date := AParamBlnc.DateFrom;
    if AParamBlnc.DateTo <> Null then
      dtTo.Date := AParamBlnc.DateTo;

    Initialize(AParamBlnc.ID_Warehouse, AParamBlnc.id_business, AShowNull);
  finally
    dxDBTreeList1.OnChangeNode := dxDBTreeList1ChangeNode;
    if AParamBlnc.id_Goods <> Null then
      SelectEvent(AParamBlnc.id_Goods, -13);
  end;
end;

procedure TfMov_Goods.Initialize(ID_Warehouse, ID_Bsn : Variant; AShowNull : boolean);
begin
  cdsArcWare.Close;
  FShowNull := AShowNull;
  

  FID_Warehouse := ID_Warehouse;
  
  FID_Bsn := ID_Bsn;
  fArc1.id_business := FID_Bsn;
  
  Screen.Cursor := crSQLWait;
  try
    with cdsMovGoods do
    begin
      DisableControls;
      Close;
      Params.ParamByName('@ID_Warehouse').Value := FID_Warehouse;
      Params.ParamByName('@ShowNull').Value := FShowNull;

      Params.ParamByName('@DateFrom').AsDateTime := GetDateAdv(dtFrom.Date, false);
      Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(dtTo.Date, true);

      if FID_Warehouse = Null then
        Exit;
      Open;
    end;
 //   dxMasterView2.Items.Expand(true);
 //   dxMasterView2.Items.Collapse(true);
  finally
    cdsMovGoods.EnableControls;
    dxDBTreeList1.FullCollapse;
    if dxDBTreeList1.Count > 0 then
    begin
      dxDBTreeList1.MakeNodeVisible(dxDBTreeList1.Items[0]);
      dxDBTreeList1.Items[0].Selected := true;
      dxDBTreeList1.Items[0].MakeVisible;
    end;
    Screen.Cursor := crDefault;
  end;
end;

constructor TfMov_Goods.Create(AOwner: TCOmponent);
var Reg : TRegistry;
    FullRegPathName : String;
    Own : TCustomForm;
    i : integer;
begin
  inherited;
  cbRez.Visible := DM.FMayRez;
  if not DM.FMayRez then
  begin
    for i := 0 to dxDBTreeList1.ColumnCount - 1 do
      if (dxDBTreeList1.Columns[i].Field = cdsMovGoodsTotalAmountRez) or
         (dxDBTreeList1.Columns[i].Field = cdsMovGoodsTotalSumRez) then
         dxDBTreeList1.Columns[i].Visible := false;
  end;

  FFFNode := nil;
  dxDBTreeList1.RegistryPath := SRegPath + '\' +Name + '\wwq2' + dxDBTreeList1.Name;
  FID_Warehouse := Null;
  lbInfo.Caption := '';
  dtFrom.Date := Now - 1;
  dtTo.Date := Now;
  fArc1.aWHRep.Visible := false;
  
  fArc1.pnDate.Visible := false;
  fArc1.pnDate.Visible := false;
  fArc1.pnDate.Visible := false;
  fArc1.dsArc.DataSet := cdsArcWare;

  fArc1.aBuffDel.Visible := false;

  fArc1.DisableEditAct;                                
  fArc1.aNewCopyOper2.Visible := true;
  fArc1.aDelete.Visible := true;
  fArc1.aNewCor.Visible := true;
//  fArc1.MayRefreshe:= false;
  fArc1.aBuffAdd.Visible := true;

  fArc1.ToolBar1.Visible := false;
  fArc1.ToolBar2.Visible := false;

  Own := GetControlOwner(Self);
  if Own <> nil then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      FullRegPathName := SRegPath + '\' + TForm(Own).Name + '\' + ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        if Reg.ValueExists('dxDBTreeList1Height') then
          dxDBTreeList1.Height := Reg.ReadInteger('dxDBTreeList1Height');
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  with fArc1 do LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + Name + '\grdList1');
end;

procedure TfMov_Goods.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TfMov_Goods.dxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if (ANode.Values[dxDBTreeList1AmountDelta.Index] <> Null) and (ANode.Values[dxDBTreeList1AmountDelta.Index] < -0.005) then
  begin
    AColor := clRed;
  end
end;

procedure TfMov_Goods.aPrintExecute(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Print(True, nil, nil);
end;

procedure TfMov_Goods.GetAGPrinterInfo;
begin
//  dxComponentPrinter1Link2.ReportTitleText := fBsnSelector1.BsnName; //'Баланс';
  dxComponentPrinter1Link2.ReportTitleText := dxComponentPrinter1Link2.ReportTitleText + #13 + #10 + lbInfo.Caption;
  dxComponentPrinter1Link2.ReportTitleMode := tmOnEveryTopPage;
end;


procedure TfMov_Goods.aPreviewExecute(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Preview(True, nil);
end;

procedure TfMov_Goods.cdsBalBeforeClose(DataSet: TDataSet);
begin
  aClosePeriod.Enabled := false;
  aSave.Enabled := false;
end;

procedure TfMov_Goods.dtToChange(Sender: TObject);
begin
  aSave.Enabled := false;
  aClosePeriod.Enabled := false;
end;

procedure TfMov_Goods.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfMov_Goods.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfMov_Goods.cdsCalcGDetTotalAmountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := FormatFloat('0.##', Sender.AsFloat);
end;

procedure TfMov_Goods.BitBtn2Click(Sender: TObject);
var ID, ID_Ctg : Variant;
begin
  dxDBTreeList1.OnChangeNode := nil;
  try
    GetIDS(ID, ID_Ctg);
    Initialize(FID_Warehouse, FID_Bsn, FShowNull);
  finally
    dxDBTreeList1.OnChangeNode := dxDBTreeList1ChangeNode;
    SelectEvent(ID, ID_Ctg);
  end;
end;

procedure TfMov_Goods.GetIDS(var ID, ID_Ctg : Variant);
begin
  if (FFFNode <> nil) and (dxDBTreeList1.SelectedCount > 0)  then
  begin
    ID := FFFNode.Values[dxDBTreeList1id_Goods.Index];
    ID_Ctg := FFFNode.Values[dxDBTreeList1id_Ctg_Goods.Index];
    if ID_Ctg = -1 then ID_Ctg := -13;
    if ID = Null then ID := -13;
  end
  else
  begin
    ID := -13;
    ID_Ctg := -13;
  end;
end;

procedure TfMov_Goods.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  Index := Node.ImageIndex;
end;

procedure TfMov_Goods.dxDBTreeList1GetImageIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  if Node.Values[dxDBTreeList1id_Goods.Index] <> Null then
    Index := 0
  else
    Index := 3;
end;

procedure TfMov_Goods.dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
var id_Goods : Variant;
begin
  FFFNode := Node;
  Timer1.Enabled := false;
  Timer1.Enabled := true;
  {with cdsArcWare do
  begin
    Close;
    try
      Screen.Cursor := crSQLWait;
      if Node.Values[dxDBTreeList1id_Goods.Index] <> Null then
      begin
        id_Goods := null;

        id_Goods := Node.Values[dxDBTreeList1id_Goods.Index];

        Params.ParamByName('@HasViza').Value := true;
        Params.ParamByName('@ID_Warehouse').Value := FID_Warehouse;
        Params.ParamByName('@id_Goods').Value := id_Goods;

        Params.ParamByName('@DateFrom').AsDateTime := GetDateAdv(dtFrom.Date, false);
        Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(dtTo.Date, true);
        Open;
      end;
    finally
      aExpOper.Enabled := not cdsArcWare.IsEmpty;
      Screen.Cursor := crDefault;
    end;
  end;  }
end;

procedure TfMov_Goods.GetGoods;
var id_Goods : Variant;
begin
  if FFFNode <> nil then
  begin
    with cdsArcWare do
    begin
      Close;
      try
        Screen.Cursor := crSQLWait;
        if FFFNode.Values[dxDBTreeList1id_Goods.Index] <> Null then
        begin
          id_Goods := null;

          id_Goods := FFFNode.Values[dxDBTreeList1id_Goods.Index];

          Params.ParamByName('@HasViza').Value := true;
          Params.ParamByName('@ID_Warehouse').Value := FID_Warehouse;
          Params.ParamByName('@id_Goods').Value := id_Goods;

          Params.ParamByName('@DateFrom').AsDateTime := GetDateAdv(dtFrom.Date, false);
          Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(dtTo.Date, true);
          Open;
        end;
      finally
        aExpOper.Enabled := not cdsArcWare.IsEmpty;
        Screen.Cursor := crDefault;
      end;
    end;
  end
  else
    cdsArcWare.Close;
end;

destructor TfMov_Goods.Destroy;
var Reg : TRegistry;
    FullRegPathName : String;
    Own : TCustomForm;
begin
  with fArc1 do SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + Name + '\grdList1');
  Own := GetControlOwner(Self);
  if Own <> nil then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      FullRegPathName := SRegPath + '\' + TForm(Own).Name + '\' + ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        Reg.WriteInteger('dxDBTreeList1Height', dxDBTreeList1.Height);
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  inherited;
end;

procedure TfMov_Goods.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TfMov_Goods.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TfMov_Goods.aCollapseNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TfMov_Goods.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TfMov_Goods.PopupMenu1Popup(Sender: TObject);
begin
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);
  aReVal.Enabled := (FFFNode <> Nil) and (not FFFNode.HasChildren);
end;

procedure TfMov_Goods.Action2Execute(Sender: TObject);
var S : String;
begin
  S := ''; //'Баланс';
  DBTreeListToExcel(dxDBTreeList1, S);
end;

procedure TfMov_Goods.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  S := ''; //'Баланс';
  DBTreeListToExcel(dxDBTreeList1, S, FFFNode);
end;

procedure TfMov_Goods.SpeedButton2Click(Sender: TObject);
begin
  ShowWareFinder(Null, FID_Bsn, SelectEvent, Owner, false);
end;

procedure TfMov_Goods.SelectEvent(ID, ID_Ctg : integer);
var i : integer;
    Node : TdxTreeListNode;
begin
  FFFNode := nil;
  for i := dxDBTreeList1.SelectedCount - 1 downto 0 do
    dxDBTreeList1.SelectedNodes[i].Selected := false;
  Node := dxDBTreeList1.TopNode;
  while Node <> nil do
  begin
    if (Node.Values[dxDBTreeList1id_Goods.Index] = ID) or
       (Node.Values[dxDBTreeList1id_Ctg_Goods.Index] = ID_Ctg) then
    begin
      dxDBTreeList1.MakeNodeVisible(Node);
      Node.Selected := true;
      Node.Focused := true;
      FFFNode := Node;
      Break;
    end;

    Node := Node.GetNext;
  end;
{  if not cdsMovGoods.Locate('id_Goods', integer(Sender), []) then
    cdsMovGoods.First; }
end;


procedure TfMov_Goods.aExpOperExecute(Sender: TObject);
begin
  fArc1.aGreedToExcel.Execute;
end;

procedure TfMov_Goods.fArc1dsArcDataChange(Sender: TObject; Field: TField);
begin
  fArc1.dsArcDataChange(Sender, Field);
end;

procedure TfMov_Goods.cbMoveClick(Sender: TObject);
var ID, ID_Ctg : Variant;
begin
  GetIDS(ID, ID_Ctg);
  with cdsMovGoods do
    Filtered := cbMove.Checked or cbSumm.Checked or cbRez.Checked;
  SelectEvent(ID, ID_Ctg);
end;

procedure TfMov_Goods.cdsMovGoodsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  with DataSet do
    Accept := (not cbMove.Checked or
              (ABS(FieldByName('TotalAmountIn').AsFloat)>=0.005)
              OR (ABS(FieldByName('TotalSumIn').AsFloat)>=0.005)
              OR (ABS(FieldByName('TotalAmountOut').AsFloat)>=0.005)
              OR (ABS(FieldByName('TotalSumOut').AsFloat)>=0.005))
              and
              (not cbSumm.Checked or
              (ABS(DataSet.FieldByName('TotalAmount').AsFloat)>=0.005)
              OR (ABS(DataSet.FieldByName('TotalSum').AsFloat)>=0.005))
              and
              (not cbRez.Checked or
              (ABS(FieldByName('TotalAmountRez').AsFloat)>=0.005)
              OR (ABS(FieldByName('TotalSumRez').AsFloat)>=0.005));
end;

procedure TfMov_Goods.aReValExecute(Sender: TObject);
begin
  ShowWizReVal(Handle, FID_WareHouse, FFFNode.Values[dxDBTreeList1id_Goods.Index], Owner);
end;

procedure TfMov_Goods.DoRefrMsg(var Msg: TMessage);
begin
  BitBtn2.Click;
end;

procedure TfMov_Goods.fArc1N31Click(Sender: TObject);
begin
  fArc1.aBackToCAExecute(Sender);
  BitBtn2.Click;
end;

procedure TfMov_Goods.fArc1N36Click(Sender: TObject);
begin
  fArc1.aBackFromCAExecute(Sender);
  BitBtn2.Click;
end;

procedure TfMov_Goods.cdsMovGoodsCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('TotalAmountRez').AsVariant >= DataSet.FieldByName('TotalSumRez').AsVariant then
    DataSet.FieldByName('DeltaRez').AsVariant := DataSet.FieldByName('TotalAmountRez').AsVariant - DataSet.FieldByName('TotalSumRez').AsVariant;

end;

procedure TfMov_Goods.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  GetGoods;
end;

end.
