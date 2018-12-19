unit uAccCard_Adv_v2;

interface

uses                
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, ImgList,
    foMyFunc, Menus, RXCtrls, ComCtrls, Registry, printers,
   ToolWin, ComObj,
  Buttons,
  BaseGrid, AdvGrid, asgprint, asgprev, DBGrids, RXDBCtrl, ActnList,
  RxLookup, AdvCGrid, contnrs, uASGProp, frBsnSelector, frObjList;

const RP = 'qqq';
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
    Id_Currency_Offer, Name, CrnVal : Variant;
    property  Id_CurrencyOFF : Variant read GetId_CurrencyOFF;
  end;

  THackAdvStringGrid = class(TAdvStringGrid)
    function NodeIndent(ARow: Integer): Integer;  override;
  end;
  
  TAccCard_adv_v2 = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    cdsBalanceBy: TClientDataSet;
    dsArc: TDataSource;
    ilImage2: TImageList;
    ilButtons: TImageList;
    AdvPreviewDialog1: TAdvPreviewDialog;
    AdvGridPrintSettingsDialog1: TAdvGridPrintSettingsDialog;
    SaveDialog1: TSaveDialog;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    AdvStringGrid1: TAdvColumnGrid;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ActionList1: TActionList;
    aProp: TAction;
    ToolButton6: TToolButton;
    aExport: TAction;
    aExportSmp: TAction;
    ToolButton7: TToolButton;
    RxSpeedButton1: TRxSpeedButton;
    ToolButton8: TToolButton;
    Label4: TLabel;
    Edit1: TEdit;
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
    aSettings: TAction;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    aExpAll: TAction;
    aClpsAll: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    cdsExtDataDict: TClientDataSet;
    cdsExtDataDictid_Oper_ExtDataNames: TIntegerField;
    cdsExtDataDictid_business: TIntegerField;
    cdsExtDataDictType: TIntegerField;
    cdsExtDataDictNumPrm: TIntegerField;
    cdsExtDataDictParName: TStringField;
    cdsExtDataDictVisible: TBooleanField;
    Button1: TButton;
    Button2: TButton;
    cdsBalanceByTmpID: TAutoIncField;
    cdsBalanceByTmp: TIntegerField;
    cdsBalanceByIsRes: TBooleanField;
    cdsBalanceByTotalRez: TFloatField;
    cdsBalanceByid_Oper: TIntegerField;
    cdsBalanceByOperTypeIn: TBooleanField;
    cdsBalanceByOperVid: TIntegerField;
    cdsBalanceByid_Repr: TIntegerField;
    cdsBalanceByid_ContrAgent: TIntegerField;
    cdsBalanceByDateCreate: TDateTimeField;
    cdsBalanceByCurrencyShortName: TStringField;
    cdsBalanceByOperSummSysCur: TFloatField;
    cdsBalanceByOperSum_Offer: TFloatField;
    cdsBalanceById_Currency_Offer: TIntegerField;
    cdsBalanceByOperNum: TStringField;
    cdsBalanceByisGrpOper: TBooleanField;
    cdsBalanceByid_Goods: TIntegerField;
    cdsBalanceByis_Mirr: TBooleanField;
    cdsBalanceByDocz: TStringField;
    cdsBalanceByNNN: TIntegerField;
    cdsBalanceByid_Acc: TIntegerField;
    cdsBalanceByid_Warehouse: TIntegerField;
    cdsBalanceByid_Manufact: TIntegerField;
    cdsBalanceByid_Repr_Ex: TIntegerField;
    cdsBalanceByS1: TBCDField;
    cdsBalanceByS2: TBCDField;
    cdsBalanceBySumIN: TBCDField;
    cdsBalanceBySumOUT: TBCDField;
    cdsBalanceByReprName: TStringField;
    cdsBalanceBySrcName: TStringField;
    cdsBalanceByImp_PayBasic: TStringField;
    cdsBalanceByAccInv_PayAssignment: TStringField;
    cdsBalanceByContract: TStringField;
    cdsBalanceByOpComment: TStringField;
    cdsBalanceByStr1: TStringField;
    cdsBalanceByStr2: TStringField;
    cdsBalanceByStr3: TStringField;
    cdsBalanceByStr4: TStringField;
    cdsBalanceByStr5: TStringField;
    cdsBalanceByStr6: TStringField;
    cdsBalanceByStr7: TStringField;
    cdsBalanceByStr8: TStringField;
    cdsBalanceByStr9: TStringField;
    cdsBalanceByStr10: TStringField;
    cdsBalanceByStr11: TStringField;
    cdsBalanceByStr12: TStringField;
    cdsBalanceByStr13: TStringField;
    cdsBalanceByStr14: TStringField;
    cdsBalanceByStr15: TStringField;
    cdsBalanceByGrpOper: TIntegerField;
    cdsBalanceByOperSum_OfferABS: TFloatField;
    cdsBalanceByDig1: TFloatField;
    cdsBalanceByDig2: TFloatField;
    cdsBalanceByDig3: TFloatField;
    cdsBalanceByDig4: TFloatField;
    cdsBalanceByDig5: TFloatField;
    cdsBalanceByDig6: TFloatField;
    cdsBalanceByDig7: TFloatField;
    cdsBalanceByDig8: TFloatField;
    cdsBalanceByDig9: TFloatField;
    cdsBalanceByDig10: TFloatField;
    cdsBalanceByDig11: TFloatField;
    cdsBalanceByDig12: TFloatField;
    cdsBalanceByDig13: TFloatField;
    cdsBalanceByDig14: TFloatField;
    cdsBalanceByDig15: TFloatField;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    Panel5: TPanel;
    Panel6: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    dtTo: TDateTimePicker;
    dtFrom: TDateTimePicker;
    BitBtn3: TBitBtn;
    fObjList1: TfObjList;
    lcCur: TRxDBLookupCombo;
    Label5: TLabel;
    Splitter1: TSplitter;
    procedure dsArcDataChange(Sender: TObject; Field: TField);
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
    procedure Button2Click(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
  private
    Val : Variant;
    ASelectedObj : TSelectedObj;
    FParamBlnc: TParamBlnc;
    CAName : String;
    CrnName : String;
    AGridDate : TGridDate;

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
  AccCard_adv_v2: TAccCard_adv_v2;

procedure ShowAccCard_adv_v2(AParamBlnc : TParamBlnc);

implementation

uses uDM, PrvFrm_2, unEhMyFunc, uCASelector, uFormApi_Oper,
  foMyFuncAdvStrGrigExcel, uUnivSelector;

{$R *.DFM}


procedure ShowAccCard_adv_v2(AParamBlnc : TParamBlnc);
var F : TAccCard_adv_v2;
begin
  DM.Rights_GetUserRights(2001, Null);
  F := TAccCard_adv_v2.Create(nil);
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


destructor TAccCard_adv_v2.Destroy;
var FullRegPathName : String;
    Reg : TRegistry;
    i : integer;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, true) then
    begin
      Reg.writeInteger('fObjList1Height', fObjList1.Height);
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;

  AGridDate.Free;
  SaveValToRegistry(GetDOC, SRegPath + '\' + ClassName, 'DOC');

  SaveValToRegistry(ASelectedObj.ID, SRegPath + '\' + Name, 'IDBsn2');
  inherited;
end;

constructor TAccCard_adv_v2.Create(AOwner: TCOmponent);
var FullRegPathName : String;
    Year, Month, Day: Word;
    DDD : TDate;
    Reg : TRegistry;
    i : integer;
    V : Variant;
begin
  inherited;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, false) then
    begin
      if Reg.ValueExists('fObjList1Height') then
        fObjList1.Height := Reg.ReadInteger('fObjList1Height');
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;

  AGridDate := TGridDate.Create;
  AGridDate.FGrid := AdvStringGrid1;

  AddStnd;
//  QuickSortSLWP(cbDoc.Items, false);
  LoadValFromRegistry(V, SRegPath + '\' + ClassName, 'DOC');
  SetDOC(V);

  AdvStringGrid1.ColCount := 1;
  LoadValFromRegistry(Val, SRegPath + '\' + Name,  'Grp');

//  LoadValFromRegistry(Val, SRegPath + '\' + Name, 'IDBsn2');

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
 // LoadGridSettingsFromRegistryTMS(AdvStringGrid1, SRegPath + '\' + Self.ClassName);
end;

procedure TAccCard_adv_v2.Initialize(AParamBlnc: TParamBlnc);
var ObjName, ObjID, BsnName, id_business: OleVariant;
   id_AccList, id_AccGroupList : Variant;
begin
//  fBsnSelector1.ID := AParamBlnc.id_business;

//  fObjList1.Initialize([eotFin, eotFinGroup], fBsnSelector1.ID, 40, true);
 // fObjList1.AddParamBlnc(AParamBlnc);
 // if fObjList1.ObjCount = 0 then
 //   fObjList1.LoadFromReg;


  Screen.Cursor := crSQLWait;
  Enabled := false;
  try


    with cdsBalanceBy do
    begin
      Close;
      id_AccList := fObjList1.GetIDList(eotFin);
      id_AccGroupList := fObjList1.GetIDList(eotFinGroup);

      Params.ParamByName('@DateFrom').Value := FParamBlnc.DateFrom;
      Params.ParamByName('@DateTo').Value := FParamBlnc.DateTo;
      Params.ParamByName('@id_AccList').Value := id_AccList;
      Params.ParamByName('@id_AccGroupList').Value := id_AccGroupList;
      Params.ParamByName('@id_business').Value := fBsnSelector1.ID;

      Params.ParamByName('@id_User').Value := DM.IDUser;
      Params.ParamByName('@id_Currency').Value := lcCur.KeyValue;
      
      Params.ParamByName('@Repr').Value := AGridDate.IsParPresent('ReprName');
      Params.ParamByName('@Src').Value := AGridDate.IsParPresent('SrcName');
      Params.ParamByName('@Imp_PayBasic').Value := AGridDate.IsParPresent('Imp_PayBasic');
      Params.ParamByName('@AccInv_PayAssignment').Value := AGridDate.IsParPresent('AccInv_PayAssignment');
      Params.ParamByName('@Contract').Value := AGridDate.IsParPresent('Contract');
      Params.ParamByName('@OpComment').Value := AGridDate.IsParPresent('OpComment');
      Params.ParamByName('@CalcRez').Value := AGridDate.IsParPresent('TotalRez');

      //if (FParamBlnc.id_Acc <> Null) then
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

procedure TAccCard_adv_v2.dsArcDataChange(Sender: TObject; Field: TField);
begin
//  StatusBar1.Panels[0].Text := 'Всего записей: ' + IntToStr(dsArc.DataSet.RecordCount);
end;

procedure TAccCard_adv_v2.GetAGPrinterInfo;
begin
  printer.Orientation := poLandscape;

  AdvStringGrid1.PrintSettings.Date := ppTopLeft;
  AdvStringGrid1.PrintSettings.DateFormat := 'dd-mm-yyyy hh:nn';

  AdvStringGrid1.PrintSettings.TitleText := '' + CAName + ' (валюта ' + CrnName + ')';

  AdvStringGrid1.PrintSettings.Title := ppTopCenter;

  AdvStringGrid1.PrintSettings.HeaderFont.Size := 12;
  AdvStringGrid1.PrintSettings.HeaderFont.Style := [fsBold];
end;


procedure TAccCard_adv_v2.ToolButton2Click(Sender: TObject);
begin
  GetAGPrinterInfo;
  printer.Orientation := poLandscape;
  
  AdvPreviewDialog1.Execute;
end;

procedure TAccCard_adv_v2.ToolButton1Click(Sender: TObject);
begin
  AdvGridPrintSettingsDialog1.Execute
end;

procedure TAccCard_adv_v2.CalcRowHeights(y : integer);
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


procedure TAccCard_adv_v2.CellVal(x, y : integer; Val : String; Obj : TObject);
var R : TRect;
    Y2, X2 : integer;
begin
  if y >= AdvStringGrid1.RowCount then
    AdvStringGrid1.RowCount := y + 1; 
  AdvStringGrid1.Objects[x, y] := Obj;
  AdvStringGrid1.Cells[x, y] := Val;
end;

procedure TAccCard_adv_v2.LoadCDS(CDS: TClientDataSet);
var i, ImgIndex, j, X : integer;
    FFF : TOperDate;
    S : String;
    ACur_obj : TCur_obj;
    AColObj : TColObj;
    AField : TField;
    b, BBB : boolean;
    RR : Pointer;
  procedure InsRez;
  var j : integer;
  begin
    inc(i);
    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, AGridDate.TTT, 1);
    CellVal(AdvStringGrid1.FixedCols + 1, i, 'Оборот',
                          Pointer(4));
    for j := 0 to AGridDate.Cur_objCount - 1 do
    begin
      ACur_obj := AGridDate.Cur_obj[j];
      X := AGridDate.GetCurCol(ACur_obj.ID, true);
      if ABS(ACur_obj.SumIn) >= 0.005 then
        CellVal(AdvStringGrid1.FixedCols + X, i, FormatFloat('### ### ### ##0.00', ACur_obj.SumIn), Pointer(4));
      if ABS(ACur_obj.SumOut) >= 0.005 then
        CellVal(AdvStringGrid1.FixedCols + X + 1, i, FormatFloat('### ### ### ##0.00', ACur_obj.SumOut), Pointer(4));

      CellVal(AdvStringGrid1.FixedCols + X, i + 1, FormatFloat('### ### ### ##0.00', ACur_obj.Sum2), Pointer(4));
    end;

    inc(i);
    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, AGridDate.TTT, 1);
    CellVal(AdvStringGrid1.FixedCols + 1, i, 'Исходящее состояние повалютно', Pointer(4));

    inc(i);
    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, AdvStringGrid1.ColCount-1, 1);
    CellVal(AdvStringGrid1.FixedCols + 1, i, 'Исходящий остаток на ' +
                          FormatDateTime('dd.mm.yyyy', dtTo.DateTime) + '    ' +
                          FormatFloat('### ### ### ##0.00', AGridDate.FMainS2) + ' ' + AGridDate.FMainCurName,
                          Pointer(1));

  end;
