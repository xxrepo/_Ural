unit uOperCrnCh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, frOperOffset, Buttons,
  uTopWin, frOperCrnCh, dbclient;

type
  TOperCrnCh = class(IOper)
    Panel2: TPanel;
    btnCancel: TButton;
    fOperCrnCh1: TfOperCrnCh;
    btnOk: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
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
    function GetSelf : TForm; override;
    function GetOperCDS : TClientDataSet; override;
    function CheckAmount(var Amount : Extended) : boolean; override;
  end;

var
  OperCrnCh: TOperCrnCh;

implementation

uses uDM, uFormApi_Oper;


{$R *.DFM}

procedure TOperCrnCh.btnOkClick(Sender: TObject);
begin
  if not fOperCrnCh1.ConfirmChanges then
    ModalResult := mrNone
  else
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

function TOperCrnCh.GetID_Oper: integer;
begin
  Result := fOperCrnCh1.ID_Oper;
end;

procedure TOperCrnCh.Initialize(const AHandle : HWnd; AOperParamz : TOperParamz);
var DD : Variant;
begin
  FHandle := AHandle;
  FOperParamz := AOperParamz;
  fOperCrnCh1.Initialize(FOperParamz);
end;

function TOperCrnCh.SaveProp: boolean;
begin
  Result := fOperCrnCh1.SaveProp;
end;

procedure TOperCrnCh.FormCreate(Sender: TObject);
begin
  fOperCrnCh1.PageControl1.ActivePageIndex := 0;
end;

procedure TOperCrnCh.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TOperCrnCh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FOperParamz.ID_Oper := ID_Oper;
  EditOper_xxx(FHandle, FOperParamz, Self);
end;

procedure TOperCrnCh.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);

end;

procedure TOperCrnCh.btnCancelClick(Sender: TObject);
begin
  Close;
end;

constructor TOperCrnCh.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TOperCrnCh.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TOperCrnCh.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult in [mrCancel, mrNone] then
  begin
    if fOperCrnCh1.ChangeData then
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

function TOperCrnCh.CheckAmount(var Amount: Extended): boolean;
begin
  Result := true;
end;

function TOperCrnCh.GetbtnVisaEnabled: boolean;
begin
  Result := true;
end;

function TOperCrnCh.GetOperCDS: TClientDataSet;
begin
   Result := fOperCrnCh1.cdsOperFin;
end;

function TOperCrnCh.GetSelf: TForm;
begin
  Result := Self;
end;

function TOperCrnCh.PrevViza(var AText, ACaption: String): boolean;
begin
  Result := true;
end;

end.
