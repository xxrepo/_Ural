unit frReprProp;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ComCtrls, Grids, DBGrids, RXDBCtrl, ExtCtrls,
  StdCtrls, DBCtrls, Mask, frCAGroupSelect, ActnList, ToolWin, frReprList,
  frCurSelector, Menus,
  uCAContact, Buttons, clipbrd;

type
  TfReprProp = class(TFrame)
    cdsReprProp: TClientDataSet;
    cdsReprComment: TClientDataSet;
    cdsReprContact: TClientDataSet;
    cdsReprPropName: TStringField;
    cdsReprPropDisabled: TBooleanField;
    pcCA: TPageControl;
    tsProp: TTabSheet;
    tsContact: TTabSheet;
    tsComment: TTabSheet;
    dbgContact: TRxDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsProp: TDataSource;
    cbDisabled: TDBCheckBox;
    cdsReprPropAddr: TStringField;
    cdsReprPropDescr: TStringField;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    DBMemo2: TDBMemo;
    Label3: TLabel;
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
    dsReprContact: TDataSource;
    dsReprComment: TDataSource;
    dbgComment: TDBGrid;
    cdsReprPropid_Repr: TAutoIncField;
    cdsReprPropid_ContrAgent: TIntegerField;
    cdsReprPropisJur: TBooleanField;
    cdsReprPropFirstName: TStringField;
    cdsReprPropMiddleName: TStringField;
    cdsReprPropLastName: TStringField;
    cdsReprPropCAName: TStringField;
    cdsReprPropId_Currency: TIntegerField;
    cdsReprPropCurrencyName: TStringField;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    cdsReprCommentid_comment: TAutoIncField;
    cdsReprCommentid_Repr: TIntegerField;
    cdsReprCommentComment: TStringField;
    cdsReprCommentCommentType: TIntegerField;
    cdsReprCommentDateCreate: TDateTimeField;
    cdsReprCommentid_User: TIntegerField;
    cdsReprContactid_Contact: TAutoIncField;
    cdsReprContactid_Repr: TIntegerField;
    cdsReprContactFIO: TStringField;
    cdsReprContactPost: TStringField;
    cdsReprContactPhone: TStringField;
    cdsReprContactemail: TStringField;
    cbIsJur: TComboBox;
    Label4: TLabel;
    aCAWHNew: TAction;
    aCAWHProp: TAction;
    aCAWHDel: TAction;
    aCAWHContactNew: TAction;
    aCAWHContactProp: TAction;
    aCAWHContactDel: TAction;
    pmCAWH: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    pmCAWHCnt: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    pnCA: TPanel;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    BitBtn4: TBitBtn;
    cdsReprPropNeedSend: TBooleanField;
    DBCheckBox1: TDBCheckBox;
    cdsReprPropGroupName: TStringField;
    cdsReprPropid_Repr_Group: TIntegerField;
    cdsReprPropid_Bsn: TIntegerField;
    cdsReprPropBIK: TStringField;
    cdsReprPropBank: TStringField;
    cdsReprPropAccName: TStringField;
    cdsReprPropCorAccNAme: TStringField;
    cdsReprPropOKPO: TStringField;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    cdsReprPropINN: TStringField;
    cdsReprPropKPP: TStringField;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    DBEdit12: TDBEdit;
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
    procedure dsReprContactDataChange(Sender: TObject; Field: TField);
    procedure dsReprCommentDataChange(Sender: TObject; Field: TField);
    procedure cbIsJurChange(Sender: TObject);
    procedure cdsReprPropisJurChange(Sender: TField);
    procedure aCAWHNewExecute(Sender: TObject);
    procedure aCAWHPropExecute(Sender: TObject);
    procedure aCAWHDelExecute(Sender: TObject);
    procedure aCAWHContactNewExecute(Sender: TObject);
    procedure aCAWHContactPropExecute(Sender: TObject);
    procedure aCAWHContactDelExecute(Sender: TObject);
    procedure dsCAWHDataChange(Sender: TObject; Field: TField);
    procedure dbgContactDblClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    Fid_Repr: integer;
    Fid_CA: Variant;
    Fid_Bsn: Variant;
    procedure Setid_Repr(const Value: integer);
    procedure Setid_CA(const Value: Variant);
    function GerRepName: String;
    procedure MiClick(Sender: TObject);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    property id_Repr : integer read Fid_Repr write Setid_Repr;
    property id_CA : Variant read Fid_CA write Setid_CA;
    property id_Bsn : Variant read Fid_Bsn write Fid_Bsn;
    property RepName : String read GerRepName;
  end;

