unit uMovWH_Adv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons,
  dxPSGlbl, Menus, DBGridEh, frMov_Goods,
  foMyFunc, Registry, frObjList, RXSplit, BaseGrid, AdvGrid, frMov_WareUn;

type
  TMovWH_Adv = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    PageControl1: TPageControl;
    tsGoods: TTabSheet;
    tsMain: TTabSheet;
    Splitter1: TSplitter;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    p1: TGroupBox;
    fObjListWH: TfObjList;
    p2: TGroupBox;
    fObjListWare: TfObjList;
    Splitter2: TSplitter;
    cdsWareState: TClientDataSet;
    cdsWareStateF: TIntegerField;
    cdsWareStateId_Currency: TIntegerField;
    cdsWareStateID_Measure: TIntegerField;
    cdsWareStateMesName: TStringField;
    AdvStringGrid1: TAdvStringGrid;
    cdsWareStateTotal: TFloatField;
    cdsWareStateAvgPrice: TFloatField;
    cdsWareStateCrnName: TStringField;
    fMov_WareUn1: TfMov_WareUn;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    dtTo: TDateTimePicker;
    cdsWareStateWHName: TStringField;
    cdsWareStateID_Warehouse: TIntegerField;
    cbShowByWH: TCheckBox;
    pmGrExc: TPopupMenu;
    N11: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure AdvStringGrid1GetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure AdvStringGrid1GetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure AdvStringGrid1GetDisplText(Sender: TObject; ACol,
      ARow: Integer; var Value: String);
    procedure N11Click(Sender: TObject);
    procedure fMov_WareUn1BitBtn2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    FShowNull : boolean;
    FID_Bsn : Variant;
    FParamBlnc: TParamBlnc;
    procedure LoadCDS(CDS: TClientDataSet);

    procedure GetWHList(var V : Variant);
    procedure GetWHGroupList(var V : Variant);
    procedure GetWareList(var V : Variant);
    procedure GetWareGroupList(var V : Variant);
    procedure InitMov;
    procedure RefresheLists;

  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(AParamBlnc: TParamBlnc);
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure ShowMovWH_Adv(AParamBlnc: TParamBlnc);

var
  MovWH_Adv: TMovWH_Adv;

implementation

uses uDM, foMyFuncAdvStrGrigExcel;

{$R *.DFM}

procedure ShowMovWH_Adv(AParamBlnc: TParamBlnc);
var F : TMovWH_Adv;
begin
  DM.Rights_GetUserRights(6, Null);
  F := TMovWH_Adv.Create(nil);
  try
    F.Initialize(AParamBlnc);
    F.Show;
  except
    F.Free;
  end;
end;

{ TGoodsSum }

procedure TMovWH_Adv.Initialize(AParamBlnc: TParamBlnc);
var i, N : integer;
    id_Bsn, id_Group: OleVariant;
begin
  PageControl1.ActivePage := tsMain;
  FParamBlnc := AParamBlnc;
  if (FParamBlnc.id_Warehouse <> Null) and (FParamBlnc.id_business = Null) then
  begin
    DM.rsCA.AppServer.UNSel_WHBsn(FParamBlnc.id_Warehouse, id_Bsn, id_Group);
    FParamBlnc.id_business := id_Bsn;
  end;
  
  fBsnSelector1.ID := FParamBlnc.id_business;

  N := -1;
  RefresheLists;
  InitMov;
end;

constructor TMovWH_Adv.Create(AOwner: TCOmponent);
begin
  inherited;
  dtTo.Date := Now;

  LoadValFromRegistry(FID_Bsn, SRegPath + '\' + Name, 'FID_Bsn2');
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);

end;

procedure TMovWH_Adv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMovWH_Adv.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TMovWH_Adv.btnCancelClick(Sender: TObject);
begin
  Close;
end;

destructor TMovWH_Adv.Destroy;
var
    Reg : TRegistry;
    FullRegPathName : String;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, true) then
    begin
      Reg.WriteInteger('p1Width', p1.Width);
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;

  SaveValToRegistry(FID_Bsn, SRegPath + '\' + Name, 'FID_Bsn2');

  fObjListWH.SaveToReg;
  fObjListWare.SaveToReg;

  inherited;

end;

procedure TMovWH_Adv.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TMovWH_Adv.FormShow(Sender: TObject);
var
    Reg : TRegistry;
    FullRegPathName : String;
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, false) then
    begin
      if Reg.ValueExists('p1Width') then
        p1.Width := Reg.ReadInteger('p1Width');
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TMovWH_Adv.BitBtn2Click(Sender: TObject);
var AID : integer;
    IDGoodsList, IDGoodsGroupList : TEObjType;
