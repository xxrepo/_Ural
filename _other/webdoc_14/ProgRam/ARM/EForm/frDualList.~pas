unit frDualList;

{$I RX.INC}
{$L-,S-}

interface

uses SysUtils, {$IFDEF WIN32} Windows, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  Messages, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, RXCtrls,
  ExtCtrls, Buttons, AdvSplitter, Menus, AdvMenus;

type
  TfDualList = class(TFrame)
    SrcPanel: TPanel;
    Panel2: TPanel;
    SrcLabel: TLabel;
    SrcList: TTextListBox;
    DestPanel: TPanel;
    Panel4: TPanel;
    DstLabel: TLabel;
    DstList: TTextListBox;
    BtnPanel: TPanel;
    IncBtn: TButton;
    IncAllBtn: TButton;
    ExclBtn: TButton;
    ExclAllBtn: TButton;
    Splitter1: TAdvSplitter;
    procedure IncBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExclBtnClick(Sender: TObject);
    procedure ExclAllBtnClick(Sender: TObject);
    procedure SrcListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DstListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure SrcListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DstListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SrcListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DstListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HelpBtnClick(Sender: TObject);
    procedure ListClick(Sender: TObject);
    procedure sbtDownClick(Sender: TObject);
    procedure sbtTopClick(Sender: TObject);
  private
    FSelCount: integer;
    FSelCh: TNotifyEvent;
    function GetSelCount: integer;
    function GetSelID(index: integer): integer;

    procedure DoSelCh;
    function GetNotSelID(index: integer): integer;
    function GetNotSelCount: integer;

    procedure CheckBTN;
  public
    procedure Initialize(AList1Name, AList2Name : String; ASelCh : TNotifyEvent);
    procedure TotalCrear;
    procedure SetButtons;
    procedure AddItems(ID : integer; AName : String);
    procedure AddSelectedItems(ID: integer; AName: String);

    procedure ViewMode;

    property SelCount : integer read GetSelCount;
    property SelID[index : integer] : integer read GetSelID;
    property NotSelCount : integer read GetNotSelCount;
    property NotSelID[index : integer] : integer read GetNotSelID;
end;

implementation

uses Consts, VCLUtils, BoxProcs;

{$R *.DFM}

{ TDualListForm }

procedure TfDualList.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := (SrcList.Items.Count = 0);
  DstEmpty := (DstList.Items.Count = 0);
  IncBtn.Enabled := not SrcEmpty and (SrcList.SelCount > 0);
  IncAllBtn.Enabled := not SrcEmpty;
  ExclBtn.Enabled := not DstEmpty and (DstList.SelCount > 0);
  ExclAllBtn.Enabled := not DstEmpty;
  CheckBTN;
end;

 

 

procedure TfDualList.IncBtnClick(Sender: TObject);
begin
  BoxMoveSelectedItems(SrcList, DstList);
  DoSelCh;
  SetButtons;
end;

procedure TfDualList.IncAllBtnClick(Sender: TObject);
begin
  BoxMoveAllItems(SrcList, DstList);
  DoSelCh;
  SetButtons;
end;

procedure TfDualList.ExclBtnClick(Sender: TObject);
begin
  BoxMoveSelectedItems(DstList, SrcList);
  DoSelCh;
  SetButtons;
end;

procedure TfDualList.ExclAllBtnClick(Sender: TObject);
begin
  BoxMoveAllItems(DstList, SrcList);
  DoSelCh;
  SetButtons;
end;

procedure TfDualList.SrcListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  BoxDragOver(SrcList, Source, X, Y, State, Accept, SrcList.Sorted);
  if State = dsDragLeave then
    (Source as TTextListBox).DragCursor := crDrag;
  if (State = dsDragEnter) and ((Source as TTextListBox).SelCount > 1) then
    (Source as TTextListBox).DragCursor := crMultiDrag;
end;

procedure TfDualList.DstListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  BoxDragOver(DstList, Source, X, Y, State, Accept, DstList.Sorted);
  if State = dsDragLeave then
    (Source as TTextListBox).DragCursor := crDrag;
  if (State = dsDragEnter) and ((Source as TTextListBox).SelCount > 1) then
    (Source as TTextListBox).DragCursor := crMultiDrag;
end;

procedure TfDualList.SrcListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
{  if Source = DstList then ExclBtnClick(SrcList)
  else if Source = SrcList then begin
    BoxMoveFocusedItem(SrcList, SrcList.ItemAtPos(Point(X, Y), True));
  end;  }
