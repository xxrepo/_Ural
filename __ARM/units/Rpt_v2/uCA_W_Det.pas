unit uCA_W_Det;

interface

uses
  DBGridEh, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, frBsnSelector, foMyFunc, frArcLite,
  Mask, ToolEdit, Menus, Db, DBClient, Grids, ImgList,
  uBaseGridFilter, uEhGridFilter, ToolWin, RXCtrls, ActnList, GridsEh;

type
  TCA_W_Det = class(TForm)
    Panel1: TPanel;
    btnCancel: TButton;
    Panel2: TPanel;
    Button1: TButton;
    Panel5: TPanel;
    fBsnSelector1: TfBsnSelector;
    Panel4: TPanel;
    Label2: TLabel;
    dtTo: TDateTimePicker;
    dtTimeTo: TDateTimePicker;
    Label3: TLabel;
    cdsPrfLoss: TClientDataSet;
    Label4: TLabel;
    dtDFrom: TDateTimePicker;
    Label5: TLabel;
    dtTFrom: TDateTimePicker;
    RxDBGrid1: TDBGridEh;
    dsArc: TDataSource;
    cdsExtDataDict: TClientDataSet;
    cdsExtDataDictid_Oper_ExtDataNames: TIntegerField;
    cdsExtDataDictid_business: TIntegerField;
    cdsExtDataDictType: TIntegerField;
    cdsExtDataDictNumPrm: TIntegerField;
    cdsExtDataDictParName: TStringField;
    cdsExtDataDictVisible: TBooleanField;
    ilImage: TImageList;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    EhGridFilter1: TEhGridFilter;
    cdsPrfLossid_Oper2: TIntegerField;
    cdsPrfLossid_OperWare2: TIntegerField;
    cdsPrfLossWareProff: TFloatField;
    cdsPrfLossWareLoss: TFloatField;
    cdsPrfLossFinProff: TFloatField;
    cdsPrfLossFinLoss: TFloatField;
    cdsPrfLossOffProff: TFloatField;
    cdsPrfLossOffLoss: TFloatField;
    cdsPrfLossCurProff: TFloatField;
    cdsPrfLossCurLoss: TFloatField;
    cdsPrfLossInvSumm: TFloatField;
    cdsPrfLossRealWareProff: TFloatField;
    cdsPrfLossid_Oper: TAutoIncField;
    cdsPrfLossid_OperParent: TIntegerField;
    cdsPrfLossid_old_Oper: TIntegerField;
    cdsPrfLossDateCreate: TDateTimeField;
    cdsPrfLossid_LC_Oper: TIntegerField;
    cdsPrfLossOperVid: TIntegerField;
    cdsPrfLossid_Replicator: TIntegerField;
    cdsPrfLossReplicatorShortName: TStringField;
    cdsPrfLossid_UserCreator: TIntegerField;
    cdsPrfLossid_business: TIntegerField;
    cdsPrfLossId_CurrencyBsn: TIntegerField;
    cdsPrfLossBusinessName: TStringField;
    cdsPrfLossBusinessNum: TStringField;
    cdsPrfLossDateLocal: TDateTimeField;
    cdsPrfLossCorrect: TBooleanField;
    cdsPrfLossOperTypeIn: TBooleanField;
    cdsPrfLossId_CurrencyOper: TIntegerField;
    cdsPrfLossCurrencyOperName: TStringField;
    cdsPrfLossCurrencyOperShortName: TStringField;
    cdsPrfLossAmountOper: TFloatField;
    cdsPrfLossAmountOper2: TFloatField;
    cdsPrfLossPriceOper: TFloatField;
    cdsPrfLossRateOper: TFloatField;
    cdsPrfLossid_Measure: TIntegerField;
    cdsPrfLossMeasureName: TStringField;
    cdsPrfLossRealKoef: TFloatField;
    cdsPrfLossAmountOperBaseMS: TFloatField;
    cdsPrfLossId_CurrencySys: TIntegerField;
    cdsPrfLossCurrencySysName: TStringField;
    cdsPrfLossCurrencySysShortName: TStringField;
    cdsPrfLossSummSys: TFloatField;
    cdsPrfLossRateSys: TFloatField;
    cdsPrfLossid_Acc: TIntegerField;
    cdsPrfLossid_Warehouse: TIntegerField;
    cdsPrfLossid_Manufact: TIntegerField;
    cdsPrfLossSrcName: TStringField;
    cdsPrfLossSrcID_Main: TIntegerField;
    cdsPrfLossid_Repr: TIntegerField;
    cdsPrfLossid_Acc_Ext: TIntegerField;
    cdsPrfLossid_Warehouse_Ext: TIntegerField;
    cdsPrfLossid_Manufact_Ext: TIntegerField;
    cdsPrfLossReprName: TStringField;
    cdsPrfLossReprID_Main: TIntegerField;
    cdsPrfLossId_CurrencyInv: TIntegerField;
    cdsPrfLossPriceInv: TFloatField;
    cdsPrfLossRateInv: TFloatField;
    cdsPrfLossCurrencyInvName: TStringField;
    cdsPrfLossCurrencyInvShortName: TStringField;
    cdsPrfLossid_Goods: TIntegerField;
    cdsPrfLossWareName: TStringField;
    cdsPrfLossWareID_Main: TIntegerField;
    cdsPrfLossKoeff: TIntegerField;
    cdsPrfLossKoeffName: TStringField;
    cdsPrfLossCheckDate: TDateTimeField;
    cdsPrfLossid_UserChecker: TIntegerField;
    cdsPrfLossid_FormalDistrib: TIntegerField;
    cdsPrfLossFormalDistribName: TStringField;
    cdsPrfLossid_FuncDistrib: TIntegerField;
    cdsPrfLossFuncDistribName: TStringField;
    cdsPrfLossDeleted: TBooleanField;
    cdsPrfLossid_ContrAgent: TIntegerField;
    cdsPrfLossContrAgentName: TStringField;
    cdsPrfLossid_CAGroup: TIntegerField;
    cdsPrfLossSummOper: TFloatField;
    cdsPrfLossTypeName: TStringField;
    cdsPrfLossOperNum: TStringField;
    cdsPrfLossOperDelta: TFloatField;
    cdsPrfLossOperRateDelta: TFloatField;
    cdsPrfLossOperTotalDelta: TFloatField;
    cdsPrfLossDTDiff: TIntegerField;
    cdsPrfLossHasViza: TBooleanField;
    cdsPrfLossOperState: TIntegerField;
    cdsPrfLossHidedOper: TBooleanField;
    cdsPrfLossOperSummSys: TFloatField;
    cdsPrfLossRateMain: TFloatField;
    cdsPrfLossid_Repr_Ex: TIntegerField;
    cdsPrfLossid_DocType: TIntegerField;
    cdsPrfLossImp_PayBasic: TStringField;
    cdsPrfLossAccInv_PayAssignment: TStringField;
    cdsPrfLossContract: TStringField;
    cdsPrfLossOperDeltaCrn: TFloatField;
    cdsPrfLossOperRateDeltaCrn: TFloatField;
    cdsPrfLossOperTotalDeltaCrn: TFloatField;
    cdsPrfLossOperCrnName: TStringField;
    cdsPrfLossOperSum_Offer: TFloatField;
    cdsPrfLossCRN_OLD_OperSum: TFloatField;
    cdsPrfLossCRN_OLD_OperSum_Offer: TFloatField;
    cdsPrfLossCRN_OperSum_Inv: TFloatField;
    cdsPrfLossOperSumCalced: TFloatField;
    cdsPrfLossOperSum_OfferCalced: TFloatField;
    cdsPrfLossBlocked: TBooleanField;
    cdsPrfLossCurrencyBsnName: TStringField;
    cdsPrfLossid_Ctg_Goods_2: TIntegerField;
    cdsPrfLossOpComment: TStringField;
    cdsPrfLossRealDataCreate: TDateTimeField;
    cdsPrfLossOperTypeSIGN: TIntegerField;
    cdsPrfLossHasChild: TIntegerField;
    cdsPrfLossDig1: TFloatField;
    cdsPrfLossDig2: TFloatField;
    cdsPrfLossDig3: TFloatField;
    cdsPrfLossDig4: TFloatField;
    cdsPrfLossDig5: TFloatField;
    cdsPrfLossDig6: TFloatField;
    cdsPrfLossDig7: TFloatField;
    cdsPrfLossDig8: TFloatField;
    cdsPrfLossDig9: TFloatField;
    cdsPrfLossDig10: TFloatField;
    cdsPrfLossDig11: TFloatField;
    cdsPrfLossDig12: TFloatField;
    cdsPrfLossDig13: TFloatField;
    cdsPrfLossDig14: TFloatField;
    cdsPrfLossDig15: TFloatField;
    cdsPrfLossStr1: TStringField;
    cdsPrfLossStr2: TStringField;
    cdsPrfLossStr3: TStringField;
    cdsPrfLossStr4: TStringField;
    cdsPrfLossStr5: TStringField;
    cdsPrfLossStr6: TStringField;
    cdsPrfLossStr7: TStringField;
    cdsPrfLossStr8: TStringField;
    cdsPrfLossStr9: TStringField;
    cdsPrfLossStr10: TStringField;
    cdsPrfLossStr11: TStringField;
    cdsPrfLossStr12: TStringField;
    cdsPrfLossStr13: TStringField;
    cdsPrfLossStr14: TStringField;
    cdsPrfLossStr15: TStringField;
    cdsPrfLossid_OperWare: TAutoIncField;
    cdsPrfLossOperVidName: TStringField;
    cdsPrfLossCRN_OperSumRez: TFloatField;
    cdsPrfLossOnlyDate: TDateTimeField;
    cdsPrfLossis_Mirr: TBooleanField;
    cdsPrfLossid_Acc_Group: TIntegerField;
    cdsPrfLossid_Warehouse_Group: TIntegerField;
    cdsPrfLossid_Manufact_Group: TIntegerField;
    cdsPrfLossVatIn: TBooleanField;
    cdsPrfLossAutoGen: TBooleanField;
    cdsPrfLossCreatorFIO: TStringField;
    cdsPrfLossCheckerFIO: TStringField;
    ActionList1: TActionList;
    aNewWH: TAction;
    aNewFin: TAction;
    aNewService: TAction;
    aNewZac: TAction;
    aProperty: TAction;
    aRefreshe: TAction;
    aDelete: TAction;
    aNewEmpty: TAction;
    aGetMi: TAction;
    aCancelSeted: TAction;
    aSetUser: TAction;
    aNewCorHW: TAction;
    aNewCorFin: TAction;
    aNewCorService: TAction;
    aNewCorOffset: TAction;
    aUnSetUser: TAction;
    aSetViza: TAction;
    aUnViza: TAction;
    aBuffAdd: TAction;
    aBuffDel: TAction;
    aSetError: TAction;
    aUnSetError: TAction;
    aNewCor: TAction;
    aDoChangeOper: TAction;
    aNewCopyOper2: TAction;
    aLCBuffAdd: TAction;
    Action1: TAction;
    aGreedToExcel: TAction;
    aSelectAll: TAction;
    aSettings: TAction;
    aBeBack: TAction;
    aExportAll: TAction;
    aImport: TAction;
    aExportSelected: TAction;
    aBackToCA: TAction;
    aBackFromCA: TAction;
    aShowArcAnaliz: TAction;
    aValList: TAction;
    aAccCard: TAction;
    aBalance: TAction;
    aWHRep: TAction;
    aCopySel: TAction;
    aNewRez: TAction;
    aMakeRez: TAction;
    aOperByRez: TAction;
    aVizaSelected: TAction;
    aDoc_ShowInv: TAction;
    aDoc_ShowPayIn: TAction;
    aDoc_ShowActCL: TAction;
    aDoc_ShowDAcc: TAction;
    aDoc_ShowFinalAct: TAction;
    aDoc_ShowWarrant: TAction;
    aDoc_ShowAF: TAction;
    aDoc_ShowWBill: TAction;
    aShowDocList: TAction;
    ADelSel: TAction;
    aUnVizaSel: TAction;
    ToolBar1: TToolBar;
    ToolButton8: TToolButton;
    RxSpeedButton4: TRxSpeedButton;
    ToolButton2: TToolButton;
    sep1: TToolButton;
    ToolButton4: TToolButton;
    sep2: TToolButton;
    ToolButton6: TToolButton;
    sep3: TToolButton;
    ToolButton13: TToolButton;
    ToolButton5: TToolButton;
    RxSpeedButton3: TRxSpeedButton;
    ToolButton12: TToolButton;
    ToolButton7: TToolButton;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dtToChange(Sender: TObject);
    procedure dtDFromChange(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure aPropertyExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure aUnVizaExecute(Sender: TObject);
    procedure aSetErrorExecute(Sender: TObject);
    procedure aSetVizaExecute(Sender: TObject);
    procedure aGreedToExcelExecute(Sender: TObject);
    procedure aSettingsExecute(Sender: TObject);
    procedure aShowArcAnalizExecute(Sender: TObject);
    procedure aNewCopyOper2Execute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure dsArcDataChange(Sender: TObject; Field: TField);
  private
    FBlnDetail : TPL_DetailData;
    Fid_business : Variant;
    procedure InitializeClick;
    function GetBlnDateTime: Variant;
    procedure SetBlnDateTime(const Value: Variant);
    function GetBlnDateTime_int(ATo: boolean): Variant;
    procedure SetBlnDateTime_int(const Value: Variant; ATo: boolean);
    function GetBlnDateTimeFrom: Variant;
    procedure SetBlnDateTimeFrom(const Value: Variant);
    function DoEditOper(AReadOnly : boolean; id_OperParent: Variant; ACorrect, ACopy : boolean; ADelMode : boolean;
                        var ID : integer; Ais_Mirr : boolean;
                        ARezMode : boolean;
                        AViza : boolean = false;
                        AOperVid : integer = -1) : boolean;
  public
    procedure Initialize(ABlnDetail : TPL_DetailData);
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
    property BlnDateTime : Variant read GetBlnDateTime write SetBlnDateTime;
    property BlnDateTimeFrom : Variant read GetBlnDateTimeFrom write SetBlnDateTimeFrom;
    procedure Setid_business(const Value: Variant);
    procedure SaveStng;
    procedure loadStng;
  end;

var
  CA_W_Det: TCA_W_Det;

  procedure ShowCA_W_Det(ACaption : String; ABlnDetail : TPL_DetailData);

implementation

uses uDM, foMyFuncEh, foMyFuncEhExcel, uFormApi_Oper, uCAPrfLoss_DetProp;

{$R *.DFM}

procedure ShowCA_W_Det(ACaption : String; ABlnDetail : TPL_DetailData);
var F : TCA_W_Det;
    i : integer;
begin
    F := TCA_W_Det.Create(nil);
    try
      F.Caption := ACaption;
      F.Show;
      F.Repaint;
      F.Initialize(ABlnDetail);
    except
      on E : Exception do
      begin
        F.Free;
        raise Exception.Create(E.Message);
      end;
    end;
end;

{ TRptForm }


function TCA_W_Det.GetBlnDateTime_int(ATo : boolean): Variant;
var ctrlDate, ctrlTime : TDateTimePicker;
begin
  if ATo then
  begin
    ctrlDate := dtTo;
    ctrlTime := dtTimeTo;
  end
  else
  begin
    ctrlDate := dtDFrom;
    ctrlTime := dtTFrom;
  end;
  if ctrlDate.Checked then
  begin
    Result := Int(ctrlDate.Date);
    if ctrlTime.Enabled and ctrlTime.Checked then
      Result := Result + Frac(ctrlTime.Time)
    else
      Result := GetDateAdv(ctrlDate.Date, ATo)
  end
  else
    Result := Null;
end;

procedure TCA_W_Det.SetBlnDateTime_int(const Value: Variant; ATo : boolean);
var ctrlDate, ctrlTime : TDateTimePicker;
    TTT : Extended;
    Year, Month, Day, Hour, Min, Sec, MSec: Word;
    V : Variant;
begin
  if ATo then
  begin
    ctrlDate := dtTo;
    ctrlTime := dtTimeTo;
  end
  else
  begin
    ctrlDate := dtDFrom;
    ctrlTime := dtTFrom;
  end;

  if GetBlnDateTime_int(ATo) = Value then
    Exit;
  if Value = Null then
  begin
    ctrlDate.Checked := false;
  end
  else
  begin
    DecodeDate(Value, Year, Month, Day);
    DecodeTime(Value, Hour, Min, Sec, MSec);
    if (Hour=23) and (Min=59) and (Sec=59) and (MSec>0) then
      V := EncodeDate(Year, Month, Day)
    else
      V := Value;

    TTT := Frac(V);
    ctrlDate.Date := V;
    ctrlTime.Time := TTT;
    ctrlDate.Checked := true;
    ctrlTime.Checked := TTT <> 0;
  end;
  ctrlTime.Enabled := ctrlDate.Checked;
end;


constructor TCA_W_Det.Create(AOwner: TCOmponent);
var    V : Variant;
begin
  inherited;
  Fid_business := -1;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  LoadValFromRegistry(V, SRegPath + '\' + Name, 'id_Bsn');
//  if V <> Null then
//    fRptFrame1.fBsnSelector1.ID := V;
  dtTo.Date := Now;
  dtTimeTo.Time := Time;
  dtTo.Checked := false;
  dtTimeTo.Enabled := false;
  dtTimeTo.Checked := false;

end;

procedure TCA_W_Det.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TCA_W_Det.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  SaveStng;
end;

procedure TCA_W_Det.btnCancelClick(Sender: TObject);
begin
  Close;
end;

destructor TCA_W_Det.Destroy;
begin
//  SaveValToRegistry(fRptFrame1.dtFrom.Date, SRegPath + '\' + Name, 'dtFrom');
//  SaveValToRegistry(fRptFrame1.dtTo.Date, SRegPath + '\' + Name, 'dtTo');
//  SaveValToRegistry(fRptFrame1.fBsnSelector1.ID, SRegPath + '\' + Name, 'id_Bsn');
  inherited;

end;

procedure TCA_W_Det.fBsnSelector1Button1Click(Sender: TObject);
var Old : Variant;
begin
  Old := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if fBsnSelector1.ID <> Old then
    InitializeClick;
end;

procedure TCA_W_Det.Button1Click(Sender: TObject);
begin
  InitializeClick;
end;

procedure TCA_W_Det.InitializeClick;
begin
  FBlnDetail.id_business := fBsnSelector1.ID;
  FBlnDetail.Date := BlnDateTime;
  FBlnDetail.DateFrom := BlnDateTimeFrom;
  Initialize(FBlnDetail);
end;

procedure TCA_W_Det.Initialize(ABlnDetail: TPL_DetailData);
var FFF : Extended;
    ADate : Variant;
    ADateFrom : Variant;
begin
  Setid_business(ABlnDetail.id_business);
  FBlnDetail := ABlnDetail;

  if (fBsnSelector1.ID <> FBlnDetail.id_business) then
    fBsnSelector1.ID := FBlnDetail.id_business;

  BlnDateTime := FBlnDetail.Date;
  BlnDateTimeFrom := FBlnDetail.DateFrom;

  Screen.Cursor := crSQLWait;
  try
    if (fBsnSelector1.ID > 0) or (ABlnDetail.id_Oper <> Null) then
    begin
      with cdsPrfLoss do
      begin
        Close;
        Params.ParamByName('@NeedOperData').Value := true;
        Params.ParamByName('@id_business').Value := FBlnDetail.id_business;
        Params.ParamByName('@Date').Value := ABlnDetail.Date;
        Params.ParamByName('@DateFrom').Value := ABlnDetail.DateFrom;
        Params.ParamByName('@id_Oper').Value := ABlnDetail.id_Oper;
        Params.ParamByName('@id_Goods').Value := ABlnDetail.id_Goods;
        Params.ParamByName('@id_ContrAgent').Value := ABlnDetail.id_ContrAgent;

        Params.ParamByName('@WareProff').Value := ABlnDetail.WareProff;
        Params.ParamByName('@WareLoss').Value := ABlnDetail.WareLoss;

        Params.ParamByName('@FinProff').Value := ABlnDetail.FinProff;
        Params.ParamByName('@FinLoss').Value := ABlnDetail.FinLoss;

        Params.ParamByName('@OffProff').Value := ABlnDetail.OffProff;
        Params.ParamByName('@OffLoss').Value := ABlnDetail.OffLoss;

        Params.ParamByName('@CurProff').Value := ABlnDetail.CurProff;
        Params.ParamByName('@CurLoss').Value := ABlnDetail.CurLoss;

        Open;

        DisableControls;
       { First;
        FFF := 0;
        while not Eof do
        begin
          FFF := FFF + FieldByName('WorkSum').AsFloat;
          Next;
        end;
        First;    }
      end;
    end;
  finally
    cdsPrfLoss.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TCA_W_Det.dtToChange(Sender: TObject);
var B : boolean;
begin
  B := dtTimeTo.Checked and dtTimeTo.Enabled;
  dtTimeTo.Enabled := dtTo.Checked;
  dtTimeTo.Checked := B;

end;

function TCA_W_Det.GetBlnDateTime: Variant;
begin
  Result := GetBlnDateTime_int(true);
end;

procedure TCA_W_Det.SetBlnDateTime(const Value: Variant);
var TTT : Extended;
    Year, Month, Day, Hour, Min, Sec, MSec: Word;
    V : Variant;
begin
  SetBlnDateTime_int(Value, true);
end;

function TCA_W_Det.GetBlnDateTimeFrom: Variant;
begin
  Result := GetBlnDateTime_int(false);
end;

procedure TCA_W_Det.SetBlnDateTimeFrom(const Value: Variant);
begin
  SetBlnDateTime_int(Value, false);
end;

procedure TCA_W_Det.dtDFromChange(Sender: TObject);
var B : boolean;
begin
  B := dtTFrom.Checked and dtTFrom.Enabled;
  dtTFrom.Enabled := dtDFrom.Checked;
  dtTFrom.Checked := B;
  Label3.Enabled := dtDFrom.Checked;

end;

procedure TCA_W_Det.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
    S : String;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.IsEmpty then
    Exit;

  if Column.Field = cdsPrfLoss.FieldByName('OperState') then
  begin
    if dsArc.DataSet.FieldByName('HasViza').AsBoolean then
      ImgIndex := 22
    else
    begin
      if dsArc.DataSet.FieldByName('OperState').AsInteger = -1 then
        ImgIndex := 26
      else
        ImgIndex := -1;
    end;
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
  end
  else
    if Column.Field = dsArc.DataSet.FieldByName('OperVidName') then
    begin
      case dsArc.DataSet.FieldByName('OperVid').AsInteger of
        -1 :
        begin
          ImgIndex := 29;
        end;
        0 :
        begin
          ImgIndex := 0;
        end;
        201 :
        begin
          ImgIndex := 14;
        end;
        1, 101 :
        begin
          ImgIndex := 2;
        end;
        2, 102 :
        begin
          ImgIndex := 1;
        end;
        3, 103 :
        begin
          ImgIndex := 3;
        end;
        4 :
        begin
          ImgIndex := 21;
        end;
        else
          ImgIndex := -1;
      end;
      TDBGridEh(Sender).Canvas.FillRect(Rect);
      ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
    end
    else
    begin
      TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

      // Красим незаполненные ячейки
      if ((Column.Field = dsArc.DataSet.FieldByName('ContrAgentName')) and
         (dsArc.DataSet.FieldByName('ContrAgentName').IsNull) and
         (not dsArc.DataSet.FieldByName('id_Repr').IsNull or
         not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('BusinessName')) and
         (dsArc.DataSet.FieldByName('BusinessName').IsNull))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('KoeffName')) and
         (dsArc.DataSet.FieldByName('KoeffName').IsNull))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('FormalDistribName')) and
         (dsArc.DataSet.FieldByName('FormalDistribName').IsNull) and (dsArc.DataSet.FieldByName('Koeff').AsInteger <> 0))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('FuncDistribName')) and
         (dsArc.DataSet.FieldByName('FuncDistribName').IsNull) and (dsArc.DataSet.FieldByName('Koeff').AsInteger <> 0))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('ReprName')) and
         (dsArc.DataSet.FieldByName('id_Repr').IsNull) and
         (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull) and
         (not dsArc.DataSet.FieldByName('ReprName').IsNull))
          then
      begin
        TDBGridEh(Sender).Canvas.Brush.Color := clWindow;

        TDBGridEh(Sender).Canvas.Font.Color := clRed;
        TDBGridEh(Sender).Canvas.Font.Style := TDBGridEh(Sender).Canvas.Font.Style + [fsBold];

        TDBGridEh(Sender).Canvas.Brush.Style := bsClear;
        TDBGridEh(Sender).Canvas.Pen.Color := clRed;
        TDBGridEh(Sender).Canvas.Rectangle(Rect.Left + 0, Rect.Top + 0, Rect.Right - 0, Rect.Bottom - 0);
      end;
      if (Column.Field is TNumericField) then
      begin
        R := Rect;
        TDBGridEh(Sender).Canvas.FillRect(R);
        if (not Column.Field.IsNull) and (Column.Field.DisplayText <> '') then
        begin
          S := Trim(FormatFloat('### ### ### ### ##0.00', ABS(Column.Field.AsFloat)));
          if Column.Field.AsFloat < 0 then
            S := '-' + S;
          R.Top := R.Top + 2;
          DrawText(TDBGridEh(Sender).Canvas.Handle, PChar(S), -1, R, DT_RIGHT);
        end;
      end;
    end;
