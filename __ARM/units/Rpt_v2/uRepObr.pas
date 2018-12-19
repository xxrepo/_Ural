unit uRepObr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient,  Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons, Menus, Mask, ToolEdit, CurrEdit, DBGridEh,
  GridsEh;

type
  TRepObr = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    dsRep: TDataSource;
    cdsRep: TClientDataSet;
    Panel1: TPanel;
    Button1: TButton;
    ilButtons: TImageList;
    ilEM: TImageList;
    ActionList1: TActionList;
    aExport: TAction;
    PopupMenu1: TPopupMenu;
    aDetail: TAction;
    Excel1: TMenuItem;
    BitBtn5: TBitBtn;
    Label1: TLabel;
    cbYear: TComboBox;
    DBGridEh1: TDBGridEh;
    cbM: TComboBox;
    Label2: TLabel;
    cdsDet: TClientDataSet;
    dsDet: TDataSource;
    cdsDetid_Oper: TIntegerField;
    cdsDetDateCreate: TDateTimeField;
    cdsDetAmountOper: TFloatField;
    cdsDetPriceOper: TFloatField;
    cdsDetSummOper: TFloatField;
    cdsDetTypeName: TStringField;
    cdsDetGoodsName: TStringField;
    cdsDetSrcName: TStringField;
    cdsDetReprName: TStringField;
    cdsDetOType: TStringField;
    cdsDetid_Warehouse: TIntegerField;
    cdsDetid_Manufact: TIntegerField;
    cdsDetid_Warehouse_Ext: TIntegerField;
    cdsDetid_Manufact_Ext: TIntegerField;
    cdsDetOpComment: TStringField;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    Timer1: TTimer;
    PopupMenu2: TPopupMenu;
    aExpor2: TAction;
    Excel2: TMenuItem;
    cdsRepOrdNum: TStringField;
    cdsRepMinDateCreate: TDateTimeField;
    cdsRepAmountFact: TBCDField;
    cdsRepSummProd: TBCDField;
    cdsRepSummRaw: TBCDField;
    cdsRepSummOther: TBCDField;
    cdsRepid_Goods: TIntegerField;
    cdsRepCAName: TStringField;
    cdsRepProdName: TStringField;
    cdsRepOtherName: TStringField;
    cdsRepCnt: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure dxDBTreeList1GetSelectedIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure aExportExecute(Sender: TObject);
    procedure aDetailExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsRepDataChange(Sender: TObject; Field: TField);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure aExpor2Execute(Sender: TObject);
  private

  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize ;
    procedure CreateParams(var Params: TCreateParams); override;
    function GetYear : integer;
  end;

procedure ShowRepObr;

var
  RepObr: TRepObr;

implementation

uses uDM, foMyFunc, foMyFuncDXTreeExcel, uBalance, uCAPrfLoss_Det,
  foMyFuncEh, foMyFuncEhExcel, uRepLossDet, uFormApi_Oper;

{$R *.DFM}

procedure ShowRepObr;
var F : TRepObr;
begin
  F := TRepObr.Create(nil);
  try
    F.Show;
    F.Paint;
    F.Initialize;
  except
    F.Free;
  end;
end;

{ TBalanceBsn }


procedure TRepObr.Initialize ;
begin
  Screen.Cursor := crSQLWait;
  try
    with cdsRep do
    begin
      Close;
      Params.ParamByName('@Year').Value := GetYear;
      Params.ParamByName('@M').Value := cbM.ItemIndex + 1;
      Params.ParamByName('@OrdNum').Value := null;
      Open;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TRepObr.Button1Click(Sender: TObject);
var id_business : Variant;
    ID, ID_Ctg : Variant;
begin
  if cbM.ItemIndex = -1 then
    raise Exception.Create('Не выбран месяц');
  try
    Initialize();
  finally
  end;
end;

constructor TRepObr.Create(AOwner: TCOmponent);
var V : Variant;
    Year, Month, Day : Word;
    i : integer;
begin
  inherited;
  LoadValFromRegistry(V, SRegPath + '\' + Name,  'OnlyNotZerro');

  SetWindowLong(Handle, GWL_HWNDPARENT, 0);

  DecodeDate(Now, Year, Month, Day);
  cbYear.Clear;
  Month := Month - 1;
  if Month = -1 then Month := 11;
  cbM.ItemIndex := Month;
  for i := 2013 to Year do
  begin
    cbYear.Items.Add(IntToStr(i));
  end;
  cbYear.ItemIndex := cbYear.Items.Count - 1;
end;

procedure TRepObr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TRepObr.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TRepObr.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TRepObr.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  index := Node.ImageIndex;
end;

procedure TRepObr.aExportExecute(Sender: TObject);
var S : String;
begin
  Enabled := false;
  Repaint;
  try
    GreedToExcel(DBGridEh1, Caption)
  finally
    Enabled := true;
  end;
end;

destructor TRepObr.Destroy;
begin
  inherited;

end;

procedure TRepObr.aDetailExecute(Sender: TObject);
var ABlnDetail : TLossDetailData;
begin
end;

procedure TRepObr.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\q' + ClassName);
  SaveEhGridSettingsToRegistry(DBGridEh1, SRegPath + '\q' + ClassName);
end;

procedure TRepObr.FormShow(Sender: TObject);
begin
  LoadEhGridSettingsFromRegistry(DBGridEh1, SRegPath + '\q' + ClassName );
  LoadFormSettingsToRegistry(Self, SRegPath + '\q' + ClassName);
end;



function TRepObr.GetYear: integer;
begin
  if cbYear.ItemIndex = -1 then
    Result := 0
  else
    Result := StrToInt(cbYear.Items[cbYear.ItemIndex]);
end;

procedure TRepObr.dsRepDataChange(Sender: TObject; Field: TField);
begin
  aDetail.Enabled := not cdsRep.IsEmpty;
  aExport.Enabled := not cdsRep.IsEmpty;
  Timer1.Enabled := false;
  cdsDet.Close;
end;

procedure TRepObr.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;

  with cdsDet do
  begin
    Close;
    if not cdsRep.Active then Exit;
    if cdsRep.IsEmpty then Exit;
    Params.ParamByName('@Year').Value := cdsRep.Params.ParamByName('@Year').Value;
    Params.ParamByName('@M').Value := cdsRep.Params.ParamByName('@M').Value;
    Params.ParamByName('@OrdNum').Value := cdsRepOrdNum.Value;
    Open;
  end;
end;

procedure TRepObr.DBGridEh2DblClick(Sender: TObject);
var P : TPoint;
    AOperParamz : TOperParamz;
begin
  P := Mouse.CursorPos;
  P := THackGridEh(Sender).ScreenToClient(P);
  if P.y <= THackGridEh(Sender).RowHeights[0] then
    Exit;
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ID_Oper := cdsDetid_Oper.AsInteger;
  EditOperWare(Handle, AOperParamz);
end;

procedure TRepObr.DBGridEh1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGridEh(Sender).ScreenToClient(P);
  if P.y <= THackGridEh(Sender).RowHeights[0] then
    Exit;
  Timer1.Enabled := not cdsRep.IsEmpty;
end;

procedure TRepObr.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if cdsRepCnt.AsInteger > 0 then AFont.Color := clGrayText;
end;

procedure TRepObr.aExpor2Execute(Sender: TObject);
var S : String;
begin
  Enabled := false;
  Repaint;
  try
    GreedToExcel(DBGridEh2, Caption)
  finally
    Enabled := true;
  end;
end;

end.
