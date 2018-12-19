unit uOperFinSmp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frOperFin, foMyFunc, Buttons,
  uTopWin, dbclient, RXCtrls, ActnList, Menus, frOperFinSmp;

type
  TOperFinSmp = class(IOper)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    btnVisa: TSpeedButton;
    Label1: TLabel;
    btnDel: TSpeedButton;
    sbDocForm: TRxSpeedButton;
    alAdv: TActionList;
    advMark: TAction;
    advCopy: TAction;
    advOff: TAction;
    advBalance: TAction;
    advCard: TAction;
    pmAdv: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    btnAdvMenu: TRxSpeedButton;
    advUnViza: TAction;
    N6: TMenuItem;
    advAPGen: TAction;
    N7: TMenuItem;
    fOperFinSmp1: TfOperFinSmp;
    procedure btnOkClick(Sender: TObject);
    procedure btnVisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure sbDocFormClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure advMarkExecute(Sender: TObject);
    procedure advCopyExecute(Sender: TObject);
    procedure advOffExecute(Sender: TObject);
    procedure advBalanceExecute(Sender: TObject);
    procedure advCardExecute(Sender: TObject);
    procedure pmAdvPopup(Sender: TObject);
    procedure advUnVizaExecute(Sender: TObject);
    procedure advAPGenExecute(Sender: TObject);
  private
    Form_id_OperParent: Variant;
    FHandle : HWnd;
    FOperParamz : TOperParamz;
    function GetID_Oper: integer; override;
  public
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    function SaveProp: boolean; override;
    procedure Initialize(const AHandle : HWnd; AOperParamz : TOperParamz); override;
    property ID_Oper : integer read GetID_Oper;

    function PrevViza(var AText, ACaption: String): boolean; override;
    function GetbtnVisaEnabled: boolean; override;
    function GetSelf : TForm;
    function GetOperCDS : TClientDataSet; override;
    function CheckAmount(var Amount : Extended) : boolean; override;

    function GetbtnVisaEn : boolean;
  end;

var
  OperFinSmp: TOperFinSmp;
procedure EditOperFinSmp(const AHandle : HWnd; AOperParamz : TOperParamz);

implementation

uses uDM, uFormApi_Oper, uFormAPI_Doc, uAPOperList, uMainForm;
                                             

{$R *.DFM}

procedure EditOperFinSmp(const AHandle : HWnd; AOperParamz : TOperParamz);
var I : IOper;
begin
  if (AOperParamz.ID_Oper = -1) or (AOperParamz.Correct) or(AOperParamz.Copy) then
    DM.Rights_GetUserRights(2, Null);

  I := TOperFinSmp.Create(MainForm);
  try
//    ShowText('3');
    EditOper(AHandle, AOperParamz, I);
  //  ShowText('4');
  except
    on E : Exception do
    begin
      I.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TOperFinSmp.btnOkClick(Sender: TObject);
begin
  if not fOperFinSmp1.ConfirmChanges then
    ModalResult := mrNone
  else                           
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

function TOperFinSmp.GetID_Oper: integer;
begin
  Result := fOperFinSmp1.ID_Oper;
end;

procedure TOperFinSmp.Initialize(const AHandle : HWnd; AOperParamz : TOperParamz);
var DD : Variant;
begin
  FHandle := AHandle;
  FOperParamz := AOperParamz;
  DD := DM.DD_DayGetProp;
  Label1.Visible := (DD = Null);
  if Label1.Visible then
    Label1.Caption := 'День закрыт. Визирование невозможно!';
//  AReadOnly := (DD = Null);

  if (FOperParamz.ID_Oper = -1) or (FOperParamz.Correct) or (FOperParamz.Copy) then
  begin
    Caption := 'Создание финансовой операции';
  end
  else
  begin
    Caption := 'Финансовая операция №' + IntToStr(FOperParamz.ID_Oper);
    if not DM.CheckUserRights(2, Null) then
      if DM.CheckUserRights(7, Null) then
      begin
        FOperParamz.ReadOnly := true;
        btnOk.Enabled := false;
 
      end;
  end;
 // btnOk.Visible := not AReadOnly;
  if FOperParamz.ReadOnly then
    Caption := Caption + ', только чтение';
                       

  fOperFinSmp1.Initialize(FOperParamz);
  if fOperFinSmp1.cdsOperFin.FieldByName('HasViza').AsBoolean  then
    FOperParamz.ReadOnly := true;

  if fOperFinSmp1.cdsOperFin.FieldByName('HasViza').AsBoolean then
  begin
    btnVisa.Visible := false;
  end;
{  if fOperFinSmp1.cdsOperFin.FieldByName('OperState').AsInteger = -1 then
  begin
    btnError.Glyph := nil;
    btnError.Caption := 'Снять метку';
  end;  }
  
  btnVisa.Enabled := not FOperParamz.ReadOnly and (DD <> Null);
 // btnError.Enabled := not FOperParamz.ReadOnly;

  btnDel.Visible := (FOperParamz.ID_Oper <> -1) and FOperParamz.DelMode;
  btnVisa.Visible := not FOperParamz.DelMode and not FOperParamz.ReadOnly;
