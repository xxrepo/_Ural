unit uArc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frArc, foMyFunc, ExtCtrls, StdCtrls, Buttons,
  DBGridEh, frArcSumm, frBsnSelector, Grids, Menus;

type
  TArc = class(TForm)
    pnDate: TPanel;
    edObjName: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    cbType: TComboBox;
    Button1: TButton;
    fBsnSelector1: TfBsnSelector;
    fArc1: TfArc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbTypeChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
  private
    ASelectedObj : TSelectedObj;
    AParamBlnc : TParamBlnc;
    
    procedure Initialize(id_business : Variant; HasVisa : Variant); overload;
    function GetcbType: TEObjType;
    procedure GetObjArc;
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    procedure Initialize(AParamBlnc : TParamBlnc); overload;
    procedure MakeSimple;
  end;

var
  Arc: TArc;

implementation

uses uBsnSelector, uFormApi_CA, uDM, uUnivSelector, uMainForm;

{$R *.DFM}

procedure TArc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TArc.FormDestroy(Sender: TObject);
begin
  Arc := nil;
end;

procedure TArc.Initialize(id_business: Variant; HasVisa : Variant);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_business := id_business;
  AParamBlnc.HasViza := HasVisa;

  fArc1.Initialize(AParamBlnc);
  fArc1.aBuffAdd.Visible := true;
//  if not HasVisa then
//    Caption := 'Операции для визирования';
end;

procedure TArc.Initialize(AParamBlnc: TParamBlnc);
begin
//  fArc1.Initialize(AParamBlnc);
  AParamBlnc.DateFrom := fArc1.dtFrom.Date;
  AParamBlnc.DateTo := fArc1.dtTo.Date;
  fBsnSelector1.ID := AParamBlnc.id_business;
  GetObjArc;

 // fArc1.Initialize(AParamBlnc);

  fArc1.aBuffAdd.Visible := true;
end;

procedure TArc.BitBtn1Click(Sender: TObject);
var AEObjTypes: TEObjTypes;
    Rez : TEObjType;

    AParamBlnc : TParamBlnc;
begin
  AEObjTypes := [GetcbType];
 
  if AEObjTypes <> [eotNone] then
  begin
    if eotRepr in AEObjTypes then
      AEObjTypes := AEObjTypes + [eotRepr];

    if AEObjTypes = [eotBsn] then
    begin
      if SelectBuisnes(ASelectedObj.ID, ASelectedObj.Name, 7) then
      begin
        ASelectedObj.ObjType := eotBsn;
        edObjName.Text := ASelectedObj.Name;
        GetObjArc;
      end;
    end
    else
    begin
      if AEObjTypes = [eotCAGroup] then
      begin
        if SelectCAGroup(fBsnSelector1.ID, ASelectedObj.ID, ASelectedObj.Name, false, true, true) then
        begin
          ASelectedObj.ObjType := eotCAGroup;
          edObjName.Text := ASelectedObj.Name;
          GetObjArc;
        end;
      end
      else
      begin
        if SelectObjUnBsn(Self, fBsnSelector1.ID, ASelectedObj, false, AEObjTypes) then
        begin
          edObjName.Text := ASelectedObj.Name;
          GetObjArc;
        end;
      end;
    end;
  end;
end;

procedure TArc.GetObjArc;
var V : Variant;
    AEObjType : TEObjType;
