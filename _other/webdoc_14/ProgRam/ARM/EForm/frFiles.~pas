unit frFiles;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, foMyFuncEh, foMyFuncEhExcel, uFileProp,
  ActnList, Menus, Db, DBClient, Clipbrd, uDM, GridsEh, DBGridEh, EhLibCDS, ActiveX, ComObj,
  sDialogs, StdCtrls, sButton, sEdit, sLabel, ExtCtrls, sPanel, FileCtrl;

type
  TfFiles = class(TFrame)
    pmFile: TPopupMenu;
    N5: TMenuItem;
    N4: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ActionList1: TActionList;
    aFileEdit: TAction;
    aFileCopy: TAction;
    aCopySelected: TAction;
    cdsFileList: TClientDataSet;
    cdsFileListid_File: TIntegerField;
    cdsFileListFileGUID: TStringField;
    cdsFileListDeleted: TBooleanField;
    cdsFileListid_DocType: TIntegerField;
    cdsFileListid_WorkType: TIntegerField;
    cdsFileListid_Seller: TIntegerField;
    cdsFileListid_Bayer: TIntegerField;
    cdsFileListid_Org3: TIntegerField;
    cdsFileListid_Org4: TIntegerField;
    cdsFileListDocNum: TStringField;
    cdsFileListDocDate: TDateTimeField;
    cdsFileListDocDateStop: TDateTimeField;
    cdsFileListDateCreate: TDateTimeField;
    cdsFileListisAutoLong: TBooleanField;
    cdsFileListDocSumm: TBCDField;
    cdsFileListid_Crn: TIntegerField;
    cdsFileListid_State: TIntegerField;
    cdsFileListComment: TStringField;
    cdsFileListxVers: TIntegerField;
    cdsFileListCalcName: TStringField;
    cdsFileListOrigName: TStringField;
    cdsFileListFileInfo: TStringField;
    cdsFileListAdv_Digit1: TBCDField;
    cdsFileListAdv_Digit2: TBCDField;
    cdsFileListAdv_Digit3: TBCDField;
    cdsFileListAdv_Digit4: TBCDField;
    cdsFileListAdv_Digit5: TBCDField;
    cdsFileListAdv_Digit6: TBCDField;
    cdsFileListAdv_Digit7: TBCDField;
    cdsFileListAdv_Digit8: TBCDField;
    cdsFileListAdv_Digit9: TBCDField;
    cdsFileListAdv_Digit10: TBCDField;
    cdsFileListAdv_Str1: TStringField;
    cdsFileListAdv_Str2: TStringField;
    cdsFileListAdv_Str3: TStringField;
    cdsFileListAdv_Str4: TStringField;
    cdsFileListAdv_Str5: TStringField;
    cdsFileListAdv_Str6: TStringField;
    cdsFileListAdv_Str7: TStringField;
    cdsFileListAdv_Str8: TStringField;
    cdsFileListAdv_Str9: TStringField;
    cdsFileListAdv_Str10: TStringField;
    cdsFileListAdv_Date1: TDateTimeField;
    cdsFileListAdv_Date2: TDateTimeField;
    cdsFileListAdv_Date3: TDateTimeField;
    cdsFileListAdv_Date4: TDateTimeField;
    cdsFileListAdv_Date5: TDateTimeField;
    cdsFileListAdv_Date6: TDateTimeField;
    cdsFileListAdv_Date7: TDateTimeField;
    cdsFileListAdv_Date8: TDateTimeField;
    cdsFileListAdv_Date9: TDateTimeField;
    cdsFileListAdv_Date10: TDateTimeField;
    cdsFileListID_NS: TIntegerField;
    cdsFileListBayerName: TStringField;
    cdsFileListSellerName: TStringField;
    cdsFileListOrg3Name: TStringField;
    cdsFileListOrg4Name: TStringField;
    cdsFileListWorkTypeName: TStringField;
    cdsFileListDocTypeName: TStringField;
    cdsFileListStateName: TStringField;
    cdsFileListCrnName: TStringField;
    cdsFileListBayerCAName: TStringField;
    cdsFileListBayerID_CA: TIntegerField;
    cdsFileListSellerCAName: TStringField;
    cdsFileListSellerID_CA: TIntegerField;
    dsFileList: TDataSource;
    dbgFileList: TDBGridEh;
    cdsFileListxID_NS: TIntegerField;
    cdsFileListid_email: TIntegerField;
    cdsFileListFileSize: TIntegerField;
    cdsFileListid_DicFile1: TIntegerField;
    cdsFileListid_DicFile2: TIntegerField;
    cdsFileListid_DicFile3: TIntegerField;
    cdsFileListid_DicFile4: TIntegerField;
    cdsFileListid_DicFile5: TIntegerField;
    cdsFileListid_DicFile6: TIntegerField;
    cdsFileListid_DicFile7: TIntegerField;
    cdsFileListid_DicFile8: TIntegerField;
    cdsFileListid_DicFile9: TIntegerField;
    cdsFileListid_DicFile10: TIntegerField;
    cdsFileListisBayer: TBooleanField;
    cdsFileListisSeller: TBooleanField;
    cdsFileListEmailDateCreate: TDateTimeField;
    cdsFileListEmailDate: TDateTimeField;
    cdsFileListEmailFrom: TStringField;
    cdsFileListEmailName: TStringField;
    cdsFileListEmailTo: TStringField;
    cdsFileListSubj: TStringField;
    aOpen: TAction;
    aSendMail: TAction;
    N1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    aDelFile: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    aSave: TAction;
    N10: TMenuItem;
    sSaveDialog1: TsSaveDialog;
    aCopyData: TAction;
    N11: TMenuItem;
    aSetRead: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    aSelAll: TAction;
    N14: TMenuItem;
    cdsFileListDC2: TDateTimeField;
    aOpenWith: TAction;
    N15: TMenuItem;
    aCopyToBuff: TAction;
    N16: TMenuItem;
    sPanel1: TsPanel;
    sLabel5: TsLabel;
    FilterEdit: TsEdit;
    sButton3: TsButton;
    sSaveDialog2: TsSaveDialog;
    cdsFileListid_User_F: TIntegerField;
    cdsFileListBayerDeleted: TBooleanField;
    cdsFileListSellerDeleted: TBooleanField;
    cdsFileListFIO: TStringField;
    cdsFileListid_User_L: TIntegerField;
    cdsFileListLastFIO: TStringField;
    cdsFileListLastEdit: TDateTimeField;
    aBuff: TAction;
    N17: TMenuItem;
    aBuffOut: TAction;
    N18: TMenuItem;
    N19: TMenuItem;
    procedure aFileEditExecute(Sender: TObject);
    procedure aFileCopyExecute(Sender: TObject);
    procedure aCopySelectedExecute(Sender: TObject);
    procedure dsFileListDataChange(Sender: TObject; Field: TField);
    procedure dbgFileListDblClick(Sender: TObject);
    procedure dbgFileListDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure aOpenExecute(Sender: TObject);
    procedure aSendMailExecute(Sender: TObject);
    procedure aDelFileExecute(Sender: TObject);
    procedure dbgFileListCellClick(Column: TColumnEh);
    procedure aSaveExecute(Sender: TObject);
    procedure aCopyDataExecute(Sender: TObject);
    procedure aSetReadExecute(Sender: TObject);
    procedure aSelAllExecute(Sender: TObject);
    procedure cdsFileListCalcFields(DataSet: TDataSet);
    procedure aOpenWithExecute(Sender: TObject);
    procedure aCopyToBuffExecute(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure FilterEditChange(Sender: TObject);
    procedure cdsFileListFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure dbgFileListSelectionChanged(Sender: TObject);
    procedure aBuffExecute(Sender: TObject);
    procedure aBuffOutExecute(Sender: TObject);
  private
    procedure RefrSelectedCount;
    procedure SaveSelected;
    procedure InOutBuff(isAdd: boolean);
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Init(OnlyNAN : boolean; CAIDList : Variant; ExtSQL: Variant; ClearParams : boolean = true);
    procedure DoRefrMsg2(var Msg: TMessage); message xxx_WD_RefrMsg;
  end;

implementation

uses foMyFunc;

{$R *.DFM}

procedure TfFiles.aFileEditExecute(Sender: TObject);
var id_File : integer;
begin
  id_File := cdsFileListid_File.AsInteger;
  ShowDocProp_Adv(id_File, Handle, false);
{
  if ShowDocProp(false, id_File) then
  begin
    FixIdRefresh(cdsFileList, 'id_File', id_File);
  end; }
end;

procedure TfFiles.aFileCopyExecute(Sender: TObject);
var id_File : integer;
begin
  id_File := cdsFileListid_File.AsInteger;
  ShowDocProp_Adv(id_File, Handle, true);
{  if ShowDocProp(true, id_File) then
  begin
    FixIdRefresh(cdsFileList, 'id_File');
  end;  }
end;

procedure TfFiles.aCopySelectedExecute(Sender: TObject);
begin
  Clipboard.AsText:=GridSelectionAsExcelText(dbgFileList)

end;

procedure TfFiles.dsFileListDataChange(Sender: TObject; Field: TField);
begin
  RefrSelectedCount;
  aBuffOut.Enabled := not cdsFileList.IsEmpty;
  aBuff.Enabled := not cdsFileList.IsEmpty;
  aCopyData.Enabled := not cdsFileList.IsEmpty;
  aFileEdit.Enabled := not cdsFileList.IsEmpty;
  aOpen.Enabled := not cdsFileList.IsEmpty;
  aSendMail.Enabled := not cdsFileList.IsEmpty;
  aDelFile.Enabled := not cdsFileList.IsEmpty;
  aFileCopy.Enabled := not cdsFileList.IsEmpty;
  aSave.Enabled := not cdsFileList.IsEmpty;
  aSetRead.Enabled := not cdsFileList.IsEmpty;
  aOpenWith.Enabled := not cdsFileList.IsEmpty;
  aCopyToBuff.Enabled := not cdsFileList.IsEmpty;
end;

procedure TfFiles.dbgFileListDblClick(Sender: TObject);
begin
  aFileEdit.Execute;
end;

procedure TfFiles.dbgFileListDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
    S, s2 : String;
    R: TRect;
    ImgIndex : integer;
    SmallIcon : HICON;
begin
  if cdsFileListxVers.AsInteger = 0 then
     dbgFileList.Canvas.Font.Style := [fsBold]
  else
     dbgFileList.Canvas.Font.Style := [];
     
  if (gdSelected in State) then
  begin
    dbgFileList.Canvas.Brush.Color := clHighlight;
    dbgFileList.Canvas.FillRect(Rect);
    dbgFileList.Canvas.Font.Color := clWhite;
  end
  else
  begin
    dbgFileList.Canvas.Brush.Color := clWindow;
    dbgFileList.Canvas.FillRect(Rect);
    dbgFileList.Canvas.Font.Color := Column.Font.Color;
    if cdsFileListisAutoLong.AsBoolean then
      dbgFileList.Canvas.Brush.Color := clRed;
  end;
  dbgFileList.Canvas.FillRect(Rect);
  
  S := Column.Field.DisplayText;
  R := Rect;
  if (Column.Field = cdsFileListCalcName) or (Column.Field = cdsFileListOrigName) then
  begin

    R.Top := R.Top + 0;
    S2 := UpperCase(ExtractFileExt(cdsFileListOrigName.AsString));

    GetAssociatedIcon(S2, nil, @SmallIcon);
    if SmallIcon <> 0 then
      DrawIconEx(dbgFileList.Canvas.Handle, R.Left, R.Top, SmallIcon, 16, 16, 0, dbgFileList.Canvas.Brush.Handle, DI_NORMAL);
    R.Left := R.Left + 16 + 5;
    DrawText(dbgFileList.Canvas.Handle, PChar(S), -1, R, DT_LEFT or DT_END_ELLIPSIS);
    DestroyIcon(SmallIcon);
   end
  else
  begin
    R.Top := R.Top + 2;
    DrawText(dbgFileList.Canvas.Handle, PChar(S), -1, R, DT_LEFT or DT_END_ELLIPSIS)
  end;

end;

constructor TfFiles.Create(AOwner: TComponent);
var i : integer;
begin
  inherited Create(AOwner);
  LoadEhGridSettingsFromRegistry(dbgFileList, SRegPath + '\' + GetControlOwner(Self).ClassName + '\' + ClassName);


  SetGridProps(dbgFileList, true, true, true, '### ### ##0.##');
  cdsFileListDC2.DisplayFormat := 'yyyy-mm-dd hh:nn';

          DM.cdsDDD.Close;
          DM.cdsDDD.Params.ParamByName('@id_NS').Value := DM.id_NS;
          DM.cdsDDD.Params.ParamByName('@isInt').Value := Null;
          DM.cdsDDD.Open;
  for i := dbgFileList.Columns.Count - 1 downto 0 do
  begin
        if DM.cdsDDD.Locate('ColName', dbgFileList.Columns[i].Field.FieldName, [loCaseInsensitive]) then
        begin
          if DM.cdsDDDisVisible.AsBoolean then
          begin
            dbgFileList.Columns[i].Title.Caption := DM.cdsDDDParamName.AsString;
            dbgFileList.Columns[i].Visible := true;
          end
          else
            dbgFileList.Columns[i].Free;
        end;
  end;
end;

destructor TfFiles.Destroy;
begin
  SaveEhGridSettingsToRegistry(dbgFileList, SRegPath + '\' + GetControlOwner(Self).ClassName + '\' + ClassName);
  inherited;

end;

procedure TfFiles.aOpenExecute(Sender: TObject);
var S : String;
begin
  S := cdsFileListCalcName.AsString;
  if S = '' then
    S := cdsFileListOrigName.AsString;
  DM.DLDFile(cdsFileListid_File.AsInteger, S);
end;

procedure TfFiles.aSendMailExecute(Sender: TObject);
 const
   olMailItem = 0;
   olByValue = 1;

  procedure AddAtt(MyAttachments: OLEVariant);
  var S, S2 : String;
  begin
    S := cdsFileListCalcName.AsString;
    if S = '' then
      S := cdsFileListOrigName.AsString;
    S2 := DM.DownLoadFile(cdsFileListid_File.AsInteger, S);

    myAttachments.Add(S2, olByValue, 1, S); 
  end;

var S, S2, sSubj : String;
   i : Integer;
   ClassID: TCLSID;
   ClassName : String;
   Unknown: IUnknown;
   Dispatch : IDispatch;
   Res: HResult;
   OutlookApp, MailItem, MyAttachments: OLEVariant;
begin
  S := cdsFileListCalcName.AsString;
  if S = '' then
    S := cdsFileListOrigName.AsString;

  sSubj := S;
  if dbgFileList.Selection.SelectionType = gstAll then
    sSubj := 'Отправка ' + IntToStr(cdsFileList.RecordCount) + ' файлов';
  if dbgFileList.SelectedRows.Count > 0 then
    sSubj := 'Отправка ' + IntToStr(dbgFileList.SelectedRows.Count) + ' файлов';

   ClassName := 'Outlook.Application';
   OutlookApp := Null;
   try
     OutlookApp := GetActiveOleObject(ClassName {'Outlook.Application'});
   except
     OutlookApp := CreateOleObject(ClassName {'Outlook.Application'});
     try OutlookApp.Display;   except   end;
   end;  
   try
     MailItem := OutlookApp.CreateItem(olMailItem);
     try
        MailItem.Display; // Show Outlook Message Window
     except
     end;


   //  MailItem.Recipients.Add('');
    // MailItem.HtmlBody  := '<html> <body> <b>Привет</b>, Мир! </body> </html>';

     MailItem.Subject := S;
     myAttachments := MailItem.Attachments;

     if dbgFileList.Selection.SelectionType = gstAll then
      begin
        with cdsFileList do
        begin
          DisableControls;

          First;
          while not Eof do
          begin
            AddAtt(MyAttachments);
            Next;
          end;
        end;
      end
      else
      if dbgFileList.SelectedRows.Count > 0 then
      begin
        cdsFileList.DisableControls;
        for i := 0 to dbgFileList.SelectedRows.Count - 1 do
        begin
          dbgFileList.DataSource.DataSet.GotoBookmark(pointer(dbgFileList.SelectedRows.Items[i]));
          AddAtt(MyAttachments);
        end;
      end
      else
      begin
        AddAtt(MyAttachments);
      end;



  finally
    DM.RefrBuffCount;
    cdsFileList.EnableControls;
  end;

end;

procedure TfFiles.aDelFileExecute(Sender: TObject);
var S : String;
    i, id_File : integer;
begin
  S := cdsFileListCalcName.AsString;
  if S = '' then
    S := cdsFileListOrigName.AsString;

  S := 'Удалить файл ' + S + '?';

  if dbgFileList.Selection.SelectionType = gstAll then
    S := 'Удалить ' + IntToStr(cdsFileList.RecordCount) + ' файлов?';
  if dbgFileList.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(dbgFileList.SelectedRows.Count) + ' файлов?';

  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if dbgFileList.Selection.SelectionType = gstAll then
      begin
        with cdsFileList do
        begin
          DisableControls;

          First;
          while not Eof do
          begin
            DM.rsCA.AppServer.FileDel(cdsFileListid_File.AsInteger);
            Next;
          end;
        end;
      end
      else
      if dbgFileList.SelectedRows.Count > 0 then
      begin
        cdsFileList.DisableControls;
        for i := 0 to dbgFileList.SelectedRows.Count - 1 do
        begin
          dbgFileList.DataSource.DataSet.GotoBookmark(pointer(dbgFileList.SelectedRows.Items[i]));
          DM.rsCA.AppServer.FileDel(cdsFileListid_File.AsInteger);
        end;
      end
      else
        DM.rsCA.AppServer.FileDel(cdsFileListid_File.AsInteger);
    finally
      cdsFileList.EnableControls;
      FixIdRefresh(cdsFileList, 'id_File', id_File);
    end;
{    try
      DM.rsCA.AppServer.FileDel(cdsFileListid_File.AsInteger);
    finally
      FixIdRefresh(cdsFileList, 'id_File', -1);
    end;   }
  end;
end;

procedure TfFiles.Init(OnlyNAN : boolean; CAIDList : Variant; ExtSQL: Variant; ClearParams : boolean = true);
var i : integer;
begin
  Screen.Cursor := crSQLWait;
  try
    cdsFileList.Close;
   // if ExtSQL = '***' then ExtSQL := cdsFileList.Params.ParamByName('@ExtSQL').Value;
    if ClearParams then
    begin
      for i := 0 to cdsFileList.Params.Count - 1 do
        cdsFileList.Params[i].Value := Null;
    end;
    
    cdsFileList.Params.ParamByName('@id_NS').Value := DM.id_NS;
    cdsFileList.Params.ParamByName('@ID_User').Value := DM.ID_User;
    cdsFileList.Params.ParamByName('@OnlyNAN').AsBoolean := OnlyNAN;
    cdsFileList.Params.ParamByName('@CAIDList').Value := CAIDList;

    cdsFileList.Params.ParamByName('@ExtSQL').Value := ExtSQL;

    try
      cdsFileList.Open;
    except
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfFiles.dbgFileListCellClick(Column: TColumnEh);
begin
 // dbgFileList.ShowHint := False;
  dbgFileList.Hint := Column.DisplayText;
 // dbgFileList.ShowHint := True;
  Application.ActivateHint(Mouse.CursorPos);

 // Application.s
end;

procedure TfFiles.DoRefrMsg2(var Msg: TMessage);
begin
  FixIdRefresh(cdsFileList, 'id_File', Msg.WParam);
end;

procedure TfFiles.aSaveExecute(Sender: TObject);
var SL : TStringList;
    i, X : integer;
    S, sExt : String;
begin
  if (dbgFileList.Selection.SelectionType = gstAll) or (dbgFileList.SelectedRows.Count > 0) then
  begin
    SaveSelected;
    Exit;
  end;

  S := cdsFileListCalcName.AsString;
  if S = '' then
    S := cdsFileListOrigName.AsString;
  sSaveDialog1.DefaultExt := ExtractFileExt(S);
  sExt := AnsiUpperCase(sSaveDialog1.DefaultExt) + ')';
  sSaveDialog1.FileName := S;

  SL := TStringList.Create;
  try
    SL.Text := xStringReplace(sSaveDialog2.Filter, ['|'], #13 + #10); 
    sSaveDialog1.Filter := 'Все файлы (*.*)|*.*';
    for i := 0 to SL.Count - 1 do
      if (POS('(', SL[i]) > 0) and (POS(sExt, AnsiUpperCase(SL[i])) > 0) then
      begin
        sSaveDialog1.Filter := sSaveDialog1.Filter + '|' + SL[i] + '|' + SL[i + 1];
        sSaveDialog1.FilterIndex := 2;
      end;
  finally
    SL.Free;
  end;
  if sSaveDialog1.Execute then
    DM.DownLoadFile(cdsFileListid_File.AsInteger, sSaveDialog1.FileName, false);
end;

procedure TfFiles.aCopyDataExecute(Sender: TObject);
begin
  DM.mdOperBuff.Close;
  CloneCDS2(cdsFileList, DM.mdOperBuff, true);
end;

procedure TfFiles.aSetReadExecute(Sender: TObject);
var i, id_File : integer;
begin
  id_File := cdsFileListid_File.AsInteger;
    try
      if dbgFileList.Selection.SelectionType = gstAll then
      begin
        with cdsFileList do
        begin
          DisableControls;

          First;
          while not Eof do
          begin
            DM.rsCA.AppServer.WD_FileSetRead(cdsFileListid_File.AsInteger, DM.id_User);
            Next;
          end;
        end;
      end
      else
      if dbgFileList.SelectedRows.Count > 0 then
      begin
        cdsFileList.DisableControls;
        for i := 0 to dbgFileList.SelectedRows.Count - 1 do
        begin
          dbgFileList.DataSource.DataSet.GotoBookmark(pointer(dbgFileList.SelectedRows.Items[i]));
          DM.rsCA.AppServer.WD_FileSetRead(cdsFileListid_File.AsInteger, DM.id_User);
        end;
      end
      else
        DM.rsCA.AppServer.WD_FileSetRead(cdsFileListid_File.AsInteger, DM.id_User);
    finally
      cdsFileList.EnableControls;
      FixIdRefresh(cdsFileList, 'id_File', id_File);
    end;
end;

procedure TfFiles.aSelAllExecute(Sender: TObject);
begin
  dbgFileList.SelectedRows.SelectAll;
 // dbgFileList.Selection.SelectAll;
end;

procedure TfFiles.cdsFileListCalcFields(DataSet: TDataSet);
begin
  cdsFileListDC2.AsVariant := cdsFileListDateCreate.AsVariant;
end;

procedure TfFiles.aOpenWithExecute(Sender: TObject);
var S : String;
begin
  S := cdsFileListCalcName.AsString;
  if S = '' then
    S := cdsFileListOrigName.AsString;
  DM.DLDFile(cdsFileListid_File.AsInteger, S, true);
end;

procedure TfFiles.aCopyToBuffExecute(Sender: TObject);
var S : String;
begin
  S := cdsFileListCalcName.AsString;
  if S = '' then
    S := cdsFileListOrigName.AsString;

  S := DM.DownLoadFile(cdsFileListid_File.AsInteger, S, true);
  if S <> '' then
    DM.CopyFilesToClipboard(S);
//*
end;

procedure TfFiles.sButton3Click(Sender: TObject);
begin
  FilterEdit.Text := clipBoard.AsText;

end;

procedure TfFiles.FilterEditChange(Sender: TObject);
begin
  with cdsFileList   do
  begin
    DisableControls;
    try
      Filtered := False;
      FilterOptions := [foCaseInsensitive];
      Filtered := Trim(FilterEdit.Text) <> '';
    finally
      EnableControls;
    end;
  end;


end;

procedure TfFiles.cdsFileListFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(cdsFileListOrigName.AsString)) > 0)
     or (Pos(S, AnsiUpperCase(cdsFileListid_File.AsString)) > 0)
    or (Pos(S, AnsiUpperCase(cdsFileListCalcName.AsString)) > 0)
     or (Pos(S, AnsiUpperCase(cdsFileListEmailFrom.AsString)) > 0)
     or (Pos(S, AnsiUpperCase(cdsFileListEmailName.AsString)) > 0)
     or (Pos(S, AnsiUpperCase(cdsFileListEmailTo.AsString)) > 0)
     or (Pos(S, AnsiUpperCase(cdsFileListWorkTypeName.AsString)) > 0)
     or (Pos(S, AnsiUpperCase(cdsFileListComment.AsString)) > 0);

end;

// [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect]
procedure TfFiles.dbgFileListSelectionChanged(Sender: TObject);
begin
  RefrSelectedCount;
end;

procedure TfFiles.RefrSelectedCount;
var S : String;
begin
  S := 'Выбрано 0 файлов';
  if dbgFileList.Selection.SelectionType = gstAll then
    S := 'Выбрано ' + IntToStr(dbgFileList.DataSource.DataSet.RecordCount) + ' файлов'
  else
  begin
    if dbgFileList.SelectedRows.Count > 0 then
      S := 'Выбрано ' + IntToStr(dbgFileList.SelectedRows.Count) + ' файлов'
    else
    if (dbgFileList.DataSource <> nil) and (dbgFileList.DataSource.DataSet <> nil) and dbgFileList.DataSource.DataSet.IsEmpty then
      S := 'Выбран 1 файл';
  end;
  uDM.ShowText(S);
end;

procedure TfFiles.aBuffExecute(Sender: TObject);
begin
  InOutBuff(true);
end;

procedure TfFiles.InOutBuff(isAdd: boolean);
  procedure AddOneFile( );
  begin
    DM.rsCA.AppServer.WD_BuffAdd(cdsFileListid_File.AsInteger, isAdd);
  end;
var i : integer;
begin
  try
      if dbgFileList.Selection.SelectionType = gstAll then
      begin
        with cdsFileList do
        begin
          DisableControls;

          First;
          while not Eof do
          begin
            AddOneFile;
            Next;
          end;
        end;
      end
      else
      if dbgFileList.SelectedRows.Count > 0 then
      begin
        cdsFileList.DisableControls;
        for i := 0 to dbgFileList.SelectedRows.Count - 1 do
        begin
          dbgFileList.DataSource.DataSet.GotoBookmark(pointer(dbgFileList.SelectedRows.Items[i]));
          AddOneFile;
        end;
      end
      else
      begin
        AddOneFile;
      end;
  finally
    DM.RefrBuffCount;
    cdsFileList.EnableControls;
  end;
end;

procedure TfFiles.SaveSelected;
var    chosenDirectory : string;
  procedure SaveOneFile( );
  var S, sExt : String;
  begin
    S := cdsFileListCalcName.AsString;
    if S = '' then
      S := cdsFileListOrigName.AsString;
    sExt := ExtractFileExt(S);
    S := chosenDirectory + '\' + S;
  {  if FileExists(S) then
    begin
      if sExt = '' then
        S := S +  ' ' + cdsFileListid_File.AsString 
      else
        S := StringReplace(S, sExt, ' ' + cdsFileListid_File.AsString + sExt, []);
    end;  }
    if FileExists(S) then
    begin
      if sExt = '' then
        S := S +  ' ' + FormatDateTime('yyyy-mm-dd hh:nn:ss', now())
      else
        S := StringReplace(S, sExt, ' ' + FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', now()) + sExt, []);
    end;

    DM.DownLoadFile(cdsFileListid_File.AsInteger, S, false);
  end;

var S, S2, sSubj : String;
   i : Integer;
begin
  try
      chosenDirectory := 'C:\';
    if dbgFileList.Selection.SelectionType = gstAll then
      S := IntToStr(cdsFileList.RecordCount) + ' файлов?';
    if dbgFileList.SelectedRows.Count > 0 then
      S := IntToStr(dbgFileList.SelectedRows.Count) + ' файлов?';
    
    if SelectDirectory('Куда сохранить ' + S, chosenDirectory, chosenDirectory) then
    begin
        if dbgFileList.Selection.SelectionType = gstAll then
        begin
          with cdsFileList do
          begin
            DisableControls;

            First;
            while not Eof do
            begin
              SaveOneFile;
              Next;
            end;
          end;
        end
        else
        if dbgFileList.SelectedRows.Count > 0 then
        begin
          cdsFileList.DisableControls;
          for i := 0 to dbgFileList.SelectedRows.Count - 1 do
          begin
            dbgFileList.DataSource.DataSet.GotoBookmark(pointer(dbgFileList.SelectedRows.Items[i]));
            SaveOneFile;
          end;
        end
        else
        begin
          SaveOneFile;
        end;
    end;
  finally
    DM.RefrBuffCount;
    cdsFileList.EnableControls;
  end;
end;

procedure TfFiles.aBuffOutExecute(Sender: TObject);
var S : String;
    i, id_File : integer;
begin
  S := cdsFileListCalcName.AsString;
  if S = '' then
    S := cdsFileListOrigName.AsString;

  S := 'Убрать из буфера файл ' + S + '?';

  if dbgFileList.Selection.SelectionType = gstAll then
    S := 'Убрать из буфера ' + IntToStr(cdsFileList.RecordCount) + ' файлов?';
  if dbgFileList.SelectedRows.Count > 0 then
    S := 'Убрать из буфера ' + IntToStr(dbgFileList.SelectedRows.Count) + ' файлов?';

  if MessageBox(Handle, PChar(S), 'Подтвердите удаление из буфера', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    InOutBuff(false);

  end;
end;

end.
