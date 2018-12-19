unit uNSIDetailFormsAPI;

interface
  uses Forms,Dialogs, Controls, DB, Classes, uMainForm, windows,
       uMeasureDetailForm,
       uBusinessDetailForm, uManufactDetailForm,
       uWareHouseDetailForm, uReplicatorDetailForm,
       uAccDetailsForm, uDM;

  function ShowAccsDetailForm(var AID:Variant; ReadOnly:boolean=false; AID_Business:integer=-1 ; AID_Group:integer=-1):boolean;
  function ShowMeasureDetailForm(var AID:Variant; ReadOnly:boolean=false; ID_Base:integer=-1 ; BaseName:string=''; AID_Business:integer=-1):boolean;
  function ShowBusinessDetailForm(var AID:Variant; ReadOnly:boolean=false ):boolean;
  function ShowManufactDetailForm(var AID:Variant; ReadOnly:boolean=false ; AID_Business:integer=-1; AID_Group:integer=-1):boolean;
  function ShowEquipDetailForm(var AID:Variant; ReadOnly:boolean=false ; AID_Business:integer=-1):boolean;
  function ShowWareHouseDetailForm(var AID:Variant; ReadOnly:boolean=false ; AID_Business:integer=-1; AID_Group:integer=-1):boolean;
  function ShowReplicatorDetailForm(var AID:Variant; ReadOnly:boolean=false ; AID_Business:integer=-1):boolean;
implementation

function ShowAccsDetailForm(var AID:Variant; ReadOnly:boolean ; AID_Business:integer; AID_Group:integer):boolean;
var
 AccDetailsForm:TAccDetailsForm;
begin
  DM.Rights_GetUserRights(10, Null);//555
 AccDetailsForm:=TAccDetailsForm.Create(Application);
 with AccDetailsForm do
  begin
  //  if Screen.ActiveForm <> nil then
  //    SetWindowLong(Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);

   if AID=-1 then
    Caption:='Добавление нового счета - бизнес "' + DM.GetBusinessName(AID_Business) + '"'
   else
    Caption:='Редактирование счета';
    ID_Business:=AID_Business;
    id_Group := AID_Group;
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


//function ShowMeasureDetailForm(var AID:Variant; ReadOnly:boolean=false ):boolean;
function ShowMeasureDetailForm(var AID:Variant; ReadOnly:boolean=false; ID_Base:integer=-1 ; BaseName:string=''; AID_Business:integer=-1):boolean;
var
 MeasureDetailForm:TMeasureDetailForm;
begin
  DM.Rights_GetUserRights(10, Null);//555
 MeasureDetailForm:=TMeasureDetailForm.Create(Application);
 with MeasureDetailForm do
  begin
   if AID=-1 then
    Caption:='Добавление новой единицы измерения'
   else
    Caption:='Редактирование единицы измерения';
    Id:=AID;
    id_Business := AID_Business;
     if ID_Base=-1 then
      id_BaseMeasure:=NULL
     else
      id_BaseMeasure:=ID_Base;
    BaseEdit.Text:=BaseName;
    Init;
    if ReadOnly then
    OkButton.Enabled:=False;
    ShowModal;
    if ModalResult=mrOk then
      Result:=True;
    AID := MeasureDetailForm.ID;
    Free;
  end;
 {}
end;

function ShowBusinessDetailForm(var AID:Variant; ReadOnly:boolean=false ):boolean;
var
 BusinessDetailForm:TBusinessDetailForm;
begin
  DM.Rights_GetUserRights(10, Null);//555
 BusinessDetailForm:=TBusinessDetailForm.Create(Application);
 with BusinessDetailForm do
  begin
   if AID=-1 then
    Caption:='Добавление нового бизнеса'
   else
    Caption:='Редактирование бизнеса';
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

function ShowManufactDetailForm(var AID:Variant; ReadOnly:boolean ; AID_Business:integer; AID_Group:integer):boolean;
var
 ManufactDetailForm:TManufactDetailForm;
begin
  DM.Rights_GetUserRights(10, Null);//555
 ManufactDetailForm:=TManufactDetailForm.Create(Application);
 with ManufactDetailForm do
  begin
 //   if Screen.ActiveForm <> nil then
  //    SetWindowLong(Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
   if AID=-1 then
    Caption:='Добавление нового цеха - бизнес "' + DM.GetBusinessName(AID_Business) + '"'
   else
    Caption:='Редактирование цеха';
    id_Business:=AID_Business;
    ID_Group:=AID_Group;
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
end;

function ShowEquipDetailForm(var AID:Variant; ReadOnly:boolean=false ; AID_Business:integer=-1):boolean;
//var EquipDetailForm:TEquipDetailForm;
begin
{ EquipDetailForm:=TEquipDetailForm.Create(Application);
 with EquipDetailForm do
  begin
   if AID=-1 then
    Caption:='Добавление нового оборудования - бизнес "' + DM.GetBusinessName(AID_Business) + '"'
   else
    Caption:='Редактирование оборудования';
    Id:=AID;
    id_Business:=AID_Business;
    Init;
    if ReadOnly then
    OkButton.Enabled:=False;
    ShowModal;
    if ModalResult=mrOk then
      Result:=True;
     AID:=Id;
    Free;
  end; }
end;

function ShowWareHouseDetailForm(var AID:Variant; ReadOnly:boolean; AID_Business:integer; AID_Group:integer):boolean;
var
 WareHouseDetailForm:TWareHouseDetailForm;
begin
  DM.Rights_GetUserRights(10, Null);//555
 WareHouseDetailForm:=TWareHouseDetailForm.Create(Application);
 with WareHouseDetailForm do
  begin
  //  if Screen.ActiveForm <> nil then
  //    SetWindowLong(Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
   if AID=-1 then
    Caption:='Добавление нового склада - бизнес "' + DM.GetBusinessName(AID_Business) + '"'
   else
    Caption:='Редактирование склада';
    id_Business:=AID_Business;
    ID_Group:=AID_Group;
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
end;

function ShowReplicatorDetailForm(var AID:Variant; ReadOnly:boolean=false ; AID_Business:integer=-1):boolean;
var
 ReplicatorDetailForm:TReplicatorDetailForm;
begin
 ReplicatorDetailForm:=TReplicatorDetailForm.Create(Application);
 with ReplicatorDetailForm do
  begin
   if AID=-1 then
    Caption:='Добавление нового репликатора'
   else
    Caption:='Редактирование репликатора';
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
end;

end.
