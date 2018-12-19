unit uRepLossDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, frBsnSelector, foMyFunc, frArcLite,
  Mask, ToolEdit, Menus, Db, DBClient;

type
  TRepLossDet = class(TForm)
    Panel1: TPanel;
    btnCancel: TButton;
    fArcLite1: TfArcLite;
    cdsRep: TClientDataSet;
    cdsRepWorkSum: TFloatField;
    cdsRepid_Oper: TAutoIncField;
    cdsRepid_OperParent: TIntegerField;
    cdsRepid_old_Oper: TIntegerField;
    cdsRepDateCreate: TDateTimeField;
    cdsRepid_LC_Oper: TIntegerField;
    cdsRepOperVid: TIntegerField;
    cdsRepid_Replicator: TIntegerField;
    cdsRepReplicatorShortName: TStringField;
    cdsRepid_UserCreator: TIntegerField;
    cdsRepid_business: TIntegerField;
    cdsRepId_CurrencyBsn: TIntegerField;
    cdsRepBusinessName: TStringField;
    cdsRepBusinessNum: TStringField;
    cdsRepDateLocal: TDateTimeField;
    cdsRepCorrect: TBooleanField;
    cdsRepOperTypeIn: TBooleanField;
    cdsRepId_CurrencyOper: TIntegerField;
    cdsRepCurrencyOperName: TStringField;
    cdsRepCurrencyOperShortName: TStringField;
    cdsRepAmountOper: TFloatField;
    cdsRepAmountOper2: TFloatField;
    cdsRepPriceOper: TFloatField;
    cdsRepRateOper: TFloatField;
    cdsRepid_Measure: TIntegerField;
    cdsRepMeasureName: TStringField;
    cdsRepRealKoef: TFloatField;
    cdsRepAmountOperBaseMS: TFloatField;
    cdsRepId_CurrencySys: TIntegerField;
    cdsRepCurrencySysName: TStringField;
    cdsRepCurrencySysShortName: TStringField;
    cdsRepSummSys: TFloatField;
    cdsRepRateSys: TFloatField;
    cdsRepid_Acc: TIntegerField;
    cdsRepid_Warehouse: TIntegerField;
    cdsRepid_Manufact: TIntegerField;
    cdsRepSrcName: TStringField;
    cdsRepSrcID_Main: TIntegerField;
    cdsRepid_Repr: TIntegerField;
    cdsRepid_Acc_Ext: TIntegerField;
    cdsRepid_Warehouse_Ext: TIntegerField;
    cdsRepid_Manufact_Ext: TIntegerField;
    cdsRepReprName: TStringField;
    cdsRepReprID_Main: TIntegerField;
    cdsRepId_CurrencyInv: TIntegerField;
    cdsRepPriceInv: TFloatField;
    cdsRepRateInv: TFloatField;
    cdsRepCurrencyInvName: TStringField;
    cdsRepCurrencyInvShortName: TStringField;
    cdsRepid_Goods: TIntegerField;
    cdsRepWareName: TStringField;
    cdsRepWareID_Main: TIntegerField;
    cdsRepKoeff: TIntegerField;
    cdsRepKoeffName: TStringField;
    cdsRepCheckDate: TDateTimeField;
    cdsRepid_UserChecker: TIntegerField;
    cdsRepid_FormalDistrib: TIntegerField;
    cdsRepFormalDistribName: TStringField;
    cdsRepid_FuncDistrib: TIntegerField;
    cdsRepFuncDistribName: TStringField;
    cdsRepDeleted: TBooleanField;
    cdsRepid_ContrAgent: TIntegerField;
    cdsRepContrAgentName: TStringField;
    cdsRepid_CAGroup: TIntegerField;
    cdsRepSummOper: TFloatField;
    cdsRepTypeName: TStringField;
    cdsRepOperNum: TStringField;
    cdsRepOperDelta: TFloatField;
    cdsRepOperRateDelta: TFloatField;
    cdsRepOperTotalDelta: TFloatField;
    cdsRepDTDiff: TIntegerField;
    cdsRepHasViza: TBooleanField;
    cdsRepOperState: TIntegerField;
    cdsRepHidedOper: TBooleanField;
    cdsRepOperSummSys: TFloatField;
    cdsRepRateMain: TFloatField;
    cdsRepid_Repr_Ex: TIntegerField;
    cdsRepid_DocType: TIntegerField;
    cdsRepImp_PayBasic: TStringField;
    cdsRepAccInv_PayAssignment: TStringField;
    cdsRepContract: TStringField;
    cdsRepOperDeltaCrn: TFloatField;
    cdsRepOperRateDeltaCrn: TFloatField;
    cdsRepOperTotalDeltaCrn: TFloatField;
    cdsRepOperCrnName: TStringField;
    cdsRepOperSum_Offer: TFloatField;
    cdsRepCRN_OLD_OperSum: TFloatField;
    cdsRepCRN_OLD_OperSum_Offer: TFloatField;
    cdsRepCRN_OperSum_Inv: TFloatField;
    cdsRepOperSumCalced: TFloatField;
    cdsRepOperSum_OfferCalced: TFloatField;
    cdsRepBlocked: TBooleanField;
    cdsRepCurrencyBsnName: TStringField;
    cdsRepid_Ctg_Goods_2: TIntegerField;
    cdsRepOpComment: TStringField;
    cdsRepRealDataCreate: TDateTimeField;
    cdsRepOperTypeSIGN: TIntegerField;
    cdsRepHasChild: TIntegerField;
    cdsRepDig1: TFloatField;
    cdsRepDig2: TFloatField;
    cdsRepDig3: TFloatField;
    cdsRepDig4: TFloatField;
    cdsRepDig5: TFloatField;
    cdsRepDig6: TFloatField;
    cdsRepDig7: TFloatField;
    cdsRepDig8: TFloatField;
    cdsRepDig9: TFloatField;
    cdsRepDig10: TFloatField;
    cdsRepDig11: TFloatField;
    cdsRepDig12: TFloatField;
    cdsRepDig13: TFloatField;
    cdsRepDig14: TFloatField;
    cdsRepDig15: TFloatField;
    cdsRepStr1: TStringField;
    cdsRepStr2: TStringField;
    cdsRepStr3: TStringField;
    cdsRepStr4: TStringField;
    cdsRepStr5: TStringField;
    cdsRepStr6: TStringField;
    cdsRepStr7: TStringField;
    cdsRepStr8: TStringField;
    cdsRepStr9: TStringField;
    cdsRepStr10: TStringField;
    cdsRepStr11: TStringField;
    cdsRepStr12: TStringField;
    cdsRepStr13: TStringField;
    cdsRepStr14: TStringField;
    cdsRepStr15: TStringField;
    cdsRepid_OperWare: TAutoIncField;
    cdsRepOperVidName: TStringField;
    cdsRepCRN_OperSumRez: TFloatField;
    cdsRepOnlyDate: TDateTimeField;
    cdsRepis_Mirr: TBooleanField;
    cdsRepid_Acc_Group: TIntegerField;
    cdsRepid_Warehouse_Group: TIntegerField;
    cdsRepid_Manufact_Group: TIntegerField;
    cdsRepVatIn: TBooleanField;
    cdsRepAutoGen: TBooleanField;
    cdsRepCreatorFIO: TStringField;
    cdsRepCheckerFIO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure fArcLite1ToolButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FBlnDetail : TLossDetailData;
  public
    procedure Initialize(ABlnDetail : TLossDetailData);
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  RepLossDet: TRepLossDet;

  procedure ShowBlnDetail_3(ACaption : String; ABlnDetail : TLossDetailData);

