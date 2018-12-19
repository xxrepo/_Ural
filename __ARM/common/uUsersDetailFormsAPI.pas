unit uUsersDetailFormsAPI;

interface
  uses Forms,Dialogs, Controls, DB, Classes, uMainForm,
       uUserDetailsForm, uGroupDetailForm, uBus_Func_Form ;

  function ShowUserDetailForm(var AID:Variant; ReadOnly:boolean=false ):boolean;
  function ShowGroupDetailForm(var AID:Variant; ReadOnly:boolean=false ):boolean;

  function ShowBusFuncForm(id_Group, id_Business : integer):boolean;
implementation


function ShowUserDetailForm(var AID:Variant; ReadOnly:boolean=false ):boolean;
var
 UserDetailsForm:TUserDetailsForm;
begin
 UserDetailsForm:=TUserDetailsForm.Create(Application);
 with UserDetailsForm do
  begin
   if AID=-1 then
    Caption:='Добавление нового пользователя системы'
   else
    Caption:='Редактирование пользователя системы';
    Id:=AID;
    Init;
    if ReadOnly then
    OkButton.Enabled:=False;
    ShowModal;
    if ModalResult=mrOk then
      Result:=True;
      AID:=Id;
    Free;
  end;
 {}
end;

function ShowGroupDetailForm(var AID:Variant; ReadOnly:boolean=false ):boolean;
var
 GroupDetailForm:TGroupDetailForm;
begin
 GroupDetailForm:=TGroupDetailForm.Create(Application);
 with GroupDetailForm do
  begin
   if AID=-1 then
    Caption:='Добавление новой группы'
   else
    Caption:='Редактирование группы';
    Init(AID);
    if ReadOnly then
    OkButton.Enabled:=False;
    ShowModal;
    if ModalResult=mrOk then
      Result:=True;
      AID:=Id;
    Free;
  end;
 {}
end;

function ShowBusFuncForm(id_Group, id_Business : integer):boolean;
var
 Bus_Func_Form:TBus_Func_Form;
begin
  Bus_Func_Form:=TBus_Func_Form.Create(Application);
  with Bus_Func_Form do
  begin
    Init(id_Group, id_Business);

    ShowModal;
    if ModalResult = mrOk then
    begin
      Result:=SaveData;
    end;
    Free;
  end;
end;

end.
