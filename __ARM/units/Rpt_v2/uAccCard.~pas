unit uAccCard;

interface

uses                
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, ImgList,
    foMyFunc, Menus, RXCtrls, ComCtrls, Registry, printers,
   ToolWin,
  Buttons,
  BaseGrid, AdvGrid, asgprint, asgprev, DBGrids, RXDBCtrl, ActnList,
  RxMemDS, RxLookup, AdvCGrid;

type
  TVal_obj = class
    ID : Variant;
    constructor Create(AID : Variant); 
  end;

  TOperDate = class(TComponent)
  public
    FId_Oper : integer;  
    FOperVid : integer;  
    FIs_Mirr : boolean;
  end;
  
  TAccCard = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    ilButtons: TImageList;
    Panel4: TPanel;
    edObjName: TEdit;
    BitBtn1: TBitBtn;
    AdvPreviewDialog1: TAdvPreviewDialog;
    AdvGridPrintSettingsDialog1: TAdvGridPrintSettingsDialog;
    SaveDialog1: TSaveDialog;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Label3: TLabel;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ActionList1: TActionList;
    aProp: TAction;
    aExport: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    cdsBalanceBy: TClientDataSet;
    cdsBalanceByOperNum: TStringField;
    cdsBalanceByisRes: TBooleanField;
    cdsBalanceByTmp: TIntegerField;
    cdsBalanceByid_Oper: TIntegerField;
    cdsBalanceByOperTypeIn: TBooleanField;
    cdsBalanceByOperVid: TIntegerField;
    cdsBalanceByDateCreate: TDateTimeField;
    cdsBalanceByOperSummABS_D: TFloatField;
    cdsBalanceByCurrencyOperShortName_D: TStringField;
    cdsBalanceBySummSysCurABS_D: TFloatField;
    cdsBalanceByTotalRez: TFloatField;
    cdsBalanceByDayRez: TFloatField;
    cdsBalanceByOperSummABS_K: TFloatField;
    cdsBalanceByCurrencyOperShortName_K: TStringField;
    cdsBalanceByCAName: TStringField;
    cdsBalanceByNAMEMain: TStringField;
    cdsBalanceBySummSysCurABS_K: TFloatField;
    cdsBalanceByExtInfo: TStringField;
    ToolButton8: TToolButton;
    Action1: TAction;
    Label5: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    cdsBalanceByid_business: TIntegerField;
    cdsBalanceByis_Mirr: TBooleanField;
    AdvStringGrid1: TAdvColumnGrid;
    ilImage2: TImageList;
    cdsCur: TClientDataSet;
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
    lcCur: TRxDBLookupCombo;
    dsCur: TDataSource;
    Label4: TLabel;
    aSettings: TAction;
    ToolButton9: TToolButton;
    pnDate: TPanel;
    Label6: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    dtTo: TDateTimePicker;
    dtFrom: TDateTimePicker;
    BitBtn2: TBitBtn;
    cbDoc: TComboBox;
    cdsExtDataDict: TClientDataSet;
    cdsExtDataDictid_Oper_ExtDataNames: TIntegerField;
    cdsExtDataDictid_business: TIntegerField;
    cdsExtDataDictType: TIntegerField;
    cdsExtDataDictNumPrm: TIntegerField;
    cdsExtDataDictParName: TStringField;
    cdsExtDataDictVisible: TBooleanField;
    cdsBalanceByNNN: TIntegerField;
    cdsBalanceByid_CurrencyOper: TIntegerField;
    cdsBalanceByDocz: TStringField;
    procedure miOfferClick(Sender: TObject);
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
    procedure aExportExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AdvStringGrid1GetFloatFormat(Sender: TObject; ACol,
      ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
    procedure AdvStringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AdvStringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure AdvStringGrid1ExpandNode(Sender: TObject; ARow,
      ARowreal: Integer);
    procedure AdvStringGrid1ContractNode(Sender: TObject; ARow,
      ARowreal: Integer);
    procedure aSettingsExecute(Sender: TObject);
    procedure AdvStringGrid1CanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure AdvStringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure AdvStringGrid1CustomCellDraw(Sender: TObject;
      Canvas: TCanvas; ACol, ARow: Integer; AState: TGridDrawState;
      ARect: TRect; Printing: Boolean);
  private
    Val, Fid_Bsn2 : Variant;
    ASelectedObj : TSelectedObj;
    FParamBlnc: TParamBlnc;
    CAName : String;
    CrnName : String;

    procedure LoadCDS(CDS: TClientDataSet);
    procedure CellVal(x, y: integer; Val: String; Obj : TObject = nil);
    procedure CalcRowHeights(y: integer);
    procedure GetAGPrinterInfo;
    procedure GetCrn(Val : Variant);
    procedure AutoSizeColumns(const DoFixedCols: Boolean;
      const Padding: Integer);
    procedure AddStnd;
  public
    procedure Initialize(AParamBlnc : TParamBlnc);

    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
    function GetDOC : Variant;
    procedure SetDOC(V : Variant);
  end;

var
  AccCard: TAccCard;

procedure ShowAccCard(AParamBlnc : TParamBlnc);

implementation

uses uDM, uFormApi_Oper, 
  foMyFuncAdvStrGrigExcel, uUnivSelector, uAccCard_Adv, uCardProp;

{$R *.DFM}


procedure ShowAccCard(AParamBlnc : TParamBlnc);
var F : TAccCard;
begin
  DM.Rights_GetUserRights(2001, Null);
  F := TAccCard.Create(nil);
  try
    F.Show;
    F.Repaint;
    with F do
    begin
      if AParamBlnc.DateFrom <> Null then
        dtFrom.Date := AParamBlnc.DateFrom;
      if AParamBlnc.DateTo <> Null then
        dtTo.Date := AParamBlnc.DateTo;

      AParamBlnc.DateFrom := GetDateAdv(dtFrom.Date, false);
      AParamBlnc.DateTo := GetDateAdv(dtTo.Date, true);
    end;
    F.Initialize(AParamBlnc);
  except
    F.Free;
  end;
end;
{ TBalance }


destructor TAccCard.Destroy;
var
    Reg : TRegistry;
    i : integer;
begin
 // if not cdsBalanceBy.IsEmpty then
  SaveValToRegistry(GetDOC, SRegPath + '\' + ClassName, 'DOC');
  SaveGridSettingsToRegistryTMS(AdvStringGrid1, SRegPath + '\' + Self.ClassName);

  SaveValToRegistry(ASelectedObj.ID, SRegPath + '\' + Name, 'id_Acc');
  inherited;
end;

constructor TAccCard.Create(AOwner: TCOmponent);
var 
    Year, Month, Day: Word;
    DDD : TDate;
    Reg : TRegistry;
    i : integer;
    V : Variant;
begin
  inherited;
  AddStnd;
  QuickSortSLWP(cbDoc.Items, false);
  LoadValFromRegistry(V, SRegPath + '\' + ClassName, 'DOC');
  SetDOC(V);

  AdvStringGrid1.ColCount := 1;
  Val := Null;
//  LoadValFromRegistry(Val, SRegPath + '\' + Name, 'id_Acc');
//  lbCrn.Caption := '';
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
//  RxDBGrid1.RowHeight := 6;


  DecodeDate(Now, Year, Month, Day);
  dtFrom.Date := EncodeDate(Year, Month, 1);
  DDD := IncMonth(Now, 1);
  DecodeDate(DDD, Year, Month, Day);
  dtTo.Date := EncodeDate(Year, Month, 1) - 1;
  dtFrom.Checked := false;
  dtTo.Checked := false;

  dtFrom.Date := Now - 7;
  dtTo.Date := Now;
  LoadGridSettingsFromRegistryTMS(AdvStringGrid1, SRegPath + '\' + Self.ClassName);
end;

procedure TAccCard.Initialize(AParamBlnc: TParamBlnc);
var ObjName, ObjID, BsnName, id_business: OleVariant;
begin
  Screen.Cursor := crSQLWait;
  Enabled := false;
  try

    FParamBlnc := AParamBlnc;
    if AReadOneObj and (FParamBlnc.id_Acc = Null) then
    begin
      if DM.SnglObj_Acc(ObjName, ObjID, BsnName, id_business) then
      begin
        FParamBlnc.id_Acc := ObjID;
        edObjName.Text := BsnName + '\' + ObjName;
      end;
    end;

    ASelectedObj.ID := FParamBlnc.id_Acc;

    with cdsBalanceBy do
    begin
      Close;
      Params.ParamByName('@DateFrom').Value := FParamBlnc.DateFrom;
      Params.ParamByName('@DateTo').Value := FParamBlnc.DateTo;
      Params.ParamByName('@id_Acc').Value := FParamBlnc.id_Acc;
      Params.ParamByName('@id_User').Value := DM.IDUser;
      Params.ParamByName('@id_Currency').Value := lcCur.KeyValue;

      Params.ParamByName('@DOC').Value := GetDOC;

      if (FParamBlnc.id_Acc <> Null)then
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

procedure TAccCard.miOfferClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
end;

procedure TAccCard.BitBtn1Click(Sender: TObject);
begin
  ASelectedObj.ObjType := eotFin;
  ASelectedObj.ID := FParamBlnc.id_Acc;


  if SelectObjUn(Self, 2001, ASelectedObj, 0, [eotFin], false) then
  begin
    edObjName.Text := ASelectedObj.Name;

    FParamBlnc := GetEmptyParamBlnc;

    FParamBlnc.DateFrom := GetDateAdv(dtFrom.Date, false);
    FParamBlnc.DateTo := GetDateAdv(dtTo.Date, true);

    FParamBlnc.id_Acc := ASelectedObj.ID;
    GetCrn(ASelectedObj.Bsn_id);
//    Initialize(FParamBlnc);
  end;
end;

procedure TAccCard.GetCrn(Val : Variant);
var V : Variant;
begin
  V := GetDOC;
  if (Val <> null) and (cdsCur.Params.ParamByName('@id_Bsn').Value <> Val) then
  begin
    with cdsCur do
    begin
      Close;
      Params.ParamByName('@FastAccess').Value := true;
      Params.ParamByName('@AvForPay').Value := true;
      Params.ParamByName('@id_Bsn').Value := Val;
      Open;
    end;
    AddStnd;
    with cdsExtDataDict do
    begin
      Close;
      Params.ParamByName('@id_business').Value := Val;
      Open;
      First;
      while not Eof do
      begin
        if (cdsExtDataDictVisible.AsBoolean) and (cdsExtDataDictType.AsInteger = 2) then
          cbDoc.Items.AddObject(cdsExtDataDictParName.AsString, TVal_obj.Create(-cdsExtDataDictNumPrm.AsInteger));

        Next
      end;
    end;
    QuickSortSLWP(cbDoc.Items, false);
    SetDOC(V);

  end;
end;

procedure TAccCard.AddStnd;
var SL : TStringList;
begin
// SL.Sort
  with cbDoc do
  begin
    Items.Clear;
    Items.AddObject('', TVal_obj.Create(NULL));
    Items.AddObject('Осн. платежа/накладная', TVal_obj.Create(1));
    Items.AddObject('Пл. поручение/Счет фактура', TVal_obj.Create(2));
    Items.AddObject('Договор', TVal_obj.Create(3));
    Items.AddObject('Комментарий', TVal_obj.Create(4));
    Items.AddObject('Счет', TVal_obj.Create(5));
    Items.AddObject('Чужой объект', TVal_obj.Create(6));
  end;
end;



procedure TAccCard.GetAGPrinterInfo;
begin
  printer.Orientation := poLandscape;

  AdvStringGrid1.PrintSettings.Date := ppTopLeft;
  AdvStringGrid1.PrintSettings.DateFormat := 'dd-mm-yyyy hh:nn';

  AdvStringGrid1.PrintSettings.TitleText := '' + CAName + ' (валюта ' + CrnName + ')';

  AdvStringGrid1.PrintSettings.Title := ppTopCenter;

  AdvStringGrid1.PrintSettings.HeaderFont.Size := 12;
  AdvStringGrid1.PrintSettings.HeaderFont.Style := [fsBold];
end;


procedure TAccCard.ToolButton2Click(Sender: TObject);
begin
  GetAGPrinterInfo;
  printer.Orientation := poLandscape;
  
  AdvPreviewDialog1.Execute;
end;

procedure TAccCard.ToolButton1Click(Sender: TObject);
begin
  AdvGridPrintSettingsDialog1.Execute
end;

procedure TAccCard.CalcRowHeights(y : integer);
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


procedure TAccCard.CellVal(x, y : integer; Val : String; Obj : TObject);
begin
  AdvStringGrid1.Objects[x, y] := Obj;
  AdvStringGrid1.Cells[x, y] := Val;
end;

procedure TAccCard.LoadCDS(CDS: TClientDataSet);
var j, i, ImgIndex : integer;
    FFF : TOperDate;
    S : String;
begin
//  if not cdsBalanceBy.IsEmpty then
  SaveGridSettingsToRegistryTMS(AdvStringGrid1, SRegPath + '\' + Self.ClassName);

  with CDS do
  begin
    AdvStringGrid1.Clear;
    if (Active) and (not IsEmpty) then
      AdvStringGrid1.RowCount := RecordCount + 2
    else
      AdvStringGrid1.RowCount := 4;
    AdvStringGrid1.FixedRows := 2;

    AdvStringGrid1.ColCount := AdvStringGrid1.FixedCols + 9 + 2;
    
    AdvStringGrid1.DefaultRowHeight := 21;
    AdvStringGrid1.FixedCols := 0;
    AdvStringGrid1.FixedColWidth := 18;
    i := 0;

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 0, i, 1, 2);

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, 1, 2);
    CellVal(AdvStringGrid1.FixedCols + 1, i, 'Тип', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 2, i, 1, 2);
    CellVal(AdvStringGrid1.FixedCols + 2, i, 'Номер', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 3, i, 3, 1);
    CellVal(AdvStringGrid1.FixedCols + 3, i, 'Расход', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 6, i, 1, 2);
    CellVal(AdvStringGrid1.FixedCols + 6, i, 'Баланс', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 7, i, 1, 2);
    CellVal(AdvStringGrid1.FixedCols + 7, i, 'Доп. информация', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 8, i, 3, 1);
    CellVal(AdvStringGrid1.FixedCols + 8, i, 'Приход', Pointer(4));

    inc(i);
    CellVal(AdvStringGrid1.FixedCols + 3, i, 'Сумма', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 4, i, 'Валюта', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 5, i, 'Эквивалент', Pointer(4));

    CellVal(AdvStringGrid1.FixedCols + 8, i, 'Сумма', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 9, i, 'Валюта', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 10, i, 'Эквивалент', Pointer(4));

    if not CDS.Active then
    begin
      LoadGridSettingsFromRegistryTMS(AdvStringGrid1, SRegPath + '\' + Self.ClassName);
      Exit;
    end;
    First;
    CAName := cdsBalanceByCAName.AsString;
    CrnName := cdsBalanceByNAMEMain.AsString;
    if CAName <> '' then
      edObjName.Text := CAName;
    Fid_Bsn2 := FieldByName('id_business').AsVariant;
    if Fid_Bsn2 <> Null then
      GetCrn(Fid_Bsn2);
//    lbCrn.Caption := 'Валюта: ' + CrnName;
    while not Eof do
    begin
      inc(i);
      if FieldByName('isRes').AsBoolean then
      begin
        AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, AdvStringGrid1.ColCount - 1, 1);
        CellVal(AdvStringGrid1.FixedCols + 1, i, FieldByName('ExtInfo').AsString, Pointer(1));
      end
      else
      begin
        FFF := TOperDate.Create(Self);
        FFF.FId_Oper := FieldByName('id_Oper').AsInteger;
        FFF.FOperVid := FieldByName('OperVid').AsInteger;
        FFF.FIs_Mirr := FieldByName('Is_Mirr').AsBoolean;

        CellVal(0, i, '', FFF);

        case FieldByName('OperVid').AsInteger of
          -1 :
          begin
            ImgIndex := 6;
          end;
          1, 101 :
          begin
            ImgIndex := 1;
          end;
          2, 102 :
          begin
            ImgIndex := 0;
          end;
          3, 103 :
          begin
            ImgIndex := 2;
          end;
          4 :
          begin
            ImgIndex := 5;
          end;
          else
            ImgIndex := -1;
        end;
        AdvStringGrid1.AddDataImage(AdvStringGrid1.FixedCols + 1, i, ImgIndex, haCenter, vaCenter);
        CellVal(AdvStringGrid1.FixedCols + 2, i, FieldByName('OperNum').AsString);

        CellVal(AdvStringGrid1.FixedCols + 3, i, FieldByName('OperSummABS_D').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 4, i, FieldByName('CurrencyOperShortName_D').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 5, i, FieldByName('SummSysCurABS_D').DisplayText);

        CellVal(AdvStringGrid1.FixedCols + 6, i, FieldByName('TotalRez').DisplayText, Pointer(5));
        CellVal(AdvStringGrid1.FixedCols + 7, i, FieldByName('Docz').DisplayText, Pointer(5));

        CellVal(AdvStringGrid1.FixedCols + 8, i, FieldByName('OperSummABS_K').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 9, i, FieldByName('CurrencyOperShortName_K').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 10, i, FieldByName('SummSysCurABS_K').DisplayText);
      end;
      Next;
    end;
  end;
//  AutoSizeColumns(false, 12);
  AdvStringGrid1.AutoSizeRows(false, 0);
  AdvStringGrid1.RowHeights[AdvStringGrid1.RowCount - 1] := AdvStringGrid1.RowHeights[AdvStringGrid1.RowCount - 1] + 5;
  LoadGridSettingsFromRegistryTMS(AdvStringGrid1, SRegPath + '\' + Self.ClassName);

  // Курвовые изменения
  i := AdvStringGrid1.FixedRows;
  j := i;
  with AdvStringGrid1 do
  begin
    while (i < AdvStringGrid1.rowcount - 1) do
    begin
      while  (AdvStringGrid1.Objects[0, j] is TOperDate) and (AdvStringGrid1.Objects[0, j + 1] is TOperDate) and
             (TOperDate(AdvStringGrid1.Objects[0, j]).FOperVid = -1) and
             (TOperDate(AdvStringGrid1.Objects[0, j]).FOperVid = TOperDate(AdvStringGrid1.Objects[0, j + 1]).FOperVid) and
             (j < rowcount - 1) do
        inc(j);
      if (i <> j) then
        AddNode(i, j - i + 1);
      i:= j + 1;
      j:= i;
    end;
    ContractAll;
  end; 
end;

procedure TAccCard.AutoSizeColumns(const DoFixedCols: Boolean; const Padding: Integer);
  function CheckLimits(Value,LowLimit,UpLimit: Integer): Integer;
  begin
    Result := Value;

    if LowLimit <> UpLimit then
    begin
      if (Value < LowLimit) and (LowLimit > 0) then
        Result := LowLimit;
      if (Value > Uplimit) and (UpLimit > 0) then
        Result := UpLimit;
    end;
  end;
var
  i,j: Integer;
begin
  with AdvStringGrid1 do
  begin
    if DoFixedCols then
      j := 0
    else
      j := FixedCols;

    for i := j to ColCount - 1 do
    begin
      if ColWidths[i] > 1 then
      begin
        AutoSizeCol(i);
        if Padding <> 0 then
          ColWidths[i] := CheckLimits(ColWidths[i] + Padding, MinColWidth, MaxColWidth);
      end;
    end;
  end;
end;


procedure TAccCard.AdvStringGrid1GetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
var Obj : TObject;
begin
  if (ARow > AdvStringGrid1.FixedRows) then
  begin  
    if ARow mod 2 = 1 then
      ABrush.Color := clInfoBk
    else
      ABrush.Color := clWhite;
  end;
  if ARow = AdvStringGrid1.RowCount then
    ABrush.Color := $00D7D7D7;
  Obj := AdvStringGrid1.Objects[ACol, ARow];
  if Obj <> nil then
  begin
    if Obj = Pointer(1) then
      ABrush.Color := $00D7D7D7;   
    AFont.Style := [fsBold];
  end;
end;

procedure TAccCard.AdvStringGrid1GetAlignment(Sender: TObject; ARow,
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

procedure TAccCard.ToolButton3Click(Sender: TObject);
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

procedure TAccCard.AdvStringGrid1ColumnSize(Sender: TObject; ACol: Integer;
  var Allow: Boolean);
var i : integer;
begin
{  for i := 0 to AdvStringGrid1.RowCount - 1 do
    CalcRowHeights(i);   }
end;

procedure TAccCard.BitBtn2Click(Sender: TObject);
var AID, i : integer;
    Fis_Mirr : boolean;
begin
  with AdvStringGrid1 do
    if not ((Objects[0, Row] = nil) or (integer(Objects[0, Row]) <= 1)) then
    begin
      AID := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).FId_Oper;
      Fis_Mirr := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).Fis_Mirr;
    end
    else
      AID := -1;

  FParamBlnc.DateFrom := GetDateAdv(dtFrom.Date, false);
  FParamBlnc.DateTo := GetDateAdv(dtTo.Date, true);

  Initialize(FParamBlnc);
  if AID <> -1 then
    with AdvStringGrid1 do
      for i := 0 to RowCount - 1 do
      begin
         if (integer(Objects[0, i]) > 1) and (TObject(Objects[0, i]) is TOperDate) and (TOperDate(Objects[0, i]).FId_Oper = AID) then
         begin
           Row := i;
           Break;
         end;
      end;
end;

procedure TAccCard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAccCard.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TAccCard.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TAccCard.aPropExecute(Sender: TObject);
var
    ID, FOperVid : integer;
    Rez : boolean;
    B : boolean;
    Fid_OperParent : Variant;
    Fis_Mirr : boolean;
    AOperParamz : TOperParamz;
begin
  with AdvStringGrid1 do
    if (Objects[0, Row] = nil) or (integer(Objects[0, Row]) <= 1) then
      Exit;
  if TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).FId_Oper = -1 then
    Exit;

  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ID_Oper := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).FId_Oper;
  AOperParamz.Is_Mirr := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).Fis_Mirr;
  AOperParamz.ReadOnly := true;
  
  Fid_OperParent := Null;
  ID := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).FId_Oper;
  Fis_Mirr := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).Fis_Mirr;
  FOperVid := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).FOperVid;
  Rez := false;
  B := true;
  case FOperVid of
    -1 : EditOperCrnCh(Handle, AOperParamz);
    1 : EditOperWare(Handle, AOperParamz);
    2 : EditOperFin(Handle, AOperParamz);
    4 : EditOperOffset(Handle, AOperParamz);
    101 : EditOperWare_FFF(Handle, AOperParamz);
    102 : EditOperFin_FFF(Handle, AOperParamz);
  end;
