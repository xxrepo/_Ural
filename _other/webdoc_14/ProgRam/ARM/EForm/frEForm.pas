unit frEForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ExtCtrls, StdCtrls,
  registry, db, foMyFunc,
  ActnList, ToolWin, RXCtrls, frUnDict,
  Menus, AdvMenus,  contnrs, jpeg,
  AdvOfficePager, AdvOfficePagerStylers, frNS, frUsers, sPageControl, sFrameAdapter;

type
 
  TEObj = class
    EObjType : TEObjType;
    Name  : String;
    constructor Create(ATEObjType : TEObjType);
  private
  end;

  TfEForm = class(TFrame)
    ActionList1: TActionList;
    aShowTree: TAction;
    aBsnProp: TAction;
    aNewBsn: TAction;
    pmEM: TAdvPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    aRefresheBsn: TAction;
    sPageControl2: TsPageControl;
    sFrameAdapter1: TsFrameAdapter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure sPageControl2Change(Sender: TObject);
    procedure sPageControl2CloseBtnClick(Sender: TComponent;
      TabIndex: Integer; var CanClose: Boolean;
      var Action: TacCloseAction);
  private

    FInSelect : boolean;
    FDisabled : Variant;
    FEObjTypes : TEObjTypes;
    FSelectedObj : TSelectedObj;


    function GetEObjType: TEObjType;
    function GetSelObjID: Variant;
    function GetObjName: String;
    function GetisNeedObjSelected: boolean;
    procedure InternalInitialize(ASelectedObj: TSelectedObj; AEObjTypes: TEObjTypes);
    procedure GetTree;
    function GetImageIndex(AEObj: TEObj): integer;
   public
    fCurrencyList: TfUnDict;
    fOper: TfUnDict;
    fCA: TfUnDict;
    fDocType: TfUnDict;
    fWorkType: TfUnDict;
    fDocState: TfUnDict;
    
    fNS: TfNS;
    fUsers: TfUsers;

    function GetUnFrame(ObjType : TEObjType) : TfUnDict;
    function SetPosit(ASelectedObj : TSelectedObj) : boolean;
    procedure Initialize(ASelectedObj : TSelectedObj;AEObjTypes : TEObjTypes = [eotNS, eotCrn, eotCA, eotOper, eotDocType, eotWorkType, eotDocState] );
    procedure Initialize2(ASelectedObj : TSelectedObj; AEObjTypes : TEObjTypes = [eotNS, eotCrn, eotCA, eotOper, eotDocType, eotWorkType, eotDocState]);
    destructor Destroy; override;
    constructor Create(AOwner: TComponent); override;

    procedure RefrNS;

    property EObjTypes : TEObjTypes read FEObjTypes;

    property SelObjType : TEObjType read GetEObjType;
    property SelObjID : Variant read GetSelObjID;
    property SelObjName : String read GetObjName;



    property isNeedObjSelected : boolean read GetisNeedObjSelected;
  end;


implementation

uses uMainForm, uDM;
{$R *.DFM}

{ TEObj }


constructor TEObj.Create(ATEObjType : TEObjType);
begin
  inherited Create;
  EObjType := ATEObjType;
  case EObjType of
    eotNS : Name := 'Бизнес';
    eotUsers : Name := 'Пользователи';
    eotUsersGroup : Name := 'Группы пользователей';
    eotCA : Name := 'Юр. лица';
    eotCrn : Name := 'Валюта';

    eotOper : Name := 'Принадлежности';
    eotDocType : Name := 'Тип документов';
    eotWorkType : Name := 'Виды деятельности';
    eotDocState : Name := 'Состояние документа';

    eotExtNames : Name := 'Доп. параметры';
    // 666 eotD1, eotD2, eotD3, eotD4, eotD5, eotD6, eotD7, eotD8, eotD9, eotD10
  end;

end;

{ TEForm }



destructor TfEForm.Destroy;
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
begin
  ShowText('');
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    FullRegPathName := SRegPath + '\' + ClassName;
 // if fWareGoods <> nil then
   // with fWareGoods do SaveGridSettingsToRegistry(grdList, SRegPath + Name + '\grdList');
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  inherited;
end;

constructor TfEForm.Create(AOwner: TComponent);
var Reg : TRegistry;
    i : integer;
    FullRegPathName : String;
    ID_Bsn : Variant;
    ObjType : TEObjType;
