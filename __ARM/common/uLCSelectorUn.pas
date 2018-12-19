unit uLCSelectorUn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  foMyFunc, StdCtrls, ExtCtrls, ActnList, frLCEntFrame;

type
  TLCSelectorUn = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    ActionList1: TActionList;
    aOk: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    fLCEntFrame1: TfLCEntFrame;
    procedure FormDestroy(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    Fid_Bsn : Variant;
    FDisabled : Variant;
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  public
  end;

var
  LCSelectorUn: TLCSelectorUn;

  function SelectObjUnLC(UID : Variant; var ASelectedObj : TSelectedObj; Disabled : Variant; AEObjTypes: TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, {eotOwnCA, eotOwnRepr,} eotCA, eotRepr, eotGoods]; AID_WareHouse: integer = -1; AShowAllBsn : boolean = true) : boolean;
  function SelectObjUnLCBsn(id_Bsn : integer; var ASelectedObj : TSelectedObj; Disabled : Variant; AEObjTypes: TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, {eotOwnCA, eotOwnRepr,} eotCA, eotRepr, eotGoods]; AID_WareHouse: integer = -1; AShowAllBsn : boolean = true) : boolean;

implementation

uses uMainForm, uDM, frCaNavigator;

function SelectObjUnLCInt(id_Bsn : integer; UID : Variant; var ASelectedObj : TSelectedObj; Disabled : Variant; AEObjTypes: TEObjTypes;
                          AID_WareHouse: integer; AShowAllBsn : boolean = true) : boolean;
var F : TLCSelectorUn;
    SL : TStringList;
    S : String;
    i : integer;
begin
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
      SL.Add('представителя');
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
  F := TLCSelectorUn.Create(MainForm);
  try
    if id_Bsn = -1 then
      F.fLCEntFrame1.Initialize2(ASelectedObj, UID, Disabled, AEObjTypes, false, AShowAllBsn, AID_WareHouse)
    else
    begin
      if AID_WareHouse <> Null then
        F.fLCEntFrame1.Initialize_WH(ASelectedObj, id_Bsn, Disabled, AEObjTypes, AShowAllBsn, true, AID_WareHouse)
      else
        F.fLCEntFrame1.Initialize(ASelectedObj, id_Bsn, Disabled, AEObjTypes, AShowAllBsn, true);
    end;

    F.Label2.Caption := S;

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := true;
      //*** Заполняем структуру результата ***
      ASelectedObj.ID := F.fLCEntFrame1.SelObjID;
      ASelectedObj.Name := F.fLCEntFrame1.SelObjName;
      ASelectedObj.ObjType := F.fLCEntFrame1.SelObjType;

      ASelectedObj.Bsn_id := F.fLCEntFrame1.GetBsn;
      if ASelectedObj.Bsn_id = -1 then
        ASelectedObj.Bsn_id := Null;
      ASelectedObj.Bsn_Name := F.fLCEntFrame1.GetBsnName;
      //*** *** *** *** *** *** *** *** *** *** ***
      if VarToStr(ASelectedObj.CA_Name) = '' then
        ASelectedObj.CA_Name := Null;
      if (ASelectedObj.ObjType = eotRepr) then
      begin
        ASelectedObj.CA_Name := F.fLCEntFrame1.fCaNavigator1.fReprList1.cdsPeprCAName.Value;
        ASelectedObj.CA_ID := F.fLCEntFrame1.fCaNavigator1.fReprList1.cdsPeprid_ContrAgent.Value;

    //    ASelectedObj.Name := ASelectedObj.CA_Name + '/' + F.fEForm1.SelObjName;
      end;
    end;
  finally
    F.Free;
  end;
end;

function SelectObjUnLC(UID : Variant; var ASelectedObj : TSelectedObj; Disabled : Variant; AEObjTypes: TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, eotCA, eotRepr, eotGoods]; AID_WareHouse: integer = -1; AShowAllBsn : boolean = true) : boolean;
var ID_WareHouse: Variant;
begin

  Result := SelectObjUnLCInt(-1, UID, ASelectedObj, Disabled, AEObjTypes, AID_WareHouse, AShowAllBsn);
