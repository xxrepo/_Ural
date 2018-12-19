unit uDTSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit,{$IFDEF VER150} Variants,{$ENDIF} CurrEdit,
  frGrp, comctrls;

type
  TSetOfChar = set of char;

  TDTSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fGrp1: TfGrp;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure fGrp1OrgTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure fGrp1Button3Click(Sender: TObject);
    procedure fGrp1OrgTreeViewDblClick(Sender: TObject);
  private
    FSelType : boolean;
  public
  end;

var
  DTSelector: TDTSelector;
function ShowDTSelector(Atype: integer; var id_DocType : integer; var AName : String; ASelType : boolean = false): boolean;

implementation

uses foMyFunc, uDM;

{$R *.DFM}
function ShowDTSelector(Atype: integer; var id_DocType : integer; var AName : String; ASelType : boolean): boolean;
var F : TDTSelector;
begin
  Result := false;
  F := TDTSelector.Create(nil);
  try
    F.fGrp1.ToolBar1 := nil;
  //  F.fGrp1.OrgTreeView.PopupMenu := nil;
    F.fGrp1.Initialize(Atype, id_DocType, ASelType);
    F.FSelType := ASelType;
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      id_DocType := TNodeObj(F.fGrp1.OrgTreeView.Selected.Data).ID;
      AName := TNodeObj(F.fGrp1.OrgTreeView.Selected.Data).Name;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TDTSelector.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TDTSelector.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TDTSelector.fGrp1OrgTreeViewChange(Sender: TObject;
  Node: TTreeNode);
var    Obj : TNodeObj;
begin
  fGrp1.OrgTreeViewChange(Sender, Node);
  if fGrp1.OrgTreeView.Selected = nil then
    btnOk.Enabled := false
  else
  begin
    Obj := TNodeObj(fGrp1.OrgTreeView.Selected.Data);
    if FSelType then
      btnOk.Enabled := Obj.isGrp
    else
      btnOk.Enabled := not Obj.isGrp;
  end;
end;

procedure TDTSelector.fGrp1Button3Click(Sender: TObject);
begin
  fGrp1.Button3Click(Sender);

end;

procedure TDTSelector.fGrp1OrgTreeViewDblClick(Sender: TObject);
begin
  if btnOk.Enabled then btnOk.Click;
end;

end.