begin
  inherited;
     //   if DM.cdsDDD.Params.ParamByName('@id_NS').Value <> DM.id_NS then
 

  while sPageControl2.PageCount > 0 do
    sPageControl2.Pages[sPageControl2.PageCount - 1].Free;
  FInSelect := false;
  
  ID_Bsn := Null;
  ObjType := eotNone;

  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    FullRegPathName := SRegPath + '\' + ClassName;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TfEForm.GetTree;
  procedure AddObj(ATEObjType : TEObjType);
  var Obj1 : TEObj;
      i : integer;
      TS : TsTabSheet;
      xTEObjType : TEObjType;
      S : String;
  begin

    if (ATEObjType in FEObjTypes) then
    begin
      if (ATEObjType = eotCA) then
      begin
      //  ATEObjType := eotOper;
      end;
      for i := 0 to sPageControl2.PageCount - 1 do
      begin
         if sPageControl2.Pages[i].Tag = ORD(ATEObjType) then
         begin
           Exit;
         end;
      end;

      if ATEObjType in [eotD1, eotD2, eotD3, eotD4, eotD5, eotD6, eotD7, eotD8, eotD9, eotD10] then
      begin

        if DM.cdsDDD.Locate('ColName', 'Obj_Str' + IntToStr(-DM.GetExtIdByType(ATEObjType) - 100), [loCaseInsensitive]) then
          if DM.cdsDDDisVisible.AsBoolean then
            S := DM.cdsDDDParamName.AsString;

        if S = '' then Exit;
      end;
      if ATEObjType in [eotF1, eotF2, eotF3, eotF4, eotF5, eotF6, eotF7, eotF8, eotF9, eotF10] then
      begin

        if DM.cdsDDD.Locate('ColName', 'Adv_Str' + IntToStr(DM.GetExtIdByType(ATEObjType) - 5000), [loCaseInsensitive]) then
          if DM.cdsDDDisVisible.AsBoolean then
            S := DM.cdsDDDParamName.AsString;

        if S = '' then Exit;
      end;

      Obj1 := TEObj.Create(ATEObjType);

      if S <> '' then
        Obj1.Name := S;

      TS := TsTabSheet.Create(Self);
      TS.PageControl := sPageControl2;
      TS.Caption := Obj1.Name;
      TS.ImageIndex := GetImageIndex(Obj1);
      TS.Tag := ORD(Obj1.EObjType);
    end;
  end;

begin
      AddObj(eotOper);
      AddObj(eotCA);
      AddObj(eotDocType);
      AddObj(eotWorkType);
      AddObj(eotDocState);

      AddObj(eotNS);
      AddObj(eotCrn);
      
      AddObj(eotUsers);
  //    AddObj(eotExtNames);

      AddObj(eotD1);
      AddObj(eotD2);
      AddObj(eotD3);
      AddObj(eotD4);
      AddObj(eotD5);
      AddObj(eotD6);
      AddObj(eotD7);
      AddObj(eotD8);
      AddObj(eotD9);
      AddObj(eotD10);

      AddObj(eotF1);
      AddObj(eotF2);
      AddObj(eotF3);
      AddObj(eotF4);
      AddObj(eotF5);
      AddObj(eotF6);
      AddObj(eotF7);
      AddObj(eotF8);
      AddObj(eotF9);
      AddObj(eotF10);
end;



procedure TfEForm.InternalInitialize(ASelectedObj : TSelectedObj; AEObjTypes : TEObjTypes);
var i : integer;
    Obj : TEObj;
    N : TTreeNode;
    b : boolean;
begin
  FEObjTypes := AEObjTypes;
  if (FEObjTypes <> [eotNS]) then
       begin
          DM.cdsDDD.Close;
          DM.cdsDDD.Params.ParamByName('@id_NS').Value := DM.id_NS;
          DM.cdsDDD.Params.ParamByName('@isInt').Value := Null;
          DM.cdsDDD.Open;
        end;

        
  FSelectedObj := ASelectedObj;

  GetTree;
  
  try
    FInSelect := true;
    b := SetPosit(ASelectedObj);
  except
  end;
  FInSelect := true;

  if sPageControl2.PageCount = 1 then
  begin
    sPageControl2.ActivePage.TabVisible := false;
  end
  else
  begin
    for i := 0 to sPageControl2.PageCount - 1 do
      sPageControl2.Pages[i].TabVisible := true;
  end;
  
  if ((sPageControl2.PageCount > 0) and (sPageControl2.ActivePage = nil)) or (not b) then
  begin
    sPageControl2.ActivePageIndex := 0;
    if Assigned(sPageControl2.onChange) then sPageControl2.onChange(sPageControl2);
  end;


end;


