unit uCRepCtgSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, frCRepTree, comctrls, Buttons, Db, DBClient;

type
  TCRepCtgSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fCRepCtgTree1: TfCRepTree;
    btnDel: TSpeedButton;
    procedure fWareCtgTree1TreeView1Change(Sender: TObject;
      Node: TTreeNode);
    procedure btnDelClick(Sender: TObject);
    procedure fWareCtgTree1TreeView1CustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    FNeedNoWares : boolean;
    FNeedNoCtg : boolean;

    FOld_id_Ctg, FBlockCtg : Variant;

    function Getid_Rep: integer;
    function Getid_Ctg: Variant;
  public
    procedure Initialize(id_Ctg : Variant; id_Rep : integer;
                               ABlockCtg : Variant);
    property id_Ctg : Variant read Getid_Ctg;
    property id_Rep : integer read Getid_Rep;
  end;

var
  CRepCtgSelector: TCRepCtgSelector;

  function ShowWareCtgSelector(id_Rep : integer; var id_Ctg : Variant; var AName : String;
                               ABlockCtg : Variant) : boolean;

implementation

uses uDM;

function ShowWareCtgSelector(id_Rep : integer; var id_Ctg : Variant; var AName : String;
                               ABlockCtg : Variant) : boolean;
var F : TCRepCtgSelector;
begin
  Result := false;
  F := TCRepCtgSelector.Create(nil);
  try
    F.Initialize(id_Ctg, id_Rep, ABlockCtg);
    F.ShowModal;
    if (F.ModalResult = mrOk) then
    begin
      id_Ctg := F.id_Ctg;
      AName := F.fCRepCtgTree1.WareCatName;
      Result := true;
    end
    else
    if (F.ModalResult = mrNo) then
    begin
      id_Ctg := Null;
      AName := '';
      Result := true;
    end
  finally
    F.Free;
  end;
end;

{$R *.DFM}

function TCRepCtgSelector.Getid_Rep: integer;
begin
  Result := fCRepCtgTree1.id_Rep;
end;

function TCRepCtgSelector.Getid_Ctg: Variant;
begin
  Result := fCRepCtgTree1.WareCatID;
end;

procedure TCRepCtgSelector.Initialize(id_Ctg : Variant; id_Rep : integer;
                               ABlockCtg : Variant);
var H : integer;
begin
  FOld_id_Ctg := id_Ctg;
  FBlockCtg := ABlockCtg;
  fCRepCtgTree1.SetDisabledCtg(FBlockCtg);
  fCRepCtgTree1.Initialize(id_Ctg, id_Rep);
end;

procedure TCRepCtgSelector.fWareCtgTree1TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
  fCRepCtgTree1.TreeView1Change(Sender, Node);
  if (Node <> nil) and (TObject(Node.Data) is TDBObjectParented) then
  begin
    if (FNeedNoCtg and (TDBObjectParented(Node.Data).CldCnt > 0)) OR
       (TDBObjectParented(Node.Data).ID = FOld_id_Ctg) OR
       (TDBObjectParented(Node.Data).ID < 0) OR
       (FNeedNoWares and (TDBObjectParented(Node.Data).Cnt > 0)) then
      btnOk.Enabled := false
    else
      btnOk.Enabled := not TDBObjectParented(Node.Data).Blocked;
  end
  else
    btnOk.Enabled := false;
end;

procedure TCRepCtgSelector.btnDelClick(Sender: TObject);
begin
  ModalResult := mrNo;
end;

procedure TCRepCtgSelector.fWareCtgTree1TreeView1CustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  fCRepCtgTree1.TreeView1CustomDrawItem(Sender, Node, State,
  DefaultDraw);
  if (Node <> nil) and (TObject(Node.Data) is TDBObjectParented) then
  begin
    if (FNeedNoCtg and (TDBObjectParented(Node.Data).CldCnt > 0)) OR
       (TDBObjectParented(Node.Data).ID = FOld_id_Ctg) OR
       (TDBObjectParented(Node.Data).ID < 0) OR
       (FNeedNoWares and (TDBObjectParented(Node.Data).Cnt > 0)) then
      Sender.Canvas.Font.Color := clGray
    else
      if TDBObjectParented(Node.Data).Blocked then
        Sender.Canvas.Font.Color := clGray;;
  end
  else
    Sender.Canvas.Font.Color := clGray;

end;

end.
 