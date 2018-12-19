unit frCurSelector;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBClient, foMyFunc, uDM;

type
  TCurObj = class(TDBObj)
    
  public
    RateRBL : Extended;
    constructor Create;
    destructor Destroy; override;
  end;

  TfCurSelector = class(TFrame)
    Label1: TLabel;
    cbCur: TComboBox;
    cdsCur: TClientDataSet;
    cdsCurId_Currency: TAutoIncField;
    cdsCurName: TStringField;
    cdsCurShortName: TStringField;
    cdsCurISOCode: TStringField;
    cdsCurNumberCode: TStringField;
    cdsCurFastAccess: TBooleanField;
    cdsCurValue: TIntegerField;
    cdsCurRate: TFloatField;
    cdsCurAvForPay: TBooleanField;
    cdsCurBase: TBooleanField;
    cdsCurLastUpdated: TBytesField;
    cdsCurId_URL: TIntegerField;
    procedure cbCurChange(Sender: TObject);
    procedure cbCurKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Fid_Bsn : integer;
    FIsShort : boolean;
    function GetID_Curr: Variant;
    procedure SetID_Curr(const Value: Variant);
    function GetCurName: Variant;
    procedure RecalcDropDownCount;
    function GetRate: Extended;
    function GetEnabled: boolean;
    procedure SetEnabled(const Value: boolean);
  public
    constructor Create(AOwner : TComponent); override;
    procedure Initialize(id_Bsn : integer; IsShort : boolean = true; AllInOne : boolean = false);
    property ID_Curr : Variant read GetID_Curr write SetID_Curr;
    property CurName : Variant read GetCurName;

    property RateRBL : Extended read GetRate;
    property Enabled : boolean read GetEnabled write SetEnabled;
  end;

implementation

uses uFormApi_Crn;

{$R *.DFM}

{ TfCurSelector }

function TfCurSelector.GetCurName: Variant;
begin
  if GetID_Curr >= 0 then
    Result := cbCur.Text
  else
    Result := Null;
end;

function TfCurSelector.GetID_Curr: Variant;
begin
  Result := Null;
  if (cbCur.ItemIndex <> -1) and (cbCur.Items.Objects[cbCur.ItemIndex] is TCurObj) then
    Result := TCurObj(cbCur.Items.Objects[cbCur.ItemIndex]).ID;
end;

procedure TfCurSelector.Initialize(id_Bsn : integer; IsShort : boolean; AllInOne : boolean);
  procedure GetCur(FastAccess : Variant);
  var Obj : TCurObj;
  begin
    with cdsCur do
    begin
      Close;
      Params.ParamByName('@FastAccess').Value := FastAccess;
      Params.ParamByName('@AvForPay').Value := True;
      Params.ParamByName('@id_Bsn').Value := Fid_Bsn;
      Open;
      First;
      while not Eof do
      begin
        Obj := TCurObj.Create;
        Obj.ID := cdsCurId_Currency.AsInteger;
        if FIsShort then
          Obj.Name := cdsCurShortName.AsString
        else
          Obj.Name := cdsCurName.AsString;
        if cdsCurBase.AsBoolean then
          Obj.RateRBL := 1
        else
        begin
          if cdsCurValue.AsInteger > 0 then
            Obj.RateRBL := cdsCurRate.AsFloat/cdsCurValue.AsInteger;
        end;

        cbCur.Items.AddObject(Obj.Name, Obj);

        Next;
      end;
    end;
  end;
begin
  if Fid_Bsn = id_Bsn then
    Exit;
  Fid_Bsn := id_Bsn;
  FIsShort := IsShort;

  cbCur.Items.Clear;
  if not AllInOne then
    cbCur.Items.Add('Выбрать...');
  GetCur(true);
  if AllInOne then
  begin
    cbCur.Items.Add('---------------------------------------------------------------------------------------------------------');
    GetCur(Null);
  end;
  if cbCur.Items.Count = 2 then
    cbCur.ItemIndex := 1
  else
    cbCur.ItemIndex := -1;
  RecalcDropDownCount;
end;

procedure TfCurSelector.RecalcDropDownCount;
begin
  if cbCur.Items.Count > 20 then
    cbCur.DropDownCount := 20
  else
    cbCur.DropDownCount := cbCur.Items.Count
end;

procedure TfCurSelector.SetID_Curr(const Value: Variant);
var i : integer;
    V, AName, AShortName, RateRBL: Variant;
    Obj : TCurObj;
begin
  if VarType(Value) = varEmpty then
    V := Null
  else
    V := Value;
  for i := 0 to cbCur.Items.Count - 1 do
  begin
    if (cbCur.Items.Objects[i] is TCurObj) and (TCurObj(cbCur.Items.Objects[i]).ID = V) then
    begin
      cbCur.ItemIndex := i;
      Exit;
    end;
  end;
  if DM.rsCA.AppServer.CurByID(V, AName, AShortName, RateRBL) = 1 then
  begin
    Obj := TCurObj.Create;
    Obj.ID := V;
    Obj.RateRBL := RateRBL;
    if FIsShort then
      Obj.Name := AShortName
    else
      Obj.Name := AName;
    if cbCur.items.Count = 0 then
      cbCur.Items.Add('Выбрать...');
    cbCur.Items.InsertObject(1, Obj.Name, Obj);
    cbCur.ItemIndex := 1;
  end
  else
    cbCur.ItemIndex := -1;
  RecalcDropDownCount;
end;

function TfCurSelector.GetRate: Extended;
begin
  Result := 0;
  if (cbCur.ItemIndex <> -1) and (cbCur.Items.Objects[cbCur.ItemIndex] is TCurObj) then
    Result := TCurObj(cbCur.Items.Objects[cbCur.ItemIndex]).RateRBL;
end;

constructor TfCurSelector.Create(AOwner: TComponent);
begin
  inherited;
  Fid_Bsn := -1;
end;

function TfCurSelector.GetEnabled: boolean;
begin
  Result := inherited Enabled;
end;

procedure TfCurSelector.SetEnabled(const Value: boolean);
begin
  inherited Enabled := Value;
  cbCur.Enabled := Value;
end;

{ TCurObj }

constructor TCurObj.Create;
begin
  inherited;
  RateRBL := 0;
end;

destructor TCurObj.Destroy;
begin
  inherited;

end;

procedure TfCurSelector.cbCurChange(Sender: TObject);
var AID : Variant;
    AName : String;
    Obj : TCurObj;
    i : integer;
begin
  if (cbCur.ItemIndex = 0) and (not (cbCur.Items.Objects[cbCur.ItemIndex] is TCurObj)) then
  begin
    AID := ID_Curr;
    if SelectCur(AID, AName, FIsShort, Fid_Bsn) then
    begin
      for i := 1 to cbCur.Items.Count - 1 do
        if TCurObj(cbCur.Items.Objects[i]).ID = AID then
        begin
          cbCur.ItemIndex := i;
          Exit;
        end;
      Obj := TCurObj.Create;
      Obj.ID := AID;
      Obj.Name := AName;
      cbCur.Items.InsertObject(1, Obj.Name, Obj);
      cbCur.ItemIndex := 1;
      RecalcDropDownCount;
    end;
  end;
end;

procedure TfCurSelector.cbCurKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    ID_Curr := Null;
    Key := 0;
  end;
end;

end.
