unit uExtDataSort;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ActnList, ComCtrls, ToolWin, Buttons, StdCtrls, ExtCtrls,
  RXCtrls,
  dbgrids, db, DBClient;

type
  TEDP = class
    id_Oper_ExtDataNames : integer;
    AType : integer;
    ANumPrm : integer;
    AParName : String;
    ANeedSend : boolean;
  end;

  TExtDataSort = class(TForm)
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
    cdsExtDataDict: TClientDataSet;
    cdsExtDataDictid_Oper_ExtDataNames: TIntegerField;
    cdsExtDataDictid_business: TIntegerField;
    cdsExtDataDictType: TIntegerField;
    cdsExtDataDictNumPrm: TIntegerField;
    cdsExtDataDictParName: TStringField;
    cdsExtDataDictVisible: TBooleanField;
    cdsExtDataDictNeedSend: TBooleanField;
    cdsExtDataDictOrdNum: TIntegerField;
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
    Fid_business : integer;
    procedure CheckBTN;
    procedure Init(ADataSet: TDataSet);
    procedure SaveSort;
  public
     procedure Initialize(id_Bsn : integer);
  end;

  function ShowExtDataSort(id_Bsn : integer) : boolean;

var
  ExtDataSort: TExtDataSort;

implementation

uses uDM, foMyFunc;

{$R *.DFM}

function ShowExtDataSort(id_Bsn : integer): boolean;
var F : TExtDataSort;
begin
  F := TExtDataSort.Create(nil);
  try
    F.Initialize(id_Bsn);
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

procedure TExtDataSort.aUpGrpExecute(Sender: TObject);
begin
//*
end;

procedure TExtDataSort.aDownGrpExecute(Sender: TObject);
begin
//*
end;

procedure TExtDataSort.ListBox1Click(Sender: TObject);
begin
  CheckBTN;
end;

procedure TExtDataSort.ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
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

procedure TExtDataSort.ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
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

procedure TExtDataSort.ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (ssLeft in Shift) then
    (Sender as TRxCheckListBox).BeginDrag(true);
end;

procedure TExtDataSort.sbtTopClick(Sender: TObject);
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

procedure TExtDataSort.sbtDownClick(Sender: TObject);
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

procedure TExtDataSort.CheckBTN;
begin
  sbtDown.Enabled := (ListBox1.items.Count > 0) and not ListBox1.Selected[ListBox1.items.Count - 1];
  sbtTop.Enabled := (ListBox1.items.Count > 0) and not ListBox1.Selected[0];
end;

procedure TExtDataSort.Init(ADataSet: TDataSet);
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
      if FieldByName('Visible').AsBoolean then
      begin
        AEDP := TEDP.Create;
        AEDP.id_Oper_ExtDataNames := FieldByName('id_Oper_ExtDataNames').AsInteger;
        AEDP.AType := FieldByName('Type').AsInteger;
        AEDP.ANumPrm := FieldByName('NumPrm').AsInteger;
        AEDP.AParName := FieldByName('ParName').AsString;
        AEDP.ANeedSend := FieldByName('NeedSend').AsBoolean;

        ListBox1.Items.AddObject(AEDP.AParName, AEDP);
      end;
      Next;
    end;
  end;
end;

procedure TExtDataSort.SaveSort;
var i : integer;
    AEDP : TEDP;
begin
  BeginTruns(DM.rsCA);
  try
    for i := 0 to ListBox1.Items.Count - 1 do
    begin
      AEDP := TEDP(ListBox1.Items.Objects[i]);
      DM.rsCA.AppServer.OP_Oper_ExtDataNamesEdit(AEDP.id_Oper_ExtDataNames,
                                                 Fid_business,
                                                 AEDP.AType,
                                                 AEDP.ANumPrm,
                                                 AEDP.AParName,
                                                 true,
                                                 AEDP.ANeedSend,
                                                 i);
    end;
    CommitTrans(DM.rsCA);
  except
    RollbackTrans(DM.rsCA);
  end;
end;

procedure TExtDataSort.Initialize(id_Bsn: integer);
begin
  Fid_business := id_Bsn;
  with cdsExtDataDict do
  begin
    Close;
    Params.ParamByName('@id_business').Value := Fid_business;
    Params.ParamByName('@Visible').Value := true;
    Open;
    
    Init(cdsExtDataDict);
  end;
end;

end.
