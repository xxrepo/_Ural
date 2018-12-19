unit uFormApi_Oper;

interface

uses classes, Windows, Messages, Sysutils, graphics,
  Forms, Controls, uMainForm, foMyFunc, uOperFinSmp,
   uDM, uArc, uOperBuff, uAPOperList, uAccCard_v2, uBalance_v2,
  uOperFin,
  uOperFin_FFF,
  uOperWare, 
  uOperWare_FFF,
  uOperOffset,
  uOperCrnCh,
  uOperEmpty,
  uNewObj,
  uChange,
  uTopWin,
  dbclient, db,
  uWizBackToCA,
  uWizBackFromCA,
  uWizReVal,
  uBsnSelector,
  uWizNoDeptCA, uWizNoDeptAcc, uWizReplaceWare;


  procedure ShowOperBuff;

  procedure ShowArc(id_business : Variant; HasVisa : Variant);
  procedure RefresheArc(ID : integer; aIsMirr : boolean = false);

  procedure ShowArcUn(AParamBlnc : TParamBlnc);

  procedure EditOperCrnCh(const AHandle : HWnd; AOperParamz : TOperParamz);

  procedure EditOperFin(const AHandle : HWnd; AOperParamz : TOperParamz);
  procedure EditOperOffset(const AHandle : HWnd; AOperParamz : TOperParamz);
  procedure EditOperWare(const AHandle : HWnd; AOperParamz : TOperParamz);


  procedure EditOperEmpty(const AHandle : HWnd; AOperParamz : TOperParamz);

  procedure EditOperFin_FFF(const AHandle : HWnd; AOperParamz : TOperParamz);  
  procedure EditOperWare_FFF(const AHandle : HWnd; AOperParamz : TOperParamz);

  procedure ShowNewObj;

  function DoChangeOper(ID_Oper : integer) : boolean;

  procedure ShowWizBackToCA(const AHandle : HWnd; var ID_Oper: integer);
  procedure ShowWizBackFromCA(const AHandle : HWnd; var ID_Oper: integer);
  
  procedure ShowWizReVal(const AHandle : HWnd; id_WareHouse: Variant; AObjType : TEObjType = eotNone; AID : integer = -1);

  procedure EditOper_xxx(const AHandle : HWnd; AOperParamz : TOperParamz; AIntOper : IOper);

  procedure ShowWizNoDeptCA(AParamBlnc : TParamBlnc; AThatDay : boolean = false);
  procedure ShowWizNoDeptAcc(AParamBlnc : TParamBlnc);
  procedure ShowWizReplaceWare(AParamBlnc: TParamBlnc);
  procedure ShowAccCard_v2_ext(ADataSet : TDataSet);
  procedure ShowBalance_v2_ext(ADataSet : TDataSet);
  procedure EditOper_ext(ADataSet : TDataSet);

  procedure EditOper(const AHandle : HWnd; AOperParamz : TOperParamz; AIntOper : IOper);

implementation


procedure EditOper_ext(ADataSet : TDataSet);
var
    Rez : boolean;
    B, Ais_Mirr, ARezMode : boolean;
    AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ID_Oper := ADataSet.FieldByName('id_Oper').AsInteger;
  AOperParamz.is_Mirr := ADataSet.FieldByName('is_Mirr').AsBoolean;
  AOperParamz.Copy := true;
  
  case ADataSet.FieldByName('OperVid').AsInteger of
    -1 : EditOperCrnCh(DM.GetHandleFromArc, AOperParamz);
    0 : EditOperEmpty(DM.GetHandleFromArc, AOperParamz);
    1 : EditOperWare(DM.GetHandleFromArc, AOperParamz);
    2 : EditOperFin(DM.GetHandleFromArc, AOperParamz);
    4 : EditOperOffset(DM.GetHandleFromArc, AOperParamz);

    101 : EditOperWare_FFF(DM.GetHandleFromArc, AOperParamz);
    102 : EditOperFin_FFF(DM.GetHandleFromArc, AOperParamz);

    201 : EditOperWare(DM.GetHandleFromArc, AOperParamz);
  end;
end;

