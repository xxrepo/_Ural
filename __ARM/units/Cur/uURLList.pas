unit uURLList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Db, DBGrids, RXDBCtrl, ComCtrls, ToolWin, Menus, ActnList, ImgList,
  DBClient, Provider, ADODB, MtUPDPrv, DualList;

type
  TURLList = class(TForm)
    ActionList1: TActionList;
    aNew: TAction;
    aEdit: TAction;
    aDel: TAction;
    PopupMenu1: TPopupMenu;
    Action11: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    N1: TMenuItem;
    DelUser1: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Refresh: TAction;
    DataSourceURLs: TDataSource;
    RxDBGrid1: TRxDBGrid;
    cdsURLs: TClientDataSet;
    cdsURLsId_URL: TAutoIncField;
    cdsURLsName: TStringField;
    cdsURLsURL: TStringField;
    cdsURLsUseTable: TSmallintField;
    ilMenu: TImageList;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aNewExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DataSourceURLsDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  URLList: TURLList;

implementation

uses foMyFunc, uDM, uFormApi_CrnAdm;

{$R *.DFM}


procedure TURLList.FormCreate(Sender: TObject);
begin
  with cdsURLs do
    if not Active then Open;
end;

procedure TURLList.FormDestroy(Sender: TObject);
begin
  URLList := nil;
end;

procedure TURLList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TURLList.aNewExecute(Sender: TObject);
var ID : integer;
begin
  ID := -1;
  if ShowParser(ID) then
  begin
    cdsURLs.Close;
    cdsURLs.Open;
    cdsURLs.Locate('id_Url', ID, []);
  end;
end;

procedure TURLList.aEditExecute(Sender: TObject);
var ID : integer;
begin
  ID := cdsURLsId_URL.AsInteger;
  if ShowParser(ID) then
  begin
    cdsURLs.Close;
    cdsURLs.Open;
    cdsURLs.Locate('id_Url', ID, []);
  end;
end;

procedure TURLList.aDelExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Удалить данное значение?', 'Внимание', mb_OkCancel)=mrOk then
  begin
    if DM.rsCA.AppServer.Crn_URLDel(cdsURLsId_URL.AsInteger) > 0 then
    begin
      with CDSURLs do
      begin
        Delete;
      end;
    end
    else
    begin
      MessageBox(Handle, 'Изменения не сохранены', 'Ошибка', mb_Ok);
    end;
  end;
end;

procedure TURLList.RefreshExecute(Sender: TObject);
begin
  FixIdRefresh(CDSURLs, 'Id_URL');
end;

procedure TURLList.FormActivate(Sender: TObject);
var i : integer;
begin
  with ActionList1 do
  for i:=0 to ActionCount-1 do
    (Actions[i] as TAction).Hint:=(Actions[i] as TAction).Caption;
end;

procedure TURLList.DataSourceURLsDataChange(Sender: TObject;
  Field: TField);
begin
  aEdit.Enabled:=not cdsURLs.IsEmpty;
  aDel.Enabled:=not cdsURLs.IsEmpty;
end;

procedure TURLList.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aEdit.Execute;
end;

constructor TURLList.Create(AOwner: TComponent);
begin
  inherited;
  LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);

end;

destructor TURLList.Destroy;
begin
  SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  inherited;
end;

procedure TURLList.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TURLList.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);

end;

end.
