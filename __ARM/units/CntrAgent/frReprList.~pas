unit frReprList;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, db, ActnList, DBClient, registry, ComCtrls,
  ToolWin, Menus, StdCtrls, ExtCtrls;

type
  TfReprList = class(TFrame)
    RxDBGrid1: TRxDBGrid;
    ActionList1: TActionList;
    aNew: TAction;
    aProperty: TAction;
    aArc: TAction;
    cdsPepr: TClientDataSet;
    dsCAgent: TDataSource;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    aRefreshe: TAction;
    ToolButton4: TToolButton;
    aDelete: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    cdsPeprid_Repr: TAutoIncField;
    cdsPeprid_ContrAgent: TIntegerField;
    cdsPeprisJur: TBooleanField;
    cdsPeprName: TStringField;
    cdsPeprCAName: TStringField;
    cdsPeprDisabled: TBooleanField;
    cdsPeprId_Currency: TIntegerField;
    cdsPeprCurrencyName: TStringField;
    cdsPeprid_business2: TIntegerField;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    cdsPeprID_Main: TIntegerField;
    cdsPeprNeedSend: TBooleanField;
    aExcelExp: TAction;
    Excel1: TMenuItem;
    aSelAll: TAction;
    N4: TMenuItem;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure aNewExecute(Sender: TObject);
    procedure aPropertyExecute(Sender: TObject);
    procedure aArcExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure dsCAgentDataChange(Sender: TObject; Field: TField);
    procedure FilterEditChange(Sender: TObject);
    procedure aExcelExpExecute(Sender: TObject);
    procedure cdsPeprFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure aSelAllExecute(Sender: TObject);
  private
    Fid_CA : Variant;
    FReadOnly : boolean;
    FShowToolBar : boolean;

    FDisabled : Variant;
    function GetRepr_ID: Variant;
    function GetRepr_Name: String;
    procedure SetRepr_ID(const Value: Variant);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Initialize(AID, id_CA, Disabled : Variant; id_Bsn : Variant;
                   AReadOnly : boolean = false; AShowToolBar : boolean = true);
    property Repr_ID : Variant read GetRepr_ID write SetRepr_ID;
    property Repr_Name : String read GetRepr_Name;
  end;

implementation

uses uDM, uFormApi_CA, foMyFunc{$IFNDEF LC}, uFormApi_Oper {$ENDIF};

{$R *.DFM}

procedure TfReprList.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfReprList.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aProperty.Execute;
end;

