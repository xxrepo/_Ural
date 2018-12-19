unit uObjProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  Buttons, StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls, 
  sButton, RXCtrls, BoxProcs, sCheckBox, sDBCheckBox, sDBEdit, sLabel,
  sPanel, ComCtrls, sPageControl, frCAInfo, Menus, Clipbrd, ActnList,
  sSpeedButton;

type
  TObjProp = class(TForm)
    Panel2: TsPanel;
    btnCancel: TsButton;
    btnOk: TsButton;
    cdsObjProp: TClientDataSet;
    dsCurProp: TDataSource;
    cdsWT: TClientDataSet;
    cdsWTid_Obj: TIntegerField;
    cdsWTObjName: TStringField;
    cdsWTid_Link: TAutoIncField;
    cdsObjPropPname: TStringField;
    cdsObjPropObjTypeName: TStringField;
    cdsObjPropExtID: TIntegerField;
    cdsObjPropid_Obj: TIntegerField;
    cdsObjPropid_NS: TIntegerField;
    cdsObjPropPID: TIntegerField;
    cdsObjPropid_ObjType: TIntegerField;
    cdsObjPropObjName: TStringField;
    cdsObjPropFileName: TStringField;
    cdsObjPropDeleted: TBooleanField;
    cdsObjPropDateStart: TDateTimeField;
    cdsObjPropDateStop: TDateTimeField;
    cdsObjPropisBayer: TBooleanField;
    cdsObjPropisSeller: TBooleanField;
    cdsObjPropisDef: TBooleanField;
    cdsObjPropObj_Digit1: TBCDField;
    cdsObjPropObj_Digit2: TBCDField;
    cdsObjPropObj_Digit3: TBCDField;
    cdsObjPropObj_Digit4: TBCDField;
    cdsObjPropObj_Digit5: TBCDField;
    cdsObjPropObj_Digit6: TBCDField;
    cdsObjPropObj_Digit7: TBCDField;
    cdsObjPropObj_Digit8: TBCDField;
    cdsObjPropObj_Digit9: TBCDField;
    cdsObjPropObj_Digit10: TBCDField;
    cdsObjPropObj_Date1: TDateTimeField;
    cdsObjPropObj_Date2: TDateTimeField;
    cdsObjPropObj_Date3: TDateTimeField;
    cdsObjPropObj_Date4: TDateTimeField;
    cdsObjPropObj_Date5: TDateTimeField;
    cdsObjPropObj_Date6: TDateTimeField;
    cdsObjPropObj_Date7: TDateTimeField;
    cdsObjPropObj_Date8: TDateTimeField;
    cdsObjPropObj_Date9: TDateTimeField;
    cdsObjPropObj_Date10: TDateTimeField;
    cdsObjPropEmailList: TStringField;
    cdsObjPropid_Dic1: TIntegerField;
    cdsObjPropid_Dic2: TIntegerField;
    cdsObjPropid_Dic3: TIntegerField;
    cdsObjPropid_Dic4: TIntegerField;
    cdsObjPropid_Dic5: TIntegerField;
    cdsObjPropid_Dic6: TIntegerField;
    cdsObjPropid_Dic7: TIntegerField;
    cdsObjPropid_Dic8: TIntegerField;
    cdsObjPropid_Dic9: TIntegerField;
    cdsObjPropid_Dic10: TIntegerField;
    sPageControl1: TsPageControl;
    tsMain: TsTabSheet;
    tsInfo: TsTabSheet;
    pnCA2: TsPanel;
    SrcPanel: TsPanel;
    Panel1: TsPanel;
    SrcLabel: TsLabel;
    SrcList: TTextListBox;
    BtnPanel: TsPanel;
    IncBtn: TsButton;
    IncAllBtn: TsButton;
    ExclBtn: TsButton;
    ExclAllBtn: TsButton;
    DestPanel: TsPanel;
    Panel4: TsPanel;
    DstLabel: TsLabel;
    DstList: TTextListBox;
    Panel3: TsPanel;
    sLabel1: TsLabel;
    DBCheckBox1: TsDBCheckBox;
    DBCheckBox2: TsDBCheckBox;
    sDBEdit1: TsDBEdit;
    pnUn: TsPanel;
    Label2: TsLabel;
    Label1: TsLabel;
    DBEdit2: TsDBEdit;
    DBEdit1: TsDBEdit;
    pnCA1: TsPanel;
    Label3: TsLabel;
    DBEdit3: TsDBEdit;
    Button2: TsButton;
    fCAInfo1: TfCAInfo;
    sButton1: TsButton;
    sButton2: TsButton;
    btnName: TsButton;
    pmInsName: TPopupMenu;
    pmInsFile: TPopupMenu;
    ActionList1: TActionList;
    aNote: TAction;
    sSpeedButton1: TsSpeedButton;
    procedure btnOkClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure IncBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExclBtnClick(Sender: TObject);
    procedure ExclAllBtnClick(Sender: TObject);
    procedure SrcListClick(Sender: TObject);
    procedure DstListClick(Sender: TObject);
    procedure SrcListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DstListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DstListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure btnNameClick(Sender: TObject);
    procedure aNoteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    xHandle : HWnd;
    Fid_Obj : integer;
    function CheckData: boolean;
    function ConfirmChanges: boolean;
    procedure UpdateData;
    procedure SetButtons;
    procedure MiClick(Sender: TObject);
    procedure MiFileClick(Sender: TObject);
  public
    procedure Initialize(id_Obj : integer; ExtID : integer; ACopy : boolean);
    function SaveProp: boolean;
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  ObjProp: TObjProp;

