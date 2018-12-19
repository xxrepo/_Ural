unit uCrnRateSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Mask, ToolEdit, CurrEdit, RXCtrls;

type
  TCrnRateSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
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
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    RxCalcEdit1: TRxCalcEdit;
    RxCalcEdit2: TRxCalcEdit;
    Label3: TLabel;
    Label4: TLabel;
    RxSpeedButton1: TRxSpeedButton;
    RxSpeedButton2: TRxSpeedButton;
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Initialize(id_Bsn, id_CrnOper, id_CrnSys : integer);
  end;

function ShowCrnRateSelector(id_Bsn, id_CrnOper, id_CrnSys : integer; var RateOper, RateSys: Extended) : boolean;
var
  CrnRateSelector: TCrnRateSelector;

implementation

uses foMyFunc;

{$R *.DFM}

function ShowCrnRateSelector(id_Bsn, id_CrnOper, id_CrnSys : integer; var RateOper, RateSys: Extended) : boolean;
var F : TCrnRateSelector;
begin
  Result := false;
  F := TCrnRateSelector.Create(nil);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    F.Initialize(id_Bsn, id_CrnOper, id_CrnSys);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := true;
      RateOper := F.RxCalcEdit1.Value;
      RateSys := F.RxCalcEdit2.Value;
    end;
  finally
    F.Free;
  end;
end;

procedure TCrnRateSelector.Initialize(id_Bsn, id_CrnOper, id_CrnSys : integer);
begin
  with cdsCur do
  begin
    Close;
    Params.ParamByName('@FastAccess').Value := Null;
    Params.ParamByName('@AvForPay').Value := True;
    Params.ParamByName('@id_Bsn').Value := id_Bsn;
    Open;
    if Locate('Id_Currency', id_CrnOper, []) then
    begin
      Edit1.Text := cdsCurShortName.AsString;
      if cdsCurBase.AsBoolean then
        RxCalcEdit1.Value := 1
      else
        RxCalcEdit1.Value := cdsCurRate.AsFloat/cdsCurValue.AsInteger;
      RxCalcEdit1.Enabled := not cdsCurBase.AsBoolean;
    end;
    if Locate('Id_Currency', id_CrnSys, []) then
    begin
      Edit2.Text := cdsCurShortName.AsString;
      if cdsCurBase.AsBoolean then
        RxCalcEdit2.Value := 1
      else
        RxCalcEdit2.Value := cdsCurRate.AsFloat/cdsCurValue.AsInteger;
      RxCalcEdit2.Enabled := not cdsCurBase.AsBoolean;
    end;
  end;
end;

procedure TCrnRateSelector.RxSpeedButton1Click(Sender: TObject);
var V : Variant;
begin
  V := GetFloatFromClipBoadr;
  if V <> 0 then
  begin
    RxCalcEdit1.Value := V;
  end;
end;

procedure TCrnRateSelector.RxSpeedButton2Click(Sender: TObject);
var V : Variant;
begin
  V := GetFloatFromClipBoadr;
  if V <> 0 then
  begin
    RxCalcEdit2.Value := V;
  end;
end;

end.
