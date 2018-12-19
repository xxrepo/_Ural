unit uAccCard_Adv;

interface

uses                
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, ImgList,
    foMyFunc, Menus, RXCtrls, ComCtrls, Registry, printers,
   ToolWin,
  Buttons,
  BaseGrid, AdvGrid, asgprint, asgprev, DBGrids, RXDBCtrl, ActnList,
  frBsnSelector, frObjList;

type
  TOperDate = class(TComponent)
  public
    FId_Oper : integer;  
    FOperVid : integer;
    FIs_Mirr : boolean;
  end;
  
  TAccCard_Adv = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    dsArc: TDataSource;
    ilImage: TImageList;
    ilButtons: TImageList;
    Panel4: TPanel;
    AdvPreviewDialog1: TAdvPreviewDialog;
    AdvGridPrintSettingsDialog1: TAdvGridPrintSettingsDialog;
    SaveDialog1: TSaveDialog;
    ActionList1: TActionList;
    aProp: TAction;
    aExport: TAction;
    fBsnSelector1: TfBsnSelector;
    pnDate: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    dtTo: TDateTimePicker;
    dtFrom: TDateTimePicker;
    BitBtn2: TBitBtn;
    cdsACard_Adv: TClientDataSet;
    cdsACard_AdvOperNum: TStringField;
    cdsACard_AdvisRes: TBooleanField;
    cdsACard_AdvTmp: TIntegerField;
    cdsACard_Advid_Oper: TIntegerField;
    cdsACard_AdvOperTypeIn: TBooleanField;
    cdsACard_AdvOperVid: TIntegerField;
    cdsACard_AdvDateCreate: TDateTimeField;
    cdsACard_AdvOperSummABS_D: TFloatField;
    cdsACard_AdvCurrencyOperShortName_D: TStringField;
    cdsACard_AdvSummSysCurABS_D: TFloatField;
    cdsACard_AdvTotalRez: TFloatField;
    cdsACard_AdvDayRez: TFloatField;
    cdsACard_AdvOperSummABS_K: TFloatField;
    cdsACard_AdvCurrencyOperShortName_K: TStringField;
    cdsACard_AdvCAName: TStringField;
    cdsACard_AdvNAMEMain: TStringField;
    cdsACard_AdvSummSysCurABS_K: TFloatField;
    cdsACard_AdvExtInfo: TStringField;
    Label4: TLabel;
    Edit1: TEdit;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton6: TToolButton;
    AdvStringGrid1: TAdvStringGrid;
    Splitter1: TSplitter;
    fObjList1: TfObjList;
    pmGrExc: TPopupMenu;
    N11: TMenuItem;
    cdsACard_Advis_Mirr: TBooleanField;
    procedure miOfferClick(Sender: TObject);
    procedure dsArcDataChange(Sender: TObject; Field: TField);
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
    procedure cdsACard_AdvAfterOpen(DataSet: TDataSet);
    procedure AdvStringGrid1DblClick(Sender: TObject);
    procedure AdvStringGrid1ClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure aExportExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AdvStringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AdvStringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure AdvStringGrid1GetDisplText(Sender: TObject; ACol,
      ARow: Integer; var Value: String);
    procedure N11Click(Sender: TObject);
  private
    Val : Variant;
    ASelectedObj : TSelectedObj;
    CAName : String;
    CrnName : String;

    procedure LoadCDS(CDS: TClientDataSet);
    procedure CellVal(x, y: integer; Val: String; Obj : TObject = nil);
    procedure CalcRowHeights(y: integer);
    procedure GetAGPrinterInfo;
    procedure InternalInitialize;
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Initialize(AParamBlnc: TParamBlnc);
  end;

var
  AccCard_Adv: TAccCard_Adv;

procedure ShowAccCard_Adv(AParamBlnc : TParamBlnc);

implementation

uses uDM, PrvFrm_2, unEhMyFunc, uCASelector, uFormApi_Oper, 
  foMyFuncAdvStrGrigExcel;

{$R *.DFM}


procedure ShowAccCard_Adv(AParamBlnc : TParamBlnc);
var F : TAccCard_Adv;
begin
  DM.Rights_GetUserRights(2001, Null);
  F := TAccCard_Adv.Create(nil);
  try
    F.Show;
    F.Repaint;
    F.Initialize(AParamBlnc);
  except
    F.Free;
  end;
