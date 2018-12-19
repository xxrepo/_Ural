unit uWareHouseDetailForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Db, DBClient, foMyFunc, RxLookup;

type
  TWareHouseDetailForm = class(TForm)
    Panel1: TPanel;
    OkButton: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    NameEdit: TEdit;
    Label2: TLabel;
    Label6: TLabel;
    BusinessEdit: TEdit;
    SpeedButton2: TSpeedButton;
    ClientDataSet: TClientDataSet;
    AddrEdit: TMemo;
    DataSource1: TDataSource;
    Bevel1: TBevel;
    DBLookupComboBox1: TRxDBLookupCombo;
    Label13: TLabel;
    cdsWHGroup: TClientDataSet;
    cdsWHGroupid_Group: TIntegerField;
    cdsWHGroupName: TStringField;
    cdsWHGroupCnt: TIntegerField;
    cbNeedSend: TCheckBox;
    cbShowInRoot: TCheckBox;
    DisabledCheckBox: TCheckBox;
    procedure OkButtonClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BusinessEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function Getid_Group: Variant;
    procedure Setid_Group(const Value: Variant);
    { Private declarations }
  protected
    Fid_Group : integer;
    BusinessName:string;
    UnComplits:string;
    function CheckComplitInput : boolean;
    procedure  SaveData;
  public
    { Public declarations }
    Id:Variant;
    id_Business:Variant;
    procedure Init;
    property id_Group : Variant read Getid_Group write Setid_Group;
  end;

var
  WareHouseDetailForm: TWareHouseDetailForm;

implementation
     uses uDM, uFormsAPI_Admin, uListBoxesUtils;

{$R *.DFM}
procedure TWareHouseDetailForm.Init;
 var
  i:integer;
  S, SubS:string;
begin
  BusinessName:=DM.GetBusinessName(ID_Business);
  BusinessEdit.Text:=BusinessName;
  if Id<>-1 then
  with ClientDataSet  do
   begin
    Params.ParamByName('Id').Value:=Id;
    Open;
      NameEdit.Text:=FieldByName('Name').AsString;
      s:=FieldByName('Addr').AsString;
      BusinessEdit.Text:=FieldByName('BusinessName').AsString;
      id_Business:=FieldByName('id_Business').Value;
      DisabledCheckBox.Checked:=FieldByName('Disabled').Value;
      cbNeedSend.Checked:=FieldByName('NeedSend').AsBoolean;
      cbShowInRoot.Checked:=FieldByName('ShowInRoot').AsBoolean;
//    Close;
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

    with cdsWHGroup do
    begin
      Close;
      Params.ParamByName('@id_business').Value := id_Business;
      Open;
    end;
    if Id > -1 then
      DBLookupComboBox1.KeyValue := ClientDataSet.FieldByName('id_Warehouse_Group').AsString
    else
      DBLookupComboBox1.KeyValue := Fid_Group;

   if id_Business>-1 then
     begin
       DisableControl(BusinessEdit);
       SpeedButton2.Visible:=False;
     end;
end;

procedure TWareHouseDetailForm.SaveData;
var
  Act:Variant;
  New_Id:Integer;
  Aid_Group: OleVariant;
begin
   Aid_Group := id_Group;

   New_Id:=DM.rsCA.AppServer.WH_Edit(
    Id,
    NameEdit.Text,
    id_Business,
    GetStrFromMemo(AddrEdit),
    DisabledCheckBox.Checked,
    cbNeedSend.Checked,
    Aid_Group,
    cbShowInRoot.Checked
    );
   Id:=New_Id;
end;

procedure TWareHouseDetailForm.OkButtonClick(Sender: TObject);
begin
 if CheckComplitInput then
 begin
  SaveData;
  ModalResult:=mrOk;
 end;
end;

procedure TWareHouseDetailForm.SpeedButton2Click(Sender: TObject);
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

function TWareHouseDetailForm.CheckComplitInput : boolean;
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


procedure TWareHouseDetailForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if (Key=13) and (AddrEdit.Focused=False) then OkButton.Click;
// if Key=27 then ModalResult:=mrCancel;
end;

procedure TWareHouseDetailForm.BusinessEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=40) and (Shift=[ssAlt]) then
  SpeedButton2Click(nil);
end;

function TWareHouseDetailForm.Getid_Group: Variant;
begin
  if DBLookupComboBox1.KeyValue = '' then
    Result := Null
  else
    Result := DBLookupComboBox1.KeyValue;

end;

procedure TWareHouseDetailForm.Setid_Group(const Value: Variant);
begin
  Fid_Group := Value;
end;

end.
