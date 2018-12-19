unit uBJSort;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ActnList, ComCtrls, ToolWin, Buttons, StdCtrls, ExtCtrls,
  RXCtrls,
  dbgrids, db, DBClient;

type
  TEDP = class
    id_BJ_Item, id_BJ_Tree : Variant;
    Ord_X : integer;
    AName : String;
  end;

  TBJSort = class(TForm)
    ImgList: TImageList;
    ActionList1: TActionList;
    aUpGrp: TAction;
    aDownGrp: TAction;
    ListBox1: TListBox;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cdsLstOrder: TClientDataSet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    aAlf: TAction;
    ToolButton5: TToolButton;
    procedure aUpGrpExecute(Sender: TObject);
    procedure aDownGrpExecute(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure aAlfExecute(Sender: TObject);
  private
    Fid_BJ_Item, Fid_BJ_Tree : integer;
    procedure CheckBTN;
    procedure Init(ADataSet: TDataSet);
    procedure SaveSort;
  public
     procedure Initialize(id_BJ_Item, id_BJ_Tree : integer);
  end;

  function ShowBJSort(id_BJ_Item, id_BJ_Tree : integer) : boolean;

var
  BJSort: TBJSort;

implementation

uses uDM, foMyFunc;

{$R *.DFM}

function ShowBJSort(id_BJ_Item, id_BJ_Tree : integer): boolean;
var F : TBJSort;
begin
  F := TBJSort.Create(nil);
  try
    F.Initialize(id_BJ_Item, id_BJ_Tree);
    F.ShowModal;
    Result := F.ModalResult = mrOk;
    if Result then
    begin
      F.SaveSort;
    end;
  finally
    F.Free;
  end;
end;

procedure TBJSort.aUpGrpExecute(Sender: TObject);
var Index : integer;
    i : integer;
begin
  ListBox1.items.BeginUpdate;
  try
    for i := 0 to ListBox1.items.Count - 1 do
    begin
      if ListBox1.Selected[i] and (i > 0) then
      begin
        ListBox1.Items.Exchange(i, i - 1);
        ListBox1.Selected[i - 1] := true;
      end;
    end;
  finally
    CheckBTN;
    ListBox1.Items.EndUpdate;
  end;end;

procedure TBJSort.aDownGrpExecute(Sender: TObject);
var Index : integer;
    i : integer;
begin
  ListBox1.items.BeginUpdate;
  try
    for i := ListBox1.items.Count - 1 downto 0 do
    begin
      if ListBox1.Selected[i] and (i < ListBox1.Items.Count - 1) then
      begin
        ListBox1.Items.Exchange(i, i + 1);
        ListBox1.Selected[i + 1] := true;
      end;
    end;
  finally
    CheckBTN;
    ListBox1.Items.EndUpdate;
  end;

end;

procedure TBJSort.ListBox1Click(Sender: TObject);
begin
  CheckBTN;
end;

procedure TBJSort.ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
var APoint : TPoint;
    Index, i : integer;
begin
  APoint.x := X;
  APoint.y := Y;
  if (Sender = Source) then
  begin
    Index := ListBox1.ItemAtPos(APoint, true);
  //  if Index = -1 then
  //    Index := ListBox1.Items.Count - 1;
    if Index > -1 then
    begin
      ListBox1.items.BeginUpdate;
      try
        for i := ListBox1.items.Count - 1 downto 0 do
        begin
          if ListBox1.Selected[i] {and (i < ListBox1.Items.Count - 1)} then
          begin
            ListBox1.Items.Move(i, Index);
            ListBox1.Selected[Index] := true;
          end;
        end;
      finally
        CheckBTN;
        ListBox1.Items.EndUpdate;
      end;
    end;
  end;
end;

procedure TBJSort.ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var APoint : TPoint;
    Index : integer;
begin
  APoint.x := X;
  APoint.y := Y;
  Index := ListBox1.ItemAtPos(APoint, true);
//  if Index = -1 then Index := ListBox1.Items.Count - 1;
  Accept := (Index <> ListBox1.ItemIndex) and (ListBox1.SelCount = 1);
end;

procedure TBJSort.ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (ssLeft in Shift) then
    (Sender as TRxCheckListBox).BeginDrag(true);
end;

procedure TBJSort.CheckBTN;
begin
  aDownGrp.Enabled := (ListBox1.items.Count > 0) and (ListBox1.ItemIndex < ListBox1.items.Count - 1);
  aUpGrp.Enabled := (ListBox1.items.Count > 0) and (ListBox1.ItemIndex > 0);
  aAlf.Enabled := (ListBox1.items.Count > 0);
end;

procedure TBJSort.Init(ADataSet: TDataSet);
var NNN, i : integer;
    AEDP : TEDP;
begin
  NNN := -1;
  ListBox1.Items.Clear;
  with ADataSet do
  begin
    First;
    while not Eof do
    begin
      AEDP := TEDP.Create;
      AEDP.id_BJ_Item := FieldByName('id_BJ_Item').AsVariant;
      AEDP.id_BJ_Tree := FieldByName('id_BJ_Tree').AsVariant;
      AEDP.AName := FieldByName('Name').AsString;

      ListBox1.Items.AddObject(AEDP.AName, AEDP);
      if (Fid_BJ_Item = AEDP.id_BJ_Item) or (Fid_BJ_Tree = AEDP.id_BJ_Tree) then
        NNN := ListBox1.Items.Count - 1;
      Next;
    end;
  end;
  ListBox1.ItemIndex := NNN;
end;

procedure TBJSort.SaveSort;
var i : integer;
    AEDP : TEDP;
begin
  BeginTruns(DM.rsCA);
  try
    for i := 0 to ListBox1.Items.Count - 1 do
    begin
      AEDP := TEDP(ListBox1.Items.Objects[i]);
      if AEDP.id_BJ_Item <> Null then
      begin
        DM.rsCA.AppServer.BJ_ItemSetOrdNum(AEDP.id_BJ_Item, i);
      end
      else
      begin
        DM.rsCA.AppServer.BJ_TreeSetOrdNum(AEDP.id_BJ_Tree, i);
      end;
    end;
    CommitTrans(DM.rsCA);
  except
    RollbackTrans(DM.rsCA);
  end;
end;

procedure TBJSort.Initialize(id_BJ_Item, id_BJ_Tree: integer);
begin
  Fid_BJ_Item := id_BJ_Item;
  Fid_BJ_Tree := id_BJ_Tree;
  with cdsLstOrder do
  begin
    Close;
    Params.ParamByName('@id_BJ_Item').Value := Fid_BJ_Item;
    Params.ParamByName('@id_BJ_Tree').Value := Fid_BJ_Tree;
    Open;
    
    Init(cdsLstOrder);
  end;
  ActiveControl := ListBox1;
  CheckBTN;
end;

procedure TBJSort.aAlfExecute(Sender: TObject);
begin
  QuickSortSLWP(ListBox1.Items);
end;

end.
