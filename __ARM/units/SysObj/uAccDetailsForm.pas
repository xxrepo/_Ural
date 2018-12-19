unit uAccDetailsForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Db, DBClient,uListBoxesUtils, foMyFunc,
  ComCtrls, RxLookup, DBCtrls, Grids, DBGrids;

type
  TAccDetailsForm = class(TForm)
    Panel1: TPanel;
    OkButton: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    NameEdit: TEdit;
    BankEdit: TEdit;
    Label6: TLabel;
    PrsnAccNameEdit: TEdit;
    CorrAccNameEdit: TEdit;
    INNEdit: TEdit;
    BIKEdit: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BusinessEdit: TEdit;
    SpeedButton3: TSpeedButton;
    ClientDataSet: TClientDataSet;
    DisabledCheckBox: TCheckBox;
    PageControl1: TPageControl;
    CurrTabSheet: TTabSheet;
    BusTabSheet: TTabSheet;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Panel5: TPanel;
    Label3: TLabel;
    AFListBox: TListBox;
    Panel6: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel7: TPanel;
    Label4: TLabel;
    SFListBox: TListBox;
    BusPanel: TPanel;
    Label17: TLabel;
    Panel8: TPanel;
    Splitter2: TSplitter;
    Panel9: TPanel;
    Label18: TLabel;
    BAFListBox: TListBox;
    Panel10: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Panel11: TPanel;
    Label19: TLabel;
    BSFListBox: TListBox;
    cbNeedSend: TCheckBox;
    cdsAccGroup: TClientDataSet;
    cdsAccGroupid_Group: TIntegerField;
    cdsAccGroupName: TStringField;
    cdsAccGroupCnt: TIntegerField;
    Bevel1: TBevel;
    Label13: TLabel;
    DataSource1: TDataSource;
    cbShowInRoot: TCheckBox;
    Edit2: TEdit;
    Button1: TButton;
    procedure SpeedButton3Click(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure AFListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure SFListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure BusinessEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure AFListBoxDblClick(Sender: TObject);
    procedure SFListBoxDblClick(Sender: TObject);
    procedure AFListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure AFListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BAFListBoxDblClick(Sender: TObject);
    procedure BSFListBoxDblClick(Sender: TObject);
    procedure BAFListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure BSFListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    LBCollection:TCollection;
    Bus_LBCollection:TCollection;
    function Getid_Group: Variant;
    procedure Setid_Group(const Value: Variant);
  protected
    FPID : Variant;
    UnComplits:string;
    function CheckComplitInput : boolean;
    procedure LoadCurrList;
    procedure LoadBusList;
    procedure SetEnablingOfButtons;
    procedure SetEnablingOfButtons_Bus;
    procedure SaveData;
  public
    { Public declarations }
    Id:Variant;
    ID_Business:integer;
    BusinessName:string;
    procedure  Init;

    property id_Group : Variant read Getid_Group write Setid_Group;
  end;

var
  AccDetailsForm: TAccDetailsForm;

implementation
       uses uDM, uFormsAPI_Admin, uFormApi_CA;

{$R *.DFM}
procedure  TAccDetailsForm.Init;
begin
 // FPID := -1;
  BusinessName:=DM.GetBusinessName(ID_Business);
  BusinessEdit.Text:=BusinessName;
  if Id<>-1 then
  with ClientDataSet do
   begin
    Params.ParamByName('Id').Value:=Id;
    Params.ParamByName('CallType').Value:=1;
    Open;
    NameEdit.Text:=FieldByName('Name').AsString;
    BankEdit.Text:=FieldByName('Bank').AsString;
    PrsnAccNameEdit.Text:=FieldByName('PrsnAccName').AsString;
    CorrAccNameEdit.Text:=FieldByName('CorrAccName').AsString;
    INNEdit.Text:=FieldByName('INN').AsString;
    BIKEdit.Text:=FieldByName('BIK').AsString;
    BusinessEdit.Text:=FieldByName('BusinessName').AsString;
    id_Business:=FieldByName('id_Business').Value;
    DisabledCheckBox.Checked:=FieldByName('Disabled').AsBoolean;
    cbNeedSend.Checked:=FieldByName('NeedSend').AsBoolean;
    cbShowInRoot.Checked:=FieldByName('ShowInRoot').AsBoolean;
   end
   else
     cbNeedSend.Checked:= true;

    if Id <> -1 then
    begin
      with cdsAccGroup do
      begin
        Close;
        Params.ParamByName('@id_business').Value := id_Business;
        Open;
        if Locate('id_Group', ClientDataSet.FieldByName('id_Acc_Group').AsVariant, []) then
        begin
          Edit2.Text := cdsAccGroupName.AsString;
          FPID := cdsAccGroupid_Group.AsInteger;
        end;
      end;
    end
    else
    begin
      with cdsAccGroup do
      begin
        Close;
        Params.ParamByName('@id_business').Value := id_Business;
        Open;
        if Locate('id_Group', FPID, []) then
        begin
          Edit2.Text := cdsAccGroupName.AsString;
      //    FPID := cdsAccGroupid_Group.AsInteger;
        end;
      end;
    end;

   if id_Business>-1 then
     begin
       DisableControl(BusinessEdit);
       SpeedButton3.Visible:=False;
     end;

     // Временно:
     BusTabSheet.TabVisible:=False;
     CurrTabSheet.TabVisible:=False;
     PageControl1.ActivePageIndex:=0;
     // End of "Временно:"
end;

procedure TAccDetailsForm.LoadCurrList;
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
        LB.Id:=FieldByName('Id_Currency').AsInteger;
        LB.Name:=FieldByName('CurrencyName').AsString;
        SFListBox.Items.Add(IntToStr(LBCollection.Count-1));
        Next;
      until EOF;

    Close;
    Params.ParamByName('CallType').Value:=3;
    Filter := 'id_Bsn=' + IntToStr(ID_Business);
    Filtered := true;
    Open;
     if not IsEmpty then
      repeat
        IsFound:=False;
          i:=0;
          if LBCollection.Count>0 then
          repeat
            if TLBItem(LBCollection.Items[i]).Id=FieldByName('Id_Currency').AsInteger
             then
              IsFound:=True;
            i:=i+1;
          until (IsFound) or (i>=LBCollection.Count);
        if not IsFound then
         begin
          LB:=TLBItem.Create(LBCollection);
          LB.Id:=FieldByName('Id_Currency').AsInteger;
          LB.Name:=FieldByName('Name').AsString;
          AFListBox.Items.Add(IntToStr(LBCollection.Count-1));
         end;
        Next;
      until EOF;
      Filtered := false;
   end;
 SetEnablingOfButtons;
end;

procedure TAccDetailsForm.LoadBusList;
 var
  LB:TLBItem;
  i:integer;
  IsFound:boolean;
begin
   with ClientDataSet do
   begin
    Close;
    Params.ParamByName('Id').Value:=Id;
    Params.ParamByName('CallType').Value:=4;
    Open;
     if not IsEmpty then
      repeat
        LB:=TLBItem.Create(Bus_LBCollection);
        LB.Id:=FieldByName('Id_Business').AsInteger;
        LB.Name:=FieldByName('BusinessName').AsString;
        BSFListBox.Items.Add(IntToStr(Bus_LBCollection.Count-1));
        Next;
      until EOF;

    Close;
    Params.ParamByName('CallType').Value:=5;
    Open;
     if not IsEmpty then
      repeat
        IsFound:=False;
          i:=0;
          if Bus_LBCollection.Count>0 then
          repeat
            if TLBItem(Bus_LBCollection.Items[i]).Id=FieldByName('Id_Business').AsInteger
             then
              IsFound:=True;
            i:=i+1;
          until (IsFound) or (i>=Bus_LBCollection.Count);
        if not IsFound then
         begin
          LB:=TLBItem.Create(Bus_LBCollection);
          LB.Id:=FieldByName('Id_Business').AsInteger;
          LB.Name:=FieldByName('Name').AsString;
          BAFListBox.Items.Add(IntToStr(Bus_LBCollection.Count-1));
         end;
        Next;
      until EOF;
   end;
SetEnablingOfButtons_Bus;
end;

procedure TAccDetailsForm.SpeedButton3Click(Sender: TObject);
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

procedure TAccDetailsForm.OkButtonClick(Sender: TObject);
begin
if CheckComplitInput then
 begin
  SaveData;
  ModalResult:=mrOk;
 end;
end;

procedure TAccDetailsForm.SaveData;
  var
  Ids:string;
  i:integer;
  vId:integer;
  Aid_Group: OleVariant;
  ShowInRoot: WordBool;
begin

//  Act, Id, AccName, Bank, id_Business,
//  PrsnAccName, CorrAccName, Inn, BIK, Disabled
   Aid_Group := id_Group;
  // if Aid_Group = -1 THEN Aid_Group := Null;
   vId:=DM.rsCA.AppServer.Acc_Edit(
    Id,
    NameEdit.Text,
    BankEdit.Text,
    id_Business,
    PrsnAccNameEdit.Text,
    CorrAccNameEdit.Text,
    INNEdit.Text,
    BIKEdit.Text,
    DisabledCheckBox.Checked,
    cbNeedSend.Checked,
    Aid_Group,
    cbShowInRoot.Checked
    );
  if Id=-1 then
    Id:=vId;
end;

procedure TAccDetailsForm.FormCreate(Sender: TObject);
begin
     LBCollection:=TCollection.Create(TLBItem);
     Bus_LBCollection:=TCollection.Create(TLBItem);
     ID_Business:=-1;
     BusinessName:='';
end;

procedure TAccDetailsForm.SpeedButton1Click(Sender: TObject);
begin
 MoveItems(AFListBox, SFListBox);
 SetEnablingOfButtons;
end;

procedure TAccDetailsForm.SpeedButton2Click(Sender: TObject);
begin
 MoveItems(SFListBox, AFListBox);
 SetEnablingOfButtons;
end;

procedure TAccDetailsForm.AFListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 AFListBox.Canvas.FillRect(Rect);
 AFListBox.Canvas.TextOut(Rect.Left,Rect.Top,TLBItem(LBCollection.Items[StrToInt(AFListBox.Items[Index])]).Name);
end;

procedure TAccDetailsForm.SFListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 SFListBox.Canvas.FillRect(Rect);
 SFListBox.Canvas.TextOut(Rect.Left,Rect.Top,TLBItem(LBCollection.Items[StrToInt(SFListBox.Items[Index])]).Name);
end;

function TAccDetailsForm.CheckComplitInput : boolean;
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

procedure TAccDetailsForm.BusinessEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=40) and (Shift=[ssAlt]) then
  SpeedButton3Click(nil);
