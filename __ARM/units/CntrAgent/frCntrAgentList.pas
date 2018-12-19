unit frCntrAgentList;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, db, ActnList, DBClient, registry, ComCtrls,
  ToolWin, Menus, StdCtrls, ExtCtrls;

type
  TfCntrAgentList = class(TFrame)
    RxDBGrid1: TRxDBGrid;
    ActionList1: TActionList;
    aNew: TAction;
    aProperty: TAction;
    aArc: TAction;
    cdsCAgent: TClientDataSet;
    dsCAgent: TDataSource;
    cdsCAgentid_ContrAgent: TAutoIncField;
    cdsCAgentName: TStringField;
    cdsCAgentid_business: TIntegerField;
    cdsCAgentid_CAGroup: TIntegerField;
    cdsCAgentisOwn: TBooleanField;
    cdsCAgentDisabled: TBooleanField;
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
    ToolButton8: TToolButton;
    cdsCAgentBusinessName: TStringField;
    cdsCAgentCAGroupName: TStringField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    aShowMovCA: TAction;
    N7: TMenuItem;
    aSetGrp: TAction;
    aSelAll: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    aExcelExp: TAction;
    Excel1: TMenuItem;
    aB2: TAction;
    N11: TMenuItem;
    dsCAComment: TDataSource;
    cdsCAComment: TClientDataSet;
    dbgComment: TDBGrid;
    Splitter1: TSplitter;
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
    procedure RxDBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FilterEditChange(Sender: TObject);
    procedure aShowMovCAExecute(Sender: TObject);
    procedure aSelAllExecute(Sender: TObject);
    procedure aSetGrpExecute(Sender: TObject);
    procedure aExcelExpExecute(Sender: TObject);
    procedure cdsCAgentFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure aB2Execute(Sender: TObject);
    procedure dbgCommentDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    Fid_Bsn : Variant;
    FReadOnly : boolean;
    FShowToolBar : boolean;

    FDisabled : Variant;
    FisOwn : Variant;
    Fid_CAGroup : Variant;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Initialize(AID : Variant; id_Bsn : Variant;
                   Disabled : Variant; isOwn : Variant; id_CAGroup : Variant;
                   AReadOnly : boolean = false; AShowToolBar : boolean = true);
    property id_CAGroup : Variant read Fid_CAGroup;
  end;

implementation

uses uDM, uFormApi_CA, foMyFunc{$IFNDEF LC}, uFormApi_Oper, uBalance,
  uMovCA_Adv, uBalance_v2, uUnivSelector {$ENDIF};

{$R *.DFM}

procedure TfCntrAgentList.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfCntrAgentList.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aProperty.Execute;
end;

