unit uBalanceBsn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, dxMasterView, Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons;

type
  TBalanceBsn = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
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
    cdsBalid_Equipment: TIntegerField;
    cdsBalid_Acc: TIntegerField;
    cdsBalid_Manufact: TIntegerField;
    cdsBalid_Raw: TIntegerField;
    cdsBalid_ExtRaw: TIntegerField;
    cdsBalid_Service: TIntegerField;
    cdsBalid_Goods: TIntegerField;
    cdsBalid_CAGroup: TIntegerField;
    dxMasterView2: TdxMasterView;
    DeltaStyle: TdxMasterViewStyle;
    FirstLevel: TdxMasterViewStyle;
    ErrorDelta: TdxMasterViewStyle;
    dxMasterView2Level1: TdxMasterViewLevel;
    dxMasterView2Level1RowName: TdxMasterViewColumn;
    dxMasterView2Level1OperSummSysCur: TdxMasterViewColumn;
    dxMasterView2Level1OrdNum: TdxMasterViewColumn;
    dxMasterView2Level2: TdxMasterViewLevel;
    dxMasterView2Level2RowName: TdxMasterViewColumn;
    dxMasterView2Level2OperSummSysCur: TdxMasterViewColumn;
    dxMasterView2Level2OrdNum: TdxMasterViewColumn;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    dtTo: TDateTimePicker;
    Label2: TLabel;
    Button1: TButton;
    dxComponentPrinter1: TdxComponentPrinter;
    dxDBTreeList1: TdxDBTreeList;
    dxDBTreeList1ID: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Rr: TdxDBTreeListMaskColumn;
    dxDBTreeList1RowName: TdxDBTreeListMaskColumn;
    dxDBTreeList1OrdNum: TdxDBTreeListMaskColumn;
    dxDBTreeList1isTotal: TdxDBTreeListCheckColumn;
    dxDBTreeList1OperSummSysCur: TdxDBTreeListMaskColumn;
    Splitter1: TSplitter;
    dxPrintDialog1: TdxPrintDialog;
    dxComponentPrinter1Link1: TdxDBTreeListReportLink;
    ActionList1: TActionList;
    ilButtons: TImageList;
    aPrint: TAction;
    BitBtn1: TBitBtn;
    Button3: TButton;
    dxComponentPrinter2: TdxComponentPrinter;
    dxComponentPrinter1Link2: TdxDBTreeListReportLink;
    procedure dxMasterView2Level1FilterRecord(Sender: TdxMasterViewLevel;
      const AID, AKeyValue: Variant; var Accept: Boolean);
    procedure dxMasterView2Level1RowNameGetContentStyle(
      Sender: TdxMasterViewColumn; Node: TdxMasterViewNode;
      var NewStyle: TdxMasterViewStyle);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure dxDBTreeList1CustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dxMasterView2Level2Expanding(Sender: TdxMasterViewLevel;
      Node: TdxMasterViewNode; var Allow: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    procedure Initialize(id_business : Variant; ADate : Variant);
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure ShowBlnBsn(id_business : Variant; ADate : Variant);

var
  BalanceBsn: TBalanceBsn;

implementation

uses uDM;

{$R *.DFM}

procedure ShowBlnBsn(id_business : Variant; ADate : Variant);
var F : TBalanceBsn;
begin
  F := TBalanceBsn.Create(nil);
  try
    F.Initialize(id_business, ADate);
    F.Show;
  except
    F.Free;
  end;
end;

{ TBalanceBsn }

procedure TBalanceBsn.Initialize(id_business: Variant; ADate: Variant);
begin
  fBsnSelector1.ID := id_business;
  Screen.Cursor := crSQLWait;
  try
    with cdsBal do
    begin
      Close;
      Params.ParamByName('@id_business').Value := id_business;
      Params.ParamByName('@Date').Value := ADate;

      if id_business = Null then
        Exit;
      Open;
    end;
 //   dxMasterView2.Items.Expand(true);
 //   dxMasterView2.Items.Collapse(true);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TBalanceBsn.dxMasterView2Level1FilterRecord(
  Sender: TdxMasterViewLevel; const AID, AKeyValue: Variant;
  var Accept: Boolean);
begin
  Accept := Sender.DataSet.FieldByName('id_Rr').IsNull;
end;

procedure TBalanceBsn.dxMasterView2Level1RowNameGetContentStyle(
  Sender: TdxMasterViewColumn; Node: TdxMasterViewNode;
  var NewStyle: TdxMasterViewStyle);
var
  ColInd: Integer;
begin
  ColInd := dxMasterView2Level1OrdNum.Index;
  if Node.NodeType = ntData then
  begin
    if (Node.Level = dxMasterView2Level1) then   // Верхний уровень
    begin
      if (Node.Values[ColInd] = 110) then
      begin
        if (ABS(Node.Values[dxMasterView2Level1OperSummSysCur.Index]) > 0.01) then
          NewStyle := ErrorDelta
        else
          NewStyle := DeltaStyle;
      end
      else
        NewStyle := FirstLevel;
    end;
  end;
end;

procedure TBalanceBsn.Button1Click(Sender: TObject);
var id_business : Variant;
    ADate : Variant;
begin
  id_business := fBsnSelector1.ID;
  if dtTo.Checked then
    ADate := Int(dtTo.Date) - 1
  else
    ADate := Null;
  Initialize(id_business, ADate);
end;

constructor TBalanceBsn.Create(AOwner: TCOmponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  dtTo.Date := Now;
  dtTo.Checked := false;

end;

procedure TBalanceBsn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TBalanceBsn.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TBalanceBsn.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TBalanceBsn.dxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  ColInd: Integer;
begin
  ColInd := dxDBTreeList1OrdNum.Index;
    if (ANode.Parent = nil) then   // Верхний уровень
    begin
      AFont.Style := AFont.Style + [fsBold];
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
        if not ASelected then
          AColor := $00E0E2E4;
    end;
end;

procedure TBalanceBsn.dxMasterView2Level2Expanding(
  Sender: TdxMasterViewLevel; Node: TdxMasterViewNode; var Allow: Boolean);
var NewLV : TdxMasterViewLevel;
begin
  if not Sender.HasChildren then
  begin
    NewLV := Sender.Add;
    NewLV.Assign(Sender);
  end;
end;

procedure TBalanceBsn.Button3Click(Sender: TObject);
begin
  dxComponentPrinter2.Preview(True,nil);
end;

procedure TBalanceBsn.aPrintExecute(Sender: TObject);
begin
  dxComponentPrinter2.Print(True,nil,nil);
end;

end.
