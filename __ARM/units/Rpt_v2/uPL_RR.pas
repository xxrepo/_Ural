unit uPL_RR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons, Menus, Mask, ToolEdit, CurrEdit, dxGrClms;

type
  TPL_RR = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    dsCAPrfLoss: TDataSource;
    cdsPL_w: TClientDataSet;
    Panel1: TPanel;
    Button1: TButton;
    dxComponentPrinter1: TdxComponentPrinter;
    dxDBTreeList1: TdxDBTreeList;
    dxPrintDialog1: TdxPrintDialog;
    dxComponentPrinter1Link1: TdxDBTreeListReportLink;
    ilButtons: TImageList;
    BitBtn1: TBitBtn;
    dxComponentPrinter2: TdxComponentPrinter;
    dxComponentPrinter1Link2: TdxDBTreeListReportLink;
    dxDBTreeList1id_Ctg_Goods: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_BaseCtg_Goods: TdxDBTreeListMaskColumn;
    dxDBTreeList1Name: TdxDBTreeListMaskColumn;
    dxDBTreeList1ID: TdxDBTreeListColumn;
    ilEM: TImageList;
    ActionList1: TActionList;
    aPrint: TAction;
    aPreview: TAction;
    aShowBalance: TAction;
    aExpandNode: TAction;
    aExpandAll: TAction;
    aCollapseNode: TAction;
    aCollapseAll: TAction;
    aExport: TAction;
    aNodeExp: TAction;
    PopupMenu1: TPopupMenu;
    aShowBalance1: TMenuItem;
    N4: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    dxDBTreeList1AvgTotal: TdxDBTreeListMaskColumn;
    aDetail: TAction;
    N1: TMenuItem;
    Excel1: TMenuItem;
    BitBtn5: TBitBtn;
    cdsPL_wALEVEL: TIntegerField;
    cdsPL_wID: TAutoIncField;
    cdsPL_wid_Measure: TIntegerField;
    cdsPL_wMSCNT: TIntegerField;
    cdsPL_wName: TStringField;
    cdsPL_wid_Ctg_Goods: TIntegerField;
    cdsPL_wid_BaseCtg_Goods: TIntegerField;
    cdsPL_wid_Goods: TIntegerField;
    cdsPL_wDateFirstOper: TDateTimeField;
    cdsPL_wAvgYear: TFloatField;
    cdsPL_wAvgTotal: TFloatField;
    cdsPL_wS_Total: TFloatField;
    cdsPL_wS_ByPeriod: TFloatField;
    cdsPL_wM1_Amount: TFloatField;
    cdsPL_wM2_Amount: TFloatField;
    cdsPL_wM3_Amount: TFloatField;
    cdsPL_wM4_Amount: TFloatField;
    cdsPL_wM5_Amount: TFloatField;
    cdsPL_wM6_Amount: TFloatField;
    cdsPL_wM7_Amount: TFloatField;
    cdsPL_wM8_Amount: TFloatField;
    cdsPL_wM9_Amount: TFloatField;
    cdsPL_wM10_Amount: TFloatField;
    cdsPL_wM11_Amount: TFloatField;
    cdsPL_wM12_Amount: TFloatField;
    cdsPL_wM13_Amount: TFloatField;
    cdsPL_wM14_Amount: TFloatField;
    cdsPL_wM15_Amount: TFloatField;
    cdsPL_wM16_Amount: TFloatField;
    cdsPL_wM17_Amount: TFloatField;
    cdsPL_wM18_Amount: TFloatField;
    dxDBTreeList1S_ByPeriod: TdxDBTreeListMaskColumn;
    cdsPL_wMSName: TStringField;
    dxDBTreeList1MSName: TdxDBTreeListMaskColumn;
    cdsPL_wAvg_Amount: TFloatField;
    cdsPL_wAvg_Price: TFloatField;
    dxDBTreeList1Avg_Amount: TdxDBTreeListMaskColumn;
    dxDBTreeList1Avg_Price: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Goods: TdxDBTreeListColumn;
    dtWH: TDateTimePicker;
    Label3: TLabel;
    dtTo: TDateTimePicker;
    Label1: TLabel;
    dtFrom: TDateTimePicker;
    Label2: TLabel;
    cdsPL_wD_Amount: TFloatField;
    cdsPL_wD_Summ: TFloatField;
    dxDBTreeList1D_Amount: TdxDBTreeListColumn;
    dxDBTreeList1D_Summ: TdxDBTreeListColumn;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure dxDBTreeList1CustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure aPrintExecute(Sender: TObject);
    procedure dxDBTreeList1GetImageIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure dxDBTreeList1GetSelectedIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure aShowBalanceExecute(Sender: TObject);
    procedure aExpandNodeExecute(Sender: TObject);
    procedure aExpandAllExecute(Sender: TObject);
    procedure aCollapseNodeExecute(Sender: TObject);
    procedure aCollapseAllExecute(Sender: TObject);
    procedure aExportExecute(Sender: TObject);
    procedure aNodeExpExecute(Sender: TObject);
    procedure dsCAPrfLossDataChange(Sender: TObject; Field: TField);
    procedure aDetailExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cdsPL_wCalcFields(DataSet: TDataSet);
  private
    FFFNode : TdxTreeListNode;
    function GetBlnDateTime_int(ATo: boolean): Variant;
    procedure GetAGPrinterInfo;
    procedure GetIDS(var ID, ID_Ctg: Variant);
    procedure SelectEvent(ID, ID_Ctg: integer);
    procedure SetCapt;
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure SetChecked;
  end;