end;

procedure TCA_W_Det.Setid_business(const Value: Variant);
var
    S : String;
    i : integer;
    ACol : TColumnEh;
begin
  if (Fid_business <> Value) then
  begin
    Fid_business := Value;
    with cdsExtDataDict do
    begin
      Close;
      Params.ParamByName('@id_business').Value := Fid_business;
      Open;
      try
        First;
        while Not Eof do
        begin
          case FieldByName('Type').AsInteger of
            1 : S := 'Dig';
            2 : S := 'Str';
            3 : S := 'Date';
          end;
          S := S + FieldByName('NumPrm').AsString;
          S := UpperCase(S);
          for i := RxDBGrid1.Columns.Count - 1 downto 0 do
          begin
            ACol := RxDBGrid1.Columns[i];
            if UpperCase(ACol.FieldName) = S then
            begin
              ACol.Visible := FieldByName('Visible').AsBoolean;
              if FieldByName('Visible').AsBoolean then
                ACol.Title.Caption := 'Бюджет|' + FieldByName('ParName').AsString;
              Break;
            end;
          end;
          Next;
        end;
      finally
        Close;
      end;
    end;
    loadStng;

    TClientDataSet(dsArc.DataSet).Params.ParamByName('@id_business').Value := Value;
    EhGridFilter1.DBGrid := RxDBGrid1;
  end;
