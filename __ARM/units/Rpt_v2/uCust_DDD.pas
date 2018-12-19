unit uCust_DDD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons, Menus, Mask, ToolEdit, CurrEdit, dxGrClms,
  ToolWin;

type
  TCust_DDD = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    dsCAPrfLoss: TDataSource;
    cdsCRep: TClientDataSet;
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
    N4: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    aDetail: TAction;
    Excel1: TMenuItem;
    BitBtn5: TBitBtn;
    dtTo: TDateTimePicker;
    Label1: TLabel;
    dtFrom: TDateTimePicker;
    Label2: TLabel;
    cdsCRepid_Cat: TIntegerField;
    cdsCRepXXX: TIntegerField;
    cdsCRepid_Oper: TIntegerField;
    cdsCRepLS: TStringField;
    cdsCRepSRub: TFloatField;
    cdsCRepDateCreate: TDateTimeField;
    cdsCRepRateCB: TFloatField;
    cdsCRepS_USD: TFloatField;
    dxDBTreeList1id_Cat: TdxDBTreeListMaskColumn;
    dxDBTreeList1XXX: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Oper: TdxDBTreeListMaskColumn;
    dxDBTreeList1LS: TdxDBTreeListMaskColumn;
    dxDBTreeList1SRub: TdxDBTreeListMaskColumn;
    dxDBTreeList1DateCreate: TdxDBTreeListDateColumn;
    dxDBTreeList1RateCB: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_USD: TdxDBTreeListMaskColumn;
    cdsCRepID: TAutoIncField;
    cdsCRepPID: TIntegerField;
    dxDBTreeList1ID: TdxDBTreeListMaskColumn;
    dxDBTreeList1PID: TdxDBTreeListMaskColumn;
    aAddCat: TAction;
    aEditCat: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    aDelCat: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    aOper: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    cdsCRepSR_X: TFloatField;
    cdsCRepSU_X: TFloatField;
    cdsCRepX_DS: TStringField;
    cdsCRepX_Rub: TStringField;
    cdsCRepX_USD: TStringField;
    dxDBTreeList1X_DS: TdxDBTreeListColumn;
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
    procedure aAddCatExecute(Sender: TObject);
    procedure aEditCatExecute(Sender: TObject);
    procedure aDelCatExecute(Sender: TObject);
    procedure aOperExecute(Sender: TObject);
    procedure dxDBTreeList1DblClick(Sender: TObject);
    procedure cdsCRepCalcFields(DataSet: TDataSet);
  private
    FFFNode : TdxTreeListNode;
    Fid_Rep : integer;
    function GetBlnDateTime_int(ATo: boolean): Variant;
    procedure GetAGPrinterInfo;
    procedure GetIDS(var ID, ID_Ctg: Variant);
    procedure SelectEvent(ID, ID_Ctg: integer);
    procedure SetCapt;
    procedure Initialize_Int;
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(id_Rep : integer);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure SetChecked;
  end;

procedure ShowCust_DDD(id_Rep : integer);

var
  Cust_DDD: TCust_DDD;

implementation

uses uDM, foMyFunc, foMyFuncDXTreeExcel, uBalance, uCAPrfLoss_Det,
  uFormApi_Oper, uCRepCat;

{$R *.DFM}

procedure ShowCust_DDD(id_Rep : integer);
var F : TCust_DDD;
begin
  F := TCust_DDD.Create(nil);
  try
    F.Initialize(id_Rep);
//    F.SetChecked;
  //  F.SetCapt;

    F.Show;
  except
    F.Free;
  end;
end;

{ TBalanceBsn }


function TCust_DDD.GetBlnDateTime_int(ATo : boolean): Variant;
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

procedure TCust_DDD.SetChecked;
begin
  dtFrom.Checked := true;
  dtFrom.Checked := false;

end;

procedure TCust_DDD.SetCapt;
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

{  for i := 0 to cdsCRep.fields.Count - 1 do
  begin
    if cdsCRep.fields[i] is TNumericField then
      TNumericField(cdsCRep.fields[i]).DisplayFormat := '0.00';
  end;   }

  DecodeDate(dtFrom.DateTime, Year, Month, Day);
  D := EncodeDate(Year, Month, 1);

  DecodeDate(dtTo.DateTime, Year, Month, Day);
  D2 := EncodeDate(Year, Month, 1);
  D2 := IncMonth(D2, 1) - 1;
  EndUpdateControl(dxDBTreeList1);
end;


