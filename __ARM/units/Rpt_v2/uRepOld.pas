unit uRepOld;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient,  Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons, Menus, Mask, ToolEdit, CurrEdit, DBGridEh,
  GridsEh;

type
  TRepOld = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    dsRep: TDataSource;
    cdsRPT_OLD_CA: TClientDataSet;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    Button1: TButton;
    ilButtons: TImageList;
    ilEM: TImageList;
    ActionList1: TActionList;
    aExport: TAction;
    PopupMenu1: TPopupMenu;
    aToDict: TAction;
    Excel1: TMenuItem;
    BitBtn5: TBitBtn;
    Label1: TLabel;
    cbYear: TComboBox;
    DBGridEh1: TDBGridEh;
    cdsRPT_OLD_CAName: TStringField;
    cdsRPT_OLD_CAOperSummSysCur: TBCDField;
    cdsRPT_OLD_CALastDate: TDateTimeField;
    cdsRPT_OLD_Ware: TClientDataSet;
    StringField1: TStringField;
    BCDField1: TBCDField;
    DateTimeField1: TDateTimeField;
    cdsRPT_OLD_CAID: TAutoIncField;
    cdsRPT_OLD_WareID: TAutoIncField;
    cdsRPT_OLD_WareCatName: TStringField;
    cdsRPT_OLD_CACatName: TStringField;
    N1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure aExportExecute(Sender: TObject);
    procedure aNodeExpExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsRepDataChange(Sender: TObject; Field: TField);
    procedure aToDictExecute(Sender: TObject);
    procedure DBGridEh1GetBtnParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
      IsDown: Boolean);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    FRepNum : integer;
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(RepNum : integer);
    procedure CreateParams(var Params: TCreateParams); override;
    function GetYear : integer;
  end;

procedure ShowRepOld(RepNum : integer);

var
  RepOld: TRepOld;

implementation

uses uDM, foMyFunc, foMyFuncDXTreeExcel, uBalance, uCAPrfLoss_Det,
  foMyFuncEh, foMyFuncEhExcel, uRepLossDet, uEForm;

{$R *.DFM}

procedure ShowRepOld(RepNum : integer);
var F : TRepOld;
begin
  F := TRepOld.Create(nil);
  try
    F.Show;
    F.Paint;
    F.Initialize(RepNum);
  except
    F.Free;
  end;
end;

{ TBalanceBsn }


procedure TRepOld.Initialize(RepNum : integer);
begin
  FRepNum := RepNum;
  case FRepNum of
    100 :
    begin
      Caption := 'Не используемые контрагенты';
      dsRep.DataSet := cdsRPT_OLD_CA;
    end;
    200 :
    begin
      Caption := 'Не используемые товары';
      dsRep.DataSet := cdsRPT_OLD_Ware;
    end;
  end;
  
  Screen.Cursor := crSQLWait;
  try
    with TClientDataSet(dsRep.DataSet)do
    begin
      Close;
      Params.ParamByName('@id_business').Value := fBsnSelector1.ID;
      Params.ParamByName('@LastDate').Value := EncodeDate(GetYear, 12, 31);
      if (Params.ParamByName('@LastDate').Value = 0) or (fBsnSelector1.ID<0) then
        Exit
      else
      Open;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TRepOld.Button1Click(Sender: TObject);
var id_business : Variant;
    ID, ID_Ctg : Variant;
begin
  try
    Initialize(FRepNum);
  finally
  end;
end;

constructor TRepOld.Create(AOwner: TCOmponent);
var V : Variant;
    Year, Month, Day : Word;
    i : integer;
begin
  inherited;
  LoadValFromRegistry(V, SRegPath + '\' + Name,  'OnlyNotZerro');

  SetWindowLong(Handle, GWL_HWNDPARENT, 0);

  DecodeDate(Now, Year, Month, Day);
  cbYear.Clear;
  for i := 2006 to Year do
  begin
    cbYear.Items.Add(IntToStr(i));
  end;
  cbYear.ItemIndex := 1;
end;

procedure TRepOld.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TRepOld.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TRepOld.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TRepOld.aExportExecute(Sender: TObject);
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

procedure TRepOld.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  S := fBsnSelector1.BsnName; //'Баланс';
end;

destructor TRepOld.Destroy;
begin
  inherited;

end;

procedure TRepOld.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
  SaveEhGridSettingsToRegistry(DBGridEh1, SRegPath + '\' + ClassName + IntToStr(FRepNum));
end;

procedure TRepOld.FormShow(Sender: TObject);
begin
  LoadEhGridSettingsFromRegistry(DBGridEh1, SRegPath + '\' + ClassName + IntToStr(FRepNum));
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;



function TRepOld.GetYear: integer;
begin
  if cbYear.ItemIndex = -1 then
    Result := 0
  else
    Result := StrToInt(cbYear.Items[cbYear.ItemIndex]);
end;

procedure TRepOld.dsRepDataChange(Sender: TObject; Field: TField);
begin
  aToDict.Enabled := not dsRep.DataSet.IsEmpty;
  aExport.Enabled := not dsRep.DataSet.IsEmpty;
end;

procedure TRepOld.aToDictExecute(Sender: TObject);
var ASelectedObj : TSelectedObj;
    id_Bsn, Disabled: Variant;
    AEObjTypes: TEObjTypes;
begin
  if FRepNum = 100 then
  begin
    ASelectedObj.ID := cdsRPT_OLD_CAID.AsInteger;
    ASelectedObj.ObjType := eotCA;
  end
  else
  begin
    ASelectedObj.ID := cdsRPT_OLD_WareID.AsInteger;
    ASelectedObj.ObjType := eotGoods;
  end;

  ShowEForm(ASelectedObj, fBsnSelector1.ID, [ASelectedObj.ObjType]);
end;

procedure TRepOld.DBGridEh1GetBtnParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarkerEh(Column.Field);
end;

procedure TRepOld.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  ReOrderCDSEh(Column, '');

end;

end.
