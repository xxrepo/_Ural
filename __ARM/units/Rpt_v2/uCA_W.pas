unit uCA_W;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Menus, ActnList, ImgList, dxPrnDlg,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, frObjList, dxTL, dxGrClms,
  dxDBCtrl, dxCntner, dxDBTL, ComCtrls, frBsnSelector, RXCtrls, Buttons, Grids, DBGrids, RXDBCtrl;

type
  TCA_W = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    dsCAPrfLoss: TDataSource;
    cdsCA_w: TClientDataSet;
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
    dxDBTreeList1id_ContrAgent: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_CAGroup: TdxDBTreeListMaskColumn;
    dxDBTreeList1Name: TdxDBTreeListMaskColumn;
    dxDBTreeList1ID: TdxDBTreeListColumn;
    dtTo: TDateTimePicker;
    Label1: TLabel;
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
    Label3: TLabel;
    dxDBTreeList1S_ByPeriod: TdxDBTreeListMaskColumn;
    dxDBTreeList1AvgTotal: TdxDBTreeListMaskColumn;
    cbOnlyNotZerro: TCheckBox;
    ceOper: TEdit;
    aDetail: TAction;
    N1: TMenuItem;
    Excel1: TMenuItem;
    dxDBTreeList1Rent: TdxDBTreeListMaskColumn;
    BitBtn5: TBitBtn;
    cdsCA_wID: TAutoIncField;
    cdsCA_wName: TStringField;
    cdsCA_wid_ContrAgent: TIntegerField;
    cdsCA_wid_CAGroup2: TIntegerField;
    cdsCA_wid_CAGroup: TIntegerField;
    cdsCA_wDateFirstOper: TDateTimeField;
    cdsCA_wAvgYear: TFloatField;
    cdsCA_wAvgTotal: TFloatField;
    cdsCA_wS_Total: TFloatField;
    cdsCA_wM1_CRN_OperSum: TFloatField;
    cdsCA_wM1_InvSumm: TFloatField;
    cdsCA_wM1_WareProff: TFloatField;
    cdsCA_wM1_Amount: TFloatField;
    cdsCA_wM1_Rent: TFloatField;
    cdsCA_wM1_MSName: TStringField;
    cdsCA_wM1_MSCNT: TIntegerField;
    cdsCA_wM1_id_Measure: TIntegerField;
    cdsCA_wM2_CRN_OperSum: TFloatField;
    cdsCA_wM2_InvSumm: TFloatField;
    cdsCA_wM2_WareProff: TFloatField;
    cdsCA_wM2_Amount: TFloatField;
    cdsCA_wM2_Rent: TFloatField;
    cdsCA_wM2_MSName: TStringField;
    cdsCA_wM2_MSCNT: TIntegerField;
    cdsCA_wM2_id_Measure: TIntegerField;
    cdsCA_wM3_CRN_OperSum: TFloatField;
    cdsCA_wM3_InvSumm: TFloatField;
    cdsCA_wM3_WareProff: TFloatField;
    cdsCA_wM3_Amount: TFloatField;
    cdsCA_wM3_Rent: TFloatField;
    cdsCA_wM3_MSName: TStringField;
    cdsCA_wM3_MSCNT: TIntegerField;
    cdsCA_wM3_id_Measure: TIntegerField;
    cdsCA_wM4_CRN_OperSum: TFloatField;
    cdsCA_wM4_InvSumm: TFloatField;
    cdsCA_wM4_WareProff: TFloatField;
    cdsCA_wM4_Amount: TFloatField;
    cdsCA_wM4_Rent: TFloatField;
    cdsCA_wM4_MSName: TStringField;
    cdsCA_wM4_MSCNT: TIntegerField;
    cdsCA_wM4_id_Measure: TIntegerField;
    cdsCA_wM5_CRN_OperSum: TFloatField;
    cdsCA_wM5_InvSumm: TFloatField;
    cdsCA_wM5_WareProff: TFloatField;
    cdsCA_wM5_Amount: TFloatField;
    cdsCA_wM5_Rent: TFloatField;
    cdsCA_wM5_MSName: TStringField;
    cdsCA_wM5_MSCNT: TIntegerField;
    cdsCA_wM5_id_Measure: TIntegerField;
    cdsCA_wM6_CRN_OperSum: TFloatField;
    cdsCA_wM6_InvSumm: TFloatField;
    cdsCA_wM6_WareProff: TFloatField;
    cdsCA_wM6_Amount: TFloatField;
    cdsCA_wM6_Rent: TFloatField;
    cdsCA_wM6_MSName: TStringField;
    cdsCA_wM6_MSCNT: TIntegerField;
    cdsCA_wM6_id_Measure: TIntegerField;
    cdsCA_wM7_CRN_OperSum: TFloatField;
    cdsCA_wM7_InvSumm: TFloatField;
    cdsCA_wM7_WareProff: TFloatField;
    cdsCA_wM7_Amount: TFloatField;
    cdsCA_wM7_Rent: TFloatField;
    cdsCA_wM7_MSName: TStringField;
    cdsCA_wM7_MSCNT: TIntegerField;
    cdsCA_wM7_id_Measure: TIntegerField;
    cdsCA_wM8_CRN_OperSum: TFloatField;
    cdsCA_wM8_InvSumm: TFloatField;
    cdsCA_wM8_WareProff: TFloatField;
    cdsCA_wM8_Amount: TFloatField;
    cdsCA_wM8_Rent: TFloatField;
    cdsCA_wM8_MSName: TStringField;
    cdsCA_wM8_MSCNT: TIntegerField;
    cdsCA_wM8_id_Measure: TIntegerField;
    cdsCA_wM9_CRN_OperSum: TFloatField;
    cdsCA_wM9_InvSumm: TFloatField;
    cdsCA_wM9_WareProff: TFloatField;
    cdsCA_wM9_Amount: TFloatField;
    cdsCA_wM9_Rent: TFloatField;
    cdsCA_wM9_MSName: TStringField;
    cdsCA_wM9_MSCNT: TIntegerField;
    cdsCA_wM9_id_Measure: TIntegerField;
    cdsCA_wM10_CRN_OperSum: TFloatField;
    cdsCA_wM10_InvSumm: TFloatField;
    cdsCA_wM10_WareProff: TFloatField;
    cdsCA_wM10_Amount: TFloatField;
    cdsCA_wM10_Rent: TFloatField;
    cdsCA_wM10_MSName: TStringField;
    cdsCA_wM10_MSCNT: TIntegerField;
    cdsCA_wM10_id_Measure: TIntegerField;
    cdsCA_wM11_CRN_OperSum: TFloatField;
    cdsCA_wM11_InvSumm: TFloatField;
    cdsCA_wM11_WareProff: TFloatField;
    cdsCA_wM11_Amount: TFloatField;
    cdsCA_wM11_Rent: TFloatField;
    cdsCA_wM11_MSName: TStringField;
    cdsCA_wM11_MSCNT: TIntegerField;
    cdsCA_wM11_id_Measure: TIntegerField;
    cdsCA_wM12_CRN_OperSum: TFloatField;
    cdsCA_wM12_InvSumm: TFloatField;
    cdsCA_wM12_WareProff: TFloatField;
    cdsCA_wM12_Amount: TFloatField;
    cdsCA_wM12_Rent: TFloatField;
    cdsCA_wM12_MSName: TStringField;
    cdsCA_wM12_MSCNT: TIntegerField;
    cdsCA_wM12_id_Measure: TIntegerField;
    cdsCA_wM13_CRN_OperSum: TFloatField;
    cdsCA_wM13_InvSumm: TFloatField;
    cdsCA_wM13_WareProff: TFloatField;
    cdsCA_wM13_Amount: TFloatField;
    cdsCA_wM13_Rent: TFloatField;
    cdsCA_wM13_MSName: TStringField;
    cdsCA_wM13_MSCNT: TIntegerField;
    cdsCA_wM13_id_Measure: TIntegerField;
    cdsCA_wM14_CRN_OperSum: TFloatField;
    cdsCA_wM14_InvSumm: TFloatField;
    cdsCA_wM14_WareProff: TFloatField;
    cdsCA_wM14_Amount: TFloatField;
    cdsCA_wM14_Rent: TFloatField;
    cdsCA_wM14_MSName: TStringField;
    cdsCA_wM14_MSCNT: TIntegerField;
    cdsCA_wM14_id_Measure: TIntegerField;
    cdsCA_wM15_CRN_OperSum: TFloatField;
    cdsCA_wM15_InvSumm: TFloatField;
    cdsCA_wM15_WareProff: TFloatField;
    cdsCA_wM15_Amount: TFloatField;
    cdsCA_wM15_Rent: TFloatField;
    cdsCA_wM15_MSName: TStringField;
    cdsCA_wM15_MSCNT: TIntegerField;
    cdsCA_wM15_id_Measure: TIntegerField;
    cdsCA_wM16_CRN_OperSum: TFloatField;
    cdsCA_wM16_InvSumm: TFloatField;
    cdsCA_wM16_WareProff: TFloatField;
    cdsCA_wM16_Amount: TFloatField;
    cdsCA_wM16_Rent: TFloatField;
    cdsCA_wM16_MSName: TStringField;
    cdsCA_wM16_MSCNT: TIntegerField;
    cdsCA_wM16_id_Measure: TIntegerField;
    cdsCA_wM17_CRN_OperSum: TFloatField;
    cdsCA_wM17_InvSumm: TFloatField;
    cdsCA_wM17_WareProff: TFloatField;
    cdsCA_wM17_Amount: TFloatField;
    cdsCA_wM17_Rent: TFloatField;
    cdsCA_wM17_MSName: TStringField;
    cdsCA_wM17_MSCNT: TIntegerField;
    cdsCA_wM17_id_Measure: TIntegerField;
    cdsCA_wM18_CRN_OperSum: TFloatField;
    cdsCA_wM18_InvSumm: TFloatField;
    cdsCA_wM18_WareProff: TFloatField;
    cdsCA_wM18_Amount: TFloatField;
    cdsCA_wM18_Rent: TFloatField;
    cdsCA_wM18_MSName: TStringField;
    cdsCA_wM18_MSCNT: TIntegerField;
    cdsCA_wM18_id_Measure: TIntegerField;
    cbGrp: TCheckBox;
    dxDBTreeList1AvgYear: TdxDBTreeListColumn;
    cdsCA_wS_ByPeriod: TFloatField;
    cdsCA_wS_Year: TFloatField;
    pmSett: TPopupMenu;
    miAmount: TMenuItem;
    miMS: TMenuItem;
    miSumm: TMenuItem;
    miInv: TMenuItem;
    miProff: TMenuItem;
    miRent: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    Panel3: TPanel;
    Splitter1: TSplitter;
    p1: TGroupBox;
    fObjListCA: TfObjList;
    p2: TGroupBox;
    fObjListWare: TfObjList;
    dxDBTreeList1S_Total: TdxDBTreeListMaskColumn;
    cdsCA_wSSS: TFloatField;
    dxDBTreeList1SSS: TdxDBTreeListColumn;
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
    procedure cbGrpClick(Sender: TObject);
    procedure miSettClick(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure cdsCA_wCalcFields(DataSet: TDataSet);
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

procedure ShowCA_W(id_business : Variant);

var
  CA_W: TCA_W;

implementation

uses uDM, foMyFunc, foMyFuncDXTreeExcel, uBalance, uCAPrfLoss_Det;

{$R *.DFM}

procedure ShowCA_W(id_business : Variant);
var F : TCA_W;
begin
  F := TCA_W.Create(nil);
  try
    F.SetChecked;
    F.SetCapt;

    F.Initialize(id_business);
    F.Show;
  except
    F.Free;
  end;
end;

{ TBalanceBsn }


function TCA_W.GetBlnDateTime_int(ATo : boolean): Variant;
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

procedure TCA_W.SetChecked;
begin
  dtFrom.Checked := true;
  dtFrom.Checked := true;

end;

procedure TCA_W.SetCapt;
var i : integer;
    ACol : TdxDBTreeListColumn;
    AColumnClass: TdxDBTreeListColumnClass;
    ABand : TdxTreeListBand;
    AField : TField;
    D, D2 : TDate;
    Year, Month, Day : Word;
begin
  dtFrom.Checked := true;
  dtFrom.Checked := true;
  BeginUpdateControl(dxDBTreeList1);
  Screen.Cursor := crSQLWait;

  for i := 0 to cdsCA_w.fields.Count - 1 do
  begin
    if cdsCA_w.fields[i] is TNumericField then
      TNumericField(cdsCA_w.fields[i]).DisplayFormat := '0.00';
  end;

  for i := dxDBTreeList1.ColumnCount - 1 downto 0 do
  begin
    if dxDBTreeList1.Columns[i].Tag <> 13 then
      dxDBTreeList1.Columns[i].Free;
  end;

  for i := dxDBTreeList1.Bands.Count - 1 downto 1 do
  begin
    dxDBTreeList1.Bands[i].Free; 
  end;

  DecodeDate(dtFrom.DateTime, Year, Month, Day);
  D := EncodeDate(Year, Month, 1);

  DecodeDate(dtTo.DateTime, Year, Month, Day);
  D2 := EncodeDate(Year, Month, 1);
  D2 := IncMonth(D2, 1) - 1;

  for i := 1 to 18 do
  begin
    ABand := dxDBTreeList1.Bands.Add;
    ABand.Caption := FormatDateTime('mm.yyyy', D);
    ABand.Visible := (D <= D2);// and (ABS(D - dtTo.DateTime) < 30);

    D := IncMonth(D, 1);

    AField := cdsCA_w.FindField('M' + Inttostr(i) + '_Amount');
    if (AField <> nil) and (miAmount.Checked) then
    begin
      ACol := dxDBTreeList1.CreateColumn(TdxDBGridCalcColumn);
      ACol.FieldName := AField.FieldName;
      ACol.BandIndex := ABand.Index;
      ACol.Caption := 'Кол-во';
    end;

    AField := cdsCA_w.FindField('M' + Inttostr(i) + '_MSName');
    if (AField <> nil) and (miMS.Checked) then
    begin
      ACol := dxDBTreeList1.CreateColumn(TdxDBTreeListColumn);
      ACol.FieldName := AField.FieldName;
      ACol.BandIndex := ABand.Index;
      ACol.Caption := 'Ед. изм';
      ACol.Width := 55;
    end;

    AField := cdsCA_w.FindField('M' + Inttostr(i) + '_CRN_OperSum');
    if (AField <> nil) and (miSumm.Checked) then
    begin
      ACol := dxDBTreeList1.CreateColumn(TdxDBGridCalcColumn);
      ACol.FieldName := AField.FieldName;
      ACol.BandIndex := ABand.Index;
      ACol.Caption := 'Сумма';
    end;

    AField := cdsCA_w.FindField('M' + Inttostr(i) + '_InvSumm');
    if (AField <> nil) and (miInv.Checked) then
    begin
      ACol := dxDBTreeList1.CreateColumn(TdxDBGridCalcColumn);
      ACol.FieldName := AField.FieldName;
      ACol.BandIndex := ABand.Index;
      ACol.Caption := 'Себестоимость';
    end;

    AField := cdsCA_w.FindField('M' + Inttostr(i) + '_WareProff');
    if (AField <> nil) and (miProff.Checked) then
    begin
      ACol := dxDBTreeList1.CreateColumn(TdxDBGridCalcColumn);
      ACol.FieldName := AField.FieldName;
      ACol.BandIndex := ABand.Index;
      ACol.Caption := 'Прибыль';
    end;

    AField := cdsCA_w.FindField('M' + Inttostr(i) + '_Rent');
    if (AField <> nil) and (miRent.Checked) then
    begin
      ACol := dxDBTreeList1.CreateColumn(TdxDBGridCalcColumn);
      ACol.FieldName := AField.FieldName;
      ACol.BandIndex := ABand.Index;
      ACol.Caption := 'Рентабельность';
    end;
  end;

  EndUpdateControl(dxDBTreeList1);
  Screen.Cursor := crDefault;
end;


procedure TCA_W.GetIDS(var ID, ID_Ctg : Variant);
begin
  if (FFFNode <> nil) and (dxDBTreeList1.SelectedCount > 0)  then
  begin
    ID := FFFNode.Values[dxDBTreeList1id_ContrAgent.Index];
    ID_Ctg := FFFNode.Values[dxDBTreeList1id_CAGroup.Index];
    if ID_Ctg = -1 then ID_Ctg := -13;
    if ID = Null then ID := -13;
  end
  else
  begin
    ID := -13;
    ID_Ctg := -13;
  end;
end;

procedure TCA_W.SelectEvent(ID, ID_Ctg : integer);
var i : integer;
    Node : TdxTreeListNode;
begin
  FFFNode := nil;
  for i := dxDBTreeList1.SelectedCount - 1 downto 0 do
    dxDBTreeList1.SelectedNodes[i].Selected := false;
  Node := dxDBTreeList1.TopNode;
  while Node <> nil do
  begin
    if (Node.Values[dxDBTreeList1id_ContrAgent.Index] = ID) or
       (Node.Values[dxDBTreeList1id_CAGroup.Index] = ID_Ctg) then
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

procedure TCA_W.Initialize(id_business: Variant);
begin
  fBsnSelector1.ID := id_business;
  Screen.Cursor := crSQLWait;
  try
    with cdsCA_w do
    begin
      Close;
      Params.ParamByName('@ID_user').Value := DM.IDUser;
      Params.ParamByName('@IDGoodsList').Value := fObjListWare.GetIDList(eotGoods);
      Params.ParamByName('@IDGoodsGroupList').Value := fObjListWare.GetIDList(eotGoodsGroup);

      Params.ParamByName('@IDCAList').Value := fObjListCA.GetIDList(eotCA);
      Params.ParamByName('@IDCAGroupList').Value := fObjListCA.GetIDList(eotCAGroup);

      Params.ParamByName('@id_business').Value := id_business;
     // if dtFrom.Checked then
        Params.ParamByName('@DateFrom').Value := GetBlnDateTime_int(false);
     // else
       // Params.ParamByName('@DateFrom').Value := Null;

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

procedure TCA_W.Button1Click(Sender: TObject);
var id_business : Variant;
    ID, ID_Ctg : Variant;
begin
  dxDBTreeList1.OnChangeNode := nil;
  try
    GetIDS(ID, ID_Ctg);
    SetCapt;
    Initialize(fBsnSelector1.ID);
  finally
    dxDBTreeList1.OnChangeNode := dxDBTreeList1ChangeNode;
    SelectEvent(ID, ID_Ctg);
  end;
end;

constructor TCA_W.Create(AOwner: TCOmponent);
var V : Variant;
begin
  inherited;
  LoadPopupMenuFromRegistry(pmSett, SRegPath + '\' + ClassName + 'pmSett');

  LoadValFromRegistry(V, SRegPath + '\' + Name,  'OnlyNotZerro');
  if V <> Null then
    cbOnlyNotZerro.Checked := V;

  LoadValFromRegistry(V, SRegPath + '\' + Name,  'cbGrp');
  if V <> Null then
    cbGrp.Checked := V;

  cbGrpClick(nil);

  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  dtFrom.Date := Now - 30;
  dtTo.Date := Now;
  dtFrom.Checked := true;
  dtFrom.Checked := false;
  dxDBTreeList1.RegistryPath := SRegPath + '\' + ClassName;
  dxDBTreeList1.OptionsBehavior := dxDBTreeList1.OptionsBehavior + [etoStoreToRegistry];
end;

procedure TCA_W.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TCA_W.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TCA_W.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TCA_W.dxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  ColInd: Integer;
begin
  if cbGrp.Checked then
  begin
  ColInd := dxDBTreeList1id_ContrAgent.Index;
    if (ANode.Parent = nil) then   // Верхний уровень
    begin
      if not ASelected then
        AColor := $00D7D700;
    end
    else
    begin
      if not ASelected then
      begin
        if (ANode.Values[ColInd] = Null) then
          AColor := $00E0E2E4;
      end;
    end;
  end;
end;

procedure TCA_W.aPrintExecute(Sender: TObject);
begin
  dxComponentPrinter2.Print(True,nil,nil);
end;

procedure TCA_W.dxDBTreeList1GetImageIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
var
  ColInd: Integer;
begin
  ColInd := dxDBTreeList1id_ContrAgent.Index;
    if (Node.Parent = nil) then   // Верхний уровень
    begin
      Index := -1;
    end
    else
    begin
      if (Node.Values[ColInd] = Null) then
        Index := 1
      else
        Index := 0;
    end;

{  if (Node <> nil) then
  begin
    if Node.Parent = nil then
      Index := 1
    else
      Index := 0;
  end;    }
end;

procedure TCA_W.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  index := Node.ImageIndex;
end;

procedure TCA_W.dxDBTreeList1ChangeNode(Sender: TObject;
  OldNode, Node: TdxTreeListNode);
begin
  FFFNode := Node;
end;

procedure TCA_W.PopupMenu1Popup(Sender: TObject);
begin
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);
end;

procedure TCA_W.aShowBalanceExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_ContrAgent := cdsCA_wid_ContrAgent.AsInteger;
  AParamBlnc.DateFrom := (dtFrom.Date);
  AParamBlnc.DateTo := GetBlnDateTime_int(true);
  ShowBalance(AParamBlnc);
end;

procedure TCA_W.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TCA_W.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TCA_W.aCollapseNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TCA_W.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TCA_W.aExportExecute(Sender: TObject);
var S : String;
begin
  S := fBsnSelector1.BsnName; //'Баланс';
//  S := S + #13 + #10 + lbInfo.Caption;
  DBTreeListToExcel(dxDBTreeList1, S);
end;

procedure TCA_W.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  S := fBsnSelector1.BsnName; //'Баланс';
  DBTreeListToExcel(dxDBTreeList1, S, FFFNode);
end;

procedure TCA_W.dsCAPrfLossDataChange(Sender: TObject;
  Field: TField);
begin
  aCollapseAll.Enabled := not cdsCA_w.IsEmpty;
  aExpandAll.Enabled := not cdsCA_w.IsEmpty;

  aShowBalance.Enabled := not cdsCA_w.FieldByName('id_ContrAgent').IsNull;
  aDetail.Enabled := not cdsCA_w.FieldByName('id_ContrAgent').IsNull;
end;

destructor TCA_W.Destroy;
begin
  SavePopupMenuToRegistry(pmSett, SRegPath + '\' + ClassName + 'pmSett');

  SaveValToRegistry(cbOnlyNotZerro.checked, SRegPath + '\' + Name,  'OnlyNotZerro');
  SaveValToRegistry(cbGrp.checked, SRegPath + '\' + Name,  'cbGrp');
  inherited;

end;

procedure TCA_W.aDetailExecute(Sender: TObject);
var ABlnDetail : TPL_DetailData;
begin
  ABlnDetail := GetEmptyPL_DetailData;
  ABlnDetail.id_business := fBsnSelector1.ID;
  ABlnDetail.id_Oper := cdsCA_w.Params.ParamByName('@id_Oper').Value;
  ABlnDetail.id_ContrAgent := cdsCA_w.FieldByName('id_ContrAgent').AsInteger;

  if dtFrom.Checked then
    ABlnDetail.DateFrom := GetBlnDateTime_int(false)
  else
    ABlnDetail.DateFrom := Null;

  ABlnDetail.Date := GetBlnDateTime_int(true);


  ShowCAPrfLoss_Det(Caption + ' - ' + cdsCA_w.FieldByName('Name').AsString, ABlnDetail)
end;

procedure TCA_W.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TCA_W.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TCA_W.BitBtn1Click(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Preview(True, nil);
end;

procedure TCA_W.GetAGPrinterInfo;
begin
  dxComponentPrinter1Link2.ReportTitleText := Caption + ' ' + fBsnSelector1.BsnName + '(' + FormatDateTime('dd-mm-yyyy hh:nn', dtTo.DateTime) + ')'; //'Баланс';
  dxComponentPrinter1Link2.ReportTitleMode := tmOnEveryTopPage;
end;


procedure TCA_W.cbGrpClick(Sender: TObject);
begin
//*
  with cdsCA_w do
  begin
    Filter := 'id_ContrAgent>0';
    Filtered := not cbGrp.Checked;
  end;
//  dxDBTreeList1Name.Sorted := csNone;
//  dxDBTreeList1Name.Sorted := csUp;
end;

procedure TCA_W.miSettClick(Sender: TObject);
begin
  if (Sender as TMenuItem).RadioItem then
    (Sender as TMenuItem).Checked := true
  else
    (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;

  SetCapt;
end;

procedure TCA_W.fBsnSelector1Button1Click(Sender: TObject);
var OldID : Variant;
begin
  OldID := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if OldID <> fBsnSelector1.ID then
  begin
    RefresheLists;
  //  Initialize;
  end;
end;

procedure TCA_W.RefresheLists;
begin
  fObjListCA.Initialize([eotCA, eotCAGroup], fBsnSelector1.ID, 40, true);
  fObjListWare.Initialize([eotGoods, eotGoodsGroup], fBsnSelector1.ID, 40, true);

end;


procedure TCA_W.cdsCA_wCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('SSS').AsFloat :=
    DataSet.FieldByName('M1_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M2_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M3_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M4_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M5_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M6_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M7_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M8_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M9_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M10_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M11_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M12_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M13_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M14_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M15_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M16_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M17_CRN_OperSum').AsFloat +
    DataSet.FieldByName('M18_CRN_OperSum').AsFloat;
end;

end.
