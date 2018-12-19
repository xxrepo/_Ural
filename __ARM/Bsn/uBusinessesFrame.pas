unit uBusinessesFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, ActnList, Db, DBClient,
  ImgList,
  foMyFunc, Menus, StdCtrls, ExtCtrls;

type
  TBusinessesFrame = class(TFrame)
    DataSource2: TDataSource;
    ImageList: TImageList;
    cdsBusiness2: TClientDataSet;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelBsn: TAction;
    aRefresh: TAction;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    RxDBGrid1: TRxDBGrid;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cdsBsnByFunc: TClientDataSet;
    cdsBsnByFuncid_business: TAutoIncField;
    cdsBsnByFuncId_Currency: TIntegerField;
    cdsBsnByFuncName: TStringField;
    cdsBsnByFuncShortName: TStringField;
    cdsBsnByFuncNum: TStringField;
    cdsBsnByFuncDisabled: TBooleanField;
    cdsBsnByFuncLastUpdated: TBytesField;
    cdsBsnByFuncID_Main: TIntegerField;
    cdsBsnByFuncCurrencyName: TStringField;
    N4: TMenuItem;
    aBsn_DellAll: TAction;
    N5: TMenuItem;
    aUnDel: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelBsnExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure FilterEditChange(Sender: TObject);
    procedure cdsBusiness2AfterOpen(DataSet: TDataSet);
    procedure cdsBusiness2FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure aBsn_DellAllExecute(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure aUnDelExecute(Sender: TObject);
  private
    { Private declarations }
     procedure CheckEmptyDS;
  public
    { Public declarations }
    ReadOnly:boolean;
    procedure Init(AReadOnly:boolean=false; ShowToolBar:boolean=false);
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation
    uses uDM, uNSIDetailFormsAPI, uInputBoxStr, uPrgForm;
{$R *.DFM}
constructor TBusinessesFrame.Create(AOwner:TComponent);
begin
 inherited;
  if Owner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
end;

destructor TBusinessesFrame.Destroy;
begin
  if Owner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
 inherited;
end;

procedure TBusinessesFrame.Init(AReadOnly:boolean=false; ShowToolBar:boolean=false);
begin
  ReadOnly:=AReadOnly;
  ToolBar.Visible:=ShowToolBar;
 if ReadOnly then
  begin
  end;
//  cdsBusiness.Open;
  with cdsBsnByFunc do
  begin
    Close;
    Params.ParamByName('@id_User').Value := Null;//DM.IDUser;
    Params.ParamByName('@UID').Value := Null;
    Open;
  end;
end;

procedure TBusinessesFrame.aAddExecute(Sender: TObject);
var
 ID:Variant;
begin
 ID:=-1;
 if ShowBusinessDetailForm(ID, ReadOnly) then
  begin
   aRefreshExecute(nil);
   DataSource2.Dataset.Locate('id_Business', Id, [loCaseInsensitive]);
   DM.RefrBsnList;
  end
end;

procedure TBusinessesFrame.aEditExecute(Sender: TObject);
var
 ID:Variant;
begin
 ID:=DataSource2.Dataset.FieldByName('id_Business').Value ;
 if ShowBusinessDetailForm(ID, ReadOnly) then
 aRefreshExecute(nil);
 DM.RefrBsnList;
 DataSource2.Dataset.Locate('id_Business', Id, [loCaseInsensitive]);
end;

procedure TBusinessesFrame.aDelBsnExecute(Sender: TObject);
var
 ID:Variant;
 Act:Variant;
begin
 ID:=DataSource2.Dataset.FieldByName('id_Business').Value ;
 if MessageBox(Handle, PChar('Вы действительно хотите скрыть бизнес "' + DataSource2.Dataset.FieldByName('Name').AsString + '"?'), 'Подтвердите действие', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idYes then
    Exit;

    Act:=2;
   DM.rsCA.AppServer.SetBusinessDetail(
    Act,
    Id,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
    );
 aRefreshExecute(nil);
 DM.RefrBsnList;

end;

procedure TBusinessesFrame.aRefreshExecute(Sender: TObject);
 var
  id:Integer;
begin
 with DataSource2.Dataset do
  begin
   id := FieldByName('id_Business').AsInteger;
   Close;
   Open;
   Locate('id_Business', Id, [loCaseInsensitive]);
  end;
end;

procedure TBusinessesFrame.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
{  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').Value then
    begin
      AFont.Color := clGray;
      AFont.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;    }
end;

procedure TBusinessesFrame.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TBusinessesFrame.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TBusinessesFrame.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TBusinessesFrame.FilterEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TBusinessesFrame.FilterEditChange(Sender: TObject);
begin
  with DataSource2.Dataset  do
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

procedure TBusinessesFrame.cdsBusiness2AfterOpen(DataSet: TDataSet);
begin
 CheckEmptyDS;
end;

procedure TBusinessesFrame.CheckEmptyDS;
begin
end;

procedure TBusinessesFrame.cdsBusiness2FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('Name').AsString)) > 0);
end;

