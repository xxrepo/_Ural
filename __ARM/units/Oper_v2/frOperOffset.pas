unit frOperOffset;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ExtCtrls, StdCtrls, Mask, DBCtrls, foMyFunc, Buttons,
  frCurSelector, ToolEdit, RXDBCtrl, ComCtrls, ActnList, Grids, DBGrids,
  ToolWin, RxLookup, frOperOldData, CurrEdit, frExtDataVal, Registry, frArc,
  frBJByOper, RXCtrls, Menus, clipbrd;

type
  TfOperOffset = class(TFrame)
    cdsOperFin: TClientDataSet;
    dsOperFin: TDataSource;
    PageControl1: TPageControl;
    tsData: TTabSheet;
    tsComment: TTabSheet;
    P1: TPanel;
    lbReprName: TLabel;
    edReprName: TDBEdit;
    BitBtn4: TBitBtn;
    cbOperTypeIn: TComboBox;
    Label9: TLabel;
    cdsFormal: TClientDataSet;
    cdsFormalid_FormalDistrib: TAutoIncField;
    cdsFormalName: TStringField;
    dsFormal: TDataSource;
    dsFunc: TDataSource;
    cdsFunc: TClientDataSet;
    cdsFuncid_FuncDistrib: TAutoIncField;
    cdsFuncName: TStringField;
    Label13: TLabel;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    DBEdit9: TDBEdit;
    P2: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    fCurSelector1: TfCurSelector;
    Label3: TLabel;
    DBEdit8: TDBEdit;
    DBEdit2: TRxDBCalcEdit;
    P_FF: TPanel;
    Label5: TLabel;
    Label10: TLabel;
    lcFormalDistrib: TRxDBLookupCombo;
    lcFuncDistrib: TRxDBLookupCombo;
    pnForSize: TPanel;
    Splitter2: TSplitter;
    GroupBox4: TGroupBox;
    DBMemo1: TDBMemo;
    fExtDataVal1: TfExtDataVal;
    BitBtn1: TBitBtn;
    Panel7: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    DBEdit1: TDBEdit;
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
    sbConvert: TSpeedButton;
    sbForm: TSpeedButton;
    sbFunc: TSpeedButton;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    DBEdit5: TDBEdit;
    edImp_PayBasic: TDBEdit;
    edAccInv_PayAssignment: TDBEdit;
    fBJByOper1: TfBJByOper;
    RxSpeedButton1: TRxSpeedButton;
    tsOperList_Off: TTabSheet;
    Panel2: TPanel;
    btnShowOper: TButton;
    btnGen: TButton;
    btnX1: TButton;
    btnX2: TButton;
    btnX3: TButton;
    pmIns: TPopupMenu;
    procedure BitBtn4Click(Sender: TObject);
    procedure cbVizaClick(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsOperFinCorrectGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cbOperTypeInChange(Sender: TObject);
    procedure cdsOperFinAfterPost(DataSet: TDataSet);
    procedure lcbBsnChange(Sender: TObject);
    procedure cbKoefChange(Sender: TObject);
    procedure DBEdit2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sbConvertClick(Sender: TObject);
    procedure cdsFormalAfterOpen(DataSet: TDataSet);
    procedure cdsFuncAfterOpen(DataSet: TDataSet);
    procedure sbFormClick(Sender: TObject);
    procedure sbFuncClick(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure btnShowOperClick(Sender: TObject);
    procedure btnGenClick(Sender: TObject);
    procedure btnX1Click(Sender: TObject);
    procedure btnX2Click(Sender: TObject);
    procedure btnX3Click(Sender: TObject);
  private
    fArc_Off : TfArc;
    FNeedColor, FReadOnly : boolean;

    procedure MakeRed;
    procedure CheckNColor;

    procedure cbKoefDoChange;
    function GetID_Oper: integer;
    procedure RefrEvent(id_Oper: integer);
    procedure MakePopUpMenu(AStringField: TStringField);
    procedure MiClick(Sender: TObject);
  public
    FOperParamz : TOperParamz;
    function ChangeData : boolean;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    procedure Initialize(AOperParamz : TOperParamz);

    property ID_Oper : integer read GetID_Oper;
  end;

implementation

uses uDM, uUnivOper_v2, uUnivSelector, uInputBoxDigit, uRepSelector,
  uAPOperList;

{$R *.DFM}

{ TfOperOffset }

function TfOperOffset.CheckData: boolean;
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
  with edReprName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен представитель', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with edReprName do
    if cdsOperFin.FieldByName('ContrAgentName').IsNull and (not cdsOperFin.FieldByName('id_Repr').IsNull or not cdsOperFin.FieldByName('id_Repr_Ex').IsNull) then
    begin
      MessageBox(Handle, 'Не определен контрагент у представителя', 'Введены не все данные', MB_OK + MB_ICONERROR);
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

function TfOperOffset.ConfirmChanges: boolean;
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
        CompareField(CDS, 'SrcName', 'Счет', SL);
        CompareField(CDS, 'AcName', 'Склад', SL);
        CompareField(CDS, 'ReprName', 'Получатель', SL);
        CompareField(CDS, 'ReprWHName', 'Склад представителя', SL);

        CompareField(CDS, 'BusinessName', 'Бизнес', SL);

        CompareField(CDS, 'WareName', 'Товар', SL);
  //      CompareField(CDS, 'AmountOper', 'Количество', SL);
        CompareField(CDS, 'MeasureName', 'Единица измерения', SL);

        CompareField(CDS, 'PriceOper', 'Сумма', SL);
        CompareField(CDS, 'CurrencyOperName', 'Валюта', SL);

        CompareField(CDS, 'PriceInv', 'Себестоисомть', SL);
        CompareField(CDS, 'CurrencyInvName', 'Валюта себестоимости', SL);

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

constructor TfOperOffset.Create(AOwner: TComponent);
var
    Reg : TRegistry;
    FullRegPathName : String;
begin
  inherited;
  if Owner is TCustomForm then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      FullRegPathName := SRegPath + '\' + ClassName + TCustomForm(Owner).ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        if Reg.ValueExists('GroupBox4Height5') then
          GroupBox4.Height := Reg.ReadInteger('GroupBox4Height5');
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  FNeedColor := false;
end;

destructor TfOperOffset.Destroy;
var Reg : TRegistry;
    FullRegPathName : String;
begin
  if Owner is TCustomForm then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;

      FullRegPathName := SRegPath + '\' + ClassName + TCustomForm(Owner).ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        Reg.WriteInteger('GroupBox4Height5', GroupBox4.Height);
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  inherited;
end;

procedure TfOperOffset.Initialize(AOperParamz : TOperParamz);
var S :String;
   id_Oper_OLD : integer;
begin
  fBJByOper1.Visible := DM.CheckUserRights(110, Null);
  FOperParamz := AOperParamz;
  P1.Enabled := not FOperParamz.ReadOnly;
  P2.Enabled := not FOperParamz.ReadOnly;
//  P_FF.Enabled := not FReadOnly;

  FNeedColor := FOperParamz.ID_Oper <> -1;

  with cdsOperFin do
  begin
    Close;
    Params.ParamByName('@id_Oper').AsInteger := FOperParamz.ID_Oper;
    Params.ParamByName('@is_Mirr').AsBoolean := FOperParamz.is_Mirr;
    Open;
    if FOperParamz.ID_Oper = -1 then
    begin
      cbOperTypeIn.ItemIndex := -1; 
      Edit;
 //     FieldByName('VatIn').AsBoolean := true;
      FieldByName('Correct').AsBoolean := false;
      FieldByName('CreatorFIO').Value := DM.FullFIO;
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      FieldByName('id_OperParent').Value := FOperParamz.id_OperParent;
      FieldByName('OperVid').AsInteger := 4;
      Post;
    end
    else
    begin
      fCurSelector1.Initialize(FieldByName('id_business').Value);
      fCurSelector1.ID_Curr := FieldByName('Id_CurrencyOper').Value;

      cdsFormal.Close;
      cdsFormal.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
      cdsFormal.Open;
      cdsFunc.Close;
      cdsFunc.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
      cdsFunc.Open;

    end;
  end;
  fExtDataVal1.Initialize(ID_Oper, cdsOperFin.FieldByName('id_business').AsInteger);
  fBJByOper1.Initialize(ID_Oper, cdsOperFin.FieldByName('id_business').AsInteger);
  if ID_Oper = -1 then
    fBJByOper1.SetNotUse;
  if FOperParamz.Correct or FOperParamz.Copy then   // Коррекция или копирование
  begin
    id_Oper_OLD := FOperParamz.ID_Oper;

    FOperParamz.ID_Oper := -1;
    RebildExtData(fExtDataVal1.cdsExtData);
    fBJByOper1.Initialize(-1, cdsOperFin.FieldByName('id_business').AsInteger, id_Oper_OLD);
    RebildBJ(fBJByOper1.cdsBJ_ByOper);
   // fBJByOper1.SetNotUse;
    with cdsOperFin do
    begin
      Edit;
      FieldByName('OperVid').AsInteger := 4;
      if FOperParamz.Offset then
      begin
        FieldByName('OperTypeIn').AsBoolean := not FieldByName('OperTypeIn').AsBoolean;
        DM.FDateCreate := cdsOperFinDateCreate.AsDateTime;
        FieldByName('id_Acc').AsVariant := Null;
        FieldByName('Koeff').AsVariant := 0;
      end;
      FieldByName('Correct').AsBoolean := FOperParamz.Correct;
      FieldByName('id_Replicator').Value := Null;
      FieldByName('id_OperParent').Value := FOperParamz.id_OperParent;
      FieldByName('is_Mirr').Value := Null;
      
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
 // fOperOldData1.Initialize(cdsOperFinid_old_Oper.AsInteger);

      if cdsOperFin.FieldByName('OperTypeIn').AsBoolean then
        cbOperTypeIn.ItemIndex := 0
      else
        cbOperTypeIn.ItemIndex := 1;
  PageControl1.ActivePageIndex := 0;

  if ID_Oper <> -1 then
    MakeRed;
end;

function TfOperOffset.SaveProp: boolean;
begin
  if not ChangeData then
  begin
    Result := false;
    Exit;
  end;
  Result := SavePropOper(FOperParamz.ID_Oper, cdsOperFin, nil,  fExtDataVal1, fBJByOper1)
end;

procedure TfOperOffset.UpdateData;
var CDS : TClientDataSet;
begin
  CDS := cdsOperFin;

  if CDS.State <> dsEdit then
    CDS.Edit;

  CDS.FieldByName('Id_CurrencyOper').Value := fCurSelector1.ID_Curr;
  CDS.FieldByName('CurrencyOperShortName').Value := fCurSelector1.CurName;

  CDS.FieldByName('Koeff').Value := 0;

  if (cbOperTypeIn.ItemIndex = 0) <> CDS.FieldByName('OperTypeIn').AsBoolean then
    CDS.FieldByName('OperTypeIn').Value := cbOperTypeIn.ItemIndex = 0;

{  if KoefVal <> 0 then
  begin  }
    if lcFormalDistrib.Text <> CDS.FieldByName('FormalDistribName').AsString then
      CDS.FieldByName('FormalDistribName').Value := lcFormalDistrib.Text;
    if lcFuncDistrib.Text <> CDS.FieldByName('FuncDistribName').AsString then
      CDS.FieldByName('FuncDistribName').Value := lcFuncDistrib.Text;
{  end
  else
  begin
    CDS.FieldByName('id_FormalDistrib').Value := Null;
    CDS.FieldByName('id_FuncDistrib').Value := Null;
  end; }
//  CDS.FieldByName('CheckDate').Value := Null;
  CDS.Post;
end;

procedure TfOperOffset.BitBtn4Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
    Rez : boolean;
    AEObjTypes: TEObjTypes;
begin
  if not cdsOperFin.FieldByName('id_Repr').IsNull then
  begin
    ASelectedObj.ID := cdsOperFin.FieldByName('id_Repr').Value;
    ASelectedObj.ObjType := eotRepr;
  end;

  if (not cdsOperFin.FieldByName('id_Repr_Ex').IsNull) and (cdsOperFin.FieldByName('id_Repr').IsNull) then
  begin
    ASelectedObj.ID := cdsOperFin.FieldByName('id_Repr_Ex').Value;
    ASelectedObj.ObjType := eotRepr;
  end;

  AEObjTypes := [eotRepr];
  if (not cdsOperFin.FieldByName('id_Repr_Ex').IsNull) and (cdsOperFin.FieldByName('id_Repr').IsNull) then
  begin
    Rez := SelectRep(Handle, Null, cdsOperFin.FieldByName('id_business').AsInteger, ASelectedObj, 0, AEObjTypes, cdsOperFin.FieldByName('id_Repr').Value)
  end
  else
    Rez := SelectObjUn(Owner, 4, ASelectedObj, 0, [eotRepr]);

  if Rez then
  begin
    with cdsOperFin do
    begin
      Edit;
      FieldByName('id_Repr_Ex').Value := Null;
      
      FieldByName('id_business').Value := ASelectedObj.Bsn_id;
      FieldByName('BusinessName').Value := ASelectedObj.Bsn_Name;

      FieldByName('id_Repr').Value := ASelectedObj.ID;
      FieldByName('id_ContrAgent').Value := ASelectedObj.CA_ID;
      FieldByName('ContrAgentName').Value := ASelectedObj.CA_Name;
      FieldByName('ReprName').Value := ASelectedObj.Name;
      Post;
  fCurSelector1.Initialize(FieldByName('id_business').Value);
  fExtDataVal1.Initialize(Null, FieldByName('id_business').Value);
  fBJByOper1.Initialize(-1, FieldByName('id_business').Value);
  if ID_Oper = -1 then
    fBJByOper1.SetNotUse;

      cdsFormal.Close;
      cdsFormal.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
      cdsFormal.Open;
      cdsFunc.Close;
      cdsFunc.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
      cdsFunc.Open;
    end;
  end;
end;

procedure TfOperOffset.cbVizaClick(Sender: TObject);
begin
  with cdsOperFin do
  begin
    Edit;
    FieldByName('CheckDate').Value := Null;
    FieldByName('id_UserChecker').Value := Null;
    Post;
  end;
end;

function TfOperOffset.ChangeData: boolean;
begin
  Result := (ID_Oper = -1) or (cdsOperFin.ChangeCount > 0) 
  or (fExtDataVal1.cdsExtData.ChangeCount > 0)
  or (fBJByOper1.ChangeCount > 0);
end;

procedure TfOperOffset.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_delete then
  begin
    with cdsOperFin do
    begin
      Edit;
      FieldByName('id_business').Value := Null;
      FieldByName('BusinessName').Value := Null;
      Post;
    end;
  end;
end;

procedure TfOperOffset.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) and (cdsOperFin.State = dsEdit) then
    cdsOperFin.Post;
end;

procedure TfOperOffset.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) and (cdsOperFin.State = dsEdit) then
    cdsOperFin.Post;
