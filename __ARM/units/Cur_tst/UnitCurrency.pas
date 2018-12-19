unit UnitCurrency;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Db, DBGrids, RXDBCtrl, ComCtrls, ToolWin, Menus, ActnList, ImgList,
  DBClient, Provider, ADODB, StdCtrls, Mask, ToolEdit, MtUPDPrv;

type
  TFormCurrency = class(TForm)
    RxDBGrid1: TRxDBGrid;
    ActionList1: TActionList;
    NewCurrency: TAction;
    EditCurrency: TAction;
    DelCurrency: TAction;
    PopupMenu1: TPopupMenu;
    Action11: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    N1: TMenuItem;
    DelUser1: TMenuItem;
    Refresh: TAction;
    ToolButton5: TToolButton;
    DataSourceCurrency: TDataSource;
    cdsCur: TClientDataSet;
    ToolButton4: TToolButton;
    N2: TMenuItem;
    N3: TMenuItem;
    StatusBar1: TStatusBar;
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
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DelCurrencyExecute(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure NewCurrencyExecute(Sender: TObject);
    procedure EditCurrencyExecute(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure cdsCurAfterRefresh(DataSet: TDataSet);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    BaseCurrencyName : string;
    BaseCurrencyId : integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FormCurrency: TFormCurrency;

implementation

{$R *.DFM}

uses
  Common,
  Unit1, UnitACurrency, uMainForm, uDM, foMyFunc;

procedure TFormCurrency.FormActivate(Sender: TObject);
var i : integer;
begin
  for i:=0 to ActionList1.ActionCount-1 do
    (ActionList1.Actions[i] as TAction).Hint:=
      (ActionList1.Actions[i] as TAction).Caption;
  with cdsCur do
  begin
    Params.ParamByName('@FastAccess').Value := Null;
    Params.ParamByName('@AvForPay').Value := Null;
    if not Active then Open;
    DisableControls;
    First;
    while not Eof do
    begin
      if FieldByName('Base').AsBoolean then
      begin
        BaseCurrencyName := FieldByName('Name').AsString;
        BaseCurrencyId := FieldByName('Id_Currency').AsInteger;
        StatusBar1.Panels[0].Text:='Базовая валюта: '+BaseCurrencyName;
      end;
      Next;
    end;
    EnableControls;
  end;
end;

procedure TFormCurrency.FormDestroy(Sender: TObject);
begin
  FormCurrency := nil;
end;

procedure TFormCurrency.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormCurrency.DelCurrencyExecute(Sender: TObject);
begin
  if Application.MessageBox(PChar((Sender as TAction).Hint+' данное значение?'),
    'Внимание', mb_OkCancel)=mrOk then
    with cdsCur do
      begin
      Delete;
      if ApplyUpdates(0)=0 then
        FixIdRefresh(cdsCur, 'Id_Currency');
      end;
end;

procedure TFormCurrency.RefreshExecute(Sender: TObject);
begin
  FixIdRefresh(cdsCur, 'Id_Currency');
end;

procedure TFormCurrency.NewCurrencyExecute(Sender: TObject);
begin
  with TFormACurrency.Create(Form1) do
    begin
    try
      Caption:=(Sender as TAction).Caption;
      Tag:=0;
      ShowModal;
    finally
      Free;
      end;
    end;
end;

procedure TFormCurrency.EditCurrencyExecute(Sender: TObject);
begin
  with TFormACurrency.Create(Form1) do
    begin
    try
      Caption:=(Sender as TAction).Caption;
      Tag:=1;
      ShowModal;
    finally
      Free;
      end;
    end;
end;

procedure TFormCurrency.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
var Index : TIndexDef;
begin
  if (Field.DataSet as TClientDataSet).IndexName = '' then Exit;
  Index := (Field.DataSet as TClientDataSet).IndexDefs.Find((Field.DataSet as TClientDataSet).IndexName);
  if Index.Fields = Field.FieldName then
    if not (ixDescending in Index.Options) then
      SortMarker := smDown
    else
      SortMarker := smUp;
end;

procedure TFormCurrency.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
  ReOrderCDS(cdsCur, Field.FieldName);
end;

procedure TFormCurrency.RxDBGrid1DblClick(Sender: TObject);
begin
  if (Sender as TRxDBGrid).DataSource.DataSet.IsEmpty then
    NewCurrency.Execute
  else
    EditCurrency.Execute;
end;

procedure TFormCurrency.PopupMenu1Popup(Sender: TObject);
begin
  if cdsCur.FieldByName('Base').AsBoolean then
    N5.Enabled:=False
  else
    N5.Enabled:=True;
end;

procedure TFormCurrency.cdsCurAfterRefresh(DataSet: TDataSet);
begin
  EditCurrency.Enabled:=not DataSet.IsEmpty;
  DelCurrency.Enabled:=not DataSet.IsEmpty;
end;

procedure TFormCurrency.RxDBGrid1DrawColumnCell(Sender: TObject;
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

constructor TFormCurrency.Create(AOwner: TComponent);
begin
  inherited;
  LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).Name + '\' + ClassName);

end;

destructor TFormCurrency.Destroy;
begin
  SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).Name + '\' + ClassName);
  inherited;

end;

end.
