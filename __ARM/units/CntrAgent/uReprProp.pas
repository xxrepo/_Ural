unit uReprProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frReprProp, StdCtrls, ExtCtrls, Menus;

type
  TReprProp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fReprProp1: TfReprProp;
    procedure btnOkClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function Getid_CA: Variant;
    function Getid_Repr: integer;
    procedure Setid_CA(const Value: Variant);
    procedure Setid_Repr(const Value: integer);
    { Private declarations }
  public
    function SaveProp: boolean;
    property id_Repr : integer read Getid_Repr write Setid_Repr;
    property id_CA : Variant read Getid_CA write Setid_CA;
  end;

function EditReprProp(var id_Repr : Variant; var id_Ca : Variant; id_Bsn : Variant; EditCA : boolean = true)  : boolean;

var
  ReprProp: TReprProp;

implementation

uses uMainForm, uDM, foMyFunc;

{$R *.DFM}

function EditReprProp(var id_Repr : Variant; var id_Ca : Variant; id_Bsn : Variant; EditCA : boolean)  : boolean;
var F : TReprProp;
    S : String;
begin
  DM.Rights_GetUserRights(10, Null);//555
  Result := false;
  F := TReprProp.Create(MainForm);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    F.id_Repr := id_Repr;
    if id_Repr = -1 then
    begin
      F.id_Ca := id_Ca;
      if id_Ca = Null then
        F.fReprProp1.id_Bsn := id_Bsn;
    end;
    windows.SetFocus(F.fReprProp1.DBEdit1.Handle);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      F.SaveProp;
      id_Repr := F.id_Repr;
      id_Ca := F.id_Ca;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TReprProp.btnOkClick(Sender: TObject);
begin
  if not fReprProp1.ConfirmChanges then
    ModalResult := mrNone;
end;

function TReprProp.Getid_CA: Variant;
begin
  Result := fReprProp1.id_CA;
end;

function TReprProp.Getid_Repr: integer;
begin
  Result := fReprProp1.id_Repr;
end;

function TReprProp.SaveProp: boolean;
begin
  Result := fReprProp1.SaveProp;
end;

procedure TReprProp.Setid_CA(const Value: Variant);
begin
  fReprProp1.id_CA := Value;
end;

procedure TReprProp.Setid_Repr(const Value: integer);
begin
  fReprProp1.id_Repr := Value;
  if Value = -1 then
    Caption := 'Новый представитель'
  else
    Caption := fReprProp1.RepName + ', код ' + IntToStr(Value);
end;

procedure TReprProp.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);

end;

procedure TReprProp.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);

end;

end.
