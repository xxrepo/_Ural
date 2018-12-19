unit frCntrAgentProp;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ComCtrls, Grids, DBGrids, RXDBCtrl, ExtCtrls,
  StdCtrls, DBCtrls, Mask, frCAGroupSelect, ActnList, ToolWin, frReprList,
  frCurSelector, Menus, clipbrd;

type
  TfCntrAgentProp = class(TFrame)
    cdsCAProp: TClientDataSet;
    cdsCAComment: TClientDataSet;
    cdsCAContact: TClientDataSet;
    cdsCAPropid_ContrAgent: TAutoIncField;
    cdsCAPropName: TStringField;
    cdsCAPropid_business: TIntegerField;
    cdsCAPropid_CAGroup: TIntegerField;
    cdsCAPropisOwn: TBooleanField;
    cdsCAPropDisabled: TBooleanField;
    cdsCAPropBusinessName: TStringField;
    cdsCAPropCAGroupName: TStringField;
    cdsCACommentid_comment: TAutoIncField;
    cdsCACommentid_ContrAgent: TIntegerField;
    cdsCACommentComment: TStringField;
    cdsCACommentCommentType: TIntegerField;
    cdsCACommentDateCreate: TDateTimeField;
    cdsCACommentid_User: TIntegerField;
    cdsCAContactid_Contact: TAutoIncField;
    cdsCAContactid_ContrAgent: TIntegerField;
    cdsCAContactFIO: TStringField;
    cdsCAContactPost: TStringField;
    cdsCAContactPhone: TStringField;
    cdsCAContactemail: TStringField;
    pcCA: TPageControl;
    tsProp: TTabSheet;
    tsContact: TTabSheet;
    tsComment: TTabSheet;
    dbgContact: TRxDBGrid;
    Panel1: TPanel;
    dsProp: TDataSource;
    cdsCAPropAddr: TStringField;
    cdsCAPropDescr: TStringField;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    DBMemo2: TDBMemo;
    Label3: TLabel;
    Panel2: TPanel;
    fCAGroupSelect1: TfCAGroupSelect;
    ActionList1: TActionList;
    aContNew: TAction;
    aContProp: TAction;
    aContDelete: TAction;
    aCommentNew: TAction;
    aCommentProp: TAction;
    aCommentDel: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    dsCAContact: TDataSource;
    dsCAComment: TDataSource;
    dbgComment: TDBGrid;
    tsRepr: TTabSheet;
    cdsCAPropId_Currency: TIntegerField;
    cdsCAPropCurrencyName: TStringField;
    cdsCAPropShowInRoot: TBooleanField;
    Panel3: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    cbDisabled: TDBCheckBox;
    fReprList1: TfReprList;
    Button1: TButton;
    pmIns: TPopupMenu;
    procedure dbgContactCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure dbgContactGetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure aContNewExecute(Sender: TObject);
    procedure aContPropExecute(Sender: TObject);
    procedure aContDeleteExecute(Sender: TObject);
    procedure aCommentDelExecute(Sender: TObject);
    procedure aCommentNewExecute(Sender: TObject);
    procedure aCommentPropExecute(Sender: TObject);
    procedure dbgCommentDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgCommentDblClick(Sender: TObject);
    procedure dbgContactDblClick(Sender: TObject);
    procedure dsCAContactDataChange(Sender: TObject; Field: TField);
    procedure dsCACommentDataChange(Sender: TObject; Field: TField);
    procedure Button1Click(Sender: TObject);
  private
    FCAID: integer;
    FidBsn : integer;
    procedure SetCAID(const Value: integer);
    procedure SetidBsn(const Value: integer);
    function GetidBsn: integer;
    procedure SetisOwn(const Value: boolean);
    procedure SetidGroup(const Value: Variant);
    procedure MiClick(Sender: TObject);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    property CAID : integer read FCAID write SetCAID;
    property idBsn : integer read GetidBsn write SetidBsn;
    property isOwn : boolean write SetisOwn;
    property idGroup : Variant write SetidGroup;
  end;

implementation

uses foMyFunc, uDM, uFormApi_CA, uCAContact;

{$R *.DFM}

{ TfCntrAgentProp }

function TfCntrAgentProp.CheckData: boolean;
begin
  Result := false;
  UpdateData;
  with DBEdit1 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введено наименование', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;  

  if DM.rsCA.AppServer.UN_Check_CA_ContrAgent(idBsn, DBEdit1.Text, CAID) = -1 then
  begin
    MessageBox(Handle, 'Контрагент с таким названием уже существует. Измените его', 'Такое название категории уже существует', MB_OK + MB_ICONERROR);
    Windows.SetFocus(DBEdit1.Handle);
    Exit;
  end;

  Result := true;
