unit uBJTreeSel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frCAGroupList, comctrls, frMNGroup, frWHGroup,
  frAccGroup,
  foMyFunc, frReprGroup, frBJTree, Menus, Buttons, dxCntner, dxTL,
  dxDBCtrl, dxDBTL;

type
  TBJTreeSel = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fBJTree1: TfBJTree;
    btnDel: TSpeedButton;
    procedure btnDelClick(Sender: TObject);
    procedure fBJTree1dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure btnOkClick(Sender: TObject);
  private
    FMode : integer;
    function GetID: Variant;
    function getGrpName: String;
  public
    property ID : Variant read GetID;
    property GrpName : String read getGrpName;
    procedure Initialize(AID : Variant; id_BJ_Obj : integer;
                       id_BlockSelf, id_BlockCh : Variant;
                       AisDeb : Variant; Aid_Bsn: Variant;
                       AMode : integer);
  end;

var
  BJTreeSel: TBJTreeSel;

function ShowBJTreeSel(var AID : Variant; var AName : String; id_BJ_Obj : integer;
                       id_BlockSelf, id_BlockCh : Variant;
                       AisDeb : Variant; Aid_Bsn: Variant;
                       AShowNonCat : boolean = false; AMode : integer = 0) : boolean;

implementation

uses uDM;

{$R *.DFM}

function ShowBJTreeSel(var AID : Variant; var AName : String; id_BJ_Obj : integer;
                       id_BlockSelf, id_BlockCh : Variant;
                       AisDeb : Variant; Aid_Bsn: Variant;
                       AShowNonCat : boolean; AMode : integer) : boolean;
var F : TBJTreeSel;
    AHandle : HWnd;
begin
  Result := false;
  F := TBJTreeSel.Create(Application.MainForm);
  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;
  try
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);
    F.btnDel.Visible := AShowNonCat;
    F.Initialize(AID, id_BJ_Obj, id_BlockSelf, id_BlockCh, AisDeb, Aid_Bsn, AMode);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      if F.fmode <> 0 then
        AID := F.fBJTree1.ID_BJ_Item
      else
        AID := F.ID;
      AName := F.GrpName;
      Result := true;
    end
    else
    if (F.ModalResult = mrNo) then
    begin
      AID := Null;
      AName := '';
      Result := true;
    end
  finally
    F.Free;
  end;
end;


{ TCAGroupSelect }

function TBJTreeSel.getGrpName: String;
begin
  Result := fBJTree1.GrpName;
end;

function TBJTreeSel.GetID: Variant;
begin
  Result := fBJTree1.ID;
end;

procedure TBJTreeSel.Initialize(AID : Variant; id_BJ_Obj : integer;
                       id_BlockSelf, id_BlockCh : Variant;
                       AisDeb : Variant; Aid_Bsn: Variant;
                       AMode : integer);
begin

  fBJTree1.dxDBTreeList1S_Pay.Visible := false;
  fBJTree1.dxDBTreeList1S_Off.Visible := false;
  fBJTree1.dxDBTreeList1Trez.Visible := false;

  fBJTree1.Initialize(AID, AMode, bjtNone, id_BJ_Obj, false, id_BlockSelf, id_BlockCh, AisDeb, Aid_Bsn);
  fBJTree1.ToolButton10.Visible := false;
  fBJTree1.Label32.Visible := false;

  FMode := AMode;
end;

procedure TBJTreeSel.btnDelClick(Sender: TObject);
begin
  ModalResult := mrNo;
end;

procedure TBJTreeSel.fBJTree1dxDBTreeList1ChangeNode(Sender: TObject;
  OldNode, Node: TdxTreeListNode);
begin
  fBJTree1.dxDBTreeList1ChangeNode(Sender, OldNode, Node);

end;

procedure TBJTreeSel.btnOkClick(Sender: TObject);
begin
  if FMode <> 0 then
  begin
    if fBJTree1.BJType <> bjtItem then
    begin
      ModalResult := mrNone;
      MessageBox(Handle, '�� ������� ������', '', MB_OK + MB_ICONERROR);
    end;
  end;
end;

end.
