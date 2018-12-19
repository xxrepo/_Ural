unit uInvRepList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, Db, DBClient, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  ActnList, Menus, ImgList, RXCtrls, GridsEh;

type
  TInvRepList = class(TForm)
    RxDBGrid1: TDBGridEh;
    dsInv_Rep: TDataSource;
    cdsInv_Rep: TClientDataSet;
    cdsInv_RepPrjNum: TIntegerField;
    cdsInv_RepName: TStringField;
    cdsInv_RepAmount1: TFloatField;
    cdsInv_RepAmount2: TFloatField;
    cdsInv_RepInv1: TFloatField;
    cdsInv_RepInv2: TFloatField;
    cdsInv_RepPrice: TFloatField;
    cdsInv_RepKlishe_Inv1: TFloatField;
    cdsInv_RepKlishe_Inv2: TFloatField;
    cdsInv_RepKlishe_Price: TFloatField;
    cdsInv_RepTime_Form1: TDateTimeField;
    cdsInv_RepTime_Form2: TDateTimeField;
    cdsInv_RepTime_FormDelta: TDateTimeField;
    cdsInv_RepTime_Print1: TDateTimeField;
    cdsInv_RepTime_Print2: TDateTimeField;
    cdsInv_RepTime_PrintDelta: TDateTimeField;
    cdsInv_RepTime_Lam1: TDateTimeField;
    cdsInv_RepTime_Lam2: TDateTimeField;
    cdsInv_RepTime_LamDelta: TDateTimeField;
    cdsInv_RepTime_Rez1: TDateTimeField;
    cdsInv_RepTime_Rez2: TDateTimeField;
    cdsInv_RepTime_RezDelta: TDateTimeField;
    cdsInv_RepRaw_Form1: TFloatField;
    cdsInv_RepRaw_Form2: TFloatField;
    cdsInv_RepRaw_FormDelta: TFloatField;
    cdsInv_RepRaw_Print1: TFloatField;
    cdsInv_RepRaw_Print2: TFloatField;
    cdsInv_RepRaw_PrintDelta: TFloatField;
    cdsInv_RepRaw_Lam1: TFloatField;
    cdsInv_RepRaw_Lam2: TFloatField;
    cdsInv_RepRaw_LamDelta: TFloatField;
    cdsInv_RepRaw_Rez1: TFloatField;
    cdsInv_RepRaw_Rez2: TFloatField;
    cdsInv_RepRaw_RezDelta: TFloatField;
    cdsInv_Repxxx: TIntegerField;
    cdsInv_RepRecNum: TIntegerField;
    pnDate: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    dtTo: TDateTimePicker;
    dtFrom: TDateTimePicker;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    aEdit: TAction;
    cdsInv_RepCalcDate: TDateTimeField;
    cdsInv_RepCheckDate: TDateTimeField;
    cdsInv_RepID_Main: TIntegerField;
    cdsInv_Repid_Project: TIntegerField;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Button1: TButton;
    Action1: TAction;
    cdsInv_RepKL_Delta: TFloatField;
    cdsInv_RepINV_Delta: TFloatField;
    cdsInv_RepINV_DeltaVal: TFloatField;
    cbFilter: TComboBox;
    cdsInv_RepT_FormDelta: TFloatField;
    cdsInv_RepT_PrintDelta: TFloatField;
    cdsInv_RepT_LamDelta: TFloatField;
    cdsInv_RepT_RezDelta: TFloatField;
    FilterEdit: TEdit;
    cdsInv_RepTime_Form1_v: TFloatField;
    cdsInv_RepTime_Form2_v: TFloatField;
    cdsInv_RepTime_Print1_v: TFloatField;
    cdsInv_RepTime_Print2_v: TFloatField;
    cdsInv_RepTime_Lam1_v: TFloatField;
    cdsInv_RepTime_Lam2_v: TFloatField;
    cdsInv_RepTime_Rez1_v: TFloatField;
    cdsInv_RepTime_Rez2_v: TFloatField;
    aUnSetCheckDate: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    aRefreshe: TAction;
    ilImage: TImageList;
    cdsInv_RepKomposit: TStringField;
    cdsInv_RepOwnName: TStringField;
    RxSpeedButton5: TRxSpeedButton;
    cdsInv_RepFIO: TStringField;
    cdsInv_RepFIOFFF: TStringField;
    procedure cdsInv_RepCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure dsInv_RepDataChange(Sender: TObject; Field: TField);
    procedure cdsInv_RepTime_FormDeltaGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsInv_RepTime_Form2GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BitBtn5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
      IsDown: Boolean);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure cbFilterChange(Sender: TObject);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure aUnSetCheckDateExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxSpeedButton5Click(Sender: TObject);
  private
    function GetStringByDate(Sender: TField): String;
    function GetFloatByDate(Sender: TField): Variant;
    procedure cdsInv_RepTime_FormDelta_XXX_GetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsInv_RepTime_LamDelta_XXX_GetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsInv_RepTime_PrintDelta_XXX_GetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsInv_RepTime_RezDelta_XXX_GetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  InvRepList: TInvRepList;
