
unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FileCtrl,
  ExtCtrls, Menus, ComCtrls, StdCtrls,  
  ActnList, ImgList, RXCtrls, ToolWin, Tabs, foMyFunc, ComObj, ActiveX, DBGrids, DBGridEh, ShellAPI, RXDBCtrl,
  Db, ADODB, AdoConEd, DBClient, uDM, sSkinManager, sSkinProvider, Buttons,
  sSpeedButton, sToolBar, sStatusBar, sComboBox, sFileCtrl, sPanel,
  DragDrop, DropTarget, DropComboTarget, DragDropInternet, //RxHints ,

  MapiDefs, MapiTags, MAPIUtil, sButton, acAlphaHints, HTMLStatusBar;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N111: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    miWindow: TMenuItem;
    ArrangeAll1: TMenuItem;
    Cascade1: TMenuItem;
    Tile1: TMenuItem;
    N8: TMenuItem;
    Ds1: TMenuItem;
    ActionList1: TActionList;
    miRep: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    pmRep: TPopupMenu;
    aDic: TAction;
    aDict: TAction;
    N13: TMenuItem;
    rbd1: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N22: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N28: TMenuItem;
    aArc: TAction;
    N31: TMenuItem;
    Builtinskins1: TMenuItem;
    sSkinProvider1: TsSkinProvider;
    sToolBar1: TsToolBar;
    ToolButton4: TToolButton;
    sSpeedButton1: TsSpeedButton;
    sPanel1: TsPanel;
    cbNS: TsComboBox;
    sSpeedButton2: TsSpeedButton;
    N2: TMenuItem;
    aUpLoad: TAction;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton5: TsSpeedButton;
    sSpeedButton6: TsSpeedButton;
    Button1: TButton;
    N3: TMenuItem;
    pnOutlook: TsPanel;
    dctFiles2: TDropComboTarget;
    DataFormatAdapterOutlook: TDataFormatAdapter;
    aNote: TAction;
    sSpeedButton4: TsSpeedButton;
    sSpeedButton7: TsSpeedButton;
    sButton1: TsButton;
    sAlphaHints1: TsAlphaHints;
    miErrorLog: TMenuItem;
    N4: TMenuItem;
    pnLog: TsPanel;
    sButton2: TsButton;
    MainStatusBar: THTMLStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure Tile1Click(Sender: TObject);
    procedure ArrangeAll1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aDictExecute(Sender: TObject);
    procedure cbNSChange(Sender: TObject);
    procedure Ds1Click(Sender: TObject);
    procedure aArcExecute(Sender: TObject);
    procedure aUpLoadExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dctFiles2Drop(Sender: TObject; ShiftState: TShiftState;
      APoint: TPoint; var Effect: Integer);
    procedure aNoteExecute(Sender: TObject);
    procedure miErrorLogClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure MainStatusBarPanelClick(Sender: TObject;
      PanelIndex: Integer);
  private
    OutlookApp, MailItem, MyAttachments: OLEVariant;
    SL_OB : TStringList;
    inLoad : boolean;
    procedure ActiveFormChange(Sender: TObject);
    procedure MakeMI(AForm: TComponent);
    procedure XXXExcelEh(Sender: TObject);
    procedure XXXSetEh(Sender: TObject);
    procedure GenerateSkinsList;
    procedure SkinMenuClick(Sender: TObject);
  public
    procedure SkinManager1SkinListChanged;
    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
    procedure STMessage(var Message: TMessage); message WM_ShowText;

    function GetID_NS2: Variant;
    procedure GetBSNList(ID_NS: variant);
  end;

var
  MainForm: TMainForm;
  MapiInit: TMAPIINIT_0 = (Version: MAPI_INIT_VERSION; Flags: 0);

implementation

uses uPrgForm, uSettings, foMyFuncDXTreeExcel, foMyFuncEh, foMyFuncEhExcel,
  uEForm, uDataList, uArcPropEh, uFileProp, uExtData, uNote, uLog,
  uCAByEmail;