end;

procedure TfDualList.DstListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
 { if Source = SrcList then IncBtnClick(DstList)
  else if Source = DstList then begin
    BoxMoveFocusedItem(DstList, DstList.ItemAtPos(Point(X, Y), True));
  end; }
end;

procedure TfDualList.SrcListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Incr: Integer;
begin
  if not SrcList.Sorted then begin
    if (ssCtrl in Shift) and ((Key = VK_DOWN) or (Key = VK_UP)) then begin
      if Key = VK_DOWN then Incr := 1
      else Incr := -1;
      BoxMoveFocusedItem(SrcList, SrcList.ItemIndex + Incr);
      Key := 0;
    end;
  end;
end;

procedure TfDualList.DstListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Incr: Integer;
begin
  if not DstList.Sorted then begin
    if (ssCtrl in Shift) and ((Key = VK_DOWN) or (Key = VK_UP)) then begin
      if Key = VK_DOWN then Incr := 1
      else Incr := -1;
      BoxMoveFocusedItem(DstList, DstList.ItemIndex + Incr);
      Key := 0;
    end;
  end;
end;

procedure TfDualList.HelpBtnClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TfDualList.ListClick(Sender: TObject);
begin
  SetButtons;
end;

procedure TfDualList.ViewMode;
begin
      SrcPanel.Visible := false;
      BtnPanel.Visible := false;
      Splitter1.Visible := false;
      DstList.OnClick := nil;
      DstList.OnDblClick := nil;
      DstList.OnKeyDown := nil;
      DstList.OnDragDrop := nil;
      DstList.OnDragOver := nil;
end;

function TfDualList.GetSelCount: integer;
begin
  Result := DstList.Items.Count;
end;

function TfDualList.GetSelID(index: integer): integer;
begin
  Result := integer(DstList.Items.Objects[index]);

end;


procedure TfDualList.Initialize(AList1Name, AList2Name: String; ASelCh : TNotifyEvent);
begin
  SrcLabel.Caption := AList1Name;
  DstLabel.Caption := AList2Name;

  FSelCh := ASelCh;
end;

procedure TfDualList.TotalCrear;
begin
  SrcList.Clear;
  DstList.Clear;

  SetButtons;
end;

procedure TfDualList.AddItems(ID: integer; AName: String);
begin
  if SrcList.Items.IndexOfObject(Pointer(ID)) = -1 then
    SrcList.Items.AddObject(AName, Pointer(ID));
  SetButtons;
end;

procedure TfDualList.AddSelectedItems(ID: integer; AName: String);
var N : integer;
begin
  N := SrcList.Items.IndexOfObject(Pointer(ID));
  if N >= 0 then
  begin
    SrcList.Items.Delete(N);

  end;
  if DstList.Items.IndexOfObject(Pointer(ID)) = -1 then
    DstList.Items.AddObject(AName, Pointer(ID));

  SetButtons;
end;

procedure TfDualList.DoSelCh;
begin
  if assigned(FSelCh) then FSelCh(Self);
end;

function TfDualList.GetNotSelID(index: integer): integer;
begin
  Result := integer(SrcList.Items.Objects[index]);
end;

function TfDualList.GetNotSelCount: integer;
begin
  Result := SrcList.Items.Count;
end;

procedure TfDualList.sbtDownClick(Sender: TObject);
var Index : integer;
    i : integer;
begin
  DstList.items.BeginUpdate;
  try
    for i := DstList.items.Count - 1 downto 0 do
    begin
      if DstList.Selected[i] and (i < DstList.Items.Count - 1) then
      begin
        DstList.Items.Exchange(i, i + 1);
        DstList.Selected[i + 1] := true;
      end;
    end;
  finally
    CheckBTN;
  DoSelCh;
    DstList.Items.EndUpdate;
  end;
end;

procedure TfDualList.CheckBTN;
begin
 end;


procedure TfDualList.sbtTopClick(Sender: TObject);
var Index : integer;
    i : integer;
begin
  DstList.items.BeginUpdate;
  try
    for i := 0 to DstList.items.Count - 1 do
    begin
      if DstList.Selected[i] and (i > 0) then
      begin
        DstList.Items.Exchange(i, i - 1);
        DstList.Selected[i - 1] := true;
      end;
    end;
  finally
    CheckBTN;
  DoSelCh;
    DstList.Items.EndUpdate;
  end;
end;

end.