end;



function TfCntrAgentProp.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsCAProp;
  Result := true;
  UpdateData;
  if (FCAID <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'Name', 'Наименование', SL);
        CompareField(CDS, 'Disabled', 'Заблокировать', SL, false);
        CompareField(CDS, 'ShowInRoot', 'Отображать в первом уровне баланса', SL, false);


        CompareField(CDS, 'CurrencyName', 'Валюта', SL);
        CompareField(CDS, 'BusinessName', 'Бизнес', SL);
        CompareField(CDS, 'CAGroupName', 'Группа', SL);

        CompareField(CDS, 'Addr', 'адрес', SL, false);
        CompareField(CDS, 'Descr', 'описание', SL, false);
      end;
      if cdsCAComment.ChangeCount > 0 then
        SL.Add('изменены комментарии');
      if cdsCAContact.ChangeCount > 0 then
        SL.Add('изменены контактные данные');

      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfCntrAgentProp.Create(AOwner: TComponent);
var TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);

  pcCA.ActivePageIndex := 0;
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(dbgContact, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName + dbgContact.Name);
    LoadGridSettingsFromRegistry(dbgComment, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName + dbgComment.Name);
  end;
  if DM.IsSimple then
  begin
    tsRepr.TabVisible := false;
    tsComment.TabVisible := false;
    tsContact.TabVisible := false;
  end;
end;

destructor TfCntrAgentProp.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(dbgContact, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName + dbgContact.Name);
    SaveGridSettingsToRegistry(dbgComment, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName + dbgComment.Name);
  end;
  inherited;

end;

function TfCntrAgentProp.SaveProp: boolean;
var OldCursor : TCursor;
    AName, id_business, id_CAGroup: OleVariant;
    isOwn, Disabled, ShowInRoot: WordBool;
    Id_Currency, Addr, Descr: OleVariant;
    tmpID : integer;
begin
  tmpID := FCAID;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
    AName := cdsCAPropName.AsString;
    id_business := cdsCAProp.FieldByName('id_business').Value;
    if FCAID = -1 then
      id_business := FidBsn;
    id_CAGroup := cdsCAProp.FieldByName('id_CAGroup').Value;

    if id_CAGroup <0 then
      id_CAGroup := Null;

    isOwn := cdsCAProp.FieldByName('isOwn').AsBoolean;
    Disabled := cdsCAProp.FieldByName('Disabled').AsBoolean;
    ShowInRoot := cdsCAProp.FieldByName('ShowInRoot').AsBoolean;
    
    if trim(cdsCAProp.FieldByName('Addr').AsString) = '' then
      Addr := Null
    else
      Addr := cdsCAProp.FieldByName('Addr').Value;
      
    if trim(cdsCAProp.FieldByName('Descr').AsString) = '' then
      Descr := Null
    else
      Descr := cdsCAProp.FieldByName('Descr').Value;

    Id_Currency := cdsCAProp.FieldByName('Id_Currency').Value;

    if FCAID = -1 then // Добавляется
    begin
//      Vip := cdsGetClientProp.FieldByName('Vip').AsBoolean;
  //    RealAddr := cdsGetClientProp.FieldByName('RealAddr').Value;
      FCAID := DM.rsCA.AppServer.ContrAgentAdd(AName, id_business, id_CAGroup, isOwn, Id_Currency, Addr, Descr, ShowInRoot);

      if FCAID = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    end
    else
    begin
      if DM.rsCA.AppServer.ContrAgentEdit(FCAID, AName, id_business, id_CAGroup, isOwn, Disabled, Id_Currency, Addr, Descr, ShowInRoot) <> 1 then
        raise Exception.Create('Ошибка при сохранении свойств');
    end;
    if not CDSApplyUpdates(cdsCAComment, 'id_ContrAgent', FCAID) then
      raise Exception.Create('Ошибка при сохранении списка комментариев');

    if not CDSApplyUpdates(cdsCAContact, 'id_ContrAgent', FCAID) then
      raise Exception.Create('Ошибка при сохранении контактных данных');
    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
    FCAID := tmpID;
  end;
  Screen.Cursor := OldCursor;
end;

