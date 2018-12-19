unit uOperWareRez;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, frOperWare, Buttons,
  uTopWin;

type
  TOperWare = class(TForm)
    Panel2: TPanel;
    btnVisa: TSpeedButton;
    btnError: TSpeedButton;
    btnDel: TSpeedButton;
    btnCancel: TButton;
    btnOk: TButton;
    Label1: TLabel;
    fOperWare1: TfOperWare;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVisaClick(Sender: TObject);
    procedure btnErrorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    Form_id_OperParent: Variant;
    Form_Correct, Form_Copy : boolean;
    FHandle : HWnd;
    FIs_Mirr : boolean;
    function GetID_Oper: integer;
    function CheckViza : boolean;
  public
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    function SaveProp: boolean;
    procedure Initialize(const AHandle : HWnd; AIs_Mirr : boolean; AID_Oper : integer; AReadOnly : boolean; id_OperParent : Variant; ACorrect, ACopy : boolean;
                        ADelMode : boolean);
    property ID_Oper : integer read GetID_Oper;
  end;

var
  OperWare: TOperWare;

implementation

uses uDM, uFormApi_Oper;


{$R *.DFM}

procedure TOperWare.btnOkClick(Sender: TObject);
begin
  if not fOperWare1.ConfirmChanges then
    ModalResult := mrNone
  else
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

function TOperWare.GetID_Oper: integer;
begin
  Result := fOperWare1.ID_Oper;
end;

function TOperWare.CheckViza : boolean;
var
    UID : integer;
begin
  Result := true;
  with fOperWare1.cdsOperFin do
  begin
    if (not FieldByName('OperTypeIn').AsBoolean
       and not FieldByName('id_WareHouse').IsNull
       and not FieldByName('id_Manufact_Ext').IsNull)
       then
      UID := 18 // Отгрузка
    else
      UID := 17
  end;
  Result := btnVisa.Visible and DM.CheckUserRights(UID, fOperWare1.cdsOperFin.FieldByName('id_Business').AsInteger);
end;

procedure TOperWare.Initialize(const AHandle : HWnd; AIs_Mirr : boolean; AID_Oper: integer; AReadOnly: boolean; id_OperParent : Variant; ACorrect, ACopy : boolean; ADelMode : boolean);
var DD : Variant;
    UID : integer;
begin
  FHandle := AHandle;
  FIs_Mirr := AIs_Mirr;
  DD := DM.DD_DayGetProp;
  Label1.Visible := (DD = Null);
  if Label1.Visible then
    Label1.Caption := 'День закрыт. Визирование невозможно!';
  //AReadOnly := (DD = Null);

  Form_id_OperParent := id_OperParent; Form_Correct := ACorrect; Form_Copy := ACopy;
  if (AID_Oper = -1) or (ACorrect) or (ACopy) then
  begin
    Caption := 'Создание складской операции';
  end
  else                
  begin
    Caption := 'Складская операция №' + IntToStr(AID_Oper);
    if not DM.CheckUserRights(1, Null) then
      if DM.CheckUserRights(7, Null) then
      begin
        AReadOnly := true;
        btnOk.Enabled := false;
        with fOperWare1 do
        begin
          fExtDataVal1.ToolBar.Visible := false;
          fExtDataVal1.aEdit.Visible := false;
          fExtDataVal1.Action1.Visible := false;
        end;
      end;
  end;
  //btnOk.Visible := not AReadOnly;
  if AReadOnly then
    Caption := Caption + ', только чтение';
  btnVisa.Enabled := not AReadOnly and (DD <> Null);
  btnError.Enabled := not AReadOnly;

  btnDel.Visible := (AID_Oper <> -1) and ADelMode;
  btnVisa.Visible := not ADelMode and not AReadOnly;
  btnError.Visible := not ADelMode and not AReadOnly;
  btnOk.Visible := not ADelMode;//btnOk.Visible := not ADelMode and not AReadOnly;

  fOperWare1.Initialize(AIs_Mirr, AID_Oper, AReadOnly, id_OperParent, ACorrect, ACopy);
  if fOperWare1.cdsOperFinHasViza.AsBoolean then
  begin
    btnVisa.Visible := false;
  end;
  if fOperWare1.cdsOperFinOperState.AsInteger = -1 then
  begin
    btnError.Glyph := nil;
    btnError.Caption := 'Снять метку';
  end;
  btnError.Visible := btnVisa.Visible;
