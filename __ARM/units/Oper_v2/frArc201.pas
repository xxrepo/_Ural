unit frArc201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, Db, DBClient, ComCtrls, ToolWin, ActnList,
  ImgList, StdCtrls, ExtCtrls, Menus, DBGridEh,
  Registry, foMyFunc, RXCtrls, uBaseGridFilter, uEhGridFilter, uArcSumm,
  Mask, ToolEdit, Clipbrd, uFormAPI_Doc;

type
  TfArc201 = class(TFrame)
    cdsArc201: TClientDataSet;
    dsArc: TDataSource;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;       
    ToolButton4: TToolButton;   
    sep1: TToolButton;
    ToolButton6: TToolButton;
    ActionList1: TActionList;
    aNewWH: TAction;
    aProperty: TAction;
    aRefreshe: TAction;
    aDelete: TAction;
    aNewFin: TAction;
    aNewService: TAction;
    aNewZac: TAction;
    ilImage: TImageList;
    pnDate: TPanel;
    mpGrid: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    aNewZac1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    RxDBGrid1: TDBGridEh;
    RxSpeedButton1: TRxSpeedButton;
    ToolButton8: TToolButton;
    aNewEmpty: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    aGetMi: TAction;
    aCancelSeted: TAction;
    aSetUser: TAction;
    aUnSetUser: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    sep2: TToolButton;
    aSetViza: TAction;
    aUnViza: TAction;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    aBuffAdd: TAction;
    aBuffDel: TAction;
    N20: TMenuItem;
    aBuffDel1: TMenuItem;
    aSetError: TAction;
    aUnSetError: TAction;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    aNewCorHW: TAction;
    aNewCorFin: TAction;
    aNewCorService: TAction;
    aNewCorOffset: TAction;
    pmCor: TPopupMenu;
    sep3: TToolButton;
    aNewCor: TAction;
    N24: TMenuItem;
    N25: TMenuItem;
    aDoChangeOper: TAction;
    N26: TMenuItem;
    aNewCopyOper: TAction;
    N27: TMenuItem;
    N28: TMenuItem;
    StatusBar1: TStatusBar;
    aLCBuffAdd: TAction;
    N16: TMenuItem;
    ToolBar2: TToolBar;
    EhGridFilter1: TEhGridFilter;
    Action1: TAction;
    aGreedToExcel: TAction;
    ToolButton13: TToolButton;
    dtFrom: TDateEdit;
    dtTo: TDateEdit;
    N17: TMenuItem;
    N18: TMenuItem;
    ToolButton3: TToolButton;
    aSelectAll: TAction;
    N29: TMenuItem;
    N30: TMenuItem;
    aSettings: TAction;
    ToolButton5: TToolButton;
    aBeBack: TAction;
    N31: TMenuItem;
    aExportAll: TAction;
    aImport: TAction;
    aExportSelected: TAction;
    ToolButton7: TToolButton;
    aBackToCA: TAction;
    aBackFromCA: TAction;
    N36: TMenuItem;
    aShowArcAnaliz: TAction;
    RxSpeedButton3: TRxSpeedButton;
    aValList: TAction;
    N37: TMenuItem;
    N6: TMenuItem;
    N15: TMenuItem;
    N19: TMenuItem;
    aAccCard: TAction;
    aBalance: TAction;
    aWHRep: TAction;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    aCopySel: TAction;
    RxSpeedButton4: TRxSpeedButton;
    N44: TMenuItem;
    aNewRez: TAction;
    aMakeRez: TAction;
    aMakeRez1: TMenuItem;
    aMakeRez2: TMenuItem;
    N46: TMenuItem;
    aOperByRez: TAction;
    N47: TMenuItem;
    ToolButton12: TToolButton;
    aVizaSelected: TAction;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    aDoc_ShowInv: TAction;
    aDoc_ShowPayIn: TAction;
    aDoc_ShowActCL: TAction;
    aDoc_ShowDAcc: TAction;
    aDoc_ShowFinalAct: TAction;
    aDoc_ShowWarrant: TAction;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
    aDoc_ShowAF: TAction;
    N59: TMenuItem;
    aDoc_ShowWBill: TAction;
    N60: TMenuItem;
    aShowDocList: TAction;
    N61: TMenuItem;
    N62: TMenuItem;
    N3: TMenuItem;
    cdsArc201id_Oper: TAutoIncField;
    cdsArc201DateCreate: TDateTimeField;
    cdsArc201RealDataCreate: TDateTimeField;
    cdsArc201id_LC_Oper: TIntegerField;
    cdsArc201id_old_Oper: TIntegerField;
    cdsArc201OperVid: TIntegerField;
    cdsArc201id_Replicator: TIntegerField;
    cdsArc201id_UserCreator: TIntegerField;
    cdsArc201id_business: TIntegerField;
    cdsArc201DateLocal: TDateTimeField;
    cdsArc201Correct: TBooleanField;
    cdsArc201OperTypeIn: TBooleanField;
    cdsArc201Id_CurrencyOper: TIntegerField;
    cdsArc201Id_CurrencySys: TIntegerField;
    cdsArc201PriceOper: TFloatField;
    cdsArc201SummOper: TFloatField;
    cdsArc201SummSys: TFloatField;
    cdsArc201id_Warehouse: TIntegerField;
    cdsArc201id_Manufact: TIntegerField;
    cdsArc201id_Repr: TIntegerField;
    cdsArc201id_Manufact_Ext: TIntegerField;
    cdsArc201id_Warehouse_Ext: TIntegerField;
    cdsArc201id_Repr_Ex: TIntegerField;
    cdsArc201OpComment: TStringField;
    cdsArc201AmountOper: TFloatField;
    cdsArc201id_Goods: TIntegerField;
    cdsArc201AmountOperReal: TFloatField;
    cdsArc201id_OperWare: TAutoIncField;
    cdsArc201CurrencySysShortName: TStringField;
    cdsArc201CurrencyOperShortName: TStringField;
    cdsArc201SrcName: TStringField;
    cdsArc201ReprName: TStringField;
    cdsArc201ContrAgentName: TStringField;
    cdsArc201id_ContrAgent: TIntegerField;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure aPropertyExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aNewWHExecute(Sender: TObject);
    procedure aNewFinExecute(Sender: TObject);
    procedure dsArcDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure cdsArcOperVidGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure aNewZacExecute(Sender: TObject);
    procedure aNewEmptyExecute(Sender: TObject);
    procedure aGetMiExecute(Sender: TObject);
    procedure aCancelSetedExecute(Sender: TObject);
    procedure aSetUserExecute(Sender: TObject);
    procedure aUnSetUserExecute(Sender: TObject);
    procedure aBuffAddExecute(Sender: TObject);
    procedure aBuffDelExecute(Sender: TObject);
    procedure aUnVizaExecute(Sender: TObject);
    procedure aSetErrorExecute(Sender: TObject);
    procedure aUnSetErrorExecute(Sender: TObject);
    procedure aNewCorHWExecute(Sender: TObject);
    procedure aNewCorFinExecute(Sender: TObject);
    procedure aNewCorOffsetExecute(Sender: TObject);
    procedure aNewCorExecute(Sender: TObject);
    procedure aDoChangeOperExecute(Sender: TObject);
    procedure aNewCopyOperExecute(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure aLCBuffAddExecute(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumnEh);
    procedure cdsArcOperDeltaCrnGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsArcOperRateDeltaCrnGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsArcOperTotalDeltaCrnGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure aGreedToExcelExecute(Sender: TObject);
    procedure EhGridFilter1AddFieldEvent(Sender, AField: TObject;
      var AllowAdd: Boolean);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aSettingsExecute(Sender: TObject);
    procedure aBeBackExecute(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure aBackToCAExecute(Sender: TObject);
    procedure aBackFromCAExecute(Sender: TObject);
    procedure dxDBGridFilterChanged(Sender: TObject; ADataSet: TDataSet;
      const AFilterText: String);
    procedure cdsArc201BeforeOpen(DataSet: TDataSet);
    procedure aShowArcAnalizExecute(Sender: TObject);
    procedure aValListExecute(Sender: TObject);
    procedure RxDBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RxDBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1SelectionChange(Sender: TObject);
    procedure aAccCardExecute(Sender: TObject);
    procedure aBalanceExecute(Sender: TObject);
    procedure aWHRepExecute(Sender: TObject);
    procedure aCopySelExecute(Sender: TObject);
    procedure aMakeRezExecute(Sender: TObject);
    procedure aNewRezExecute(Sender: TObject);
    procedure aOperByRezExecute(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
      IsDown: Boolean);
    procedure RxDBGrid1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure aDoc_ShowInvExecute(Sender: TObject);
    procedure aDoc_ShowPayInExecute(Sender: TObject);
    procedure aDoc_ShowActCLExecute(Sender: TObject);
    procedure aDoc_ShowDAccExecute(Sender: TObject);
    procedure aDoc_ShowFinalActExecute(Sender: TObject);
    procedure aDoc_ShowWarrantExecute(Sender: TObject);
    procedure aDoc_ShowAFExecute(Sender: TObject);
    procedure aDoc_ShowWBillExecute(Sender: TObject);
    procedure aShowDocListExecute(Sender: TObject);
    procedure cdsArc201CalcFields(DataSet: TDataSet);
  private
    FNoRefr : boolean;
    FFuckedCol : integer;
    FReadOnly: boolean;
    Fid_business : Variant;
    FrozenColCnt : integer;
    FShowBudjet: boolean;
    
    procedure Initialize(id_business : Variant; HasVisa : Variant); overload;

    procedure SetUserForOper(id_user: Variant; id_oper: Integer);
    procedure BuffAddExec(ID : integer);

    function DoEditOper(AReadOnly : boolean; id_OperParent: Variant; ACorrect, ACopy : boolean; ADelMode : boolean;
                        var ID : integer; Ais_Mirr : boolean;
                        ARezMode : boolean;
                        AViza : boolean = false;
                        AOperVid : integer = -1) : boolean;
    procedure SetReadOnly(const Value: boolean);
    procedure Setid_business(const Value: Variant);
    procedure SetShowBudjet(const Value: boolean);
    procedure UpdateStatusBarText;
    procedure ShowDoc(ADocProc: TDocProc);
  public
    AEnableLoadArcStng : boolean;
    Fid_OperParent : Variant;
    MayRefreshe : boolean;

    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    procedure Initialize(AParamBlnc : TParamBlnc); overload;

    procedure DisableEditAct;
    procedure ListMode;
    property ReadOnly : boolean read FReadOnly write SetReadOnly default false;
    property id_business : Variant read Fid_business write Setid_business;

    procedure UpdateShowBudjet;

    property ShowBudjet : boolean read FShowBudjet write SetShowBudjet;

    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
    procedure DoCancelMsg(var Msg: TMessage); message xxx_Cancel;
    procedure RefresheInt(id_Oper: integer; aIsMirr : boolean);
    procedure loadStng;
    procedure SaveStng;
  end;

implementation

uses uDM, uFormsAPI_Users, {uFormApi_OperLC,} uBuffSelector, uFormApi_Oper,
  foMyFuncEh, foMyFuncEhExcel, uArcProp, uOperExp, uOperImp, uArcAnaliz,
  uAccCard, uBalance, uMovWH, uPrgForm;

{$R *.DFM}

procedure TfArc201.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);

end;

procedure TfArc201.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aProperty.Execute;
end;

procedure TfArc201.RxDBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfArc201.aPropertyExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr, ARezMode : boolean;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := false;
  Rez := false;
  B := (dsArc.DataSet.FieldByName('id_UserChecker').AsInteger <> DM.IDUser) or (dsArc.DataSet.FieldByName('DTDiff').AsInteger <> 0);
  B := (//(dsArc.DataSet.FieldByName('id_UserChecker').AsInteger <> DM.IDUser) and
        (not dsArc.DataSet.FieldByName('CheckDate').IsNull))
       // or (dsArc.DataSet.FieldByName('DTDiff').AsInteger <> 0)
        ;
  ARezMode := dsArc.DataSet.FieldByName('OperVid').AsInteger = 201;
  Rez := DoEditOper(B, Fid_OperParent, false, false, false, ID, Ais_Mirr, ARezMode);
end;

procedure TfArc201.RefresheInt(id_Oper: integer; aIsMirr : boolean);
var OldRecNo, OldCol, Cnt : integer;
    OldCur : TCursor;
    i : integer;
begin
  if not MayRefreshe or (dsArc.DataSet = DM.cdsLCBuff) or (dsArc.DataSet = nil) then
  begin
    Exit;
  end;
  
  with TClientDataSet(dsArc.DataSet) do
  begin
    THackDBGridEh(RxDBGrid1).BeginLayout;
    OldCol := RxDBGrid1.LeftCol;
    BeginUpdateControl(RxDBGrid1);

    DisableControls;
    OldCur := Screen.Cursor;
    Screen.Cursor := crSQLWait;
    Enabled := false;
    try
      if id_Oper = -1 then
        id_Oper := FieldByName('id_Oper').AsInteger;
      if Active and not IsEmpty then
        OldRecNo := RecNo
      else
        OldRecNo := -1;
      Close;
      
      Params.ParamByName('@DateFrom').AsDateTime := GetDateAdv(dtFrom.Date, false);
      Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(dtTo.Date, true);
       Params.ParamByName('@id_User').Value := DM.IDUser;

      Open;
      RxDBGrid1.SelectedRows.Clear;
      if not Locate('id_Oper', id_Oper, [loCaseInsensitive, loPartialKey]) and (OldRecNo <> -1) then
      begin
        if (OldRecNo <= dsArc.DataSet.RecordCount) then
          RecNo := OldRecNo
        else
          Last;
      end;
    finally
      Screen.Cursor := OldCur;
      THackDBGridEh(RxDBGrid1).EndLayout;
      EnableControls;
      RxDBGrid1.LeftCol := OldCol;
      EndUpdateControl(RxDBGrid1);
      Enabled := true;
    end;
  end;
end;

procedure TfArc201.aRefresheExecute(Sender: TObject);
var ID : integer;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;

  cdsArc201.Close;
  cdsArc201.Open;
  cdsArc201.Locate('id_Oper', ID, []);
end;

procedure TfArc201.aDeleteExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr : boolean;
begin
 // if MessageBox(Handle, 'Удалить операцию?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idNo then
 //   Exit;
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := false;
  B := false;
  Rez := DoEditOper(B, Fid_OperParent, false, false, true, ID, Ais_Mirr, false);

  if Rez then
  begin
    dsArc.DataSet.Delete;
    aRefreshe.Execute;
  end;
end;

procedure TfArc201.aNewWHExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperWare(Handle, AOperParamz);
end;

procedure TfArc201.aNewFinExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := getEmptyOperParamz;
  EditOperFin(Handle, AOperParamz);
end;

constructor TfArc201.Create(AOwner: TCOmponent);
var 
    Year, Month, Day: Word;
    DDD : TDate;

    Reg : TRegistry;
    i : integer;
    Own : TCustomForm;
begin
  inherited;
  aNewRez.Visible := DM.FMayRez;
  aMakeRez.Visible := DM.FMayRez;
  aOperByRez.Visible := DM.FMayRez;

  FNoRefr := false;
  FrozenColCnt := -1;
  
  aNewWH.Visible := DM.CheckUserRights(1, Null);
  aNewFin.Visible := DM.CheckUserRights(2, Null);
  aNewService.Visible := DM.CheckUserRights(3, Null);
  aNewZac.Visible := DM.CheckUserRights(4, Null);

  aNewCorFin.Visible := aNewFin.Visible;
  aNewCorHW.Visible := aNewWH.Visible;
  aNewRez.Visible := DM.CheckUserRights(25, Null);
  aMakeRez.Visible := DM.CheckUserRights(25, Null);
  aNewCorOffset.Visible := aNewZac.Visible;

  Fid_business := Null;
  
  AEnableLoadArcStng := true;
  MayRefreshe := true;
  UpdateShowBudjet;

 // aSetError.Visible := DM.CheckUserRights(5, Null);
 // aUnSetError.Visible := aSetError.Visible;
  aSetUser.Visible := aSetError.Visible;
  aUnSetUser.Visible := aSetError.Visible;


  FFuckedCol := -1;

  Fid_OperParent := Null;
  dtTo.Date := Now;
  dtFrom.Date := Now - 0;//IncMonth(Now, -1);
end;

procedure TfArc201.loadStng;
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
    LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName + VarToStr(Fid_business));

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

