unit uCurSelectorForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl;

type
  TCurSelectorForm = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    BitBtn1: TBitBtn;
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
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    procedure cdsCurRateGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    function GetCurName: String;
    function GetID_Curr: Variant;
    procedure SetID_Curr(const Value: Variant);
    function GetCurShortName: String;
    { Private declarations }
  public
    procedure Initialize(id_Bsn : integer);
    property ID_Curr : Variant read GetID_Curr write SetID_Curr;
    property CurName : String read GetCurName;
    property CurShortName : String read GetCurShortName;
  end;

var
  CurSelectorForm: TCurSelectorForm;

implementation

uses uDM, foMyFunc;

{$R *.DFM}

procedure TCurSelectorForm.cdsCurRateGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if cdsCurValue.AsInteger <> 0 then
    Text := FormatFloat('0.##', cdsCurRate.AsFloat/cdsCurValue.AsInteger);
end;

function TCurSelectorForm.GetCurName: String;
begin
  Result := cdsCurName.AsString;
end;

function TCurSelectorForm.GetCurShortName: String;
begin
  Result := cdsCurShortName.AsString;
end;

function TCurSelectorForm.GetID_Curr: Variant;
begin
  Result := cdsCurId_Currency.AsInteger;
end;

procedure TCurSelectorForm.Initialize(id_Bsn : integer);
begin
  with cdsCur do
  begin
    Close;
    Params.ParamByName('@FastAccess').Value := Null;
    Params.ParamByName('@AvForPay').Value := True;
    Params.ParamByName('@id_Bsn').Value := id_Bsn;
    Open;
  end;
end;

procedure TCurSelectorForm.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);

end;

procedure TCurSelectorForm.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TCurSelectorForm.SetID_Curr(const Value: Variant);
begin
  cdsCur.Locate('Id_Currency', Value, []);
end;

procedure TCurSelectorForm.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  btnOk.enabled := not cdsCur.isEmpty;
end;

end.
