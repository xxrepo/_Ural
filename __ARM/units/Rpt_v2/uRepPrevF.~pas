unit uRepPrevF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient,  Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons, Menus, Mask, ToolEdit, CurrEdit, DBGridEh,
  GridsEh;

type
  TRepPrevF = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    dsRep: TDataSource;
    cdsRepPrevF: TClientDataSet;
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
    Splitter1: TSplitter;
    Timer1: TTimer;
    cdsRepPrevFID: TAutoIncField;
    cdsRepPrevFid_Project: TIntegerField;
    cdsRepPrevFPrjNum: TIntegerField;
    cdsRepPrevFOwnName: TStringField;
    cdsRepPrevFName: TStringField;
    cdsRepPrevFKomposit: TStringField;
    cdsRepPrevFAmount2: TBCDField;
    cdsRepPrevFInv1: TFloatField;
    cdsRepPrevFInv2: TFloatField;
    cdsRepPrevFInvDelta: TBCDField;
    cdsRepPrevFPrice: TBCDField;
    cdsRepPrevFPriceDeltaPlan: TBCDField;
    cdsRepPrevFPriceDeltaFact: TBCDField;
    cdsRepPrevFInvPrev1: TBCDField;
    cdsRepPrevFInvPrev2: TBCDField;
    cdsRepPrevFInvPrevDelta: TBCDField;
    cdsRepPrevFPlenkaNKlisheTotal: TBCDField;
    cdsRepPrevFPlenkaNKlisheDelta: TBCDField;
    cdsRepPrevFAmount1: TBCDField;
    cdsRepPrevFCalcDate: TDateTimeField;
    cdsRepPrevFCheckDate: TDateTimeField;
    cdsRepPrevFID_Main: TIntegerField;
    cdsRepPrevFFIO: TStringField;
    cdsRepPrevFFIOFFF: TStringField;
    cdsRepPrevFRaw_Form2: TFloatField;
    cdsRepPrevFRaw_Print2: TFloatField;
    cdsRepPrevFXXX: TIntegerField;
    Label3: TLabel;
    cbLineNum: TComboBox;
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
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private

  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize ;
    procedure CreateParams(var Params: TCreateParams); override;
    function GetYear : integer;
  end;

procedure ShowRepPrevF;

var
  RepPrevF: TRepPrevF;

implementation

uses uDM, foMyFunc, foMyFuncDXTreeExcel, uBalance, uCAPrfLoss_Det,
  foMyFuncEh, foMyFuncEhExcel, uRepLossDet, uFormApi_Oper, uInvMain;

{$R *.DFM}

procedure ShowRepPrevF;
var F : TRepPrevF;
begin
  F := TRepPrevF.Create(nil);
  try
    F.Show;
    F.Paint;
    F.Initialize;
  except
    F.Free;
  end;
end;

{ TBalanceBsn }


procedure TRepPrevF.Initialize ;
begin
  Screen.Cursor := crSQLWait;
  try
    with cdsRepPrevF do
    begin
      Close;
      Params.ParamByName('@Year').Value := GetYear;
      Params.ParamByName('@M').Value := cbM.ItemIndex + 1;
      if cbLineNum.ItemIndex <= 0 then
      begin
        Caption := 'Планируемая фактическая прибыль - все линии';
        Params.ParamByName('@LineNum').Value := null
      end
      else
      begin
        Params.ParamByName('@LineNum').Value := cbLineNum.ItemIndex;
        Caption := 'Планируемая фактическая прибыль - линия ' + cbLineNum.Text;
      end;
      
      Open;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TRepPrevF.Button1Click(Sender: TObject);
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

constructor TRepPrevF.Create(AOwner: TCOmponent);
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
  for i := 2014 to Year do
  begin
    cbYear.Items.Add(IntToStr(i));
  end;
  cbYear.ItemIndex := cbYear.Items.Count - 1;
end;

procedure TRepPrevF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TRepPrevF.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TRepPrevF.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TRepPrevF.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  index := Node.ImageIndex;
end;

procedure TRepPrevF.aExportExecute(Sender: TObject);
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

destructor TRepPrevF.Destroy;
begin
  inherited;

end;

procedure TRepPrevF.aDetailExecute(Sender: TObject);
var ID : integer;
begin
  ID := cdsRepPrevFid_Project.AsInteger;
  ShowInvMain(Handle, ID);
end;

procedure TRepPrevF.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\q' + ClassName);
  SaveEhGridSettingsToRegistry(DBGridEh1, SRegPath + '\q' + ClassName);
end;

procedure TRepPrevF.FormShow(Sender: TObject);
begin
  LoadEhGridSettingsFromRegistry(DBGridEh1, SRegPath + '\q' + ClassName );
  LoadFormSettingsToRegistry(Self, SRegPath + '\q' + ClassName);
end;



function TRepPrevF.GetYear: integer;
begin
  if cbYear.ItemIndex = -1 then
    Result := 0
  else
    Result := StrToInt(cbYear.Items[cbYear.ItemIndex]);
end;

procedure TRepPrevF.dsRepDataChange(Sender: TObject; Field: TField);
begin
  aDetail.Enabled := not cdsRepPrevF.IsEmpty;
  aExport.Enabled := not cdsRepPrevF.IsEmpty;
end;

procedure TRepPrevF.DBGridEh1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGridEh(Sender).ScreenToClient(P);
  if P.y <= THackGridEh(Sender).RowHeights[0] then
    Exit;
  aDetail.Execute;
end;

procedure TRepPrevF.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if cdsRepPrevFXXX.AsInteger = 0 then
  begin
    AFont.Style := [fsbold];
    Background := clMenu;
  end;
end;

end.
