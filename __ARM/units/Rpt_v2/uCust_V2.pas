unit uCust_V2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons, Menus, Mask, ToolEdit, CurrEdit, dxGrClms,
  ToolWin;

type
  TCust_V2 = class(TForm)
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
    Excel1: TMenuItem;
    BitBtn5: TBitBtn;
    dtTo: TDateTimePicker;
    Label1: TLabel;
    dtFrom: TDateTimePicker;
    Label2: TLabel;
    dxDBTreeList1id_Cat: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Oper: TdxDBTreeListMaskColumn;
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
    cdsCRepID: TAutoIncField;
    cdsCRepPID: TIntegerField;
    cdsCRepALevel: TIntegerField;
    cdsCRepXXX: TIntegerField;
    cdsCRepid_Cat: TIntegerField;
    cdsCRepOrdNum: TIntegerField;
    cdsCRepGrpOper: TBooleanField;
    cdsCRepName: TStringField;
    cdsCRepF_OperVid: TStringField;
    cdsCRepF_id_ContrAgent: TStringField;
    cdsCRepid_Oper: TIntegerField;
    cdsCRepDateCreate: TDateTimeField;
    cdsCRepS_IN: TFloatField;
    cdsCRepS_OUT: TFloatField;
    cdsCRepExtStr: TStringField;
    cdsCRepid_FormalDistrib: TIntegerField;
    cdsCRepid_FuncDistrib: TIntegerField;
    cdsCRepid_Acc: TIntegerField;
    dxDBTreeList1Name: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_IN: TdxDBTreeListMaskColumn;
    dxDBTreeList1S_OUT: TdxDBTreeListMaskColumn;
    cdsCRepAPlan: TFloatField;
    cdsCRepD1: TFloatField;
    cdsCRepD_PL: TFloatField;
    dxDBTreeList1APlan: TdxDBTreeListMaskColumn;
    dxDBTreeList1D1: TdxDBTreeListColumn;
    dxDBTreeList1D_PL: TdxDBTreeListColumn;
    N14: TMenuItem;
    aAddCh: TAction;
    cdsCRepSS_IN: TFloatField;
    cdsCRepSS_OUT: TFloatField;
    cdsCRepSS_D1: TFloatField;
    cdsCRepSS_PL: TFloatField;
    cdsCRepSS_APLan: TFloatField;
    aDet: TAction;
    N6: TMenuItem;
    aFoget: TAction;
    N15: TMenuItem;
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
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure aAddCatExecute(Sender: TObject);
    procedure aEditCatExecute(Sender: TObject);
    procedure aDelCatExecute(Sender: TObject);
    procedure aOperExecute(Sender: TObject);
    procedure dxDBTreeList1DblClick(Sender: TObject);
    procedure cdsCRepCalcFields(DataSet: TDataSet);
    procedure aAddChExecute(Sender: TObject);
    procedure aDetExecute(Sender: TObject);
    procedure aFogetExecute(Sender: TObject);
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

procedure ShowCust_v2(id_Rep : integer);

var
  Cust_V2: TCust_V2;

implementation

uses uDM, foMyFunc, foMyFuncDXTreeExcel, uBalance, uCAPrfLoss_Det,
  uFormApi_Oper, uCRepCat_v2, uBlnDetail_2;

{$R *.DFM}

procedure ShowCust_v2(id_Rep : integer);
var F : TCust_V2;
begin
  F := TCust_V2.Create(nil);
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


function TCust_V2.GetBlnDateTime_int(ATo : boolean): Variant;
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

procedure TCust_V2.SetChecked;
begin
  dtFrom.Checked := true;
  dtFrom.Checked := false;

end;

procedure TCust_V2.SetCapt;
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


procedure TCust_V2.GetIDS(var ID, ID_Ctg : Variant);
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

procedure TCust_V2.SelectEvent(ID, ID_Ctg : integer);
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

procedure TCust_V2.Initialize(id_Rep : integer);
var V : Variant;
begin
  Fid_Rep := id_Rep;
//  V := DM.rsCA.AppServer.CustRep_RepGetProp(Fid_Rep);

  //Caption := VarToStr(V);
end;