begin
  AEObjType := GetcbType;

  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_business := fBsnSelector1.ID;
{  if cbAll.Checked then
  begin
    case AEObjType of
      eotFin : AParamBlnc.AllAcc := true;
      eotWH : AParamBlnc.AllWH := true;
      eotManuf : AParamBlnc.AllMN := true;
      eotOwnCA2, eotCA, eotOwnRepr2, eotRepr, eotCAGroup : AParamBlnc.AllRepr := true;
    end;
  end
  else }
  begin
    case ASelectedObj.ObjType of
      eotNone : begin
            //      AParamBlnc.id_business := fBsnSelector1.ID;
            //      ASelectedObj.Bsn_id := fBsnSelector1.ID;
                end;
      eotFin : AParamBlnc.id_Acc := ASelectedObj.ID;
      eotWH : AParamBlnc.id_Warehouse := ASelectedObj.ID;
      eotManuf : AParamBlnc.id_Manufact := ASelectedObj.ID;
      eotCA : AParamBlnc.id_ContrAgent := ASelectedObj.ID;
      eotRepr : AParamBlnc.id_Repr := ASelectedObj.ID;
     // eotManuf : AParamBlnc.id_Manufact := ASelectedObj.ID;
      eotCAGroup :
      begin
        AParamBlnc.id_CAGroup := ASelectedObj.ID;
      end;
    end;
  end;
  AParamBlnc.DateFrom := fArc1.dtFrom.Date;
  AParamBlnc.DateTo := fArc1.dtTo.Date;
  fArc1.Initialize(AParamBlnc);
end;

function TArc.GetcbType : TEObjType;
begin
  Result := eotNone;
  if (cbType.ItemIndex <> -1) and
     (cbType.Items.Objects[cbType.ItemIndex] <> nil) then
    Result := TEObjType(cbType.Items.Objects[cbType.ItemIndex]);
end;

procedure TArc.cbTypeChange(Sender: TObject);
begin
  if ASelectedObj.ObjType <> GetcbType then
  begin
    ASelectedObj.ObjType := eotNone;
    edObjName.Text := '';
 //   if GetcbType = eotNone then
      GetObjArc;
  end;
end;

procedure TArc.Button1Click(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    Button1.Enabled := false;
    Enabled := false;
    GetObjArc;
  finally
    Button1.Enabled := true;
    Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

constructor TArc.Create(AOwner: TCOmponent);
var Val : Variant;
    i : integer;
    AColumnEh : TColumnEh;
begin
  inherited;
  fArc1.StatusBar1.Visible := false;
  fBsnSelector1.AShowbtnDel := false;

  ASelectedObj.Bsn_id := Null;
  ASelectedObj.ID := Null;
  with cbType do
  begin
    Clear;
    Items.AddObject('Все...', Pointer(eotNone));
  //  Items.AddObject('Бизнес', Pointer(eotBsn));
    Items.AddObject('Счет', Pointer(eotFin));
    Items.AddObject('Склад', Pointer(eotWH));
    Items.AddObject('Производство', Pointer(eotManuf));

    Items.AddObject('Группа контрагентов', Pointer(eotCAGroup));
    Items.AddObject('Контрагент', Pointer(eotCA));
    Items.AddObject('Представитель', Pointer(eotRepr));
  end;

 {
  for i := fArc1.RxDBGrid1.Columns.Count - 1 downto 0 do
  begin
    AColumnEh := fArc1.RxDBGrid1.Columns[i];
     if (AColumnEh.FieldName = 'CreatorFIO') or (AColumnEh.FieldName = 'CheckerFIO') then
       AColumnEh.Free;
  end;   }
  MakeSimple; 
end;

destructor TArc.Destroy;
begin
//  SaveValToRegistry(fBsnSelector1.ID, SRegPath + '\' + Name, 'id_Bsn');
  inherited;
end;

procedure TArc.fBsnSelector1Button1Click(Sender: TObject);
var OldID : Variant;
begin
  OldID := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if OldID <> fBsnSelector1.ID then
  begin
    cbType.ItemIndex := -1;
    ASelectedObj.ObjType := eotNone;
    edObjName.Text := '';
    fArc1.dsArc.DataSet.Close;
    try fArc1.id_business := fBsnSelector1.ID; except end;
    try GetObjArc;   except end;
  end;
end;

procedure TArc.MakeSimple;
begin
  if DM.IsSimple then
  begin
    pnDate.Visible := false;
  end;
end;

end.