end;

function TOperWare.SaveProp: boolean;
begin
  Result := fOperWare1.SaveProp;
end;

procedure TOperWare.FormCreate(Sender: TObject);
begin
  fOperWare1.PageControl1.ActivePageIndex := 0;
end;

procedure TOperWare.btnVisaClick(Sender: TObject);
var ObjType : TEObjType;
    Amount :  Extended;
begin
  if not CheckViza then
  begin
    MessageBox(Handle, PChar('Нет прав на визирование операции'), 'Визирование невозможно', MB_OK + MB_ICONERROR);
    ModalResult := mrNone;
    Exit;
  end;

  if (DM.DD_DayGetProp = Null)  then
  begin
    MessageBox(Handle, PChar('День закрыт.' + #13 + #10 + 'Визирование невозможно'), 'Визирование невозможно', MB_OK + MB_ICONERROR);
    ModalResult := mrNone;
    Exit;
  end;

  if (not fOperWare1.cdsOperFinid_Repr.IsNull or not fOperWare1.cdsOperFinid_Repr_Ex.IsNull) and
     (fOperWare1.cdsOperFinContrAgentName.IsNull) then
  begin
    with fOperWare1.edReprName do
    begin
      MessageBox(Handle, 'У представителя не выбран контрагент', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
      end;
  end;

  if fOperWare1.ConfirmChanges then
  begin
    ModalResult := mrYes;
  end
  else
    Exit;
  if not MayVized(fOperWare1.cdsOperFin) then
  begin
    MessageBox(Handle, PChar('Данные по операции введены не полностью.' + #13 + #10 + 'Визирование невозможно'), 'Визирование невозможно', MB_OK + MB_ICONERROR);
    ModalResult := mrNone;
    Exit;
  end;

//  if fOperWare1.ConfirmChanges then
//    ModalResult := mrYes;
  with fOperWare1.cdsOperWare do
  begin
    DisableControls;
    try
      First;

      while not Eof do
      begin
        if not fOperWare1.CheckAmountOne(Amount) then
        begin
          MessageBox(Handle, PChar('Нельзя списать больше, чем остаток на складе.' + #13 + #10 +
          'Остаток равен товара "' + fOperWare1.cdsOperWareWareName.AsString + '" ' + FormatFloat('0.##', Amount) + ' ' + fOperWare1.cdsOperWareMeasureName.AsString
          + #13 + #10 + 'Вы хотите списать ' + FormatFloat('0.##', fOperWare1.cdsOperWareAmountOper.AsFloat) + ' ' + fOperWare1.cdsOperWareMeasureName.AsString),'', MB_OK + MB_ICONERROR);
          fOperWare1.DBGridEh1.Col := 2;
          Windows.SetFocus(fOperWare1.DBGridEh1.Handle);
          ModalResult := mrNone;
          Exit;
        end;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;

  if ModalResult = mrYes then Close;
end;

procedure TOperWare.btnErrorClick(Sender: TObject);
begin
  CheckViza;
  if not btnVisa.Enabled then
  begin
    MessageBox(Handle, PChar('Нет прав'), '!!!', MB_OK + MB_ICONERROR);
    ModalResult := mrNone;
    Exit;
  end;

  if fOperWare1.ConfirmChanges then
  begin
    ModalResult := mrNo;
    Close;
  end
end;

procedure TOperWare.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
 // if (Form_id_OperParent <> Null) and (not Form_Correct) and (not Form_Copy) then
 //   ShowEmptyOperProp(Form_id_OperParent, Self);
end;

procedure TOperWare.btnDelClick(Sender: TObject);
begin
  ModalResult := mrIgnore;
  Close;
end;

procedure TOperWare.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  EditOperWare_xxx(FHandle, FIs_Mirr, ID_Oper, Self)
end;

procedure TOperWare.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TOperWare.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TOperWare.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult in [mrCancel, mrNone] then
  begin
    if fOperWare1.ChangeData then
      case MessageBox(Handle, 'Сохранить операцию?', 'Данные не были сохранены', MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONQUESTION) of
        id_Yes :
        begin
          CanClose := false;
          btnOk.Click;
        end;
        ID_CANCEL : CanClose := false;
      end;
  end;
end;

constructor TOperWare.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);

end;

procedure TOperWare.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

end.