begin
  BBB := false;
  if CDS = nil then
    CDS := cdsBalanceBy; 
  AdvStringGrid1.DefaultRowHeight := 21;
  AdvStringGrid1.FixedCols := 0;
  AdvStringGrid1.FixedColWidth := 8;
  AGridDate.DelCur;
  try
    with CDS do
    begin
      if not Active then Exit;

      First;
      while not Eof do
      begin
        if cdsBalanceByNNN.AsInteger= -200 then
        begin
          AGridDate.FMainS1 := cdsBalanceByS1.AsCurrency;
          AGridDate.FMainS2 := cdsBalanceByS2.AsCurrency;
          AGridDate.FMainCurName := cdsBalanceByCurrencyShortName.AsString;
        end;
        
        if cdsBalanceByNNN.AsInteger = -100 then
        begin
          AGridDate.AddCur(cdsBalanceById_Currency_Offer.AsInteger,
                 cdsBalanceByCurrencyShortName.AsString,
                 cdsBalanceByS1.AsCurrency,
                 cdsBalanceByS2.AsCurrency,
                 cdsBalanceBySumIN.AsCurrency,
                 cdsBalanceBySumOUT.AsCurrency);
        end;
        if cdsBalanceByNNN.AsInteger >= 0 then
          Break;
        Next;
      end;

      AdvStringGrid1.RemoveAllNodes;
      AdvStringGrid1.Clear;
      if (Active) and (not IsEmpty) then
        AdvStringGrid1.RowCount := {RecordCount} 1 + 3
      else
        AdvStringGrid1.RowCount := 3;
      AdvStringGrid1.FixedRows := 3;


      //***********************************
      AGridDate.DelColData;
      b := AGridDate.LoadGridSettingsFromRegistry(SRegPath + '\' + Self.ClassName + RP + VarToStr(cdsExtDataDict.Params.ParamByName('@id_business').Value));
      AdvStringGrid1.ColCount := AdvStringGrid1.FixedCols + AGridDate.ColCount + 4;

      AGridDate.TTT := 3;
      x := 0;
      for j := 0 to AGridDate.VisibleColObjCount - 1 do
      begin
        AColObj := AGridDate.VisibleColObj[j];
        if AColObj.Visible then
        begin
          inc(x);
          AColObj.Field := CDS.FindField(AColObj.FieldName);
          AColObj.FGridColumnItem := AdvStringGrid1.Columns.Items[AdvStringGrid1.FixedCols + AGridDate.TTT + 2*AGridDate.FCurList.Count + X + 0];
        end;
        b := AGridDate.LoadGridSettingsFromRegistry(SRegPath + '\' + Self.ClassName + RP + VarToStr(cdsExtDataDict.Params.ParamByName('@id_business').Value));
      end;
      //***********************************

      i := 0;
      AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 0, i, 1, 3);
  {    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, AdvStringGrid1.ColCount-1, 1);
      CellVal(AdvStringGrid1.FixedCols + 1, i, 'Взаиморасчеты с контрагентом ' +
                            edObjName.Text + ' за период ' +
                            FormatDateTime('dd.mm.yyyy', dtFrom.DateTime) + '-' +
                            FormatDateTime('dd.mm.yyyy', dtTo.DateTime),
                            Pointer(4));

      inc(i);  }
      AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, 1, 3);
      CellVal(AdvStringGrid1.FixedCols + 1, i, 'Тип', Pointer(4));

      AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 2, i, 1, 3);
      CellVal(AdvStringGrid1.FixedCols + 2, i, 'Дата', Pointer(4));

      AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 3, i, 1, 3);
      CellVal(AdvStringGrid1.FixedCols + 3, i, 'Номер', Pointer(4));

   //   inc(i);
      AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + AGridDate.TTT + 1, i,
                                2 * AGridDate.Cur_objCount, 1);
      CellVal(AdvStringGrid1.FixedCols + AGridDate.TTT + 1, i, 'Движение денежных средств', Pointer(4));
      
      inc(i);
      
      for j := 0 to AGridDate.Cur_objCount - 1 do
      begin
        ACur_obj := AGridDate.Cur_obj[j];
        X := AGridDate.GetCurCol(ACur_obj.ID, true);
        AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + X, i, 2, 1);
        CellVal(AdvStringGrid1.FixedCols + X, i, ACur_obj.CurName, Pointer(4));

        CellVal(AdvStringGrid1.FixedCols + X, i + 1, 'Приход', Pointer(4));
        CellVal(AdvStringGrid1.FixedCols + X + 1, i + 1, 'Расход', Pointer(4));

        CellVal(AdvStringGrid1.FixedCols + X, i + 3, FormatFloat('### ### ### ##0.00', ACur_obj.Sum1), Pointer(4));
      end;
      
      AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i + 3, AGridDate.TTT, 1);
      CellVal(AdvStringGrid1.FixedCols + 1, i + 3, 'Входящее состояние повалютно', Pointer(4));

      dec(i);
      for j := 0 to AGridDate.VisibleColObjCount - 1 do
      begin
        AColObj := AGridDate.VisibleColObj[j];
        if AColObj.Visible then
        begin
          AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + AGridDate.TTT + 2*AGridDate.FCurList.Count + j + 1, i, 1, 3);
          CellVal(AdvStringGrid1.FixedCols + AGridDate.TTT + 2*AGridDate.FCurList.Count + j + 1, i, AColObj.ColName, Pointer(4));
        end;
      end;
      i := AdvStringGrid1.FixedRows + 0;

      AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, AdvStringGrid1.ColCount-1, 1);
      CellVal(AdvStringGrid1.FixedCols + 1, i, 'Входящий остаток на ' +
                            FormatDateTime('dd.mm.yyyy', dtFrom.DateTime) + '    ' +
                            FormatFloat('### ### ### ##0.00', AGridDate.FMainS1) + ' ' + AGridDate.FMainCurName,
                            Pointer(1));
                
      inc(i);
      First;
      while not Eof do
      begin
        if cdsBalanceByNNN.AsInteger >= 0 then
        begin
          inc(i);
          FFF := TOperDate.Create(Self);
          FFF.FId_Oper := FieldByName('id_Oper').AsInteger;
          FFF.FOperVid := FieldByName('OperVid').AsInteger;
          FFF.Fis_Mirr := FieldByName('is_Mirr').AsBoolean;
          FFF.FOperTypeIn := FieldByName('OperTypeIn').AsBoolean;

        
          FFF.Id_Currency_Offer := FieldByName('Id_Currency_Offer').AsVariant;

          CellVal(0, i, '', FFF);

          case FFF.FOperVid of
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
          CellVal(AdvStringGrid1.FixedCols + 2, i, FormatDateTime('dd.mm.yyyy', FieldByName('DateCreate').AsDateTime));
          CellVal(AdvStringGrid1.FixedCols + 3, i, FieldByName('OperNum').AsString);

          if not cdsBalanceById_Currency_Offer.IsNull then
          begin
            X := AGridDate.GetCurCol(cdsBalanceById_Currency_Offer.AsInteger, cdsBalanceByOperTypeIn.AsBoolean);
            CellVal(AdvStringGrid1.FixedCols + X, i, FormatFloat('### ### ### ##0.00', ABS(cdsBalanceByOperSum_Offer.AsFloat)));
          end;

          for j := 0 to AGridDate.VisibleColObjCount - 1 do
          begin
            AColObj := AGridDate.VisibleColObj[j];
            if (AColObj.Visible) and (AColObj.Field <> nil) and (AColObj.FGridColumnItem <> nil) then
            begin
              if AColObj.Field is TNumericField then
              begin
                if AColObj.Field = cdsBalanceByTotalRez then
                  RR := Pointer(5)
                else
                  RR := nil;
                if not AColObj.Field.IsNull then
                  CellVal(AColObj.FGridColumnItem.Index, i, FormatFloat('### ### ### ##0.00', AColObj.Field.AsFloat), RR)
              end
              else
                CellVal(AColObj.FGridColumnItem.Index, i, AColObj.Field.DisplayText);
            end;
          end;

        end;
        Next;

        if not BBB and (FieldByName('OperVid').AsInteger = -1) then
        begin
          BBB := true;
          InsRez;
        end;
      end;  

    end;
    if not BBB then
    begin
      BBB := true;
      InsRez;
    end;

    if not b then
    begin
      AdvStringGrid1.AutoSizeColumns(false, 10);
      AdvStringGrid1.AutoSizeRows(false, 0);
    end
    else
    begin
      for j := 0 to AGridDate.FCurList.Count - 1 do
      begin
        AdvStringGrid1.AutoSizeCol(AdvStringGrid1.FixedCols + AGridDate.TTT + (j + 1) * 2 - 1);
        AdvStringGrid1.AutoSizeCol(AdvStringGrid1.FixedCols + AGridDate.TTT + (j + 1) * 2);
      end;
    end;
    
  {  if CheckBox1.Checked then
    begin
      i := AdvStringGrid1.FixedRows;
      j := i;
      with AdvStringGrid1 do
      begin
        while (i < AdvStringGrid1.rowcount - 1) do
        begin
          while (cells[3, j] <> '') and (cells[3, j] = AdvStringGrid1.cells[3, j + 1]) and (j < rowcount - 1) do
            inc(j);
          if (i <> j) then
            AddNode(i, j - i + 1);
          i:= j + 1;
          j:= i;
        end;
      end;
    end;  }

    // Курсовые изменения
    i := AdvStringGrid1.FixedRows;
    j := i;
    with AdvStringGrid1 do
    begin
      while (i < AdvStringGrid1.rowcount - 1) do
      begin
        while  (AdvStringGrid1.Objects[0, j] is TOperDate) and (AdvStringGrid1.Objects[0, j + 1] is TOperDate) and
               (TOperDate(AdvStringGrid1.Objects[0, j]).FOperVid = -1) and
               (j < rowcount - 1) do
          inc(j);
        if (i <> j) then
          AddNode(i, j - i + 1);
        i:= j + 1;
        j:= i;
      end;
      ContractAll;
    end;     
  finally
  //  CDS.Close;
  end;
