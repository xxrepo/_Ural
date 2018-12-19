unit frTreeChItem;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

type
  TfTreeChItem = class(TFrame)
    tvChild: TTreeView;
    procedure tvChildDblClick(Sender: TObject);
    procedure tvChildGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure tvChildGetImageIndex(Sender: TObject; Node: TTreeNode);
  private
    FTreeView : TTreeView;
    FOnGetImageIndex : TTVExpandedEvent;
    function GetItemName: Variant;
    function GetItemID: Variant;
    function GetItemIDByIndex(index: integer): Variant;
  public
    procedure SetBsnNode(Node: TTreeNode);
    property ItemName : Variant read GetItemName;
    property ItemID : Variant read GetItemID;
    property ItemIDByIndex[index : integer] : Variant read GetItemIDByIndex;
  end;

implementation

uses frWareCtgTree;

{$R *.DFM}

procedure TfTreeChItem.SetBsnNode(Node: TTreeNode);
var i : integer;
    N : TTreeNode;
begin
  with tvChild do
  begin
     Items.BeginUpdate;
    Items.Clear;
    try
      if Node <> nil then
      begin
        FTreeView := TTreeView(Node.TreeView);
        tvChild.OnGetImageIndex := FTreeView.OnGetImageIndex;
        tvChild.OnGetSelectedIndex := FTreeView.OnGetSelectedIndex;
        tvChild.OnDeletion := nil;
        tvChild.OnCustomDraw := FTreeView.OnCustomDraw;
        tvChild.OnCustomDrawItem := FTreeView.OnCustomDrawItem;
        tvChild.Images := FTreeView.Images;
        for i := 0 to Node.Count - 1 do
        begin
          N := Items.AddChildObject(nil, Node.Item[i].Text, Node.Item[i].Data);
          if not Assigned(tvChild.OnGetImageIndex) then
          begin
            N.ImageIndex := Node.Item[i].ImageIndex;
            N.SelectedIndex := N.ImageIndex;
          end;  
        end;
      end;
    finally
      Items.EndUpdate;
    end;
  end;
end;

procedure TfTreeChItem.tvChildDblClick(Sender: TObject);
begin
  if tvChild.Selected.Index < FTreeView.Selected.Count then
  begin
    FTreeView.Selected.Item[tvChild.Selected.Index].Selected := true;
    FTreeView.OnChange(FTreeView, FTreeView.Selected)
  end
  else
    ;
//  TreeView1.OnChange(TreeView1, TreeView1.Selected.Item[tvChild.Selected.Index]);
 // FTreeView.Selected.Item[tvChild.Selected.Index].Selected := true;
//  if tvChild.Selected <> nil then
//    TTreeNode(tvChild.Selected.Data).Selected := true
//  else
  //  FTreeView.Selected := nil;
end;

procedure TfTreeChItem.tvChildGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
 //Node.SelectedIndex := Node.ImageIndex;
end;

procedure TfTreeChItem.tvChildGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
 { if Assigned(FTreeView.OnGetImageIndex) then
  begin
    FTreeView.OnGetImageIndex(FTreeView, TTreeNode(Node.Data));
    Node.ImageIndex := TTreeNode(Node.Data).ImageIndex;
  end;  }
end;

function TfTreeChItem.GetItemName: Variant;
begin
  if (tvChild.Selected <> nil) then
    Result := tvChild.Selected.Text
  else
    Result := '';
end;

function TfTreeChItem.GetItemID: Variant;
begin
  if (tvChild.Selected <> nil) and (tvChild.Selected.Data <> nil) and (TObject(tvChild.Selected.Data) is TDBObjectParented) then
    Result := TDBObjectParented(tvChild.Selected.Data).id
  else
    Result := '';
end;

function TfTreeChItem.GetItemIDByIndex(index: integer): Variant;
begin
  if (tvChild.Items[index] <> nil) and (tvChild.Items[index].Data <> nil) and (TObject(tvChild.Items[index].Data) is TDBObjectParented) then
    Result := TDBObjectParented(tvChild.Items[index].Data).id
  else
    Result := '';
end;

end.
