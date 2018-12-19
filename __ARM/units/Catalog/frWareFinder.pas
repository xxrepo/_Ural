unit frWareFinder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, uDM, foMyFunc, Buttons, Registry, Grids, DBGrids,
  RXDBCtrl, Db, DBClient, ComCtrls;

type
  TSelectEventEvent = procedure(ID, ID_Ctg : integer) of object;

  TfWareFinder = class(TFrame)
    cdsFindGoods: TClientDataSet;
    cdsFindGoodsID: TAutoIncField;
    cdsFindGoodsName: TStringField;
    cdsFindGoodsShortName: TStringField;
    cdsFindGoodsBarCode: TStringField;
    DataSource1: TDataSource;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    tsWare: TTabSheet;
    tsCat: TTabSheet;
    Panel3: TPanel;
    grdList: TRxDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    edFilter: TComboBox;
    Panel4: TPanel;
    edFilterCtg: TComboBox;
    RxDBGrid1: TRxDBGrid;
    cdsFind_Ctg_Ware: TClientDataSet;
    dsFind_Ctg_Ware: TDataSource;
    cdsFind_Ctg_WareID: TIntegerField;
    cdsFind_Ctg_WareName: TStringField;
    cdsFind_Ctg_WareShortName: TStringField;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btnOk: TSpeedButton;
    Label2: TLabel;
    cdsFindGoodsCatName: TStringField;
    procedure grdListCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure grdListGetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure grdListDblClick(Sender: TObject);
    procedure edFilterKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure SpeedButton1Click(Sender: TObject);
  private
    Fid_Ctg : Variant;
    Fid_Bsn : Variant;
    FSelectEvent : TSelectEventEvent;
    FSelectOne : boolean;
    Reg2 : TRegistry;
    function DoFindWare(AName: String): boolean;
    procedure DoSelect;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure saveStng;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Initialize(id_Ctg : Variant; id_Bsn : Variant; ASelectEvent : TSelectEventEvent; ASelectOne : boolean);
  end;

implementation

{$R *.DFM}

constructor TfWareFinder.Create(AOwner: TComponent);
var
    FullRegPathName : String;
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  Visible := false;
  LoadGridSettingsFromRegistry(grdList, SRegPath + '\grdList3');
  Reg2 := TRegistry.Create;
  try
    Reg2.RootKey := HKEY_CURRENT_USER;
    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg2.OpenKey(FullRegPathName, true) then
    begin
      GetValues(Reg2, edFilter.Items, 'WarezNames');
      GetValues(Reg2, edFilterCtg.Items, 'WaresCtgNames');
    end;
  finally
    Reg2.CloseKey;
 //   Reg2.Free;
  end;


end;

destructor TfWareFinder.Destroy;
var Reg : TRegistry;
    FullRegPathName : String;
begin
  Reg2.Free;
{  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, true) then
    begin
      SaveValues(Reg, edFilter.Items, 'WarezNames');
      SaveValues(Reg, edFilterCtg.Items, 'WaresCtgNames');

    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
   SaveGridSettingsToRegistry(grdList,  SRegPath + '\grdList');
      }
  inherited;

end;

procedure TfWareFinder.Initialize(id_Ctg: Variant; id_Bsn: Variant; ASelectEvent : TSelectEventEvent; ASelectOne : boolean);
begin
  Fid_Ctg := id_Ctg;
  Fid_Bsn := id_Bsn;
  FSelectEvent := ASelectEvent;
  FSelectOne := ASelectOne;
  
  DataSource1.DataSet := cdsFindGoods;
  Caption := 'Поиск товара';
  tsWare.Caption := Caption;
  PageControl1.ActivePage := tsWare;
end;

function TfWareFinder.DoFindWare(AName: String): boolean;
var Rez : integer;
begin
  if PageControl1.ActivePage = tsWare then
  begin
    if trim(AName) = '' then
    begin
      edFilter.SetFocus;
      raise Exception.Create('Не задано название');
    end;
    NewFilterValue(edFilter, edFilter.Text);
//    saveStng;
    Result := false;
    with TClientDataSet(DataSource1.DataSet) do
    begin
      Close;
      Params.ParamByName('@id_business').Value := Fid_Bsn;
      Params.ParamByName('@id_Ctg').Value := Fid_Ctg;
      Params.ParamByName('@Name').Value := AName;
      Open;

      StatusBar1.Panels[0].Text := 'Всего найдено ' + IntToStr(RecordCount);
    end;
  end
  else
  begin
    if trim(AName) = '' then
    begin
      edFilterCtg.SetFocus;
      raise Exception.Create('Не задано название категории');
    end;
    NewFilterValue(edFilterCtg, edFilterCtg.Text);
    Result := false;
    with cdsFind_Ctg_Ware do
    begin
      Close;
      Params.ParamByName('@id_business').Value := Fid_Bsn;
      Params.ParamByName('@Name').Value := AName;

      Params.ParamByName('@isGoods').Value := false;

      Params.ParamByName('@isGoods').Value := true;
      Open;

      StatusBar1.Panels[0].Text := 'Всего найдено ' + IntToStr(RecordCount);
    end;
  end
end;

procedure TfWareFinder.grdListCheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfWareFinder.grdListGetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfWareFinder.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

procedure TfWareFinder.grdListDblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  if not THackGrid(Sender).DataSource.DataSet.IsEmpty then
    DoSelect;
//    ModalResult := mrOk;
end;

procedure TfWareFinder.edFilterKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DoFindWare((Sender as TComboBox).Text);
end;

procedure TfWareFinder.SpeedButton2Click(Sender: TObject);
begin
  if PageControl1.ActivePage = tsWare then
    DoFindWare(edFilter.Text)
  else
    DoFindWare(edFilterCtg.Text);
end;

procedure TfWareFinder.DoSelect;
begin
//  ModalResult  := mrOk;
  if Assigned(FSelectEvent) and (
    ((PageControl1.ActivePage = tsWare) and (not DataSource1.DataSet.IsEmpty)) or
    ((PageControl1.ActivePage = tsCat) and (not cdsFind_Ctg_Ware.IsEmpty)) ) then
    try
      if PageControl1.ActivePage = tsWare then
        FSelectEvent(DataSource1.DataSet.FieldByName('ID').AsInteger, -13)
      else
        FSelectEvent( -13, cdsFind_Ctg_Ware.FieldByName('ID').AsInteger);
    except
    end;
end;

procedure TfWareFinder.btnOkClick(Sender: TObject);
begin
//  ModalResult  := mrOk;
  DoSelect;
end;

procedure TfWareFinder.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  btnOk.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;  

end;

procedure TfWareFinder.SpeedButton1Click(Sender: TObject);
begin
  Visible := false;
end;

procedure TfWareFinder.saveStng;
var 
    FullRegPathName : String;
begin
  try
    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg2.OpenKey(FullRegPathName, true) then
    begin
      SaveValues(Reg2, edFilter.Items, 'WarezNames');
      SaveValues(Reg2, edFilterCtg.Items, 'WaresCtgNames');

    end;
  finally
    Reg2.CloseKey;
  end;
   SaveGridSettingsToRegistry(grdList,  SRegPath + '\grdList3');
  inherited; 
end;

end.
