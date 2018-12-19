unit uArcAnaliz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, db, Buttons, dxDBGrid, dxDBTLCl, dxGrClms,
  dxDBCtrl, dxTL, dxCntner, dbgrideh, ImgList, DBClient,
  Provider, RxMemDS, DBUtils, Math, ComCtrls;

type
  THackdxDBGrid = class(TdxDBGrid)
    procedure BeginLayout;
    procedure EndLayout;  
  end;

 TArcAnaliz = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    BitBtn1: TBitBtn;
    dxDBGrid1: TdxDBGrid;
    DataSource1: TDataSource;
    ilImage: TImageList;
    RxMemoryData1: TRxMemoryData;
    DataSetProvider1: TDataSetProvider;
    cdsData2: TClientDataSet;
    StatusBar1: TStatusBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxDBGrid1DblClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    procedure GetData(AGridEh : TDBGridEh; AdxDBGrid: TdxDBGrid;
      KeyField: String);
    procedure DoAppColToSumPrsn(ASG: TdxDBGridSummaryGroup;
      ACol: TdxDBTreeListColumn);
  public
    constructor Create(AOwner : TCOmponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure ShowArcAnaliz(AGridEh : TDBGridEh; KeyField : String = '');

var
  ArcAnaliz: TArcAnaliz;

implementation

uses uDM, uFormApi_Oper, uPrgForm;

procedure CloneCDS_xxx(AGridEh : TDBGridEh; Dest : TDataSet; KeyField : String);
  procedure AssignRecord2(Src, Dest: TDataSet);
  var
    j: Integer;
    F, FSrc: TField;
    Hour, Min, Sec, MSec: Word;
  begin
    for j := 0 to Src.FieldCount - 1 do
    begin
      FSrc := Src.Fields[j];
      F := Dest.FindField(FSrc.FieldName);
      if F <> nil then
      begin
        if (F is TDateTimeField) and not (FSrc.IsNull) then
        begin
          DecodeTime(FSrc.AsDateTime, Hour, Min, Sec, MSec);
          F.AsDateTime := int(FSrc.AsDateTime) + EncodeTime(Hour, Min, 0, 0);
        end
        else
          F.Value := FSrc.Value;
      end;
    end;
  end;
var Stream : TMemoryStream;
    i, Cnt  :integer;
    OldRecNo : integer;
    AField, FF : TField;
    Source : TDataSet;
    AFieldDef : TFieldDef;
    AExCol : TColumnEh;
begin
  try
    Source := TDataSet(AGridEh.DataSource.DataSet);
    Dest.FieldDefs.Clear;
  //  Dest.FieldDefs := Source.FieldDefs;
    if KeyField <> '' then
    begin
      AField := Source.FindField(KeyField);
      if AField <> nil then
      begin
        AFieldDef := Dest.FieldDefs.AddFieldDef;
        with AFieldDef do
        begin
          Name := AField.FieldName;
          Size := AField.Size;
          DataType := AField.DataType;
          if DataType = ftAutoInc then
           DataType := ftInteger;
          Attributes := [];

          if (DataType <> ftUnknown) and not (DataType in ObjectFieldTypes) and
            not ((faHiddenCol in Attributes) and not Dest.FIeldDefs.HiddenFields) then
          begin
            FF := CreateField(Dest, nil, KeyField);
          end;
        end;
      end;
    end;
    AFieldDef := Dest.FieldDefs.AddFieldDef;
    with AFieldDef do
    begin
      Name := 'is_Mirr';
      DataType := ftInteger;
      Attributes := [];
      FF := CreateField(Dest, nil, Name);
    end;
    AFieldDef := Dest.FieldDefs.AddFieldDef;
    with AFieldDef do
    begin
      Name := 'OperVid';
      DataType := ftInteger;
      Attributes := [];
      FF := CreateField(Dest, nil, Name);
    end;
    for i := 0 to AGridEh.VisibleColumns.Count - 1 do
    begin
      ShowProgressForm(0, i, AGridEh.Columns.Count - 1, 'Копирование структуры данных');
      AExCol := AGridEh.VisibleColumns[i];
      if (AExCol.Field <> nil) and (Dest.FindField(AExCol.Field.FieldName) = nil) then
      begin
        AFieldDef := Dest.FieldDefs.AddFieldDef;
        AFieldDef.Name := AExCol.Field.FieldName;
        AFieldDef.Size := AExCol.Field.Size;
        AFieldDef.DataType := AExCol.Field.DataType;
        if AFieldDef.DataType = ftAutoInc then
           AFieldDef.DataType := ftInteger;
        AFieldDef.Attributes := [];

        with AFieldDef do
        begin
          if (DataType <> ftUnknown) and not (DataType in ObjectFieldTypes) and
            not ((faHiddenCol in Attributes) and not Dest.FIeldDefs.HiddenFields) then
          begin
            AField := CreateField(Dest, nil, AExCol.Field.FieldName);
            AField.Size := AExCol.Field.Size;
            
            if AField is TDateTimeField then
            begin
              TDateTimeField(AField).DisplayFormat := 'dd.mm.yyyy hh.mm';
            end
            else
            if AField is TFloatField then
            begin
              TFloatField(AField).DisplayFormat := '0.00';
            end
            else
            if AField is TBooleanField then
            begin
              TBooleanField(AField).DisplayValues := 'Да;Нет';
            end;

          end;
        end;
      end;
    end;
    CloseProgressForm;
    with Dest do
    begin
      Open;
      try
        Source.DisableControls;
        OldRecNo := Source.RecNo;
        Source.First;
        Cnt := Source.RecordCount;
        i := 0;
        while not Source.EOF do
        begin
          ShowProgressForm(0, i, Cnt, 'Копирование данных');
          Append;
          AssignRecord2(AGridEh.DataSource.DataSet, Dest);
          Post;
          Source.Next;
          inc(i)
        end;
        Source.RecNo := OldRecNo;
      finally
        Source.EnableControls;
        First;
      end;
    end;
  finally
    CloseProgressForm;
  end;
end;

procedure TrimCDS(CDS: TDataSet);
var i, Cnt, j : integer;
    AList : TList;
    Hour, Min, Sec, MSec: Word;
begin
  AList := TList.Create;
  try
    with CDS do
    begin
      for i := 0 to Fields.Count - 1 do
      begin
        if Fields[i] is TDateTimeField then
        begin
          AList.Add(Fields[i]);
          TDateTimeField(Fields[i]).DisplayFormat := 'dd.mm.yyyy hh.mm';
        end;
        if Fields[i] is TFloatField then
        begin
          TFloatField(Fields[i]).DisplayFormat := '0.00';
        end;
      end;
      First;
      Cnt := RecordCount;
      j := 0;
      while not Eof do
      begin
        ShowProgressForm(0, j, Cnt, 'Форматирование данных');
        for i := 0 to AList.Count - 1 do
        begin
          if not TField(AList[i]).IsNull then
          begin
            Edit;
            DecodeTime(TField(AList[i]).AsDateTime, Hour, Min, Sec, MSec);
            TField(AList[i]).AsDateTime := int(TField(AList[i]).AsDateTime) + EncodeTime(Hour, Min, 0, 0);
            Post;
          end;
        end;
        Next;
        inc(j);
      end;   
    end;
  finally
    AList.Free;
    CloseProgressForm;
  end;
end;

procedure ShowArcAnaliz(AGridEh : TDBGridEh; KeyField : String);
var F : TArcAnaliz;
    i : integer;
    ACol : TdxDBTreeListColumn;
    AColumnClass: TdxDBTreeListColumnClass;
    S : String;
    PPP : integer;
    AExCol : TColumnEh;
    ABand : TdxTreeListBand;
    ASG : TdxDBGridSummaryGroup;
begin
  ABand := nil;
  F := TArcAnaliz.Create(nil);
  try
    F.GetData(AGridEh, F.dxDBGrid1, KeyField);
    F.Show;
  except
    F.Free;
  end;
end;

{$R *.DFM}

procedure TArcAnaliz.BitBtn1Click(Sender: TObject);
begin
//  fArcSumm1.ExportToExcel;
end;

procedure TArcAnaliz.DoAppColToSumPrsn(ASG : TdxDBGridSummaryGroup; ACol : TdxDBTreeListColumn);
var
  ASG_Item : TdxDBGridSummaryItem;
  S, S1 : String;
begin
  S1 := UpperCase(ACol.FieldName);
  if (S1 = UpperCase('AmountOper')) or
     (S1 = UpperCase('SummOper')) or
     (S1 = UpperCase('SummSys')) or
     (S1 = UpperCase('OperSumCalced')) or
     (S1 = UpperCase('PriceInv')) or         
     (S1 = UpperCase('OperRateDeltaCrn')) or
     (S1 = UpperCase('WorkSum')) or
     (S1 = UpperCase('OperTotalDeltaCrn'))
  then
  begin
    if ACol.BandIndex > -1 then
      S := ACol.ATreeList.Bands[ACol.BandIndex].Caption + '/'
    else
      S := '';
    if (S1 = UpperCase('WorkSum')) then
    begin
      S := 'Сумма для расчета';
    end
    else
    if (S1 = UpperCase('OperRateDeltaCrn')) then
    begin
      S := 'Курс. разн';
    end
    else
    if (S1 = UpperCase('OperTotalDeltaCrn')) then
    begin
      S := 'Прибыль';
    end
    else
    if (S1 = UpperCase('AmountOper')) then
    begin
      S := 'Кол-во';
    end
    else
    if (S1 = UpperCase('SummOper')) then
    begin
      S := 'Сумма';
    end
    else
    if (S1 = UpperCase('SummSys')) then
    begin
      S := 'Зачтено';
    end
    else
    if (S1 = UpperCase('SummSys')) then
    begin
      S := 'Зачтено';
    end
    else
    if (S1 = UpperCase('OperSumCalced')) then
    begin
      S := 'Эквивалент';
    end
    else
    if (S1 = UpperCase('PriceInv')) then
    begin
      S := 'Себест.';
    end;
    ASG_Item := ASG.SummaryItems.Add;
    //   ASG_Item.ColumnName := ACol.Name;
    ASG_Item.SummaryField := ACol.FieldName;
    ASG_Item.SummaryType := cstSum;
    ASG_Item.SummaryFormat := S + '=0.00';
  end;
end;

procedure TArcAnaliz.GetData(AGridEh : TDBGridEh; AdxDBGrid : TdxDBGrid; KeyField : String);
var i : integer;
    ACol : TdxDBTreeListColumn;
    AColumnClass: TdxDBTreeListColumnClass;
    S : String;
    PPP : integer;
    AExCol : TColumnEh;
    ABand : TdxTreeListBand;
    ASG : TdxDBGridSummaryGroup;
    ASG_Item : TdxDBGridSummaryItem;
begin       
  ABand := nil;
  Screen.Cursor := crSQLWait;
  THackdxDBGrid(AdxDBGrid).BeginLayout;
  try
  //  CloneCDS2(TClientDataSet(AGridEh.DataSource.DataSet), RxMemoryData1);
    CloneCDS_xxx(AGridEh, RxMemoryData1, AdxDBGrid.KeyField);
    cdsData2.Open;
    TrimCDS(cdsData2);
    DataSource1.DataSet := cdsData2;
    with AdxDBGrid do
    begin
      BeginUpdate;
      DestroyColumns;
      Bands.Clear;

      SummaryGroups.Clear;
      ASG := SummaryGroups.Add;
      ASG.DefaultGroup := true;
      ASG.BeginSummaryText := '[';
      ASG.EndSummaryText := ']';

      for i := 0 to AGridEh.VisibleColumns.Count - 1 do
      begin
        ShowProgressForm(Handle, i, AGridEh.Columns.Count - 1, 'Создание таблицы');
//        AExCol := AGridEh.Columns[i];
        AExCol := AGridEh.VisibleColumns[i];
        if AExCol.Visible then
        begin
          if AExCol.Field is TbooleanField then
            AColumnClass := TdxDBGridCheckColumn
          else
            if AExCol.Field is TDateTimeField then
              AColumnClass := TdxDBGridDateColumn
              else                                 
                if AExCol.Field is TFloatField then
                  AColumnClass := TdxDBGridCalcColumn //TdxDBGridCurrencyColumn
                else
                  AColumnClass := TdxDBTreeListColumn;


          ACol := CreateColumn(AColumnClass);
          PPP := Pos('|', AExCol.Title.Caption);
          if PPP > 0 then
            S := Copy(AExCol.Title.Caption, 1, PPP - 1)
          else
            S := '';
          if (ABand = nil) or (ABand.Caption <> S) then
          begin
            ABand := Bands.Add;
            ABand.Caption := S;
          end;
          if ABand <> nil then
            ACol.BandIndex := ABand.Index;
          ACol.Caption := Copy(AExCol.Title.Caption, PPP + 1, Length(AExCol.Title.Caption));
          ACol.FieldName := AExCol.FieldName;
          //ACol.Width := AExCol.Width;

          if ACol is TdxDBGridCalcColumn then //TdxDBGridCurrencyColumn  then
          begin
            ACol.SummaryFooterType := cstSum;
            
            ASG_Item := ASG.SummaryItems.Add;
            ASG_Item.ColumnName := ACol.Name;
            ASG_Item.SummaryField := ACol.FieldName;
            ASG_Item.SummaryType := cstSum;
            ASG_Item.SummaryFormat := '0.00';
            DoAppColToSumPrsn(ASG, ACol);                
          end;
        end;
      end;
  //    Columns[0].Visible := false;
  //    Options := Options + [egoLoadAllRecords];
      ShowRowFooter := true;
      Filter.MaxDropDownCount := 0;
    end;
  finally
    CloseProgressForm;
    AdxDBGrid.EndUpdate;

    Screen.Cursor := crDefault;
    THackdxDBGrid(AdxDBGrid).EndLayout;
  end;
  for i := 0 to AdxDBGrid.ColumnCount - 1 do
    if AdxDBGrid.Columns[i].Width > 180 then
      AdxDBGrid.Columns[i].Width := 180;
end;

constructor TArcAnaliz.Create(AOwner: TCOmponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TArcAnaliz.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

procedure TArcAnaliz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TArcAnaliz.btnCancelClick(Sender: TObject);
begin
  Close;
end;

{ THackdxDBGrid }

procedure THackdxDBGrid.BeginLayout;
begin
  inherited;
end;

procedure THackdxDBGrid.EndLayout;
begin
  inherited;
end;

procedure TArcAnaliz.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TArcAnaliz.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TArcAnaliz.dxDBGrid1DblClick(Sender: TObject);
var
    ID : integer;
    ADelMode, ACorrect, ACopy, AReadOnly : boolean;
    id_OperParent, FIs_Mirr : variant;
    AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ID_Oper := DataSource1.DataSet.FieldByName('id_Oper').AsInteger;
  AOperParamz.Is_Mirr := DataSource1.DataSet.FieldByName('Is_Mirr').AsBoolean;
  AOperParamz.ReadOnly := true;

  ADelMode := false;
  ACorrect := false;
  ACopy := false;
  AReadOnly := true;
  id_OperParent := Null;
  ID := DataSource1.DataSet.FieldByName('id_Oper').AsInteger;
  FIs_Mirr := DataSource1.DataSet.FieldByName('Is_Mirr').AsInteger;
  case DataSource1.DataSet.FieldByName('OperVid').AsInteger of
    -1 : begin EditOperCrnCh(Handle, AOperParamz); end;
    0 : EditOperEmpty(Handle, AOperParamz);
    1 : EditOperWare(Handle, AOperParamz);
    2 : EditOperFin(Handle, AOperParamz);
    4 : EditOperOffset(Handle, AOperParamz);

    101 : EditOperWare_FFF(Handle, AOperParamz);
    102 : EditOperFin_FFF(Handle, AOperParamz);
  end;

end;

procedure TArcAnaliz.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  StatusBar1.Panels[0].Text := 'Всего записей: ' + IntToStr((Sender as TDataSource).DataSet.RecordCount);
end;

end.