procedure ShowPL_RR;

var
  PL_RR: TPL_RR;

implementation

uses uDM, foMyFunc, foMyFuncDXTreeExcel, uBalance, uCAPrfLoss_Det;

{$R *.DFM}

procedure ShowPL_RR;
var F : TPL_RR;
begin
  F := TPL_RR.Create(nil);
  try
    F.SetChecked;
    F.SetCapt;

//    F.Initialize;
    F.Show;
  except
    F.Free;
  end;
end;

{ TBalanceBsn }


function TPL_RR.GetBlnDateTime_int(ATo : boolean): Variant;
var ctrlDate : TDateTimePicker;
begin
  if ATo then
  begin
    ctrlDate := dtTo;
  end
  else
  begin
    ctrlDate := dtFrom;
  end;
  Result := Int(ctrlDate.Date);
  Result := GetDateAdv(ctrlDate.Date, ATo);
end;

procedure TPL_RR.SetChecked;
begin
  dtFrom.Checked := true;
  dtFrom.Checked := false;

end;

procedure TPL_RR.SetCapt;
var i : integer;
    ACol : TdxDBTreeListColumn;
    AColumnClass: TdxDBTreeListColumnClass;
    ABand : TdxTreeListBand;
    AField : TField;
    D, D2 : TDate;
    Year, Month, Day : Word;
begin
  BeginUpdateControl(dxDBTreeList1);
  dtFrom.Checked := true;
  dtFrom.Checked := false;

  for i := 0 to cdsPL_w.fields.Count - 1 do
  begin
    if cdsPL_w.fields[i] is TNumericField then
      TNumericField(cdsPL_w.fields[i]).DisplayFormat := '0.00';
  end;

  for i := dxDBTreeList1.ColumnCount - 1 downto 0 do
  begin
    if dxDBTreeList1.Columns[i].Tag <> 13 then
      dxDBTreeList1.Columns[i].Free;
  end;

 { for i := dxDBTreeList1.Bands.Count - 1 downto 1 do
  begin
    dxDBTreeList1.Bands[i].Free; 
  end;  }

  DecodeDate(dtFrom.DateTime, Year, Month, Day);
  D := EncodeDate(Year, Month, 1);

  DecodeDate(dtTo.DateTime, Year, Month, Day);
  D2 := EncodeDate(Year, Month, 1);
  D2 := IncMonth(D2, 1) - 1;

  for i := 1 to 18 do
  begin

    AField := cdsPL_w.FindField('M' + Inttostr(i) + '_Amount');
    if AField <> nil then
    begin
      ACol := dxDBTreeList1.CreateColumn(TdxDBGridCalcColumn);
      ACol.FieldName := AField.FieldName;
      ACol.BandIndex := 2;
      ACol.Caption := FormatDateTime('mm.yyyy', D);
      ACol.Visible := (D <= D2);// and (ABS(D - dtTo.DateTime) < 30);
    end;
    D := IncMonth(D, 1);
  end;
  EndUpdateControl(dxDBTreeList1);
