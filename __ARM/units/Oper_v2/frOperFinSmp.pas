unit frOperFinSmp;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ExtCtrls, StdCtrls, Mask, DBCtrls, foMyFunc, Buttons,
  frCurSelector, ToolEdit, RXDBCtrl, ComCtrls, ActnList, Grids, DBGrids,
  ToolWin, RxLookup, frOperOldData, CurrEdit, frExtDataVal, Registry,frArc,
  frBJByOper, RXCtrls, Menus, clipbrd;

type
  TfOperFinSmp = class(TFrame)
    cdsOperFin: TClientDataSet;
    dsOperFin: TDataSource;
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
    cdsOperFinVatIn: TBooleanField;
    pmIns: TPopupMenu;
    fBJByOper1: TfBJByOper;
    Panel7: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit10: TDBEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label6: TLabel;
    Label17: TLabel;
    Label1: TLabel;
    edContract: TDBEdit;
    edImp_PayBasic: TDBEdit;
    edAccInv_PayAssignment: TDBEdit;
    btnX1: TButton;
    btnX2: TButton;
    btnX3: TButton;
    DBEdit4: TDBEdit;
    P1: TPanel;
    lbSrcName: TLabel;
    lbReprName: TLabel;
    lbOperTypeIn: TLabel;
    Label13: TLabel;
    RxSpeedButton1: TRxSpeedButton;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    BitBtn3: TBitBtn;
    edReprName: TDBEdit;
    BitBtn4: TBitBtn;
    cbOperTypeIn: TComboBox;
    DBEdit3: TDBEdit;
    DBEdit2: TRxDBCalcEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure cdsOperFinCorrectGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsOperFinAfterPost(DataSet: TDataSet);
    procedure cbOperTypeInChange(Sender: TObject);
    procedure lcbBsnChange(Sender: TObject);
    procedure DBEdit2Click(Sender: TObject);
    procedure cdsOperCommentAfterPost(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnX1Click(Sender: TObject);
    procedure btnX2Click(Sender: TObject);
    procedure btnX3Click(Sender: TObject);
    procedure FrameResize(Sender: TObject);
  private
    fArc_Off : TfArc;
    FNeedColor, FReadOnly : boolean;

 
    function GEtID_Oper: integer;
 
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

    property ID_Oper : integer read GEtID_Oper;

    procedure MakeRed;
    procedure CheckNColor;

    function CheckAmount(var Amount : Extended) : boolean;
  end;

implementation

uses uDM, uFormsAPI_Admin, uFormsAPI_Users, uFormApi_CA, uUnivOper_v2,
  uRepSelector, uComment_ext, uUnivSelector, uInputBoxDigit,
  uCrnRateSelector, uAPOperList;

{$R *.DFM}

{ TfOperFin }

function TfOperFinSmp.CheckData: boolean;
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
  with edReprName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен получатель', 'Введены не все данные', MB_OK + MB_ICONERROR);
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
 
    
 
   
  Result := true;
  MakeRed;
end;

function TfOperFinSmp.ConfirmChanges: boolean;
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

constructor TfOperFinSmp.Create(AOwner: TComponent);
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
 
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  FNeedColor := false;
end;

destructor TfOperFinSmp.Destroy;
var Reg : TRegistry;
    FullRegPathName : String;
begin
  if Owner is TCustomForm then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;

      FullRegPathName := SRegPath + '\' + ClassName + TCustomForm(Owner).ClassName;
 
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  inherited;
end;

procedure TfOperFinSmp.Initialize(AOperParamz : TOperParamz);
var S : String;
    ObjName, ObjID, BsnName, id_business: OleVariant;
  id_Oper_OLD : integer;
  id_Acc: integer;
  AccName: String;
begin
//  fBJByOper1.Visible := DM.CheckUserRights(110, Null);
  
  FOperParamz := AOperParamz;
  P1.Enabled := not FOperParamz.ReadOnly;
  
  FNeedColor := FOperParamz.ID_Oper <> -1;
  with cdsOperFin do
  begin
    Close;
    Params.ParamByName('@id_Oper').AsInteger := FOperParamz.ID_Oper;
    Params.ParamByName('@is_Mirr').AsBoolean := FOperParamz.is_Mirr;
    Open;

   // if (FOperParamz.ID_Oper <> -1) and (cdsOperFin.FieldByName('OperVid').AsInteger <> 2) then
   //   raise Exception.Create('Это не финансовая операция!!!');
      
    if FOperParamz.ID_Oper = -1 then
    begin
//      KoefVal := 0;
      cbOperTypeIn.ItemIndex := -1;
 
      Edit;
      FieldByName('VatIn').AsBoolean := FVatIn;
      FieldByName('id_Replicator').Value := Null;    
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      FieldByName('id_OperParent').Value := FOperParamz.id_OperParent;
      FieldByName('OperVid').AsInteger := 2;


      if AReadOneObj then
      begin
        if DM.SnglObj_Acc(ObjName, ObjID, BsnName, id_business) then
        begin
          FieldByName('id_business').Value := id_business;
          FieldByName('BusinessName').Value := BsnName;

          FieldByName('id_Acc').Value := ObjID;
          FieldByName('SrcName').Value := ObjName;
        end;
      end;

      Post;
 
     end
    else
    begin
      if FOperParamz.DoPay then
      begin
        Edit;
        DM.FDateCreate := cdsOperFinDateCreate.AsDateTime;
        cdsOperFinId_CurrencyOper.AsVariant := FOperParamz.id_Cur;
        cdsOperFinPriceOper.AsVariant := FOperParamz.Summ;
        cdsOperFinOperTypeIn.AsVariant := FOperParamz.OperTypeIn;
        FieldByName('Koeff').AsVariant := 0;
        FieldByName('OperVid').AsInteger := 2;
        FieldByName('Id_CurrencySys').AsVariant := Null;
        cdsOperFinSummSys.AsVariant := Null;
        if DM.GetOneAcc(FieldByName('id_business').AsInteger, id_Acc, AccName) then
        begin
          FieldByName('id_Acc').Value := id_Acc;
          FieldByName('SrcName').Value := AccName;
        end;
        Post;
      end;

      if FieldByName('OperTypeIn').AsBoolean then
        cbOperTypeIn.ItemIndex := 0
      else
        cbOperTypeIn.ItemIndex := 1;

     end;
  end;
   fBJByOper1.Initialize(ID_Oper, cdsOperFin.FieldByName('id_business').AsInteger);
  
  if FOperParamz.Correct or FOperParamz.Copy then   // Коррекция или копирование
  begin
    id_Oper_OLD := FOperParamz.ID_Oper;
    FOperParamz.ID_Oper := -1;
     fBJByOper1.Initialize(-1, cdsOperFin.FieldByName('id_business').AsInteger, id_Oper_OLD);
    RebildBJ(fBJByOper1.cdsBJ_ByOper);
    with cdsOperFin do
    begin
      Edit;
      FieldByName('Correct').AsBoolean := FOperParamz.Correct;
      FieldByName('id_Replicator').Value := Null;
      FieldByName('is_Mirr').Value := Null;
      FieldByName('id_OperParent').Value := FOperParamz.id_OperParent;
      FieldByName('Id_CurrencyInv').Value := Null;

      FieldByName('CreatorFIO').Value := DM.FullFIO;
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      FieldByName('DateLocal').Value := Null;

      FieldByName('OperState').Value := 0;
      FieldByName('HasViza').Value := false;
      FieldByName('CheckDate').Value := Null;

//      FieldByName('CheckDate').Value := Null;

      Post;
      if (FOperParamz.Correct) then
      begin
        S := cdsOperFin.FieldByName('OperNum').AsString;
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
//  fOperOldData1.Initialize(cdsOperFinid_old_Oper.AsInteger);

 
  if FOperParamz.ID_Oper <> -1 then
    MakeRed;
end;

function TfOperFinSmp.SaveProp: boolean;
begin
  if not ChangeData then
  begin
    Result := false;
    Exit;
  end;
  Result := SavePropOper(FOperParamz.ID_Oper, cdsOperFin, nil, nil, fBJByOper1)
end;

procedure TfOperFinSmp.UpdateData;
var CDS : TClientDataSet;
begin
  CDS := cdsOperFin;

  if CDS.State <> dsEdit then
    CDS.Edit;

  CDS.FieldByName('Id_CurrencyOper').Value := 20;
  CDS.FieldByName('CurrencyOperShortName').Value := 'руб';
//  CDS.FieldByName('AmountOper').Value := 1;
  
    CDS.FieldByName('Id_CurrencySys').Value := Null;
    CDS.FieldByName('CurrencySysShortName').Value := Null;
    CDS.FieldByName('SummSys').Value := Null;
    CDS.FieldByName('RateSys').Value := Null;


 // if CDS.FieldByName('BusinessName').AsString <> lcbBsn.Text then
//    CDS.FieldByName('BusinessName').Value := lcbBsn.Text;

  CDS.FieldByName('Koeff').Value := 0;
 
  if (cbOperTypeIn.ItemIndex = 0) <> CDS.FieldByName('OperTypeIn').AsBoolean then
    CDS.FieldByName('OperTypeIn').Value := cbOperTypeIn.ItemIndex = 0;

   CDS.Post;
end;

procedure TfOperFinSmp.BitBtn3Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
begin
  ASelectedObj.ID := cdsOperFin.FieldByName('id_Acc').Value;
  ASelectedObj.ObjType := eotFin;

  if SelectObjUn(Owner, 2, ASelectedObj, 0, [eotFin]) then
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
        FieldByName('ContrAgentName').Value := Null;

    //    FieldByName('id_Goods').Value := Null;
     //   FieldByName('WareName').Value := Null;
      end;

      FieldByName('id_business').Value := ASelectedObj.Bsn_id;
      FieldByName('BusinessName').Value := ASelectedObj.Bsn_Name;

      FieldByName('id_Acc').Value := ASelectedObj.ID;
      FieldByName('SrcName').Value := ASelectedObj.Name;
      Post;
 
      fBJByOper1.Initialize(-1, FieldByName('id_business').Value);
  
    end;
  end;
end;

procedure TfOperFinSmp.BitBtn4Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
    Rez : boolean;
    AEObjTypes: TEObjTypes;
begin
  with cbOperTypeIn do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран тип операции', 'Сначала выберите тип операции', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with DBEdit1 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен счет', 'Сначала выберите счет', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;   

  if not cdsOperFin.FieldByName('id_Acc_Ext').IsNull then
  begin
    ASelectedObj.ID := cdsOperFin.FieldByName('id_Acc_Ext').Value;
    ASelectedObj.ObjType := eotFin;
  end;
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

  AEObjTypes := [eotFin, eotRepr{, eotEQ}];
  if (not cdsOperFin.FieldByName('id_Repr_Ex').IsNull) and (cdsOperFin.FieldByName('id_Repr').IsNull) then
  begin
    Rez := SelectRep(Handle, Null, cdsOperFin.FieldByName('id_business').AsInteger, ASelectedObj, 0, AEObjTypes, cdsOperFin.FieldByName('id_Repr').Value)
  end
  else
    Rez := SelectObjUnBsn(Owner, cdsOperFin.FieldByName('id_business').AsInteger, ASelectedObj, 0, AEObjTypes);
  if Rez then
  begin
    with cdsOperFin do
    begin
      Edit;
      FieldByName('id_Acc_Ext').Value := Null;
      FieldByName('id_Repr').Value := Null;
      FieldByName('id_Repr_Ex').Value := Null;

      case ASelectedObj.ObjType of
        eotFin : FieldByName('id_Acc_Ext').Value := ASelectedObj.ID;
        eotRepr :
        begin
         FieldByName('id_Repr').Value := ASelectedObj.ID;
         cdsOperFinid_ContrAgent.AsInteger := ASelectedObj.CA_ID;
        end;
      else
        raise Exception.Create('Неверный тип возвращаемого значения');
      end;

      FieldByName('ReprName').Value := ASelectedObj.Name;
      FieldByName('ContrAgentName').Value := ASelectedObj.CA_Name;
      Post;
    end;
  end;
end;

 

procedure TfOperFinSmp.DBEdit1Change(Sender: TObject);
begin
 { if FID_OperFin <> -1 then
  begin
    if THackControl(Sender).Text = '' then
      THackControl(Sender).Color := clRed
    else
      THackControl(Sender).Color := clWindow;
  end;  }
end;

function TfOperFinSmp.ChangeData: boolean;
begin
  Result := (ID_Oper = -1) or (cdsOperFin.ChangeCount > 0) 
  or (fBJByOper1.ChangeCount > 0)
end;

procedure TfOperFinSmp.MakeRed;
begin
  if cdsOperFin.FieldByName('SrcID_Main').IsNull then
  begin
    with lbSrcName do
    begin
      Font.Style := Font.Style + [fsBold];
      Font.Color := clRed;
    end;
  end;
  if (cdsOperFin.FieldByName('ReprID_Main').IsNull) then
  begin
    with lbReprName do
    begin
      Font.Style := Font.Style + [fsBold];
      Font.Color := clRed;
    end;
  end;
end;

procedure TfOperFinSmp.cdsOperFinCorrectGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := 'Да'
  else
    Text := 'Нет';
end;

procedure TfOperFinSmp.CheckNColor;
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
  with edReprName do
  begin
    if (trim(Text) = '')  or
     ((not cdsOperFin.FieldByName('id_Repr_Ex').IsNull) and (cdsOperFin.FieldByName('id_Repr').IsNull))  then
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
 
 
end;

procedure TfOperFinSmp.cdsOperFinAfterPost(DataSet: TDataSet);
begin
  CheckNColor;
end;

procedure TfOperFinSmp.cbOperTypeInChange(Sender: TObject);
begin
  CheckNColor;
end;

procedure TfOperFinSmp.lcbBsnChange(Sender: TObject);
begin
  CheckNColor;

end;
 

function TfOperFinSmp.CheckAmount(var Amount : Extended): boolean;
var ID : integer;
    TotalSum : Double;
    Koef :  Double;
begin
  Result := true;       
// *** Проверяем кол-во ***
  if (cbOperTypeIn.ItemIndex = 1) and (not cdsOperFin.FieldByName('HasViza').AsBoolean) then
  begin
    ID := cdsOperFin.FieldByName('id_Acc').Value;
    TotalSum := DM.rsCA.AppServer.UN_AccSummByCur(ID, Null, 20);
    with DBEdit2 do
      if (DBEdit2.Field.AsFloat - TotalSum) > 0.005 then
      begin
        Amount := TotalSum;
        Result := false;
      end;
  end;
  if (cbOperTypeIn.ItemIndex = 0) and (not cdsOperFin.FieldByName('HasViza').AsBoolean) and (not cdsOperFin.FieldByName('id_Acc_Ext').IsNull) then
  begin
    ID := cdsOperFin.FieldByName('id_Acc_Ext').Value;
    TotalSum := DM.rsCA.AppServer.UN_AccSummByCur(ID, Null, 20);
    with DBEdit2 do
      if (DBEdit2.Field.AsFloat - TotalSum) > 0.005 then
      begin
        Amount := TotalSum;
        Result := false;
      end;
  end;
end;

procedure TfOperFinSmp.DBEdit2Click(Sender: TObject);
begin
//  TCustomEdit(sender).SelStart := 0;
//  TCustomEdit(sender).SelLength := Length(TCustomEdit(sender).Text);
end;

procedure TfOperFinSmp.cdsOperCommentAfterPost(DataSet: TDataSet);
begin
 { if (FID_Oper <> -1) and FReadOnly then
  begin
    if not CDSApplyUpdates(cdsOperComment, 'id_Oper', FID_Oper, true) then
      raise Exception.Create('Ошибка при сохранении комментариев');
  end; }
end;

procedure TfOperFinSmp.BitBtn1Click(Sender: TObject);
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

procedure TfOperFinSmp.BitBtn2Click(Sender: TObject);
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

function TfOperFinSmp.GEtID_Oper: integer;
begin
  Result := FOperParamz.ID_Oper;
end;

procedure TfOperFinSmp.Button1Click(Sender: TObject);
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

procedure TfOperFinSmp.Button2Click(Sender: TObject);
var V : Variant;
begin
  V := GetFloatFromClipBoadr;
  if V <> 0 then
  begin
    if cdsOperFin.State <> dsEdit then
      cdsOperFin.Edit;
    cdsOperFinSummSys.AsFloat := V;
    cdsOperFin.Post;
  end;
end;

procedure TfOperFinSmp.RefrEvent(id_Oper: integer);
begin

end;

procedure TfOperFinSmp.MakePopUpMenu(AStringField : TStringField);
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

procedure TfOperFinSmp.MiClick(Sender: TObject);
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



procedure TfOperFinSmp.btnX1Click(Sender: TObject);
begin
  MakePopUpMenu(cdsOperFinImp_PayBasic);
end;

procedure TfOperFinSmp.btnX2Click(Sender: TObject);
begin
  MakePopUpMenu(cdsOperFinAccInv_PayAssignment);
end;

procedure TfOperFinSmp.btnX3Click(Sender: TObject);
begin
  MakePopUpMenu(cdsOperFinContract);
end;

procedure TfOperFinSmp.FrameResize(Sender: TObject);
begin
  btnX1.Left := edImp_PayBasic.Left + edImp_PayBasic.Width + 2;
  btnX2.Left := btnX1.Left;
  btnX3.Left := btnX1.Left;
end;

end.
