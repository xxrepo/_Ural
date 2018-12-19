unit uBJProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBGridEh, Buttons, CheckLst, RXCtrls, Registry,
  RXSpin;

type
  TBJProp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    Panel1: TPanel;
    sbtDown: TSpeedButton;
    sbtTop: TSpeedButton;
    LoadArcStng: TButton;
    lbList: TListBox;
    procedure sbtTopClick(Sender: TObject);
    procedure sbtDownClick(Sender: TObject);
    procedure ListBox12DragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure ListBox12DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox12Click(Sender: TObject);
    procedure ListBox12MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox12MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure ListBox12MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
  private
    N : integer;
    FDBGrid1: TDBGridEh;
    
    procedure CheckBTN;
    { Private declarations }
  public
    procedure Initialize(id_BJ_Tree, id_BJ_Item : integer);
  end;

var
  BJProp: TBJProp;

  function ShowBJProp(id_BJ_Tree, id_BJ_Item : integer) : boolean;
implementation

uses foMyFunc, foMyFuncEh, uDM;

{$R *.DFM}

function ShowBJProp(id_BJ_Tree, id_BJ_Item : integer) : boolean;
var F : TBJProp;
    i : integer;
begin
  Result := false;
  F := TBJProp.Create(nil);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    F.Initialize(id_BJ_Tree, id_BJ_Item);

    F.ShowModal;
    Result := F.ModalResult = mrOk;
    if Result then
    begin
      try
        for i := 0 to F.lbList.Items.Count - 1 do
    {    begin
          TColumnEh(F.ListBox1.Items.Objects[i]).Index := i;
          TColumnEh(F.ListBox1.Items.Objects[i]).Visible := F.ListBox1.Checked[i];
        end;  }
      finally

      end;
    end;
  finally
    F.Free;
  end;
end;

{ TArcProp }

procedure TBJProp.Initialize(id_BJ_Tree, id_BJ_Item : integer);
var i : integer;
begin
 { FDBGrid1 := ADBGrid1;
  ListBox1.Items.Clear;
  for i := 0 to ADBGrid1.Columns.Count -1 do
  begin
    ListBox1.Items.AddObject(ADBGrid1.Columns[i].Title.Caption, ADBGrid1.Columns[i]);
    ListBox1.Checked[ListBox1.Items.Count - 1] := ADBGrid1.Columns[i].Visible;
  end;
  N := Round(RxSpinEdit1.Value); }
end;

procedure TBJProp.sbtTopClick(Sender: TObject);
var Index : integer;
    i : integer;
begin
  lbList.items.BeginUpdate;
  try
    for i := 0 to lbList.items.Count - 1 do
    begin
      if lbList.Selected[i] and (i > 0) then
      begin
        lbList.Items.Exchange(i, i - 1);
        lbList.ItemIndex := i - 1;
      end;
    end;
  finally
    CheckBTN;
    lbList.Items.EndUpdate;
  end;
end;

procedure TBJProp.sbtDownClick(Sender: TObject);
var Index : integer;
    i : integer;
begin
  lbList.items.BeginUpdate;
  try
    for i := lbList.items.Count - 1 downto 0 do
    begin
      if lbList.Selected[i] and (i < lbList.Items.Count - 1) then
      begin
        lbList.Items.Exchange(i, i + 1);
        lbList.ItemIndex := i + 1;
      end;
    end;
  finally
    CheckBTN;
    lbList.Items.EndUpdate;
  end;
end;

procedure TBJProp.ListBox12DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var APoint : TPoint;
    Index, i : integer;
begin
  APoint.x := X;
  APoint.y := Y;
  if (Sender = Source) then
  begin
    Index := lbList.ItemAtPos(APoint, true);
    if Index > -1 then
    begin
      lbList.items.BeginUpdate;
      try
        for i := lbList.items.Count - 1 downto 0 do
        begin
          if lbList.Selected[i] {and (i < ListBox1.Items.Count - 1)} then
          begin
            lbList.Items.Move(i, Index);
            lbList.ItemIndex := Index;
          end;
        end;
      finally
        CheckBTN;
        lbList.Items.EndUpdate;
      end;
    end;
  end;
end;

procedure TBJProp.ListBox12DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var APoint : TPoint;
    Index : integer;
begin
  APoint.x := X;
  APoint.y := Y;
  Index := lbList.ItemAtPos(APoint, true);
//  if Index = -1 then Index := ListBox1.Items.Count - 1;
  Accept := (Index <> lbList.ItemIndex) // and (ListBox1.SelCount = 1);
end;

procedure TBJProp.ListBox12Click(Sender: TObject);
begin
  CheckBTN;
end;

procedure TBJProp.CheckBTN;
begin
  sbtDown.Enabled := (lbList.items.Count > 0) and not lbList.Selected[lbList.items.Count - 1];
  sbtTop.Enabled := (lbList.items.Count > 0) and not lbList.Selected[0];
end;

procedure TBJProp.ListBox12MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if (ssLeft in Shift) then
    (Sender as TCheckListBox).BeginDrag(true);
end;

procedure TBJProp.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TBJProp.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TBJProp.ListBox12MouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  tag := 0;
  Handled := true;
 // if ListBox1.ItemIndex <= ListBox1.Items.Count - 1 then
   // ListBox1.ItemIndex := ListBox1.ItemIndex + 1;
end;

procedure TBJProp.ListBox12MouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
//  if ListBox1.ItemIndex > 0 then
  //  ListBox1.ItemIndex := 20;//ListBox1.ItemIndex - 1;
  Handled := true;
end;

end.
