unit frBJItemProp;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ComCtrls, Grids, DBGrids, RXDBCtrl, ExtCtrls,
  StdCtrls, DBCtrls, Mask, ActnList,
  frCurSelector, uDM, foMyFunc, Buttons, frBJTree;

type
  TfBJItemProp = class(TFrame)
    cdsBIP: TClientDataSet;
    dsCtgGoodsProp: TDataSource;
    pBase: TPanel;
    Panel1: TPanel;
    lbMain: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cdsBIPisDeb: TBooleanField;
    cdsBIPName: TStringField;
    cdsBIPid_Acc: TIntegerField;
    cdsBIPid_ContrAgent: TIntegerField;
    cdsBIPid_BJ_Tree: TIntegerField;
    cdsBIPid_BJ_Item: TAutoIncField;
    cdsBIPExtID: TIntegerField;
    cdsBIPPlanIn: TBCDField;
    cdsBIPPlanDelta: TBCDField;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    cdsBIPP_Name: TStringField;
    cdsBIPid_BJ_Obj: TIntegerField;
    cdsBIPid_business: TIntegerField;
    cdsBJTProp: TClientDataSet;
    cdsBJTPropid_BJ_Tree: TAutoIncField;
    cdsBJTPropid_BJ_Obj: TIntegerField;
    cdsBJTPropName: TStringField;
    cdsBJTPropDisabled: TBooleanField;
    cdsBJTPropPID: TIntegerField;
    cdsBJTPropPName: TStringField;
    cdsBJTPropisDeb: TBooleanField;
    cdsBJTPropExtID: TIntegerField;
    cdsBIPPlanCorrect: TBCDField;
    Label1: TLabel;
    DBEdit4: TDBEdit;
    cdsBIPisDirect: TBooleanField;
    cdsBIPisInState: TBooleanField;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    procedure dbgContactCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure dbgContactGetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    Fid_BJ_Item, Fid_BJ_Tree : integer;
    FBJType : TBJType;
    FisDeb : boolean;
    Fid_Bsn : Variant;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    procedure Initialize(Aid_BJ_Item, id_business: integer; ABJType : TBJType; id_BJ_Tree : integer; isDeb : boolean; Aid_Bsn : Variant);

    property id_BJ_Item : integer read Fid_BJ_Item;
  end;

implementation

uses uBJTreeSel, uUnivSelector;

{$R *.DFM}

{ TfCntrAgentProp }

function TfBJItemProp.CheckData: boolean;
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

{  PID := cdsBJTPropPID.AsVariant;
  AName := cdsBJTPropName.AsVariant;
  if DM.rsCA.AppServer.BJ_TreeCheck(Fid_BJ_Tree, PID, AName) = -1 then
  begin
    MessageBox(Handle, 'Такое название уже существует. Измените его', 'Такое название уже существует', MB_OK + MB_ICONERROR);
    Windows.SetFocus(DBEdit1.Handle);
    Exit;
  end;  }

  Result := true;    
end;



function TfBJItemProp.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsBIP;
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

     // if SL.Count > 0 then
       // Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfBJItemProp.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TfBJItemProp.Destroy;
begin
  inherited;

end;

function TfBJItemProp.SaveProp: boolean;
var OldCursor : TCursor;
    id_BJ_Item, id_BJ_Tree, Rez: Integer;
    AName, id_ContrAgent, id_Acc, PlanIn, PlanDelta, PlanCorrect: OleVariant;
    isDirect, isInState : WordBool;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try

    AName := cdsBIPName.AsString;
    id_ContrAgent := cdsBIPid_ContrAgent.AsVariant;
    id_Acc := cdsBIPid_Acc.AsVariant;
    id_BJ_Tree := cdsBIPid_BJ_Tree.Value;

    PlanIn := cdsBIPPlanIn.AsVariant;
    PlanDelta := cdsBIPPlanDelta.AsVariant;
    PlanCorrect := cdsBIPPlanCorrect.AsVariant;

    isDirect := cdsBIPisDirect.AsBoolean;
    isInState := cdsBIPisInState.AsBoolean;

    Rez := DM.rsCA.AppServer.BJ_ItemEdit(Fid_BJ_Item, id_BJ_Tree, AName, id_ContrAgent, id_Acc, PlanIn, PlanDelta, false, PlanCorrect, isDirect, isInState);

    if Rez = -1 then
      raise Exception.Create('Ошибка при сохранении');
    if Fid_BJ_Item = -1 then
      Fid_BJ_Item := Rez;
           
    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;
