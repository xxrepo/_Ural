unit frDoc;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ActnList, RXCtrls, ComCtrls, ToolWin, Grids, Menus,
  DBClient, Provider, Db, ADODB, StdCtrls, DBCtrls, ExtCtrls,
  frFindDoc, Registry, frByObjFileList, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  dxDBTLCl, dxGrClms, ComObj, frEventList, RXSpin, RxMemDS, DBGrids,
  uBaseGridFilter, uDevXGridFilter, DBGridEh, uEhGridFilter, GridsEh, AdvSplitter, AdvMenus, AdvOfficePager, AdvOfficeButtons,
  AdvToolBar, AdvPanel, EhLibCDS;

type
  TRegMode = (rmAll, rmSel);
  TfDoc = class(TFrame)
    ImageList: TImageList;
    ActionList1: TActionList;
    aAddGrp: TAction;
    aEditGrp: TAction;
    aDelGrp: TAction;
    aRefreshGrp: TAction;
    aCopy: TAction;
    aSettings: TAction;
    qDocList: TADOQuery;
    dsDocList: TDataSource;
    DataSetProvider1: TDataSetProvider;
    cdsDocList2: TClientDataSet;
    pmDoc: TAdvPopupMenu;
    Addgroup1: TMenuItem;
    Editpayment1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Delete1: TMenuItem;
    aGoOrg: TAction;
    aExcel: TAction;
    ExporttoExcel1: TMenuItem;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    RxSpeedButton1: TRxSpeedButton;
    ToolButton2: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Splitter1: TAdvSplitter;
    pcDoc: TAdvOfficePager;
    tsEvents: TAdvOfficePage;
    tsFiles: TAdvOfficePage;
    fByObjFileList13: TfByObjFileList;
    aFindDoc: TAction;
    ToolButton5: TToolButton;
    qColProp: TADOQuery;
    pPPP: TPanel;
    cdsDocList2ID_DOCBASE: TAutoIncField;
    cdsDocList2NAME: TStringField;
    cdsDocList2ID_DOCTYPE: TIntegerField;
    cdsDocList2NUM: TStringField;
    cdsDocList2DATECREATE: TDateTimeField;
    cdsDocList2DOCDATE: TDateTimeField;
    cdsDocList2ID_CA: TIntegerField;
    cdsDocList2id_REP: TIntegerField;
    cdsDocList2DELETED: TIntegerField;
    cdsDocList2SUMM: TFloatField;
    cdsDocList2ID_CUR: TIntegerField;
    cdsDocList2COL1: TStringField;
    cdsDocList2COL2: TStringField;
    cdsDocList2COL3: TStringField;
    cdsDocList2COL4: TStringField;
    cdsDocList2COL5: TStringField;
    cdsDocList2COL6: TStringField;
    cdsDocList2COL7: TStringField;
    cdsDocList2COL8: TStringField;
    cdsDocList2COL9: TStringField;
    cdsDocList2COL10: TStringField;
    cdsDocList2EV_Date: TDateTimeField;
    cdsDocList2EV_EventComment: TStringField;
    cdsDocList2DateClosed: TDateTimeField;
    cdsDocList2Amount: TIntegerField;
    cdsDocList2HasFormPrint: TBooleanField;
    cdsDocList2HasFormEl: TBooleanField;
    cdsDocList2RedDate: TDateTimeField;
    cdsDocList2id_EventType: TIntegerField;
    cdsDocList2DTName: TStringField;
    cdsDocList2OrgName: TStringField;
    cdsDocList2ID_CAParent: TAutoIncField;
    cdsDocList2OrgNameParent: TStringField;
    cdsDocList2RepName: TStringField;
    cdsDocList2ID_RepParent: TAutoIncField;
    cdsDocList2RepNameParent: TStringField;
    cdsDocList2CURNAME: TStringField;
    cdsDocList2EventTypeName: TStringField;
    Timer1: TTimer;
    miEvent: TMenuItem;
    fEventList1: TfEventList;
    cdsDocList2XDay: TIntegerField;
    aDelFromBuff: TAction;
    N3: TMenuItem;
    cdsDocList2DOCCOMMENT2: TStringField;
    aSelectAll: TAction;
    aInBuff: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    aClosedDoc: TAction;
    N6: TMenuItem;
    aMAkeRegAll: TAction;
    N7: TMenuItem;
    RxMemoryData1: TRxMemoryData;
    DBGrid888: TDBGrid;
    DataSource1: TDataSource;
    RxMemoryData1Num: TIntegerField;
    RxMemoryData1Rep: TStringField;
    RxMemoryData1Org: TStringField;
    RxMemoryData1Doc: TStringField;
    RxMemoryData1DocDate: TDateTimeField;
    RxMemoryData1Summ: TStringField;
    RxMemoryData1Amount: TIntegerField;
    RxMemoryData1State: TStringField;
    aMAkeRegSel: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    RxMemoryData1ID_DOCBASE: TIntegerField;
    N10: TMenuItem;
    RxMemoryData1DOCCOMMENT2: TStringField;
    Action1: TAction;
    ToolBar2: TToolBar;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    dbgDoc: TDBGridEh;
    EhGridFilter1: TEhGridFilter;
    aOpenDoc: TAction;
    N11: TMenuItem;
    TabSheet1: TAdvOfficePage;
    DBMemo1: TDBMemo;
    pnBuff: TPanel;
    ToolButton6: TToolButton;
    Panel2: TPanel;
    aShowMultiEventProp: TAction;
    N12: TMenuItem;
    AdvDockPanel1: TAdvDockPanel;
    AdvToolBar1: TAdvToolBar;
    AdvToolBarButton1: TAdvToolBarButton;
    AdvToolBarButton2: TAdvToolBarButton;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    AdvToolBarSeparator2: TAdvToolBarSeparator;
    AdvToolBarButton3: TAdvToolBarButton;
    AdvToolBarSeparator3: TAdvToolBarSeparator;
    AdvToolBarButton4: TAdvToolBarButton;
    AdvToolBarSeparator4: TAdvToolBarSeparator;
    AdvToolBarButton5: TAdvToolBarButton;
    AdvToolBarSeparator5: TAdvToolBarSeparator;
    AdvToolBarButton6: TAdvToolBarButton;
    AdvToolBarSeparator6: TAdvToolBarSeparator;
    AdvToolBarButton7: TAdvToolBarButton;
    AdvToolBarSeparator7: TAdvToolBarSeparator;
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    RxSpinEdit1: TRxSpinEdit;
    Label2: TLabel;
    cbShowClosed: TAdvOfficeCheckBox;
    cbShowOpened: TAdvOfficeCheckBox;
    procedure aAddGrpExecute(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure aEditGrpExecute(Sender: TObject);
    procedure aDelGrpExecute(Sender: TObject);
    procedure aRefreshGrpExecute(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure dsDocListDataChange(Sender: TObject; Field: TField);
    procedure pcDocChange(Sender: TObject);
    procedure aSettingsExecute(Sender: TObject);
    procedure aExcelExecute(Sender: TObject);
    procedure aFindDocExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RxSpinEdit1Change(Sender: TObject);
    procedure fEventList1aAddEventExecute(Sender: TObject);
    procedure fEventList1aEditEventExecute(Sender: TObject);
    procedure fEventList1aDelEventExecute(Sender: TObject);
    procedure pnBuffDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure pnBuffDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure aDelFromBuffExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aInBuffExecute(Sender: TObject);
    procedure aClosedDocExecute(Sender: TObject);
    procedure aMAkeRegAllExecute(Sender: TObject);
    procedure aMAkeRegSelExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure dbgDocGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure dbgDocDblClick(Sender: TObject);
    procedure dbgDocMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure aOpenDocExecute(Sender: TObject);
    procedure aShowMultiEventPropExecute(Sender: TObject);
    procedure cdsDocList2AfterOpen(DataSet: TDataSet);
    procedure dbgDocSelectionChanged(Sender: TObject);
  private
    Fid_DocType, Fid_CA, FxDay : integer;
    procedure DoMAkeRegExecute(AMode: TRegMode);
  public
    FoldID_BSN : integer;
    FAddEvent : boolean;
    FSysDate : TDatetime;
    procedure LoadEhColNamez;
    procedure SaveEhColNamez;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure initialize(ID : integer = -1; AneedFind : boolean = false);
    procedure initialize2(id_DocType : integer = -1);
    procedure initialize_CA(id_CA : integer = -1);

    procedure ShowData;
    procedure CloseAll;

    procedure Setid_DocType(id_DocType: integer);
    procedure GetSett;

    procedure ReloadBuff;

    procedure AddToBuff;
  end;

implementation

uses uDM, foMyFunc, uDocProp, uArcProp,
  foMyFuncDXTreeExcel, uPrgForm, uDocList, foMyFuncEh, foMyFuncEhExcel,
  uMultiEventProp, uMain;

{$R *.DFM}

procedure TfDoc.SaveEhColNamez;
var Reg : TRegistry;
    i : integer;
    S, APath : String;
begin
  APath := SRegPath + '\' + ClassName + 'Grid2';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    {if Reg.OpenKey(APath, true) then
    begin
      for i := 0 to RxDBGrid1.Columns.Count - 1 do
      begin
        S := RxDBGrid1.Columns[i].FieldName;
        Reg.WriteString('Column_' + S, RxDBGrid1.Columns[i].Title.Caption);
      end;
    end;    }
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TfDoc.LoadEhColNamez;
 begin
  
end;

procedure TfDoc.CloseAll;
begin
  dsDocList.DataSet.Close
end;

procedure TfDoc.aAddGrpExecute(Sender: TObject);
var Aid_DocType, Aid_CA, AID : integer;
begin
  AID := -1;
  FAddEvent := false;
  Aid_DocType := Fid_DocType;
  Aid_CA := Fid_CA;
  if FoldID_BSN <> DM.id_Bsn then Aid_DocType := -1;
  if FoldID_BSN <> DM.id_Bsn then Aid_CA := -1;

  if ShowDocProp(false, AID, Aid_DocType, Fid_CA) then
  begin
    if FAddEvent then
      fEventList1.EditEvent(-1, AID);
    initialize(AID, true);
    FAddEvent := false;
  end;
end;

procedure TfDoc.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEditGrp.Execute;
end;


 
procedure TfDoc.aEditGrpExecute(Sender: TObject);
var AID : integer;
begin
  FAddEvent := false;
  AID := dsDocList.DataSet.FieldByName('ID_DOCBASE').AsInteger;
  if FoldID_BSN <> DM.id_Bsn then Exit;
  if ShowDocProp(false, AID) then
  begin
    if FAddEvent then
      fEventList1.EditEvent(-1, AID);
    initialize(AID);
    FAddEvent := false;
  end;
end;

procedure TfDoc.aDelGrpExecute(Sender: TObject);
var S2, sID : String;
begin
  if FoldID_BSN <> DM.id_Bsn then Exit;
  if MessageBox(Handle, PChar('Удалить документ?'), '?', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    sID := dsDocList.DataSet.FieldByName('ID_DOCBASE').AsString;
    S2 := 'UPDATE DW_DocBase SET Deleted=1 WHERE id_DocBase=' + sID;

    if DM.AddItem(S2) > -1 then
    begin
      aRefreshGrp.Execute;
      S2 := 'DELETE FROM DW_LIST WHERE id_DocBase=' + sID;
      DM.AddItem(S2);
    end
    else
      raise Exception.Create('Error in deleting');
  end;
end;

procedure TfDoc.aRefreshGrpExecute(Sender: TObject);
begin
  initialize2(Fid_DocType);
end;

procedure TfDoc.aCopyExecute(Sender: TObject);
var Aid_DocType, Aid_CA, AID : integer;
begin
  FAddEvent := false;
  AID := dsDocList.DataSet.FieldByName('ID_DOCBASE').AsInteger;
  if FoldID_BSN <> DM.id_Bsn then Exit;

  if ShowDocProp(true, AID) then
  begin
    if FAddEvent then
      fEventList1.EditEvent(-1, AID);
    initialize(AID, true);
    FAddEvent := false;
  end;
end;

procedure TfDoc.ToolButton11Click(Sender: TObject);
begin
  initialize;
end;

procedure TfDoc.initialize(ID : integer; AneedFind : boolean);
var
      AID, i : integer; 
begin
  if ID = -1 then
    AID := dsDocList.DataSet.FieldByNAme('ID_DocBase').AsInteger
  else
    AID := ID;

  with dsDocList.DataSet do
  begin
    Close;
    Open;
    if not Locate('ID_DocBase', AID, []) then
    begin
      if (ID > 0) and AneedFind then
        ShowDocList(AID)
      else
      begin
   //     if (RowNum <= dsDocList.DataSet.RecordCount) and (RowNum > -1) then
     //     dsDocList.DataSet.RecNo := RowNum;
      end;
    end;
  end;
  ReloadBuff;
end;

procedure TfDoc.dsDocListDataChange(Sender: TObject; Field: TField);
begin
  Timer1.Enabled := false;
  aCopy.Enabled := not dsDocList.DataSet.IsEmpty;
  aClosedDoc.Enabled := (not dsDocList.DataSet.IsEmpty and dsDocList.DataSet.Fieldbyname('DateClosed').IsNull) or (dbgDoc.SelectedRows.Count > 0); 
  aOpenDoc.Enabled := not dsDocList.DataSet.IsEmpty and not dsDocList.DataSet.Fieldbyname('DateClosed').IsNull;
  aEditGrp.Enabled := not dsDocList.DataSet.IsEmpty;
  aDelGrp.Enabled := not dsDocList.DataSet.IsEmpty;
  aDelFromBuff.Enabled := not dsDocList.DataSet.IsEmpty and (Fid_DocType = -126);
  aMAkeRegAll.Enabled :=  not dsDocList.DataSet.IsEmpty;
  aMAkeRegSel.Enabled :=  not dsDocList.DataSet.IsEmpty;
  
  aInBuff.Enabled := not dsDocList.DataSet.IsEmpty;
  aShowMultiEventProp.Enabled := not dsDocList.DataSet.IsEmpty and (dbgDoc.SelectedRows.Count > 0);
  Timer1.Enabled := true;
end;

constructor TfDoc.Create(AOwner: TCOmponent);
var i : integer;
    CL : TdxDBTreeListColumn;
    V : Variant;
begin
  inherited;
  SetGridProps(dbgDoc, );  
  FoldID_BSN := -1;
  FAddEvent := false;

  LoadEhGridSettingsFromRegistry(dbgDoc, SRegPath + '\' + ClassName + '-dxDBGDocList1');

  LoadValFromRegistry(V, SRegPath + '\' + ClassName, 'xDay');
  if V <> Null then
    RxSpinEdit1.Value := V;
  FxDay := trunc(RxSpinEdit1.Value);

  LoadValFromRegistry(V, SRegPath + '\' + ClassName, 'cbShowClosed');
  if V <> Null then
    cbShowClosed.Checked := V = 1;
  LoadValFromRegistry(V, SRegPath + '\' + ClassName, 'cbShowOpened');
  if V <> Null then
    cbShowOpened.Checked := V = 1;

  FSysDate := DM.GetSysDate;
  with cdsDocList2 do
  begin
    Close;
    Params.ParamByName('id_DocType').Value := -1;
    Params.ParamByName('id_CA').Value := -1;
  end;

  pcDoc.ActivePage := tsEvents;
  LoadSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + ClassName + '4' );
end;

destructor TfDoc.Destroy;
var TmpOwner: TCustomForm;
    i : integer;
begin
  i := FxDay;
  SaveValToRegistry(i, SRegPath + '\' + ClassName, 'xDay');

  SaveValToRegistry(ORD(cbShowClosed.Checked), SRegPath + '\' + ClassName, 'cbShowClosed');
  SaveValToRegistry(ORD(cbShowOpened.Checked), SRegPath + '\' + ClassName, 'cbShowOpened');
                      
  SaveEhGridSettingsToRegistry(dbgDoc, SRegPath + '\' + ClassName + '-dxDBGDocList1');
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    //SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\q' + ClassName);
  end;
  SaveSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + ClassName + '4' );
//  dsDocList.DataSet := nil;
  inherited;

end;

procedure TfDoc.ShowData;
begin
  Timer1.Enabled := false;
  fByObjFileList13.CloseAll;
  fEventList1.CloseAll;
  if (pcDoc.ActivePage = tsFiles) and (not dsDocList.DataSet.IsEmpty)  then
    fByObjFileList13.Initialize(-1, dsDocList.DataSet.fieldByName('ID_DOCBASE').AsInteger);
  if (pcDoc.ActivePage = tsEvents) and (not dsDocList.DataSet.IsEmpty) then
    fEventList1.Initialize(dsDocList.DataSet.fieldByName('ID_DOCBASE').AsInteger);

end;

procedure TfDoc.pcDocChange(Sender: TObject);
begin
  ShowData;
end;

procedure TfDoc.initialize2(id_DocType: integer);
var i, RowNum : integer;
    AID : integer;
  function CalcMode : Variant;
  begin
    if not cbShowClosed.Visible then
      Result := Null
    else
    begin
      if cbShowClosed.Checked and cbShowOpened.Checked then
        Result := Null
      else
      begin
        if cbShowClosed.Checked then
          Result := 1
        else
          Result := 0;
      end;
    end;
  end;
begin
  if dsDocList.DataSet.Active then
    RowNum := dsDocList.DataSet.RecNo
  else
    RowNum := -1;

  fByObjFileList13.CloseAll;
  fEventList1.CloseAll;
  if Fid_DocType = id_DocType then
    AID := dsDocList.DataSet.FieldByName('ID_DOCBASE').AsInteger
  else
    AID := -1;;
  aCopy.Enabled := false;
  aEditGrp.Enabled := false;
  aDelGrp.Enabled := false;

  Fid_DocType := id_DocType;
  with cdsDocList2 do
  begin
    Close;
    Params.ParamByName('id_DocType').Value := Fid_DocType;
    Params.ParamByName('id_user').Value := DM.id_User;
    Params.ParamByName('id_CA').Value := -1;
    Params.ParamByName('xDay').Value := integer(round(RxSpinEdit1.Value));

    Params.ParamByName('ShowClosed').Value := CalcMode;
      
    Params.ParamByName('id_CA').Value := -1;
    Params.ParamByName('id_BSN').Value := DM.id_Bsn;

    if (Fid_DocType > 0) or (Fid_DocType = -26) or (Fid_DocType = -126) or (Fid_DocType = -666)  then
      initialize(AID);
    aAddGrp.Enabled := true;//Fid_DocType > 0;

    if active and not Locate('ID_DocBase', AID, []) then
    begin
      if RowNum-1 = dsDocList.DataSet.RecordCount then RowNum := dsDocList.DataSet.RecordCount;
      
        if (RowNum <= dsDocList.DataSet.RecordCount) and (RowNum > 0) then
          dsDocList.DataSet.RecNo := RowNum;
    end;
  end;
//  Setid_DocType(Fid_DocType);

end;

procedure TfDoc.Setid_DocType(id_DocType: integer);
var i : integer;
begin
//  LoadEhColNamez;
  Fid_DocType := id_DocType;
  with cdsDocList2 do
  begin
    Close;
    Params.ParamByName('id_DocType').Value := Fid_DocType;
    Params.ParamByName('id_DocType2').Value := Fid_DocType;
    Params.ParamByName('id_CA').Value := -1;
    Params.ParamByName('id_CA2').Value := -1;
    if Fid_DocType > 0 then
      initialize(-1);
   // aAddGrp.Enabled := Fid_DocType > 0;
  end;
  with qColProp do
  begin
    Close;
    Parameters.ParamByName('id_DocType').Value := Fid_DocType;
    Open;

    First;
   // for i := 0 to RxDBGrid1.Columns.Count - 1 do
     // RxDBGrid1.Columns[i].Visible := POS('COL', UpperCase(RxDBGrid1.Columns[i].FieldName)) <> 1;
  {  while not Eof do
    begin
      for i := 0 to RxDBGrid1.Columns.Count - 1 do
      begin
        if RxDBGrid1.Columns[i].FieldName <> '' then
        begin
          if UpperCase(RxDBGrid1.Columns[i].FieldName) = UpperCase(qColProp.FieldByName('ColName').AsString) then
          begin
            if qColProp.fieldByName('ColSyn').AsString <> '' then
              RxDBGrid1.Columns[i].Title.Caption := qColProp.FieldByName('ColSyn').AsString;
            RxDBGrid1.Columns[i].Visible := qColProp.FieldByName('Visible').AsInteger = 1;
            RxDBGrid1.Columns[i].Index := qColProp.FieldByName('OrderID').AsInteger;
          end;
        end;
      end;
      Next;
    end;     }
  end;
end;

procedure TfDoc.initialize_CA(id_CA: integer);
begin
end;

procedure TfDoc.aSettingsExecute(Sender: TObject);
var AFrozenColCnt : integer;
begin
  if ShowArcProp(dbgDoc, '') then
  begin
    SaveEhGridSettingsToRegistry(dbgDoc, SRegPath + '\' + ClassName + '-dxDBGDocList1');
//    SaveStng;
  end;
end;

procedure TfDoc.aExcelExecute(Sender: TObject);
begin
  foMyFuncEhExcel.GreedToExcel(dbgDoc);
end;

procedure TfDoc.aFindDocExecute(Sender: TObject);
begin
//
end;

procedure TfDoc.GetSett;
var      TmpOwner: TCustomForm;
begin
  SaveEhColNamez;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
  //  LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\q' + ClassName);
  end;
end;

procedure TfDoc.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  ShowData;
  fEventList1.aEditEvent.Enabled := fEventList1.aEditEvent.Enabled and not aOpenDoc.Enabled;
  fEventList1.aAddEvent.Enabled := fEventList1.aAddEvent.Enabled and not aOpenDoc.Enabled;
  fEventList1.aDelEvent.Enabled := fEventList1.aDelEvent.Enabled and not aOpenDoc.Enabled;

end;

procedure TfDoc.RxSpinEdit1Change(Sender: TObject);
begin
  if RxSpinEdit1.Text = '' then Exit;
  FxDay := trunc(RxSpinEdit1.Value);
  dbgDoc.Repaint;
end;

procedure TfDoc.fEventList1aAddEventExecute(Sender: TObject);
begin
  fEventList1.aAddEventExecute(Sender);
   aRefreshGrp.Execute;

end;

procedure TfDoc.fEventList1aEditEventExecute(Sender: TObject);
begin
  fEventList1.aEditEventExecute(Sender);
  aRefreshGrp.Execute;

end;

procedure TfDoc.fEventList1aDelEventExecute(Sender: TObject);
begin
  fEventList1.aDelEventExecute(Sender);
  aRefreshGrp.Execute;

end;

procedure TfDoc.pnBuffDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source = dbgDoc;
end;

procedure TfDoc.ReloadBuff;
begin
  DM.cdsList.close;
  DM.cdsList.Open;
end;

procedure TfDoc.pnBuffDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  AddToBuff;
end;

procedure TfDoc.aDelFromBuffExecute(Sender: TObject);
  procedure DelFromBuff2(id_D : integer);
  var S2 : String;
  begin
    S2 := 'delete from dw_list where ID_DOCBASE=' + IntToStr(id_D) + ' and id_User=' + IntToStr(DM.id_User);
    DM.ExecSQL(S2);
  end;
var i, id_Oper : integer;
    ABookmark : TBookmark;
begin
  if (dbgDoc.SelectedRows.Count = 0) and (not dsDocList.DataSet.IsEmpty) then
  begin
    if MessageBox(Handle, PChar('Убрать документ из буфера?'), 'Подтвердите', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
    begin
      DelFromBuff2(dsDocList.DataSet.FieldByName('ID_DOCBASE').AsInteger);
      aRefreshGrp.Execute;
    end;
  end
  else
  if MessageBox(Handle, PChar('Убрать ' + IntToStr(dbgDoc.SelectedRows.Count) + ' документов из буфера?'), 'Подтвердите', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    with dsDocList.DataSet do
    begin
      try
        DisableControls;
        ABookmark := GetBookmark;
        for i := 0 to dbgDoc.SelectedRows.Count - 1 do
        begin
          GotoBookmark(Pointer(dbgDoc.SelectedRows.Items[i]));
          DelFromBuff2(dsDocList.DataSet.FieldByName('ID_DOCBASE').AsInteger);
          ShowProgressForm(Handle, i + 1, dbgDoc.SelectedRows.Count, 'Убираем из буфера...');
        end;
      finally
        EnableControls;
        dbgDoc.SelectedRows.Clear;
        CloseProgressForm;
        aRefreshGrp.Execute;
      end;
     end;
  end;
end;

procedure TfDoc.aSelectAllExecute(Sender: TObject);
begin
  dbgDoc.SelectedRows.SelectAll;
end;

procedure TfDoc.aInBuffExecute(Sender: TObject);
begin
  AddToBuff;

end;

procedure TfDoc.AddToBuff;
procedure AddToBuff2(id_D : integer);
begin
  if not DM.cdsList.Locate('ID_USER;ID_DOCBASE', VarArrayOf([DM.id_User, id_D]), [loCaseInsensitive, loPartialKey]) then
  begin
        DM.cdsList.Append;
        DM.cdsListID_USER.AsInteger := DM.id_User;
        DM.cdsListid_BSN.AsInteger := DM.id_Bsn;
        DM.cdsListID_DOCBASE.AsInteger := id_D;
        DM.cdsList.Post;
        DM.cdsList.ApplyUpdates(0);
  end;
end;
var i : integer;
begin
  with dbgDoc.DataSource.DataSet do
  begin
    if (dbgDoc.SelectedRows.Count = 0) and (not dsDocList.DataSet.IsEmpty) then
      AddToBuff2(dsDocList.DataSet.FieldByName('ID_DOCBASE').AsInteger);
    for i := 0 to dbgDoc.SelectedRows.Count - 1 do
    begin
      GotoBookmark(Pointer(dbgDoc.SelectedRows.Items[i]));
      AddToBuff2(dsDocList.DataSet.FieldByName('ID_DOCBASE').AsInteger);
      ShowProgressForm(Handle, i + 1, dbgDoc.SelectedRows.Count, 'Добавление в буфер...');
    end;
  end;
  CloseProgressForm;
end;


procedure TfDoc.DoMAkeRegExecute(AMode : TRegMode);
begin
  DoMakeMT(AMode, dbgDoc, RxMemoryData1);

  foMyFunc.GreedToExcel(DBGrid888, 'Реестр документов от ' + FormatDateTime('dd.mm.yyyy', now));
end;

procedure TfDoc.aMAkeRegAllExecute(Sender: TObject);
begin
  DoMAkeRegExecute(rmAll);
end;

procedure TfDoc.aMAkeRegSelExecute(Sender: TObject);
begin
  DoMAkeRegExecute(rmSel);

end;

procedure TfDoc.Action1Execute(Sender: TObject);
begin
  SaveEhGridSettingsToRegistry(dbgDoc, SRegPath + '\' + ClassName + '-dxDBGDocList1');
end;

procedure TfDoc.dbgDocGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if not (gdSelected in State) and (dsDocList.DataSet.FieldByName('XDay').AsInteger >= FxDay) and (dsDocList.DataSet.FieldByName('DateClosed').IsNull) then
    Background := DM.Color_Red;
  if not (gdSelected in State) and not (dsDocList.DataSet.FieldByName('DateClosed').IsNull) then
    Background := DM.Color_Green;

end;

procedure TfDoc.dbgDocDblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGridEh(Sender).ScreenToClient(P);
  if P.y <= THackGridEh(Sender).RowHeights[0] then
    Exit;
  aEditGrp.Execute;
end;

procedure TfDoc.dbgDocMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := dbgDoc.ScreenToClient(P);
  if (P.y <= THackGridEh(Sender).RowHeights[0]) or (P.x <= 10) then
    Exit;
  if (ssLeft in Shift) then
    dbgDoc.BeginDrag(true);    

end;

procedure TfDoc.aClosedDocExecute(Sender: TObject);
  procedure CloseOneDoc(ID_DOCBASE : integer);
  var S2 : String;
  begin
    S2 := 'UPDATE DW_DocBase SET DateClosed=getdate() WHERE id_DocBase=' + dsDocList.DataSet.FieldByName('ID_DOCBASE').AsString;
    DM.ExecSQL(S2);
  end;
var i, id_Oper : integer;
    ABookmark : TBookmark;
begin
  if (dbgDoc.SelectedRows.Count = 0) and (not dsDocList.DataSet.IsEmpty) then
  begin
    if MessageBox(Handle, PChar('Закрыть документ?'), 'Подтвердите', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
    begin
      CloseOneDoc(dsDocList.DataSet.FieldByName('ID_DOCBASE').AsInteger);
      aRefreshGrp.Execute;
    end;
  end
  else
  if MessageBox(Handle, PChar('Закрыть ' + IntToStr(dbgDoc.SelectedRows.Count) + ' документов?'), 'Подтвердите', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    with dsDocList.DataSet do
    begin
      try
        DisableControls;
        ABookmark := GetBookmark;
        for i := 0 to dbgDoc.SelectedRows.Count - 1 do
        begin
          GotoBookmark(Pointer(dbgDoc.SelectedRows.Items[i]));
          CloseOneDoc(dsDocList.DataSet.FieldByName('ID_DOCBASE').AsInteger);
          ShowProgressForm(Handle, i + 1, dbgDoc.SelectedRows.Count, 'Закрытие документов...');
        end;
      finally
        EnableControls;
        dbgDoc.SelectedRows.Clear;
        CloseProgressForm;
        aRefreshGrp.Execute;
      end;
     end;
  end;
end;


procedure TfDoc.aOpenDocExecute(Sender: TObject);
  procedure OpenOneDoc(ID_DOCBASE : integer);
  var S2 : String;
  begin
    S2 := 'UPDATE DW_DocBase SET DateClosed=null WHERE id_DocBase=' + dsDocList.DataSet.FieldByName('ID_DOCBASE').AsString;
    DM.ExecSQL(S2);
  end;
begin
    if MessageBox(Handle, PChar('Закрыть документ?'), 'Подтвердите', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
    begin
      OpenOneDoc(dsDocList.DataSet.FieldByName('ID_DOCBASE').AsInteger);
      aRefreshGrp.Execute;
    end;
end;

procedure TfDoc.aShowMultiEventPropExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Добавить событие по ' + IntToStr(dbgDoc.SelectedRows.Count) + ' выбраным документам?'), 'Подтвердите', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    if ShowMultiEventProp(dbgDoc) then
      aRefreshGrp.Execute;
  end;

end;

procedure TfDoc.cdsDocList2AfterOpen(DataSet: TDataSet);
begin
  FoldID_BSN := DM.id_Bsn;
end;

procedure TfDoc.dbgDocSelectionChanged(Sender: TObject);
begin
  main.MainStatusBar.Panels[1].Text := 'Выбрано документов: ' + IntToStr(dbgDoc.SelectedRows.Count);
end;

end.
