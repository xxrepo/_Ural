unit uOperEmpty;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, frOperEmpty, Buttons, dbclient;

type
  TOperEmpty = class(IOper)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    btnVisa: TSpeedButton;
    btnError2: TSpeedButton;
    Label1: TLabel;
    btnDel: TSpeedButton;
    fOperEmpty1: TfOperEmpty;
    procedure FormCreate(Sender: TObject);
    procedure btnVisaClick(Sender: TObject);
    procedure btnError2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
  private
    FOperParamz : TOperParamz;
    function GetID_Oper: integer; override;
  public
    FHandle : HWnd;
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    function SaveProp: boolean; override;
    procedure Initialize(const AHandle : HWnd; AOperParamz : TOperParamz); override;
    property ID_Oper : integer read GetID_Oper;


    function PrevViza(var AText, ACaption: String): boolean; override;
    function GetbtnVisaEnabled: boolean; override;
    function GetSelf : TForm; override;
    function GetOperCDS : TClientDataSet; override;
    function CheckAmount(var Amount : Extended) : boolean; override;
  end;

var
  OperEmpty: TOperEmpty;

implementation

uses uDM, uFormApi_Oper;


{$R *.DFM}

function TOperEmpty.GetID_Oper: integer;
begin
  Result := fOperEmpty1.ID_Oper;
end;

procedure TOperEmpty.Initialize(const AHandle : HWnd; AOperParamz : TOperParamz);
var DD : Variant;
begin
  FHandle := AHandle;
  FOperParamz := AOperParamz;
  DD := DM.DD_DayGetProp;
  Label1.Visible := (DD = Null);
  if Label1.Visible then
    Label1.Caption := 'День закрыт. Визирование невозможно!';
  //AReadOnly := (DD = Null);

  if (FOperParamz.ID_Oper = -1) then
  begin
    Caption := 'Создание пустой операции';
  end
  else
  begin
    Caption := 'Пустая операция №' + IntToStr(FOperParamz.ID_Oper);
  end;

  //btnOk.Visible := not AReadOnly;
  if FOperParamz.ReadOnly then
    Caption := Caption + ', только чтение';
  btnVisa.Enabled := not FOperParamz.ReadOnly and (DD <> Null);
  btnDel.Visible := (FOperParamz.ID_Oper <> -1) and FOperParamz.DelMode;
  btnVisa.Visible := not FOperParamz.DelMode and not FOperParamz.ReadOnly;
  btnOk.Visible := not FOperParamz.DelMode;//btnOk.Visible := not ADelMode and not AReadOnly;

  fOperEmpty1.Initialize(FOperParamz);

  btnVisa.Visible := btnVisa.Visible and DM.CheckUserRights(5, Null);
//  btnError.Visible := btnVisa.Visible;
end;

function TOperEmpty.SaveProp: boolean;
begin
  Result := fOperEmpty1.SaveProp;
end;

procedure TOperEmpty.FormCreate(Sender: TObject);
begin
  fOperEmpty1.PageControl1.ActivePageIndex := 0;
end;

procedure TOperEmpty.btnVisaClick(Sender: TObject);
begin
  if (DM.DD_DayGetProp = Null)  then
  begin
    MessageBox(Handle, PChar('День закрыт.' + #13 + #10 + 'Визирование невозможно'), 'Визирование невозможно', MB_OK + MB_ICONERROR);
    ModalResult := mrNone;
    Exit;
  end;

  ModalResult := mrYes;
  Close;
end;

procedure TOperEmpty.btnError2Click(Sender: TObject);
begin
  if fOperEmpty1.ConfirmChanges then
  begin
    ModalResult := mrNo;
    Close;
  end
end;

constructor TOperEmpty.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TOperEmpty.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TOperEmpty.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult in [mrCancel, mrNone] then
  begin
    if fOperEmpty1.ChangeData then
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

procedure TOperEmpty.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FOperParamz.ID_Oper := fOperEmpty1.ID_Oper;
  EditOper_xxx(FHandle, FOperParamz, Self)
end;

procedure TOperEmpty.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TOperEmpty.btnOkClick(Sender: TObject);
begin
  if not fOperEmpty1.ConfirmChanges then
    ModalResult := mrNone
  else
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

procedure TOperEmpty.btnDelClick(Sender: TObject);
begin
  ModalResult := mrIgnore;
  Close;
end;

function TOperEmpty.CheckAmount(var Amount: Extended): boolean;
begin
  Result := true;
end;

function TOperEmpty.GetbtnVisaEnabled: boolean;
begin
  Result := btnVisa.Enabled;
end;

function TOperEmpty.GetOperCDS: TClientDataSet;
begin
  Result := fOperEmpty1.cdsEmptyProp;
end;

function TOperEmpty.GetSelf: TForm;
begin
  Result := Self;
end;

function TOperEmpty.PrevViza(var AText, ACaption: String): boolean;
begin
  Result := true;
end;

end.