end;

procedure TfOperOffset.MakeRed;
begin
  if (cdsOperFin.FieldByName('ReprID_Main').IsNull) then
  begin
    with lbReprName do
    begin
      Font.Style := Font.Style + [fsBold];
      Font.Color := clRed;
    end;
  end;
end;

procedure TfOperOffset.cdsOperFinCorrectGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := 'Да'
  else
    Text := 'Нет';
end;

procedure TfOperOffset.CheckNColor;
begin
  if not FNeedColor then
    Exit;
  with cbOperTypeIn do
  begin
    if  trim(Text) = '' then
    begin
      Color := redColor;
    end
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
  with edReprName do
  begin
    if (trim(Text) = '') { or
     ((not cdsOperFin.FieldByName('id_Repr_Ex').IsNull) and (cdsOperFin.FieldByName('id_Repr').IsNull))}  then
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

  with lcFormalDistrib do
  begin
    if (trim(Text) = '') and (Enabled) then
    begin
      Color := redColor;
    end
    else
      Color := clWindow;
  end;
  with lcFuncDistrib do
  begin
    if (trim(Text) = '') and (Enabled) then
    begin
      Color := redColor;
    end
    else
      Color := clWindow;
  end;
end;

procedure TfOperOffset.cbOperTypeInChange(Sender: TObject);
begin
  CheckNColor;
