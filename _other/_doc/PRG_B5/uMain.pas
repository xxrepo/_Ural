unit uMain;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF VER150} Variants,{$ENDIF} ImgList,
  Controls, Classes, ActnList, Menus, StdCtrls, ComCtrls, ExtCtrls, Forms,
  DB, ADODB, Dialogs, Graphics, ToolWin, AdvGlowButton, AdvOfficeSelectors, TaskDialog,
  AdvMenus, AdvToolBar, AdvOfficeStatusBar;

type
  TMain = class(TForm)
    MainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ActionList1: TActionList;
    ImageList1: TImageList;
    ActionList2: TActionList;
    Action1: TAction;
    Window1: TMenuItem;
    Cascade1: TMenuItem;
    Tile1: TMenuItem;
    ArrangeIcons1: TMenuItem;
    miAdm: TMenuItem;
    Users1: TMenuItem;
    Protocol1: TMenuItem;
    miNeworganizationcreate1: TMenuItem;
    ShowCAList1: TMenuItem;
    miDocList: TMenuItem;
    miShowDocProp: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Showcompaniestype1: TMenuItem;
    gwbsx1: TMenuItem;
    Newperson1: TMenuItem;
    O1: TMenuItem;
    Organizationsandpersons1: TMenuItem;
    Cghfdjxybr1: TMenuItem;
    N9: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    aNewDoc: TAction;
    aShowDocList: TAction;
    N6: TMenuItem;
    pmNS: TAdvPopupMenu;
    N23rqdwa1: TMenuItem;
    qwdfaxsz1: TMenuItem;
    AdvDockPanel1: TAdvDockPanel;
    ToolBar2: TAdvToolBar;
    ToolButton8: TToolButton;
    AdvToolBarButton1: TAdvToolBarButton;
    AdvToolBarButton2: TAdvToolBarButton;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    AdvToolBarSeparator2: TAdvToolBarSeparator;
    btnNS: TAdvOfficeToolSelector;
    MainStatusBar: TAdvOfficeStatusBar;
    N7: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure miLang(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure Tile1Click(Sender: TObject);
    procedure ArrangeIcons1Click(Sender: TObject);
    procedure ShowCAList1Click(Sender: TObject);
    procedure Newperson1Click(Sender: TObject);
    procedure Organizationsandpersons1Click(Sender: TObject);
    procedure O1Click(Sender: TObject);
    procedure Cghfdjxybr1Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Users1Click(Sender: TObject);
    procedure aNewDocExecute(Sender: TObject);
    procedure aShowDocListExecute(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNSSelect(Sender: TObject; Index: Integer;
      Item: TAdvSelectorItem);
    procedure N7Click(Sender: TObject);
  private
    procedure AppException(Sender: TObject; E: Exception);
  public
    procedure AddToLogFile(AText: String);
    function GetID_Bsn: Variant;
    procedure GetBSNList(ID_BSN: variant);
 end;

var
  Main: TMain;

implementation

uses uDM, uMeCrpt, foMyFunc, uDocList,
  uDocProp, uDic, uSettDiagr, uUsers, uBsn;

{$R *.dfm}

procedure TMain.FormShow(Sender: TObject);
var     V : Variant;
   VRS : integer;
begin
  MainStatusBar.Panels[0].Text := 'Пользователь: ' + DM.FullFIO;
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
  Users1.Visible := DM.isAdmin;
  ShowDocList;   
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageBox(Handle, 'Закрыть программу?', Pchar(Application.Title), MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idYes then
  begin
    Action := caFree;
    while MDIChildCount > 0 do
    begin
      try
        MDIChildren[0].Free;
      except
      end;
    end;
  end
  else
    Action := caNone;
end;

procedure TMain.FormDestroy(Sender: TObject);
begin
  SaveValToRegistry(GetID_Bsn, SRegPath + '\' + ClassName, 'ID_Bsn');
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TMain.N2Click(Sender: TObject);
begin
  Close;
end;

procedure TMain.N4Click(Sender: TObject);
begin
  DM.DoEditConnectionString;
end;

procedure TMain.N5Click(Sender: TObject);
begin
  DM.ADOConnection1.Open;

end;

procedure TMain.Close1Click(Sender: TObject);
begin
  DM.ADOConnection1.Close;

end;

procedure TMain.miLang(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
end;

procedure TMain.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TMain.Tile1Click(Sender: TObject);
begin
  Tile
end;

procedure TMain.ArrangeIcons1Click(Sender: TObject);
begin
  ArrangeIcons
end;

procedure TMain.ShowCAList1Click(Sender: TObject);
begin
  ShowDic(5)
end;

procedure TMain.Newperson1Click(Sender: TObject);
var id_CA : integer;
begin

end;

procedure TMain.AddToLogFile(AText: String);
var SL : TStringList;
    S : String;
    FileHandle : Integer;
begin
  Application.OnException := nil;
  try
    S := ExtractFilePath(ParamStr(0)) + 'Error.log';
    if FileExists(S) then
    begin
      try
        FileHandle := FileOpen(S, fmOpenReadWrite or fmShareDenyNone);
      finally
        FileClose(FileHandle);
      end;
    end
    else
      FileHandle := 1;
    if FileHandle > 0 then
    begin
      try
        SL := TStringList.Create;
        if FileExists(S) then
          SL.LoadFromFile(S);
        SL.Insert(0, DateTimeToStr(Now) + ' - ' + DM.FullFIO + ' - ' + AText);
        while SL.Count > 100 do
          SL.Delete(SL.Count - 1);
        SL.SaveToFile(S);
      finally
        SL.Free;
      end;
    end;
  finally
    Application.OnException := AppException;
  end;
end;

procedure TMain.AppException(Sender: TObject; E: Exception);
var SL : TStringList;
    S : String;
    FileHandle : Integer;
begin
  Application.OnException := nil;
  try
    S := ExtractFilePath(ParamStr(0)) + 'Error.log';
    if FileExists(S) then
    begin
      try
        FileHandle := FileOpen(S, fmOpenReadWrite or fmShareDenyNone);
      finally
        FileClose(FileHandle);
      end;
    end
    else
      FileHandle := 1;
    if FileHandle > 0 then
    begin
      try
        SL := TStringList.Create;
        if FileExists(S) then
          SL.LoadFromFile(S);
        SL.Insert(0, DateTimeToStr(Now) + ' - ' + DM.FullFIO + ' - ' + E.Message);
        while SL.Count > 100 do
          SL.Delete(SL.Count - 1);
        SL.SaveToFile(S);
      finally
        Application.ShowException(E);
        SL.Free;
      end;
    end;
  finally
    Application.OnException := AppException;
  end;
end;

procedure TMain.Organizationsandpersons1Click(Sender: TObject);
begin
  ShowDic(0);
end;

procedure TMain.O1Click(Sender: TObject);
begin
  ShowDic(6)

end;

procedure TMain.Cghfdjxybr1Click(Sender: TObject);
begin
  ShowDic(13);

end;

procedure TMain.N9Click(Sender: TObject);
var AColorRed, AColorGreen : TColor;
begin
  AColorRed := DM.Color_Red;
  AColorGreen := DM.Color_Green;
  if ShowSettDiagr(AColorRed, AColorGreen) then
  begin
    DM.Color_Red := AColorRed;
    DM.Color_Green := AColorGreen;

    DM.SaveColorBG;
  end;
end;

procedure TMain.Users1Click(Sender: TObject);
begin
  ShowUsers;
end;

procedure TMain.aNewDocExecute(Sender: TObject);
var id : integer;
begin
  id := -1;
  ShowDocProp(false, id);
end;

procedure TMain.aShowDocListExecute(Sender: TObject);
begin
  ShowDocList
end;

procedure TMain.N6Click(Sender: TObject);
begin
    ShowDic(26);
end;

procedure TMain.FormCreate(Sender: TObject);
var i : integer;
    TI : TAdvSelectorItem;
    V : Variant;
begin
  LoadValFromRegistry(V, SRegPath + '\' + ClassName, 'id_BSN');
  GetBSNList(V);
end;

procedure TMain.GetBSNList(ID_BSN : variant);
var i : integer;
    TI : TAdvSelectorItem;
begin
  with DM.spBSN do
  begin
    Close;
    Parameters.ParamByName('id_User').Value := DM.id_User;
    Parameters.ParamByName('id_User2').Value := DM.id_User;
    Open;
    if IsEmpty then
    begin
      AdvMessagebox(Application.Handle, 'Вам не отклыт доступ ни к одному бизнесу' +  #13 + #10 +
                             'Программа будет закрыта.', 'В доступе отказано!!!', MB_ICONERROR + MB_OK);
      Application.Terminate;
    end;
    First;
    btnNS.Tools.Clear;
    while not Eof do
    begin
      TI := TAdvSelectorItem.Create(btnNS.Tools);
      TI.Caption := DM.spBSNBsnName.AsString;
      TI.CaptionAlignment := taLeftJustify;
      TI.Tag := DM.spBSNid_BSN.AsInteger;

      Next;
    end;
  end;
   {   TI := TAdvSelectorItem.Create(btnNS.Tools);
      TI.Caption := 'Все бизнесы';
      TI.CaptionAlignment := taLeftJustify;
      TI.Tag := 0;   }

  btnNS.Visible := DM.spBSN.RecordCount > 1;
  if (ID_BSN = Null) or (DM.spBSN.RecordCount = 1) then
  begin
    DM.spBSN.First;
    ID_BSN := DM.spBSNid_BSN.AsInteger;
  end;
  if ID_BSN <> Null then
  begin
    for i := 0 to btnNS.Tools.Count - 1 do
    begin
      if btnNS.Tools[i].Tag = ID_BSN then
      begin
        btnNS.SelectedIndex := i;
        btnNS.OnSelect(btnNS, i, nil);
        Break;
      end;
    end;
  end;
  if (DM.ID_BSN <= 0) then
  begin
    DM.spBSN.First;
    ID_BSN := DM.spBSNid_BSN.AsInteger;
  end;
end;

procedure TMain.btnNSSelect(Sender: TObject; Index: Integer;
  Item: TAdvSelectorItem);
begin
  if (Item <> nil) and (btnNS.Caption = btnNS.Tools[Index].Caption) then Exit;
  if Index = -1 then
    btnNS.Caption := 'Офис не выбран'
  else
  begin
    btnNS.Caption := btnNS.Tools[Index].Caption;
  end;
  if Assigned(DocList) then DocList.fGrp1.aRefreshGrp.Execute;
  DM.cdsList.Close;
  DM.cdsList.Open;
end;

function TMain.GetID_Bsn : Variant;
var TI : TAdvSelectorItem;
begin
  if btnNS.SelectedIndex = -1 then
    Result := -666
  else
  begin
    TI := btnNS.Tools[btnNS.SelectedIndex];
    Result := TI.Tag;
  end;
  if Result = 0 then Result := Null;
end;

procedure TMain.N7Click(Sender: TObject);
begin
  ShowBsn;
end;

end.