//  btnError.Visible := not FOperParamz.DelMode and not FOperParamz.ReadOnly;
  btnOk.Visible := not FOperParamz.DelMode;//btnOk.Visible := not ADelMode and not AReadOnly;

  btnVisa.Visible := btnVisa.Visible and DM.CheckUserRights(16, Null);
//  btnError.Visible := btnVisa.Visible;
  sbDocForm.Visible := not AOperParamz.DelMode and DM.CheckUserRights(26, Null);

  btnAdvMenu.Visible := DM.CheckUserRights(16, Null);
end;

function TOperFinSmp.SaveProp: boolean;
begin
  Result := fOperFinSmp1.SaveProp;
end;

procedure TOperFinSmp.btnVisaClick(Sender: TObject);
var AText, ACaption : String;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  if PrevViza(AText, ACaption) then
  begin
    ModalResult := mrYes;
    Close;
  end
  else
    if AText <> '' then
      MessageBox(Handle, PChar(AText), PChar(ACaption), MB_OK + MB_ICONERROR);
end;

function TOperFinSmp.PrevViza(var AText, ACaption : String) : boolean;
var ObjType : TEObjType;
    Amount :  Extended;
    S, S2 : String;
    AHWd : HWnd;
    ID : integer;
begin
  if Visible then
    AHWd := Handle
  else
    AHWd := FHandle;
  ACaption := 'Визирование невозможно';
  Result := false;
  if (DM.DD_DayGetProp = Null)  then
  begin
    AText := 'День закрыт.' + #13 + #10 + 'Визирование невозможно';
    Exit;
  end;

  if fOperFinSmp1.ConfirmChanges then
  begin

  end
  else
    Exit;
  if not MayVized(fOperFinSmp1.cdsOperFin) then
  begin
    AText := 'Данные по операции введены не полностью.' + #13 + #10 + 'Визирование невозможно';
    Exit;
  end;


  with fOperFinSmp1 do
  begin
// *** Проверяем кол-во ***
    if not CheckAmount(Amount) then
    begin
      if (cbOperTypeIn.ItemIndex = 1) then
        ID := cdsOperFin.FieldByName('id_Acc').Value
      else
        ID := cdsOperFin.FieldByName('id_Acc_Ext').Value;

      if cbOperTypeIn.ItemIndex = 1 then
        S := cdsOperFin.fieldByName('SrcName').AsString
      else
        S := cdsOperFin.fieldByName('ReprName').AsString;
      S2 := DM.rsCA.AppServer.UN_AccSumm(ID, Null);
//      if MessageBox(AHWd, PChar('Вы хотите списать со счета сумму, превышающую остаток.' + #13 + #10 +
  //    'Остаток на счете "' + S + '" равен  ' + FormatFloat('0.##', Amount) + ' ' + VarToStr(fCurSelector1.CurName) + #13 + #10 +
    //  'Хотите исправить сумму операции???'), '', MB_YESNO + MB_ICONERROR + MB_DEFBUTTON1) = idNo then
      if MessageBox(AHWd, PChar('Вы хотите списать со счета сумму, превышающую остаток.' + #13 + #10 +
      'Остаток на счете "' + S + '" равен  ' + #13 + #10 + S2 + #13 + #10 +
      'Хотите исправить сумму операции???'), '', MB_YESNO + MB_ICONERROR + MB_DEFBUTTON1) = idNo then
      begin

      end
      else
      begin
        Windows.SetFocus(DBEdit2.Handle);

        SendMessage(FHandle, xxx_Cancel, GetID_Oper, 0);
        Exit;
      end;
    end;
  end;
  Result := true;
end;

procedure TOperFinSmp.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\qz267' + ClassName);
end;

procedure TOperFinSmp.btnDelClick(Sender: TObject);
begin
  ModalResult := mrIgnore;
  Close;
end;

procedure TOperFinSmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  if not FOperParamz.Viza then
    Action := caFree;
  FOperParamz.ID_Oper := ID_Oper;
  EditOper_xxx(FHandle, FOperParamz, Self);
end;

