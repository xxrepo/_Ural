unit frArcLc;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, Db, DBClient, ComCtrls, ToolWin, ActnList,
  ImgList, StdCtrls, ExtCtrls, Menus, DBGridEh,
  Registry, RXCtrls, uBaseGridFilter, uEhGridFilter, Clipbrd, frBsnSelector;

type
  TfArcLc = class(TFrame)
    cdsLcList: TClientDataSet;
    dsLcList: TDataSource;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;       
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ActionList1: TActionList;
    aNewWH: TAction;
    aProperty: TAction;
    aRefreshe: TAction;
    aDelete: TAction;
    aNewFin: TAction;
    aNewService: TAction;
    aNewZac: TAction;
    ilImage: TImageList;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    ToolButton8: TToolButton;
    aNewEmpty: TAction;
    N9: TMenuItem;
    aNewCorHW: TAction;
    aNewCorFin: TAction;
    aNewCorService: TAction;
    aNewCorOffset: TAction;
    pmCor: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem8: TMenuItem;
    RxSpeedButton2: TRxSpeedButton;
    aNewCor: TAction;
    aNewCopyOper: TAction;
    pnDate: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    dtTo: TDateTimePicker;
    dtFrom: TDateTimePicker;
    pmOperFilter: TPopupMenu;
    miWH: TMenuItem;
    miFin: TMenuItem;
    miOffer: TMenuItem;
    miEmpty: TMenuItem;
    pmUser: TPopupMenu;
    miSelf: TMenuItem;
    miNonUser: TMenuItem;
    miSeted: TMenuItem;
    miAllUser: TMenuItem;
    Panel3: TPanel;
    RxSpeedButton8: TRxSpeedButton;
    pmViza: TPopupMenu;
    miViza: TMenuItem;
    miNonViza: TMenuItem;
    miAll: TMenuItem;
    RxSpeedButton10: TRxSpeedButton;
    aSetViza: TAction;
    aUnSetViza: TAction;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    aGreedToExcel: TAction;
    EhGridFilter1: TEhGridFilter;
    aSettings: TAction;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    PopupMenu2: TPopupMenu;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    RxSpeedButton3: TRxSpeedButton;
    aExportAll: TAction;
    aImport: TAction;
    aExportSelected: TAction;
    aGetRep: TAction;
    N17: TMenuItem;
    OpenDialog1: TOpenDialog;
    cdsRep: TClientDataSet;
    aAccCard: TAction;
    aBalance: TAction;
    aWHRep: TAction;
    aSvcRep: TAction;
    mpGrid: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    aNewZac1: TMenuItem;
    N8: TMenuItem;
    N39: TMenuItem;
    N25: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N21: TMenuItem;
    N38: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    MenuItem9: TMenuItem;
    N7: TMenuItem;
    N5: TMenuItem;
    StatusBar1: TStatusBar;
    aCopySel: TAction;
    RxSpeedButton4: TRxSpeedButton;
    aLCBuffAdd: TAction;
    aBuffAdd: TAction;
    aBuffDel: TAction;
    N4: TMenuItem;
    N6: TMenuItem;
    RxDBGrid1: TDBGridEh;
    cdsExtDataDict: TClientDataSet;
    cdsExtDataDictid_Oper_ExtDataNames: TIntegerField;
    cdsExtDataDictid_business: TIntegerField;
    cdsExtDataDictType: TIntegerField;
    cdsExtDataDictNumPrm: TIntegerField;
    cdsExtDataDictParName: TStringField;
    cdsExtDataDictVisible: TBooleanField;
    aNewRez: TAction;
    aMakeRez: TAction;
    aOperByRez: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    cdsLcListid_LC_Oper: TAutoIncField;
    cdsLcListOperVid: TIntegerField;
    cdsLcListid_UserCreator: TIntegerField;
    cdsLcListCreatorFIO: TStringField;
    cdsLcListid_business: TIntegerField;
    cdsLcListBusinessName: TStringField;
    cdsLcListBusinessNum: TStringField;
    cdsLcListDateLocal: TDateTimeField;
    cdsLcListCorrect: TBooleanField;
    cdsLcListOperTypeIn: TBooleanField;
    cdsLcListId_CurrencyOper: TIntegerField;
    cdsLcListCurrencyOperName: TStringField;
    cdsLcListCurrencyOperShortName: TStringField;
    cdsLcListAmountOper: TFloatField;
    cdsLcListAmountOper2: TFloatField;
    cdsLcListPriceOper: TFloatField;
    cdsLcListid_Measure: TIntegerField;
    cdsLcListMeasureName: TStringField;
    cdsLcListId_CurrencySys: TIntegerField;
    cdsLcListCurrencySysName: TStringField;
    cdsLcListCurrencySysShortName: TStringField;
    cdsLcListSummSys: TFloatField;
    cdsLcListid_Acc: TIntegerField;
    cdsLcListid_Warehouse: TIntegerField;
    cdsLcListid_Manufact: TIntegerField;
    cdsLcListSrcName: TStringField;
    cdsLcListid_Repr: TIntegerField;
    cdsLcListid_Acc_Ext: TIntegerField;
    cdsLcListid_Warehouse_Ext: TIntegerField;
    cdsLcListid_Manufact_Ext: TIntegerField;
    cdsLcListReprName: TStringField;
    cdsLcListReprWHName: TStringField;
    cdsLcListid_Goods: TIntegerField;
    cdsLcListWareName: TStringField;
    cdsLcListid_DocType: TIntegerField;
    cdsLcListImp_PayBasic: TStringField;
    cdsLcListAccInv_PayAssignment: TStringField;
    cdsLcListContract: TStringField;
    cdsLcListCheckDate: TDateTimeField;
    cdsLcListID_Main: TIntegerField;
    cdsLcListDateVized: TDateTimeField;
    cdsLcListVized: TBooleanField;
    cdsLcListOpComment: TStringField;
    cdsLcListDig1: TFloatField;
    cdsLcListDig2: TFloatField;
    cdsLcListDig3: TFloatField;
    cdsLcListDig4: TFloatField;
    cdsLcListDig5: TFloatField;
    cdsLcListDig6: TFloatField;
    cdsLcListDig7: TFloatField;
    cdsLcListDig8: TFloatField;
    cdsLcListDig9: TFloatField;
    cdsLcListDig10: TFloatField;
    cdsLcListDig11: TFloatField;
    cdsLcListDig12: TFloatField;
    cdsLcListDig13: TFloatField;
    cdsLcListDig14: TFloatField;
    cdsLcListDig15: TFloatField;
    cdsLcListStr1: TStringField;
    cdsLcListStr2: TStringField;
    cdsLcListStr3: TStringField;
    cdsLcListStr4: TStringField;
    cdsLcListStr5: TStringField;
    cdsLcListStr6: TStringField;
    cdsLcListStr7: TStringField;
    cdsLcListStr8: TStringField;
    cdsLcListStr9: TStringField;
    cdsLcListStr10: TStringField;
    cdsLcListStr11: TStringField;
    cdsLcListStr12: TStringField;
    cdsLcListStr13: TStringField;
    cdsLcListStr14: TStringField;
    cdsLcListStr15: TStringField;
    cdsLcListKoeff: TIntegerField;
    cdsLcListKoeffName: TStringField;
    cdsLcListis_Mirr: TBooleanField;
    cdsLcListid_FormalDistrib: TIntegerField;
    cdsLcListFormalDistribName: TStringField;
    cdsLcListid_FuncDistrib: TIntegerField;
    cdsLcListFuncDistribName: TStringField;
    cdsLcListSended: TBooleanField;
    cdsLcListSummOper: TFloatField;
    cdsLcListTypeName: TStringField;
    fBsnSelector1: TfBsnSelector;
    N3: TMenuItem;
    cdsLcListid_MainS: TStringField;
    miRez: TMenuItem;
    cdsLcListHasViza: TBooleanField;
    cdsLcListid_ContrAgent: TIntegerField;
    cdsLcListContrAgentName: TStringField;
    cdsLcListid_CAGroup: TIntegerField;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure aPropertyExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aNewWHExecute(Sender: TObject);
    procedure aNewFinExecute(Sender: TObject);
    procedure dsLcListDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure cdsLcListOperVidGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure aNewZacExecute(Sender: TObject);
    procedure aNewEmptyExecute(Sender: TObject);
    procedure aNewCorHWExecute(Sender: TObject);
    procedure aNewCorFinExecute(Sender: TObject);
    procedure aNewCorOffsetExecute(Sender: TObject);
    procedure aNewCorExecute(Sender: TObject);
    procedure aNewCopyOperExecute(Sender: TObject);
    procedure miOfferClick(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumnEh);
    procedure aSetVizaExecute(Sender: TObject);
    procedure aUnSetVizaExecute(Sender: TObject);
    procedure aGreedToExcelExecute(Sender: TObject);
    procedure aSettingsExecute(Sender: TObject);
    procedure cdsLcListID_MainGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure aExportAllExecute(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure aExportSelectedExecute(Sender: TObject);
    procedure aImportExecute(Sender: TObject);
    procedure aGetRepExecute(Sender: TObject);
    procedure RxDBGrid1SelectionChange(Sender: TObject);
    procedure aCopySelExecute(Sender: TObject);
    procedure aLCBuffAddExecute(Sender: TObject);
    procedure aBuffAddExecute(Sender: TObject);
    procedure aBuffDelExecute(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure aNewRezExecute(Sender: TObject);
    procedure aMakeRezExecute(Sender: TObject);
    procedure aOperByRezExecute(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure cdsLcListCalcFields(DataSet: TDataSet);
  private
    FFuckedCol, FrozenColCnt : integer;
    Fid_business, Fid_business2 : Variant;
    
    procedure RemakeFilter;
    procedure ReColorFilter;
    procedure BuffAddExec(ID: integer);
    procedure Setid_business(const Value: Variant);
    procedure loadStng;
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(id_business : Variant);
    procedure RefreshInt(ID: integer);
  end;

implementation

uses foMyFunc, uDM, uFormApi_OperLC, foMyFuncEh, foMyFuncEhExcel, uArcProp,
  uOperImp_LC, uOperExp_LC;

{$R *.DFM}
procedure TfArcLc.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);

end;

procedure TfArcLc.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aProperty.Execute;
end;

procedure TfArcLc.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;

  if (Column.Field is TBooleanField) then
  begin
    if Column.Field.AsBoolean then
      Style := DFCS_CHECKED
    else
      Style := DFCS_BUTTONCHECK;

    R := Rect;
    cbSize := 15;
    if R.Bottom - R.Top > cbSize then
    begin
      R.Top := R.Top + (R.Bottom - R.Top - cbSize) div 2;
      R.Bottom := R.Top + cbSize;
    end;
    if R.Right - R.Left < cbSize then
    begin
      R.Right := R.Left + cbSize;
    end;

    if gdSelected in State then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clHighlight;
      TDBGrid(Sender).Canvas.FillRect(Rect);
    end;
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, Style);
  end
  else
  begin
  {  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').AsBoolean then
    begin
      (Sender as TDBGrid).Canvas.Font.Color := clGray;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;   }

    if Column.Field.FieldName = 'OperVid' then
    begin
      case Column.Field.AsInteger of
        1 :
        begin
          ImgIndex := 0;
        end;
        2 :
        begin
          ImgIndex := 1;
        end;
        3 :
        begin
          ImgIndex := 3;
        end;
        else
          ImgIndex := -1;
      end;
      ilImage.Draw(TDBGrid(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
    end
    else
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfArcLc.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);

end;

procedure TfArcLc.aPropertyExecute(Sender: TObject);
var
    ID : integer;
    Rez, AIs_mirr : boolean;
begin
  ID := cdsLcListid_LC_Oper.AsInteger;
  AIs_mirr := cdsLcListis_Mirr.AsBoolean;
  Rez := false;
  case cdsLcListOperVid.AsInteger of
    0 : Rez := EditOperEmptyLC(ID, not cdsLcList.FieldByName('CheckDate').IsNull);
    1 : Rez := EditOperWareLC(ID, not cdsLcList.FieldByName('CheckDate').IsNull);
    2 : Rez := EditOperFinLC(ID, not cdsLcList.FieldByName('CheckDate').IsNull);
    4 : Rez := EditOperOffsetLC(ID, not cdsLcList.FieldByName('CheckDate').IsNull);
    201 : Rez := EditOperWareLC(ID, not cdsLcList.FieldByName('CheckDate').IsNull, false, false, AIs_mirr, true);
  end;
  
  if Rez then
    with cdsLcList do
    begin
    try
      DisableControls;
      Close;
      Open;
      Locate('id_LC_Oper', ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfArcLc.aRefresheExecute(Sender: TObject);
var id_LC_Oper : integer;
begin
  RefreshInt(-1);
end;

procedure TfArcLc.RefreshInt(ID: integer);
var id_LC_Oper : integer;
begin
  ReColorFilter;
  with cdsLcList do
  begin
    DisableControls;
    try
      if ID = -1 then
        id_LC_Oper := FieldByName('id_LC_Oper').AsInteger
      else
        id_LC_Oper := ID;
      Close;

      Params.ParamByName('@DateFrom').AsDateTime := GetDateAdv(dtFrom.Date, false);
      Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(dtTo.Date, true);
      Params.ParamByName('@id_business').Value := Fid_business;
      
      Open;
      Locate('id_LC_Oper', id_LC_Oper, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfArcLc.aDeleteExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Удалить операцию?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    if DM.rsCA.AppServer.LC_OP_DEL(cdsLcListid_LC_Oper.AsInteger) then
    begin
      cdsLcList.Delete;
      aRefreshe.Execute;
    end
    else
    begin
      MessageBox(Handle, 'Ошибка при удалении', 'Произошла ошибка при удалении операции', MB_YESNO + MB_ICONQUESTION);
    end;
  end;
end;

procedure TfArcLc.aNewWHExecute(Sender: TObject);
var
    ID : integer;
begin
  ID := -1;
  if EditOperWareLC(ID) then
    with cdsLcList do
    begin
    try
      DisableControls;
      Close;
      Open;
      Locate('id_LC_Oper', ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfArcLc.aNewFinExecute(Sender: TObject);
var
    ID : integer;
begin
  ID := -1;
  if EditOperFinLC(ID) then
    with cdsLcList do
    begin
    try
      DisableControls;
      Close;
      Open;
      Locate('id_LC_Oper', ID, []);
    finally
      EnableControls;
    end;
  end;
end;

constructor TfArcLc.Create(AOwner: TCOmponent);
var 
    Year, Month, Day: Word;
    DDD : TDate;
    Reg : TRegistry;
    i : integer;
begin
  inherited;
  Fid_business := Null;
  aNewWH.Visible := DM.CheckUserRights(1, Null);
  aNewFin.Visible := DM.CheckUserRights(2, Null);
  aNewService.Visible := DM.CheckUserRights(3, Null);
  aNewZac.Visible := DM.CheckUserRights(4, Null);


  if FrozenColCnt > -1 then
    RxDBGrid1.FrozenCols := FrozenColCnt;

  if Owner is TCustomForm then
  begin
    LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).Name + '\' + ClassName);
  end;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(SRegPath + '\' + TForm(Owner).Name + '\pmOperFilter', false) then
    begin
      with pmOperFilter do
      begin
        for i := 0 to Items.Count - 1 do
        begin
            if Reg.ValueExists(Items[i].Name) then
              Items[i].Checked := Reg.ReadBool(Items[i].Name);
        end;
      end;
      with pmUser do
      begin
        for i := 0 to Items.Count - 1 do
        begin
            if Reg.ValueExists(Items[i].Name) then
              Items[i].Checked := Reg.ReadBool(Items[i].Name);
        end;
      end;

      with pmViza do
      begin
        for i := 0 to Items.Count - 1 do
        begin
            if Reg.ValueExists(Items[i].Name) then
              Items[i].Checked := Reg.ReadBool(Items[i].Name);
        end;
      end;

    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
 { DecodeDate(Now, Year, Month, Day);
  dtFrom.Date := EncodeDate(Year, Month, 1);
  DDD := IncMonth(Now, 1);
  DecodeDate(DDD, Year, Month, Day);
  dtTo.Date := EncodeDate(Year, Month, 1) - 1;    }
  dtFrom.Date := Now - 7;
  dtTo.Date := Now;
  dtFrom.Checked := false;
  dtTo.Checked := false;

end;

destructor TfArcLc.Destroy;
var
    Reg : TRegistry;
    i : integer;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(SRegPath + '\' + TForm(Owner).Name + '\pmOperFilter', true) then
    begin
      with pmOperFilter do
      begin
        for i := 0 to Items.Count - 1 do
        begin
          Reg.WriteBool(Items[i].Name, Items[i].Checked)
        end;
      end;
      
      with pmUser do
      begin
        for i := 0 to Items.Count - 1 do
        begin
          Reg.WriteBool(Items[i].Name, Items[i].Checked)
        end;
      end;
      with pmViza do
      begin
        for i := 0 to Items.Count - 1 do
        begin
          Reg.WriteBool(Items[i].Name, Items[i].Checked)
        end;
      end;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;

  if Owner is TCustomForm then
  begin
    SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).Name + '\' + ClassName);
  end;
  inherited;

end;

procedure TfArcLc.Initialize(id_business: Variant);
begin
  Setid_business(id_business);
  with cdsLcList do
  begin
    Close;
    Params.ParamByName('@id_business').Value := Fid_business;
    Params.ParamByName('@id_user').Value := DM.IDUser;
    aRefreshe.Execute;
  end;

//  aSetViza.Visible := DM.CheckUserRights(5, id_business);
//  aUnSetViza.Visible := DM.CheckUserRights(5, id_business);
  RemakeFilter;
end;

procedure TfArcLc.dsLcListDataChange(Sender: TObject; Field: TField);
begin
  with cdsLcList do
  begin
    aMakeRez.Enabled := FieldByName('OperVid').AsInteger in [1, 101];
    aOperByRez.Enabled := FieldByName('OperVid').AsInteger = 201;
  end;

  if (FFuckedCol > 0) and (FFuckedCol < RxDBGrid1.Columns.Count) and (RxDBGrid1.Columns[FFuckedCol - 1].Field <> nil) then
    StatusBar1.Panels[1].Text := 'Значение: ' + RxDBGrid1.Columns[FFuckedCol - 1].Field.DisplayText;
  StatusBar1.Panels[0].Text := 'Всего записей: ' + IntToStr(dsLcList.DataSet.RecordCount);

  aProperty.Enabled := (not cdsLcList.IsEmpty);// and (not cdsLcListSended.AsBoolean);
  aDelete.Enabled := (not cdsLcList.IsEmpty)
                      and (not cdsLcListSended.AsBoolean)
                      and (cdsLcList.FieldByName('CheckDate').IsNull);;

  aNewCor.Enabled := (not cdsLcList.IsEmpty) and (cdsLcListOperVid.AsInteger in [1, 2, 3, 4])
                     and (cdsLcList.FieldByName('Sended').AsBoolean);
  aNewCopyOper.Enabled := (not cdsLcList.IsEmpty) and (cdsLcList.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 201]);

  aSetViza.Enabled := (not cdsLcList.IsEmpty)
                       and (not cdsLcList.FieldByName('Sended').AsBoolean)
                       and (cdsLcList.FieldByName('CheckDate').IsNull);
  aUnSetViza.Enabled := (not cdsLcList.IsEmpty)
                       and (not cdsLcList.FieldByName('Sended').AsBoolean)
                       and (not cdsLcList.FieldByName('CheckDate').IsNull);
end;

procedure TfArcLc.RxDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
    ImgIndex : integer;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.IsEmpty then
    Exit;

  if not (Sender as TDBGridEh).DataSource.DataSet.FieldByName('Sended').AsBoolean then
    TDBGridEh(Sender).Canvas.Font.Style := TDBGridEh(Sender).Canvas.Font.Style + [fsBold];
  if Column.Field = (Sender as TDBGridEh).DataSource.DataSet.FieldByName('HasViza') then
  begin
    if not (Sender as TDBGridEh).DataSource.DataSet.FieldByName('CheckDate').IsNull then
      ImgIndex := 23
    else
      ImgIndex := -1;

    TDBGridEh(Sender).Canvas.FillRect(Rect);
    ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
  end
  else
  if Column.Field = cdsLcListOperVid then
  begin
    case Column.Field.AsInteger of
      0 :
      begin
        ImgIndex := 0;
      end;
      201 :
      begin
        ImgIndex := 14;
      end;
      1 :
      begin
        ImgIndex := 2;
      end;
      2 :
      begin
        ImgIndex := 1;
      end;
      3 :
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
    (Sender as TDBGridEh).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfArcLc.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  ReOrderCDSEh(Column, 'id_LC_Oper');
end;

procedure TfArcLc.cdsLcListOperVidGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := '';
end;

procedure TfArcLc.Setid_business(const Value: Variant);
var
    S : String;
    i : integer;
begin
  if (Fid_business <> Value) then
  begin
    fBsnSelector1.ID := Value;
    Fid_business := Value;
    Fid_business2 := Fid_business;
    with cdsExtDataDict do
    begin
      Close;
      Params.ParamByName('@id_business').Value := Fid_business;
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
  loadStng;
end;


procedure TfArcLc.loadStng;
var 
    Year, Month, Day: Word;
    DDD : TDate;

    Reg : TRegistry;
    i : integer;
    Own : TCustomForm;
begin
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin                               
    LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName);

    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(SRegPath + '\' + TForm(Own).ClassName + '\pmOperFilter', false) then
      begin
        if Reg.ValueExists('FrozenColCnt') then
          FrozenColCnt := Reg.ReadInteger('FrozenColCnt');
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  if FrozenColCnt > -1 then
  begin
  {  if FrozenColCnt > RxDBGrid1.VisibleColCount then
          FrozenColCnt := RxDBGrid1.VisibleColCount   }
  end
  else
    FrozenColCnt := 0;   

  RxDBGrid1.FrozenCols := FrozenColCnt;
end;

procedure TfArcLc.aNewZacExecute(Sender: TObject);
var
    ID : integer;
begin
  ID := -1;
  if EditOperOffsetLC(ID) then
    with cdsLcList do
    begin
    try
      DisableControls;
      Close;
      Open;
      Locate('id_LC_Oper', ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfArcLc.aNewEmptyExecute(Sender: TObject);
var
    ID : integer;
begin
  ID := -1;
  if EditOperEmptyLC(ID) then
    with cdsLcList do
    begin
    try
      DisableControls;
      Close;
      Open;
      Locate('id_LC_Oper', ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfArcLc.aNewCorHWExecute(Sender: TObject);
var
    ID : integer;
begin
  ID := -1;
  if EditOperWareLC(ID, false, true) then
    with cdsLcList do
    begin
    try
      DisableControls;
      Close;
      Open;
      Locate('id_LC_Oper', ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfArcLc.aNewCorFinExecute(Sender: TObject);
var
    ID : integer;
begin
  ID := -1;
  if EditOperFinLC(ID, false, true) then
    with cdsLcList do
    begin
    try
      DisableControls;
      Close;
      Open;
      Locate('id_LC_Oper', ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfArcLc.aNewCorOffsetExecute(Sender: TObject);
var
    ID : integer;
begin
  ID := -1;
  if EditOperOffsetLC(ID, false, true) then
    with cdsLcList do
    begin
    try
      DisableControls;
      Close;
      Open;
      Locate('id_LC_Oper', ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfArcLc.aNewCorExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
begin
  ID := cdsLcListid_LC_Oper.AsInteger;
  Rez := false;
  case cdsLcListOperVid.AsInteger of
    1 : Rez := EditOperWareLC(ID, false, true);
    2 : Rez := EditOperFinLC(ID, false, true);
    4 : Rez := EditOperOffsetLC(ID, false, true);
    201 : Rez := EditOperWareLC(ID, false, true, false, true);
  end;
  
  if Rez then
    with cdsLcList do
    begin
    try
      DisableControls;
      Close;
      Open;
      Locate('id_LC_Oper', ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfArcLc.aNewCopyOperExecute(Sender: TObject);
var
    ID : integer;
    Rez, AIs_mirr : boolean;
begin
  ID := cdsLcListid_LC_Oper.AsInteger;
  AIs_mirr := cdsLcListis_Mirr.AsBoolean;
  Rez := false;
  case cdsLcListOperVid.AsInteger of
    1 : Rez := EditOperWareLC(ID, false, false, true, AIs_mirr);
    2 : Rez := EditOperFinLC(ID, false, false, true);
    4 : Rez := EditOperOffsetLC(ID, false, false, true);
    201 : Rez := EditOperWareLC(ID, false, false, true, AIs_mirr, true);
  end;
  
  if Rez then
    with cdsLcList do
    begin
    try
      DisableControls;
      Close;
      Open;
      Locate('id_LC_Oper', ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfArcLc.miOfferClick(Sender: TObject);
begin
  if (Sender as TMenuItem).RadioItem then
    (Sender as TMenuItem).Checked := true
  else
    (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
  RemakeFilter;
  ReColorFilter;
end;

procedure TfArcLc.RemakeFilter;
begin
  with dsLcList.DataSet do
  begin
    DisableControls;
    try
      Filter := '(1=1)';
      if not miWH.Checked then
        Filter := Filter + ' AND (OperVid<>1)';
      if not miFin.Checked then
        Filter := Filter + ' AND (OperVid<>2)';
      if not miOffer.Checked then
        Filter := Filter + ' AND (OperVid<>4)';
      if not miEmpty.Checked then
        Filter := Filter + ' AND (OperVid<>0)';
      if not miRez.Checked then
        Filter := Filter + ' AND (OperVid<>201)';

      if miSelf.Checked then
        Filter := Filter + ' AND (id_UserChecker=' + VarToStr(DM.IDUser) + ')';
      if miNonUser.Checked then
        Filter := Filter + ' AND (id_UserChecker IS NULL)';
      if miSeted.Checked then
        Filter := Filter + ' AND (id_UserChecker IS NOT NULL)';
        
      if miViza.Checked then
        Filter := Filter + ' AND (CheckDate IS NOT NULL OR OperVid=201)';
      if miNonViza.Checked then
        Filter := Filter + ' AND (CheckDate IS NULL OR OperVid=201)';
    finally
      Filtered := true;
      EnableControls;
    end;
  end;
end;

procedure TfArcLc.RxDBGrid1CellClick(Column: TColumnEh);
var S : String;
    P : TPoint;
    i, X : integer;
    Row: Longint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(RxDBGrid1).ScreenToClient(P);
  THackGrid(RxDBGrid1).MouseToCell(P.X, P.Y, FFuckedCol, Row);

  if (FFuckedCol > 0) and (FFuckedCol < RxDBGrid1.Columns.Count) and (RxDBGrid1.Columns[FFuckedCol - 1].Field <> nil) then
    StatusBar1.Panels[1].Text := 'Значение: ' + RxDBGrid1.Columns[FFuckedCol - 1].Field.DisplayText;
end;

procedure TfArcLc.aSetVizaExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Завизировать операцию?', 'Подтвердите визирование', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    if DM.rsCA.AppServer.LC_OP_OperSetCheckDate(dsLcList.DataSet.FieldByName('id_LC_Oper').AsInteger) then
    begin
      aRefreshe.Execute;
      {with dsLcList.DataSet do
      begin
        Edit;
        FieldByName('CheckDate').Value := Date;
        Post;
      end;  }
    end
    else
    begin
      MessageBox(Handle, 'Ошибка при визировании', 'Произошла ошибка при визировании операции', MB_YESNO + MB_ICONQUESTION);
    end;  
  end;
end;

procedure TfArcLc.aUnSetVizaExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Снять визирование?', 'Подтвердите снятие визирования', MB_YESNO + MB_ICONWARNING) = idYes then
  begin
    if DM.rsCA.AppServer.LC_OP_OperDelCheckDate(dsLcList.DataSet.FieldByName('id_LC_Oper').AsInteger) then
    begin
      with dsLcList.DataSet do
      begin
        Edit;
        FieldByName('CheckDate').Value := Null;
        Post;
      end;
    end
    else
    begin
      MessageBox(Handle, 'Ошибка при снятии визирования', 'Произошла ошибка при снятии визирования', MB_YESNO + MB_ICONERROR);
    end;  
  end;
end;

procedure TfArcLc.ReColorFilter;
var i : integer;
begin
  RxSpeedButton8.Font.Color := clWindowText;
  RxSpeedButton8.Font.Style := [];
  for i := 0 to pmOperFilter.Items.Count - 1 do
    if not pmOperFilter.Items[i].Checked then
    begin
      RxSpeedButton8.Font.Color := clRed;
  //    RxSpeedButton8.Font.Style := [fsBold];
      Break;
    end;
  if not miAll.Checked then
  begin
    RxSpeedButton10.Font.Color := clRed;
  //  RxSpeedButton10.Font.Style := [fsBold];
  end
  else
  begin
    RxSpeedButton10.Font.Color := clWindowText;
 //   RxSpeedButton10.Font.Style := [];
  end;
end;

procedure TfArcLc.aGreedToExcelExecute(Sender: TObject);
begin
  Enabled := false;
  aGreedToExcel.Enabled := false;
  Repaint;
  try
    GreedToExcel(RxDBGrid1, 'Архив операций')
  finally
    Enabled := true;
    aGreedToExcel.Enabled := true;
  end;
end;

procedure TfArcLc.aSettingsExecute(Sender: TObject);
var B : boolean;
    X : integer;
begin
  X := RxDBGrid1.FrozenCols;
  ShowArcProp(RxDBGrid1, X, B, '', false, false);
end;

procedure TfArcLc.cdsLcListID_MainGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := cdsLcListid_LC_Oper.AsString;
  if not cdsLcListID_Main.IsNull then
    Text := Text + '-' + cdsLcListID_Main.AsString;

end;

procedure TfArcLc.aExportAllExecute(Sender: TObject);
begin
  ShowWHExp_LC(RxDBGrid1, false);
end;

procedure TfArcLc.PopupMenu2Popup(Sender: TObject);
begin
  aExportAll.Enabled := not dsLcList.DataSet.IsEmpty;
  aExportSelected.Enabled := (RxDBGrid1.SelectedRows.Count > 0) and not dsLcList.DataSet.IsEmpty;
end;

procedure TfArcLc.aExportSelectedExecute(Sender: TObject);
begin
  ShowWHExp_LC(RxDBGrid1, true);
end;

procedure TfArcLc.aImportExecute(Sender: TObject);
begin
  ShowOperImp_LC(Null);
end;

procedure TfArcLc.aGetRepExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    with cdsRep do
    begin
      LoadFromFile(OpenDialog1.FileName);
      First;
      while not Eof do
      begin
        DM.rsCA.AppServer.ExpSetID(FieldByName('id_Oper').Value, FieldByName('id_LC_Oper').Value);
        Next;
      end;
    end;
  end;
  aRefreshe.Execute;
end;

procedure TfArcLc.RxDBGrid1SelectionChange(Sender: TObject);
var V : Variant;
    S : String;
begin
  V := GridSelectionSumm(RxDBGrid1, true);
  if V = Null then
    S := ''
  else
    S := 'Сумма: ' + FormatFloat('0.##', V);
  StatusBar1.Panels[2].Text := S;
end;

procedure TfArcLc.aCopySelExecute(Sender: TObject);
begin
  PutStringIntoClipBoard(GridSelectionAsText(RxDBGrid1));
end;

procedure TfArcLc.BuffAddExec(ID : integer);
var i : integer;
begin
 { with RxDBGrid1.DataSource.DataSet do
  begin
    if (RxDBGrid1.SelectedRows.Count = 0) and (not dsLcList.DataSet.IsEmpty) then
      DM.UnAddOperToBuff(dsLcList.DataSet, ID);
    for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
    begin
      GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
      DM.UnAddOperToBuff(dsLcList.DataSet, ID);
    end;
  end;   }
end;

procedure TfArcLc.aLCBuffAddExecute(Sender: TObject);
begin
  BuffAddExec(-13);
end;

procedure TfArcLc.aBuffAddExecute(Sender: TObject);
var ID, i : integer;
    S : String;
begin
 { ID := -1;
  if SelectBuff(ID, S) then
  begin
    BuffAddExec(ID);
  end;     }
end;

procedure TfArcLc.aBuffDelExecute(Sender: TObject);
var i : integer;
begin
{ with RxDBGrid1.DataSource.DataSet do
  begin
    if (RxDBGrid1.SelectedRows.Count = 0) and (not dsLcList.DataSet.IsEmpty) then
      DM.UnDelOperFromBuff(dsLcList.DataSet);
    for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
    begin
      GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
      DM.UnDelOperFromBuff(dsLcList.DataSet);
    end;
  end;}
end;

procedure TfArcLc.RxDBGrid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
{  if not (gdFocused in State) then
  begin
     if not (gdSelected in State) then
     begin
       if not MayVized(dsLcList.DataSet) then
        Background := $00DBD3FE;
     end
     else
       Background := $0086393F;//$00964147;
  end     }
end;

procedure TfArcLc.aNewRezExecute(Sender: TObject);
var Rez : boolean;
    ID : integer;
begin
  ID := -1;
  Rez := EditOperWareLC(ID, false, false, false, false, true);
  if Rez then
    with cdsLcList do
    begin
    try
      DisableControls;
      Close;
      Open;
      Locate('id_LC_Oper', ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfArcLc.aMakeRezExecute(Sender: TObject);
var
    ID : integer;
    Ais_Mirr, Rez : boolean;
begin
  ID := dsLcList.DataSet.FieldByName('id_LC_Oper').AsInteger;
  Ais_Mirr := dsLcList.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := EditOperWareLC(ID, false, false, true, Ais_Mirr, true);
  if Rez then
    with cdsLcList do
    begin
    try
      DisableControls;
      Close;
      Open;
      Locate('id_LC_Oper', ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfArcLc.aOperByRezExecute(Sender: TObject);
var
    ID : integer;
    Ais_Mirr, Rez : boolean;
begin
  ID := dsLcList.DataSet.FieldByName('id_LC_Oper').AsInteger;
  Ais_Mirr := dsLcList.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := EditOperWareLC(ID, false, false, true, Ais_Mirr, false);
  if Rez then
    with cdsLcList do
    begin
    try
      DisableControls;
      Close;
      Open;
      Locate('id_LC_Oper', ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfArcLc.fBsnSelector1Button1Click(Sender: TObject);
var OldID : Variant;
begin
  OldID := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if OldID <> fBsnSelector1.ID then
  begin
    dsLcList.DataSet.Close;
    Setid_business(fBsnSelector1.ID);
//    GetObjArc;
  end;
end;

procedure TfArcLc.cdsLcListCalcFields(DataSet: TDataSet);
begin
  cdsLcListid_MainS.AsString := cdsLcListid_LC_Oper.AsString;
  if not cdsLcListID_Main.IsNull then
    cdsLcListid_MainS.AsString := cdsLcListid_MainS.AsString + '-' + cdsLcListID_Main.AsString;
  cdsLcListHasViza.AsBoolean := not cdsLcListCheckDate.IsNull;
end;

end.
