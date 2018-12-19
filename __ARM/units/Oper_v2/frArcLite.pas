unit frArcLite;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXDBCtrl, Db, DBClient, ComCtrls, ToolWin, ActnList,
  ImgList, StdCtrls, ExtCtrls, Menus, DBGridEh,
  Registry, foMyFunc, RXCtrls, uBaseGridFilter, uEhGridFilter, uArcSumm,
  Mask, ToolEdit, GridsEh;

type
  TfArcLite = class(TFrame)
    cdsArcLite: TClientDataSet;
    dsArc: TDataSource;
    ToolBar1: TToolBar;       
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
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    RxDBGrid1: TDBGridEh;
    RxSpeedButton1: TRxSpeedButton;
    ToolButton8: TToolButton;
    aNewEmpty: TAction;
    N9: TMenuItem;
    aGetMi: TAction;
    aCancelSeted: TAction;
    aSetUser: TAction;
    aUnSetUser: TAction;
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
    sep2: TToolButton;
    aSetViza: TAction;
    pmViza: TPopupMenu;
    miViza: TMenuItem;
    miNonViza: TMenuItem;
    miAll: TMenuItem;
    aUnViza: TAction;
    aBuffAdd: TAction;
    aBuffDel: TAction;
    aSetError: TAction;
    aUnSetError: TAction;
    aNewCorHW: TAction;
    aNewCorFin: TAction;
    aNewCorService: TAction;
    aNewCorOffset: TAction;
    pmCor: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    sep3: TToolButton;
    aNewCor: TAction;
    aDoChangeOper: TAction;
    aNewCopyOper: TAction;
    aLCBuffAdd: TAction;
    ToolBar2: TToolBar;
    EhGridFilter1: TEhGridFilter;
    miRateCH: TMenuItem;
    Sep6: TToolButton;
    ToolButton11: TToolButton;
    Action1: TAction;
    aGreedToExcel: TAction;
    ToolButton13: TToolButton;
    Panel3: TPanel;
    RxSpeedButton8: TRxSpeedButton;
    RxSpeedButton9: TRxSpeedButton;
    RxSpeedButton10: TRxSpeedButton;
    cdsExtDataDict: TClientDataSet;
    cdsExtDataDictid_Oper_ExtDataNames: TIntegerField;
    cdsExtDataDictid_business: TIntegerField;
    cdsExtDataDictType: TIntegerField;
    cdsExtDataDictNumPrm: TIntegerField;
    cdsExtDataDictParName: TStringField;
    cdsExtDataDictVisible: TBooleanField;
    aShowArcAnaliz: TAction;
    ToolButton3: TToolButton;
    RxSpeedButton2: TRxSpeedButton;
    ToolButton5: TToolButton;
    StatusBar1: TStatusBar;
    RxSpeedButton4: TRxSpeedButton;
    mpGrid: TPopupMenu;
    N6: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    aNewZac1: TMenuItem;
    N8: TMenuItem;
    N26: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N10: TMenuItem;
    N16: TMenuItem;
    N20: TMenuItem;
    aBuffDel1: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N31: TMenuItem;
    N36: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N21: TMenuItem;
    N38: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N4: TMenuItem;
    N19: TMenuItem;
    N44: TMenuItem;
    N15: TMenuItem;
    N7: TMenuItem;
    N30: TMenuItem;
    N5: TMenuItem;
    aAccCard: TAction;
    aBalance: TAction;
    aWHRep: TAction;
    aBackToCA: TAction;
    aBackFromCA: TAction;
    aValList: TAction;
    aCopySel: TAction;
    aSelectAll: TAction;
    aStng: TAction;
    ToolButton1: TToolButton;
    ToolButton7: TToolButton;
    RxSpeedButton3: TRxSpeedButton;
    aSetBJItem: TAction;
    N3: TMenuItem;
    N11: TMenuItem;
    aSelBJGrp: TAction;
    N12: TMenuItem;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
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
    procedure miOfferClick(Sender: TObject);
    procedure aSetVizaExecute(Sender: TObject);
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
    procedure cdsArcLiteOperDeltaCrnGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsArcLiteOperRateDeltaCrnGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsArcLiteOperTotalDeltaCrnGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure Action1Execute(Sender: TObject);
    procedure aGreedToExcelExecute(Sender: TObject);
    procedure aShowArcAnalizExecute(Sender: TObject);
    procedure RxDBGrid1SelectionChange(Sender: TObject);
    procedure aAccCardExecute(Sender: TObject);
    procedure aBalanceExecute(Sender: TObject);
    procedure aWHRepExecute(Sender: TObject);
    procedure aBackToCAExecute(Sender: TObject);
    procedure aBackFromCAExecute(Sender: TObject);
    procedure aValListExecute(Sender: TObject);
    procedure aCopySelExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aStngExecute(Sender: TObject);
    procedure aSetBJItemExecute(Sender: TObject);
    procedure aSelBJGrpExecute(Sender: TObject);
  private
    FrozenColCnt : integer;
    FFuckedCol : integer;
    FReadOnly: boolean;
    FShowBudjet: boolean;
    procedure SetUserForOper(id_user: Variant; id_oper: Integer);
    procedure BuffAddExec(ID : integer);
    procedure RefresheInt(id_Oper: integer = -1);

    function DoEditOper(AReadOnly : boolean; id_OperParent: Variant; ACorrect, ACopy : boolean; ADelMode : boolean; var ID : integer;
                        Ais_Mirr : boolean) : boolean;
    procedure SetReadOnly(const Value: boolean);
    procedure SetShowBudjet(const Value: boolean);
  public
    Showworksum : boolean; 
    Fid_OperParent, Fid_business : Variant;

    procedure Setid_business(const Value: Variant);

    procedure RemakeFilter;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    procedure Initialize(AParamBlnc : TBlnDetailData);

    procedure DisableEditAct;
    procedure ListMode;
    property ReadOnly : boolean read FReadOnly write SetReadOnly default false;

    procedure UpdateShowBudjet;
    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
    property ShowBudjet : boolean read FShowBudjet write SetShowBudjet;
    procedure loadStng;
  end;

