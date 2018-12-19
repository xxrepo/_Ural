unit uAPOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, Buttons, frAPCond, Db, DBClient, frAPOper;

type
  TAPOper = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fAPOper1: TfAPOper;
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
    procedure Initialize(const AHandle : HWnd; id_ObjItem, id_AP_Obj, id_business : integer; OperVid, ACopy : Variant; AReadOnly: boolean);
  end;

var
  APOper: TAPOper;

procedure ShowAPOper(const AHandle : HWnd; id_ObjItem, id_AP_Obj, id_business : integer; OperVid, ACopy : Variant);

implementation

uses uDM;


procedure ShowAPOper(const AHandle : HWnd; id_ObjItem, id_AP_Obj, id_business : integer; OperVid, ACopy : Variant);
var F : TAPOper;
begin
  F := TAPOper.Create(nil);
  try
//    if AOwner is TWinControl then
//      SetWindowLong(F.Handle, GWL_HWNDPARENT, TWinControl(AOwner).Handle);
    F.Initialize(AHandle, id_ObjItem, id_AP_Obj, id_business, OperVid, ACopy, false);
    F.Show;
  except
    F.Free;
  end;
end;

{$R *.DFM}

procedure TAPOper.btnOkClick(Sender: TObject);
begin
  if not fAPOper1.ConfirmChanges then
    ModalResult := mrNone
  else                           
  begin
    ModalResult := mrOk;
    Close;
  end;
end;


procedure TAPOper.Initialize(const AHandle : HWnd; id_ObjItem, id_AP_Obj, id_business : integer; OperVid, ACopy : Variant; AReadOnly: boolean);
var DD : Variant;
begin
  FHandle := AHandle;
  fAPOper1.Initialize(id_ObjItem, id_AP_Obj, id_business, OperVid, ACopy, false);
end;

function TAPOper.SaveProp: boolean;
begin
  Result := fAPOper1.SaveProp;
end;

procedure TAPOper.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\2' + Name);
end;

procedure TAPOper.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\2' + Name);
end;

constructor TAPOper.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TAPOper.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TAPOper.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TAPOper.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TAPOper.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if ModalResult = mrOk then
    if SaveProp then
      SendMessage(FHandle, xxx_RefrMsg, fAPOper1.id_ObjItem, 0);
end;

end.