end;

procedure TAccCard_adv_v2.AutoSizeColumns(const DoFixedCols: Boolean; const Padding: Integer);
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

procedure TAccCard_adv_v2.AdvStringGrid1GetCellColor(Sender: TObject; ARow,
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
      ABrush.Color := $00EEEEEE;
  end;  
end;

procedure TAccCard_adv_v2.AdvStringGrid1GetAlignment(Sender: TObject; ARow,
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

procedure TAccCard_adv_v2.ToolButton3Click(Sender: TObject);
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

procedure TAccCard_adv_v2.BitBtn2Click(Sender: TObject);
var AID, i : integer;
    Fis_Mirr : boolean;
begin
  if fObjList1.ObjCount = 0 then
  begin
    Windows.SetFocus(fObjList1.RxDBGrid1.Handle);
    MessageBox(Handle, 'Не выбран ни один счет', 'Выберите счет', MB_ICONQUESTION + mb_OK);
    Exit;
  end;

  AGridDate.SaveGridSettingsToRegistry(SRegPath + '\' + Self.ClassName + RP + VarToStr(cdsExtDataDict.Params.ParamByName('@id_business').Value));
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

procedure TAccCard_adv_v2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  AGridDate.SaveGridSettingsToRegistry(SRegPath + '\' + Self.ClassName + RP + VarToStr(cdsExtDataDict.Params.ParamByName('@id_business').Value));
end;

procedure TAccCard_adv_v2.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TAccCard_adv_v2.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TAccCard_adv_v2.aPropExecute(Sender: TObject);
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

procedure TAccCard_adv_v2.cdsBalanceByAfterOpen(DataSet: TDataSet);
begin
  aProp.Enabled := not cdsBalanceBy.IsEmpty;
end;

procedure TAccCard_adv_v2.AdvStringGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := AdvStringGrid1.ScreenToClient(P);
  if P.x <= AdvStringGrid1.ColWidths[0] then
    Exit;

  if (AdvStringGrid1.Row >= AdvStringGrid1.FixedRows) and (AdvStringGrid1.Col >= 1) {AdvStringGrid1.FixedRows}  then
    aProp.Execute;
end;

procedure TAccCard_adv_v2.AdvStringGrid1ClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  with AdvStringGrid1 do
    aProp.Enabled :=
     not((Objects[0, Row] = nil) or (integer(Objects[0, Row]) <= 1))
end;

procedure TAccCard_adv_v2.aExportExecute(Sender: TObject);
begin
  AdvStringGridToExcel(AdvStringGrid1, Caption + ' ' +
                            FormatDateTime('dd.mm.yyyy', dtFrom.DateTime) + '-' +
                            FormatDateTime('dd.mm.yyyy', dtTo.DateTime));
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

procedure TAccCard_adv_v2.aExportSmpExecute(Sender: TObject);
begin
  GreedToExcel_smp(AdvStringGrid1, CAName + ' (валюта ' + CrnName + ')');
end;

procedure TAccCard_adv_v2.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TAccCard_adv_v2.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TAccCard_adv_v2.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
var S : String;
begin
  S := FormatFloat('0.##', CalcSummAdvSringGrid(AdvStringGrid1));
  if S <> Edit1.Text then
    Edit1.Text := S;
end;

procedure TAccCard_adv_v2.GetCrn(Val : Variant);
var V : Variant;
    S : String;
begin
//  V := GetDOC;
  if (Val <> null) and (cdsCur.Params.ParamByName('@id_Bsn').Value <> Val) then
  begin
    AGridDate.Clear;
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
        if (cdsExtDataDictVisible.AsBoolean) {and (cdsExtDataDictType.AsInteger = 2) } then
        begin
          case cdsExtDataDictType.AsInteger of
            1 : S := 'Dig';
            2 : S := 'Str';
            3 : S := 'Date';
          end;
          AGridDate.AddCol(-1, cdsExtDataDictParName.AsString, S + cdsExtDataDictNumPrm.AsString, true);
        end;
        Next;
      end;
    end;
 //   QuickSortSLWP(cbDoc.Items, false);
//    SetDOC(V);
  end;
end;


function TAccCard_adv_v2.GetDOC: Variant;
begin
end;

procedure TAccCard_adv_v2.SetDOC(V: Variant);
begin

end;

procedure TAccCard_adv_v2.AddStnd;
var SL : TStringList;
begin
  AGridDate.AddCol(-1, 'Комментарий', 'OpComment', true);
  AGridDate.AddCol(-1, 'Представитель', 'ReprName', true);
  AGridDate.AddCol(-1, 'Баланс', 'TotalRez', true);

  AGridDate.AddCol(-1, 'Осн. платежа/накладная', 'Imp_PayBasic', true);
  AGridDate.AddCol(-1, 'Пл. поручение/Счет фактура', 'AccInv_PayAssignment', true);
  AGridDate.AddCol(-1, 'Договор', 'Contract', true);
  AGridDate.AddCol(-1, 'Свой объект', 'SrcName', true);
end;

{ THackAdvStringGrid }

function THackAdvStringGrid.NodeIndent(ARow: Integer): Integer;
begin
  inherited NodeIndent(ARow);
end;

procedure TAccCard_adv_v2.AdvStringGrid1ContractNode(Sender: TObject; ARow,
  ARowreal: Integer);
begin
  aProp.Enabled := false;
end;

procedure TAccCard_adv_v2.AdvStringGrid1ExpandNode(Sender: TObject; ARow,
  ARowreal: Integer);
begin
  aProp.Enabled := false;
end;

procedure TAccCard_adv_v2.aSettingsExecute(Sender: TObject);
begin
  if ShowASGProp(AGridDate, '') then
  begin
    AGridDate.SaveGridSettingsToRegistry(SRegPath + '\' + Self.ClassName + RP + VarToStr(cdsExtDataDict.Params.ParamByName('@id_business').Value));
    LoadCDS(nil);
  end;
end;

procedure TAccCard_adv_v2.AdvStringGrid1CanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := false;
end;

procedure TAccCard_adv_v2.aExpAllExecute(Sender: TObject);
begin
  AdvStringGrid1.ExpandAll;
  AdvStringGrid1.AutoSizeRow(AdvStringGrid1.RowCount - 1);
end;

procedure TAccCard_adv_v2.aClpsAllExecute(Sender: TObject);
begin
  AdvStringGrid1.ContractAll;

end;

{ TVal_obj }

constructor TVal_obj.Create(AID: Variant);
begin
  inherited Create;
  ID := AID;
end;

procedure TAccCard_adv_v2.Button1Click(Sender: TObject);
begin
  AGridDate.SaveGridSettingsToRegistry(SRegPath + '\' + Self.ClassName + RP + VarToStr(cdsExtDataDict.Params.ParamByName('@id_business').Value));
end;

procedure TAccCard_adv_v2.DoExp;
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

function TOperDate.GetId_CurrencyOFF: Variant;
begin
  Result := Id_Currency_Offer;
end;

procedure TAccCard_adv_v2.Button2Click(Sender: TObject);
begin
  AGridDate.LoadGridSettingsFromRegistry(SRegPath + '\' + Self.ClassName + RP + VarToStr(cdsExtDataDict.Params.ParamByName('@id_business').Value));

end;

procedure TAccCard_adv_v2.fBsnSelector1Button1Click(Sender: TObject);
var OldID : Variant;
begin
  OldID := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if OldID <> fBsnSelector1.ID then
  begin
    AdvStringGrid1.Clear;
    LoadCDS(cdsBalanceBy);
    fObjList1.Initialize([eotFin, eotFinGroup], fBsnSelector1.ID, 40, true);
    fObjList1.LoadFromReg;
  //  Initialize;
  end;
end;

end.
