unit uOperWareSMP;

interface

uses Variants,   
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, Buttons,
  uTopWin, dbclient, RXCtrls, Menus, uFormAPI_Doc, ShellAPI, frOperWareSMP,
  frOperWare;

type
  TOperWareSMP = class(IOper)
    Panel2: TPanel;
    btnVisa: TSpeedButton;
    btnError: TSpeedButton;
    btnDel: TSpeedButton;
    btnCancel: TButton;
    btnOk: TButton;
    Label1: TLabel;
    sbDocForm: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    miDAcc: TMenuItem;
    miAct: TMenuItem;
    miWa: TMenuItem;
    Yfrkfl1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    miWHOrd: TMenuItem;
    html1: TMenuItem;
    N4: TMenuItem;
    fOperWare1: TfOperWareSMP;
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
    procedure miActClick(Sender: TObject);
    procedure miWaClick(Sender: TObject);
    procedure miDAccClick(Sender: TObject);
    procedure Yfrkfl1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure miWHOrdClick(Sender: TObject);
    procedure html1Click(Sender: TObject);
  private
    Form_id_OperParent: Variant;
    FHandle : HWnd;
    FOperParamz : TOperParamz;
    function GetID_Oper: integer;override;
    function CheckViza : boolean;
    procedure ShowDoc(ADocProc: TDocProc);
  public
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    function SaveProp: boolean; override;
    procedure Initialize(const AHandle : HWnd; AOperParamz : TOperParamz);override;
    property ID_Oper : integer read GetID_Oper;

    function PrevViza(var AText, ACaption: String): boolean;override;
    function GetbtnVisaEnabled: boolean; override;
    function GetSelf : TForm;
    function GetOperCDS : TClientDataSet; override;
    function CheckAmount(var Amount : Extended) : boolean; override;
    function GetbtnVisaEn : boolean;
  end;

var
  OperWareSMP: TOperWareSMP;

implementation

uses   uDM, uFormApi_Oper;


{$R *.DFM}

procedure TOperWareSMP.btnOkClick(Sender: TObject);
begin
  if not fOperWare1.ConfirmChanges then
    ModalResult := mrNone
  else
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

function TOperWareSMP.GetID_Oper: integer;
begin
  Result := fOperWare1.ID_Oper;
end;

function TOperWareSMP.CheckViza : boolean;
var
    UID : integer;
begin
  Result := true;
  with fOperWare1.cdsOperFin do
  begin
   { if fOperWare1.RezMode then
    begin
      UID := 18 // Отгрузка
    end
    else  }
    begin
      if (not FieldByName('OperTypeIn').AsBoolean
         and not FieldByName('id_WareHouse').IsNull
         and not FieldByName('id_Manufact_Ext').IsNull)
         then
        UID := 18 // Отгрузка
      else
        UID := 17
    end;
  end;
  Result := btnVisa.Visible and DM.CheckUserRights(UID, fOperWare1.cdsOperFin.FieldByName('id_Business').AsInteger);
end;

procedure TOperWareSMP.Initialize(const AHandle : HWnd; AOperParamz : TOperParamz);
var DD : Variant;
    UID : integer;