procedure TfEForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfEForm.TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  if TObject(Node.Data) is TEObj then
  begin
    Node.ImageIndex := GetImageIndex(TEObj(Node.Data));
  end
  else
    Node.ImageIndex := -1;
end;

function TfEForm.GetImageIndex(AEObj: TEObj) : integer;
begin
  Result := -1;
   case AEObj.EObjType of
      eotOper : Result := 3;
      eotCA : Result := 6;
      eotUsers : Result := 7;
      eotUsersGroup : Result := 8;

      eotNS : Result := 12;
      eotCrn : Result := 9;
      eotDocType : Result := 11;
      eotWorkType : Result := 13;
      eotDocState : Result := 14;
      eotExtNames : Result := 5;
      else
        Result := -1;
    end;
end;


procedure TfEForm.TreeView1GetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;






procedure TfEForm.Initialize2(ASelectedObj : TSelectedObj; AEObjTypes : TEObjTypes);
begin
  InternalInitialize(ASelectedObj, AEObjTypes);
end;

procedure TfEForm.Initialize(ASelectedObj : TSelectedObj;  AEObjTypes: TEObjTypes );
begin
  InternalInitialize(ASelectedObj, AEObjTypes);
end;

function TfEForm.GetEObjType: TEObjType;
begin
  Result := eotNone;
  if sPageControl2.ActivePage <> nil then
    Result := TEObjType(sPageControl2.ActivePage.Tag);

  if (Result = eotOper) and (eotCA in FEObjTypes) {1013 and fCaNavigator.ShowReprList} then
      Result := eotCA;
end;

function TfEForm.GetSelObjID: Variant;
begin
  Result := Null;
  {1013  case SelObjType of
      eotFin :
      begin
        if fAcc1.cdsPMAcc.Active then
          Result := fAcc1.cdsPMAcc.FieldByName('id_PMAcc').Value;
      end;
      eotCA :
      begin
        Result := fCaNavigator.CA_ID;
      end;
      eotCAGrp :
      begin
        Result := fCAGroupList.ID_Group;
      end;
      eotGO:
      begin

        Result := fWay1.id_GO;
      end;
      eotHotel:
      begin

        Result := fHotel1.id_Hotel;
      end;
      eotRepr :
      begin
        Result := fCaNavigator.Repr_ID;
      end;
      eotSvc :
      begin
        Result := fSvc1.id_Service;
      end;
      eotGOType :
      begin         
        Result := fGOType.id_GOType;
      end;
      eotClass :
      begin         
        Result := fMDList.id_MD_Class;
      end;
      eotClassVal :
      begin         
        Result := fClassVal.id_MD_Synonym;
      end;
    end;  }
end;

function TfEForm.GetObjName: String;
begin
  Result := '';
  {1013  case SelObjType of
      eotFin :
      begin
        if fAcc1.cdsPMAcc.Active then
          Result := fAcc1.cdsPMAccPmAccName.AsString;
      end;
      eotCA :
      begin
        Result := fCaNavigator.CA_Name;
      end;
      eotCAGrp :
      begin
        Result := fCAGroupList.GrpName;
      end;
      eotGO :
      begin
        Result := fWay1.GOName;
      end;
      eotHotel :
      begin
        Result := fHotel1.HotelName;
      end;
      eotRepr :
      begin
        Result := fCaNavigator.Repr_Name;
      end;
      eotSvc :
      begin
        Result := fSvc1.ServiceName;
      end;
      eotGOType :
      begin
        Result := fGOType.GOTypeName;
      end;
      eotClass :
      begin         
        Result := fMDList.ClassName;
      end;
      eotClassVal :
      begin         
        Result := fClassVal.SynonymName;
      end;
    end;  }
end;

function TfEForm.GetisNeedObjSelected: boolean;
begin
  Result := ((SelObjType in FEObjTypes) or
     ((SelObjType = eotCA) and (SelObjType in FEObjTypes))
     ) and (SelObjID <> Null);
end;

function TfEForm.SetPosit(ASelectedObj: TSelectedObj) : boolean;
  function SetObj(ObjType : TEObjType) : boolean;
  var i, j : integer;
  begin
    Result := false;
      for j := 0 to sPageControl2.PageCount - 1 do
      begin
        if sPageControl2.Pages[j].Tag = ORD(ObjType) then
        begin
          Result := true;
          sPageControl2.ActivePageIndex := j;
          Break;
        end;
      end;
  end;
var ID : OleVariant;
    id_Group, id_Ca, ID_GO : OleVariant;
    ExtId : integer;
