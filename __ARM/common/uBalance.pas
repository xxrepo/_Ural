unit uBalance;

interface

uses                
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, ImgList,
    foMyFunc, Menus, RXCtrls, ComCtrls, Registry, printers,
   ToolWin,
  Buttons,
  BaseGrid, AdvGrid, asgprint, asgprev, DBGrids, RXDBCtrl, ActnList;

type
  TOperDate = class(TComponent)
  public
    FId_Oper : integer;  
    FOperVid : integer;  
  end;
  
  TBalance = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    cdsBalanceBy: TClientDataSet;
    dsArc: TDataSource;
    ilImage: TImageList;
    pnDate: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    dtTo: TDateTimePicker;
    dtFrom: TDateTimePicker;
    StatusBar1: TStatusBar;
    cdsBalanceByisRes: TBooleanField;
    cdsBalanceByTmp: TIntegerField;
    cdsBalanceByid_Oper: TIntegerField;
    cdsBalanceByOperTypeIn: TBooleanField;
    cdsBalanceByOperVid: TIntegerField;
    cdsBalanceByid_Repr: TIntegerField;
    cdsBalanceByDateCreate: TDateTimeField;
    cdsBalanceByOperSummABS_D: TFloatField;
    cdsBalanceByCurrencyOperShortName_D: TStringField;
    cdsBalanceByOperSum_OfferABS_D: TFloatField;
    cdsBalanceByCurrencyShortName_D: TStringField;
    cdsBalanceByOperSummSysCurABS_D: TFloatField;
    cdsBalanceByNAMEMain_D: TStringField;
    cdsBalanceByOperSum_InvCur_D: TFloatField;
    cdsBalanceByDeltaInv_D: TFloatField;
    cdsBalanceByDeptInv_D: TFloatField;
    cdsBalanceByTotalRez: TFloatField;
    cdsBalanceByOperSummABS_K: TFloatField;
    cdsBalanceByCurrencyOperShortName_K: TStringField;
    cdsBalanceByOperSum_OfferABS_K: TFloatField;
    cdsBalanceByCurrencyShortName_K: TStringField;
    cdsBalanceByOperSummSysCurABS_K: TFloatField;
    cdsBalanceByNAMEMain_K: TStringField;
    cdsBalanceByReprName: TStringField;
    cdsBalanceByExtInfo: TStringField;
    cdsBalanceByOperNum: TStringField;
    ilButtons: TImageList;
    Panel4: TPanel;
    edObjName: TEdit;
    BitBtn1: TBitBtn;
    AdvPreviewDialog1: TAdvPreviewDialog;
    AdvGridPrintSettingsDialog1: TAdvGridPrintSettingsDialog;
    Edit3: TEdit;
    SaveDialog1: TSaveDialog;
    cdsBalanceBySummSysCurABS_D: TFloatField;
    cdsBalanceBySummSysCurABS_K: TFloatField;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    AdvStringGrid1: TAdvStringGrid;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ActionList1: TActionList;
    aProp: TAction;
    cdsBalanceByDayRez: TFloatField;
    cdsBalanceByCAName: TStringField;
    cdsBalanceByNAMEMain: TStringField;
    lbCrn: TLabel;
    procedure miOfferClick(Sender: TObject);
    procedure dsArcDataChange(Sender: TObject; Field: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure AdvStringGrid1GetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure AdvStringGrid1GetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure ToolButton3Click(Sender: TObject);
    procedure AdvStringGrid1ColumnSize(Sender: TObject; ACol: Integer;
      var Allow: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure aPropExecute(Sender: TObject);
    procedure cdsBalanceByAfterOpen(DataSet: TDataSet);
    procedure AdvStringGrid1DblClick(Sender: TObject);
    procedure AdvStringGrid1ClickCell(Sender: TObject; ARow,
      ACol: Integer);
  private
    ASelectedObj : TSelectedObj;
    FParamBlnc: TParamBlnc;
    CAName : String;
    CrnName : String;

    procedure LoadCDS(CDS: TClientDataSet);
    procedure CellVal(x, y: integer; Val: String; Obj : TObject = nil);
    procedure CalcRowHeights(y: integer);
    procedure GetAGPrinterInfo;
  public
    procedure Initialize(AParamBlnc : TParamBlnc);

    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  Balance: TBalance;

procedure ShowBalance(AParamBlnc : TParamBlnc);

implementation

uses uDM, PrvFrm_2, unEhMyFunc, uCASelector, uFormApi_Oper;

{$R *.DFM}


procedure ShowBalance(AParamBlnc : TParamBlnc);
var F : TBalance;
begin
  F := TBalance.Create(nil);
  try
    F.Initialize(AParamBlnc);
    F.Show;
  except
    F.Free;
  end;
end;
{ TBalance }


destructor TBalance.Destroy;
var
    Reg : TRegistry;
    i : integer;
begin
//  SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + Name + '\' + ClassName);

  inherited;
end;

constructor TBalance.Create(AOwner: TCOmponent);
var 
    Year, Month, Day: Word;
    DDD : TDate;
    Reg : TRegistry;
    i : integer;
begin
  inherited;
  lbCrn.Caption := '';
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
//  RxDBGrid1.RowHeight := 6;

//  LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + Name + '\' + ClassName);

  DecodeDate(Now, Year, Month, Day);
  dtFrom.Date := EncodeDate(Year, Month, 1);
  DDD := IncMonth(Now, 1);
  DecodeDate(DDD, Year, Month, Day);
  dtTo.Date := EncodeDate(Year, Month, 1) - 1;
  dtFrom.Checked := false;
  dtTo.Checked := false;

end;

procedure TBalance.Initialize(AParamBlnc: TParamBlnc);
begin
  Screen.Cursor := crSQLWait;
  Enabled := false;
  try

    FParamBlnc := AParamBlnc;
    with cdsBalanceBy do
    begin
      Close;
      Params.ParamByName('@DateFrom').Value := AParamBlnc.DateFrom;
      Params.ParamByName('@DateTo').Value := AParamBlnc.DateTo;
      Params.ParamByName('@id_ContrAgent').Value := AParamBlnc.id_ContrAgent;
      Params.ParamByName('@id_Repr').Value := AParamBlnc.id_Repr;
      Params.ParamByName('@id_Acc').Value := AParamBlnc.id_Acc;

      if (AParamBlnc.id_ContrAgent <> Null) or (AParamBlnc.id_Repr <> Null) or (AParamBlnc.id_Acc <> Null)then
      begin
        Open;
      end;
    end;
    LoadCDS(cdsBalanceBy);
  finally
    Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TBalance.miOfferClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
end;

procedure TBalance.dsArcDataChange(Sender: TObject; Field: TField);
begin
//  StatusBar1.Panels[0].Text := 'Всего записей: ' + IntToStr(dsArc.DataSet.RecordCount);
end;

procedure TBalance.BitBtn1Click(Sender: TObject);
begin
  ASelectedObj.ObjType := eotCA;
  ASelectedObj.ID := FParamBlnc.id_ContrAgent;

  if SelectCA(ASelectedObj, 0, null) then
  begin
    edObjName.Text := ASelectedObj.Name;

    FParamBlnc := GetEmptyParamBlnc;

    if dtFrom.Checked then
      FParamBlnc.DateFrom := Int(dtFrom.Date)
    else
      FParamBlnc.DateFrom := Null;
    if dtTo.Checked then
      FParamBlnc.DateTo := Int(dtFrom.Date) + 1
    else
      FParamBlnc.DateTo := Null;

    FParamBlnc.id_ContrAgent := ASelectedObj.ID;
    
    Initialize(FParamBlnc);
  end;
end;

procedure TBalance.GetAGPrinterInfo;
begin
  printer.Orientation := poLandscape;

  AdvStringGrid1.PrintSettings.Date := ppTopLeft;
  AdvStringGrid1.PrintSettings.DateFormat := 'dd-mm-yyyy hh:nn';

  AdvStringGrid1.PrintSettings.TitleText := '' + CAName + ' (валюта ' + CrnName + ')';

  AdvStringGrid1.PrintSettings.Title := ppTopCenter;

  AdvStringGrid1.PrintSettings.HeaderFont.Size := 12;
  AdvStringGrid1.PrintSettings.HeaderFont.Style := [fsBold];
end;


procedure TBalance.ToolButton2Click(Sender: TObject);
begin
  GetAGPrinterInfo;
  printer.Orientation := poLandscape;
  
  AdvPreviewDialog1.Execute;
end;

procedure TBalance.ToolButton1Click(Sender: TObject);
begin
  AdvGridPrintSettingsDialog1.Execute
end;

procedure TBalance.CalcRowHeights(y : integer);
var R : TRect;
    S : String;
    Y2, MaxHeights, i : integer;
begin
  MaxHeights := AdvStringGrid1.DefaultRowHeight;
  for i := 0 to AdvStringGrid1.ColCount - 1 do
  begin
    R := AdvStringGrid1.CellRect(i, y);
    S := AdvStringGrid1.Cells[i, y];
    Y2 := DrawText(AdvStringGrid1.Canvas.Handle, PChar(S), -1, R, DT_WORDBREAK or DT_CALCRECT) + 5;
    if Y2 > MaxHeights then
      MaxHeights := Y2;
  end;

  if MaxHeights <> AdvStringGrid1.RowHeights[y] then
  begin
    AdvStringGrid1.RowHeights[y] := MaxHeights;
  end;
end;


procedure TBalance.CellVal(x, y : integer; Val : String; Obj : TObject);
var R : TRect;
    Y2, X2 : integer;
begin
  AdvStringGrid1.Objects[x, y] := Obj;
 { R := AdvStringGrid1.CellRect(x, y);
 // R.Bottom := AdvStringGrid1.RowHeights[y];

  Y2 := DrawText(AdvStringGrid1.Canvas.Handle, PChar(Val), -1, R, DT_WORDBREAK or DT_CALCRECT) + 5;
  if Y2 > AdvStringGrid1.RowHeights[y] then
  begin
    AdvStringGrid1.RowHeights[y] := Y2;
  end;
  X2 := R.Right - R.Left;
  if X2 > 180 then
    X2 := 180;
  if X2 > AdvStringGrid1.ColWidths[X] then
  begin
    AdvStringGrid1.ColWidths[X] := X2;
  end;
 // DrawText(AdvStringGrid1.Canvas.Handle, PChar(Val), -1, R, DT_WORDBREAK);  }
  AdvStringGrid1.Cells[x, y] := Val;
end;

procedure TBalance.LoadCDS(CDS: TClientDataSet);
var i : integer;
    FFF : TOperDate;
begin
  AdvStringGrid1.DefaultRowHeight := 21;
  AdvStringGrid1.FixedCols := 1;
  AdvStringGrid1.FixedColWidth := 8;
  with CDS do
  begin
    AdvStringGrid1.Clear;
    if (Active) and (not IsEmpty) then
      AdvStringGrid1.RowCount := RecordCount + 3
    else
      AdvStringGrid1.RowCount := 4;
    AdvStringGrid1.FixedRows := 3;

    AdvStringGrid1.ColCount := AdvStringGrid1.FixedCols + 14 + 0;
    i := 0;
    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 0, i, 1, 3);
    CellVal(AdvStringGrid1.FixedCols + 0, i, 'Номер', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, 7, 1);
    CellVal(AdvStringGrid1.FixedCols + 1, i, 'Дебет', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 8, i, 1, 3);
    CellVal(AdvStringGrid1.FixedCols + 8, i, 'Итого', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 9, i, 5, 1);
    CellVal(AdvStringGrid1.FixedCols + 9, i, 'Кредит', Pointer(4));

    inc(i);
    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, 2, 1);
    CellVal(AdvStringGrid1.FixedCols + 1, i, 'Операция', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 3, i, 2, 1);
    CellVal(AdvStringGrid1.FixedCols + 3, i, 'Зачтено', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 5, i, 3, 1);
    CellVal(AdvStringGrid1.FixedCols + 5, i, 'Сумма', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 9, i, 2, 1);
    CellVal(AdvStringGrid1.FixedCols + 9, i, 'Операция', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 11, i, 2, 1);
    CellVal(AdvStringGrid1.FixedCols + 11, i, 'Зачтено', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 13, i, 1, 2);
    CellVal(AdvStringGrid1.FixedCols + 13, i, 'Сумма', Pointer(4));

    inc(i);
    CellVal(AdvStringGrid1.FixedCols + 1, i, 'Сумма', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 2, i, 'Валюта', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 3, i, 'Сумма', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 4, i, 'Валюта', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 5, i, 'Сумма', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 6, i, 'Себестоимость', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 7, i, 'Прибыль', Pointer(4));

    CellVal(AdvStringGrid1.FixedCols + 9, i, 'Сумма', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 10, i, 'Валюта', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 11, i, 'Сумма', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 12, i, 'Валюта', Pointer(4));

    if not CDS.Active then
      Exit;
    First;
    CAName := cdsBalanceByCAName.AsString;
    CrnName := cdsBalanceByNAMEMain.AsString;
    lbCrn.Caption := 'Валюта: ' + CrnName;
    while not Eof do
    begin
      inc(i);
      if FieldByName('isRes').AsBoolean then
      begin
        AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 0, i, 14, 1);
        CellVal(AdvStringGrid1.FixedCols + 0, i, FieldByName('ExtInfo').AsString, Pointer(1));
      end
      else
      begin
        FFF := TOperDate.Create(Self);
        FFF.FId_Oper := FieldByName('id_Oper').AsInteger;
        FFF.FOperVid := FieldByName('OperVid').AsInteger;

        CellVal(0, i, '', FFF);

        CellVal(AdvStringGrid1.FixedCols + 0, i, FieldByName('OperNum').AsString);

        CellVal(AdvStringGrid1.FixedCols + 1, i, FieldByName('OperSummABS_D').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 2, i, FieldByName('CurrencyOperShortName_D').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 3, i, CDS.FieldByName('SummSysCurABS_D').DisplayText);
        if FieldByName('SummSysCurABS_D').AsString <> '' then
          CellVal(AdvStringGrid1.FixedCols + 4, i, CDS.FieldByName('CurrencyShortName_D').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 5, i, FieldByName('OperSummSysCurABS_D').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 6, i, FieldByName('OperSum_InvCur_D').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 7, i, FieldByName('DeltaInv_D').DisplayText);

        CellVal(AdvStringGrid1.FixedCols + 8, i, FieldByName('TotalRez').DisplayText, Pointer(5));

        CellVal(AdvStringGrid1.FixedCols + 9, i, FieldByName('OperSummABS_K').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 10, i, FieldByName('CurrencyOperShortName_K').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 11, i, FieldByName('SummSysCurABS_K').DisplayText);
        if FieldByName('SummSysCurABS_K').AsString <> '' then
          CellVal(AdvStringGrid1.FixedCols + 12, i, FieldByName('CurrencyShortName_K').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 13, i, FieldByName('OperSummSysCurABS_K').DisplayText);
      end;
      Next;
    end;
  end;
  AdvStringGrid1.AutoSizeColumns(false, 10);
  AdvStringGrid1.AutoSizeRows(false, 0);
