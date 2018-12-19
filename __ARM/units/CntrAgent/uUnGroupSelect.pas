unit uUnGroupSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frCAGroupList, comctrls, frMNGroup, frWHGroup,
  frAccGroup,
  foMyFunc, frReprGroup;

type
  TUnGroupSelect = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
  private
    FEObjType : TEObjType;
    fAccGroup1: TfAccGroup;
    fWHGroup1: TfWHGroup;
    fMNGroup1: TfMNGroup;
    fReprGroup1: TfReprGroup;
    FOnChange: TTVChangedEvent;

    function GetID: integer;
    function getGrpName: String;
    procedure fCAGroupList1OrgTreeViewChange(Sender: TObject;
      Node: TTreeNode);
  public
    property ID : integer read GetID;
    property GrpName : String read getGrpName;
    procedure Initialize(AEObjType : TEObjType; AID : Variant; id_Bsn : Variant; AReadOnly : boolean = false; AShowToolBar : boolean = true;
                       AAll : boolean = true;
                       ANoGroup : boolean = true;
                       ANoCA : boolean = true;
                       DisabledCtg : integer = -1);
  end;

var
  UnGroupSelect: TUnGroupSelect;

implementation

{$R *.DFM}

{ TCAGroupSelect }

function TUnGroupSelect.getGrpName: String;
begin
  case FEObjType of
    eotFinGroup : Result := fAccGroup1.GrpName;
    eotWHGroup : Result := fWHGroup1.GrpName;
    eotManufGroup : Result := fMNGroup1.GrpName;
    eotReprGroup : Result := fReprGroup1.GrpName;
  end;
end;

function TUnGroupSelect.GetID: integer;
begin
  case FEObjType of
    eotFinGroup : Result := fAccGroup1.ID;
    eotWHGroup : Result := fWHGroup1.ID;
    eotManufGroup : Result := fMNGroup1.ID;
    eotReprGroup : Result := fReprGroup1.ID;
  end;
end;

procedure TUnGroupSelect.Initialize(AEObjType : TEObjType; AID, id_Bsn: Variant; AReadOnly, AShowToolBar: boolean;
  AAll : boolean;
  ANoGroup : boolean;
  ANoCA : boolean;
  DisabledCtg : integer);
begin
   FEObjType := AEObjType;

  case FEObjType of
    eotFinGroup :
    begin
      fAccGroup1 := TfAccGroup.Create(Self);
      fAccGroup1.Parent := Self;
      fAccGroup1.Align := alClient;
      FOnChange := fAccGroup1.OrgTreeView.OnChange;
      fAccGroup1.OrgTreeView.OnChange := fCAGroupList1OrgTreeViewChange;
      fAccGroup1.Initialize(nil, AID, id_Bsn, AReadOnly, AShowToolBar, AAll, ANoGroup, -1, DisabledCtg);
    end;
    eotWHGroup :
    begin
      fWHGroup1 := TfWHGroup.Create(Self);
      fWHGroup1.Parent := Self;
      fWHGroup1.Align := alClient;
      FOnChange := fWHGroup1.OrgTreeView.OnChange;
      fWHGroup1.OrgTreeView.OnChange := fCAGroupList1OrgTreeViewChange;
      fWHGroup1.Initialize(nil, AID, id_Bsn, AReadOnly, AShowToolBar, AAll, ANoGroup);
    end;
    eotManufGroup :
    begin
      fMNGroup1 := TfMNGroup.Create(Self);
      fMNGroup1.Parent := Self;
      fMNGroup1.Align := alClient;
      FOnChange := fMNGroup1.OrgTreeView.OnChange;
      fMNGroup1.OrgTreeView.OnChange := fCAGroupList1OrgTreeViewChange;
      fMNGroup1.Initialize(nil, AID, id_Bsn, AReadOnly, AShowToolBar, AAll, ANoGroup);
    end;
    eotReprGroup :
    begin
      fReprGroup1 := TfReprGroup.Create(Self);
      fReprGroup1.Parent := Self;
      fReprGroup1.Align := alClient;
      FOnChange := fReprGroup1.OrgTreeView.OnChange;
      fReprGroup1.OrgTreeView.OnChange := fCAGroupList1OrgTreeViewChange;
      fReprGroup1.Initialize(nil, AID, id_Bsn, AReadOnly, AShowToolBar, AAll, ANoGroup);
    end;
  end;

end;

procedure TUnGroupSelect.fCAGroupList1OrgTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  if Assigned(FOnChange) then
    FOnChange(Sender, Node);
  btnOk.Enabled := (Node <> nil);
  if FEObjType = eotFinGroup then
    btnOk.Enabled := not fAccGroup1.Blocked;

end;

end.
