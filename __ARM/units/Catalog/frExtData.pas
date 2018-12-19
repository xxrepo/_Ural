unit frExtData;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, Grids, DBGrids, RXDBCtrl, ActnList, ComCtrls, ToolWin,
  ImgList, Menus, StdCtrls, ExtCtrls, RXCtrls;

type
  TfExtData = class(TFrame)
    RxDBGrid1: TRxDBGrid;
    cdsExtDataDict: TClientDataSet;
    dsExtDataDict: TDataSource;
    ActionList1: TActionList;
    aEdit: TAction;
    ImageList: TImageList;
    ToolBar: TToolBar;
    ToolButton2: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ToolButton1: TToolButton;
    aReSort: TAction;
    ToolButton5: TToolButton;
    RxSpeedButton1: TRxSpeedButton;
    pmF: TPopupMenu;
    CheckBox1: TMenuItem;
    N3: TMenuItem;
    cdsExtDataDictid_Oper_ExtDataNames: TIntegerField;
    cdsExtDataDictid_business: TIntegerField;
    cdsExtDataDictType: TIntegerField;
    cdsExtDataDictNumPrm: TIntegerField;
    cdsExtDataDictParName: TStringField;
    cdsExtDataDictVisible: TBooleanField;
    cdsExtDataDictNeedSend: TBooleanField;
    cdsExtDataDictOrdNum: TIntegerField;
    cdsExtDataDictqqq: TStringField;
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsExtDataDictDataChange(Sender: TObject; Field: TField);
    procedure CheckBox1Click(Sender: TObject);
    procedure aReSortExecute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure cdsExtDataDictCalcFields(DataSet: TDataSet);
  private
    Fid_Bsn : integer;
    procedure refresheList;
  public
    procedure Initialize(id_Bsn : integer);
  end;

implementation

uses uDM, foMyFunc, uExtDataEditor, uExtDataSort;

{$R *.DFM}

{ TfExtData }

procedure TfExtData.Initialize(id_Bsn: integer);
begin
  Fid_Bsn := id_Bsn;
  CheckBox1.Checked := true;
  CheckBox1Click(CheckBox1);
  with cdsExtDataDict do
  begin
    Close;
    Params.ParamByName('@id_business').Value := id_Bsn;
    Params.ParamByName('@Visible').Value := Null;
    Open;

  //  IndexDefs.Clear;
  //  IndexDefs.Add('xxx', 'ParName', []);
  //  IndexName := 'xxx';
    DisableControls;
    try
    {  First;
      while not eof do
      begin
        Edit;
        FieldByName('OrdNum').AsInteger := RecNo;
        Post;
        Next;
      end;  }
        ReOrderCDS(cdsExtDataDictqqq);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfExtData.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfExtData.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfExtData.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfExtData.aEditExecute(Sender: TObject);
var
  AName: string;
  id_Oper_ExtDataNames, id_business, AType, NumPrm: Integer;
  AVisible, ANeedSend: boolean;
begin
  AName := cdsExtDataDictParName.AsString;
  AVisible := cdsExtDataDictVisible.AsBoolean;
  ANeedSend := cdsExtDataDictNeedSend.AsBoolean;
  if ShowExtDataEditor(AName, AVisible, ANeedSend) then
  begin
    id_Oper_ExtDataNames := cdsExtDataDictid_Oper_ExtDataNames.AsInteger;
    id_business := Fid_Bsn;
    AType := cdsExtDataDictType.AsInteger;
    NumPrm := cdsExtDataDictNumPrm.AsInteger;
    if DM.rsCA.AppServer.OP_Oper_ExtDataNamesEdit(id_Oper_ExtDataNames, id_business, AType, NumPrm, AName, AVisible, ANeedSend, Null) = 1 then
      with cdsExtDataDict do
      begin
        Edit;
        cdsExtDataDictParName.AsString := AName;
        cdsExtDataDictVisible.AsBoolean := AVisible;
        cdsExtDataDictNeedSend.AsBoolean := ANeedSend;
        Post;
      end;
  end;
end;

procedure TfExtData.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;
    
  if (Column.Field is TBooleanField) then
  begin
    if Column.Field.AsBoolean then
      Style := DFCS_CHECKED
    else
      Style := DFCS_BUTTONCHECK;

    R := Rect;
    cbSize := 15;
    if R.Bottom - R.Top > cbSize then
    begin
      R.Top := R.Top + (R.Bottom - R.Top - cbSize) div 2;
      R.Bottom := R.Top + cbSize;
    end;
    if R.Right - R.Left < cbSize then
    begin
      R.Right := R.Left + cbSize;
    end;

    if gdSelected in State then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clHighlight;
      TDBGrid(Sender).Canvas.FillRect(Rect);
    end;
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, Style);
  end
  else
  begin
    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfExtData.refresheList;
var AType, NumPrm : Integer;
begin
  AType := cdsExtDataDictType.AsInteger;
  NumPrm := cdsExtDataDictNumPrm.AsInteger;
  cdsExtDataDict.Close;
  cdsExtDataDict.Open;
  cdsExtDataDict.Locate('Type;NumPrm', VarArrayOf([AType, NumPrm]), []);
end;

procedure TfExtData.dsExtDataDictDataChange(Sender: TObject;
  Field: TField);
begin
  aEdit.Enabled := not cdsExtDataDict.IsEmpty;
  aReSort.Enabled := not cdsExtDataDict.IsEmpty;
end;

procedure TfExtData.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    cdsExtDataDict.Filter := ''
  else
    cdsExtDataDict.Filter := 'Visible<>0';
  cdsExtDataDict.Filtered := cdsExtDataDict.Filter <> '';
end;

procedure TfExtData.aReSortExecute(Sender: TObject);
begin
  ShowExtDataSort(Fid_Bsn);
end;

procedure TfExtData.N3Click(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := true;
end;

procedure TfExtData.cdsExtDataDictCalcFields(DataSet: TDataSet);
begin
 // if not Sender.DataSet.IsEmpty then
  begin
    case cdsExtDataDictType.AsInteger of
      1 : cdsExtDataDictqqq.AsString := 'Число ';
      2 : cdsExtDataDictqqq.AsString := 'Строка ';
      3 : cdsExtDataDictqqq.AsString := 'Дата ';
    end;
    if cdsExtDataDictNumPrm.AsInteger < 10 then
      cdsExtDataDictqqq.AsString := cdsExtDataDictqqq.AsString + '  ' + cdsExtDataDictNumPrm.AsString
    else
      cdsExtDataDictqqq.AsString := cdsExtDataDictqqq.AsString + ' ' + cdsExtDataDictNumPrm.AsString;
  end;
end;

end.