procedure ShowObjProp_Adv(id_Obj: integer; ExtID : integer; AHandle : HWnd; ACopy : boolean = false);
function EditObjProp(var id_Obj: integer; ExtID : integer): boolean;
implementation

uses uDM, foMyFunc, uMainForm, uUnSelector, uNote;

{$R *.DFM}


function EditObjProp(var id_Obj: integer; ExtID : integer): boolean;
var F : TObjProp;
begin
  Result := false;
  F := TObjProp.Create(MainForm);
  try
    F.Initialize(id_Obj, ExtID, false);
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      id_Obj := F.Fid_Obj;
    end;
  finally
    F.Free;
  end;
end;

procedure ShowObjProp_Adv(id_Obj: integer; ExtID : integer; AHandle : HWnd; ACopy : boolean = false);
var F : TObjProp;
    b : boolean;
    i, Top, Left : integer;
begin
{  Top := 0;
  Left := 0;
  if id_Obj > 0 then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i] is TObjProp then
      begin
        Top := Screen.Forms[i].Top;
        Left := Screen.Forms[i].Left;
        if TObjProp(Screen.Forms[i]).Fid_Obj = id_Obj then
        begin
          Screen.Forms[i].BringToFront;
          Exit;
        end;
      end;
    end;
  end;
          }

  F := TObjProp.Create(nil);
  try
    F.xHandle := AHandle;
    F.Initialize(id_Obj, ExtID, ACopy);


    F.Show;
  {  if (Top > 0) and (Top + 50 < Screen.Height - 100) then
      F.Top := Top + 50;
    if (Left > 0) and (Left + 50 < Screen.Width - 200) then
      F.Left := Left + 50;   }
  except
    F.Free;
  end;
end;

procedure CloseObjProp_Adv(AObjProp : TObjProp);
var b : boolean;
begin
  if (AObjProp.ModalResult = mrOk) then
  begin
    if AObjProp.SaveProp then
      PostMessage(AObjProp.xHandle, xxx_WD_RefrMsg, AObjProp.Fid_Obj, 0);
  end;
end;

{ TCurProp }

