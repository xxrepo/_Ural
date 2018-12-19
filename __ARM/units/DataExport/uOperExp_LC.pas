unit uOperExp_LC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frBsnSelector, DBClient, Db, RxMemDS, dbgrids, Provider, dbgridEh,
  Grids, ComCtrls, ToolWin, ImgList, ActnList, Menus;

type
  TOperExp_LC = class(TForm)
    fBsnSelector1: TfBsnSelector;
    ActionList1: TActionList;
    aProperty: TAction;
    aRefreshe: TAction;
    aDelete: TAction;
    ilImage: TImageList;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sep1: TToolButton;
    ToolButton4: TToolButton;
    dsExp: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    aExit: TAction;
    aSave: TAction;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    cdsExp: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    mtExp: TRxMemoryData;
    RxDBGrid1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aPropertyExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure dsExpDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure aExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aSaveExecute(Sender: TObject);
  private
    FAddSVCData : boolean;
    Fid_business : Variant;
    FDBGrid : TDBGridEh;
    procedure AddToSelect(CDS: TDataSet);
    function DoEditOper(AReadOnly : boolean; id_OperParent: Variant; ACorrect, ACopy : boolean; ADelMode : boolean;
                        var ID : integer; aBack : boolean = false) : boolean;
    procedure AddSVCData;
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;

    procedure Initialize(DBGrid : TDBGridEh; AOnlySel : boolean);
  end;

var
  OperExp_LC: TOperExp_LC;

procedure ShowWHExp_LC(DBGrid : TDBGridEh; AOnlySel : boolean = false);

implementation

uses foMyFunc, uDM, uFormApi_OperLC, foMyFuncEh, uPrgForm;

{$R *.DFM}

procedure ShowWHExp_LC(DBGrid : TDBGridEh; AOnlySel : boolean);
var F : TOperExp_LC;
begin
  F := TOperExp_LC.Create(nil);
  try
    F.Show;
    F.Repaint;
    F.Initialize(DBGrid, AOnlySel);
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

constructor TOperExp_LC.Create(AOwner: TCOmponent);
begin
  inherited;
  Fid_business := Null;
  FAddSVCData := false;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + Name + '\q' + ClassName);
end;

procedure TOperExp_LC.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

destructor TOperExp_LC.Destroy;
begin
  SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + Name + '\q' + ClassName);
  inherited;
end;

procedure TOperExp_LC.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\2' + Name);
end;

procedure TOperExp_LC.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\2' + Name);
end;

procedure TOperExp_LC.Initialize(DBGrid : TDBGridEh; AOnlySel : boolean);
var i : integer;
    OldRecNo : integer;
begin
  FDBGrid := DBGrid;
  with DBGrid.DataSource.DataSet do
  begin
    OldRecNo := RecNo;
    DisableControls;
    RxDBGrid1.DataSource.DataSet.DisableControls;
    try
      Screen.Cursor := crSQLWait;
      if AOnlySel then
      begin
        for i := 0 to DBGrid.SelectedRows.Count - 1 do
        begin
          GotoBookmark(Pointer(DBGrid.SelectedRows.Items[i]));
          AddToSelect(DBGrid.DataSource.DataSet);
        end
      end
      else
      begin
        First;
        while not Eof do
        begin
          AddToSelect(DBGrid.DataSource.DataSet);
          Next;
        end;
      end;
    finally
      Screen.Cursor := crDefault;
      RxDBGrid1.DataSource.DataSet.EnableControls;
      RxDBGrid1.DataSource.DataSet.First;
      RecNo := OldRecNo;
      EnableControls;
    end;
  end;
end;

procedure TOperExp_LC.AddToSelect(CDS : TDataSet);
var i : integer;
    AField : TField;
begin
  with dsExp.DataSet do
  begin
    if not Active then
      Open;
    if (CDS.FieldByName('OperVid').AsInteger = -1) {or (CDS.FieldByName('is_Mirr').AsBoolean)} then
      Exit;
    DisableControls;
    try
      if Fid_business = Null then
        Fid_business := CDS.FieldByName('id_business').AsInteger;
    //  if not Locate('id_Oper', CDS.fieldByName('id_Oper').AsInteger, []) then
      begin
        Append;
        for i := 0 to CDS.Fields.Count - 1 do
        begin
          AField := FindField(CDS.Fields[i].FieldName);
          if AField <> nil then
            AField.Value := CDS.Fields[i].Value;
        end;
        if not FieldByName('id_goods').IsNull  then
           dsExp.DataSet.FieldByName('CtgName').Value := DM.rsCA.AppServer.GetWateCtg(FieldByName('id_goods').Value);
        Post;
      end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TOperExp_LC.AddSVCData;
var S : String;
    i, PosStr, PosDig : integer;
    AField: TField;