end;

procedure TCA_W_Det.SaveStng;
begin
  SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + ClassName);
end;

procedure TCA_W_Det.loadStng;
begin
  LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + ClassName);
end;

procedure TCA_W_Det.aPropertyExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr, ARezMode : boolean;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := false;
  B := (dsArc.DataSet.FieldByName('id_UserChecker').AsInteger <> DM.IDUser) or (dsArc.DataSet.FieldByName('DTDiff').AsInteger <> 0);
  B := (//(dsArc.DataSet.FieldByName('id_UserChecker').AsInteger <> DM.IDUser) and
        (not dsArc.DataSet.FieldByName('CheckDate').IsNull))
       // or (dsArc.DataSet.FieldByName('DTDiff').AsInteger <> 0)
        ;
  ARezMode := dsArc.DataSet.FieldByName('OperVid').AsInteger = 201;
  Rez := DoEditOper(B, Null, false, false, false, ID, Ais_Mirr, ARezMode);
end;

procedure TCA_W_Det.aRefresheExecute(Sender: TObject);
begin
//*
end;

procedure TCA_W_Det.aUnVizaExecute(Sender: TObject);
begin
//*
end;

procedure TCA_W_Det.aSetErrorExecute(Sender: TObject);
begin
//*
end;

procedure TCA_W_Det.aSetVizaExecute(Sender: TObject);
begin
//
end;

