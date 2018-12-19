unit uFormApi_CrnAdm;

interface

uses classes, Windows, Messages, Sysutils, graphics,
  Forms, Controls, uMainForm,
  uCurRateUpdater, uCurrencyList, uCurProp, uURLParser, uURLList, 
  uDM;


procedure ShowCurrencyList(AID, AFastAccess, AAvForPay: Variant);
procedure ShowCurrencyList_old(AID, AFastAccess, AAvForPay: Variant);
function EditCurrency(var AID: integer; id_Bsn : integer): boolean;
procedure ShowRateUpdater;
procedure ShowURLList;
function ShowParser(var AID: integer): boolean;

implementation

function ShowParser(var AID: integer): boolean;
var F : TFormParser;
begin
  F := TFormParser.Create(MainForm);
  try
    F.Initialize(AID);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      AID := F.IDUrl;
      if Result then
        MessageBox(Application.Handle, 'Данные успешно сохранены', 'Внимание', MB_OK + MB_ICONINFORMATION);
    end;
  finally
    F.Free;
  end;
end;

procedure ShowRateUpdater;
var F : TCurRateUpdater;
begin
  DM.Rights_GetUserRights(9, Null);
  F := TCurRateUpdater.Create(MainForm);
  try
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      if F.SaveProp then
        MessageBox(Application.Handle, 'Новые курсы валют успешно сохранены', 'Курсы сохранены', MB_ICONINFORMATION + MB_OK);
    end;
  finally
    F.Free;
  end;
end;

function EditCurrency(var AID: integer; id_Bsn : integer): boolean;
var F : TCurProp;
begin
  Result := false;
  F := TCurProp.Create(MainForm);
  try
    F.Initialize(AID, id_Bsn);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      AID := F.fCurProp1.ObjID;
    end;
  finally
    F.Free;
  end;
end;

procedure ShowCurrencyList(AID, AFastAccess, AAvForPay: Variant);
begin
  DM.Rights_GetUserRights(9, Null);
  if not Assigned(CurrencyList) then
  begin
    CurrencyList := TCurrencyList.Create(MainForm);
    CurrencyList.Initialize(AID, AFastAccess, AAvForPay);
  end
  else
  begin
    CurrencyList.WindowState := wsMaximized;
    CurrencyList.BringToFront;
  end;
end;

procedure ShowCurrencyList_old(AID, AFastAccess, AAvForPay: Variant);
begin
{  if not Assigned(CurrencyList_old) then
  begin
    CurrencyList_old := TCurrencyList_old.Create(MainForm);
    CurrencyList_old.Initialize(AID, AFastAccess, AAvForPay);
  end
  else
  begin
    CurrencyList_old.WindowState := wsMaximized;
    CurrencyList_old.BringToFront;
  end;  }
end;

procedure ShowURLList;
begin
  DM.Rights_GetUserRights(9, Null);
  if not Assigned(URLList) then
  begin
    URLList := TURLList.Create(MainForm);
  end
  else
  begin
    URLList.WindowState := wsMaximized;
    URLList.BringToFront;
  end;
end;

end.