begin
  if FAddSVCData then Exit;
  FAddSVCData := true;
  with dsExp.DataSet do
  begin
    First;
    for i := 0 to FDBGrid.Columns.Count - 1 do
    begin
      AField := FDBGrid.Columns[i].Field;
      PosStr := Pos('STR', UpperCase(AField.FieldName));
      PosDig := Pos('DIG', UpperCase(AField.FieldName));
      if (PosStr > 0) or (PosDig > 0) then
      begin
        Insert;
        FieldByName('id_business').AsVariant := Fid_business;
        FieldByName('id_LC_Oper').AsInteger := -1;
        FieldByName('OperNum').AsString := AField.FieldName;
        FieldByName('WareName').AsString := FDBGrid.Columns[i].Title.Caption;
        if PosDig > 0 then
          FieldByName('WareName').AsString := FieldByName('WareName').AsString + '@1'
        else
          FieldByName('WareName').AsString := FieldByName('WareName').AsString + '@2';
        Post;
      end;
    end;
  end;
end;


procedure TOperExp_LC.aPropertyExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B : boolean;
begin          
  ID := dsExp.DataSet.FieldByName('id_Oper').AsInteger;
  Rez := false;
  B := (dsExp.DataSet.FieldByName('id_UserChecker').AsInteger <> DM.IDUser) or (dsExp.DataSet.FieldByName('DTDiff').AsInteger <> 0);
  B := (//(dsArc.DataSet.FieldByName('id_UserChecker').AsInteger <> DM.IDUser) and
        (not dsExp.DataSet.FieldByName('CheckDate').IsNull))
       // or (dsArc.DataSet.FieldByName('DTDiff').AsInteger <> 0)
        ;
  Rez := DoEditOper(true, Null, false, false, false, ID);

//  if Rez then
//    RefresheInt(ID)
end;

function TOperExp_LC.DoEditOper(AReadOnly: boolean; id_OperParent: Variant;
  ACorrect, ACopy, ADelMode: boolean; var ID : integer; aBack : boolean): boolean;
var
    Rez : boolean;
    B, IsMy : boolean;
begin
  IsMy := (dsExp.DataSet.FieldByName('id_UserChecker').AsInteger = DM.IDUser);
  IsMy := true;
  ADelMode := ADelMode and (not dsExp.DataSet.IsEmpty)
                      and IsMy
                      and (dsExp.DataSet.FieldByName('CheckDate').IsNull)
                      and (RxDBGrid1.SelectedRows.Count <= 1);// and (cdsArcDTDiff.AsInteger = 0);

//  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Result := false;
  case cdsExp.FieldByName('OperVid').AsInteger of
    1 : Rez := EditOperWareLC(ID, false, false, true);
    2 : Rez := EditOperFinLC(ID, false, false, true);
    4 : Rez := EditOperOffsetLC(ID, false, false, true);
    201 : Rez := EditOperWareLC(ID, false, false, true, true);
  end;
end;

procedure TOperExp_LC.aDeleteExecute(Sender: TObject);
var i : integer;
begin
  if MessageBox(Handle, 'Удалить операции?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION + mb_DefButton2) = idYes then
  begin
    if RxDBGrid1.SelectedRows.Count = 0 then
      dsExp.DataSet.Delete
    else
    begin
      for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
      begin
        RxDBGrid1.DataSource.DataSet.GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
        dsExp.DataSet.Delete;
      end;
      RxDBGrid1.SelectedRows.Clear;
    end;
  end;
end;

procedure TOperExp_LC.dsExpDataChange(Sender: TObject; Field: TField);
begin
  StatusBar1.Panels[0].Text := 'Всего записей: ' + IntToStr(dsExp.DataSet.RecordCount);
  aProperty.Enabled := not dsExp.DataSet.IsEmpty;
  aDelete.Enabled := not dsExp.DataSet.IsEmpty;
  aSave.Enabled := not dsExp.DataSet.IsEmpty;
end;

procedure TOperExp_LC.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aProperty.Execute;
end;

procedure TOperExp_LC.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
    ImgIndex : integer;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.IsEmpty then
    Exit;

  if not (Sender as TDBGridEh).DataSource.DataSet.FieldByName('Sended').AsBoolean then
    TDBGridEh(Sender).Canvas.Font.Style := TDBGridEh(Sender).Canvas.Font.Style + [fsBold];
  if Column.Field = (Sender as TDBGridEh).DataSource.DataSet.FieldByName('CheckDate') then
  begin
    if not (Sender as TDBGridEh).DataSource.DataSet.FieldByName('CheckDate').IsNull then
      ImgIndex := 22
    else
      ImgIndex := -1;

    TDBGridEh(Sender).Canvas.FillRect(Rect);
    ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
  end
  else
  if Column.Field = cdsExp.FieldByName('OperVid') then
  begin
    case Column.Field.AsInteger of
      0 :
      begin
        ImgIndex := 0;
      end;
      1 :
      begin
        ImgIndex := 2;
      end;
      2 :
      begin
        ImgIndex := 1;
      end;
      3 :
      begin
        ImgIndex := 3;
      end;
      4 :
      begin
        ImgIndex := 21;
      end;
      else
        ImgIndex := -1;
    end;
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
  end
  else
    (Sender as TDBGridEh).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TOperExp_LC.RxDBGrid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if ((Sender as TDBGridEh).DataSource.DataSet.IsEmpty) then
    Exit;

  if ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('DTDiff').AsInteger <> 0) and
     (not (Sender as TDBGridEh).DataSource.DataSet.FieldByName('HasViza').AsBoolean) then
    AFont.Style := AFont.Style + [fsBold];

  if ((Column.Field = (Sender as TDBGridEh).DataSource.DataSet.FieldByName('SrcName')) and (not (Sender as TDBGridEh).DataSource.DataSet.FieldByName('SrcName').IsNull) and ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('SrcID_Main').IsNull)) or // Не проверенный источник
     ((Column.Field = (Sender as TDBGridEh).DataSource.DataSet.FieldByName('ReprName')) and (not (Sender as TDBGridEh).DataSource.DataSet.FieldByName('ReprName').IsNull) and ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('ReprID_Main').IsNull)) or // Не проверенный представитель
