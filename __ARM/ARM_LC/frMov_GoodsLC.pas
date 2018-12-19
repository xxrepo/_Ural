unit frMov_GoodsLC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, dxMasterView, Grids, DBGrids, RXDBCtrl,
  ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons,
  dxPSGlbl, Menus, DBGridEh, ToolWin, Mask, DBCtrls, Registry,
  RXCtrls
  ;

type
  TfMov_GoodsLC = class(TFrame)
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
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
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
    cdsMovGoodsid_Measure: TIntegerField;
    cdsMovGoodsMeasureName: TStringField;
    cdsMovGoodsCurrencyName: TStringField;
    pnDate: TPanel;
    dxDBTreeList1id_BaseCtg_Goods: TdxDBTreeListColumn;
    dxDBTreeList1id_Goods: TdxDBTreeListColumn;
    ilImage: TImageList;
    PopupMenu1: TPopupMenu;
    cdsMovGoodsAvgPrice: TFloatField;
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
    CheckBox1: TCheckBox;
    aExpOper: TAction;
    ToolButton5: TToolButton;
    BitBtn2: TBitBtn;
    cdsMovGoodsTotalAmountRez: TFloatField;
    cdsMovGoodsTotalSumRez: TFloatField;
    cdsMovGoodsAmountDelta: TFloatField;
    dxDBTreeList1TotalAmountRez: TdxDBTreeListColumn;
    dxDBTreeList1TotalSumRez: TdxDBTreeListColumn;
    dxDBTreeList1AmountDelta: TdxDBTreeListColumn;
    procedure dxMasterView2Level1FilterRecord(Sender: TdxMasterViewLevel;
      const AID, AKeyValue: Variant; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxDBTreeList1CustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dxMasterView2Level2Expanding(Sender: TdxMasterViewLevel;
      Node: TdxMasterViewNode; var Allow: Boolean);
    procedure aPrintExecute(Sender: TObject);
    procedure aPreviewExecute(Sender: TObject);
    procedure cdsBalBeforeClose(DataSet: TDataSet);
    procedure dxComponentPrinter1Link2CustomDrawCell(
      Sender: TBasedxReportLink; ACanvas: TCanvas; ABoundsRect,
      AClientRect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; var AText: String; var AColor: TColor;
      AFont: TFont; var ATextAlignX: TdxTextAlignX;
      var ATextAlignY: TdxTextAlignY; var ADone: Boolean);
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
    procedure CheckBox1Click(Sender: TObject);
  private
    FFFNode : TdxTreeListNode;
    FID_Warehouse : Variant;
    FID_Bsn : Variant;
    FShowNull : boolean;
    procedure GetAGPrinterInfo;
    procedure SelectEvent(ID, ID_Ctg : integer);
    procedure GetIDS(var ID, ID_Ctg: Variant);
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    procedure Initialize(ID_Warehouse : Variant; ID_Bsn : Variant; AShowNull : boolean = false);
  end;

implementation

uses uDM, foMyFunc, foMyFuncDXTreeExcel, uWareFinder;

{$R *.DFM}


procedure TfMov_GoodsLC.Initialize(ID_Warehouse : Variant; ID_Bsn : Variant; AShowNull : boolean);
begin
  FShowNull := AShowNull;
  
  FID_Warehouse := ID_Warehouse;
  FID_Bsn := ID_Bsn;
  Screen.Cursor := crSQLWait;
  try
    with cdsMovGoods do
    begin
      DisableControls;
      Close;
      Params.ParamByName('@ID_Warehouse').Value := FID_Warehouse;
      Params.ParamByName('@ShowNull').Value := FShowNull;
//      Params.ParamByName('@DateFrom').AsDateTime := Null;//Int(dtFrom.Date);
//      Params.ParamByName('@DateTo').AsDateTime := Null;//Int(dtTo.Date) + 1;

      Params.ParamByName('@DateFrom').AsDateTime := 0;
      Params.ParamByName('@DateTo').AsDateTime := Now + 365*20;
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

procedure TfMov_GoodsLC.dxMasterView2Level1FilterRecord(
  Sender: TdxMasterViewLevel; const AID, AKeyValue: Variant;
  var Accept: Boolean);
begin
  Accept := Sender.DataSet.FieldByName('id_Rr').IsNull;
end;

constructor TfMov_GoodsLC.Create(AOwner: TCOmponent);
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
begin
  inherited;
  dxDBTreeList1.RegistryPath := SRegPath + '\LC3' +Name + '\' + dxDBTreeList1.Name;
  FID_Warehouse := Null;
  lbInfo.Caption := '';
 // dtFrom.Date := Now - 1;
 // dtTo.Date := Now;

  if Owner is TCustomForm then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      FullRegPathName := SRegPath + '\' + TForm(Owner).Name + '\' + ClassName;
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
end;

procedure TfMov_GoodsLC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TfMov_GoodsLC.dxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  ColInd: Integer;
begin
  if (ANode.Values[dxDBTreeList1AmountDelta.Index] <> Null) and (ANode.Values[dxDBTreeList1AmountDelta.Index] < -0.005) then
  begin
    AColor := clRed;
  end
end;

procedure TfMov_GoodsLC.dxMasterView2Level2Expanding(
  Sender: TdxMasterViewLevel; Node: TdxMasterViewNode; var Allow: Boolean);
var NewLV : TdxMasterViewLevel;
begin
  if not Sender.HasChildren then
  begin
    NewLV := Sender.Add;
    NewLV.Assign(Sender);
  end;
end;

procedure TfMov_GoodsLC.aPrintExecute(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Print(True, nil, nil);
end;

procedure TfMov_GoodsLC.GetAGPrinterInfo;
begin
//  dxComponentPrinter1Link2.ReportTitleText := fBsnSelector1.BsnName; //'Баланс';
  dxComponentPrinter1Link2.ReportTitleText := dxComponentPrinter1Link2.ReportTitleText + #13 + #10 + lbInfo.Caption;
  dxComponentPrinter1Link2.ReportTitleMode := tmOnEveryTopPage;
end;


procedure TfMov_GoodsLC.aPreviewExecute(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Preview(True, nil);
end;

procedure TfMov_GoodsLC.cdsBalBeforeClose(DataSet: TDataSet);
begin
  aClosePeriod.Enabled := false;
  aSave.Enabled := false;
end;

procedure TfMov_GoodsLC.dxComponentPrinter1Link2CustomDrawCell(
  Sender: TBasedxReportLink; ACanvas: TCanvas; ABoundsRect,
  AClientRect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
  var AText: String; var AColor: TColor; AFont: TFont;
  var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY;
  var ADone: Boolean);
var
  ColInd: Integer;
begin
{  ColInd := dxDBTreeList1OrdNum.Index;
    if (ANode.Parent = nil) then   // Верхний уровень
    begin
      AFont.Style := AFont.Style + [fsBold];
      if (ANode.Values[ColInd] = 100) or (ANode.Values[ColInd] = 180) then
      begin
        AColor := clInfoBk;
    //    if ASelected then
    //      AFont.Color := clBlack;
      end
      else
        if (ANode.Values[ColInd] = 110) then
        begin
          if (ABS(ANode.Values[dxDBTreeList1OperSummSysCur.Index]) > 0.01) then
          begin
            AColor := clRed;
          end
          else
          begin
            AColor := $00D7D700;
          end;
        end
        else
   //       if not ASelected then
     //       AColor := $00E0E2E4;
    end;   }
end;

procedure TfMov_GoodsLC.dtToChange(Sender: TObject);
begin
  aSave.Enabled := false;
  aClosePeriod.Enabled := false;
end;

procedure TfMov_GoodsLC.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfMov_GoodsLC.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfMov_GoodsLC.cdsCalcGDetTotalAmountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := FormatFloat('0.##', Sender.AsFloat);
end;

procedure TfMov_GoodsLC.BitBtn2Click(Sender: TObject);
var ID, ID_Ctg : Variant;
begin
  GetIDS(ID, ID_Ctg);
  Initialize(FID_Warehouse, FID_Bsn, FShowNull);
  SelectEvent(ID, ID_Ctg);
end;

procedure TfMov_GoodsLC.GetIDS(var ID, ID_Ctg : Variant);
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


procedure TfMov_GoodsLC.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  Index := Node.ImageIndex;
end;

procedure TfMov_GoodsLC.dxDBTreeList1GetImageIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  if Node.Values[dxDBTreeList1id_Goods.Index] <> Null then
    Index := 0
  else
    Index := 3;
end;

procedure TfMov_GoodsLC.dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
var id_Goods : Variant;
begin
  FFFNode := Node;
end;

destructor TfMov_GoodsLC.Destroy;
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
begin
  if Owner is TCustomForm then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      FullRegPathName := SRegPath + '\' + TForm(Owner).Name + '\' + ClassName;
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

procedure TfMov_GoodsLC.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TfMov_GoodsLC.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TfMov_GoodsLC.aCollapseNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TfMov_GoodsLC.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TfMov_GoodsLC.PopupMenu1Popup(Sender: TObject);
begin
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);
end;

procedure TfMov_GoodsLC.Action2Execute(Sender: TObject);
var S : String;
begin
  S := ''; //'Баланс';
  DBTreeListToExcel(dxDBTreeList1, S);
end;

procedure TfMov_GoodsLC.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  S := ''; //'Баланс';
  DBTreeListToExcel(dxDBTreeList1, S, FFFNode);
end;

procedure TfMov_GoodsLC.SpeedButton2Click(Sender: TObject);
begin
  ShowWareFinder(Null, FID_Bsn, SelectEvent, Self, true);
end;

procedure TfMov_GoodsLC.SelectEvent(ID, ID_Ctg : integer);
var i : integer;
    Node : TdxTreeListNode;
begin
  for i := dxDBTreeList1.SelectedCount - 1 downto 0 do
    dxDBTreeList1.SelectedNodes[i].Selected := false;
  Node := dxDBTreeList1.TopNode;
  while Node <> nil do
  begin
    if (Node.Values[dxDBTreeList1id_Goods.Index] = ID) or
       (Node.Values[dxDBTreeList1id_Ctg_Goods.Index] = ID_Ctg) then
    begin
      dxDBTreeList1.MakeNodeVisible(Node);
      Node.Focused := true;
      Node.Selected := true;
      FFFNode := Node;
      Break;
    end;

    Node := Node.GetNext;
  end;
{  if not cdsMovGoods.Locate('id_Goods', integer(Sender), []) then
    cdsMovGoods.First; }
end;

procedure TfMov_GoodsLC.CheckBox1Click(Sender: TObject);
begin
  with cdsMovGoods do
  begin
    DisableControls;
    try
      Filtered := false;
      Filter := '';
      if CheckBox1.Checked then
        Filter := '(TotalSumOut<-0,01 OR TotalSumOut>0,01) OR (TotalSumIn<-0,01 AND TotalSumIn>0,01)';
      Filtered := Filter <> '';
    finally
      EnableControls;
      dxDBTreeList1.FullCollapse;
    end;
  end;

end;

end.
