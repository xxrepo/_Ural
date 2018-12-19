unit uArcPropEh;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBGridEh, Buttons, CheckLst, RXCtrls, Registry,
  RXSpin;

type
  TArcPropEh = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    Panel1: TPanel;
    sbtDown: TSpeedButton;
    sbtTop: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TCheckListBox;
    procedure sbtTopClick(Sender: TObject);
    procedure sbtDownClick(Sender: TObject);
    procedure ListBox12DragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure ListBox12DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox12Click(Sender: TObject);
    procedure ListBox12MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListBox12DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
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
    procedure Initialize(ADBGrid1: TDBGridEh);
  end;

var
  ArcPropEh: TArcPropEh;

  function ShowArcPropEh(ADBGrid1: TDBGridEh;
                       ACaption : String = '') : boolean;
implementation

uses   foMyFunc, foMyFuncEh, uDM;

{$R *.DFM}

function ShowArcPropEh(ADBGrid1: TDBGridEh;
                       ACaption : String) : boolean;
var F : TArcPropEh;
    i : integer;
begin
  Result := false;
  F := TArcPropEh.Create(nil);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    if ACaption <> '' then
      F.Caption := ACaption;
    F.Initialize(ADBGrid1);


    F.ShowModal;
    Result := F.ModalResult = mrOk;
    if Result then
    begin
      try
  //      OldFrozenCols := ADBGrid1.FrozenCols;
        ADBGrid1.FrozenCols := 0;
        for i := 0 to F.ListBox1.Items.Count - 1 do
        begin
          TColumnEh(F.ListBox1.Items.Objects[i]).Index := i;
          TColumnEh(F.ListBox1.Items.Objects[i]).Visible := F.ListBox1.Checked[i];
        end;

      finally

      end;
    end;
  finally
    F.Free;
  end;
end;

{ TArcProp }

procedure TArcPropEh.Initialize(ADBGrid1: TDBGridEh);
var i : integer;
begin
  FDBGrid1 := ADBGrid1;
  ListBox1.Items.Clear;
  for i := 0 to ADBGrid1.Columns.Count -1 do
  begin
    if ADBGrid1.Columns[i].tag >= 0 then
    begin
      ListBox1.Items.AddObject(ADBGrid1.Columns[i].Title.Caption, ADBGrid1.Columns[i]);
      ListBox1.Checked[ListBox1.Items.Count - 1] := ADBGrid1.Columns[i].Visible;
    end;
  end;

end;

procedure TArcPropEh.sbtTopClick(Sender: TObject);
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
        ListBox1.ItemIndex := i - 1;
      end;
    end;
  finally
    CheckBTN;
    ListBox1.Items.EndUpdate;
  end;
end;

procedure TArcPropEh.sbtDownClick(Sender: TObject);
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
        ListBox1.ItemIndex := i + 1;
      end;
    end;
  finally
    CheckBTN;
    ListBox1.Items.EndUpdate;
  end;
end;

procedure TArcPropEh.ListBox12DragDrop(Sender, Source: TObject; X,
  Y: Integer);
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
            ListBox1.ItemIndex := Index;
          end;
        end;
      finally
        CheckBTN;
        ListBox1.Items.EndUpdate;
      end;
    end;
  end;
end;

procedure TArcPropEh.ListBox12DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var APoint : TPoint;
    Index : integer;
begin
  APoint.x := X;
  APoint.y := Y;
  Index := ListBox1.ItemAtPos(APoint, true);
//  if Index = -1 then Index := ListBox1.Items.Count - 1;
  Accept := (Index <> ListBox1.ItemIndex) // and (ListBox1.SelCount = 1);
end;

procedure TArcPropEh.ListBox12Click(Sender: TObject);
begin
  CheckBTN;
end;

procedure TArcPropEh.CheckBTN;
begin
  sbtDown.Enabled := (ListBox1.items.Count > 0) and not ListBox1.Selected[ListBox1.items.Count - 1];
  sbtTop.Enabled := (ListBox1.items.Count > 0) and not ListBox1.Selected[0];
end;

procedure TArcPropEh.ListBox12MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if (ssLeft in Shift) then
    (Sender as TCheckListBox).BeginDrag(true);
end;

procedure TArcPropEh.Button1Click(Sender: TObject);
var i : integer;
begin
  ListBox1.items.BeginUpdate;
  try
    for i:= 0 to ListBox1.Items.Count - 1 do
      ListBox1.Checked[i] := true;
  finally
    ListBox1.Items.EndUpdate;
  end;
end;

procedure TArcPropEh.Button2Click(Sender: TObject);
var i : integer;
begin
  ListBox1.items.BeginUpdate;
  try
    for i:= 0 to ListBox1.Items.Count - 1 do
      ListBox1.Checked[i] := false;
  finally
    ListBox1.Items.EndUpdate;
  end;
end;

procedure TArcPropEh.ListBox12DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  if N < 0 then N := 0;
  if Index < N then
  begin
 //   ListBox1.Canvas.Font.Color := clRed;
    ListBox1.Canvas.Font.Style := ListBox1.Canvas.Font.Style + [fsBold];
  end;

  ListBox1.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 0, ListBox1.Items[Index]);
end;

procedure TArcPropEh.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TArcPropEh.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TArcPropEh.ListBox12MouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  tag := 0;
  Handled := true;
 // if ListBox1.ItemIndex <= ListBox1.Items.Count - 1 then
   // ListBox1.ItemIndex := ListBox1.ItemIndex + 1;
end;

procedure TArcPropEh.ListBox12MouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
//  if ListBox1.ItemIndex > 0 then
  //  ListBox1.ItemIndex := 20;//ListBox1.ItemIndex - 1;
  Handled := true;
end;

end.
