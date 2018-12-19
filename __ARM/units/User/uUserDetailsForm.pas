unit uUserDetailsForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Db, DBClient, Buttons,
  uListBoxesUtils, Mask, ToolEdit, ActnList;

type


  TUserDetailsForm = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LastNameEdit: TEdit;
    FirstNameEdit: TEdit;
    MiddleNameEdit: TEdit;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    PspSeriesEdit: TEdit;
    pspNumberEdit: TEdit;
    Panel3: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    LoginEdit: TEdit;
    PasswordEdit: TEdit;
    Label11: TLabel;
    pspPlaceEdit: TEdit;
    Label12: TLabel;
    pspAddrEdit: TEdit;
    Panel4: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    AddrRealEdit: TEdit;
    PhonesEdit: TEdit;
    Panel5: TPanel;
    OkButton: TButton;
    CancelButton: TButton;
    ClientDataSet: TClientDataSet;
    Label16: TLabel;
    EmailsEdit: TEdit;
    DisabledCheckBox: TCheckBox;
    Panel6: TPanel;
    Label17: TLabel;
    Panel7: TPanel;
    Splitter1: TSplitter;
    Panel8: TPanel;
    Label18: TLabel;
    AFListBox: TListBox;
    Panel9: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel10: TPanel;
    Label19: TLabel;
    SFListBox: TListBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    pspDate: TDateEdit;
    Label20: TLabel;
    OrgPostEdit: TEdit;
    cbisRelp: TCheckBox;
    cbisPPP: TCheckBox;
    cbid_UADM: TCheckBox;
    ActionList1: TActionList;
    Action1: TAction;
    Button1: TButton;
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AFListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure SFListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure PasswordEditChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AFListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure AFListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure AFListBoxDblClick(Sender: TObject);
    procedure SFListBoxDblClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  protected
    LBCollection:TCollection;
    Password:string;
    UnComplits:string;
    function CheckComplitInput : boolean;
    procedure LoadGroupsList;
    procedure SaveData;
    procedure SetEnablingOfButtons;
  public
    Id:Variant;
    procedure  Init;
  end;

var
  UserDetailsForm: TUserDetailsForm;

implementation
   uses uDM, foMyFunc;
{$R *.DFM}

procedure TUserDetailsForm.FormCreate(Sender: TObject);
begin
     LBCollection:=TCollection.Create(TLBItem);
end;

procedure  TUserDetailsForm.Init;
begin
  cbisPPP.Visible := DM.DefB_APN <= 0;
  
  if Id<>-1 then
  with ClientDataSet do
   begin
    Params.ParamByName('Id').Value:=Id;
    Params.ParamByName('CallType').Value:=1;
    Open;
    LastNameEdit.Text:=FieldByName('LastName').AsString;
    FirstNameEdit.Text:=FieldByName('FirstName').AsString;
    MiddleNameEdit.Text:=FieldByName('MiddleName').AsString;
    LoginEdit.Text:=FieldByName('Login').AsString;
    PasswordEdit.Text:='1111111111';
    Password:=FieldByName('Password').AsString;
    PspSeriesEdit.Text:=FieldByName('PspSeries').AsString;
    pspNumberEdit.Text:=FieldByName('pspNumber').AsString;
    pspPlaceEdit.Text:=FieldByName('pspPlace').AsString;
    pspAddrEdit.Text:=FieldByName('pspAddr').AsString;
    pspDate.Date:=FieldByName('pspDate').AsDateTime;
    AddrRealEdit.Text:=FieldByName('AddrReal').AsString;
    PhonesEdit.Text:=FieldByName('Phones').AsString;
    EmailsEdit.Text:=FieldByName('Emails').AsString;
    OrgPostEdit.Text:=FieldByName('OrgPost').AsString;
    DisabledCheckBox.Checked:=FieldByName('Disabled').AsBoolean;
    try
      cbisRelp.Checked := FieldByName('isRelp').AsBoolean;
      cbisPPP.Checked := FieldByName('isPPP').AsBoolean;
      cbid_UADM.Checked := FieldByName('id_UADM').AsBoolean;
    except
    end;
   end
   else
   begin
//    pspDate.Date:=Now;
   end;
   cbid_UADM.Visible := DM.CheckUserRights(-13, -1);
   if not cbid_UADM.Visible then
     cbid_UADM.Checked := false;
   LoadGroupsList;
end;

procedure TUserDetailsForm.OkButtonClick(Sender: TObject);
begin
 if CheckComplitInput then
 begin
  SaveData;
  ModalResult:=mrOk;
 end;
end;

procedure  TUserDetailsForm.SaveData;
 var
  Act, UserDisabled:Variant;
  Ids:string;
  i:integer;
  vId:integer;
begin
   if Id=-1 then
    Act:=0
   else
    Act:=1;
   if DisabledCheckBox.Checked then
      UserDisabled:=1
   else
      UserDisabled:=0;

  vId:=DM.rsCA.AppServer.SetUserDetail_2(
    Act,
    Id,
    FirstNameEdit.Text,
    MiddleNameEdit.Text,
    LastNameEdit.Text,
    LoginEdit.Text,
    Password,
    PspSeriesEdit.Text,
    pspNumberEdit.Text,
    pspPlaceEdit.Text,
    pspDate.Date,
    pspAddrEdit.Text,
    AddrRealEdit.Text,
    PhonesEdit.Text,
    EmailsEdit.Text,
    OrgPostEdit.Text,
    UserDisabled,
    cbisRelp.Checked, cbisPPP.Checked, cbid_UADM.Checked
  );

  if Id=-1 then
    Id:=vId;
  Ids:=',';
  for i:=0 to SFListBox.Items.Count-1 do
     Ids:=Ids+inttostr(TLBItem(LBCollection.Items[ StrToInt(SFListBox.Items[i]) ]).Id)+',';
  DM.rsCA.AppServer.SetUserGroups(Id, Ids);
  Id:=vId;
