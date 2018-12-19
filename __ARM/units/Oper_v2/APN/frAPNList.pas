unit frAPNList;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ActnList, ImgList, Grids, DBGrids, RXDBCtrl, Menus,
  Db, DBClient, StdCtrls, foMyFunc, ExtCtrls;

type
  TfAPNList = class(TFrame)
    RxDBGrid1: TRxDBGrid;
    ImageList: TImageList;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    cdsAPMItem: TClientDataSet;
    dsAPMItem: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    aCopy: TAction;
    cdsAPNList: TClientDataSet;
    dsAPNList: TDataSource;
    cdsAPMItemid_APN_AccList: TAutoIncField;
    cdsAPMItemid_APN_Obj: TIntegerField;
    cdsAPMItemid_Acc: TIntegerField;
    cdsAPMItemASumm: TFloatField;
    cdsAPMItemId_Currency: TIntegerField;
    cdsAPMItemAPrc: TFloatField;
    cdsAPMItemAccName: TStringField;
    cdsAPMItemCRNName: TStringField;
    cdsAPNListid_APN_Obj: TAutoIncField;
    cdsAPNListid_business: TIntegerField;
    cdsAPNListid_Repr: TIntegerField;
    cdsAPNListOperTypeIn: TBooleanField;
    cdsAPNListDayNum: TIntegerField;
    cdsAPNListDisabled: TBooleanField;
    cdsAPNListNAme: TStringField;
    Splitter1: TSplitter;
    RxDBGrid2: TRxDBGrid;
    aAddItem: TAction;
    aEditItem: TAction;
    aDelItem: TAction;
    aRefreshItem: TAction;
    aCopyItem: TAction;
    cdsAPNListid_Acc: TIntegerField;
    cdsAPNListWDate: TDateTimeField;
    ToolBar1: TToolBar;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    btnDoIt: TButton;
    ToolButton6: TToolButton;
    btnDoAll: TButton;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure dsAPNListDataChange(Sender: TObject; Field: TField);
    procedure aSelAllExecute(Sender: TObject);
    procedure FilterEditChange(Sender: TObject);
    procedure cdsAPMItemFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure aCopyExecute(Sender: TObject);
    procedure aAddItemExecute(Sender: TObject);
    procedure aEditItemExecute(Sender: TObject);
    procedure aDelItemExecute(Sender: TObject);
    procedure aCopyItemExecute(Sender: TObject);
    procedure dsAPMItemDataChange(Sender: TObject; Field: TField);
    procedure aRefreshItemExecute(Sender: TObject);
    procedure btnDoItClick(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure btnDoAllClick(Sender: TObject);
  private
    Fid_Bsn : integer;
    procedure Refr(ID: Integer);
    procedure RefrItem(ID: Integer);
  public
    procedure Initialize(id_Bsn : integer);
    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
  end;

implementation

uses uDM, uAPCond, foMyFuncEh, uAPNProp, uAPNItem, uAPNOper;

{$R *.DFM}

procedure TfAPNList.aAddExecute(Sender: TObject);
var Aid_APN_Obj : integer;
begin
  Aid_APN_Obj := -1;
  if ShowAPNProp(Aid_APN_Obj, Fid_Bsn, false) then
    Refr(Aid_APN_Obj);
end;

procedure TfAPNList.aEditExecute(Sender: TObject);
var Aid_APN_Obj : integer;
begin
  Aid_APN_Obj := cdsAPNListid_APN_Obj.AsInteger;
  if ShowAPNProp(Aid_APN_Obj, Fid_Bsn, false) then
    Refr(Aid_APN_Obj);
end;

procedure TfAPNList.aDelExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if RxDBGrid1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(RxDBGrid1.SelectedRows.Count) + ' начислений?'
  else
    S := 'Удалить начисление?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if RxDBGrid1.SelectedRows.Count > 0 then
      begin
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
          DM.rsCA.AppServer.APN_ObjDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_APN_Obj').AsInteger);
        end;
      end
      else
        DM.rsCA.AppServer.APN_ObjDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_APN_Obj').AsInteger);
    finally
      aRefresh.Execute;
    end;
  end;
end;

procedure TfAPNList.aRefreshExecute(Sender: TObject);
 var
  id:Integer;
begin
  ID := cdsAPNListid_APN_Obj.AsInteger;
  with cdsAPNList do
  begin
    Close;
    Open;
    Locate('id_APN_Obj', Id, [loCaseInsensitive]);
  end;
end;

procedure TfAPNList.Refr(ID: Integer);
begin
  if ID = -1 then
    ID := cdsAPNListid_APN_Obj.AsInteger;
  with cdsAPNList do
  begin
    Close;
    Open;
    Locate('id_APN_Obj', Id, [loCaseInsensitive]);
  end;
end;

procedure TfAPNList.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfAPNList.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfAPNList.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfAPNList.Initialize(id_Bsn : integer);
begin
  Fid_Bsn := id_Bsn;
  aAdd.Enabled := Fid_Bsn >= 0;
  with cdsAPNList do
  begin
    Close;
    Params.ParamByName('@id_business').Value := id_Bsn;
    Open;
  end;
end;

procedure TfAPNList.dsAPNListDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsAPNList.IsEmpty;
  aCopy.Enabled := not cdsAPNList.IsEmpty;
  aDel.Enabled := not cdsAPNList.IsEmpty;
  aAddItem.Enabled := not cdsAPNList.IsEmpty;
  btnDoIt.Enabled := not cdsAPNList.IsEmpty;
  with cdsAPMItem do
  begin
    Close;
    Params.ParamByName('@id_APN_Obj').Value := cdsAPNListid_APN_Obj.AsInteger;
    if not cdsAPNList.IsEmpty then
      Open;
  end;
end;

procedure TfAPNList.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TfAPNList.FilterEditChange(Sender: TObject);
begin
  with cdsAPNList   do
  begin
    DisableControls;
    try
      Filtered := False;
      FilterOptions := [foCaseInsensitive];
      Filtered := Trim(FilterEdit.Text) <> '';
    finally
      EnableControls;
    end;
  end;
end;

procedure TfAPNList.cdsAPMItemFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

procedure TfAPNList.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfAPNList.DoRefrMsg(var Msg: TMessage);
begin
  with cdsAPNList do
  begin
    Close;
    Open;
    Locate('id_APN_Obj', Msg.WParam, [loCaseInsensitive]);
  end;
end;

procedure TfAPNList.aCopyExecute(Sender: TObject);
var Aid_APN_Obj : integer;
begin
  Aid_APN_Obj := cdsAPNListid_APN_Obj.AsInteger;
  if ShowAPNProp(Aid_APN_Obj, Fid_Bsn, true) then
    Refr(Aid_APN_Obj);
end;

constructor TfAPNList.Create(AOwner: TCOmponent);
var    Own : TCustomForm;
begin
  inherited;
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName);
  end;

