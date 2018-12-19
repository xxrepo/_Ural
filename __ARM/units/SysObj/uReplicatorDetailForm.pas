unit uReplicatorDetailForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, Db, DBClient, Buttons
  ,uListBoxesUtils;

type
  TReplicatorDetailForm = class(TForm)
    Panel1: TPanel;
    OkButton: TButton;
    Button1: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    NameEdit: TEdit;
    Label2: TLabel;
    ShortNameEdit: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    LoginEdit: TEdit;
    PasswordEdit: TEdit;
    Label5: TLabel;
    DelPeriodEdit: TRxCalcEdit;
    Label6: TLabel;
    DisabledCheckBox: TCheckBox;
    ClientDataSet: TClientDataSet;
    Label7: TLabel;
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
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure PasswordEditChange(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AFListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure SFListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure AFListBoxDblClick(Sender: TObject);
    procedure SFListBoxDblClick(Sender: TObject);
    procedure AFListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure AFListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
  protected
    LBCollection:TCollection;
    Password:string;
    UnComplits:string;
    function CheckComplitInput : boolean;
    procedure  SaveData;
    procedure  LoadGroupsList;
    procedure  SetEnablingOfButtons;

  public
    Id:Variant;
    procedure Init;
  end;

var
  ReplicatorDetailForm: TReplicatorDetailForm;

implementation
     uses uDM, foMyFunc;

{$R *.DFM}
procedure TReplicatorDetailForm.Init;
begin
 if Id<>-1 then
 with ClientDataSet do
  begin
   Params.ParamByName('Id').Value:=id;
   Params.ParamByName('CallType').Value:=1;
   Open;
   NameEdit.Text:=FieldByName('Name').AsString;
   ShortNameEdit.Text:=FieldByName('ShortName').AsString;
   LoginEdit.Text:=FieldByName('Login').AsString;
   Password:=FieldByName('Password').AsString;
   DelPeriodEdit.Value:=FieldByName('DelPeriod').Value;
   DisabledCheckBox.Checked:=FieldByName('Disabled').Value;
  end;
  PasswordEdit.Text:=Password;
   LoadGroupsList;
end;

procedure TReplicatorDetailForm.SaveData;
 var
  Act:Variant;
  Ids:string;
  i:integer;
  vId:integer;
begin
   if Id=-1 then
    Act:=0
   else
    Act:=1;
   vId:=DM.rsCA.AppServer.SetReplicatorDetail(
    Act,
    Id,
    NameEdit.Text,
    ShortNameEdit.Text,
    LoginEdit.Text,
    Password,
    DelPeriodEdit.Value,
    DisabledCheckBox.Checked
    );
  if Id=-1 then
    Id:=vId;
  Ids:=',';
  for i:=0 to SFListBox.Items.Count-1 do
     Ids:=Ids+inttostr(TLBItem(LBCollection.Items[ StrToInt(SFListBox.Items[i]) ]).Id)+',';
  DM.rsCA.AppServer.SetReplBusiness(Id, Ids);
  Id:=vId;
end;


procedure TReplicatorDetailForm.PasswordEditChange(Sender: TObject);
begin
 Password:=PasswordEdit.Text;
end;

procedure TReplicatorDetailForm.OkButtonClick(Sender: TObject);
begin
 if CheckComplitInput then
 begin
  SaveData;
  ModalResult:=mrOk; 
 end;
end;
procedure  TReplicatorDetailForm.LoadGroupsList;
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
        LB.Id:=FieldByName('Id_Business').AsInteger;
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
            if TLBItem(LBCollection.Items[i]).Id=FieldByName('Id_Business').AsInteger
             then
              IsFound:=True;
            i:=i+1;
          until (IsFound) or (i>=LBCollection.Count);
        if not IsFound then
         begin
          LB:=TLBItem.Create(LBCollection);
          LB.Id:=FieldByName('Id_Business').AsInteger;
          LB.Name:=FieldByName('Name').AsString;
          AFListBox.Items.Add(IntToStr(LBCollection.Count-1));
         end;
        Next;
      until EOF;
   end;
 SetEnablingOfButtons;
end;

procedure TReplicatorDetailForm.FormCreate(Sender: TObject);
begin
 LBCollection:=TCollection.Create(TLBItem);
end;

procedure TReplicatorDetailForm.AFListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
AFListBox.Canvas.FillRect(Rect);
AFListBox.Canvas.TextOut(Rect.Left,Rect.Top,TLBItem(LBCollection.Items[StrToInt(AFListBox.Items[Index])]).Name);
end;

procedure TReplicatorDetailForm.SFListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 SFListBox.Canvas.FillRect(Rect);
 SFListBox.Canvas.TextOut(Rect.Left,Rect.Top,TLBItem(LBCollection.Items[StrToInt(SFListBox.Items[Index])]).Name);
end;

procedure TReplicatorDetailForm.SpeedButton1Click(Sender: TObject);
begin
 MoveItems(AFListBox, SFListBox);
 SetEnablingOfButtons;
end;

procedure TReplicatorDetailForm.SpeedButton2Click(Sender: TObject);
begin
 MoveItems(SFListBox, AFListBox);
 SetEnablingOfButtons;
end;

function TReplicatorDetailForm.CheckComplitInput : boolean;
begin
 Result:=True;
 UnComplits:='';
 OkButton.ModalResult:=mrOk;
 if  DelPeriodEdit.Text='' then
    begin
      DelPeriodEdit.Color:=redColor;
      UnComplits:=UnComplits+#13#10+'"Период очистки базы"';
      DelPeriodEdit.SetFocus;
    end
    else
      DelPeriodEdit.Color:=clWindow;

 if PasswordEdit.Text='' then
    begin
      PasswordEdit.Color:=redColor;
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


 if ShortNameEdit.Text='' then
    begin
      ShortNameEdit.Color:=redColor;
      UnComplits:=UnComplits+#13#10+'"Краткое наименование"';
      ShortNameEdit.SetFocus;
    end
    else
      ShortNameEdit.Color:=clWindow;


 if NameEdit.Text='' then
    begin
      NameEdit.Color:=redColor;
      UnComplits:=UnComplits+#13#10+'"Наименование"';
      NameEdit.SetFocus;
    end
    else
      NameEdit.Color:=clWindow;


 {} if UnComplits<>'' then
     begin
      Result:=False;
      ModalResult:=mrNone;
      ShowMessage('Не заполнены следующие поля: '+UnComplits);
     end;
end;


procedure TReplicatorDetailForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if Key=13 then OkButton.Click;
// if Key=27 then ModalResult:=mrCancel;
end;

procedure TReplicatorDetailForm.SpeedButton4Click(Sender: TObject);
begin
 MoveAllItems(AFListBox, SFListBox);
 SetEnablingOfButtons;
end;

procedure TReplicatorDetailForm.SpeedButton5Click(Sender: TObject);
begin
 MoveAllItems(SFListBox, AFListBox);
 SetEnablingOfButtons;
end;

procedure TReplicatorDetailForm.AFListBoxDblClick(Sender: TObject);
begin
 MoveItems(AFListBox, SFListBox);
 SetEnablingOfButtons;
end;

procedure TReplicatorDetailForm.SFListBoxDblClick(Sender: TObject);
begin
 MoveItems(SFListBox, AFListBox);
 SetEnablingOfButtons;
end;

procedure TReplicatorDetailForm.AFListBoxDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  LBDragDrop(Sender, Source);
  SetEnablingOfButtons;
end;

procedure TReplicatorDetailForm.AFListBoxDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
 Accept := Source is TListBox;
end;

procedure  TReplicatorDetailForm.SetEnablingOfButtons;
begin
     SpeedButton1.Enabled:=AFListBox.Items.Count<>0;
     SpeedButton2.Enabled:=SFListBox.Items.Count<>0;
     SpeedButton4.Enabled:=AFListBox.Items.Count<>0;
     SpeedButton5.Enabled:=SFListBox.Items.Count<>0;
end;

end.