{$R *.DFM}

procedure TMainForm.GenerateSkinsList;
  procedure AddMI(AText : String);
  var mi : TMenuItem;
  begin
    mi := TMenuItem.Create(Application);
    mi.Caption := AText;
    if (mi.Caption <> '-') then
    begin
      if mi.Caption = DM.sSkinManager1.SkinName then mi.Checked := True;
      mi.OnClick := SkinMenuClick;
      mi.RadioItem := True;
    end;
    if (Builtinskins1.Count <> 0) and (Builtinskins1.Count mod 20 = 0) then
      mi.Break := mbBreak;
    Builtinskins1.Add(mi);
  end;
var
  sl : TStringList;
  i : integer;
begin
try
  sl := TStringList.Create;
  Builtinskins1.Clear;
  AddMI('нет');
  AddMI('-');

  for i := 0 to DM.sSkinManager1.InternalSkins.Count - 1 do
  begin
    AddMI(DM.sSkinManager1.InternalSkins[i].Name);
  end;
  sl.Clear;
 // DM.sSkinManager1.GetExternalSkinNames(sl);
  if sl.Count > 0 then
  begin
    AddMI('-');

    sl.Sort;
    for i := 0 to sl.Count - 1 do
    begin
      AddMI(sl[i]);
    end;
  end;
  FreeAndNil(sl);
except
end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var i : integer;
    MI, MI2 : TMenuItem;
    V : Variant;
