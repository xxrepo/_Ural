unit frCA;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ActnList, RXCtrls, ComCtrls, ToolWin, Grids, DBGridEh, Menus,
  DBClient, Provider, Db, ADODB, StdCtrls, DBCtrls, ExtCtrls,
  frByObjFileList, frObjList, frDoc, frFindFirm, Buttons, AdvSplitter, AdvMenus, AdvOfficePager;

type
  TfCA = class(TFrame)
    ImageList: TImageList;
    ActionList1: TActionList;
    aAddGrp: TAction;
    aEditGrp: TAction;
    aDelGrp: TAction;
    aRefreshGrp: TAction;
    aCopy: TAction;
    aSettings: TAction;
    qPMList2: TADOQuery;
    dsCAList: TDataSource;
    DataSetProvider1: TDataSetProvider;
    cdsCA: TClientDataSet;
    pmCA: TAdvPopupMenu;
    Addgroup1: TMenuItem;
    Copypayment1: TMenuItem;
    Editpayment1: TMenuItem;
    N1: TMenuItem;
    Pending1: TMenuItem;
    N2: TMenuItem;
    qPMList2ID_CA: TBCDField;
    qPMList2PID: TBCDField;
    qPMList2NAME: TWideStringField;
    qPMList2DELETED: TBCDField;
    qPMList2STATUSNAME: TWideStringField;
    qPMList2ID_ICONS: TBCDField;
    qPMList2COMMENTS: TWideStringField;
    qPMList2DATECREATE: TDateTimeField;
    qPMList2ADDR: TWideStringField;
    qPMList2JURADR: TWideStringField;
    qPMList2JURNAME: TWideStringField;
    qPMList2DIRECTOR: TWideStringField;
    qPMList2BUH: TWideStringField;
    qPMList2CAPITAL: TBCDField;
    qPMList2ID_CUR: TBCDField;
    qPMList2CURNAME: TWideStringField;
    cdsCAICN: TIntegerField;
    Action1: TAction;
    qPMList2PNAME: TWideStringField;
    aFind: TAction;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    dbgCA: TDBGridEh;
    pcCA: TAdvOfficePager;
    tsComment: TAdvOfficePage;
    DBMemo1: TDBMemo;
    tsDoc: TAdvOfficePage;
    tsFiles: TAdvOfficePage;
    fByObjFileList1: TfByObjFileList;
    tsOriginals: TAdvOfficePage;
    fObjList1: TfObjList;
    tsStempels: TAdvOfficePage;
    Splitter1: TAdvSplitter;
    Splitter2: TAdvSplitter;
    aExcel: TAction;
    fDoc1: TfDoc;
    fObjListST: TfObjList;
    qPMList2AINDEX: TWideStringField;
    pFind: TPanel;
    fFindFirm1: TfFindFirm;
    qPMList2ISGRP: TBCDField;
    qPMList2FIO_FAM: TWideStringField;
    qPMList2FIO_NAME: TWideStringField;
    qPMList2FIO_SUR: TWideStringField;
    qPMList2FIO_PSPTYPE: TWideStringField;
    qPMList2FIO_PSPSER: TWideStringField;
    qPMList2FIO_PSPNUM: TWideStringField;
    qPMList2DELETEDFROM: TDateTimeField;
    aAddPrsn: TAction;
    aCancel: TAction;
    Delete1: TMenuItem;
    Addperson1: TMenuItem;
    RxSpeedButton2: TRxSpeedButton;
    pmAdd: TAdvPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    aChart: TAction;
    ToolButton9: TToolButton;
    pmChart: TAdvPopupMenu;
    RxSpeedButton1: TRxSpeedButton;
    Forallitems1: TMenuItem;
    Forselectedfirm1: TMenuItem;
    qPMList2STARTACTIVITY: TDateTimeField;
    qPMList2ACOLOR: TBCDField;
    aOrgChart: TAction;
    OrgChartforselectedfirm1: TMenuItem;
    qPMList2ShortName: TWideStringField;
    cdsCAID_CA: TBCDField;
    cdsCAPID: TBCDField;
    cdsCANAME: TWideStringField;
    cdsCADELETED: TBCDField;
    cdsCASTATUSNAME: TWideStringField;
    cdsCAID_ICONS: TBCDField;
    cdsCACOMMENTS: TWideStringField;
    cdsCADATECREATE: TDateTimeField;
    cdsCAADDR: TWideStringField;
    cdsCAJURADR: TWideStringField;
    cdsCAJURNAME: TWideStringField;
    cdsCADIRECTOR: TWideStringField;
    cdsCABUH: TWideStringField;
    cdsCACAPITAL: TBCDField;
    cdsCAID_CUR: TBCDField;
    cdsCACURNAME: TWideStringField;
    cdsCAPNAME: TWideStringField;
    cdsCAAINDEX: TWideStringField;
    cdsCAISGRP: TBCDField;
    cdsCAFIO_FAM: TWideStringField;
    cdsCAFIO_NAME: TWideStringField;
    cdsCAFIO_SUR: TWideStringField;
    cdsCAFIO_PSPTYPE: TWideStringField;
    cdsCAFIO_PSPSER: TWideStringField;
    cdsCAFIO_PSPNUM: TWideStringField;
    cdsCADELETEDFROM: TDateTimeField;
    cdsCASTARTACTIVITY: TDateTimeField;
    cdsCAACOLOR: TBCDField;
    cdsCAShortName: TWideStringField;
    cdsCApsp: TStringField;
    procedure aAddGrpExecute(Sender: TObject);
    procedure dbgCADblClick(Sender: TObject);
    procedure dbgCADrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dbgCAGetBtnParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
      IsDown: Boolean);
    procedure dbgCATitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure aEditGrpExecute(Sender: TObject);
    procedure aDelGrpExecute(Sender: TObject);
    procedure aRefreshGrpExecute(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure dsCAListDataChange(Sender: TObject; Field: TField);
    procedure pcCAChange(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure fFindFirm1Button2Click(Sender: TObject);
    procedure fFindFirm1SpeedButton2Click(Sender: TObject);
    procedure aSettingsExecute(Sender: TObject);
    procedure aExcelExecute(Sender: TObject);
    procedure cdsCANAMEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure fFindFirm1SpeedButton1Click(Sender: TObject);
    procedure aAddPrsnExecute(Sender: TObject);
    procedure cdsCACalcFields(DataSet: TDataSet);
  private
    FSysDate : TDatetime;
    Fis_Grp : integer;
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure initialize(ID : integer = -1; is_Grp : integer = -1);

    procedure ShowData;

    procedure GetPICZ;
  end;

implementation

uses uDM, foMyFunc, foMyFuncEh, uCAProp, uArcProp, foMyFuncEhExcel,
  uCAFizProp;

{$R *.DFM}

procedure TfCA.aAddGrpExecute(Sender: TObject);
var id_CA : integer;
begin
  id_CA := -1;
  if ShowCAProp(id_CA) then
    initialize(id_CA, Fis_Grp);
end;

procedure TfCA.dbgCADblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEditGrp.Execute;
end;

procedure TfCA.dbgCADrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var R: TRect;
begin
  if (not dsCAList.DataSet.FieldByName('DELETEDFROM').IsNull)
    and (FSysDate >= dsCAList.DataSet.FieldByName('DELETEDFROM').AsDateTime) then
  begin
    dbgCA.Canvas.Font.Style := [fsStrikeOut];
  end;
  if (Column.Field = dsCAList.DataSet.FieldByName('Name')) and (not dbgCA.DataSource.DataSet.IsEmpty) then
  begin
    R := Rect;
    dbgCA.Canvas.FillRect(R);
    if dsCAList.DataSet.FieldByName('ICN').AsInteger > 0 then
      ImageList.Draw(dbgCA.Canvas, R.Left + 2, R.Top + 2, dsCAList.DataSet.FieldByName('ICN').AsInteger, true) ;
    R.Left := R.Left + 18;
    dbgCA.DefaultDrawColumnCell(R, DataCol,  Column, State);
  end
  else
    dbgCA.DefaultDrawColumnCell(Rect, DataCol,  Column, State);
end;

procedure TfCA.dbgCAGetBtnParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarkerEh(Column.Field);

end;

procedure TfCA.dbgCATitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  ReOrderCDSEh(Column, '');

end;

procedure TfCA.aEditGrpExecute(Sender: TObject);
var id_CA : integer;
begin
  id_CA := dsCAList.DataSet.FieldByName('ID_CA').AsInteger;
  if dsCAList.DataSet.FieldByName('isGrp').AsInteger = 1 then
  begin
    if ShowCAProp(id_CA) then
      initialize(id_CA, Fis_Grp)
  end
  else
    if ShowCAFizProp(id_CA) then
      initialize(id_CA, Fis_Grp);
end;

procedure TfCA.aDelGrpExecute(Sender: TObject);
var S2 : String;
begin
  if MessageBox(Handle, PChar('Do you realy want to delete organization?'), '?', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    S2 := 'UPDATE DW_CA SET Deleted=1 WHERE id_CA=' + dsCAList.DataSet.FieldByName('id_CA').AsString;

    if DM.AddItem(S2) > -1 then
    begin
      aRefreshGrp.Execute;
    end
    else
      raise Exception.Create('Error in deleting');
  end;
end;

procedure TfCA.aRefreshGrpExecute(Sender: TObject);
begin
//  dsCAList.DataSet := cdsCA;
  initialize(-1, Fis_Grp);
end;

procedure TfCA.aCopyExecute(Sender: TObject);
var id_CA : integer;
begin
  id_CA := dsCAList.DataSet.FieldByName('ID_CA').AsInteger;
  if dsCAList.DataSet.FieldByName('isGrp').AsInteger = 1 then
  begin
    if ShowCAProp(id_CA, true) then
      initialize(id_CA, Fis_Grp)
  end
  else
    if ShowCAFizProp(id_CA, true) then
      initialize(id_CA, Fis_Grp);
end;

procedure TfCA.ToolButton11Click(Sender: TObject);
begin
  initialize(-1, Fis_Grp);
end;

procedure TfCA.initialize(ID : integer; is_Grp : integer);
var
      AID, i : integer; 
begin
  Fis_Grp := is_Grp;
  DM.InitToolBar(ToolBar1);
  if ID = -1 then
    AID := dsCAList.DataSet.FieldByName('ID_CA').AsInteger
  else
    AID := ID;
  with TClientDataSet(dsCAList.DataSet) do
  begin
    Close;
    if Params.Count > 0 then
    begin
      if is_Grp = -1 then
        Params.ParamByName('isGrp').Value := Null
      else
        Params.ParamByName('isGrp').Value := is_Grp;
    end;
    Params.ParamByName('isGrp2').Value := Params.ParamByName('isGrp').Value;
    Open;
    GetPICZ;
    Locate('ID_CA', AID, []);
  end;
end;

procedure TfCA.dsCAListDataChange(Sender: TObject; Field: TField);
begin
  aOrgChart.Enabled := not dsCAList.DataSet.IsEmpty;
  aCopy.Enabled := not dsCAList.DataSet.IsEmpty;
  aEditGrp.Enabled := not dsCAList.DataSet.IsEmpty;
  aDelGrp.Enabled := not dsCAList.DataSet.IsEmpty;
  aCancel.Enabled := not dsCAList.DataSet.IsEmpty;
  Forselectedfirm1.Enabled := not dsCAList.DataSet.IsEmpty;
  ShowData;
end;

constructor TfCA.Create(AOwner: TCOmponent);
var TmpOwner: TCustomForm;
begin
  inherited;
//  fParents1.ToolBar1.Visible := false;
//  fParents1.ToolBar2.Visible := false;

  FSysDate := DM.GetSysDate;
  pFind.Visible := false;
  pcCA.ActivePageIndex := 0;
  fDoc1.aFindDoc.Visible := false;
  fDoc1.pcDoc.Visible := false;
  fDoc1.fByObjFileList13.Parent := fDoc1.pPPP;
  fDoc1.aGoOrg.Visible := false;
  LoadSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + ClassName + '2' );
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadEhGridSettingsFromRegistry(dbgCA, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
  fDoc1.GetSett;
  fObjListST.GetSett;
  fObjList1.GetSett;
end;

destructor TfCA.Destroy;
var TmpOwner: TCustomForm;
begin
  SaveSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + ClassName + '2' );
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    SaveEhGridSettingsToRegistry(dbgCA, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
  dsCAList.DataSet := nil;
  try
    inherited;
  except
  
  end;
end;

procedure TfCA.ShowData;
begin
  fDoc1.CloseAll;
 // fChild1.CloseAll;
 // fParents1.CloseAll;

  fByObjFileList1.CloseAll;
  fObjList1.CloseAll;
  fObjListST.CloseAll;

  if pcCA.ActivePage = tsFiles then
    fByObjFileList1.Initialize(dsCAList.DataSet.FieldByName('ID_CA').AsInteger, -1);

  if pcCA.ActivePage = tsOriginals then
    fObjList1.Initialize(dsCAList.DataSet.FieldByName('ID_CA').AsInteger, -1, 1);

  if pcCA.ActivePage = tsStempels then
    fObjListST.Initialize(dsCAList.DataSet.FieldByName('ID_CA').AsInteger, -1, 2);

  if pcCA.ActivePage = tsDoc then
    fDoc1.initialize_CA(dsCAList.DataSet.FieldByName('ID_CA').AsInteger);


end;

procedure TfCA.pcCAChange(Sender: TObject);
begin
  ShowData;
end;

procedure TfCA.aFindExecute(Sender: TObject);
begin
  pFind.Visible := true;
  dsCAList.DataSet := fFindFirm1.cdsCAF;
  dsCAList.OnDataChange(dsCAList, nil);
  fFindFirm1.initialize();
end;

procedure TfCA.fFindFirm1Button2Click(Sender: TObject);
begin
  fFindFirm1.Button2Click(Sender);
  pFind.Visible := false;
  dsCAList.DataSet := cdsCA;
  dsCAList.OnDataChange(dsCAList, nil);
end;

procedure TfCA.GetPICZ;
var
      AID, i : integer; 
begin
  with dsCAList.DataSet do
  begin
    DisableControls;
    try
      First;
      while not Eof do
      begin
        if dsCAList.DataSet.FieldByName('ID_ICONS').AsInteger > 0 then
        begin
          i := DM.IconIn(dsCAList.DataSet.FieldByName('ID_ICONS').AsInteger, nil, ImageList);
          if i > 0 then
          begin
            Edit;
            dsCAList.DataSet.FieldByName('ICN').AsInteger := i;
            Post;
          end;
        end;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;

end;

procedure TfCA.fFindFirm1SpeedButton2Click(Sender: TObject);
begin
  fFindFirm1.SpeedButton2Click(Sender);
  GetPICZ;
end;

procedure TfCA.aSettingsExecute(Sender: TObject);
var AFrozenColCnt : integer;
begin
{  if ShowArcProp(dbgCA, AFrozenColCnt) then
    try
      dbgCA.FrozenCols := AFrozenColCnt;
    except
      dbgCA.FrozenCols := 0;
    end; }
end;

procedure TfCA.aExcelExecute(Sender: TObject);
begin
  GreedToExcel(dbgCA);
end;

procedure TfCA.cdsCANAMEGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := Sender.AsString;
  if cdsCASTATUSNAME.AsString <> '' then
    Text := Text + ', ' + cdsCASTATUSNAME.AsString;
end;

procedure TfCA.fFindFirm1SpeedButton1Click(Sender: TObject);
begin
  fFindFirm1.SpeedButton1Click(Sender);

end;

procedure TfCA.aAddPrsnExecute(Sender: TObject);
var id_CA : integer;
begin
  id_CA := -1;
  if ShowCAFizProp(id_CA) then
    initialize(id_CA, Fis_Grp);
end;

procedure TfCA.cdsCACalcFields(DataSet: TDataSet);
begin
  cdsCApsp.AsString := cdsCAFIO_PSPSER.AsString + ' ' + cdsCAFIO_PSPNUM.AsString;
end;

end.
