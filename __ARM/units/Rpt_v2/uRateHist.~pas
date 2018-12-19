unit uRateHist;

interface

uses                
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, ImgList,
    foMyFunc, Menus, RXCtrls, ComCtrls, Registry, printers,
   ToolWin, ComObj,
  Buttons,
  BaseGrid, AdvGrid, asgprint, asgprev, DBGrids, RXDBCtrl, ActnList,
  RxLookup, Mask, ToolEdit;

type
  TOperDate = class(TComponent)
  public
    FId_Oper : integer;  
    FOperVid : integer;  
  end;
  
  TRateHist = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    cdsRateHist: TClientDataSet;
    dsArc: TDataSource;
    ilImage: TImageList;
    pnDate: TPanel;
    StatusBar1: TStatusBar;
    ilButtons: TImageList;
    Panel4: TPanel;
    AdvPreviewDialog1: TAdvPreviewDialog;
    AdvGridPrintSettingsDialog1: TAdvGridPrintSettingsDialog;
    Edit3: TEdit;
    SaveDialog1: TSaveDialog;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    AdvStringGrid1: TAdvStringGrid;
    Label3: TLabel;
    ToolButton4: TToolButton;
    ActionList1: TActionList;
    lbCrn: TLabel;
    ToolButton6: TToolButton;
    aExport: TAction;
    aExportSmp: TAction;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    cdsCrnNames: TClientDataSet;
    dsCrnNames: TDataSource;
    cdsCrnNamesName: TStringField;
    cdsCrnNamesid_Currency: TIntegerField;
    cdsRateHistId_business: TIntegerField;
    cdsRateHistBsnName: TStringField;
    cdsRateHistId_Currency: TIntegerField;
    cdsRateHistCrnName: TStringField;
    cdsRateHistDateAssign: TDateTimeField;
    cdsRateHistRealRate: TFloatField;
    lcCrn: TRxDBLookupCombo;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    dtFrom: TDateEdit;
    dtTo: TDateEdit;
    BitBtn2: TBitBtn;
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
    procedure aExportExecute(Sender: TObject);
  private
    OldCrnId : Variant;
    procedure LoadCDS(CDS: TClientDataSet);
    procedure CellVal(x, y: integer; Val: String; Obj : TObject = nil);
    procedure CalcRowHeights(y: integer);
    procedure GetAGPrinterInfo;
  public
    procedure Initialize;

    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  RateHist: TRateHist;

procedure ShowRateHist;

implementation

uses uDM, foMyFuncAdvStrGrigExcel;

{$R *.DFM}


procedure ShowRateHist;
var F : TRateHist;
begin
  DM.Rights_GetUserRights(6, Null);
  F := TRateHist.Create(nil);
  try
    F.Show;
    F.Repaint;
    F.Initialize;
    
  except
    F.Free;
  end;
end;
{ TBalance }


destructor TRateHist.Destroy;
var
    Reg : TRegistry;
    i : integer;