end;


procedure TPL_RR.GetIDS(var ID, ID_Ctg : Variant);
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

procedure TPL_RR.SelectEvent(ID, ID_Ctg : integer);
var i : integer;
    Node : TdxTreeListNode;
begin
  FFFNode := nil;
  for i := dxDBTreeList1.SelectedCount - 1 downto 0 do
    dxDBTreeList1.SelectedNodes[i].Selected := false;
  Node := dxDBTreeList1.TopNode;
  while Node <> nil do
  begin
    if (Node.Values[dxDBTreeList1id_Ctg_Goods.Index] = ID) or
       (Node.Values[dxDBTreeList1id_BaseCtg_Goods.Index] = ID_Ctg) then
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

procedure TPL_RR.Initialize;
begin

  Screen.Cursor := crSQLWait;
  try
    with cdsPL_w do
    begin
      Close;
    {  Params.ParamByName('@IDGoodsList').Value := Null;
      Params.ParamByName('@IDGoodsGroupList').Value := Null;
      Params.ParamByName('@IDCAList').Value := Null;
      Params.ParamByName('@IDCAGroupList').Value := Null; }

      Params.ParamByName('@DateFrom').Value := GetBlnDateTime_int(false);

      Params.ParamByName('@DateTo').Value := GetBlnDateTime_int(true);
      Params.ParamByName('@DateWH').Value := GetDateAdv(dtWH.Date, true);
      Open;
    end;
    if dxDBTreeList1.Count > 0 then
    begin
      dxDBTreeList1.Items[0].Focused := true;
      dxDBTreeList1.FullCollapse;
      dxDBTreeList1ChangeNode(dxDBTreeList1, nil, dxDBTreeList1.Items[0]);
      dxDBTreeList1.Items[0].Expand(false);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TPL_RR.Button1Click(Sender: TObject);
var id_business : Variant;
    ID, ID_Ctg : Variant;
begin
  dxDBTreeList1.OnChangeNode := nil;
  try
    GetIDS(ID, ID_Ctg);
    SetCapt;
    Initialize;
  finally
    dxDBTreeList1.OnChangeNode := dxDBTreeList1ChangeNode;
    SelectEvent(ID, ID_Ctg);
  end;
end;

constructor TPL_RR.Create(AOwner: TCOmponent);
var V : Variant;
begin
  inherited;
  LoadValFromRegistry(V, SRegPath + '\' + Name,  'OnlyNotZerro');

  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  dtFrom.Date := Now - 30;
  dtTo.Date := Now;
  dtWH.Date := Now;

  dtFrom.Checked := true;
  dtFrom.Checked := false;
  dxDBTreeList1.RegistryPath := SRegPath + '\q' + ClassName;
  dxDBTreeList1.OptionsBehavior := dxDBTreeList1.OptionsBehavior + [etoStoreToRegistry];
end;

procedure TPL_RR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TPL_RR.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TPL_RR.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TPL_RR.dxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  ColInd: Integer;
begin
 // ColInd := dxDBTreeList1id_ContrAgent.Index;
    if (ANode.Parent = nil) then   // Верхний уровень
    begin
      if not ASelected then
        AColor := $00D7D700;
    end;
end;

procedure TPL_RR.aPrintExecute(Sender: TObject);
begin
  dxComponentPrinter2.Print(True,nil,nil);
end;

procedure TPL_RR.dxDBTreeList1GetImageIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
var
  ColInd: Integer;
begin
  Index := 2;
end;

procedure TPL_RR.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  index := 2;
end;

procedure TPL_RR.dxDBTreeList1ChangeNode(Sender: TObject;
  OldNode, Node: TdxTreeListNode);
begin
  FFFNode := Node;
end;

procedure TPL_RR.PopupMenu1Popup(Sender: TObject);
begin
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);
end;

