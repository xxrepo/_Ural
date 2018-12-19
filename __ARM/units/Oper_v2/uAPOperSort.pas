unit uAPOperSort;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ActnList, ComCtrls, ToolWin, Buttons, StdCtrls, ExtCtrls,
  RXCtrls,
  dbgrids, db, DBClient;

type
  TEDP = class
    id_ObjItem : integer;
    AName : String;
  end;

  TAPOperSort = class(TForm)
    ImgList: TImageList;
    ActionList1: TActionList;
    aUpGrp: TAction;
    aDownGrp: TAction;
    ToolBar1: TToolBar;
    sbtTop: TSpeedButton;
    sbtDown: TSpeedButton;
    ToolButton1: TToolButton;
    ListBox1: TListBox;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cdsAPOIList: TClientDataSet;
    cdsAPOIListid_ObjItem: TAutoIncField;
    cdsAPOIListid_AP_Obj: TIntegerField;
    cdsAPOIListOperVid: TIntegerField;
    cdsAPOIListOperTypeIn: TBooleanField;
    cdsAPOIListCorrect: TBooleanField;
    cdsAPOIListOpName: TStringField;
    procedure aUpGrpExecute(Sender: TObject);
    procedure aDownGrpExecute(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtTopClick(Sender: TObject);
    procedure sbtDownClick(Sender: TObject);
  private
    Fid_AP_Obj : integer;
    procedure CheckBTN;
    procedure Init(ADataSet: TDataSet);
    procedure SaveSort;
  public
     procedure Initialize(id_AP_Obj : integer);
  end;

  function ShowAPOperSort(id_AP_Obj : integer) : boolean;

var
  APOperSort: TAPOperSort;

implementation

uses uDM, foMyFunc;

{$R *.DFM}

function ShowAPOperSort(id_AP_Obj : integer): boolean;
var F : TAPOperSort;
begin
  F := TAPOperSort.Create(nil);
  try
    F.Initialize(id_AP_Obj);
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

procedure TAPOperSort.aUpGrpExecute(Sender: TObject);
begin
//*
end;

procedure TAPOperSort.aDownGrpExecute(Sender: TObject);
begin
//*
end;

procedure TAPOperSort.ListBox1Click(Sender: TObject);
begin
  CheckBTN;
end;

procedure TAPOperSort.ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
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

procedure TAPOperSort.ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
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

procedure TAPOperSort.ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (ssLeft in Shift) then
    (Sender as TRxCheckListBox).BeginDrag(true);
end;

procedure TAPOperSort.sbtTopClick(Sender: TObject);
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
  end;
end;

procedure TAPOperSort.sbtDownClick(Sender: TObject);
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

procedure TAPOperSort.CheckBTN;
begin
  sbtDown.Enabled := (ListBox1.items.Count > 0) and not ListBox1.Selected[ListBox1.items.Count - 1];
  sbtTop.Enabled := (ListBox1.items.Count > 0) and not ListBox1.Selected[0];
end;

procedure TAPOperSort.Init(ADataSet: TDataSet);
var Old_RecNo, i : integer;
    AEDP : TEDP;
begin
  ListBox1.Items.Clear;
  with ADataSet do
  begin
    DisableControls;
    Old_RecNo := RecNo;
    First;
    while not Eof do
    begin
      AEDP := TEDP.Create;
      AEDP.id_ObjItem := cdsAPOIListid_ObjItem.AsInteger;
      AEDP.AName := cdsAPOIListOpName.AsString;

      ListBox1.Items.AddObject(AEDP.AName, AEDP);
      Next;
    end;
  end;
end;

procedure TAPOperSort.SaveSort;
var i : integer;
    AEDP : TEDP;
begin
  BeginTruns(DM.rsCA);
  try
    for i := 0 to ListBox1.Items.Count - 1 do
    begin
      AEDP := TEDP(ListBox1.Items.Objects[i]);
      DM.rsCA.AppServer.APOperSort(AEDP.id_ObjItem, i);  
    end;
    CommitTrans(DM.rsCA);
  except
    RollbackTrans(DM.rsCA);
  end;
end;

procedure TAPOperSort.Initialize(id_AP_Obj: integer);
begin
  Fid_AP_Obj := id_AP_Obj;
  with cdsAPOIList do
  begin
    Close;
    Params.ParamByName('@id_AP_Obj').Value := Fid_AP_Obj;
    Open;
    
    Init(cdsAPOIList);
  end;
end;

end.
