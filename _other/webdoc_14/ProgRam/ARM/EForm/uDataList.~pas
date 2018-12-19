unit uDataList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, sPageControl, ExtCtrls, sPanel, sSplitter,
  Buttons, sSpeedButton, sLabel, Db, ADODB, DBClient, sTreeView, sEdit,
  GridsEh, DBGridEh, EhLibCDS, sGroupBox, sListBox, foMyFunc, sButton,
  Menus, Mask, sMaskEdit, sCustomComboEdit, sTooledit, sCheckBox, ActnList,
  DBCtrls, sDBEdit, Clipbrd, uDM, frFiles;
  const iconBuff = 41;

type

  TDataList = class(TForm)
    pnCA: TsPanel;
    spFlt: TsSplitter;
    pnHide: TsPanel;
    sbHideCA: TsSpeedButton;
    sbHideFlt: TsSpeedButton;
    sbHideFiles: TsSpeedButton;
    cdsValList: TClientDataSet;
    cdsValListVal: TStringField;
    sLabel1: TsLabel;
    edFltFull: TsEdit;
    dsCAList: TDataSource;
    dbgCA: TDBGridEh;
    cdsCAList: TClientDataSet;
    sButton1: TsButton;
    pmSetDate: TPopupMenu;
    miToday: TMenuItem;
    miYesterday: TMenuItem;
    N71: TMenuItem;
    miThisWeek: TMenuItem;
    miThisMounth: TMenuItem;
    miThisQuart: TMenuItem;
    N70: TMenuItem;
    miPrevWeek: TMenuItem;
    miPrevMounth: TMenuItem;
    N1: TMenuItem;
    miAllDates: TMenuItem;
    pnFlt: TsPanel;
    pcFlt2: TsPageControl;
    tsTree: TsTabSheet;
    fltTree: TsTreeView;
    tsCB: TsTabSheet;
    sGroupBox1: TsGroupBox;
    lbFlt: TsListBox;
    pnFltControls: TsPanel;
    pnFileProp: TsGroupBox;
    spCond: TsSplitter;
    dtFrom: TsDateEdit;
    sLabel2: TsLabel;
    sSpeedButton1: TsSpeedButton;
    sLabel3: TsLabel;
    dtTo: TsDateEdit;
    sCheckBox1: TsCheckBox;
    spCA: TsSplitter;
    Label1: TsLabel;
    edMegaText: TsEdit;
    cdsCAListCAName: TStringField;
    cdsCAListisBayerStr: TStringField;
    cdsCAListisSellerStr: TStringField;
    cdsCAListisUsedStr: TStringField;
    cdsCAListid_Obj: TIntegerField;
    cdsCAListid_NS: TIntegerField;
    cdsCAListPID: TIntegerField;
    cdsCAListid_ObjType: TIntegerField;
    cdsCAListObjName: TStringField;
    cdsCAListFileName: TStringField;
    cdsCAListDeleted: TBooleanField;
    cdsCAListDateStart: TDateTimeField;
    cdsCAListDateStop: TDateTimeField;
    cdsCAListisBayer: TBooleanField;
    cdsCAListisSeller: TBooleanField;
    cdsCAListisDef: TBooleanField;
    cdsCAListObj_Digit1: TBCDField;
    cdsCAListObj_Digit2: TBCDField;
    cdsCAListObj_Digit3: TBCDField;
    cdsCAListObj_Digit4: TBCDField;
    cdsCAListObj_Digit5: TBCDField;
    cdsCAListObj_Digit6: TBCDField;
    cdsCAListObj_Digit7: TBCDField;
    cdsCAListObj_Digit8: TBCDField;
    cdsCAListObj_Digit9: TBCDField;
    cdsCAListObj_Digit10: TBCDField;
    cdsCAListObj_Str1: TStringField;
    cdsCAListObj_Str2: TStringField;
    cdsCAListObj_Str3: TStringField;
    cdsCAListObj_Str4: TStringField;
    cdsCAListObj_Str5: TStringField;
    cdsCAListObj_Str6: TStringField;
    cdsCAListObj_Str7: TStringField;
    cdsCAListObj_Str8: TStringField;
    cdsCAListObj_Str9: TStringField;
    cdsCAListObj_Str10: TStringField;
    cdsCAListObj_Date1: TDateTimeField;
    cdsCAListObj_Date2: TDateTimeField;
    cdsCAListObj_Date3: TDateTimeField;
    cdsCAListObj_Date4: TDateTimeField;
    cdsCAListObj_Date5: TDateTimeField;
    cdsCAListObj_Date6: TDateTimeField;
    cdsCAListObj_Date7: TDateTimeField;
    cdsCAListObj_Date8: TDateTimeField;
    cdsCAListObj_Date9: TDateTimeField;
    cdsCAListObj_Date10: TDateTimeField;
    cdsCAListWorkType: TStringField;
    cdsCAListRealWorkType: TStringField;
    fFiles1: TfFiles;
    ActionList1: TActionList;
    aEditRepr: TAction;
    pmCA: TPopupMenu;
    N2: TMenuItem;
    cbNeopr: TsCheckBox;
    sButton2: TsButton;
    aEditCA: TAction;
    N3: TMenuItem;
    sPanel2: TsPanel;
    sLabel4: TsLabel;
    FilterEdit: TsEdit;
    btnName: TsButton;
    miPrevQ: TMenuItem;
    miThisYear: TMenuItem;
    aBuffClear: TAction;
    N4: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure sbHideFltClick(Sender: TObject);
    procedure sbHideCAClick(Sender: TObject);
    procedure sbHideFilesClick(Sender: TObject);
    procedure spFltMoved(Sender: TObject);
    procedure spCAMoved(Sender: TObject);
    procedure fltTreeExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure fltTreeGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure fltTreeChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure lbFltDblClick(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure miSetDateClick(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure cdsCAListBeforeOpen(DataSet: TDataSet);
    procedure dbgCACellClick(Column: TColumnEh);
    procedure sCheckBox1Click(Sender: TObject);
    procedure aEditReprExecute(Sender: TObject);
    procedure dsCAListDataChange(Sender: TObject; Field: TField);
    procedure cbNeoprClick(Sender: TObject);
    procedure aEditCAExecute(Sender: TObject);
    procedure btnNameClick(Sender: TObject);
    procedure FilterEditChange(Sender: TObject);
    procedure cdsCAListFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cdsCAListAfterOpen(DataSet: TDataSet);
    procedure aBuffClearExecute(Sender: TObject);
  private
    pnFltWidth, dbgCAHeight, pnFilesHeight : integer;
    xFlt1, xFlt2 : String;
    procedure MakeList(SL, exList: TStrings);
    function NameTrans(Atext: String): String;
    procedure SetParamval(APanel: TPanel; ASP: TClientDataSet);
    procedure SetVal_ex(Atext: String; aVal: Variant; ASP: TClientDataSet);
    procedure DoDelMeMsg(var Msg: TMessage); message xxx_DelMeMsg;
  public
    procedure NewSearch;
    procedure Refr;
    procedure Initialize;
    procedure cbValChange(Sender: TObject);

    procedure LoadFilesList(ExtSQL : Variant; OnlyNAN : boolean);
    procedure DoRefrMsg2(var Msg: TMessage); message xxx_WD_RefrMsg;

    function CAIDList : Variant;
  end;

var
  DataList: TDataList;
procedure ShowDataList;

implementation

uses frFLT, foMyFuncEh, foMyFuncEhExcel, uOneItemSelector, uFileProp,
  uObjProp, MapiDefs;

{$R *.DFM}

procedure ShowDataList;
begin
  try
    if not Assigned(DataList) then
    begin
      DataList := TDataList.Create(nil);
      DataList.WindowState := wsMaximized;
      DataList.Initialize;
    end
    else
    begin
      DataList.WindowState := wsMaximized;
      DataList.BringToFront;
    end;
  except
    if Assigned(DataList) then DataList.Free;
    DataList := nil;
  end;
end;


{ TDataList }

procedure TDataList.Initialize;
var Node : TTreeNode;
    i : integer;
begin
  fltTree.Items.BeginUpdate;
  Screen.Cursor := crSQLWait;
  try
    lbFlt.Items.Clear;

    fltTree.Items.Clear;

    MakeList(lbFlt.Items, nil);

    for i := 0 to lbFlt.Items.Count - 1 do
    begin
      Node := fltTree.Items.Add(nil, lbFlt.Items[i]);
      Node.HasChildren := true;
      Node.ImageIndex := 29;
    end;
    cdsCAList.Close;
    SetParamval(nil, cdsCAList);

    cdsCAList.Open;
      Node := fltTree.Items.Add(nil, 'Буфер');
      Node.HasChildren := false;
      Node.ImageIndex := iconBuff;
    Refr;
  finally
    Screen.Cursor := crDefault;
    fltTree.Items.EndUpdate;
    DM.RefrBuffCount;
  end;
end;

procedure TDataList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;

end;


procedure TDataList.sbHideFltClick(Sender: TObject);
begin
  if pnFlt.Width <= 1 then
  begin
    pnFlt.Width := pnFltWidth;
    sbHideFlt.ImageIndex := 25;
    sbHideFlt.Caption := 'Скрыть фильтры';
  end
  else
  begin
    pnFltWidth := pnFlt.Width;
    pnFlt.Width := 1;
    sbHideFlt.ImageIndex := 24;
    sbHideFlt.Caption := 'Показать фильтры';
  end;
end;

procedure TDataList.sbHideCAClick(Sender: TObject);
begin
  if dbgCA.Height <= 1 then
  begin
    dbgCA.Height := dbgCAHeight;
    sbHideCA.ImageIndex := 25;
    sbHideCA.Caption := 'Скрыть контрагентов';
  end
  else
  begin
    dbgCAHeight := dbgCA.Height;
    dbgCA.Height := 1;
    sbHideCA.ImageIndex := 24;
    sbHideCA.Caption := 'Показать контрагентов';
  end;
end;

procedure TDataList.sbHideFilesClick(Sender: TObject);
begin
  if dbgCA.Height >= pnCA.Height - spCA.Height - 1 then
  begin
    dbgCA.Height := 250;
    sbHideFiles.ImageIndex := 25;
    sbHideFiles.Caption := 'Скрыть файлы';
  end
  else
  begin
    pnFilesHeight := fFiles1.Height;
    dbgCA.Height := pnCA.Height - spCA.Height - 1;
    sbHideFiles.ImageIndex := 24;
    sbHideFiles.Caption := 'Показать файлы';
  end;
end;

procedure TDataList.spFltMoved(Sender: TObject);
begin
  if pnFlt.Width > 1 then
  begin
    sbHideFlt.ImageIndex := 25;
    sbHideFlt.Caption := 'Скрыть фильтры';
  end;
{  if pnCA.Height > 1 then
  begin
    sbHideCA.ImageIndex := 25;
    sbHideCA.Caption := 'Скрыть контрагентов';
  end;  }
end;

procedure TDataList.spCAMoved(Sender: TObject);
begin
  if pnCA.Height > 1 then
  begin
    sbHideCA.ImageIndex := 25;
    sbHideCA.Caption := 'Скрыть контрагентов';
  end;
  if fFiles1.Height > 1 then
  begin
    sbHideFiles.ImageIndex := 25;
    sbHideFiles.Caption := 'Скрыть файлы';
  end;

end;

procedure TDataList.MakeList(SL : TStrings; exList : TStrings);
  procedure AddVal(aVal : String);
  begin
    if assigned(exList) then
    begin
      if exList.IndexOf(aVal) >= 0 then exit;
    end;
    SL.Add(aVal);
  end;
begin
  AddVal('Наименование');
  AddVal('Принадлежность');
  AddVal('Покупатель');
  AddVal('Продавец');
  AddVal('Действующий');
 // AddVal('Завершенный');
  AddVal('Вид деятельности');
  AddVal('Тематика');

end;

procedure TDataList.SetVal_ex(Atext : String; aVal : Variant; ASP: TClientDataSet);
begin
  if aVal = '' then aVal := Null;
  Atext := '@' + NameTrans(Atext);
  ASP.Params.ParamByName(Atext).Value := aVal;
end;

procedure TDataList.SetParamval(APanel: TPanel; ASP: TClientDataSet);
var i : integer;
begin
  ASP.Close;
  for i := 0 to ASP.Params.Count - 1 do
    ASP.Params[i].Value := Null;
  ASP.Params.ParamByName('@id_NS').Value := DM.id_NS;
  ASP.Params.ParamByName('@ID_User').Value := DM.ID_User;
  ASP.Params.ParamByName('@SysKey').Value := DM.SysKey;
  
  if APanel = nil then exit;
  
  for i := 0 to APanel.ControlCount - 1 do
  begin
    if (APanel.Controls[i] is TfFlt) then
    begin
      if TfFlt(APanel.Controls[i]).Visible then
        SetVal_ex(TfFlt(APanel.Controls[i]).Label1.Caption, TfFlt(APanel.Controls[i]).cbVal.Items[TfFlt(APanel.Controls[i]).cbVal.ItemIndex], ASP);

    end;
  end;  
end;

function TDataList.NameTrans(Atext: String): String;
begin
 // Atext := StringReplace(StringReplace(Atext, '[', '', [rfReplaceAll, rfIgnoreCase]), ']', '', [rfReplaceAll, rfIgnoreCase]);
      if Atext = 'Наименование' then
        Result := 'ObjName';
      if Atext = 'Принадлежность' then
        Result := 'CAName';
      if Atext = 'Покупатель' then
        Result := 'isBayerStr';
      if Atext = 'Продавец' then
        Result := 'isSellerStr';
      if Atext = 'Действующий' then
        Result := 'isUsedStr';
      if Atext = 'Вид деятельности' then
        Result := 'WorkType';
      if Atext = 'Тематика' then
        Result := 'RealWorkType';

end;

procedure TDataList.fltTreeExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
var i, j : integer;
    N : TTreeNode;
    exList : TStringList;
    SL : TStringList;
begin
  try
  if (Node.Count > 0) then Exit;
  if Node.ImageIndex <> 30 then
  begin
    SetParamval(nil, cdsValList);

    N := Node;
    while (N <> nil) and (N.Parent <> nil) do
    begin
      if N.ImageIndex = 30 then
      begin
        SetVal_ex(N.Parent.Text, N.Text, cdsValList);
      end;
      N := N.Parent;
    end;

    cdsValList.Params.ParamByName('@FlDName').Value := NameTrans(Node.Text);
    with cdsValList do
    begin
      Open;
      while not Eof do
      begin
        N := fltTree.Items.AddChild(Node, cdsValList.fieldByName('Val').AsString);
        N.ImageIndex := 30;
        N.HasChildren := true;
        Next;
      end;
    end;
  end
  else
  begin
    exList := TStringList.Create;
    SL := TStringList.Create;

    N := Node;
    while N <> nil do
    begin
      if N.ImageIndex <> 30 then
        exList.Add(N.Text);
      N := N.Parent;
    end;

    MakeList(SL, exList);
    Node.HasChildren := SL.Count > 0;
    for i := 0 to SL.Count - 1 do
    begin
      N := fltTree.Items.AddChild(Node, SL[i]);
      N.HasChildren := true;
      N.ImageIndex := 29;
    end;
  end;
//  AddVal('z-Буфер');

  except
    Screen.Cursor := crDefault;
  end;
end;

procedure TDataList.fltTreeGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TDataList.fltTreeChange(Sender: TObject; Node: TTreeNode);
var i, j : integer;
    N : TTreeNode;
    exList : TStringList;
    SL : TStringList;
begin
  try

  cdsCAList.Close;
  SetParamval(nil, cdsCAList);

    N := Node;
    xFlt1 := '';
    while (N <> nil) and (N.Parent <> nil) do
    begin
      if N.ImageIndex = 30 then
      begin
        SetVal_ex(N.Parent.Text, N.Text, cdsCAList);
        if xFlt1 > '' then xFlt1 := ', ' + xFlt1;
        xFlt1 := N.Parent.Text + ': ' + N.Text + xFlt1;
      end;
      N := N.Parent;
    end;
    if N.ImageIndex = iconBuff then
        cdsCAList.Params.ParamByName('@ObjName').Value := -777;

//  if xFlt1 = '' then xFlt1 := 'Нет';

  Screen.Cursor := crSQLWait;
//  cdsCAList.Params.ParamByName('@id_NS').Value := DM.id_NS;
  cdsCAList.Open;
  Screen.Cursor := crDefault;
 // LoadFilesList(Null, false);
  except
    Screen.Cursor := crDefault;
  end;
end;

procedure TDataList.FormCreate(Sender: TObject);
var    V : Variant;
begin
  LoadValFromRegistry(V, SRegPath + '\' + ClassName, 'ActivePageIndex');
  if (V <> Null) then
    if V < pcFlt2.PageCount then
      pcFlt2.ActivePageIndex := V;
  SetGridProps(dbgCA);
  LoadEhGridSettingsFromRegistry(dbgCA, SRegPath + '\' + ClassName + 'dbgCA');

  LoadSplitterSettingsFromRegistry(spFlt, SRegPath + '\' + ClassName + 'spFlt');
  LoadSplitterSettingsFromRegistry(spCA, SRegPath + '\' + ClassName + 'spCA');
  LoadSplitterSettingsFromRegistry(spCond, SRegPath + '\' + ClassName + 'spCond');
end;

procedure TDataList.FormDestroy(Sender: TObject);
begin
  SaveValToRegistry(pcFlt2.ActivePageIndex, SRegPath + '\' + ClassName, 'ActivePageIndex');
  SaveEhGridSettingsToRegistry(dbgCA, SRegPath + '\' + ClassName + 'dbgCA');

  SaveSplitterSettingsFromRegistry(spFlt, SRegPath + '\' + ClassName + 'spFlt');
  SaveSplitterSettingsFromRegistry(spCA, SRegPath + '\' + ClassName + 'spCA');
  SaveSplitterSettingsFromRegistry(spCond, SRegPath + '\' + ClassName + 'spCond');
  DataList := nil
end;


procedure TDataList.lbFltDblClick(Sender: TObject);
var FR : TfFlt;
    N : integer;
begin
  N := lbFlt.ItemIndex;
  SetParamval(pnFltControls, cdsValList);
  cdsValList.Params.ParamByName('@FlDName').Value := NameTrans(lbFlt.Items[N]);
//  cdsValList.Params.ParamByName('@id_NS').Value := DM.id_NS;
  
  FR := GetFrame(lbFlt.Items[N], pnFltControls, lbFlt.Items, cdsValList, cbValChange);


  lbFlt.Items.Delete(N);

  if N = lbFlt.Items.Count then N := N - 1;

  lbFlt.ItemIndex := N;
end;

procedure TDataList.DoDelMeMsg(var Msg: TMessage);
var P : Pointer;
begin
  P := Pointer(Msg.WParam);
  sleep(1000);
  TControl(P).Free;
end;

procedure TDataList.sButton1Click(Sender: TObject);
begin
  NewSearch;
end;

procedure TDataList.NewSearch;
var i : integer;
begin
  DM.FSysKey := 0;
  cdsCAList.Params.ParamByName('@id_NS').Value := DM.id_NS;

  for i := pnFltControls.ControlCount - 1 downto 0 do
  begin
    pnFltControls.Controls[i].Free;
  end;
  cbNeopr.Checked := false;
  cbNeoprClick(nil);
  Initialize;
end;

procedure TDataList.cbValChange(Sender: TObject);
begin
  try

    Screen.Cursor := crSQLWait;
    cdsCAList.Close;
    SetParamval(pnFltControls, cdsCAList);
    cdsCAList.Open;
    Screen.Cursor := crDefault;
 //   LoadFilesList(Null, false);
  except
    Screen.Cursor := crDefault;
  end;
end;

procedure TDataList.miSetDateClick(Sender: TObject);
var Year, Month, Day: Word;
begin
  if Sender = miAllDates then
  begin
    dtFrom.Date := 0;
    dtTo.Date := 0;
  end
  else
  if Sender = miToday then
  begin
    dtFrom.Date := now;
    dtTo.Date := now;
  end
  else
  if Sender = miYesterday then
  begin
    dtFrom.Date := now - 1;
    dtTo.Date := now - 1;
  end
  else
  if Sender = miThisWeek then
  begin
    dtFrom.Date := CalcFirstDayOfWeek(Now);
    dtTo.Date := now;
  end
  else
  if Sender = miThisMounth then
  begin
    DecodeDate(Now, Year, Month, Day);
    dtFrom.Date := EncodeDate(Year, Month, 1);

    dtTo.Date := now;
  end
  else
  if Sender = miThisYear then
  begin
    DecodeDate(Now, Year, Month, Day);
    dtFrom.Date := EncodeDate(Year, 1, 1);

    dtTo.Date := now;
  end
  else
  if Sender = miThisQuart then
  begin
    DecodeDate(Now, Year, Month, Day);
    if Month in [1, 2, 3] then Month := 1;
    if Month in [4, 5, 6] then Month := 4;
    if Month in [7, 8, 9] then Month := 7;
    if Month in [10, 11, 12] then Month := 10;
    dtFrom.Date := EncodeDate(Year, Month, 1);

    dtTo.Date := now;
  end
  else
  if Sender = miPrevWeek then
  begin
    dtFrom.Date := CalcFirstDayOfWeek(Now) - 7;
    dtTo.Date := dtFrom.Date + 6;
  end
  else
  if Sender = miPrevMounth then
  begin
    DecodeDate(IncMonth(Now, -1), Year, Month, Day);
    dtFrom.Date := EncodeDate(Year, Month, 1);

    dtTo.Date := IncMonth(dtFrom.Date, 1) - 1;
  end
  else
  if Sender = miPrevQ then
  begin
    DecodeDate(Now, Year, Month, Day);
    if Month in [1, 2, 3] then Month := 1;
    if Month in [4, 5, 6] then Month := 4;
    if Month in [7, 8, 9] then Month := 7;
    if Month in [10, 11, 12] then Month := 10;
    dtFrom.Date := EncodeDate(Year, Month, 1);
    dtFrom.Date := IncMonth(dtFrom.Date, - 3);

    dtTo.Date := EncodeDate(Year, Month, 1) - 1;
  end ;
  LoadFilesList(fFiles1.cdsFileList.Params.ParamByName('@ExtSQL').Value, false);
end;

procedure TDataList.LoadFilesList(ExtSQL: Variant; OnlyNAN : boolean);
var i : integer;
begin
    if ExtSQL = null then
    begin
      if xFlt1 <> '' then
        edFltFull.Text := xFlt1
      else
        edFltFull.Text := 'Нет';

      for i := 0 to fFiles1.cdsFileList.Params.Count - 1 do
        fFiles1.cdsFileList.Params[i].Value := Null;

      if trim(edMegaText.Text) > '' then
        fFiles1.cdsFileList.Params.ParamByName('@Comment').Value := trim(edMegaText.Text);

      if dtFrom.Date > 0 then
        fFiles1.cdsFileList.Params.ParamByName('@DateFrom').AsDate := dtFrom.Date;
      if dtTo.Date > 0  then
        fFiles1.cdsFileList.Params.ParamByName('@DateTo').AsDate := dtTo.Date + 1;

    end;
  fFiles1.Init(OnlyNAN, CAIDList, ExtSQL, ExtSQL <> null);
end;

procedure TDataList.sButton2Click(Sender: TObject);
begin
  Refr;
end;

procedure TDataList.Refr;
begin
  if cbNeopr.Checked then
    LoadFilesList(Null, true)
  else
  begin
    FixIdRefresh(cdsCAList, 'id_Obj');

    LoadFilesList(Null, false);
  end;
end;

procedure TDataList.cdsCAListBeforeOpen(DataSet: TDataSet);
begin
  DM.FSysKey := 0;
  cdsCAList.Params.ParamByName('@SysKey').Value := DM.SysKey;
end;

procedure TDataList.dbgCACellClick(Column: TColumnEh);
var S : Variant;
    Val : String;
begin
  S := Null;
  if (Column.Field.FieldName = 'WorkType') or (Column.Field.FieldName = 'RealWorkType') then
  begin
    Val := Column.Field.AsString;
    if POS(';', Val) > 0 then
    begin
      Val := StringReplace(Val, ';', #13 + #10, [rfReplaceAll, rfIgnoreCase]);
      if ShowOneItemSelector(Val, Val) then
      begin

      end
      else
        Exit;

    end;
    S := 'AND (WorkTypeName1 = ' + '''' + Val + '''' + 'OR WorkTypeName2 = ' + '''' + Val + ''''
     + 'OR WorkTypeName3 = ' + '''' + Val + ''''
      + 'OR WorkTypeName4 = ' + '''' + Val + ''''
       + 'OR WorkTypeName5 = ' + '''' + Val + '''' + ')';
 {   S := 'AND (id_Seller in (SELECT id_Obj FROM VW_Link (NOLOCK) WHERE LinkedObjName = ' + '''' + Val + '''' + ')' +
         'OR id_Bayer in (SELECT id_Obj FROM VW_Link (NOLOCK) WHERE LinkedObjName = ' + '''' + Val + '''' + '))';  }
  end
  else
  begin
    if Column.Field is TBooleanField then
    begin
      if Column.Field.AsBoolean then Val := '1' else Val := '0';
    end
    else
    if Column.Field is TStringField then
    begin
      Val := '''' + Column.Field.AsString + '''';
    end
    else
    if Column.Field is TIntegerField then
    begin
      Val := Column.Field.AsString ;
    end;

    S := 'AND (id_Seller in (SELECT id_Obj FROM VW_CA (NOLOCK) WHERE ' + Column.Field.FieldName + ' = ' + Val + ')' +
         'OR id_Bayer in (SELECT id_Obj FROM VW_CA (NOLOCK) WHERE ' + Column.Field.FieldName + ' = ' + Val + '))';

  end;
//  if edFlt.Text = 'Нет' then edFlt.Text := '' else edFlt.Text := edFlt.Text + ', ';
  xFlt2 := Column.Title.Caption + ': '  + Val;
  if xFlt1 <> '' then
    edFltFull.Text := xFlt1 + ', ' + xFlt2
  else
    edFltFull.Text := xFlt2;

  if cdsCAListid_Obj.AsInteger = -777 then
  begin
    S := 'AND id_File in (select id_File from WD_Buff where id_User=' + IntToStr(DM.ID_User) + ')';
  end;
  LoadFilesList(S, false);
{    if Column.Field = cdsCAListisBayerStr then
      S := 'AND (id_Seller in (SELECT id_Obj FROM VW_CA (NOLOCK) WHERE isBayer = ' + Val + ')' +
      'OR id_Bayer in (SELECT id_Obj FROM VW_CA (NOLOCK) WHERE isBayer = ' + Val + '))';

    if Column.Field = cdsCAListisSellerStr then
      S := 'AND (id_Seller in (SELECT id_Obj FROM VW_CA (NOLOCK) WHERE isSeller = ' + Val + ')' +
      'OR id_Bayer in (SELECT id_Obj FROM VW_CA (NOLOCK) WHERE isSeller = ' + Val + '))';

    if Column.Field = cdsCAListisUsedStr then
      S := 'AND (id_Seller in (SELECT id_Obj FROM VW_CA (NOLOCK) WHERE isUsedStr = ' + Val + ')' +
      'OR id_Bayer in (SELECT id_Obj FROM VW_CA (NOLOCK) WHERE isUsedStr = ' + Val + '))';


    if Column.Field = cdsCAListObjName then
      S := 'AND (id_Seller = ' + cdsCAListid_Obj.AsString + ' OR id_Bayer = ' + cdsCAListid_Obj.AsString + ')';

    if Column.Field = cdsCAListCAName then
      S := 'AND (BayerID_CA = ' + cdsCAListPID.AsString + ' OR SellerID_CA = ' + cdsCAListPID.AsString + ')';
               }
end;

procedure TDataList.sCheckBox1Click(Sender: TObject);
begin
  if sCheckBox1.Checked then
  begin
    pnFlt.Align := alLeft;
    pnFlt.Width := 400;
    spFlt.Align := alLeft;
    spFlt.Left := pnFlt.Width + 1;
    
    pcFlt2.Align := alTop;
    spCond.Align := alTop;
    pcFlt2.Height := 200;
    spCond.Top := 201;
  end
  else
  begin
    pnFlt.Align := alTop;
    pnFlt.Height := 200;
    spFlt.Align := alTop;
    spFlt.top := pnFlt.top + pnFlt.Height + 1;

    pcFlt2.Align := alLeft;
    spCond.Align := alLeft;
    pcFlt2.Width := 500;
    spCond.Left := 501;
  end;
end;

procedure TDataList.aEditReprExecute(Sender: TObject);
var AID: integer;
begin
  AID := cdsCAListid_Obj.AsInteger;
  ShowObjProp_Adv(AID, -1, Handle, false);


end;

procedure TDataList.dsCAListDataChange(Sender: TObject; Field: TField);
begin
  aEditRepr.Enabled := not cdsCAList.IsEmpty and (cdsCAListid_Obj.AsInteger > 0);
  aEditCA.Enabled := not cdsCAList.IsEmpty and (cdsCAListid_Obj.AsInteger > 0);
  aBuffClear.Visible := (cdsCAListid_Obj.AsInteger = -777);
end;

procedure TDataList.cbNeoprClick(Sender: TObject);
begin
  fltTree.Enabled := not cbNeopr.Checked;
  lbFlt.Enabled := not cbNeopr.Checked;
  pnFltControls.Enabled := not cbNeopr.Checked;

 // dbgCA.Enabled := not cbNeopr.Checked;

  if cbNeopr.Checked then
  begin
    DisableControl(dbgCA);
    DisableControl(cbNeopr.Parent);
    cbNeopr.Parent.Enabled := true;
    cbNeopr.Enabled := true;
    sButton2.Enabled := true;
    LoadFilesList(Null, true);
  end
  else
  begin
    EnableControl(cbNeopr.Parent);
    EnableControl(dbgCA);

    LoadFilesList(null, false);
  end;
end;

procedure TDataList.DoRefrMsg2(var Msg: TMessage);
begin
  Refr;
end;

procedure TDataList.aEditCAExecute(Sender: TObject);
var AID: integer;
begin
  AID := cdsCAListPID.AsInteger;
  ShowObjProp_Adv(AID, -1, Handle, false);
end;

procedure TDataList.btnNameClick(Sender: TObject);
begin
  FilterEdit.Text := clipBoard.AsText;

end;

procedure TDataList.FilterEditChange(Sender: TObject);
begin
  with cdsCAList   do
  begin
    DisableControls;
    try
      Filtered := False;
      FilterOptions := [foCaseInsensitive];
      Filtered := Trim(FilterEdit.Text) <> '';

      LoadFilesList(Null, false);
    //  if Filtered then
     //   dbgCACellClick(dbgCA.Columns[0])
    finally
      EnableControls;
    end;
  end;

end;

procedure TDataList.cdsCAListFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(cdsCAListObjName.AsString)) > 0)
     or (Pos(S, AnsiUpperCase(cdsCAListCAName.AsString)) > 0)
     or (Pos(S, AnsiUpperCase(cdsCAListWorkType.AsString)) > 0)
     or (Pos(S, AnsiUpperCase(cdsCAListRealWorkType.AsString)) > 0);

end;

function TDataList.CAIDList: Variant;
var ID_Obj : integer;
begin
  with cdsCAList do
  begin
    if (cdsCAList.Filter = '1=1') or (not cdsCAList.Filtered) then
    begin
      Result := Null;
      exit;
    end;
    DisableControls;
    Result := '';
    try
      ID_Obj := cdsCAListid_Obj.AsInteger;
      First;
      while not Eof do
      begin
        if Result <> '' then Result := Result + ',';
        Result := Result + cdsCAListid_Obj.AsString;

        Next;
      end;
    finally
      Locate('ID_Obj', ID_Obj, [loCaseInsensitive]);
      EnableControls;
    end;
  end;
end;

procedure TDataList.cdsCAListAfterOpen(DataSet: TDataSet);
begin
//  LoadFilesList(Null, false);
end;

procedure TDataList.aBuffClearExecute(Sender: TObject);
var S : String;
    N, i : integer;
begin
  N := DM.rsCA.AppServer.WD_BuffCnt;
  S := '';
  if N > 0 then
    S := 'Хотите удалить из буфера ' + IntToStr(N) + ' файлов';
  if MessageBox(Handle, PChar(S), 'Подтвердите учистку буфера', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    DM.rsCA.AppServer.WD_BuffClear;
    if cdsCAListid_Obj.AsInteger = -777 then
    begin
      S := 'AND id_File in (select id_File from WD_Buff where id_User=' + IntToStr(DM.ID_User) + ')';
    end;
    LoadFilesList(S, false);
  end;
  DM.RefrBuffCount;
end;

end.
