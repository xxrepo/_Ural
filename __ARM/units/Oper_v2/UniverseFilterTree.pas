unit UniverseFilterTree;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ExtCtrls, ToolWin, StdCtrls, Grids, RXGrids, RXCtrls,
  Db, dbclient, mconnect, StrUtils, ToolEdit, CurrEdit,
  Menus,
  DateUtil,
  UniverseFilter, Buttons,
  contnrs, frArc, frBsnSelector;

const WM_RefrList = WM_User + 2356;
const  xxxSRegPath = '\SOFTWARE\FO\EMng';

type
  TUFTree = class(TFrame)
    WorkDS : TClientDataSet;
    ImgList: TImageList;
    TBar: TToolBar;
    ToolButton2: TToolButton;
    AddBtn2: TToolButton;
    ObjView: TTreeView;
    procedure ObjViewGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure ObjViewGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure ObjViewDblClick(Sender: TObject);
    procedure ObjViewExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure ObjViewDeletion(Sender: TObject; Node: TTreeNode);
    procedure ObjViewCustomDraw(Sender: TCustomTreeView;
      const ARect: TRect; var DefaultDraw: Boolean);
    procedure aOkExecute(Sender: TObject);
    procedure AddBtn2Click(Sender: TObject);
  private
    FSelectedNode : TTreeNode;
    fMainNode: TTreeNode;
    FUniType: String;
    fConnection2: TCustomConnection;
    FID_Univ: Integer;

    FBsnId : integer;
    procedure SetConnection(const Value: TCustomConnection);
    procedure SetTreeDataList(const Value: TList);
    procedure GetNodeTDList(Node: TTreeNode);
    procedure _ClearList(AList: TList);
    function GetSelectedNode: TTreeNode;
    procedure SetSelectedNode(const Value: TTreeNode);

    function GetSelCount: Integer;
    procedure SetObjDataList(const Value: TList);
    procedure SetID_Univ(const Value: Integer);
    function GetConnection2: TCustomConnection;

  public
    FTaskMaster : TTaskMasterClass;
    FilterWasSaved : boolean;
    Fid_user, FParHandle : integer;

    procedure GetNodeTDListCover(Node: TTreeNode);

    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    property SelectedNode: TTreeNode read GetSelectedNode write SetSelectedNode;
    property ID_Univ    : Integer          read FID_Univ         write SetID_Univ;
    property SelCount      : Integer          read GetSelCount;

    property UniType: String read FUniType write FUniType;

    property Connection    : TCustomConnection read GetConnection2 write SetConnection;

    procedure SetBsnId(AID : Variant; NeedRefr : boolean);
    function initialize(AConnection : TCustomConnection;
                        AUniverseID : integer; id_user : integer;
                        Aid_business: integer;
                        ATaskMaster : TTaskMasterClass): boolean;
  end;

var
  UFTree: TUFTree;


implementation

uses UniverseFilterUnit2, uInputBoxDate, uInputBoxDigit, uInputBoxObj,
  uInputBoxStr, foMyFunc;

{$R *.DFM}

function CustomSortProc(Node1, Node2: TTreeNode; Data: Integer): Integer; stdcall;
begin
  if (TObject(Node1.Data) is TNamedClass) and (TObject(Node1.Data) is TNamedClass) then
  begin
  //  if TNamedClass(Node1.Data).xxxLevel <> TNamedClass(Node2.Data).xxxLevel then
  //    Result := TNamedClass(Node1.Data).xxxLevel - TNamedClass(Node2.Data).xxxLevel
  //  else
      Result := AnsiStrIComp(PChar(Node1.Text), PChar(Node2.Text));
//      Result := -AnsiCompareText(TNamedClass(Node1.Data).ObjName, TNamedClass(Node2.Data).ObjName);
  end;
end;


function SaveFilter(ATaskMaster : TTaskMasterClass; id_Bsn : Variant; SelectedFilter : integer; AConnection : TCustomConnection) : boolean;
var
  Node: TTreeNode;
  i : integer;
  PropData : TPropData;
  AFilterData : TFilterData;