begin
  Result := false;
  case ASelectedObj.ObjType of
    eotUsers :
    begin
      if SetObj(ASelectedObj.ObjType) then
      begin
        fUsers.Initialize;
        Result := true;
      end;
    end;
    eotNS :
    begin
      if SetObj(ASelectedObj.ObjType) then
      begin
        fNS.Initialize;
        Result := true;
      end;
    end;
    eotCrn, eotCA, eotOper, eotDocType, eotWorkType, eotDocState, eotExtNames,
        eotD1, eotD2, eotD3, eotD4, eotD5, eotD6, eotD7, eotD8, eotD9, eotD10,
        eotF1, eotF2, eotF3, eotF4, eotF5, eotF6, eotF7, eotF8, eotF9, eotF10 :
    begin
      if SetObj(ASelectedObj.ObjType) then
      begin
        ExtId := DM.GetExtIdByType(ASelectedObj.ObjType);
        GetUnFrame(ASelectedObj.ObjType).ID_Obj := ASelectedObj.ID;
        Result := true;
      end;
    end;
  end;    
end;


 
 


 

procedure TfEForm.sPageControl2Change(Sender: TObject);
var i, N : integer;
    xFrame : TfUnDict;
begin
{  N := 0;
  for i := 0 to sPageControl2.PageCount - 1 do
  begin
    if sPageControl2.Pages[i].TabVisible then inc(N);
  end;
  if (N = 1) then
  begin
    sPageControl2.ActivePage.TabVisible := false;
   // sPageControl2.TabSettings.Height := 0;
  end;  }
  if sPageControl2.ActivePage = nil then Exit;

  if TEObjType(sPageControl2.ActivePage.Tag) in [eotCrn, eotCA, eotOper, eotDocType, eotWorkType, eotDocState, eotExtNames,
        eotD1, eotD2, eotD3, eotD4, eotD5, eotD6, eotD7, eotD8, eotD9, eotD10,
        eotF1, eotF2, eotF3, eotF4, eotF5, eotF6, eotF7, eotF8, eotF9, eotF10 ] then
  begin
    xFrame := GetUnFrame(TEObjType(sPageControl2.ActivePage.Tag));
    if xFrame = nil then
    begin
      xFrame := TfUnDict.Create(Self, DM.GetExtIdByType(TEObjType(sPageControl2.ActivePage.Tag)));
      with xFrame do
      begin
        Name := 'xFrame_' + IntToStr(sPageControl2.ActivePage.Tag);
        Tag := sPageControl2.ActivePage.Tag;
        Parent := sPageControl2.ActivePage;
        Align := alClient;

      //  Initialize(DM.GetExtIdByType(TEObjType(sPageControl2.ActivePage.Tag)));
      end;
    end
    else
      xFrame.RefrNS;
  end
  else
  if sPageControl2.ActivePage.Tag  = ORD(eotNS) then
  begin
    if fNS = nil then
    begin
      fNS := TfNS.Create(Self);
      with fNS do
      begin
        Parent := sPageControl2.ActivePage;
        Align := alClient;
        Initialize;
      end;
    end;
  end
  else
  if sPageControl2.ActivePage.Tag  = ORD(eotUsers) then
  begin
    if fUsers = nil then
    begin
      fUsers := TfUsers.Create(Self);
      with fUsers do
      begin
        Parent := sPageControl2.ActivePage;
        Align := alClient;
        Initialize;
      end;
    end;
  end;
end;

procedure TfEForm.sPageControl2CloseBtnClick(Sender: TComponent;
  TabIndex: Integer; var CanClose: Boolean; var Action: TacCloseAction);
var i, N : integer;
begin
  N := 0;
  for i := 0 to sPageControl2.PageCount - 1 do
  begin
    if sPageControl2.Pages[i].TabVisible then inc(N);
  end;
  if (N = 2) then
  begin
    sPageControl2.ActivePage.TabVisible := false;
   // sPageControl2.TabSettings.Height := 0;
  end;

end;

function TfEForm.GetUnFrame(ObjType: TEObjType): TfUnDict;
var i : integer;
begin
  Result := nil;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TfUnDict then
       if TfUnDict(Components[i]).Tag = ORD(ObjType) then
       begin
         Result := TfUnDict(Components[i]);
         Break;
       end;
end;

procedure TfEForm.RefrNS;
var EObjType : TEObjType;
    FR : TfUnDict;
begin
  EObjType := eotNone;
  if sPageControl2.ActivePage <> nil then
    EObjType := TEObjType(sPageControl2.ActivePage.Tag);
  FR := GetUnFrame(EObjType);
  if Assigned(FR) then FR.aRefresh.Execute; 
end;

end.


