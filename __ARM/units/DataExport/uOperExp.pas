unit uOperExp;

interface

uses
  dbgridEh, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frBsnSelector, DBClient, Db, RxMemDS, frArc, dbgrids, Provider,
  Grids, ComCtrls, ToolWin, ImgList, ActnList, Menus, GridsEh;

type
  TOperExp = class(TForm)
    fBsnSelector1: TfBsnSelector;
    RxDBGrid1: TDBGridEh;
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
    cdsExtDataDict: TClientDataSet;
    cdsExtDataDictid_Oper_ExtDataNames: TIntegerField;
    cdsExtDataDictid_business: TIntegerField;
    cdsExtDataDictType: TIntegerField;
    cdsExtDataDictNumPrm: TIntegerField;
    cdsExtDataDictParName: TStringField;
    cdsExtDataDictVisible: TBooleanField;
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
    Fid_business : integer;
    procedure AddToSelect(CDS: TDataSet);
    function DoEditOper(AReadOnly : boolean; id_OperParent: Variant; ACorrect, ACopy : boolean; ADelMode : boolean;
                        var ID : integer; Ais_Mirr : boolean = false) : boolean;
    procedure Setid_business(const Value: Variant);
    procedure AddSVCData;
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;

    procedure Initialize(DBGrid : TDBGridEh; AOnlySel : boolean);
  end;

var
  OperExp: TOperExp;

procedure ShowWHExp(DBGrid : TDBGridEh; AOnlySel : boolean = false);

implementation

uses foMyFunc, uDM, uFormApi_Oper, foMyFuncEh, uPrgForm;

{$R *.DFM}

procedure ShowWHExp(DBGrid : TDBGridEh; AOnlySel : boolean);
var F : TOperExp;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  F := TOperExp.Create(nil);
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

{ TForm1 }

constructor TOperExp.Create(AOwner: TCOmponent);
begin
  inherited;
  FAddSVCData := false;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + Name + '\' + ClassName);
end;

procedure TOperExp.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

destructor TOperExp.Destroy;
begin
  SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + Name + '\' + ClassName);
  inherited;
end;

procedure TOperExp.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\2' + Name);
end;

procedure TOperExp.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\2' + Name);
end;

procedure TOperExp.Initialize(DBGrid : TDBGridEh; AOnlySel : boolean);
var i : integer;
    OldRecNo : integer;
begin
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
          ShowProgressForm(Handle, i, DBGrid.SelectedRows.Count, 'Импорт данных');
          GotoBookmark(Pointer(DBGrid.SelectedRows.Items[i]));
          AddToSelect(DBGrid.DataSource.DataSet);
        end
      end
      else
      begin
        First;
        while not Eof do
        begin
          ShowProgressForm(Handle, RecNo, RecordCount, 'Импорт данных');
          AddToSelect(DBGrid.DataSource.DataSet);
          Next;
        end;
      end;
      Setid_business(FieldbyNAme('id_business').AsInteger);
    finally
      RxDBGrid1.DataSource.DataSet.EnableControls;
      RxDBGrid1.DataSource.DataSet.First;
      RecNo := OldRecNo;
      EnableControls;
      Screen.Cursor := crDefault;
      CloseProgressForm;
    end;
  end;
end;

procedure TOperExp.Setid_business(const Value: Variant);
var i : integer;
    AField: TField;
    S : String;
begin
  Fid_business := Value;
  with cdsExtDataDict do
  begin
    Close;
    Params.ParamByName('@id_business').Value := Value;
    Open;
    try
      First;
      while Not Eof do
      begin
        case FieldByName('Type').AsInteger of
          1 : S := 'Dig';
          2 : S := 'Str';
          3 : S := 'Date';
        end;
        S := S + FieldByName('NumPrm').AsString;
        S := UpperCase(S);
        for i := 0 to RxDBGrid1.Columns.Count - 1 do
        begin
          if UpperCase(RxDBGrid1.Columns[i].FieldName) = S then
          begin
            RxDBGrid1.Columns[i].Visible := FieldByName('Visible').AsBoolean;
            if FieldByName('Visible').AsBoolean then
              RxDBGrid1.Columns[i].Title.Caption := 'Бюджет|' + FieldByName('ParName').AsString;
          end;
        end;
        Next;
      end;
    finally
      Close;
    end;
  end;
end;

procedure TOperExp.AddSVCData;
var S : String;
    i, PosStr, PosDig : integer;
    AField: TField;
