unit frOperLCOffset;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ExtCtrls, StdCtrls, Mask, DBCtrls, foMyFunc, Buttons,
  frCurSelector, ToolEdit, RXDBCtrl, ComCtrls, ActnList, Grids, DBGrids,
  ToolWin, RxLookup, CurrEdit, frExtDataValLC, Registry;

type
  TfOperLCOffset = class(TFrame)
    cdsOperFin: TClientDataSet;
    dsOperFin: TDataSource;
    PageControl1: TPageControl;
    tsData: TTabSheet;
    tsComment: TTabSheet;
    P1: TPanel;
    Label6: TLabel;
    Label3: TLabel;
    edReprName: TDBEdit;
    BitBtn4: TBitBtn;
    P2: TPanel;
    cbOperTypeIn: TComboBox;
    Label9: TLabel;
    Label1: TLabel;
    DBEdit9: TDBEdit;
    DBEdit1: TDBEdit;
    Panel4: TPanel;
    Label2: TLabel;
    fCurSelector1: TfCurSelector;
    Panel3: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    DBEdit5: TDBEdit;
    edPriceOper: TRxDBCalcEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    edContract: TDBEdit;
    edImp_PayBasic: TDBEdit;
    edAccInv_PayAssignment: TDBEdit;
    GroupBox4: TGroupBox;
    DBMemo1: TDBMemo;
    BitBtn1: TBitBtn;
    fExtDataVal1: TfExtDataValLC;
    P_FF: TPanel;
    Splitter1: TSplitter;
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
    Label14: TLabel;
    DBEdit2: TDBEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure cbVizaClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsOperFinCorrectGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cbOperTypeInChange(Sender: TObject);
    procedure cdsOperFinAfterPost(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
  private
    FNeedColor, FReadOnly : boolean;
    FID_Oper : integer;
    function GetKoefVal: integer;
    procedure SetKoefVal(const Value: integer);
    property KoefVal : integer read GetKoefVal write SetKoefVal;
    procedure ChechEP;
  public
    function ChangeData : boolean; 
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    procedure Initialize(ID_Oper : integer; AReadOnly : boolean = false; ACorrect : boolean = false; ACopy : boolean = false);

    property ID_Oper : integer read FID_Oper;
    procedure CheckNColor;
  end;

implementation

uses uDM, uLCSelectorUn, uLCOperEng,
  uInputBoxDigit;

{$R *.DFM}

{ TfOperCommon }


{ TfOperCommon }

function TfOperLCOffset.CheckData: boolean;
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
  with edReprName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен получатель', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
{  with DBEdit2 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введена сумма', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;  }
  with fCurSelector1.cbCur do
    if (fCurSelector1.ID_Curr = Null) and (cdsOperFinPriceOper.IsNull) then
    begin
      MessageBox(Handle, 'Не выбрана валюта расчета', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
    
  Result := true;
end;

function TfOperLCOffset.ConfirmChanges: boolean;
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
        CompareField(CDS, 'AcName', 'Счет', SL);
        CompareField(CDS, 'RealReprName', 'Получатель', SL);
        CompareField(CDS, 'BusinessName', 'Бизнес', SL);

        CompareField(CDS, 'PriceOper', 'Сумма', SL);
        CompareField(CDS, 'CurrencyOperName', 'Валюта', SL);

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

constructor TfOperLCOffset.Create(AOwner: TComponent);
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

destructor TfOperLCOffset.Destroy;
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

procedure TfOperLCOffset.Initialize(ID_Oper: integer; AReadOnly: boolean; ACorrect : boolean; ACopy : boolean);
begin
  FNeedColor := ID_Oper <> -1;
  FReadOnly := AReadOnly;
  
  P1.Enabled := not FReadOnly;
  P2.Enabled := not FReadOnly;

  FID_Oper := ID_Oper;
  with cdsOperFin do
  begin
    Close;
    Params.ParamByName('@id_LC_Oper').AsInteger := FID_Oper;
    Open;

    if FID_Oper = -1 then
    begin
      cbOperTypeIn.ItemIndex := -1; 
      Edit;
      FieldByName('Correct').AsBoolean := ACorrect;
  //    FieldByName('id_Replicator').AsInteger := Null;    //1013
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      FieldByName('OperVid').AsInteger := 4;
      Post;
    end
    else
    begin
      fCurSelector1.Initialize(FieldByName('id_business').Value);
      fCurSelector1.ID_Curr := FieldByName('Id_CurrencyOper').Value;
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
    end;
  end;
  ChechEP;
  if ACorrect or ACopy then   // ПРи корректировании сбрасываем номер и выставляем флаг
  begin
    FID_Oper := -1;
    with cdsOperFin do
    begin
      Edit;
      FieldByName('CreatorFIO').Value := Null;
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      FieldByName('DateLocal').Value := Null;

      FieldByName('Correct').AsBoolean := ACorrect;
      Post;
    end
  end;
end;

function TfOperLCOffset.SaveProp: boolean;
begin
  if not ChangeData then
  begin
    Result := true;
    Exit;
  end;
  Result := SavePropOper(FID_Oper, cdsOperFin, nil, FReadOnly, fExtDataVal1);
end;

procedure TfOperLCOffset.UpdateData;
var CDS : TClientDataSet;
begin
  CDS := cdsOperFin;

  if CDS.State <> dsEdit then
    CDS.Edit;

  CDS.FieldByName('Id_CurrencyOper').Value := fCurSelector1.ID_Curr;
  CDS.FieldByName('CurrencyOperShortName').Value := fCurSelector1.CurName;

  CDS.FieldByName('Id_CurrencySys').Value := Null;
  CDS.FieldByName('CurrencySysShortName').Value := Null;        

  CDS.FieldByName('OperTypeIn').AsBoolean := cbOperTypeIn.ItemIndex = 0;
  CDS.FieldByName('Koeff').Value := 0;
//  CDS.FieldByName('KoeffName').AsString := cbKoef.Text;
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

procedure TfOperLCOffset.BitBtn2Click(Sender: TObject);
begin
//*
end;


procedure TfOperLCOffset.ChechEP;
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


procedure TfOperLCOffset.BitBtn4Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
begin
  if not cdsOperFin.FieldByName('id_Repr').IsNull then
  begin
    ASelectedObj.ID := cdsOperFin.FieldByName('id_Repr').Value;
    ASelectedObj.ObjType := eotSimplRepr;
  end;
                             
  if SelectObjUnLC(4, ASelectedObj, 0, [eotSimplRepr]) then
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

      FieldByName('id_Repr').Value := ASelectedObj.ID   ;

      FieldByName('ReprName').Value := ASelectedObj.Name;
      FieldByName('ContrAgentName').Value := ASelectedObj.CA_Name;
      Post;
      fCurSelector1.Initialize(FieldByName('id_business').Value);
      cdsFormal.Close;
      cdsFormal.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
      cdsFormal.Open;

      cdsFunc.Close;
      cdsFunc.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
      cdsFunc.Open;

      ChechEP;
    end;
  end;
end;

procedure TfOperLCOffset.cbVizaClick(Sender: TObject);
begin
  with cdsOperFin do
  begin
    Edit;
    FieldByName('CheckDate').Value := Null;
    FieldByName('id_UserChecker').Value := Null;
    Post;
  end;
end;

procedure TfOperLCOffset.DBEdit1Change(Sender: TObject);
begin
 { if FID_OperFin <> -1 then
  begin
    if THackControl(Sender).Text = '' then
      THackControl(Sender).Color := clRed
    else
      THackControl(Sender).Color := clWindow;
  end;  }
end;

procedure TfOperLCOffset.DBEdit4Change(Sender: TObject);
begin
{  if (FID_OperFin <> -1) and CheckBox1.Checked then
  begin
    if THackControl(Sender).Text = '' then
      THackControl(Sender).Color := clRed
    else
      THackControl(Sender).Color := clWindow;
  end;  }
end;

function TfOperLCOffset.ChangeData: boolean;
begin
  UpdateData;
  Result := (ID_Oper = -1)
            or (cdsOperFin.ChangeCount > 0)
            or (fExtDataVal1.cdsExtData.ChangeCount > 0) 
end;

procedure TfOperLCOffset.DBEdit3KeyDown(Sender: TObject; var Key: Word;
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

procedure TfOperLCOffset.cdsOperFinCorrectGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := 'Да'
  else
    Text := 'Нет';
end;

procedure TfOperLCOffset.cbOperTypeInChange(Sender: TObject);
begin
  CheckNColor;
end;

procedure TfOperLCOffset.cdsOperFinAfterPost(DataSet: TDataSet);
begin
  CheckNColor;
end;

procedure TfOperLCOffset.CheckNColor;
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
  with edPriceOper do
  begin
    if  trim(Text) = '' then
      Color := redColor
    else
      Color := clWindow;
  end;
  with edContract do
  begin
    if  trim(Text) = '' then
      Color := redColor
    else
      Color := clWindow;
  end;
end;

procedure TfOperLCOffset.BitBtn1Click(Sender: TObject);
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

function TfOperLCOffset.GetKoefVal: integer;
begin
{  case cbKoef.ItemIndex of
    0 : Result := 0;
    1 : Result := 1;
    2 : Result := -1;
    else
      Result := 0;
  end; }
end;

procedure TfOperLCOffset.SetKoefVal(const Value: integer);
begin
{  case Value of
    0 : cbKoef.ItemIndex := 0;
    1 : cbKoef.ItemIndex := 1;
    -1 : cbKoef.ItemIndex := 2;
    else
      cbKoef.ItemIndex := 0;
  end; }

end;

end.
