unit uFormApi_OperLC;

interface
uses classes, Windows, Messages, Sysutils, graphics,
  Forms, Controls, uMainForm, foMyFunc,
   uDM, uArcLc,
  uOperLCFin,
  uOperLCOffset,
  uOperLCWare,
  uOperLCEmpty,
  uBsnSelector;

procedure RefresheArcLc(ID : integer);

procedure ShowArcLc(id_business : Variant);
function EditOperFinLC(var ID_Oper : integer; AReadOnly : boolean = false; ACorrect : boolean = false; ACopy : boolean = false; Ais_Mirr : boolean = false) : boolean;
function EditOperOffsetLC(var ID_Oper : integer; AReadOnly : boolean = false; ACorrect : boolean = false; ACopy : boolean = false) : boolean;
function EditOperWareLC(var ID_Oper : integer; AReadOnly : boolean = false; ACorrect : boolean = false; ACopy : boolean = false;
                        Ais_Mirr : boolean = false;
                        ARezMode : boolean = false) : boolean;

function EditOperEmptyLC(var ID_Oper : integer; AReadOnly : boolean = false) : boolean;

implementation

procedure RefresheArcLc(ID : integer);
begin
  if Assigned(ArcLc) then
  begin
    ArcLc.fArcLc1.RefreshInt(ID);
  end;
end;


procedure ShowArcLc(id_business : Variant);
var
    AID : Variant;
    AName : String;
begin
  DM.Rights_GetUserRights(7, Null);
  if not Assigned(ArcLc) then
  begin
    AID := -1;
    if SelectBuisnes(AID, AName, 7, nil, false, true) then
    begin
      id_business := AID;
    end
    else
      Abort;

    ArcLc := TArcLc.Create(MainForm);
    try
      ArcLc.Initialize(id_business);
    except
      ArcLc.Free;
    end;
  end
  else
  begin
    ArcLc.WindowState := wsMaximized;
    ArcLc.BringToFront;
  end;
end;

function EditOperFinLC(var ID_Oper : integer; AReadOnly : boolean; ACorrect : boolean; ACopy : boolean; Ais_Mirr : boolean) : boolean;
var F : TOperFinLC;
begin
  Result := false;
//  if (ID_Oper = -1) or (ACorrect) or(ACopy) then
    DM.Rights_GetUserRights(2, Null);
  F := TOperFinLC.Create(MainForm);
  try
    F.Initialize(ID_Oper, AReadOnly, ACorrect, ACopy, Ais_Mirr);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      ID_Oper := F.ID_Oper;
    end;
    if F.ModalResult = mrYes then
    begin
      Result := F.SaveProp;
      ID_Oper := F.ID_Oper;
      DM.rsCA.AppServer.LC_OP_OperSetCheckDate(ID_Oper);
    end;
  finally
    F.Free;
  end;
end;

function EditOperOffsetLC(var ID_Oper : integer; AReadOnly : boolean; ACorrect : boolean; ACopy : boolean) : boolean;
var F : TOffsetOperLC;
begin
  Result := false;
//  if (ID_Oper = -1) or (ACorrect) or(ACopy) then
    DM.Rights_GetUserRights(4, Null);
  F := TOffsetOperLC.Create(MainForm);
  try
    F.Initialize(ID_Oper, AReadOnly, ACorrect, ACopy);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      ID_Oper := F.ID_Oper;
    end;
    if F.ModalResult = mrYes then
    begin
      Result := F.SaveProp;
      ID_Oper := F.ID_Oper;
      DM.rsCA.AppServer.LC_OP_OperSetCheckDate(ID_Oper);
    end;
  finally
    F.Free;
  end;
end;

function EditOperWareLC(var ID_Oper : integer; AReadOnly : boolean; ACorrect : boolean; ACopy : boolean; Ais_Mirr : boolean;
  ARezMode : boolean) : boolean;
var F : TWareOperLC;
begin
  Result := false;
//  if (ID_Oper = -1) or (ACorrect) or(ACopy) then
    DM.Rights_GetUserRights(1, Null);
  F := TWareOperLC.Create(MainForm);
  try
    F.Initialize(ID_Oper, AReadOnly, ACorrect, ACopy, Ais_Mirr, ARezMode);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      ID_Oper := F.ID_Oper;
    end;
    if F.ModalResult = mrYes then
    begin
      Result := F.SaveProp;
      ID_Oper := F.ID_Oper;
      DM.rsCA.AppServer.LC_OP_OperSetCheckDate(ID_Oper);
    end;
  finally
    F.Free;
  end;
end;

function EditOperEmptyLC(var ID_Oper : integer; AReadOnly : boolean) : boolean;
var F : TEmptyOperLC;
begin
  Result := false;
  F := TEmptyOperLC.Create(MainForm);
  try
    F.Initialize(ID_Oper, AReadOnly);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      ID_Oper := F.ID_Oper;
    end;
  finally
    F.Free;
  end;
end;

end.