procedure TPL_RR.aShowBalanceExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  //AParamBlnc.id_ContrAgent := cdsPL_wid_ContrAgent.AsInteger;
  AParamBlnc.DateFrom := (dtFrom.Date);
  AParamBlnc.DateTo := (AParamBlnc.DateFrom) + 1;
  ShowBalance(AParamBlnc);
end;

procedure TPL_RR.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TPL_RR.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TPL_RR.aCollapseNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TPL_RR.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TPL_RR.aExportExecute(Sender: TObject);
var S : String;
begin
//  S := S + #13 + #10 + lbInfo.Caption;
  DBTreeListToExcel(dxDBTreeList1, '');
end;

procedure TPL_RR.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  DBTreeListToExcel(dxDBTreeList1, S, FFFNode);
end;

procedure TPL_RR.dsCAPrfLossDataChange(Sender: TObject;
  Field: TField);
begin
  aCollapseAll.Enabled := not cdsPL_w.IsEmpty;
  aExpandAll.Enabled := not cdsPL_w.IsEmpty;

  //aShowBalance.Enabled := not cdsPL_w.FieldByName('id_ContrAgent').IsNull;
  //aDetail.Enabled := not cdsPL_w.FieldByName('id_ContrAgent').IsNull;
end;

destructor TPL_RR.Destroy;
begin
 // SaveValToRegistry(cbOnlyNotZerro.checked, SRegPath + '\' + Name,  'OnlyNotZerro');
  inherited;

end;

procedure TPL_RR.aDetailExecute(Sender: TObject);
var ABlnDetail : TPL_DetailData;
begin
{  ABlnDetail := GetEmptyPL_DetailData;
  ABlnDetail.id_business := fBsnSelector1.ID;
  ABlnDetail.id_Oper := cdsPL_w.Params.ParamByName('@id_Oper').Value;
  ABlnDetail.id_ContrAgent := cdsPL_w.FieldByName('id_ContrAgent').AsInteger;

  if dtFrom.Checked then
    ABlnDetail.DateFrom := GetBlnDateTime_int(false)
  else
    ABlnDetail.DateFrom := Null;

  ABlnDetail.Date := GetBlnDateTime_int(true);


  ShowCAPrfLoss_Det(Caption + ' - ' + cdsPL_w.FieldByName('Name').AsString, ABlnDetail) }
end;

procedure TPL_RR.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TPL_RR.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TPL_RR.BitBtn1Click(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Preview(True, nil);
end;

procedure TPL_RR.GetAGPrinterInfo;
begin
  dxComponentPrinter1Link2.ReportTitleText := Caption + ' ' + '(' + FormatDateTime('dd-mm-yyyy hh:nn', dtTo.DateTime) + ')'; //'Баланс';
  dxComponentPrinter1Link2.ReportTitleMode := tmOnEveryTopPage;
end;


procedure TPL_RR.cdsPL_wCalcFields(DataSet: TDataSet);
begin
  if (DataSet.FieldByName('id_Ctg_Goods').AsInteger = -1) and (DataSet.FieldByName('AvgTotal').AsFloat > DataSet.FieldByName('Avg_Amount').AsFloat) then
  begin
    DataSet.FieldByName('D_Amount').AsFloat :=
      DataSet.FieldByName('AvgTotal').AsFloat - DataSet.FieldByName('Avg_Amount').AsFloat;
    DataSet.FieldByName('D_Summ').AsFloat :=
    DataSet.FieldByName('D_Amount').AsFloat *  DataSet.FieldByName('Avg_Price').AsFloat;
  end;
end;

end.
