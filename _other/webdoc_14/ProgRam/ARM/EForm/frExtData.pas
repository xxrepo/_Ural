unit frExtData;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, Grids, DBGrids, RXDBCtrl, ActnList, ComCtrls, ToolWin,
  ImgList, Menus, StdCtrls, ExtCtrls, RXCtrls, acDBGrid, sFrameAdapter;

type
  TfExtData = class(TFrame)
    cdsDDD: TClientDataSet;
    dsExtDataDict: TDataSource;
    ActionList1: TActionList;
    aEdit: TAction;
    ToolBar: TToolBar;
    ToolButton2: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ToolButton1: TToolButton;
    aReSort: TAction;
    ToolButton5: TToolButton;
    cdsDDDid_NameRules: TAutoIncField;
    cdsDDDid_NS: TIntegerField;
    cdsDDDColName: TStringField;
    cdsDDDParamName: TStringField;
    cdsDDDOrderID: TIntegerField;
    cdsDDDisInt: TBooleanField;
    cdsDDDinName: TIntegerField;
    cdsDDDisVisible: TBooleanField;
    aRefr: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    sDBGrid1: TsDBGrid;
    sFrameAdapter1: TsFrameAdapter;
    procedure RxDBGridGetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGridDblClick(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure RxDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsExtDataDictDataChange(Sender: TObject; Field: TField);
    procedure aReSortExecute(Sender: TObject);
    procedure aRefrExecute(Sender: TObject);
    procedure cdsDDDColNameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
 
  public
    procedure Initialize;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses uDM, foMyFunc, uExtDataEditor, uExtDataSort;

{$R *.DFM}

{ TfExtData }

procedure TfExtData.Initialize;
begin
  with cdsDDD do
  begin
    Close;
    Params.ParamByName('@id_NS').Value := DM.id_NS;
    Params.ParamByName('@isInt').Value := false;
    Open;
    EnableControls;
  end;
end;

procedure TfExtData.RxDBGridGetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfExtData.RxDBGridDblClick(Sender: TObject);
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
  AVisible : boolean;
  
  id_NameRules, id_NS, ColName,
  ParamName, OrderID, isInt, isVisible, inName: OleVariant;
begin
  AName := cdsDDDParamName.AsString;
  AVisible := cdsDDDisVisible.AsBoolean;
  if ShowExtDataEditor(AName, AVisible) then
  begin
    id_NameRules := cdsDDDid_NameRules.AsInteger;
    id_NS := DM.id_NS;
    ColName := cdsDDDColName.AsString;
    ParamName := AName;
    OrderID := cdsDDDOrderID.AsInteger;
    isInt := cdsDDDisInt.AsBoolean;
    isVisible := AVisible;
    inName := cdsDDDinName.AsInteger;
    
    if DM.rsCA.AppServer.NS_NameRules_UnEdit(id_NameRules, id_NS, ColName,
                        ParamName, OrderID, isInt, isVisible, inName) = 1 then
      with cdsDDD do
      begin
        Edit;
        cdsDDDParamName.AsString := AName;
        cdsDDDisVisible.AsBoolean := AVisible;
        Post;
      end;  
  end;
end;

procedure TfExtData.RxDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;
//  TDBGrid(Sender).Canvas.FillRect(Rect);
    
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
    end
    else
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clWindow;
      TDBGrid(Sender).Canvas.FillRect(Rect);
    end;
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, Style);
  end
  else
  begin
    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

 

procedure TfExtData.dsExtDataDictDataChange(Sender: TObject;
  Field: TField);
begin
  aEdit.Enabled := not cdsDDD.IsEmpty;
  aReSort.Enabled := not cdsDDD.IsEmpty;
end;

procedure TfExtData.aReSortExecute(Sender: TObject);
begin
  ShowExtDataSort;
end;

constructor TfExtData.Create(AOwner: TComponent);
begin
  inherited;

 // cdsDDD.IndexDefs.Clear;
//  cdsDDD.IndexDefs.Add('xxx', 'OrderID', []);
 // cdsDDD.IndexName := 'xxx';

 // ReOrderCDS(cdsDDDOrderID);
end;

procedure TfExtData.aRefrExecute(Sender: TObject);
begin
  FixIdRefresh(cdsDDD, 'id_NameRules');
  cdsDDD.EnableControls;
end;

procedure TfExtData.cdsDDDColNameGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := Sender.AsString;
  Text := xStringReplace(Text, ['Obj_Str'], 'Параметр юрлица ');
  Text := xStringReplace(Text, ['Adv_Str'], 'Параметр файла ');
end;

end.