begin
  FHandle := AHandle;
  FOperParamz := AOperParamz;
  DD := DM.DD_DayGetProp;
  Label1.Visible := (DD = Null);
  if Label1.Visible then
    Label1.Caption := 'День закрыт. Визирование невозможно!';
  //AReadOnly := (DD = Null);

  if (FOperParamz.ID_Oper = -1) or (FOperParamz.Correct) or (FOperParamz.Copy) {or ARezMode} then
  begin
    if FOperParamz.RezMode then
      Caption := 'Новое резервирование'
    else
      Caption := 'Создание складской операции';
  end
  else                
  begin
    if FOperParamz.RezMode then
      Caption := 'Резервирование №'
    else
      Caption := 'Складская операция №';
    Caption := Caption + IntToStr(FOperParamz.ID_Oper);
    if FOperParamz.RezMode then
    begin
      fOperWare1.ilImage.GetIcon(13, Icon);
    end;
    if not DM.CheckUserRights(1, Null) then
      if DM.CheckUserRights(7, Null) then
      begin
        FOperParamz.ReadOnly := true;
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
  if FOperParamz.ReadOnly then
    Caption := Caption + ', только чтение';
  btnVisa.Enabled := not FOperParamz.ReadOnly and (DD <> Null);
  btnError.Enabled := not FOperParamz.ReadOnly;

  btnDel.Visible := (FOperParamz.ID_Oper <> -1) and FOperParamz.DelMode;
  btnVisa.Visible := not FOperParamz.DelMode and not FOperParamz.ReadOnly;
  btnError.Visible := not FOperParamz.DelMode and not FOperParamz.ReadOnly;
  btnOk.Visible := not FOperParamz.DelMode;//btnOk.Visible := not ADelMode and not AReadOnly;

  fOperWare1.Initialize(FOperParamz);
  if fOperWare1.cdsOperFin.FieldByName('HasViza').AsBoolean then
  begin
    btnVisa.Visible := false;
  end;
  if fOperWare1.cdsOperFin.FieldByName('OperState').AsInteger = -1 then
  begin
    btnError.Glyph := nil;
    btnError.Caption := 'Снять метку';
  end;
  btnError.Visible := btnVisa.Visible;
  if fOperWare1.cdsOperFin.FieldByName('OperVid').AsInteger = 201 then
  begin
    btnVisa.Glyph := nil;
    btnVisa.Caption := 'Отгрузить';
    btnError.Visible := false;
  end;
  sbDocForm.Visible := not AOperParamz.DelMode and DM.CheckUserRights(26, Null);
end;

function TOperWareSMP.SaveProp: boolean;
begin
  Result := fOperWare1.SaveProp;
end;

procedure TOperWareSMP.FormCreate(Sender: TObject);
begin
  fOperWare1.PageControl1.ActivePageIndex := 0;
end;

procedure TOperWareSMP.btnVisaClick(Sender: TObject);
var AText, ACaption : String;
begin
  if PrevViza(AText, ACaption) then
  begin
    if fOperWare1.cdsOperFin.FieldByName('OperVid').AsInteger = 201 then
      ModalResult := mrRetry
    else
      ModalResult := mrYes;
    Close;
  end
  else
    if AText <> '' then
      MessageBox(Handle, PChar(AText), PChar(ACaption), MB_OK + MB_ICONERROR);
end;

function TOperWareSMP.PrevViza(var AText, ACaption : String) : boolean;
var ObjType : TEObjType;
    Amount, AmountOper :  Extended;
    AHWd : HWnd;
begin
  if Visible then
    AHWd := Handle
  else
    AHWd := FHandle;

  ACaption := 'Визирование невозможно';
  Result := false;
  if not CheckViza then
  begin
    AText := 'Нет прав на визирование операции';
    Exit;
  end;

  if (DM.DD_DayGetProp = Null)  then
  begin
    AText := 'День закрыт.' + #13 + #10 + 'Визирование невозможно';
    Exit;
  end;

  if (not fOperWare1.cdsOperFin.FieldByName('id_Repr').IsNull or not fOperWare1.cdsOperFin.FieldByName('id_Repr_Ex').IsNull) and
     (fOperWare1.cdsOperFin.FieldByName('ContrAgentName').IsNull) then
  begin
    with fOperWare1.edReprName do
    begin
      AText := 'У представителя не выбран контрагент';
      Windows.SetFocus(Handle);
      Exit;
      end;
  end;

  if fOperWare1.ConfirmChanges then
  begin

  end
  else
    Exit;
  if not MayVized(fOperWare1.cdsOperFin) then
  begin
    AText := 'Данные по операции введены не полностью.' + #13 + #10 + 'Визирование невозможно';
    Exit;
  end;
  with fOperWare1.fCurSelector1.cbCur do
    if (fOperWare1.fCurSelector1.ID_Curr = Null)  then
    begin
      AText := 'Не выбрана валюта расчета' + #13 + #10 + 'Визирование невозможно';
      Windows.SetFocus(Handle);
      Exit;
    end;

  if fOperWare1.cdsOperFin.FieldByName('OperVid').AsInteger <> 201 then
  begin
    with fOperWare1.dsOperWare.DataSet do
    begin
      DisableControls;
      try
        First;

        while not Eof do
        begin
          if not fOperWare1.CheckAmountOne(Amount, AmountOper) then
          begin
            AText := 'Нельзя списать больше, чем остаток на складе.' + #13 + #10 +
            'Остаток равен товара "' + fieldbyName('WareName').AsString + '" ' + FormatFloat('0.##', Amount) + ' ' +  fieldbyName('MeasureName').AsString
            + #13 + #10 + 'Вы хотите списать ' + FormatFloat('0.##', AmountOper) + ' ' +  fieldbyName('MeasureName').AsString;
            ACaption := '';
            fOperWare1.DBGridEh1.Col := 3;
            Windows.SetFocus(fOperWare1.DBGridEh1.Handle);
            SendMessage(FHandle, xxx_Cancel, GetID_Oper, 0);
            Exit;
          end;
          Next;
        end;
      finally
        EnableControls;
      end;
    end;
  end;

  Result := true;
  if fOperWare1.OLD_OperVid = 201 then
  begin
    ModalResult := mrOk;
  {  fOperWare1.cdsOperFin.Edit;
    fOperWare1.cdsOperFin.FieldByName('OperVid').AsInteger := 1;
    fOperWare1.cdsOperFin.Post;  }
  end;
