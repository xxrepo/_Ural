unit uInvDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, frBsnSelector, foMyFunc, frArcLite,
  Mask, ToolEdit, Menus, Db, DBClient;

type
  TInvDet = class(TForm)
    Panel1: TPanel;
    btnCancel: TButton;
    Panel2: TPanel;
    Button1: TButton;
    Panel5: TPanel;
    fBsnSelector1: TfBsnSelector;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    dtFrom: TDateEdit;
    dtTo: TDateEdit;
    fArcLite1: TfArcLite;
    cdsInvWare: TClientDataSet;
    cdsInvWareAmountOper126: TFloatField;
    cdsInvWareSummOper126: TFloatField;
    cdsInvWareid_Oper: TAutoIncField;
    cdsInvWareid_OperParent: TIntegerField;
    cdsInvWareid_old_Oper: TIntegerField;
    cdsInvWareDateCreate: TDateTimeField;
    cdsInvWareid_LC_Oper: TIntegerField;
    cdsInvWareOperVid: TIntegerField;
    cdsInvWareid_Replicator: TIntegerField;
    cdsInvWareReplicatorShortName: TStringField;
    cdsInvWareid_UserCreator: TIntegerField;
    cdsInvWareid_business: TIntegerField;
    cdsInvWareId_CurrencyBsn: TIntegerField;
    cdsInvWareBusinessName: TStringField;
    cdsInvWareBusinessNum: TStringField;
    cdsInvWareDateLocal: TDateTimeField;
    cdsInvWareCorrect: TBooleanField;
    cdsInvWareOperTypeIn: TBooleanField;
    cdsInvWareId_CurrencyOper: TIntegerField;
    cdsInvWareCurrencyOperName: TStringField;
    cdsInvWareCurrencyOperShortName: TStringField;
    cdsInvWareAmountOper: TFloatField;
    cdsInvWareAmountOper2: TFloatField;
    cdsInvWarePriceOper: TFloatField;
    cdsInvWareRateOper: TFloatField;
    cdsInvWareid_Measure: TIntegerField;
    cdsInvWareMeasureName: TStringField;
    cdsInvWareRealKoef: TFloatField;
    cdsInvWareAmountOperBaseMS: TFloatField;
    cdsInvWareId_CurrencySys: TIntegerField;
    cdsInvWareCurrencySysName: TStringField;
    cdsInvWareCurrencySysShortName: TStringField;
    cdsInvWareSummSys: TFloatField;
    cdsInvWareRateSys: TFloatField;
    cdsInvWareid_Acc: TIntegerField;
    cdsInvWareid_Warehouse: TIntegerField;
    cdsInvWareid_Manufact: TIntegerField;
    cdsInvWareSrcName: TStringField;
    cdsInvWareSrcID_Main: TIntegerField;
    cdsInvWareid_Repr: TIntegerField;
    cdsInvWareid_Acc_Ext: TIntegerField;
    cdsInvWareid_Warehouse_Ext: TIntegerField;
    cdsInvWareid_Manufact_Ext: TIntegerField;
    cdsInvWareReprName: TStringField;
    cdsInvWareReprID_Main: TIntegerField;
    cdsInvWareId_CurrencyInv: TIntegerField;
    cdsInvWarePriceInv: TFloatField;
    cdsInvWareRateInv: TFloatField;
    cdsInvWareCurrencyInvName: TStringField;
    cdsInvWareCurrencyInvShortName: TStringField;
    cdsInvWareid_Goods: TIntegerField;
    cdsInvWareWareName: TStringField;
    cdsInvWareWareID_Main: TIntegerField;
    cdsInvWareKoeff: TIntegerField;
    cdsInvWareKoeffName: TStringField;
    cdsInvWareCheckDate: TDateTimeField;
    cdsInvWareid_UserChecker: TIntegerField;
    cdsInvWareid_FormalDistrib: TIntegerField;
    cdsInvWareFormalDistribName: TStringField;
    cdsInvWareid_FuncDistrib: TIntegerField;
    cdsInvWareFuncDistribName: TStringField;
    cdsInvWareDeleted: TBooleanField;
    cdsInvWareid_ContrAgent: TIntegerField;
    cdsInvWareContrAgentName: TStringField;
    cdsInvWareid_CAGroup: TIntegerField;
    cdsInvWareSummOper: TFloatField;
    cdsInvWareTypeName: TStringField;
    cdsInvWareOperNum: TStringField;
    cdsInvWareOperDelta: TFloatField;
    cdsInvWareOperRateDelta: TFloatField;
    cdsInvWareOperTotalDelta: TFloatField;
    cdsInvWareDTDiff: TIntegerField;
    cdsInvWareHasViza: TBooleanField;
    cdsInvWareOperState: TIntegerField;
    cdsInvWareHidedOper: TBooleanField;
    cdsInvWareOperSummSys: TFloatField;
    cdsInvWareRateMain: TFloatField;
    cdsInvWareid_Repr_Ex: TIntegerField;
    cdsInvWareid_DocType: TIntegerField;
    cdsInvWareImp_PayBasic: TStringField;
    cdsInvWareAccInv_PayAssignment: TStringField;
    cdsInvWareContract: TStringField;
    cdsInvWareOperDeltaCrn: TFloatField;
    cdsInvWareOperRateDeltaCrn: TFloatField;
    cdsInvWareOperTotalDeltaCrn: TFloatField;
    cdsInvWareOperCrnName: TStringField;
    cdsInvWareOperSum_Offer: TFloatField;
    cdsInvWareCRN_OLD_OperSum: TFloatField;
    cdsInvWareCRN_OLD_OperSum_Offer: TFloatField;
    cdsInvWareCRN_OperSum_Inv: TFloatField;
    cdsInvWareOperSumCalced: TFloatField;
    cdsInvWareOperSum_OfferCalced: TFloatField;
    cdsInvWareBlocked: TBooleanField;
    cdsInvWareCurrencyBsnName: TStringField;
    cdsInvWareid_Ctg_Goods_2: TIntegerField;
    cdsInvWareOpComment: TStringField;
    cdsInvWareRealDataCreate: TDateTimeField;
    cdsInvWareOperTypeSIGN: TIntegerField;
    cdsInvWareHasChild: TIntegerField;
    cdsInvWareDig1: TFloatField;
    cdsInvWareDig2: TFloatField;
    cdsInvWareDig3: TFloatField;
    cdsInvWareDig4: TFloatField;
    cdsInvWareDig5: TFloatField;
    cdsInvWareDig6: TFloatField;
    cdsInvWareDig7: TFloatField;
    cdsInvWareDig8: TFloatField;
    cdsInvWareDig9: TFloatField;
    cdsInvWareDig10: TFloatField;
    cdsInvWareDig11: TFloatField;
    cdsInvWareDig12: TFloatField;
    cdsInvWareDig13: TFloatField;
    cdsInvWareDig14: TFloatField;
    cdsInvWareDig15: TFloatField;
    cdsInvWareStr1: TStringField;
    cdsInvWareStr2: TStringField;
    cdsInvWareStr3: TStringField;
    cdsInvWareStr4: TStringField;
    cdsInvWareStr5: TStringField;
    cdsInvWareStr6: TStringField;
    cdsInvWareStr7: TStringField;
    cdsInvWareStr8: TStringField;
    cdsInvWareStr9: TStringField;
    cdsInvWareStr10: TStringField;
    cdsInvWareStr11: TStringField;
    cdsInvWareStr12: TStringField;
    cdsInvWareStr13: TStringField;
    cdsInvWareStr14: TStringField;
    cdsInvWareStr15: TStringField;
    cdsInvWareid_OperWare: TAutoIncField;
    cdsInvWareOperVidName: TStringField;
    cdsInvWareCRN_OperSumRez: TFloatField;
    cdsInvWareOnlyDate: TDateTimeField;
    cdsInvWareis_Mirr: TBooleanField;
    cdsInvWareid_Acc_Group: TIntegerField;
    cdsInvWareid_Warehouse_Group: TIntegerField;
    cdsInvWareid_Manufact_Group: TIntegerField;
    cdsInvWareVatIn: TBooleanField;
    cdsInvWareAutoGen: TBooleanField;
    cdsInvWareCreatorFIO: TStringField;
    cdsInvWareCheckerFIO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure InitializeClick;
  public
    procedure Initialize(id_Project : integer; id_Manufact : Variant; ACaption : String);
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  InvDet: TInvDet;

  procedure ShowInvDet2(id_Project : integer; id_Manufact : Variant; ACaption : String);