implementation

uses uDM, uFormApi_Oper, uFormsAPI_Users, {uFormApi_OperLC,} uBuffSelector,
  foMyFuncEh, foMyFuncEhExcel, uArcAnaliz, uAccCard, uBalance, uMovWH,
  uArcProp, uBJTreeSel, uPrgForm, uBJList_v2;

{$R *.DFM}

procedure TfArcLite.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);

end;

procedure TfArcLite.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGridEh(Sender).ScreenToClient(P);
  if P.y <= THackGridEh(Sender).RowHeights[0] then
    Exit;
  aProperty.Execute;
end;

procedure TfArcLite.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.IsEmpty then
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
      TDBGridEh(Sender).Canvas.Brush.Color := clHighlight;
      TDBGridEh(Sender).Canvas.FillRect(Rect);
    end;
    DrawFrameControl(TDBGridEh(Sender).Canvas.Handle, R, DFC_BUTTON, Style);
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
      ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
    end
    else
      (Sender as TDBGridEh).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfArcLite.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);

end;

procedure TfArcLite.aPropertyExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr : boolean;
begin          
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := false;
  B := (dsArc.DataSet.FieldByName('id_UserChecker').AsInteger <> DM.IDUser) or (dsArc.DataSet.FieldByName('DTDiff').AsInteger <> 0);
  B := (//(dsArc.DataSet.FieldByName('id_UserChecker').AsInteger <> DM.IDUser) and
        (not dsArc.DataSet.FieldByName('CheckDate').IsNull))
       // or (dsArc.DataSet.FieldByName('DTDiff').AsInteger <> 0)
        ;
//  B := false;//1013
  Rez := DoEditOper(B, Fid_OperParent, false, false, false, ID, Ais_Mirr);
end;

procedure TfArcLite.RefresheInt(id_Oper: integer);
var OldRecNo : integer;
    OldCur : TCursor;
begin
  if dsArc.DataSet = DM.cdsLCBuff then
    Exit;

  with TClientDataSet(dsArc.DataSet) do
  begin
    DisableControls;
    OldCur := Screen.Cursor;
    Screen.Cursor := crSQLWait;
    Enabled := false;
    try
      if id_Oper = -1 then
        try id_Oper := FieldByName('id_Oper').AsInteger except end;
      if Active and not IsEmpty then
        OldRecNo := RecNo
      else
        OldRecNo := -1;
      Close;

      Open;
      if not Locate('id_Oper', id_Oper, []) and (OldRecNo <> -1) then
      begin
        if (OldRecNo <= dsArc.DataSet.RecordCount) then
          RecNo := OldRecNo
        else
          Last;
      end;
    finally
      Enabled := true;
      Screen.Cursor := OldCur;
      EnableControls;
    end;
  end;
end;

procedure TfArcLite.aRefresheExecute(Sender: TObject);
begin
//  AParamBlnc.DateFrom := (dtFrom.Date) - 0;
//  AParamBlnc.DateTo := (dtTo.Date) - 0 + 1;
  RefresheInt;
end;

