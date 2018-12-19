unit frOperFin_FFF;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ExtCtrls, StdCtrls, Mask, DBCtrls, foMyFunc, Buttons,
  frCurSelector, ToolEdit, RXDBCtrl, ComCtrls, ActnList, Grids, DBGrids,
  ToolWin, RxLookup, frOperOldData, CurrEdit, frExtDataVal;

type
  TfOperFin_FFF = class(TFrame)
    cdsOperFin: TClientDataSet;
    dsOperFin: TDataSource;
    PageControl1: TPageControl;
    tsData: TTabSheet;
    tsComment: TTabSheet;
    P1: TPanel;
    lbSrcName: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    BitBtn3: TBitBtn;
    P2: TPanel;
    cbOperTypeIn: TComboBox;
    lbOperTypeIn: TLabel;
    DBEdit9: TDBEdit;
    Label1: TLabel;
    Panel6: TPanel;
    Label2: TLabel;
    fCurSelector1: TfCurSelector;
    DBEdit8: TDBEdit;
    DBEdit2: TRxDBCalcEdit;
    GroupBox3: TGroupBox;
    DBMemo1: TDBMemo;
    Panel7: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit10: TDBEdit;
    cdsOperFinid_Oper: TIntegerField;
    cdsOperFinid_OperParent: TIntegerField;
    cdsOperFinid_old_Oper: TIntegerField;
    cdsOperFinDateCreate: TDateTimeField;
    cdsOperFinid_LC_Oper: TIntegerField;
    cdsOperFinOperVid: TIntegerField;
    cdsOperFinid_UserCreator: TIntegerField;
    cdsOperFinCreatorFIO: TStringField;
    cdsOperFinid_business: TIntegerField;
    cdsOperFinId_CurrencyBsn: TIntegerField;
    cdsOperFinBusinessName: TStringField;
    cdsOperFinBusinessNum: TStringField;
    cdsOperFinDateLocal: TDateTimeField;
    cdsOperFinCorrect: TBooleanField;
    cdsOperFinOperTypeIn: TBooleanField;
    cdsOperFinId_CurrencyOper: TIntegerField;
    cdsOperFinCurrencyOperName: TStringField;
    cdsOperFinCurrencyOperShortName: TStringField;
    cdsOperFinPriceOper: TFloatField;
    cdsOperFinRateOper: TFloatField;
    cdsOperFinId_CurrencySys: TIntegerField;
    cdsOperFinCurrencySysName: TStringField;
    cdsOperFinCurrencySysShortName: TStringField;
    cdsOperFinSummSys: TFloatField;
    cdsOperFinRateSys: TFloatField;
    cdsOperFinid_Acc: TIntegerField;
    cdsOperFinid_Warehouse: TIntegerField;
    cdsOperFinid_Manufact: TIntegerField;
    cdsOperFinSrcName: TStringField;
    cdsOperFinSrcID_Main: TIntegerField;
    cdsOperFinid_Repr: TIntegerField;
    cdsOperFinid_Acc_Ext: TIntegerField;
    cdsOperFinid_Warehouse_Ext: TIntegerField;
    cdsOperFinid_Manufact_Ext: TIntegerField;
    cdsOperFinReprName: TStringField;
    cdsOperFinReprID_Main: TIntegerField;
    cdsOperFinId_CurrencyInv: TIntegerField;
    cdsOperFinRateInv: TFloatField;
    cdsOperFinCurrencyInvName: TStringField;
    cdsOperFinCurrencyInvShortName: TStringField;
    cdsOperFinKoeff: TIntegerField;
    cdsOperFinKoeffName: TStringField;
    cdsOperFinCheckDate: TDateTimeField;
    cdsOperFinCheckerFIO: TStringField;
    cdsOperFinid_FormalDistrib: TIntegerField;
    cdsOperFinFormalDistribName: TStringField;
    cdsOperFinid_FuncDistrib: TIntegerField;
    cdsOperFinFuncDistribName: TStringField;
    cdsOperFinDeleted: TBooleanField;
    cdsOperFinid_ContrAgent: TIntegerField;
    cdsOperFinContrAgentName: TStringField;
    cdsOperFinid_CAGroup: TIntegerField;
    cdsOperFinSummOper: TFloatField;
    cdsOperFinTypeName: TStringField;
    cdsOperFinHasViza: TBooleanField;
    cdsOperFinOperState: TIntegerField;
    cdsOperFinHidedOper: TBooleanField;
    cdsOperFinRateMain: TFloatField;
    cdsOperFinid_Repr_Ex: TIntegerField;
    cdsOperFinid_DocType: TIntegerField;
    cdsOperFinImp_PayBasic: TStringField;
    cdsOperFinAccInv_PayAssignment: TStringField;
    cdsOperFinContract: TStringField;
    cdsOperFinOperCrnName: TStringField;
    cdsOperFinBlocked: TBooleanField;
    cdsOperFinCurrencyBsnName: TStringField;
    cdsOperFinOpComment: TStringField;
    cdsOperFinRealDataCreate: TDateTimeField;
    cdsOperFinOperTypeSIGN: TIntegerField;
    cdsOperFinHasChild: TIntegerField;
    cdsOperFinDig1: TFloatField;
    cdsOperFinDig2: TFloatField;
    cdsOperFinDig3: TFloatField;
    cdsOperFinDig4: TFloatField;
    cdsOperFinDig5: TFloatField;
    cdsOperFinDig6: TFloatField;
    cdsOperFinDig7: TFloatField;
    cdsOperFinDig8: TFloatField;
    cdsOperFinDig9: TFloatField;
    cdsOperFinDig10: TFloatField;
    cdsOperFinDig11: TFloatField;
    cdsOperFinDig12: TFloatField;
    cdsOperFinDig13: TFloatField;
    cdsOperFinDig14: TFloatField;
    cdsOperFinDig15: TFloatField;
    cdsOperFinStr1: TStringField;
    cdsOperFinStr2: TStringField;
    cdsOperFinStr3: TStringField;
    cdsOperFinStr4: TStringField;
    cdsOperFinStr5: TStringField;
    cdsOperFinStr6: TStringField;
    cdsOperFinStr7: TStringField;
    cdsOperFinStr8: TStringField;
    cdsOperFinStr9: TStringField;
    cdsOperFinStr10: TStringField;
    cdsOperFinStr11: TStringField;
    cdsOperFinStr12: TStringField;
    cdsOperFinStr13: TStringField;
    cdsOperFinStr14: TStringField;
    cdsOperFinStr15: TStringField;
    cdsOperFinOperVidName: TStringField;
    cdsOperFinis_Mirr: TBooleanField;
    cdsOperFinid_Acc_Group: TIntegerField;
    cdsOperFinid_Warehouse_Group: TIntegerField;
    cdsOperFinid_Manufact_Group: TIntegerField;
    cdsOperFinOperNum: TStringField;
    cdsOperFinid_Replicator: TIntegerField;
    Label13: TLabel;
    DBEdit3: TDBEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure cdsOperFinCorrectGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsOperFinAfterPost(DataSet: TDataSet);
    procedure cbOperTypeInChange(Sender: TObject);
    procedure lcbBsnChange(Sender: TObject);
    procedure DBEdit2Click(Sender: TObject);
    procedure cdsOperCommentAfterPost(DataSet: TDataSet);
    procedure cdsOperFinReprNameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    FOperParamz : TOperParamz;
    FNeedColor, FReadOnly : boolean;
    function GetID_Oper: integer;
  public
    function ChangeData : boolean;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    procedure Initialize(AOperParamz : TOperParamz);

    property ID_Oper : integer read GetID_Oper;

    procedure MakeRed;
    procedure CheckNColor;

    function CheckAmount(var Amount : Extended) : boolean;
  end;

