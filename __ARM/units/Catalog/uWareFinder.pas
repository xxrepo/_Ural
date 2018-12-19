unit uWareFinder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, uDM, foMyFunc, Buttons, Registry, Grids, DBGrids,
  RXDBCtrl, Db, DBClient, ComCtrls;

type
  TSelectEventEvent = procedure(ID, ID_Ctg : integer) of object;

  TWareFinder = class(TForm)
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
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    btnOk: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel4: TPanel;
    Label2: TLabel;
    edFilterCtg: TComboBox;
    RxDBGrid1: TRxDBGrid;
    cdsFind_Ctg_Ware: TClientDataSet;
    dsFind_Ctg_Ware: TDataSource;
    cdsFind_Ctg_WareID: TIntegerField;
    cdsFind_Ctg_WareName: TStringField;
    cdsFind_Ctg_WareShortName: TStringField;
    procedure grdListCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure grdListGetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure grdListDblClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure edFilterKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Fid_Ctg : Variant;
    Fid_Bsn : Variant;
    FSelectEvent : TSelectEventEvent;
    FSelectOne : boolean;
    
    function DoFindWare(AName: String): boolean;
    procedure DoSelect;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Initialize(id_Ctg : Variant; id_Bsn : Variant; ASelectEvent : TSelectEventEvent; ASelectOne : boolean);
  end;

var
  WareFinder: TWareFinder;

  function ShowWareFinder(id_Ctg : Variant; id_Bsn : Variant; ASelectEvent : TSelectEventEvent; AOwner : TComponent; ASelectOne : boolean): boolean;
implementation

{$R *.DFM}

function ShowWareFinder(id_Ctg : Variant; id_Bsn : Variant; ASelectEvent : TSelectEventEvent; AOwner : TComponent; ASelectOne : boolean): boolean;
begin
  if WareFinder = nil then
    WareFinder := TWareFinder.Create(AOwner)
  else
    WareFinder.BringToFront;
  try
  //  if AOwner is TForm then
  //    F.ParentWindow := TForm(AOwner).Handle;
    WareFinder.Initialize(id_Ctg, id_Bsn, ASelectEvent, ASelectOne);
    WareFinder.Show;
{    while True do
    begin
      F.ShowModal;
      if F.ModalResult = mrOk then
      begin
        if Assigned(ASelectEvent) and (
          ((F.PageControl1.ActivePage = F.tsWare) and (not F.DataSource1.DataSet.IsEmpty)) or
          ((F.PageControl1.ActivePage = F.tsCat) and (not F.cdsFind_Ctg_Ware.IsEmpty)) ) then
          try
            if F.PageControl1.ActivePage = F.tsWare then
              ASelectEvent(F.DataSource1.DataSet.FieldByName('ID').AsInteger, -13)
            else
              ASelectEvent( -13, F.cdsFind_Ctg_Ware.FieldByName('ID').AsInteger);
          except
          end;
     end;
      if ASelectOne or (F.ModalResult = mrCancel) then
        Break;  
    end;     }
  finally
//     WareFinder.Free;
  end;
end;

{ TWareFinder }

constructor TWareFinder.Create(AOwner: TComponent);
var Reg : TRegistry;
    FullRegPathName : String;
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);

  LoadGridSettingsFromRegistry(grdList, SRegPath + '\grdList');
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, true) then
    begin
      GetValues(Reg, edFilter.Items, 'WarezNames');
      GetValues(Reg, edFilterCtg.Items, 'WaresCtgNames');
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;


end;

destructor TWareFinder.Destroy;
var Reg : TRegistry;
    FullRegPathName : String;
begin
  Reg := TRegistry.Create;
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

  inherited;

end;

procedure TWareFinder.Initialize(id_Ctg: Variant; id_Bsn: Variant; ASelectEvent : TSelectEventEvent; ASelectOne : boolean);
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

function TWareFinder.DoFindWare(AName: String): boolean;
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

procedure TWareFinder.grdListCheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TWareFinder.grdListGetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TWareFinder.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

procedure TWareFinder.grdListDblClick(Sender: TObject);
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

procedure TWareFinder.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  btnOk.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;  
end;

procedure TWareFinder.edFilterKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DoFindWare((Sender as TComboBox).Text);
end;

procedure TWareFinder.SpeedButton2Click(Sender: TObject);
begin
  if PageControl1.ActivePage = tsWare then
    DoFindWare(edFilter.Text)
  else
    DoFindWare(edFilterCtg.Text);
end;

procedure TWareFinder.DoSelect;
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
  if FSelectOne {or (F.ModalResult = mrCancel) }then
    Close;  
end;

procedure TWareFinder.btnOkClick(Sender: TObject);
begin
//  ModalResult  := mrOk;
  DoSelect;
end;

procedure TWareFinder.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TWareFinder.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
  WareFinder := nil;
end;

procedure TWareFinder.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TWareFinder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