implementation

uses uDM;

{$R *.DFM}

procedure ShowInvDet2(id_Project : integer; id_Manufact : Variant; ACaption : String);
var F : TInvDet;
begin
 // DM.Rights_GetUserRights(6, Null);
  F := TInvDet.Create(nil);
  try
    F.Show;
  LoadFormSettingsToRegistry(F, SRegPath + '\' + F.ClassName
  );
    F.Repaint;
    F.Initialize(id_Project, id_Manufact, ACaption);
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

{ TRptForm }

constructor TInvDet.Create(AOwner: TCOmponent);
var    V : Variant;
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  fArcLite1.ToolBar2.Visible := true;
  LoadValFromRegistry(V, SRegPath + '\' + Name, 'id_Bsn');
//  if V <> Null then
//    fRptFrame1.fBsnSelector1.ID := V;

end;

procedure TInvDet.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TInvDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TInvDet.btnCancelClick(Sender: TObject);
begin
  Close;
end;

destructor TInvDet.Destroy;
begin
//  SaveValToRegistry(fRptFrame1.dtFrom.Date, SRegPath + '\' + Name, 'dtFrom');
//  SaveValToRegistry(fRptFrame1.dtTo.Date, SRegPath + '\' + Name, 'dtTo');
//  SaveValToRegistry(fRptFrame1.fBsnSelector1.ID, SRegPath + '\' + Name, 'id_Bsn');
  inherited;

end;

procedure TInvDet.fBsnSelector1Button1Click(Sender: TObject);
var Old : Variant;
begin
  Old := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if fBsnSelector1.ID <> Old then
    InitializeClick;
end;

procedure TInvDet.Button1Click(Sender: TObject);
begin
  InitializeClick;
end;

procedure TInvDet.InitializeClick;
begin
end;

procedure TInvDet.Initialize(id_Project : integer; id_Manufact : Variant; ACaption : String);
var FFF : Extended;
begin
  fArcLite1.Setid_business(24);
  if ACaption <> '' then
    Caption := ACaption;
  Screen.Cursor := crSQLWait;
  try
    fArcLite1.dsArc.DataSet := cdsInvWare;
    with cdsInvWare do
    begin
      Close;
      Screen.Cursor := crSQLWait;
      Params.ParamByName('@id_Project').Value := ABS(id_Project);
      Params.ParamByName('@PrjNum').Value := Null;

      if id_Manufact > 0 then
        Params.ParamByName('@id_Manufact').Value := id_Manufact
      else
        Params.ParamByName('@id_Manufact').Value := Null;
      if id_Manufact < 0 then
        Params.ParamByName('@Mode').Value := -126
      else
        Params.ParamByName('@Mode').Value := 126;
  //    Params.ParamByName('@TM').Value := 0;
      Open;
      Screen.Cursor := crDefault;
    end;
  finally
  //  fArcLite1.cdsArcLite.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TInvDet.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

end.
