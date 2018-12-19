unit uAdminFormsAPI;

interface
  uses Forms,Dialogs, Controls, DB, Classes, uMainForm,
       uUsersForm, uGroupsForm, uCurrenciesForm;

  function GetUsersForm(var AID:Variant; var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false):boolean;
  function GetGroupsForm(var AID:Variant; var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false):boolean;
  function GetCurrenciesForm(var AID:Variant; var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false):boolean;
implementation


function GetUsersForm(var AID:Variant; var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false):boolean;
var
  UsersForm: TUsersForm;
  i:integer;
  IsExists:boolean;
begin
  IsExists:=False;
  for i:=0 to MainForm.MDIChildCount-1 do
     if TForm(MainForm.MDIChildren[i]) is TUsersForm then
     begin
       MainForm.MDIChildren[i].Show;
       IsExists:=True;
     end;
     if IsExists then Exit;
     // ¬опрос по авторизации дл€ работы с даной формой

     UsersForm:=TUsersForm.Create(Application);
     With UsersForm do
      begin
       Init(ReadOnly, ShowToolBar);
       if VarToStr(AID)<>'' then
       if AID<>NULL then
         UsersFrame.cdsUsers.Locate('id_User',AID,[loCaseInsensitive]);
       Show;
      end;
end;

function GetGroupsForm(var AID:Variant;var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false):boolean;
var
  GroupsForm: TGroupsForm;
  i:integer;
  IsExists:boolean;
begin
  IsExists:=False;
  for i:=0 to MainForm.MDIChildCount-1 do
     if TForm(MainForm.MDIChildren[i]) is TGroupsForm then
     begin
       MainForm.MDIChildren[i].Show;
       IsExists:=True;
     end;
     if IsExists then Exit;
     // ¬опрос по авторизации дл€ работы с даной формой

     GroupsForm:=TGroupsForm.Create(Application);
     With GroupsForm do
      begin
       Init(ReadOnly, ShowToolBar);
       Show;
      end;
end;

function GetCurrenciesForm(var AID:Variant; var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false):boolean;
var
  CurrenciesForm: TCurrenciesForm;
  i:integer;
  IsExists:boolean;
begin
  IsExists:=False;
  for i:=0 to MainForm.MDIChildCount-1 do
     if TForm(MainForm.MDIChildren[i]) is TCurrenciesForm then
     begin
       MainForm.MDIChildren[i].Show;
       IsExists:=True;
     end;
     if IsExists then Exit;
     // ¬опрос по авторизации дл€ работы с даной формой

     CurrenciesForm:=TCurrenciesForm.Create(Application);
     With CurrenciesForm do
      begin
       Init(ReadOnly, ShowToolBar);
       Show;
      end;
end;

end.
