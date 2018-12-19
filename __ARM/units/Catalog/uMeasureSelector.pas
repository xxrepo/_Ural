unit uMeasureSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  ComCtrls, ToolWin, ActnList, ImgList
{$IFNDEF LC}
 , uNSIDetailFormsAPI
{$ENDIF}
  ;

type
  TMeasureSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    BitBtn1: TBitBtn;
    cdsMeasureGetList: TClientDataSet;
    RxDBGrid1: TRxDBGrid;
    dsMeasureGetList: TDataSource;
    cdsMeasureGetListid_Measure: TAutoIncField;
    cdsMeasureGetListName: TStringField;
    cdsMeasureGetListShortName: TStringField;
    ImageList: TImageList;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
  private
    Fid_Bsn : integer;
    function GetCurName: String;
    function GetID_Curr: integer;
    function GetCurShortName: String;
    { Private declarations }
  public
    procedure Initialize(AID, id_Bsn : Variant);
    property ID_Measure : integer read GetID_Curr;
    property MeasureName : String read GetCurName;
    property MeasureShortName : String read GetCurShortName;
  end;

var
  MeasureSelector: TMeasureSelector;

function SelectMeasure(id_Bsn : integer; var AID : Variant; var AName : String) : boolean;

implementation

uses uDM, foMyFunc, uMainForm;

function SelectMeasure(id_Bsn : integer; var AID : Variant; var AName : String) : boolean;
var F : TMeasureSelector;
begin
  Result := false;
  F := TMeasureSelector.Create(MainForm);
  try
    F.Initialize(AID, id_Bsn);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AID := F.ID_Measure;
      AName := F.MeasureName;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;


{$R *.DFM}

function TMeasureSelector.GetCurName: String;
begin
  Result := cdsMeasureGetListName.AsString;
end;

function TMeasureSelector.GetCurShortName: String;
begin
  Result := cdsMeasureGetListShortName.AsString;
end;

function TMeasureSelector.GetID_Curr: integer;
begin
  Result := cdsMeasureGetListid_Measure.AsInteger;
end;

procedure TMeasureSelector.Initialize(AID, id_Bsn : Variant);
begin
  Fid_Bsn := id_Bsn;
{$IFDEF LC}
  aAdd.Visible := false;
  aEdit.Visible := false;
  aDel.Visible := false;
{$ENDIF}
  with cdsMeasureGetList do
  begin
    Close;
    Params.ParamByName('@id_Business').Value := id_Bsn;
    Open;
    Locate('id_Measure', AID, []);
  end;
end;

procedure TMeasureSelector.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);

end;

procedure TMeasureSelector.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;


procedure TMeasureSelector.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if (P.y <= THackGrid(Sender).RowHeights[0]) or (not btnOk.Enabled) then
    Exit;
  btnOk.Click;
end;

procedure TMeasureSelector.aAddExecute(Sender: TObject);
var
 ID:Variant;
begin
{$IFNDEF LC}
 ID:=-1;
 if ShowMeasureDetailForm(ID, false, -1, '', Fid_Bsn) then
  begin
   with cdsMeasureGetList do
   begin
     Close;
     Open;
     Locate('id_Measure', Id, [loCaseInsensitive]);
    end;
  end;
{$ENDIF}
end;

procedure TMeasureSelector.aEditExecute(Sender: TObject);
var
 ID:Variant;
begin
{$IFNDEF LC}
 ID:=cdsMeasureGetList.FieldByName('id_Measure').Value;
 if ShowMeasureDetailForm(ID, false, -1, '', Fid_Bsn) then
  begin
   with cdsMeasureGetList do
   begin
     Close;
     Open;
     Locate('id_Measure', Id, [loCaseInsensitive]);
    end;
  end;
{$ENDIF}
end;

end.