procedure TfCntrAgentProp.SetCAID(const Value: integer);
begin
  FCAID := Value;
  pcCA.ActivePageIndex := 0;
  with cdsCAProp do
  begin
    Close;
    Params.ParamByName('@id_ContrAgent').AsInteger := FCAID;
    Open;
    if FCAID = -1 then
    begin
      cbDisabled.Enabled := false;
      Edit;
      FieldByName('Disabled').AsBoolean := false;
      FieldByName('ShowInRoot').AsBoolean := false;
      Post;
    end
    else
    begin

      fCAGroupSelect1.FID := FieldByName('id_CAGroup').Value;
      fCAGroupSelect1.edName.Text := cdsCAPropCAGroupName.AsString;
      fCAGroupSelect1.IDBsn := FieldByName('id_business').AsInteger;
    end;
  end;
  with cdsCAComment do
  begin
    Close;
    Params.ParamByName('@id_ContrAgent').AsInteger := FCAID;
    Open;
  end;
  with cdsCAContact do
  begin
    Close;
    Params.ParamByName('@id_ContrAgent').AsInteger := FCAID;
    Open;
  end;
  fReprList1.Initialize(Null, FCAID, 0, Null); 
end;

procedure TfCntrAgentProp.UpdateData;
var CDS : TClientDataSet;
    Flag : boolean;
    IDTourType, IDFoodType : Variant;
begin
  CDS := cdsCAProp;

  if CDS.State <> dsEdit then
    CDS.Edit;

//  CDS.FieldByName('id_business').Value := fBsnSelector1.ID;
//  CDS.FieldByName('BusinessName').Value := fBsnSelector1.BsnName;

  CDS.FieldByName('id_CAGroup').Value := fCAGroupSelect1.ID;
  CDS.FieldByName('CAGroupName').Value := fCAGroupSelect1.GrpName;

  CDS.Post;
end;

procedure TfCntrAgentProp.dbgContactCheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfCntrAgentProp.dbgContactGetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfCntrAgentProp.SetidBsn(const Value: integer);
begin
  FidBsn := Value;
end;

function TfCntrAgentProp.GetidBsn: integer;
begin
  Result := FidBsn;
end;

procedure TfCntrAgentProp.SetisOwn(const Value: boolean);
begin
  if FCAID = -1 then
  begin
    with cdsCAProp do
    begin
      Edit;
      FieldByName('isOwn').AsBoolean := Value;
      Post;
    end;
  end;
end;

procedure TfCntrAgentProp.SetidGroup(const Value: Variant);
begin
  if FCAID = -1 then
  begin
    fCAGroupSelect1.IDBsn := idBsn;
    fCAGroupSelect1.ID := Value;
  end;
end;

procedure TfCntrAgentProp.aContNewExecute(Sender: TObject);
var Contact : TContact;
begin
  Contact.FIO := '';
  Contact.Post := '';
  Contact.Phone := '';
  Contact.email := '';

  if EditContact(Contact) then
  begin
    with cdsCAContact do
    begin
      Append;
      FieldByName('FIO').AsString := Contact.FIO;
      FieldByName('Post').AsString := Contact.Post;
      FieldByName('Phone').AsString := Contact.Phone;
      FieldByName('email').AsString := Contact.email;
     Post;
    end;
  end;
end;

procedure TfCntrAgentProp.aContPropExecute(Sender: TObject);
var Contact : TContact;
begin
  Contact.FIO := cdsCAContact.FieldByName('FIO').AsString;
  Contact.Post := cdsCAContact.FieldByName('Post').AsString;
  Contact.Phone := cdsCAContact.FieldByName('Phone').AsString;
  Contact.email := cdsCAContact.FieldByName('email').AsString;

  if EditContact(Contact) then
  begin
    with cdsCAContact do
    begin
      Edit;
      FieldByName('FIO').AsString := Contact.FIO;
      FieldByName('Post').AsString := Contact.Post;
      FieldByName('Phone').AsString := Contact.Phone;
      FieldByName('email').AsString := Contact.email;
     Post;
    end;
  end;
end;

procedure TfCntrAgentProp.aContDeleteExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Удалить контактную информацию?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    cdsCAContact.Delete;
  end;
end;

procedure TfCntrAgentProp.aCommentDelExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Удалить комментарий?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    cdsCAComment.Delete;
  end;
end;

procedure TfCntrAgentProp.aCommentNewExecute(Sender: TObject);
var CommentType : integer;
    Comment : String;
begin
  CommentType := 0;
  Comment := '';
  if EditComment(CommentType, Comment) then
  begin
    with cdsCAComment do
    begin
      Append;
      FieldByName('CommentType').AsInteger := CommentType;
      FieldByName('Comment').AsString := Comment;
      FieldByName('id_User').AsInteger := DM.IDUser;
      Post;
    end;
  end;
