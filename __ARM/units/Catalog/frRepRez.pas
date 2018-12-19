unit frRepRez;

interface

uses 
  DBGridEh, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, RXDBCtrl, DBClient, ActnList, ImgList, ComCtrls,
  ToolWin, foMyFunc, Menus, uBaseGridFilter, uEhGridFilter, uFormAPI_Doc,
  GridsEh, EhLibCDS;

type
  TfRepRez = class(TFrame)
    cdsGoodsRez: TClientDataSet;
    dsAmount: TDataSource;
    RxDBGrid1: TDBGridEh;
    ilImage: TImageList;
    ActionList1: TActionList;
    aProperty: TAction;
    aRefreshe: TAction;
    aExit: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    aDelete: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    cdsGoodsRezHasDept: TBooleanField;
    cdsGoodsRezWareDept: TBCDField;
    cdsGoodsRezId_CurrencyOper: TIntegerField;
    cdsGoodsRezId_CurrencySys: TIntegerField;
    cdsGoodsRezMeasureName: TStringField;
    cdsGoodsRezRealKoef: TFloatField;
    cdsGoodsRezid_Oper: TIntegerField;
    cdsGoodsRezOrdNum: TIntegerField;
    cdsGoodsRezid_Replicator: TIntegerField;
    cdsGoodsRezDateCreate: TDateTimeField;
    cdsGoodsRezOperVid: TIntegerField;
    cdsGoodsRezid_business: TIntegerField;
    cdsGoodsRezAmountOper: TBCDField;
    cdsGoodsRezBusinessNum: TStringField;
    cdsGoodsRezid_UserCreator: TIntegerField;
    cdsGoodsRezCRN_OLD_OperSum: TFloatField;
    cdsGoodsRezid_OperWare: TIntegerField;
    cdsGoodsRezAmountOperReal: TFloatField;
    cdsGoodsRezPriceOper: TFloatField;
    cdsGoodsRezSummSys: TFloatField;
    cdsGoodsRezid_Warehouse: TIntegerField;
    cdsGoodsRezid_Manufact: TIntegerField;
    cdsGoodsRezid_Repr: TIntegerField;
    cdsGoodsRezid_Warehouse_Ext: TIntegerField;
    cdsGoodsRezid_Manufact_Ext: TIntegerField;
    cdsGoodsRezPriceInv: TFloatField;
    cdsGoodsRezid_Goods: TIntegerField;
    cdsGoodsRezImp_PayBasic: TStringField;
    cdsGoodsRezAccInv_PayAssignment: TStringField;
    cdsGoodsRezContract: TStringField;
    cdsGoodsRezOpComment: TStringField;
    cdsGoodsRezRealDataCreate: TDateTimeField;
    cdsGoodsRezis_Mirr: TBooleanField;
    cdsGoodsRezVatIn: TBooleanField;
    cdsGoodsRezAutoGen: TBooleanField;
    cdsGoodsRezid_ContrAgent: TIntegerField;
    cdsGoodsRezReprName: TStringField;
    cdsGoodsRezReprID_Main: TIntegerField;
    cdsGoodsRezCurrencySysName: TStringField;
    cdsGoodsRezCurrencySysShortName: TStringField;
    cdsGoodsRezSrcName: TStringField;
    cdsGoodsRezSrcID_Main: TIntegerField;
    cdsGoodsRezReprName_1: TStringField;
    cdsGoodsRezReprID_Main_1: TIntegerField;
    cdsGoodsRezWareName: TStringField;
    cdsGoodsRezWareID_Main: TIntegerField;
    cdsGoodsRezContrAgentName: TStringField;
    cdsGoodsRezid_CAGroup: TIntegerField;
    cdsGoodsRezSummOper: TFloatField;
    cdsGoodsRezOperNum: TStringField;
    cdsGoodsRezOperVidName: TStringField;
    cdsGoodsRezSended: TFloatField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    aSend: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    aCopy: TAction;
    ToolButton6: TToolButton;
    N5: TMenuItem;
    N6: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton7: TToolButton;
    aDoc_ShowInv: TAction;
    aDoc_ShowPayIn: TAction;
    aDoc_ShowActCL: TAction;
    aDoc_ShowDAcc: TAction;
    aDoc_ShowFinalAct: TAction;
    aDoc_ShowWarrant: TAction;
    aDoc_ShowAF: TAction;
    aDoc_ShowWBill: TAction;
    aShowDocList: TAction;
    aDoc_ShowWHOrd: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    aGreedToExcel: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure aPropertyExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure dsAmountDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure cdsGoodsRezCalcFields(DataSet: TDataSet);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure aSendExecute(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure aDoc_ShowPayInExecute(Sender: TObject);
    procedure aDoc_ShowInvExecute(Sender: TObject);
    procedure aDoc_ShowActCLExecute(Sender: TObject);
    procedure aDoc_ShowDAccExecute(Sender: TObject);
    procedure aDoc_ShowFinalActExecute(Sender: TObject);
    procedure aDoc_ShowWarrantExecute(Sender: TObject);
    procedure aDoc_ShowAFExecute(Sender: TObject);
    procedure aDoc_ShowWBillExecute(Sender: TObject);
    procedure aShowDocListExecute(Sender: TObject);
    procedure aDoc_ShowWHOrdExecute(Sender: TObject);
    procedure aGreedToExcelExecute(Sender: TObject);
  private
    procedure ShowDoc(ADocProc: TDocProc);
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    procedure Initialize(AParamz201 : TParamz201);
    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
    procedure DoDelMsg(var Msg: TMessage); message xxx_DelMsg;
  end;

implementation

uses uDM, uFormApi_Oper, foMyFuncEh, uDoc_PayIn, foMyFuncEhExcel;

{$R *.DFM}

{ TFrame1 }

constructor TfRepRez.Create(AOwner: TCOmponent);
var Own : TCustomForm;
begin
  inherited;
  SetGridProps(RxDBGrid1, true, true, true);

  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin
    LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\grdList1');
  end;
end;

destructor TfRepRez.Destroy;
var Own : TCustomForm;
begin
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin
    SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\grdList1');
  end;
  inherited;
end;

procedure TfRepRez.Initialize(AParamz201 : TParamz201);
begin
  with cdsGoodsRez do
  begin
    Close;
    Params.ParamByName('@id_business').Value := AParamz201.id_business;
    if AParamz201.DateFrom = NULL then
      Params.ParamByName('@DateFrom').Value := NULL
    else
      Params.ParamByName('@DateFrom').AsDateTime := AParamz201.DateFrom;
    if AParamz201.DateTo = NULL then
      Params.ParamByName('@DateTo').Value := NULL
    else
      Params.ParamByName('@DateTo').AsDateTime := AParamz201.DateTo;

    Params.ParamByName('@id_ContrAgent').Value := AParamz201.id_ContrAgent;
    Params.ParamByName('@id_Goods').Value := AParamz201.id_Goods;
    Params.ParamByName('@id_Repr').Value := AParamz201.id_Repr;
    Params.ParamByName('@id_Warehouse').Value := AParamz201.id_Warehouse;
    Params.ParamByName('@id_Manufact').Value := AParamz201.id_Manufact;
    Params.ParamByName('@HasDept').Value := AParamz201.HasDept;
    Params.ParamByName('@id_user').Value := DM.IDUser;
    Open;
  end;
end;

procedure TfRepRez.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfRepRez.aPropertyExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ID_Oper := cdsGoodsRez.FieldByName('id_Oper').AsInteger;
  AOperParamz.ReadOnly := false;
  AOperParamz.RezMode := true;
  EditOperWare(Handle, AOperParamz);
end;

procedure TfRepRez.aRefresheExecute(Sender: TObject);
var
    ID : integer;
begin
  ID := cdsGoodsRez.FieldByName('id_Oper').AsInteger;
  with cdsGoodsRez do
  begin
    Close;
    Open;
    locate('id_Oper', ID, []);
  end;
end;

procedure TfRepRez.aExitExecute(Sender: TObject);
var Own : TCustomForm;
begin
  inherited;
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
    TCustomForm(Own).Close;
end;

procedure TfRepRez.DoRefrMsg(var Msg: TMessage);
begin
  aRefreshe.Execute;
end;

procedure TfRepRez.aDeleteExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ID_Oper := cdsGoodsRez.FieldByName('id_Oper').AsInteger;
  AOperParamz.DelMode := true;
  AOperParamz.RezMode := true;
  EditOperWare(Handle, AOperParamz);
end;

procedure TfRepRez.dsAmountDataChange(Sender: TObject; Field: TField);
begin
  with cdsGoodsRez do
  begin
    aDoc_ShowInv.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]);
    aDoc_ShowPayIn.Enabled := (FieldByName('OperVid').AsInteger = 2) or
                              ((FieldByName('OperVid').AsInteger in [1, 201]) );
    aDoc_ShowActCL.Enabled := (FieldByName('OperVid').AsInteger = 4);
    aDoc_ShowDAcc.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) ;
    aDoc_ShowFinalAct.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]);
    aDoc_ShowWarrant.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) ;
    aDoc_ShowAF.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]);
    aDoc_ShowWBill.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) ;
    aDoc_ShowWHOrd.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) ;

    aShowDocList.Enabled := (FieldByName('OperVid').AsInteger > 0);
  end;

  aProperty.Enabled := not cdsGoodsRez.IsEmpty;
  aDelete.Enabled := not cdsGoodsRez.IsEmpty;
  aSend.Enabled := not cdsGoodsRez.IsEmpty;
  aCopy.Enabled := not cdsGoodsRez.IsEmpty;