procedure ShowBalance_v2_ext(ADataSet : TDataSet);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  with ADataSet do
  begin
    AParamBlnc.id_ContrAgent := FieldByName('id_ContrAgent').AsInteger;
    AParamBlnc.DateFrom := FieldByName('DateCreate').AsDateTime;
    AParamBlnc.DateTo := FieldByName('DateCreate').AsDateTime;
  end;
  ShowBalance_v2(AParamBlnc);
end;

procedure ShowAccCard_v2_ext(ADataSet : TDataSet);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  with ADataSet do
  begin
    AParamBlnc.id_Acc := FieldByName('id_Acc').AsInteger;
    AParamBlnc.DateFrom := FieldByName('DateCreate').AsDateTime;
    AParamBlnc.DateTo := FieldByName('DateCreate').AsDateTime;
  end;
  ShowAccCard_v2(AParamBlnc);
end;

procedure ShowWizReplaceWare(AParamBlnc : TParamBlnc);
begin
  uWizReplaceWare.ShowWizReplaceWare(AParamBlnc);
end;

procedure ShowWizNoDeptCA(AParamBlnc : TParamBlnc; AThatDay : boolean );
begin
  uWizNoDeptCA.ShowWizNoDeptCA(AParamBlnc, AThatDay);
end;

procedure ShowWizNoDeptAcc(AParamBlnc : TParamBlnc);
begin
  uWizNoDeptAcc.ShowWizNoDeptAcc(AParamBlnc);
end;

procedure ShowWizReVal(const AHandle : HWnd; id_WareHouse: Variant; AObjType : TEObjType; AID : integer);
begin
  uWizReVal.ShowWizReVal(AHandle, id_WareHouse, AID);
end;

procedure ShowWizBackToCA(const AHandle : HWnd; var ID_Oper: integer);
begin
  uWizBackToCA.ShowWizBackToCA(AHandle, ID_Oper);
end;

procedure ShowWizBackFromCA(const AHandle : HWnd; var ID_Oper: integer);
begin
  uWizBackFromCA.ShowWizBackFromCA(AHandle, ID_Oper);
end;

function DoMayVized(const AHandle : HWnd; CDS : TDataSet): boolean;
var UID : integer;
    AHnd : HWnd;