end;

procedure TAccCard.cdsBalanceByAfterOpen(DataSet: TDataSet);
begin
  aProp.Enabled := not cdsBalanceBy.IsEmpty;
end;

procedure TAccCard.AdvStringGrid1DblClick(Sender: TObject);
begin
  if AdvStringGrid1.Row < AdvStringGrid1.FixedRows  then
    Exit;
  aProp.Execute;
end;

procedure TAccCard.AdvStringGrid1ClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  aProp.Enabled := (AdvStringGrid1.Objects[0, ARow] <> nil) and
  (TOperDate(AdvStringGrid1.Objects[0, ARow]).FId_Oper <> -1);
//  AdvStringGrid1.SelectCols(ACol, 1);
end;

procedure TAccCard.aExportExecute(Sender: TObject);
begin
  AdvStringGridToExcel(AdvStringGrid1, CAName + ' (валюта ' + CrnName + ')');
end;

procedure TAccCard.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TAccCard.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TAccCard.AdvStringGrid1GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  FloatFormat := '### ### ### ###.00';
end;

procedure TAccCard.AdvStringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  Edit1.Text := IntToStr(GetTickCount);
end;

procedure TAccCard.AdvStringGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  Edit1.Text := '**' + IntToStr(GetTickCount);

end;

procedure TAccCard.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
var S : String;
begin
  S := FormatFloat('0.##', CalcSummAdvSringGrid(AdvStringGrid1));
  if S <> Edit1.Text then
    Edit1.Text := S;