procedure ShowInvRepList(id_Project : integer; DateFrom, DateTo : TDateTime);

implementation

uses uDM, foMyFuncEh, foMyFunc, uInvMain, foMyFuncEhExcel, uPrgForm,
  uArcProp;

{$R *.DFM}

procedure ShowInvRepList(id_Project : integer; DateFrom, DateTo : TDateTime);
var F : TInvRepList;
begin

    DM.Rights_GetUserRights(1002, Null);

 // DM.Rights_GetUserRights(6, Null);
  F := TInvRepList.Create(nil);
  try
    F.Show;
    F.Repaint;
    with F.cdsInv_Rep do
    begin
      Close;
      Params.ParamByName('@id_Project').Value := id_Project;

      Params.ParamByName('@DateFrom').Value := GetDateAdv(DateFrom, false);
      Params.ParamByName('@DateTo').Value := GetDateAdv(DateTo, true);

      Open;
    end;
  except
    F.Free;
  end;
end;

{ TInvRepList }

constructor TInvRepList.Create(AOwner: TCOmponent);
var i : integer;
begin
  inherited;
  aUnSetCheckDate.Visible := DM.CheckUserRights(1001, Null) ;
  aEdit.Visible := DM.CheckUserRights(1001, Null) ;

  cbFilter.Items.Clear;
  cbFilter.Items.Add('Показывать все');
  cbFilter.Items.Add('Убыточные по пленке');
  cbFilter.Items.Add('Убыточные по клише');

  cbFilter.ItemIndex := 0;
  cbFilterChange(cbFilter);

  for i := 0 to cdsInv_Rep.Fields.Count - 1 do
  begin
    if cdsInv_Rep.Fields[i] is TDateTimeField then
    begin
      TDateTimeField(cdsInv_Rep.Fields[i]).DisplayFormat := 'dd hh:nn';
      TDateTimeField(cdsInv_Rep.Fields[i]).EditMask := '!90:00;1; ';
 //     cdsInv_Rep.Fields[i].OnGetText := cdsInv_RepTime_Form2GetText;

      if (cdsInv_Rep.Fields[i] = cdsInv_RepTime_Form1) or
         (cdsInv_Rep.Fields[i] = cdsInv_RepTime_Form2) or
      //   (cdsInv_Rep.Fields[i] = cdsInv_RepTime_FormDelta) or

         (cdsInv_Rep.Fields[i] = cdsInv_RepTime_Print1) or
         (cdsInv_Rep.Fields[i] = cdsInv_RepTime_Print2) or
      //   (cdsInv_Rep.Fields[i] = cdsInv_RepTime_PrintDelta) or

         (cdsInv_Rep.Fields[i] = cdsInv_RepTime_Lam1) or
         (cdsInv_Rep.Fields[i] = cdsInv_RepTime_Lam2) or
       //  (cdsInv_Rep.Fields[i] = cdsInv_RepTime_LamDelta) or

         (cdsInv_Rep.Fields[i] = cdsInv_RepTime_Rez1) or
         (cdsInv_Rep.Fields[i] = cdsInv_RepTime_Rez2) then
        cdsInv_Rep.Fields[i].OnGetText := cdsInv_RepTime_FormDeltaGetText;

    end;
    if cdsInv_Rep.Fields[i] is TFloatField then
    begin
      TFloatField(cdsInv_Rep.Fields[i]).DisplayFormat := '0.00';
      TFloatField(cdsInv_Rep.Fields[i]).EditFormat := '0.00';
    end;
  end;

  dtFrom.DateTime := Now-30;
  dtTo.DateTime := Now;

  LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + Self.ClassName + 'ttt3');
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);

