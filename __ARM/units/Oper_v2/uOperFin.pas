unit uOperFin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frOperFin, foMyFunc, Buttons,
  uTopWin, dbclient, RXCtrls, ActnList, Menus;

type
  TOperFin = class(IOper)
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
    fOperFin1: TfOperFin;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure fOperFin1cbOperTypeInChange(Sender: TObject);
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
  OperFin: TOperFin;

implementation

uses uDM, uFormApi_Oper, uFormAPI_Doc, uAPOperList;
                                             

{$R *.DFM}

procedure TOperFin.btnOkClick(Sender: TObject);
begin
  if not fOperFin1.ConfirmChanges then
    ModalResult := mrNone
  else                           
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

function TOperFin.GetID_Oper: integer;
begin
  Result := fOperFin1.ID_Oper;
end;

procedure TOperFin.Initialize(const AHandle : HWnd; AOperParamz : TOperParamz);
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
        with fOperFin1 do
        begin
          fExtDataVal1.ToolBar.Visible := false;
          fExtDataVal1.aEdit.Visible := false;
          fExtDataVal1.Action1.Visible := false;
        end;
      end;
  end;
 // btnOk.Visible := not AReadOnly;
  if FOperParamz.ReadOnly then
    Caption := Caption + ', только чтение';
                       

  fOperFin1.Initialize(FOperParamz);
  if fOperFin1.cdsOperFin.FieldByName('HasViza').AsBoolean  then
    FOperParamz.ReadOnly := true;

  if fOperFin1.cdsOperFin.FieldByName('HasViza').AsBoolean then
  begin
    btnVisa.Visible := false;
  end;
{  if fOperFin1.cdsOperFin.FieldByName('OperState').AsInteger = -1 then
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

function TOperFin.SaveProp: boolean;
begin
  Result := fOperFin1.SaveProp;
end;

procedure TOperFin.FormCreate(Sender: TObject);
begin
  fOperFin1.PageControl1.ActivePageIndex := 0;
end;

procedure TOperFin.btnVisaClick(Sender: TObject);
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

function TOperFin.PrevViza(var AText, ACaption : String) : boolean;
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

  if fOperFin1.ConfirmChanges then
  begin

  end
  else
    Exit;
  if not MayVized(fOperFin1.cdsOperFin) then
  begin
    AText := 'Данные по операции введены не полностью.' + #13 + #10 + 'Визирование невозможно';
    Exit;
  end;


  with fOperFin1 do
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

procedure TOperFin.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\qz267' + ClassName);
end;

procedure TOperFin.btnDelClick(Sender: TObject);
begin
  ModalResult := mrIgnore;
  Close;
end;

procedure TOperFin.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Action := caFree;
  try
    FOperParamz.ID_Oper := ID_Oper;
    EditOper_xxx(FHandle, FOperParamz, Self);
  except

  end;
end;

procedure TOperFin.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\qz267' + ClassName);
end;

constructor TOperFin.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
 // SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);

end;

procedure TOperFin.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TOperFin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult in [mrCancel, mrNone] then
  begin
    if fOperFin1.ChangeData then
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

procedure TOperFin.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

function TOperFin.GetbtnVisaEnabled: boolean;
begin
  Result := btnVisa.Enabled and btnVisa.Visible;
end;

function TOperFin.GetSelf: TForm;
begin
  Result := Self;
end;

function TOperFin.GetOperCDS: TClientDataSet;
begin
  Result := fOperFin1.cdsOperFin;
end;

function TOperFin.CheckAmount(var Amount: Extended): boolean;
begin
  Result := fOperFin1.CheckAmount(Amount);
end;

procedure TOperFin.fOperFin1cbOperTypeInChange(Sender: TObject);
begin
  fOperFin1.cbOperTypeInChange(Sender);
//  sbDocForm.Enabled := fOperFin1.cbOperTypeIn.ItemIndex = 0;
end;

procedure TOperFin.sbDocFormClick(Sender: TObject);
var DP : TDocParamz;
begin
  fOperFin1.UpdateData;
  DP := GetEmptyDocParamz;
  DP.ID_Oper := id_Oper;
  DP.Is_Mirr := fOperFin1.cdsOperFinIs_Mirr.AsBoolean;
  ShowPayIn(Handle, DP, fOperFin1.cdsOperFin, nil);
end;

function TOperFin.GetbtnVisaEn: boolean;
begin
  Result := btnVisa.Enabled;

end;

procedure TOperFin.FormResize(Sender: TObject);
begin
  tag := 0;
end;

procedure TOperFin.advMarkExecute(Sender: TObject);
begin
  if fOperFin1.ConfirmChanges then
  begin
    ModalResult := mrNo;
    Close;
  end
end;

procedure TOperFin.advCopyExecute(Sender: TObject);
begin
  EditOper_ext(fOperFin1.cdsOperFin);
  Close;
end;

procedure TOperFin.advOffExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ID_Oper := fOperFin1.cdsOperFin.FieldByName('id_Oper').AsInteger;
  AOperParamz.Offset := true;
  AOperParamz.Copy := true;
  EditOperOffset(Handle, AOperParamz);
//  Close;
end;

procedure TOperFin.advBalanceExecute(Sender: TObject);
begin
  ShowBalance_v2_ext(fOperFin1.cdsOperFin);
end;

procedure TOperFin.advCardExecute(Sender: TObject);
begin
  ShowAccCard_v2_ext(fOperFin1.cdsOperFin);
end;

procedure TOperFin.pmAdvPopup(Sender: TObject);
begin
  if fOperFin1.cdsOperFin.FieldByName('OperState').AsInteger = -1 then
  begin
    advMark.ImageIndex := -1;
    advMark.Caption := 'Снять метку';
  end;
  advMark.Enabled := btnVisa.Visible and not FOperParamz.ReadOnly;

  advCopy.Enabled := fOperFin1.ID_Oper > 0;
  advOff.Enabled := fOperFin1.ID_Oper > 0;
  advBalance.Enabled := fOperFin1.cdsOperFinid_ContrAgent.AsInteger > 0;
  advCard.Enabled := fOperFin1.cdsOperFinid_Acc.AsInteger > 0;
  advUnViza.Enabled := not fOperFin1.cdsOperFinBlocked.AsBoolean and not fOperFin1.cdsOperFinCheckDate.IsNull
end;

procedure TOperFin.advUnVizaExecute(Sender: TObject);
var X  : integer;
begin
  if MessageBox(Handle, 'Снять визирование?', 'Подтвердите снятие визирования', MB_YESNO + MB_ICONWARNING) = idYes then
  begin

    if DM.rsCA.AppServer.OP_OperDelCheckDate_v2(fOperFin1.ID_Oper) = 1 then
    begin
      fOperFin1.FOperParamz.ReadOnly := false;
      Initialize(FHandle, fOperFin1.FOperParamz);
    end
    else
    begin
      MessageBox(Handle, 'Ошибка при снятии визирования', 'Произошла ошибка при снятии визирования', MB_YESNO + MB_ICONERROR);
    end;
  end;
end;

procedure TOperFin.advAPGenExecute(Sender: TObject);
begin
  if fOperFin1.ID_Oper = -1 then
    raise Exception.Create('Операция не сохранена. Генерация невозможна!')
  else
    ShowAPOperList(Handle, fOperFin1.id_Oper, 0)
end;

end.
