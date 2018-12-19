unit uOperWare_FFF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, frOperWare, Buttons, dbclient,
  uTopWin, frOperWare_FFF;

type
  TOperWare_FFF = class(IOPer)
    Panel2: TPanel;
    btnVisa: TSpeedButton;
    btnError: TSpeedButton;
    btnDel: TSpeedButton;
    btnCancel: TButton;
    btnOk: TButton;
    Label1: TLabel;
    fOperWare1: TfOperWare_FFF;
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
    FOperParamz : TOperParamz;
    FHandle : HWnd;
    function GetID_Oper: integer; override;
  public
    constructor Create(AOwner : TComponent); override;
    function SaveProp: boolean; override;
    procedure Initialize(const AHandle : HWnd; AOperParamz : TOperParamz); override;
    property ID_Oper : integer read GetID_Oper;

    function PrevViza(var AText, ACaption: String): boolean; override;
    function GetbtnVisaEnabled: boolean; override;
    function GetSelf : TForm;
    function GetOperCDS : TClientDataSet; override;
    function CheckAmount(var Amount : Extended) : boolean;  override;
  end;

var
  OperWare_FFF: TOperWare_FFF;

implementation

uses uDM, uFormApi_Oper;


{$R *.DFM}

procedure TOperWare_FFF.btnOkClick(Sender: TObject);
begin
  if not fOperWare1.ConfirmChanges then
    ModalResult := mrNone
  else
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

function TOperWare_FFF.GetID_Oper: integer;
begin
  Result := fOperWare1.ID_Oper;
end;

procedure TOperWare_FFF.Initialize(const AHandle : HWnd; AOperParamz : TOperParamz);
var DD : Variant;
begin
  FOperParamz := AOperParamz;
  FHandle := AHandle;
  DD := DM.DD_DayGetProp;
  Label1.Visible := (DD = Null);
  if Label1.Visible then
    Label1.Caption := 'День закрыт. Визирование невозможно!';
  //AReadOnly := (DD = Null);

  if (FOperParamz.ID_Oper = -1) or (FOperParamz.Correct) or (FOperParamz.Copy) then
  begin
    Caption := 'Создание складской операции';
  end
  else                
  begin
    Caption := 'Складская операция №' + IntToStr(FOperParamz.ID_Oper);
    if not DM.CheckUserRights(1, Null) then
      if DM.CheckUserRights(7, Null) then
      begin
        FOperParamz.ReadOnly := true;
        btnOk.Enabled := false;
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
  btnVisa.Visible := btnVisa.Visible and DM.CheckUserRights(22, Null);
  btnError.Visible := btnVisa.Visible;
end;

function TOperWare_FFF.SaveProp: boolean;
begin
  Result := fOperWare1.SaveProp;
end;

procedure TOperWare_FFF.FormCreate(Sender: TObject);
begin
  fOperWare1.PageControl1.ActivePageIndex := 0;
end;

procedure TOperWare_FFF.btnVisaClick(Sender: TObject);
var AText, ACaption : String;
begin
  if fOperWare1.ConfirmChanges then
  begin
    if PrevViza(AText, ACaption) then
    begin
      ModalResult := mrYes;
      Close;
    end
    else
      MessageBox(Handle, PChar(AText), PChar(ACaption), MB_OK + MB_ICONERROR);
  end;
end;

procedure TOperWare_FFF.btnErrorClick(Sender: TObject);
begin
  if fOperWare1.ConfirmChanges then
  begin
    ModalResult := mrNo;
    Close;
  end
end;

procedure TOperWare_FFF.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\qz26' + ClassName);
end;

procedure TOperWare_FFF.btnDelClick(Sender: TObject);
begin
  ModalResult := mrIgnore;
  Close;
end;

procedure TOperWare_FFF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FOperParamz.ID_Oper := ID_Oper;

  EditOper_xxx(FHandle, FOperParamz, Self)
end;

procedure TOperWare_FFF.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\qz26' + ClassName);
end;

procedure TOperWare_FFF.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TOperWare_FFF.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

function TOperWare_FFF.CheckAmount(var Amount: Extended): boolean;
begin

end;

function TOperWare_FFF.GetbtnVisaEnabled: boolean;
begin

end;

function TOperWare_FFF.GetOperCDS: TClientDataSet;
begin
   Result := fOperWare1.cdsOperFin;
end;

function TOperWare_FFF.GetSelf: TForm;
begin

end;

function TOperWare_FFF.PrevViza(var AText, ACaption: String): boolean;
var ObjType : TEObjType;
    Amount :  Extended;
begin
  ACaption := 'Визирование невозможно';
  Result := false;
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

  Result := true;
end;

constructor TOperWare_FFF.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

end.
