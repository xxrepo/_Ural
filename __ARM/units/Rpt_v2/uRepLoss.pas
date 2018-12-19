unit uRepLoss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient,  Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons, Menus, Mask, ToolEdit, CurrEdit, DBGridEh,
  GridsEh;

type
  TRepLoss = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    dsRep: TDataSource;
    cdsRep: TClientDataSet;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    Button1: TButton;
    ilButtons: TImageList;
    ilEM: TImageList;
    ActionList1: TActionList;
    aExport: TAction;
    PopupMenu1: TPopupMenu;
    aDetail: TAction;
    N1: TMenuItem;
    Excel1: TMenuItem;
    BitBtn5: TBitBtn;
    Label1: TLabel;
    cbYear: TComboBox;
    cdsRepID: TAutoIncField;
    cdsRepPID: TIntegerField;
    cdsRepForOrder: TIntegerField;
    cdsRepName: TStringField;
    cdsRepParentName: TStringField;
    cdsRepM1_C: TFloatField;
    cdsRepM1_NC: TFloatField;
    cdsRepM1_TOTAL: TFloatField;
    cdsRepM2_C: TFloatField;
    cdsRepM2_NC: TFloatField;
    cdsRepM2_TOTAL: TFloatField;
    cdsRepM3_C: TFloatField;
    cdsRepM3_NC: TFloatField;
    cdsRepM3_TOTAL: TFloatField;
    cdsRepM4_C: TFloatField;
    cdsRepM4_NC: TFloatField;
    cdsRepM4_TOTAL: TFloatField;
    cdsRepM5_C: TFloatField;
    cdsRepM5_NC: TFloatField;
    cdsRepM5_TOTAL: TFloatField;
    cdsRepM6_C: TFloatField;
    cdsRepM6_NC: TFloatField;
    cdsRepM6_TOTAL: TFloatField;
    cdsRepM7_C: TFloatField;
    cdsRepM7_NC: TFloatField;
    cdsRepM7_TOTAL: TFloatField;
    cdsRepM8_C: TFloatField;
    cdsRepM8_NC: TFloatField;
    cdsRepM8_TOTAL: TFloatField;
    cdsRepM9_C: TFloatField;
    cdsRepM9_NC: TFloatField;
    cdsRepM9_TOTAL: TFloatField;
    cdsRepM10_C: TFloatField;
    cdsRepM10_NC: TFloatField;
    cdsRepM10_TOTAL: TFloatField;
    cdsRepM11_C: TFloatField;
    cdsRepM11_NC: TFloatField;
    cdsRepM11_TOTAL: TFloatField;
    cdsRepM12_C: TFloatField;
    cdsRepM12_NC: TFloatField;
    cdsRepM12_TOTAL: TFloatField;
    cdsRepY_C: TFloatField;
    cdsRepY_NC: TFloatField;
    cdsRepY_TOTAL: TFloatField;
    cdsRepAVG_C: TFloatField;
    cdsRepAVG_NC: TFloatField;
    cdsRepAVG_TOTAL: TFloatField;
    DBGridEh1: TDBGridEh;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure dxDBTreeList1GetSelectedIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure aExportExecute(Sender: TObject);
    procedure aNodeExpExecute(Sender: TObject);
    procedure aDetailExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure dsRepDataChange(Sender: TObject; Field: TField);
    procedure Button2Click(Sender: TObject);
  private
    FRepNum : integer;
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(RepNum : integer);
    procedure CreateParams(var Params: TCreateParams); override;
    function GetYear : integer;
  end;

procedure ShowRepLoss(RepNum : integer);

var
  RepLoss: TRepLoss;

implementation

uses uDM, foMyFunc, foMyFuncDXTreeExcel, uBalance, uCAPrfLoss_Det,
  foMyFuncEh, foMyFuncEhExcel, uRepLossDet;

{$R *.DFM}

procedure ShowRepLoss(RepNum : integer);
var F : TRepLoss;
begin
  F := TRepLoss.Create(nil);
  try
    F.FRepNum := RepNum;
    F.Show;
    F.Paint;
    F.Initialize(RepNum);
  except
    F.Free;
  end;
end;

{ TBalanceBsn }


