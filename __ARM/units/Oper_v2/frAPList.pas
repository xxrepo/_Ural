unit frAPList;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ActnList, ImgList, Grids, DBGrids, RXDBCtrl, Menus,
  Db, DBClient, StdCtrls, foMyFunc, ExtCtrls;

type
  TfAPList = class(TFrame)
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
    cdsAPList: TClientDataSet;
    dsFltList: TDataSource;
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
    cdsAPListid_AP_Obj: TAutoIncField;
    cdsAPListid_business: TIntegerField;
    cdsAPListOperVid: TIntegerField;
    cdsAPListOperTypeIn: TBooleanField;
    cdsAPListCorrect: TBooleanField;
    cdsAPListName: TStringField;
    cdsAPListid_User: TIntegerField;
    cdsAPListDateCreateAP: TDateTimeField;
    cdsAPListDeleted: TBooleanField;
    cdsAPListOperVidName: TStringField;
    cdsAPListOperType: TStringField;
    cdsAPListCorrectName: TStringField;
    cdsAPListCreatorFIO: TStringField;
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
  private
    Fid_Bsn : integer;
  public
    procedure Initialize(id_Bsn : integer);
    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
  end;

implementation

uses uDM, uAPCond, foMyFuncEh;

{$R *.DFM}

procedure TfAPList.aAddExecute(Sender: TObject);
begin
  ShowAPCond(Handle, -1, Fid_Bsn, Null, false)
end;

procedure TfAPList.aEditExecute(Sender: TObject);
begin
  ShowAPCond(Handle, cdsAPListid_AP_Obj.AsInteger, Fid_Bsn, Null, false)
end;

procedure TfAPList.aDelExecute(Sender: TObject);
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
          DM.rsCA.AppServer.AP_ObjDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_AP_Obj').AsInteger);
        end;
      end
      else
        DM.rsCA.AppServer.AP_ObjDel(RxDBGrid1.DataSource.DataSet.FieldByName('id_AP_Obj').AsInteger);
    finally
      aRefresh.Execute;
    end;
  end;
end;

procedure TfAPList.aRefreshExecute(Sender: TObject);
 var
  id:Integer;
begin
  ID := cdsAPListid_AP_Obj.AsInteger;
  with cdsAPList do
  begin
    Close;
    Open;
    Locate('id_AP_Obj', Id, [loCaseInsensitive]);
  end;
end;

procedure TfAPList.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfAPList.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfAPList.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfAPList.Initialize(id_Bsn : integer);
begin
  Fid_Bsn := id_Bsn;
  aAdd.Enabled := Fid_Bsn >= 0;
  with cdsAPList do
  begin
    Close;
    Params.ParamByName('@id_business').Value := id_Bsn;
    Open;
  end;
end;

procedure TfAPList.dsFltListDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsAPList.IsEmpty;
  aCopy.Enabled := not cdsAPList.IsEmpty;
  aDel.Enabled := not cdsAPList.IsEmpty;
  aExcelExp.Enabled := not cdsAPList.IsEmpty;
end;

procedure TfAPList.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TfAPList.FilterEditChange(Sender: TObject);
begin
  with cdsAPList   do
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

procedure TfAPList.cdsAPListFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

procedure TfAPList.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfAPList.DoRefrMsg(var Msg: TMessage);
begin
  with cdsAPList do
  begin
    Close;
    Open;
    Locate('id_AP_Obj', Msg.WParam, [loCaseInsensitive]);
  end;
end;

procedure TfAPList.aCopyExecute(Sender: TObject);
begin
  ShowAPCond(Handle, cdsAPListid_AP_Obj.AsInteger, Fid_Bsn, Null, true)
end;

constructor TfAPList.Create(AOwner: TCOmponent);
var    Own : TCustomForm;
begin
  inherited;
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin                                          
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName);
  end;

end;

destructor TfAPList.Destroy;
var    Own : TCustomForm;
begin
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin                                          
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName);
  end;
  inherited;

end;

end.
