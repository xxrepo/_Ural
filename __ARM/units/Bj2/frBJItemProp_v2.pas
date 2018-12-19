unit frBJItemProp_v2;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ComCtrls, Grids, DBGrids, RXDBCtrl, ExtCtrls,
  StdCtrls, DBCtrls, Mask, ActnList,
  frCurSelector, uDM, foMyFunc, Buttons, frBJTree;

type
  TfBJItemProp_v2 = class(TFrame)
    cdsBIP: TClientDataSet;
    dsBIP: TDataSource;
    pBase: TPanel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    BitBtn1: TBitBtn;
    cdsBJTProp: TClientDataSet;
    cdsBJTPropid_BJ_Tree: TAutoIncField;
    cdsBJTPropid_BJ_Obj: TIntegerField;
    cdsBJTPropName: TStringField;
    cdsBJTPropDisabled: TBooleanField;
    cdsBJTPropPID: TIntegerField;
    cdsBJTPropPName: TStringField;
    cdsBJTPropisDeb: TBooleanField;
    cdsBJTPropExtID: TIntegerField;
    cdsBIPisDeb: TBooleanField;
    cdsBIPP_Name: TStringField;
    cdsBIPid_BJ_Obj: TIntegerField;
    cdsBIPid_business: TIntegerField;
    cdsBIPExtID: TIntegerField;
    cdsBIPRealName: TStringField;
    cdsBIPid_BJ_Item: TAutoIncField;
    cdsBIPid_BJ_Tree: TIntegerField;
    cdsBIPName: TStringField;
    cdsBIPDisabled: TBooleanField;
    cdsBIPPlanIn: TBCDField;
    cdsBIPPlanDelta: TBCDField;
    cdsBIPid_Acc: TIntegerField;
    cdsBIPid_ContrAgent: TIntegerField;
    cdsBIPOrdNum_I: TIntegerField;
    cdsBIPold_I: TIntegerField;
    cdsBIPPlanCorrect: TBCDField;
    cdsBIPisDirect: TBooleanField;
    cdsBIPisInState: TBooleanField;
    cdsBIPPlanDelta1: TFloatField;
    cdsBIPPlanCorrect1: TFloatField;
    cdsBIPPlanDelta2: TFloatField;
    cdsBIPPlanCorrect2: TFloatField;
    cdsBIPPlanDelta3: TFloatField;
    cdsBIPPlanCorrect3: TFloatField;
    cdsBIPPlanDelta4: TFloatField;
    cdsBIPPlanCorrect4: TFloatField;
    cdsBIPPlanDelta5: TFloatField;
    cdsBIPPlanCorrect5: TFloatField;
    cdsBIPPlanDelta6: TFloatField;
    cdsBIPPlanCorrect6: TFloatField;
    cdsBIPPlanDelta7: TFloatField;
    cdsBIPPlanCorrect7: TFloatField;
    cdsBIPPlanDelta8: TFloatField;
    cdsBIPPlanCorrect8: TFloatField;
    cdsBIPPlanDelta9: TFloatField;
    cdsBIPPlanCorrect9: TFloatField;
    cdsBIPPlanDelta10: TFloatField;
    cdsBIPPlanCorrect10: TFloatField;
    cdsBIPPlanDelta11: TFloatField;
    cdsBIPPlanCorrect11: TFloatField;
    cdsBIPPlanDelta12: TFloatField;
    cdsBIPPlanCorrect12: TFloatField;
    Panel1: TPanel;
    lbMain: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    BitBtn2: TBitBtn;
    DBEdit2: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Label1: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label15: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label17: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label19: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Label21: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    Label23: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    Label25: TLabel;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    Label3: TLabel;
    Label6: TLabel;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    Label8: TLabel;
    cdsBIPS1: TFloatField;
    cdsBIPS2: TFloatField;
    cdsBIPS3: TFloatField;
    cdsBIPS4: TFloatField;
    cdsBIPS5: TFloatField;
    cdsBIPS6: TFloatField;
    cdsBIPS7: TFloatField;
    cdsBIPS8: TFloatField;
    cdsBIPS9: TFloatField;
    cdsBIPS10: TFloatField;
    cdsBIPS11: TFloatField;
    cdsBIPS12: TFloatField;
    cdsBIPS_D: TFloatField;
    cdsBIPS_K: TFloatField;
    cdsBIPS_T: TFloatField;
    DBEdit40: TDBEdit;
    Label10: TLabel;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    procedure dbgContactCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure dbgContactGetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure cdsBIPCalcFields(DataSet: TDataSet);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
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