procedure TCust_DDD.GetIDS(var ID, ID_Ctg : Variant);
begin
  if (FFFNode <> nil) and (dxDBTreeList1.SelectedCount > 0)  then
  begin
    ID := FFFNode.Values[dxDBTreeList1id.Index];
    ID_Ctg := -1;
    if ID_Ctg = -1 then ID_Ctg := -13;
    if ID = Null then ID := -13;
  end
  else
  begin
    ID := -13;
    ID_Ctg := -13;
  end;
end;

procedure TCust_DDD.SelectEvent(ID, ID_Ctg : integer);
var i : integer;
    Node : TdxTreeListNode;
begin
  FFFNode := nil;
  for i := dxDBTreeList1.SelectedCount - 1 downto 0 do
    dxDBTreeList1.SelectedNodes[i].Selected := false;
  Node := dxDBTreeList1.TopNode;
  while Node <> nil do
  begin
    if (Node.Values[dxDBTreeList1id.Index] = ID) then
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

procedure TCust_DDD.Initialize(id_Rep : integer);
var V : Variant;
begin
  Fid_Rep := id_Rep;
  V := DM.rsCA.AppServer.CustRep_RepGetProp(Fid_Rep);

  Caption := VarToStr(V);
end;

procedure TCust_DDD.Initialize_Int;
begin

  Screen.Cursor := crSQLWait;
  try
    with cdsCRep do
    begin
      Close;
      Params.ParamByName('@DateFrom').Value := GetBlnDateTime_int(false);
      Params.ParamByName('@DateTo').Value := GetBlnDateTime_int(true);
      Params.ParamByName('@id_Rep').Value := Fid_Rep;
      Open;
    end;
    if dxDBTreeList1.Count > 0 then
    begin
      dxDBTreeList1.Items[0].Focused := true;
      dxDBTreeList1.FullCollapse;
      dxDBTreeList1ChangeNode(dxDBTreeList1, nil, dxDBTreeList1.Items[0]);
    //  dxDBTreeList1.Items[0].Expand(false);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TCust_DDD.Button1Click(Sender: TObject);
var id_business : Variant;
    ID, ID_Ctg : Variant;
begin
  dxDBTreeList1.OnChangeNode := nil;
  try
    GetIDS(ID, ID_Ctg);
    SetCapt;
    Initialize_int;
  finally
    dxDBTreeList1.OnChangeNode := dxDBTreeList1ChangeNode;
    SelectEvent(ID, ID_Ctg);
  end;
end;

