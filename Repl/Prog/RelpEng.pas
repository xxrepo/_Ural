unit RelpEng;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Registry,
  ShellAPI,
  uSvccnst, Menus, ExtCtrls, StdCtrls, ComCtrls, ToolWin, db, dbclient,
  ActnList, contnrs,
  ADOdb, uMainForm;

type
  TAB = array of byte;
  TObjType2 = (otNone, otAcc2);

  procedure DoRepCrn(F : TSvcForm);
  procedure DoRepBsn(F : TSvcForm);
  procedure DoRepAcc(F : TSvcForm; ATaskName : String; AObjType : TObjType2);

implementation

function CastTimeStampToInt64(V : TAB) : Variant;
var i, Koef, m, N : integer;
begin
  Result := 0;
  Koef := 1;
  m := High(V);
  N := Low(V);
  for i := m downto N do
  begin
    Result := Result + V[i] * Koef;
    Koef := Koef * 256;
  end;
  if Result = 0 then
    Result := Null;
end;

function TimeStampisEQ(V, V2 : TAB) : boolean;
var i, m, m2, N, N2 : integer;
begin
  Result := false;

  m := High(V);
  N := Low(V);
  m2:= High(V2);
  N2 := Low(V2);

  if m = m2 then
  begin
    for i := m downto N do
    begin
      if V[i] <> V2[i] then
        Exit; 
    end;
    Result := true;
  end;
end;

function GetTS(ADOStoredProc: TADOStoredProc; ObjName : String) : TAB;
begin
//  Result := Null;
  with ADOStoredProc do
  begin
    Close;
    try
      ProcedureName := 'RP_TSGet';
      Parameters.Refresh;
      Parameters.ParamByName('@TName').Value := ObjName;

      Open;
      if not IsEmpty then
        Result := FieldByName('TS').Value;
    finally
      Close;
    end;
  end;
end;

function SetTS(ADOStoredProc: TADOStoredProc; ObjName : String; V : TAB) : boolean;
begin
  Result := false;
  with ADOStoredProc do
  begin
    Close;
    ProcedureName := 'RP_TSFix';
    Parameters.Refresh;
    Parameters.ParamByName('@TName').Value := ObjName;
    Parameters.ParamByName('@TS').Value := V;
    
    ExecProc;
    Result := true;
    Close;  
  end;
end;

procedure DoRepCrn(F : TSvcForm);
var MainTimeStamp : Variant;
    LastUpdated1, LastUpdated2 : TAB;
begin
{  F.AddToLog(ltNone, 'Начато обновление валют');
  try
     //*** Качаем апдейты
    LastUpdated1 := GetTS(F.ADOStoredProc1, 'Crn');  // Последний обновленный

    with F.ADOStoredProc1 do
    begin
  //*** сохраняем запись
      Close;
      ProcedureName := 'RP_Crn_Add';
      Parameters.Refresh;
    end;
    with F.cdsWork do
    begin
      Close;
      ProviderName := 'dsCrnTS';
      Params.Clear;
      FetchParams;
      Open;
      if not FieldByName('LastUpdated').IsNull then
        LastUpdated2 := FieldByName('LastUpdated').Value;
      if TimeStampisEQ(LastUpdated1, LastUpdated2) then
      begin
        F.AddToLog(ltOK, 'Нет новых данных');
        Exit;
      end;
      Close;
      ProviderName := 'dsCrnList';
      FetchParams;
      Params.ParamByName('@LastUpdated1').Value := CastTimeStampToInt64(LastUpdated1);
      Params.ParamByName('@LastUpdated2').Value := CastTimeStampToInt64(LastUpdated2);
      Params.ParamByName('@ID_Rep').Value := F.ID_Rep;
      Open;
      LastUpdated2 := LastUpdated1;
      First;  // Качаем данные с сервака
      while not Eof do
      begin
        with F.ADOStoredProc1 do
        begin
     //*** сохраняем запись
          Close;
          Parameters.ParamByName('@Name').Value := F.cdsWork.FieldByName('Name').Value;
          Parameters.ParamByName('@ShortName').Value := F.cdsWork.FieldByName('ShortName').Value;
          Parameters.ParamByName('@ISOCode').Value := F.cdsWork.FieldByName('ISOCode').Value;
          Parameters.ParamByName('@NumberCode').Value := F.cdsWork.FieldByName('NumberCode').Value;
          Parameters.ParamByName('@FastAccess').Value := F.cdsWork.FieldByName('FastAccess').Value;
          Parameters.ParamByName('@Value').Value := F.cdsWork.FieldByName('Value').Value;
          Parameters.ParamByName('@Rate').Value := F.cdsWork.FieldByName('Rate').Value;
          Parameters.ParamByName('@AvForPay').Value := F.cdsWork.FieldByName('AvForPay').Value;

          Parameters.ParamByName('@ID_Main').Value := F.cdsWork.FieldByName('Id_Currency').Value;

          ExecProc;
          LastUpdated2 := F.cdsWork.FieldByName('LastUpdated').Value;
        end;

        Next;
      end;
      SetTS(F.ADOStoredProc1, 'Crn', LastUpdated2);
    end;
  except
    F.AddToLog(ltError, 'Ошибка при обновлении валют');
  end;
  F.AddToLog(ltOK, 'Валюты обновлены');   }
end;

procedure DoRepBsn(F : TSvcForm);
var MainTimeStamp : Variant;
    LastUpdated1, LastUpdated2 : TAB;