destructor TfArc201.Destroy;
begin
  SaveStng;
  inherited;
end;

procedure TfArc201.SaveStng;
var Own : TCustomForm;
    Reg : TRegistry;
    i : integer;
begin
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin
    SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName + VarToStr(Fid_business));
  end;
end;

procedure TfArc201.dsArcDataChange(Sender: TObject; Field: TField);
var IsMy : boolean;
begin
  with dsArc.DataSet do
  begin
    aAccCard.Enabled := not FieldByName('id_Acc').IsNull;
    aBalance.Enabled := not FieldByName('id_ContrAgent').IsNull;
    aWHRep.Enabled := not FieldByName('id_WareHouse').IsNull;

    aMakeRez.Enabled := FieldByName('OperVid').AsInteger in [1, 101];
    aOperByRez.Enabled := FieldByName('OperVid').AsInteger = 201;
    aSetViza.Enabled := (not IsEmpty) and (not FieldByName('Blocked').AsBoolean) and (FieldByName('CheckDate').IsNull) and (FieldByName('OperVid').AsInteger <> 201);

    aVizaSelected.Enabled := RxDBGrid1.SelectedRows.Count >= 1;

    aDoc_ShowInv.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) and not FieldByName('OperTypeIn').AsBoolean;
    aDoc_ShowPayIn.Enabled := (FieldByName('OperVid').AsInteger = 2) and FieldByName('OperTypeIn').AsBoolean;
    aDoc_ShowActCL.Enabled := (FieldByName('OperVid').AsInteger = 4);
    aDoc_ShowDAcc.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) and not FieldByName('OperTypeIn').AsBoolean;
    aDoc_ShowFinalAct.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]);
    aDoc_ShowWarrant.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) and not FieldByName('OperTypeIn').AsBoolean;
    aDoc_ShowAF.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) and not FieldByName('OperTypeIn').AsBoolean;
    aDoc_ShowWBill.Enabled := (FieldByName('OperVid').AsInteger in [1, 201]) and not FieldByName('OperTypeIn').AsBoolean;

    aShowDocList.Enabled := (FieldByName('OperVid').AsInteger > 0)
  end;

  aValList.Enabled := (not dsArc.DataSet.IsEmpty);
  aShowArcAnaliz.Enabled := not dsArc.DataSet.IsEmpty;
  UpdateStatusBarText;
  StatusBar1.Panels[0].Text := 'Всего записей: ' + IntToStr(dsArc.DataSet.RecordCount);

  IsMy := (dsArc.DataSet.FieldByName('id_UserChecker').AsInteger = DM.IDUser);
  IsMy := true;
  aProperty.Enabled := (not dsArc.DataSet.IsEmpty);// and (cdsArcid_UserChecker.AsInteger = DM.IDUser);
  aDelete.Enabled := (not dsArc.DataSet.IsEmpty)
                      and IsMy
                      and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                    {  and (RxDBGrid1.SelectedRows.Count <= 1)};// and (cdsArcDTDiff.AsInteger = 0);

  aGetMi.Enabled := (not dsArc.DataSet.IsEmpty) and dsArc.DataSet.FieldByName('id_UserChecker').IsNull
                    and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                    and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103, 201]);
                    
  aCancelSeted.Enabled := (not dsArc.DataSet.IsEmpty) and (not dsArc.DataSet.FieldByName('id_UserChecker').IsNull) and
                          IsMy
                          and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                          and (RxDBGrid1.SelectedRows.Count <= 1)
                          and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103, 201]);;
  aSetUser.Enabled := (not dsArc.DataSet.IsEmpty) and dsArc.DataSet.FieldByName('id_UserChecker').IsNull
                      and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                      and (RxDBGrid1.SelectedRows.Count <= 1)
                      and (dsArc.DataSet.FieldByName('id_UserChecker').AsInteger = DM.IDUser)
                     { and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103, 201])};
  aUnSetUser.Enabled := (not dsArc.DataSet.IsEmpty) and not dsArc.DataSet.FieldByName('id_UserChecker').IsNull
                        and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                        and (RxDBGrid1.SelectedRows.Count <= 1)
                      {  and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103, 201])};
                
 { if ((Column.Field = dsArc.DataSet.FieldByName('SrcName')) and (not dsArc.DataSet.FieldByName('SrcName').IsNull) and (dsArc.DataSet.FieldByName('SrcID_Main').IsNull)) or // Не проверенный источник
     ((Column.Field = dsArc.DataSet.FieldByName('ReprName')) and (not dsArc.DataSet.FieldByName('ReprName').IsNull) and (dsArc.DataSet.FieldByName('ReprID_Main').IsNull)) or // Не проверенный представитель
     ((Column.Field = dsArc.DataSet.FieldByName('ReprWHName')) and (not dsArc.DataSet.FieldByName('ReprWHName').IsNull) and (dsArc.DataSet.FieldByName('ReprWHID_Main').IsNull)) or // Не проверенный склад
     ((Column.Field = dsArc.DataSet.FieldByName('WareName')) and (not dsArc.DataSet.FieldByName('WareName').IsNull) and (dsArc.DataSet.FieldByName('WareID_Main').IsNull)) // Не проверенный товар
     then
  begin
  end;   }


  aUnViza.Enabled := (not dsArc.DataSet.IsEmpty) and (not dsArc.DataSet.FieldByName('Blocked').AsBoolean)
                //     (IsMy)
                  //    and (RxDBGrid1.SelectedRows.Count <= 1)
                      and (not dsArc.DataSet.FieldByName('CheckDate').IsNull);

  aBuffAdd.Enabled := (not dsArc.DataSet.IsEmpty);
  aBuffDel.Enabled := (not dsArc.DataSet.IsEmpty);
  aLCBuffAdd.Enabled := (not dsArc.DataSet.IsEmpty);

  aSetError.Enabled := (not dsArc.DataSet.IsEmpty) and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                       and (dsArc.DataSet.FieldByName('OperState').AsInteger <> -1)
                       and (IsMy)
                    {   and (RxDBGrid1.SelectedRows.Count <= 1)};
  aUnSetError.Enabled := (not dsArc.DataSet.IsEmpty) and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                       and (dsArc.DataSet.FieldByName('OperState').AsInteger = -1)
                       and (IsMy)
                      { and (RxDBGrid1.SelectedRows.Count <= 1)};

  aNewCor.Enabled := (not dsArc.DataSet.IsEmpty) and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103, 201]);
  aNewCopyOper.Enabled := (not dsArc.DataSet.IsEmpty) and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [0, 1, 2, 3, 4, 101, 102, 103, 201]);
        
  aBackToCA.Enabled := (not dsArc.DataSet.IsEmpty)
                     and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 101])
                     and (not dsArc.DataSet.FieldByName('CheckDate').IsNull)
                     and
                     (dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean and
                     not dsArc.DataSet.FieldByName('id_Repr').IsNull and
                     not dsArc.DataSet.FieldByName('id_Warehouse').IsNull);

  aBackFromCA.Enabled := (not dsArc.DataSet.IsEmpty)
                     and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 101])
                     and (not dsArc.DataSet.FieldByName('CheckDate').IsNull)
                     and
                     (not dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean and
                     not dsArc.DataSet.FieldByName('id_Repr').IsNull and
                     not dsArc.DataSet.FieldByName('id_Warehouse').IsNull);

 { aDoChangeOper.Enabled := (not dsArc.DataSet.IsEmpty) and
                           (dsArc.DataSet.FieldByName('HasChild').AsInteger = 1)
                           and IsMy
                           and (RxDBGrid1.SelectedRows.Count <= 1);   }
