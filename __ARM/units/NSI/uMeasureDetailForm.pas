unit uMeasureDetailForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Db, DBClient, foMyFunc,
  uListBoxesUtils;

type
  TMeasureDetailForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    OkButton: TButton;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    NameEdit: TEdit;
    ShortNameEdit: TEdit;
    BaseEdit: TEdit;
    BaseMeasureSpeedButton: TSpeedButton;
    KoefEdit: TRxCalcEdit;
    DisabledCheckBox: TCheckBox;
    ClientDataSet: TClientDataSet;
    Label6: TLabel;
    BusinessEdit: TEdit;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    edOKEI: TEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure BaseMeasureSpeedButtonClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BaseEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  protected
    LBCollection:TCollection;
    UnComplits:string;
    procedure SetEnablingOfButtons;
    function CheckComplitInput : boolean;
    procedure SaveData;
    procedure LoadGroupsList;
  public
    { Public declarations }
    id_Business:Variant;
   Id:Variant;
   id_BaseMeasure:Variant;
   procedure Init;

  end;

var
  MeasureDetailForm: TMeasureDetailForm;

implementation
     uses uDM, uFormsAPI_Admin, uMeasureSelector;
{$R *.DFM}

procedure TMeasureDetailForm.Init;
var i : integer;
begin         
 BaseEdit.ReadOnly := true;
 BaseEdit.Color := clInactiveBorder;
 if id_BaseMeasure=NULL then
  begin
  DisableControl(KoefEdit);
  end
 else
  begin

  end;
  if Id<>-1 then
  with ClientDataSet do
   begin
    Params.ParamByName('Id').Value:=Id;
    Params.ParamByName('CallType').Value:=1;
    Open;
      NameEdit.Text:=FieldByName('Name').AsString;
      ShortNameEdit.Text:=FieldByName('ShortName').AsString;
      BaseEdit.Text:=FieldByName('BaseName').AsString;
      id_BaseMeasure:=FieldByName('id_BaseMeasure').Value;
      KoefEdit.Value:=FieldByName('Koef').Value;
      DisabledCheckBox.Checked:=FieldByName('Disabled').Value;
      edOKEI.Text :=FieldByName('OKEI').AsString;
      if ClientDataSet.FieldByName('id_Business').AsInteger <> 0 then
        id_Business:=FieldByName('id_Business').AsInteger;
   end;
   LoadGroupsList;


end;

procedure  TMeasureDetailForm.SaveData;
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
  vId:=DM.rsCA.AppServer.SetMeasureDetail(
    Act,
    Id,
    NameEdit.Text,
    ShortNameEdit.Text,
    id_BaseMeasure,
    id_Business, // Не актуаьно
    KoefEdit.Value,
    DisabledCheckBox.Checked, edOKEI.Text
    );
  if Id=-1 then
    Id:=vId;
  Ids:=inttostr(id_Business) + ',';
  DM.rsCA.AppServer.SetMeasureBusiness(Id, Ids);
  Id:=vId;
end;

procedure TMeasureDetailForm.OkButtonClick(Sender: TObject);
begin
 if CheckComplitInput then
 begin
  SaveData;
  ModalResult:=mrOk;
 end;
end;

procedure TMeasureDetailForm.BaseMeasureSpeedButtonClick(Sender: TObject);
var
 AID:Variant;
 AName:string;
begin
 AID:=id_BaseMeasure;
 if GetMeasuresForm(NULL, AID, AName, True, True, True, True) then
  begin
   BaseEdit.Text:=AName;
   id_BaseMeasure:=AID;
  end;
end;

procedure TMeasureDetailForm.SpeedButton2Click(Sender: TObject);
var
 AID:Variant;
 AName:string;
begin
 AID:=id_Business;
 if GetBusinessForm( AID, AName, True, True, True) then
  begin
   BusinessEdit.Text:=AName;
   id_Business:=AID;
  end;
end;

procedure  TMeasureDetailForm.LoadGroupsList;
 var
  LB:TLBItem;
  i:integer;
  IsFound:boolean;
begin
  { with ClientDataSet do
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
SetEnablingOfButtons;    }
end;

function TMeasureDetailForm.CheckComplitInput : boolean;
begin
 Result:=True;
 UnComplits:='';
 OkButton.ModalResult:=mrOk;

 {if  (KoefEdit.Text='') and (BaseEdit.Text<>'') then
    begin
      KoefEdit.Color:=redColor;
      UnComplits:=UnComplits+#13#10+'"Коэффициент"';
      KoefEdit.SetFocus;
    end
    else
      KoefEdit.Color:=clWindow;

 if ShortNameEdit.Text='' then
    begin
      ShortNameEdit.Color:=redColor;
      UnComplits:=UnComplits+#13#10+'"Краткое наименование"';
      ShortNameEdit.SetFocus;
    end
    else
      ShortNameEdit.Color:=clWindow;
                     }
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

procedure TMeasureDetailForm.BaseEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=40) and (Shift=[ssAlt]) then
  BaseMeasureSpeedButtonClick(nil);
end;

procedure TMeasureDetailForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then OkButton.Click;
 if Key=27 then ModalResult:=mrCancel;
end;

procedure  TMeasureDetailForm.SetEnablingOfButtons;
begin
end;

end.