procedure TfArcLite.aDeleteExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr : boolean;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('� ���� ������ ����� ������ �������� ������ ��������');
        Exit;
       {$ENDIF}
 // if MessageBox(Handle, '������� ��������?', '����������� ��������', MB_YESNO + MB_ICONQUESTION) = idNo then
 //   Exit;
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := false;
  B := false;
  Rez := DoEditOper(B, Fid_OperParent, false, true, true, ID, Ais_Mirr);

  if Rez then
  begin
    dsArc.DataSet.Delete;
    aRefreshe.Execute;
  end;

  {  if MessageBox(Handle, '������� ��������?', '����������� ��������', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    if DM.rsCA.AppServer.OP_OperDel(dsArc.DataSet.FieldByName('id_Oper').AsInteger) then
    begin
      dsArc.DataSet.Delete;
      aRefreshe.Execute;
    end
    else
    begin
      MessageBox(Handle, '������ ��� ��������', '��������� ������ ��� �������� ��������', MB_YESNO + MB_ICONQUESTION);
    end;  
  end;  }
end;

procedure TfArcLite.aNewWHExecute(Sender: TObject);
var
    AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperWare(Handle, AOperParamz);
end;

procedure TfArcLite.aNewFinExecute(Sender: TObject);
var
    AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperFin(Handle, AOperParamz);
end;

constructor TfArcLite.Create(AOwner: TCOmponent);
begin
  inherited;
  Showworksum := true;
  
  Fid_business := -1;
  UpdateShowBudjet;

  aNewWH.Visible := DM.CheckUserRights(1, Null);
  aNewFin.Visible := DM.CheckUserRights(2, Null);
  aNewService.Visible := DM.CheckUserRights(3, Null);
  aNewZac.Visible := DM.CheckUserRights(4, Null);

  aNewCorFin.Visible := aNewFin.Visible;
  aNewCorHW.Visible := aNewWH.Visible;
  aNewCorOffset.Visible := aNewZac.Visible;

  aSetUser.Visible := aSetError.Visible;
  aUnSetUser.Visible := aSetError.Visible;

  UpdateShowBudjet;

  FFuckedCol := -1;

  Fid_OperParent := Null;
end;

procedure TfArcLite.loadStng;
var 
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

procedure TfArcLite.Setid_business(const Value: Variant);
var
    S : String;
    i : integer;
begin
  with cdsExtDataDict do
  begin
    Close;
    Params.ParamByName('@id_business').Value := Value;
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
              RxDBGrid1.Columns[i].Title.Caption := '������|' + FieldByName('ParName').AsString;
          end;
        end;
        Next;
      end;
    finally
      Close;
    end;
  end;
  loadStng;
end;


destructor TfArcLite.Destroy;
var
    Reg : TRegistry;
    i : integer;
    Own : TCustomForm;
begin
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin                                          
    SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName);
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(SRegPath + '\' + TForm(Own).ClassName + '\pmOperFilter', true) then
      begin
        Reg.WriteInteger('FrozenColCnt', FrozenColCnt);
    //    Reg.WriteBool('ShowBudjet', FShowBudjet);

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
  end;
  inherited;
end;

procedure TfArcLite.dsArcDataChange(Sender: TObject; Field: TField);
var IsMy : boolean;
begin
  try
    aShowArcAnaliz.Enabled := not dsArc.DataSet.IsEmpty;
    if (StatusBar1 <> nil) and (FFuckedCol > 0) and (FFuckedCol < RxDBGrid1.Columns.Count) and (RxDBGrid1.Columns[FFuckedCol - 1].Field <> nil) then
      StatusBar1.Panels[1].Text := '��������: ' + RxDBGrid1.Columns[FFuckedCol - 1].Field.DisplayText;
    if (StatusBar1 <> nil) then
      StatusBar1.Panels[0].Text := '����� �������: ' + IntToStr(dsArc.DataSet.RecordCount);

    IsMy := (dsArc.DataSet.FieldByName('id_UserChecker').AsInteger = DM.IDUser);
    IsMy := true;
    aProperty.Enabled := (not dsArc.DataSet.IsEmpty);// and (cdsArcid_UserChecker.AsInteger = DM.IDUser);
    aDelete.Enabled := (not dsArc.DataSet.IsEmpty)
                        and IsMy
                        and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                        and (RxDBGrid1.SelectedRows.Count <= 1);// and (cdsArcDTDiff.AsInteger = 0);

    aGetMi.Enabled := (not dsArc.DataSet.IsEmpty) and dsArc.DataSet.FieldByName('id_UserChecker').IsNull
                      and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                      and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103]);
                    
    aCancelSeted.Enabled := (not dsArc.DataSet.IsEmpty) and (not dsArc.DataSet.FieldByName('id_UserChecker').IsNull) and
                            IsMy
                            and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                            and (RxDBGrid1.SelectedRows.Count <= 1)
                            and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103]);;
    aSetUser.Enabled := (not dsArc.DataSet.IsEmpty) and dsArc.DataSet.FieldByName('id_UserChecker').IsNull
                        and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                        and (RxDBGrid1.SelectedRows.Count <= 1)
                        and (dsArc.DataSet.FieldByName('id_UserChecker').AsInteger = DM.IDUser)
                        and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103]);;
    aUnSetUser.Enabled := (not dsArc.DataSet.IsEmpty) and not dsArc.DataSet.FieldByName('id_UserChecker').IsNull
                          and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                          and (RxDBGrid1.SelectedRows.Count <= 1)
                          and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103]);;
                
   { if ((Column.Field = dsArc.DataSet.FieldByName('SrcName')) and (not dsArc.DataSet.FieldByName('SrcName').IsNull) and (dsArc.DataSet.FieldByName('SrcID_Main').IsNull)) or // �� ����������� ��������
       ((Column.Field = dsArc.DataSet.FieldByName('ReprName')) and (not dsArc.DataSet.FieldByName('ReprName').IsNull) and (dsArc.DataSet.FieldByName('ReprID_Main').IsNull)) or // �� ����������� �������������
       ((Column.Field = dsArc.DataSet.FieldByName('ReprWHName')) and (not dsArc.DataSet.FieldByName('ReprWHName').IsNull) and (dsArc.DataSet.FieldByName('ReprWHID_Main').IsNull)) or // �� ����������� �����
       ((Column.Field = dsArc.DataSet.FieldByName('WareName')) and (not dsArc.DataSet.FieldByName('WareName').IsNull) and (dsArc.DataSet.FieldByName('WareID_Main').IsNull)) // �� ����������� �����
       then
    begin
      aSetViza.Enabled := (not dsArc.DataSet.IsEmpty) and (dsArc.DataSet.FieldByName('CheckDate').IsNull) and (IsMy)
                         and (RxDBGrid1.SelectedRows.Count <= 1);
    end;   }


    aUnViza.Enabled := (not dsArc.DataSet.IsEmpty) and (not dsArc.DataSet.FieldByName('Blocked').AsBoolean) 
                  //     (IsMy)
                        and (RxDBGrid1.SelectedRows.Count <= 1);

    aBuffAdd.Enabled := (not dsArc.DataSet.IsEmpty);
    aBuffDel.Enabled := (not dsArc.DataSet.IsEmpty);
    aLCBuffAdd.Enabled := (not dsArc.DataSet.IsEmpty);

    aSetError.Enabled := (not dsArc.DataSet.IsEmpty) and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                         and (dsArc.DataSet.FieldByName('OperState').AsInteger <> -1)
                         and (IsMy)
                         and (RxDBGrid1.SelectedRows.Count <= 1);
    aUnSetError.Enabled := (not dsArc.DataSet.IsEmpty) and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                         and (dsArc.DataSet.FieldByName('OperState').AsInteger = -1)
                         and (IsMy)
                         and (RxDBGrid1.SelectedRows.Count <= 1);

    aNewCor.Enabled := (not dsArc.DataSet.IsEmpty) and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103]);
    aNewCopyOper.Enabled := (not dsArc.DataSet.IsEmpty) and (dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 2, 3, 4, 101, 102, 103]);
        
    aDoChangeOper.Enabled := (not dsArc.DataSet.IsEmpty) and
                             (dsArc.DataSet.FieldByName('HasChild').AsInteger = 1)
                             and IsMy
                             and (RxDBGrid1.SelectedRows.Count <= 1);
  except

  end;