begin
  if (fObjListWH.ObjCount = 0)  then
  begin
    Windows.SetFocus(fObjListWH.RxDBGrid1.Handle);
    MessageBox(Handle, '�� ������ �� ���� �����', '�������� �����', MB_ICONQUESTION + mb_OK);
    Exit;
  end;
 { if (fObjListWH.ObjCount = 0) and (fObjListWare.ObjCount = 0)  then
  begin
    Windows.SetFocus(fObjListWH.RxDBGrid1.Handle);
    MessageBox(Handle, '�� ������ �� ���� ����� ��� �����', '�������� ����� ��� �����', MB_ICONQUESTION + mb_OK);
    Exit;
  end; }
  try
    Screen.Cursor := crSQLWait;
    Enabled := false;
    with cdsWareState do
    begin
      Close;
      IDGoodsList := eotGoods;
      IDGoodsGroupList := eotGoodsGroup;

      Params.ParamByName('@ID').AsInteger := 1;

      Params.ParamByName('@IDWHList').Value := fObjListWH.GetIDList(eotWH);
      Params.ParamByName('@IDWHGroupList').Value := fObjListWH.GetIDList(eotWHGroup);
      Params.ParamByName('@IDGoodsList').Value := fObjListWare.GetIDList(IDGoodsList);
      Params.ParamByName('@IDGoodsGroupList').Value := fObjListWare.GetIDList(IDGoodsGroupList);

      Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(dtTo.Date, true);

      Params.ParamByName('@ShowByWH').Value := cbShowByWH.Checked;

 //     Params.ParamByName('@IDCAList').Value := Null;
 //     Params.ParamByName('@IDCAGroupList').Value := Null;
      Open;
    end;
  finally
    LoadCDS(cdsWareState);
    Screen.Cursor := crDefault;
    Enabled := true;
  end;
end;

procedure TMovWH_Adv.LoadCDS(CDS: TClientDataSet);
  procedure CellVal(x, y : integer; Val : String; Obj : TObject = nil);
  begin
    if y >= AdvStringGrid1.RowCount then
      AdvStringGrid1.RowCount := y + 1; 
    AdvStringGrid1.Objects[x, y] := Obj;
    AdvStringGrid1.Cells[x, y] := Val;
  end;
var i : integer;
    inSumm : boolean;
    id_Wh : Variant;
    P : Pointer;
begin
  id_Wh := Null;
  AdvStringGrid1.SplitAllCells;     
  AdvStringGrid1.Clear;
  AdvStringGrid1.DefaultRowHeight := 21;
  AdvStringGrid1.FixedCols := 1;
  AdvStringGrid1.FixedColWidth := 8;
  AdvStringGrid1.RowCount := 1;
  with CDS do
  begin
    AdvStringGrid1.FixedRows := 0;
    if (Active) and (not IsEmpty) then
//      AdvStringGrid1.RowCount := RecordCount + 4
    else
    begin
      AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 0, i, 4, 1);
      CellVal(AdvStringGrid1.FixedCols + 0, i, '�����', Pointer(1));
      Exit;
    end;
    
    AdvStringGrid1.ColCount := AdvStringGrid1.FixedCols + 4;
    i := 0;
    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 0, i, 4, 1);
    CellVal(AdvStringGrid1.FixedCols + 0, i, '����� ��������', Pointer(4));
    inc(i);
    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 0, i, 1, 1);
    CellVal(AdvStringGrid1.FixedCols + 0, i, '�����', Pointer(4));

    AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, 3, 1);
    CellVal(AdvStringGrid1.FixedCols + 1, i, '������', Pointer(4));

    inSumm := true;

    if not CDS.Active then
      Exit;
    First;

    while not Eof do
    begin
      inc(i);
      if inSumm and (FieldByName('F').AsInteger = 1) then
      begin
        inSumm := false;
        AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 0, i, 4, 1);
        CellVal(AdvStringGrid1.FixedCols + 0, i, '���������� ��������', Pointer(4));

        inc(i);
        CellVal(AdvStringGrid1.FixedCols + 0, i, '���-��', Pointer(4));
        CellVal(AdvStringGrid1.FixedCols + 1, i, '��. ���������', Pointer(4));
        CellVal(AdvStringGrid1.FixedCols + 2, i, '��. ����', Pointer(4));
        CellVal(AdvStringGrid1.FixedCols + 3, i, '������', Pointer(4));
        inc(i);
      end;
      if (id_Wh <> FieldByName('ID_Warehouse').Value) and (not FieldByName('ID_Warehouse').IsNull) then
      begin
    //    inSumm := false;
{        if id_Wh = Null then
        begin
          AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 0, i, 4, 1);
          CellVal(AdvStringGrid1.FixedCols + 0, i, '������� �� ������� ������', Pointer(4));

          inc(i);
        end;      }
        id_Wh := FieldByName('ID_Warehouse').AsInteger;
        AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 0, i, 4, 1);
        CellVal(AdvStringGrid1.FixedCols + 0, i, '�����: ' + FieldByName('WHName').AsString, Pointer(2));

        inc(i);
      end;

      if not FieldByName('ID_Warehouse').IsNull then
        P := Nil
      else
        P := Pointer(3);
      if inSumm then
      begin
        AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 0, i, 1, 1);
        CellVal(AdvStringGrid1.FixedCols + 0, i, FieldByName('Total').AsString, P);

        AdvStringGrid1.MergeCells(AdvStringGrid1.FixedCols + 1, i, 3, 1);
        CellVal(AdvStringGrid1.FixedCols + 1, i, FieldByName('CrnName').AsString, P);
      end
      else
      begin
        CellVal(AdvStringGrid1.FixedCols + 0, i, FieldByName('Total').AsString, P);
        CellVal(AdvStringGrid1.FixedCols + 1, i, FieldByName('MesName').AsString, P);
        CellVal(AdvStringGrid1.FixedCols + 2, i, FieldByName('AvgPrice').AsString, P);
        CellVal(AdvStringGrid1.FixedCols + 3, i, FieldByName('CrnName').AsString, P);
      end;
      Next;
    end;
  end;
  AdvStringGrid1.AutoSizeColumns(false, 10);
  AdvStringGrid1.AutoSizeRows(false, 0);
