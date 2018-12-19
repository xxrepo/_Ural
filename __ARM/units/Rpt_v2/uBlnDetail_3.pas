unit uBlnDetail_3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, frBsnSelector, foMyFunc, frArcLite,
  Mask, ToolEdit, Menus, Db, DBClient;

type
  TBlnDetail_3 = class(TForm)
    Panel1: TPanel;
    btnCancel: TButton;
    Panel3: TPanel;
    Label1: TLabel;
    edSum: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    Panel5: TPanel;
    fBsnSelector1: TfBsnSelector;
    Panel4: TPanel;
    fArcLite1: TfArcLite;
    Label2: TLabel;
    dtTo: TDateTimePicker;
    dtTimeTo: TDateTimePicker;
    Label3: TLabel;
    cdsArcLite_v2: TClientDataSet;
    Label4: TLabel;
    dtDFrom: TDateTimePicker;
    Label5: TLabel;
    dtTFrom: TDateTimePicker;
    cdsArcLite_v2WorkSum: TFloatField;
    cdsArcLite_v2id_Oper: TAutoIncField;
    cdsArcLite_v2id_OperParent: TIntegerField;
    cdsArcLite_v2id_old_Oper: TIntegerField;
    cdsArcLite_v2DateCreate: TDateTimeField;
    cdsArcLite_v2id_LC_Oper: TIntegerField;
    cdsArcLite_v2OperVid: TIntegerField;
    cdsArcLite_v2id_Replicator: TIntegerField;
    cdsArcLite_v2ReplicatorShortName: TStringField;
    cdsArcLite_v2id_UserCreator: TIntegerField;
    cdsArcLite_v2id_business: TIntegerField;
    cdsArcLite_v2Id_CurrencyBsn: TIntegerField;
    cdsArcLite_v2BusinessName: TStringField;
    cdsArcLite_v2BusinessNum: TStringField;
    cdsArcLite_v2DateLocal: TDateTimeField;
    cdsArcLite_v2Correct: TBooleanField;
    cdsArcLite_v2OperTypeIn: TBooleanField;
    cdsArcLite_v2Id_CurrencyOper: TIntegerField;
    cdsArcLite_v2CurrencyOperName: TStringField;
    cdsArcLite_v2CurrencyOperShortName: TStringField;
    cdsArcLite_v2AmountOper: TFloatField;
    cdsArcLite_v2AmountOper2: TFloatField;
    cdsArcLite_v2PriceOper: TFloatField;
    cdsArcLite_v2RateOper: TFloatField;
    cdsArcLite_v2id_Measure: TIntegerField;
    cdsArcLite_v2MeasureName: TStringField;
    cdsArcLite_v2RealKoef: TFloatField;
    cdsArcLite_v2AmountOperBaseMS: TFloatField;
    cdsArcLite_v2Id_CurrencySys: TIntegerField;
    cdsArcLite_v2CurrencySysName: TStringField;
    cdsArcLite_v2CurrencySysShortName: TStringField;
    cdsArcLite_v2SummSys: TFloatField;
    cdsArcLite_v2RateSys: TFloatField;
    cdsArcLite_v2id_Acc: TIntegerField;
    cdsArcLite_v2id_Warehouse: TIntegerField;
    cdsArcLite_v2id_Manufact: TIntegerField;
    cdsArcLite_v2SrcName: TStringField;
    cdsArcLite_v2SrcID_Main: TIntegerField;
    cdsArcLite_v2id_Repr: TIntegerField;
    cdsArcLite_v2id_Acc_Ext: TIntegerField;
    cdsArcLite_v2id_Warehouse_Ext: TIntegerField;
    cdsArcLite_v2id_Manufact_Ext: TIntegerField;
    cdsArcLite_v2ReprName: TStringField;
    cdsArcLite_v2ReprID_Main: TIntegerField;
    cdsArcLite_v2Id_CurrencyInv: TIntegerField;
    cdsArcLite_v2PriceInv: TFloatField;
    cdsArcLite_v2RateInv: TFloatField;
    cdsArcLite_v2CurrencyInvName: TStringField;
    cdsArcLite_v2CurrencyInvShortName: TStringField;
    cdsArcLite_v2id_Goods: TIntegerField;
    cdsArcLite_v2WareName: TStringField;
    cdsArcLite_v2WareID_Main: TIntegerField;
    cdsArcLite_v2Koeff: TIntegerField;
    cdsArcLite_v2KoeffName: TStringField;
    cdsArcLite_v2CheckDate: TDateTimeField;
    cdsArcLite_v2id_UserChecker: TIntegerField;
    cdsArcLite_v2id_FormalDistrib: TIntegerField;
    cdsArcLite_v2FormalDistribName: TStringField;
    cdsArcLite_v2id_FuncDistrib: TIntegerField;
    cdsArcLite_v2FuncDistribName: TStringField;
    cdsArcLite_v2Deleted: TBooleanField;
    cdsArcLite_v2id_ContrAgent: TIntegerField;
    cdsArcLite_v2ContrAgentName: TStringField;
    cdsArcLite_v2id_CAGroup: TIntegerField;
    cdsArcLite_v2SummOper: TFloatField;
    cdsArcLite_v2TypeName: TStringField;
    cdsArcLite_v2OperNum: TStringField;
    cdsArcLite_v2OperDelta: TFloatField;
    cdsArcLite_v2OperRateDelta: TFloatField;
    cdsArcLite_v2OperTotalDelta: TFloatField;
    cdsArcLite_v2DTDiff: TIntegerField;
    cdsArcLite_v2HasViza: TBooleanField;
    cdsArcLite_v2OperState: TIntegerField;
    cdsArcLite_v2HidedOper: TBooleanField;
    cdsArcLite_v2OperSummSys: TFloatField;
    cdsArcLite_v2RateMain: TFloatField;
    cdsArcLite_v2id_Repr_Ex: TIntegerField;
    cdsArcLite_v2id_DocType: TIntegerField;
    cdsArcLite_v2Imp_PayBasic: TStringField;
    cdsArcLite_v2AccInv_PayAssignment: TStringField;
    cdsArcLite_v2Contract: TStringField;
    cdsArcLite_v2OperDeltaCrn: TFloatField;
    cdsArcLite_v2OperRateDeltaCrn: TFloatField;
    cdsArcLite_v2OperTotalDeltaCrn: TFloatField;
    cdsArcLite_v2OperCrnName: TStringField;
    cdsArcLite_v2OperSum_Offer: TFloatField;
    cdsArcLite_v2CRN_OLD_OperSum: TFloatField;
    cdsArcLite_v2CRN_OLD_OperSum_Offer: TFloatField;
    cdsArcLite_v2CRN_OperSum_Inv: TFloatField;
    cdsArcLite_v2OperSumCalced: TFloatField;
    cdsArcLite_v2OperSum_OfferCalced: TFloatField;
    cdsArcLite_v2Blocked: TBooleanField;
    cdsArcLite_v2CurrencyBsnName: TStringField;
    cdsArcLite_v2id_Ctg_Goods_2: TIntegerField;
    cdsArcLite_v2OpComment: TStringField;
    cdsArcLite_v2RealDataCreate: TDateTimeField;
    cdsArcLite_v2OperTypeSIGN: TIntegerField;
    cdsArcLite_v2HasChild: TIntegerField;
    cdsArcLite_v2Dig1: TFloatField;
    cdsArcLite_v2Dig2: TFloatField;
    cdsArcLite_v2Dig3: TFloatField;
    cdsArcLite_v2Dig4: TFloatField;
    cdsArcLite_v2Dig5: TFloatField;
    cdsArcLite_v2Dig6: TFloatField;
    cdsArcLite_v2Dig7: TFloatField;
    cdsArcLite_v2Dig8: TFloatField;
    cdsArcLite_v2Dig9: TFloatField;
    cdsArcLite_v2Dig10: TFloatField;
    cdsArcLite_v2Dig11: TFloatField;
    cdsArcLite_v2Dig12: TFloatField;
    cdsArcLite_v2Dig13: TFloatField;
    cdsArcLite_v2Dig14: TFloatField;
    cdsArcLite_v2Dig15: TFloatField;
    cdsArcLite_v2Str1: TStringField;
    cdsArcLite_v2Str2: TStringField;
    cdsArcLite_v2Str3: TStringField;
    cdsArcLite_v2Str4: TStringField;
    cdsArcLite_v2Str5: TStringField;
    cdsArcLite_v2Str6: TStringField;
    cdsArcLite_v2Str7: TStringField;
    cdsArcLite_v2Str8: TStringField;
    cdsArcLite_v2Str9: TStringField;
    cdsArcLite_v2Str10: TStringField;
    cdsArcLite_v2Str11: TStringField;
    cdsArcLite_v2Str12: TStringField;
    cdsArcLite_v2Str13: TStringField;
    cdsArcLite_v2Str14: TStringField;
    cdsArcLite_v2Str15: TStringField;
    cdsArcLite_v2id_OperWare: TAutoIncField;
    cdsArcLite_v2OperVidName: TStringField;
    cdsArcLite_v2CRN_OperSumRez: TFloatField;
    cdsArcLite_v2OnlyDate: TDateTimeField;
    cdsArcLite_v2is_Mirr: TBooleanField;
    cdsArcLite_v2id_Acc_Group: TIntegerField;
    cdsArcLite_v2id_Warehouse_Group: TIntegerField;
    cdsArcLite_v2id_Manufact_Group: TIntegerField;
    cdsArcLite_v2VatIn: TBooleanField;
    cdsArcLite_v2AutoGen: TBooleanField;
    cdsArcLite_v2CreatorFIO: TStringField;
    cdsArcLite_v2CheckerFIO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dtToChange(Sender: TObject);
    procedure dtDFromChange(Sender: TObject);
  private
    FBlnDetail : TBlnDetailData;
    procedure InitializeClick;
    function GetBlnDateTime: Variant;
    procedure SetBlnDateTime(const Value: Variant);
    function GetBlnDateTime_int(ATo: boolean): Variant;
    procedure SetBlnDateTime_int(const Value: Variant; ATo: boolean);
    function GetBlnDateTimeFrom: Variant;
    procedure SetBlnDateTimeFrom(const Value: Variant);
  public
    procedure Initialize(ABlnDetail : TBlnDetailData);
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
    property BlnDateTime : Variant read GetBlnDateTime write SetBlnDateTime;
    property BlnDateTimeFrom : Variant read GetBlnDateTimeFrom write SetBlnDateTimeFrom;
  end;