end;

procedure TfArc201.RxDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
    S : String;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.IsEmpty then
    Exit;

  if Column.Field = dsArc.DataSet.FieldByName('OperState') then
  begin
    if dsArc.DataSet.FieldByName('HasViza').AsBoolean then
      ImgIndex := 22
    else
    begin
      if dsArc.DataSet.FieldByName('OperState').AsInteger = -1 then
        ImgIndex := 26
      else
        ImgIndex := -1;
    end;
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
  end
  else
    if Column.Field = dsArc.DataSet.FieldByName('OperVidName') then
    begin
      case dsArc.DataSet.FieldByName('OperVid').AsInteger of
        -1 :
        begin
          ImgIndex := 29;
        end;
        0 :
        begin
          ImgIndex := 0;
        end;
        201 :
        begin
          ImgIndex := 14;
        end;
        1, 101 :
        begin
          ImgIndex := 2;
        end;
        2, 102 :
        begin
          ImgIndex := 1;
        end;
        3, 103 :
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
    begin
      TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

      // Красим незаполненные ячейки
      if ((Column.Field = dsArc.DataSet.FieldByName('ContrAgentName')) and
         (dsArc.DataSet.FieldByName('ContrAgentName').IsNull) and
         (not dsArc.DataSet.FieldByName('id_Repr').IsNull or
         not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('BusinessName')) and
         (dsArc.DataSet.FieldByName('BusinessName').IsNull))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('KoeffName')) and
         (dsArc.DataSet.FieldByName('KoeffName').IsNull))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('FormalDistribName')) and
         (dsArc.DataSet.FieldByName('FormalDistribName').IsNull) and (dsArc.DataSet.FieldByName('Koeff').AsInteger <> 0))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('FuncDistribName')) and
         (dsArc.DataSet.FieldByName('FuncDistribName').IsNull) and (dsArc.DataSet.FieldByName('Koeff').AsInteger <> 0))
         or
         ((Column.Field = dsArc.DataSet.FieldByName('ReprName')) and
         (dsArc.DataSet.FieldByName('id_Repr').IsNull) and
         (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull) and
         (not dsArc.DataSet.FieldByName('ReprName').IsNull))
          then
      begin
        TDBGridEh(Sender).Canvas.Brush.Color := clWindow;

        TDBGridEh(Sender).Canvas.Font.Color := clRed;
        TDBGridEh(Sender).Canvas.Font.Style := TDBGridEh(Sender).Canvas.Font.Style + [fsBold];

        TDBGridEh(Sender).Canvas.Brush.Style := bsClear;
        TDBGridEh(Sender).Canvas.Pen.Color := clRed;
        TDBGridEh(Sender).Canvas.Rectangle(Rect.Left + 0, Rect.Top + 0, Rect.Right - 0, Rect.Bottom - 0);
      end;
      if (Column.Field is TNumericField) then
      begin
        R := Rect;
        TDBGridEh(Sender).Canvas.FillRect(R);
        if (not Column.Field.IsNull) and (Column.Field.DisplayText <> '') then
        begin
          S := Trim(FormatFloat('### ### ### ### ##0.00', ABS(Column.Field.AsFloat)));
          if Column.Field.AsFloat < 0 then
            S := '-' + S;
          R.Top := R.Top + 2;
          DrawText(TDBGridEh(Sender).Canvas.Handle, PChar(S), -1, R, DT_RIGHT);
        end;
      end;
    end;
