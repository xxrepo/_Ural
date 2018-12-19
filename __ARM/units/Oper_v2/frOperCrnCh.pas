unit frOperCrnCh;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ExtCtrls, StdCtrls, Mask, DBCtrls, foMyFunc, Buttons,
  frCurSelector, ToolEdit, RXDBCtrl, ComCtrls, ActnList, Grids, DBGrids,
  ToolWin, RxLookup, frOperOldData, CurrEdit, frExtDataVal, frBJByOper;

type
  TfOperCrnCh = class(TFrame)
    cdsOperFin: TClientDataSet;
    dsOperFin: TDataSource;
    PageControl1: TPageControl;
    tsData: TTabSheet;
    tsComment: TTabSheet;
    P1: TPanel;
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
    P2: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    fCurSelector1: TfCurSelector;
    Panel7: TPanel;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    P_FF: TPanel;
    Label5: TLabel;
    Label10: TLabel;
    lcFormalDistrib: TRxDBLookupCombo;
    lcFuncDistrib: TRxDBLookupCombo;
    Label3: TLabel;
    DBEdit8: TDBEdit;
    DBEdit2: TRxDBCalcEdit;
    fExtDataVal1: TfExtDataVal;
    GroupBox3: TGroupBox;
    DBMemo1: TDBMemo;
    fBJByOper1: TfBJByOper;
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
    procedure cdsOperCommentAfterPost(DataSet: TDataSet);
  private
    FOperParamz : TOperParamz;
    FNeedColor, FReadOnly : boolean;

    function GetKoefVal: integer;
    procedure SetKoefVal(const Value: integer);
    property KoefVal : integer read GetKoefVal write SetKoefVal;

    procedure MakeRed;
    procedure CheckNColor;

    function GetOperState: integer;
    procedure SetOperState(const Value: integer);

    procedure cbKoefDoChange;
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
  end;

implementation

uses uDM, uUnivOper_v2;

{$R *.DFM}

{ TfOperOffset }

function TfOperCrnCh.CheckData: boolean;
begin
  FNeedColor := true;
  MakeRed;
  Result := false;
  UpdateData;
  Result := true;
  MakeRed;
end;

function TfOperCrnCh.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
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
        CompareField(CDS, 'OpComment', 'Комментарии', SL, false);
      end;

      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfOperCrnCh.Create(AOwner: TComponent);
begin
  inherited;
  FNeedColor := false;
end;

destructor TfOperCrnCh.Destroy;
begin
  inherited;

end;

procedure TfOperCrnCh.Initialize(AOperParamz : TOperParamz);
var S :String;
begin
  P1.Enabled := false;
  P2.Enabled := false;
  P_FF.Enabled := false;
  FOperParamz := AOperParamz;

  FNeedColor := FOperParamz.ID_Oper <> -1;

  with cdsOperFin do
  begin
    Close;
    Params.ParamByName('@id_Oper').AsInteger := FOperParamz.ID_Oper;
    Params.ParamByName('@is_Mirr').Value := false;
    Open;
    fCurSelector1.Initialize(FieldByName('id_business').Value);
    fCurSelector1.ID_Curr := FieldByName('Id_CurrencyOper').Value;
    if not FieldByName('Id_Acc').IsNull then
    begin
       Label13.Caption := 'Счет';
       DBEdit3.DataField := cdsOperFin.FieldByName('SrcName').FieldName;
    end;
  {  cdsFormal.Close;
    cdsFormal.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
    cdsFormal.Open;
    cdsFunc.Close;
    cdsFunc.Params.ParamByName('@id_Bsn').Value := FieldByName('id_business').AsInteger;
    cdsFunc.Open;    }

    if FieldByName('OperTypeIn').AsBoolean then
      cbOperTypeIn.ItemIndex := 0
    else
      cbOperTypeIn.ItemIndex := 1;
    end;

  fExtDataVal1.Initialize(FOperParamz.ID_Oper, Null);
  fBJByOper1.Initialize(FOperParamz.ID_Oper, -1);
  PageControl1.ActivePageIndex := 0;

  if FOperParamz.ID_Oper <> -1 then
    MakeRed;
end;

function TfOperCrnCh.SaveProp: boolean;
begin
  if not ChangeData then
  begin
    Result := false;
    Exit;
  end;
  Result := SavePropOper(FOperParamz.ID_Oper, cdsOperFin, nil, fExtDataVal1, nil)  
