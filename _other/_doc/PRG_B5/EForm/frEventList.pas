unit frEventList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, ADODB, ActnList, ImgList, foMyFunc, ShellApi, Grids,
  DBGrids, RXDBCtrl, ComCtrls, ToolWin, Menus, {$IFDEF VER150} Variants,{$ENDIF} StdCtrls, AdvMenus,
  AdvToolBar;

type
  TfEventList = class(TFrame)
    qryEvent: TADOQuery;
    dsFile: TDataSource;
    ImageList: TImageList;
    ActionList1: TActionList;
    aAddEvent: TAction;
    aEditEvent: TAction;
    aDelEvent: TAction;
    ToolBar3: TToolBar;
    ToolButton15: TToolButton;
    ToolButton17: TToolButton;
    ToolButton25: TToolButton;
    RxDBGrid3: TRxDBGrid;
    pmFile: TAdvPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem6: TMenuItem;
    N1: TMenuItem;
    SaveDialog1: TSaveDialog;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    aVizaSet: TAction;
    aVizaUnSet: TAction;
    N2: TMenuItem;
    Button1: TButton;
    qryEventid_Event: TIntegerField;
    qryEventID_DOCBASE: TIntegerField;
    qryEventDateCreate: TDateTimeField;
    qryEventEventComment: TStringField;
    qryEventID_USER: TIntegerField;
    qryEventFIO: TStringField;
    qryEventDTName: TStringField;
    aRefreshe: TAction;
    qryEventid_EventType: TIntegerField;
    qryEventevent_deleted: TIntegerField;
    AdvDockPanel1: TAdvDockPanel;
    ToolBar2: TAdvToolBar;
    AdvToolBarButton1: TAdvToolBarButton;
    AdvToolBarButton2: TAdvToolBarButton;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    AdvToolBarSeparator2: TAdvToolBarSeparator;
    AdvToolBarButton3: TAdvToolBarButton;
    AdvToolBarSeparator3: TAdvToolBarSeparator;
    AdvToolBarButton4: TAdvToolBarButton;
    aExcel: TAction;
    Excel1: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure aAddEventExecute(Sender: TObject);
    procedure aEditEventExecute(Sender: TObject);
    procedure aDelEventExecute(Sender: TObject);
    procedure dsFileDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure aToBuffExecute(Sender: TObject);
    procedure aVizaSetExecute(Sender: TObject);
    procedure aVizaUnSetExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure aExcelExecute(Sender: TObject);
  private
    Fid_DocBase : integer;
    ASort : String;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;

    procedure EditEvent(id_Event, id_DocBase : integer);
    procedure Initialize(Aid_DocBase : integer);
    procedure CloseAll;
  end;

implementation

uses uDM, uInputQuery_File, uEventProp, foMyFuncEhExcel;

{$R *.dfm}

{ TfByObjFileList }

procedure TfEventList.CloseAll;
begin
  qryEvent.Close
end;

procedure TfEventList.Initialize(Aid_DocBase: integer);
var XXX : integer;
begin
  Fid_DocBase := Aid_DocBase;

  
  with qryEvent do
  begin
    Close;
    Parameters.ParamByName('id_DocBase').Value := Fid_DocBase;
    Open;
  end;
  aAddEvent.Enabled := (Fid_DocBase > 0);
end;

procedure TfEventList.aAddEventExecute(Sender: TObject);
begin
  EditEvent(-1, Fid_DocBase);
end;

procedure TfEventList.EditEvent(id_Event, id_DocBase : integer);
begin
  if ShowEventProp(id_Event, id_DocBase) then
  begin
      dsFile.DataSet.Close;
      dsFile.DataSet.Open;
      dsFile.DataSet.locate('id_Event', id_Event, [loCaseInsensitive, loPartialKey]);
  end;
end;


procedure TfEventList.aEditEventExecute(Sender: TObject);
var id_Event : integer;
begin
  EditEvent(dsFile.DataSet.fieldbyname('id_Event').AsInteger, Fid_DocBase);
end;

procedure TfEventList.aDelEventExecute(Sender: TObject);
var S : String;
    XXX : integer;
begin

  if MessageBox(Handle, PChar('Удалить событие "' + dsFile.DataSet.FieldByName('DTNAME').AsString + '"?'), ' ', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    begin
      DM.ExecSQL('exec DW_EVENT_DEL ' + IntToStr(dsFile.DataSet.fieldbyname('id_Event').AsInteger));
      dsFile.DataSet.Close;
      dsFile.DataSet.Open;
    end;
  end;
end;

procedure TfEventList.dsFileDataChange(Sender: TObject; Field: TField);
begin
  aExcel.Enabled := not dsFile.DataSet.IsEmpty;
  aEditEvent.Enabled := not dsFile.DataSet.IsEmpty;
  aDelEvent.Enabled := not dsFile.DataSet.IsEmpty;// and dsFile.DataSet.FieldByName('CheckDate').IsNull;
end;

procedure TfEventList.RxDBGrid3DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEditEvent.Execute;
end;

constructor TfEventList.Create(AOwner: TComponent);
var TmpOwner: TCustomForm;
begin
  inherited;           
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid3, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName + Owner.ClassName);
  end;
end;

destructor TfEventList.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid3, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName + Owner.ClassName);
  end;
  inherited;
end;

procedure TfEventList.aToBuffExecute(Sender: TObject);
begin
//*
end;

procedure TfEventList.aVizaSetExecute(Sender: TObject);
begin
{  if MessageBox(Handle, PChar('Утвердить "' + dsFile.DataSet.FieldByName('Name').AsString + '"?'), 'Подтвердите утверждение', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  if DM.SetViza(FEObjType, dsFile.DataSet.FieldByName('id_File').AsInteger, true, true) then
  begin
    TADOQuery(dsFile.DataSet).Close;
    TADOQuery(dsFile.DataSet).Open;
  end;}
end;

procedure TfEventList.aVizaUnSetExecute(Sender: TObject);
begin
 { if MessageBox(Handle, PChar('Снять утверждение с "' + dsFile.DataSet.FieldByName('Name').AsString + '"?'), 'Подтвердите снятие утверждения', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  if DM.SetViza(FEObjType, dsFile.DataSet.FieldByName('id_File').AsInteger, false, true) then
  begin
    TADOQuery(dsFile.DataSet).Close;
    TADOQuery(dsFile.DataSet).Open;
  end;}
end;

procedure TfEventList.aRefresheExecute(Sender: TObject);
var id_Event : integer;
begin
  id_Event := dsFile.DataSet.fieldbyname('id_Event').AsInteger;
      dsFile.DataSet.Close;
      dsFile.DataSet.Open;
      dsFile.DataSet.locate('id_Event', id_Event, [loCaseInsensitive, loPartialKey]);
end;

procedure TfEventList.aExcelExecute(Sender: TObject);
begin
  foMyFunc.GreedToExcel(RxDBGrid3, 'Список событий', false);

end;

end.