end;

procedure TBalance.AdvStringGrid1GetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
var Obj : TObject;
begin
  Obj := AdvStringGrid1.Objects[ACol, ARow];
  if Obj <> nil then
  begin
    if Obj = Pointer(1) then
      ABrush.Color := $00D7D7D7;

    AFont.Style := [fsBold];
  end;
end;

procedure TBalance.AdvStringGrid1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
var Obj : TObject;
begin
  Obj := AdvStringGrid1.Objects[ACol, ARow];
  if Obj <> nil then
  begin
    if Obj = Pointer(2) then
      HAlign := taLeftJustify;
    if Obj = Pointer(3) then
      HAlign := taRightJustify;
    if Obj = Pointer(4) then
      HAlign := taCenter;
  end;
  VAlign := vtaCenter;
end;

procedure TBalance.ToolButton3Click(Sender: TObject);
var
  ps: TPrinterSetupDialog;
  res: Boolean;
  ori,oldori: TPrinterOrientation;
begin
    GetAGPrinterInfo;
    oldori := AdvStringGrid1.PrintSettings.Orientation;


    AdvStringGrid1.FastPrint := False;
    AdvStringGrid1.Previewpage := -1;

    ps := TPrinterSetupDialog.Create(Self);

    res := ps.Execute;

    ori := printer.Orientation;

    ps.Free;

    if not res then Exit;

    AdvStringGrid1.PrintSettings.Orientation := ori;

    AdvStringGrid1.Print;  

    AdvStringGrid1.PrintSettings.Orientation := oldori;
