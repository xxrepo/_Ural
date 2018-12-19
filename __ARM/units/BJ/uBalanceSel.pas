unit uBalanceSel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons,
  dxPSGlbl, Menus, Mask, ToolEdit, CurrEdit, ToolWin
  ;

type
  TSelObjWSEvent = procedure (AID: integer; AName : String; ASumm : Variant) of object;

  TBalanceSel = class(TForm)
    DataSource1: TDataSource;
    cdsBal: TClientDataSet;
    cdsBalID: TAutoIncField;
    cdsBalid_Rr: TIntegerField;
    cdsBalRowLevel: TIntegerField;
    cdsBalRowName: TStringField;
    cdsBalIsDeb: TBooleanField;
    cdsBalOrdNum: TIntegerField;
    cdsBalisTotal: TBooleanField;
    cdsBalOperSummSysCur: TFloatField;
    cdsBalid_Acc: TIntegerField;
    cdsBalid_Manufact: TIntegerField;
    cdsBalid_Goods: TIntegerField;
    cdsBalid_CAGroup: TIntegerField;
    dxPrintDialog1: TdxPrintDialog;
    ActionList1: TActionList;
    ilButtons: TImageList;
    aPrint: TAction;
    dxComponentPrinter2: TdxComponentPrinter;
    dxComponentPrinter1Link2: TdxDBTreeListReportLink;
    aPreview: TAction;
    aClosePeriod: TAction;
    aSave: TAction;
    PopupMenu1: TPopupMenu;
    aShowAccCard: TAction;
    aShowBalance: TAction;
    aShowGoodsSum: TAction;
    N1: TMenuItem;
    aShowBalance1: TMenuItem;
    cdsBalID_Oper: TIntegerField;
    cdsBalid_Warehouse: TIntegerField;
    cdsBalid_repr: TIntegerField;
    cdsBalid_ContrAgent: TIntegerField;
    dxDBTreeList1: TdxDBTreeList;
    aShowRawSum: TAction;
    aShowExtRawSum: TAction;
    aShowServiceSum: TAction;
    aExpandNode: TAction;
    aExpandAll: TAction;
    aCollapseNode: TAction;
    aCollapseAll: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    aExport: TAction;
    aNodeExp: TAction;
    aBlnDetail: TAction;
    aShowInRoot: TAction;
    cdsBalid_Acc_Group: TIntegerField;
    cdsBalid_Manufact_Group: TIntegerField;
    cdsBalid_Warehouse_Group: TIntegerField;
    cdsBalHasChld: TBooleanField;
    aUnShowInRoot: TAction;
    dxDBTreeList1ID: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Rr: TdxDBTreeListMaskColumn;
    dxDBTreeList1RowLevel: TdxDBTreeListMaskColumn;
    dxDBTreeList1RowName: TdxDBTreeListMaskColumn;
    dxDBTreeList1IsDeb: TdxDBTreeListCheckColumn;
    dxDBTreeList1OrdNum: TdxDBTreeListMaskColumn;
    dxDBTreeList1isTotal: TdxDBTreeListCheckColumn;
    dxDBTreeList1OperSummSysCur: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Acc: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Manufact: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Raw: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_ExtRaw: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Service: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Goods: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_CAGroup: TdxDBTreeListMaskColumn;
    dxDBTreeList1ID_Oper: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Warehouse: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_repr: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_ContrAgent: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Acc_Group: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Manufact_Group: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Warehouse_Group: TdxDBTreeListMaskColumn;
    dxDBTreeList1HasChld: TdxDBTreeListCheckColumn;
    ilEM: TImageList;
    aShowAccCard_Adv: TAction;
    N18: TMenuItem;
    aBlnDetail_2: TAction;
    N4: TMenuItem;
    cdsBalOnTop: TBooleanField;
    cdsBalDelta: TFloatField;
    dxDBTreeList1Column24: TdxDBTreeListColumn;
    cdsBalOperSummSysCurOLD: TFloatField;
    dxDBTreeList1Column25: TdxDBTreeListColumn;
    aBlnDetail_3: TAction;
    aShowB2: TAction;
    N6: TMenuItem;
    aA2: TAction;
    N14: TMenuItem;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    aDel: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    procedure dxDBTreeList1CustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure aPrintExecute(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure cdsBalBeforeClose(DataSet: TDataSet);
    procedure dxComponentPrinter1Link2CustomDrawCell(
      Sender: TBasedxReportLink; ACanvas: TCanvas; ABoundsRect,
      AClientRect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; var AText: String; var AColor: TColor;
      AFont: TFont; var ATextAlignX: TdxTextAlignX;
      var ATextAlignY: TdxTextAlignY; var ADone: Boolean);
    procedure aShowAccCardExecute(Sender: TObject);
    procedure aShowBalanceExecute(Sender: TObject);
    procedure aShowGoodsSumExecute(Sender: TObject);
    procedure aExpandNodeExecute(Sender: TObject);
    procedure aExpandAllExecute(Sender: TObject);
    procedure aCollapseNodeExecute(Sender: TObject);
    procedure aCollapseAllExecute(Sender: TObject);
    procedure dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure aBlnDetailExecute(Sender: TObject);
    procedure dxDBTreeList1GetSelectedIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure dxDBTreeList1GetImageIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cdsBalOperSummSysCurGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure aShowAccCard_AdvExecute(Sender: TObject);
    procedure dxDBTreeList1Deletion(Sender: TObject;
      Node: TdxTreeListNode);
    procedure aBlnDetail_2Execute(Sender: TObject);
    procedure aBlnDetail_3Execute(Sender: TObject);
    procedure cdsBalDeltaGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure aShowB2Execute(Sender: TObject);
    procedure aA2Execute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
  private
    FFFNode : TdxTreeListNode;
    Val : Variant;
    procedure GetAGPrinterInfo;
    procedure InitializeClick;
  public
    FDate : Variant;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(id_business : Variant; ATechMode : integer; ADate : Variant);
    procedure CreateParams(var Params: TCreateParams); override;

  end;

function ShowSelectBsn(id_business: integer; ADate : Variant; ATechMode : integer; ASelObjEvent : TSelObjWSEvent) : boolean;

var
  BalanceSel: TBalanceSel;

implementation

uses uDM, foMyFunc, uAccCard, uBalance, uMovWH, 
  foMyFuncDXTreeExcel, uBlnDetail, uAccCard_Adv, uBlnDetail_2, uBlnDetail_3,
  uBalance_v2, uAccCard_v2, uPrgForm;

{$R *.DFM}

function ShowSelectBsn(id_business: integer; ADate : Variant; ATechMode : integer; ASelObjEvent : TSelObjWSEvent) : boolean;
var F : TBalanceSel;
    ANode : TdxTreeListNode;
    AIndex, i, N : integer;
begin
  DM.Rights_GetUserRights(15, Null);
  F := TBalanceSel.Create(nil);
  try
    F.Initialize(id_business, ATechMode, ADate);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      result := true;

      if (ATechMode = 1) or (ATechMode = 2) then
        AIndex := F.dxDBTreeList1id_ContrAgent.Index;
      if (ATechMode = 4) then
        AIndex := F.dxDBTreeList1id_Acc.Index;

      ANode := F.dxDBTreeList1.TopNode;
      i := 0;
      N := F.dxDBTreeList1.Count;
      while ANode <> nil do
      begin
        ShowProgressForm(0, i, N, 'Добавление объектов...');
        inc(i);
        if ANode.Values[AIndex] > 0 then
          ASelObjEvent(ANode.Values[AIndex],
                       ANode.Values[F.dxDBTreeList1RowName.index],
                       ANode.Values[F.dxDBTreeList1OperSummSysCur.index]);
        ANode := ANode.GetNext;
      end;
    end;
  finally
    CloseProgressForm;
    F.Free;
  end;
end;

{ TBalanceBsn }

procedure TBalanceSel.Initialize(id_business: Variant; ATechMode : integer; ADate: Variant);
var ADateFrom : Variant;
begin
  Screen.Cursor := crSQLWait;
  try
    FDate := ADate;
    with cdsBal do
    begin
 //     DisableControls;
      Close;
      Params.ParamByName('@id_business').Value := id_business;
      Params.ParamByName('@TechMode').Value := ATechMode;

      if ADate = Null then
        Params.ParamByName('@Date').Value := ADate
       else
         Params.ParamByName('@Date').AsDateTime := ADate {- 2};
      Params.ParamByName('@isDeBug').Value := false;
      Params.ParamByName('@ClosePeriod').Value := false;
      Params.ParamByName('@Save').Value := false;
      Params.ParamByName('@CalcAll').Value := false;
      Params.ParamByName('@DateFrom').Value := Null;
      
      Params.ParamByName('@MinCA').Value := 0;
      Open;
    end;
    if dxDBTreeList1.Count > 0 then
    begin
      dxDBTreeList1.Items[0].Focused := true;
      dxDBTreeList1.FullCollapse;
      dxDBTreeList1ChangeNode(dxDBTreeList1, nil, dxDBTreeList1.Items[0]);
    end;
 //   dxMasterView2.Items.Expand(true);
 //   dxMasterView2.Items.Collapse(true);
  finally
///    CDS.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TBalanceSel.InitializeClick;
begin
end;

constructor TBalanceSel.Create(AOwner: TCOmponent);
begin
  inherited;
  LoadValFromRegistry(Val, SRegPath + '\' + Name, 'id_Bsn');
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TBalanceSel.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TBalanceSel.dxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  ColInd: Integer;
begin
  ColInd := dxDBTreeList1OrdNum.Index;
  if (ANode.Values[dxDBTreeList1id_Acc_Group.Index] <> Null) or
     (ANode.Values[dxDBTreeList1id_Warehouse_Group.Index] <> Null) or
     (ANode.Values[dxDBTreeList1id_Manufact_Group.Index] <> Null) or
     ((ANode.Values[dxDBTreeList1id_CAGroup.Index] <> Null) and (ANode.Values[dxDBTreeList1id_ContrAgent.Index] = Null)) then
       AFont.Style := AFont.Style + [fsBold];
    if (ANode.Parent = nil) then   // Верхний уровень
    begin
      AFont.Style := AFont.Style + [fsBold];
      if (ANode.Values[ColInd] = 200) then
      begin
        ACanvas.Brush.Color := clWindow;
        ARect.Left := 0;
      //  ARect.Right := 0;
        ACanvas.FillRect(ARect);
        ADone := true;
      end
      else
      if (ANode.Values[ColInd] = 100) or (ANode.Values[ColInd] = 180) then
      begin
        AColor := clInfoBk;
        if ASelected then
          AFont.Color := clBlack;
      end
      else
        if (ANode.Values[ColInd] = 110) then
        begin
          if (ABS(ANode.Values[dxDBTreeList1OperSummSysCur.Index]) >= 0.005) then
          begin
            AColor := clRed;
          end
          else
          begin
            AColor := $00D7D700;
            AText := '0,00';
          end;
        end
        else
          if not ASelected then
            AColor := $00E0E2E4;
    end;
end;

procedure TBalanceSel.aPrintExecute(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Print(True, nil, nil);
end;

procedure TBalanceSel.GetAGPrinterInfo;
begin
end;


procedure TBalanceSel.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  aCollapseAll.Enabled := not cdsBal.IsEmpty;
  aExpandAll.Enabled := not cdsBal.IsEmpty;

  aA2.Visible := not cdsBal.FieldByName('id_Acc').IsNull;
  aShowAccCard.Visible := not cdsBal.FieldByName('id_Acc').IsNull;
  aShowAccCard_adv.Visible := not cdsBal.FieldByName('id_Acc_Group').IsNull;

  aShowBalance.Visible := not cdsBal.FieldByName('id_ContrAgent').IsNull;
  aShowB2.Visible := not cdsBal.FieldByName('id_ContrAgent').IsNull;

  aShowGoodsSum.Visible := not cdsBal.FieldByName('id_Goods').IsNull and not cdsBal.FieldByName('id_Warehouse').IsNull;

  aBlnDetail.Visible := cdsBal.FieldByName('OrdNum').AsInteger in [60, 91, 80, 95, 98, 115, 90, 140, 150, 160, 163];
  aBlnDetail.Enabled := aBlnDetail.Visible;
{  aBlnDetail_2.Visible := (ComboBox1.ItemIndex = 0) and (cdsBal.FieldByName('OrdNum').AsInteger in [60, 91, 80, 95, 98, 115, 90, 140, 150, 160, 163]);
  aBlnDetail_2.Enabled := aBlnDetail_2.Visible;

  aBlnDetail_3.Visible := (ComboBox1.ItemIndex = 1) and
                          ((cdsBal.FieldByName('OrdNum').AsInteger in 95, 98, 115]) OR
                           ((cdsBal.FieldByName('OrdNum').AsInteger in [90, 163]) and cdsBal.FieldByName('id_CAGroup').IsNull) OR
                           ((cdsBal.FieldByName('OrdNum').AsInteger in [91, 140]) and cdsBal.FieldByName('id_Manufact_Group').IsNull)
                           );
  aBlnDetail_3.Enabled := aBlnDetail_3.Visible;   }

 { aShowInRoot.Enabled := (cdsBal.FieldByName('OrdNum').AsInteger in [70, 120, 20, 30, 40, 45, 50, 60, 140, 91])
                           and (not cdsBal.FieldByName('id_Rr').IsNull)
                           and (not cdsBal.FieldByName('id_Acc').IsNull or
                                not cdsBal.FieldByName('id_Manufact').IsNull or
                                not cdsBal.FieldByName('id_Warehouse').IsNull or
                                (not cdsBal.FieldByName('id_Acc_Group').IsNull and (cdsBal.FieldByName('id_Acc_Group').AsInteger > -1)) or
                                (not cdsBal.FieldByName('id_Manufact_Group').IsNull and (cdsBal.FieldByName('id_Manufact_Group').AsInteger > -1)) or
                                (not cdsBal.FieldByName('id_Warehouse_Group').IsNull and (cdsBal.FieldByName('id_Warehouse_Group').AsInteger > -1)) or
                                (not cdsBal.FieldByName('id_CAGroup').IsNull and (cdsBal.FieldByName('id_CAGroup').AsInteger > -1)) or
                                not cdsBal.FieldByName('id_ContrAgent').IsNull);
  aUnShowInRoot.Enabled := (cdsBal.FieldByName('OrdNum').AsInteger in [70, 120, 20, 30, 40, 45, 50, 60, 140, 91])
                           and (cdsBal.FieldByName('id_Rr').IsNull)
                           and (not cdsBal.FieldByName('id_Acc').IsNull or
                                not cdsBal.FieldByName('id_Manufact').IsNull or
                                not cdsBal.FieldByName('id_Warehouse').IsNull or
                                (not cdsBal.FieldByName('id_Acc_Group').IsNull and (cdsBal.FieldByName('id_Acc_Group').AsInteger > -1)) or
                                (not cdsBal.FieldByName('id_Manufact_Group').IsNull and (cdsBal.FieldByName('id_Manufact_Group').AsInteger > -1)) or
                                (not cdsBal.FieldByName('id_Warehouse_Group').IsNull and (cdsBal.FieldByName('id_Warehouse_Group').AsInteger > -1)) or
                                (not cdsBal.FieldByName('id_CAGroup').IsNull and (cdsBal.FieldByName('id_CAGroup').AsInteger > -1)) or
                                not cdsBal.FieldByName('id_ContrAgent').IsNull);
                                }
end;

procedure TBalanceSel.cdsBalBeforeClose(DataSet: TDataSet);
begin
  aClosePeriod.Enabled := false;
  aSave.Enabled := false;
end;

procedure TBalanceSel.dxComponentPrinter1Link2CustomDrawCell(
  Sender: TBasedxReportLink; ACanvas: TCanvas; ABoundsRect,
  AClientRect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
  var AText: String; var AColor: TColor; AFont: TFont;
  var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY;
  var ADone: Boolean);
var
  ColInd: Integer;
begin
  ColInd := dxDBTreeList1OrdNum.Index;
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
    end;
end;

procedure TBalanceSel.aShowAccCardExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_Acc := cdsBalid_Acc.AsInteger;
  AParamBlnc.DateFrom := FDate;
  AParamBlnc.DateTo := FDate;

  ShowAccCard(AParamBlnc);
end;

procedure TBalanceSel.aShowBalanceExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_ContrAgent := cdsBalid_ContrAgent.AsInteger;
  AParamBlnc.DateFrom := FDate;
  AParamBlnc.DateTo := FDate;
  ShowBalance(AParamBlnc);
end;

procedure TBalanceSel.aShowGoodsSumExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_Warehouse := cdsBal.FieldByName('id_Warehouse').AsInteger;
  AParamBlnc.DateFrom := FDate;
  AParamBlnc.DateTo := FDate;
  ShowMovWH(AParamBlnc, true);
end;

destructor TBalanceSel.Destroy;
begin
  inherited;
end;

procedure TBalanceSel.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TBalanceSel.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TBalanceSel.aCollapseNodeExecute(Sender: TObject);
begin    
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TBalanceSel.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TBalanceSel.dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
  FFFNode := Node;
  aDel.Enabled := (FFFNode <> Nil);
end;

procedure TBalanceSel.PopupMenu1Popup(Sender: TObject);
begin
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);
end;

procedure TBalanceSel.aBlnDetailExecute(Sender: TObject);
var ABlnDetail : TBlnDetailData;
begin
{  ABlnDetail := GetEmptyBlnDetail;
  ABlnDetail.id_business := fBsnSelector1.ID;
  ABlnDetail.DateTo := dtTo.DateTime;

  ABlnDetail.id_Manufact := cdsBal.FieldByName('id_Manufact').Value;
  
  case cdsBal.FieldByName('OrdNum').AsInteger of
    60, 91 : ABlnDetail.isRawZ := true;
    80, 95, 115 : ABlnDetail.isCRN := true;
    90 : ABlnDetail.isNotRawZ := true;
    98 : ABlnDetail.isDown := true;
    140 : ABlnDetail.isInFromManuf := true;
    150 : ABlnDetail.isUp := true;
    160, 163 : ABlnDetail.isUp := true;
  end;
  ShowBlnDetail(ABlnDetail);  }
end;



procedure TBalanceSel.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  index := Node.ImageIndex;
end;

procedure TBalanceSel.dxDBTreeList1GetImageIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
var
  ColInd: Integer;
begin
  ColInd := dxDBTreeList1OrdNum.Index;
  if (Node <> nil) then
  begin
    case Node.Values[ColInd] of
      100, 180 : Index := 22;
      90 :
        if (Node.Values[dxDBTreeList1id_ContrAgent.Index] = Null) and (Node.Values[dxDBTreeList1id_CAGroup.Index] = Null) then Index := 21
        else
        begin
          if Node.Values[dxDBTreeList1id_ContrAgent.Index] <> Null then
            Index := 3
          else
            if Node.Values[dxDBTreeList1id_CAGroup.Index] <> Null then
              Index := 11
            else
              Index := 1;
        end;

      400 : Index := 20;
      150, 160, 163 :
        if (Node.Values[dxDBTreeList1id_ContrAgent.Index] = Null) and (Node.Values[dxDBTreeList1id_CAGroup.Index] = Null) then Index := 20
        else
        begin
          if Node.Values[dxDBTreeList1id_ContrAgent.Index] <> Null then
            Index := 3
          else
            if Node.Values[dxDBTreeList1id_CAGroup.Index] <> Null then
              Index := 11
            else
              Index := 1;
        end;
      500 : Index := 21;
      20 : Index := 16;
      30 : Index := 18;
      40 : Index := 5;
      45 : Index := 6;
      50 : Index := 4;
      200 : Index := -1;
      60, 140, 91 : Index := 9;
      95, 115 : Index := 19;
     { 90,} 70, 120 :
        begin
          if Node.Values[dxDBTreeList1id_ContrAgent.Index] <> Null then
            Index := 3
          else
            if Node.Values[dxDBTreeList1id_CAGroup.Index] <> Null then
              Index := 11
            else
              Index := 1;
        end;
      110 : Index := -1;
      else
      begin
        if Node.Expanded then
          index := 1
        else
          Index := 0;
      end;
    end;
  end;
end;

procedure TBalanceSel.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TBalanceSel.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TBalanceSel.cdsBalOperSummSysCurGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if cdsBalOrdNum.AsInteger <> 200 then
  begin
    Text := Trim(FormatFloat('### ### ### ##0.00', ABS(Sender.AsFloat)));

    if Sender.AsFloat < 0 then Text := '-' + Text;
  end;
end;

procedure TBalanceSel.aShowAccCard_AdvExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
 { AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_business := fBsnSelector1.ID;
  AParamBlnc.id_AccGroup := cdsBalid_Acc_Group.AsInteger;
  if dtTo.Checked then
  begin
    AParamBlnc.DateFrom := dtTo.Date;
    AParamBlnc.DateTo := dtTo.Date;
  end;
  ShowAccCard_Adv(AParamBlnc);     }
end;

procedure TBalanceSel.dxDBTreeList1Deletion(Sender: TObject;
  Node: TdxTreeListNode);
begin
  if FFFNode = Node then
    FFFNode := nil;
end;

procedure TBalanceSel.aBlnDetail_2Execute(Sender: TObject);
var ABlnDetail : TBlnDetailData;
begin
{  ABlnDetail := GetEmptyBlnDetail;
  ABlnDetail.id_business := fBsnSelector1.ID;
  ABlnDetail.DateTo := BlnDateTime;

  ABlnDetail.id_Manufact := cdsBal.FieldByName('id_Manufact').Value;

  case cdsBal.FieldByName('OrdNum').AsInteger of
    60, 91 : ABlnDetail.isRawZ := true;
    80, 95, 115 : ABlnDetail.isCRN := true;
    90 : ABlnDetail.isNotRawZ := true;
    98 : ABlnDetail.isDown := true;
    140 : ABlnDetail.isInFromManuf := true;
    150 : ABlnDetail.isUp := true;
    160, 163 : ABlnDetail.isUp := true;
  end;
  ShowBlnDetail_2(ABlnDetail); }
end;


procedure TBalanceSel.aBlnDetail_3Execute(Sender: TObject);
var ABlnDetail : TBlnDetailData;
    ACaption : String;
begin
{  if FFFNode = nil then Exit;
  ABlnDetail := GetEmptyBlnDetail;
  ABlnDetail.id_business := fBsnSelector1.ID;
  ABlnDetail.OrdNum := FFFNode.Values[dxDBTreeList1OrdNum.Index];// cdsBalOrdNum.AsInteger;
  ABlnDetail.DateTo := BlnDateTime;
  ABlnDetail.DateFrom := BlnDateTimeFrom;

  ABlnDetail.id_Acc := FFFNode.Values[dxDBTreeList1id_Acc.Index];//cdsBal.FieldByName('id_Acc').Value;
  ABlnDetail.id_Manufact := FFFNode.Values[dxDBTreeList1id_Manufact.Index];//cdsBal.FieldByName('id_Manufact').Value;
  ABlnDetail.id_CA := FFFNode.Values[dxDBTreeList1id_ContrAgent.Index];//cdsBal.FieldByName('id_ContrAgent').Value;

  case cdsBal.FieldByName('OrdNum').AsInteger of
    163 : ACaption := 'Прибыль';
    140 : ACaption := 'Приход с производства';
    115, 95 : ACaption := 'Курсовая разница';
    90 : ACaption := 'Несырьевые затраты';
    91 : ACaption := 'Сырьевые затраты';
  end;
//  if cdsBal.FieldByName('RowLevel').AsInteger = 2 then
  if not FFFNode.HasChildren then
    ACaption := ACaption + ' - ' + FFFNode.Values[dxDBTreeList1RowName.Index]; //cdsBal.FieldByName('RowName').AsString;
  ShowBlnDetail_3(ACaption, ABlnDetail);  }
end;

procedure TBalanceSel.cdsBalDeltaGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    Text := Trim(FormatFloat('### ### ### ##0.00', ABS(Sender.AsFloat)));

    if Sender.AsFloat < 0 then Text := '-' + Text;
  end;
end;

procedure TBalanceSel.aShowB2Execute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_ContrAgent := cdsBalid_ContrAgent.AsInteger;
  AParamBlnc.DateFrom := fDate;
  AParamBlnc.DateTo := fDate;

  ShowBalance_v2(AParamBlnc);
end;

procedure TBalanceSel.aA2Execute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_Acc := cdsBalid_Acc.AsInteger;
  AParamBlnc.DateFrom := fDate;
  AParamBlnc.DateTo := fDate;
  ShowAccCard_v2(AParamBlnc);
end;

procedure TBalanceSel.aDelExecute(Sender: TObject);
var P : TdxTreeListNode;
    procedure GetSuxxxNode;
    var NeedLast : boolean;
    begin
      P := FFFNode;
  //    NeedLast := false;
      FFFNode := P.GetNextSibling;
      NeedLast := FFFNode = nil;
      if FFFNode = nil then
        FFFNode := P.Parent;
      P.Free;
        
      if NeedLast and (FFFNode <> nil) and (FFFNode.HasChildren) then
        FFFNode := FFFNode.GetLastChild;
      if FFFNode <> nil then
      begin
        FFFNode.Focused := true;
        FFFNode.MakeVisible;
      end;
    end;
begin
//*
  if FFFNode <> nil then
  begin
    if MessageBox(Handle, Pchar('Удалить объект ' + VarToStr(FFFNode.Values[dxDBTreeList1RowName.index]) + '?'), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
    begin
      GetSuxxxNode;
    end;
  end;
end;

end.
