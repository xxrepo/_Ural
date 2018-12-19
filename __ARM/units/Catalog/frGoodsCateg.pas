unit frGoodsCateg;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, Menus, Db, DBClient, ImgList, ComCtrls, ToolWin;

type
  TDBObjectParented = class
  private
    FName: String;
    FIDParent: Variant;
    FID: Variant;
    procedure SetID(const Value: Variant);
    procedure SetIDParent(const Value: Variant);
  public
    constructor Create; 
    property IDParent : Variant read FIDParent write SetIDParent;
    property ID : Variant read FID write SetID;
    property Name : String read FName write FName;
  end;

  TfGoodsCateg = class(TFrame)
    ImageList1: TImageList;
    cdsServiseTypeGetList: TClientDataSet;
    cdsServiseTypeGetListid_ServiceType: TAutoIncField;
    cdsServiseTypeGetListid_ServiceTypeParent: TIntegerField;
    cdsServiseTypeGetListName: TStringField;
    cdsServiseTypeGetListShortName: TStringField;
    cdsServiseTypeGetListLastUpdated: TBytesField;
    cdsServiseTypeGetListDeleted: TBooleanField;
    cdsServiseTypeGetListHide: TBooleanField;
    cdsServiseTypeGetListatKP: TBooleanField;
    cdsServiseTypeGetListatSite: TBooleanField;
    pmServiceType: TPopupMenu;
    N3: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    ActionList1: TActionList;
    aNew: TAction;
    aNewChild: TAction;
    aProp: TAction;
    aDel: TAction;
    TreeView1: TTreeView;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    aRefreshe: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure aNewExecute(Sender: TObject);
    procedure aNewChildExecute(Sender: TObject);
    procedure aPropExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure aRefresheExecute(Sender: TObject);
  private
    procedure GetServiceTypeTree(ParentID: Variant; ATree: TTreeView);
    { Private declarations }
  public
    procedure Initialize(AID : Variant; id_Bsn : Variant;
                   AReadOnly : boolean = false; AShowToolBar : boolean = true);
  end;

implementation

uses uDM, uFormApi_CA;

{$R *.DFM}

procedure TfGoodsCateg.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  aNewChild.Enabled := TObject(Node.Data) is TDBObjectParented;
  aProp.Enabled := TObject(Node.Data) is TDBObjectParented;
  aDel.Enabled := TObject(Node.Data) is TDBObjectParented;
end;

procedure TfGoodsCateg.aNewExecute(Sender: TObject);
begin
//*
end;

procedure TfGoodsCateg.aNewChildExecute(Sender: TObject);
begin
//*
end;

procedure TfGoodsCateg.aPropExecute(Sender: TObject);
begin
//*
end;

procedure TfGoodsCateg.aDelExecute(Sender: TObject);
begin
//*
end;

procedure TfGoodsCateg.TreeView1GetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
  if Node.Expanded then
    Node.ImageIndex := 5
  else
    Node.ImageIndex := 4;
end;

procedure TfGoodsCateg.TreeView1GetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

{ TDBObjectParented }

constructor TDBObjectParented.Create;
begin
  inherited;
  FID := Null;
  FIDParent := Null;
end;

procedure TDBObjectParented.SetID(const Value: Variant);
begin
  FID := Value;
end;

procedure TDBObjectParented.SetIDParent(const Value: Variant);
begin
  FIDParent := Value;
end;

procedure TfGoodsCateg.aRefresheExecute(Sender: TObject);
begin
//*
end;

procedure TfGoodsCateg.Initialize(AID : Variant; id_Bsn : Variant;
                   AReadOnly : boolean; AShowToolBar : boolean);
var i : integer;
begin
  TreeView1.Items.BeginUpdate;
  Screen.Cursor := crSQLWait;
  try
    TreeView1.Items.Clear;
    GetServiceTypeTree(Null, TreeView1);
  finally
    TreeView1.Items.EndUpdate;
    Screen.Cursor := crDefault;
 //   CheckMenus;
  end;
end;

procedure TfGoodsCateg.GetServiceTypeTree(ParentID : Variant; ATree : TTreeView);
  procedure GetServiceTypeTree2(ParentID : Variant; ATree : TTreeView; ATreeNode : TTreeNode; AList : TList);
  var  N : TTreeNode;
       i : integer;
  begin
    for i := 0 to AList.Count - 1 do
    begin
      if TDBObjectParented(AList[i]).IDParent = ParentID then
      begin
         N := ATree.Items.AddChildObject(ATreeNode, TDBObjectParented(AList[i]).Name, AList[i]);
         GetServiceTypeTree2(TDBObjectParented(AList[i]).ID, ATree, N, AList);
      end;
    end;
  end;
var i, j : integer;
    STO : TDBObjectParented;
    OldPos : integer;
    List : TList;
begin
  ATree.Items.Clear;
  List := TList.Create;
  with cdsServiseTypeGetList do
  begin
    Params.ParamByName('@ID_P').Value := -1;
    Params.ParamByName('@Hide').Value := 0;
    Open;
    try
      ATree.Items.BeginUpdate;
      First;
      while not Eof do
      begin
        STO := TDBObjectParented.Create;
        STO.ID := cdsServiseTypeGetListid_ServiceType.AsInteger;
        STO.IDParent := cdsServiseTypeGetList.FieldByName('id_ServiceTypeParent').Value;
        STO.Name := cdsServiseTypeGetListName.AsString;
        List.Add(STO);
        Next;
      end;
      GetServiceTypeTree2(Null, ATree, nil, List);
    finally
      ATree.Items.EndUpdate;
      List.Free;
      Close;
    end;
  end;
end;

end.