begin
  DM.RefrBuffCount;
  if not DM.is_Admin then
  begin
    N111.Enabled := false;
  end;

  if not FileExists(ExtractFilePath(ParamStr(0)) + 'Error.log') then
    miErrorLog.Visible := false;
  
  try
      DM.SaveInLog('MF LoadMAPI32' , AllLog);

    LoadMAPI32;
    DM.SaveInLog('MF LoadMAPI32 - ok' , AllLog);

    except
      on E : Exception
        do DM.SaveInLog('LoadMAPI32 - error '  + E.Message , AllLog);

    end;

 { try
    DM.SaveInLog('MF MAPIInitialize' , AllLog);
    OleCheck(MAPIInitialize(@MapiInit));
    DM.SaveInLog('MF MAPIInitialize - ok' , AllLog);
  except
 
    on E: Exception do
     ShowMessage(Format('Failed to initialize MAPI: %s', [E.Message]));
  end;

     }

  LoadValFromRegistry(V, SRegPath + '\' + ClassName, 'id_NS');
  GetBSNList(V);

 {   DM.SaveInLog('MF GenerateSkinsList' , AllLog);
  GenerateSkinsList;
    DM.SaveInLog('MF GenerateSkinsList - ok' , AllLog);
  SkinManager1SkinListChanged;
    }
  Screen.OnActiveFormChange := ActiveFormChange;
  DM.InitToolBars(Self);
  MFHandle := Handle;
  MainStatusBar.Panels[0].Text := 'Пользователь: ' + DM.FullFIO;
//  miCur.Enabled := DM.CheckUserRights(9, Null);


  for i := 0 to miRep.Count - 1 do
  begin
    MI2 := miRep.Items[i];
    MI := TMenuItem.Create(Self);
    pmRep.Items.Add(MI);
    if MI2.Action = nil then
      MI.Caption := MI2.Caption
    else
      MI.Action :=  MI2.Action;
    MI.Visible := MI2.Visible;
  end;

{  for i := 10 to 40 do
  begin
    DM.rsCA.AppServer.execSQLText('alter table RM_PRSN add P' + IntToStr(i) + ' varchar2(255) NULL ');
  end;  }
end;

procedure TMainForm.N8Click(Sender: TObject);
var i : integer;
begin
  for i := 0 to MDIChildCount - 1 do
    MDIChildren[i].WindowState := wsMinimized;
end;

procedure TMainForm.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm.Tile1Click(Sender: TObject);
begin
  Tile;
end;

procedure TMainForm.ArrangeAll1Click(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var i : integer;
begin
  if MessageBox(Handle, 'Завершать работу с программой?', Pchar(Application.Title), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = idYes then
  begin
    Action := caFree;
    for i := 0 to MDIChildCount - 1 do
    begin
      try
        MDIChildren[i].Close;
      except
      end;
    end;  
  end
  else
    Action := caNone;
end;


procedure TMainForm.FormDestroy(Sender: TObject);
begin
  SaveValToRegistry(GetID_NS2, SRegPath + '\' + ClassName, 'ID_NS');

  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
  MAPIUninitialize;
end;

procedure TMainForm.N33Click(Sender: TObject);
begin
 ChangeStng;
end;

procedure TMainForm.DoRefrMsg(var Msg: TMessage);
begin
//  RefresheArc(Msg.WParam)
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
    DM.SaveInLog('MF FormShow' , AllLog);
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);

end;

procedure TMainForm.STMessage(var Message: TMessage);
var S : String;
begin
  if MainStatusBar = nil then Exit;
  S := PChar(Message.WParam);
  MainStatusBar.Panels[2].Text := S;
  Enabled := False;
  Repaint;
  Enabled := true;
end;

procedure TMainForm.ActiveFormChange(Sender: TObject);
begin
 if Screen.ActiveForm <> nil then
  begin
    if (Screen.ActiveForm.Tag <> -13) then
    begin
      MakeMI(Screen.ActiveForm);
    end;
    Screen.ActiveForm.Tag := -13;
  end
  else
    ShowText('');  

  if Screen.ActiveForm <> nil then
  begin
    Screen.ActiveForm.BringToFront;
  //  showtext(Screen.ActiveForm.ClassName + ' ' + FormatDateTimeNull('hh:nn:ss:zzz', now), 3);
  end;

end;

procedure TMainForm.MakeMI(AForm: TComponent);
var i, j : integer;
    MI : TMenuitem;
    PPP : TPopupMenu;
    b, B_Set : boolean;
begin
  try
    for i := 0 to AForm.ComponentCount - 1 do
    begin
      MakeMI(AForm.Components[i]);
        
  {    if (AForm.Components[i] is TDBGridEh)
         and (TDBGridEh(AForm.Components[i]).PopupMenu <> nil) then
      begin
        b := false;
        B_Set:= TDBGridEh(AForm.Components[i]).Columns.Count = 1;
        PPP := TDBGridEh(AForm.Components[i]).PopupMenu;
        for j := 0 to PPP.Items.Count - 1 do
        begin
          if Pos('EXCEL', AnsiUpperCase(PPP.Items[j].Caption)) > 0 then
          begin
            b := true;
       //     Break;
          end;
          if Pos('НАСТРОЙКА', AnsiUpperCase(PPP.Items[j].Caption)) > 0 then
          begin
            B_Set := true;
       //     Break;
          end;
        end;
          if not b then
          begin
            MI := TMenuitem.Create(PPP);
            MI.Caption := '-';
            PPP.Items.add(MI);
            MI := TMenuitem.Create(PPP);
            MI.Caption := 'Экспорт в Excel';
            MI.OnClick := XXXExcelEh;
            MI.ImageIndex := 38;
            PPP.Items.add(MI); 
          end;
          if not B_Set then
          begin
            MI := TMenuitem.Create(PPP);
            MI.Caption := '-';
            PPP.Items.add(MI);
            MI := TMenuitem.Create(PPP);
            MI.Caption := 'Настройка таблицы';
            MI.OnClick := XXXSetEh;
            PPP.Items.add(MI); 
          end;

      end;
       }

      if (AForm.Components[i] is TDBGridEh) then
      begin
        if (TDBGridEh(AForm.Components[i]).PopupMenu = nil) then
          TDBGridEh(AForm.Components[i]).PopupMenu := TPopupMenu.Create(AForm);
        b := false;
        TDBGridEh(AForm.Components[i]).PopupMenu.Images := DM.ilImage;
        B_Set:= TDBGridEh(AForm.Components[i]).Columns.Count = 1;
        PPP := TDBGridEh(AForm.Components[i]).PopupMenu;
        for j := 0 to PPP.Items.Count - 1 do
        begin
          if Pos('EXCEL', AnsiUpperCase(PPP.Items[j].Caption)) > 0 then
          begin
            b := true;
          //  Break;
          end;
          if Pos('НАСТРОЙКА', AnsiUpperCase(PPP.Items[j].Caption)) > 0 then
          begin
            B_Set := true;
       //     Break;
          end;
        end;
          if not b then
          begin
            MI := TMenuitem.Create(PPP);
            PPP.Items.add(MI); 
            MI.Caption := '-';
            MI := TMenuitem.Create(PPP);
            PPP.Items.add(MI); 
            MI.Caption := 'Экспорт в Excel';
            MI.ImageIndex := 38;
            MI.OnClick := XXXExcelEh;
          end;
          if not B_Set then
          begin
            MI := TMenuitem.Create(PPP);
            MI.Caption := '-';
            PPP.Items.add(MI);
            MI := TMenuitem.Create(PPP);
            MI.Caption := 'Настройка таблицы';
            MI.ImageIndex := 39;
            MI.OnClick := XXXSetEh;
            PPP.Items.add(MI); 
          end;
          
      end;
    end;
  finally
  end;
end;

procedure TMainForm.XXXSetEh(Sender: TObject);
var AFrozenColCnt : integer;
    ADBGridEh : TDBGridEh;
    ADBGrid1: TDBGrid;
begin
  if TPopupMenu((Sender as TMenuItem).Owner).PopupComponent is TDBGridEh then
  begin
    ADBGridEh := TDBGridEh(TPopupMenu((Sender as TMenuItem).GetParentMenu).PopupComponent);
    AFrozenColCnt := ADBGridEh.FrozenCols;
    if ShowArcPropEh(ADBGridEh, '') then
    begin
      try
        ADBGridEh.FrozenCols := AFrozenColCnt;
      except
        ADBGridEh.FrozenCols := 0;
      end;
    end;
  end
  else
  if TPopupMenu((Sender as TMenuItem).Owner).PopupComponent is TDBGrid then
  begin
  {  ADBGrid1 := TDBGrid(TPopupMenu((Sender as TMenuItem).GetParentMenu).PopupComponent);
    ShowArcPropSmp(ADBGrid1); }
  end; 
end;

procedure TMainForm.XXXExcelEh(Sender: TObject);
begin
  if TPopupMenu((Sender as TMenuItem).Owner).PopupComponent is TDBGridEh then
    foMyFuncEhExcel.GreedToExcel(TDBGridEh(TPopupMenu((Sender as TMenuItem).GetParentMenu).PopupComponent), '')
  else
  if TPopupMenu((Sender as TMenuItem).Owner).PopupComponent is TRxDBGrid then
    foMyFunc.GreedToExcel(TRxDBGrid(TPopupMenu((Sender as TMenuItem).GetParentMenu).PopupComponent), '')
  else
  if TPopupMenu((Sender as TMenuItem).Owner).PopupComponent is TDBGrid then
    foMyFunc.GreedToExcel(TDBGrid(TPopupMenu((Sender as TMenuItem).GetParentMenu).PopupComponent), '');

end;

procedure TMainForm.SkinMenuClick(Sender: TObject);
var S : String;
begin
  S := StringReplace(TMenuItem(Sender).Caption, '&', '', []);
  if S = 'нет' then
    DM.sSkinManager1.Active := false
  else
  begin
    DM.sSkinManager1.Active := true;
    DM.sSkinManager1.SkinName := S;
  end;
  SkinManager1SkinListChanged;
end;


procedure TMainForm.SkinManager1SkinListChanged;
var
  i : integer;
  b : boolean;
  S : String;
begin
  S := DM.sSkinManager1.SkinName;
  b := True;
  if not DM.sSkinManager1.Active then
  begin
    S := 'нет';
  end;
    for i := 0 to Builtinskins1.Count - 1 do // Search of item with current skin name
      if b and (StringReplace(Builtinskins1.Items[i].Caption, '&', '', []) = S) then
      begin
        Builtinskins1.Items[i].Checked := True;
        b := False;
      end
      else
        Builtinskins1.Items[i].Checked := False;
end;


procedure TMainForm.aDictExecute(Sender: TObject);
begin
  ShowEForm();//([eotCrn])
end;

 

procedure TMainForm.GetBSNList(ID_NS: variant);
var i : integer;
begin
  inLoad := true;
  with DM.cdsNS do
  begin
    Close;
    Params.ParamByName('@id_User').Value := DM.id_User;
    Open;
    if IsEmpty and not DM.is_Admin then
    begin
      Messagebox(Application.Handle, 'Вам не открыт доступ ни к одному бизнесу' +  #13 + #10 +
                             'Программа будет закрыта.', 'В доступе отказано!!!', MB_ICONERROR + MB_OK);
      Application.Terminate;
    end;
    First;
    cbNS.Items.Clear;
    while not Eof do
    begin
      cbNS.Items.AddObject(DM.cdsNSNSName.AsString, Pointer(DM.cdsNSid_NS.AsInteger));

      Next;
    end;
  end;

  sPanel1.Visible := cbNS.Items.Count > 1;
  if (DM.ID_NS = Null) or (cbNS.Items.Count = 1) then
  begin
    cbNS.ItemIndex := 0;
    ID_NS := DM.cdsNSid_NS.AsInteger;
  end;
  if ID_NS <> Null then
  begin
    for i := 0 to cbNS.Items.Count - 1 do
    begin
      if integer(cbNS.Items.Objects[i]) = ID_NS then
      begin
        cbNS.ItemIndex := i;
        cbNS.OnChange(cbNS);
        Break;
      end;
    end;
  end;
  if (DM.ID_NS <= 0) and (cbNS.Items.Count > 0) then
  begin
    cbNS.ItemIndex := 0;
    cbNS.OnChange(cbNS);
  end;

  inLoad := false;
end;

function TMainForm.GetID_NS2: Variant;
var Obj : TObject;
begin
  if cbNS.ItemIndex = -1 then
    Result := -666
  else
  begin
    Obj := cbNS.Items.Objects[cbNS.ItemIndex];
    Result := integer(Obj);
  end;
  if Result = 0 then Result := Null;

  if not (Result > 0) and not inLoad then
  begin
    ShowMessage('Сначала заведите хоть один бизнес');
    Abort;
  end;
end;

procedure TMainForm.cbNSChange(Sender: TObject);
begin
  if Assigned(EForm) then EForm.fEForm1.RefrNS;
  if Assigned(DataList) then DataList.NewSearch;
  if Assigned(ExtData) then ExtData.Initialize;
  DM.mdOperBuff.Close;
  DM.mdClipBrd.Close;
end;

procedure TMainForm.Ds1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.aArcExecute(Sender: TObject);
begin
  ShowDataList;
end;

procedure TMainForm.aUpLoadExecute(Sender: TObject);
var id_File : integer;
begin
  id_File := -1;
  ShowDocProp_Adv(id_File, Handle, false);
{  if ShowDocProp(false, id_File) then
  begin
  //  FixIdRefresh(cdsFileList, 'id_File');
  end;   }
end;

procedure TMainForm.Button1Click(Sender: TObject);
 const
   olMailItem = 0;
   olByValue = 1;
 var
   ClassID: TCLSID;
   ClassName : String;
   Unknown: IUnknown;
   Dispatch : IDispatch;
   Res: HResult;
 begin
 //GetActiveOleObject
   ClassName := 'Outlook.Application';
   OutlookApp := Null;
   try
     OutlookApp := GetActiveOleObject(ClassName {'Outlook.Application'});
   except
     OutlookApp := CreateOleObject(ClassName {'Outlook.Application'});
     OutlookApp.Display;
   end;  
   try
     MailItem := OutlookApp.CreateItem(olMailItem);
     try
        MailItem.Display; // Show Outlook Message Window
     except
     end;


     MailItem.Recipients.Add('YourMailAddress@something.com');
     MailItem.Subject := 'Your Subject';
     MailItem.HtmlBody  := '<html> <body> <b>Привет</b>, Мир! </body> </html>';
     myAttachments    := MailItem.Attachments;
     myAttachments.Add('d:\ddd.txt', olByValue, 1, 'Name of Attachment');

   finally
   end;


end;

procedure TMainForm.N25Click(Sender: TObject);
begin
  ShowExtData;
end;

procedure TMainForm.N11Click(Sender: TObject);
begin
 
  ShowEFormUser;//([eotCrn])
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  ShowEFormNS;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  pnOutlook.top := sToolBar1.Top;
  pnOutlook.Left := Width - pnOutlook.Width - 5;
;
end;

 

procedure TMainForm.dctFiles2Drop(Sender: TObject; ShiftState: TShiftState;
  APoint: TPoint; var Effect: Integer);
var  
  Stream: TStream;
  i, Fid_File: integer;
  Val, S: string;
  
  OutlookDataFormat: TOutlookDataFormat;
  AMessage: IMessage;
  XXX : IUnknown;

 // EmailFrom, EmailTo, Subj, EmailDate, OrigName : OleVariant;

    EmailDate, EmailFrom, EmailName, EmailTo, 
  Subj, xID_NS{, id_DocType, id_WorkType, id_Seller, id_Bayer,  id_Org3, id_Org4, DocNum, DocDate, DocDateStop, isAutoLong,   DocSumm, id_Crn, id_State, Comment, xVers, OrigName,   FileInfo, FileSize, Adv_Digit1, Adv_Digit2, Adv_Digit3, Adv_Digit4,   Adv_Digit5, Adv_Digit6, Adv_Digit7, Adv_Digit8, Adv_Digit9, Adv_Digit10,   Adv_Date1, Adv_Date2, Adv_Date3, Adv_Date4, Adv_Date5, Adv_Date6,   Adv_Date7, Adv_Date8, Adv_Date9, Adv_Date10, id_DicFile1, id_DicFile2,   id_DicFile3, id_DicFile4, id_DicFile5, id_DicFile6, id_DicFile7, id_DicFile8,   id_DicFile9, id_DicFile10} : OleVariant;

  //****
  id_Seller, id_Bayer : Variant;
  Attachment: IAttach;
  Attachments : TInterfaceList;
  Rows: PSRowSet;
  Table: IMAPITable;
  Prop: PSPropValue;
  Size: integer;
  Method: integer;
  Pos: Largeint;

  //*********
  Item: TListItem;
  Msg: IMessage;  
  //*********
  SourceStream, DestStream: IStream;
  Dummy: int64;
  P : pointer;
  FileName : String;
  //***
  ZStream : TFileStream;

  FilesCount : integer;
begin
  FilesCount := 0;
  xID_NS := DM.id_NS;
  Screen.Cursor := crSQLWait;
 // BeginTruns(DM.rsCA);
  try
    OutlookDataFormat := (DataFormatAdapterOutlook.DataFormat as TOutlookDataFormat);
    if (DataFormatAdapterOutlook.DataFormat <> nil) and (OutlookDataFormat.Messages.Count > 0) then
    begin
        XXX := OutlookDataFormat.Messages[0];
        if (Supports(XXX, IMessage, AMessage)) then
        begin
          try
            EmailFrom := DM.GetOneProp(AMessage, PR_SENDER_EMAIL_ADDRESS);// + ' (' + DM.GetOneProp(AMessage, PR_SENDER_NAME) + ')';
            EmailTo := DM.GetAddrList(AMessage);  // получатели
            Subj := DM.GetOneProp(AMessage, PR_SUBJECT);
            EmailDate := DM.GetRecTime(AMessage);

            if not SelectCAByEmail(EmailFrom, id_Seller, id_Bayer) then
            begin
              id_Seller := null;
              id_Bayer := null;     
            end;

            if (Succeeded(AMessage.GetAttachmentTable(0, Table))) then
            begin
              if (Succeeded(HrQueryAllRows(Table, PSPropTagArray(@AttachmentTags), nil, nil, 0, Rows))) then
                try
                  for i := 0 to integer(Rows.cRows)-1 do
                  begin
                    if (Rows.aRow[i].lpProps[0].ulPropTag and PROP_TYPE_MASK <> PT_ERROR) then
                      if (Succeeded(AMessage.OpenAttach(Rows.aRow[i].lpProps[0].Value.l, IAttach, 0, Attachment))) then
                      begin
                        //**************
                       if (Succeeded(HrGetOneProp(Attachment, PR_ATTACH_SIZE, Prop))) then
                          try
                            Size := Prop.Value.l;
                          finally
                            MAPIFreeBuffer(Prop);
                          end
                        else
                          Size := 0;

                        if (Succeeded(HrGetOneProp(Attachment, PR_ATTACH_METHOD, Prop))) then
                          try
                            Method := Prop.Value.l;
                          finally
                            MAPIFreeBuffer(Prop);
                          end
                        else
                          Method := -1;

                        if Method = ATTACH_BY_VALUE then
                        begin
                          if (Succeeded(HrGetOneProp(Attachment, PR_ATTACH_LONG_FILENAME {PR_ATTACH_FILENAME}, Prop))) then
                            try
                              if (Prop.ulPropTag and PT_UNICODE = PT_UNICODE) then
                                    s := String(PWideChar(Prop.Value.lpszW))
                              else
                                s := String(Prop.Value.lpszA);
                            finally
                              MAPIFreeBuffer(Prop);
                            end
                          else
                            s := '';

                          OleCheck(Attachment.OpenProperty(PR_ATTACH_DATA_BIN, IStream, STGM_READ, 0, IUnknown(SourceStream)));
                          FileName := AnsiString({ExtractFilePath(Application.ExeName)} GetTempDir +  S);
                        
                          if FileExists(FileName) then
                            DeleteFile(FileName);

                          OleCheck(OpenStreamOnFile(PAllocateBuffer(@MAPIAllocateBuffer), PFreeBuffer(@MAPIFreeBuffer),
                            STGM_CREATE or STGM_READWRITE, PAnsiChar(FileName), nil, DestStream));

                          SourceStream.CopyTo(DestStream, -1, Dummy, Dummy);

                          DestStream := nil;
                          ZStream := TFileStream.Create(FileName, fmOpenRead);

                          Fid_File := DM.rsCA.AppServer.WD_File_UnEdit(-1, EmailDate, EmailFrom, EmailName, EmailTo,
                              Subj, xID_NS, Null, Null, id_Seller, id_Bayer,                              Null, Null, Null, Null, Null, true,                              Null, Null, Null, Null, Null, S,                              Null, Null, Null, Null, Null, Null,                              Null, Null, Null, Null, Null, Null,                              Null, Null, Null, Null, Null, Null,                              Null, Null, Null, Null, Null, Null,                              Null, Null, Null, Null, Null, Null,                              Null, Null);
                          if Fid_File = -1 then
                            raise Exception.Create('Ошибка при сохранении файла');
                          DM.UplFile(Fid_File, '', ZStream);
                          inc(FilesCount);
                        end;
                       //**************   
                       end;

                  end;

                finally
                  FreePRows(Rows);
                end;
              Table := nil;
            end;


          finally
            AMessage := nil;
            ZStream.Free;
          end;
        end;

    end
    else
    if dctFiles2.Data.Count > 0 then
    begin
      for i := 0 to dctFiles2.Data.Count - 1 do
      begin
        S := ExtractFileName(dctFiles2.Data.Names[i]);
                          Fid_File := DM.rsCA.AppServer.WD_File_UnEdit(-1, Null, Null, Null, Null,
                              Null, xID_NS, Null, Null, Null, Null,                              Null, Null, Null, Null, Null, true,                              Null, Null, Null, Null, Null, S,                              Null, Null, Null, Null, Null, Null,                              Null, Null, Null, Null, Null, Null,                              Null, Null, Null, Null, Null, Null,                              Null, Null, Null, Null, Null, Null,                              Null, Null, Null, Null, Null, Null,                              Null, Null);
                          if Fid_File = -1 then
                            raise Exception.Create('Ошибка при сохранении файла');
                          DM.UplFile(Fid_File, '', dctFiles2.Data[i]);
                          inc(FilesCount);
      end;
    end
    else
    if dctFiles2.Files.Count > 0 then
    begin
      for i := 0 to dctFiles2.Files.Count - 1 do
      begin
        S := ExtractFileName(dctFiles2.Files[i]);
                          Fid_File := DM.rsCA.AppServer.WD_File_UnEdit(-1, Null, Null, Null, Null,
                              Null, xID_NS, Null, Null, Null, Null,                              Null, Null, Null, Null, Null, true,                              Null, Null, Null, Null, Null, S,                              Null, Null, Null, Null, Null, Null,                              Null, Null, Null, Null, Null, Null,                              Null, Null, Null, Null, Null, Null,                              Null, Null, Null, Null, Null, Null,                              Null, Null, Null, Null, Null, Null,                              Null, Null);
                          if Fid_File = -1 then
                            raise Exception.Create('Ошибка при сохранении файла');
                          DM.UplFile(Fid_File, dctFiles2.Files[i], nil);
                          inc(FilesCount);
      end;
    end
  //  else

  finally

    Screen.Cursor := crDefault;
    ShowMessage('Залито ' + IntToStr(FilesCount) + ' файлов.');
  end;
end;

procedure TMainForm.aNoteExecute(Sender: TObject);
begin
  ShowxNote;
end;

procedure TMainForm.miErrorLogClick(Sender: TObject);
begin
  ShowLog;
end;

procedure TMainForm.N4Click(Sender: TObject);
var i : integer;
begin
  pnLog.Visible := true;
  try
    pnLog.Caption := 'Подготавливается список файлов';
    Application.ProcessMessages;
    
    with DM.cdsFileList do
    begin
      Close;
      for i := 0 to Params.Count - 1 do
        Params[i].Value := Null;

      Params.ParamByName('@id_NS').Value := DM.id_NS;
      Params.ParamByName('@ID_User').Value := DM.ID_User;
      Params.ParamByName('@OnlyNan').Value := false;
   //   Params.ParamByName('@SysKey').Value := -777;
      Open;
      
      First;
      while not Eof do
      begin
    pnLog.Caption := 'Проверяется файл ' + IntToStr(RecNo) + ' из ' + IntToStr(RecordCount);
    Application.ProcessMessages;
        DM.rsCA.AppServer.CheckFileExists(DM.cdsFileList.FieldByName('id_File').AsInteger);

        Next;
      end;
      ShowMessage('Проверено файлов: ' + IntToStr(RecordCount));
    end;
  finally
    pnLog.Visible := false;
  end;
end;

procedure TMainForm.sButton2Click(Sender: TObject);
begin
//  ShellExecute(Application.Handle, 'open', PChar('c:\Program Files\totalcmd\Bred2r.exe'), PChar('c:\Program Files\totalcmd\HISTORY.TXT'), nil, SW_NORMAL);
 end;

procedure TMainForm.MainStatusBarPanelClick(Sender: TObject;
  PanelIndex: Integer);
var i : integer;
    S : String;
begin
  ShowDataList;
  if DataList <> nil then
  begin
    for i := 0 to DataList.fltTree.Items.Count - 1 do
    begin
      if DataList.fltTree.Items[i].ImageIndex = iconBuff then
      begin
        DataList.fltTree.Items[i].Selected := true;

          if DataList.cdsCAListid_Obj.AsInteger = -777 then
          begin
            S := 'AND id_File in (select id_File from WD_Buff where id_User=' + IntToStr(DM.ID_User) + ')';
          end;
          DataList.LoadFilesList(S, false);

      end;
    end;
  end;
end;

end.
