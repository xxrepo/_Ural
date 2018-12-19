unit uUnivSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  foMyFunc, StdCtrls, ExtCtrls, ActnList, frEForm, comctrls, RxHook;

type
  TUnivSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    ActionList1: TActionList;
    aOk: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    fEForm1: TfEForm;
    procedure FormDestroy(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure fEForm1TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormShow(Sender: TObject);
    procedure RxWindowHook1BeforeMessage(Sender: TObject;
      var Msg: TMessage; var Handled: Boolean);
  private
    Fid_Bsn : Variant;
    FDisabled : Variant;
    OldMessageEvent : TMessageEvent;
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  end;

var
  UnivSelector: TUnivSelector;


function SelectObjUn(AOwner : TObject; UID : Variant; var ASelectedObj : TSelectedObj; Disabled : Variant; AEObjTypes: TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, eotCA, eotRepr, eotGoods]; AShowAllBsn : boolean = true) : boolean;
function SelectObjUnBsn(AOwner : TObject; id_Bsn : integer; var ASelectedObj : TSelectedObj; Disabled : Variant; AEObjTypes: TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, eotCA, eotRepr, eotGoods]; AShowAllBsn : boolean = true;
                        AID_WareHouse: integer = -1) : boolean;

implementation

uses uMainForm, uDM;

function SelectObjInt(AOwner : TObject; id_Bsn : Variant; UID : Variant; var ASelectedObj : TSelectedObj; Disabled : Variant; AEObjTypes: TEObjTypes; AShowAllBsn : boolean; AID_WareHouse: Variant) : boolean;
var F : TUnivSelector;
    SL : TStringList;
    S : String;
    i : integer;
    C : TWinControl;
begin
  HideEObjTypes(AEObjTypes);
  SL := TStringList.Create;
  try
    if eotFin in AEObjTypes then
      SL.Add('счет');
    if eotWH in AEObjTypes then
      SL.Add('склад');
    if eotManuf in AEObjTypes then
      SL.Add('производство');
    if eotCA in AEObjTypes then
      SL.Add('конитрагента');
    if eotRepr in AEObjTypes then
      SL.Add('представителя контрагента');
    if eotGoods in AEObjTypes then
      SL.Add('товар');

    S := 'Выберите ';
    for i := 0 to SL.Count - 1 do
    begin
      if i = 0 then
        S := S + SL[i]
      else
        if i = SL.Count - 1 then
          S := S + ' или ' + SL[i]
        else
          S := S + ', ' + SL[i];
    end;
  finally
    SL.Free;
  end;
  Result := false;
  F := TUnivSelector.Create(MainForm);
  try
    if AOwner is TWinControl then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, TWinControl(AOwner).Handle);
     if id_Bsn = -1 then
      F.fEForm1.Initialize2(ASelectedObj, UID, Disabled, AEObjTypes)
    else
    begin
      if AID_WareHouse <> Null then
        F.fEForm1.Initialize_WH(ASelectedObj, id_Bsn, Disabled, AID_WareHouse, AEObjTypes)
      else
        F.fEForm1.Initialize(ASelectedObj, id_Bsn, Disabled, AEObjTypes);
    end;
    
    F.Label2.Caption := S;
    F.ActiveControl := nil;

    if F.fEForm1.fWareGoods <> nil then
      SetFocus(F.fEForm1.fWareGoods.FilterEdit.Handle)
    else
      SetFocus(F.btnOk.Handle);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := true;
      //*** Заполняем структуру результата ***
      ASelectedObj.ID := F.fEForm1.SelObjID;
//      ASelectedObj.RealName := F.fEForm1.SelObjName;
      ASelectedObj.Name := F.fEForm1.SelObjName;
      ASelectedObj.ObjType := F.fEForm1.SelObjType;
      if (ASelectedObj.ObjType = eotRepr) then
      begin
        ASelectedObj.CA_Name := F.fEForm1.fCaNavigator.fReprList1.cdsPeprCAName.Value;
        ASelectedObj.CA_ID := F.fEForm1.fCaNavigator.fReprList1.cdsPeprid_ContrAgent.Value;

    //    ASelectedObj.Name := ASelectedObj.CA_Name + '/' + F.fEForm1.SelObjName;
      end;
      if (ASelectedObj.ObjType = eotGoods) then
      begin
        if F.fEForm1.fWareGoods.WareCatID <> Null then
          ASelectedObj.id_Cat := F.fEForm1.fWareGoods.WareCatID;
      end;
      if VarToStr(ASelectedObj.CA_Name) = '' then
        ASelectedObj.CA_Name := Null;
      ASelectedObj.Bsn_id := F.fEForm1.GetBsn_v2;
      if ASelectedObj.Bsn_id = -1 then
        ASelectedObj.Bsn_id := Null;
      ASelectedObj.Bsn_Name := F.fEForm1.GetBsnName;
      //*** *** *** *** *** *** *** *** *** *** ***
    end;
  finally
    F.Free;
  end;
end;

