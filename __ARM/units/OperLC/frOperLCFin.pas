unit frOperLCFin;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ExtCtrls, StdCtrls, Mask, DBCtrls, foMyFunc, Buttons,
  frCurSelector, ToolEdit, RXDBCtrl, ComCtrls, ActnList, Grids, DBGrids,
  ToolWin, RxLookup, CurrEdit, frExtDataValLC, Registry;

type
  TfOperLCFin = class(TFrame)
    cdsOperFin: TClientDataSet;
    dsOperFin: TDataSource;
    PageControl1: TPageControl;
    tsData: TTabSheet;
    tsComment: TTabSheet;
    P1: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    edSrcName: TDBEdit;
    BitBtn3: TBitBtn;
    edReprName: TDBEdit;
    BitBtn4: TBitBtn;
    cbOperTypeIn: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    P2: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    fCurSelector1: TfCurSelector;
    DBEdit8: TDBEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label11: TLabel;
    Label17: TLabel;
    GroupBox1: TGroupBox;
    pnSys: TPanel;
    Panel10: TPanel;
    Label15: TLabel;
    fCurSelector2: TfCurSelector;
    Panel9: TPanel;
    CheckBox1: TCheckBox;
    Panel3: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    DBEdit5: TDBEdit;
    edContract: TDBEdit;
    edImp_PayBasic: TDBEdit;
    edAccInv_PayAssignment: TDBEdit;
    edPriceOper: TRxDBCalcEdit;
    DBEdit4: TRxDBCalcEdit;
    GroupBox4: TGroupBox;
    DBMemo1: TDBMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Splitter1: TSplitter;
    P_FF: TPanel;
    Label13: TLabel;
    cbKoef: TComboBox;
    fExtDataVal1: TfExtDataValLC;
    cdsFormal: TClientDataSet;
    cdsFormalid_FormalDistrib: TAutoIncField;
    cdsFormalName: TStringField;
    cdsFunc: TClientDataSet;
    cdsFuncid_FuncDistrib: TAutoIncField;
    cdsFuncName: TStringField;
    dsFormal: TDataSource;
    dsFunc: TDataSource;
    Label4: TLabel;
    lcFormalDistrib: TRxDBLookupCombo;
    Label12: TLabel;
    lcFuncDistrib: TRxDBLookupCombo;
    cdsOperFinid_LC_Oper: TAutoIncField;
    cdsOperFinDateLocal: TDateTimeField;
    cdsOperFinOperVid: TIntegerField;
    cdsOperFinid_UserCreator: TIntegerField;
    cdsOperFinCreatorFIO: TStringField;
    cdsOperFinid_business: TIntegerField;
    cdsOperFinId_CurrencyBsn: TIntegerField;
    cdsOperFinBusinessName: TStringField;
    cdsOperFinBusinessNum: TStringField;
    cdsOperFinCorrect: TBooleanField;
    cdsOperFinOperTypeIn: TBooleanField;
    cdsOperFinId_CurrencyOper: TIntegerField;
    cdsOperFinCurrencyOperName: TStringField;
    cdsOperFinCurrencyOperShortName: TStringField;
    cdsOperFinPriceOper: TFloatField;
    cdsOperFinId_CurrencySys: TIntegerField;
    cdsOperFinCurrencySysName: TStringField;
    cdsOperFinCurrencySysShortName: TStringField;
    cdsOperFinSummSys: TFloatField;
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
    cdsOperFinKoeff: TIntegerField;
    cdsOperFinKoeffName: TStringField;
    cdsOperFinCheckDate: TDateTimeField;
    cdsOperFinid_FormalDistrib: TIntegerField;
    cdsOperFinFormalDistribName: TStringField;
    cdsOperFinid_FuncDistrib: TIntegerField;
    cdsOperFinFuncDistribName: TStringField;
    cdsOperFinSummOper: TFloatField;
    cdsOperFinTypeName: TStringField;
    cdsOperFinHasViza: TBooleanField;
    cdsOperFinid_DocType: TIntegerField;
    cdsOperFinImp_PayBasic: TStringField;
    cdsOperFinAccInv_PayAssignment: TStringField;
    cdsOperFinContract: TStringField;
    cdsOperFinOperCrnName: TStringField;
    cdsOperFinCurrencyBsnName: TStringField;
    cdsOperFinOpComment: TStringField;
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
    cdsOperFinid_LC_Oper_Ext: TIntegerField;
    cdsOperFinid_ContrAgent: TIntegerField;
    cdsOperFinContrAgentName: TStringField;
    pCA: TPanel;
    DBEdit1: TDBEdit;
    Label14: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure cbVizaClick(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsOperFinCorrectGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsOperFinAfterPost(DataSet: TDataSet);
    procedure cbOperTypeInChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cbKoefChange(Sender: TObject);
    procedure cbKoefKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function GetKoefVal: integer;
    procedure SetKoefVal(const Value: integer);
    procedure cbKoefDoChange;
  private
    FNeedColor, FReadOnly, Fis_Mirr : boolean;
    FID_Oper : integer;
    property KoefVal : integer read GetKoefVal write SetKoefVal;
    procedure ChechEP;        
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    function ChangeData : boolean; 
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    procedure Initialize(ID_Oper: integer; AReadOnly: boolean; ACorrect : boolean; ACopy : boolean; Ais_Mirr : boolean);

    property ID_Oper : integer read FID_Oper;

    procedure CheckNColor;
  end;

implementation

uses uDM, uLCSelectorUn, uLCOperEng,
  uInputBoxDigit;

{$R *.DFM}

{ TfOperCommon }


{ TfOperCommon }

function TfOperLCFin.CheckData: boolean;
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
      MessageBox(Handle, 'Не введен счет', 'Введены не все данные', MB_OK + MB_ICONERROR);
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
 { with DBEdit2 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введена сумма', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;  }
  with fCurSelector1.cbCur do
    if (fCurSelector1.ID_Curr = Null) {and (cdsOperFinPriceOper.AsFloat <> 0)} then
    begin
      MessageBox(Handle, 'Не выбрана валюта расчета', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
    
  if CheckBox1.Checked then
  begin
    with DBEdit4 do
      if trim(Text) = '' then
      begin
        MessageBox(Handle, 'Не введена сумма', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Windows.SetFocus(Handle);
        Exit;
      end;
    with fCurSelector2.cbCur do
      if trim(Text) = '' then
      begin
        MessageBox(Handle, 'Не выбрана зачетная валюта', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Windows.SetFocus(Handle);
        Exit;
      end;
  end;
  Result := true;
end;

function TfOperLCFin.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsOperFin;
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
        CompareField(CDS, 'ReprName', 'Получатель', SL);
        CompareField(CDS, 'BusinessName', 'Бизнес', SL);

        CompareField(CDS, 'PriceOper', 'Сумма', SL);
        CompareField(CDS, 'CurrencyOperName', 'Валюта', SL);
        if CheckBox1.Checked then
        begin
          CompareField(CDS, 'SummSys', 'Зачетная сумма', SL);
          CompareField(CDS, 'CurrencySysName', 'Зачетная валюта', SL);
        end;

        CompareField(CDS, 'ManagerFIO', 'Сотрудник', SL);
        CompareField(CDS, 'FormalDistribName', 'Формальное распределение', SL);
        CompareField(CDS, 'FuncDistribName', 'Функциональное распределение', SL);
        CompareField(CDS, 'Koeff', 'Суть операции', SL, false);
      end;
      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfOperLCFin.Create(AOwner: TComponent);
var
    Reg : TRegistry;
    FullRegPathName : String;
begin
  inherited;
      {$IFNDEF ACS_v2}
  pCA.Visible := false;
       {$ENDIF}

  FNeedColor := false;
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
end;

destructor TfOperLCFin.Destroy;
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

procedure TfOperLCFin.Initialize(ID_Oper: integer; AReadOnly: boolean; ACorrect : boolean; ACopy : boolean; Ais_Mirr : boolean);
begin
  FNeedColor := ID_Oper <> -1;
  FReadOnly := AReadOnly;
  Fis_Mirr := Ais_Mirr;
  P1.Enabled := not FReadOnly;
  P2.Enabled := not FReadOnly;
  GroupBox2.Enabled := not FReadOnly;
  GroupBox1.Enabled := not FReadOnly;



  FID_Oper := ID_Oper;
  with cdsOperFin do
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
      FieldByName('OperVid').AsInteger := 2;
      Post;
    end
    else
    begin
      fCurSelector1.Initialize(FieldByName('id_business').Value);
      fCurSelector2.Initialize(FieldByName('id_business').Value);
      fCurSelector1.ID_Curr := FieldByName('Id_CurrencyOper').Value;
      fCurSelector2.ID_Curr := FieldByName('Id_CurrencySys').Value;

      cdsFormal.Close;
      cdsFormal.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
      cdsFormal.Open;
      cdsFunc.Close;
      cdsFunc.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
      cdsFunc.Open;

      KoefVal := FieldByName('Koeff').AsInteger;
      CheckBox1.Checked := not FieldByName('Id_CurrencySys').IsNull;
      CheckBox1Click(CheckBox1);
      if FieldByName('OperTypeIn').AsBoolean then
        cbOperTypeIn.ItemIndex := 0
      else
        cbOperTypeIn.ItemIndex := 1;
    end;
  end;

  ChechEP;
  if ACorrect or ACopy then   // ПРи корректировании сбрасываем номер и выставляем флаг
  begin
    FID_Oper := -1;
    with cdsOperFin do
    begin
      RebildExtData(fExtDataVal1.cdsExtData);
      Edit;
      FieldByName('Correct').AsBoolean := ACorrect;

      FieldByName('CreatorFIO').Value := Null;
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      FieldByName('DateLocal').Value := Null;

      Post;
    end
  end;
end;

procedure TfOperLCFin.ChechEP;
begin
  if DM.CheckUserRights(24, cdsOperFin.FieldByName('id_business').Value) then
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
  fExtDataVal1.Initialize(FID_Oper, cdsOperFin.FieldByName('id_business').AsInteger);
end;

function TfOperLCFin.SaveProp: boolean;
begin
  if not ChangeData then
  begin
    Result := true;
    Exit;
  end;
  Result := SavePropOper(FID_Oper, cdsOperFin, nil, FReadOnly, fExtDataVal1); 
end;

procedure TfOperLCFin.UpdateData;
var CDS : TClientDataSet;
begin
  CDS := cdsOperFin;

  if CDS.State <> dsEdit then
    CDS.Edit;

  CDS.FieldByName('Id_CurrencyOper').Value := fCurSelector1.ID_Curr;
  CDS.FieldByName('CurrencyOperShortName').Value := fCurSelector1.CurName;

  if CheckBox1.Checked then
  begin
    CDS.FieldByName('Id_CurrencySys').Value := fCurSelector2.ID_Curr;
    CDS.FieldByName('CurrencySysShortName').Value := fCurSelector2.CurName;
    CDS.FieldByName('CurrencySysName').Value := fCurSelector2.CurName;
  end
  else
  begin
    CDS.FieldByName('Id_CurrencySys').Value := Null;
    CDS.FieldByName('CurrencySysShortName').Value := Null;
    CDS.FieldByName('SummSys').Value := Null;
  end;

  CDS.FieldByName('OperTypeIn').AsBoolean := cbOperTypeIn.ItemIndex = 0;
  CDS.FieldByName('Koeff').Value := KoefVal;
  CDS.FieldByName('KoeffName').AsString := cbKoef.Text;
 // if KoefVal <> 0 then
  begin
    if lcFormalDistrib.Text <> CDS.FieldByName('FormalDistribName').AsString then
      CDS.FieldByName('FormalDistribName').Value := lcFormalDistrib.Text;
    if lcFuncDistrib.Text <> CDS.FieldByName('FuncDistribName').AsString then
      CDS.FieldByName('FuncDistribName').Value := lcFuncDistrib.Text;
  end
 { else
  begin
    CDS.FieldByName('id_FormalDistrib').Value := Null;
    CDS.FieldByName('id_FuncDistrib').Value := Null;
  end};

  CDS.Post;
end;

procedure TfOperLCFin.CheckBox1Click(Sender: TObject);
begin
// GroupBox1.Enabled := CheckBox1.Checked;
  if CheckBox1.Checked then
  begin
    EnableControl(pnSys);
  end
  else
  begin
    DisableControl(pnSys);
  end;
end;

procedure TfOperLCFin.BitBtn3Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
begin
  ASelectedObj.ID := cdsOperFin.FieldByName('id_Acc').Value;
  ASelectedObj.ObjType := eotFin;

  if SelectObjUnLC(2, ASelectedObj, 0, [eotFin]) then
  begin
    with cdsOperFin do
    begin
      Edit;

      if FieldByName('id_business').Value <> ASelectedObj.Bsn_id then
      begin
        FieldByName('id_Repr').Value := Null;
        FieldByName('id_Warehouse_Ext').Value := Null;
        FieldByName('id_Manufact_Ext').Value := Null;
        FieldByName('ReprName').Value := Null;
        FieldByName('id_Acc_Ext').Value := Null;

      end;

      FieldByName('id_business').Value := ASelectedObj.Bsn_id;
      FieldByName('BusinessName').Value := ASelectedObj.Bsn_Name;

      FieldByName('id_Acc').Value := ASelectedObj.ID;
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

procedure TfOperLCFin.BitBtn4Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
begin
  if not cdsOperFin.FieldByName('id_Acc_Ext').IsNull then
  begin
    ASelectedObj.ID := cdsOperFin.FieldByName('id_Acc_Ext').Value;
    ASelectedObj.ObjType := eotFin;
  end;
  if not cdsOperFin.FieldByName('id_Repr').IsNull then
  begin
    ASelectedObj.ID := cdsOperFin.FieldByName('id_Repr').Value;
    ASelectedObj.ObjType := eotSimplRepr;
  end;

  if SelectObjUnLCBsn(cdsOperFinid_business.AsInteger, ASelectedObj, 0, [eotFin, eotSimplRepr{, eotEQ}]) then
  begin
    with cdsOperFin do
    begin
      Edit;
      FieldByName('id_Acc_Ext').Value := Null;
      FieldByName('id_Repr').Value := Null;

      case ASelectedObj.ObjType of
        eotFin : FieldByName('id_Acc_Ext').Value := ASelectedObj.ID;
        eotSimplRepr : FieldByName('id_Repr').Value := ASelectedObj.ID   ;
        eotRepr : FieldByName('id_Repr').Value := ASelectedObj.ID   ;
      else
        raise Exception.Create('Неверный тип возвращаемого значения');
      end;

      FieldByName('ReprName').Value := ASelectedObj.Name;
      FieldByName('ContrAgentName').Value := ASelectedObj.CA_Name;
      Post;
    end;
  end;
end;

procedure TfOperLCFin.cbVizaClick(Sender: TObject);
begin
  with cdsOperFin do
  begin
    Edit;
    FieldByName('CheckDate').Value := Null;
    FieldByName('id_UserChecker').Value := Null;
    Post;
  end;
end;

procedure TfOperLCFin.DBEdit4Change(Sender: TObject);
begin
{  if (FID_Oper <> -1) and CheckBox1.Checked then
  begin
    if THackControl(Sender).Text = '' then
      THackControl(Sender).Color := clRed
    else
      THackControl(Sender).Color := clWindow;
  end;  }
end;

function TfOperLCFin.ChangeData: boolean;
begin
  UpdateData;
  Result := (ID_Oper = -1)
            or (cdsOperFin.ChangeCount > 0)
            or (fExtDataVal1.cdsExtData.ChangeCount > 0) 
end;

procedure TfOperLCFin.DBEdit3KeyDown(Sender: TObject; var Key: Word;
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

procedure TfOperLCFin.cdsOperFinCorrectGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := 'Да'
  else
    Text := 'Нет';
end;

procedure TfOperLCFin.CheckNColor;
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
  with edReprName do
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
  with edPriceOper do
  begin
    if  trim(Text) = '' then
      Color := redColor
    else
      Color := clWindow;
  end;

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

procedure TfOperLCFin.cdsOperFinAfterPost(DataSet: TDataSet);
begin
  CheckNColor;
end;

procedure TfOperLCFin.cbOperTypeInChange(Sender: TObject);
begin
  CheckNColor;
end;

procedure TfOperLCFin.BitBtn1Click(Sender: TObject);
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

procedure TfOperLCFin.BitBtn2Click(Sender: TObject);
var F : Variant;
    S : String;
begin
  S := 'SummSys';
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

function TfOperLCFin.GetKoefVal: integer;
begin
  case cbKoef.ItemIndex of
    0 : Result := 0;
    1 : Result := 1;
    2 : Result := -1;
    else
      Result := 0;
  end;
end;

procedure TfOperLCFin.SetKoefVal(const Value: integer);
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

procedure TfOperLCFin.cbKoefChange(Sender: TObject);
begin
  cbKoefDoChange;
end;

procedure TfOperLCFin.cbKoefDoChange;
begin
  lcFormalDistrib.Enabled := true;// (cbKoef.ItemIndex > 0);
  lcFuncDistrib.Enabled := true;// (cbKoef.ItemIndex > 0);
  CheckNColor;
end;

procedure TfOperLCFin.cbKoefKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    cbKoef.ItemIndex := 0;
  cbKoefDoChange;
end;

end.
