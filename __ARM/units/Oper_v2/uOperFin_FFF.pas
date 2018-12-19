unit uOperFin_FFF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, Buttons,
  uTopWin, frOperFin_FFF, dbclient;

type
  TOperFin_FFF = class(IOper)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    btnVisa: TSpeedButton;
    btnError: TSpeedButton;
    Label1: TLabel;
    btnDel: TSpeedButton;
    fOperFin_FFF1: TfOperFin_FFF;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVisaClick(Sender: TObject);
    procedure btnErrorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelClick(Sender: TObject);
  private
    FOperParamz : TOperParamz;
    FHandle : HWnd;
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
  end;

var
  OperFin_FFF: TOperFin_FFF;

implementation

uses uDM, uFormApi_Oper;


{$R *.DFM}

procedure TOperFin_FFF.btnOkClick(Sender: TObject);
begin
  if not fOperFin_FFF1.ConfirmChanges then
    ModalResult := mrNone
  else
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

function TOperFin_FFF.GetID_Oper: integer;
begin
  Result := fOperFin_FFF1.ID_Oper;
end;

procedure TOperFin_FFF.Initialize(const AHandle : HWnd; AOperParamz : TOperParamz);
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

  btnVisa.Enabled := not FOperParamz.ReadOnly and (DD <> Null);
  btnError.Enabled := not FOperParamz.ReadOnly;

  btnDel.Visible := (FOperParamz.ID_Oper <> -1) and FOperParamz.DelMode;
  btnVisa.Visible := not FOperParamz.DelMode and not FOperParamz.ReadOnly;
  btnError.Visible := not FOperParamz.DelMode and not FOperParamz.ReadOnly;
  btnOk.Visible := not FOperParamz.DelMode;//btnOk.Visible := not ADelMode and not AReadOnly;

  fOperFin_FFF1.Initialize(FOperParamz);
  if fOperFin_FFF1.cdsOperFin.FieldByName('HasViza').AsBoolean then
  begin
    btnVisa.Visible := false;
  end;
  if fOperFin_FFF1.cdsOperFin.FieldByName('OperState').AsInteger = -1 then
  begin
    btnError.Glyph := nil;
    btnError.Caption := 'Снять метку';
  end;
  btnVisa.Visible := btnVisa.Visible and DM.CheckUserRights(23, Null);
  btnError.Visible := btnVisa.Visible;
end;

function TOperFin_FFF.SaveProp: boolean;
begin
  Result := fOperFin_FFF1.SaveProp;
end;

procedure TOperFin_FFF.FormCreate(Sender: TObject);
begin
  fOperFin_FFF1.PageControl1.ActivePageIndex := 0;
end;

procedure TOperFin_FFF.btnVisaClick(Sender: TObject);
var AText, ACaption : String;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  if fOperFin_FFF1.ConfirmChanges then
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

procedure TOperFin_FFF.btnErrorClick(Sender: TObject);
begin
  if fOperFin_FFF1.ConfirmChanges then
  begin
    ModalResult := mrNo;
    Close;
  end
end;

procedure TOperFin_FFF.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\q' + ClassName);
end;

procedure TOperFin_FFF.btnDelClick(Sender: TObject);
begin
  ModalResult := mrIgnore;
  Close;
end;

procedure TOperFin_FFF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FOperParamz.ID_Oper := ID_Oper;
  EditOper_xxx(FHandle, FOperParamz, Self)
end;

procedure TOperFin_FFF.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\q' + ClassName);
end;

constructor TOperFin_FFF.Create(AOwner: TComponent);
begin
  inherited;
//  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TOperFin_FFF.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TOperFin_FFF.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult in [mrCancel, mrNone] then
  begin
    if fOperFin_FFF1.ChangeData then
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

procedure TOperFin_FFF.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

function TOperFin_FFF.CheckAmount(var Amount: Extended): boolean;
begin
  Result := true; 
  Amount := 0;
end;

function TOperFin_FFF.GetbtnVisaEnabled: boolean;
begin
  Result := btnVisa.Enabled;
end;

function TOperFin_FFF.GetOperCDS: TClientDataSet;
begin
  Result := fOperFin_FFF1.cdsOperFin;
end;

function TOperFin_FFF.GetSelf: TForm;
begin
  Result := Self;
end;

function TOperFin_FFF.PrevViza(var AText, ACaption: String): boolean;
begin
  Result := true;
  AText := '';
  ACaption := '';
end;

end.