begin
  Result := False;
  case CDS.FieldByName('OperVid').AsInteger of
    1, 101 :
    begin
      with CDS do
      begin
        if not FieldByName('OperTypeIn').AsBoolean
           and not FieldByName('id_Repr').IsNull
           and not FieldByName('id_WareHouse').IsNull
           then
          UID := 18   // Отгрузка
        else
          UID := 17;
      end;
    end;
    2, 102 : UID := 16;
    3, 103 : UID := 20;
    4 : UID := 19;
    201 : Exit;
  end;
  if FPredViza then
  begin
    if DM.CheckUserRights(UID, CDS.FieldByName('id_Business').AsInteger) and ({(DM.DD_DayGetProp <> Null) and} MayVized(CDS)) then
    begin
      if Screen.ActiveForm <> nil then
        AHnd := Screen.ActiveForm.Handle
      else
        AHnd := AHandle;
      if MessageBox(AHnd, PChar('Данные по операции введены полностью.' + #13 + #10 + 'Завизировать операцию?'), 'Завизировать операцию?', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
      begin
        Result := true;
      end;
    end;
  end;

end;

procedure ShowOperBuff;
begin
  if not Assigned(OperBuff) then
  begin
    OperBuff := TOperBuff.Create(MainForm);
    OperBuff.Initialize;
  end
  else
  begin
    OperBuff.WindowState := wsMaximized;
    OperBuff.BringToFront;
  end;
end;

procedure RefresheArc(ID : integer; aIsMirr : boolean);
begin
  if Assigned(Arc) then
  begin
    Arc.fArc1.RefresheInt(ID, aIsMirr);
  end;
end;

procedure ShowArc(id_business : Variant; HasVisa : Variant);
var AParamBlnc : TParamBlnc;
    AID : Variant;
    AName : String;
begin
  AParamBlnc := GetEmptyParamBlnc;
  DM.Rights_GetUserRights(7, Null);
  if not Assigned(Arc) then
  begin
    AID := -1;
    if SelectBuisnes(AID, AName, 7, nil, false, true) then
    begin
      AParamBlnc.id_business := AID;
    end
    else
      Abort;

    Arc := TArc.Create(MainForm);
    try
      AParamBlnc.HasViza := HasVisa;
      Arc.Initialize(AParamBlnc);
      Arc.fArc1.RemakeFilter2(-1);
      Arc.fArc1.AEnableLoadArcStng := false;
    except
      Arc.Free;
    end;
  end
  else
  begin
    Arc.WindowState := wsMaximized;
    Arc.BringToFront;
  end;
end;

procedure ShowArcUn(AParamBlnc : TParamBlnc);
begin
  if not Assigned(Arc) then
  begin
    Arc := TArc.Create(MainForm);
    Arc.Initialize(AParamBlnc);
  end
  else
  begin
    Arc.WindowState := wsMaximized;
    Arc.BringToFront;
  end;
end;

procedure ShowNewObj;
var F : TNewObj;
begin
  F := TNewObj.Create(MainForm);
  try
    F.fNewObj1.Initialize;
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure DoIt(const AHandle : HWnd; CDS : TClientDataSet; AOperParamz : TOperParamz; AModalResult : TModalResult; ACheckAmount : boolean);
var OpState : integer;
    AMsg, xxxID : integer;
    zzzOperParamz : TOperParamz;
   AWinControl: TWinControl;
begin 
  if AModalResult = mrIgnore then
  begin
    if not DM.rsCA.AppServer.OP_OperDel(AOperParamz.ID_Oper) = -1 then
    begin
      MessageBox(AHandle, 'Ошибка при удалении', 'Произошла ошибка при удалении операции', MB_OK + MB_ICONERROR);
      Exit;
    end
  end
  else
    if AModalResult = mrYes then
    begin
      if (CDS = nil) or (CDS.FieldByName('CheckDate').IsNull) then
      begin
        if DM.rsCA.AppServer.OP_OperSetCheckDate_v2(AOperParamz.ID_Oper, DM.IDUser) <> 1 then
        begin
          MessageBox(AHandle, 'Ошибка при визировании', 'Произошла ошибка при визировании операции', MB_OK + MB_ICONERROR);
          Exit;
        end
      end
      else
      begin
        if DM.rsCA.AppServer.OP_OperDelCheckDate_v2(AOperParamz.ID_Oper) <> 1 then
        begin
          MessageBox(AHandle, 'Ошибка при снятии визы', 'Произошла ошибка при снятии визы', MB_OK + MB_ICONERROR);
          Exit;
        end;
      end;
    end
    else
      if AModalResult = mrNo then
      begin
        if (CDS = nil) or (CDS.FieldByName('OperState').AsInteger <> -1) then
          OpState := -1
        else
          OpState := 0;
        if DM.rsCA.AppServer.OP_OperSetOperState_v2(AOperParamz.ID_Oper, OpState) <> 1 then
        begin
          MessageBox(AHandle, 'Произошла ошибка', 'Произошла ошибка', MB_YESNO + MB_ICONERROR);
          Exit;
        end
      end
      else
        if (AModalResult = mrOk) or (AModalResult = mrRetry)  then
        begin
          if AModalResult = mrRetry then
          begin
            zzzOperParamz := GetEmptyOperParamz;
            zzzOperParamz.ID_Oper := AOperParamz.ID_Oper;
            EditOperWare(AHandle, zzzOperParamz);

          end
          else
            if (CDS <> nil) and (CDS.FieldByName('CheckDate').IsNull) and ACheckAmount and DoMayVized(AHandle, CDS) then
            begin
              try
                if DM.rsCA.AppServer.OP_OperSetCheckDate_v2(AOperParamz.ID_Oper, DM.IDUser) <> 1 then
                begin
                  MessageBox(AHandle, 'Ошибка при визировании', 'Произошла ошибка при визировании операции', MB_OK + MB_ICONERROR);
                  Exit;
                end;
              except
                 MessageBox(AHandle, 'Ошибка при визировании', 'Произошла ошибка при визировании операции', MB_OK + MB_ICONERROR);
              end;
            end;
        end;

 
  if AModalResult = mrIgnore then
    AMsg := xxx_DelMsg
  else
    AMsg := xxx_RefrMsg;
    if AOperParamz.ALevel <= 0 then
    begin
      if (AOperParamz.Copy and FStayHere_Copy) then
        xxxID := AOperParamz.xxxID
      else
        xxxID := AOperParamz.ID_Oper;
      PostMessage(AHandle, AMsg, xxxID, 0);
    end
    else
      PostMessage(AHandle, AMsg, -AOperParamz.ID_Oper, 0);
      
    AWinControl := FindControl(AHandle);
    if (AWinControl <> nil) and not (AWinControl is TForm) then
      AWinControl := GetControlOwner(AWinControl);
    if (AWinControl is TForm) then
    begin
      TForm(AWinControl).BringToFront;
    end;
end;

procedure EditOper(const AHandle : HWnd; AOperParamz : TOperParamz; AIntOper : IOper);
var AText, ACaption : String;
   xxx : integer;
begin
  if AOperParamz.Copy or AOperParamz.RezMode or AOperParamz.Viza or (AOperParamz.id_Oper = -1) then
  begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  end;
//  F := TOperFin.Create(MainForm);
  try
  if AOperParamz.Copy  then
  begin
    AOperParamz.ReadOnly := false;
    AOperParamz.xxxID := AOperParamz.ID_Oper;
  end;
    Screen.Cursor := crSQLWait;
    try
      AIntOper.Initialize(AHandle, AOperParamz);
    finally
      Screen.Cursor := crDefault;
    end;



    if AOperParamz.Viza and not (AIntOper.GetbtnVisaEnabled) then
    begin
      MessageBox(AHandle, PChar('Невозможно завизировать операцию'), '!!!', MB_ICONERROR + mb_Ok);
      Abort;
    end;
    if AOperParamz.Viza and (AIntOper.GetbtnVisaEnabled) then
    begin
//**********************
      AIntOper.OnClose := nil;
      AIntOper.OnCloseQuery := nil;
      AIntOper.OnDestroy := nil;
//**********************
      if AIntOper.GetbtnVisaEnabled then
      begin
        if AIntOper.PrevViza(AText, ACaption) then
        begin
          AIntOper.ModalResult := mrYes;
//          AIntOper.Close;
//**********************
//          ShowText('0');
          EditOper_xxx(AHandle, AOperParamz, AIntOper);
  //        ShowText('1');
          AIntOper.Free;
    //      ShowText('2');
//**********************
        end
        else
        begin
          AIntOper.Show;
          if AText <> '' then
          begin
            PostMessage(AHandle, xxx_Cancel, AOperParamz.ID_Oper, ORD(AOperParamz.Is_Mirr));
            MessageBox(AIntOper.Handle, PChar(AText), PChar(ACaption), MB_OK + MB_ICONERROR);
          end;
        end;
      end;
    end
    else
      AIntOper.Show;
  except
    AIntOper.Free;
  end;
end;

procedure EditOper_xxx(const AHandle : HWnd; AOperParamz : TOperParamz; AIntOper : IOper);
var Rez : boolean;
    Need : Extended;
    AModalResult : TModalResult;
    CDS : TClientDataSet;
begin
  try
    Rez := false;
    AModalResult := AIntOper.ModalResult;
    CDS := AIntOper.GetOperCDS;
    if (AModalResult = mrIgnore) then
    begin
      Rez := true;
      DoIt(AHandle, CDS, AOperParamz, AModalResult, true);
    end;
    if (AModalResult = mrRetry) or (AModalResult = mrOk) or (AModalResult = mrYes) or (AModalResult = mrNo) then
    begin
      Rez := AIntOper.SaveProp or (AModalResult = mrYes) or (AModalResult = mrRetry) or (AModalResult = mrNo) ;
      AOperParamz.ID_Oper := AIntOper.GetID_Oper;

      if AOperParamz.Offset {or (AOperParamz.DoPay)} then
        begin
        // xxx :=
          DM.rsCA.AppServer.OP_ReplaceDate_CH(AOperParamz.ID_Oper, DM.FDateCreate) ;
             // if xxx = 0 then
               // raise Exception.Create('Перенос невозможен!!!');
        end;


      if Rez then
        DoIt(AHandle, CDS, AOperParamz, AModalResult, AIntOper.CheckAmount(Need));
   //   if AOperParamz.Viza then
   //     AIntOper.Free;
    end;

  except

  end;
end;

procedure EditOperFin(const AHandle : HWnd; AOperParamz : TOperParamz);
var I : IOper;
begin
  if FIsSimple then
  begin
    EditOperFinSmp(AHandle, AOperParamz);
    Exit;
  end;
  
  if (AOperParamz.ID_Oper = -1) or (AOperParamz.Correct) or(AOperParamz.Copy) then
    DM.Rights_GetUserRights(2, Null);

  I := TOperFin.Create(MainForm);
  try
//    ShowText('3');
    EditOper(AHandle, AOperParamz, I);
  //  ShowText('4');
  except
    on E : Exception do
    begin
      I.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;


procedure EditOperFin_FFF(const AHandle : HWnd; AOperParamz : TOperParamz);
var I : IOper;
begin
  if (AOperParamz.ID_Oper = -1) or (AOperParamz.Correct) or(AOperParamz.Copy) then
    DM.Rights_GetUserRights(11, Null);     
  I := TOperFin_FFF.Create(MainForm);
  try
    EditOper(AHandle, AOperParamz, I);
  except
    I.Free;
  end;
end;

procedure EditOperWare_FFF(const AHandle : HWnd; AOperParamz : TOperParamz);
var I : IOper;
begin
  if (AOperParamz.ID_Oper = -1) or (AOperParamz.Correct) or(AOperParamz.Copy) then
    DM.Rights_GetUserRights(11, Null);

  I := TOperWare_FFF.Create(MainForm);
  try
    EditOper(AHandle, AOperParamz, I);
  except
    I.Free;
  end;
end;

procedure EditOperOffset(const AHandle : HWnd; AOperParamz : TOperParamz);
var I : IOper;
begin
  if (AOperParamz.ID_Oper = -1) or (AOperParamz.Correct) or(AOperParamz.Copy) then
    DM.Rights_GetUserRights(4, Null);

  I := TOperOffset.Create(MainForm);
  try
    EditOper(AHandle, AOperParamz, I);
  except
    on E : Exception do
    begin
      I.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure EditOperCrnCh(const AHandle : HWnd; AOperParamz : TOperParamz);
var I : IOper;
begin
  if (AOperParamz.ID_Oper = -1) or (AOperParamz.Correct) or(AOperParamz.Copy) then
    DM.Rights_GetUserRights(1, Null);

  I := TOperCrnCh.Create(MainForm);
  try
    EditOper(AHandle, AOperParamz, I);
  except
    I.Free;
  end;
end;

procedure EditOperWare(const AHandle : HWnd; AOperParamz : TOperParamz);
var I : IOper;
    UID : integer;
begin
  if (AOperParamz.ID_Oper = -1) or (AOperParamz.Correct) or(AOperParamz.Copy) then
  begin
    if AOperParamz.RezMode then
      UID := 25
    else
      UID := 1;
    DM.Rights_GetUserRights(UID, Null);
  end;
  
  I := TOperWare.Create(MainForm);
  try
    EditOper(AHandle, AOperParamz, I);
  except
    on E : Exception do
    begin
      I.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure EditOperEmpty(const AHandle : HWnd; AOperParamz : TOperParamz);
var I : IOper;
begin
  if (AOperParamz.ID_Oper = -1) or (AOperParamz.Correct) or(AOperParamz.Copy) then
    DM.Rights_GetUserRights(1, Null);

  I := TOperEmpty.Create(MainForm);
  try
    EditOper(AHandle, AOperParamz, I);
  except
    on E : Exception do
    begin
      I.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

function DoChangeOper(ID_Oper : integer) : boolean;
var F : TChangeOper;
begin
  Result := false;
  F := TChangeOper.Create(MainForm);
  try
    F.Initialize(ID_Oper);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.DoOk;
    end
    else
      if F.ModalResult = mrCancel then
      begin
        Result := F.DoCancel;
      end;
  finally
    F.Free;
  end;
end;

end.