end;

procedure TfArc201.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  ReOrderCDSEh(Column, 'id_Oper');
end;

procedure TfArc201.cdsArcOperVidGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := '';
end;

procedure TfArc201.aNewZacExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperOffset(Handle, AOperParamz);
end;

procedure TfArc201.aNewEmptyExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperEmpty(Handle, AOperParamz);
end;

procedure TfArc201.SetUserForOper(id_user: Variant; id_oper: Integer);
var i : integer;
    SavePlace: TBookmark;
    rez, Err : boolean;
begin
  Rez := false;
  Err := false;
  if (RxDBGrid1.SelectedRows.Count > 0) then
  begin
    with RxDBGrid1.DataSource.DataSet do
    begin
      for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
      begin
        GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
        if ((id_user = Null) and (dsArc.DataSet.FieldByName('id_UserChecker').Value = DM.IDUser)) or
           ((id_user <> Null) and (dsArc.DataSet.FieldByName('id_UserChecker').IsNull)) then
        begin
          if DM.rsCA.AppServer.SetUserForOper(id_user, dsArc.DataSet.FieldByName('id_Oper').AsInteger) = 1 then
            Rez := true
          else
            Err := true;
        end;
      end;
    end;
  end
  else
  begin
    if DM.rsCA.AppServer.SetUserForOper(id_user, id_oper) = 1 then
      Rez := true
    else
      Err := true;
  end;
  if rez then
  begin
    aRefreshe.Execute;
  end;
  if Err then
  begin
    raise Exception.Create('Ошибка!');
  end;
