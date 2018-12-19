unit uRepSvod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient,  Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons, Menus, Mask, ToolEdit, CurrEdit, DBGridEh,
  GridsEh;

type
  TRepSvod = class(TForm)
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
    DBGridEh1: TDBGridEh;
    cdsRepID: TIntegerField;
    cdsRepPID: TIntegerField;
    cdsRepForOrder: TIntegerField;
    cdsRepName: TStringField;
    cdsRepParentName: TStringField;
    cdsRepM1_TOTAL: TFloatField;
    cdsRepM2_TOTAL: TFloatField;
    cdsRepM3_TOTAL: TFloatField;
    cdsRepM4_TOTAL: TFloatField;
    cdsRepM5_TOTAL: TFloatField;
    cdsRepM6_TOTAL: TFloatField;
    cdsRepM7_TOTAL: TFloatField;
    cdsRepM8_TOTAL: TFloatField;
    cdsRepM9_TOTAL: TFloatField;
    cdsRepM10_TOTAL: TFloatField;
    cdsRepM11_TOTAL: TFloatField;
    cdsRepM12_TOTAL: TFloatField;
    cdsRepY_TOTAL: TFloatField;
    cdsRepAVG_TOTAL: TFloatField;
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
  private
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize;
    procedure CreateParams(var Params: TCreateParams); override;
    function GetYear : integer;
  end;

procedure ShowRepSvod;

var
  RepSvod: TRepSvod;

implementation

uses uDM, foMyFunc, foMyFuncDXTreeExcel, uBalance, uCAPrfLoss_Det,
  foMyFuncEh, foMyFuncEhExcel, uRepLossDet;

{$R *.DFM}

procedure ShowRepSvod;
var F : TRepSvod;
begin
  F := TRepSvod.Create(nil);
  try
    F.Show;
    F.Paint;
    F.Initialize;
  except
    F.Free;
  end;
end;

{ TBalanceBsn }


procedure TRepSvod.Initialize;
begin
  Caption := '—равнение ежемес€чных результатов';

  Screen.Cursor := crSQLWait;
  try
    with cdsRep do
    begin
      Close;
      Params.ParamByName('@id_business').Value := fBsnSelector1.ID;
      Params.ParamByName('@Year').Value := GetYear;
      Params.ParamByName('@ID').Value := Null;
      if (Params.ParamByName('@Year').Value = 0) or (fBsnSelector1.ID<0) then
        Exit
      else
      Open;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TRepSvod.Button1Click(Sender: TObject);
var id_business : Variant;
    ID, ID_Ctg : Variant;
begin
  try
    Initialize;
  finally
  end;
end;

constructor TRepSvod.Create(AOwner: TCOmponent);
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

procedure TRepSvod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TRepSvod.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TRepSvod.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TRepSvod.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  index := Node.ImageIndex;
end;

procedure TRepSvod.aExportExecute(Sender: TObject);
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

procedure TRepSvod.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  S := fBsnSelector1.BsnName; //'Ѕаланс';
end;

destructor TRepSvod.Destroy;
begin
  inherited;

end;

procedure TRepSvod.aDetailExecute(Sender: TObject);
var ABlnDetail : TLossDetailData;
begin
  ABlnDetail.id_business := fBsnSelector1.ID;
  ABlnDetail.Year := GetYear;
  if cdsRepPID.IsNull then
    ABlnDetail.Str4 := ''
  else
    ABlnDetail.Str4 := trim(cdsRepName.AsString);
  if cdsRepPID.IsNull then
    ABlnDetail.Str3 := trim(cdsRepName.AsString)
  else
    ABlnDetail.Str3 := trim(cdsRepParentName.AsString);

  ABlnDetail.M := DBGridEh1.Col - 1 ; //1 + (DBGridEh1.Col - 2) div 3 ;

  ShowBlnDetail_3(Caption + ' ' + cdsRepParentName.AsString + '/' + trim(cdsRepName.AsString)
     + ', мес€ц ' + DBGridEh1.Columns[DBGridEh1.Col - 1].Title.Caption, ABlnDetail);
end;

procedure TRepSvod.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
  SaveEhGridSettingsToRegistry(DBGridEh1, SRegPath + '\' + ClassName);
end;

procedure TRepSvod.FormShow(Sender: TObject);
begin
  LoadEhGridSettingsFromRegistry(DBGridEh1, SRegPath + '\' + ClassName);
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;



function TRepSvod.GetYear: integer;
begin
  if cbYear.ItemIndex = -1 then
    Result := 0
  else
    Result := StrToInt(cbYear.Items[cbYear.ItemIndex]);
end;

procedure TRepSvod.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin                
 { if cdsRepPID.IsNull then
  begin
    AFont.Style := [fsBold];
  end; }
end;

procedure TRepSvod.dsRepDataChange(Sender: TObject; Field: TField);
begin
  aDetail.Enabled := not cdsRep.IsEmpty;
  aExport.Enabled := not cdsRep.IsEmpty;
end;

end.