end;

procedure TAccCard.BitBtn3Click(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_Acc := ASelectedObj.ID;
  AParamBlnc.id_business := Fid_Bsn2;
  ShowAccCard_Adv(AParamBlnc);
end;

procedure TAccCard.AdvStringGrid1ExpandNode(Sender: TObject; ARow,
  ARowreal: Integer);
begin
  aProp.Enabled := false;
end;

procedure TAccCard.AdvStringGrid1ContractNode(Sender: TObject; ARow,
  ARowreal: Integer);
begin
  aProp.Enabled := false;
end;

procedure TAccCard.aSettingsExecute(Sender: TObject);
begin                   
  if ShowCardProp(AdvStringGrid1, '') then
  begin
//    SaveStng;
  end;

end;

procedure TAccCard.AdvStringGrid1CanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := false;
end;

procedure TAccCard.AdvStringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
//  if AdvStringGrid1.Alignments[ACol, ARow]
end;

function TAccCard.GetDOC: Variant;
var Obj : TObject;
begin
  Result := Null;
  if cbDoc.ItemIndex >= 0 then
  begin
     Obj := cbDoc.Items.Objects[cbDoc.ItemIndex];
    if (Obj is TVal_obj) then
      Result := TVal_obj(Obj).ID

  end;
end;

procedure TAccCard.SetDOC(V: Variant);
var i : integer;
    Obj : TObject;
begin
  if V = Null then
  begin
    cbDoc.ItemIndex := -1;
  end
  else
  begin
    for i := 0 to cbDoc.Items.Count - 1 do
    begin
      Obj := cbDoc.Items.Objects[i];
      if (Obj is TVal_obj) and (TVal_obj(Obj).ID = V) then
      begin
        cbDoc.ItemIndex := i;
        Break;
      end;
    end;
  end;
end;

{ TVal_obj }

constructor TVal_obj.Create(AID: Variant);
begin
  inherited Create;
  ID := AID;

end;

procedure TAccCard.AdvStringGrid1CustomCellDraw(Sender: TObject;
  Canvas: TCanvas; ACol, ARow: Integer; AState: TGridDrawState;
  ARect: TRect; Printing: Boolean);
var S : String;
    R: TRect;
    FFF : integer;
    Alig : TAlignment;
    Obj : TObject;
begin
 { Canvas.FillRect(ARect);
  Canvas.Font.Color := clRed;
  R := ARect;
  R.Left := R.Left + 2;
  R.Top := R.Top + 2;
  FFF := 0;
  S := AdvStringGrid1.Cells[ACol, ARow];

  Obj := AdvStringGrid1.Objects[ACol, ARow];
  if Obj <> nil then
  begin
    if Obj = Pointer(2) then
      Alig := taLeftJustify;
    if Obj = Pointer(3) then
      Alig := taRightJustify;
    if Obj = Pointer(4) then
      Alig := taCenter;
  end;

  if Alig = taLeftJustify then
    FFF := DT_LEFT;
  if Alig = taRightJustify then
    FFF := DT_Right;
  if Alig = taCenter then
    FFF := DT_Center;
  FFF := FFF OR DT_END_ELLIPSIS;

  DrawText(Canvas.Handle, PChar(S), -1, R, FFF); }
end;

end.
