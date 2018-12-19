unit uArcOperBy201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frBsnSelector, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, RXCtrls,
  Menus, registry, frRepRez, ActnList, db, frArc, DBClient;

type
  TArcOperBy201 = class(TForm)
    pnDate: TPanel;
    fBsnSelector1: TfBsnSelector;
    Panel1: TPanel;
    edWH: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dtTo: TDateEdit;
    Label2: TLabel;
    dtFrom: TDateEdit;
    Label3: TLabel;
    Label1: TLabel;
    edCA: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    RxSpeedButton8: TRxSpeedButton;
    pmOperFilter: TPopupMenu;
    miNoDept: TMenuItem;
    miDept: TMenuItem;
    cbType: TComboBox;
    fRepRez1: TfRepRez;
    GroupBox1: TGroupBox;
    cbShowOper: TCheckBox;
    Splitter1: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure miDeptClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure aXXXRExecute(Sender: TObject);
    procedure cbShowOperClick(Sender: TObject);
    procedure fRepRez1dsAmountDataChange(Sender: TObject; Field: TField);
    procedure fRepRez1ToolButton2Click(Sender: TObject);
  private
    Fid_CA, Fid_Repr, id_Warehouse : Variant;
    fArc1: TfArc;
    procedure ReColorFilter;
    procedure GetOPerList(id_Oper: integer);
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize;
  end;

var
  ArcOperBy201: TArcOperBy201;
procedure ShowArc201;

implementation

uses foMyFunc, uDM, uUnivSelector, uMainForm, uBsnSelector;

{$R *.DFM}

procedure ShowArc201;
var AID : Variant;
    AName : String;
begin
 // DM.Rights_GetUserRights(7, Null);
{  if not Assigned(ArcOperBy201) then
  begin
    AID := -1;
    if SelectBuisnes(AID, AName, 7, nil, false, true) then
    begin

    end
    else
      Abort;

    ArcOperBy201 := TArc201.Create(MainForm);
    ArcOperBy201.fBsnSelector1.ID := AID;
    try
      ArcOperBy201.Initialize;
    except
      ArArcOperBy201c201.Free;
    end;
  end
  else
  begin
    ArcOperBy201.WindowState := wsMaximized;
    ArcOperBy201.BringToFront;
  end;   }
end;

constructor TArcOperBy201.Create(AOwner: TCOmponent);
var
    Reg : TRegistry;
    i : integer;
    Own : TCustomForm;
