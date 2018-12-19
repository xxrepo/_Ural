unit uUserProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Db, Buttons, Mask, ToolEdit, ADODB, RxLookup,
  frGrp, AdvOfficeButtons, frDualList;

type


  TUserProp = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    edFIO: TEdit;
    Panel5: TPanel;
    OkButton: TButton;
    CancelButton: TButton;
    Label9: TLabel;
    LoginEdit: TEdit;
    Label10: TLabel;
    PasswordEdit: TEdit;
    qryUsers: TADOQuery;
    qryUserAdd: TADOQuery;
    qryUserEdit: TADOQuery;
    Label1: TLabel;
    PasswordEdit2: TEdit;
    GroupBox1: TGroupBox;
    qryChLogin: TADOQuery;
    cbAdm: TCheckBox;
    fDualList1: TfDualList;
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  protected
    Id:Variant;
    LBCollection:TCollection;
    UnComplits:string;
    function CheckComplitInput : boolean;
    procedure SaveData;
    procedure SetEnablingOfButtons;
  public

    procedure  Init(AId:integer);
  end;

var
  UserProp: TUserProp;
function ShowUserDetailForm(var AID:Variant; ReadOnly:boolean=false ):boolean;

implementation
   uses uDM, foMyFunc;
{$R *.DFM}


function ShowUserDetailForm(var AID:Variant; ReadOnly:boolean=false ):boolean;
var
 F:TUserProp;
begin
  F:=TUserProp.Create(nil);
  try
    with F do
    begin
      if AID=-1 then
        Caption:='Новый пользователь'
      else
        Caption:='Редактирование пользователя';
      Init(AID);
      if ReadOnly then
        OkButton.Enabled:=False;
      ShowModal;
      if ModalResult=mrOk then
      begin
        F.SaveData;
        Result:=True;
        AID:=F.Id;
      end;
    end;
  finally
    F.Free;
  end;
end;

procedure  TUserProp.Init(AId:integer);
begin
  Id := AId;
  fDualList1.Initialize('Доступные бизнесы', 'Выбранные бизнесы', nil);
  with DM.spBSN do
  begin
    Close;
    Parameters.ParamByName('id_User').Value := DM.id_User;
    Open;
    First;
    while not Eof do
    begin
      fDualList1.AddItems(DM.spBSNid_BSN.AsInteger, DM.spBSNBsnName.AsString);;

      Next;
    end;
    Close;
    Parameters.ParamByName('id_User').Value := Id;
    Open;
    First;
    while not Eof do
    begin
      fDualList1.AddSelectedItems(DM.spBSNid_BSN.AsInteger, DM.spBSNBsnName.AsString);;

      Next;
    end;
  end;

  if Id<>-1 then
  with qryUsers do
   begin
    id := AId;
    Parameters.ParamByName('Id_User').Value:=Id;
    Open;

    edFIO.Text:=FieldByName('FIO').AsString;
    LoginEdit.Text:=FieldByName('Login').AsString;
    PasswordEdit.Text:=FieldByName('PSW').AsString;
    PasswordEdit2.Text:=FieldByName('PSW').AsString;
    cbAdm.Checked:=FieldByName('isAdmin').AsInteger = 1;
   end;
   if Id = DM.id_User then
   begin
     cbAdm.Enabled := false;
   end;
end;

