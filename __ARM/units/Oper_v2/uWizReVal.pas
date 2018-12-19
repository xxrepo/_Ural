unit uWizReVal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frOperFin, foMyFunc, Buttons,
  uTopWin, frWizReVal;

type
  TWizReVal = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fWizReVal1: TfWizReVal;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fWizReVal1ToolButton12Click(Sender: TObject);
  private
    FHandle : HWnd;
  public
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    function SaveProp: boolean;
    procedure Initialize(const AHandle : HWnd; id_WareHouse: Variant; AID : integer);
  end;

var
  WizReVal: TWizReVal;

procedure ShowWizReVal(const AHandle : HWnd; id_WareHouse: Variant; AID : integer; AOwner : TObject = nil);

implementation

uses uDM;


procedure ShowWizReVal(const AHandle : HWnd; id_WareHouse: Variant; AID : integer; AOwner : TObject);
var F : TWizReVal;
begin
  F := TWizReVal.Create(nil);
  try
//    if AOwner is TWinControl then
//      SetWindowLong(F.Handle, GWL_HWNDPARENT, TWinControl(AOwner).Handle);
    F.Initialize(AHandle, id_WareHouse, AID);
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

procedure TWizReVal.btnOkClick(Sender: TObject);
begin
  if not fWizReVal1.CheckData then
    ModalResult := mrNone
  else
  begin
    ModalResult := mrOk;
    Close;
  end;
end;


procedure TWizReVal.Initialize(const AHandle : HWnd; id_WareHouse: Variant; AID : integer);
var DD : Variant;
begin
  FHandle := AHandle;
  fWizReVal1.Initialize(id_WareHouse, AID);
end;

function TWizReVal.SaveProp: boolean;
begin
  Result := fWizReVal1.SaveProp2;
end;

procedure TWizReVal.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TWizReVal.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

constructor TWizReVal.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TWizReVal.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TWizReVal.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TWizReVal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
      end
  end;
end;

procedure TWizReVal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if ModalResult = mrOk then
    if SaveProp then
      SendMessage(FHandle, xxx_RefrMsg, fWizReVal1.ID_Oper, 0);
end;

procedure TWizReVal.fWizReVal1ToolButton12Click(Sender: TObject);
begin
  fWizReVal1.aDelWareExecute(Sender);

end;

end.