end;

procedure TInvRepList.cdsInv_RepTime_FormDelta_XXX_GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
//    Text :=  GetStringByDate(Sender);
end;

procedure TInvRepList.cdsInv_RepTime_PrintDelta_XXX_GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
//    Text :=  GetStringByDate(Sender);
end;
procedure TInvRepList.cdsInv_RepTime_LamDelta_XXX_GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
//    Text :=  GetStringByDate(Sender);
end;
procedure TInvRepList.cdsInv_RepTime_RezDelta_XXX_GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
//    Text :=  GetStringByDate(Sender);
end;


procedure TInvRepList.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

destructor TInvRepList.Destroy;
begin
  inherited;

end;

procedure TInvRepList.cdsInv_RepCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('RecNum').Value := DataSet.RecNo;
  if not (DataSet.FieldByName('Klishe_Inv1').IsNull and DataSet.FieldByName('Klishe_Inv2').IsNull) then
    DataSet.FieldByName('KL_Delta').AsFloat :=
      DataSet.FieldByName('Klishe_Inv1').AsFloat - DataSet.FieldByName('Klishe_Inv2').AsFloat;

    DataSet.FieldByName('INV_Delta').AsFloat :=
      DataSet.FieldByName('Inv1').AsFloat - DataSet.FieldByName('Inv2').AsFloat;
  DataSet.FieldByName('INV_DeltaVal').AsFloat := DataSet.FieldByName('INV_Delta').AsFloat * DataSet.FieldByName('Amount2').AsFloat;

  cdsInv_RepT_FormDelta.AsVariant := GetFloatByDate(cdsInv_RepTime_Form1) - GetFloatByDate(cdsInv_RepTime_Form2);
  cdsInv_RepT_PrintDelta.AsVariant := GetFloatByDate(cdsInv_RepTime_Print1) - GetFloatByDate(cdsInv_RepTime_Print2);
  cdsInv_RepT_LamDelta.AsVariant := GetFloatByDate(cdsInv_RepTime_Lam1) - GetFloatByDate(cdsInv_RepTime_Lam2);
  cdsInv_RepT_RezDelta.AsVariant := GetFloatByDate(cdsInv_RepTime_Rez1) - GetFloatByDate(cdsInv_RepTime_Rez2);

  if ABS(cdsInv_RepT_FormDelta.AsFloat) < 0.05 then
    cdsInv_RepT_FormDelta.AsVariant := Null;
    
  if ABS(cdsInv_RepT_PrintDelta.AsFloat) < 0.05 then
    cdsInv_RepT_PrintDelta.AsVariant := Null;

  if ABS(cdsInv_RepT_LamDelta.AsFloat) < 0.05 then
    cdsInv_RepT_LamDelta.AsVariant := Null;

  if ABS(cdsInv_RepT_RezDelta.AsFloat) < 0.05 then
    cdsInv_RepT_RezDelta.AsVariant := Null;

  cdsInv_RepTime_Form1_v.AsVariant := GetFloatByDate(cdsInv_RepTime_Form1);
  cdsInv_RepTime_Form2_v.AsVariant := GetFloatByDate(cdsInv_RepTime_Form2);
  cdsInv_RepTime_Print1_v.AsVariant := GetFloatByDate(cdsInv_RepTime_Print1);
  cdsInv_RepTime_Print2_v.AsVariant := GetFloatByDate(cdsInv_RepTime_Print2);
  cdsInv_RepTime_Lam1_v.AsVariant := GetFloatByDate(cdsInv_RepTime_Lam1);
  cdsInv_RepTime_Lam2_v.AsVariant := GetFloatByDate(cdsInv_RepTime_Lam2);
  cdsInv_RepTime_Rez1_v.AsVariant := GetFloatByDate(cdsInv_RepTime_Rez1);
  cdsInv_RepTime_Rez2_v.AsVariant := GetFloatByDate(cdsInv_RepTime_Rez2);
