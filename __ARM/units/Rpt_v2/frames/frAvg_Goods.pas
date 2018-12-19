unit frAvg_Goods;

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
  TfAvg_Goods = class(TFrame)
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
    cdsWHAvg: TClientDataSet;
    Panel3: TPanel;
    lbInfo: TLabel;
    aShowAccCard: TAction;
    aShowBalance: TAction;
    aCollapseAll: TAction;
    dxDBTreeList1id_Ctg_Goods: TdxDBTreeListMaskColumn;
    dxDBTreeList1Name: TdxDBTreeListMaskColumn;
    dxDBTreeList1MeasureName: TdxDBTreeListMaskColumn;
    dxDBTreeList1CurrencyName: TdxDBTreeListMaskColumn;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    dxDBTreeList1TotalSumOld: TdxDBTreeListMaskColumn;
    dxDBTreeList1TotalAmountOld: TdxDBTreeListMaskColumn;
    pnDate: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    dtTo: TDateTimePicker;
    dtFrom: TDateTimePicker;
    BitBtn2: TBitBtn;
    dxDBTreeList1id_BaseCtg_Goods: TdxDBTreeListColumn;
    dxDBTreeList1id_Goods: TdxDBTreeListColumn;
    ilImage: TImageList;
    PopupMenu1: TPopupMenu;
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
    cbSumm: TCheckBox;
    aReVal: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    cdsWHAvgid_Ctg_Goods: TIntegerField;
    cdsWHAvgid_BaseCtg_Goods: TIntegerField;
    cdsWHAvgid_Goods: TIntegerField;
    cdsWHAvgName: TStringField;
    cdsWHAvgTotalSumOld: TFloatField;
    cdsWHAvgId_Currency: TIntegerField;
    cdsWHAvgTotalAmountOld: TFloatField;
    cdsWHAvgid_Measure: TIntegerField;
    cdsWHAvgMeasureName: TStringField;
    cdsWHAvgCurrencyName: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure cdsWHAvgFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure aReValExecute(Sender: TObject);
  private
    FFFNode : TdxTreeListNode;
    FShowNull : boolean;
    procedure GetAGPrinterInfo;
    procedure SelectEvent(ID, ID_Ctg : integer);
    procedure GetIDS(var ID, ID_Ctg: Variant);
    procedure GetGoods;
    { Private declarations }
  public
    FID_Bsn : Variant;
    FID_Warehouse : Variant;
    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    procedure Initialize(ID_Warehouse, ID_Bsn : Variant; AShowNull : boolean = false); overload;
    procedure Initialize(AParamBlnc : TParamBlnc; AShowNull : boolean = false); overload;
  end;

implementation

uses uDM, foMyFuncDXTreeExcel, uWareFinder, foMyFuncEh, uWizReVal;

{$R *.DFM}

procedure TfAvg_Goods.Initialize(AParamBlnc : TParamBlnc; AShowNull : boolean);
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

procedure TfAvg_Goods.Initialize(ID_Warehouse, ID_Bsn : Variant; AShowNull : boolean);
begin
  FShowNull := AShowNull;
  

  FID_Warehouse := ID_Warehouse;
  
  FID_Bsn := ID_Bsn;
  Screen.Cursor := crSQLWait;
  try
    with cdsWHAvg do
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
    cdsWHAvg.EnableControls;
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

constructor TfAvg_Goods.Create(AOwner: TCOmponent);
var Reg : TRegistry;
    FullRegPathName : String;
    Own : TCustomForm;
    i : integer;
begin
  inherited;
  FFFNode := nil;
  dxDBTreeList1.RegistryPath := SRegPath + '\' +Name + '\wwq' + dxDBTreeList1.Name;
  FID_Warehouse := Null;
  lbInfo.Caption := '';
  dtFrom.Date := Now - 1;
  dtTo.Date := Now;


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
end;

procedure TfAvg_Goods.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TfAvg_Goods.aPrintExecute(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Print(True, nil, nil);
end;

procedure TfAvg_Goods.GetAGPrinterInfo;
begin
//  dxComponentPrinter1Link2.ReportTitleText := fBsnSelector1.BsnName; //'Баланс';
  dxComponentPrinter1Link2.ReportTitleText := dxComponentPrinter1Link2.ReportTitleText + #13 + #10 + lbInfo.Caption;
  dxComponentPrinter1Link2.ReportTitleMode := tmOnEveryTopPage;
end;


procedure TfAvg_Goods.aPreviewExecute(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Preview(True, nil);
end;

procedure TfAvg_Goods.cdsBalBeforeClose(DataSet: TDataSet);
begin
  aClosePeriod.Enabled := false;
  aSave.Enabled := false;
end;

procedure TfAvg_Goods.dtToChange(Sender: TObject);
begin
  aSave.Enabled := false;
  aClosePeriod.Enabled := false;
end;

procedure TfAvg_Goods.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfAvg_Goods.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfAvg_Goods.cdsCalcGDetTotalAmountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := FormatFloat('0.##', Sender.AsFloat);
end;

procedure TfAvg_Goods.BitBtn2Click(Sender: TObject);
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

procedure TfAvg_Goods.GetIDS(var ID, ID_Ctg : Variant);
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

procedure TfAvg_Goods.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  Index := Node.ImageIndex;
end;

procedure TfAvg_Goods.dxDBTreeList1GetImageIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  if Node.Values[dxDBTreeList1id_Goods.Index] <> Null then
    Index := 0
  else
    Index := 3;
end;

procedure TfAvg_Goods.dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
var id_Goods : Variant;
begin
  FFFNode := Node;

end;

procedure TfAvg_Goods.GetGoods;
var id_Goods : Variant;
begin

end;

destructor TfAvg_Goods.Destroy;
var Reg : TRegistry;
    FullRegPathName : String;
    Own : TCustomForm;
begin
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

procedure TfAvg_Goods.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TfAvg_Goods.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TfAvg_Goods.aCollapseNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TfAvg_Goods.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TfAvg_Goods.PopupMenu1Popup(Sender: TObject);
begin
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);
  aReVal.Enabled := (FFFNode <> Nil) and (not FFFNode.HasChildren);
end;

procedure TfAvg_Goods.Action2Execute(Sender: TObject);
var S : String;
begin
  S := ''; //'Баланс';
  DBTreeListToExcel(dxDBTreeList1, S);
end;

procedure TfAvg_Goods.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  S := ''; //'Баланс';
  DBTreeListToExcel(dxDBTreeList1, S, FFFNode);
end;

procedure TfAvg_Goods.SpeedButton2Click(Sender: TObject);
begin
  ShowWareFinder(Null, FID_Bsn, SelectEvent, Owner, false);
end;

procedure TfAvg_Goods.SelectEvent(ID, ID_Ctg : integer);
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


procedure TfAvg_Goods.cbMoveClick(Sender: TObject);
var ID, ID_Ctg : Variant;
begin
  GetIDS(ID, ID_Ctg);
  SelectEvent(ID, ID_Ctg);
end;

procedure TfAvg_Goods.cdsWHAvgFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
 { with DataSet do
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
              OR (ABS(FieldByName('TotalSumRez').AsFloat)>=0.005)); }
end;

procedure TfAvg_Goods.aReValExecute(Sender: TObject);
begin
  ShowWizReVal(Handle, FID_WareHouse, FFFNode.Values[dxDBTreeList1id_Goods.Index], Owner);
end;

procedure TfAvg_Goods.DoRefrMsg(var Msg: TMessage);
begin
end;

end.