end;

procedure TAccDetailsForm.SpeedButton4Click(Sender: TObject);
begin
 MoveAllItems(AFListBox, SFListBox);
 SetEnablingOfButtons;
end;

procedure TAccDetailsForm.SpeedButton5Click(Sender: TObject);
begin
 MoveAllItems(SFListBox,AFListBox);
 SetEnablingOfButtons;
end;

procedure TAccDetailsForm.AFListBoxDblClick(Sender: TObject);
begin
 MoveItems(AFListBox, SFListBox);
 SetEnablingOfButtons;
end;

procedure TAccDetailsForm.SFListBoxDblClick(Sender: TObject);
begin
 MoveItems(SFListBox,AFListBox);
 SetEnablingOfButtons;
end;

procedure TAccDetailsForm.AFListBoxDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  LBDragDrop(Sender, Source);
  SetEnablingOfButtons;
  SetEnablingOfButtons_Bus;
end;

procedure TAccDetailsForm.AFListBoxDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
 Accept := Source is TListBox;
end;

procedure  TAccDetailsForm.SetEnablingOfButtons;
begin
     SpeedButton1.Enabled:=AFListBox.Items.Count<>0;
     SpeedButton2.Enabled:=SFListBox.Items.Count<>0;
     SpeedButton4.Enabled:=AFListBox.Items.Count<>0;
     SpeedButton5.Enabled:=SFListBox.Items.Count<>0;
