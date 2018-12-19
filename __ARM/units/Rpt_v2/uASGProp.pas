unit uASGProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBGridEh, Buttons, CheckLst, RXCtrls, Registry,
  db, AdvCGrid, contnrs;

type
  TGridDate = class;
  TCur_obj = class
    ID : integer;
    CurName : String;
    Sum1, Sum2, SumIn, SumOut : Currency; 
    constructor Create(AID : integer; ACurName : String; ASum1, ASum2, ASumIn, ASumOut : Currency);
    destructor Destroy; override;
  end;

  TColObj = class
  private
    procedure SetVisible(const Value: boolean);
  public
    ColNum : integer;
    ColName : String;
    FieldName : String;
    FVisible : boolean;
    Field : TField;
    FGridColumnItem : TGridColumnItem;
    FGridDate : TGridDate;
    constructor Create(AColNum : integer; AColName : String; AFieldName : String; AVisible : boolean);
    property Visible : boolean read FVisible write SetVisible;
  end;

  TGridDate = class
    FCurList, FColObjList : TObjectList;
    FVList : TList;
    FMainCurName : String;
    FMainS1, FMainS2 : Currency;
    TTT : integer;
  private
    function GetColCount: integer;
    function GetColObj(index: integer): TColObj;
    function GetColObjCount: integer;
    function GetCur_obj(index: integer): TCur_obj;
    function GetCur_objCount: integer;
    procedure QuickSortSL(AList : TList; L, R: Integer);
    procedure QuickSortSLWP(AList : TList);
    function VisibleGetColObj(index: integer): TColObj;
    function VisibleGetColObjCount: integer;
  public
    FGrid : TAdvColumnGrid;
    constructor Create;
    destructor Destroy; override;

    function GetCurCol(ID_Cur: integer; OperTypeIn: boolean): integer;
    procedure MakeVisibleList;

    procedure DelCol;
    procedure DelCur;
    procedure Clear;

    procedure DelColData;

    procedure AddCol(AColNum : integer; AColName : String; AFieldName : String; AVisible : boolean);
    procedure AddCur(AID : integer; ACurName : String; ASum1, ASum2, ASumIn, ASumOut : Currency);

    property ColCount : integer read GetColCount;
    property CurCol[ID_Cur : integer; OperTypeIn : boolean] : integer read GetCurCol;

    property ColObj[index : integer] : TColObj read GetColObj;
    property ColObjCount : integer read GetColObjCount;

    property VisibleColObj[index : integer] : TColObj read VisibleGetColObj;
    property VisibleColObjCount : integer read VisibleGetColObjCount;

    property Cur_obj[index : integer] : TCur_obj read GetCur_obj;
    property Cur_objCount : integer read GetCur_objCount;

    function LoadGridSettingsFromRegistry(APath: String) : boolean;
    procedure SaveGridSettingsToRegistry(APath : String);

    function IsParPresent(AName : String) : boolean;
  end;

  TASGProp = class(TForm)
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
    FGridDate: TGridDate;
    
    procedure CheckBTN;
    { Private declarations }
  public
    procedure Initialize(AGridDate: TGridDate);
  end;

var
  ASGProp: TASGProp;

  function ShowASGProp(AGridDate: TGridDate;
                       ACaption : String = '') : boolean;
implementation

uses foMyFunc, foMyFuncEh, uDM;

{$R *.DFM}

function ShowASGProp(AGridDate: TGridDate;
                       ACaption : String) : boolean;
var F : TASGProp;
    i : integer;
begin
  Result := false;
  F := TASGProp.Create(nil);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    if ACaption <> '' then
      F.Caption := ACaption;

    F.Initialize(AGridDate);

    F.ShowModal;
    Result := F.ModalResult = mrOk;
    if Result then
    begin
      try
        for i := 0 to F.ListBox1.Items.Count - 1 do
        begin
          TColObj(F.ListBox1.Items.Objects[i]).ColNum := i;
          TColObj(F.ListBox1.Items.Objects[i]).Visible := F.ListBox1.Checked[i];
        end;
        AGridDate.QuickSortSLWP(AGridDate.FColObjList);
      finally
      end;
    end;
  finally
    F.Free;
  end;
end;


{ TArcProp }

procedure TASGProp.Initialize(AGridDate: TGridDate);
var i : integer;
    Obj : TColObj;
begin
  FGridDate := AGridDate;
  ListBox1.Items.Clear;
  AGridDate.QuickSortSLWP(AGridDate.FColObjList);
  for i := 0 to FGridDate.ColObjCount -1 do
  begin
    Obj := FGridDate.ColObj[i];
    ListBox1.Items.AddObject(Obj.ColName, Obj);
    ListBox1.Checked[ListBox1.Items.Count - 1] := Obj.Visible;
  end;
end;

procedure TASGProp.sbtTopClick(Sender: TObject);
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

