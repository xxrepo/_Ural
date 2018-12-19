unit uInvRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, Db, DBClient, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  ActnList, Menus;

type
  TInvRep = class(TForm)
    cdsInv_Rep: TClientDataSet;
    cdsInv_RepPrjNum: TIntegerField;
    cdsInv_RepName: TStringField;
    cdsInv_RepAmount1: TFloatField;
    cdsInv_RepAmount2: TFloatField;
    cdsInv_RepInv1: TFloatField;
    cdsInv_RepInv2: TFloatField;
    cdsInv_RepPrice: TFloatField;
    cdsInv_RepKlishe_Inv1: TFloatField;
    cdsInv_RepKlishe_Inv2: TFloatField;
    cdsInv_RepKlishe_Price: TFloatField;
    cdsInv_RepTime_Form1: TDateTimeField;
    cdsInv_RepTime_Form2: TDateTimeField;
    cdsInv_RepTime_FormDelta: TDateTimeField;
    cdsInv_RepTime_Print1: TDateTimeField;
    cdsInv_RepTime_Print2: TDateTimeField;
    cdsInv_RepTime_PrintDelta: TDateTimeField;
    cdsInv_RepTime_Lam1: TDateTimeField;
    cdsInv_RepTime_Lam2: TDateTimeField;
    cdsInv_RepTime_LamDelta: TDateTimeField;
    cdsInv_RepTime_Rez1: TDateTimeField;
    cdsInv_RepTime_Rez2: TDateTimeField;
    cdsInv_RepTime_RezDelta: TDateTimeField;
    cdsInv_RepRaw_Form1: TFloatField;
    cdsInv_RepRaw_Form2: TFloatField;
    cdsInv_RepRaw_FormDelta: TFloatField;
    cdsInv_RepRaw_Print1: TFloatField;
    cdsInv_RepRaw_Print2: TFloatField;
    cdsInv_RepRaw_PrintDelta: TFloatField;
    cdsInv_RepRaw_Lam1: TFloatField;
    cdsInv_RepRaw_Lam2: TFloatField;
    cdsInv_RepRaw_LamDelta: TFloatField;
    cdsInv_RepRaw_Rez1: TFloatField;
    cdsInv_RepRaw_Rez2: TFloatField;
    cdsInv_RepRaw_RezDelta: TFloatField;
    cdsInv_Repxxx: TIntegerField;
    cdsInv_RepRecNum: TIntegerField;
    cdsInv_RepCalcDate: TDateTimeField;
    cdsInv_RepCheckDate: TDateTimeField;
    cdsInv_RepID_Main: TIntegerField;
    cdsInv_Repid_Project: TIntegerField;
    cdsInv_RepKL_Delta: TFloatField;
    cdsInv_RepINV_Delta: TFloatField;
    cdsInv_RepINV_DeltaVal: TFloatField;
    Panel3: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dtTo: TDateTimePicker;
    dtFrom: TDateTimePicker;
    BitBtn2: TBitBtn;
    edV1: TEdit;
    edV2: TEdit;
    Panel2: TPanel;
    btnCancel: TButton;
    Label5: TLabel;
    edSSS: TEdit;
    procedure cdsInv_RepCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  InvRep: TInvRep;
procedure ShowInvRep(id_Project : integer; DateFrom, DateTo : TDateTime);

implementation

uses uDM, foMyFuncEh, foMyFunc, uInvMain, foMyFuncEhExcel, uPrgForm;

{$R *.DFM}

procedure ShowInvRep(id_Project : integer; DateFrom, DateTo : TDateTime);
var F : TInvRep;
begin

    DM.Rights_GetUserRights(1001, Null);


 // DM.Rights_GetUserRights(6, Null);
  F := TInvRep.Create(nil);
  try
    F.Show;
    F.BitBtn2Click(nil);
  except
    F.Free;
  end;
end;

{ TInvRepList }

constructor TInvRep.Create(AOwner: TCOmponent);
var i : integer;
begin
  inherited;
  dtFrom.DateTime := Now-30;
  dtTo.DateTime := Now;

  SetWindowLong(Handle, GWL_HWNDPARENT, 0);

end;

procedure TInvRep.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

destructor TInvRep.Destroy;
begin
  inherited;

end;

procedure TInvRep.cdsInv_RepCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('RecNum').Value := DataSet.RecNo;
  if not (DataSet.FieldByName('Klishe_Inv1').IsNull and DataSet.FieldByName('Klishe_Inv2').IsNull) then
    DataSet.FieldByName('KL_Delta').AsFloat :=
      DataSet.FieldByName('Klishe_Inv1').AsFloat - DataSet.FieldByName('Klishe_Inv2').AsFloat;

    DataSet.FieldByName('INV_Delta').AsFloat :=
      DataSet.FieldByName('Inv1').AsFloat - DataSet.FieldByName('Inv2').AsFloat;
  DataSet.FieldByName('INV_DeltaVal').AsFloat := DataSet.FieldByName('INV_Delta').AsFloat * DataSet.FieldByName('Amount2').AsFloat;

end;

procedure TInvRep.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TInvRep.BitBtn2Click(Sender: TObject);
var ID : integer;
    V1, V2 : Extended;
begin
  ID := cdsInv_Repid_Project.AsInteger;
  with cdsInv_Rep do
  begin
    Close;
    Params.ParamByName('@DateFrom').Value := GetDateAdv(dtFrom.Date, false);
    Params.ParamByName('@DateTo').Value := GetDateAdv(dtTo.Date, true);
    Open;

    Filter := 'INV_DeltaVal<=-0,005';
    Filtered := true;
    First;
    V1 := 0;
    while not Eof do
    begin
      V1 := V1 + cdsInv_RepINV_DeltaVal.AsFloat;
      Next;
    end;
    edV1.Text := FormatFloat('0.00', V1);

    V2 := V1;
    Filter := 'KL_Delta<=-0,005';
    Filtered := true;
    First;
    V1 := 0;
    while not Eof do
    begin
      V1 := V1 + cdsInv_RepKL_Delta.AsFloat;
      Next;
    end;
    edV2.Text := FormatFloat('0.00', V1);
    Close;
  end;
  edSSS.Text := FormatFloat('0.00',V2 + V1);
end;

procedure TInvRep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TInvRep.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