end;

procedure TInvRepList.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
  SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + Self.ClassName + 'ttt3');
end;

procedure TInvRepList.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TInvRepList.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=TDBGridEh(Sender).ScreenToClient(P);
  if P.y<=THackGridEh(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TInvRepList.aEditExecute(Sender: TObject);
var ID : integer;
begin
  ID := cdsInv_Repid_Project.AsInteger;
  ShowInvMain(Handle, ID);
end;

procedure TInvRepList.dsInv_RepDataChange(Sender: TObject; Field: TField);
begin
  aUnSetCheckDate.Enabled := not cdsInv_Rep.IsEmpty;
  aEdit.Enabled := not cdsInv_Rep.IsEmpty;
end;

  function frac_XX(X: Extended): Extended;
  begin
    Result := frac(X) * 24;
   { if Int(x) - 30 < 5 then
      Result := Result + Int(x)*24;  }

  end;

function TInvRepList.GetFloatByDate(Sender: TField) : Variant;
var Year, Month, Day, Hour, Min, Sec, MSec: Word;
    X : integer;
begin
  Result := 0;
  if not Sender.IsNull then
  begin
    DecodeDate(Sender.AsDateTime, Year, Month, Day);
    DecodeTime(Sender.AsDateTime, Hour, Min, Sec, MSec);

    x := Trunc(Sender.AsDateTime) - Trunc(EncodeDate(1900, 01, 01));
   { if x <> 0 then
    begin
      Text := Inttostr(X);
    end; }
    if Day = 29 then
    begin
      Result := -(1 - frac_XX(Sender.AsDateTime));
    end
    else
    begin
      Result := frac_XX(Sender.AsDateTime);// FormatDateTime('hh:mm', Sender.AsDateTime);
      if X > 0 then
        Result := Result + 24*x;
    end;
  end;
end;

function TInvRepList.GetStringByDate(Sender: TField) : String;
var V : Variant;
begin
  Result := '';
  if not Sender.IsNull then
  begin
    Result := FormatFloat('0.00', GetFloatByDate(Sender));
  end;
  Result := Trim(Result);
end;


procedure TInvRepList.cdsInv_RepTime_FormDeltaGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var Year, Month, Day, Hour, Min, Sec, MSec: Word;
    X : integer;
begin
  if not Sender.IsNull then
  begin
  //  DecodeDate(Sender.AsDateTime, Year, Month, Day);
  //  DecodeTime(Sender.AsDateTime, Hour, Min, Sec, MSec);

    Text :=  GetStringByDate(Sender);
  end;
end;

procedure TInvRepList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TInvRepList.cdsInv_RepTime_Form2GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var Year, Month, Day, Hour, Min, Sec, MSec: Word;
    X : integer;
begin
  if not Sender.IsNull then
  begin
    DecodeDate(Sender.AsDateTime, Year, Month, Day);
    DecodeTime(Sender.AsDateTime, Hour, Min, Sec, MSec);

    x := Trunc(Sender.AsDateTime) - Trunc(EncodeDate(1899, 12, 30));
    if x <> 0 then
    begin
      Text := Inttostr(X);
    end;
    Text := Text + ' ' + FormatDateTime('hh:mm', Sender.AsDateTime);
  end;
  Text := trim(Text);
end;

procedure TInvRepList.BitBtn5Click(Sender: TObject);
begin
 foMyFuncEhExcel.GreedToExcel(RxDBGrid1, Caption + ' ' + FormatDateTime('dd-mm-yyyy', dtFrom.DateTime) + '-' + FormatDateTime('dd-mm-yyyy', dtTo.DateTime));
end;

procedure TInvRepList.Button1Click(Sender: TObject);
var ID : integer;
begin
  with cdsInv_Rep do
  begin
    First;
    while not Eof do
    begin
      ShowProgressForm(Handle, RecNo, RecordCount, '...');
      ID := cdsInv_Repid_Project.AsInteger;
    DM.rsCA.AppServer.Inv_ProjectSetCheckDate(ID, Null);
   //   if cdsInv_RepPrice.IsNull then
        ShowInvMain(Handle, ID, false, true);

      Next;
    end;
  end;
  CloseProgressForm;
  aRefreshe.Execute;
end;

procedure TInvRepList.RxDBGrid1GetBtnParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarkerEh; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarkerEh(Column.Field);
end;

procedure TInvRepList.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  ReOrderCDSEh(Column, '');
end;

procedure TInvRepList.RxDBGrid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Column.Field = cdsInv_RepINV_DeltaVal) or
     (Column.Field = cdsInv_RepINV_Delta) or

     (Column.Field = cdsInv_RepT_FormDelta) or
     (Column.Field = cdsInv_RepT_PrintDelta) or
     (Column.Field = cdsInv_RepT_LamDelta) or
     (Column.Field = cdsInv_RepT_RezDelta) or

     (Column.Field = cdsInv_RepTime_FormDelta) or
     (Column.Field = cdsInv_RepTime_PrintDelta) or
     (Column.Field = cdsInv_RepTime_LamDelta) or
     (Column.Field = cdsInv_RepTime_RezDelta) or


      (Column.Field = cdsInv_RepRaw_FormDelta) or
     (Column.Field = cdsInv_RepRaw_PrintDelta) or
     (Column.Field = cdsInv_RepRaw_LamDelta) or
     (Column.Field = cdsInv_RepRaw_RezDelta) or
     (Column.Field = cdsInv_RepRaw_RezDelta) or
     (Column.Field = cdsInv_RepKL_Delta) then
  begin
    if (Column.Field.AsFloat < 0) and (ABS(Column.Field.AsFloat) > 0.005) then
    begin
      AFont.Style := [fsBold];
      AFont.Color := clRed;
    end;

  end;