implementation

uses foMyFunc, uDM,uComment, uCASelector;

{$R *.DFM}

{ TfCntrAgentProp }

function TfReprProp.CheckData: boolean;
var S : String;
begin
  Result := false;
  UpdateData;
  if pnCA.Visible then
  begin
    with DBEdit5 do
      if (trim(Text) = '') then
      begin
        MessageBox(Handle, 'Не введено название контрагента.', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Windows.SetFocus(Handle);
        Exit;
      end;
  end;
  if cdsReprPropisJur.AsBoolean then
  begin
    with DBEdit1 do
      if trim(Text) = '' then
      begin
        MessageBox(Handle, 'Не введено наименование', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Windows.SetFocus(Handle);
        Exit;
      end;
  end
  else
  begin
    with DBEdit4 do
      if (trim(Text) = '') and (trim(DBEdit2.Text) = '') and (trim(DBEdit3.Text) = '') then
      begin
        MessageBox(Handle, 'Не введены фамилия, имя и отчество. Заполните хотя бы одно из этих полей.', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Windows.SetFocus(Handle);
        Exit;
      end;
  end;
{  with fCurSelector1.cbCur do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбрана валюта расчета', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end; }
  S := '';
  if cdsReprProp.FieldByName('isJur').AsBoolean then
  begin
    S := cdsReprProp.FieldByName('Name').AsString;
  end
  else
  begin
    S := cdsReprProp.FieldByName('FirstName').Value;
    if S <> '' then S := S + ' ';
    S := S + cdsReprProp.FieldByName('MiddleName').AsString;
    if S <> '' then S := S + ' ';
    S := S + cdsReprProp.FieldByName('LastName').AsString;
  end;

{$IFNDEF LC}
  if DM.rsCA.AppServer.UN_Check_CA_Repr(id_CA, trim(S), id_repr) = -1 then
  begin
    MessageBox(Handle, PChar('Представитель с таким названием у контрагента "' + DBEdit5.Text + '" уже существует. Измените его'), 'Такое название категории уже существует', MB_OK + MB_ICONERROR);
    if cdsReprPropisJur.AsBoolean then
      Windows.SetFocus(DBEdit1.Handle)
    else
      Windows.SetFocus(DBEdit4.Handle);
    Exit;
  end;
{$ENDIF}

  Result := true;
end;



function TfReprProp.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsReprProp;
  Result := true;
  UpdateData;
  if (Fid_Repr <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'Name', 'Наименование', SL);
        CompareField(CDS, 'Disabled', 'Заблокировать', SL, false);
 //       CompareField(CDS, 'CurrencyName', 'Валюта', SL);

        CompareField(CDS, 'Addr', 'адрес', SL, false);
        CompareField(CDS, 'Descr', 'описание', SL, false);
      end;
      if cdsReprComment.ChangeCount > 0 then
        SL.Add('изменены комментарии');
      if cdsReprContact.ChangeCount > 0 then
        SL.Add('изменены контактные данные');

      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfReprProp.Create(AOwner: TComponent);
begin
  inherited;
  pcCA.ActivePageIndex := 0;
  if Owner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(dbgContact, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + dbgContact.Name);
    LoadGridSettingsFromRegistry(dbgComment, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + dbgComment.Name);
  end;
{$IFDEF LC}
  DBCheckBox1.Visible := false;
  pnCA.Visible := false;

  tsComment.TabVisible := false;
  tsContact.TabVisible := false;

  tsComment.Visible := false;
  tsContact.Visible := false;
{$ENDIF}
  if DM.IsSimple then
  begin
    tsContact.TabVisible := false;
  end;
end;

destructor TfReprProp.Destroy;
begin
  if Owner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(dbgContact, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + dbgContact.Name);
    SaveGridSettingsToRegistry(dbgComment, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + dbgComment.Name);
  end;
  inherited;

end;

function TfReprProp.SaveProp: boolean;
var OldCursor : TCursor;
    id_ContrAgent: OleVariant;
    isJur, Disabled, NeedSend: WordBool;
    AName, FirstName, MiddleName, LastName, Id_Currency, Addr, Descr, id_Bsn_ex: OleVariant;
    tmpID : integer;
    BIK, Bank, AccName, CorAccNAme,
  OKPO, INN, KPP: OleVariant;
begin
  tmpID := Fid_Repr;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
    AName := cdsReprPropName.AsString;
    id_ContrAgent := cdsReprProp.FieldByName('id_ContrAgent').Value;

    Disabled := cdsReprProp.FieldByName('Disabled').AsBoolean;
    isJur := cdsReprProp.FieldByName('isJur').AsBoolean;
    Id_Currency := cdsReprProp.FieldByName('Id_Currency').Value;

    AName := Null;
    FirstName := Null;
    MiddleName := Null;
    LastName := Null;
    
    if cdsReprProp.FieldByName('isJur').AsBoolean then
    begin
      AName := cdsReprProp.FieldByName('Name').Value;
    end
    else
    begin
      FirstName := cdsReprProp.FieldByName('FirstName').Value;
      MiddleName := cdsReprProp.FieldByName('MiddleName').Value;
      LastName := cdsReprProp.FieldByName('LastName').Value;
    end;

    if trim(cdsReprProp.FieldByName('Addr').AsString) = '' then
      Addr := Null
    else
      Addr := cdsReprProp.FieldByName('Addr').Value;
      
    if trim(cdsReprProp.FieldByName('Descr').AsString) = '' then
      Descr := Null
    else
      Descr := cdsReprProp.FieldByName('Descr').Value;

    if id_ContrAgent = Null then
      id_Bsn_ex := id_Bsn
    else
      id_Bsn_ex := Null;
    NeedSend := cdsReprProp.FieldByName('NeedSend').asboolean;
    BIK := cdsReprProp.FieldByName('BIK').Value;
    Bank := cdsReprProp.FieldByName('Bank').Value;
    AccName := cdsReprProp.FieldByName('AccName').Value;
    CorAccNAme := cdsReprProp.FieldByName('CorAccNAme').Value;
    OKPO := cdsReprProp.FieldByName('OKPO').Value;
    INN := cdsReprProp.FieldByName('INN').Value;
    KPP := cdsReprProp.FieldByName('KPP').Value;

    if Fid_Repr = -1 then // Добавляется
    begin
//      Vip := cdsGetClientProp.FieldByName('Vip').AsBoolean;
  //    RealAddr := cdsGetClientProp.FieldByName('RealAddr').Value;
      Fid_Repr := DM.rsCA.AppServer.ReprAdd(id_ContrAgent, isJur, AName, FirstName, MiddleName,
                                            LastName, Id_Currency, Disabled, Addr, Descr, id_Bsn_ex, NeedSend,
                                            BIK, Bank, AccName, CorAccNAme, OKPO, INN, KPP);

      if Fid_Repr = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    end
    else
    begin
      if DM.rsCA.AppServer.ReprEdit(Fid_Repr, id_ContrAgent, isJur,
                                    AName, FirstName, MiddleName, LastName, Id_Currency, Disabled, Addr, Descr, NeedSend,
                                    BIK, Bank, AccName, CorAccNAme, OKPO, INN, KPP) <> 1 then
        raise Exception.Create('Ошибка при сохранении свойств');
    end;
    if not CDSApplyUpdates(cdsReprComment, 'id_Repr', Fid_Repr) then
      raise Exception.Create('Ошибка при сохранении списка комментариев');

    if not CDSApplyUpdates(cdsReprContact, 'id_Repr', Fid_Repr) then
      raise Exception.Create('Ошибка при сохранении контактных данных');

    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
    Fid_Repr := tmpID;
  end;
  Screen.Cursor := OldCursor;
end;

procedure TfReprProp.Setid_Repr(const Value: integer);
begin
  Fid_Repr := Value;
  pcCA.ActivePageIndex := 0;

 { with cdsCAWH do
  begin
    Close;
    Params.ParamByName('@id_Repr').AsInteger := Fid_Repr;
    Open;
  end;     }
  with cdsReprProp do
  begin
    Close;
    Params.ParamByName('@id_Repr').AsInteger := Fid_Repr;
    Open;
    Fid_Bsn := cdsReprPropid_Bsn.AsVariant;
//    fCurSelector1.Initialize(Fid_Bsn);
    if Fid_Repr = -1 then
    begin
      cbDisabled.Enabled := false;
      Edit;
      FieldByName('Disabled').AsBoolean := false;
      FieldByName('isJur').AsBoolean := true;
      FieldByName('NeedSend').AsBoolean := true;
      cbIsJur.ItemIndex := 0;
      Post;
    end
    else
    begin
  //    fCurSelector1.ID_Curr := cdsReprProp.FieldByName('Id_Currency').Value;
      if FieldByName('IsJur').AsBoolean then
        cbIsJur.ItemIndex := 0
      else
        cbIsJur.ItemIndex := 1;
      cdsReprPropisJurChange(nil);
    end;
  end;
  with cdsReprComment do
  begin
    Close;
    Params.ParamByName('@id_Repr').AsInteger := Fid_Repr;
    Open;
  end;
  with cdsReprContact do
  begin
    Close;
    Params.ParamByName('@id_Repr').AsInteger := Fid_Repr;
    Open;
  end;
end;

procedure TfReprProp.UpdateData;
var CDS : TClientDataSet;
    Flag : boolean;
    IDTourType, IDFoodType : Variant;
begin
  CDS := cdsReprProp;

  if CDS.State <> dsEdit then
    CDS.Edit;


  CDS.FieldByName('IsJur').AsBoolean := cbIsJur.ItemIndex = 0;
//  CDS.FieldByName('Id_Currency').Value := fCurSelector1.ID_Curr;
//  CDS.FieldByName('CurrencyName').Value := fCurSelector1.CurName;
  CDS.Post;
end;

procedure TfReprProp.dbgContactCheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfReprProp.dbgContactGetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfReprProp.aContNewExecute(Sender: TObject);
var Contact : TContact;
begin
  Contact.FIO := '';
  Contact.Post := '';
  Contact.Phone := '';
  Contact.email := '';

  if EditContact(Contact) then
  begin
    with cdsReprContact do
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

procedure TfReprProp.aContPropExecute(Sender: TObject);
var Contact : TContact;
begin
  Contact.FIO := cdsReprContact.FieldByName('FIO').AsString;
  Contact.Post := cdsReprContact.FieldByName('Post').AsString;
  Contact.Phone := cdsReprContact.FieldByName('Phone').AsString;
  Contact.email := cdsReprContact.FieldByName('email').AsString;

  if EditContact(Contact) then
  begin
    with cdsReprContact do
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

procedure TfReprProp.aContDeleteExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Удалить контактную информацию?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    cdsReprContact.Delete;
  end;
end;

procedure TfReprProp.aCommentDelExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Удалить комментарий?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    cdsReprComment.Delete;
  end;
end;

procedure TfReprProp.aCommentNewExecute(Sender: TObject);
var CommentType : integer;
    Comment : String;
begin
  CommentType := 0;
  Comment := '';
  if EditComment(CommentType, Comment) then
  begin
    with cdsReprComment do
    begin
      Append;
      FieldByName('CommentType').AsInteger := CommentType;
      FieldByName('Comment').AsString := Comment;
      FieldByName('id_User').AsInteger := DM.IDUser;
      Post;
    end;
  end;
end;

procedure TfReprProp.aCommentPropExecute(Sender: TObject);
var CommentType : integer;
    Comment : String;
begin
  CommentType := cdsReprComment.FieldByName('CommentType').AsInteger;
  Comment := cdsReprComment.FieldByName('Comment').AsString;
  if EditComment(CommentType, Comment) then
  begin
    with cdsReprComment do
    begin
      Edit;
      FieldByName('CommentType').AsInteger := CommentType;
      FieldByName('Comment').AsString := Comment;
      FieldByName('id_User').AsInteger := DM.IDUser;
      Post;
    end;
  end;
end;

procedure TfReprProp.dbgCommentDrawColumnCell(Sender: TObject;
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

procedure TfReprProp.dbgCommentDblClick(Sender: TObject);
begin
  aCommentProp.Execute;
end;

procedure TfReprProp.dsReprContactDataChange(Sender: TObject;
  Field: TField);
begin
  aContProp.Enabled := not cdsReprContact.IsEmpty;
  aContDelete.Enabled := not cdsReprContact.IsEmpty;
end;

procedure TfReprProp.dsReprCommentDataChange(Sender: TObject;
  Field: TField);
begin
  aCommentProp.Enabled := not cdsReprComment.IsEmpty;
  aCommentDel.Enabled := not cdsReprComment.IsEmpty;
end;

procedure TfReprProp.Setid_CA(const Value: Variant);
var ObjName, id_business: OleVariant;
begin
  Fid_CA := Value;
  if Fid_Repr = -1 then
  begin
    DM.rsCA.AppServer.CA_CAGetProp(Fid_CA, ObjName, id_business);
    cdsReprProp.Edit;  
    cdsReprProp.FieldByName('id_ContrAgent').Value := Fid_CA;
    cdsReprPropCAName.Value := ObjName;
    cdsReprProp.Post;
  end;
end;

procedure TfReprProp.cbIsJurChange(Sender: TObject);
begin
  with cdsReprProp do
  begin
    if (FieldByName('isJur').AsBoolean and (cbIsJur.ItemIndex = 1)) or
       (not FieldByName('isJur').AsBoolean and (cbIsJur.ItemIndex = 0)) then
    begin
      Edit;
      FieldByName('IsJur').AsBoolean := cbIsJur.ItemIndex = 0;
      Post;
    end
  end;
end;

function TfReprProp.GerRepName: String;
begin
  if cdsReprPropisJur.AsBoolean then
    Result := cdsReprPropName.AsString
  else
    Result := cdsReprPropLastName.AsString + ' ' +
              cdsReprPropFirstName.AsString + ' ' +
              cdsReprPropMiddleName.AsString + ' ';
end;

procedure TfReprProp.cdsReprPropisJurChange(Sender: TField);
begin
  if cdsReprPropisJur.AsBoolean then
  begin
    EnableControl(DBEdit1);
    DisableControl(DBEdit4);
    DisableControl(DBEdit2);
    DisableControl(DBEdit3);
  end
  else
  begin
    DisableControl(DBEdit1);
    EnableControl(DBEdit4);
    EnableControl(DBEdit2);
    EnableControl(DBEdit3);
  end;

end;

procedure TfReprProp.aCAWHNewExecute(Sender: TObject);
var Aid_CAWhouse : Variant;
begin
 { Aid_CAWhouse := -1;
  if EditCAWHPProp(Aid_CAWhouse, Fid_Repr) then
  begin
    with cdsCAWH do
    begin
      Close;
      Open;
      Locate('id_CAWhouse', Aid_CAWhouse, []);
    end;
  end;  }
end;

procedure TfReprProp.aCAWHPropExecute(Sender: TObject);
var Aid_CAWhouse : Variant;
begin
{  Aid_CAWhouse := cdsCAWHid_CAWhouse.AsInteger;
  if EditCAWHPProp(Aid_CAWhouse, Fid_Repr) then
  begin
    with cdsCAWH do
    begin
      Close;
      Open;
      Locate('id_CAWhouse', Aid_CAWhouse, []);
    end;
  end;   }
end;

procedure TfReprProp.aCAWHDelExecute(Sender: TObject);
begin
//*

end;

procedure TfReprProp.aCAWHContactNewExecute(Sender: TObject);
var Contact : TContact;
begin
 { Contact.FIO := '';
  Contact.Post := '';
  Contact.Phone := '';
  Contact.email := '';

  if EditContact(Contact) then
  begin
    with cdsCAWHCnt do
    begin
      Append;
      FieldByName('FIO').AsString := Contact.FIO;
      FieldByName('Post').AsString := Contact.Post;
      FieldByName('Phone').AsString := Contact.Phone;
      FieldByName('email').AsString := Contact.email;
      Post;
    end;
    if not CDSApplyUpdates(cdsCAWHCnt, 'id_CAWhouse', cdsCAWHid_CAWhouse.AsInteger) then
      raise Exception.Create('Ошибка при сохранении контактных данных по складам');
  end;  }
end;

procedure TfReprProp.aCAWHContactPropExecute(Sender: TObject);
var Contact : TContact;
begin
{  Contact.FIO := cdsCAWHCnt.FieldByName('FIO').AsString;
  Contact.Post := cdsCAWHCnt.FieldByName('Post').AsString;
  Contact.Phone := cdsCAWHCnt.FieldByName('Phone').AsString;
  Contact.email := cdsCAWHCnt.FieldByName('email').AsString;

  if EditContact(Contact) then
  begin
    with cdsCAWHCnt do
    begin
      Edit;
      FieldByName('FIO').AsString := Contact.FIO;
      FieldByName('Post').AsString := Contact.Post;
      FieldByName('Phone').AsString := Contact.Phone;
      FieldByName('email').AsString := Contact.email;
      Post;
    end;
    if not CDSApplyUpdates(cdsCAWHCnt, 'id_CAWhouse', cdsCAWHid_CAWhouse.AsInteger) then
      raise Exception.Create('Ошибка при сохранении контактных данных по складам');
  end;   }
end;

procedure TfReprProp.aCAWHContactDelExecute(Sender: TObject);
begin
 { if MessageBox(Handle, 'Удалить контактную информацию?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    cdsCAWHCnt.Delete;
    if not CDSApplyUpdates(cdsCAWHCnt, 'id_CAWhouse', cdsCAWHid_CAWhouse.AsInteger) then
      raise Exception.Create('Ошибка при сохранении контактных данных по складам');
  end;}
end;

procedure TfReprProp.dsCAWHDataChange(Sender: TObject; Field: TField);
begin
{  aCAWHProp.Enabled := not cdsCAWH.IsEmpty;
  aCAWHDel.Enabled := not cdsCAWH.IsEmpty;
  with cdsCAWHCnt do
  begin
    Close;
    Params.ParamByName('@id_CAWhouse').AsInteger := cdsCAWHid_CAWhouse.AsInteger;
    Open;
  end;     }
end;

procedure TfReprProp.dbgContactDblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aContProp.Execute;
end;

procedure TfReprProp.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aCAWHProp.Execute;
end;

procedure TfReprProp.RxDBGrid2DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aCAWHContactProp.Execute;
end;

procedure TfReprProp.BitBtn4Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
begin
  ASelectedObj.ID := cdsReprProp.FieldByName('id_ContrAgent').Value;
  ASelectedObj.ObjType := eotCA;

 if SelectCA(Self, ASelectedObj, Null, id_Bsn, -1) then
  begin
    with cdsReprProp do
    begin
      Edit;

      FieldByName('id_ContrAgent').Value := ASelectedObj.ID;
      FieldByName('CAName').Value := ASelectedObj.Name;
      Post;
    end;
  end;
end;

procedure TfReprProp.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['0','1','2','3','4','5','6','7','8','9'])) and (Key <> #8) then
  begin
    Key := #0;
    MessageBeep(MB_ICONASTERISK);
  end;
end;

procedure TfReprProp.Button1Click(Sender: TObject);
var MI : TMenuItem;
begin
  pmIns.Items.Clear;

  MI := TMenuItem.Create(Self);
  pmIns.Items.Add(MI);
  MI.Caption := 'Вставить "' + cdsReprPropCAName.AsString + '"';
  MI.OnClick := MiClick;

  if trim(clipBoard.AsText) <> '' then
  begin
    MI := TMenuItem.Create(Self);
    pmIns.Items.Add(MI);
    MI.Caption := 'Вставить "' + clipBoard.AsText + '"';
    MI.OnClick := MiClick;
  end;

  pmIns.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;


procedure TfReprProp.MiClick(Sender: TObject);
var MI : TMenuItem;
    S : String;
begin
  MI := (Sender as TMenuItem);
  S := trim(MI.Caption);
  S := StringReplace(S, 'Вставить "', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S + '*', '"*', '', [rfReplaceAll, rfIgnoreCase]);
//  S := StringReplace('*' + S, '*&', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '&', '', [rfReplaceAll, rfIgnoreCase]);

  with cdsReprProp do
  begin
    Edit;

    FieldByName('Name').Value := S;
    Post;
  end;
end;

end.
