unit uFormApi_Crn;

interface

uses classes, Windows, Messages, Sysutils, graphics,
  Forms, Controls, uMainForm,
  uCurSelectorForm,
  uDM;


function SelectCur(var AID : Variant; var AName : String; IsShort : boolean; id_Bsn : integer) : boolean;

implementation

function SelectCur(var AID : Variant; var AName : String; IsShort : boolean; id_Bsn : integer) : boolean;
var F : TCurSelectorForm;
begin
  Result := false;
  F := TCurSelectorForm.Create(MainForm);
  try
    F.Initialize(id_Bsn);
    F.ID_Curr := AID;
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AID := F.ID_Curr;
      if IsShort then
        AName := F.CurShortName
      else
        AName := F.CurName;

      Result := true;
    end;
  finally
    F.Free;
  end;
end;

end.