constructor TCust_DDD.Create(AOwner: TCOmponent);
var V : Variant;
begin
  inherited;
  Fid_Rep := -1;
  LoadValFromRegistry(V, SRegPath + '\' + Name,  'OnlyNotZerro');

  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  dtFrom.Date := Now - 30;
  dtTo.Date := Now;
  dtFrom.Checked := true;
  dtFrom.Checked := false;
  dxDBTreeList1.RegistryPath := SRegPath + '\q' + ClassName;
  dxDBTreeList1.OptionsBehavior := dxDBTreeList1.OptionsBehavior + [etoStoreToRegistry];
end;

procedure TCust_DDD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TCust_DDD.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TCust_DDD.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TCust_DDD.dxDBTreeList1CustomDrawCell(Sender: TObject;
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

procedure TCust_DDD.aPrintExecute(Sender: TObject);
begin
  dxComponentPrinter2.Print(True,nil,nil);
end;

procedure TCust_DDD.dxDBTreeList1GetImageIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
var
  ColInd: Integer;
begin
    if (Node.Parent = nil) then   // Верхний уровень
    begin
      Index := -1;
    end;

{  if (Node <> nil) then
  begin
    if Node.Parent = nil then
      Index := 1
    else
      Index := 0;
  end;    }
end;

procedure TCust_DDD.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  index := Node.ImageIndex;
end;

procedure TCust_DDD.dxDBTreeList1ChangeNode(Sender: TObject;
  OldNode, Node: TdxTreeListNode);
begin
  FFFNode := Node;
end;

procedure TCust_DDD.PopupMenu1Popup(Sender: TObject);
begin
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);
end;

procedure TCust_DDD.aShowBalanceExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  //AParamBlnc.id_ContrAgent := cdsPL_wid_ContrAgent.AsInteger;
  AParamBlnc.DateFrom := (dtFrom.Date);
  AParamBlnc.DateTo := (AParamBlnc.DateFrom) + 1;
  ShowBalance(AParamBlnc);
end;

procedure TCust_DDD.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TCust_DDD.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TCust_DDD.aCollapseNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TCust_DDD.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TCust_DDD.aExportExecute(Sender: TObject);
var S : String;
begin
//  S := S + #13 + #10 + lbInfo.Caption;
  DBTreeListToExcel(dxDBTreeList1, 'ФЛЕКС', nil, 'ИТОГО за период (' + FormatDateTime('dd.mm.yyyy', dtFrom.DateTime) + '-' +
    FormatDateTime('dd.mm.yyyy', dtTo.DateTime) + ')');

  
end;

procedure TCust_DDD.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  DBTreeListToExcel(dxDBTreeList1, S, FFFNode);
end;

procedure TCust_DDD.dsCAPrfLossDataChange(Sender: TObject;
  Field: TField);
begin
  aCollapseAll.Enabled := not cdsCRep.IsEmpty;
  aExpandAll.Enabled := not cdsCRep.IsEmpty;

  aEditCat.Enabled := cdsCRepPID.IsNull and (cdsCRepid_Cat.AsInteger>0);
  aDelCat.Enabled := cdsCRepPID.IsNull and (cdsCRepid_Cat.AsInteger>0);
  
  aOper.Enabled := not cdsCRepid_Oper.IsNull;
end;

destructor TCust_DDD.Destroy;
begin
 // SaveValToRegistry(cbOnlyNotZerro.checked, SRegPath + '\' + Name,  'OnlyNotZerro');
  inherited;

end;

procedure TCust_DDD.aDetailExecute(Sender: TObject);
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

procedure TCust_DDD.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TCust_DDD.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TCust_DDD.BitBtn1Click(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Preview(True, nil);
end;

procedure TCust_DDD.GetAGPrinterInfo;
begin
  dxComponentPrinter1Link2.ReportTitleText := Caption + ' ' + '(' + FormatDateTime('dd-mm-yyyy hh:nn', dtTo.DateTime) + ')'; //'Баланс';
  dxComponentPrinter1Link2.ReportTitleMode := tmOnEveryTopPage;
end;


procedure TCust_DDD.aAddCatExecute(Sender: TObject);
var Aid_Cat : integer;
begin
  Aid_Cat := -1;
  if ShowCR_Cat(Aid_Cat, Fid_Rep) then
    Button1Click(nil); 
end;

procedure TCust_DDD.aEditCatExecute(Sender: TObject);
var Aid_Cat : integer;
begin
  Aid_Cat := cdsCRepid_Cat.AsInteger;
  if ShowCR_Cat(Aid_Cat, Fid_Rep) then
    Button1Click(nil); 
end;

procedure TCust_DDD.aDelCatExecute(Sender: TObject);
begin
    if MessageBox(Handle, PChar('Удалить раздел "' + cdsCRepLS.AsString + '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
    begin
      DM.rsCA.AppServer.CustRep_CatDel(cdsCRepid_Cat.AsInteger);
      Button1Click(nil);
    end;   
end;

procedure TCust_DDD.aOperExecute(Sender: TObject);
var    AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ReadOnly := true;
  AOperParamz.ID_Oper := cdsCRepid_Oper.AsInteger;
  AOperParamz.is_Mirr := false;
  AOperParamz.Correct := false;
  AOperParamz.Copy := false;
  AOperParamz.DelMode := false;
  AOperParamz.RezMode := false;
  AOperParamz.Viza := false;
  AOperParamz.ALevel := 0;

  EditOperFin(Handle, AOperParamz);
end;

procedure TCust_DDD.dxDBTreeList1DblClick(Sender: TObject);
begin
  aOper.Execute;
end;

procedure TCust_DDD.cdsCRepCalcFields(DataSet: TDataSet);
begin
  if not DataSet.FieldByName('PID').IsNull and (DataSet.FieldByName('ID_CAT').AsInteger > 0) then
    DataSet.FieldByName('SR_X').AsFloat := DataSet.FieldByName('SRub').AsFloat;
  if not DataSet.FieldByName('PID').IsNull and (DataSet.FieldByName('ID_CAT').AsInteger > 0) then
    DataSet.FieldByName('SU_X').AsFloat := DataSet.FieldByName('S_USD').AsFloat;

  if not DataSet.FieldByName('DateCreate').IsNUll then
    DataSet.FieldByName('X_DS').AsString := FormatDateTime('dd.mm.yyyy', DataSet.FieldByName('DateCreate').AsDateTime);
 {  DataSet.FieldByName('X_Rub').AsFloat := FormatFloat('### ### ### ##0.00', DataSet.FieldByName('SRub').AsDateTime);
  DataSet.FieldByName('X_USD').AsFloat := FormatFloat('### ### ### ##0.00', DataSet.FieldByName('S_USD').AsDateTime);   }
end;

end.
