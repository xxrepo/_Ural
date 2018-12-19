unit uCAGroupSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frCAGroupList, comctrls;

type
  TCAGroupSelect = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fCAGroupList1: TfCAGroupList;
    procedure fCAGroupList1OrgTreeViewChange(Sender: TObject;
      Node: TTreeNode);
    procedure fCAGroupList1OrgTreeViewDblClick(Sender: TObject);
  private
    function GetID: integer;
    function getGrpName: String;
    { Private declarations }
  public
    property ID : integer read GetID;
    property GrpName : String read getGrpName;
    procedure Initialize(AID : Variant; id_Bsn : Variant; AReadOnly : boolean = false; AShowToolBar : boolean = true;
                       AAll : boolean = true;
                       ANoGroup : boolean = true;
                       ANoCA : boolean = true  );
  end;

var
  CAGroupSelect: TCAGroupSelect;

implementation

{$R *.DFM}

{ TCAGroupSelect }

function TCAGroupSelect.getGrpName: String;
begin
  Result := fCAGroupList1.GrpName;
end;

function TCAGroupSelect.GetID: integer;
begin
  Result := fCAGroupList1.ID;
end;

procedure TCAGroupSelect.Initialize(AID, id_Bsn: Variant; AReadOnly,
  AShowToolBar: boolean;
  AAll : boolean;
  ANoGroup : boolean;
  ANoCA : boolean);
begin
   fCAGroupList1.Initialize(AID, id_Bsn, Null, AReadOnly, AShowToolBar, AAll, ANoGroup, ANoCA);
end;

procedure TCAGroupSelect.fCAGroupList1OrgTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  fCAGroupList1.OrgTreeViewChange(Sender, Node);
  btnOk.Enabled := Node <> nil;
end;

procedure TCAGroupSelect.fCAGroupList1OrgTreeViewDblClick(Sender: TObject);
begin
  if btnOk.Enabled then
    btnOk.Click;
end;

end.