procedure TCust_V2.Initialize_Int;
begin

  Screen.Cursor := crSQLWait;
  try
    with cdsCRep do
    begin
      Close;
      Params.ParamByName('@DateFrom').Value := GetBlnDateTime_int(false);
      Params.ParamByName('@DateTo').Value := GetBlnDateTime_int(true);
      Params.ParamByName('@id_Rep').Value := Fid_Rep;
      Params.ParamByName('@id_X').Value := -1;
      Params.ParamByName('@V').Value := 2;

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


procedure TCust_V2.Button1Click(Sender: TObject);
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

constructor TCust_V2.Create(AOwner: TCOmponent);
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
  dxDBTreeList1.RegistryPath := SRegPath + '\q' + ClassName + Inttostr(Fid_Rep);
  dxDBTreeList1.OptionsBehavior := dxDBTreeList1.OptionsBehavior + [etoStoreToRegistry];
end;

procedure TCust_V2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TCust_V2.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TCust_V2.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TCust_V2.dxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  ColInd: Integer;
begin
 // ColInd := dxDBTreeList1id_ContrAgent.Index;
    if ANode.HasChildren then
      AFont.Style := AFont.Style + [fsBold];
    if (ANode.Parent = nil) then   // Верхний уровень
    begin
      if not ASelected then
        AColor := $00D7D700;
    end;
end;

procedure TCust_V2.aPrintExecute(Sender: TObject);
begin
  dxComponentPrinter2.Print(True,nil,nil);
end;

procedure TCust_V2.dxDBTreeList1GetImageIndex(Sender: TObject;
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

procedure TCust_V2.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  index := Node.ImageIndex;
end;

procedure TCust_V2.dxDBTreeList1ChangeNode(Sender: TObject;
  OldNode, Node: TdxTreeListNode);
begin
  FFFNode := Node;
end;

procedure TCust_V2.PopupMenu1Popup(Sender: TObject);
begin
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);

  aDet.Enabled := (FFFNode <> Nil) and (not FFFNode.HasChildren) and
   ( (FFFNode.Values[dxDBTreeList1id_Cat.Index] > 0)
   or (FFFNode.Values[dxDBTreeList1id_Cat.Index] = -11)
   or (FFFNode.Values[dxDBTreeList1id_Cat.Index] = -12)
   or (FFFNode.Values[dxDBTreeList1id_Cat.Index] = -13)
   );
end;

procedure TCust_V2.aShowBalanceExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  //AParamBlnc.id_ContrAgent := cdsPL_wid_ContrAgent.AsInteger;
  AParamBlnc.DateFrom := (dtFrom.Date);
  AParamBlnc.DateTo := (AParamBlnc.DateFrom) + 1;
  ShowBalance(AParamBlnc);
end;

procedure TCust_V2.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TCust_V2.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TCust_V2.aCollapseNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TCust_V2.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TCust_V2.aExportExecute(Sender: TObject);
var S : String;
begin
//  S := S + #13 + #10 + lbInfo.Caption;
  DBTreeListToExcel(dxDBTreeList1, 'ФЛЕКС', nil, 'ИТОГО за период (' + FormatDateTime('dd.mm.yyyy', dtFrom.DateTime) + '-' +
    FormatDateTime('dd.mm.yyyy', dtTo.DateTime) + ')');

  
end;

procedure TCust_V2.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  DBTreeListToExcel(dxDBTreeList1, S, FFFNode);
end;

procedure TCust_V2.dsCAPrfLossDataChange(Sender: TObject;
  Field: TField);
begin
  aCollapseAll.Enabled := not cdsCRep.IsEmpty;
  aExpandAll.Enabled := not cdsCRep.IsEmpty;

  aEditCat.Enabled := (cdsCRepid_Cat.AsInteger>0);
  aDelCat.Enabled := (cdsCRepid_Cat.AsInteger>0);
  
  aOper.Enabled := not cdsCRepid_Oper.IsNull;
  aAddCh.Enabled := (cdsCRepid_Cat.AsInteger>0);

  aFoget.Enabled := not cdsCRep.IsEmpty;
end;

destructor TCust_V2.Destroy;
begin
 // SaveValToRegistry(cbOnlyNotZerro.checked, SRegPath + '\' + Name,  'OnlyNotZerro');
  inherited;