procedure TObjProp.Initialize(id_Obj: integer; ExtID : integer; ACopy : boolean);
begin
  Fid_Obj := id_Obj;
  with cdsObjProp do
  begin
    Close;
    Params.ParamByName('@id_Obj').AsInteger := Fid_Obj;
    Open;
  end;
  if Fid_Obj = -1 then
  begin
    Caption := 'Новое значение ' + cdsObjPropObjTypeName.AsString;
    cdsObjProp.Edit;
    cdsObjPropExtID.AsInteger := ExtID;
    cdsObjProp.Post;
  end
  else
    Caption := cdsObjPropObjTypeName.AsString + ' - ' + cdsObjPropObjName.AsString;

    sPageControl1.ActivePageIndex := 0;
    tsInfo.TabVisible := cdsObjPropExtID.AsInteger = 300;

  if cdsObjPropExtID.AsInteger <> 300 then
  begin
    pnCA1.Visible := false;
    pnCA2.Visible := false;
    btnName.Visible := false;

    Self.Height := pnUn.Height + Panel2.Height + Panel2.Height + 25;
  //  tsMain.TabVisible := false;
  end
  else
  begin
    fCAInfo1.Initialize(Fid_Obj);
    with cdsWT do
    begin
      Close;
      Params.ParamByName('@id_Obj').AsInteger := Fid_Obj;
      Params.ParamByName('@id_NS').AsInteger := DM.id_NS;
      Open;
      First;
      while not Eof do
      begin
        if cdsWTid_Link.IsNull then
          SrcList.Items.AddObject(cdsWTObjName.AsString, Pointer(cdsWTid_Obj.AsInteger))
        else
          DstList.Items.AddObject(cdsWTObjName.AsString, Pointer(cdsWTid_Obj.AsInteger));
        Next;
      end;
    end;
  end;

  if ACopy then
    Fid_Obj := -1;
end;

function TObjProp.SaveProp: boolean;
var OldCursor : TCursor;
  id_NS, PID, ExtID, ObjName, FileName, 
  DateStart, DateStop, isBayer, isSeller, isDef, Obj_Digit1,   Obj_Digit2, Obj_Digit3, Obj_Digit4, Obj_Digit5, Obj_Digit6, Obj_Digit7,   Obj_Digit8, Obj_Digit9, Obj_Digit10, Obj_Date1, Obj_Date2, Obj_Date3,   Obj_Date4, Obj_Date5, Obj_Date6, Obj_Date7, Obj_Date8, Obj_Date9,   Obj_Date10, EmailList, id_Dic1, id_Dic2, id_Dic3, id_Dic4,   id_Dic5, id_Dic6, id_Dic7, id_Dic8, id_Dic9, id_Dic10 : OleVariant;
    Rez, i : integer;
    IDList : OleVariant;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  UpdateData;
  BeginTruns(DM.rsCA);
  try
      id_NS := DM.id_NS;
      PID := cdsObjPropPID.AsVariant;
      ExtID := cdsObjPropExtID.AsVariant;
      ObjName := cdsObjPropObjName.AsVariant;
      FileName := cdsObjPropFileName.AsVariant;
      DateStart := cdsObjPropDateStart.AsVariant;
      DateStop := cdsObjPropDateStop.AsVariant;
      isBayer := cdsObjPropisBayer.AsBoolean;
      isSeller := cdsObjPropisSeller.AsBoolean;
      isDef := cdsObjPropisDef.AsBoolean;
      Obj_Digit1 := cdsObjPropObj_Digit1.AsVariant;
      Obj_Digit2 := cdsObjPropObj_Digit2.AsVariant;
      Obj_Digit3 := cdsObjPropObj_Digit3.AsVariant;
      Obj_Digit4 := cdsObjPropObj_Digit4.AsVariant;
      Obj_Digit5 := cdsObjPropObj_Digit5.AsVariant;
      Obj_Digit6 := cdsObjPropObj_Digit6.AsVariant;
      Obj_Digit7 := cdsObjPropObj_Digit7.AsVariant;
      Obj_Digit8 := cdsObjPropObj_Digit8.AsVariant;
      Obj_Digit9 := cdsObjPropObj_Digit9.AsVariant;
      Obj_Digit10 := cdsObjPropObj_Digit10.AsVariant;
      Obj_Date1 := cdsObjPropObj_Date1.AsVariant;
      Obj_Date2 := cdsObjPropObj_Date2.AsVariant;
      Obj_Date3 := cdsObjPropObj_Date3.AsVariant;
      Obj_Date4 := cdsObjPropObj_Date4.AsVariant;
      Obj_Date5 := cdsObjPropObj_Date5.AsVariant;
      Obj_Date6 := cdsObjPropObj_Date6.AsVariant;
      Obj_Date7 := cdsObjPropObj_Date7.AsVariant;
      Obj_Date8 := cdsObjPropObj_Date8.AsVariant;
      Obj_Date9 := cdsObjPropObj_Date9.AsVariant;
      Obj_Date10 := cdsObjPropObj_Date10.AsVariant;
      EmailList := cdsObjPropEmailList.AsVariant;
      id_Dic1 := cdsObjPropid_Dic1.AsVariant;
      id_Dic2 := cdsObjPropid_Dic2.AsVariant;
      id_Dic3 := cdsObjPropid_Dic3.AsVariant;
      id_Dic4 := cdsObjPropid_Dic4.AsVariant;
      id_Dic5 := cdsObjPropid_Dic5.AsVariant;
      id_Dic6 := cdsObjPropid_Dic6.AsVariant;
      id_Dic7 := cdsObjPropid_Dic7.AsVariant;
      id_Dic8 := cdsObjPropid_Dic8.AsVariant;
      id_Dic9 := cdsObjPropid_Dic9.AsVariant;
      id_Dic10 := cdsObjPropid_Dic10.AsVariant;

      Rez := DM.rsCA.AppServer.WD_Obj_UnEdit(Fid_Obj, id_NS, PID, ExtID, ObjName, FileName,
  DateStart, DateStop, isBayer, isSeller, isDef, Obj_Digit1,   Obj_Digit2, Obj_Digit3, Obj_Digit4, Obj_Digit5, Obj_Digit6, Obj_Digit7,   Obj_Digit8, Obj_Digit9, Obj_Digit10, Obj_Date1, Obj_Date2, Obj_Date3,   Obj_Date4, Obj_Date5, Obj_Date6, Obj_Date7, Obj_Date8, Obj_Date9,   Obj_Date10, EmailList, id_Dic1, id_Dic2, id_Dic3, id_Dic4,   id_Dic5, id_Dic6, id_Dic7, id_Dic8, id_Dic9, id_Dic10);
      if Rez = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    if Fid_Obj = -1 then // Добавляется
    begin
      Fid_Obj := Rez; 
    end;

    if cdsObjPropExtID.AsInteger = 300 then
    begin
      IDList := '';
      for i := 0 to DstList.Items.Count - 1 do
      begin
        if IDList <> '' then IDList := IDList + ',';
        IDList := IDList + IntToStr(integer(DstList.Items.Objects[i]));
      end;

      DM.rsCA.AppServer.WD_ObjSetWT(Fid_Obj, IDList);
    end;
    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;