end;

procedure TfOperOffset.cdsOperFinAfterPost(DataSet: TDataSet);
begin
  CheckNColor;
end;

procedure TfOperOffset.lcbBsnChange(Sender: TObject);
begin
  CheckNColor;

end;

procedure TfOperOffset.cbKoefChange(Sender: TObject);
begin
  cbKoefDoChange;
end;

procedure TfOperOffset.cbKoefDoChange;
begin
  CheckNColor;
end;

procedure TfOperOffset.DBEdit2Click(Sender: TObject);
begin
//  TCustomEdit(sender).SelStart := 0;
//  TCustomEdit(sender).SelLength := Length(TCustomEdit(sender).Text);
end;

procedure TfOperOffset.BitBtn1Click(Sender: TObject);
var F : Variant;
    S : String;
begin
  S := 'PriceOper';
  F := cdsOperFin.FieldByName(S).AsFloat;
  if InputBoxDigit(Handle, 'Сумма', 'Сумма', F) then
  begin
    with cdsOperFin do
    begin
      Edit;
      FieldByName(S).AsFloat := F;
      Post;
    end;
  end;
end;

function TfOperOffset.GetID_Oper: integer;
begin
  Result := FOperParamz.ID_Oper;
end;

procedure TfOperOffset.sbConvertClick(Sender: TObject);
var V : Variant;
begin
  with edReprName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен представитель', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  if fCurSelector1.ID_Curr = Null then
  begin
    MessageBox(Handle, 'Не выбрана валюта', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(fCurSelector1.cbCur.Handle);
    Exit;
  end;
  V := DM.rsCA.AppServer.GetCASumm(fCurSelector1.ID_Curr, cdsOperFinid_ContrAgent.AsInteger);
  if (V > 0) then
  begin
    if (cbOperTypeIn.ItemIndex = 1) then
      V := V
    else
    begin
      MessageBox(Handle, PChar('Пред контрагентом нет долгов в валюте ' + VarToStr(fCurSelector1.CurName)), '', MB_OK + MB_ICONERROR);
      Windows.SetFocus(fCurSelector1.cbCur.Handle);
      Exit;
    end;
  end
  else
  begin
    if (cbOperTypeIn.ItemIndex = 0) then
      V := -V
    else
    begin
      MessageBox(Handle, PChar('Нет долгов в валюте ' + VarToStr(fCurSelector1.CurName)), '', MB_OK + MB_ICONERROR);
      Windows.SetFocus(fCurSelector1.cbCur.Handle);
      Exit;
    end;
  end;
  cdsOperFin.Edit;
  cdsOperFinPriceOper.Value := V;
  cdsOperFin.Post;
end;

procedure TfOperOffset.cdsFormalAfterOpen(DataSet: TDataSet);
begin
  sbForm.Enabled := not cdsOperFin.FieldByName('id_business').IsNull;
end;

procedure TfOperOffset.cdsFuncAfterOpen(DataSet: TDataSet);
begin
  sbFunc.Enabled := not cdsOperFin.FieldByName('id_business').IsNull;
end;

procedure TfOperOffset.sbFormClick(Sender: TObject);
var
  ID:Variant;
  S : String;
begin
  with edReprName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен представитель', 'Сначала выберите представителя', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;   
  S := '';
  if InputBoxKrm('Новое формальное распределения', 'Название', S) then
  begin
    ID := DM.rsCA.AppServer.OP_FormalDistribAdd(S, cdsOperFin.FieldByName('id_business').AsInteger);
    if ID <> -1 then
    begin
      with cdsFormal do
      begin
        Close;
        Open;
      end;
      cdsOperFin.Edit;
      cdsOperFinid_FormalDistrib.AsInteger := ID;
      cdsOperFin.Post;
    end;
  end;
end;

procedure TfOperOffset.sbFuncClick(Sender: TObject);
var
  ID:Variant;
  S : String;
begin
  with edReprName do
    if trim(Text) = '' then                                  
    begin
      MessageBox(Handle, 'Не введен представитель', 'Сначала выберите представителя', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;   
  S := '';
  S := '';
  if InputBoxKrm('Новое функциональное распределения', 'Название', S) then
  begin
    ID := DM.rsCA.AppServer.OP_FuncDistribAdd(S, cdsOperFin.FieldByName('id_business').AsInteger);
    if ID <> -1 then
    begin
      with cdsFunc do
      begin
        Close;
        Open;
      end;
      cdsOperFin.Edit;
      cdsOperFinid_FuncDistrib.AsInteger := ID;
      cdsOperFin.Post;
    end;
  end;
end;

procedure TfOperOffset.RxSpeedButton1Click(Sender: TObject);
var V : Variant;
begin
  V := GetFloatFromClipBoadr;
  if V <> 0 then
  begin
    if cdsOperFin.State <> dsEdit then
      cdsOperFin.Edit;
    cdsOperFinPriceOper.AsFloat := V;
    cdsOperFin.Post;
  end;
end;

procedure TfOperOffset.btnShowOperClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if fArc_Off = nil then
    begin
      fArc_Off := TfArc.Create(Self);
      with fArc_Off do
      begin
        ShowBudjet := false;
        Parent := tsOperList_Off;
        Align := alClient;
        ARefrEvent := RefrEvent;
        ToolBar1.Visible := false;
        pnDate.Visible := false;
        fArc_Off.Fid_OperParent := id_Oper;
        fArc_Off.loadStng;
      end;
    end;

    with TClientDataSet(fArc_Off.dsArc.DataSet) do
    begin
      begin
        Close;
        Params.ParamByName('@DateFrom').Value := now() - 3650;
        Params.ParamByName('@DateTo').Value := now() + 3650;
        Params.ParamByName('@id_OperParent').Value := id_Oper;//-id_Oper;
        Params.ParamByName('@OperFin').Value := true;
        Params.ParamByName('@OperOffset').Value := true;
        Params.ParamByName('@id_user').Value := DM.IDUser;
        Open;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfOperOffset.RefrEvent(id_Oper: integer);
begin

end;

procedure TfOperOffset.btnGenClick(Sender: TObject);
begin
  if ID_Oper = -1 then
    raise Exception.Create('Операция не сохранена. Генерация невозможна!')
  else
    ShowAPOperList(Handle, id_Oper, 0)

end;

procedure TfOperOffset.MakePopUpMenu(AStringField : TStringField);
var S : String;
begin
  if trim(clipBoard.AsText) <> '' then
  begin
    S := trim(clipBoard.AsText);
//    S := StringReplace(S + '*', '"*', '', [rfReplaceAll, rfIgnoreCase]);
    S := StringReplace(S, '&', '', [rfReplaceAll, rfIgnoreCase]);
    S := StringReplace(S, #13, '', [rfReplaceAll, rfIgnoreCase]);
    S := StringReplace(S, #10, '', [rfReplaceAll, rfIgnoreCase]);

    AStringField.DataSet.Edit;
    AStringField.AsString := S;
    AStringField.DataSet.Post;

  end;
end;

procedure TfOperOffset.MiClick(Sender: TObject);
var AStringField : TStringField;
    S : String;
begin
  if TObject((Sender as TMenuItem).Tag) is TStringField then
  begin
    AStringField := TStringField((Sender as TMenuItem).Tag);
    S := trim((Sender as TMenuItem).Caption);
    S := StringReplace(S, 'Вставить "', '', [rfReplaceAll, rfIgnoreCase]);
    S := StringReplace(S + '*', '"*', '', [rfReplaceAll, rfIgnoreCase]);
    S := StringReplace(S, '&', '', [rfReplaceAll, rfIgnoreCase]);
    S := StringReplace(S, #13, '', [rfReplaceAll, rfIgnoreCase]);
    S := StringReplace(S, #10, '', [rfReplaceAll, rfIgnoreCase]);

    AStringField.DataSet.Edit;
    AStringField.AsString := S;
    AStringField.DataSet.Post;

  end;
end;

procedure TfOperOffset.btnX1Click(Sender: TObject);
begin
  MakePopUpMenu(cdsOperFinImp_PayBasic);
end;

procedure TfOperOffset.btnX2Click(Sender: TObject);
begin
  MakePopUpMenu(cdsOperFinAccInv_PayAssignment);

end;

procedure TfOperOffset.btnX3Click(Sender: TObject);
begin
  MakePopUpMenu(cdsOperFinContract);

end;

end.