implementation

uses uDM;

{$R *.DFM}

procedure ShowBlnDetail_3(ACaption : String; ABlnDetail : TLossDetailData);
var F : TRepLossDet;
begin
  if ABlnDetail.RepNum = - 26 then
  begin
    ABlnDetail.Str3 := Null;
    ABlnDetail.Str4 := Null;
    ABlnDetail.M := 0;
  end;
//  DM.Rights_GetUserRights(6, Null);
  F := TRepLossDet.Create(nil);
  try
    F.Caption := ACaption;
    F.Show;
    F.Repaint;
    F.Initialize(ABlnDetail);
  LoadFormSettingsToRegistry(F, SRegPath + '\' + F.Name);
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

{ TRptForm }


constructor TRepLossDet.Create(AOwner: TCOmponent);
var    V : Variant;
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  fArcLite1.ToolBar2.Visible := true;
  fArcLite1.aRefreshe.Visible := true;
  LoadValFromRegistry(V, SRegPath + '\' + Name, 'id_Bsn');
//  if V <> Null then
//    fRptFrame1.fBsnSelector1.ID := V;
end;

procedure TRepLossDet.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TRepLossDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TRepLossDet.btnCancelClick(Sender: TObject);
begin
  Close;
end;

destructor TRepLossDet.Destroy;
begin
//  SaveValToRegistry(fRptFrame1.dtFrom.Date, SRegPath + '\' + Name, 'dtFrom');
//  SaveValToRegistry(fRptFrame1.dtTo.Date, SRegPath + '\' + Name, 'dtTo');
//  SaveValToRegistry(fRptFrame1.fBsnSelector1.ID, SRegPath + '\' + Name, 'id_Bsn');
  inherited;

end;

procedure TRepLossDet.Initialize(ABlnDetail: TLossDetailData);
var FFF : Extended;
begin
  fArcLite1.dsArc.DataSet := cdsRep;
  fArcLite1.Setid_business(ABlnDetail.id_business);
  FBlnDetail := ABlnDetail;

  Screen.Cursor := crSQLWait;
  try
      with cdsRep do
      begin
        Close;
        Params.ParamByName('@id_business').Value := FBlnDetail.id_business;
      Params.ParamByName('@RepNum').Value := FBlnDetail.RepNum;
      Params.ParamByName('@Year').Value := FBlnDetail.Year;
      Params.ParamByName('@Str3').Value := FBlnDetail.Str3;
      if FBlnDetail.Str4 = '' then
        Params.ParamByName('@Str4').Value := Null
      else
        Params.ParamByName('@Str4').Value := FBlnDetail.Str4;
      Params.ParamByName('@M').Value := FBlnDetail.M;
        Open;

      end;
  finally
    fArcLite1.dsArc.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TRepLossDet.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name );
end;



procedure TRepLossDet.fArcLite1ToolButton6Click(Sender: TObject);
begin
  cdsRep.Close;
  cdsRep.Open;

end;

procedure TRepLossDet.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name );

end;

end.