end;

function SelectObjUnLCBsn(id_Bsn : integer; var ASelectedObj : TSelectedObj; Disabled : Variant; AEObjTypes: TEObjTypes = [eotBsn, eotFin, eotWH, eotManuf, eotCA, eotRepr, eotGoods]; AID_WareHouse: integer = -1; AShowAllBsn : boolean = true) : boolean;
var ID_WareHouse: Variant;
begin
      {$IFDEF ACS_v2}
        if ASelectedObj.ObjType = eotSimplRepr then
        begin
          ASelectedObj.ObjType := eotRepr;
        end;
        if eotSimplRepr in AEObjTypes then
        begin
          AEObjTypes := AEObjTypes - [eotSimplRepr];
          AEObjTypes := AEObjTypes + [eotRepr];
        end;
       {$ENDIF}
  if AID_WareHouse = -1 then
    ID_WareHouse := Null
  else
    ID_WareHouse := AID_WareHouse;
  Result := SelectObjUnLCInt(id_Bsn, Null, ASelectedObj, Disabled, AEObjTypes, AID_WareHouse, AShowAllBsn);
end;
{$R *.DFM}

{ TEForm }


procedure TLCSelectorUn.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
  LCSelectorUn := nil;
end;

procedure TLCSelectorUn.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
//  Close;
end;

procedure TLCSelectorUn.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
var S : String;
begin
//  aOk.Enabled := (fEForm1.SelObjType in fEForm1.EObjTypes);
  if fLCEntFrame1.isNeedObjSelected then
  begin
    case fLCEntFrame1.SelObjType of
      eotFin : S := 'Выбран счет';
      eotWH : S := 'Выбран склад';
      eotManuf : S := 'Выбрано производство';
      eotCA : S := 'Выбран контрагент';
      eotRepr : S := 'Выбран представитель';
//      eotCatalog : S := 'Выбран каталог';
      eotGoods : S := 'Выбран товар';
      eotSimplRepr : S := 'Выбран представитель';
    end;
    S := S + ' ' + fLCEntFrame1.SelObjName;
  end
  else
  begin
    S := 'Ничего не выбрано';
  end;
  if Label1.Caption <> S then
    Label1.Caption := S;
  aOk.Enabled := fLCEntFrame1.isNeedObjSelected;
end;

procedure TLCSelectorUn.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TLCSelectorUn.AppMessage(var Msg: TMsg; var Handled: Boolean);
var R : boolean;
begin
  if Msg.message = WM_LBUTTONDBLCLK then
  begin
    case fLCEntFrame1.SelObjType of
      eotFin :
      begin
        R := (ActiveControl = fLCEntFrame1.fAccList1.RxDBGrid1);
      end;
      eotWH :
      begin
        R := (ActiveControl = fLCEntFrame1.fWHList1.RxDBGrid1);
      end;
      eotManuf :
      begin
        R := (ActiveControl = fLCEntFrame1.fManufactList1.RxDBGrid1);
      end;
      eotCA :
      begin
        R := (ActiveControl = fLCEntFrame1.fCaNavigator1.fCntrAgentList1.RxDBGrid1);
      end;
      eotRepr :
      begin
        R := (ActiveControl = fLCEntFrame1.fCaNavigator1.fReprList1.RxDBGrid1);
      end;
      eotSimplRepr :
      begin
        R := (ActiveControl = fLCEntFrame1.fReprListLC1.RxDBGrid1);
      end;
      eotGoods :
      begin
        R := (ActiveControl = fLCEntFrame1.fWareGoods.grdList);
      end;
    end;

    if R then
    begin
      Handled := True;
      aOk.Execute;
    end;
  end;
end;

constructor TLCSelectorUn.Create(AOwner: TComponent);
begin
  inherited;
  Application.OnMessage := AppMessage;
end;

destructor TLCSelectorUn.Destroy;
begin
  Application.OnMessage := nil;
  inherited;
end;

procedure TLCSelectorUn.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and not ((ActiveControl is TCustomComboBox) or (ActiveControl is TCustomComboBox))then
  begin
    Key := #0;
    aOk.Execute;
  end;
end;

end.
