unit uWizBackToCA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frOperFin, foMyFunc, Buttons,
  uTopWin, frWizBackToCA;

type
  TWizBackToCA = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fWizBackToCA1: TfWizBackToCA;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FHandle : HWnd;
  public
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    function SaveProp: boolean;
    procedure Initialize(const AHandle : HWnd;  ID_Oper: integer);
  end;

var
  WizBackToCA: TWizBackToCA;

procedure ShowWizBackToCA(const AHandle : HWnd; var ID_Oper: integer);

implementation

uses uDM;


procedure ShowWizBackToCA(const AHandle : HWnd; var ID_Oper: integer);
var F : TWizBackToCA;
begin
  F := TWizBackToCA.Create(nil);
  try
    F.Initialize(AHandle, ID_Oper);
    F.Show;
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

{$R *.DFM}

procedure TWizBackToCA.btnOkClick(Sender: TObject);
begin
  if not fWizBackToCA1.CheckData then
    ModalResult := mrNone
  else
  begin
    ModalResult := mrOk;
    Close;
  end;
end;


procedure TWizBackToCA.Initialize(const AHandle : HWnd;  ID_Oper: integer);
var DD : Variant;
begin
  FHandle := AHandle;
  fWizBackToCA1.Initialize(ID_Oper);
end;

function TWizBackToCA.SaveProp: boolean;
begin
  Result := fWizBackToCA1.SaveProp;
end;

procedure TWizBackToCA.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TWizBackToCA.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

constructor TWizBackToCA.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TWizBackToCA.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TWizBackToCA.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TWizBackToCA.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (ModalResult = mrCancel) or (ModalResult = mrNone) then
  begin
    case MessageBox(Handle, 'Сохранить данные?', 'Данные не были сохранены', MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONQUESTION) of
      id_Yes :
        begin
          CanClose := false;
          btnOk.Click;
        end;
      ID_CANCEL : CanClose := false;
      else
        CanClose := true;
      end;
  end;
end;

procedure TWizBackToCA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  if ModalResult = mrOk then
    if SaveProp then
      SendMessage(FHandle, xxx_RefrMsg, fWizBackToCA1.ID_Oper, 0);
end;

end.
