unit uCAByDateLastBay;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons, Menus;

type
  TCAByDateLastBay = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    DataSource1: TDataSource;
    cdsCAByDateLastBay: TClientDataSet;
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
    cdsCAByDateLastBayid_ContrAgent: TIntegerField;
    cdsCAByDateLastBayid_CAGroup: TIntegerField;
    cdsCAByDateLastBayName: TStringField;
    cdsCAByDateLastBayLastDate: TDateTimeField;
    dxDBTreeList1id_ContrAgent: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_CAGroup: TdxDBTreeListMaskColumn;
    dxDBTreeList1Name: TdxDBTreeListMaskColumn;
    dxDBTreeList1LastDate: TdxDBTreeListDateColumn;
    cdsCAByDateLastBayID: TAutoIncField;
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
    BitBtn5: TBitBtn;
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
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    FFFNode : TdxTreeListNode;
    function GetBlnDateTime_int(ATo: boolean): Variant;
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    procedure Initialize(id_business : Variant);
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure ShowCAByDateLastBay(id_business : Variant);

var
  CAByDateLastBay: TCAByDateLastBay;

implementation

uses uDM, foMyFunc, foMyFuncDXTreeExcel, uBalance;

{$R *.DFM}

procedure ShowCAByDateLastBay(id_business : Variant);
var F : TCAByDateLastBay;
begin
  F := TCAByDateLastBay.Create(nil);
  try
    F.Initialize(id_business);
    F.Show;
  except
    F.Free;
  end;
end;

{ TBalanceBsn }


function TCAByDateLastBay.GetBlnDateTime_int(ATo : boolean): Variant;
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

procedure TCAByDateLastBay.Initialize(id_business: Variant);
begin
  fBsnSelector1.ID := id_business;
  Screen.Cursor := crSQLWait;
  try
    with cdsCAByDateLastBay do
    begin
      Close;
      Params.ParamByName('@ID_user').Value := DM.IDUser;
      Params.ParamByName('@id_business').Value := id_business;
      Params.ParamByName('@DateFrom').Value := GetBlnDateTime_int(false);
      Params.ParamByName('@DateTo').Value := GetBlnDateTime_int(true);

      if id_business = Null then
        Exit;
      Open;
    end;
    if dxDBTreeList1.Count > 0 then
    begin
      dxDBTreeList1.Items[0].Focused := true;
      dxDBTreeList1.FullCollapse;
      dxDBTreeList1ChangeNode(dxDBTreeList1, nil, dxDBTreeList1.Items[0]);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TCAByDateLastBay.Button1Click(Sender: TObject);
var id_business : Variant;
begin
  id_business := fBsnSelector1.ID;
  Initialize(id_business);
end;

constructor TCAByDateLastBay.Create(AOwner: TCOmponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  dtFrom.Date := Now - 30;
  dtTo.Date := Now;

end;

procedure TCAByDateLastBay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TCAByDateLastBay.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TCAByDateLastBay.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TCAByDateLastBay.dxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  ColInd: Integer;
begin
  ColInd := cdsCAByDateLastBayid.Index;
    if (ANode.Parent = nil) then   // Верхний уровень
    begin
      if not ASelected then
        AColor := $00E0E2E4;
      {AFont.Style := AFont.Style + [fsBold];
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
          AColor := $00E0E2E4;   }
    end;
end;

procedure TCAByDateLastBay.aPrintExecute(Sender: TObject);
begin
  dxComponentPrinter2.Print(True,nil,nil);
end;

procedure TCAByDateLastBay.dxDBTreeList1GetImageIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  if (Node <> nil) then
  begin
    if Node.Parent = nil then
      Index := 1
    else
      Index := 0;
  end;
end;

procedure TCAByDateLastBay.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  index := Node.ImageIndex;
end;

procedure TCAByDateLastBay.dxDBTreeList1ChangeNode(Sender: TObject;
  OldNode, Node: TdxTreeListNode);
begin
  FFFNode := Node;
end;

procedure TCAByDateLastBay.PopupMenu1Popup(Sender: TObject);
begin
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);
end;

procedure TCAByDateLastBay.aShowBalanceExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_ContrAgent := cdsCAByDateLastBayid_ContrAgent.AsInteger;
  AParamBlnc.DateFrom := cdsCAByDateLastBayLastDate.AsVariant;
  AParamBlnc.DateTo := AParamBlnc.DateFrom;
  ShowBalance(AParamBlnc);
end;

procedure TCAByDateLastBay.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TCAByDateLastBay.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TCAByDateLastBay.aCollapseNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TCAByDateLastBay.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TCAByDateLastBay.aExportExecute(Sender: TObject);
var S : String;
begin
  S := fBsnSelector1.BsnName; //'Баланс';
//  S := S + #13 + #10 + lbInfo.Caption;
  DBTreeListToExcel(dxDBTreeList1, S);
end;

procedure TCAByDateLastBay.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  S := fBsnSelector1.BsnName; //'Баланс';
  DBTreeListToExcel(dxDBTreeList1, S, FFFNode);
end;

procedure TCAByDateLastBay.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  aCollapseAll.Enabled := not cdsCAByDateLastBay.IsEmpty;
  aExpandAll.Enabled := not cdsCAByDateLastBay.IsEmpty;
  aShowBalance.Visible := not cdsCAByDateLastBay.FieldByName('id_ContrAgent').IsNull;
end;

end.
