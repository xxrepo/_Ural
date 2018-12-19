unit uFormsAPI_Users;

interface
  uses Forms,Dialogs, Controls, DB, Classes, uMainForm,
       uUsersForm, uGroupsForm, uFuncsForm, uDM, Windows;

  function GetUsersForm(var AID:Variant; var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false; IsModal:boolean=false; const AHandle : HWnd = 0):boolean;
  function GetGroupsForm(var AID:Variant; var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false; IsModal:boolean=false):boolean;
function GetFuncsForm(var AID:integer; var AName:string; id_Group,id_Bsn, id_Func : integer):boolean;

implementation

procedure SetFormStyle(F : TForm; IsModal : boolean);
begin
  if  IsModal then
  begin
    with F do
     begin
      FormStyle:=fsNormal;
      WindowState:=wsNormal;
     end;
    end
     else
    begin
    with F do
     begin
      FormStyle:=fsMDIChild;
      WindowState:=wsMaximized;
     end;
  end;
end;


function GetUsersForm(var AID:Variant; var AName:string; ReadOnly:boolean; ShowToolBar:boolean; IsModal:boolean; const AHandle : HWnd):boolean;
begin
   DM.Rights_GetUserRights(13, Null);
   Result:=False;
   if Assigned(UsersForm) then
     begin
      UsersForm.WindowState:=wsMaximized;
      UsersForm.BringToFront;
     end
     else
     begin
       // ¬опрос по авторизации дл€ работы с даной формой
       UsersForm:=TUsersForm.Create(MainForm);
       With UsersForm do
       begin
        //  if AHandle > 0 then
       //     SetWindowLong(Handle, GWL_HWNDPARENT, AHandle);
          UsersFrame.ReadOnly:=True;
          Position:=poScreenCenter;
          SetFormStyle(UsersForm, IsModal);
          Init(ReadOnly, ShowToolBar);
          if VarToStr(AID)<>'' then
           if AID<>NULL then
            UsersFrame.cdsUsers.Locate('id_User',AID,[loCaseInsensitive]);
          if IsModal then
           begin
             ShowModal;
             if ModalResult=mrOk then
              begin
               AID:=UsersFrame.cdsUsers.FieldByName('id_User').AsInteger;
               AName:=UsersFrame.cdsUsers.FieldByName('LastName').AsString;
               if UsersFrame.cdsUsers.FieldByName('FirstName').AsString <> '' then
                 AName := AName + ' ' + UsersFrame.cdsUsers.FieldByName('FirstName').AsString;
               if UsersFrame.cdsUsers.FieldByName('MiddleName').AsString <> '' then
                 AName := AName + ' ' + UsersFrame.cdsUsers.FieldByName('MiddleName').AsString;
               Result:=True;
              end;
             Free;
           end;
        end;
    end;
end;


function GetGroupsForm(var AID:Variant;var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false; IsModal:boolean=false):boolean;
begin
  DM.Rights_GetUserRights(13, Null);
   Result:=False;
   if Assigned(GroupsForm) then
     begin
      GroupsForm.WindowState:=wsMaximized;
      GroupsForm.BringToFront;
     end
     else
     begin
     // ¬опрос по авторизации дл€ работы с даной формой
       GroupsForm:=TGroupsForm.Create(MainForm);
       With GroupsForm do
        begin
         GroupsFrame.ReadOnly:=True;
         Position:=poScreenCenter;
         SetFormStyle(GroupsForm, IsModal);
         Init(ReadOnly, ShowToolBar);
          if VarToStr(AID)<>'' then
           if AID<>NULL then
            GroupsFrame.cdsGroups.Locate('id_Group',AID,[loCaseInsensitive]);
          if IsModal then
           begin
             ShowModal;
             if ModalResult=mrOk then
              begin
               AID:=GroupsFrame.cdsGroups.FieldByName('id_Group').AsInteger;
               AName:=GroupsFrame.cdsGroups.FieldByName('Name').AsString;
               Result:=True;
              end;
            Free;
           end;
        end;
     end;
end;

function GetFuncsForm(var AID:integer; var AName:string; id_Group,id_Bsn, id_Func: integer):boolean;
begin
  Result:=False;
  FuncsForm:=TFuncsForm.Create(MainForm);
  with FuncsForm do
  begin
    try
      Init(id_Group, id_Bsn, id_Func);
      if AID <> -1 then
        FuncsFrame1.cdsFuncs.Locate('id_Func', AID, [loCaseInsensitive]);
      ShowModal;
      if ModalResult=mrOk then
      begin
        AID:=FuncsFrame1.cdsFuncs.FieldByName('id_Func').AsInteger;
        AName:=FuncsFrame1.cdsFuncs.FieldByName('FuncName').AsString;
        Result:=True;
      end;
    finally
      Free;
    end;
  end;
end;
end.