end;

procedure TBalance.AdvStringGrid1ColumnSize(Sender: TObject; ACol: Integer;
  var Allow: Boolean);
var i : integer;
begin
{  for i := 0 to AdvStringGrid1.RowCount - 1 do
    CalcRowHeights(i);   }
end;

procedure TBalance.BitBtn2Click(Sender: TObject);
begin
  if dtFrom.Checked then
    FParamBlnc.DateFrom := Int(dtFrom.Date)
  else
    FParamBlnc.DateFrom := Null;
  if dtTo.Checked then
    FParamBlnc.DateTo := Int(dtFrom.Date) + 1
  else
    FParamBlnc.DateTo := Null;

  Initialize(FParamBlnc);
end;

procedure TBalance.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TBalance.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TBalance.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TBalance.aPropExecute(Sender: TObject);
var
    ID, FOperVid : integer;
    Rez : boolean;
    B : boolean;
    Fid_OperParent : Variant;
begin
  if AdvStringGrid1.Objects[0, AdvStringGrid1.Row] = nil then
    Exit;
  Fid_OperParent := Null;
  ID := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).FId_Oper;
  FOperVid := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).FOperVid;
  Rez := false;
  B := true;
  case FOperVid of
    0 : Rez := EditOperEmpty(ID, B);
    1 : Rez := EditOperWare(ID, B, Fid_OperParent, false, false);
    2 : Rez := EditOperFin(ID, B, Fid_OperParent, false, false);
    3 : Rez := EditOperService(ID, B, Fid_OperParent, false, false);
    4 : Rez := EditOperOffset(ID, B, Fid_OperParent, false, false);
  end;
end;

procedure TBalance.cdsBalanceByAfterOpen(DataSet: TDataSet);
begin
  aProp.Enabled := not cdsBalanceBy.IsEmpty;
end;

procedure TBalance.AdvStringGrid1DblClick(Sender: TObject);
begin
  if AdvStringGrid1.Row < AdvStringGrid1.FixedRows  then
    Exit;
  aProp.Execute;
end;

procedure TBalance.AdvStringGrid1ClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  aProp.Enabled := AdvStringGrid1.Objects[0, ARow] <> nil;
end;

end.