end;

procedure TfRepRez.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGridEh(Sender).ScreenToClient(P);
  if P.y <= THackGridEh(Sender).RowHeights[0] then
    Exit;
  aProperty.Execute;
end;

procedure TfRepRez.cdsGoodsRezCalcFields(DataSet: TDataSet);
begin
 // if DataSet.FieldByName('WareDept').Value > 0 then
    DataSet.FieldByName('Sended').Value := DataSet.FieldByName('AmountOper').Value - DataSet.FieldByName('WareDept').Value
 // else
   // DataSet.FieldByName('Sended').Value := DataSet.FieldByName('AmountOper').Value;
end;

procedure TfRepRez.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
    S : String;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.IsEmpty then
    Exit;
  if Column.Field = dsAmount.DataSet.FieldByName('HasDept') then
  begin
    if not dsAmount.DataSet.FieldByName('HasDept').AsBoolean then
      ImgIndex := 22
    else
      ImgIndex := -1;
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
  end
  else
  begin
  {  if dsAmount.DataSet.FieldByName('HasDept').AsBoolean then
    begin
      TDBGridEh(Sender).Font.Color := clWindowText;
      TDBGridEh(Sender).Font.Style := TDBGridEh(Sender).Font.Style - [fsStrikeOut];
    end
    else
    begin
      TDBGridEh(Sender).Font.Color := clGrayText;
      TDBGridEh(Sender).Font.Style := TDBGridEh(Sender).Font.Style + [fsStrikeOut];
    end;     }
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfRepRez.aSendExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ID_Oper := cdsGoodsRez.FieldByName('id_Oper').AsInteger;
  AOperParamz.ReadOnly := false;
  AOperParamz.RezMode := false;
  EditOperWare(Handle, AOperParamz);