end;

procedure TfArc201.aGetMiExecute(Sender: TObject);
begin
  SetUserForOper(DM.IDUser, dsArc.DataSet.FieldByName('id_Oper').AsInteger);
end;

procedure TfArc201.aCancelSetedExecute(Sender: TObject);
begin
  SetUserForOper(Null, dsArc.DataSet.FieldByName('id_Oper').AsInteger);
end;

procedure TfArc201.aSetUserExecute(Sender: TObject);
var AID:Variant;
    AName:string;
begin
  AID := dsArc.DataSet.FieldByName('id_UserChecker').Value;
  if GetUsersForm(AID, AName, true, false, true) then
  begin
    SetUserForOper(AID, dsArc.DataSet.FieldByName('id_Oper').AsInteger);
  end;
end;

procedure TfArc201.aUnSetUserExecute(Sender: TObject);
begin
  SetUserForOper(Null, dsArc.DataSet.FieldByName('id_Oper').AsInteger);
end;

procedure TfArc201.BuffAddExec(ID : integer);
var i : integer;
begin
  with RxDBGrid1.DataSource.DataSet do
  begin
    if (RxDBGrid1.SelectedRows.Count = 0) and (not dsArc.DataSet.IsEmpty) then
      DM.UnAddOperToBuff(dsArc.DataSet, ID);
    for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
    begin
      GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
      DM.UnAddOperToBuff(dsArc.DataSet, ID);
    end;
  end;
end;

procedure TfArc201.aBuffAddExecute(Sender: TObject);
var ID, i : integer;
    S : String;
begin
  ID := -1;
  if SelectBuff(ID, S) then
  begin
    BuffAddExec(ID);
  end;
end;

procedure TfArc201.aBuffDelExecute(Sender: TObject);
var i : integer;
begin
  with RxDBGrid1.DataSource.DataSet do
  begin
    if (RxDBGrid1.SelectedRows.Count = 0) and (not dsArc.DataSet.IsEmpty) then
      DM.UnDelOperFromBuff(dsArc.DataSet);  
    for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
    begin
      GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
      DM.UnDelOperFromBuff(dsArc.DataSet);
    end;
  end;
end;

procedure TfArc201.aSetErrorExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Пометить операцию как ошибочную?', '', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    if DM.rsCA.AppServer.OP_OperSetOperState_v2(dsArc.DataSet.FieldByName('id_Oper').AsInteger, -1) then
    begin
      aRefreshe.Execute;
      RxDBGrid1.SelectedRows.Clear;
    end
    else
    begin
      MessageBox(Handle, 'Произошла ошибка', 'Произошла ошибка', MB_YESNO + MB_ICONQUESTION);
    end;  
  end;
end;

procedure TfArc201.aUnSetErrorExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Снять пометку "Ошибка"?', 'Подтвердите снятие пометки', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    if DM.rsCA.AppServer.OP_OperSetOperState_v2(dsArc.DataSet.FieldByName('id_Oper').AsInteger, 0) then
    begin
      aRefreshe.Execute;
      RxDBGrid1.SelectedRows.Clear;
    end
    else
    begin
      MessageBox(Handle, 'Ошибка при снятии пометки', 'Произошла ошибка при снятии пометки', MB_YESNO + MB_ICONQUESTION);
    end;  
  end;
end;

procedure TfArc201.aNewCorHWExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.Correct := true;
  EditOperWare(Handle, AOperParamz);
end;

procedure TfArc201.aNewCorFinExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := getEmptyOperParamz;
  AOperParamz.Correct := true;
  EditOperFin(Handle, AOperParamz);
end;

procedure TfArc201.aNewCorOffsetExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.Correct := true;
  EditOperOffset(Handle, AOperParamz);
end;

procedure TfArc201.aNewCorExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr : boolean;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := false;
  B := false;
  Rez := DoEditOper(B, Null, true, true, false, ID, Ais_Mirr, false);
  if Rez then
    RefresheInt(ID, Ais_Mirr)
end;

procedure TfArc201.aDoChangeOperExecute(Sender: TObject);
begin
  DoChangeOper(dsArc.DataSet.FieldByName('id_Oper').AsInteger);
end;

procedure TfArc201.aNewCopyOperExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr, ARezMode : boolean;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := false;
  B := false;
  ARezMode := dsArc.DataSet.FieldByName('OperVid').AsInteger = 201;
  Rez := DoEditOper(B, Fid_OperParent, false, true, false, ID, Ais_Mirr, ARezMode);

//  if Rez then
//    RefresheInt(ID)
end;

procedure TfArc201.Initialize(AParamBlnc: TParamBlnc);
var V : Variant;
begin
  dtFrom.Date := AParamBlnc.DateFrom;
  dtTo.Date := AParamBlnc.DateTo;
  with TClientDataSet(dsArc.DataSet) do
  begin
 //   Close;
    Params.ParamByName('@id_User').Value := DM.IDUser;
    Params.ParamByName('@id_business').Value := AParamBlnc.id_business;
    Params.ParamByName('@HasViza').Value := AParamBlnc.HasViza;

    TClientDataSet(dsArc.DataSet).Params.ParamByName('@DateFrom').AsDateTime := GetDateAdv(dtFrom.Date, false);
    TClientDataSet(dsArc.DataSet).Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(dtTo.Date, true);

    Params.ParamByName('@id_ContrAgent').Value := AParamBlnc.id_ContrAgent;
    Params.ParamByName('@id_CAGroup').Value := AParamBlnc.id_CAGroup;

    Params.ParamByName('@id_Repr').Value := AParamBlnc.id_Repr;
    Params.ParamByName('@id_Warehouse').Value := AParamBlnc.id_Warehouse;
    Params.ParamByName('@id_Acc').Value := AParamBlnc.id_Acc;
    Params.ParamByName('@id_Manufact').Value := AParamBlnc.id_Manufact;

    Params.ParamByName('@Correct').Value := AParamBlnc.Correct;
    Params.ParamByName('@Deleted').Value := AParamBlnc.Deleted;
    Params.ParamByName('@OperVid').Value := AParamBlnc.OperVid;
    Params.ParamByName('@Koeff').Value := AParamBlnc.Koeff;

    Params.ParamByName('@DoUP').Value := AParamBlnc.DoUP;
    Params.ParamByName('@DoDOWN').Value := AParamBlnc.DoDOWN;

 //   Params.ParamByName('@DateFrom').AsDate := Trunc(dtFrom.Date) - 2;
 //   Params.ParamByName('@DateTo').AsDate := Trunc(dtTo.Date) - 2 + 1 ;
    
    if AParamBlnc.id_CAGroup = -13 then
    begin
      Params.ParamByName('@id_CAGroup').Value := Null;
      Params.ParamByName('@CANone').Value := true;
    end;