begin
  Result := false;
  try
    for i := 0 to ATaskMaster.FilterDataCount - 1 do
    begin
      AFilterData := ATaskMaster.FilterData[i];

      if TDispatchConnection(AConnection).AppServer.FLT_CondAdd(SelectedFilter,
                                                                AFilterData.ObjData.Un_id_Obj,
                                                                AFilterData.ObjData.Un_id_Prop,
                                                                AFilterData.ObjData.Un_id_Rel,
                                                                integer(AFilterData.CondCode),
                                                                AFilterData.Par1,
                                                                AFilterData.Par2) = -1 then
        raise Exception.Create('Ошибка при сохранении фильтра');

    end;
    Result := true;
  except
  end;
end;

procedure TUFTree.ObjViewGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TUFTree.ObjViewGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  with Node do
  begin
    if (TObject(Node.Data) is TObjData) or (TObject(Node.Data) is TPropGrp) then
    begin
      if Expanded then
        ImageIndex := 0
      else
        ImageIndex := 1;
    end
    else
    begin
      if (TObject(Node.Data) is TPropData) then
      begin
//        Node.Text := TPropData(Node.Data).ObjName;
        ImageIndex := 2; 
      end;
    end;
  end;
end;

procedure TUFTree.ObjViewDblClick(Sender: TObject);
begin
//*
end;


procedure TUFTree.SetConnection(const Value: TCustomConnection);
begin     
  FConnection2 := Value;
  WorkDS.RemoteServer := TCustomRemoteServer(Connection);
end;

procedure TUFTree.SetObjDataList(const Value: TList);
var
  i : Integer;
  ObjData   : TObjData;
  Node : TTreeNode;
begin
  ObjView.Items.BeginUpdate;
  try
    ObjView.Items.Clear;
    GetNodeTDList(nil);
  finally
    ObjView.Items.EndUpdate;
  end;
end;

procedure TUFTree.GetNodeTDListCover(Node: TTreeNode);
begin
  // Обертка для заполнения дерева
  // Отключает отрисовку
  ObjView.Items.BeginUpdate;
  try
    if Node <> nil then
      Node.DeleteChildren
    else
      ObjView.Items.Clear;
    GetNodeTDList(Node);
  finally
    if ObjView.Items.Count > 0 then
      ObjView.Items[0].Expand(False);
    ObjView.Items.EndUpdate;
  end;
end;

procedure TUFTree.GetNodeTDList(Node: TTreeNode);
var
  i, j, k : Integer;
  ObjData  : TObjData;
  N, NGrp: TTreeNode;
  ACLID : Variant;
  Cnt: Integer;
  S : String;
begin
  { Вариант с рекурсией  }
  try
    if Node = nil then
    begin
      ACLID := Null;
      ObjView.Items.Clear;
    end
    else
    begin
      ACLID := TObjData(Node.Data).Un_ID_Rel;
      Node.DeleteChildren;
    end;
    Cnt := FTaskMaster.ObjDataCount;
    for i := 0 to Cnt - 1 do
    begin
      ObjData := FTaskMaster.ObjData[i];
      if (ObjData.Un_id_RelParent = ACLID) then
      begin
          N := ObjView.Items.AddChildObject(Node, ObjData.ObjName, ObjData);
          GetNodeTDList(N);
        for j := 0 to ObjData.FPropList.Count - 1 do
        begin
          if (TPropData(ObjData.FPropList[j]).FPropGrp <> nil) then
          begin
            S := TPropData(ObjData.FPropList[j]).FPropGrp.ObjName;
            NGrp := nil;
            for k := 0 to N.Count - 1 do
            begin
              if N.Item[k].Text = S then
              begin
                NGrp := N.Item[k];
                Break;
              end;
            end;
            if NGrp = nil then
              NGrp := ObjView.Items.AddChildObject(N, S, TPropData(ObjData.FPropList[j]).FPropGrp);
          end
          else
          begin
            NGrp := N;
          end;
          if (not TPropData(ObjData.FPropList[j]).NeedAlias or TPropData(ObjData.FPropList[j]).ParamSeted) then
            ObjView.Items.AddChildObject(NGrp, TPropData(ObjData.FPropList[j]).ObjName, ObjData.FPropList[j]);
        end;
      end;
    end;
  finally
    ObjView.CustomSort(@CustomSortProc, 0);