//     ((Column.Field = dsArc.DataSet.FieldByName('ReprWHName')) and (not dsArc.DataSet.FieldByName('ReprWHName').IsNull) and (dsArc.DataSet.FieldByName('ReprWHID_Main').IsNull)) or // Не проверенный склад
     ((Column.Field = (Sender as TDBGridEh).DataSource.DataSet.FieldByName('WareName')) and (not (Sender as TDBGridEh).DataSource.DataSet.FieldByName('WareName').IsNull) and ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('WareID_Main').IsNull)) {or} // Не проверенный товар
  {   ((Column.Field = dsArc.DataSet.FieldByName('ReprName')) and
      (dsArc.DataSet.FieldByName('id_Repr').IsNull) and
      (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull) and
       (not dsArc.DataSet.FieldByName('ReprName').IsNull)) }
     then
  begin
    AFont.Color := clRed;
    AFont.Style := AFont.Style + [fsBold];
  end;


  if not (gdSelected in State) then
  begin
    if not MayVized((Sender as TDBGridEh).DataSource.DataSet) then
      Background := $00DBD3FE;//clRed;
{    if ((dsArc.DataSet.FieldByName('ContrAgentName').IsNull) and
       (not dsArc.DataSet.FieldByName('id_Repr').IsNull) and
       (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull))
       or
       ((dsArc.DataSet.FieldByName('BusinessName').IsNull))
       or
       ((dsArc.DataSet.FieldByName('KoeffName').IsNull))
       or
       ((dsArc.DataSet.FieldByName('FormalDistribName').IsNull) and (dsArc.DataSet.FieldByName('Koeff').AsInteger <> 0))
       or
       ((dsArc.DataSet.FieldByName('FuncDistribName').IsNull) and (dsArc.DataSet.FieldByName('Koeff').AsInteger <> 0))
       or
       ((dsArc.DataSet.FieldByName('id_Repr').IsNull) and
       (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull) and
       (not dsArc.DataSet.FieldByName('ReprName').IsNull))
       or
       (dsArc.DataSet.FieldByName('HasChild').AsInteger = 1) then
}
  end;
end;

procedure TOperExp_LC.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  ReOrderCDS(Column.Field);
  Column.Title.SortMarker := TSortMarkerEh(GetBtnSortMarker(Column.Field));
end;

procedure TOperExp_LC.aExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TOperExp_LC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOperExp_LC.aSaveExecute(Sender: TObject);
var OldRecNo : integer;
    id_bsn : integer;
begin
  with dsExp.DataSet do
  begin
    OldRecNo := RecNo;
    DisableControls;
    try
      AddSVCData;
      Filter := 'id_LC_Oper<>-1';
      Filtered := false;
      First;
      id_bsn := FieldByName('id_business').AsInteger;
      while not Eof do
      begin
        ShowProgressForm(Handle, RecNo, RecordCount, 'Проверка данных');
        if id_bsn <> FieldByName('id_business').AsInteger then
        begin
          MessageBox(Self.Handle, 'В списке присутствуют операции из разных бизнесов. Экспорт невозможен.', 'Экспорт невозможен', MB_OK + MB_ICONERROR);
          Exit;
        end;
        Next;
      end;
    finally
      Filtered := true;
      RecNo := OldRecNo;
      EnableControls;
      CloseProgressForm;
    end;
  end;
  SaveDialog1.FileName := 'Export ' + FormatDateTime('yyyy-mm-dd hh-mm', Now);
  if SaveDialog1.Execute then
  begin
    ShowProgressForm(Handle, 0, 0, 'Сохранение данных');
    try
      TClientDataSet(dsExp.DataSet).SaveToFile(SaveDialog1.FileName);
    finally
      CloseProgressForm;
    end;
  end;
end;

end.