begin
  if FAddSVCData then Exit;
  FAddSVCData := true;
  with dsExp.DataSet do
  begin
    First;
    for i := 0 to RxDBGrid1.Columns.Count - 1 do
    begin
      AField := RxDBGrid1.Columns[i].Field;
      PosStr := Pos('STR', UpperCase(AField.FieldName));
      PosDig := Pos('DIG', UpperCase(AField.FieldName));
      if (PosStr > 0) or (PosDig > 0) then
      begin
        Insert;
        FieldByName('id_business').AsInteger := Fid_business;
        FieldByName('id_Oper').AsInteger := -1;
        FieldByName('OperNum').AsString := AField.FieldName;
        FieldByName('WareName').AsString := RxDBGrid1.Columns[i].Title.Caption;
        if PosDig > 0 then
          FieldByName('WareName').AsString := FieldByName('WareName').AsString + '@1'
        else
          FieldByName('WareName').AsString := FieldByName('WareName').AsString + '@2';
        Post;
      end;
    end;
  end;
end;

procedure TOperExp.AddToSelect(CDS : TDataSet);
var i : integer;
    AField : TField;
begin
  with dsExp.DataSet do
  begin
    if not Active then
      Open;
    if (CDS.FieldByName('OperVid').AsInteger = -1) or (CDS.FieldByName('is_Mirr').AsBoolean) then
      Exit;
    DisableControls;
    try
    //  if not Locate('id_Oper', CDS.fieldByName('id_Oper').AsInteger, []) then
      begin
        Append;
        for i := 0 to CDS.Fields.Count - 1 do
        begin
          AField := FindField(CDS.Fields[i].FieldName);
          if AField <> nil then
            AField.Value := CDS.Fields[i].Value;
        end;
        if not FieldByName('id_goods').IsNull then
           dsExp.DataSet.FieldByName('CtgName').Value := DM.rsCA.AppServer.GetWateCtg(FieldByName('id_goods').Value);
        Post;
      end;
    finally
      EnableControls;
    end;
  end;
end;


procedure TOperExp.aPropertyExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr : boolean;
begin
  ID := dsExp.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsExp.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := false;
  B := (dsExp.DataSet.FieldByName('id_UserChecker').AsInteger <> DM.IDUser) or (dsExp.DataSet.FieldByName('DTDiff').AsInteger <> 0);
  B := (//(dsArc.DataSet.FieldByName('id_UserChecker').AsInteger <> DM.IDUser) and
        (not dsExp.DataSet.FieldByName('CheckDate').IsNull))
       // or (dsArc.DataSet.FieldByName('DTDiff').AsInteger <> 0)
        ;
  Rez := DoEditOper(true, Null, false, false, false, ID, Ais_Mirr);
end;

function TOperExp.DoEditOper(AReadOnly: boolean; id_OperParent: Variant;
  ACorrect, ACopy, ADelMode: boolean; var ID : integer; Ais_Mirr : boolean): boolean;
var
    Rez : boolean;
    B, IsMy : boolean;
var AOperParamz : TOperParamz;
begin
  AOperParamz := getEmptyOperParamz;
  IsMy := (dsExp.DataSet.FieldByName('id_UserChecker').AsInteger = DM.IDUser);
  IsMy := true;
  ADelMode := ADelMode and (not dsExp.DataSet.IsEmpty)
                      and IsMy
                      and (dsExp.DataSet.FieldByName('CheckDate').IsNull)
                      and (RxDBGrid1.SelectedRows.Count <= 1);// and (cdsArcDTDiff.AsInteger = 0);

  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ReadOnly := AReadOnly ;
  AOperParamz.ID_Oper := ID;
  AOperParamz.is_Mirr := Ais_Mirr;
  AOperParamz.Correct := ACorrect;
  AOperParamz.Copy := ACopy;
  AOperParamz.DelMode := ADelMode;

  //  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Result := false;
  case dsExp.DataSet.FieldByName('OperVid').AsInteger of
    -1 : EditOperCrnCh(Handle, AOperParamz); 
    0 : EditOperEmpty(Handle, AOperParamz);
    1 : EditOperWare(Handle, AOperParamz);
    2 : EditOperFin(Handle, AOperParamz);
    4 : EditOperOffset(Handle, AOperParamz);
    
    101 : EditOperWare_FFF(Handle, AOperParamz);
    102 : EditOperFin_FFF(Handle, AOperParamz);

    201 : EditOperWare(Handle, AOperParamz);
  end;
end;

procedure TOperExp.aDeleteExecute(Sender: TObject);
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

procedure TOperExp.dsExpDataChange(Sender: TObject; Field: TField);
begin
  StatusBar1.Panels[0].Text := 'Всего записей: ' + IntToStr(dsExp.DataSet.RecordCount);
  aProperty.Enabled := not dsExp.DataSet.IsEmpty;
  aDelete.Enabled := not dsExp.DataSet.IsEmpty;
  aSave.Enabled := not dsExp.DataSet.IsEmpty;