procedure TBusinessesFrame.DataSource2DataChange(Sender: TObject;
  Field: TField);
begin
  aEdit.Enabled:= not DataSource2.Dataset.IsEmpty and not ReadOnly;
  aDelBsn.Enabled:= not DataSource2.Dataset.IsEmpty and not ReadOnly and not cdsBsnByFuncDisabled.AsBoolean;
  aUnDel.Enabled:= not DataSource2.Dataset.IsEmpty and not ReadOnly and cdsBsnByFuncDisabled.AsBoolean;
  
  aBsn_DellAll.Enabled:= not DataSource2.Dataset.IsEmpty and not ReadOnly and DM.CheckUserRights(-13, DataSource2.Dataset.FieldByName('id_Business').Value);

end;

procedure TBusinessesFrame.aBsn_DellAllExecute(Sender: TObject);
var
  id_business:Variant;
  Value: Variant;
begin
 id_business:=DataSource2.Dataset.FieldByName('id_Business').Value ;
 if MessageBox(Handle, PChar('Вы действительно хотите стереть бизнес ' + DataSource2.Dataset.FieldByName('Name').AsString + ' без возможности восстановления?'), 'Подтвердите удаление', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) <> idYes then
    Exit;
 if MessageBox(Handle, 'Бизнес и все данные по нему будет невозможно восстановить. Подтвердите удаление?', 'Подтвердите удаление', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) <> idYes then
   Exit;
   Value := '';
  if InputBoxStr(Handle, 'Введите пароль', 'Пароль', Value, -1, '*') then
  begin
   // Value := '';
    if DM.rsCA.AppServer.DoLogin(DM.FUserName, Value) <> 1 then
    begin
      MessageBeep(MB_ICONEXCLAMATION);
      MessageBeep(MB_ICONEXCLAMATION);
      MessageBeep(MB_ICONEXCLAMATION);
      MessageBeep(MB_ICONEXCLAMATION);
      MessageBox(Handle, 'Неверный пароль. Программа будет закрыта', '', MB_OK + MB_ICONSTOP);
      Application.Terminate;
    end
    else
    begin
      DM.Rights_GetUserRights(-13, id_business);
      try    
        Screen.Cursor := crSQLWait;
        ShowProgressForm(Handle, -1, -1, 'Идет удаление бизнеса');
        DM.rsCA.AppServer.Bsn_DellAll(id_business);
      finally
        Screen.Cursor := crDefault; 
        CloseProgressForm;
        aRefreshExecute(nil)
      end;
    end;
  end;
end;

procedure TBusinessesFrame.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;
    

  begin
    if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Disabled').AsBoolean then
    begin
      (Sender as TDBGrid).Canvas.Font.Color := clGray;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsStrikeOut];
    end;
    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TBusinessesFrame.aUnDelExecute(Sender: TObject);
var
 ID:Variant;
 Act:Variant;
begin
 ID:=DataSource2.Dataset.FieldByName('id_Business').Value ;
 if MessageBox(Handle, PChar('Вы действительно хотите восстановить бизнес "' + DataSource2.Dataset.FieldByName('Name').AsString + '"?'), 'Подтвердите восстановление', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idYes then
    Exit;

    Act:=3;
   DM.rsCA.AppServer.SetBusinessDetail(
    Act,
    Id,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
    );
 aRefreshExecute(nil);
 DM.RefrBsnList;

end;

end.
