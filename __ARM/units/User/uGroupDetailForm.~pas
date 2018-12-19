unit uGroupDetailForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Db, DBClient,uListBoxesUtils, Grids,
  ComCtrls, ToolWin, ActnList, ImgList, DBGrids, RXDBCtrl, frObjList;

type
  TFBItem = class(TCollectionItem)
  public
   F_Id:Integer;
   B_Id:Integer;
   F_Name:string;
   B_Name:string;
  end;

  TGroupDetailForm = class(TForm)
    Panel1: TPanel;
    OkButton: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    NameEdit: TEdit;
    Panel3: TPanel;
    Label2: TLabel;
    ImageList: TImageList;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    Label5: TLabel;
    DisabledCheckBox: TCheckBox;
    cdsBsn: TClientDataSet;
    cdsBsnid_business: TIntegerField;
    cdsBsnName: TStringField;
    dsBsn: TDataSource;
    Splitter1: TSplitter;
    cdsGroupRights: TClientDataSet;
    dsGroupRights: TDataSource;
    RxDBGrid2: TRxDBGrid;
    cdsGroupRightsid_Func: TAutoIncField;
    cdsGroupRightsFuncName: TStringField;
    cdsGroupRightsHas: TIntegerField;
    Panel4: TPanel;
    ClientDataSet: TClientDataSet;
    ToolBar: TToolBar;
    ToolButton2: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    RightsGrid: TRxDBGrid;
    cdsPermitGetListAcc: TClientDataSet;
    fObjListAcc: TfObjList;
    fObjListCA: TfObjList;
    cdsPermitGetListAccid_Permit: TAutoIncField;
    cdsPermitGetListAccid_Group: TIntegerField;
    cdsPermitGetListAccid_Acc: TIntegerField;
    cdsPermitGetListAccid_Acc_Group: TIntegerField;
    cdsPermitGetListAccid_ContrAgent: TIntegerField;
    cdsPermitGetListAccid_CAGroup: TIntegerField;
    cdsPermitGetListAccName: TStringField;
    procedure OkButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AFListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dsBsnDataChange(Sender: TObject; Field: TField);
    procedure aEditExecute(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
  private
    procedure GetFuncRates;
    { Private declarations }
  protected
    UnComplits:string;
    FId:Variant;
    function CheckComplitInput : boolean;
    procedure  SaveData;
  public
    procedure  Init(AId:Variant);

    property ID : Variant read FID;
  end;

var
  GroupDetailForm: TGroupDetailForm;

implementation
   uses uDM, uUsersDetailFormsAPI, foMyFunc;
{$R *.DFM}

procedure  TGroupDetailForm.Init(AId:Variant);
begin
  TabSheet2.TabVisible := DM.DefB_APN <= 0;
  TabSheet3.TabVisible := DM.DefB_APN <= 0;
  PageControl1.ActivePageIndex := 0;
  FId := AId;
  aEdit.Enabled := FId <> -1;
  if Id<>-1 then
  with ClientDataSet do
   begin
    Params.ParamByName('Id').Value:=Id;
    Params.ParamByName('CallType').Value:=1;
    Open;
    NameEdit.Text:=FieldByName('Name').AsString;
    DisabledCheckBox.Checked:=FieldByName('Disabled').Value;
   end;
  with cdsBsn do
  begin
    Close;
    Params.ParamByName('@UID').Value := Null;
    Params.ParamByName('@id_User').Value := Null;//DM.IDUser;
    Open;
  end;
end;


procedure  TGroupDetailForm.SaveData;
  var
  Act:Variant;
  i:integer;
  vId:integer;
  B_Id, F_Id:integer;
  AEObjType: TEObjType;
begin
   if Id=-1 then
    Act:=0
   else
    Act:=1;

  vId:=DM.rsCA.AppServer.SetGroupDetail(
    Act,
    Id,
    NameEdit.Text,
    DisabledCheckBox.Checked);
  if Id = -1 then
    FID := vId;


end;

procedure TGroupDetailForm.OkButtonClick(Sender: TObject);
begin
 if CheckComplitInput then
 begin
  SaveData;
  ModalResult:=mrOk;
 end;
end;

function TGroupDetailForm.CheckComplitInput : boolean;
begin
 Result:=True;
 UnComplits:='';
 OkButton.ModalResult:=mrOk;
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


procedure TGroupDetailForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if Key=13 then OkButton.Click;
// if Key=27 then ModalResult:=mrCancel;
end;

procedure TGroupDetailForm.AFListBoxDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
 Accept := Source is TListBox;
end;

procedure TGroupDetailForm.dsBsnDataChange(Sender: TObject; Field: TField);
begin
  GetFuncRates;
end;

procedure TGroupDetailForm.GetFuncRates;
begin
  with cdsGroupRights do
  begin
    Close;
    Params.ParamByName('@id_Group').Value := Id;
    Params.ParamByName('@id_Business').Value := cdsBsnid_business.Value;
    Params.ParamByName('@Has').Value := true ;
    Open;
  //  RightsGrid.Visible := not IsEmpty;

  end;
  if DM.DefB_APN <= 0 then
  begin
      fObjListAcc.Initialize([], -1, 40, false);
      fObjListAcc.Initialize([eotFin, eotFinGroup], cdsBsnid_business.Value, 40, false);
      fObjListAcc.ToolBar1.Visible := false;
      fObjListAcc.RxDBGrid1.PopupMenu := nil;
      fObjListAcc.RxDBGrid1.OnDblClick := nil;

      fObjListCA.Initialize([], -1, 40, false);
      fObjListCA.Initialize([eotCA, eotCAGroup], cdsBsnid_business.Value, 40, false);
      fObjListCA.ToolBar1.Visible := false;
      fObjListCA.RxDBGrid1.PopupMenu := nil;
      fObjListCA.RxDBGrid1.OnDblClick := nil;

    with cdsPermitGetListAcc do
    begin
      Close;
      Params.ParamByName('@id_Group').Value := Id;
      Params.ParamByName('@CA').Value := true;
      Params.ParamByName('@Acc').Value := true ;
      Params.ParamByName('@id_Business').Value := cdsBsnid_business.Value;
    
      Open;
      First;
      while not eof do
      begin

        if not cdsPermitGetListAccid_Acc.IsNull then
          fObjListAcc.AddID(eotFin, cdsPermitGetListAccid_Acc.AsInteger);
        if not cdsPermitGetListAccid_Acc_Group.IsNull then
          fObjListAcc.AddID(eotFinGroup, cdsPermitGetListAccid_Acc_Group.AsInteger);


        if not cdsPermitGetListAccid_ContrAgent.IsNull then
          fObjListCA.AddID(eotCA, cdsPermitGetListAccid_ContrAgent.AsInteger);
        if not cdsPermitGetListAccid_CAGroup.IsNull then
          fObjListCA.AddID(eotCAGroup, cdsPermitGetListAccid_CAGroup.AsInteger);
        Next;
      end;
    //  RightsGrid.Visible := not IsEmpty;
    end;
  end;
end;

procedure TGroupDetailForm.aEditExecute(Sender: TObject);
begin
  if ShowBusFuncForm(Id, cdsBsnid_business.Value) then
  begin
    GetFuncRates;
  end;
end;

procedure TGroupDetailForm.RxDBGrid2DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aEdit.Execute;

end;

end.