end;

procedure TOperExp.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aProperty.Execute;
end;

procedure TOperExp.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
    S : String;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.IsEmpty then
    Exit;

  if Column.Field = (Sender as TDBGridEh).DataSource.DataSet.FieldByName('OperState') then
  begin
    if (Sender as TDBGridEh).DataSource.DataSet.FieldByName('HasViza').AsBoolean then
      ImgIndex := 22
    else
    begin
      if (Sender as TDBGridEh).DataSource.DataSet.FieldByName('OperState').AsInteger = -1 then
        ImgIndex := 26
      else
        ImgIndex := -1;
    end;
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
  end
  else
    if Column.Field = (Sender as TDBGridEh).DataSource.DataSet.FieldByName('OperVid') then
    begin
      case Column.Field.AsInteger of
        -1 :
        begin
          ImgIndex := 29;
        end;
        0 :
        begin
          ImgIndex := 0;
        end;
        1, 101 :
        begin
          ImgIndex := 2;
        end;
        2, 102 :
        begin
          ImgIndex := 1;
        end;
        3, 103 :
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
    begin
      TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

      // Красим незаполненные ячейки
      if ((Column.Field = (Sender as TDBGridEh).DataSource.DataSet.FieldByName('ContrAgentName')) and
         ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('ContrAgentName').IsNull) and
         (not (Sender as TDBGridEh).DataSource.DataSet.FieldByName('id_Repr').IsNull) and
         (not (Sender as TDBGridEh).DataSource.DataSet.FieldByName('id_Repr_Ex').IsNull))
         or
         ((Column.Field = (Sender as TDBGridEh).DataSource.DataSet.FieldByName('BusinessName')) and
         ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('BusinessName').IsNull))
         or
         ((Column.Field = (Sender as TDBGridEh).DataSource.DataSet.FieldByName('KoeffName')) and
         ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('KoeffName').IsNull))
         or
         ((Column.Field = (Sender as TDBGridEh).DataSource.DataSet.FieldByName('FormalDistribName')) and
         ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('FormalDistribName').IsNull) and ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('Koeff').AsInteger <> 0))
         or
         ((Column.Field = (Sender as TDBGridEh).DataSource.DataSet.FieldByName('FuncDistribName')) and
         ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('FuncDistribName').IsNull) and ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('Koeff').AsInteger <> 0))
         or
         ((Column.Field = (Sender as TDBGridEh).DataSource.DataSet.FieldByName('ReprName')) and
         ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('id_Repr').IsNull) and
         (not (Sender as TDBGridEh).DataSource.DataSet.FieldByName('id_Repr_Ex').IsNull) and
         (not (Sender as TDBGridEh).DataSource.DataSet.FieldByName('ReprName').IsNull))
          then
      begin
        TDBGridEh(Sender).Canvas.Brush.Color := clWindow;

        TDBGridEh(Sender).Canvas.Font.Color := clRed;
        TDBGridEh(Sender).Canvas.Font.Style := TDBGridEh(Sender).Canvas.Font.Style + [fsBold];

        TDBGridEh(Sender).Canvas.Brush.Style := bsClear;
        TDBGridEh(Sender).Canvas.Pen.Color := clRed;
        TDBGridEh(Sender).Canvas.Rectangle(Rect.Left + 0, Rect.Top + 0, Rect.Right - 0, Rect.Bottom - 0);
      end;
      if Column.Field is TFloatField then
      begin
        R := Rect;
        TDBGridEh(Sender).Canvas.FillRect(R);
        if (not Column.Field.IsNull) and (Column.Field.DisplayText <> '') then
        begin
          S := Trim(FormatFloat('### ### ### ### ##0.00', ABS(Column.Field.AsFloat)));
          if Column.Field.AsFloat < 0 then
            S := '-' + S;
          R.Top := R.Top + 2;
          DrawText(TDBGridEh(Sender).Canvas.Handle, PChar(S), -1, R, DT_RIGHT);
        end;
      end;
    end;
end;

procedure TOperExp.RxDBGrid1GetCellParams(Sender: TObject;
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

procedure TOperExp.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  ReOrderCDS(Column.Field);
  Column.Title.SortMarker := TSortMarkerEh(GetBtnSortMarker(Column.Field));
end;

procedure TOperExp.aExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TOperExp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOperExp.aSaveExecute(Sender: TObject);
var OldRecNo : integer;
    id_bsn : integer;
begin
  with dsExp.DataSet do
  begin
    OldRecNo := RecNo;
    DisableControls;
    AddSVCData;
    Filter := 'id_Oper<>-1';
    Filtered := false;
    try
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