end;

destructor TfAPNList.Destroy;
var    Own : TCustomForm;
begin
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin                                          
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName);
  end;
  inherited;

end;

procedure TfAPNList.aAddItemExecute(Sender: TObject);
var id_APN_AccList : integer;
begin
  id_APN_AccList := -1;
  if ShowAPNItemProp(id_APN_AccList, cdsAPNListid_APN_Obj.AsInteger, Fid_Bsn, false) then
    RefrItem(id_APN_AccList);
end;

procedure TfAPNList.aEditItemExecute(Sender: TObject);
var id_APN_AccList : integer;
begin
  id_APN_AccList := cdsAPMItemid_APN_AccList.AsInteger;
  if ShowAPNItemProp(id_APN_AccList, cdsAPNListid_APN_Obj.AsInteger, Fid_Bsn, false) then
    RefrItem(id_APN_AccList);
end;

procedure TfAPNList.aDelItemExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить элемент'), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      DM.rsCA.AppServer.APN_AccListDel(cdsAPMItemid_APN_AccList.AsInteger);
    finally
      aRefreshItem.Execute;
    end;
  end;
end;

procedure TfAPNList.aCopyItemExecute(Sender: TObject);
var id_APN_AccList : integer;
begin
  id_APN_AccList := cdsAPMItemid_APN_AccList.AsInteger;
  if ShowAPNItemProp(id_APN_AccList, cdsAPNListid_APN_Obj.AsInteger, Fid_Bsn, true) then
    RefrItem(id_APN_AccList);
end;

procedure TfAPNList.dsAPMItemDataChange(Sender: TObject; Field: TField);
begin
  aEditItem.Enabled := not cdsAPMItem.IsEmpty;
  aCopyItem.Enabled := not cdsAPMItem.IsEmpty;
  aDelItem.Enabled := not cdsAPMItem.IsEmpty;
end;

procedure TfAPNList.aRefreshItemExecute(Sender: TObject);
 var
  id:Integer;
begin
  ID := cdsAPMItemid_APN_AccList.AsInteger;
  with cdsAPMItem do
  begin
    Close;
    Open;
    Locate('id_APN_AccList', Id, [loCaseInsensitive]);
  end;
end;

procedure TfAPNList.btnDoItClick(Sender: TObject);
begin
  ShowAPNOper(Handle, cdsAPNListid_APN_Obj.AsInteger, Fid_Bsn) ;
  aRefresh.Execute;
end;

procedure TfAPNList.RefrItem(ID: Integer);
begin
  if ID = -1 then
    ID := cdsAPMItemid_APN_AccList.AsInteger;
  with cdsAPMItem do
  begin
    Close;
    Open;
    Locate('id_APN_AccList', Id, [loCaseInsensitive]);
  end;
end;

procedure TfAPNList.RxDBGrid2DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEditItem.Execute;
end;

procedure TfAPNList.btnDoAllClick(Sender: TObject);
begin
  ShowAPNOper(Handle, -1, Fid_Bsn) ; 
  aRefresh.Execute;
end;

end.