var
  BlnDetail_3: TBlnDetail_3;

  procedure ShowBlnDetail_3(ACaption : String; ABlnDetail : TBlnDetailData);

implementation

uses uDM;

{$R *.DFM}

procedure ShowBlnDetail_3(ACaption : String; ABlnDetail : TBlnDetailData);
var F : TBlnDetail_3;
begin
//  DM.Rights_GetUserRights(6, Null);
  F := TBlnDetail_3.Create(nil);
  try
    F.Caption := ACaption;
    F.Show;
    F.Repaint;
    F.Initialize(ABlnDetail);
  LoadFormSettingsToRegistry(F, SRegPath + '\' + F.Name
//  + VarToStr(ABlnDetail.id_business)
  + VarToStr(ABlnDetail.isRawZ)
  + VarToStr(ABlnDetail.isNotRawZ)
  + VarToStr(ABlnDetail.isCRN)
  + VarToStr(ABlnDetail.isUp)
  + VarToStr(ABlnDetail.isDown)
  + VarToStr(ABlnDetail.isInFromManuf)
//  + VarToStr(ABlnDetail.id_Manufact)
  );
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

{ TRptForm }


function TBlnDetail_3.GetBlnDateTime_int(ATo : boolean): Variant;
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

procedure TBlnDetail_3.SetBlnDateTime_int(const Value: Variant; ATo : boolean);
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
  if ATo then
    Label1.Enabled := ctrlDate.Checked
  else
    Label3.Enabled := ctrlDate.Checked;