end;

procedure TfOperCrnCh.UpdateData;
var CDS : TClientDataSet;
begin
  CDS := cdsOperFin;

  if CDS.State = dsEdit then
    CDS.Post;
end;

procedure TfOperCrnCh.cbVizaClick(Sender: TObject);
begin
  with cdsOperFin do
  begin
    Edit;
    FieldByName('CheckDate').Value := Null;
    FieldByName('id_UserChecker').Value := Null;
    Post;
  end;
end;

function TfOperCrnCh.ChangeData: boolean;
begin
  Result := (ID_Oper = -1) or (cdsOperFin.ChangeCount > 0)
  or (fExtDataVal1.cdsExtData.ChangeCount > 0)
end;

procedure TfOperCrnCh.DBEdit3KeyDown(Sender: TObject; var Key: Word;
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

procedure TfOperCrnCh.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) and (cdsOperFin.State = dsEdit) then
    cdsOperFin.Post;
end;

procedure TfOperCrnCh.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) and (cdsOperFin.State = dsEdit) then
    cdsOperFin.Post;
end;

function TfOperCrnCh.GetKoefVal: integer;
begin

end;

procedure TfOperCrnCh.SetKoefVal(const Value: integer);
begin

end;

procedure TfOperCrnCh.MakeRed;
begin

end;

function TfOperCrnCh.GetOperState: integer;
begin

end;

procedure TfOperCrnCh.SetOperState(const Value: integer);
begin

end;

procedure TfOperCrnCh.cdsOperFinCorrectGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := 'Да'
  else
    Text := 'Нет';
end;

procedure TfOperCrnCh.CheckNColor;
begin
  if not FNeedColor then
    Exit;
  with cbOperTypeIn do
  begin
    if  trim(Text) = '' then
    begin
      Color := clRed;
    end
    else
      Color := clWindow;
  end;


  with DBEdit2 do
  begin
    if (trim(Text) = '') or (Field.AsFloat = 0) then
    begin
      Color := clRed;
    end
    else
      Color := clWindow;
  end;
  with fCurSelector1.cbCur do
  begin
    if fCurSelector1.ID_Curr = Null then
    begin
      Color := clRed;
    end
    else
      Color := clWindow;
  end;

  with lcFormalDistrib do
  begin
    if (trim(Text) = '') and (Enabled) then
    begin
      Color := clRed;
    end
    else
      Color := clWindow;
  end;
  with lcFuncDistrib do
  begin
    if (trim(Text) = '') and (Enabled) then
    begin
      Color := clRed;
    end
    else
      Color := clWindow;
  end;
end;

procedure TfOperCrnCh.cbOperTypeInChange(Sender: TObject);
begin
  CheckNColor;
end;

procedure TfOperCrnCh.cdsOperFinAfterPost(DataSet: TDataSet);
begin
  CheckNColor;
end;

procedure TfOperCrnCh.lcbBsnChange(Sender: TObject);
begin
  CheckNColor;

end;

procedure TfOperCrnCh.cbKoefChange(Sender: TObject);
begin
  cbKoefDoChange;
end;

procedure TfOperCrnCh.cbKoefDoChange;
begin
  lcFormalDistrib.Enabled := true;
  lcFuncDistrib.Enabled := true;
//  lcFormalDistrib.Enabled := (cbKoef.ItemIndex > 0);
//  lcFuncDistrib.Enabled := (cbKoef.ItemIndex > 0);
  CheckNColor;
end;

procedure TfOperCrnCh.DBEdit2Click(Sender: TObject);
begin
 // TCustomEdit(sender).SelStart := 0;
 // TCustomEdit(sender).SelLength := Length(TCustomEdit(sender).Text);
end;

procedure TfOperCrnCh.cdsOperCommentAfterPost(DataSet: TDataSet);
begin
 { if (FID_Oper <> -1) and FReadOnly then
  begin
    if not CDSApplyUpdates(cdsOperComment, 'id_Oper', FID_Oper, true) then
      raise Exception.Create('Ошибка при сохранении комментариев');
  end;  }
end;

function TfOperCrnCh.GetID_Oper: integer;
begin
  Result := FOperParamz.ID_Oper;
end;

end.