begin
  SaveValToRegistry(lcCrn.Value, SRegPath + '\' + Name, 'OldCrnId');
  inherited;
end;

constructor TRateHist.Create(AOwner: TCOmponent);
var 
    Year, Month, Day: Word;
    DDD : TDate;
    Reg : TRegistry;
    i : integer;
begin
  inherited;
  LoadValFromRegistry(OldCrnId, SRegPath + '\' + Name, 'OldCrnId');
  lcCrn.KeyValue := varToStr(OldCrnId);

  lbCrn.Caption := '';
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
//  RxDBGrid1.RowHeight := 6;

//  LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + Name + '\' + ClassName);

  DecodeDate(Now, Year, Month, Day);
  dtFrom.Date := EncodeDate(Year, Month, 1);
  DDD := IncMonth(Now, 1);
  DecodeDate(DDD, Year, Month, Day);
  dtTo.Date := EncodeDate(Year, Month, 1) - 1;

  dtFrom.Date := Now - 7;
  dtTo.Date := Now;
end;

procedure TRateHist.Initialize;
begin
  Screen.Cursor := crSQLWait;
  Enabled := false;
  try

    with cdsCrnNames do
    begin
      Close;
      Params.ParamByName('@FastAccess').Value := Null;
      Params.ParamByName('@AvForPay').Value := Null;
      Open;
    end;
    
    with cdsRateHist do
    begin
      Close;
      Params.ParamByName('@DateFrom').AsDate := Trunc(dtFrom.Date);
      Params.ParamByName('@DateTo').AsDate := Trunc(dtTo.Date) + 1 ;
      Params.ParamByName('@Id_Currency').Value := lcCrn.KeyValue;
      Params.ParamByName('@Id_business').Value := Null;

      if (lcCrn.KeyValue <> '')then
      begin
        Open;
      end;
    end;
    LoadCDS(cdsRateHist);
  finally
    Enabled := true;
    Screen.Cursor := crDefault;
  end;  
end;

procedure TRateHist.GetAGPrinterInfo;
begin
  printer.Orientation := poLandscape;

  AdvStringGrid1.PrintSettings.Date := ppTopLeft;
  AdvStringGrid1.PrintSettings.DateFormat := 'dd-mm-yyyy hh:nn';

  AdvStringGrid1.PrintSettings.TitleText := '' + lcCrn.Text;

  AdvStringGrid1.PrintSettings.Title := ppTopCenter;

  AdvStringGrid1.PrintSettings.HeaderFont.Size := 12;
  AdvStringGrid1.PrintSettings.HeaderFont.Style := [fsBold];
end;


procedure TRateHist.ToolButton2Click(Sender: TObject);
begin
  GetAGPrinterInfo;
  printer.Orientation := poLandscape;
  
  AdvPreviewDialog1.Execute;
end;

procedure TRateHist.ToolButton1Click(Sender: TObject);
begin
  AdvGridPrintSettingsDialog1.Execute
end;

procedure TRateHist.CalcRowHeights(y : integer);
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


procedure TRateHist.CellVal(x, y : integer; Val : String; Obj : TObject);
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

procedure TRateHist.LoadCDS(CDS: TClientDataSet);
var i, TmpCol : integer;
    Id_business : integer;
begin
  Id_business := -1;
  AdvStringGrid1.DefaultRowHeight := 21;
  AdvStringGrid1.RowCount := 2;
  AdvStringGrid1.ColCount := 2;
  AdvStringGrid1.FixedCols := 1;
  AdvStringGrid1.FixedColWidth := 8;
  with CDS do
  begin
    First;
    AdvStringGrid1.Clear;
    AdvStringGrid1.FixedRows := 1;
    TmpCol := 1;
    while not Eof do
    begin
      if Id_business <> FieldByName('Id_business').AsInteger then
      begin
        Id_business := FieldByName('Id_business').AsInteger;
        Inc(TmpCol);
        i := 0;
        AdvStringGrid1.Cells[TmpCol, i] := FieldByName('BsnName').AsString;
        AdvStringGrid1.Cells[1, i] := 'Дата';
        AdvStringGrid1.ColCount := AdvStringGrid1.ColCount + 1;
      end;
      inc(i);
      if i >= AdvStringGrid1.RowCount then
        AdvStringGrid1.RowCount := i + 1;

      if TmpCol = 2 then
        AdvStringGrid1.Cells[1, i] := FieldByName('DateAssign').AsString;

      if FieldByName('RealRate').IsNull then
        AdvStringGrid1.Cells[TmpCol, i] := ''
      else
        AdvStringGrid1.Cells[TmpCol, i] := FormatFloat('0.0000', FieldByName('RealRate').AsFloat);

      Next;
    end;
  end;
  AdvStringGrid1.AutoSizeColumns(false, 10);
  AdvStringGrid1.AutoSizeRows(false, 0);
end;

procedure TRateHist.AdvStringGrid1GetCellColor(Sender: TObject; ARow,
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

procedure TRateHist.AdvStringGrid1GetAlignment(Sender: TObject; ARow,
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

procedure TRateHist.ToolButton3Click(Sender: TObject);
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

procedure TRateHist.AdvStringGrid1ColumnSize(Sender: TObject; ACol: Integer;
  var Allow: Boolean);
var i : integer;
begin
{  for i := 0 to AdvStringGrid1.RowCount - 1 do
    CalcRowHeights(i);   }
end;

procedure TRateHist.BitBtn2Click(Sender: TObject);
begin
  Initialize;
end;

procedure TRateHist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TRateHist.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TRateHist.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TRateHist.aExportExecute(Sender: TObject);
begin
  AdvStringGridToExcel(AdvStringGrid1, lcCrn.Text, '0.0000');
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

end.
