unit uFormApi_CA;

interface

uses classes, Windows, Messages, Sysutils, graphics,
  Forms, Controls, uMainForm, foMyFunc,
  {$IFNDEF LC}uCAList, {$ENDIF}uCntrAgentProp, uReprProp, uCAGroupSelect, uUnGroupSelect,
  uDM,
  uComment,
  uCAContact;

function EditReprProp(var id_Repr : Variant; var id_Ca : Variant; id_Bsn : Variant)  : boolean;

function EditContact(var Contact : TContact) : boolean;
function EditComment(var CommentType : integer; var Comment : String; MaxLength: Integer = 255) : boolean;

procedure ShowCAList(id_Bsn : Variant; Disabled : Variant; isOwn : boolean);
function EditCA(var AID : integer; var id_Bsn : integer; isOwn : boolean; idGroup : Variant) : boolean;
function SelectCAGroup(id_Bsn : Variant; var AID : Variant; var AName : String;
                       AAll : boolean = true;
                       ANoGroup : boolean = true;
                       ANoCA : boolean = true ) : boolean;
function SelectUnGroup(AEObjType : TEObjType; id_Bsn : Variant; var AID : Variant; var AName : String;
                       AAll : boolean = true;
                       ANoGroup : boolean = true;
                       DisabledCtg : integer = -1) : boolean;


implementation

function EditReprProp(var id_Repr : Variant; var id_Ca : Variant; id_Bsn : Variant)  : boolean;
begin
  Result := uReprProp.EditReprProp(id_Repr, id_Ca, id_Bsn);

end;

function EditContact(var Contact : TContact) : boolean;
var F : TCAContact;
begin
  Result := uCAContact.EditContact(Contact);
end;

function EditComment(var CommentType : integer; var Comment : String; MaxLength: Integer) : boolean;
begin
  Result := uComment.EditComment(CommentType, Comment, MaxLength);
end;

function SelectCAGroup(id_Bsn : Variant; var AID : Variant; var AName : String;
                       AAll : boolean;
                       ANoGroup : boolean;
                       ANoCA : boolean) : boolean;
var F : TCAGroupSelect;
begin
  Result := false;
  F := TCAGroupSelect.Create(MainForm);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    F.Initialize(AID, id_Bsn, false, true, AAll, ANoGroup, ANoCA);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AID := F.ID;
      AName := F.GrpName;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

function SelectUnGroup(AEObjType : TEObjType;
                       id_Bsn : Variant;
                       var AID : Variant;
                       var AName : String;
                       AAll : boolean;
                       ANoGroup : boolean;
                       DisabledCtg : integer) : boolean;
var F : TUnGroupSelect;
begin
  Result := false;
  F := TUnGroupSelect.Create(MainForm);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    F.Initialize(AEObjType, AID, id_Bsn, false, true, AAll, ANoGroup, true, DisabledCtg);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AID := F.ID;
      AName := F.GrpName;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure ShowCAList(id_Bsn : Variant; Disabled : Variant; isOwn : boolean);
begin
 {$IFNDEF LC}
  if not Assigned(CAList) then
  begin
    CAList := TCAList.Create(MainForm);
    CAList.Initialize(id_Bsn, Disabled, isOwn);
  end
  else
  begin
    CAList.WindowState := wsMaximized;
    CAList.BringToFront;
  end;
  {$ENDIF}
end;

function EditCA(var AID : integer; var id_Bsn : integer; isOwn : boolean; idGroup : Variant)  : boolean;
var F : TCntrAgentProp;
    S : String;
begin
  DM.Rights_GetUserRights(10, Null);//555
  Result := false;
  F := TCntrAgentProp.Create(MainForm);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    F.CAID := AID;
    if AID = -1 then
    begin
      F.idBsn := id_Bsn;
      F.isOwn := isOwn;
      F.idGroup := idGroup;
    end;
    F.ActiveControl := F.fCntrAgentProp1.DBEdit1;
    
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      AID := F.CAID;
      id_Bsn := F.idBsn;
    end;
  finally
    F.Free;
  end;
end;

end.
