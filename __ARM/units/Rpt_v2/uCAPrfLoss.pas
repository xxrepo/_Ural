unit uCAPrfLoss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons, Menus, Mask, ToolEdit, CurrEdit;

type
  TCAPrfLoss = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    dsCAPrfLoss: TDataSource;
    cdsCAPrfLoss: TClientDataSet;
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
    cdsCAPrfLossID: TAutoIncField;
    cdsCAPrfLossName: TStringField;
    cdsCAPrfLossid_ContrAgent: TIntegerField;
    cdsCAPrfLossid_CAGroup: TIntegerField;
    cdsCAPrfLossWareProff: TFloatField;
    cdsCAPrfLossWareLoss: TFloatField;
    cdsCAPrfLossFinProff: TFloatField;
    cdsCAPrfLossFinLoss: TFloatField;
    cdsCAPrfLossOffProff: TFloatField;
    cdsCAPrfLossOffLoss: TFloatField;
    cdsCAPrfLossCurProff: TFloatField;
    cdsCAPrfLossCurLoss: TFloatField;
    cdsCAPrfLossInvSumm: TFloatField;
    cdsCAPrfLossRealWareProff: TFloatField;
    dxDBTreeList1WareProff: TdxDBTreeListMaskColumn;
    dxDBTreeList1WareLoss: TdxDBTreeListMaskColumn;
    dxDBTreeList1FinProff: TdxDBTreeListMaskColumn;
    dxDBTreeList1FinLoss: TdxDBTreeListMaskColumn;
    dxDBTreeList1OffProff: TdxDBTreeListMaskColumn;
    dxDBTreeList1OffLoss: TdxDBTreeListMaskColumn;
    dxDBTreeList1CurProff: TdxDBTreeListMaskColumn;
    dxDBTreeList1CurLoss: TdxDBTreeListMaskColumn;
    dxDBTreeList1InvSumm: TdxDBTreeListMaskColumn;
    dxDBTreeList1RealWareProff: TdxDBTreeListMaskColumn;
    cbOnlyNotZerro: TCheckBox;
    ceOper: TEdit;
    aDetail: TAction;
    N1: TMenuItem;
    Excel1: TMenuItem;
    cdsCAPrfLossid_CAGroup2: TIntegerField;
    cdsCAPrfLossRent: TFloatField;
    dxDBTreeList1Rent: TdxDBTreeListMaskColumn;
    BitBtn5: TBitBtn;
    cdsCAPrfLossTotalS: TFloatField;
    dxDBTreeList1Column16: TdxDBTreeListColumn;
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
    procedure cdsCAPrfLossCalcFields(DataSet: TDataSet);
  private
    FFFNode : TdxTreeListNode;
    function GetBlnDateTime_int(ATo: boolean): Variant;
    procedure GetAGPrinterInfo;
    procedure GetIDS(var ID, ID_Ctg: Variant);
    procedure SelectEvent(ID, ID_Ctg: integer);
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(id_business : Variant);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure SetChecked;
  end;

procedure ShowCAPrfLoss(id_business : Variant);

var
  CAPrfLoss: TCAPrfLoss;

implementation

uses uDM, foMyFunc, foMyFuncDXTreeExcel, uBalance, uCAPrfLoss_Det;

{$R *.DFM}

procedure ShowCAPrfLoss(id_business : Variant);
var F : TCAPrfLoss;
begin
  F := TCAPrfLoss.Create(nil);
  try
    F.SetChecked;
    F.Initialize(id_business);
    F.Show;
  except
    F.Free;
  end;
end;

{ TBalanceBsn }


function TCAPrfLoss.GetBlnDateTime_int(ATo : boolean): Variant;
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

procedure TCAPrfLoss.SetChecked;
begin
  dtFrom.Checked := true;
  dtFrom.Checked := false;
end;

procedure TCAPrfLoss.GetIDS(var ID, ID_Ctg : Variant);
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

procedure TCAPrfLoss.SelectEvent(ID, ID_Ctg : integer);
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

procedure TCAPrfLoss.Initialize(id_business: Variant);
begin
  fBsnSelector1.ID := id_business;
  Screen.Cursor := crSQLWait;
  try
    with cdsCAPrfLoss do
    begin
      Close;
      Params.ParamByName('@ID_user').Value := DM.IDUser;
      Params.ParamByName('@id_business').Value := id_business;
      if dtFrom.Checked then
        Params.ParamByName('@DateFrom').Value := GetBlnDateTime_int(false)
      else
        Params.ParamByName('@DateFrom').Value := Null;

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