end;
{ TBalance }


destructor TAccCard_Adv.Destroy;
var
    Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
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
  fObjList1.SaveToReg;
  SaveValToRegistry(fBsnSelector1.ID, SRegPath + '\' + Name, 'id_Bsn');
  inherited;
end;

constructor TAccCard_Adv.Create(AOwner: TCOmponent);
var 
    Year, Month, Day: Word;
    DDD : TDate;
    Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
begin
  inherited;
  LoadCDS(cdsACard_Adv);
  LoadValFromRegistry(Val, SRegPath + '\' + Name, 'id_Bsn');
  if (DM.FBsnList.Count = 1) then
    fBsnSelector1.ID := Val;

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
  
//  lbCrn.Caption := '';
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
end;

procedure TAccCard_Adv.InternalInitialize;
var id_AccList, id_AccGroupList : Variant;
begin
  Screen.Cursor := crSQLWait;
  Enabled := false;
  try

    with cdsACard_Adv do
    begin
      Close;
      id_AccList := fObjList1.GetIDList(eotFin);
      id_AccGroupList := fObjList1.GetIDList(eotFinGroup);
      
      Params.ParamByName('@DateFrom').AsDateTime := GetDateAdv(dtFrom.Date, false);
      Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(dtTo.Date, true);

      Params.ParamByName('@id_AccList').Value := id_AccList;
      Params.ParamByName('@id_AccGroupList').Value := id_AccGroupList;
      Params.ParamByName('@id_business').Value := fBsnSelector1.ID;

      if (id_AccList <> Null) or (id_AccGroupList <> Null) then
      begin
        Open;
      end;
    end;
    LoadCDS(cdsACard_Adv);
  finally
    Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TAccCard_Adv.miOfferClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
end;

procedure TAccCard_Adv.dsArcDataChange(Sender: TObject; Field: TField);
begin
//  StatusBar1.Panels[0].Text := 'Всего записей: ' + IntToStr(dsArc.DataSet.RecordCount);
end;

procedure TAccCard_Adv.GetAGPrinterInfo;
begin
  printer.Orientation := poLandscape;

  AdvStringGrid1.PrintSettings.Date := ppTopLeft;
  AdvStringGrid1.PrintSettings.DateFormat := 'dd-mm-yyyy hh:nn';

  AdvStringGrid1.PrintSettings.TitleText := '' + CAName + ' (валюта ' + CrnName + ')';

  AdvStringGrid1.PrintSettings.Title := ppTopCenter;

  AdvStringGrid1.PrintSettings.HeaderFont.Size := 12;
  AdvStringGrid1.PrintSettings.HeaderFont.Style := [fsBold];
end;


procedure TAccCard_Adv.ToolButton2Click(Sender: TObject);
begin
  GetAGPrinterInfo;
  printer.Orientation := poLandscape;
  
  AdvPreviewDialog1.Execute;
end;

procedure TAccCard_Adv.ToolButton1Click(Sender: TObject);
begin
  AdvGridPrintSettingsDialog1.Execute
end;

procedure TAccCard_Adv.CalcRowHeights(y : integer);
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


procedure TAccCard_Adv.CellVal(x, y : integer; Val : String; Obj : TObject);
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

procedure TAccCard_Adv.LoadCDS(CDS: TClientDataSet);
var i : integer;
    FFF : TOperDate;
    S : String;
begin
  AdvStringGrid1.DefaultRowHeight := 21;
  AdvStringGrid1.FixedCols := 1;
  AdvStringGrid1.FixedColWidth := 8;
  with CDS do
  begin
    AdvStringGrid1.Clear;
    if (Active) and (not IsEmpty) then
      AdvStringGrid1.RowCount := RecordCount + 2
    else
      AdvStringGrid1.RowCount := 4;
    AdvStringGrid1.FixedRows := 2;

    AdvStringGrid1.ColCount := AdvStringGrid1.FixedCols + 8;
    i := 0;
    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 0, i, 1, 2);
    CellVal(AdvStringGrid1.FixedCols + 0, i, 'Номер', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, 1, 2);
    CellVal(AdvStringGrid1.FixedCols + 1, i, 'Счет', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 2, i, 1, 2);
    CellVal(AdvStringGrid1.FixedCols + 2, i, 'В учетной валюте', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 3, i, 2, 1);
    CellVal(AdvStringGrid1.FixedCols + 3, i, 'Расход', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 5, i, 1, 2);
    CellVal(AdvStringGrid1.FixedCols + 5, i, 'Итого', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 6, i, 2, 1);
    CellVal(AdvStringGrid1.FixedCols + 6, i, 'Приход', Pointer(4));

    inc(i);
    CellVal(AdvStringGrid1.FixedCols + 3, i, 'Сумма', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 4, i, 'Валюта', Pointer(4));

    CellVal(AdvStringGrid1.FixedCols + 6, i, 'Сумма', Pointer(4));
    CellVal(AdvStringGrid1.FixedCols + 7, i, 'Валюта', Pointer(4));

    if not CDS.Active then
      Exit;
    First;
    CAName := cdsACard_AdvCAName.AsString;
    CrnName := cdsACard_AdvNAMEMain.AsString;

//    lbCrn.Caption := 'Валюта: ' + CrnName;
    while not Eof do
    begin
      inc(i);
      if FieldByName('isRes').AsBoolean then
      begin
        AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 0, i, AdvStringGrid1.ColCount - 1, 1);
        CellVal(AdvStringGrid1.FixedCols + 0, i, FieldByName('ExtInfo').AsString, Pointer(1));
      end
      else
      begin
        FFF := TOperDate.Create(Self);
        FFF.FId_Oper := FieldByName('id_Oper').AsInteger;
        FFF.FOperVid := FieldByName('OperVid').AsInteger;
        FFF.FIs_Mirr := FieldByName('Is_Mirr').AsBoolean;

        CellVal(0, i, '', FFF);

        CellVal(AdvStringGrid1.FixedCols + 0, i, FieldByName('OperNum').AsString);
        CellVal(AdvStringGrid1.FixedCols + 1, i, FieldByName('CAName').AsString);

        if FieldByName('SummSysCurABS_K').AsString <> '' then
          S := FieldByName('SummSysCurABS_K').DisplayText
        else
          S := FieldByName('SummSysCurABS_D').DisplayText;
        CellVal(AdvStringGrid1.FixedCols + 2, i, S);

        CellVal(AdvStringGrid1.FixedCols + 3, i, FieldByName('OperSummABS_D').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 4, i, FieldByName('CurrencyOperShortName_D').DisplayText);

        CellVal(AdvStringGrid1.FixedCols + 5, i, FieldByName('TotalRez').DisplayText, Pointer(5));

        CellVal(AdvStringGrid1.FixedCols + 6, i, FieldByName('OperSummABS_K').DisplayText);
        CellVal(AdvStringGrid1.FixedCols + 7, i, FieldByName('CurrencyOperShortName_K').DisplayText);
      end;
      Next;
    end;
  end;
  AdvStringGrid1.AutoSizeColumns(false, 10);
  AdvStringGrid1.AutoSizeRows(false, 0);