end;

procedure TMovWH_Adv.AdvStringGrid1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
var Obj : TObject;
begin
  Obj := AdvStringGrid1.Objects[ACol, ARow];
  if Obj <> nil then
  begin
    if Obj = Pointer(1) then
      HAlign := taCenter;
    if Obj = Pointer(2) then
      HAlign := taLeftJustify;
    if Obj = Pointer(3) then
      HAlign := taRightJustify;
    if (Obj = Pointer(4)) or (Obj = Pointer(5)) then
      HAlign := taCenter;
  end;
  VAlign := vtaCenter;
end;

procedure TMovWH_Adv.AdvStringGrid1GetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
var Obj : TObject;
begin
  Obj := AdvStringGrid1.Objects[ACol, ARow];
  if Obj <> nil then
  begin
    if Obj = Pointer(4) then
      ABrush.Color := clBtnFace;// $00D7D7D7;
    if Obj = Pointer(3) then
      ABrush.Color := $00CDD5D8;//$00D7D7D7;

    AFont.Style := [fsBold];
  end;
end;

procedure TMovWH_Adv.AdvStringGrid1GetDisplText(Sender: TObject; ACol,
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

procedure TMovWH_Adv.GetWareGroupList(var V: Variant);
var XXX : TEObjType;
begin
  XXX := eotGoodsGroup;
  V := fObjListWare.GetIDList(XXX);
end;

procedure TMovWH_Adv.GetWareList(var V: Variant);
var XXX : TEObjType;
begin
  XXX := eotGoods;
  V := fObjListWare.GetIDList(XXX);
end;

procedure TMovWH_Adv.GetWHGroupList(var V: Variant);
begin
  V := fObjListWH.GetIDList(eotWHGroup);
end;

procedure TMovWH_Adv.GetWHList(var V: Variant);
begin
  V := fObjListWH.GetIDList(eotWH);
end;

procedure TMovWH_Adv.InitMov;
var AID : integer;
begin
  AID := 1;
  fMov_WareUn1.Initialize(AID, GetWHList, GetWHGroupList, GetWareList, GetWareGroupList, nil, nil, fBsnSelector1.ID);
end;

procedure TMovWH_Adv.fBsnSelector1Button1Click(Sender: TObject);
var OldID : Variant;
begin
  OldID := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if OldID <> fBsnSelector1.ID then
  begin
    RefresheLists;
  //  Initialize;
  end;
  InitMov;

end;

procedure TMovWH_Adv.RefresheLists;
var
    IDWares : TEObjTypes;
begin
  fObjListWH.Initialize([eotWH, eotWHGroup], fBsnSelector1.ID, 40, true);
  if FParamBlnc.id_business <> Null then
    fObjListWH.AddParamBlnc(FParamBlnc);
  FParamBlnc := GetEmptyParamBlnc;

  IDWares := [eotGoods, eotGoodsGroup];

  fObjListWare.Initialize(IDWares, fBsnSelector1.ID, 40, true);
  AdvStringGrid1.Clear;
end;

procedure TMovWH_Adv.N11Click(Sender: TObject);
begin
  AdvStringGridToExcel(AdvStringGrid1, Caption);
end;

procedure TMovWH_Adv.fMov_WareUn1BitBtn2Click(Sender: TObject);
begin
  if (fObjListWH.ObjCount = 0)  then
  begin
    PageControl1.ActivePage := tsMain;
    Windows.SetFocus(fObjListWH.RxDBGrid1.Handle);
    MessageBox(Handle, '�� ������ �� ���� �����', '�������� �����', MB_ICONQUESTION + mb_OK);
    Exit;
  end;
  fMov_WareUn1.BitBtn2Click(Sender);

end;

procedure TMovWH_Adv.PageControl1Change(Sender: TObject);
begin
  fMov_WareUn1.BitBtn2.Enabled := (fObjListWH.ObjCount > 0) or (fObjListWare.ObjCount > 0);
end;

end.