procedure TCA_W_Det.aGreedToExcelExecute(Sender: TObject);
begin
  Enabled := false;
  aGreedToExcel.Enabled := false;
  Repaint;
  try
    GreedToExcel(RxDBGrid1, Caption)
  finally
    Enabled := true;
    aGreedToExcel.Enabled := true;
  end;
end;

procedure TCA_W_Det.aSettingsExecute(Sender: TObject);
begin
//*
end;

procedure TCA_W_Det.aShowArcAnalizExecute(Sender: TObject);
begin
//*
end;

procedure TCA_W_Det.aNewCopyOper2Execute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr, ARezMode : boolean;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := false;
  B := false;
  ARezMode := dsArc.DataSet.FieldByName('OperVid').AsInteger = 201;
  Rez := DoEditOper(B, Null, false, true, false, ID, Ais_Mirr, ARezMode);
end;

procedure TCA_W_Det.aDeleteExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr, ARezMode : boolean;
    ABookmark : TBookmark;
begin
 // if MessageBox(Handle, 'Удалить операцию?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idNo then
 //   Exit;
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  ARezMode := dsArc.DataSet.FieldByName('OperVid').AsInteger = 201;
  Rez := false;
  B := false;
  Rez := DoEditOper(B, Null, false, false, true, ID, Ais_Mirr, ARezMode);
