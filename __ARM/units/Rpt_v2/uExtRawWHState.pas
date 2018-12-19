unit uExtRawWHState;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Grids, DBGridEh, frBsnSelector, Db, DBClient,
  DBSumLst;

type
  TExtRawWHState = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxDBGrid1: TDBGridEh;
    cdsERWHState: TClientDataSet;
    dsArc: TDataSource;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    Button1: TButton;
    cdsERWHStateid_ExtRaw: TAutoIncField;
    cdsERWHStateid_Ctg_ExtRaw: TIntegerField;
    cdsERWHStateName: TStringField;
    cdsERWHStateTotalAmount: TFloatField;
    cdsERWHStateTotalSum: TFloatField;
    cdsERWHStateid_Currency: TIntegerField;
    cdsERWHStateCRNName: TStringField;
    cdsERWHStateid_Currency_UST: TIntegerField;
    cdsERWHStatePrice: TFloatField;
    cdsERWHStateCRN_UST: TStringField;
    cdsERWHStateAvgPrice: TFloatField;
    cdsERWHStateMeasureName: TStringField;
    Edit1: TEdit;
    Label1: TLabel;
    DBSumList1: TDBSumList;
    procedure Button1Click(Sender: TObject);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure DBSumList1SumListChanged(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    procedure Initialize(id_business : Variant; ADate : Variant);
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure ShowExtRawWHStat(id_business : Variant; ADate : Variant);

var
  ExtRawWHState: TExtRawWHState;

implementation

uses uDM, foMyFunc, foMyFuncEh;

procedure ShowExtRawWHStat(id_business : Variant; ADate : Variant);
var F : TExtRawWHState;
begin
  F := TExtRawWHState.Create(nil);
  try
    F.Initialize(id_business, Null);
    F.Show;
  except
    F.Free;
  end;
end;

{$R *.DFM}

procedure TExtRawWHState.Button1Click(Sender: TObject);
var id_business : Variant;
    ADate : Variant;
begin
  id_business := fBsnSelector1.ID;
{  if dtTo.Checked then
    ADate := Int(dtTo.Date) - 1
  else
    ADate := Null;  }
  Initialize(id_business, ADate);
end;

constructor TExtRawWHState.Create(AOwner: TCOmponent);
begin
  inherited;

  LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + Name + '\' + ClassName);

  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
//  dtTo.Date := Now;
//  dtTo.Checked := false;

end;

procedure TExtRawWHState.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

destructor TExtRawWHState.Destroy;
begin
  LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + Name + '\' + ClassName);
  inherited;
end;

procedure TExtRawWHState.Initialize(id_business, ADate: Variant);
begin
  if fBsnSelector1.ID <> id_business then
    fBsnSelector1.ID := id_business;
  Screen.Cursor := crSQLWait;
  Button1.Enabled := false;
  try
    with cdsERWHState do
    begin
      Close;
      Params.ParamByName('@id_business').Value := id_business;
   //   Params.ParamByName('@Date').Value := ADate;

      if id_business = Null then
        Exit;
      Open;
    end;
 //   dxMasterView2.Items.Expand(true);
 //   dxMasterView2.Items.Collapse(true);
  finally
    Screen.Cursor := crDefault;
    Button1.Enabled := true;
  end;

end;

procedure TExtRawWHState.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  ReOrderCDS(Column.Field);
  Column.Title.SortMarker := TSortMarkerEh(GetBtnSortMarker(Column.Field));
end;

procedure TExtRawWHState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TExtRawWHState.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TExtRawWHState.DBSumList1SumListChanged(Sender: TObject);
begin
  Edit1.Text := FormatFloat('### ### ### ##0.##', DBSumList1.SumCollection[0].SumValue)
end;

end.
