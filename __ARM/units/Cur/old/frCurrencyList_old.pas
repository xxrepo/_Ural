unit frCurrencyList_old;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Db, DBGrids, RXDBCtrl, ComCtrls, ToolWin, Menus, ActnList, ImgList,
  DBClient, Provider, ADODB, StdCtrls, Mask, ToolEdit, MtUPDPrv,
  frBsnSelector;

type
  TfCurrencyList_old = class(TFrame)
    RxDBGrid1: TRxDBGrid;
    ActionList1: TActionList;
    aNewCurrency: TAction;
    aEditCurrency: TAction;
    aDelCurrency: TAction;
    PopupMenu1: TPopupMenu;
    Action11: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    N1: TMenuItem;
    DelUser1: TMenuItem;
    aRefresh: TAction;
    ToolButton5: TToolButton;
    DataSourceCurrency: TDataSource;
    cdsCur: TClientDataSet;
    ToolButton4: TToolButton;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    ilMenu: TImageList;
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
    procedure aDelCurrencyExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aNewCurrencyExecute(Sender: TObject);
    procedure aEditCurrencyExecute(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DataSourceCurrencyDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
  private
    { Private declarations }
    FID, FFastAccess, FAvForPay: Variant;
    FReadOnly : boolean;
    FShowToolBar : boolean;

    BaseCurrencyName : string;
    BaseCurrencyId : integer;
    function GetCurName: String;
    function GetCurShortName: String;
    function GetID_Curr: integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Initialize(AID : Variant; AFastAccess : Variant; AAvForPay : Variant;
              AReadOnly : boolean = false; AShowToolBar : boolean = true);
    property ID_Curr : integer read GetID_Curr;
    property CurName : String read GetCurName;
    property CurShortName : String read GetCurShortName;
  end;

var
  fCurrencyList_old: TfCurrencyList_old;

implementation

{$R *.DFM}

uses
  CrnCommon,
  uDM, foMyFunc, uFormApi_CrnAdm;

procedure TfCurrencyList_old.aDelCurrencyExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar((Sender as TAction).Hint+' данное значение?'),
    'Внимание', mb_OkCancel)=mrOk then
    with cdsCur do
      begin
      Delete;
      if ApplyUpdates(0)=0 then
        FixIdRefresh(cdsCur, 'Id_Currency');
      end;
end;

procedure TfCurrencyList_old.aRefreshExecute(Sender: TObject);
begin
  FixIdRefresh(cdsCur, 'Id_Currency');
end;

procedure TfCurrencyList_old.aNewCurrencyExecute(Sender: TObject);
var AID: integer;
begin
  AID := -1;
  if EditCurrency(AID, -1) then
  begin
    cdsCur.Close;
    cdsCur.Open;
    cdsCur.Locate('Id_Currency', AID, []);
  end;
end;

procedure TfCurrencyList_old.aEditCurrencyExecute(Sender: TObject);
var AID: integer;
begin
  AID := cdsCurId_Currency.AsInteger;
  if EditCurrency(AID, -1) then
  begin
    cdsCur.Close;
    cdsCur.Open;
    cdsCur.Locate('Id_Currency', AID, []);
  end;
end;

procedure TfCurrencyList_old.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
 end;

procedure TfCurrencyList_old.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aEditCurrency.Execute;
end;

procedure TfCurrencyList_old.PopupMenu1Popup(Sender: TObject);
begin
  if cdsCur.FieldByName('Base').AsBoolean then
    N5.Enabled:=False
  else
    N5.Enabled:=True;
end;

procedure TfCurrencyList_old.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;
    
  if (Column.Field is TBooleanField) then
  begin
    if Column.Field.AsBoolean then
      Style := DFCS_CHECKED
    else
      Style := DFCS_BUTTONCHECK;

    R := Rect;
    cbSize := 15;
    if R.Bottom - R.Top > cbSize then
    begin
      R.Top := R.Top + (R.Bottom - R.Top - cbSize) div 2;
      R.Bottom := R.Top + cbSize;
    end;
    if R.Right - R.Left < cbSize then
    begin
      R.Right := R.Left + cbSize;
    end;

    if gdSelected in State then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clHighlight;
      TDBGrid(Sender).Canvas.FillRect(Rect);
    end;
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, Style);
  end
  else
  begin
    if not (Sender as TDBGrid).DataSource.DataSet.FieldByName('AvForPay').AsBoolean then
    begin
      (Sender as TDBGrid).Canvas.Font.Color := clGray;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;
    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

constructor TfCurrencyList_old.Create(AOwner: TComponent);
begin
  inherited;
  LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).Name + '\' + ClassName);
end;

destructor TfCurrencyList_old.Destroy;
begin
  SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).Name + '\' + ClassName);
  inherited;

end;

function TfCurrencyList_old.GetCurName: String;
begin
  Result := cdsCurName.AsString;
end;

function TfCurrencyList_old.GetCurShortName: String;
begin
  Result := cdsCurShortName.AsString;
end;

function TfCurrencyList_old.GetID_Curr: integer;
begin
  if cdsCur.IsEmpty then
    Result := Null
  else
    Result := cdsCurId_Currency.AsInteger;
end;

procedure TfCurrencyList_old.Initialize(AID, AFastAccess, AAvForPay: Variant;
                                    AReadOnly : boolean; AShowToolBar : boolean);
var i : integer;
begin
  FID := AID;
  FFastAccess := AFastAccess;
  FAvForPay := AAvForPay;
  
  FReadOnly := AReadOnly;

  FShowToolBar := AShowToolBar;
  ToolBar1.Visible := FShowToolBar;

  for i:=0 to ActionList1.ActionCount-1 do
    (ActionList1.Actions[i] as TAction).Hint:=
      (ActionList1.Actions[i] as TAction).Caption;
  with cdsCur do
  begin
    Params.ParamByName('@FastAccess').Value := FFastAccess;
    Params.ParamByName('@AvForPay').Value := FAvForPay;
    if not Active then Open;
    Locate('Id_Currency', FID, []);
  end;
end;

procedure TfCurrencyList_old.DataSourceCurrencyDataChange(Sender: TObject;
  Field: TField);
begin
  aEditCurrency.Enabled := not cdsCur.IsEmpty;
  aDelCurrency.Enabled := not cdsCur.IsEmpty and not cdsCurBase.AsBoolean;
end;

procedure TfCurrencyList_old.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

end.
