unit uAPCond;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, Buttons, frAPCond, Db, DBClient, Menus;

type
  TAPCond = class(TForm)
    fAPCond1: TfAPCond;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
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
    procedure Initialize(const AHandle : HWnd; id_AP_Obj, id_business : integer; OperVid, ACopy : Variant);
  end;

var
  APCond: TAPCond;

procedure ShowAPCond(const AHandle : HWnd; id_AP_Obj, id_business : integer; OperVid, ACopy : Variant);

implementation

uses uDM;


procedure ShowAPCond(const AHandle : HWnd; id_AP_Obj, id_business : integer; OperVid, ACopy : Variant);
var F : TAPCond;
begin
  F := TAPCond.Create(nil);
  try
//    if AOwner is TWinControl then
//      SetWindowLong(F.Handle, GWL_HWNDPARENT, TWinControl(AOwner).Handle);
    F.Initialize(AHandle, id_AP_Obj, id_business, OperVid, ACopy);
    F.Show;
  except
    F.Free;
  end;
end;

{$R *.DFM}

procedure TAPCond.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
  Close;
end;


procedure TAPCond.Initialize(const AHandle : HWnd; id_AP_Obj, id_business : integer; OperVid, ACopy : Variant);
var DD : Variant;
begin
  FHandle := AHandle;
  fAPCond1.Initialize(id_AP_Obj, id_business, OperVid, ACopy, false);
end;

function TAPCond.SaveProp: boolean;
begin
  Result := fAPCond1.SaveProp;
end;

procedure TAPCond.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\2' + ClassName);
end;

procedure TAPCond.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\2' + ClassName);
end;

constructor TAPCond.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TAPCond.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TAPCond.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TAPCond.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TAPCond.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if ModalResult = mrOk then
    if SaveProp then
      SendMessage(FHandle, xxx_RefrMsg, fAPCond1.id_AP_Obj, 0);
end;

end.