//    Open;
   // aRefreshe.Execute;
  end;
  id_business := AParamBlnc.id_business;
end;

procedure TfArc201.Initialize(id_business: Variant; HasVisa : Variant);
var i : integer;
begin
  with TClientDataSet(dsArc.DataSet) do
  begin
    Close;
    
    for i := 0 to Params.Count - 1 do
      Params[i].Value := Null;
    Params.ParamByName('@id_business').Value := id_business;
    Params.ParamByName('@HasViza').Value := HasVisa;

    aRefreshe.Execute;
  end;
end;

procedure TfArc201.RxDBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (dsArc.DataSet.IsEmpty) then
    Exit;

  if (dsArc.DataSet.FieldByName('DTDiff').AsInteger <> 0) and
     (not dsArc.DataSet.FieldByName('HasViza').AsBoolean) then
    AFont.Style := AFont.Style + [fsBold];

  if ((Column.Field = dsArc.DataSet.FieldByName('SrcName')) and (not dsArc.DataSet.FieldByName('SrcName').IsNull) and (dsArc.DataSet.FieldByName('SrcID_Main').IsNull)) or // Не проверенный источник
     ((Column.Field = dsArc.DataSet.FieldByName('ReprName')) and (not dsArc.DataSet.FieldByName('ReprName').IsNull) and (dsArc.DataSet.FieldByName('ReprID_Main').IsNull)) or // Не проверенный представитель
//     ((Column.Field = dsArc.DataSet.FieldByName('ReprWHName')) and (not dsArc.DataSet.FieldByName('ReprWHName').IsNull) and (dsArc.DataSet.FieldByName('ReprWHID_Main').IsNull)) or // Не проверенный склад
     ((Column.Field = dsArc.DataSet.FieldByName('WareName')) and (not dsArc.DataSet.FieldByName('WareName').IsNull) and (dsArc.DataSet.FieldByName('WareID_Main').IsNull)) {or} // Не проверенный товар
  {   ((Column.Field = dsArc.DataSet.FieldByName('ReprName')) and
      (dsArc.DataSet.FieldByName('id_Repr').IsNull) and
      (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull) and
       (not dsArc.DataSet.FieldByName('ReprName').IsNull)) }
     then
  begin
    AFont.Color := clRed;
    AFont.Style := AFont.Style + [fsBold];
  end;


  if not (gdFocused in State) then
  begin
     if not (gdSelected in State) then
     begin
       if not MayVized(dsArc.DataSet) then
        Background := $00DBD3FE;
     end
     else
       Background := $0086393F;//$00964147;
  end

{  if not (gdSelected in State) then
  begin
    if not MayVized(dsArc.DataSet) then
      Background := $00DBD3FE;//clRed;
  end;
  if (gdSelected in State) then
  begin
    if gdFocused in State then
      Background := clHighlight
    else
      Background := $0086393F;//$00964147;
  end;  }
end;

procedure TfArc201.aLCBuffAddExecute(Sender: TObject);
begin
  BuffAddExec(-13);
end;

procedure TfArc201.RxDBGrid1CellClick(Column: TColumnEh);
var S : String;
    P : TPoint;
    i, X : integer;
    Row: Longint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(RxDBGrid1).ScreenToClient(P);
  THackGrid(RxDBGrid1).MouseToCell(P.X, P.Y, FFuckedCol, Row);

  UpdateStatusBarText;
end;

procedure TfArc201.cdsArcOperDeltaCrnGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if ((dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 101]) and (not dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean) and ((not dsArc.DataSet.FieldByName('id_Repr').IsNull) or (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull)))
  or (dsArc.DataSet.FieldByName('OperRateDeltaCrn').AsFloat <> 0 )
  or (dsArc.DataSet.FieldByName('Koeff').AsInteger <> 0 )
  then
  begin
    if TFloatField(Sender).AsFloat <> 0 then
      Text := FormatFloat((Sender as TFloatField).DisplayFormat, (Sender as TFloatField).AsFloat);
  end
  else
  begin
    Text := ''
  end;
end;

procedure TfArc201.cdsArcOperRateDeltaCrnGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ((dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 101]) and (not dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean) and ((not dsArc.DataSet.FieldByName('id_Repr').IsNull) or (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull)))
  or (dsArc.DataSet.FieldByName('OperRateDeltaCrn').AsFloat <> 0 )
  or (dsArc.DataSet.FieldByName('Koeff').AsInteger <> 0 )
  then
  begin
    if (Sender as TFloatField).AsFloat <> 0 then
      Text := FormatFloat((Sender as TFloatField).DisplayFormat, (Sender as TFloatField).AsFloat);
  end
  else
  begin
    Text := ''
  end;
end;

procedure TfArc201.cdsArcOperTotalDeltaCrnGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ((dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 101]) and (not dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean) and ((not dsArc.DataSet.FieldByName('id_Repr').IsNull) or (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull)))
  or (dsArc.DataSet.FieldByName('OperRateDeltaCrn').AsFloat <> 0 )
  or (dsArc.DataSet.FieldByName('Koeff').AsInteger <> 0 )
  then
  begin
    if (Sender as TFloatField).AsFloat <> 0 then
      Text := FormatFloat((Sender as TFloatField).DisplayFormat, (Sender as TFloatField).AsFloat);
  end
  else
  begin
    Text := ''
  end;
end;

procedure TfArc201.aGreedToExcelExecute(Sender: TObject);
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

function TfArc201.DoEditOper(AReadOnly: boolean; id_OperParent: Variant;
  ACorrect, ACopy, ADelMode: boolean; var ID : integer; Ais_Mirr : boolean;
  ARezMode : boolean;
  AViza : boolean;
  AOperVid : integer): boolean;
var
    Rez : boolean;
    B, IsMy : boolean;
    AOperParamz : TOperParamz;
