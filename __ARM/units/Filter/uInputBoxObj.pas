unit uInputBoxObj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Db, DBClient, MConnect,
  SConnect, Grids, DBGrids, RXDBCtrl, Buttons, ActnList;

type
  TSetOfChar = set of char;

  TFrmInputBoxObj = class(TForm)
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    DataSource1: TDataSource;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    SpeedButton1: TSpeedButton;
    ActionList1: TActionList;
    aOk: TAction;
    Label2: TLabel;
    cdsObj: TClientDataSet;
    cdsObjID: TIntegerField;
    cdsObjName: TStringField;
    cdsObjid_bsn: TIntegerField;
    procedure FilterEditChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aOkExecute(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure cdsObjFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    FMinLen : integer;
  public
    FAllCh : set of char;
  end;

var
  FrmInputBoxObj: TFrmInputBoxObj;
function InputBoxObj(const ACaption : string; id_Obj : integer;
                     var AID : integer; var AName: string;
                     AConnection : TCustomConnection;
                     MinLen : integer;
                     id_business : integer; AOwner : TComponent): boolean;

implementation

uses foMyFunc;

{$R *.DFM}
function InputBoxObj(const ACaption : string; id_Obj : integer;
                     var AID : integer; var AName: string;
                     AConnection : TCustomConnection;
                     MinLen : integer;
                     id_business : integer; AOwner : TComponent): boolean;
var F : TFrmInputBoxObj;
begin
  Result := false;
  F := TFrmInputBoxObj.Create(nil);
  try
    if AOwner is TWinControl then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, TWinControl(AOwner).Handle);

    F.FMinLen := MinLen;
    if MinLen > 0 then
      F.Label1.Caption := 'Введите не менее ' + IntToStr(MinLen) + ' букв'
    else
      F.Label1.Caption := 'Поиск';
    if ACaption <> '' then
      F.Caption := ACaption;
    with F.cdsObj do
    begin
      Close;
      RemoteServer := TCustomRemoteServer(AConnection);
      ProviderName := 'dsObj';
      Params.Clear;
      FetchParams;
      Params.ParamByName('@id_Obj').Value := id_Obj;
      Params.ParamByName('@Name').Value := Null;
      if AID = -1 then
        Params.ParamByName('@ID').Value := Null
      else
        if MinLen > 0 then
          Params.ParamByName('@ID').Value := AID
        else
          Params.ParamByName('@ID').Value := Null;
      F.SpeedButton1.Visible := MinLen > 0;
      if id_business > -1 then
      begin
        with F.cdsObj do
        begin
          Filtered := false;
          Filter := 'id_bsn IS NULL OR id_bsn=' + IntToStr(id_business);
          Filtered := true;
        end;
      end;
      if (MinLen = 0) or (AID <> -1) then
      begin
        Open;
        Locate('ID', AID, []);
      end
      else
      begin
      end;
      if (MinLen = 0) then
        F.FilterEdit.OnChange := F.FilterEditChange;
    end;
    
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AID := F.cdsObj.FieldByName('ID').AsInteger;
      AName := F.cdsObj.FieldByName('Name').AsString;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TFrmInputBoxObj.FilterEditChange(Sender: TObject);
begin
  with cdsObj   do
  begin
    DisableControls;
    try
      Filtered := False;
      FilterOptions := [foCaseInsensitive];
      Filtered := Trim(FilterEdit.Text) <> '';
    finally
      EnableControls;
    end;
  end;
end;

procedure TFrmInputBoxObj.SpeedButton1Click(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    FilterEdit.Text := trim(FilterEdit.Text);
    if Length(FilterEdit.Text) < FMinLen then
      raise Exception.Create('Введите не менее ' + IntToStr(FMinLen) + ' букв');
    with cdsObj do
    begin
      Close;
      Params.ParamByName('@Name').Value := trim(FilterEdit.Text);
      Params.ParamByName('@ID').Value := Null;
      Open;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmInputBoxObj.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 13) then
  begin
    if ActiveControl = FilterEdit then
    begin
      Key := 0;
      if SpeedButton1.Visible then
        SpeedButton1Click(SpeedButton1);
    end
    else
      aOk.Execute;
  end;
end;

procedure TFrmInputBoxObj.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmInputBoxObj.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  aOk.Enabled := not cdsObj.IsEmpty;
  if cdsObj.Active then
    Label2.Caption := 'Всего найдено ' + IntToStr(cdsObj.RecordCount)
  else
    Label2.Caption := '';
end;

procedure TFrmInputBoxObj.FormCreate(Sender: TObject);
begin
  Label2.Caption := '';
end;

procedure TFrmInputBoxObj.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aOk.Execute;
end;

procedure TFrmInputBoxObj.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TFrmInputBoxObj.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TFrmInputBoxObj.cdsObjFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

end.
