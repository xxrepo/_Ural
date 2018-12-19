unit frAPListOper;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ActnList, ImgList, Grids, DBGrids, RXDBCtrl, Menus,
  Db, DBClient, StdCtrls, foMyFunc, ExtCtrls;

type
  TfAPListOper = class(TFrame)
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
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    aExcelExp: TAction;
    aSelAll: TAction;
    N5: TMenuItem;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    aCopy: TAction;
    ToolButton6: TToolButton;
    cdsAPOIList: TClientDataSet;
    cdsAPOIListid_ObjItem: TAutoIncField;
    cdsAPOIListid_AP_Obj: TIntegerField;
    cdsAPOIListOperVid: TIntegerField;
    cdsAPOIListOperTypeIn: TBooleanField;
    cdsAPOIListCorrect: TBooleanField;
    cdsAPOIListOpName: TStringField;
    dsAPOIList: TDataSource;
    aSort: TAction;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
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
    procedure dsFltListDataChange(Sender: TObject; Field: TField);
    procedure aSelAllExecute(Sender: TObject);
    procedure FilterEditChange(Sender: TObject);
    procedure cdsAPListFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure aCopyExecute(Sender: TObject);
    procedure aSortExecute(Sender: TObject);
  private
    Fid_AP_Obj, Fid_Bsn : integer;
  public
    procedure Initialize(id_AP_Obj, id_Bsn : integer);
    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
  end;

implementation

uses uDM, uAPOper, uAPOperSort;

{$R *.DFM}

procedure TfAPListOper.aAddExecute(Sender: TObject);
begin
  ShowAPOper(Handle, -1, Fid_AP_Obj, Fid_Bsn, Null, false)
end;

procedure TfAPListOper.aEditExecute(Sender: TObject);
begin
  ShowAPOper(Handle, cdsAPOIListid_ObjItem.AsInteger, Fid_AP_Obj, Fid_Bsn, Null, false)
end;

procedure TfAPListOper.aDelExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  if RxDBGrid1.SelectedRows.Count > 0 then
    S := 'Удалить ' + IntToStr(RxDBGrid1.SelectedRows.Count) + ' условий?'
  else
    S := 'Удалить условие?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      if RxDBGrid1.SelectedRows.Count > 0 then
      begin
        for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
          DM.rsCA.AppServer.AP_ObjItemDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_ObjItem').AsInteger);
        end;
      end
      else
        DM.rsCA.AppServer.AP_ObjItemDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_ObjItem').AsInteger);
    finally
      aRefresh.Execute;
    end;
  end;
end;

procedure TfAPListOper.aRefreshExecute(Sender: TObject);
 var
  id:Integer;
begin
  ID := cdsAPOIListid_ObjItem.AsInteger;
  with cdsAPOIList do
  begin
    Close;
    Open;
    Locate('id_ObjItem', Id, [loCaseInsensitive]);
  end;
end;

procedure TfAPListOper.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfAPListOper.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfAPListOper.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfAPListOper.Initialize(id_AP_Obj, id_Bsn : integer);
begin
  Fid_AP_Obj := id_AP_Obj;
  Fid_Bsn := id_Bsn;
  aAdd.Enabled := Fid_AP_Obj > 0;
  with cdsAPOIList do
  begin
    Close;
    Params.ParamByName('@id_AP_Obj').Value := Fid_AP_Obj;
    Open;
  end;
end;

procedure TfAPListOper.dsFltListDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsAPOIList.IsEmpty;
  aCopy.Enabled := not cdsAPOIList.IsEmpty;
  aDel.Enabled := not cdsAPOIList.IsEmpty;
  aExcelExp.Enabled := not cdsAPOIList.IsEmpty;
  aSort.Enabled := not cdsAPOIList.IsEmpty;
end;

procedure TfAPListOper.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TfAPListOper.FilterEditChange(Sender: TObject);
begin
  with cdsAPOIList do
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

procedure TfAPListOper.cdsAPListFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

procedure TfAPListOper.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfAPListOper.DoRefrMsg(var Msg: TMessage);
begin
  with cdsAPOIList do
  begin
    Close;
    Open;
    Locate('id_ObjItem', Msg.WParam, [loCaseInsensitive]);
  end;
end;

procedure TfAPListOper.aCopyExecute(Sender: TObject);
begin
  ShowAPOper(Handle, cdsAPOIListid_ObjItem.AsInteger, Fid_AP_Obj, Fid_Bsn, Null, true)
end;

constructor TfAPListOper.Create(AOwner: TCOmponent);
var    Own : TCustomForm;
begin
  inherited;
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin                                          
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName);
  end;
end;

destructor TfAPListOper.Destroy;
var    Own : TCustomForm;
begin
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin                                          
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName);
  end;
  inherited;
end;

procedure TfAPListOper.aSortExecute(Sender: TObject);
begin
  if ShowAPOperSort(Fid_AP_Obj) then aRefresh.Execute;
end;

end.
