unit uManufactDetailForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Db, DBClient, foMyFunc, RxLookup;

type
  TManufactDetailForm = class(TForm)
    Panel2: TPanel;
    OkButton: TButton;
    Button1: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    NameEdit: TEdit;
    BusinessEdit: TEdit;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    ClientDataSet: TClientDataSet;
    AddrEdit: TMemo;
    DBLookupComboBox1: TRxDBLookupCombo;
    Label13: TLabel;
    Bevel1: TBevel;
    cdsMNGroup: TClientDataSet;
    DataSource1: TDataSource;
    cbNeedSend: TCheckBox;
    cbShowInRoot: TCheckBox;
    DisabledCheckBox: TCheckBox;
    procedure SpeedButton2Click(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BusinessEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function Getid_Group: Variant;
    procedure Setid_Group(const Value: Variant);
    { Private declarations }
  protected
    BusinessName:string;
    UnComplits:string;
    function CheckComplitInput : boolean;
    procedure  SaveData;
  public
    { Public declarations }
   id_Business:Variant;
   Id:Variant;
   Fid_Group : Variant;
   procedure Init;
    property id_Group : Variant read Getid_Group write Setid_Group;
  end;

var
  ManufactDetailForm: TManufactDetailForm;

implementation
       uses uDM, uFormsAPI_Admin, uListBoxesUtils;
{$R *.DFM}

procedure TManufactDetailForm.Init;
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
//    AddrEdit.Text:=FieldByName('Addr').AsString;
    s:=FieldByName('Addr').AsString;
    Id_Business:=FieldByName('Id_Business').AsInteger;
    DisabledCheckBox.Checked:=FieldByName('Disabled').Value;
    cbNeedSend.Checked:=FieldByName('NeedSend').AsBoolean;
    cbShowInRoot.Checked:=FieldByName('ShowInRoot').AsBoolean;
  end
  else
    cbNeedSend.Checked:=true;
   repeat
      i:=Pos(#10,S);
      if i=0 then
        SubS:=S
      else
        SubS:=Copy(S,1,i-1);
      AddrEdit.Lines.Add(SubS);
      S:=Copy(S,i+1,Length(S)-i);
   until i=0;
    with cdsMNGroup do
    begin
      Close;
      Params.ParamByName('@id_business').Value := id_Business;
      Open;
    end;
    if Id > -1 then
      DBLookupComboBox1.KeyValue := ClientDataSet.FieldByName('id_Manufact_Group').AsString
    else
      DBLookupComboBox1.KeyValue := Fid_Group;

   if id_Business>-1 then
     begin
       DisableControl(BusinessEdit);
       SpeedButton2.Visible:=False;
     end;
end;

function TManufactDetailForm.Getid_Group: Variant;
begin
  if DBLookupComboBox1.KeyValue = '' then
    Result := Null
  else
    Result := DBLookupComboBox1.KeyValue;
end;

procedure TManufactDetailForm.Setid_Group(const Value: Variant);
begin
  Fid_Group := Value;
end;

procedure TManufactDetailForm.SaveData;
var
  New_Id:Integer;
  Aid_Group: OleVariant;
begin
   Aid_Group := id_Group;
                     
   New_Id:=DM.rsCA.AppServer.MN_Edit(
    Id,
    NameEdit.Text,
    id_Business,
    GetStrFromMemo(AddrEdit),//     AddrEdit.Text,
    DisabledCheckBox.Checked,
    cbNeedSend.Checked,
    Aid_Group,
    cbShowInRoot.Checked
    );
    Id:=New_Id;
end;

procedure TManufactDetailForm.SpeedButton2Click(Sender: TObject);
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

procedure TManufactDetailForm.OkButtonClick(Sender: TObject);
begin
 if CheckComplitInput then
 begin
  SaveData;
  ModalResult:=mrOk;
 end;
end;

function TManufactDetailForm.CheckComplitInput : boolean;
begin
 Result:=True;
 UnComplits:='';
 OkButton.ModalResult:=mrOk;
 if BusinessEdit.Text='' then
    begin
      BusinessEdit.Color:=redColor;
      UnComplits:=UnComplits+#13#10+'"Бизнес"';
      BusinessEdit.SetFocus;
    end
    else
      BusinessEdit.Color:=clWindow;

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


procedure TManufactDetailForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if (Key=13) and (AddrEdit.Focused=False) then OkButton.Click;
// if Key=27 then ModalResult:=mrCancel;
end;

procedure TManufactDetailForm.BusinessEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=40) and (Shift=[ssAlt]) then
  SpeedButton2Click(nil);
end;

end.
