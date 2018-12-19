unit uUserProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Db, Buttons, Mask, ToolEdit, ADODB, RxLookup,
  DBCtrls, sDBEdit, DBClient, frDualList;

type


  TUserProp = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Panel5: TPanel;
    OkButton: TButton;
    CancelButton: TButton;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    fDualList1: TfDualList;
    cdsUsers: TClientDataSet;
    cdsUsersid_User: TAutoIncField;
    cdsUsersFIO: TStringField;
    cdsUsersUSERNAME: TStringField;
    cdsUsersid_UADM: TBooleanField;
    edFIO: TsDBEdit;
    dsUsers: TDataSource;
    LoginEdit: TsDBEdit;
    cbAdm: TDBCheckBox;
    PasswordEdit: TEdit;
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  protected
    Fid_User : integer;
    LBCollection:TCollection;
    UnComplits:string;
    function CheckComplitInput : boolean;
    function SaveData : boolean;
    procedure SetEnablingOfButtons;
  public

    procedure  Init(AId:integer);
  end;

var
  UserProp: TUserProp;
function ShowUserDetailForm(var AID:integer; ReadOnly:boolean=false ):boolean;

implementation
   uses uDM, foMyFunc;
{$R *.DFM}


function ShowUserDetailForm(var AID:integer; ReadOnly:boolean=false ):boolean;
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
        AID:=F.Fid_User;
      end;
    end;
  finally
    F.Free;
  end;
end;

procedure  TUserProp.Init(AId:integer);
begin
  Fid_User := AId;
  fDualList1.Initialize('Доступные бизнесы', 'Выбранные бизнесы', nil);
  with DM.cdsNS do
  begin
    Close;
    Params.ParamByName('@id_User').Value := DM.id_User;
    Open;
    First;
    while not Eof do
    begin
      fDualList1.AddItems(DM.cdsNSid_NS.AsInteger, DM.cdsNSNSName.AsString);

      Next;
    end;
    Close;
    Params.ParamByName('@id_User').Value := Fid_User;
    Open;
    First;
    while not Eof do
    begin
      fDualList1.AddSelectedItems(DM.cdsNSid_NS.AsInteger, DM.cdsNSNSName.AsString);

      Next;
    end;
  end;

   with cdsUsers do
   begin
    Fid_User := AId;
    Params.ParamByName('@Id_User').Value:=Fid_User;
    try Open; except end;

   end;
   if Fid_User = -1 then PasswordEdit.Text := '';
   if Fid_User = DM.id_User then
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
{  qryChLogin.Close;
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
  end;   }
end;

function  TUserProp.SaveData : boolean;
var xID : integer;
   OldCursor : TCursor;
   Rez, i : integer;
   FIO, USERNAME, LC_PSW, IDNSList, id_UADM : OleVariant;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try

      FIO := cdsUsersFIO.AsVariant;
      USERNAME := cdsUsersUSERNAME.AsVariant;
      LC_PSW := PasswordEdit.Text;
      id_UADM := cbAdm.Checked;
      
     // IDNSList := cdsXXXIDNSList.AsVariant;
     IDNSList := '';
     for i := 0 to fDualList1.SelCount - 1 do
     begin
       if IDNSList > '' then IDNSList := IDNSList + ',';
       IDNSList := IDNSList + Inttostr(fDualList1.SelID[i]);
     end;

      Rez := DM.rsCA.AppServer.USR_USER_UnEdit(Fid_User, FIO, USERNAME, LC_PSW, IDNSList, id_UADM);
      if Rez = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    if Fid_User = -1 then // Добавляется
    begin
      Fid_User := Rez; 
    end;
    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;
end;



function TUserProp.CheckComplitInput : boolean;
begin
 Result:=True;
 UnComplits:='';
 OkButton.ModalResult:=mrOk;

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
