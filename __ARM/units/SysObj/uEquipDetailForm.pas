unit uEquipDetailForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Db, DBClient, foMyFunc;

type
  TEquipDetailForm = class(TForm)
    Panel2: TPanel;
    OkButton: TButton;
    Button1: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    NameEdit: TEdit;
    BusinessEdit: TEdit;
    Label5: TLabel;
    DisabledCheckBox: TCheckBox;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    ClientDataSet: TClientDataSet;
    DescrEdit: TMemo;
    procedure SpeedButton2Click(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BusinessEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  protected
    BusinessName:string;
    UnComplits:string;
    function CheckComplitInput : boolean;
    procedure  SaveData;
  public
    { Public declarations }
   Id:Variant;
   id_Business:Variant;
   procedure Init;
  end;

var
  EquipDetailForm: TEquipDetailForm;

implementation
       uses uDM, uFormsAPI_Admin, uListBoxesUtils;
{$R *.DFM}
procedure TEquipDetailForm.Init;
 var
  i:integer;
  S, SubS:string;
begin
  BusinessName:=DM.GetBusinessName(ID_Business);
  BusinessEdit.Text:=BusinessName;
 if Id<>-1 then
  with ClientDataSet do
   begin
    Params.ParamByName('Id').Value:=Id;
    Open;
    NameEdit.Text:=FieldByName('Name').AsString;
    BusinessEdit.Text:=FieldByName('BusinessName').AsString;
    s:=FieldByName('Descr').AsString;
    Id_Business:=FieldByName('Id_Business').AsInteger;
    DisabledCheckBox.Checked:=FieldByName('Disabled').Value;
  end;
      repeat
        i:=Pos(#10,S);
        if i=0 then
          SubS:=S
        else
          SubS:=Copy(S,1,i-1);
        DescrEdit.Lines.Add(SubS);
        S:=Copy(S,i+1,Length(S)-i);
      until i=0;
   if id_Business>-1 then
     begin
       DisableControl(BusinessEdit);
       SpeedButton2.Visible:=False;
     end;
end;

procedure TEquipDetailForm.SaveData;
var
  Act:Variant;
  New_Id:Integer;
begin
   if Id=-1 then
    Act:=0
   else
    Act:=1;
   New_Id:=DM.SocketConnection.AppServer.SetEquipDetail(
    Act,
    Id,
    NameEdit.Text,
    id_Business,
    GetStrFromMemo(DescrEdit),
    DisabledCheckBox.Checked
    );
    Id:=New_Id;
end;

procedure TEquipDetailForm.SpeedButton2Click(Sender: TObject);
var
 AID:Variant;
 AName:string;
begin
 AID:=id_Business;
 if GetBusinessForm(AID, AName, True, True, True) then
  begin
   BusinessEdit.Text:=AName;
   id_Business:=AID;
  end;
end;

procedure TEquipDetailForm.OkButtonClick(Sender: TObject);
begin
 if CheckComplitInput then
 begin
  SaveData;
  ModalResult:=mrOk;
 end;
end;

function TEquipDetailForm.CheckComplitInput : boolean;
begin
 Result:=True;
 UnComplits:='';
 OkButton.ModalResult:=mrOk;

 if BusinessEdit.Text='' then
    begin
      BusinessEdit.Color:=clRed;
      UnComplits:=UnComplits+#13#10+'"Бизнес"';
      BusinessEdit.SetFocus;
    end
    else
      BusinessEdit.Color:=clWindow;

 if NameEdit.Text='' then
    begin
      NameEdit.Color:=clRed;
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


procedure TEquipDetailForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if (Key=13) and (DescrEdit.Focused=False) then OkButton.Click;
// if Key=27 then ModalResult:=mrCancel;
end;

procedure TEquipDetailForm.BusinessEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=40) and (Shift=[ssAlt]) then
  SpeedButton2Click(nil);
end;

end.
