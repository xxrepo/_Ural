unit frNewObj;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ActnList, ImgList, Menus, Db, DBClient,
  ComCtrls, ToolWin, frBsnSelector, ExtCtrls, StdCtrls;

type
  TfNewObj = class(TFrame)
    RxDBGrid1: TRxDBGrid;
    ilMenu: TImageList;
    ActionList1: TActionList;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    cdsNewObj: TClientDataSet;
    dsNewObj: TDataSource;
    pmNewObj: TPopupMenu;
    Action11: TMenuItem;
    N1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    cdsNewObjObjID: TIntegerField;
    cdsNewObjObjName: TStringField;
    cdsNewObjID: TIntegerField;
    cdsNewObjid_business: TIntegerField;
    cdsNewObjName: TStringField;
    cdsNewObjShortName: TStringField;
    cdsNewObjExtInfo: TStringField;
    aSave: TAction;
    cdsNewObjFlag: TBooleanField;
    aSelAll: TAction;
    aUnSelAll: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    aExit: TAction;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    ilEM: TImageList;
    aReLink: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    N7: TMenuItem;
    aSelOne: TAction;
    aUnSelOne: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsNewObjDataChange(Sender: TObject; Field: TField);
    procedure aSaveExecute(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure aSelAllExecute(Sender: TObject);
    procedure aUnSelAllExecute(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure aReLinkExecute(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure aSelOneExecute(Sender: TObject);
    procedure aUnSelOneExecute(Sender: TObject);
    procedure FilterEditChange(Sender: TObject);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure cdsNewObjFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    procedure SetFlaf(AFlag: Boolean);
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Initialize;
    procedure SaveData;
  end;

implementation

uses foMyFunc, uDM, uFormApi_CA, uFormApi_Ware, uNSIDetailFormsAPI,
  uReLink, uPrgForm;

{$R *.DFM}

procedure TfNewObj.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);

end;

procedure TfNewObj.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aEdit.Execute;
end;

procedure TfNewObj.aEditExecute(Sender: TObject);
var Rez : Boolean;
    ID, Need : Variant;
    AName, ShortName, BarCode : String;
    ADisabled : boolean;
    ID2 : integer;
begin
  Rez := false;
  ID := cdsNewObjID.AsInteger;
  ID2 := cdsNewObjID.AsInteger;
  Need := Null;
  case cdsNewObjObjID.AsInteger of
    1 : Rez := ShowEquipDetailForm(ID);
    2 : Rez := ShowAccsDetailForm(ID);
    4 : Rez := ShowWareHouseDetailForm(ID);
    5 : Rez := EditReprProp(ID, Need, Need);
    6 : Rez := ShowManufactDetailForm(ID);

    8 : Rez := EditWaresProp(-1, ID2, fBsnSelector1.ID);
         
    12 : Rez := EditWaresCat(ID, -1, -1);
  end;
  if Rez then
    aRefresh.Execute;
end;

procedure TfNewObj.aDelExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить "' + cdsNewObjName.AsString + ' "?'), 'Подтвердите удаление', MB_ICONQUESTION + MB_YESNO) = idYes then
  begin
    if DM.rsCA.AppServer.CH_Deleted(cdsNewObjID.AsInteger, cdsNewObjObjID.AsInteger) = 1 then
      cdsNewObj.Delete;
  end;
end;

procedure TfNewObj.aRefreshExecute(Sender: TObject);
var ID, ObjID : integer;
begin
  with cdsNewObj do
  begin
    ID := cdsNewObjID.AsInteger;
    ObjID := cdsNewObjObjID.AsInteger;
    Close;
    Params.ParamByName('@id_business').Value := fBsnSelector1.ID;
    if fBsnSelector1.ID = Null then Exit;
      Open;
    Locate('ObjID;ID', VarArrayOf([ObjID, ID]), []);
  end;
end;

procedure TfNewObj.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);

end;

procedure TfNewObj.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;

  if Column.Field = cdsNewObjObjID then
  begin
    case Column.Field.AsInteger of
      1 : ImgIndex := 0;
      2 : ImgIndex := 1;
      3 : ImgIndex := 2;
      4 : ImgIndex := 2;
      5 : ImgIndex := 3;
      6 : ImgIndex := 4;
      7 : ImgIndex := 5;
      8 : ImgIndex := 6;
      9 : ImgIndex := 7;
      10 : ImgIndex := 8;
      11..14 : ImgIndex := 9;
      else
        ImgIndex := -1;
    end;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    ilEM.Draw(TDBGrid(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
  end
  else
  if Column.Field = cdsNewObjFlag then
  begin
    if Column.Field.AsBoolean then
      ImgIndex := 9
    else
      ImgIndex := -1;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    ilMenu.Draw(TDBGrid(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
  end
  else
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfNewObj.dsNewObjDataChange(Sender: TObject;
  Field: TField);
begin
  aEdit.Enabled := not cdsNewObj.IsEmpty;
  aDel.Enabled := not cdsNewObj.IsEmpty;

  aReLink.Enabled := not cdsNewObj.IsEmpty;
  aSelOne.Enabled := not cdsNewObj.IsEmpty;
  aUnSelOne.Enabled := not cdsNewObj.IsEmpty;
end;

constructor TfNewObj.Create(AOwner: TComponent);
var V : Variant;
begin
  inherited;
  LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);

  LoadValFromRegistry(V, SRegPath + '\' + ClassName, 'id_Bsn');
  fBsnSelector1.UID := 5;
  fBsnSelector1.ID := V;
end;

destructor TfNewObj.Destroy;
begin
  SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  if fBsnSelector1.ID > 0 then
    SaveValToRegistry(fBsnSelector1.ID, SRegPath + '\' + ClassName, 'id_Bsn');
  inherited;

end;

procedure TfNewObj.aSaveExecute(Sender: TObject);
begin
  SaveData;
end;

procedure TfNewObj.RxDBGrid1CellClick(Column: TColumn);
begin
  if Column.Index = 0 then
  begin
    with cdsNewObj do
    begin
      Edit;
      FieldByName('flag').AsBoolean := not FieldByName('flag').AsBoolean;
      Post;
    end;
  end;
end;

procedure TfNewObj.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ' ' then
  begin
    with cdsNewObj do
    begin
      Edit;
      FieldByName('flag').AsBoolean := not FieldByName('flag').AsBoolean;
      Post;
    end;
  end;
end;

procedure TfNewObj.Initialize;
begin
  aRefresh.Execute;
end;

procedure TfNewObj.SaveData;
var ObjID, ID : integer;
begin
  with cdsNewObj do
  begin
    DisableControls;
    ObjID := cdsNewObjObjID.AsInteger;
    ID := cdsNewObjID.AsInteger;
    try
      First;
      while not Eof do
      begin
        ShowProgressForm(Handle, RecNo, RecordCount, 'Обновление данных');
        if cdsNewObjFlag.AsBoolean then
        begin
          DM.rsCA.AppServer.CH_Checked(cdsNewObjID.AsInteger, cdsNewObjObjID.AsInteger);
        end;
        Next;
      end;
    finally
      Close;
      Open;
      CloseProgressForm;
      EnableControls;
      Locate('ObjID;ID', VarArrayOf([ObjID, ID]), []);
    end;
  end;
end;

procedure TfNewObj.SetFlaf(AFlag : Boolean);
var Old_RecNo : integer;
begin
  with cdsNewObj do
  begin
    DisableControls;
    try
      Old_RecNo := RecNo;
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('flag').AsBoolean := AFlag;
        Post;
        
        Next;
      end;
    finally
      EnableControls;
      RecNo := Old_RecNo;
    end;
  end;
end;
procedure TfNewObj.aSelAllExecute(Sender: TObject);
begin
  SetFlaf(true);
end;

procedure TfNewObj.aUnSelAllExecute(Sender: TObject);
begin
  SetFlaf(false);
end;

procedure TfNewObj.aExitExecute(Sender: TObject);
begin
  if Owner is TForm then
    TForm(Owner).Close;
end;

procedure TfNewObj.aReLinkExecute(Sender: TObject);
var AEObjType : TEObjType;
    Rez : boolean;
begin
  case cdsNewObjObjID.AsInteger of
    2 : AEObjType := eotFin;
  //  3 : AEObjType := eotEQ;
    4 : AEObjType := eotWH;
    5 : AEObjType := eotRepr;
    6 : AEObjType := eotManuf;
    8 : AEObjType := eotGoods;
    else
      AEObjType := eotNone;
  end;
  if AEObjType <> eotNone then
  begin
    Rez := DoReLink(cdsNewObjID.AsInteger, cdsNewObjName.AsString, AEObjType);
  end;
  if Rez then
    cdsNewObj.Delete; 
end;

procedure TfNewObj.fBsnSelector1Button1Click(Sender: TObject);
begin
  fBsnSelector1.Button1Click(Sender);
  aRefresh.Execute;
end;

procedure TfNewObj.aSelOneExecute(Sender: TObject);
begin
  with cdsNewObj do
  begin
    Edit;
    FieldByName('flag').AsBoolean := not FieldByName('flag').AsBoolean;
    Post;
  end;
end;

procedure TfNewObj.aUnSelOneExecute(Sender: TObject);
begin
  with cdsNewObj do
  begin
    Edit;
    FieldByName('flag').AsBoolean := not FieldByName('flag').AsBoolean;
    Post;
  end;

end;

procedure TfNewObj.FilterEditChange(Sender: TObject);
begin
  with cdsNewObj  do
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

procedure TfNewObj.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfNewObj.cdsNewObjFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

end.
