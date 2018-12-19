unit frNS;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, Db, DBClient, ImgList, ActnList, StdCtrls,
  ExtCtrls, ComCtrls, ToolWin, Menus, AdvMenus,  TaskDialog;

type
  TfNS = class(TFrame)
    RxDBGrid1: TRxDBGrid;
    dsNS: TDataSource;
    cdsNS: TClientDataSet;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    FilterPanel: TPanel;
    Label1: TLabel;
    FilterEdit: TEdit;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    PopupMenu1: TAdvPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cdsNSid_NS: TAutoIncField;
    cdsNSNSName: TStringField;
    cdsNSdeleted: TBooleanField;
    cdsNSSortID: TIntegerField;
    cdsNSFileNameRules: TStringField;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure dsNSDataChange(Sender: TObject; Field: TField);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aAccCardExecute(Sender: TObject);
    procedure FilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure FilterEditChange(Sender: TObject);
    procedure cdsNSFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    FReadOnly : boolean;
  public
    procedure Initialize;
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses uDM, foMyFunc, uMainForm, uInputBox;

{$R *.DFM}

procedure TfNS.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfNS.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfNS.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfNS.dsNSDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsNS.IsEmpty and not FReadOnly;
  aDel.Enabled := not cdsNS.IsEmpty and not FReadOnly;
 
end;

procedure TfNS.aAddExecute(Sender: TObject);
var
  ID:integer;
  AName, FileNameRules : String;
begin
  ID := -1;
  AName := '';
  FileNameRules := '№[Номер документа] от [Дата документа] [Тип документа] [Продавец]-[Покупатель] + [Тематика]';
  if InputBoxKrm('Бизнес', 'Название бизнеса', 'Формат названия файла', AName, FileNameRules) then
  begin
    ID := DM.rsCA.AppServer.NS_NSEdit(ID, AName, FileNameRules);
    if ID > 0 then
      with cdsNS do
      begin
        Close;
        Open;
        Locate('id_NS', ID, []);

        MainForm.GetBSNList(ID);
      end;
  end;
end;

procedure TfNS.aEditExecute(Sender: TObject);
var
  ID:Variant;
  AName, FileNameRules : String;
begin
  ID := cdsNSid_NS.AsInteger;
  AName := cdsNS.fieldByName('NSName').AsString;
  FileNameRules := cdsNS.fieldByName('FileNameRules').AsString;
  if InputBoxKrm('Бизнес', 'Название бизнеса', 'Формат названия файла', AName, FileNameRules) then
  begin
    if DM.rsCA.AppServer.NS_NSEdit(ID, AName, FileNameRules) > 0 then
      with cdsNS do
      begin
        Close;
        Open;
        Locate('id_NS', ID, []);
      end;
  end;    
end;

procedure TfNS.aDelExecute(Sender: TObject);
var i : integer;
    S : String;
    b : boolean;
begin
  S := 'Удалить бизнес ' + cdsNSNSName.AsString + '?';
  if AdvMessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    try
      DM.rsCA.AppServer.NS_NSDel(cdsNSid_NS.AsInteger);
      if DM.id_NS = cdsNSid_NS.AsInteger then
        MainForm.GetBSNList(cdsNSid_NS.AsInteger);
    finally
      aRefresh.Execute;
    end;
  end;
end;

procedure TfNS.aRefreshExecute(Sender: TObject);
begin
  FixIdRefresh(cdsNS, 'id_NS');
end;

procedure TfNS.aAccCardExecute(Sender: TObject);
begin
//*
end;

constructor TfNS.Create(AOwner: TComponent);
var TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
end;

destructor TfNS.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
  inherited;

end;

procedure TfNS.Initialize;
begin
  cdsNS.Close;
  cdsNS.Params.ParamByName('@id_User').Value := DM.ID_User;
  cdsNS.Open;
end;

procedure TfNS.FilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfNS.FilterEditChange(Sender: TObject);
begin
  with cdsNS do
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

procedure TfNS.cdsNSFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(FieldByName('NSName').AsString)) > 0);
end;

end.