end;

procedure TfArcLite.RxDBGrid2DrawColumnCell(Sender: TObject;
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

      // ������ ������������� ������
      if ((Column.Field = dsArc.DataSet.FieldByName('ContrAgentName')) and
         (dsArc.DataSet.FieldByName('ContrAgentName').IsNull) and
         (not dsArc.DataSet.FieldByName('id_Repr').IsNull) and
         (not dsArc.DataSet.FieldByName('id_Repr_Ex').IsNull))
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
      if Column.Field is TFloatField then
      begin
        R := Rect;
        TDBGridEh(Sender).Canvas.FillRect(R);
        if not Column.Field.IsNull then
        begin
          if (LowerCase(Column.Field.FieldName) = 'worksum') and Showworksum then
            S := Trim(FormatFloat('0.0000', ABS(Column.Field.AsFloat)))
          else
            S := Trim(FormatFloat('### ### ### ### ##0.00', ABS(Column.Field.AsFloat)));
          if Column.Field.AsFloat < 0 then
            S := '-' + S;
          R.Top := R.Top + 2;
          DrawText(TDBGridEh(Sender).Canvas.Handle, PChar(S), -1, R, DT_RIGHT);
        end;
      end;
    end;
end;

procedure TfArcLite.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  ReOrderCDSEh(Column, 'id_Oper');
end;

procedure TfArcLite.cdsArcOperVidGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := '';
end;

procedure TfArcLite.aNewZacExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperOffset(Handle, AOperParamz);
end;

procedure TfArcLite.aNewEmptyExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperEmpty(Handle, AOperParamz);
end;

procedure TfArcLite.SetUserForOper(id_user: Variant; id_oper: Integer);
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
    raise Exception.Create('������!');
  end;
end;

procedure TfArcLite.aGetMiExecute(Sender: TObject);
begin
  SetUserForOper(DM.IDUser, dsArc.DataSet.FieldByName('id_Oper').AsInteger);
end;

procedure TfArcLite.aCancelSetedExecute(Sender: TObject);
begin
  SetUserForOper(Null, dsArc.DataSet.FieldByName('id_Oper').AsInteger);
end;

procedure TfArcLite.aSetUserExecute(Sender: TObject);
var AID:Variant;
    AName:string;
begin
  AID := dsArc.DataSet.FieldByName('id_UserChecker').Value;
  if GetUsersForm(AID, AName, true, false, true) then
  begin
    SetUserForOper(AID, dsArc.DataSet.FieldByName('id_Oper').AsInteger);
  end;
end;

procedure TfArcLite.aUnSetUserExecute(Sender: TObject);
begin
  SetUserForOper(Null, dsArc.DataSet.FieldByName('id_Oper').AsInteger);
end;

procedure TfArcLite.miOfferClick(Sender: TObject);
begin
  if (Sender as TMenuItem).RadioItem then
    (Sender as TMenuItem).Checked := true
  else
    (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
  RemakeFilter;
//  if mi
//      RxSpeedButton8

end;

procedure TfArcLite.RemakeFilter;
begin
  with dsArc.DataSet do
  begin
    DisableControls;
    try
      dsArc.DataSet.Filter := '(1=1)';
      if not miWH.Checked then
        Filter := Filter + ' AND (OperVid<>1) AND (OperVid<>101)';
      if not miFin.Checked then                                                
        Filter := Filter + ' AND (OperVid<>2) AND (OperVid<>102)';

      if not miOffer.Checked then
        Filter := Filter + ' AND (OperVid<>4) AND (OperVid<>104)';
      if not miEmpty.Checked then
        Filter := Filter + ' AND (OperVid<>0)';
      if not miRateCH.Checked then
        Filter := Filter + ' AND (OperVid<>-1)';

      if miSelf.Checked then
        Filter := Filter + ' AND (id_UserChecker=' + VarToStr(DM.IDUser) + ')';
      if miNonUser.Checked then
        Filter := Filter + ' AND (id_UserChecker IS NULL)';
      if miSeted.Checked then
        Filter := Filter + ' AND (id_UserChecker IS NOT NULL)';
        
      if miViza.Checked then
        Filter := Filter + ' AND (CheckDate IS NOT NULL)';
      if miNonViza.Checked then
        Filter := Filter + ' AND (CheckDate IS NULL)';

      EhGridFilter1.DefFilter := dsArc.DataSet.Filter;
    finally
      Filtered := true;
      EnableControls;
    end;
  end;
end;

procedure TfArcLite.aSetVizaExecute(Sender: TObject);
begin
  if MessageBox(Handle, '������������ ��������?', '����������� �����������', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    if DM.rsCA.AppServer.OP_OperSetCheckDate(dsArc.DataSet.FieldByName('id_Oper').AsInteger, DM.IDUser) then
    begin
      aRefreshe.Execute;
    end
    else
    begin
      MessageBox(Handle, '������ ��� �����������', '��������� ������ ��� ����������� ��������', MB_YESNO + MB_ICONQUESTION);
    end;  
  end;
end;

procedure TfArcLite.BuffAddExec(ID : integer);
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

procedure TfArcLite.aBuffAddExecute(Sender: TObject);
var ID, i : integer;
    S : String;
begin
  ID := -1;
  if SelectBuff(ID, S) then
  begin
    BuffAddExec(ID);
  end;
end;

procedure TfArcLite.aBuffDelExecute(Sender: TObject);
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

procedure TfArcLite.aUnVizaExecute(Sender: TObject);
begin
      {$IFDEF SEOLD}
        raise Exception.Create('� ���� ������ ����� ������ �������� ������ ��������');
        Exit;
       {$ENDIF}
  if MessageBox(Handle, '����� �����������?', '����������� ������ �����������', MB_YESNO + MB_ICONWARNING) = idYes then
  begin
    if DM.rsCA.AppServer.OP_OperDelCheckDate_v2(dsArc.DataSet.FieldByName('id_Oper').AsInteger) then
    begin
      aRefreshe.Execute;
    end
    else
    begin
      MessageBox(Handle, '������ ��� ������ �����������', '��������� ������ ��� ������ �����������', MB_YESNO + MB_ICONERROR);
    end;  
  end;
end;

procedure TfArcLite.aSetErrorExecute(Sender: TObject);
begin
  if MessageBox(Handle, '�������� �������� ��� ���������?', '', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    if DM.rsCA.AppServer.OP_OperSetOperState_v2(dsArc.DataSet.FieldByName('id_Oper').AsInteger, -1) then
    begin
      aRefreshe.Execute;
    end
    else
    begin
      MessageBox(Handle, '��������� ������', '��������� ������', MB_YESNO + MB_ICONQUESTION);
    end;  
  end;
end;

procedure TfArcLite.aUnSetErrorExecute(Sender: TObject);
begin
  if MessageBox(Handle, '����� ������� "������"?', '����������� ������ �������', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    if DM.rsCA.AppServer.OP_OperSetOperState_v2(dsArc.DataSet.FieldByName('id_Oper').AsInteger, 0) then
    begin
      aRefreshe.Execute;
    end
    else
    begin
      MessageBox(Handle, '������ ��� ������ �������', '��������� ������ ��� ������ �������', MB_YESNO + MB_ICONQUESTION);
    end;  
  end;
end;

procedure TfArcLite.aNewCorHWExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperWare(Handle, AOperParamz);
end;

procedure TfArcLite.aNewCorFinExecute(Sender: TObject);
var
    AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  EditOperFin(Handle, AOperParamz);
end;

procedure TfArcLite.aNewCorOffsetExecute(Sender: TObject);
var AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.Correct := true;
  EditOperOffset(Handle, AOperParamz);
end;

procedure TfArcLite.aNewCorExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr : boolean;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := false;
  B := false;
  Rez := DoEditOper(B, Null, true, true, false, ID, Ais_Mirr);
  if Rez then
    RefresheInt(ID)
end;

procedure TfArcLite.aDoChangeOperExecute(Sender: TObject);
begin
  DoChangeOper(dsArc.DataSet.FieldByName('id_Oper').AsInteger);
end;

procedure TfArcLite.aNewCopyOperExecute(Sender: TObject);
var
    ID : integer;
    Rez : boolean;
    B, Ais_Mirr : boolean;
begin
  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Ais_Mirr := dsArc.DataSet.FieldByName('is_Mirr').AsBoolean;
  Rez := false;
  B := false;
  Rez := DoEditOper(B, Fid_OperParent, false, true, false, ID, Ais_Mirr);
  if Rez then
    RefresheInt(ID)
end;

procedure TfArcLite.Initialize(AParamBlnc: TBlnDetailData);
begin
  with TClientDataSet(dsArc.DataSet) do
  begin
    Close;
    Params.ParamByName('@id_business').Value := AParamBlnc.id_business;
    Params.ParamByName('@DateFrom').AsDate := Trunc(AParamBlnc.DateFrom) - 0;
    Params.ParamByName('@DateTo').AsDate := Trunc(AParamBlnc.DateTo) - 0 + 1;

    Params.ParamByName('@isRawZ').Value := AParamBlnc.isRawZ;
    Params.ParamByName('@isNotRawZ').Value := AParamBlnc.isNotRawZ;
    Params.ParamByName('@isCRN').Value := AParamBlnc.isCRN;
    Params.ParamByName('@isUp').Value := AParamBlnc.isUp;
    Params.ParamByName('@isDown').Value := AParamBlnc.isDown;
    Params.ParamByName('@isInFromManuf').Value := AParamBlnc.isInFromManuf;

    Params.ParamByName('@id_Manufact').Value := AParamBlnc.id_Manufact;
    Open;
  end;
  RemakeFilter;
end;

procedure TfArcLite.RxDBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (dsArc.DataSet.IsEmpty) then
    Exit;

  if (dsArc.DataSet.FieldByName('DTDiff').AsInteger <> 0) and
     (not dsArc.DataSet.FieldByName('HasViza').AsBoolean) then
    AFont.Style := AFont.Style + [fsBold];

  if ((Column.Field = dsArc.DataSet.FieldByName('SrcName')) and (not dsArc.DataSet.FieldByName('SrcName').IsNull) and (dsArc.DataSet.FieldByName('SrcID_Main').IsNull)) or // �� ����������� ��������
     ((Column.Field = dsArc.DataSet.FieldByName('ReprName')) and (not dsArc.DataSet.FieldByName('ReprName').IsNull) and (dsArc.DataSet.FieldByName('ReprID_Main').IsNull)) or // �� ����������� �������������
//     ((Column.Field = dsArc.DataSet.FieldByName('ReprWHName')) and (not dsArc.DataSet.FieldByName('ReprWHName').IsNull) and (dsArc.DataSet.FieldByName('ReprWHID_Main').IsNull)) or // �� ����������� �����
     ((Column.Field = dsArc.DataSet.FieldByName('WareName')) and (not dsArc.DataSet.FieldByName('WareName').IsNull) and (dsArc.DataSet.FieldByName('WareID_Main').IsNull)) {or} // �� ����������� �����
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
end;

procedure TfArcLite.aLCBuffAddExecute(Sender: TObject);
begin
  BuffAddExec(-13);
end;

procedure TfArcLite.RxDBGrid1CellClick(Column: TColumnEh);
var S : String;
    P : TPoint;
    i, X : integer;
    Row: Longint;
begin
  P := Mouse.CursorPos;
  P := THackGridEh(RxDBGrid1).ScreenToClient(P);
  THackGridEh(RxDBGrid1).MouseToCell(P.X, P.Y, FFuckedCol, Row);

  if (FFuckedCol > 0) and (FFuckedCol < RxDBGrid1.Columns.Count) and (RxDBGrid1.Columns[FFuckedCol - 1].Field <> nil) then
    StatusBar1.Panels[1].Text := '��������: ' + RxDBGrid1.Columns[FFuckedCol - 1].Field.DisplayText;
end;

procedure TfArcLite.cdsArcLiteOperDeltaCrnGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if ((dsArc.DataSet.FieldByName('OperVid').AsInteger = 1) and (not dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean))
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

procedure TfArcLite.cdsArcLiteOperRateDeltaCrnGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ((dsArc.DataSet.FieldByName('OperVid').AsInteger = 1) and (not dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean))
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

procedure TfArcLite.cdsArcLiteOperTotalDeltaCrnGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ((dsArc.DataSet.FieldByName('OperVid').AsInteger in [1, 101]) and (not dsArc.DataSet.FieldByName('OperTypeIn').AsBoolean))
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

procedure TfArcLite.Action1Execute(Sender: TObject);
begin
  ShowArcSumm(dsArc.DataSet, [cvFinSum, cvWHWare, cvWHService, cvOffer, cvRateCH]);
end;

procedure TfArcLite.aGreedToExcelExecute(Sender: TObject);
begin
  Enabled := false;
  aGreedToExcel.Enabled := false;
  Repaint;
  try
    GreedToExcel(RxDBGrid1, '����� ��������')
  finally
    Enabled := true;
    aGreedToExcel.Enabled := true;
  end;
end;

function TfArcLite.DoEditOper(AReadOnly: boolean; id_OperParent: Variant;
  ACorrect, ACopy, ADelMode: boolean; var ID : integer; Ais_Mirr : boolean): boolean;
var
    Rez : boolean;
    B, IsMy : boolean;
    AOperParamz : TOperParamz;
begin
  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ReadOnly := AReadOnly or FReadOnly;
  AOperParamz.ID_Oper := ID;
  AOperParamz.is_Mirr := Ais_Mirr;
  AOperParamz.Correct := ACorrect;
  AOperParamz.Copy := ACopy;
  AOperParamz.DelMode := ADelMode;

  AReadOnly := AReadOnly or FReadOnly;
  IsMy := (dsArc.DataSet.FieldByName('id_UserChecker').AsInteger = DM.IDUser);
  IsMy := true;
  ADelMode := ADelMode and (not dsArc.DataSet.IsEmpty)
                      and IsMy
                      and (dsArc.DataSet.FieldByName('CheckDate').IsNull)
                      and (RxDBGrid1.SelectedRows.Count <= 1);// and (cdsArcDTDiff.AsInteger = 0);

//  ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;
  Result := false;
  case dsArc.DataSet.FieldByName('OperVid').AsInteger of
    -1 : EditOperCrnCh(Handle, AOperParamz); 
    0 : EditOperEmpty(Handle, AOperParamz);
    1 : EditOperWare(Handle, AOperParamz);
    2 : EditOperFin(Handle, AOperParamz);
    4 : EditOperOffset(Handle, AOperParamz);

    101 : EditOperWare_FFF(Handle, AOperParamz);
    102 : EditOperFin_FFF(Handle, AOperParamz);
  end;
end;

procedure TfArcLite.DisableEditAct;
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

procedure TfArcLite.SetReadOnly(const Value: boolean);
begin
  FReadOnly := Value;
//  RxSpeedButton5.Visible := not ReadOnly;
  RxSpeedButton1.Visible := not ReadOnly;
end;

procedure TfArcLite.ListMode;
begin
  DisableEditAct;
  ReadOnly := true;

  Panel3.Visible := false;
//  pnDate.Visible := false;
  ToolButton6.Visible := false;

  ToolBar2.Visible := false;

  sep1.Visible := false;
  sep2.Visible := false;
  sep3.Visible := false;
//  sep4.Visible := false;
end;

procedure TfArcLite.UpdateShowBudjet;
var i : integer;
begin
  for i := 0 to RxDBGrid1.Columns.Count - 1 do
    if Pos('������|', RxDBGrid1.Columns[i].Title.Caption) > 0 then
      RxDBGrid1.Columns[i].Visible := true{ShowBudjet};
end;

procedure TfArcLite.DoRefrMsg(var Msg: TMessage);
begin
//  RefresheInt(Msg.WParam);
end;

procedure TfArcLite.aShowArcAnalizExecute(Sender: TObject);
begin
  ShowArcAnaliz(RxDBGrid1);
end;

procedure TfArcLite.RxDBGrid1SelectionChange(Sender: TObject);
var V : Variant;
    S : String;
begin
  V := GridSelectionSumm(RxDBGrid1, true);
  if V = Null then
    S := ''
  else
    S := '�����: ' + FormatFloat('0.##', V);
  StatusBar1.Panels[2].Text := S;
end;

procedure TfArcLite.aAccCardExecute(Sender: TObject);
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

procedure TfArcLite.aBalanceExecute(Sender: TObject);
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

procedure TfArcLite.aWHRepExecute(Sender: TObject);
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

procedure TfArcLite.aBackToCAExecute(Sender: TObject);
var ID : integer;
begin
  ID := dsArc.DataSet.fieldByName('id_Oper').AsInteger;

  ShowWizBackToCA(Handle, ID);
end;

procedure TfArcLite.aBackFromCAExecute(Sender: TObject);
var ID : integer;
begin
  ID := dsArc.DataSet.fieldByName('id_Oper').AsInteger;

  ShowWizBackFromCA(Handle, ID);
end;

procedure TfArcLite.aValListExecute(Sender: TObject);
var S : String;
    P : TPoint;
    i, X : integer;
    Row: Longint;
begin
  if (FFuckedCol > 0) and (FFuckedCol < RxDBGrid1.Columns.Count) and (RxDBGrid1.Columns[FFuckedCol - 1].Field <> nil) then
    ShowValListDistinct(RxDBGrid1.Columns[FFuckedCol - 1].Field, '�������� "' + RxDBGrid1.Columns[FFuckedCol - 1].Title.Caption + '"')
end;

procedure TfArcLite.aCopySelExecute(Sender: TObject);
begin
  PutStringIntoClipBoard(GridSelectionAsText(RxDBGrid1));
end;

procedure TfArcLite.aSelectAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectedRows.SelectAll;
end;

procedure TfArcLite.aStngExecute(Sender: TObject);
begin
  ShowArcProp(RxDBGrid1, FrozenColCnt, FShowBudjet, '', true);
  EhGridFilter1.DBGrid := RxDBGrid1;
end;

procedure TfArcLite.SetShowBudjet(const Value: boolean);
begin
  FShowBudjet := Value;
  upDateShowBudjet
end;

procedure TfArcLite.aSetBJItemExecute(Sender: TObject);
var id_BJ_Obj : integer;
    id_BJ_Item : Variant;
    AName : String;
    AList : TIDList;
    ABookmark : TBookmark;
    i, ID : integer;
begin
  for i := 0 to Screen.FormCount - 1 do
  begin
    if (Screen.Forms[i] is TBJList_v2) then
    begin
      id_BJ_Obj := TBJList_v2(Screen.Forms[i]).fBJList1.cdsBJListid_BJ_Obj.AsInteger;
    end;
  end;
  if id_BJ_Obj = -1 then Exit;      

  id_BJ_Item := -1;
  
  if ShowBJTreeSel(id_BJ_Item, AName,
            id_BJ_Obj, Null, Null, Null, Fid_business, true, 10) then
  begin

  if MessageBox(Handle, Pchar('��������� ���������� ��������� ������ "' + AName + '"?'), '����������� ��������', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    if id_BJ_Item = Null then id_BJ_Item := -1;
    with dsArc.DataSet do
    begin
      AList := TIDList.Create;
      ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;

      if (dsArc.DataSet.FieldByName('OperVid').AsInteger = 2) and (AList.IndexOf(ID) = -1) then
      begin
        AList.Add(ID);
      end;

      try
        DisableControls;
        ABookmark := GetBookmark;
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          ShowProgressForm(Handle, i, RxDBGrid1.SelectedRows.Count, '����������� ������ ��������');
          GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
          ID := dsArc.DataSet.FieldByName('id_Oper').AsInteger;

          if (dsArc.DataSet.FieldByName('OperVid').AsInteger = 2) and (AList.IndexOf(ID) = -1) then
          begin
            AList.Add(ID);
          end;
        end;
        
        CloseProgressForm;
        for i := 0 to AList.Count - 1 do
        begin
          ID := AList[i];
          ShowProgressForm(Handle, i, AList.Count, '���� ��������� ��������');
          DM.rsCA.AppServer.BJ_OperRelEDIT(-1, id_BJ_Item, ID);
        end;
      finally
        CloseProgressForm;
        AList.Free;
 
        EnableControls;

        GotoBookmark(ABookmark);
//        ShowProgressForm(Handle, 0, 0, '���� ���������� ������');
        CloseProgressForm;
        aRefreshe.Execute;
      end;
    end;
  end;

  end;
end;

procedure TfArcLite.aSelBJGrpExecute(Sender: TObject);
var AID, id_BlockSelf, id_BlockCh : Variant;
    xxx_AName : String;
    id_BJ_Obj, id_ContrAgent, i : integer;
begin
  id_BJ_Obj := -1;
  for i := 0 to Screen.FormCount - 1 do
  begin
    if (Screen.Forms[i] is TBJList_v2) then
    begin
      id_BJ_Obj := TBJList_v2(Screen.Forms[i]).fBJList1.cdsBJListid_BJ_Obj.AsInteger;
    end;
  end;
  if id_BJ_Obj = -1 then Exit;
  
  id_BlockSelf := -1;
  id_BlockCh := Null;
  AID := -1;//id_BlockCh;
  id_ContrAgent := dsArc.DataSet.FieldByName('id_ContrAgent').AsInteger;
  if ShowBJTreeSel(AID, xxx_AName, id_BJ_Obj, id_BlockSelf, id_BlockCh, Null, Fid_business) then
  begin
    DM.rsCA.AppServer.BJ_ItemEdit(-1, AID, xxx_AName, id_ContrAgent, Null, Null, Null, false, Null, false, false);
  end;
end;

end.