end;

procedure TAccCard_Adv.AdvStringGrid1GetCellColor(Sender: TObject; ARow,
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

procedure TAccCard_Adv.AdvStringGrid1GetAlignment(Sender: TObject; ARow,
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

procedure TAccCard_Adv.ToolButton3Click(Sender: TObject);
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

procedure TAccCard_Adv.AdvStringGrid1ColumnSize(Sender: TObject; ACol: Integer;
  var Allow: Boolean);
var i : integer;
begin
{  for i := 0 to AdvStringGrid1.RowCount - 1 do
    CalcRowHeights(i);   }
end;

procedure TAccCard_Adv.BitBtn2Click(Sender: TObject);
begin
  if fObjList1.ObjCount = 0 then
  begin
    Windows.SetFocus(fObjList1.RxDBGrid1.Handle);
    MessageBox(Handle, 'Не выбран ни один счет', 'Выберите счет', MB_ICONQUESTION + mb_OK);
    Exit;
  end;
  InternalInitialize;
end;

procedure TAccCard_Adv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAccCard_Adv.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TAccCard_Adv.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TAccCard_Adv.aPropExecute(Sender: TObject);
var
    ID, FOperVid : integer;
    Rez : boolean;
    B : boolean;
    Fid_OperParent : Variant;
    Fis_Mirr : boolean;
    AOperParamz : TOperParamz;
begin
  if AdvStringGrid1.Objects[0, AdvStringGrid1.Row] = nil then
    Exit;
  ID := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).FId_Oper;
  Fis_Mirr := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).Fis_Mirr;

  AOperParamz := GetEmptyOperParamz;

  AOperParamz.ID_Oper := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).FId_Oper;
  AOperParamz.Is_Mirr := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).Fis_Mirr;
  FOperVid := TOperDate(AdvStringGrid1.Objects[0, AdvStringGrid1.Row]).FOperVid;
  Rez := false;
  AOperParamz.ReadOnly := true;
  case FOperVid of
    -1 : EditOperCrnCh(Handle, AOperParamz);
    1 : EditOperWare(Handle, AOperParamz);
    2 : EditOperFin(Handle, AOperParamz);
    4 : EditOperOffset(Handle, AOperParamz);
    101 : EditOperWare_FFF(Handle, AOperParamz);
    102 : EditOperFin_FFF(Handle, AOperParamz);
  end;
