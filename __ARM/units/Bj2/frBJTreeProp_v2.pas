unit frBJTreeProp;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ComCtrls, Grids, DBGrids, RXDBCtrl, ExtCtrls,
  StdCtrls, DBCtrls, Mask, ActnList,
  uDM, foMyFunc, Buttons;

type
  TfBJTreeProp = class(TFrame)
    cdsBJTProp: TClientDataSet;
    dsCtgGoodsProp: TDataSource;
    pBase: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    BitBtn1: TBitBtn;
    cdsBJTPropid_BJ_Tree: TAutoIncField;
    cdsBJTPropid_BJ_Obj: TIntegerField;
    cdsBJTPropName: TStringField;
    cdsBJTPropDisabled: TBooleanField;
    cdsBJTPropPID: TIntegerField;
    cdsBJTPropPName: TStringField;
    cdsBJTPropisDeb: TBooleanField;
    cdsBJTPropExtID: TIntegerField;
    procedure dbgContactCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure dbgContactGetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    Fid_BJ_Tree : integer;
    Fid_Bsn : Variant;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    procedure Initialize(id_BJ_Tree, id_BJ_Obj : integer; APID : Variant; isDeb : boolean; Aid_Bsn : Variant);

    property id_BJ_Tree : integer read Fid_BJ_Tree;
  end;

implementation

uses uBJTreeSel;

{$R *.DFM}

{ TfCntrAgentProp }

function TfBJTreeProp.CheckData: boolean;
var WareType, Rez, PP : integer;
    PID, AName: OleVariant;
begin
  Result := false;
  UpdateData;
  with DBEdit1 do
  begin
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбрано наименование', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
{    PP := Pos('/', Text);
    if PP > 0 then
    begin
      MessageBox(Handle, 'В названиях категорий недопустимо использовать символ "/" - знак деления. Замените его на другой символ.', 'Ошибка в названии', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      SelStart := PP - 1;
      SelLength := 1;
      Exit;
    end;  }
  end;

  PID := cdsBJTPropPID.AsVariant;
  AName := cdsBJTPropName.AsVariant;
  if DM.rsCA.AppServer.BJ_TreeCheck(Fid_BJ_Tree, PID, AName) = -1 then
  begin
    MessageBox(Handle, 'Такое название уже существует. Измените его', 'Такое название уже существует', MB_OK + MB_ICONERROR);
    Windows.SetFocus(DBEdit1.Handle);
    Exit;
  end;

  Result := true;    
end;



function TfBJTreeProp.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsBJTProp;
  Result := true;
  UpdateData;
  if (Fid_BJ_Tree <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'Name', 'Название', SL);
      end;

      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfBJTreeProp.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TfBJTreeProp.Destroy;
begin
  inherited;

end;

function TfBJTreeProp.SaveProp: boolean;
var OldCursor : TCursor;
    id_BJ_Obj: Integer;
    AName, PID: OleVariant;
    Rez : integer;
    isDeb : boolean;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
    id_BJ_Obj := cdsBJTProp.FieldByName('id_BJ_Obj').AsInteger;
    AName := cdsBJTProp.FieldByName('Name').AsString;
    PID := cdsBJTProp.FieldByName('PID').AsVariant;
    isDeb := cdsBJTProp.FieldByName('isDeb').AsBoolean;

    Rez := DM.rsCA.AppServer.BJ_TreeEdit(Fid_BJ_Tree, id_BJ_Obj, AName, PID, isDeb, Null);

    if Rez = -1 then
      raise Exception.Create('Ошибка при сохранении свойств');
    if Fid_BJ_Tree = -1 then
      Fid_BJ_Tree := Rez;
           
    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;
end;

procedure TfBJTreeProp.UpdateData;
var CDS : TClientDataSet;
    Flag : boolean;
    IDTourType, IDFoodType : Variant;
begin
  CDS := cdsBJTProp;

  if CDS.State <> dsEdit then
    CDS.Edit;

  CDS.Post;
end;

procedure TfBJTreeProp.dbgContactCheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfBJTreeProp.dbgContactGetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfBJTreeProp.Initialize(id_BJ_Tree, id_BJ_Obj : integer; APID : Variant; isDeb : boolean; Aid_Bsn : Variant);
var AAid_BJ_Obj, AName, AAPID: OleVariant;
begin
  Fid_BJ_Tree := id_BJ_Tree;
  Fid_Bsn := Aid_Bsn;
{  if Fid_BaseCtg = -13 then
    Fid_BaseCtg := Null;  }
  with cdsBJTProp do
  begin
    Close;
    Params.ParamByName('@id_BJ_Tree').AsInteger := Fid_BJ_Tree;
    Open;
           
    if Fid_BJ_Tree = -1 then
    begin
      Edit;
      FieldByName('isDeb').AsBoolean := isDeb;
      FieldByName('id_BJ_Obj').AsInteger := id_BJ_Obj;
      FieldByName('PID').AsVariant := APID;

      if APID <> Null then
      begin
        DM.rsCA.AppServer.BJ_TreeGetProp(APID, AAid_BJ_Obj, AName, AAPID);
        FieldByName('PName').AsString := AName;
      end;
      Post;
    end
    else
    begin
    //  FisDeb := FieldByName('isDeb').AsBoolean;
    end;
  end;
end;

procedure TfBJTreeProp.BitBtn1Click(Sender: TObject);
var AID, id_BlockSelf, id_BlockCh : Variant;
    xxx_AName : String;
begin
  id_BlockSelf := Fid_BJ_Tree;
  id_BlockCh := cdsBJTPropPID.AsVariant;
  AID := id_BlockCh;

  if ShowBJTreeSel(AID, xxx_AName,
            cdsBJTPropid_BJ_Obj.AsInteger, id_BlockSelf, id_BlockCh,
            cdsBJTProp.FieldByName('isDeb').AsBoolean, Fid_Bsn, true) then
  begin
    with cdsBJTProp do
    begin
      Edit;
      cdsBJTPropPID.AsVariant := AID;
      cdsBJTPropPName.AsString := xxx_AName;
      Post;
    end;
  end;
end;

procedure TfBJTreeProp.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
{  if Key = '/' then
  begin
    MessageBeep(MB_ICONEXCLAMATION);
    MessageBox(Handle, 'В названиях категорий недопустимо использовать символ "/" - знак деления. Замените его на другой символ.', 'Ошибка в названии', MB_OK + MB_ICONERROR);
    Key := Char(0);
  end;  }
end;

end.