end;

procedure TInvRepList.cbFilterChange(Sender: TObject);
begin
  with cdsInv_Rep do
  begin
    DisableControls;
    try
      if cbFilter.ItemIndex <= 0 then
        Filter := '';
      if cbFilter.ItemIndex = 1 then
        Filter := 'INV_DeltaVal<=-0,005';
      if cbFilter.ItemIndex = 2 then
        Filter := 'KL_Delta<=-0,005';

      Filtered := Filter <> '';
    finally
      EnableControls;
    end;
  end;
end;

procedure TInvRepList.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  with cdsInv_Rep   do
  begin
    DisableControls;
    try
      Filtered := False;
      
      Filter := 'PrjNum=' + Trim(FilterEdit.Text);
      Filtered := Trim(FilterEdit.Text) <> '';
    finally
      EnableControls;
    end;
  end;
end;

procedure TInvRepList.aUnSetCheckDateExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Снять визирование?', 'Подтвердите визирование', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    DM.rsCA.AppServer.Inv_ProjectSetCheckDateFact(cdsInv_Repid_Project.AsInteger, Null);
    aRefreshe.Execute;
  end;
end;

procedure TInvRepList.aRefresheExecute(Sender: TObject);
var ID : integer;
begin
  ID := cdsInv_Repid_Project.AsInteger;
    with cdsInv_Rep do
    begin
      Close;
      Params.ParamByName('@DateFrom').Value := GetDateAdv(dtFrom.Date, false);
      Params.ParamByName('@DateTo').Value := GetDateAdv(dtTo.Date, true);
      Open;
      Locate('id_Project', ID, []);
    end;

end;

procedure TInvRepList.BitBtn2Click(Sender: TObject);
begin
  aRefreshe.Execute;
end;

procedure TInvRepList.RxSpeedButton5Click(Sender: TObject);
var FrozenColCnt : integer;
    FShowBudjet : boolean;
begin
  FrozenColCnt := RxDBGrid1.FrozenCols;
  if ShowArcProp(RxDBGrid1, FrozenColCnt, FShowBudjet, 'Настройка', false, false) then
  begin
    RxDBGrid1.FrozenCols := 1;
   // EhGridFilter1.DBGrid := RxDBGrid1;
   // SaveStng;
  end;
end;

end.