procedure TRepLoss.Initialize(RepNum : integer);
begin
  FRepNum := RepNum;
  case FRepNum of
    100 : Caption := 'Налоги';
    200 : Caption := 'Затраты по офисам';
    300 : Caption := 'Сводный отчет по затратам';
    400 : Caption := 'Расходы производства';
    500 : Caption := 'Сравнение ежемесячных результатов';
  end;
  
  Screen.Cursor := crSQLWait;
  try
    with cdsRep do
    begin
      Close;
      Params.ParamByName('@id_business').Value := -fBsnSelector1.ID;
      Params.ParamByName('@RepNum').Value := FRepNum;
      Params.ParamByName('@Year').Value := GetYear;
      Params.ParamByName('@Str3').Value := Null;
      Params.ParamByName('@Str4').Value := Null;
      Params.ParamByName('@M').Value := Null;
      if (Params.ParamByName('@Year').Value = 0) or (fBsnSelector1.ID<0) then
        Exit
      else
      Open;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TRepLoss.Button1Click(Sender: TObject);
var id_business : Variant;
    ID, ID_Ctg : Variant;
begin
  try
    Initialize(FRepNum);
  finally
  end;
end;

constructor TRepLoss.Create(AOwner: TCOmponent);
var V : Variant;
    Year, Month, Day : Word;
    i : integer;
begin
  inherited;
  LoadValFromRegistry(V, SRegPath + '\' + Name,  'OnlyNotZerro');

  SetWindowLong(Handle, GWL_HWNDPARENT, 0);

  DecodeDate(Now, Year, Month, Day);
  cbYear.Clear;
  for i := 2009 to Year do
  begin
    cbYear.Items.Add(IntToStr(i));
  end;
  cbYear.ItemIndex := cbYear.Items.Count - 1;
end;

procedure TRepLoss.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TRepLoss.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TRepLoss.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TRepLoss.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  index := Node.ImageIndex;
end;

procedure TRepLoss.aExportExecute(Sender: TObject);
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

procedure TRepLoss.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  S := fBsnSelector1.BsnName; //'Баланс';
end;

destructor TRepLoss.Destroy;
begin
  inherited;

end;

procedure TRepLoss.aDetailExecute(Sender: TObject);
var ABlnDetail : TLossDetailData;
begin
  ABlnDetail.id_business := fBsnSelector1.ID;
  ABlnDetail.RepNum := fRepNum;
  ABlnDetail.Year := GetYear;
  if cdsRepPID.IsNull then
    ABlnDetail.Str4 := ''
  else
    ABlnDetail.Str4 := trim(cdsRepName.AsString);
  if cdsRepPID.IsNull then
    ABlnDetail.Str3 := trim(cdsRepName.AsString)
  else
    ABlnDetail.Str3 := trim(cdsRepParentName.AsString);

  ABlnDetail.M := trunc((DBGridEh1.Col-1)/3 + 0.8);
  ShowBlnDetail_3(Caption + ' ' + cdsRepParentName.AsString + '/' + trim(cdsRepName.AsString)
   + ', месяц ' + StringReplace(StringReplace(StringReplace(DBGridEh1.Columns[DBGridEh1.Col - 1].Title.Caption, '|Нал', '', []), '|Безнал', '', []), '|Всего', '', [])
   , ABlnDetail);
end;

procedure TRepLoss.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
  SaveEhGridSettingsToRegistry(DBGridEh1, SRegPath + '\' + ClassName + IntToStr(FRepNum));
end;

procedure TRepLoss.FormShow(Sender: TObject);
begin
  LoadEhGridSettingsFromRegistry(DBGridEh1, SRegPath + '\' + ClassName + IntToStr(FRepNum));
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;



function TRepLoss.GetYear: integer;
begin
  if cbYear.ItemIndex = -1 then
    Result := 0
  else
    Result := StrToInt(cbYear.Items[cbYear.ItemIndex]);
end;

procedure TRepLoss.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin                
  if cdsRepPID.IsNull then
  begin
    AFont.Style := [fsBold];
  end;
end;

procedure TRepLoss.dsRepDataChange(Sender: TObject; Field: TField);
begin
  aDetail.Enabled := not cdsRep.IsEmpty;
  aExport.Enabled := not cdsRep.IsEmpty;
end;

procedure TRepLoss.Button2Click(Sender: TObject);
var ABlnDetail : TLossDetailData;
begin
  ABlnDetail.id_business := fBsnSelector1.ID;
  ABlnDetail.Year :=  GetYear;
  ABlnDetail.RepNum := -26;
  if fBsnSelector1.ID <= 0 then
  begin
      MessageBox(Handle, 'Не выбран бизнес', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(fBsnSelector1.edName.Handle);
  end;
  ShowBlnDetail_3('Не вошли в отчет', ABlnDetail);
end;

end.