//    if Node <> nil then
//      TObjData(Node.Data).HasDetail := Node.HasChildren;
  end;  
end;

procedure TUFTree.ObjViewExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  if (Node.HasChildren) and (Node.Count = 0) and (TObject(Node.Data) is TObjData) then
  begin
    GetNodeTDList(Node);
  end;
end;

procedure TUFTree._ClearList(AList : TList);
var Obj : TObject;
begin
  while AList.Count > 0 do
  begin
    Obj := TObject(AList[AList.Count - 1]);
    AList.Delete(AList.Count - 1);
    Obj.Free;                    
  end;
end;


procedure TUFTree.ObjViewDeletion(Sender: TObject; Node: TTreeNode);
begin
 { if (Node.Data <> nil) then
  begin
    try
      TObject(Node.Data).Free;
    except
      on E : Exception do
        raise Exception.Create('Ошибка при удалении объекта из Node.Data ' + E.Message);
    end;
    Node.Data := nil;
  end; }
end;

function TUFTree.GetSelectedNode: TTreeNode;
begin
  Result := FSelectedNode;
end;

procedure TUFTree.SetSelectedNode(const Value: TTreeNode);
begin
  if FSelectedNode <> Value then
    FSelectedNode := Value;
end;

function TUFTree.GetSelCount: Integer;
var i: Integer;
begin
  Result := 0;
{  for i := 0 to FTaskMaster.PropDataCount - 1 do
    if FTaskMaster.PropData[i].isSelect then
      Inc(Result);    }
end;

procedure TUFTree.SetTreeDataList(const Value: TList);
begin

end;

procedure TUFTree.SetID_Univ(const Value: Integer);
begin
  FID_Univ := Value;
  GetNodeTDListCover(nil);
end;

procedure TUFTree.ObjViewCustomDraw(Sender: TCustomTreeView;
  const ARect: TRect; var DefaultDraw: Boolean);
begin
  ObjView.Canvas.FillRect(ARect);
end;

function TUFTree.GetConnection2: TCustomConnection;
begin
  Result := fConnection2;
end;

constructor TUFTree.Create(AOwner: TCOmponent);
begin
  inherited;
end;

destructor TUFTree.Destroy;
begin
  FTaskMaster.Free;
  inherited;
end;

procedure TUFTree.SetBsnId(AID: Variant; NeedRefr : boolean);
begin
  if ((FBsnId <> AID) and (AID <> Null)) or NeedRefr then
  begin
    FBsnId := AID;
    SetBsnId_UN(AID, WorkDS, FTaskMaster);
    GetNodeTDListCover(nil);
  end;
end;

function TUFTree.initialize(AConnection : TCustomConnection;
                        AUniverseID : integer; id_user : integer;
                        Aid_business: integer;
                        ATaskMaster : TTaskMasterClass): boolean;
begin
  Connection := AConnection;
  FTaskMaster := TTaskMasterClass.Create(Connection);
  Fid_user := id_user;
  FBsnId := Aid_business;

  GetUniverseListID(WorkDS, AUniverseID, UniType, FTaskMaster);

  SetBsnId(FBsnId, true);
  ID_Univ := AUniverseID;
end;

procedure TUFTree.aOkExecute(Sender: TObject);
begin
  if Owner is TForm then
    TForm(Owner).ModalResult := mrOk;
end;

procedure TUFTree.AddBtn2Click(Sender: TObject);
begin
//*
end;

end.