end;


constructor TBlnDetail_3.Create(AOwner: TCOmponent);
var    V : Variant;
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  fArcLite1.ToolBar2.Visible := true;
  LoadValFromRegistry(V, SRegPath + '\' + Name, 'id_Bsn');
//  if V <> Null then
//    fRptFrame1.fBsnSelector1.ID := V;
  dtTo.Date := Now;
  dtTimeTo.Time := Time;
  dtTo.Checked := false;
  dtTimeTo.Enabled := false;
  dtTimeTo.Checked := false;

end;

procedure TBlnDetail_3.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TBlnDetail_3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TBlnDetail_3.btnCancelClick(Sender: TObject);
begin
  Close;
end;

destructor TBlnDetail_3.Destroy;
begin
//  SaveValToRegistry(fRptFrame1.dtFrom.Date, SRegPath + '\' + Name, 'dtFrom');
//  SaveValToRegistry(fRptFrame1.dtTo.Date, SRegPath + '\' + Name, 'dtTo');
//  SaveValToRegistry(fRptFrame1.fBsnSelector1.ID, SRegPath + '\' + Name, 'id_Bsn');
  inherited;

end;

procedure TBlnDetail_3.fBsnSelector1Button1Click(Sender: TObject);
var Old : Variant;
begin
  Old := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if fBsnSelector1.ID <> Old then
    InitializeClick;
end;

procedure TBlnDetail_3.Button1Click(Sender: TObject);
begin
  InitializeClick;
end;

procedure TBlnDetail_3.InitializeClick;
begin
  FBlnDetail.id_business := fBsnSelector1.ID;
  FBlnDetail.DateTo := BlnDateTime;
  FBlnDetail.DateFrom := BlnDateTimeFrom;
  Initialize(FBlnDetail);
end;

procedure TBlnDetail_3.Initialize(ABlnDetail: TBlnDetailData);
var FFF : Extended;
    ADate : Variant;
    ADateFrom : Variant;
begin
  fArcLite1.dsArc.DataSet := cdsArcLite_v2;
  fArcLite1.Setid_business(ABlnDetail.id_business);
  FBlnDetail := ABlnDetail;

  if fBsnSelector1.ID <> FBlnDetail.id_business then
    fBsnSelector1.ID := FBlnDetail.id_business;

  BlnDateTime := FBlnDetail.DateTo;
  BlnDateTimeFrom := FBlnDetail.DateFrom;

  Screen.Cursor := crSQLWait;
  try
    if fBsnSelector1.ID > 0 then
    begin
      with TClientDataSet(fArcLite1.dsArc.DataSet) do
      begin
        Close;
        Params.ParamByName('@id_business').Value := FBlnDetail.id_business;
        ADate := BlnDateTime;
        if ADate = Null then
          Params.ParamByName('@Date').Value := ADate
         else
           Params.ParamByName('@Date').AsDateTime := ADate {- 2};


        ADateFrom := BlnDateTimeFrom;
        Params.ParamByName('@DateFrom').AsDateTime := ADateFrom {- 2};
        Params.ParamByName('@OrdNum').Value := FBlnDetail.OrdNum;
        Params.ParamByName('@id_Acc').Value := FBlnDetail.id_Acc;
        Params.ParamByName('@id_Manufact').Value := FBlnDetail.id_Manufact;
        Params.ParamByName('@id_CA').Value := FBlnDetail.id_CA;
        Open;

        DisableControls;
        First;
        FFF := 0;
        while not Eof do
        begin
          FFF := FFF + FieldByName('WorkSum').AsFloat;
          Next;
        end;
        First;
        edSum.Text := FormatFloat('#0.00', FFF);
     //   edSum.Text := Trim(StringReplace(FormatFloat('### ### ### ##0.00', FFF), ' ', '', [rfReplaceAll]));
      end;
    end;
  finally
    fArcLite1.dsArc.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TBlnDetail_3.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name
//  + VarToStr(FBlnDetail.id_business)
  + VarToStr(FBlnDetail.isRawZ)
  + VarToStr(FBlnDetail.isNotRawZ)
  + VarToStr(FBlnDetail.isCRN)
  + VarToStr(FBlnDetail.isUp)
  + VarToStr(FBlnDetail.isInFromManuf)
//  + VarToStr(FBlnDetail.id_Manufact)
  );