end;

procedure TfBJItemProp.UpdateData;
var CDS : TClientDataSet;
    Flag : boolean;
    IDTourType, IDFoodType : Variant;
begin
  CDS := cdsBIP;

  if CDS.State <> dsEdit then
    CDS.Edit;

  CDS.Post;
end;

procedure TfBJItemProp.dbgContactCheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfBJItemProp.dbgContactGetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfBJItemProp.Initialize(Aid_BJ_Item, id_business : integer; ABJType : TBJType; id_BJ_Tree : integer; isDeb : boolean; Aid_Bsn : Variant);
var AAid_BJ_Obj, AName, AAPID: OleVariant;
begin
  Fid_BJ_Item := Aid_BJ_Item;
  FBJType := ABJType;
  Fid_BJ_Tree := id_BJ_Tree;
  FisDeb := isDeb;
  Fid_Bsn := Aid_Bsn;
  
  with cdsBIP do
  begin
    Close;
    Params.ParamByName('@id_BJ_Item').AsInteger := Fid_BJ_Item;
    Open;
           
    if Fid_BJ_Item = -1 then
    begin
      Edit;
      FieldByName('isDeb').AsBoolean := isDeb;
      FieldByName('id_BJ_Tree').AsInteger := id_BJ_Tree;
      FieldByName('id_business').AsInteger := id_business;

      FieldByName('isDirect').AsBoolean := false;
      FieldByName('isInState').AsBoolean := false;

      cdsBJTProp.Close;
      cdsBJTProp.Params.ParamByName('@id_BJ_Tree').AsInteger := Fid_BJ_Tree;
      cdsBJTProp.Open;
      try
        cdsBIPP_Name.AsVariant := cdsBJTPropName.AsString;
      finally
        cdsBJTProp.Close;
      end;

      Post;
    end
    else
    begin
    //  FisDeb := FieldByName('isDeb').AsBoolean;
    end;
  end;
  if FBJType = bjtItem then
  begin
    lbMain.Caption := 'Статья';
    BitBtn2.Visible := false;
    DBEdit1.ReadOnly := false;
  end;
  if FBJType = bjtAcc then
    lbMain.Caption := 'Счет';
  if FBJType = bjtCA then
    lbMain.Caption := 'Контрагент';

end;

procedure TfBJItemProp.BitBtn1Click(Sender: TObject);
var AID, id_BlockSelf, id_BlockCh : Variant;
    xxx_AName : String;
begin
  id_BlockSelf := Fid_BJ_Tree;
  id_BlockCh := Null;
  AID := cdsBIPid_BJ_Tree.Value;//id_BlockCh;

  if ShowBJTreeSel(AID, xxx_AName, cdsBIPid_BJ_Obj.AsInteger, id_BlockSelf, id_BlockCh, Null, Fid_Bsn) then
  begin
    with cdsBIP do
    begin
      Edit;
      cdsBIPid_BJ_Tree.Value := AID;
      cdsBIPP_Name.AsString := xxx_AName;
      Post;
    end;
  end;
end;

procedure TfBJItemProp.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
{  if Key = '/' then
  begin
    MessageBeep(MB_ICONEXCLAMATION);
    MessageBox(Handle, 'В названиях категорий недопустимо использовать символ "/" - знак деления. Замените его на другой символ.', 'Ошибка в названии', MB_OK + MB_ICONERROR);
    Key := Char(0);
  end;  }
end;

procedure TfBJItemProp.BitBtn2Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
begin
  case FBJType of
    bjtAcc :
    begin
      ASelectedObj.ObjType := eotFin;
      ASelectedObj.ID := cdsBIPid_Acc.Value;
    end;
    bjtCA :
    begin
      ASelectedObj.ObjType := eotCA;
      ASelectedObj.ID := cdsBIPid_ContrAgent.Value;
    end;
  end;

  if SelectObjUnBsn(Self, cdsBIPid_business.AsInteger, ASelectedObj, 0, [ASelectedObj.ObjType], false) then
  begin
    cdsBIP.Edit;
    cdsBIPid_Acc.AsVariant := Null;
    cdsBIPid_ContrAgent.AsVariant := Null;
    cdsBIPName.AsString := ASelectedObj.Name;
    case FBJType of
      bjtAcc : cdsBIPid_Acc.Value := ASelectedObj.ID;
      bjtCA : cdsBIPid_ContrAgent.Value := ASelectedObj.ID;
    end;
    cdsBIP.Post;
  end;
end;

end.
