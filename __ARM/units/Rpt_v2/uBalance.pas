unit uBalance;

interface

uses                
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, ImgList,
    foMyFunc, Menus, RXCtrls, ComCtrls, Registry, printers,
   ToolWin, ComObj,
  Buttons,
  BaseGrid, AdvGrid, asgprint, asgprev, DBGrids, RXDBCtrl, ActnList,
  RxLookup, AdvCGrid;

type
  TVal_obj = class
    ID : Variant;
    constructor Create(AID : Variant);
  end;

  TOperDate = class(TComponent)
  private
    function GetId_CurrencyOFF: Variant;
  public
    FId_Oper : integer;  
    FOperVid : integer;
    Fis_Mirr, FOperTypeIn : boolean;
    Id_CurrencyOper, Id_CurrencySys, Name, CrnVal : Variant;
    property  Id_CurrencyOFF : Variant read GetId_CurrencyOFF;
  end;

  THackAdvStringGrid = class(TAdvStringGrid)
    function NodeIndent(ARow: Integer): Integer;  override;
  end;
  
  TBalance = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    cdsBalanceBy: TClientDataSet;
    dsArc: TDataSource;
    ilImage3: TImageList;
    pnDate: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    dtTo: TDateTimePicker;
    dtFrom: TDateTimePicker;
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
    SaveDialog1: TSaveDialog;
    cdsBalanceBySummSysCurABS_D: TFloatField;
    cdsBalanceBySummSysCurABS_K: TFloatField;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    AdvStringGrid1: TAdvColumnGrid;
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
    ToolButton6: TToolButton;
    aExport: TAction;
    aExportSmp: TAction;
    ToolButton7: TToolButton;
    RxSpeedButton1: TRxSpeedButton;
    ToolButton8: TToolButton;
    Label4: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    cdsBalanceByisGrpOper: TBooleanField;
    cdsBalanceByid_Goods: TIntegerField;
    cdsBalanceByis_Mirr: TBooleanField;
    cdsBalanceByRateMain: TFloatField;
    cdsBalanceByRateOper: TFloatField;
    cdsBalanceByRateSys: TFloatField;
    cdsBalanceByDocz: TStringField;
    dsCur: TDataSource;
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
    Label5: TLabel;
    cdsBalanceByid_business: TIntegerField;
    aSettings: TAction;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    aExpAll: TAction;
    aClpsAll: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    aExpAll1: TMenuItem;
    aClpsAll1: TMenuItem;
    cbDoc: TComboBox;
    Label6: TLabel;
    cdsExtDataDict: TClientDataSet;
    cdsExtDataDictid_Oper_ExtDataNames: TIntegerField;
    cdsExtDataDictid_business: TIntegerField;
    cdsExtDataDictType: TIntegerField;
    cdsExtDataDictNumPrm: TIntegerField;
    cdsExtDataDictParName: TStringField;
    cdsExtDataDictVisible: TBooleanField;
    Button1: TButton;
    cdsBalanceByNNN: TIntegerField;
    cdsBalanceById_CurrencyOper: TIntegerField;
    cdsBalanceById_CurrencySys: TIntegerField;
    procedure dsArcDataChange(Sender: TObject; Field: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure AdvStringGrid1GetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure AdvStringGrid1GetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure ToolButton3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure aPropExecute(Sender: TObject);
    procedure cdsBalanceByAfterOpen(DataSet: TDataSet);
    procedure AdvStringGrid1DblClick(Sender: TObject);
    procedure AdvStringGrid1ClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure aExportExecute(Sender: TObject);
    procedure aExportSmpExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure CheckBox1Click(Sender: TObject);
    procedure AdvStringGrid1ContractNode(Sender: TObject; ARow,
      ARowreal: Integer);
    procedure AdvStringGrid1ExpandNode(Sender: TObject; ARow,
      ARowreal: Integer);
    procedure aSettingsExecute(Sender: TObject);
    procedure AdvStringGrid1CanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure aExpAllExecute(Sender: TObject);
    procedure aClpsAllExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    Val : Variant;
    ASelectedObj : TSelectedObj;
    FParamBlnc: TParamBlnc;
    CAName : String;
    CrnName : String;

    procedure LoadCDS(CDS: TClientDataSet);
    procedure CellVal(x, y: integer; Val: String; Obj : TObject = nil);
    procedure CalcRowHeights(y: integer);
    procedure GetAGPrinterInfo;
    procedure GetCrn(Val: Variant);
    procedure AutoSizeColumns(const DoFixedCols: Boolean;
      const Padding: Integer);
    procedure AddStnd;
    procedure DoExp;
  public
    procedure Initialize(AParamBlnc : TParamBlnc);

    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;

    function GetDOC : Variant;
    procedure SetDOC(V : Variant);
  end;

var
  Balance: TBalance;

procedure ShowBalance(AParamBlnc : TParamBlnc);

implementation

uses uDM, PrvFrm_2, unEhMyFunc, uCASelector, uFormApi_Oper,
  foMyFuncAdvStrGrigExcel, uCardProp;

{$R *.DFM}


procedure ShowBalance(AParamBlnc : TParamBlnc);
var F : TBalance;
begin
  DM.Rights_GetUserRights(2002, Null);
  F := TBalance.Create(nil);
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


destructor TBalance.Destroy;
var
    Reg : TRegistry;
    i : integer;
begin
  SaveValToRegistry(GetDOC, SRegPath + '\' + ClassName, 'DOC');
  SaveGridSettingsToRegistryTMS(AdvStringGrid1, SRegPath + '\' + Self.ClassName);

  SaveValToRegistry(ASelectedObj.ID, SRegPath + '\' + Name, 'IDBsn2');
  SaveValToRegistry(CheckBox1.checked, SRegPath + '\' + Name,  'Grp');
  inherited;
end;

constructor TBalance.Create(AOwner: TCOmponent);
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
  LoadValFromRegistry(Val, SRegPath + '\' + Name,  'Grp');
  if Val <> Null then
    CheckBox1.Checked := Val;
  CheckBox1.OnClick(CheckBox1);

//  LoadValFromRegistry(Val, SRegPath + '\' + Name, 'IDBsn2');

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

  dtFrom.Date := Now - 7;
  dtTo.Date := Now;
  LoadGridSettingsFromRegistryTMS(AdvStringGrid1, SRegPath + '\' + Self.ClassName);
end;

procedure TBalance.Initialize(AParamBlnc: TParamBlnc);
var ObjName, ObjID, BsnName, id_business: OleVariant;
begin
  Screen.Cursor := crSQLWait;
  Enabled := false;
  try

    FParamBlnc := AParamBlnc;

    if AReadOneObj and (FParamBlnc.id_ContrAgent = Null) then
    begin
      if DM.SnglObj_CA(ObjName, ObjID, BsnName, id_business) then
      begin
        FParamBlnc.id_ContrAgent := ObjID;
        edObjName.Text := {BsnName + '\' +} ObjName;
      end;
    end;

    ASelectedObj.ID := FParamBlnc.id_ContrAgent;

    with cdsBalanceBy do
    begin
      Close;
      Params.ParamByName('@DateFrom').Value := FParamBlnc.DateFrom;
      Params.ParamByName('@DateTo').Value := FParamBlnc.DateTo;
      Params.ParamByName('@id_ContrAgent').Value := FParamBlnc.id_ContrAgent;
      Params.ParamByName('@Det').Value := CheckBox1.Checked;
      Params.ParamByName('@id_User').Value := DM.IDUser;
      Params.ParamByName('@id_Currency').Value := lcCur.KeyValue;
      
      Params.ParamByName('@DOC').Value := GetDOC;
      if (FParamBlnc.id_ContrAgent <> Null) or (FParamBlnc.id_Repr <> Null) then
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

procedure TBalance.dsArcDataChange(Sender: TObject; Field: TField);
begin
//  StatusBar1.Panels[0].Text := 'Всего записей: ' + IntToStr(dsArc.DataSet.RecordCount);
end;

procedure TBalance.BitBtn1Click(Sender: TObject);
begin
  ASelectedObj.ObjType := eotCA;
  ASelectedObj.ID := FParamBlnc.id_ContrAgent;

  if SelectCA(Self, ASelectedObj, 0, null, 2002) then
  begin
    edObjName.Text := ASelectedObj.Name;

    FParamBlnc := GetEmptyParamBlnc;
    FParamBlnc.DateFrom := GetDateAdv(dtFrom.Date, false);
    FParamBlnc.DateTo := GetDateAdv(dtTo.Date, true);

   { if dtFrom.Checked then
      FParamBlnc.DateFrom := Int(dtFrom.Date)
    else
      FParamBlnc.DateFrom := Null;
    if dtTo.Checked then
      FParamBlnc.DateTo := Int(dtFrom.Date) + 1
    else
      FParamBlnc.DateTo := Null;    }

    FParamBlnc.id_ContrAgent := ASelectedObj.ID;
    GetCrn(ASelectedObj.Bsn_id);
//    Initialize(FParamBlnc);
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
  if y >= AdvStringGrid1.RowCount then
    AdvStringGrid1.RowCount := y + 1; 
  AdvStringGrid1.Objects[x, y] := Obj;
  AdvStringGrid1.Cells[x, y] := Val;
end;

procedure TBalance.LoadCDS(CDS: TClientDataSet);
var i, ImgIndex, j : integer;
    FFF : TOperDate;
    S : String;
begin
  SaveGridSettingsToRegistryTMS(AdvStringGrid1, SRegPath + '\' + Self.ClassName);

  AdvStringGrid1.DefaultRowHeight := 21;
  AdvStringGrid1.FixedCols := 0;
  AdvStringGrid1.FixedColWidth := 8;
  
  with CDS do
  begin
    AdvStringGrid1.RemoveAllNodes;
    AdvStringGrid1.Clear;
    if (Active) and (not IsEmpty) then
      AdvStringGrid1.RowCount := RecordCount + 3
    else
      AdvStringGrid1.RowCount := 4;
    AdvStringGrid1.FixedRows := 3;

    AdvStringGrid1.ColCount := AdvStringGrid1.FixedCols + 17;
    i := 0;
    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 0, i, 1, 3);

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, 1, 3);
    CellVal(AdvStringGrid1.FixedCols + 1, i, 'Тип', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 2, i, 1, 3);
    CellVal(AdvStringGrid1.FixedCols + 2, i, 'Номер', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 3, i, 7, 1);
    CellVal(AdvStringGrid1.FixedCols + 3, i, 'Расход', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 10, i, 1, 3);
    CellVal(AdvStringGrid1.FixedCols + 10, i, 'Баланс', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 11, i, 1, 3);
    CellVal(AdvStringGrid1.FixedCols + 11, i, 'Доп. информация', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 12, i, 5, 1);
    CellVal(AdvStringGrid1.FixedCols + 12, i, 'Приход', Pointer(4));

    inc(i);
    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 3, i, 2, 1);
    CellVal(AdvStringGrid1.FixedCols + 3, i, 'Операция', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 5, i, 2, 1);
    CellVal(AdvStringGrid1.FixedCols + 5, i, 'Зачтено', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 7, i, 3, 1);
    CellVal(AdvStringGrid1.FixedCols + 7, i, 'Эквивалент', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 12, i, 2, 1);
    CellVal(AdvStringGrid1.FixedCols + 12, i, 'Операция', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 14, i, 2, 1);
    CellVal(AdvStringGrid1.FixedCols + 14, i, 'Зачтено', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 16, i, 1, 2);
    CellVal(AdvStringGrid1.FixedCols + 16, i, 'Эквивалент', Pointer(4));

    inc(i);
    CellVal(AdvStringGrid1.FixedCols + 3, i, 'Сумма', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 4, i, 'Валюта', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 5, i, 'Сумма', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 6, i, 'Валюта', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 7, i, 'Сумма', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 8, i, 'Себестоимость', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 9, i, 'Прибыль', Pointer(4));

    CellVal(AdvStringGrid1.FixedCols + 12, i, 'Сумма', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 13, i, 'Валюта', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 14, i, 'Сумма', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 15, i, 'Валюта', Pointer(4));

//    CellVal(AdvStringGrid1.FixedCols + 15, i, 'Сумма', Pointer(4));
//    CellVal(AdvStringGrid1.FixedCols + 16, i, 'Валюта', Pointer(4));

    if not CDS.Active then
    begin
      LoadGridSettingsFromRegistryTMS(AdvStringGrid1, SRegPath + '\' + Self.ClassName);
      Exit;
    end;
    First;
    CAName := cdsBalanceByCAName.AsString;
    Caption := 'Расчет с контрагентом - ' + CAName;
    if CAName <> '' then
      edObjName.Text := CAName;
    CrnName := cdsBalanceByNAMEMain.AsString;
    lbCrn.Caption := 'Валюта: ' + CrnName;
    if FieldByName('id_business').AsVariant <> Null then
      GetCrn(FieldByName('id_business').AsVariant);
    while not Eof do
    begin
      inc(i);
      if FieldByName('isRes').AsBoolean then
      begin
        CellVal(AdvStringGrid1.FixedCols + 0, i, '', Pointer(1));
        AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, 16, 1);
        CellVal(AdvStringGrid1.FixedCols + 1, i, FieldByName('ExtInfo').AsString, Pointer(1));
        CellVal(0, i, '', nil);
      end
      else
      begin
        FFF := TOperDate.Create(Self);
        FFF.FId_Oper := FieldByName('id_Oper').AsInteger;
        FFF.FOperVid := FieldByName('OperVid').AsInteger;
        FFF.Fis_Mirr := FieldByName('is_Mirr').AsBoolean;
        FFF.FOperTypeIn := FieldByName('OperTypeIn').AsBoolean;

        
        FFF.Id_CurrencyOper := FieldByName('Id_CurrencyOper').AsVariant;
        FFF.Id_CurrencySys := FieldByName('Id_CurrencySys').AsVariant;
        if not FieldByName('Id_CurrencySys').IsNull then
        begin

          if FieldByName('CurrencyShortName_D').AsString <> '' then
          begin
            FFF.Name := FieldByName('CurrencyShortName_D').AsString;
            FFF.CrnVal := FieldByName('SummSysCurABS_D').AsFloat;
          end
          else
          begin
            FFF.Name := FieldByName('CurrencyShortName_K').AsString;
            FFF.CrnVal := FieldByName('SummSysCurABS_K').AsFloat;
          end;
        end
        else
        begin
          if FieldByName('CurrencyOperShortName_D').AsString <> '' then
          begin
            FFF.Name := FieldByName('CurrencyOperShortName_D').AsString;
            FFF.CrnVal := FieldByName('OperSummABS_D').AsFloat;
          end
          else
          begin
            FFF.Name := FieldByName('CurrencyOperShortName_K').AsString;
            FFF.CrnVal := FieldByName('OperSummABS_K').AsFloat;
          end
        end;

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
        CellVal(AdvStringGrid1.FixedCols + 5, i, CDS.FieldByName('SummSysCurABS_D').DisplayText);
        if FieldByName('SummSysCurABS_D').AsString <> '' then
          CellVal(AdvStringGrid1.FixedCols + 6, i, CDS.FieldByName('CurrencyShortName_D').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 7, i, FieldByName('OperSummSysCurABS_D').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 8, i, FieldByName('OperSum_InvCur_D').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 9, i, FieldByName('DeltaInv_D').DisplayText);

        //if (not CheckBox1.Checked) or (FieldByName('isGrpOper').AsBoolean) then
        CellVal(AdvStringGrid1.FixedCols + 10, i, FieldByName('TotalRez').DisplayText, Pointer(5));
        CellVal(AdvStringGrid1.FixedCols + 11, i, FieldByName('Docz').DisplayText);

        CellVal(AdvStringGrid1.FixedCols + 12, i, FieldByName('OperSummABS_K').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 13, i, FieldByName('CurrencyOperShortName_K').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 14, i, FieldByName('SummSysCurABS_K').DisplayText);
        if FieldByName('SummSysCurABS_K').AsString <> '' then
          CellVal(AdvStringGrid1.FixedCols + 15, i, FieldByName('CurrencyShortName_K').DisplayText);

        CellVal(AdvStringGrid1.FixedCols + 16, i, FieldByName('OperSummSysCurABS_K').DisplayText);

      end;
      Next;
    end;
  end;
  AdvStringGrid1.AutoSizeColumns(false, 10);
  AdvStringGrid1.AutoSizeRows(false, 0);
  LoadGridSettingsFromRegistryTMS(AdvStringGrid1, SRegPath + '\' + Self.ClassName);

  if CheckBox1.Checked then
  begin
    i := AdvStringGrid1.FixedRows;
    j := i;
    with AdvStringGrid1 do
    begin
      while (i < AdvStringGrid1.rowcount - 1) do
      begin
        while (cells[2, j] = AdvStringGrid1.cells[2, j + 1]) and (j < rowcount - 1) do
          inc(j);
        if (i <> j) then
          AddNode(i, j - i + 1);
        i:= j + 1;
        j:= i;
      end;
    end;
  end;
  
  // Курвовые изменения
  i := AdvStringGrid1.FixedRows;
  j := i;
  with AdvStringGrid1 do
  begin
    while (i < AdvStringGrid1.rowcount - 1) do
    begin
      while  (AdvStringGrid1.Objects[0, j] is TOperDate) and (AdvStringGrid1.Objects[0, j + 1] is TOperDate) and
             (TOperDate(AdvStringGrid1.Objects[0, j]).FOperVid = -1) {and
             (TOperDate(AdvStringGrid1.Objects[0, j]).FOperVid = TOperDate(AdvStringGrid1.Objects[0, j + 1]).FOperVid)} and
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

procedure TBalance.AutoSizeColumns(const DoFixedCols: Boolean; const Padding: Integer);
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

procedure TBalance.AdvStringGrid1GetCellColor(Sender: TObject; ARow,
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

  if ARow > AdvStringGrid1.FixedRows then
  begin
    if (THackAdvStringGrid(AdvStringGrid1).CellProperties[0, ARow].NodeLevel = 1) and
       (THackAdvStringGrid(AdvStringGrid1).GetNodeSpan(ARow) = -1) then
      ABrush.Color := $00EEEEEE;//$00E6E6E6;
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

procedure TBalance.BitBtn2Click(Sender: TObject);
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
         if (integer(AdvStringGrid1.Objects[0, i]) > 1) and (TObject(AdvStringGrid1.Objects[0, i]) is TOperDate) and (TOperDate(AdvStringGrid1.Objects[0, i]).FId_Oper = AID) then
         begin
           Row := i;
           Break;
         end;
      end;
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
    B, Fis_Mirr : boolean;
    Fid_OperParent : Variant;
    AOperParamz : TOperParamz;
begin
  with AdvStringGrid1 do
    if (Objects[0, Row] = nil) or (integer(Objects[0, Row]) <= 1) then
      Exit;
  if TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).FId_Oper = -1 then
    Exit;
    
  Fid_OperParent := Null;
  ID := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).FId_Oper;
  FOperVid := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).FOperVid;
  Fis_Mirr := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).Fis_Mirr;
  Rez := false;
  B := true;
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ID_Oper := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).FId_Oper;
  AOperParamz.Is_Mirr := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).Fis_Mirr;
  AOperParamz.ReadOnly := true;

  case FOperVid of
    -1 : EditOperCrnCh(Handle, AOperParamz);
    0 : EditOperEmpty(Handle, AOperParamz);
    1 : EditOperWare(Handle, AOperParamz);
    2 : EditOperFin(Handle, AOperParamz);
    4 : EditOperOffset(Handle, AOperParamz);
    
    101 : EditOperWare_FFF(Handle, AOperParamz);
    102 : EditOperFin_FFF(Handle, AOperParamz);

  end;
end;

procedure TBalance.cdsBalanceByAfterOpen(DataSet: TDataSet);
begin
  aProp.Enabled := not cdsBalanceBy.IsEmpty;
end;

procedure TBalance.AdvStringGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := AdvStringGrid1.ScreenToClient(P);
  if P.x <= AdvStringGrid1.ColWidths[0] then
    Exit;

  if (AdvStringGrid1.Row >= AdvStringGrid1.FixedRows) and (AdvStringGrid1.Col >= 1) {AdvStringGrid1.FixedRows}  then
    aProp.Execute;
end;

procedure TBalance.AdvStringGrid1ClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  with AdvStringGrid1 do
    aProp.Enabled :=
     not((Objects[0, Row] = nil) or (integer(Objects[0, Row]) <= 1))
end;

procedure TBalance.aExportExecute(Sender: TObject);
begin
  AdvStringGridToExcel(AdvStringGrid1, CAName + ' (валюта ' + CrnName + ')');
end;

function LineFeedsToXLS(s:string):string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(s) do
    if (s[i] <> #13) {and (s[i] <> #10)} then
      Result := Result + s[i]
    else
      Result := Result + ' ';
end;

procedure GreedToExcel_smp(Grid: TAdvStringGrid; ACaption : string);
var i, MaxColWdth : integer;
    ExcelApp, DataValues : Variant;
    Workbook, Column, Row, Sheet, Cell1, Cell2, Range : Variant;
    BeginCol, BeginRow, LLL: integer;
    inMerg : boolean;
begin
  Range := Null;
  MaxColWdth := 100;
  inMerg := false;
    if (trim(ACaption) <> '') then
      BeginRow := 3
    else
      BeginRow := 1;

    BeginCol := 1;
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.DisplayAlerts := false;
    //ExcelApp.visible := true;
    try
      try Workbook := ExcelApp.WorkBooks.Add; except end;
      Sheet := ExcelApp.Workbooks[1].WorkSheets[1];

      Cell1 := Sheet.Cells[BeginRow, BeginCol];
      Cell2 := Sheet.Cells[BeginRow, BeginCol + 1];
      Range := Sheet.Range[Cell1, Cell2];
      Range.Merge;
      Range.HorizontalAlignment := 3;
      Range.VerticalAlignment := 2;
      Range.Borders.LineStyle := 1;
      Range.Value := 'Расход';

      Cell1 := Sheet.Cells[BeginRow, BeginCol + 2];
      Cell2 := Sheet.Cells[BeginRow + 1, BeginCol + 2];
      Range := Sheet.Range[Cell1, Cell2];
      Range.Merge;
      Range.HorizontalAlignment := 3;
      Range.VerticalAlignment := 2;
      Range.Borders.LineStyle := 1;
      Range.Value := 'Баланс';

      Cell1 := Sheet.Cells[BeginRow, BeginCol + 3];
      Cell2 := Sheet.Cells[BeginRow, BeginCol + 4];
      Range := Sheet.Range[Cell1, Cell2];
      Range.Merge;
      Range.HorizontalAlignment := 3;
      Range.VerticalAlignment := 2;
      Range.Borders.LineStyle := 1;
      Range.Value := 'Приход';

      Cell1 := Sheet.Cells[BeginRow + 1, BeginCol];
      Cell1.Value := 'Сумма';
      Cell1.Borders.LineStyle := 1;
      Cell1 := Sheet.Cells[BeginRow + 1, BeginCol + 1];
      Cell1.Value := 'Валюта';
      Cell1.Borders.LineStyle := 1;

      Cell1 := Sheet.Cells[BeginRow + 1, BeginCol + 3];
      Cell1.Value := 'Сумма';
      Cell1.Borders.LineStyle := 1;
      Cell1 := Sheet.Cells[BeginRow + 1, BeginCol + 4];
      Cell1.Value := 'Валюта';
      Cell1.Borders.LineStyle := 1;

      for i := Grid.FixedRows to Grid.RowCount - 1 do
      begin
        if not Grid.IsXMergedCell(2, i) then
        begin
          if Grid.Cells[6, i] <> '' then
            LLL := 2
          else
            LLL := 0;
          Cell1 := Sheet.Cells[BeginRow + 2 + i - Grid.FixedRows, BeginCol];
          Cell1.Value := LineFeedsToXLS(Grid.Cells[3 + LLL, i]);
          Cell1.Borders.LineStyle := 1;

          Cell1 := Sheet.Cells[BeginRow + 2 + i - Grid.FixedRows, BeginCol + 1];
          Cell1.Value := LineFeedsToXLS(Grid.Cells[4 + LLL, i]);
          Cell1.Borders.LineStyle := 1;

          Cell1 := Sheet.Cells[BeginRow + 2 + i - Grid.FixedRows, BeginCol + 2];
          Cell1.Value := LineFeedsToXLS(Grid.Cells[10, i]);
          Cell1.Borders.LineStyle := 1;

          if Grid.Cells[15, i] <> '' then
            LLL := 2
          else
            LLL := 0;

          Cell1 := Sheet.Cells[BeginRow + 2 + i - Grid.FixedRows, BeginCol + 3];
          Cell1.Value := LineFeedsToXLS(Grid.Cells[12 + LLL, i]);
          Cell1.Borders.LineStyle := 1;

          Cell1 := Sheet.Cells[BeginRow + 2 + i - Grid.FixedRows, BeginCol + 4];
          Cell1.Value := LineFeedsToXLS(Grid.Cells[13 + LLL, i]);
          Cell1.Borders.LineStyle := 1;
        end
        else
        begin
          Cell1 := Sheet.Cells[BeginRow + 2 + i - Grid.FixedRows, BeginCol];
          Cell2 := Sheet.Cells[BeginRow + 2 + i - Grid.FixedRows, BeginCol + 4];
          Range := Sheet.Range[Cell1, Cell2];
          Range.Merge;
          Range.HorizontalAlignment := 3;
          Range.VerticalAlignment := 2;
          Range.Borders.LineStyle := 1;
          Range.Value := LineFeedsToXLS(Grid.Cells[12, i]);
          if Grid.RowHeights[i] <> Grid.DefaultRowHeight then
            Range.RowHeight := Grid.RowHeights[i]
        end;
      end;

      for i := Grid.FixedCols to Grid.ColCount - 1 do
      begin
        Column := Sheet.Columns[BeginCol + i];
        Column.AutoFit;
        if Column.ColumnWidth > MaxColWdth then
          Column.ColumnWidth := MaxColWdth;
      end;

{      for i := 0 to Grid.RowCount - 1 do
      begin
        Row := Sheet.Rows[BeginRow + i];
        Row.WrapText := true;
        Row.AutoFit;
      end;   }

      if (trim(ACaption) <> '') then
      begin
        Cell1 := Sheet.Cells[1, BeginCol];
        Cell1.Font.Bold := true;
        Cell1.Font.Size := 14;
        Cell1.Value := ACaption;
      end;
      ExcelApp.DisplayAlerts := true; 
      ExcelApp.Visible := true;
    except
      ExcelApp.Quit;
      ExcelApp := Null;

    end;
end;

procedure GreedToExcel_XXX(Grid: TAdvStringGrid; ACaption : string);
var i, MaxColWdth : integer;
    ExcelApp, DataValues : Variant;
    Workbook, Column, Row, Sheet, Cell1, Cell2, Range : Variant;
    BeginCol, BeginRow, N: integer;
    inMerg : boolean;
begin
  Range := Null;
  MaxColWdth := 100;
  inMerg := false;
    if (trim(ACaption) <> '') then
      BeginRow := 3
    else
      BeginRow := 1;

    BeginCol := 1;
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.DisplayAlerts := false;
    ExcelApp.visible := true;
    try
      try Workbook := ExcelApp.WorkBooks.Add; except end;
      Sheet := ExcelApp.Workbooks[1].WorkSheets[1];

      N := Grid.ColCount - 13 + 6;
      DataValues := VarArrayCreate([0, Grid.RowCount - 1, 0, N], varVariant);

      Cell1 := Sheet.Cells[BeginRow, BeginCol];
      Cell2 := Sheet.Cells[BeginRow + Grid.RowCount - 1, BeginCol + N - 1];
      Range := Sheet.Range[Cell1, Cell2];
      Range.Value := DataValues;

      if (trim(ACaption) <> '') then
      begin
        Cell1 := Sheet.Cells[1, BeginCol];
        Cell1.Font.Bold := true;
        Cell1.Font.Size := 14;
        Cell1.Value := ACaption;
      end;
      ExcelApp.DisplayAlerts := true; 
      ExcelApp.Visible := true;
    except
      ExcelApp.Quit;
      ExcelApp := Null;

    end;
end;

procedure TBalance.aExportSmpExecute(Sender: TObject);
begin
  GreedToExcel_smp(AdvStringGrid1, CAName + ' (валюта ' + CrnName + ')');
end;

procedure TBalance.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TBalance.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TBalance.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
var S : String;
begin
  S := FormatFloat('0.##', CalcSummAdvSringGrid(AdvStringGrid1));
  if S <> Edit1.Text then
    Edit1.Text := S;
end;

procedure TBalance.CheckBox1Click(Sender: TObject);
begin
  aClpsAll.Enabled := CheckBox1.Checked;
  aExpAll.Enabled := CheckBox1.Checked;
end;

procedure TBalance.GetCrn(Val : Variant);
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


function TBalance.GetDOC: Variant;
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

procedure TBalance.SetDOC(V: Variant);
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

procedure TBalance.AddStnd;
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
    Items.AddObject('Представитель', TVal_obj.Create(5));
    Items.AddObject('Свой объект', TVal_obj.Create(6));
  end;
end;

{ THackAdvStringGrid }

function THackAdvStringGrid.NodeIndent(ARow: Integer): Integer;
begin
  inherited NodeIndent(ARow);
end;

procedure TBalance.AdvStringGrid1ContractNode(Sender: TObject; ARow,
  ARowreal: Integer);
begin
  aProp.Enabled := false;
end;

procedure TBalance.AdvStringGrid1ExpandNode(Sender: TObject; ARow,
  ARowreal: Integer);
begin
  aProp.Enabled := false;
end;

procedure TBalance.aSettingsExecute(Sender: TObject);
begin
  if ShowCardProp(AdvStringGrid1, '') then
  begin
//    SaveStng;
  end;
end;

procedure TBalance.AdvStringGrid1CanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := false;
end;

procedure TBalance.aExpAllExecute(Sender: TObject);
begin
  AdvStringGrid1.ExpandAll;
  AdvStringGrid1.AutoSizeRow(AdvStringGrid1.RowCount - 1);
end;

procedure TBalance.aClpsAllExecute(Sender: TObject);
begin
  AdvStringGrid1.ContractAll;

end;

{ TVal_obj }

constructor TVal_obj.Create(AID: Variant);
begin
  inherited Create;
  ID := AID;
end;

procedure TBalance.Button1Click(Sender: TObject);
begin

  DoExp


end;

procedure TBalance.DoExp;
  procedure MergeCellz(Sheet : Variant; ARow, ACol, ALen : integer);
  var S1, S2, S_OLD : String;
      Range, Cell1, Cell2 : Variant;
      i : integer;
  begin
    Cell1 := Sheet.Cells[ARow, ACol];
    S1 := VarToStr(Cell1.Value);
    for i := 1 to ALen do
    begin
      Cell2 := Sheet.Cells[ARow, ACol + i];
      S2 := VarToStr(Cell2.Value);
      S_OLD := S2;
      if (S1 <> '') and (S1 = S2) then
      begin
        Cell2.Value := '';
        Range := Sheet.Range[Cell1, Cell2];
        Range.Merge;
        Range.HorizontalAlignment := 3;
        Range.Borders.LineStyle := 1;
      end;
      Cell1 := Cell2;
      S1 := S_OLD;
    end;
  end;
var i, j, k, MaxColWdth : integer;
    ExcelApp, DataValues : Variant;
    Workbook, Column, Row, Sheet, Cell1, Cell2, Range, V : Variant;
    BeginCol, BeginRow, N, id_C: integer;
    inMerg : boolean;

    FFF: Double;
    AHandle : HWnd;
    SL : TStringList;
    Grid: TAdvStringGrid;
    OperDate : TOperDate;
begin
  Grid := AdvStringGrid1;
  Screen.Cursor := crSQLWait;
  Range := Null;
  MaxColWdth := 100;
  inMerg := false;
 {   if (trim(ACaption) <> '') then
      BeginRow := 3
    else          }
      BeginRow := 1;   

    BeginCol := 1;
//    ShowProgressForm(AHandle, 0, 0, 'Экспорт в Excel');
    SL := TStringList.Create;
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.DisplayAlerts := false;
  //  ExcelApp.visible := true;
    try
      try Workbook := ExcelApp.WorkBooks.Add; except end;
      Sheet := ExcelApp.Workbooks[1].WorkSheets[1];

      for i := 0 to Grid.RowCount - 1 do
      begin
         if (Grid.Objects[0, i] <> nil) and (integer(Grid.Objects[0, i]) > 1) and (Grid.Objects[0, i] is TOperDate) then
         begin
           OperDate := TOperDate(Grid.Objects[0, i]);
           id_C := OperDate.Id_CurrencyOFF;
           if SL.IndexOfObject(Pointer(id_C)) = -1 then
             SL.AddObject(VarToStr(OperDate.Name), Pointer(id_C));
         end;
      end;

      DataValues := VarArrayCreate([0, Grid.RowCount - 1, 0, SL.Count * 2 - 1], varVariant);

      for i := 0 to SL.Count - 1 do
      begin
        DataValues[0, 2*i] := SL[i];
        DataValues[0, 2*i + 1] := SL[i];
        DataValues[1, 2*i] := 'Приход';
        DataValues[1, 2*i + 1] := 'Расход';
      end;
      for i := 0 to Grid.RowCount - 1 do
      begin
         if (Grid.Objects[0, i] <> nil) and (integer(Grid.Objects[0, i]) > 1) and (Grid.Objects[0, i] is TOperDate) then
         begin
           OperDate := TOperDate(Grid.Objects[0, i]);
           id_C := OperDate.Id_CurrencyOFF;
           N := SL.IndexOfObject(Pointer(id_C));
           N := 2*(N + 1) - 1;
           if OperDate.FOperTypeIn then
             N := N - 1; 
           DataValues[i, N] := StrToFloat(FormatFloat('0.##', OperDate.CrnVal));
         end;
      end;
     { if (trim(ACaption) <> '') then
      begin
        Cell1 := Sheet.Cells[2, BeginCol];
        Cell1.Font.Bold := true;
        Cell1.Font.Size := 14;
        Cell1.Value := ACaption;
      end;    }
      Cell1 := Sheet.Cells[BeginRow, BeginCol];

      Cell2 := Sheet.Cells[BeginRow + VarArrayHighBound(DataValues, 1), BeginCol +  VarArrayHighBound(DataValues, 2)];
      Range := Sheet.Range[Cell1, Cell2];
      Range.Value := DataValues;
      Range.Borders.LineStyle := 1;
      Range.NumberFormat := '0,00';

      MergeCellz(Sheet, BeginRow, BeginCol, 50);

      ExcelApp.DisplayAlerts := true;
      ExcelApp.Visible := true;
      Screen.Cursor := crDefault;
      SL.Free;
    //  CloseProgressForm;
    except
      on E : Exception do
      begin
        SL.Free;
      //  CloseProgressForm;                                                                         
        Screen.Cursor := crDefault;
        ExcelApp.Quit;
        ExcelApp := Null;
        raise Exception.Create('Произошла ошибка при выгрузке данных в Excel' + #13 + #10 + E.Message);
      end;
    end;
end;

{ TOperDate }


{ TOperDate }

function TOperDate.GetId_CurrencyOFF: Variant;
begin
  if Id_CurrencySys = Null then
    Result := Id_CurrencyOper
  else
    Result := Id_CurrencySys;
end;

procedure TBalance.FormActivate(Sender: TObject);
begin
  tag := 0;
end;

end.
