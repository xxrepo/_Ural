unit uWareCtgSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, frWareCtgTree, comctrls, Buttons;

type
  TWareCtgSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fWareCtgTree1: TfWareCtgTree;
    btnDel: TSpeedButton;
    procedure fWareCtgTree1TreeView1Change(Sender: TObject;
      Node: TTreeNode);
    procedure btnDelClick(Sender: TObject);
    procedure fWareCtgTree1TreeView1CustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure fWareCtgTree1TreeView1DblClick(Sender: TObject);
  private
    FNeedNoWares : boolean;
    FNeedNoCtg : boolean;

    FOld_id_Ctg, FBlockCtg : Variant;

    function Getid_Bsn: integer;
    function Getid_Ctg: Variant;
  public
    procedure Initialize(id_Ctg : Variant; id_Bsn : integer;
                               ANeedNoWares : boolean; ANeedNoCtg : boolean;
                               ABlockCtg : Variant);
    property id_Ctg : Variant read Getid_Ctg;
    property id_Bsn : integer read Getid_Bsn;
  end;

var
  WareCtgSelector: TWareCtgSelector;

  function ShowWareCtgSelector(id_Bsn : integer; var id_Ctg : Variant; var AName : String;
                               ANeedNoWares : boolean; ANeedNoCtg : boolean;
                               ABlockCtg : Variant;
                               ADblClk : boolean = false) : boolean;

implementation

uses uDM;

function ShowWareCtgSelector(id_Bsn : integer; var id_Ctg : Variant; var AName : String;
                               ANeedNoWares : boolean; ANeedNoCtg : boolean;
                               ABlockCtg : Variant;
                               ADblClk : boolean) : boolean;
var F : TWareCtgSelector;
begin
  Result := false;
  F := TWareCtgSelector.Create(nil);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    F.Initialize(id_Ctg, id_Bsn, ANeedNoWares, ANeedNoCtg, ABlockCtg);
    if not ADblClk then
      F.fWareCtgTree1.TreeView1.OnDblClick := nil;
    F.ShowModal;
    if (F.ModalResult = mrOk) then
    begin
      id_Ctg := F.id_Ctg;
      AName := F.fWareCtgTree1.WareCatName;
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

function TWareCtgSelector.Getid_Bsn: integer;
begin
  Result := fWareCtgTree1.Bsn_ID;
end;

function TWareCtgSelector.Getid_Ctg: Variant;
begin
  Result := fWareCtgTree1.WareCatID;
end;

procedure TWareCtgSelector.Initialize(id_Ctg : Variant; id_Bsn : integer;
                               ANeedNoWares : boolean; ANeedNoCtg : boolean;
                               ABlockCtg : Variant);
var H : integer;
begin
  FOld_id_Ctg := id_Ctg;
  FNeedNoWares := ANeedNoWares;
  FNeedNoCtg := ANeedNoCtg;
  FBlockCtg := ABlockCtg;
  fWareCtgTree1.SetDisabledCtg(FBlockCtg);
  fWareCtgTree1.Initialize(id_Ctg, id_Bsn, false);
end;

procedure TWareCtgSelector.fWareCtgTree1TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
  fWareCtgTree1.TreeView1Change(Sender, Node);
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

procedure TWareCtgSelector.btnDelClick(Sender: TObject);
begin
  ModalResult := mrNo;
end;

procedure TWareCtgSelector.fWareCtgTree1TreeView1CustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  fWareCtgTree1.TreeView1CustomDrawItem(Sender, Node, State,
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

procedure TWareCtgSelector.fWareCtgTree1TreeView1DblClick(Sender: TObject);
begin
  if btnOk.Enabled then
    btnOk.Click;

end;

end.
 