end;

function TCA_W_Det.DoEditOper(AReadOnly: boolean;
  id_OperParent: Variant; ACorrect, ACopy, ADelMode: boolean;
  var ID: integer; Ais_Mirr, ARezMode, AViza: boolean;
  AOperVid: integer): boolean;
var
    Rez : boolean;
    B, IsMy : boolean;
    AOperParamz : TOperParamz;
begin
  IsMy := true;
  ADelMode := ADelMode and (not dsArc.DataSet.IsEmpty)
                      and IsMy
                      and (dsArc.DataSet.FieldByName('CheckDate').IsNull);
                   //   and (RxDBGrid1.SelectedRows.Count <= 1);// and (cdsArcDTDiff.AsInteger = 0);

  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ReadOnly := AReadOnly;
  AOperParamz.ID_Oper := ID;
  AOperParamz.is_Mirr := Ais_Mirr;
  AOperParamz.Correct := ACorrect;
  AOperParamz.Copy := ACopy;
  AOperParamz.DelMode := ADelMode;
  AOperParamz.RezMode := ARezMode;
  AOperParamz.Viza := AViza;
  AOperParamz.ALevel := 0;

  AReadOnly := AReadOnly ;
  IsMy := (dsArc.DataSet.FieldByName('id_UserChecker').AsInteger = DM.IDUser);
  IsMy := true;

