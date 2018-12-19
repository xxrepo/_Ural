unit uInv_Prft;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons, Menus, Mask, ToolEdit, CurrEdit, RXCtrls,
  frObjList;

type
  TInv_Prft = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    dsCAPrfLoss: TDataSource;
    cdsWPrft: TClientDataSet;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    dtFrom: TDateTimePicker;
    Label2: TLabel;
    Button1: TButton;
    dxComponentPrinter1: TdxComponentPrinter;
    dxDBTreeList1: TdxDBTreeList;
    dxPrintDialog1: TdxPrintDialog;
    dxComponentPrinter1Link1: TdxDBTreeListReportLink;
    ilButtons: TImageList;
    BitBtn1: TBitBtn;
    dxComponentPrinter2: TdxComponentPrinter;
    dxComponentPrinter1Link2: TdxDBTreeListReportLink;
    dxDBTreeList1Name: TdxDBTreeListMaskColumn;
    dxDBTreeList1ID: TdxDBTreeListColumn;
    dtTo: TDateTimePicker;
    Label1: TLabel;
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
    N4: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    dxDBTreeList1CurProff: TdxDBTreeListMaskColumn;
    dxDBTreeList1CurLoss: TdxDBTreeListMaskColumn;
    dxDBTreeList1InvSumm: TdxDBTreeListMaskColumn;
    dxDBTreeList1RealWareProff: TdxDBTreeListMaskColumn;
    cbOnlyNotZerro: TCheckBox;
    aDetail: TAction;
    N1: TMenuItem;
    Excel1: TMenuItem;
    dxDBTreeList1Rent: TdxDBTreeListMaskColumn;
    BitBtn5: TBitBtn;
    dxDBTreeList1id_Ctg_Goods: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_BaseCtg_Goods: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Goods: TdxDBTreeListMaskColumn;
    ilImage: TImageList;
    cdsWPrftTotalS: TFloatField;
    dxDBTreeList1Column13: TdxDBTreeListColumn;
    cdsWPrftID: TAutoIncField;
    cdsWPrftid_Ctg_Goods: TIntegerField;
    cdsWPrftid_BaseCtg_Goods: TIntegerField;
    cdsWPrftid_Goods: TIntegerField;
    cdsWPrftName: TStringField;
    cdsWPrftWareProff: TFloatField;
    cdsWPrftWareLoss: TFloatField;
    cdsWPrftInvSumm: TFloatField;
    cdsWPrftRealWareProff: TFloatField;
    cdsWPrftPrj_Inv: TFloatField;
    cdsWPrftPrj_WareProff: TFloatField;
    cdsWPrftRent: TFloatField;
    cdsWPrftPrj_Rent: TFloatField;
    dxDBTreeList1Column12: TdxDBTreeListColumn;
    cdsWPrftDelta: TFloatField;
    dxDBTreeList1Delta: TdxDBTreeListColumn;
    cdsWPrftAmountOper2: TFloatField;
    cdsWPrftAvgInv: TFloatField;
    dxDBTreeList1AmountOper2: TdxDBTreeListMaskColumn;
    dxDBTreeList1AvgInv: TdxDBTreeListColumn;
    cdsWPrftAvgInv_Prj: TFloatField;
    dxDBTreeList1AvgInv_Prj: TdxDBTreeListColumn;
    pmSett: TPopupMenu;
    miSI: TMenuItem;
    miInv: TMenuItem;
    miProff: TMenuItem;
    miRent: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    Label3: TLabel;
    ceOper: TEdit;
    p2: TGroupBox;
    fObjListWare: TfObjList;
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
    procedure cdsWPrftCalcFields(DataSet: TDataSet);
    procedure miSettClick(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
  private
    FFFNode : TdxTreeListNode;
    function GetBlnDateTime_int(ATo: boolean): Variant;
    procedure GetAGPrinterInfo;
    procedure GetIDS(var ID, ID_Ctg: Variant);
    procedure SelectEvent(ID, ID_Ctg: integer);
    procedure SetCapt;
    procedure RefresheLists;
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(id_business : Variant);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure SetChecked;
  end;

procedure ShowInv_Prft(id_business : Variant);

var
  Inv_Prft: TInv_Prft;

implementation

uses uDM, foMyFunc, foMyFuncDXTreeExcel, uBalance, uCAPrfLoss_Det;

{$R *.DFM}

procedure ShowInv_Prft(id_business : Variant);
var F : TInv_Prft;
begin
  F := TInv_Prft.Create(nil);
  try
    F.SetCapt;
    F.SetChecked;
    F.Initialize(id_business);
    F.Show;
  except
    F.Free;
  end;
end;

{ TBalanceBsn }


function TInv_Prft.GetBlnDateTime_int(ATo : boolean): Variant;
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

procedure TInv_Prft.SetChecked;
begin
  dtFrom.Checked := true;
  dtFrom.Checked := false;
end;

procedure TInv_Prft.Initialize(id_business: Variant);
begin
  fBsnSelector1.ID := id_business;
  Screen.Cursor := crSQLWait;
  try
    with cdsWPrft do
    begin
      Close;
      Params.ParamByName('@IDGoodsList').Value := fObjListWare.GetIDList(eotGoods);
      Params.ParamByName('@IDGoodsGroupList').Value := fObjListWare.GetIDList(eotGoodsGroup);

      Params.ParamByName('@id_business').Value := id_business;
      Params.ParamByName('@DateFrom').Value := GetBlnDateTime_int(false);

      Params.ParamByName('@DateTo').Value := GetBlnDateTime_int(true);
      if ceOper.Text <> '' then
      begin
        fBsnSelector1.ID := -1;
        Params.ParamByName('@id_Oper').Value := DM.GetID_Oper(ceOper.Text)
      end
      else
        Params.ParamByName('@id_Oper').Value := Null;
      Params.ParamByName('@OnlyNotZerro').Value := cbOnlyNotZerro.Checked;

      if ((id_business = Null) or (id_business = -1)) and (ceOper.Text = '') then
        Exit;
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

procedure TInv_Prft.Button1Click(Sender: TObject);
var id_business : Variant;
    ID, ID_Ctg : Variant;
begin
  dxDBTreeList1.OnChangeNode := nil;
  try
    GetIDS(ID, ID_Ctg);
    Initialize(fBsnSelector1.ID);
  finally
    dxDBTreeList1.OnChangeNode := dxDBTreeList1ChangeNode;
    SelectEvent(ID, ID_Ctg);
  end;
end;

procedure TInv_Prft.GetIDS(var ID, ID_Ctg : Variant);
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

procedure TInv_Prft.SelectEvent(ID, ID_Ctg : integer);
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

constructor TInv_Prft.Create(AOwner: TCOmponent);
var V : Variant;
begin
  inherited;
  LoadPopupMenuFromRegistry(pmSett, SRegPath + '\' + ClassName + 'pmSett');

  LoadValFromRegistry(V, SRegPath + '\' + Name,  'OnlyNotZerro');
  if V <> Null then
    cbOnlyNotZerro.Checked := V;

  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  dtFrom.Date := Now - 30;
  dtTo.Date := Now;
  dtFrom.Checked := true;
  dtFrom.Checked := false;
  dxDBTreeList1.RegistryPath := SRegPath + '\' + ClassName;
  dxDBTreeList1.OptionsBehavior := dxDBTreeList1.OptionsBehavior + [etoStoreToRegistry];
end;

procedure TInv_Prft.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TInv_Prft.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TInv_Prft.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TInv_Prft.dxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  ColInd: Integer;
begin
    if (ANode.Parent = nil) then   // Верхний уровень
    begin
      if not ASelected then
        AColor := $00D7D700;
    end ;

  ColInd := dxDBTreeList1Delta.Index;
  if ANode.Values[ColInd] < 0 then
  begin
    AColor := clRed;
  end;
end;

procedure TInv_Prft.aPrintExecute(Sender: TObject);
begin
  dxComponentPrinter2.Print(True,nil,nil);
end;

procedure TInv_Prft.dxDBTreeList1GetImageIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  if Node.Values[dxDBTreeList1id_Goods.Index] <> Null then
    Index := 0
  else
    Index := 3;
end;

procedure TInv_Prft.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  index := Node.ImageIndex;
end;

procedure TInv_Prft.dxDBTreeList1ChangeNode(Sender: TObject;
  OldNode, Node: TdxTreeListNode);
begin
  FFFNode := Node;
end;

procedure TInv_Prft.PopupMenu1Popup(Sender: TObject);
begin
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);
end;

procedure TInv_Prft.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TInv_Prft.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TInv_Prft.aCollapseNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TInv_Prft.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TInv_Prft.aExportExecute(Sender: TObject);
var S : String;
begin
  S := fBsnSelector1.BsnName; //'Баланс';
//  S := S + #13 + #10 + lbInfo.Caption;
  DBTreeListToExcel(dxDBTreeList1, S);
end;

procedure TInv_Prft.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  S := fBsnSelector1.BsnName; //'Баланс';
  DBTreeListToExcel(dxDBTreeList1, S, FFFNode);
end;

procedure TInv_Prft.dsCAPrfLossDataChange(Sender: TObject;
  Field: TField);
begin
  aCollapseAll.Enabled := not cdsWPrft.IsEmpty;
  aExpandAll.Enabled := not cdsWPrft.IsEmpty;

 // aShowBalance.Enabled := not cdsCAPrfLoss.FieldByName('id_ContrAgent').IsNull;
  aDetail.Enabled := not cdsWPrft.FieldByName('id_Goods').IsNull;
end;

destructor TInv_Prft.Destroy;
begin
  SavePopupMenuToRegistry(pmSett, SRegPath + '\' + ClassName + 'pmSett');

  SaveValToRegistry(cbOnlyNotZerro.checked, SRegPath + '\' + Name,  'OnlyNotZerro');
  inherited;

end;

procedure TInv_Prft.aDetailExecute(Sender: TObject);
var ABlnDetail : TPL_DetailData;
begin
  ABlnDetail := GetEmptyPL_DetailData;
  ABlnDetail.id_business := fBsnSelector1.ID;
  ABlnDetail.id_Oper := cdsWPrft.Params.ParamByName('@id_Oper').Value;
  ABlnDetail.id_Goods := FFFNode.Values[dxDBTreeList1id_Goods.Index];
  ShowCAPrfLoss_Det(Caption + ' - ' + VarToStr(FFFNode.Values[cdsWPrftName.Index]), ABlnDetail, true);
end;

procedure TInv_Prft.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TInv_Prft.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TInv_Prft.BitBtn1Click(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Preview(True, nil);
end;

procedure TInv_Prft.GetAGPrinterInfo;
begin
  dxComponentPrinter1Link2.ReportTitleText := Caption + ' ' + fBsnSelector1.BsnName + '(' + FormatDateTime('dd-mm-yyyy hh:nn', dtTo.DateTime) + ')'; //'Баланс';
  dxComponentPrinter1Link2.ReportTitleMode := tmOnEveryTopPage;
end;


procedure TInv_Prft.cdsWPrftCalcFields(DataSet: TDataSet);
begin
  if not DataSet.FieldByName('Prj_WareProff').IsNull then
    DataSet.FieldByName('Delta').AsFloat := DataSet.FieldByName('RealWareProff').AsFloat -
                                            DataSet.FieldByName('Prj_WareProff').AsFloat;

  if DataSet.FieldByName('AmountOper2').AsFloat <> 0 then
    DataSet.FieldByName('AvgInv').AsFloat := DataSet.FieldByName('InvSumm').AsFloat/
                                            DataSet.FieldByName('AmountOper2').AsFloat;

  if DataSet.FieldByName('AmountOper2').AsFloat <> 0 then
    DataSet.FieldByName('AvgInv_Prj').AsFloat := DataSet.FieldByName('Prj_Inv').AsFloat/
                                            DataSet.FieldByName('AmountOper2').AsFloat;
end;

procedure TInv_Prft.miSettClick(Sender: TObject);
begin
  if (Sender as TMenuItem).RadioItem then
    (Sender as TMenuItem).Checked := true
  else
    (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;

  SetCapt;
end;

procedure TInv_Prft.SetCapt;
begin
  dxDBTreeList1AvgInv.Visible := miInv.Checked;
  dxDBTreeList1AvgInv_Prj.Visible := miInv.Checked;

  dxDBTreeList1InvSumm.Visible := miSI.Checked;
  dxDBTreeList1CurProff.Visible := miSI.Checked;
  
  dxDBTreeList1RealWareProff.Visible := miProff.Checked;
  dxDBTreeList1CurLoss.Visible := miProff.Checked;
  
  dxDBTreeList1Rent.Visible := miRent.Checked;
  dxDBTreeList1Column12.Visible := miRent.Checked;
end;

procedure TInv_Prft.fBsnSelector1Button1Click(Sender: TObject);
var OldID : Variant;
begin
  OldID := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if OldID <> fBsnSelector1.ID then
  begin
  //  RefresheLists;
  //  Initialize;
  end;
end;

procedure TInv_Prft.RefresheLists;
begin
  fObjListWare.Initialize([eotGoods, eotGoodsGroup], fBsnSelector1.ID, 40, true);

end;

end.