end;

procedure  TAccDetailsForm.SetEnablingOfButtons_Bus;
begin
     SpeedButton6.Enabled:=BAFListBox.Items.Count<>0;
     SpeedButton7.Enabled:=BSFListBox.Items.Count<>0;
     SpeedButton8.Enabled:=BAFListBox.Items.Count<>0;
     SpeedButton9.Enabled:=BSFListBox.Items.Count<>0;
end;

procedure TAccDetailsForm.SpeedButton6Click(Sender: TObject);
begin
 MoveItems(BAFListBox, BSFListBox);
 SetEnablingOfButtons_Bus;
end;

procedure TAccDetailsForm.SpeedButton7Click(Sender: TObject);
begin
 MoveItems(BSFListBox, BAFListBox);
 SetEnablingOfButtons_Bus;
end;

procedure TAccDetailsForm.SpeedButton8Click(Sender: TObject);
begin
 MoveAllItems(BAFListBox, BSFListBox);
 SetEnablingOfButtons_Bus;
end;

procedure TAccDetailsForm.SpeedButton9Click(Sender: TObject);
begin
 MoveAllItems(BSFListBox,BAFListBox);
 SetEnablingOfButtons_Bus;
end;

procedure TAccDetailsForm.BAFListBoxDblClick(Sender: TObject);
begin
 MoveItems(BAFListBox, BSFListBox);
 SetEnablingOfButtons_Bus;
end;

procedure TAccDetailsForm.BSFListBoxDblClick(Sender: TObject);
begin
 MoveItems(BSFListBox, BAFListBox);
 SetEnablingOfButtons_Bus;
end;

procedure TAccDetailsForm.BAFListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 BAFListBox.Canvas.FillRect(Rect);
 BAFListBox.Canvas.TextOut(Rect.Left,Rect.Top,TLBItem(Bus_LBCollection.Items[StrToInt(BAFListBox.Items[Index])]).Name);
end;

procedure TAccDetailsForm.BSFListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 BSFListBox.Canvas.FillRect(Rect);
 BSFListBox.Canvas.TextOut(Rect.Left,Rect.Top,TLBItem(Bus_LBCollection.Items[StrToInt(BSFListBox.Items[Index])]).Name);
end;

function TAccDetailsForm.Getid_Group: Variant;
begin
  if FPID > 0 then
    Result := FPID
  else
    Result := -1;
end;

procedure TAccDetailsForm.Setid_Group(const Value: Variant);
begin
  FPID := Value;
end;

procedure TAccDetailsForm.Button1Click(Sender: TObject);
var AID : Variant;
    AName : String;
begin
  AID := FPID;
  if SelectUnGroup(eotFinGroup, ID_Business, AID, AName, false, true) then
  begin
    FPID := AID;
    Edit2.Text := AName;
  end;
end;

end.