end;

procedure TCust_V2.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TCust_V2.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TCust_V2.BitBtn1Click(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Preview(True, nil);
end;

procedure TCust_V2.GetAGPrinterInfo;
begin
  dxComponentPrinter1Link2.ReportTitleText := Caption + ' ' + '(' + FormatDateTime('dd-mm-yyyy hh:nn', dtTo.DateTime) + ')'; //'Баланс';
  dxComponentPrinter1Link2.ReportTitleMode := tmOnEveryTopPage;
end;


procedure TCust_V2.aAddCatExecute(Sender: TObject);
var Aid_Cat : integer;
begin
  Aid_Cat := -1;
  if ShowCR_Cat_v2(Aid_Cat, Fid_Rep, true) then
    Button1Click(nil); 
end;

procedure TCust_V2.aEditCatExecute(Sender: TObject);
var Aid_Cat : integer;
begin
  Aid_Cat := cdsCRepid_Cat.AsInteger;
  if ShowCR_Cat_v2(Aid_Cat, Fid_Rep, true) then
    Button1Click(nil); 
end;

procedure TCust_V2.aDelCatExecute(Sender: TObject);
begin
    if MessageBox(Handle, PChar('Удалить раздел "' + cdsCRepName.AsString + '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
    begin
      DM.rsCA.AppServer.CustRep_CatDel(cdsCRepid_Cat.AsInteger);
      Button1Click(nil);
    end;   
end;

procedure TCust_V2.aOperExecute(Sender: TObject);
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

procedure TCust_V2.dxDBTreeList1DblClick(Sender: TObject);
begin
  aOper.Execute;
end;

procedure TCust_V2.cdsCRepCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('PID').IsNull then
    DataSet.FieldByName('SS_IN').AsFloat := DataSet.FieldByName('S_IN').AsFloat;
  if DataSet.FieldByName('PID').IsNull then
    DataSet.FieldByName('SS_OUT').AsFloat := DataSet.FieldByName('S_OUT').AsFloat;

  if DataSet.FieldByName('PID').IsNull then
    DataSet.FieldByName('SS_D1').AsFloat := DataSet.FieldByName('D1').AsFloat;
  if DataSet.FieldByName('PID').IsNull then
    DataSet.FieldByName('SS_PL').AsFloat := DataSet.FieldByName('D_PL').AsFloat;

  if DataSet.FieldByName('PID').IsNull then
    DataSet.FieldByName('SS_APlan').AsFloat := DataSet.FieldByName('APlan').AsFloat;


  DataSet.FieldByName('D1').AsFloat := DataSet.FieldByName('S_OUT').AsFloat- DataSet.FieldByName('S_In').AsFloat;
  DataSet.FieldByName('D_PL').AsFloat := DataSet.FieldByName('D1').AsFloat- DataSet.FieldByName('APlan').AsFloat;

end;

procedure TCust_V2.aAddChExecute(Sender: TObject);
var Aid_Cat : integer;
begin
  Aid_Cat := -1;
  if ShowCR_Cat_v2(Aid_Cat, Fid_Rep, true, cdsCRepid_Cat.AsInteger) then
    Button1Click(nil); 
end;

procedure TCust_V2.aDetExecute(Sender: TObject);
var ABlnDetail : TBlnDetailData;
begin
  ABlnDetail.DateFrom := GetBlnDateTime_int(false);
  ABlnDetail.DateTo := GetBlnDateTime_int(true);
  ABlnDetail.id_Rep := Fid_Rep;
  ABlnDetail.id_X := cdsCRepid_Cat.AsInteger;

  ShowCRDetail_2(Caption + ' - ' + cdsCRepName.AsString, ABlnDetail);

end;

procedure TCust_V2.aFogetExecute(Sender: TObject);
var ABlnDetail : TBlnDetailData;
begin
  ABlnDetail.DateFrom := GetBlnDateTime_int(false);
  ABlnDetail.DateTo := GetBlnDateTime_int(true);
  ABlnDetail.id_Rep := Fid_Rep;
  ABlnDetail.id_X := -1000;

  ShowCRDetail_2(Caption + ' - ' + 'не определенные операции', ABlnDetail);
end;

end.