procedure TOperFinSmp.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\qz267' + ClassName);
end;

constructor TOperFinSmp.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
 // SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);

end;

procedure TOperFinSmp.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TOperFinSmp.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult in [mrCancel, mrNone] then
  begin
    if fOperFinSmp1.ChangeData then
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

procedure TOperFinSmp.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

function TOperFinSmp.GetbtnVisaEnabled: boolean;
begin
  Result := btnVisa.Enabled and btnVisa.Visible;
end;

function TOperFinSmp.GetSelf: TForm;
begin
  Result := Self;
end;

function TOperFinSmp.GetOperCDS: TClientDataSet;
begin
  Result := fOperFinSmp1.cdsOperFin;
end;

function TOperFinSmp.CheckAmount(var Amount: Extended): boolean;
begin
  Result := fOperFinSmp1.CheckAmount(Amount);
end;

procedure TOperFinSmp.sbDocFormClick(Sender: TObject);
var DP : TDocParamz;
begin
  fOperFinSmp1.UpdateData;
  DP := GetEmptyDocParamz;
  DP.ID_Oper := id_Oper;
  DP.Is_Mirr := fOperFinSmp1.cdsOperFinIs_Mirr.AsBoolean;
  ShowPayIn(Handle, DP, fOperFinSmp1.cdsOperFin, nil);
end;

function TOperFinSmp.GetbtnVisaEn: boolean;
begin
  Result := btnVisa.Enabled;

end;

procedure TOperFinSmp.FormResize(Sender: TObject);
begin
  tag := 0;
end;

procedure TOperFinSmp.advMarkExecute(Sender: TObject);
begin
  if fOperFinSmp1.ConfirmChanges then
  begin
    ModalResult := mrNo;
    Close;
  end
end;

procedure TOperFinSmp.advCopyExecute(Sender: TObject);
begin
  EditOper_ext(fOperFinSmp1.cdsOperFin);
  Close;
end;

procedure TOperFinSmp.advOffExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ID_Oper := fOperFinSmp1.cdsOperFin.FieldByName('id_Oper').AsInteger;
  AOperParamz.Offset := true;
  AOperParamz.Copy := true;
  EditOperOffset(Handle, AOperParamz);
//  Close;
end;

procedure TOperFinSmp.advBalanceExecute(Sender: TObject);
begin
  ShowBalance_v2_ext(fOperFinSmp1.cdsOperFin);
end;

procedure TOperFinSmp.advCardExecute(Sender: TObject);
begin
  ShowAccCard_v2_ext(fOperFinSmp1.cdsOperFin);
end;

procedure TOperFinSmp.pmAdvPopup(Sender: TObject);
begin
  if fOperFinSmp1.cdsOperFin.FieldByName('OperState').AsInteger = -1 then
  begin
    advMark.ImageIndex := -1;
    advMark.Caption := 'Снять метку';
  end;
  advMark.Enabled := btnVisa.Visible and not FOperParamz.ReadOnly;

  advCopy.Enabled := fOperFinSmp1.ID_Oper > 0;
  advOff.Enabled := fOperFinSmp1.ID_Oper > 0;
  advBalance.Enabled := fOperFinSmp1.cdsOperFinid_ContrAgent.AsInteger > 0;
  advCard.Enabled := fOperFinSmp1.cdsOperFinid_Acc.AsInteger > 0;
  advUnViza.Enabled := not fOperFinSmp1.cdsOperFinBlocked.AsBoolean and not fOperFinSmp1.cdsOperFinCheckDate.IsNull
end;

procedure TOperFinSmp.advUnVizaExecute(Sender: TObject);
var X  : integer;
begin
  if MessageBox(Handle, 'Снять визирование?', 'Подтвердите снятие визирования', MB_YESNO + MB_ICONWARNING) = idYes then
  begin

    if DM.rsCA.AppServer.OP_OperDelCheckDate_v2(fOperFinSmp1.ID_Oper) = 1 then
    begin
      fOperFinSmp1.FOperParamz.ReadOnly := false;
      Initialize(FHandle, fOperFinSmp1.FOperParamz);
    end
    else
    begin
      MessageBox(Handle, 'Ошибка при снятии визирования', 'Произошла ошибка при снятии визирования', MB_YESNO + MB_ICONERROR);
    end;
  end;
end;

procedure TOperFinSmp.advAPGenExecute(Sender: TObject);
begin
  if fOperFinSmp1.ID_Oper = -1 then
    raise Exception.Create('Операция не сохранена. Генерация невозможна!')
  else
    ShowAPOperList(Handle, fOperFinSmp1.id_Oper, 0)
end;

end.
