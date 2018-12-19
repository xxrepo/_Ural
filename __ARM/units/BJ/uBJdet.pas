unit uBJdet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frArcLite, Db, DBClient, DBGridEh, StdCtrls, ExtCtrls;

type
  TBJdet = class(TForm)
    fArcLite1: TfArcLite;
    cdsBJDet: TClientDataSet;
    cdsInvCalc: TClientDataSet;
    Panel1: TPanel;
    btnCancel: TButton;
    cdsBJDet2: TClientDataSet;
    cdsBJDetid_Oper2: TIntegerField;
    cdsBJDetS_Pay: TFloatField;
    cdsBJDetS_Off: TFloatField;
    cdsBJDetid_Oper: TIntegerField;
    cdsBJDetid_OperParent: TIntegerField;
    cdsBJDetid_old_Oper: TIntegerField;
    cdsBJDetDateCreate: TDateTimeField;
    cdsBJDetid_LC_Oper: TIntegerField;
    cdsBJDetOperVid: TIntegerField;
    cdsBJDetid_Replicator: TIntegerField;
    cdsBJDetReplicatorShortName: TStringField;
    cdsBJDetid_UserCreator: TIntegerField;
    cdsBJDetid_business: TIntegerField;
    cdsBJDetId_CurrencyBsn: TIntegerField;
    cdsBJDetBusinessName: TStringField;
    cdsBJDetBusinessNum: TStringField;
    cdsBJDetDateLocal: TDateTimeField;
    cdsBJDetCorrect: TBooleanField;
    cdsBJDetOperTypeIn: TBooleanField;
    cdsBJDetId_CurrencyOper: TIntegerField;
    cdsBJDetCurrencyOperName: TStringField;
    cdsBJDetCurrencyOperShortName: TStringField;
    cdsBJDetAmountOper: TFloatField;
    cdsBJDetAmountOper2: TFloatField;
    cdsBJDetPriceOper: TFloatField;
    cdsBJDetRateOper: TFloatField;
    cdsBJDetid_Measure: TIntegerField;
    cdsBJDetMeasureName: TStringField;
    cdsBJDetRealKoef: TFloatField;
    cdsBJDetAmountOperBaseMS: TFloatField;
    cdsBJDetId_CurrencySys: TIntegerField;
    cdsBJDetCurrencySysName: TStringField;
    cdsBJDetCurrencySysShortName: TStringField;
    cdsBJDetSummSys: TFloatField;
    cdsBJDetRateSys: TFloatField;
    cdsBJDetid_Acc: TIntegerField;
    cdsBJDetid_Warehouse: TIntegerField;
    cdsBJDetid_Manufact: TIntegerField;
    cdsBJDetSrcName: TStringField;
    cdsBJDetSrcID_Main: TIntegerField;
    cdsBJDetid_Repr: TIntegerField;
    cdsBJDetid_Acc_Ext: TIntegerField;
    cdsBJDetid_Warehouse_Ext: TIntegerField;
    cdsBJDetid_Manufact_Ext: TIntegerField;
    cdsBJDetReprName: TStringField;
    cdsBJDetReprID_Main: TIntegerField;
    cdsBJDetId_CurrencyInv: TIntegerField;
    cdsBJDetPriceInv: TFloatField;
    cdsBJDetRateInv: TFloatField;
    cdsBJDetCurrencyInvName: TStringField;
    cdsBJDetCurrencyInvShortName: TStringField;
    cdsBJDetid_Goods: TIntegerField;
    cdsBJDetWareName: TStringField;
    cdsBJDetWareID_Main: TIntegerField;
    cdsBJDetKoeff: TIntegerField;
    cdsBJDetKoeffName: TStringField;
    cdsBJDetCheckDate: TDateTimeField;
    cdsBJDetid_UserChecker: TIntegerField;
    cdsBJDetid_FormalDistrib: TIntegerField;
    cdsBJDetFormalDistribName: TStringField;
    cdsBJDetid_FuncDistrib: TIntegerField;
    cdsBJDetFuncDistribName: TStringField;
    cdsBJDetDeleted: TBooleanField;
    cdsBJDetid_ContrAgent: TIntegerField;
    cdsBJDetContrAgentName: TStringField;
    cdsBJDetid_CAGroup: TIntegerField;
    cdsBJDetSummOper: TFloatField;
    cdsBJDetTypeName: TStringField;
    cdsBJDetOperNum: TStringField;
    cdsBJDetOperDelta: TFloatField;
    cdsBJDetOperRateDelta: TFloatField;
    cdsBJDetOperTotalDelta: TFloatField;
    cdsBJDetDTDiff: TIntegerField;
    cdsBJDetHasViza: TBooleanField;
    cdsBJDetOperState: TIntegerField;
    cdsBJDetHidedOper: TBooleanField;
    cdsBJDetOperSummSys: TFloatField;
    cdsBJDetRateMain: TFloatField;
    cdsBJDetid_Repr_Ex: TIntegerField;
    cdsBJDetid_DocType: TIntegerField;
    cdsBJDetImp_PayBasic: TStringField;
    cdsBJDetAccInv_PayAssignment: TStringField;
    cdsBJDetContract: TStringField;
    cdsBJDetOperDeltaCrn: TFloatField;
    cdsBJDetOperRateDeltaCrn: TFloatField;
    cdsBJDetOperTotalDeltaCrn: TFloatField;
    cdsBJDetOperCrnName: TStringField;
    cdsBJDetOperSum_Offer: TFloatField;
    cdsBJDetCRN_OLD_OperSum: TFloatField;
    cdsBJDetCRN_OLD_OperSum_Offer: TFloatField;
    cdsBJDetCRN_OperSum_Inv: TFloatField;
    cdsBJDetOperSumCalced: TFloatField;
    cdsBJDetOperSum_OfferCalced: TFloatField;
    cdsBJDetBlocked: TBooleanField;
    cdsBJDetCurrencyBsnName: TStringField;
    cdsBJDetid_Ctg_Goods_2: TIntegerField;
    cdsBJDetOpComment: TStringField;
    cdsBJDetRealDataCreate: TDateTimeField;
    cdsBJDetOperTypeSIGN: TIntegerField;
    cdsBJDetHasChild: TIntegerField;
    cdsBJDetDig1: TFloatField;
    cdsBJDetDig2: TFloatField;
    cdsBJDetDig3: TFloatField;
    cdsBJDetDig4: TFloatField;
    cdsBJDetDig5: TFloatField;
    cdsBJDetDig6: TFloatField;
    cdsBJDetDig7: TFloatField;
    cdsBJDetDig8: TFloatField;
    cdsBJDetDig9: TFloatField;
    cdsBJDetDig10: TFloatField;
    cdsBJDetDig11: TFloatField;
    cdsBJDetDig12: TFloatField;
    cdsBJDetDig13: TFloatField;
    cdsBJDetDig14: TFloatField;
    cdsBJDetDig15: TFloatField;
    cdsBJDetStr1: TStringField;
    cdsBJDetStr2: TStringField;
    cdsBJDetStr3: TStringField;
    cdsBJDetStr4: TStringField;
    cdsBJDetStr5: TStringField;
    cdsBJDetStr6: TStringField;
    cdsBJDetStr7: TStringField;
    cdsBJDetStr8: TStringField;
    cdsBJDetStr9: TStringField;
    cdsBJDetStr10: TStringField;
    cdsBJDetStr11: TStringField;
    cdsBJDetStr12: TStringField;
    cdsBJDetStr13: TStringField;
    cdsBJDetStr14: TStringField;
    cdsBJDetStr15: TStringField;
    cdsBJDetid_OperWare: TIntegerField;
    cdsBJDetOperVidName: TStringField;
    cdsBJDetCRN_OperSumRez: TFloatField;
    cdsBJDetOnlyDate: TDateTimeField;
    cdsBJDetis_Mirr: TBooleanField;
    cdsBJDetid_Acc_Group: TIntegerField;
    cdsBJDetid_Warehouse_Group: TIntegerField;
    cdsBJDetid_Manufact_Group: TIntegerField;
    cdsBJDetVatIn: TBooleanField;
    cdsBJDetAutoGen: TBooleanField;
    cdsBJDetCreatorFIO: TStringField;
    cdsBJDetCheckerFIO: TStringField;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Initialize(id_business, id_BJ_Obj : integer; id_acc, id_ContrAgent, id_BJ_Item, id_Oper, DateRep : Variant);
    procedure Initialize_BJ2(id_business, id_BJ_Obj : integer; id_acc, id_ContrAgent, id_BJ_Item, id_Oper, DateRep, D1, D2 : Variant);
    procedure Initialize_Inv(OPComment : String; id_business, AMode : integer);
    constructor Create(AOwner : TCOmponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure ShowBJdet(ACaption : String; id_business, id_BJ_Obj : integer; id_acc, id_ContrAgent, id_BJ_Item, id_Oper, DateRep : Variant);
procedure ShowInvDet(ACaption, OPComment : String; id_business, AMode : integer);
procedure ShowBJdet_v2(ACaption : String; id_business, id_BJ_Obj : integer; id_acc, id_ContrAgent, id_BJ_Item, id_Oper, DateRep, D1, D2 : Variant);

var
  BJdet: TBJdet;

implementation

uses foMyFunc, uDM;

procedure ShowInvDet(ACaption, OPComment : String; id_business, AMode : integer);
var F : TBJdet;
    i : integer;
begin
  F := TBJdet.Create(nil);
  try
    F.Caption := ACaption;
    F.Show;

    F.Initialize_Inv(OPComment, id_business, AMode);
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;


procedure ShowBJdet(ACaption : String; id_business, id_BJ_Obj : integer; id_acc, id_ContrAgent, id_BJ_Item, id_Oper, DateRep : Variant);
var F : TBJdet;
    i : integer;
begin
  F := TBJdet.Create(nil);
  try
    F.Caption := ACaption;
    F.Show;

    F.Initialize(id_business, id_BJ_Obj, id_acc, id_ContrAgent, id_BJ_Item, id_Oper, DateRep);
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;



procedure ShowBJdet_v2(ACaption : String; id_business, id_BJ_Obj : integer; id_acc, id_ContrAgent, id_BJ_Item, id_Oper, DateRep, D1, D2 : Variant);
var F : TBJdet;
    i : integer;
begin
  F := TBJdet.Create(nil);
  try
    F.Caption := ACaption;
    F.Show;

    F.Initialize_BJ2(id_business, id_BJ_Obj, id_acc, id_ContrAgent, id_BJ_Item, id_Oper, DateRep, D1, D2);
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;
{$R *.DFM}

{ TBJdet }

constructor TBJdet.Create(AOwner: TCOmponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  fArcLite1.aRefreshe.Visible := true;
end;

procedure TBJdet.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TBJdet.Initialize(id_business, id_BJ_Obj : integer; id_acc, id_ContrAgent, id_BJ_Item,
  id_Oper, DateRep: Variant);
var i : integer;
    XXX : integer;
begin
  Screen.Cursor := crSQLWait;
  try
    XXX := 0;
    fArcLite1.RxDBGrid1.DataSource.DataSet := cdsBJDet;
    fArcLite1.RxDBGrid1.FooterRowCount := 1;
    fArcLite1.RxDBGrid1.SumList.Active := true;
    for i := 0 to fArcLite1.RxDBGrid1.Columns.Count - 1 do
    begin
      if (UpperCase(fArcLite1.RxDBGrid1.Columns[i].FieldName) = 'WORKSUM') and (fArcLite1.RxDBGrid1.Columns[i].tag = 0) then
      begin
        inc(XXX);
        fArcLite1.RxDBGrid1.Columns[i].FieldName := 'S_Pay';
        fArcLite1.RxDBGrid1.Columns[i].Title.Caption := 'Оплата';
        fArcLite1.RxDBGrid1.Columns[i].Visible := true;
        fArcLite1.RxDBGrid1.Columns[i].Footer.ValueType := fvtSum;
        fArcLite1.RxDBGrid1.Columns[i].Footer.DisplayFormat := '### ### ##0.00';
      end;
      if (UpperCase(fArcLite1.RxDBGrid1.Columns[i].FieldName) = 'WORKSUM') and (fArcLite1.RxDBGrid1.Columns[i].tag = -1) then
      begin
        inc(XXX);
        fArcLite1.RxDBGrid1.Columns[i].FieldName := 'S_Off';
        fArcLite1.RxDBGrid1.Columns[i].Title.Caption := 'Зачет';
        fArcLite1.RxDBGrid1.Columns[i].Visible := true;
        fArcLite1.RxDBGrid1.Columns[i].Footer.ValueType := fvtSum;
        fArcLite1.RxDBGrid1.Columns[i].Footer.DisplayFormat := '### ### ##0.00';
      end;
      if XXX = 2 then
        Break;
    end;
    Repaint;
    fArcLite1.Setid_business(id_business);
    with cdsBJDet do
    begin
      Close;
   //   Params.ParamByName('@id_business').Value := id_business;
      Params.ParamByName('@id_BJ_Obj').Value := id_BJ_Obj;
      Params.ParamByName('@id_Acc').Value := id_Acc;
      Params.ParamByName('@id_ContrAgent').Value := id_ContrAgent;
      Params.ParamByName('@id_BJ_Item').Value := id_BJ_Item;
      Params.ParamByName('@id_Oper').Value := id_Oper;
      Params.ParamByName('@DateRep').Value := DateRep;
      Open;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TBJdet.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TBJdet.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);

end;

procedure TBJdet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fArcLite1.RxDBGrid1.SumList.Active := false;
  Action := caFree;
end;

procedure TBJdet.Initialize_Inv(OPComment: String;
  id_business, AMode: integer);
var i : integer;
    XXX : integer;
begin
  Screen.Cursor := crSQLWait;
  try
    XXX := 0;
    fArcLite1.RxDBGrid1.DataSource.DataSet := cdsInvCalc;
    fArcLite1.RxDBGrid1.FooterRowCount := 1;
    fArcLite1.RxDBGrid1.SumList.Active := true;
    fArcLite1.Showworksum := false;
    for i := 0 to fArcLite1.RxDBGrid1.Columns.Count - 1 do
    begin
      if (UpperCase(fArcLite1.RxDBGrid1.Columns[i].FieldName) = 'WORKSUM') and (fArcLite1.RxDBGrid1.Columns[i].tag = 0) then
      begin
        inc(XXX);
        fArcLite1.RxDBGrid1.Columns[i].Title.Caption := 'Сумма';
        fArcLite1.RxDBGrid1.Columns[i].Visible := true;
        fArcLite1.RxDBGrid1.Columns[i].Footer.ValueType := fvtSum;
        fArcLite1.RxDBGrid1.Columns[i].Footer.DisplayFormat := '### ### ##0.00';

     //   TFloatField(fArcLite1.RxDBGrid1.Columns[i].Field).DisplayFormat := '0.00';
        Break;
      end;
    end;

    Repaint;

    fArcLite1.Setid_business(id_business);
    with cdsInvCalc do
    begin
      Close;
      Params.ParamByName('@OPComment').Value := OPComment;
      Params.ParamByName('@OrdN').Value := Null;
      Params.ParamByName('@id_Manufact').Value := Null;
      Params.ParamByName('@OperTypeIn').Value := Null;
      Params.ParamByName('@Mode').Value := AMode;
      Open;
      for i := 0 to cdsInvCalc.Fields.Count - 1 do
        if cdsInvCalc.Fields[i] is TFloatField then
          TFloatField(cdsInvCalc.Fields[i]).DisplayFormat := '0.00';
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TBJdet.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TBJdet.Initialize_BJ2(id_business, id_BJ_Obj: integer; id_acc,
  id_ContrAgent, id_BJ_Item, id_Oper, DateRep, D1, D2: Variant);
var i : integer;
begin
  Screen.Cursor := crSQLWait;
  try
    fArcLite1.RxDBGrid1.DataSource.DataSet := cdsBJDet2;
    fArcLite1.RxDBGrid1.FooterRowCount := 1;
    fArcLite1.RxDBGrid1.SumList.Active := true;
    for i := 0 to fArcLite1.RxDBGrid1.Columns.Count - 1 do
    begin
      if (UpperCase(fArcLite1.RxDBGrid1.Columns[i].FieldName) = 'WORKSUM') and (fArcLite1.RxDBGrid1.Columns[i].tag = 0) then
      begin
        fArcLite1.RxDBGrid1.Columns[i].FieldName := 'S_Pay';
        fArcLite1.RxDBGrid1.Columns[i].Title.Caption := 'Оплата';
        fArcLite1.RxDBGrid1.Columns[i].Visible := true;
        fArcLite1.RxDBGrid1.Columns[i].Footer.DisplayFormat := '### ### ##0.00';
        fArcLite1.RxDBGrid1.Columns[i].Footer.ValueType := fvtSum;
        Break;
      end;
    end;
    Repaint;
    fArcLite1.Setid_business(id_business);
    with cdsBJDet2 do
    begin
      Close;
   //   Params.ParamByName('@id_business').Value := id_business;
      Params.ParamByName('@id_BJ_Obj').Value := id_BJ_Obj;
      Params.ParamByName('@id_Acc').Value := id_Acc;
      Params.ParamByName('@id_ContrAgent').Value := id_ContrAgent;
      Params.ParamByName('@id_BJ_Item').Value := id_BJ_Item;
      Params.ParamByName('@id_Oper').Value := id_Oper;
      Params.ParamByName('@DateRep').Value := DateRep;
      Params.ParamByName('@DATE1').AsDateTime := D1;
      Params.ParamByName('@DATE2').AsDateTime := D2;
      Open;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