procedure TCAPrfLoss.Button1Click(Sender: TObject);
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

constructor TCAPrfLoss.Create(AOwner: TCOmponent);
var V : Variant;
begin
  inherited;
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

procedure TCAPrfLoss.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TCAPrfLoss.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TCAPrfLoss.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TCAPrfLoss.dxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  ColInd: Integer;
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

procedure TCAPrfLoss.aPrintExecute(Sender: TObject);
begin
  dxComponentPrinter2.Print(True,nil,nil);
end;

procedure TCAPrfLoss.dxDBTreeList1GetImageIndex(Sender: TObject;
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

procedure TCAPrfLoss.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  index := Node.ImageIndex;
end;

procedure TCAPrfLoss.dxDBTreeList1ChangeNode(Sender: TObject;
  OldNode, Node: TdxTreeListNode);
begin
  FFFNode := Node;
end;

procedure TCAPrfLoss.PopupMenu1Popup(Sender: TObject);
begin
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);
end;

procedure TCAPrfLoss.aShowBalanceExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_ContrAgent := cdsCAPrfLossid_ContrAgent.AsInteger;
  AParamBlnc.DateFrom := (dtFrom.Date);
  AParamBlnc.DateTo := (AParamBlnc.DateFrom) + 1;
  ShowBalance(AParamBlnc);
end;

procedure TCAPrfLoss.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TCAPrfLoss.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TCAPrfLoss.aCollapseNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TCAPrfLoss.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TCAPrfLoss.aExportExecute(Sender: TObject);
var S : String;
begin
  S := fBsnSelector1.BsnName; //'Баланс';
//  S := S + #13 + #10 + lbInfo.Caption;
  DBTreeListToExcel(dxDBTreeList1, S);
end;

procedure TCAPrfLoss.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  S := fBsnSelector1.BsnName; //'Баланс';
  DBTreeListToExcel(dxDBTreeList1, S, FFFNode);
end;

procedure TCAPrfLoss.dsCAPrfLossDataChange(Sender: TObject;
  Field: TField);
begin
  aCollapseAll.Enabled := not cdsCAPrfLoss.IsEmpty;
  aExpandAll.Enabled := not cdsCAPrfLoss.IsEmpty;

  aShowBalance.Enabled := not cdsCAPrfLoss.FieldByName('id_ContrAgent').IsNull;
  aDetail.Enabled := not cdsCAPrfLoss.FieldByName('id_ContrAgent').IsNull;
end;

destructor TCAPrfLoss.Destroy;
begin
  SaveValToRegistry(cbOnlyNotZerro.checked, SRegPath + '\' + Name,  'OnlyNotZerro');
  inherited;

end;

procedure TCAPrfLoss.aDetailExecute(Sender: TObject);
var ABlnDetail : TPL_DetailData;
begin
  ABlnDetail := GetEmptyPL_DetailData;
  ABlnDetail.id_business := fBsnSelector1.ID;
  ABlnDetail.id_Oper := cdsCAPrfLoss.Params.ParamByName('@id_Oper').Value;
  ABlnDetail.id_ContrAgent := cdsCAPrfLoss.FieldByName('id_ContrAgent').AsInteger;

  if dtFrom.Checked then
    ABlnDetail.DateFrom := GetBlnDateTime_int(false)
  else
    ABlnDetail.DateFrom := Null;

  ABlnDetail.Date := GetBlnDateTime_int(true);


  ShowCAPrfLoss_Det(Caption + ' - ' + cdsCAPrfLoss.FieldByName('Name').AsString, ABlnDetail)
end;

procedure TCAPrfLoss.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TCAPrfLoss.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TCAPrfLoss.BitBtn1Click(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Preview(True, nil);
end;

procedure TCAPrfLoss.GetAGPrinterInfo;
begin
  dxComponentPrinter1Link2.ReportTitleText := Caption + ' ' + fBsnSelector1.BsnName + '(' + FormatDateTime('dd-mm-yyyy hh:nn', dtTo.DateTime) + ')'; //'Баланс';
  dxComponentPrinter1Link2.ReportTitleMode := tmOnEveryTopPage;
end;


procedure TCAPrfLoss.cdsCAPrfLossCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('TotalS').AsFloat := DataSet.FieldByName('InvSumm').AsFloat +
                                           DataSet.FieldByName('RealWareProff').AsFloat; 
end;

end.