procedure TfCntrAgentList.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfCntrAgentList.RxDBGrid1DrawColumnCell(Sender: TObject;
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
    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfCntrAgentList.aNewExecute(Sender: TObject);
var ID, ID2 : integer;
    isOwn : boolean;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  if DM.FisPPP and not (Fid_CAGroup > 0) then
  begin
    raise Exception.Create('Вы можете создавать контрагентов только в доступных вам группах.');
  end;
  ID := -1;
  ID2 := Fid_Bsn;

  if EditCA(ID, ID2, FisOwn, Fid_CAGroup) then
  begin
    with cdsCAgent do
    begin
      Close;
      Open;
      Locate('id_ContrAgent', ID, []);
    end;
  end;
end;

procedure TfCntrAgentList.aPropertyExecute(Sender: TObject);
var ID, ID2 : integer;
    isOwn : boolean;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  ID :=  cdsCAgentid_ContrAgent.AsInteger;
  isOwn := cdsCAgentisOwn.AsBoolean;
  ID2 := Fid_Bsn;

  if EditCA(ID, ID2, isOwn, Fid_CAGroup) then
  begin
    aRefreshe.Execute;
  end;
end;

procedure TfCntrAgentList.aArcExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
{$IFNDEF LC}
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_ContrAgent := cdsCAgentid_ContrAgent.AsInteger;
  ShowBalance(AParamBlnc);
{$ENDIF}
end;


procedure TfCntrAgentList.Initialize(AID, id_Bsn, Disabled : Variant; isOwn: Variant; id_CAGroup : Variant;
                               AReadOnly : boolean; AShowToolBar : boolean);
begin
  with cdsCAgent do
  begin
    Fid_Bsn := id_Bsn;
    FDisabled := Disabled;
    FisOwn := false;//isOwn;
    Fid_CAGroup := id_CAGroup;

    aNew.Enabled := Fid_Bsn >= 0;

    FReadOnly := AReadOnly;
    FShowToolBar := AShowToolBar;
    ToolBar1.Visible := FShowToolBar;

    Close;
    Params.ParamByName('@id_business').Value := id_Bsn;
    Params.ParamByName('@Disabled').Value := Disabled;
    Params.ParamByName('@isOwn').Value := isOwn;
    Params.ParamByName('@id_CAGroup').Value := id_CAGroup;
    Params.ParamByName('@id_User').Value := DM.IDUser;

    Open;
    if AID <> Null then
      Locate('id_ContrAgent', AID, []);
  end;
end;

constructor TfCntrAgentList.Create(AOwner: TComponent);
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
    TmpOwner: TCustomForm;
begin
  inherited;
  {$IFDEF ACS_v2}
  aProperty.visible := false;
  aArc.Visible := false;
  aB2.Visible := false;
  aDelete.Visible := false;
  {$ENDIF}
{$IFDEF LC}
  aArc.Visible := false;
  aB2.Visible := false;
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

  Splitter1.Visible := DM.ShowComm;
  dbgComment.Visible := DM.ShowComm;      
end;

destructor TfCntrAgentList.Destroy;
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

procedure TfCntrAgentList.aRefresheExecute(Sender: TObject);
var OldID : integer;
begin
  OldID := cdsCAgentid_ContrAgent.AsInteger;
  try
    with cdsCAgent do
    begin
      Close;
      Open;
      Locate('id_ContrAgent', OldID, []);
    end;
  finally

  end;
//*
end;

procedure TfCntrAgentList.aDeleteExecute(Sender: TObject);
var i : integer;
    S : String;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  if RxDBGrid1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(RxDBGrid1.SelectedRows.Count) + ' контрагентов?'
  else
    S := 'Удалить контрагента?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if RxDBGrid1.SelectedRows.Count > 0 then
      begin
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
          DM.rsCA.AppServer.CA_ContrAgentDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_ContrAgent').AsInteger);
        end;
      end
      else
        DM.rsCA.AppServer.CA_ContrAgentDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_ContrAgent').AsInteger);
    finally
      aRefreshe.Execute;
    end;
  end;
end;

procedure TfCntrAgentList.dsCAgentDataChange(Sender: TObject;
  Field: TField);
begin
  aExcelExp.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
  aShowMovCA.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
  aProperty.Enabled := not (Sender as TDataSource).DataSet.IsEmpty and not FReadOnly;
  aArc.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;// and not FReadOnly;
  aB2.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;// and not FReadOnly;
  aDelete.Enabled := not (Sender as TDataSource).DataSet.IsEmpty and not FReadOnly
                     and not (Sender as TDataSource).DataSet.FieldByName('Disabled').AsBoolean;
  aSetGrp.Enabled := not (Sender as TDataSource).DataSet.IsEmpty and not FReadOnly;
  ShowText('Всего контрагентов: ' + IntToStr((Sender as TDataSource).DataSet.RecordCount), 1);

  if dbgComment.Visible then
  begin
    with cdsCAComment do
    begin
      Close;
      Params.ParamByName('@id_ContrAgent').AsInteger := cdsCAgentid_ContrAgent.AsInteger;
      Open;
    end;
  end;
end;

procedure TfCntrAgentList.RxDBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if (ssLeft in Shift) and (THackGrid(Sender).RowHeights[0] < Y) then
    (Sender as TDBGrid).BeginDrag(true);
end;

procedure TfCntrAgentList.FilterEditChange(Sender: TObject);
begin
  with cdsCAgent do
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

procedure TfCntrAgentList.aShowMovCAExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  {$IFNDEF LC}
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_business := Fid_Bsn;
  AParamBlnc.id_ContrAgent := cdsCAgentid_ContrAgent.AsInteger;
  ShowMovCA_Adv(eotCA, AParamBlnc);
  {$ENDIF}
end;

procedure TfCntrAgentList.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TfCntrAgentList.aSetGrpExecute(Sender: TObject);
var AID : Variant;
    AName : String;
    i : integer;
begin
  AID := -1;
  if SelectCAGroup(Fid_Bsn, AID, AName) then
  begin
    try
      RxDBGrid1.DataSource.DataSet.DisableControls;
      if RxDBGrid1.SelectedRows.Count > 0 then
      begin
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
          DM.rsCA.AppServer.ContrAgentSetGrp(RxDBGrid1.DataSource.DataSet.FieldByName('id_ContrAgent').AsInteger, AID);
        end;
      end
      else
        DM.rsCA.AppServer.ContrAgentSetGrp(RxDBGrid1.DataSource.DataSet.FieldByName('id_ContrAgent').AsInteger, AID);
    finally
      RxDBGrid1.DataSource.DataSet.EnableControls;
      aRefreshe.Execute;
    end;
  end;
end;

procedure TfCntrAgentList.aExcelExpExecute(Sender: TObject);
begin
  GreedToExcel(RxDBGrid1, 'Контрагенты');
end;

procedure TfCntrAgentList.cdsCAgentFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

procedure TfCntrAgentList.aB2Execute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
{$IFNDEF LC}
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_ContrAgent := cdsCAgentid_ContrAgent.AsInteger;
  ShowBalance_v2(AParamBlnc);
{$ENDIF}
end;

procedure TfCntrAgentList.dbgCommentDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var R : TRect;
    S : String;
    Y : integer;
begin
  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  begin
    if (gdSelected in State) then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clHighlight;
      TDBGrid(Sender).Canvas.FillRect(Rect);
    end;

    if not (gdSelected in State) and ((Sender as TDBGrid).DataSource.DataSet.FieldByName('CommentType').AsInteger = -1) then
      TDBGrid(Sender).Canvas.Font.Color := clRed
    else
      if not (gdSelected in State) and ((Sender as TDBGrid).DataSource.DataSet.FieldByName('CommentType').AsInteger = 1) then
        TDBGrid(Sender).Canvas.Font.Color := clGreen;

    if Column.Index = 0 then
    begin
        (Sender as TDBGrid).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, IntToStr((Sender as TDBGrid).DataSource.DataSet.RecNo));
    end
    else
    begin
      R := Rect;
      S := (Sender as TDBGrid).DataSource.DataSet.FieldByName('Comment').AsString;
      Y := DrawText((Sender as TDBGrid).Canvas.Handle, PChar(S), -1, R, DT_WORDBREAK or DT_CALCRECT);
      if Y > THackGrid(Sender).RowHeights[THackGrid(Sender).DataLink.ActiveRecord + 1] then
        THackGrid(Sender).RowHeights[THackGrid(Sender).DataLink.ActiveRecord + 1] := Y;
      R := Rect;
      R.Bottom := R.Top + Y;
      DrawText((Sender as TDBGrid).Canvas.Handle, PChar(S), -1, R, DT_LEFT or DT_WORDBREAK);
    end;
  end;
end;

end.