begin
  inherited;
  fArc1 := nil;
  fBsnSelector1.AShowbtnDel := false;
  fRepRez1.aExit.Visible := false;
  fRepRez1.aRefreshe.OnExecute := aXXXRExecute;
  cbType.ItemIndex := 0;
  Fid_CA := Null;
  Fid_Repr := Null;
  id_Warehouse := Null;
  dtFrom.Date := Now - 10;
  dtTo.Date := Now;
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin                               
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(SRegPath + '\' + TForm(Own).ClassName + '\pmOperFilter', false) then
      begin
        cbShowOper.Checked :=  Reg.ReadBool('cbShowOperChecked');
        cbShowOperClick(nil);
        GroupBox1.Height :=  Reg.ReadInteger('GroupBox1Height');
        with pmOperFilter do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            if Reg.ValueExists(Items[i].Name) then
              Items[i].Checked := Reg.ReadBool(Items[i].Name);
          end;
        end;
    end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
end;

destructor TArcOperBy201.Destroy;
var
    Reg : TRegistry;
    i : integer;
    Own : TCustomForm;
begin
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(SRegPath + '\' + TForm(Own).ClassName + '\pmOperFilter', true) then
      begin
        Reg.WriteBool('cbShowOperChecked', cbShowOper.Checked);
        Reg.WriteInteger('GroupBox1Height', GroupBox1.Height);
        with pmOperFilter do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            Reg.WriteBool(Items[i].Name, Items[i].Checked)
          end;
        end;
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  inherited;

end;

procedure TArcOperBy201.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TArcOperBy201.FormDestroy(Sender: TObject);
begin
  ArcOperBy201 := nil;
end;

procedure TArcOperBy201.miDeptClick(Sender: TObject);
begin
  if (Sender as TMenuItem).RadioItem then
    (Sender as TMenuItem).Checked := true
  else
    (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
  ReColorFilter;
end;

procedure TArcOperBy201.ReColorFilter;
var i : integer;
begin
  RxSpeedButton8.Font.Color := clWindowText;
  RxSpeedButton8.Font.Style := [];
  for i := 0 to pmOperFilter.Items.Count - 1 do
    if (pmOperFilter.Items[i].Caption <> '-') and (not pmOperFilter.Items[i].Checked) then
    begin
      RxSpeedButton8.Font.Color := clRed;
  //    RxSpeedButton8.Font.Style := [fsBold];
      Break;
    end;
end;

procedure TArcOperBy201.BitBtn3Click(Sender: TObject);
begin
  Fid_CA := Null;
  Fid_Repr := Null;
  edCA.Text := '';
end;

procedure TArcOperBy201.BitBtn2Click(Sender: TObject);
begin
  id_Warehouse := Null;
  edWH.Text := '';
end;

procedure TArcOperBy201.BitBtn4Click(Sender: TObject);
var AEObjTypes: TEObjTypes;
    ASelectedObj : TSelectedObj;
begin
  if cbType.ItemIndex = 0 then
  begin
    AEObjTypes := [eotRepr];
    ASelectedObj.ID := Fid_CA;
  end
  else
  begin
    AEObjTypes := [eotCA];
    ASelectedObj.ID := Fid_Repr;
  end;

  if SelectObjUnBsn(Self, fBsnSelector1.ID, ASelectedObj, false, AEObjTypes) then
  begin
    Fid_Repr := Null;
    Fid_CA := Null;
    if ASelectedObj.ObjType = eotRepr then
      Fid_Repr := ASelectedObj.ID
    else
      Fid_CA := ASelectedObj.ID;
    edCA.Text := ASelectedObj.Name;
  end;

end;

procedure TArcOperBy201.BitBtn1Click(Sender: TObject);
var
    ASelectedObj : TSelectedObj;
begin
  ASelectedObj.ID := id_Warehouse;
  if SelectObjUnBsn(Self, fBsnSelector1.ID, ASelectedObj, false, [eotWH]) then
  begin
    id_Warehouse := ASelectedObj.ID;
    edWH.Text := ASelectedObj.Name;
  end;
end;

procedure TArcOperBy201.aXXXRExecute(Sender: TObject);
var AParamz201 : TParamz201;
begin
  AParamz201 := GetEmptyParamz201;

  AParamz201.id_business := fBsnSelector1.ID;
  AParamz201.id_Goods := Null;
  AParamz201.id_WareHouse := id_WareHouse;
  AParamz201.id_ContrAgent := Fid_CA;
  AParamz201.id_Repr := Fid_Repr;
  
  AParamz201.DateFrom := GetDateAdv(dtFrom.Date, false);
  AParamz201.DateTo := GetDateAdv(dtTo.Date, true);

  if miDept.Checked and miNoDept.Checked then
    AParamz201.HasDept := Null
  else
    if miDept.Checked then
      AParamz201.HasDept := true
    else
      AParamz201.HasDept := false;
  fRepRez1.Initialize(AParamz201);

//  fRepRez1.aRefresheExecute(Sender);
end;

procedure TArcOperBy201.Initialize;
var ID : integer;
begin
  if fRepRez1.cdsGoodsRez.Active then
    ID := fRepRez1.cdsGoodsRezid_Oper.AsInteger
  else
    ID := -1;
  aXXXRExecute(nil);
  if ID > 0 then
    fRepRez1.cdsGoodsRez.Locate('id_Oper', ID, []);
end;

procedure TArcOperBy201.GetOPerList(id_Oper: integer);
begin
  if not cbShowOper.Checked then Exit;
  if id_Oper = -2 then
    id_Oper := fRepRez1.cdsGoodsRezid_Oper.AsInteger;
  with TClientDataset(fArc1.dsArc.DataSet) do
  begin
    if Params.ParamByName('@id_OperParent').AsInteger <> id_Oper then
    begin
      Close;
      Params.ParamByName('@DateFrom').Value := Null;
      Params.ParamByName('@DateFrom').Value := Null;
      Params.ParamByName('@id_OperParent').Value := id_Oper;
      Params.ParamByName('@OperWare').Value := true;
      Params.ParamByName('@id_user').Value := DM.IDUser;
      Open;
    end;
  end;
end;

procedure TArcOperBy201.cbShowOperClick(Sender: TObject);
begin
  if fArc1 = nil then
  begin
    fArc1 := TfArc.Create(Self);
    fArc1.Parent := GroupBox1;
    fArc1.Align := alClient;
    fArc1.ToolBar1.Visible := false;
    fArc1.pnDate.Visible := false;

  end;
  GroupBox1.Visible := cbShowOper.Checked;
  Splitter1.Visible := cbShowOper.Checked;
  GetOPerList(-2);
end;

procedure TArcOperBy201.fRepRez1dsAmountDataChange(Sender: TObject;
  Field: TField);
begin
  fRepRez1.dsAmountDataChange(Sender, Field);
  GetOPerList(-2);
end;

procedure TArcOperBy201.fRepRez1ToolButton2Click(Sender: TObject);
var
    ID : integer;
begin
  ID := fRepRez1.cdsGoodsRez.FieldByName('id_Oper').AsInteger;
  fRepRez1.aRefresheExecute(Sender);
  fRepRez1.cdsGoodsRez.locate('id_Oper', ID, []);
end;

end.