end;

procedure TBlnDetail_3.dtToChange(Sender: TObject);
var B : boolean;
begin
  B := dtTimeTo.Checked and dtTimeTo.Enabled;
  dtTimeTo.Enabled := dtTo.Checked;
  dtTimeTo.Checked := B;
  Label1.Enabled := dtTo.Checked;

end;

function TBlnDetail_3.GetBlnDateTime: Variant;
begin
  Result := GetBlnDateTime_int(true);
end;

procedure TBlnDetail_3.SetBlnDateTime(const Value: Variant);
var TTT : Extended;
    Year, Month, Day, Hour, Min, Sec, MSec: Word;
    V : Variant;
begin
  SetBlnDateTime_int(Value, true);
end;

function TBlnDetail_3.GetBlnDateTimeFrom: Variant;
begin
  Result := GetBlnDateTime_int(false);
end;

procedure TBlnDetail_3.SetBlnDateTimeFrom(const Value: Variant);
begin
  SetBlnDateTime_int(Value, false);
end;

procedure TBlnDetail_3.dtDFromChange(Sender: TObject);
var B : boolean;
begin
  B := dtTFrom.Checked and dtTFrom.Enabled;
  dtTFrom.Enabled := dtDFrom.Checked;
  dtTFrom.Checked := B;
  Label3.Enabled := dtDFrom.Checked;

end;

end.
