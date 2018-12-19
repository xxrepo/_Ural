unit uReprPropLC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frReprProp, StdCtrls, ExtCtrls, frReprPropLC;

type
  TReprPropLC = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fReprPropLC1: TfReprPropLC;
    procedure btnOkClick(Sender: TObject);
  private

    { Private declarations }
  public
    function SaveProp: boolean;
    procedure Initialize(Aid_Repr : integer; Aid_Bsn : Variant; Aid_Group : Variant);
  end;

function EditReprPropLC(var id_Repr : Variant; id_Bsn : Variant; id_Group : Variant)  : boolean;

var
  ReprPropLC: TReprPropLC;

implementation

uses uMainForm;

{$R *.DFM}

function EditReprPropLC(var id_Repr : Variant; id_Bsn : Variant; id_Group : Variant)  : boolean;
var F : TReprPropLC;
    S : String;
begin
  Result := false;
  F := TReprPropLC.Create(MainForm);
  try
    F.Initialize(id_Repr, id_Bsn, id_Group);
    F.ActiveControl := F.fReprPropLC1.DBEdit1;
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      F.SaveProp;
      id_Repr := F.fReprPropLC1.id_Repr;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TReprPropLC.btnOkClick(Sender: TObject);
begin
  if not fReprPropLC1.ConfirmChanges then
    ModalResult := mrNone;
end;


procedure TReprPropLC.Initialize(Aid_Repr: integer; Aid_Bsn,
  Aid_Group: Variant);
begin
  fReprPropLC1.Initialize(Aid_Repr, Aid_Bsn, Aid_Group);
  if Aid_Repr = -1 then
    Caption := 'Новый представитель'
  else
    Caption := fReprPropLC1.RepName + ', код ' + IntToStr(Aid_Repr);
end;

function TReprPropLC.SaveProp: boolean;
begin
  Result := fReprPropLC1.SaveProp;
end;




end.