end;

procedure TOperWareSMP.btnErrorClick(Sender: TObject);
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

procedure TOperWareSMP.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TOperWareSMP.btnDelClick(Sender: TObject);
begin
  ModalResult := mrIgnore;
  Close;
end;

procedure TOperWareSMP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FOperParamz.ID_Oper := fOperWare1.ID_Oper;
  EditOper_xxx(FHandle, FOperParamz, Self)
end;

procedure TOperWareSMP.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TOperWareSMP.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TOperWareSMP.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

constructor TOperWareSMP.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TOperWareSMP.CreateParams(var Params: TCreateParams);
begin
  inherited;
//  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

function TOperWareSMP.CheckAmount(var Amount: Extended): boolean;
begin
  Result := fOperWare1.CheckAmount;
end;

function TOperWareSMP.GetbtnVisaEnabled: boolean;
begin
  Result := btnVisa.Enabled and btnVisa.Visible;
end;

function TOperWareSMP.GetOperCDS: TClientDataSet;
begin
  Result := fOperWare1.cdsOperFin;
end;

function TOperWareSMP.GetSelf: TForm;
begin
  Result := Self;
end;

procedure TOperWareSMP.ShowDoc(ADocProc : TDocProc);
var DP : TDocParamz;
begin
  fOperWare1.UpdateData;
  DP := GetEmptyDocParamz;
  DP.ID_Oper := id_oper;
  ADocProc(Handle, DP, fOperWare1.cdsOperFin, TClientDataSet(fOperWare1.dsOperWare.DataSet))
end;

procedure TOperWareSMP.miActClick(Sender: TObject);
begin
  ShowDoc(ShowFinalAct);
end;

procedure TOperWareSMP.miWaClick(Sender: TObject);
begin
  ShowDoc(ShowWarrant);
end;

procedure TOperWareSMP.miDAccClick(Sender: TObject);
begin
  ShowDoc(ShowDAcc);
end;

procedure TOperWareSMP.Yfrkfl1Click(Sender: TObject);
begin
  ShowDoc(ShowInv);
end;

procedure TOperWareSMP.N1Click(Sender: TObject);
begin
  ShowDoc(ShowAF);   
end;

procedure TOperWareSMP.N2Click(Sender: TObject);
begin
  ShowDoc(ShowWBill)
end;

procedure TOperWareSMP.N3Click(Sender: TObject);
begin
  ShowDoc(ShowPayIn);
end;

procedure TOperWareSMP.miWHOrdClick(Sender: TObject);
begin
  ShowDoc(ShowWHOrd);
end;

function TOperWareSMP.GetbtnVisaEn: boolean;
begin
  Result := btnVisa.Enabled;

end;

procedure TOperWareSMP.html1Click(Sender: TObject);
begin
    ShowDoc(ShowDAccHTML);

end;

end.
