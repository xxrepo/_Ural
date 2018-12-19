unit frMov_WareUn;

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
  TGetListEvent = procedure (var V : Variant) of object;
  TfMov_WareUn = class(TFrame)
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
    cdsMov: TClientDataSet;
    Panel3: TPanel;
    lbInfo: TLabel;
    aShowAccCard: TAction;
    aShowBalance: TAction;
    aCollapseAll: TAction;
    dxDBTreeList1id_Ctg: TdxDBTreeListMaskColumn;
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
    cdsMovGoods2Name: TStringField;
    cdsMovGoods2TotalSumOld: TFloatField;
    cdsMovGoods2TotalSumIn: TFloatField;
    cdsMovGoods2TotalSumOut: TFloatField;
    cdsMovGoods2TotalSum: TFloatField;
    cdsMovGoods2Id_Currency: TIntegerField;
    cdsMovGoods2TotalAmountOld: TFloatField;
    cdsMovGoods2TotalAmountIn: TFloatField;
    cdsMovGoods2TotalAmountOut: TFloatField;
    cdsMovGoods2TotalAmount: TFloatField;
    cdsMovGoods2id_Measure: TIntegerField;
    cdsMovGoods2MeasureName: TStringField;
    cdsMovGoods2CurrencyName: TStringField;
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
    dxDBTreeList1id_BaseCtg: TdxDBTreeListColumn;
    cdsUnArcWare: TClientDataSet;
    fArc1: TfArc;
    dxDBTreeList1id_Ware: TdxDBTreeListColumn;
    ilImage: TImageList;
    PopupMenu1: TPopupMenu;
    cdsMovGoods2AvgPrice: TFloatField;
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
    cdsMovid_Ctg: TIntegerField;
    cdsMovid_BaseCtg: TIntegerField;
    cdsMovid_Ware: TIntegerField;
    aReVal: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    cdsCAWare_Mov: TClientDataSet;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    IntegerField1: TIntegerField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField9: TFloatField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    cdsUnArcWare_CA: TClientDataSet;
    cdsWareCASmp: TClientDataSet;
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
    procedure aExpOperExecute(Sender: TObject);
    procedure fArc1dsArcDataChange(Sender: TObject; Field: TField);
    procedure cdsMovFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    FFFNode : TdxTreeListNode;

    FID_Bsn : Variant;

    FID_WareType : integer;
    FGetWHList : TGetListEvent;
    FGetWHGroupList : TGetListEvent;
    FGetWareList : TGetListEvent;
    FGetWareGroupList : TGetListEvent;

    FGetCAList : TGetListEvent;
    FGetCAGroupList : TGetListEvent;

    procedure GetAGPrinterInfo;
    procedure SelectEvent(ID, ID_Ctg : integer);
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure InternalInitialize;
    procedure Initialize(AID_WareType : integer;
                         AGetWHList : TGetListEvent;
                         AGetWHGroupList : TGetListEvent;
                         AGetWareList : TGetListEvent;
                         AGetWareGroupList : TGetListEvent;
                         AGetCAList : TGetListEvent;
                         AGetCAGroupList : TGetListEvent;
                         AID_Bsn : Variant);
  end;

implementation

uses uDM, foMyFuncDXTreeExcel, uWareFinder, foMyFuncEh, uWizReVal;

{$R *.DFM}


procedure TfMov_WareUn.Initialize(AID_WareType : integer;
                                  AGetWHList : TGetListEvent;
                                  AGetWHGroupList : TGetListEvent;
                                  AGetWareList : TGetListEvent;
                                  AGetWareGroupList : TGetListEvent;
                                  AGetCAList : TGetListEvent;
                                  AGetCAGroupList : TGetListEvent;
                                  AID_Bsn : Variant);
begin
  FID_WareType := AID_WareType;
  
  cdsCAWare_Mov.Close;
  cdsWareCASmp.Close;
  cdsUnArcWare_CA.Close;
  cdsUnArcWare.Close;
  cdsMov.Close;

//  BitBtn2.Enabled := FID_WareType > 0;

  FGetWHList := AGetWHList;
  FGetWHGroupList := AGetWHGroupList;
  FGetWareList := AGetWareList;
  FGetWareGroupList := AGetWareGroupList;

  FGetCAList := AGetCAList;
  FGetCAGroupList := AGetCAGroupList;

  FID_Bsn := AID_Bsn;
  if AID_WareType > 200 then
  begin
    fArc1.dsArc.DataSet := cdsWareCASmp;
    DataSource1.DataSet := cdsCAWare_Mov;
  end
  else
  if AID_WareType > 100 then
  begin
    fArc1.dsArc.DataSet := cdsUnArcWare_CA;
    DataSource1.DataSet := cdsCAWare_Mov;
  end
  else
  begin
    fArc1.dsArc.DataSet := cdsUnArcWare;
    DataSource1.DataSet := cdsMov;
  end;
  fArc1.dsArc.DataSet.Close;