begin
  ADelMode := ADelMode and (not dsArc.DataSet.IsEmpty)
                      and IsMy
                      and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                      and (RxDBGrid1.SelectedRows.Count <= 1);// and (cdsArcDTDiff.AsInteger = 0);

  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ReadOnly := AReadOnly or FReadOnly;
  AOperParamz.ID_Oper := ID;
  AOperParamz.is_Mirr := Ais_Mirr;
  AOperParamz.Correct := ACorrect;
  AOperParamz.Copy := ACopy;
  AOperParamz.DelMode := ADelMode;
  AOperParamz.RezMode := ARezMode;
  AOperParamz.Viza := AViza;

  AReadOnly := AReadOnly or FReadOnly;
  IsMy := (dsArc.DataSet.FieldByName('id_UserChecker').AsInteger = DM.IDUser);
  IsMy := true;

//  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Result := false;
  if AOperVid = -1 then
    AOperVid := dsArc.DataSet.FieldByName('OperVid').AsInteger;
  case AOperVid of
    -1 : EditOperCrnCh(Handle, AOperParamz); 
    0 : EditOperEmpty(Handle, AOperParamz);
    1 : EditOperWare(Handle, AOperParamz);
    2 : EditOperFin(Handle, AOperParamz);
    4 : EditOperOffset(Handle, AOperParamz);

    101 : EditOperWare_FFF(Handle, AOperParamz);
    102 : EditOperFin_FFF(Handle, AOperParamz);

    201 : EditOperWare(Handle, AOperParamz);
  end;
end;

procedure TfArc201.DisableEditAct;
begin
  aDelete.Visible := false;

  aNewWH.Visible := false;
  aNewFin.Visible := false;
  aNewService.Visible := false;
  aNewZac.Visible := false;
  aNewZac1.Visible := false;
  aNewEmpty.Visible := false;

  aGetMi.Visible := false;
  aCancelSeted.Visible := false;
  aSetUser.Visible := false;
  aUnSetUser.Visible := false;
  aNewCor.Visible := false;
  aNewCorHW.Visible := false;
  aNewCorFin.Visible := false;
  aNewCorOffset.Visible := false;
  aNewCorService.Visible := false;

  aNewCopyOper.Visible := false;

  aUnSetError.Visible := false;
  aSetError.Visible := false;

  aDoChangeOper.Visible := false;
end;

procedure TfArc201.SetReadOnly(const Value: boolean);
begin
  FReadOnly := Value;
 // RxSpeedButton5.Visible := not ReadOnly;
  RxSpeedButton1.Visible := not ReadOnly;
end;

procedure TfArc201.ListMode;
begin
  DisableEditAct;
  ReadOnly := true;
  Panel1.Visible := false;
  pnDate.Visible := false;
  ToolButton6.Visible := false;

  ToolBar2.Visible := false;

  sep1.Visible := false;
  sep2.Visible := false;
  sep3.Visible := false;
//  sep4.Visible := false;
end;

procedure TfArc201.UpdateShowBudjet;
var i : integer;
begin
  for i := 0 to RxDBGrid1.Columns.Count - 1 do
    if Pos('Бюджет|', RxDBGrid1.Columns[i].Title.Caption) > 0 then
      RxDBGrid1.Columns[i].Visible := ShowBudjet;
end;

procedure TfArc201.EhGridFilter1AddFieldEvent(Sender, AField: TObject;
  var AllowAdd: Boolean);
begin
  if AField <> RxDBGrid1.Columns[1] then
    AllowAdd := true;
end;

procedure TfArc201.aSelectAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectedRows.SelectAll;
end;

procedure TfArc201.aSettingsExecute(Sender: TObject);
begin
  if ShowArcProp(RxDBGrid1, FrozenColCnt, FShowBudjet, '', AEnableLoadArcStng) then
  begin
    EhGridFilter1.DBGrid := RxDBGrid1;
    SaveStng;
  end;
end;

procedure TfArc201.Setid_business(const Value: Variant);
var
    S : String;
    i : integer;
begin
  if (Fid_business <> Value) then
  begin
    if Fid_business <> Null then
      SaveStng;
    Fid_business := Value;
    loadStng;
    TClientDataSet(dsArc.DataSet).Params.ParamByName('@id_business').Value := Value;
  end;
end;

procedure TfArc201.SetShowBudjet(const Value: boolean);
begin
  FShowBudjet := Value;
  upDateShowBudjet
end;

procedure TfArc201.aBeBackExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B : boolean;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Rez := false;
  B := false;
  Rez := DoEditOper(B, Fid_OperParent, true, false, false, ID, true, false);
                      
  if Rez then
    RefresheInt(ID, false)
end;

procedure TfArc201.PopupMenu2Popup(Sender: TObject);
begin
  aExportAll.Enabled := not dsArc.DataSet.IsEmpty;
  aExportSelected.Enabled := (RxDBGrid1.SelectedRows.Count > 0) and not dsArc.DataSet.IsEmpty;
end;

procedure TfArc201.aBackToCAExecute(Sender: TObject);
var ID : integer;
begin
  ID := dsArc.DataSet.fieldByName('id_Oper').AsInteger;

  ShowWizBackToCA(Handle, ID);
end;

procedure TfArc201.aBackFromCAExecute(Sender: TObject);
var ID : integer;
begin
  ID := dsArc.DataSet.fieldByName('id_Oper').AsInteger;

  ShowWizBackFromCA(Handle, ID);
end;

procedure TfArc201.dxDBGridFilterChanged(Sender: TObject; ADataSet: TDataSet;
  const AFilterText: String);
begin
  tag := 0;
end;

procedure TfArc201.DoRefrMsg(var Msg: TMessage);
begin
  if not FNoRefr then
    RefresheInt(Msg.WParam, Msg.LParam = 1);
end;

procedure TfArc201.cdsArc201BeforeOpen(DataSet: TDataSet);
var i, Cnt : integer;
    AParam : TParam;
begin
{  Cnt := 0;
    with cdsArcCnt do
    begin
      Close;
      for i := 0 to Params.Count - 1 do
      begin
        AParam := cdsArc.Params.FindParam(Params[i].Name);
        if AParam <> nil then
          Params[i].Value := AParam.Value;
      end;
      try
        try
          Open;
          Cnt := cdsArcCntCnt.AsInteger;
        except

        end;
        if Cnt >= 1500 then
        begin
          if MessageBox(Handle, PChar('Возвращаемое количество операций слишком велико (' + IntToStr(Cnt) + ' шт.)' + #13 + #10 +
                     'Загрузка такого количество операций существенно замедлит работу системы' + #13 + #10 +
                     'Хотите изменить параметны фильтра или диапазон дат???'), 'Слишком много операций!',
                     MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON1) = IDYES	then
            Abort;
        end;
      finally
        Close;
      end;
    end;    }
end;

procedure TfArc201.aShowArcAnalizExecute(Sender: TObject);
begin
  ShowArcAnaliz(RxDBGrid1);
end;

procedure TfArc201.aValListExecute(Sender: TObject);
var S : String;
    P : TPoint;
    i, X : integer;
    Row: Longint;
begin
  if (FFuckedCol > 0) and (FFuckedCol < RxDBGrid1.Columns.Count) and (RxDBGrid1.Columns[FFuckedCol - 1].Field <> nil) then
    ShowValListDistinct(RxDBGrid1.Columns[FFuckedCol - 1].Field, 'Значения "' + RxDBGrid1.Columns[FFuckedCol - 1].Title.Caption + '"')