begin
{  F.AddToLog(ltNone, 'Начато обновление бизнесов');
  try
     //*** Качаем апдейты
    LastUpdated1 := GetTS(F.ADOStoredProc1, 'BSN');  // Последний обновленный

    with F.ADOStoredProc1 do
    begin
  //*** сохраняем запись
      Close;
      ProcedureName := 'RP_BSN_Add';
      Parameters.Refresh;
    end;
    with F.cdsWork do
    begin
      Close;
      ProviderName := 'dsBsnTS';
      Params.Clear;
      FetchParams;
      Open;
      if not FieldByName('LastUpdated').IsNull then
        LastUpdated2 := FieldByName('LastUpdated').Value;
      if TimeStampisEQ(LastUpdated1, LastUpdated2) then
      begin
        F.AddToLog(ltOK, 'Нет новых данных');
        Exit;
      end;

      Close;
      ProviderName := 'dsBsnList';    
      FetchParams;
      Params.ParamByName('@LastUpdated1').Value := CastTimeStampToInt64(LastUpdated1);
      Params.ParamByName('@LastUpdated2').Value := CastTimeStampToInt64(LastUpdated2);
      Params.ParamByName('@ID_Rep').Value := F.ID_Rep;
      Open;
 //     LastUpdated2 := LastUpdated1;
      First;  // Качаем данные с сервака
      while not Eof do
      begin
        with F.ADOStoredProc1 do
        begin
     //*** сохраняем запись
          Close;
          Parameters.ParamByName('@Name').Value := F.cdsWork.FieldByName('Name').Value;
          Parameters.ParamByName('@ShortName').Value := F.cdsWork.FieldByName('ShortName').Value;
          Parameters.ParamByName('@Id_Currency_Main').Value := F.cdsWork.FieldByName('Id_Currency').Value;
          Parameters.ParamByName('@Num').Value := F.cdsWork.FieldByName('Num').Value;
          Parameters.ParamByName('@Disabled').Value := F.cdsWork.FieldByName('Disabled').Value;
          Parameters.ParamByName('@ID_Main').Value := F.cdsWork.FieldByName('ID_Business').Value;

          ExecProc;
   //       LastUpdated2 := F.cdsWork.FieldByName('LastUpdated').Value;
        end;

        Next;
      end;
      SetTS(F.ADOStoredProc1, 'BSN', LastUpdated2);
    end;
  except
    F.AddToLog(ltError, 'Ошибка при обновлении бизнесов');
  end;
  F.AddToLog(ltOK, 'Бизнесы обновлены');  }
end;


procedure DoRepAcc(F : TSvcForm; ATaskName : String; AObjType : TObjType2);
var MainTimeStamp : Variant;
    LastUpdated1, LastUpdated2, V : TAB;
    b : boolean;
begin
{  F.ShowText(ATaskName + ' операция начата');
  b := false;
  F.AddToLog(ltNone, ATaskName + ' - операция начата');
  try
    with F.ADOStoredProc1 do
    begin
     //*** Передаем в центральную базу
      Close;
      ProcedureName := 'RP_Acc_LCList';
      Parameters.Refresh;
      Parameters.ParamByName('@LastUpdated1').Value := Null;  // Читаем все новый для передачи в центр
      Parameters.ParamByName('@LastUpdated2').Value := Null;
      Parameters.ParamByName('@ID_Main').Value := Null;
      Open;
      First;
      while not Eof do
      begin


        F.ShowText(ATaskName + ' передано ' + FormatFloat('0', RecNo/RecordCount * 100) + '%');
        Next;
      end;
    end;
     //*** Качаем апдейты
    LastUpdated1 := GetTS(F.ADOStoredProc1, IntToStr(ORD(AObjType)));  // Последний обновленный

    with F.ADOStoredProc1 do
    begin
  //*** сохраняем запись
      Close;
      ProcedureName := 'RP_Acc_Add';
      Parameters.Refresh;
    end;
    with F.cdsWork do
    begin
      Close;
      ProviderName := 'dsAccTS';
      Params.Clear;
      FetchParams;
      Open;
      if not FieldByName('LastUpdated').IsNull then
        LastUpdated2 := FieldByName('LastUpdated').Value;
      if TimeStampisEQ(LastUpdated1, LastUpdated2) then
      begin
        F.AddToLog(ltOK, ATaskName + ' - Нет новых данных');
        Exit;
      end;

      Close;
      ProviderName := 'dsAccList';    
      FetchParams;
      Params.ParamByName('@LastUpdated1').Value := CastTimeStampToInt64(LastUpdated1);
      Params.ParamByName('@LastUpdated2').Value := CastTimeStampToInt64(LastUpdated2);
      Params.ParamByName('@ID_Rep').Value := F.ID_Rep;
      Open;
      First;  // Качаем данные с сервака
      while not Eof do
      begin
        with F.ADOStoredProc1 do
        begin
     //*** сохраняем запись
          Close;
          Parameters.ParamByName('@Name').Value := F.cdsWork.FieldByName('Name').Value;
          Parameters.ParamByName('@id_Business_Main').Value := F.cdsWork.FieldByName('id_Business').Value;
          Parameters.ParamByName('@Disabled').Value := F.cdsWork.FieldByName('Disabled').Value;
          Parameters.ParamByName('@ID_Main').Value := F.cdsWork.FieldByName('ID_Acc').Value;

          try
            ExecProc;
            V := F.cdsWork.FieldByName('LastUpdated').Value;
          except
            LastUpdated2 := V;
            b := true;
            Break;
          end;
        end;

        F.ShowText(ATaskName + ' обновлено записей ' + FormatFloat('0', RecNo/RecordCount * 100) + '%');
        Next;
      end;
      F.ShowText('');
      SetTS(F.ADOStoredProc1, IntToStr(ORD(AObjType)), V);
    end;
  finally
    F.ShowText('');
    if b then
      F.AddToLog(ltError, ATaskName + ' - Ошибка')
    else
      F.AddToLog(ltOK, ATaskName + ' - ОК');
  end;   }
end;

end.