end;

procedure TfMov_WareUn.InternalInitialize;
var V : Variant;
begin
  Screen.Cursor := crSQLWait;
  try
    fArc1.dsArc.DataSet.Close;
    with TClientDataSet(DataSource1.DataSet) do
    begin
      DisableControls;
      Close;
      Params.ParamByName('@ID').Value := FID_WareType;
      Params.ParamByName('@id_business').Value := FID_Bsn;

      if DataSource1.DataSet = cdsMov then
      begin
        if assigned(FGetWHList) then FGetWHList(V) else V := Null;
        Params.ParamByName('@IDWHList').Value := V;

        if assigned(FGetWHGroupList) then FGetWHGroupList(V) else V := Null;
        Params.ParamByName('@IDWHGroupList').Value := V;
      end
      else
      begin
        if assigned(FGetCAList) then FGetCAList(V) else V := Null;
        Params.ParamByName('@IDContrAgentList').Value := V;

        if assigned(FGetCAGroupList) then FGetCAGroupList(V) else V := Null;
        Params.ParamByName('@IDContrAgentGroupList').Value := V;
      end;

      if assigned(FGetWareList) then FGetWareList(V) else V := Null;
      Params.ParamByName('@IDGoodsList').Value := V;

      if assigned(FGetWareGroupList) then FGetWareGroupList(V) else V := Null;
      Params.ParamByName('@IDGoodsGroupList').Value := V;

      Params.ParamByName('@ShowNull').Value := true;
      Params.ParamByName('@DateFrom').AsDateTime := GetDateAdv(dtFrom.Date, false);
      Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(dtTo.Date, true);

      Open;
    end;
 //   dxMasterView2.Items.Expand(true);
 //   dxMasterView2.Items.Collapse(true);
  finally
    DataSource1.DataSet.EnableControls;

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

constructor TfMov_WareUn.Create(AOwner: TCOmponent);
var Reg : TRegistry;
    FullRegPathName : String;
    Own : TCustomForm;
begin
  inherited;
  FFFNode := nil;
  dxDBTreeList1.RegistryPath := SRegPath + '\' +Name + '\' + dxDBTreeList1.Name;
  lbInfo.Caption := '';
  dtFrom.Date := Now - 1;
  dtTo.Date := Now;

  fArc1.pnDate.Visible := false;
  fArc1.pnDate.Visible := false;
  fArc1.pnDate.Visible := false;

  fArc1.aBuffDel.Visible := false;

  fArc1.DisableEditAct;                                
  fArc1.aNewCopyOper2.Visible := true;
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