procedure TfReprList.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfReprList.RxDBGrid1DrawColumnCell(Sender: TObject;
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
    if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').AsBoolean then
    begin
      (Sender as TDBGrid).Canvas.Font.Color := clGray;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;
    if (Sender as TDBGrid).DataSource.DataSet.FieldByName('id_Main').IsNull then
    begin
    //  if not (gdSelected in State) then
    //    (Sender as TDBGrid).Canvas.Font.Color := colorNonViza;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
    end;

    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfReprList.aNewExecute(Sender: TObject);
var ID, ID2 : Variant;
    isOwn : boolean;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  ID := -1;
  ID2 := Fid_CA;

  if EditReprProp(ID, ID2, Null) then
  begin
    with cdsPepr do
    begin
      Close;
      Open;
      Locate('id_Repr', ID, []);
    end;
  end;
end;

procedure TfReprList.aPropertyExecute(Sender: TObject);
var ID, ID2 : Variant;
    isOwn : boolean;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  ID :=  cdsPeprid_Repr.AsInteger;
  ID2 := Fid_CA;

  if EditReprProp(ID, ID2, Null) then
  begin
    aRefreshe.Execute;
  end;
end;

procedure TfReprList.aArcExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
{$IFNDEF LC}
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_Repr := Repr_ID;
  ShowArcUn(AParamBlnc);
{$ENDIF}
end;


procedure TfReprList.Initialize(AID, id_CA, Disabled : Variant; id_Bsn : Variant;
                               AReadOnly : boolean; AShowToolBar : boolean);
begin
  with cdsPepr do
  begin
    Fid_CA := id_CA;
    FDisabled := Disabled;

    aNew.Enabled := id_CA > 0;

    FReadOnly := AReadOnly;
    FShowToolBar := AShowToolBar;

    Close;
    Params.ParamByName('@id_ContrAgent').Value := id_CA;
    Params.ParamByName('@Disabled').Value := FDisabled;
    Params.ParamByName('@id_Bsn').Value := id_Bsn;
    try
      Params.ParamByName('@id_User').Value := DM.IDUser;
    except
    end;
    
    ToolBar1.Visible := FShowToolBar;
    Open;
    if AID <> Null then
      Locate('id_Repr', AID, []);
  end;
end;

constructor TfReprList.Create(AOwner: TComponent);
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
    TmpOwner: TCustomForm;
begin
  inherited;
  {$IFDEF ACS_v2}
  aProperty.visible := false;
  aArc.Visible := false;
  aDelete.Visible := false;
  {$ENDIF}
{$IFDEF LC}
  aArc.Visible := false;
  aDelete.Visible := false;
{$ENDIF}
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      FullRegPathName := SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin                                   
        if Reg.ValueExists('Height') then
          Height := Reg.ReadInteger('Height');
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
end;

destructor TfReprList.Destroy;
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
    TmpOwner: TCustomForm;
begin
   TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;

      FullRegPathName := SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        Reg.WriteInteger('Height', Height);
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  inherited;
end;

procedure TfReprList.aRefresheExecute(Sender: TObject);
var OldID : integer;
begin
  OldID := cdsPeprid_Repr.AsInteger;
  try
    with cdsPepr do
    begin
      Close;
      Open;
      Locate('id_Repr', OldID, []);
    end;
  finally

  end;
//*
end;

procedure TfReprList.aDeleteExecute(Sender: TObject);
var i : integer;
    S : String;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  if RxDBGrid1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(RxDBGrid1.SelectedRows.Count) + ' представителей?'
  else
    S := 'Удалить представителя?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if RxDBGrid1.SelectedRows.Count > 0 then
      begin
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
          DM.rsCA.AppServer.CA_ReprDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_Repr').AsInteger);
        end;
      end
      else
        DM.rsCA.AppServer.CA_ReprDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_Repr').AsInteger);
    finally
      aRefreshe.Execute;
    end;
  end;
end;

procedure TfReprList.dsCAgentDataChange(Sender: TObject;
  Field: TField);
begin
  aExcelExp.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
  aProperty.Enabled := not (Sender as TDataSource).DataSet.IsEmpty and not FReadOnly;
  aArc.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;// and not FReadOnly;
  aDelete.Enabled := not (Sender as TDataSource).DataSet.IsEmpty and not FReadOnly
                     and not (Sender as TDataSource).DataSet.FieldByName('Disabled').AsBoolean;
  ShowText('Всего представителей: ' + IntToStr((Sender as TDataSource).DataSet.RecordCount), 2);
end;

function TfReprList.GetRepr_ID: Variant;
begin
  Result := cdsPepr.FieldByName('id_Repr').Value;
end;

function TfReprList.GetRepr_Name: String;
begin
  Result := cdsPeprName.AsString;
end;

procedure TfReprList.SetRepr_ID(const Value: Variant);
begin
  if cdsPepr.Active then
    cdsPepr.Locate('id_Repr', Value, []);
end;

procedure TfReprList.FilterEditChange(Sender: TObject);
begin
  with cdsPepr   do
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

procedure TfReprList.aExcelExpExecute(Sender: TObject);
begin
  GreedToExcel(RxDBGrid1, 'Представители');
end;

procedure TfReprList.cdsPeprFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

procedure TfReprList.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

end.