end;

procedure TObjProp.btnOkClick(Sender: TObject);
begin
  sPageControl1.ActivePageIndex := 0;
  if not ConfirmChanges then
    ModalResult := mrNone
  else
  if (xHandle > 0) then
  begin
    Close;
  end;
end;

procedure TObjProp.UpdateData;
begin
  if cdsObjProp.State = dsEdit then
    cdsObjProp.Post
end;

function TObjProp.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsObjProp;
  Result := true;
  UpdateData;
  if (Fid_Obj <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'Name', 'название', SL);
        CompareField(CDS, 'ShortName', 'короткое название', SL);
      end;
      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

function TObjProp.CheckData: boolean;
var SL, SL2 : TStringList;
    i : integer;
    S : String;
    id_NS, ExtID, ObjName, FileName : OleVariant;
begin
  Result := false;
  if pnCA1.Visible then
  with DBEdit3 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введена принадлежность', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with DBEdit1 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введено название', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with DBEdit2 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введено название для файла', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with DBEdit2 do   //  \/:*"?<>|
    if (POS('\', Text) > 0) or (POS('/', Text) > 0) or (POS(':', Text) > 0) or (POS('*', Text) > 0)
     or (POS('"', Text) > 0) or (POS('?', Text) > 0) or (POS('<', Text) > 0) or (POS('>', Text) > 0)  then
    begin
      MessageBox(Handle, 'Нельзя использовать символы \/:*"?<>| в имени файла', 'ОШИБКА', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with sDBEdit1 do
    if trim(sDBEdit1.Text) > '' then
    begin
      SL := TStringList.Create;
      SL2 := TStringList.Create;
      try
        SL.Text := xStringReplace(sDBEdit1.Text, [',', ';', ' '], #13 + #10) ; //xStringReplace(xStringReplace(sDBEdit1.Text, ',', #13 + #10), ';', #13 + #10);
        for i := 0 to SL.Count - 1 do
        begin
          if SL[i] <> '' then
          begin
            S := DM.rsCA.AppServer.WD_CheckEmail(SL[i], Fid_Obj);
            if S <> '' then SL2.Add(SL[i] + ' - ' + S);
          end;
        end;

        if SL2.Count > 0 then
        begin
          MessageBox(Handle, Pchar('Указанные адреса уже использованы' + #13 + #10 + SL2.Text), 'Ошибка во внесенных данных', MB_OK + MB_ICONERROR);
          Windows.SetFocus(Handle);
          Exit;
        end;

      finally
        SL.Free;
        SL2.Free;
      end;

  end;
//  if Fid_Obj > 0 then
  begin
    id_NS := DM.id_NS;
    ExtID := cdsObjPropExtID.AsInteger;
    ObjName := cdsObjPropObjName.AsString;
    FileName := cdsObjPropFileName.AsString;
    
    if DM.rsCA.AppServer.WD_Obj_Check(Fid_Obj, id_NS, ExtID, ObjName, null) > 0 then
    begin
      MessageBox(Handle, Pchar('Название ' + DBEdit1.Text + ' уже использовано.'), 'ОШИБКА', MB_OK + MB_ICONERROR);
      Windows.SetFocus(DBEdit1.Handle);
      Exit;

    end;
    if DM.rsCA.AppServer.WD_Obj_Check(Fid_Obj, id_NS, ExtID, null, FileName) > 0 then
    begin
      MessageBox(Handle, Pchar('Текст для файла ' + DBEdit2.Text + ' уже использован.'), 'ОШИБКА', MB_OK + MB_ICONERROR);
      Windows.SetFocus(DBEdit1.Handle);
      Exit;

    end;
  end;
  Result := true;
end;

procedure TObjProp.Button2Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
    X : ExclList;
begin
  ASelectedObj.ID := cdsObjPropPID.AsInteger;
  ASelectedObj.ObjType := eotOper;
  if ShowUnSelector(ASelectedObj, X) then
  begin
    cdsObjProp.Edit;
    cdsObjPropPID.AsInteger := ASelectedObj.ID;
    cdsObjPropPname.AsString := ASelectedObj.Name;
    cdsObjProp.Post;
  end;
end;

procedure TObjProp.IncBtnClick(Sender: TObject);
begin
  BoxMoveSelectedItems(SrcList, DstList);
  SetButtons;

end;

procedure TObjProp.IncAllBtnClick(Sender: TObject);
begin
  BoxMoveAllItems(SrcList, DstList);
  SetButtons;
end;

procedure TObjProp.ExclBtnClick(Sender: TObject);
begin
  BoxMoveSelectedItems(DstList, SrcList);
  SetButtons;
end;

procedure TObjProp.ExclAllBtnClick(Sender: TObject);
begin
  BoxMoveAllItems(DstList, SrcList);
  SetButtons;
end;

procedure TObjProp.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := (SrcList.Items.Count = 0);
  DstEmpty := (DstList.Items.Count = 0);
  IncBtn.Enabled := not SrcEmpty and (SrcList.SelCount > 0);
  IncAllBtn.Enabled := not SrcEmpty;
  ExclBtn.Enabled := not DstEmpty and (DstList.SelCount > 0);
  ExclAllBtn.Enabled := not DstEmpty;
end;




procedure TObjProp.SrcListClick(Sender: TObject);
begin
  SetButtons;
end;

procedure TObjProp.DstListClick(Sender: TObject);
begin
  SetButtons;
end;

procedure TObjProp.SrcListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Incr: Integer;
begin
  if not SrcList.Sorted then begin
    if (ssCtrl in Shift) and ((Key = VK_DOWN) or (Key = VK_UP)) then begin
      if Key = VK_DOWN then Incr := 1
      else Incr := -1;
      BoxMoveFocusedItem(SrcList, SrcList.ItemIndex + Incr);
      Key := 0;
    end;
  end;
end;

procedure TObjProp.DstListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Incr: Integer;
begin
  if not DstList.Sorted then begin
    if (ssCtrl in Shift) and ((Key = VK_DOWN) or (Key = VK_UP)) then begin
      if Key = VK_DOWN then Incr := 1
      else Incr := -1;
      BoxMoveFocusedItem(DstList, DstList.ItemIndex + Incr);
      Key := 0;
    end;
  end;
end;

procedure TObjProp.DstListDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  BoxDragOver(DstList, Source, X, Y, State, Accept, DstList.Sorted);
  if State = dsDragLeave then
    (Source as TTextListBox).DragCursor := crDrag;
  if (State = dsDragEnter) and ((Source as TTextListBox).SelCount > 1) then
    (Source as TTextListBox).DragCursor := crMultiDrag;
end;

procedure TObjProp.sButton1Click(Sender: TObject);var S : String;var MI : TMenuItem;
begin
  pmInsFile.Items.Clear;

  MI := TMenuItem.Create(Self);
  pmInsFile.Items.Add(MI);
  S := xStringReplace(cdsObjPropObjName.AsString, ['ООО', 'ЗАО', '"'], '');
  S := trim(COPY(S, 1, 10));

  MI.Caption := 'Вставить "' + S + '"';
  MI.OnClick := MiFileClick;

  if trim(clipBoard.AsText) <> '' then
  begin
    MI := TMenuItem.Create(Self);
    pmInsFile.Items.Add(MI);
    MI.Caption := 'Вставить "' + clipBoard.AsText + '"';
    MI.OnClick := MiFileClick;
  end;

  pmInsFile.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TObjProp.sButton2Click(Sender: TObject);var AID: integer;
begin
  AID := -1;
  if EditObjProp(AID, DM.GetExtIdByType(eotWorkType)) then
  begin
    with cdsWT do
    begin
      Close;
      Params.ParamByName('@id_Obj').AsInteger := Fid_Obj;
      Params.ParamByName('@id_NS').AsInteger := DM.id_NS;
      Open;
      if Locate('id_Obj', AID, []) then
        DstList.Items.AddObject(cdsWTObjName.AsString, Pointer(cdsWTid_Obj.AsInteger));
    end;
  end;  
end;

procedure TObjProp.btnNameClick(Sender: TObject);var MI : TMenuItem;
begin
  pmInsName.Items.Clear;

  MI := TMenuItem.Create(Self);
  pmInsName.Items.Add(MI);
  MI.Caption := 'Вставить "' + cdsObjPropPname.AsString + '"';
  MI.OnClick := MiClick;

  if trim(clipBoard.AsText) <> '' then
  begin
    MI := TMenuItem.Create(Self);
    pmInsName.Items.Add(MI);
    MI.Caption := 'Вставить "' + clipBoard.AsText + '"';
    MI.OnClick := MiClick;
  end;

  pmInsName.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TObjProp.MiClick(Sender: TObject);
var MI : TMenuItem;
    S : String;
begin
  MI := (Sender as TMenuItem);
  S := trim(MI.Caption);
  S := StringReplace(S, 'Вставить "', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S + '*', '"*', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '&', '', [rfReplaceAll, rfIgnoreCase]);

  with cdsObjProp do
  begin
    Edit;
    cdsObjPropObjName.Value := S;
    Post;
  end;
end;

procedure TObjProp.MiFileClick(Sender: TObject);
var MI : TMenuItem;
    S : String;
begin
  MI := (Sender as TMenuItem);
  S := trim(MI.Caption);
  S := StringReplace(S, 'Вставить "', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S + '*', '"*', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '&', '', [rfReplaceAll, rfIgnoreCase]);

  with cdsObjProp do
  begin
    Edit;
    cdsObjPropFileName.Value := S;
    Post;
  end;
end;

procedure TObjProp.aNoteExecute(Sender: TObject);begin
  ShowxNote;

end;

constructor TObjProp.Create(AOwner: TComponent);begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);

end;

procedure TObjProp.CreateParams(var Params: TCreateParams);begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

procedure TObjProp.FormCreate(Sender: TObject);begin
  xHandle := 0;

end;

procedure TObjProp.FormClose(Sender: TObject; var Action: TCloseAction);begin
  if xHandle > 0 then
  begin
    Action := caFree;
    CloseObjProp_Adv(Self);
  end;
end;

procedure TObjProp.btnCancelClick(Sender: TObject);begin
  if xHandle > 0 then
  begin
    Close;
  end;

end;

procedure TObjProp.FormShow(Sender: TObject);begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName + cdsObjPropExtID.AsString);
end;

procedure TObjProp.FormDestroy(Sender: TObject);begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName + cdsObjPropExtID.AsString);

end;

end.