end;

procedure TAccCard_Adv.cdsACard_AdvAfterOpen(DataSet: TDataSet);
begin
  aProp.Enabled := not cdsACard_Adv.IsEmpty;
end;

procedure TAccCard_Adv.AdvStringGrid1DblClick(Sender: TObject);
begin
  if AdvStringGrid1.Row < AdvStringGrid1.FixedRows  then
    Exit;
  aProp.Execute;
end;

procedure TAccCard_Adv.AdvStringGrid1ClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  aProp.Enabled := AdvStringGrid1.Objects[0, ARow] <> nil;
//  AdvStringGrid1.SelectCols(ACol, 1);
end;

procedure TAccCard_Adv.aExportExecute(Sender: TObject);
begin
  AdvStringGridToExcel(AdvStringGrid1, CAName + ' (валюта ' + CrnName + ')');
end;

procedure TAccCard_Adv.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TAccCard_Adv.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TAccCard_Adv.AdvStringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  Edit1.Text := IntToStr(GetTickCount);
end;

procedure TAccCard_Adv.AdvStringGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  Edit1.Text := '**' + IntToStr(GetTickCount);

end;

procedure TAccCard_Adv.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
var S : String;
begin
  S := FormatFloat('0.##', CalcSummAdvSringGrid(AdvStringGrid1));
  if S <> Edit1.Text then
    Edit1.Text := S;
end;

procedure TAccCard_Adv.fBsnSelector1Button1Click(Sender: TObject);
var OldID : Variant;
begin
  OldID := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if OldID <> fBsnSelector1.ID then
  begin
    AdvStringGrid1.Clear;
    LoadCDS(cdsACard_Adv);
    fObjList1.Initialize([eotFin, eotFinGroup], fBsnSelector1.ID, 40, true);
    fObjList1.LoadFromReg;
  //  Initialize;
  end;
end;

procedure TAccCard_Adv.AdvStringGrid1GetDisplText(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
var Code : integer;
    i:Real;
    V : Variant;
begin
  V := StringReplace(VarToStr(Value), ',', '.', [rfReplaceAll, rfIgnoreCase]);
  System.Val(V, i, Code);
  if Code = 0 then
    Value := FormatFloat('### ### ### ##0.00', i);
end;

procedure TAccCard_Adv.Initialize(AParamBlnc: TParamBlnc);
begin
  fBsnSelector1.ID := AParamBlnc.id_business;

  fObjList1.Initialize([eotFin, eotFinGroup], fBsnSelector1.ID, 40, true);
  fObjList1.AddParamBlnc(AParamBlnc);
  if fObjList1.ObjCount = 0 then
    fObjList1.LoadFromReg;
  InternalInitialize;
end;

procedure TAccCard_Adv.N11Click(Sender: TObject);
begin
  AdvStringGridToExcel(AdvStringGrid1, Caption);
end;

end.
