unit uCASelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frCaNavigator, db,
  foMyFunc;

type
  TCASelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fCaNavigator1: TfCaNavigator;
    Panel1: TPanel;
    lbCA: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure fCntrAgentList1dsCAgentDataChange(Sender: TObject;
      Field: TField);
  private
    OldMessageEvent : TMessageEvent;
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  end;

function SelectCA(AOwner : TObject; var ASelectedObj : TSelectedObj; ADisabled, Aid_Bsn : Variant;
                       UID : integer) : boolean;
var
  CASelector: TCASelector;

implementation

uses uMainForm, uDM;

function SelectCA(AOwner : TObject; var ASelectedObj : TSelectedObj; ADisabled, Aid_Bsn : Variant;
                       UID : integer) : boolean;
var F : TCASelector;
    ID : Variant;
    isOwn : WordBool;
    id_CAGroup : OleVariant;
begin
  Result := false;
  F := TCASelector.Create(MainForm);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
     F.Label2.Caption := 'Выберите контрагента';
    ID := ASelectedObj.ID;
    if Aid_Bsn = Null then Aid_Bsn := -13;
    if ASelectedObj.ID <> Null then
    begin
      F.fCaNavigator1.Initialize(ID, Null, ADisabled, Null, false, true, UID, false);
    end
    else
      F.fCaNavigator1.Initialize(ID, Aid_Bsn, ADisabled, Null, false, true, UID, false);

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := true;
      //*** Заполняем структуру результата ***
      ASelectedObj.ID := F.fCaNavigator1.CA_ID;
//      ASelectedObj.RealName := F.fCaNavigator1.CA_Name;
      ASelectedObj.Name := F.fCaNavigator1.CA_Name;
      ASelectedObj.Bsn_id := F.fCaNavigator1.id_Bsn;
      ASelectedObj.ObjType := eotCA;
    end;
  finally
    F.Free;
  end;
end;

{$R *.DFM}

{ TCASelector }


procedure TCASelector.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TCASelector.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);

end;

constructor TCASelector.Create(AOwner: TComponent);
begin
  inherited;
  lbCA.Caption := '';
  OldMessageEvent := Application.OnMessage;
  Application.OnMessage := AppMessage;
end;

destructor TCASelector.Destroy;
begin
  Application.OnMessage := OldMessageEvent;
  inherited;      
end;

procedure TCASelector.AppMessage(var Msg: TMsg; var Handled: Boolean);
var R : boolean;
begin
  if Msg.message = WM_LBUTTONDBLCLK then
  begin
    R := (ActiveControl = fCaNavigator1.fCntrAgentList1.RxDBGrid1);
    if R then
    begin
      Handled := True;
      btnOk.Click;
    end;
  end;
end;

procedure TCASelector.fCntrAgentList1dsCAgentDataChange(Sender: TObject;
  Field: TField);
begin
  fCaNavigator1.fCntrAgentList1dsCAgentDataChange(Sender, Field);
  btnOk.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
  if not (Sender as TDataSource).DataSet.IsEmpty then
    lbCA.Caption := 'Выбран контрагент ' + (Sender as TDataSource).DataSet.fieldByName('Name').AsString
  else
    lbCA.Caption := '';
end;

end.