procedure TfMov_WareUn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TfMov_WareUn.aPrintExecute(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Print(True, nil, nil);
end;

procedure TfMov_WareUn.GetAGPrinterInfo;
begin
//  dxComponentPrinter1Link2.ReportTitleText := fBsnSelector1.BsnName; //'Баланс';
  dxComponentPrinter1Link2.ReportTitleText := dxComponentPrinter1Link2.ReportTitleText + #13 + #10 + lbInfo.Caption;
  dxComponentPrinter1Link2.ReportTitleMode := tmOnEveryTopPage;
end;


procedure TfMov_WareUn.aPreviewExecute(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Preview(True, nil);
end;

procedure TfMov_WareUn.cdsBalBeforeClose(DataSet: TDataSet);
begin
  aClosePeriod.Enabled := false;
  aSave.Enabled := false;
end;

procedure TfMov_WareUn.dtToChange(Sender: TObject);
begin
  aSave.Enabled := false;
  aClosePeriod.Enabled := false;
end;

procedure TfMov_WareUn.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfMov_WareUn.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfMov_WareUn.cdsCalcGDetTotalAmountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := FormatFloat('0.##', Sender.AsFloat);
end;

procedure TfMov_WareUn.BitBtn2Click(Sender: TObject);
var ID, ID_Ctg : Variant;
begin
  if (FFFNode <> nil) and (dxDBTreeList1.SelectedCount > 0)  then
  begin
    ID := FFFNode.Values[dxDBTreeList1id_Ware.Index];
    ID_Ctg := FFFNode.Values[dxDBTreeList1id_Ctg.Index];
    if ID = Null then ID := -13;
    if ID_Ctg = -1 then ID_Ctg := -13;
  end
  else
  begin
    ID := -13;
    ID_Ctg := -13;
  end;
  InternalInitialize;
  SelectEvent(ID, ID_Ctg);
end;

procedure TfMov_WareUn.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  Index := Node.ImageIndex;
end;

procedure TfMov_WareUn.dxDBTreeList1GetImageIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  if Node.Values[dxDBTreeList1id_Ware.Index] <> Null then
    Index := 0
  else
    Index := 3;
end;

procedure TfMov_WareUn.dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
var id_Goods, V : Variant;
begin
  FFFNode := Node;
  with TClientDataSet(fArc1.dsArc.DataSet) do
  begin
    Close;
    try
      Screen.Cursor := crSQLWait;
      if Node.Values[dxDBTreeList1id_Ware.Index] <> Null then
      begin
        id_Goods := null;

        id_Goods := Node.Values[dxDBTreeList1id_Ware.Index];

        if fArc1.dsArc.DataSet = cdsUnArcWare then
        begin
          if assigned(FGetWHList) then FGetWHList(V) else V := Null;
          Params.ParamByName('@IDWHList').Value := V;

          if assigned(FGetWHGroupList) then FGetWHGroupList(V) else V := Null;
          Params.ParamByName('@IDWHGroupList').Value := V;
        end
        else
        if fArc1.dsArc.DataSet = cdsWareCASmp then
        begin
          if assigned(FGetCAList) then FGetCAList(V) else V := Null;
          Params.ParamByName('@ID_ContrAgent').Value := V;
        end
        else
        begin
          if assigned(FGetCAList) then FGetCAList(V) else V := Null;
          Params.ParamByName('@IDContrAgentList').Value := V;

          if assigned(FGetCAGroupList) then FGetCAGroupList(V) else V := Null;
          Params.ParamByName('@IDContrAgentGroupList').Value := V;
        end;

    //    Params.ParamByName('@HasViza').Value := true;
       // Params.ParamByName('@ID_Warehouse').Value := FID_Warehouse;
        Params.ParamByName('@id_Goods').Value := id_Goods;

        Params.ParamByName('@DateFrom').AsDateTime := GetDateAdv(dtFrom.Date, false);
        Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(dtTo.Date, true);
        
   //     if assigned(FGetCAList) then FGetCAList(V) else V := Null;
   //     Params.ParamByName('@IDCAList').Value := V;

   //     if assigned(FGetCAGroupList) then FGetCAGroupList(V) else V := Null;
   //     Params.ParamByName('@IDCAGroupList').Value := V;

        Open;
      end;
    finally
      aExpOper.Enabled := not fArc1.dsArc.DataSet.IsEmpty;
      Screen.Cursor := crDefault;
    end;
  end;
end;

destructor TfMov_WareUn.Destroy;
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

procedure TfMov_WareUn.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TfMov_WareUn.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TfMov_WareUn.aCollapseNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TfMov_WareUn.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TfMov_WareUn.PopupMenu1Popup(Sender: TObject);
begin
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);
  aReVal.Enabled := (FFFNode <> Nil) and (not FFFNode.HasChildren);
end;

procedure TfMov_WareUn.Action2Execute(Sender: TObject);
var S : String;
begin
  S := ''; //'Баланс';
  DBTreeListToExcel(dxDBTreeList1, S);
end;

procedure TfMov_WareUn.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  S := ''; //'Баланс';
  DBTreeListToExcel(dxDBTreeList1, S, FFFNode);
end;

procedure TfMov_WareUn.SpeedButton2Click(Sender: TObject);
begin
  ShowWareFinder(Null, FID_Bsn, SelectEvent, Owner, false);
end;

procedure TfMov_WareUn.SelectEvent(ID, ID_Ctg : integer);
var i : integer;
    Node : TdxTreeListNode;
begin
  FFFNode := nil;
  for i := dxDBTreeList1.SelectedCount - 1 downto 0 do
    dxDBTreeList1.SelectedNodes[i].Selected := false;
  Node := dxDBTreeList1.TopNode;
  while Node <> nil do
  begin
    if (Node.Values[dxDBTreeList1id_Ware.Index] = ID) or
       (Node.Values[dxDBTreeList1id_Ctg.Index] = ID_Ctg) then
    begin
      dxDBTreeList1.MakeNodeVisible(Node);
      Node.Focused := true;
      Node.Selected := true;
      FFFNode := Node;
      Break;
    end;

    Node := Node.GetNext;
  end;
end;


procedure TfMov_WareUn.aExpOperExecute(Sender: TObject);
begin
  fArc1.aGreedToExcel.Execute;
end;

procedure TfMov_WareUn.fArc1dsArcDataChange(Sender: TObject; Field: TField);
begin
  fArc1.dsArcDataChange(Sender, Field);
end;

procedure TfMov_WareUn.cbMoveClick(Sender: TObject);
begin
  with DataSource1.DataSet do
    Filtered := cbMove.Checked or cbSumm.Checked;
end;

procedure TfMov_WareUn.cdsMovFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  with DataSet do
    Accept := (not cbMove.Checked or
              (ABS(FieldByName('TotalAmountIn').AsFloat)>0)
              OR (ABS(FieldByName('TotalSumIn').AsFloat)>0)
              OR (ABS(FieldByName('TotalAmountOut').AsFloat)>0)
              OR (ABS(FieldByName('TotalSumOut').AsFloat)>0))
              and
              (not cbSumm.Checked or
              (ABS(FieldByName('TotalAmount').AsFloat)>0)
              OR (ABS(FieldByName('TotalSum').AsFloat)>0));
end;


end.