{  if not AOperParamz.RezMode and (OperVid = 201) then
  begin
    AOperParamz.ID_Oper := -1;
    AOperParamz.id_OperParent := ID;
  end;   }
//  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Result := false;
  if AOperVid = -1 then
    AOperVid := dsArc.DataSet.FieldByName('OperVid').AsInteger;
  case AOperVid of
    -1 : EditOperCrnCh(Handle, AOperParamz); 
    0 : EditOperEmpty(Handle, AOperParamz);
    1 : EditOperWare(Handle, AOperParamz);
    2 : EditOperFin(Handle, AOperParamz);
    4 : EditOperOffset(Handle, AOperParamz);

    101 : EditOperWare_FFF(Handle, AOperParamz);
    102 : EditOperFin_FFF(Handle, AOperParamz);

    201 : EditOperWare(Handle, AOperParamz);
  end;
end;

procedure TCA_W_Det.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGridEh(Sender).ScreenToClient(P);
  if P.y <= THackGridEh(Sender).RowHeights[0] then
    Exit;
  aProperty.Execute;
end;

procedure TCA_W_Det.dsArcDataChange(Sender: TObject; Field: TField);
begin
  aNewCopyOper2.Enabled := not cdsPrfLoss.IsEmpty;
  aProperty.Enabled := not cdsPrfLoss.IsEmpty;
  aDelete.Enabled := not cdsPrfLoss.IsEmpty and (cdsPrfLoss.FieldByName('CheckDate').IsNull);
  aGreedToExcel.Enabled := not cdsPrfLoss.IsEmpty;
  aShowArcAnaliz.Enabled := not cdsPrfLoss.IsEmpty;
end;

end.

