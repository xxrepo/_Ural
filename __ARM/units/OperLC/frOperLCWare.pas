unit frOperLCWare;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ExtCtrls, StdCtrls, Mask, DBCtrls, foMyFunc, Buttons,
  frCurSelector, ToolEdit, RXDBCtrl, ComCtrls, ActnList, Grids, DBGrids,
  ToolWin, RxLookup, CurrEdit, ImgList, DBGridEh, frExtDataValLC, Registry;

type
  TfOperLCWare = class(TFrame)
    cdsOper: TClientDataSet;
    dsOperFin: TDataSource;
    PageControl1: TPageControl;
    tsData: TTabSheet;
    tsComment: TTabSheet;
    P1: TPanel;
    Label6: TLabel;
    Label3: TLabel;
    edReprName: TDBEdit;
    BitBtn4: TBitBtn;
    cbOperTypeIn: TComboBox;
    Label9: TLabel;
    Label13: TLabel;
    edSrcName: TDBEdit;
    BitBtn1: TBitBtn;
    Label16: TLabel;
    DBEdit12: TDBEdit;
    GroupBox1: TGroupBox;
    DBEdit8: TDBEdit;
    Label4: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    Panel3: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    DBEdit5: TDBEdit;
    edContract: TDBEdit;
    edAccInv_PayAssignment: TDBEdit;
    edImp_PayBasic: TDBEdit;
    dsOperWare: TDataSource;
    cdsOperWare: TClientDataSet;
    cdsOperWareSummOper2: TFloatField;
    cdsOperWareNumb: TIntegerField;
    cdsOperWareid_LC_OperWare: TAutoIncField;
    cdsOperWareid_LC_Oper: TIntegerField;
    cdsOperWareAmountOper: TFloatField;
    cdsOperWareid_Measure: TIntegerField;
    cdsOperWarePriceOper: TFloatField;
    cdsOperWareSummSys: TFloatField;
    cdsOperWareid_Goods: TIntegerField;
    cdsOperWareMeasureName: TStringField;
    cdsOperWareRealKoef: TFloatField;
    cdsOperWareAmountOperBaseMS: TFloatField;
    cdsOperWareWareName: TStringField;
    cdsOperWareWareID_Main: TIntegerField;
    ilImage: TImageList;
    ActionList1: TActionList;
    aAddWare: TAction;
    aDelWare: TAction;
    aCalcSys: TAction;
    aSumm: TAction;
    gbWare: TGroupBox;
    DBGridEh1: TDBGridEh;
    ToolBar3: TToolBar;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    P3: TPanel;
    P4: TPanel;
    CheckBox1: TCheckBox;
    fCurSelector1: TfCurSelector;
    POther: TPanel;
    fCurSelector2: TfCurSelector;
    cdsOperWareTotalSumm: TAggregateField;
    aClearWare: TAction;
    ToolButton1: TToolButton;
    Splitter1: TSplitter;
    pnForSize: TPanel;
    P_FF: TPanel;
    Label1: TLabel;
    cbKoef: TComboBox;
    GroupBox4: TGroupBox;
    DBMemo1: TDBMemo;
    fExtDataVal1: TfExtDataValLC;
    Splitter2: TSplitter;
    cdsFormal: TClientDataSet;
    cdsFormalid_FormalDistrib: TAutoIncField;
    cdsFormalName: TStringField;
    cdsFunc: TClientDataSet;
    cdsFuncid_FuncDistrib: TAutoIncField;
    cdsFuncName: TStringField;
    dsFormal: TDataSource;
    dsFunc: TDataSource;
    Label2: TLabel;
    lcFormalDistrib: TRxDBLookupCombo;
    Label12: TLabel;
    lcFuncDistrib: TRxDBLookupCombo;
    cdsOperid_LC_Oper: TAutoIncField;
    cdsOperDateLocal: TDateTimeField;
    cdsOperOperVid: TIntegerField;
    cdsOperid_UserCreator: TIntegerField;
    cdsOperCreatorFIO: TStringField;
    cdsOperid_business: TIntegerField;
    cdsOperId_CurrencyBsn: TIntegerField;
    cdsOperBusinessName: TStringField;
    cdsOperBusinessNum: TStringField;
    cdsOperCorrect: TBooleanField;
    cdsOperOperTypeIn: TBooleanField;
    cdsOperId_CurrencyOper: TIntegerField;
    cdsOperCurrencyOperName: TStringField;
    cdsOperCurrencyOperShortName: TStringField;
    cdsOperPriceOper: TFloatField;
    cdsOperId_CurrencySys: TIntegerField;
    cdsOperCurrencySysName: TStringField;
    cdsOperCurrencySysShortName: TStringField;
    cdsOperSummSys: TFloatField;
    cdsOperid_Acc: TIntegerField;
    cdsOperid_Warehouse: TIntegerField;
    cdsOperid_Manufact: TIntegerField;
    cdsOperSrcName: TStringField;
    cdsOperSrcID_Main: TIntegerField;
    cdsOperid_Repr: TIntegerField;
    cdsOperid_Acc_Ext: TIntegerField;
    cdsOperid_Warehouse_Ext: TIntegerField;
    cdsOperid_Manufact_Ext: TIntegerField;
    cdsOperReprName: TStringField;
    cdsOperReprID_Main: TIntegerField;
    cdsOperKoeff: TIntegerField;
    cdsOperKoeffName: TStringField;
    cdsOperCheckDate: TDateTimeField;
    cdsOperid_FormalDistrib: TIntegerField;
    cdsOperFormalDistribName: TStringField;
    cdsOperid_FuncDistrib: TIntegerField;
    cdsOperFuncDistribName: TStringField;
    cdsOperSummOper: TFloatField;
    cdsOperTypeName: TStringField;
    cdsOperHasViza: TBooleanField;
    cdsOperid_DocType: TIntegerField;
    cdsOperImp_PayBasic: TStringField;
    cdsOperAccInv_PayAssignment: TStringField;
    cdsOperContract: TStringField;
    cdsOperOperCrnName: TStringField;
    cdsOperCurrencyBsnName: TStringField;
    cdsOperOpComment: TStringField;
    cdsOperOperTypeSIGN: TIntegerField;
    cdsOperHasChild: TIntegerField;
    cdsOperDig1: TFloatField;
    cdsOperDig2: TFloatField;
    cdsOperDig3: TFloatField;
    cdsOperDig4: TFloatField;
    cdsOperDig5: TFloatField;
    cdsOperDig6: TFloatField;
    cdsOperDig7: TFloatField;
    cdsOperDig8: TFloatField;
    cdsOperDig9: TFloatField;
    cdsOperDig10: TFloatField;
    cdsOperDig11: TFloatField;
    cdsOperDig12: TFloatField;
    cdsOperDig13: TFloatField;
    cdsOperDig14: TFloatField;
    cdsOperDig15: TFloatField;
    cdsOperStr1: TStringField;
    cdsOperStr2: TStringField;
    cdsOperStr3: TStringField;
    cdsOperStr4: TStringField;
    cdsOperStr5: TStringField;
    cdsOperStr6: TStringField;
    cdsOperStr7: TStringField;
    cdsOperStr8: TStringField;
    cdsOperStr9: TStringField;
    cdsOperStr10: TStringField;
    cdsOperStr11: TStringField;
    cdsOperStr12: TStringField;
    cdsOperStr13: TStringField;
    cdsOperStr14: TStringField;
    cdsOperStr15: TStringField;
    cdsOperOperVidName: TStringField;
    cdsOperis_Mirr: TBooleanField;
    cdsOperid_Acc_Group: TIntegerField;
    cdsOperid_Warehouse_Group: TIntegerField;
    cdsOperid_Manufact_Group: TIntegerField;
    cdsOperid_LC_Oper_Ext: TIntegerField;
    cdsOperid_ContrAgent: TIntegerField;
    cdsOperContrAgentName: TStringField;
    pCA: TPanel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure cbVizaClick(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsOperCalcFields(DataSet: TDataSet);
    procedure edAmountOperKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPriceOperKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure cdsOperCorrectGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cbOperTypeInChange(Sender: TObject);
    procedure cdsOperAfterPost(DataSet: TDataSet);
    procedure aAddWareExecute(Sender: TObject);
    procedure aDelWareExecute(Sender: TObject);
    procedure aCalcSysExecute(Sender: TObject);
    procedure aSummExecute(Sender: TObject);
    procedure cdsOperWareCalcFields(DataSet: TDataSet);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1EditButtonClick(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure dsOperWareDataChange(Sender: TObject; Field: TField);
    procedure aClearWareExecute(Sender: TObject);
    procedure DBGridEh1DrawFooterCell(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEh; Rect: TRect; State: TGridDrawState);
    procedure cdsOperWareAfterDelete(DataSet: TDataSet);
    procedure cdsOperWareAfterPost(DataSet: TDataSet);
    procedure cbKoefChange(Sender: TObject);
    procedure cbKoefKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FShowSummAmount : boolean;
    FNeedColor, FReadOnly : boolean;
    FPriceLocked, FInvLocked, Fis_Mirr, FRezMode : boolean;
    FID_Oper, FOperVid : integer;
    procedure CheckMeasure;
    procedure CheckFooter;
    procedure LockPrice;
    procedure UnLockPrice;
    procedure AddWare(AEdit: boolean);
    procedure CalcSumm;
    procedure DoChangeMes;
    procedure sbConvertCrn;
    procedure CalcAmountSum;
    function GetKoefVal: integer;
    procedure SetKoefVal(const Value: integer);
    property KoefVal : integer read GetKoefVal write SetKoefVal;
    procedure ChechEP;
    procedure cbKoefDoChange;
  public
    function ChangeData : boolean;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    procedure Initialize(ID_Oper : integer; AReadOnly : boolean; ACorrect : boolean; ACopy : boolean; Ais_Mirr : boolean;
  ARezMode : boolean);

    property ID_Oper : integer read FID_Oper;
    procedure CheckNColor;
  end;

implementation

uses uDM, uLCSelectorUn, uLCOperEng, foMyFuncEh,
  uOperMesSelector;

{$R *.DFM}

{ TfOperCommon }


{ TfOperCommon }

function TfOperLCWare.CheckData: boolean;
begin
  FNeedColor := true;
  Result := false;
  UpdateData;
  with cbOperTypeIn do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран тип операции', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with edSrcName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен склад', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with edReprName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен получатель', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
    with cdsOperWare do
      if IsEmpty then
      begin
        MessageBox(Handle, 'Не выбраны товары', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Windows.SetFocus(Handle);
        Exit;
      end;
 
  with fCurSelector1.cbCur do
    if (fCurSelector1.ID_Curr = Null) and (cdsOperWareTotalSumm.Value <> 0) then
    begin
      MessageBox(Handle, 'Не выбрана валюта расчета', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
    
  if CheckBox1.Checked then
  begin
    with cdsOperWare do
    begin
      First;
      while not Eof do
      begin
        if cdsOperWareSummSys.IsNull then
        begin
          MessageBox(Handle, 'Не введена сумма зачета', 'Введены не все данные', MB_OK + MB_ICONERROR);
          Windows.SetFocus(DBGridEh1.Handle);
          Exit;
        end;
        Next;
      end;
      First;
    end;
    with fCurSelector2.cbCur do
      if fCurSelector2.ID_Curr = Null then
      begin
        MessageBox(Handle, 'Не выбрана зачетная валюта', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Windows.SetFocus(Handle);
        Exit;
      end;
  end;  Result := true;
end;

function TfOperLCWare.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsOper;
  Result := true;
  UpdateData;
  if (FID_Oper <> -1) then
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
        CompareField(CDS, 'AmountOper', 'Количество', SL);
        CompareField(CDS, 'MeasureName', 'Единица измерения', SL);

        CompareField(CDS, 'PriceOper', 'Сумма', SL);
        CompareField(CDS, 'CurrencyOperName', 'Валюта', SL);
        if CheckBox1.Checked then
        begin
          CompareField(CDS, 'SummSys', 'Зачетная сумма', SL);
          CompareField(CDS, 'CurrencySysName', 'Зачетная валюта', SL);
        end;

        CompareField(CDS, 'PriceInv', 'Себестоисомть', SL);
        CompareField(CDS, 'CurrencyInvName', 'Валюта себестоимости', SL);

        CompareField(CDS, 'FormalDistribName', 'Формальное распределение', SL);
        CompareField(CDS, 'FuncDistribName', 'Функциональное распределение', SL);
        CompareField(CDS, 'Koeff', 'Суть операции', SL, false);
      end;
      if cdsOperWare.ChangeCount > 0 then
        SL.Add('изменен список товаров');

      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfOperLCWare.Create(AOwner: TComponent);
var
    Reg : TRegistry;
    FullRegPathName : String;
begin
  inherited;
      {$IFNDEF ACS_v2}
  pCA.Visible := false;
       {$ENDIF}
  FOperVid := 1;
  FShowSummAmount := true;
  FPriceLocked := false;
  FInvLocked := false;
  FNeedColor := false;
  if Owner is TCustomForm then
  begin
    LoadEhGridSettingsFromRegistry(DBGridEh1, SRegPath + '\' + TForm(Owner).Name + '\' + ClassName);
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;

    if DM.CheckUserRights(24, Null) then
    begin

    end
    else
    begin
      P_FF.Visible := false;
      fExtDataVal1.Visible := false;
      Splitter2.Visible := false;
      GroupBox4.Align := alClient;
    end;

      FullRegPathName := SRegPath + '\2' + ClassName + TCustomForm(Owner).ClassName;
      if Reg.OpenKey(FullRegPathName, false) then
      begin
        if Reg.ValueExists('fExtDataVal1Height5') then
          pnForSize.Height := Reg.ReadInteger('fExtDataVal1Height5');
        if Reg.ValueExists('GroupBox4Height5') then
          GroupBox4.Height := Reg.ReadInteger('GroupBox4Height5');
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
end;

destructor TfOperLCWare.Destroy;
var Reg : TRegistry;
    FullRegPathName : String;
begin
  if Owner is TCustomForm then
  begin
    SaveEhGridSettingsToRegistry(DBGridEh1, SRegPath + '\' + TForm(Owner).Name + '\' + ClassName);
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      FullRegPathName := SRegPath + '\2' + ClassName + TCustomForm(Owner).ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        Reg.WriteInteger('fExtDataVal1Height5', pnForSize.Height);
        if GroupBox4.Align <> alClient then
          Reg.WriteInteger('GroupBox4Height5', GroupBox4.Height);
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  inherited;
end;



procedure TfOperLCWare.LockPrice;
var i : integer;
    tmpCol : TColumnEh;
begin
  FPriceLocked := true;
  aCalcSys.Enabled := not FPriceLocked;
  aSumm.Enabled := not FPriceLocked;
  DisableControl(P4);
  DisableControl(POther);

  for i := 0 to DBGridEh1.Columns.Count - 1 do
  begin
    tmpCol := DBGridEh1.Columns[i];
    if (tmpCol.Field = cdsOperWarePriceOper) or (tmpCol.Field = cdsOperWareSummSys) then
      tmpCol.ReadOnly := true;
  end;
end;

procedure TfOperLCWare.UnLockPrice;
var i : integer;
    tmpCol : TColumnEh;
begin
  FPriceLocked := false;
  aCalcSys.Enabled := not FPriceLocked;
  aSumm.Enabled := not FPriceLocked;
  EnableControl(P4);
  EnableControl(POther);
  fCurSelector2.Enabled := CheckBox1.Checked;

  for i := 0 to DBGridEh1.Columns.Count - 1 do
  begin
    tmpCol := DBGridEh1.Columns[i];
    if (tmpCol.Field = cdsOperWarePriceOper) then
      tmpCol.ReadOnly := false;
    if (tmpCol.Field = cdsOperWareSummSys) then
      tmpCol.ReadOnly := not CheckBox1.Checked;
  end;
end;

procedure TfOperLCWare.ChechEP;
begin
  if DM.CheckUserRights(24, cdsOper.FieldByName('id_business').Value) then
  begin
    P_FF.Visible := true;
    fExtDataVal1.Visible := true;
    if GroupBox4.Align <> alTop then
    begin
      GroupBox4.Align := alTop;
      GroupBox4.Height := 10;
    end;
    Splitter1.Visible := true;
  end
  else
  begin
    P_FF.Visible := false;
    fExtDataVal1.Visible := false;
    Splitter1.Visible := false;
    GroupBox4.Align := alClient;
  end;
  fExtDataVal1.Initialize(FID_Oper, cdsOper.FieldByName('id_business').AsInteger);
end;


procedure TfOperLCWare.Initialize(ID_Oper: integer; AReadOnly: boolean; ACorrect : boolean; ACopy : boolean; Ais_Mirr : boolean;
  ARezMode : boolean);
begin
  FRezMode := ARezMode;
  if FRezMode then
    FOperVid := 201
  else
    FOperVid := 1;

  FNeedColor := ID_Oper <> -1;
  Fis_Mirr := Ais_Mirr;
  FReadOnly := AReadOnly;

  P1.Enabled := not FReadOnly;
  P3.Enabled := not FReadOnly;

  GroupBox1.Enabled := not FReadOnly;

  FID_Oper := ID_Oper;
  with cdsOper do
  begin
    Close;
    Params.ParamByName('@id_LC_Oper').AsInteger := FID_Oper;
    Params.ParamByName('@is_Mirr').AsBoolean := Fis_Mirr;
    Open;
    if FID_Oper = -1 then
    begin
      cbOperTypeIn.ItemIndex := -1; 
      CheckBox1.Checked := false;
      CheckBox1Click(CheckBox1);
      Edit;
      FieldByName('Correct').AsBoolean := ACorrect;
      FieldByName('is_Mirr').Value := Null;
  //    FieldByName('id_Replicator').AsInteger := Null;    //1013
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      FieldByName('OperVid').AsInteger := FOperVid;
      Post;
    end
    else
    begin
      fCurSelector1.Initialize(FieldByName('id_business').Value);
      fCurSelector2.Initialize(FieldByName('id_business').Value);
      
      fCurSelector1.ID_Curr := FieldByName('Id_CurrencyOper').Value;
      fCurSelector2.ID_Curr := FieldByName('Id_CurrencySys').Value;
      KoefVal := FieldByName('Koeff').AsInteger;
      
      cdsFormal.Close;
      cdsFormal.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
      cdsFormal.Open;
      cdsFunc.Close;
      cdsFunc.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
      cdsFunc.Open;
      if FieldByName('OperTypeIn').AsBoolean then
        cbOperTypeIn.ItemIndex := 0
      else
        cbOperTypeIn.ItemIndex := 1;

      CheckBox1.Checked := not FieldByName('Id_CurrencySys').IsNull;
      CheckBox1Click(CheckBox1);                                                                                    
    end;
  end;
  with cdsOperWare do
  begin
    Close;
    Params.ParamByName('@id_LC_Oper').Value := ID_Oper;
    Open;
  end;
  ChechEP;
  if not FRezMode and (cdsOper.FieldByName('OperVid').AsInteger = 201) then
  begin
    FOperVid := 1;
    with cdsOper do
    begin
      Edit;
      cdsOperid_LC_Oper_Ext.AsInteger := ID_Oper;
      FieldByName('OperVid').AsInteger := FOperVid;
      Post;
    end;
  end;
  if ACorrect or ACopy then   // ПРи корректировании сбрасываем номер и выставляем флаг
  begin
    FID_Oper := -1;
    RebildWareData_LC(cdsOperWare);
    with cdsOper do
    begin
      Edit;
      FieldByName('Correct').AsBoolean := ACorrect;
      FieldByName('OperVid').AsInteger := FOperVid;

      FieldByName('CreatorFIO').Value := Null;
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      FieldByName('DateLocal').Value := Null;
      FieldByName('PriceOper').Value := Null;
      Post;
    end
  end;
  if (cdsOper.FieldByName('OperVid').AsInteger = 201) then
  begin
    cbOperTypeIn.Enabled := false;
    cbOperTypeIn.ItemIndex := 1;
    with cdsOper do
    begin
      Edit;
      if not FieldByName('id_Manufact').IsNull then
      begin
        FieldByName('id_Manufact').Value := Null;
        FieldByName('SrcName').Value := Null;
      end;
      if not FieldByName('id_WareHouse_Ext').IsNull then
      begin
        FieldByName('id_WareHouse_Ext').Value := Null;
        FieldByName('ReprName').Value := Null;
      end;
      Post;
    end;
  end;
  CheckMeasure;
end;

function TfOperLCWare.SaveProp: boolean;
begin
  if not CheckBox1.Checked then
  begin
    with cdsOperWare do
    begin
      First;
      while not Eof do
      begin
        Edit;
        cdsOperWareSummSys.Clear;
        Post;
        Next;
      end;
      First;
    end;
  end;

  if not ChangeData then
  begin
    Result := true;
    Exit;
  end;
  Result := SavePropOper(FID_Oper, cdsOper, cdsOperWare, FReadOnly, fExtDataVal1);
end;

procedure TfOperLCWare.UpdateData;
var CDS : TClientDataSet;
begin
  if cdsOperWare.State = dsEdit then
    cdsOperWare.Post;
  CDS := cdsOper;

  if CDS.State <> dsEdit then
    CDS.Edit;

  CDS.FieldByName('Id_CurrencyOper').Value := fCurSelector1.ID_Curr;
  CDS.FieldByName('CurrencyOperShortName').Value := fCurSelector1.CurName;
//  CDS.FieldByName('Id_CurrencyInv').Value := fCurSelectorInv.ID_Curr;
//  CDS.FieldByName('CurrencyInvShortName').Value := fCurSelectorInv.CurName;

  if CheckBox1.Checked then
  begin
    CDS.FieldByName('Id_CurrencySys').Value := fCurSelector2.ID_Curr;
    CDS.FieldByName('CurrencySysShortName').Value := fCurSelector2.CurName;
  end
  else
  begin
    CDS.FieldByName('Id_CurrencySys').Value := Null;
    CDS.FieldByName('CurrencySysShortName').Value := Null;
  end;

  CDS.FieldByName('Koeff').Value := KoefVal;
  CDS.FieldByName('KoeffName').AsString := cbKoef.Text;

  CDS.FieldByName('OperTypeIn').AsBoolean := cbOperTypeIn.ItemIndex = 0;
  //if KoefVal <> 0 then
  begin
    if lcFormalDistrib.Text <> CDS.FieldByName('FormalDistribName').AsString then
      CDS.FieldByName('FormalDistribName').Value := lcFormalDistrib.Text;
    if lcFuncDistrib.Text <> CDS.FieldByName('FuncDistribName').AsString then
      CDS.FieldByName('FuncDistribName').Value := lcFuncDistrib.Text;
  end{
  else
  begin
    CDS.FieldByName('id_FormalDistrib').Value := Null;
    CDS.FieldByName('id_FuncDistrib').Value := Null;
  end};
  CDS.Post;
end;

procedure TfOperLCWare.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    EnableControl(fCurSelector2);
    aCalcSys.Enabled := not cdsOperWare.IsEmpty and not FPriceLocked and CheckBox1.Checked;
  end
  else
  begin
    DisableControl(fCurSelector2);
    aCalcSys.Enabled := not cdsOperWare.IsEmpty and not FPriceLocked and CheckBox1.Checked;
  end;
  CheckNColor;
  CheckFooter;
end;

procedure TfOperLCWare.CheckFooter;
var i : integer;
begin
  for i := 0 to DBGridEh1.Columns.Count - 1 do
  begin
    if DBGridEh1.Columns[i].Field = cdsOperWareSummOper2 then
    begin
      if not CheckBox1.Checked then
        DBGridEh1.Columns[i].Footer.Font.Style := [fsBold]
      else
        DBGridEh1.Columns[i].Footer.Font.Style := [];
    end;
    if DBGridEh1.Columns[i].Field = cdsOperWareSummSys then
    begin
      if CheckBox1.Checked then
        DBGridEh1.Columns[i].Footer.Font.Style := [fsBold]
      else
        DBGridEh1.Columns[i].Footer.Font.Style := [];
    end;
  end; 
end;

procedure TfOperLCWare.BitBtn4Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
    AEObjTypes: TEObjTypes;
begin
  if not cdsOper.FieldByName('id_Repr').IsNull then
  begin
    ASelectedObj.ID := cdsOper.FieldByName('id_Repr').Value;
    ASelectedObj.ObjType := eotSimplRepr;
  end;
  if not cdsOper.FieldByName('id_Warehouse_Ext').IsNull then
  begin
    ASelectedObj.ID := cdsOper.FieldByName('id_Warehouse_Ext').Value;
    ASelectedObj.ObjType := eotWH;
  end;
  if not cdsOper.FieldByName('id_Manufact_Ext').IsNull then
  begin
    ASelectedObj.ID := cdsOper.FieldByName('id_Manufact_Ext').Value;
    ASelectedObj.ObjType := eotManuf;
  end;

  AEObjTypes := [eotSimplRepr, eotManuf];
  if not cdsOper.FieldByName('id_Warehouse').IsNull and not FRezMode then
    AEObjTypes := AEObjTypes + [eotWH];

  if SelectObjUnLCBsn(cdsOperid_business.AsInteger, ASelectedObj, 0, AEObjTypes) then
  begin
    with cdsOper do
    begin
      Edit;
      FieldByName('id_Repr').Value := Null;
      FieldByName('id_Warehouse_Ext').Value := Null;
      FieldByName('id_Manufact_Ext').Value := Null;

      case ASelectedObj.ObjType of
        eotSimplRepr, eotRepr : FieldByName('id_Repr').Value := ASelectedObj.ID;
        eotWH : FieldByName('id_Warehouse_Ext').Value := ASelectedObj.ID;
        eotManuf : FieldByName('id_Manufact_Ext').Value := ASelectedObj.ID;
      else
        raise Exception.Create('Неверный тип возвращаемого значения');
      end;
      FieldByName('ReprName').Value := ASelectedObj.Name;
      FieldByName('ContrAgentName').Value := ASelectedObj.CA_Name;
      Post;
    end;
  end;
end;


procedure TfOperLCWare.CheckMeasure;
begin
end;

procedure TfOperLCWare.cbVizaClick(Sender: TObject);
begin
  with cdsOper do
  begin
    Edit;
    FieldByName('CheckDate').Value := Null;
    FieldByName('id_UserChecker').Value := Null;
    Post;
  end;
end;

procedure TfOperLCWare.DBEdit4Change(Sender: TObject);
begin
{  if (FID_Oper <> -1) and CheckBox1.Checked then
  begin
    if THackControl(Sender).Text = '' then
      THackControl(Sender).Color := clRed
    else
      THackControl(Sender).Color := clWindow;
  end;  }
end;

function TfOperLCWare.ChangeData: boolean;
begin
  UpdateData;
  Result := (ID_Oper = -1)
            or (cdsOper.ChangeCount > 0)
            or (cdsOperWare.ChangeCount > 0)
            or (fExtDataVal1.cdsExtData.ChangeCount > 0)
end;

procedure TfOperLCWare.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_delete then
  begin
    with cdsOper do
    begin
      Edit;
      FieldByName('id_business').Value := Null;
      FieldByName('BusinessName').Value := Null;
      Post;
    end;
  end;
end;

procedure TfOperLCWare.cdsOperCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('SummOper').AsFloat := DataSet.FieldByName('AmountOper').AsFloat * DataSet.FieldByName('PriceOper').AsFloat;
end;

procedure TfOperLCWare.edAmountOperKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) and (cdsOper.State = dsEdit) then
    cdsOper.Post;
end;

procedure TfOperLCWare.edPriceOperKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) and (cdsOper.State = dsEdit) then
    cdsOper.Post;
end;

procedure TfOperLCWare.BitBtn1Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
    AEObjTypes: TEObjTypes;
begin
  if not cdsOper.FieldByName('id_Warehouse').IsNull then
  begin
    ASelectedObj.ID := cdsOper.FieldByName('id_Warehouse').Value;
    ASelectedObj.ObjType := eotWH;
  end;
  if not cdsOper.FieldByName('id_Manufact').IsNull then
  begin
    ASelectedObj.ID := cdsOper.FieldByName('id_Manufact').Value;
    ASelectedObj.ObjType := eotManuf;
  end;

  if FRezMode then
    AEObjTypes := [eotWH]
  else
    AEObjTypes := [eotWH, eotManuf];
  if SelectObjUnLC(1, ASelectedObj, 0, AEObjTypes) then
  begin
    with cdsOper do
    begin
      Edit;
      if FieldByName('id_business').Value <> ASelectedObj.Bsn_id then
      begin
        FieldByName('id_Repr').Value := Null;
        FieldByName('id_Warehouse_Ext').Value := Null;
        FieldByName('id_Manufact_Ext').Value := Null;
        FieldByName('ReprName').Value := Null;
 //       FieldByName('ContrAgentName').Value := Null;
                                                   
        with cdsOperWare do
        begin
          Close;
          Params.ParamByName('@id_LC_Oper').Value := -1;
          Open;
        end;
//        cdsOperWare.EmptyDataSet;
      end;

      FieldByName('id_business').Value := ASelectedObj.Bsn_id;
      FieldByName('BusinessName').Value := ASelectedObj.Bsn_Name;

      FieldByName('id_Warehouse').Value := Null;
      FieldByName('id_Manufact').Value := Null;

      case ASelectedObj.ObjType of
        eotWH : FieldByName('id_Warehouse').Value := ASelectedObj.ID;
        eotManuf : FieldByName('id_Manufact').Value := ASelectedObj.ID;
      else
        raise Exception.Create('Неверный тип возвращаемого значения');
      end;
      FieldByName('SrcName').Value := ASelectedObj.Name;
      Post;
      fCurSelector1.Initialize(FieldByName('id_business').Value);
      fCurSelector2.Initialize(FieldByName('id_business').Value);
      
      cdsFormal.Close;
      cdsFormal.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
      cdsFormal.Open;

      cdsFunc.Close;
      cdsFunc.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
      cdsFunc.Open;
      cbKoefDoChange;
      ChechEP;
    end;
  end;
end;

procedure TfOperLCWare.cdsOperCorrectGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := 'Да'
  else
    Text := 'Нет';
end;

procedure TfOperLCWare.CheckNColor;
begin
  if not FNeedColor then
    Exit;
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
  with cbOperTypeIn do
  begin
    if  trim(Text) = '' then
      Color := redColor
    else
      Color := clWindow;
  end;
  with edSrcName do
  begin
    if  trim(Text) = '' then
      Color := redColor
    else
      Color := clWindow;
  end;
  with edReprName do
  begin
    if  trim(Text) = '' then
      Color := redColor
    else
      Color := clWindow;
  end;
{  with edWareName do
  begin
    if  trim(Text) = '' then
      Color := redColor
    else
      Color := clWindow;
  end;
  with edAmountOper do
  begin
    if  trim(Text) = '' then
      Color := redColor
    else
      Color := clWindow;
  end;   }

  with fCurSelector1.cbCur do
  begin
    if fCurSelector1.ID_Curr = Null then
      Color := redColor
    else
      Color := clWindow;
  end;

  if (edImp_PayBasic.Text = '') and
     (edAccInv_PayAssignment.Text = '') and
     (edContract.Text = '') then
  begin
    edContract.Color := redColor;
    edAccInv_PayAssignment.Color := redColor;
    edImp_PayBasic.Color := redColor; 
  end
  else
  begin
    edContract.Color := clWindow;
    edAccInv_PayAssignment.Color := clWindow;
    edImp_PayBasic.Color := clWindow; 
  end;
end;

procedure TfOperLCWare.cbOperTypeInChange(Sender: TObject);
begin
  CheckNColor;
end;

procedure TfOperLCWare.cdsOperAfterPost(DataSet: TDataSet);
begin
  CheckNColor;
end;

procedure TfOperLCWare.aAddWareExecute(Sender: TObject);
begin
  AddWare(false);
end;

procedure TfOperLCWare.AddWare(AEdit : boolean);
var ASelectedObj : TSelectedObj;
    Price, ID_Cur: OleVariant;
    id_Warehouse : integer;
    AID, AName : OleVariant;
    EObjTypes : TEObjTypes;
    OldID : Integer;
    S : String;
begin
  with cbOperTypeIn do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран тип операции', 'Сначала выберите тип операции', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with edSrcName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен склад', 'Сначала выберите склад', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with edReprName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен получатель', 'Сначала выберите получателя', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;

  EObjTypes := [eotGoods];
  if not cdsOperWare.FieldByName('id_Goods').IsNull then
  begin
    ASelectedObj.ID := cdsOperWare.FieldByName('id_Goods').Value;
    ASelectedObj.ObjType := eotGoods;
  end;
                             
  if cbOperTypeIn.ItemIndex = 1 then // Расход
  begin
    if cdsOper.FieldByName('id_Warehouse').IsNull then
      id_Warehouse := -1
    else
      id_Warehouse := cdsOper.FieldByName('id_Warehouse').AsInteger;
  end
  else
  begin
    if cdsOper.FieldByName('id_Warehouse_Ext').IsNull then
      id_Warehouse := -1
    else
      id_Warehouse := cdsOper.FieldByName('id_Warehouse_Ext').AsInteger;
  end;
//  if not AEdit then ASelectedObj.ID := -1;
  //if ASelectedObj.ObjType <> eotNone then
  //  EObjTypes := [ASelectedObj.ObjType];

  Screen.Cursor := crSQLWait;
  OldID := ASelectedObj.ID;
  if SelectObjUnLCBsn(cdsOperid_business.AsInteger, ASelectedObj, 0, EObjTypes, id_Warehouse) then
  begin
    with cdsOperWare do
    begin
      if FReadOnly then Exit;
      if (not AEdit or (OldID <> ASelectedObj.ID)) and Locate('id_Goods', ASelectedObj.ID, []) then
      begin
        if MessageBox(Handle, PChar('Этот товар уже выбран. Вы можете не добавлять его повторно, а просто изменить его количество.' + #13 + #10 +
                                    'Добавить повторно?'), 'Этот товар уже выбран', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) <> IDYES	then
        begin
          DBGridEh1.Col := 2;
          Exit;
        end;
      end;

      if AEdit then
        Edit
      else
        Append;

      FieldByName('id_Goods').Value := ASelectedObj.ID;
      
      FieldByName('WareName').Value := ASelectedObj.Name;
      if DM.rsCA.AppServer.PL_WareMeasureGet(FieldByName('id_Goods').Value,
                                             AID, AName) = 1 then
      begin
        FieldByName('id_Measure').AsInteger := AID;
        FieldByName('MeasureName').AsString := AName;
        FieldByName('RealKoef').AsInteger := 1;
      end;

      Post;
      DBGridEh1.Col := 2;
      windows.SetFocus(DBGridEh1.Handle);
    end;
  end;
end;

procedure TfOperLCWare.aDelWareExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить товар "' + cdsOperWareWareName.AsString+ '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    cdsOperWare.Delete;
  end;
end;

procedure TfOperLCWare.aCalcSysExecute(Sender: TObject);
begin
//*
end;

procedure TfOperLCWare.aSummExecute(Sender: TObject);
begin
  CalcSumm;
end;

procedure TfOperLCWare.CalcSumm;
var S : String;
    F : Extended;
begin
  if cdsOperWare.FieldByName('AmountOper').AsFloat = 0 then
    Exit;
  F := cdsOperWare.FieldByName('SummOper2').AsFloat;
  S := FloatToStr(F);
  if InputBoxKrm('Сумма товара "' + cdsOperWareWareName.AsString + '"', 'Сумма', S, [], true) then
  begin
    F := StrToFloat(S);
    F := F / cdsOperWare.FieldByName('AmountOper').AsFloat;
    with cdsOperWare do
    begin
      Edit;
      FieldByName('PriceOper').AsFloat := F;
      Post;
    end;
  end;   
end;

procedure TfOperLCWare.cdsOperWareCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('Numb').AsInteger := DataSet.RecNo;
  if DataSet.FieldByName('AmountOper').AsFloat = 0 then
    DataSet.FieldByName('SummOper2').AsFloat := DataSet.FieldByName('PriceOper').AsFloat
  else
    DataSet.FieldByName('SummOper2').AsFloat := DataSet.FieldByName('AmountOper').AsFloat * DataSet.FieldByName('PriceOper').AsFloat;
end;

procedure TfOperLCWare.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
    S : String;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.IsEmpty then
    Exit;

  if Column.Field = cdsOperWare.FieldByName('WareName') then
  begin
    ImgIndex := 2;
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
    R := Rect;
    R.Top := R.Top + 2;
    R.Left := R.Left + 2 + ilImage.Width;
//    S := cdsOperWare.FieldByName('WareName').AsString;
//    DrawText(TDBGridEh(Sender).Canvas.Handle, PChar(S), -1, R, DT_RIGHT);
    TDBGridEh(Sender).DefaultDrawColumnCell(R, DataCol, Column, State);
  end
  else
  begin
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

    // Красим незаполненные ячейки
    if ((Column.Field = cdsOperWarePriceOper) and
       (cdsOperWarePriceOper.AsFloat = 0)) 
       or
       ((Column.Field = cdsOperWareAmountOper) and
       (cdsOperWareAmountOper.AsFloat = 0))
       or
       (CheckBox1.Checked and
       (Column.Field = cdsOperWareSummSys) and
       (cdsOperWareSummSys.AsFloat = 0))
        then
    begin
      TDBGridEh(Sender).Canvas.Brush.Color := clWindow;

      TDBGridEh(Sender).Canvas.Font.Color := clRed;
      TDBGridEh(Sender).Canvas.Font.Style := TDBGridEh(Sender).Canvas.Font.Style + [fsBold];

      TDBGridEh(Sender).Canvas.Brush.Style := bsClear;
      TDBGridEh(Sender).Canvas.Pen.Color := clRed;
      TDBGridEh(Sender).Canvas.Rectangle(Rect.Left + 0, Rect.Top + 0, Rect.Right - 0, Rect.Bottom - 0);
    end;    
  end;
end;

procedure TfOperLCWare.DBGridEh1EditButtonClick(Sender: TObject);
var tmpCol : TColumnEh;
begin
  if cdsOperWareWareName.IsNull then Exit;
  tmpCol := TDBGridEh(Sender).Columns[TDBGridEh(Sender).col];
  if tmpCol.Field = cdsOperWareWareName then
    AddWare(true);
  if tmpCol.Field = cdsOperWareMeasureName then
    DoChangeMes;
  if tmpCol.Field = cdsOperWareSummSys then
    sbConvertCrn;
end;

procedure TfOperLCWare.sbConvertCrn;
var
    F, xxxRateRBL : Extended;
    S : String;
begin
  if fCurSelector1.ID_Curr = Null then
  begin
    MessageBox(Handle, 'Не выбрана валюта', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(fCurSelector1.cbCur.Handle);
    Exit;
  end;
  if fCurSelector2.ID_Curr = Null then
  begin
    MessageBox(Handle, 'Не выбрана валюта', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(fCurSelector2.cbCur.Handle);
    Exit;
  end;

  xxxRateRBL := fCurSelector2.RateRBL;
  if xxxRateRBL = 0 then
  begin
    S := 'Не задан курс для валюты ' + fCurSelector2.CurName;
    MessageBox(Handle, PChar(S), '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(fCurSelector2.cbCur.Handle);
    Exit;
  end;

  with cdsOperWare do
  begin
    F := FieldByName('SummOper2').AsFloat * fCurSelector1.RateRBL;
    F := F / xxxRateRBL;
    
    Edit;
    FieldByName('SummSys').AsFloat := F;
    Post;
  end;
end;

procedure TfOperLCWare.DoChangeMes;
var
  AID:Variant;
  AName:string;
  Koef, KKK : Extended;
  xxxPriceOper, FVKoef : Variant;
begin
  with cdsOperWare do
  begin
    AID := FieldByName('id_Measure').Value;
//  AName := cdsWare.FieldByName('MeasureName').AsString;
    if SelectOperMeasure(Handle, cdsOperWare.FieldByName('id_Goods').Value,
                         AID, AName, Koef) then
    begin
      Edit;
      FVKoef := FieldByName('RealKoef').Value;
      FieldByName('MeasureName').AsString := AName;
      FieldByName('id_Measure').Value := AID;
      FieldByName('RealKoef').Value := Koef;

      if FVKoef <> Null then
      begin
        KKK := Koef/FVKoef;
        if not FieldByName('PriceOper').IsNull then
        begin
          xxxPriceOper := FieldByName('PriceOper').AsFloat * KKK;
        end;
        if (not FieldByName('PriceOper').IsNull) then
        begin
          if MessageBox(Handle, 'Вы изменили единицу измерения. Пересчитать "Цену за единицу"?', 'Изменена единица измерения', MB_ICONQUESTION + MB_YESNO) = idYes then
          begin
            FieldByName('PriceOper').Value := xxxPriceOper;
          end;
        end;
      end;
      FVKoef := Koef;

      Post;
    end;
  end;
end;

procedure TfOperLCWare.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (FPriceLocked) and
     ((Column.Field = cdsOperWarePriceOper) or
     (Column.Field = cdsOperWareSummSys)) then
    AFont.Color := clGrayText
  else
  begin
    if (not CheckBox1.Checked) and (Column.Field = cdsOperWareSummSys) then
      AFont.Color := clGrayText;
    if (CheckBox1.Checked) and ((Column.Field = cdsOperWareSummOper2) or (Column.Field = cdsOperWarePriceOper)) then
      AFont.Color := clGrayText;
  end;
end;

procedure TfOperLCWare.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
var tmpCol : TColumnEh;
    S, S2 : String;
begin
  if (Key = '.') then
  begin
    S := DecimalSeparator;
    if S = ',' then S2 := '.' else S2 := ',';
    tmpCol := TDBGridEh(Sender).Columns[TDBGridEh(Sender).col];
    if (Key = S2[1]) and ((tmpCol.Field = cdsOperWareAmountOper) or
     (tmpCol.Field = cdsOperWarePriceOper) or
     (tmpCol.Field = cdsOperWareSummSys)) then
      Key := S[1];
  end
  else
    if (Key = #13) then
    begin
      if cdsOperWare.State = dsEdit then
        cdsOperWare.Post
      else
      begin
        with TDBGrideh(Sender) do
          if selectedindex < (fieldcount - 1) then
            selectedindex := selectedindex + 1
          else
            selectedindex := 0;   
      end;
    end;
end;

procedure TfOperLCWare.dsOperWareDataChange(Sender: TObject;
  Field: TField);
begin
  aClearWare.Enabled := not cdsOperWare.IsEmpty;
  aDelWare.Enabled := not cdsOperWare.IsEmpty;
  aCalcSys.Enabled := not cdsOperWare.IsEmpty and not FPriceLocked and ((CheckBox1 <> nil) and CheckBox1.Checked);
  aSumm.Enabled := not cdsOperWare.IsEmpty and not FPriceLocked;
end;

procedure TfOperLCWare.aClearWareExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Очистить перечень товаров?'), 'Подтвердите очистку', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    with cdsOperWare do
    begin
      while not IsEmpty do
        Delete;
    end;
  end;
end;

procedure TfOperLCWare.DBGridEh1DrawFooterCell(Sender: TObject; DataCol,
  Row: Integer; Column: TColumnEh; Rect: TRect; State: TGridDrawState);
begin
  if Column.Field = cdsOperWareAmountOper then
  begin
    if not FShowSummAmount then
      DBGridEh1.Canvas.FillRect(Rect);
  end
  else
    if (Column.Field = cdsOperWareMeasureName) and FShowSummAmount then
    begin
      DBGridEh1.Canvas.FillRect(Rect);
      DrawText(DBGridEh1.Canvas.Handle, PChar(cdsOperWareMeasureName.AsString), -1, Rect, DT_END_ELLIPSIS AND DT_RIGHT);
    end
end;

procedure TfOperLCWare.CalcAmountSum;
var OldRecNo, oldId_Mes : integer;
begin
  FShowSummAmount := true;
  with cdsOperWare do
  begin
    OldRecNo := RecNo;
    DisableControls;
    try
      First;
      oldId_Mes := cdsOperWareid_Measure.AsInteger;
      while not Eof do
      begin
        if oldId_Mes <> cdsOperWareid_Measure.AsInteger then
        begin
          FShowSummAmount := false;
          Break;
        end;
        Next;
      end;
    finally
      RecNo := OldRecNo;
      EnableControls;
    end;
  end;
  tag := 0;
end;

procedure TfOperLCWare.cdsOperWareAfterDelete(DataSet: TDataSet);
begin
  CalcAmountSum;
end;

procedure TfOperLCWare.cdsOperWareAfterPost(DataSet: TDataSet);
begin
  CalcAmountSum;
end;

function TfOperLCWare.GetKoefVal: integer;
begin
  case cbKoef.ItemIndex of
    0 : Result := 0;
    1 : Result := 1;
    2 : Result := -1;
    else
      Result := 0;
  end;
end;

procedure TfOperLCWare.SetKoefVal(const Value: integer);
begin
  case Value of
    0 : cbKoef.ItemIndex := 0;
    1 : cbKoef.ItemIndex := 1;
    -1 : cbKoef.ItemIndex := 2;
    else
      cbKoef.ItemIndex := 0;
  end;
  cbKoefDoChange;
end;


procedure TfOperLCWare.cbKoefChange(Sender: TObject);
begin
  cbKoefDoChange;
end;

procedure TfOperLCWare.cbKoefDoChange;
begin
  lcFormalDistrib.Enabled := true;// (cbKoef.ItemIndex > 0);
  lcFuncDistrib.Enabled := true;// (cbKoef.ItemIndex > 0);
  CheckNColor;
end;


procedure TfOperLCWare.cbKoefKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    cbKoef.ItemIndex := 0;
  cbKoefDoChange;
end;

end.