end;

procedure TfCntrAgentProp.aCommentPropExecute(Sender: TObject);
var CommentType : integer;
    Comment : String;
begin
  CommentType := cdsCAComment.FieldByName('CommentType').AsInteger;
  Comment := cdsCAComment.FieldByName('Comment').AsString;
  if EditComment(CommentType, Comment) then
  begin
    with cdsCAComment do
    begin
      Edit;
      FieldByName('CommentType').AsInteger := CommentType;
      FieldByName('Comment').AsString := Comment;
      FieldByName('id_User').AsInteger := DM.IDUser;
      Post;
    end;
  end;
end;

procedure TfCntrAgentProp.dbgCommentDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var R : TRect;
    S : String;
    Y : integer;
begin
  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  begin
    if (gdSelected in State) then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clHighlight;
      TDBGrid(Sender).Canvas.FillRect(Rect);
    end;

    if not (gdSelected in State) and ((Sender as TDBGrid).DataSource.DataSet.FieldByName('CommentType').AsInteger = -1) then
      TDBGrid(Sender).Canvas.Font.Color := clRed
    else
      if not (gdSelected in State) and ((Sender as TDBGrid).DataSource.DataSet.FieldByName('CommentType').AsInteger = 1) then
        TDBGrid(Sender).Canvas.Font.Color := clGreen;

    if Column.Index = 0 then
    begin
        (Sender as TDBGrid).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, IntToStr((Sender as TDBGrid).DataSource.DataSet.RecNo));
    end
    else
    begin
      R := Rect;
      S := (Sender as TDBGrid).DataSource.DataSet.FieldByName('Comment').AsString;
      Y := DrawText((Sender as TDBGrid).Canvas.Handle, PChar(S), -1, R, DT_WORDBREAK or DT_CALCRECT);
      if Y > THackGrid(Sender).RowHeights[THackGrid(Sender).DataLink.ActiveRecord + 1] then
        THackGrid(Sender).RowHeights[THackGrid(Sender).DataLink.ActiveRecord + 1] := Y;
      R := Rect;
      R.Bottom := R.Top + Y;
      DrawText((Sender as TDBGrid).Canvas.Handle, PChar(S), -1, R, DT_LEFT or DT_WORDBREAK);
    end;
  end;
end;

procedure TfCntrAgentProp.dbgCommentDblClick(Sender: TObject);
begin
  aCommentProp.Execute;
end;

procedure TfCntrAgentProp.dbgContactDblClick(Sender: TObject);
begin
  aContProp.Execute;
end;

procedure TfCntrAgentProp.dsCAContactDataChange(Sender: TObject;
  Field: TField);
begin
  aContProp.Enabled := not cdsCAContact.IsEmpty;
  aContDelete.Enabled := not cdsCAContact.IsEmpty;
end;

procedure TfCntrAgentProp.dsCACommentDataChange(Sender: TObject;
  Field: TField);
begin
  aCommentProp.Enabled := not cdsCAComment.IsEmpty;
  aCommentDel.Enabled := not cdsCAComment.IsEmpty;
end;

procedure TfCntrAgentProp.Button1Click(Sender: TObject);
var MI : TMenuItem;
begin
  pmIns.Items.Clear;

  if trim(cdsCAPropCAGroupName.AsString) <> '' then
  begin
    MI := TMenuItem.Create(Self);
    pmIns.Items.Add(MI);
    MI.Caption := 'Вставить "' + cdsCAPropCAGroupName.AsString + '"';
    MI.OnClick := MiClick;
  end;
  
  if trim(clipBoard.AsText) <> '' then
  begin
    MI := TMenuItem.Create(Self);
    pmIns.Items.Add(MI);
    MI.Caption := 'Вставить "' + clipBoard.AsText + '"';
    MI.OnClick := MiClick;
  end;

  pmIns.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfCntrAgentProp.MiClick(Sender: TObject);
var MI : TMenuItem;
    S : String;
begin
  MI := (Sender as TMenuItem);
  S := trim(MI.Caption);
  S := StringReplace(S, 'Вставить "', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S + '*', '"*', '', [rfReplaceAll, rfIgnoreCase]);
//  S := StringReplace('*' + S, '*&', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '&', '', [rfReplaceAll, rfIgnoreCase]);

  with cdsCAProp do
  begin
    Edit;

    FieldByName('Name').Value := S;
    Post;
  end;
end;

end.