end;

procedure TfRepRez.aCopyExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ID_Oper := cdsGoodsRez.FieldByName('id_Oper').AsInteger;
  AOperParamz.ReadOnly := false;
  AOperParamz.RezMode := true;
  AOperParamz.Copy := true;
  EditOperWare(Handle, AOperParamz);
end;

procedure TfRepRez.RxDBGrid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
    if dsAmount.DataSet.FieldByName('HasDept').AsBoolean then
    begin
      AFont.Color := clWindowText;
      AFont.Style := TDBGridEh(Sender).Font.Style - [fsStrikeOut];
    end
    else
    begin
      AFont.Color := clGrayText;
      AFont.Style := TDBGridEh(Sender).Font.Style + [fsStrikeOut];
    end;
end;

procedure TfRepRez.aDoc_ShowPayInExecute(Sender: TObject);
begin
  ShowDoc(ShowPayIn);
end;

procedure TfRepRez.DoDelMsg(var Msg: TMessage);
begin
  aRefreshe.Execute;

end;

procedure TfRepRez.aDoc_ShowInvExecute(Sender: TObject);
begin
  ShowDoc(ShowInv);

end;

procedure TfRepRez.aDoc_ShowActCLExecute(Sender: TObject);
begin
  ShowDoc(ShowActCL);
end;

procedure TfRepRez.aDoc_ShowDAccExecute(Sender: TObject);
begin
  ShowDoc(ShowDAcc);

end;

procedure TfRepRez.aDoc_ShowFinalActExecute(Sender: TObject);
begin
  ShowDoc(ShowFinalAct);
end;

procedure TfRepRez.aDoc_ShowWarrantExecute(Sender: TObject);
begin
  ShowDoc(ShowWarrant);
end;

procedure TfRepRez.ShowDoc(ADocProc : TDocProc);
var DP : TDocParamz;
begin
  DP := GetEmptyDocParamz;
  DP.ID_Oper := cdsGoodsRezid_Oper.AsInteger;
  ADocProc(Handle, DP, nil, nil)
end;

procedure TfRepRez.aDoc_ShowAFExecute(Sender: TObject);
begin
  ShowDoc(ShowAF);
end;

procedure TfRepRez.aDoc_ShowWBillExecute(Sender: TObject);
begin
  ShowDoc(ShowWBill);
end;

procedure TfRepRez.aShowDocListExecute(Sender: TObject);
begin
  ShowDocList(cdsGoodsRezid_Oper.AsInteger, Null);
end;

procedure TfRepRez.aDoc_ShowWHOrdExecute(Sender: TObject);
begin
  ShowDoc(ShowWHOrd);
end;

procedure TfRepRez.aGreedToExcelExecute(Sender: TObject);
begin
  Enabled := false;
  aGreedToExcel.Enabled := false;
  Repaint;
  try
    foMyFuncEhExcel.GreedToExcel(RxDBGrid1, 'Архив резервирований')
  finally
    Enabled := true;
    aGreedToExcel.Enabled := true;
  end;

end;

end.
