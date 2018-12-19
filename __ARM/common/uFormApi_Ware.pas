unit uFormApi_Ware;

interface

uses classes, Windows, Messages, Sysutils, graphics,
  Forms, Controls, uMainForm, foMyFunc,
  uDM,
  uMeasureSelector,
  uWareCtgProp, uWareProp;

function SelectMeasure(id_Bsn : integer; var AID : Variant; var AName : String) : boolean;

function EditWaresCat(var id_Ctg : Variant; id_Bsn : integer; id_BaseCtg_Goods : Variant) : boolean;

function EditWaresProp(id_Ctg : integer; var AID : integer; id_Bsn : integer): boolean;


implementation

function SelectMeasure(id_Bsn : integer; var AID : Variant; var AName : String) : boolean;
var F : TMeasureSelector;
begin
  Result := false;
  F := TMeasureSelector.Create(MainForm);
  try
    F.Initialize(AID, id_Bsn);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AID := F.ID_Measure;
      AName := F.MeasureName;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

function EditWaresCat(var id_Ctg : Variant; id_Bsn : integer; id_BaseCtg_Goods : Variant) : boolean;
var F : TWareCtgProp;
    AHandle : HWnd;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  DM.Rights_GetUserRights(10, Null);//555

  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;

  Result := false;
  F := TWareCtgProp.Create(MainForm);
  try
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);
    F.Initialize(id_Ctg, id_Bsn, id_BaseCtg_Goods);

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      id_Ctg := F.id_Ctg;
    end;
  finally
    F.Free;
  end;
end;


function EditWaresProp(id_Ctg : integer; var AID : integer; id_Bsn : integer): boolean;
var F : TWareProp;
    AHandle : HWnd;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}

  DM.Rights_GetUserRights(10, Null);//555
  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;
  Result := false;
  F := TWareProp.Create(MainForm);
  try
    F.Initialize(id_Ctg, AID, id_Bsn);
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      AID := F.IDObj;
    end;
  finally
    F.Free;
  end;
end;

end.