implementation

uses uDM, uUnivOper_v2, uUnivSelector;

{$R *.DFM}

{ TfOperFin }

function TfOperFin_FFF.CheckData: boolean;
begin
  FNeedColor := true;
  MakeRed;
  Result := false;
  UpdateData;
  with cbOperTypeIn do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран тип операции', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with DBEdit1 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен счет', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with DBEdit2 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введена сумма', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with fCurSelector1.cbCur do
    if fCurSelector1.ID_Curr = Null then
    begin
      MessageBox(Handle, 'Не выбрана валюта расчета', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
    
  Result := true;
  MakeRed;
end;

function TfOperFin_FFF.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  if (Owner is TCustomForm) and (not TForm(Owner).Visible) then
  begin
    Result := true;
    Exit;
  end;
  CDS := cdsOperFin;
  Result := true;
  UpdateData;
  if (FOperParamz.ID_Oper <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'Correct', 'Коррекция', SL);
        CompareField(CDS, 'AcName', 'Счет', SL);
        CompareField(CDS, 'RealReprName', 'Получатель', SL);
        CompareField(CDS, 'BusinessName', 'Бизнес', SL);

        CompareField(CDS, 'PriceOper', 'Сумма', SL);
        CompareField(CDS, 'CurrencyOperName', 'Валюта', SL);
    //    if (CheckBox1.Checked) and (not FieldByName('Id_CurrencySys').IsNull);

        CompareField(CDS, 'ManagerFIO', 'Сотрудник', SL);
        CompareField(CDS, 'FormalDistribName', 'Формальное распределение', SL);
        CompareField(CDS, 'FuncDistribName', 'Функциональное распределение', SL);
        CompareField(CDS, 'Koeff', 'Суть операции', SL, false);
        CompareField(CDS, 'Imp_PayBasic', 'Основание платежа', SL);
        CompareField(CDS, 'AccInv_PayAssignment', 'Пл. поручение/Счет фактура', SL);
        CompareField(CDS, 'Contract', 'Договор', SL);
        CompareField(CDS, 'OpComment', 'Комментарии', SL, false);
      end;

      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfOperFin_FFF.Create(AOwner: TComponent);
begin
  inherited;
  FNeedColor := false;
end;

destructor TfOperFin_FFF.Destroy;
begin
  inherited;

end;

procedure TfOperFin_FFF.Initialize(AOperParamz : TOperParamz);
var S : String;
begin
  FOperParamz := AOperParamz;
  P1.Enabled := not FOperParamz.ReadOnly;
  P2.Enabled := not FOperParamz.ReadOnly;
  
  FNeedColor := FOperParamz.ID_Oper <> -1;
  with cdsOperFin do
  begin
    Close;
    Params.ParamByName('@id_Oper').AsInteger := FOperParamz.ID_Oper;
    Params.ParamByName('@is_MIrr').value := false;
    Open;

    if (FOperParamz.ID_Oper <> -1) and (cdsOperFin.FieldByName('OperVid').AsInteger <> 102) then
      raise Exception.Create('Это не финансовая операция!!!');
      
    if FOperParamz.ID_Oper = -1 then
    begin
      cbOperTypeIn.ItemIndex := -1; 

      Edit;
 //     FieldByName('AmountOper').Value := 1;
      FieldByName('Correct').Value := false;    
      FieldByName('id_Replicator').Value := Null;
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      FieldByName('CreatorFIO').Value := DM.FullFIO;
      FieldByName('id_OperParent').Value := FOperParamz.id_OperParent;
      FieldByName('OperVid').AsInteger := 102;
      Post;
    end
    else
    begin
      fCurSelector1.Initialize(FieldByName('id_business').AsInteger);
      fCurSelector1.ID_Curr := FieldByName('Id_CurrencyOper').Value;

      if FieldByName('OperTypeIn').AsBoolean then
        cbOperTypeIn.ItemIndex := 0
      else
        cbOperTypeIn.ItemIndex := 1;

    end;
  end;
  if FOperParamz.Correct or FOperParamz.Copy then   // Коррекция или копирование
  begin                                    
    FOperParamz.ID_Oper := -1;
    with cdsOperFin do
    begin
      Edit;
      FieldByName('Correct').AsBoolean := FOperParamz.Correct;
      FieldByName('id_OperParent').Value := FOperParamz.id_OperParent;

      FieldByName('CreatorFIO').Value := DM.FullFIO;
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      FieldByName('DateLocal').Value := Null;

      FieldByName('OperState').Value := 0;
      FieldByName('HasViza').Value := false;
      FieldByName('CheckDate').Value := Null;
      Post;
      if (FOperParamz.Correct) then
      begin
        S := FieldByName('OperNum').AsString;
//        S := DM.rsCA.AppServer.GetOperNum(ID_Oper);
        if S <> '' then
        begin
          Edit;
          FieldByName('OpComment').AsString := 'Коррекция операции №' + S;
          Post;
        end;
      end;  
    end
  end;

  PageControl1.ActivePageIndex := 0;
  if FOperParamz.ID_Oper <> -1 then
    MakeRed;
end;

function TfOperFin_FFF.SaveProp: boolean;
begin
  if not ChangeData then
  begin
    Result := false;
    Exit;
  end;
  Result := SavePropOper(FOperParamz.ID_Oper, cdsOperFin, nil, nil, nil)
end;

procedure TfOperFin_FFF.UpdateData;
var CDS : TClientDataSet;
begin
  CDS := cdsOperFin;

  if CDS.State <> dsEdit then
    CDS.Edit;

  CDS.FieldByName('Id_CurrencyOper').Value := fCurSelector1.ID_Curr;
  CDS.FieldByName('CurrencyOperShortName').Value := fCurSelector1.CurName;
//  CDS.FieldByName('AmountOper').Value := 1;
  
  CDS.FieldByName('Id_CurrencySys').Value := Null;
  CDS.FieldByName('CurrencySysShortName').Value := Null;
  CDS.FieldByName('SummSys').Value := Null;
  CDS.FieldByName('RateSys').Value := Null;

  CDS.FieldByName('Koeff').Value := 0;

  if (cbOperTypeIn.ItemIndex = 0) <> CDS.FieldByName('OperTypeIn').AsBoolean then
    CDS.FieldByName('OperTypeIn').Value := cbOperTypeIn.ItemIndex = 0;

  CDS.FieldByName('id_FormalDistrib').Value := Null;
  CDS.FieldByName('id_FuncDistrib').Value := Null;

  CDS.Post;
end;

procedure TfOperFin_FFF.BitBtn2Click(Sender: TObject);
begin
//*
end;

procedure TfOperFin_FFF.BitBtn3Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
begin
  if not cdsOperFin.FieldByName('id_Acc').IsNull then
  begin
    ASelectedObj.ID := cdsOperFin.FieldByName('id_Acc').Value;
    ASelectedObj.ObjType := eotFin;
  end;
  if not cdsOperFin.FieldByName('id_Repr').IsNull then
  begin
    ASelectedObj.ID := cdsOperFin.FieldByName('id_Repr').Value;
    ASelectedObj.ObjType := eotRepr;
  end;

  if SelectObjUn(Owner, 2, ASelectedObj, 0, [eotFin, eotRepr]) then
  begin
    with cdsOperFin do
    begin
      Edit;
      FieldByName('id_business').Value := ASelectedObj.Bsn_id;
      FieldByName('BusinessName').Value := ASelectedObj.Bsn_Name;

      FieldByName('id_Repr').Value := Null;
      FieldByName('ReprName').Value := Null;
      FieldByName('id_Acc').Value := Null;

      FieldByName('ContrAgentName').Value := ASelectedObj.CA_Name;
      case ASelectedObj.ObjType of
        eotFin : FieldByName('id_Acc').Value := ASelectedObj.ID;
        eotRepr : FieldByName('id_Repr').Value := ASelectedObj.ID;
      else
        raise Exception.Create('Неверный тип возвращаемого значения');
      end;

      FieldByName('ReprName').Value := ASelectedObj.Name;
      Post;
      fCurSelector1.Initialize(FieldByName('id_business').Value);

    end;
  end;
end;

function TfOperFin_FFF.ChangeData: boolean;
begin
  Result := (ID_Oper = -1) or (cdsOperFin.ChangeCount > 0) 
end;

procedure TfOperFin_FFF.MakeRed;
begin
  if cdsOperFin.FieldByName('SrcID_Main').IsNull then
  begin
    with lbSrcName do
    begin
      Font.Style := Font.Style + [fsBold];
      Font.Color := clRed;
    end;
  end;
end;

procedure TfOperFin_FFF.cdsOperFinCorrectGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := 'Да'
  else
    Text := 'Нет';
end;

procedure TfOperFin_FFF.CheckNColor;
begin
  if not FNeedColor then
    Exit;
  with cbOperTypeIn do
  begin
    if  trim(Text) = '' then
      Color := redColor
    else
      Color := clWindow;
  end;

  with DBEdit1 do
  begin
    if trim(Text) = '' then
    begin
      Color := redColor;
    end
    else
      Color := clWindow;
  end;
  with DBEdit2 do
  begin
    if (trim(Text) = '') or (Field.AsFloat = 0) then
    begin
      Color := redColor;
    end
    else
      Color := clWindow;
  end;
  with fCurSelector1.cbCur do
  begin
    if fCurSelector1.ID_Curr = Null then
    begin
      Color := redColor;
    end
    else
      Color := clWindow;
  end;
end;

procedure TfOperFin_FFF.cdsOperFinAfterPost(DataSet: TDataSet);
begin
  CheckNColor;
end;

procedure TfOperFin_FFF.cbOperTypeInChange(Sender: TObject);
begin
  CheckNColor;
end;

procedure TfOperFin_FFF.lcbBsnChange(Sender: TObject);
begin
  CheckNColor;

end;

function TfOperFin_FFF.CheckAmount(var Amount : Extended): boolean;
var ID : integer;
    TotalSum : Double;
    Koef :  Double;
begin
  Result := true;
// *** Проверяем кол-во ***
  if (cbOperTypeIn.ItemIndex = 1) and (not cdsOperFin.FieldByName('HasViza').AsBoolean) then
  begin
    ID := cdsOperFin.FieldByName('id_Acc').Value;
    if DM.rsCA.AppServer.PL_GetAccSum(ID, TotalSum) <> -1 then
    begin
      Koef := 1;
      Koef := fCurSelector1.RateRBL;

      with DBEdit2 do
        if (DBEdit2.Field.AsFloat - TotalSum/Koef) > 0.002 then
        begin
          Amount := TotalSum/Koef;
          Result := false;
        end;
    end;
  end;
  if (cbOperTypeIn.ItemIndex = 0) and (not cdsOperFin.FieldByName('HasViza').AsBoolean) and (not cdsOperFin.FieldByName('id_Acc_Ext').IsNull) then
  begin
    ID := cdsOperFin.FieldByName('id_Acc_Ext').Value;
    if DM.rsCA.AppServer.PL_GetAccSum(ID, TotalSum) <> -1 then
    begin
      Koef := 1;
      Koef := fCurSelector1.RateRBL;

      with DBEdit2 do
        if (DBEdit2.Field.AsFloat - TotalSum/Koef) > 0.002 then
        begin
          Amount := TotalSum/Koef;
          Result := false;
        end;
    end;
  end;
end;

procedure TfOperFin_FFF.DBEdit2Click(Sender: TObject);
begin
  TCustomEdit(sender).SelStart := 0;
  TCustomEdit(sender).SelLength := Length(TCustomEdit(sender).Text);
end;

procedure TfOperFin_FFF.cdsOperCommentAfterPost(DataSet: TDataSet);
begin
 { if (FID_Oper <> -1) and FReadOnly then
  begin
    if not CDSApplyUpdates(cdsOperComment, 'id_Oper', FID_Oper, true) then
      raise Exception.Create('Ошибка при сохранении комментариев');
  end; }
end;

procedure TfOperFin_FFF.cdsOperFinReprNameGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if cdsOperFin.FieldByName('ReprName').IsNull then
    Text := cdsOperFin.FieldByName('SrcName').AsString
  else
    Text := cdsOperFin.FieldByName('ReprName').AsString;
end;

function TfOperFin_FFF.GetID_Oper: integer;
begin
  Result := FOperParamz.ID_Oper;
end;

end.
