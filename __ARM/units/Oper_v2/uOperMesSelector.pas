unit uOperMesSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl;

type
  TOperMesSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    dsMeasureGetList: TDataSource;
    cdsMeasureGetList: TClientDataSet;
    cdsMeasureGetListid_Measure: TIntegerField;
    cdsMeasureGetListName: TStringField;
    cdsMeasureGetListShortName: TStringField;
    cdsMeasureGetListid_BaseMeasure: TIntegerField;
    cdsMeasureGetListKoef: TFloatField;
    cdsMeasureGetListDisabled: TBooleanField;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    function GetCurName: String;
    function GetID_Curr: integer;
    function GetCurShortName: String;
    { Private declarations }
  public
    procedure Initialize(AID, id_Goods : Variant);
    property ID_Measure : integer read GetID_Curr;
    property MeasureName : String read GetCurName;
    property MeasureShortName : String read GetCurShortName;
  end;

function SelectOperMeasure(const AHandle : HWnd;id_Goods : Variant; var AID : Variant; var AName : String; var Koef : Extended) : boolean;
var
  OperMesSelector: TOperMesSelector;

implementation

uses uDM, foMyFunc, uMainForm;

{$R *.DFM}

function SelectOperMeasure(const AHandle : HWnd; id_Goods : Variant; var AID : Variant; var AName : String; var Koef : Extended) : boolean;
var F : TOperMesSelector;
begin
  Result := false;
  F := TOperMesSelector.Create(MainForm);
  try
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);
    F.Initialize(AID, id_Goods);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AID := F.ID_Measure;
      AName := F.MeasureShortName;
      if F.cdsMeasureGetListid_BaseMeasure.IsNull then
        Koef := 1
      else
        Koef := F.cdsMeasureGetListKoef.AsFloat;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

function TOperMesSelector.GetCurName: String;
begin
  Result := cdsMeasureGetListName.AsString;
end;

function TOperMesSelector.GetCurShortName: String;
begin
  Result := cdsMeasureGetListShortName.AsString;
end;

function TOperMesSelector.GetID_Curr: integer;
begin
  Result := cdsMeasureGetListid_Measure.AsInteger;
end;

procedure TOperMesSelector.Initialize(AID, id_Goods : Variant);
begin
  with cdsMeasureGetList do
  begin
    Close;
    Params.ParamByName('@id_Goods').Value := id_Goods;
    Open;
    Locate('id_Measure', AID, []);
  end;
end;

procedure TOperMesSelector.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);

end;

procedure TOperMesSelector.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;


procedure TOperMesSelector.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  btnOk.Click;
end;

end.
