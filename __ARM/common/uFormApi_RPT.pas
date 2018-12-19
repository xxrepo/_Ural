unit uFormApi_RPT;

interface
uses classes, Windows, Messages, Sysutils, graphics,
  Forms, Controls, uMainForm, foMyFunc,
   uDM,
  uTopWin,
  dbclient, db,
  uOperList_Del,
  uOperList_Corr,
  uOperList_Empty,
  uOperList_HasViza,
  uOperList_Minus,
  uOperList_NotHasViza,
  uOperList_Pribil, uOperList_Zatrata,
  uOperList_Foget,
  uOperList_Self,
  uOperList_Rate, uBalanceArc,

  uBlnDetail;

  procedure ShowRateOperList;

  procedure ShowDelOperList;
  procedure ShowCorrOperList;
  procedure ShowEmptyOperList;
  procedure ShowHasVizaOperList;
  procedure ShowNotHasVizaOperList;

  procedure ShowMinusOperList;

  procedure ShowPribilOperList;
  procedure ShowZatrataOperList;

  procedure ShowFogetOperList;
  procedure ShowSelfOperList;

  procedure ShowBalanceArc;

implementation

procedure ShowBalanceArc;
begin
  if not Assigned(BalanceArc) then
  begin
    BalanceArc := TBalanceArc.Create(MainForm);
    BalanceArc.Initialize;
  end
  else
  begin
    BalanceArc.WindowState := wsMaximized;
    BalanceArc.BringToFront;
  end;
end;

procedure ShowRateOperList;
var F : TOperList_Rate;
begin
  DM.Rights_GetUserRights(6, Null);
  F := TOperList_Rate.Create(nil);
  F.Caption := 'Курсовые изменения';
  try
    F.Show;
    F.Repaint;
    F.Refr;
  except
    F.Free;
  end;
end;


procedure ShowSelfOperList;
var F : TOperList_Self;
begin
  DM.Rights_GetUserRights(6, Null);
  F := TOperList_Self.Create(nil);
  F.Caption := 'Внутренние операции';
  try
    F.Show;
    F.Repaint;
    F.Refr;
  except
    F.Free;
  end;
end;



procedure ShowFogetOperList;
var F : TOperList_Foget;
begin
  DM.Rights_GetUserRights(6, Null);
  F := TOperList_Foget.Create(nil);
  F.Caption := 'Операции не завизированные в день создания';
  try
    F.Show;
    F.Repaint;
    F.Refr;
  except
    F.Free;
  end;
end;


procedure ShowZatrataOperList;
var F : TOperList_Zatrata;
begin
  DM.Rights_GetUserRights(6, Null);
  F := TOperList_Zatrata.Create(nil);
  F.Caption := 'Операции - затраты';
  try
    F.Show;
    F.Repaint;
    F.Refr;
  except
    F.Free;
  end;
end;

procedure ShowPribilOperList;
var ABlnDetail : TBlnDetailData;
begin
  DM.Rights_GetUserRights(6, Null);
  ABlnDetail := GetEmptyBlnDetail;

  ABlnDetail.isUp := true;
                            
  ShowBlnDetail(ABlnDetail);
end;

procedure ShowMinusOperList;
var F : TOperList_Minus;
begin
  DM.Rights_GetUserRights(6, Null);
  F := TOperList_Minus.Create(nil);
  F.Caption := 'Складские операции с отрицательной прибылью';
  try
    F.Show;
    F.Repaint;
    F.Refr;
  except
    F.Free;
  end;
end;

procedure ShowHasVizaOperList;
var F : TOperList_HasViza;
begin
  DM.Rights_GetUserRights(6, Null);
  F := TOperList_HasViza.Create(nil);
  F.Caption := 'Завизированные операции';
  try
    F.Show;
    F.Repaint;
    F.Refr;
  except
    F.Free;
  end;
end;

procedure ShowNotHasVizaOperList;
var F : TOperList_NotHasViza;
begin
  DM.Rights_GetUserRights(6, Null);
  F := TOperList_NotHasViza.Create(nil);
  F.Caption := 'Не завизированные операции';
  try
    F.Show;
    F.Repaint;
    F.Refr;
  except
    F.Free;
  end;
end;

procedure ShowDelOperList;
var F : TRptForm1;
begin
  DM.Rights_GetUserRights(6, Null);
  F := TRptForm1.Create(nil);
  F.Caption := 'Удаленные операции';
  try
    F.Show;
    F.Repaint;
    F.Refr;
  except
    F.Free;
  end;
end;

procedure ShowCorrOperList;
var F : TOperList_Corr;
begin
  DM.Rights_GetUserRights(6, Null);
  F := TOperList_Corr.Create(nil);
  F.Caption := 'Корректирующие операции';
  try
    F.Show;
    F.Repaint;
    F.Refr;
  except
    F.Free;
  end;
end;

procedure ShowEmptyOperList;
var F : TOperList_Empty;
begin
  DM.Rights_GetUserRights(6, Null);
  F := TOperList_Empty.Create(nil);
  F.Caption := 'Пустые операции';
  try
    F.Show;
    F.Repaint;
    F.Refr;
  except
    F.Free;
  end;
end;

end.