function SelectObjUnBsn(AOwner : TObject; id_Bsn : integer; var ASelectedObj : TSelectedObj; Disabled : Variant; AEObjTypes: TEObjTypes; AShowAllBsn : boolean;
                        AID_WareHouse: integer) : boolean;
var ID_WareHouse: Variant;
begin
  if AID_WareHouse = -1 then
    ID_WareHouse := Null
  else
    ID_WareHouse := AID_WareHouse;
  Result := SelectObjInt(AOwner, id_Bsn, Null, ASelectedObj, {Disabled} 0, AEObjTypes, AShowAllBsn, ID_WareHouse);
end;

function SelectObjUn(AOwner : TObject; UID : Variant; var ASelectedObj : TSelectedObj; Disabled : Variant; AEObjTypes: TEObjTypes; AShowAllBsn : boolean) : boolean;
begin
  Result := SelectObjInt(AOwner, -1, UID, ASelectedObj, {Disabled} 0, AEObjTypes, AShowAllBsn, Null);
end;

{$R *.DFM}

{ TEForm }


constructor TUnivSelector.Create(AOwner: TComponent);
//var V : Variant;
begin
  inherited;
  OldMessageEvent := Application.OnMessage;
  Application.OnMessage := AppMessage;

//  FOldWinProc := fEForm1.WindowProc;
//  fEForm1.WindowProc := WBWndMethod;
end;

destructor TUnivSelector.Destroy;
begin
  Application.OnMessage := OldMessageEvent;
  inherited;
end;

procedure TUnivSelector.FormDestroy(Sender: TObject);
begin
  UnivSelector := nil;
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TUnivSelector.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
//  Close;
end;

procedure TUnivSelector.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
var S : String;
begin
//  aOk.Enabled := (fEForm1.SelObjType in fEForm1.EObjTypes);
  if fEForm1.isNeedObjSelected then
  begin
    case fEForm1.SelObjType of
      eotFin : S := 'Выбран счет';
      eotWH : S := 'Выбран склад';
      eotManuf : S := 'Выбрано производство';
      eotCA : S := 'Выбран контрагент';
      eotRepr : S := 'Выбран представитель контрагента';
      eotGoods : S := 'Выбран товар';
      eotSimplRepr : S := 'Выбран представитель';
    end;
    S := S + ' ' + fEForm1.SelObjName;
  end
  else
  begin
    S := 'Ничего не выбрано';
  end;
  if Label1.Caption <> S then
    Label1.Caption := S;
  aOk.Enabled := fEForm1.isNeedObjSelected;
end;

procedure TUnivSelector.FormCreate(Sender: TObject);
begin
  Label1.Caption := '';
end;

procedure TUnivSelector.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and not ((ActiveControl is TCustomComboBox) or (ActiveControl is TCustomComboBox))then
  begin
    Key := #0;
    aOk.Execute;
  end;
end;

procedure TUnivSelector.fEForm1TreeView1Change(Sender: TObject;
  Node: TTreeNode);
var S : String;
begin
  fEForm1.TrChange(Sender, Node);
  S := fEForm1.GetBsnName;
  Caption := 'Объекты бизнеса';
  if S <> '' then
    Caption := Caption + ': ' + S;
end;

procedure TUnivSelector.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
  btnOk.Left := Panel2.Width - 185;
  btnCancel.Left := Panel2.Width - 94;
end;

procedure TUnivSelector.RxWindowHook1BeforeMessage(Sender: TObject;
  var Msg: TMessage; var Handled: Boolean);
begin
  if (Msg.Msg = WM_MBUTTONDBLCLK) then
  begin
   tag := 0;
   Msg.Result := 1;
  end;
end;

procedure TUnivSelector.AppMessage(var Msg: TMsg; var Handled: Boolean);
var R : boolean;
begin
  if Msg.message = WM_LBUTTONDBLCLK then
  begin
    case fEForm1.SelObjType of
      eotFin :
      begin
        R := (ActiveControl = fEForm1.AccsFrame1.RxDBGrid1);
      end;
      eotWH :
      begin
        R := (ActiveControl = fEForm1.WareHouseFrame1.RxDBGrid1);
      end;
      eotManuf :
      begin
        R := (ActiveControl = fEForm1.ManufactFrame1.RxDBGrid1);
      end;
      eotCA :
      begin
        R := (ActiveControl = fEForm1.fCaNavigator.fCntrAgentList1.RxDBGrid1);
      end;
      eotRepr :
      begin
        R := (ActiveControl = fEForm1.fCaNavigator.fReprList1.RxDBGrid1) or (ActiveControl = fEForm1.fCaNavigator.fCntrAgentList1.RxDBGrid1);
      end;
      eotSimplRepr :
      begin
        R := (ActiveControl = fEForm1.fReprList1.RxDBGrid1); 
      end;
      eotGoods :
      begin
        R := (ActiveControl = fEForm1.fWareGoods.grdList);
      end;
    end;

    if R then
    begin
      Handled := True;
      aOk.Execute;
    end;
  end;
end;

end.