end;

procedure  TUserDetailsForm.LoadGroupsList;
 var
  LB:TLBItem;
  i:integer;
  IsFound:boolean;
begin
   with ClientDataSet do
   begin
    Close;
    Params.ParamByName('Id').Value:=Id;
    Params.ParamByName('CallType').Value:=2;
    Open;
     if not IsEmpty then
      repeat
        LB:=TLBItem.Create(LBCollection);
        LB.Id:=FieldByName('Id_Group').AsInteger;
        LB.Name:=FieldByName('Name').AsString;
        SFListBox.Items.Add(IntToStr(LBCollection.Count-1));
        Next;
      until EOF;

    Close;
    Params.ParamByName('CallType').Value:=3;
    Open;
     if not IsEmpty then
      repeat
        IsFound:=False;
          i:=0;
          if LBCollection.Count>0 then
          repeat
            if TLBItem(LBCollection.Items[i]).Id=FieldByName('Id_Group').AsInteger
             then
              IsFound:=True;
            i:=i+1;
          until (IsFound) or (i>=LBCollection.Count);
        if not IsFound then
         begin
          LB:=TLBItem.Create(LBCollection);
          LB.Id:=FieldByName('Id_Group').AsInteger;
          LB.Name:=FieldByName('Name').AsString;
          AFListBox.Items.Add(IntToStr(LBCollection.Count-1));
         end;
        Next;
      until EOF;
   end;
 SetEnablingOfButtons;
end;


procedure TUserDetailsForm.AFListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 AFListBox.Canvas.FillRect(Rect);
 AFListBox.Canvas.TextOut(Rect.Left,Rect.Top,TLBItem(LBCollection.Items[StrToInt(AFListBox.Items[Index])]).Name);
end;

procedure TUserDetailsForm.SFListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 SFListBox.Canvas.FillRect(Rect);
 SFListBox.Canvas.TextOut(Rect.Left,Rect.Top,TLBItem(LBCollection.Items[StrToInt(SFListBox.Items[Index])]).Name);
end;

procedure TUserDetailsForm.SpeedButton1Click(Sender: TObject);
begin
 MoveItems(AFListBox, SFListBox);
SetEnablingOfButtons;
end;

procedure TUserDetailsForm.SpeedButton2Click(Sender: TObject);
begin
 MoveItems(SFListBox,AFListBox);
 SetEnablingOfButtons;
end;

procedure TUserDetailsForm.PasswordEditChange(Sender: TObject);
begin
 Password:=PasswordEdit.Text;
end;

function TUserDetailsForm.CheckComplitInput : boolean;
begin
 Result:=True;
 UnComplits:='';
 OkButton.ModalResult:=mrOk;

{  if PasswordEdit.Text='' then
    begin
      PasswordEdit.Color:=clRed;
      UnComplits:=UnComplits+#13#10+'"Пароль"';
      PasswordEdit.SetFocus;
    end
    else
      PasswordEdit.Color:=clWindow;


 if  LoginEdit.Text='' then
    begin
      LoginEdit.Color:=redColor;
      UnComplits:=UnComplits+#13#10+'"Логин"';
      LoginEdit.SetFocus;
    end
    else
      LoginEdit.Color:=clWindow;
}
 if LastNameEdit.Text='' then
    begin
      LastNameEdit.Color:=redColor;
      UnComplits:=UnComplits+#13#10+'"Фамилия"';
      LastNameEdit.SetFocus;
    end
    else
      LastNameEdit.Color:=clWindow;

 if FirstNameEdit.Text='' then
    begin
      FirstNameEdit.Color:=redColor;
      UnComplits:=UnComplits+#13#10+'"Имя"';
      FirstNameEdit.SetFocus;
    end
    else
      FirstNameEdit.Color:=clWindow;


 {} if UnComplits<>'' then
     begin
      Result:=False;
      ModalResult:=mrNone;
      ShowMessage('Не заполнены следующие поля: '+UnComplits);
     end;
end;


procedure TUserDetailsForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if Key=13 then OkButton.Click;
// if Key=27 then ModalResult:=mrCancel;
end;

procedure TUserDetailsForm.AFListBoxDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  LBDragDrop(Sender, Source);
  SetEnablingOfButtons;
end;

procedure TUserDetailsForm.AFListBoxDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
 Accept := Source is TListBox;
end;

procedure TUserDetailsForm.AFListBoxDblClick(Sender: TObject);
begin
 MoveItems(AFListBox, SFListBox);
SetEnablingOfButtons;
end;

procedure TUserDetailsForm.SFListBoxDblClick(Sender: TObject);
begin
 MoveItems(SFListBox,AFListBox);
 SetEnablingOfButtons;
end;



procedure TUserDetailsForm.SpeedButton3Click(Sender: TObject);
begin
 MoveAllItems(AFListBox, SFListBox);
SetEnablingOfButtons;
end;

procedure TUserDetailsForm.SpeedButton4Click(Sender: TObject);
begin
 MoveAllItems(SFListBox,AFListBox);
  SetEnablingOfButtons;
end;

procedure TUserDetailsForm.SetEnablingOfButtons;
begin
     SpeedButton1.Enabled:=AFListBox.Items.Count<>0;
     SpeedButton2.Enabled:=SFListBox.Items.Count<>0;
     SpeedButton3.Enabled:=AFListBox.Items.Count<>0;
     SpeedButton4.Enabled:=SFListBox.Items.Count<>0;
end;

procedure TUserDetailsForm.Action1Execute(Sender: TObject);
begin
  cbid_UADM.Visible := true;
end;

end.