procedure TUserProp.OkButtonClick(Sender: TObject);
begin
 if not CheckComplitInput then
 begin
  ModalResult:=mrNone;
  Exit;
 end;
  if PasswordEdit.Text <> PasswordEdit2.Text then
  begin
    PasswordEdit.SetFocus;
    MessageBox(Handle, PChar('Ошибка в пароле' + #13 + #10 + 'Введите пароль еще раз'), '', MB_ICONERROR);
    PasswordEdit.Text := '';
    PasswordEdit2.Text := '';
    ModalResult:=mrNone;
    Exit;
  end;
  qryChLogin.Close;
  qryChLogin.Parameters.ParamByName('Login').Value := LoginEdit.Text;
  qryChLogin.Parameters.ParamByName('ID').Value := Id;
  qryChLogin.Open;
  try
    if not qryChLogin.IsEmpty then
    begin
      LoginEdit.SetFocus;
      MessageBox(Handle, PChar('Логин ' + LoginEdit.Text + ' уже используется.' + #13 + #10 + 'Выберите другой'), '', MB_ICONERROR);
      ModalResult:=mrNone;
      Exit;
    end;

  finally
    qryChLogin.Close;
  end;
end;

procedure  TUserProp.SaveData;
 var
  Act, UserDisabled:Variant;
  Ids:string;
  i, X:integer;
  vId:integer;
  S : String;
  AParameters : TParameters;
begin

  if Id > 0 then
  begin
    AParameters := qryUserEdit.Parameters;
    AParameters.ParamByName('id_User').Value := Id;
  end
  else
    AParameters := qryUserAdd.Parameters;

  AParameters.ParamByName('FIO').Value := edFIO.Text;

  AParameters.ParamByName('Login').Value := LoginEdit.Text;
  AParameters.ParamByName('PSW').Value := PasswordEdit.Text;
  if cbAdm.Checked then
    AParameters.ParamByName('isAdmin').Value := 1
  else
    AParameters.ParamByName('isAdmin').Value := 0;

  if Id > 0 then
    qryUserEdit.ExecSQL
  else
    qryUserAdd.ExecSQL;

  if Id = -1 then
  begin
    Id := DM.GetMaxID('SELECT MAX(id_User) AS ID FROM dw_User')
  end;

  for i := 0 to fDualList1.NotSelCount - 1 do
  begin
    DM.ExecSQL('delete from DW_UTB where id_User=' + IntToStr(ID) + ' AND id_BSN=' + IntToStr(fDualList1.NotSelID[i]));
  end;
  for i := 0 to fDualList1.SelCount - 1 do
  begin
    DM.ExecSQL('if not exists(select * from DW_UTB where id_User=' + IntToStr(ID) + ' AND id_BSN=' + IntToStr(fDualList1.SelID[i]) + ') ' +
                'insert into DW_UTB(id_User, id_BSN) values('+ IntToStr(ID) + ', ' + IntToStr(fDualList1.SelID[i]) + ')');
  end;
end;



function TUserProp.CheckComplitInput : boolean;
begin
 Result:=True;
 UnComplits:='';
 OkButton.ModalResult:=mrOk;

 if PasswordEdit2.Text='' then
    begin
      PasswordEdit2.Color:=redColor;
      UnComplits:='"Пароль (проверка)"' +#13#10 + UnComplits;
      PasswordEdit2.SetFocus;
    end
    else
      PasswordEdit2.Color:=clWindow;

 if PasswordEdit.Text='' then
    begin
      PasswordEdit.Color:=redColor;
      UnComplits:='"Пароль"' +#13#10 + UnComplits;
      PasswordEdit.SetFocus;
    end
    else
      PasswordEdit.Color:=clWindow;

 if LoginEdit.Text='' then
    begin
      LoginEdit.Color:=redColor;
      UnComplits:='"Логин"' +#13#10 + UnComplits;
      LoginEdit.SetFocus;
    end
    else
      LoginEdit.Color:=clWindow;

 if edFIO.Text='' then
    begin
      edFIO.Color:=redColor;
      UnComplits:='"Имя"' +#13#10 + UnComplits;
      edFIO.SetFocus;
    end
    else
      edFIO.Color:=clWindow;




 {} if UnComplits<>'' then
     begin
      Result:=False;
      ModalResult:=mrNone;
      ShowMessage('Не введена информация : '+UnComplits);
     end;
end;


procedure TUserProp.SetEnablingOfButtons;
begin
end;

end.