uses uBJTreeSel, uUnivSelector, uBJList_v2;

{$R *.DFM}

{ TfCntrAgentProp }

function TfBJItemProp_v2.CheckData: boolean;
var WareType, Rez, PP : integer;
    PID, AName: OleVariant;
begin
  Result := false;
  UpdateData;
  with DBEdit1 do
  begin
    if trim(Text) = '' then
    begin
      MessageBox(Handle, '�� ������� ������������', '������� �� ��� ������', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  end;
  with DBEdit5 do
  begin
    if trim(Text) = '' then
    begin
      MessageBox(Handle, '�� ������� ���������', '������� �� ��� ������', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  end;

{  PID := cdsBJTPropPID.AsVariant;
  AName := cdsBJTPropName.AsVariant;
  if DM.rsCA.AppServer.BJ_TreeCheck(Fid_BJ_Tree, PID, AName) = -1 then
  begin
    MessageBox(Handle, '����� �������� ��� ����������. �������� ���', '����� �������� ��� ����������', MB_OK + MB_ICONERROR);
    Windows.SetFocus(DBEdit1.Handle);
    Exit;
  end;  }

  Result := true;    
end;



function TfBJItemProp_v2.ConfirmChanges: boolean;
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
        CompareField(CDS, 'Name', '��������', SL);
      end;

     // if SL.Count > 0 then
       // Result := MessageBox(Handle, PChar('���� �������� ��������� ������:' + #13 + #10 + SL.Text ), '����������� ���������', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfBJItemProp_v2.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TfBJItemProp_v2.Destroy;
begin
  inherited;

end;

function TfBJItemProp_v2.SaveProp: boolean;
var OldCursor : TCursor;
    Rez : integer;
    id_BJ_Tree, AName, PlanIn,
              id_ContrAgent, id_Acc, NeedCalc, isDirect, isInState, PlanDelta1,
              PlanCorrect1, PlanDelta2, PlanCorrect2, PlanDelta3, PlanCorrect3,
              PlanDelta4, PlanCorrect4, PlanDelta5, PlanCorrect5, PlanDelta6,
              PlanCorrect6, PlanDelta7, PlanCorrect7, PlanDelta8, PlanCorrect8,
              PlanDelta9, PlanCorrect9, PlanDelta10, PlanCorrect10, PlanDelta11,
              PlanCorrect11, PlanDelta12, PlanCorrect12: OleVariant;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try

    AName := cdsBIPRealName.AsString;
    id_ContrAgent := cdsBIPid_ContrAgent.AsVariant;
    id_Acc := cdsBIPid_Acc.AsVariant;
    id_BJ_Tree := cdsBIPid_BJ_Tree.Value;

    PlanIn := cdsBIPPlanIn.AsVariant;

    isDirect := cdsBIPisDirect.AsBoolean;
    isInState := cdsBIPisInState.AsBoolean;
    NeedCalc := false;
    PlanDelta1 := cdsBIP.FieldByName('PlanDelta1').AsVariant;
    PlanCorrect1 := cdsBIP.FieldByName('PlanCorrect1').AsVariant;
    PlanDelta2 := cdsBIP.FieldByName('PlanDelta2').AsVariant;
    PlanCorrect2 := cdsBIP.FieldByName('PlanCorrect2').AsVariant;
    PlanDelta3 := cdsBIP.FieldByName('PlanDelta3').AsVariant;
    PlanCorrect3 := cdsBIP.FieldByName('PlanCorrect3').AsVariant;
    PlanDelta4 := cdsBIP.FieldByName('PlanDelta4').AsVariant;
    PlanCorrect4 := cdsBIP.FieldByName('PlanCorrect4').AsVariant;
    PlanDelta5 := cdsBIP.FieldByName('PlanDelta5').AsVariant;
    PlanCorrect5 := cdsBIP.FieldByName('PlanCorrect5').AsVariant;
    PlanDelta6 := cdsBIP.FieldByName('PlanDelta6').AsVariant;
    PlanCorrect6 := cdsBIP.FieldByName('PlanCorrect6').AsVariant;
    PlanDelta7 := cdsBIP.FieldByName('PlanDelta7').AsVariant;
    PlanCorrect7 := cdsBIP.FieldByName('PlanCorrect7').AsVariant;
    PlanDelta8 := cdsBIP.FieldByName('PlanDelta8').AsVariant;
    PlanCorrect8 := cdsBIP.FieldByName('PlanCorrect8').AsVariant;
    PlanDelta9 := cdsBIP.FieldByName('PlanDelta9').AsVariant;
    PlanCorrect9 := cdsBIP.FieldByName('PlanCorrect9').AsVariant;
    PlanDelta10 := cdsBIP.FieldByName('PlanDelta10').AsVariant;
    PlanCorrect10 := cdsBIP.FieldByName('PlanCorrect10').AsVariant;
    PlanDelta11 := cdsBIP.FieldByName('PlanDelta11').AsVariant;
    PlanCorrect11 := cdsBIP.FieldByName('PlanCorrect11').AsVariant;
    PlanDelta12 := cdsBIP.FieldByName('PlanDelta12').AsVariant;
    PlanCorrect12 := cdsBIP.FieldByName('PlanCorrect12').AsVariant;

    Rez := DM.rsCA.AppServer.BJ_ItemEdit_v2(Fid_BJ_Item, id_BJ_Tree, AName, PlanIn,
              id_ContrAgent, id_Acc, NeedCalc, isDirect, isInState, PlanDelta1,
              PlanCorrect1, PlanDelta2, PlanCorrect2, PlanDelta3, PlanCorrect3,
              PlanDelta4, PlanCorrect4, PlanDelta5, PlanCorrect5, PlanDelta6,
              PlanCorrect6, PlanDelta7, PlanCorrect7, PlanDelta8, PlanCorrect8,
              PlanDelta9, PlanCorrect9, PlanDelta10, PlanCorrect10, PlanDelta11,
              PlanCorrect11, PlanDelta12, PlanCorrect12);

    if Rez = -1 then
      raise Exception.Create('������ ��� ����������');
    if Fid_BJ_Item = -1 then
      Fid_BJ_Item := Rez;
           
    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;
end;

procedure TfBJItemProp_v2.UpdateData;
var CDS : TClientDataSet;
    Flag : boolean;
    IDTourType, IDFoodType : Variant;
begin
  CDS := cdsBIP;

  if CDS.State <> dsEdit then
    CDS.Edit;

  CDS.Post;
end;

procedure TfBJItemProp_v2.dbgContactCheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfBJItemProp_v2.dbgContactGetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfBJItemProp_v2.Initialize(Aid_BJ_Item, id_business : integer; ABJType : TBJType; id_BJ_Tree : integer; isDeb : boolean; Aid_Bsn : Variant);
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
    lbMain.Caption := '������';
    BitBtn2.Visible := false;
    DBEdit1.ReadOnly := false;
  end;
  if FBJType = bjtAcc then
    lbMain.Caption := '����';
  if FBJType = bjtCA then
    lbMain.Caption := '����������';

end;

procedure TfBJItemProp_v2.BitBtn1Click(Sender: TObject);
var AID, id_BlockSelf, id_BlockCh : Variant;
    xxx_AName : String;
    id_BJ_Obj : integer;
begin
  id_BlockSelf := Fid_BJ_Tree;
  id_BlockCh := Null;
  AID := cdsBIPid_BJ_Tree.Value;//id_BlockCh;
  id_BJ_Obj := cdsBIPid_BJ_Obj.AsInteger;
  if Assigned(BJList_v2) then
    id_BJ_Obj := BJList_v2.fBJList1.fBJTree1.Fid_BJ_Obj;
  if ShowBJTreeSel(AID, xxx_AName, id_BJ_Obj, id_BlockSelf, id_BlockCh, Null, Fid_Bsn) then
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

procedure TfBJItemProp_v2.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
{  if Key = '/' then
  begin
    MessageBeep(MB_ICONEXCLAMATION);
    MessageBox(Handle, '� ��������� ��������� ����������� ������������ ������ "/" - ���� �������. �������� ��� �� ������ ������.', '������ � ��������', MB_OK + MB_ICONERROR);
    Key := Char(0);
  end;  }
end;

procedure TfBJItemProp_v2.BitBtn2Click(Sender: TObject);
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
    cdsBIPRealName.AsString := ASelectedObj.Name;
    case FBJType of
      bjtAcc : cdsBIPid_Acc.Value := ASelectedObj.ID;
      bjtCA : cdsBIPid_ContrAgent.Value := ASelectedObj.ID;
    end;
    cdsBIP.Post;
  end;
end;

procedure TfBJItemProp_v2.cdsBIPCalcFields(DataSet: TDataSet);
begin
  cdsBIPS1.AsFloat := cdsBIPPlanDelta1.AsFloat + cdsBIPPlanCorrect1.AsFloat;
  cdsBIPS2.AsFloat := cdsBIPPlanDelta2.AsFloat + cdsBIPPlanCorrect2.AsFloat;
  cdsBIPS3.AsFloat := cdsBIPPlanDelta3.AsFloat + cdsBIPPlanCorrect3.AsFloat;
  cdsBIPS4.AsFloat := cdsBIPPlanDelta4.AsFloat + cdsBIPPlanCorrect4.AsFloat;
  cdsBIPS5.AsFloat := cdsBIPPlanDelta5.AsFloat + cdsBIPPlanCorrect5.AsFloat;
  cdsBIPS6.AsFloat := cdsBIPPlanDelta6.AsFloat + cdsBIPPlanCorrect6.AsFloat;
  cdsBIPS7.AsFloat := cdsBIPPlanDelta7.AsFloat + cdsBIPPlanCorrect7.AsFloat;
  cdsBIPS8.AsFloat := cdsBIPPlanDelta8.AsFloat + cdsBIPPlanCorrect8.AsFloat;
  cdsBIPS9.AsFloat := cdsBIPPlanDelta9.AsFloat + cdsBIPPlanCorrect9.AsFloat;
  cdsBIPS10.AsFloat := cdsBIPPlanDelta10.AsFloat + cdsBIPPlanCorrect10.AsFloat;
  cdsBIPS11.AsFloat := cdsBIPPlanDelta11.AsFloat + cdsBIPPlanCorrect11.AsFloat;
  cdsBIPS12.AsFloat := cdsBIPPlanDelta12.AsFloat + cdsBIPPlanCorrect12.AsFloat;

  cdsBIPS_D.AsFloat := cdsBIPPlanDelta1.AsFloat + cdsBIPPlanDelta2.AsFloat
   + cdsBIPPlanDelta3.AsFloat
    + cdsBIPPlanDelta4.AsFloat
    + cdsBIPPlanDelta5.AsFloat
    + cdsBIPPlanDelta6.AsFloat
    + cdsBIPPlanDelta7.AsFloat
    + cdsBIPPlanDelta8.AsFloat
    + cdsBIPPlanDelta9.AsFloat
    + cdsBIPPlanDelta10.AsFloat
    + cdsBIPPlanDelta11.AsFloat
    + cdsBIPPlanDelta12.AsFloat;

  cdsBIPS_K.AsFloat := cdsBIPPlanCorrect1.AsFloat + cdsBIPPlanCorrect2.AsFloat
   + cdsBIPPlanCorrect3.AsFloat
    + cdsBIPPlanCorrect4.AsFloat
    + cdsBIPPlanCorrect5.AsFloat
    + cdsBIPPlanCorrect6.AsFloat
    + cdsBIPPlanCorrect7.AsFloat
    + cdsBIPPlanCorrect8.AsFloat
    + cdsBIPPlanCorrect9.AsFloat
    + cdsBIPPlanCorrect10.AsFloat
    + cdsBIPPlanCorrect11.AsFloat
    + cdsBIPPlanCorrect12.AsFloat;

  cdsBIPS_T.AsFloat := cdsBIPPlanDelta1.AsFloat + cdsBIPPlanDelta2.AsFloat
   + cdsBIPPlanDelta3.AsFloat
    + cdsBIPPlanDelta4.AsFloat
    + cdsBIPPlanDelta5.AsFloat
    + cdsBIPPlanDelta6.AsFloat
    + cdsBIPPlanDelta7.AsFloat
    + cdsBIPPlanDelta8.AsFloat
    + cdsBIPPlanDelta9.AsFloat
    + cdsBIPPlanDelta10.AsFloat
    + cdsBIPPlanDelta11.AsFloat
    + cdsBIPPlanDelta12.AsFloat
    + cdsBIPPlanCorrect1.AsFloat + cdsBIPPlanCorrect2.AsFloat
   + cdsBIPPlanCorrect3.AsFloat
    + cdsBIPPlanCorrect4.AsFloat
    + cdsBIPPlanCorrect5.AsFloat
    + cdsBIPPlanCorrect6.AsFloat
    + cdsBIPPlanCorrect7.AsFloat
    + cdsBIPPlanCorrect8.AsFloat
    + cdsBIPPlanCorrect9.AsFloat
    + cdsBIPPlanCorrect10.AsFloat
    + cdsBIPPlanCorrect11.AsFloat
    + cdsBIPPlanCorrect12.AsFloat;
end;

procedure TfBJItemProp_v2.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #13) then
    begin
      if cdsBIP.State = dsEdit then
        cdsBIP.Post
    end;
end;

end.