procedure TASGProp.sbtDownClick(Sender: TObject);
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

procedure TASGProp.ListBox12DragDrop(Sender, Source: TObject; X,
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

procedure TASGProp.ListBox12DragOver(Sender, Source: TObject; X,
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

procedure TASGProp.ListBox12Click(Sender: TObject);
begin
  CheckBTN;
end;

procedure TASGProp.CheckBTN;
begin
  sbtDown.Enabled := (ListBox1.items.Count > 0) and not ListBox1.Selected[ListBox1.items.Count - 1];
  sbtTop.Enabled := (ListBox1.items.Count > 0) and not ListBox1.Selected[0];
end;

procedure TASGProp.ListBox12MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if (ssLeft in Shift) then
    (Sender as TCheckListBox).BeginDrag(true);
end;

procedure TASGProp.Button1Click(Sender: TObject);
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

procedure TASGProp.Button2Click(Sender: TObject);
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

procedure TASGProp.ListBox12DrawItem(Control: TWinControl; Index: Integer;
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

procedure TASGProp.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TASGProp.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TASGProp.ListBox12MouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  tag := 0;
  Handled := true;
 // if ListBox1.ItemIndex <= ListBox1.Items.Count - 1 then
   // ListBox1.ItemIndex := ListBox1.ItemIndex + 1;
end;

procedure TASGProp.ListBox12MouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
//  if ListBox1.ItemIndex > 0 then
  //  ListBox1.ItemIndex := 20;//ListBox1.ItemIndex - 1;
  Handled := true;
end;

{ TCur_obj }

constructor TCur_obj.Create(AID: integer; ACurName: String; ASum1, ASum2, ASumIn,
  ASumOut: Currency);
begin
  inherited Create;
  ID := AID;
  CurName := ACurName;
  Sum1 := ASum1;
  Sum2 := ASum2;
  SumIn := ASumIn;
  SumOut := ASumOut;
end;

destructor TCur_obj.Destroy;
begin
  inherited;
end;

{ TColObj }

constructor TColObj.Create(AColNum: integer; AColName, AFieldName: String;
  AVisible: boolean);
begin
  inherited Create;
  ColNum := AColNum;
  ColName := AColName;
  FieldName := AFieldName;
  Visible := AVisible;


  Field := nil;
  FGridColumnItem := nil;
end;

procedure TColObj.SetVisible(const Value: boolean);
begin
  FVisible := Value;
end;

{ TGridDate }

procedure TGridDate.AddCol(AColNum: integer; AColName, AFieldName: String;
  AVisible: boolean);
var Obj : TColObj;
begin
  if AColNum = -1 then
    AColNum := FColObjList.Count + 1;
  Obj := TColObj.Create(AColNum, AColName, AFieldName, AVisible);
  FColObjList.Add(Obj);
  Obj.FGridDate := Self;
end;

procedure TGridDate.AddCur(AID: integer; ACurName: String; ASum1, ASum2,
  ASumIn, ASumOut: Currency);
var Obj : TCur_obj;
begin
  Obj := TCur_obj.Create(AID, ACurName, ASum1, ASum2, ASumIn, ASumOut);
  FCurList.Add(Obj);
end;

procedure TGridDate.Clear;
begin
  DelCol;
  DelCur;
end;

procedure TGridDate.DelColData;
var i : integer;
begin
  for i := 0 to FColObjList.Count - 1 do
    TColObj(FColObjList[i]).FGridColumnItem := nil;
end;

constructor TGridDate.Create;
begin
  inherited;
  TTT := 0;
  FCurList := TObjectList.Create(true);
  FColObjList := TObjectList.Create(true);
  FVList := TList.Create;
end;

procedure TGridDate.DelCol;
begin
  FColObjList.Clear;
end;

procedure TGridDate.DelCur;
begin
  FCurList.Clear;
end;

destructor TGridDate.Destroy;
begin
  FCurList.Free;
  FColObjList.Free;
  FVList.Free;
  inherited;
end;

function TGridDate.GetColCount: integer;
var i, N : integer;
begin
  N := 0;
  for i := 0 to FColObjList.Count - 1 do
    if TColObj(FColObjList[i]).Visible then
      Inc(N);
  Result := N + 2 * FCurList.Count;
end;

function TGridDate.GetColObj(index: integer): TColObj;
begin
  Result := TColObj(FColObjList[index]);
end;

function TGridDate.GetColObjCount: integer;
begin
  Result := FColObjList.Count;
end;

function TGridDate.GetCurCol(ID_Cur: integer;
  OperTypeIn: boolean): integer;
var i : integer;
begin
  Result := -1;
  for i := 0 to FCurList.Count - 1 do
    if TCur_obj(FCurList[i]).ID = ID_Cur then
    begin
      Result := 2 * (i + 1) + TTT;
      if OperTypeIn then
        Result := Result - 1;
    end;
end;

function TGridDate.GetCur_obj(index: integer): TCur_obj;
begin
  Result := TCur_obj(FCurList[index]);
end;

function TGridDate.GetCur_objCount: integer;
begin
  Result := FCurList.Count;
end;

function TGridDate.LoadGridSettingsFromRegistry(APath: String) : boolean;
var Reg : TRegistry;
    i : integer;
    AColObj : TColObj;
begin
  Result := false;
  try
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;

      if Reg.OpenKey(APath, true) then
      begin
        for i := 0 to TTT do
        begin
          if FGrid.Columns.Count > i then
            if Reg.ValueExists('Column_' + Inttostr(i)) then
              FGrid.Columns[i + FGrid.FixedCols].Width := Reg.ReadInteger('Column_' + Inttostr(i));
        end;
      
        for i := 0 to FColObjList.Count - 1 do
        begin
          AColObj := TColObj(FColObjList[i]);

          if Reg.ValueExists('Column_' + AColObj.FieldName + 'ColNum') then
            AColObj.ColNum := Reg.ReadInteger('Column_' + AColObj.FieldName + 'ColNum');

          if Reg.ValueExists('Column_' + AColObj.FieldName + 'Visible') then
            AColObj.Visible := Reg.ReadBool('Column_' + AColObj.FieldName + 'Visible');
          if AColObj.Visible then
          begin
            if (AColObj.FGridColumnItem <> nil) and Reg.ValueExists('Column_' + AColObj.FieldName + 'Width') then
              AColObj.FGridColumnItem.Width := Reg.ReadInteger('Column_' + AColObj.FieldName + 'Width');

          end;
        end;
      end;
      Result := true;
    finally
      Reg.CloseKey;
      Reg.Free;
      MakeVisibleList;
    end;
  except
  end;
end;

procedure TGridDate.SaveGridSettingsToRegistry(APath: String);
var Reg : TRegistry;
    i : integer;
    AColObj : TColObj;
begin
  try
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;

      if Reg.OpenKey(APath, true) then
      begin
        for i := 0 to TTT do
        begin
          if FGrid.Columns.Count > i then
            Reg.WriteInteger('Column_' + Inttostr(i), FGrid.Columns[i + FGrid.FixedCols].Width);
        end;


        for i := 0 to FColObjList.Count - 1 do
        begin
          AColObj := TColObj(FColObjList[i]);
          if AColObj.FGridColumnItem <> nil then
            Reg.WriteInteger('Column_' + AColObj.FieldName + 'Width', AColObj.FGridColumnItem.Width);
          Reg.WriteInteger('Column_' + AColObj.FieldName + 'ColNum', AColObj.ColNum);
          Reg.WriteBool('Column_' + AColObj.FieldName + 'Visible', AColObj.Visible);
        end;
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
      MakeVisibleList;
    end;
  except
  end;
end;


procedure TGridDate.QuickSortSLWP(AList : TList);
begin
  try
    QuickSortSL(AList, 0, AList.Count - 1);
  except

  end;
end;

procedure TGridDate.QuickSortSL(AList : TList; L, R: Integer);
  function xxxCompare(Index1, Index2: Integer): Integer;
  var i1, I2 : Integer;
  begin
    I1 := TColObj(AList[Index1]).ColNum;
    I2 := TColObj(AList[Index2]).ColNum;
    Result := I1 - i2;
  end;
var
  I, J, P: Integer;
begin
  if R < L then Exit;
  repeat
    I := L;
    J := R;
    P := (L + R) shr 1;
    repeat
      while xxxCompare(I, P) < 0 do Inc(I);
      while xxxCompare(J, P) > 0 do Dec(J);
      if I <= J then
      begin
        AList.Exchange(I, J);
        if P = I then
          P := J
        else if P = J then
          P := I;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then QuickSortSL(AList, L, J);
    L := I;
  until I >= R;
end;


procedure TGridDate.MakeVisibleList;
var i : integer;
begin
  FVList.Clear;
  for i := 0 to FColObjList.Count - 1 do
  begin
    if TColObj(FColObjList[i]).Visible then
      FVList.Add(FColObjList[i]);
  end;
  QuickSortSLWP(FVList);
end;

function TGridDate.VisibleGetColObj(index: integer): TColObj;
begin
  Result := TColObj(FVList[index]);
end;

function TGridDate.VisibleGetColObjCount: integer;
begin
  Result := FVList.Count;
end;

function TGridDate.IsParPresent(AName: String): boolean;
var i : integer;
begin
  AName := UpperCase(AName);
  Result := false;
  for i := 0 to FColObjList.Count - 1 do
    if UpperCase(TColObj(FColObjList[i]).FieldName) = AName then
    begin
      result := TColObj(FColObjList[i]).Visible;
      Break;
    end;

end;

end.