end;

procedure TfArc201.RxDBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Row: Longint;
begin
  THackGrid(RxDBGrid1).MouseToCell(X, Y, FFuckedCol, Row);

  UpdateStatusBarText;
end;

procedure TfArc201.UpdateStatusBarText;
begin
  if (FFuckedCol > 0) and (FFuckedCol < RxDBGrid1.Columns.Count) and (RxDBGrid1.Columns[FFuckedCol - 1].Field <> nil) then
    StatusBar1.Panels[1].Text := 'Значение: ' + RxDBGrid1.Columns[FFuckedCol - 1].Field.DisplayText;
end;

procedure TfArc201.RxDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//*
end;

procedure TfArc201.RxDBGrid1SelectionChange(Sender: TObject);
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

procedure TfArc201.aAccCardExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  with dsArc.DataSet do
  begin
    AParamBlnc.id_Acc := FieldByName('id_Acc').AsInteger;
    AParamBlnc.DateFrom := FieldByName('DateCreate').AsDateTime;
    AParamBlnc.DateTo := FieldByName('DateCreate').AsDateTime;
  end;
  ShowAccCard(AParamBlnc);
end;

procedure TfArc201.aBalanceExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  with dsArc.DataSet do
  begin
    AParamBlnc.id_ContrAgent := FieldByName('id_ContrAgent').AsInteger;
    AParamBlnc.DateFrom := FieldByName('DateCreate').AsDateTime;
    AParamBlnc.DateTo := FieldByName('DateCreate').AsDateTime;
  end;
  ShowBalance(AParamBlnc);
end;

procedure TfArc201.aWHRepExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
    ACatObj : TCatObj;
begin
  AParamBlnc := GetEmptyParamBlnc;
  with dsArc.DataSet do
  begin
    AParamBlnc.id_business := FieldByName('id_business').AsInteger;
    AParamBlnc.id_Warehouse := FieldByName('id_Warehouse').AsInteger;
    AParamBlnc.DateFrom := FieldByName('DateCreate').AsDateTime;
    AParamBlnc.DateTo := FieldByName('DateCreate').AsDateTime;   

    AParamBlnc.id_Goods := FieldByName('id_Goods').AsInteger;
  end;
  ShowMovWH(AParamBlnc, true);
end;

procedure TfArc201.aCopySelExecute(Sender: TObject);
begin
  PutStringIntoClipBoard(GridSelectionAsText(RxDBGrid1));
end;

procedure TfArc201.aMakeRezExecute(Sender: TObject);
var
    ID : integer;
    B, Ais_Mirr : boolean;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := false;
  B := false;
  DoEditOper(B, Fid_OperParent, false, true, false, ID, Ais_Mirr, true);
end;

procedure TfArc201.aNewRezExecute(Sender: TObject);
var
    ID : integer;
begin
  ID := -1;
  DoEditOper(false, Fid_OperParent, false, true, false, ID, false, true);
end;

procedure TfArc201.aOperByRezExecute(Sender: TObject);
var
    ID : integer;
    B, Ais_Mirr : boolean;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := false;
  B := false;
  DoEditOper(B, Fid_OperParent, false, false, false, ID, Ais_Mirr, false);
end;

procedure TfArc201.aUnVizaExecute(Sender: TObject);
var ABookmark : TBookmark;
    ID_oper : integer;
begin
  if MessageBox(Handle, 'Снять визирование?', 'Подтвердите снятие визирования', MB_YESNO + MB_ICONWARNING) = idYes then
  begin
    ID_oper := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
    if DM.rsCA.AppServer.OP_OperDelCheckDate_v2(ID_oper) then
    begin
      with RxDBGrid1.DataSource.DataSet do
      begin
        DisableControls;
        try
          ABookmark := GetBookmark;

          First;
          while not Eof do
          begin
            if FieldByName('id_Oper').AsInteger = ID_oper then
            begin
              Edit;
              FieldByName('CheckDate').Clear;
              FieldByName('HasViza').Clear;
              Post;
            end;
            Next;
          end;
        finally
          GotoBookmark(ABookmark);
          EnableControls;
        end;
      end;
   {   aRefreshe.Execute;
      RxDBGrid1.SelectedRows.Clear; }
    end
    else
    begin
      MessageBox(Handle, 'Ошибка при снятии визирования', 'Произошла ошибка при снятии визирования', MB_YESNO + MB_ICONERROR);
    end;
  end;
end;


procedure TfArc201.ToolButton1Click(Sender: TObject);
begin
  aSetViza.Execute;
end;

procedure TfArc201.DoCancelMsg(var Msg: TMessage);
begin
  FNoRefr := false;
end;

procedure TfArc201.RxDBGrid1GetBtnParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarkerEh(Column.Field);
end;

procedure TfArc201.RxDBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  SaveStng;
end;

procedure TfArc201.aDoc_ShowInvExecute(Sender: TObject);
begin
  ShowDoc(ShowInv);
end;

procedure TfArc201.aDoc_ShowPayInExecute(Sender: TObject);
begin
  ShowDoc(ShowPayIn);
end;

procedure TfArc201.aDoc_ShowActCLExecute(Sender: TObject);
begin
  ShowDoc(ShowActCL);
end;

procedure TfArc201.aDoc_ShowDAccExecute(Sender: TObject);
begin
  ShowDoc(ShowDAcc);
end;

procedure TfArc201.aDoc_ShowFinalActExecute(Sender: TObject);
begin
  ShowDoc(ShowFinalAct);
end;

procedure TfArc201.aDoc_ShowWarrantExecute(Sender: TObject);
begin
  ShowDoc(ShowWarrant);
end;

procedure TfArc201.ShowDoc(ADocProc : TDocProc);
var DP : TDocParamz;
begin
  DP := GetEmptyDocParamz;
  DP.ID_Oper := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  ADocProc(Handle, DP, nil, nil)
end;


procedure TfArc201.aDoc_ShowAFExecute(Sender: TObject);
begin
  ShowDoc(ShowAF);
end;

procedure TfArc201.aDoc_ShowWBillExecute(Sender: TObject);
begin
  ShowDoc(ShowWBill);
end;

procedure TfArc201.aShowDocListExecute(Sender: TObject);
begin
  ShowDocList(dsArc.DataSet.FieldByName('id_Oper').AsInteger, Null);
end;

procedure TfArc201.cdsArc201CalcFields(DataSet: TDataSet);
begin
  if (DataSet.FieldByName('OperVid').AsInteger = 1) and (DataSet.FieldByName('OperTotalDeltaCrn').AsFloat <> 0) and (DataSet.FieldByName('CRN_OperSumRez').AsFloat <> 0) then
    DataSet.FieldByName('Rent').Value := 100 * DataSet.FieldByName('OperTotalDeltaCrn').AsFloat/
    abs(DataSet.FieldByName('CRN_OperSumRez').AsFloat)
  else
    DataSet.FieldByName('Rent').Value := Null;
end;

end.
