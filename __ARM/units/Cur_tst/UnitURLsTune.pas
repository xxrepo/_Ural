unit UnitURLsTune;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Db, DBGrids, RXDBCtrl, ComCtrls, ToolWin, Menus, ActnList, ImgList,
  DBClient, Provider, ADODB, MtUPDPrv, DualList;

type
  TFormURLsTune = class(TForm)
    ActionList1: TActionList;
    New: TAction;
    Edit: TAction;
    Del: TAction;
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
    N2: TMenuItem;
    N3: TMenuItem;
    DataSourceURLs: TDataSource;
    QueryURLs: TADOQuery;
    RxDBGrid1: TRxDBGrid;
    CDSURLs: TClientDataSet;
    SQLUpdateDSPURLs: TSQLUpdateDSProvider;
    QueryRatesInet: TADOQuery;
    CDSURLsId_URL: TAutoIncField;
    CDSURLsName: TStringField;
    CDSURLsURL: TStringField;
    CDSURLsUseTable: TSmallintField;
    dsQueryRatesInet: TSQLUpdateDSProvider;
    cdsQueryRatesInet: TClientDataSet;
    QueryRatesInetId_URLTable: TAutoIncField;
    QueryRatesInetColName: TSmallintField;
    QueryRatesInetColISO: TSmallintField;
    QueryRatesInetColCode: TSmallintField;
    QueryRatesInetColRate: TSmallintField;
    QueryRatesInetColPieces: TSmallintField;
    cdsQueryRatesInetId_URLTable: TAutoIncField;
    cdsQueryRatesInetColName: TSmallintField;
    cdsQueryRatesInetColISO: TSmallintField;
    cdsQueryRatesInetColCode: TSmallintField;
    cdsQueryRatesInetColRate: TSmallintField;
    cdsQueryRatesInetColPieces: TSmallintField;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NewExecute(Sender: TObject);
    procedure EditExecute(Sender: TObject);
    procedure DelExecute(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure CDSURLsAfterRefresh(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormURLsTune: TFormURLsTune;

implementation

{$R *.DFM}

uses
  Common, Unit1, UnitParser;

procedure TFormURLsTune.FormCreate(Sender: TObject);
begin
  with CDSURLs do
    if not Active then Open;
end;

procedure TFormURLsTune.FormDestroy(Sender: TObject);
begin
  FormURLsTune := nil;
end;

procedure TFormURLsTune.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormURLsTune.NewExecute(Sender: TObject);
begin
  with TFormParser.Create(Form1) do
    begin
    try
      Caption:=(Sender as TAction).Caption;
      Init('', '', -1, -1, -1, -1, -1, -1);
      ShowModal;
    finally
      Free;
      RefreshExecute(Sender);
      end;
    end;
end;

procedure TFormURLsTune.EditExecute(Sender: TObject);
begin
  with TFormParser.Create(Form1) do
  begin
    try
      Caption:=(Sender as TAction).Caption;
      with cdsQueryRatesInet do
      begin
        Close;
        Params.ParamByName('Id_URL').Value:= CDSURLs.FieldByName('Id_URL').AsInteger;
        Open;

        Init(CDSURLs.FieldByName('Name').AsString,
             CDSURLs.FieldByName('URL').AsString,
             CDSURLs.FieldByName('UseTable').AsInteger,
             FieldByName('ColName').AsInteger,
             FieldByName('ColISO').AsInteger,
             FieldByName('ColCode').AsInteger,
             FieldByName('ColPieces').AsInteger,
             FieldByName('ColRate').AsInteger);
      end;
      ShowModal;
    finally
      cdsQueryRatesInet.Close;
      Free;
      RefreshExecute(Sender);
    end;
  end;
end;

procedure TFormURLsTune.DelExecute(Sender: TObject);
begin
  if Application.MessageBox('Удалить данное значение?', 'Внимание',
    mb_OkCancel)=mrOk then
    with CDSURLs do
      begin
      Delete;
      if ApplyUpdates(0)=0 then
        FixIdRefresh(CDSURLs, 'Id_URL')
      else
        begin
        CancelUpdates;
        Application.MessageBox('Изменения не сохранены', 'Ошибка', mb_Ok);
        ModalResult:=mrNone;
        end;
    end;
end;

procedure TFormURLsTune.RefreshExecute(Sender: TObject);
begin
  FixIdRefresh(CDSURLs, 'Id_URL');
end;

procedure TFormURLsTune.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
var Index : TIndexDef;
begin
  if (Field.DataSet as TClientDataSet).IndexName = '' then Exit;
  Index := (Field.DataSet as TClientDataSet).IndexDefs.Find((Field.DataSet as TClientDataSet).IndexName);
  if Index.Fields = Field.FieldName then
    if not (ixDescending in Index.Options) then
      SortMarker := smDown
    else
      SortMarker := smUp;
end;

procedure TFormURLsTune.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
begin
  ReOrderCDS(CDSURLs, Field.FieldName);
end;

procedure TFormURLsTune.FormActivate(Sender: TObject);
var i : integer;
begin
  with ActionList1 do
  for i:=0 to ActionCount-1 do
    (Actions[i] as TAction).Hint:=(Actions[i] as TAction).Caption;
end;

procedure TFormURLsTune.RxDBGrid1DblClick(Sender: TObject);
begin
  if (Sender as TRxDBGrid).DataSource.DataSet.IsEmpty then
    New.Execute
  else
    Edit.Execute;
end;

procedure TFormURLsTune.CDSURLsAfterRefresh(DataSet: TDataSet);
begin
  Edit.Enabled:=not DataSet.IsEmpty;
  Del.Enabled:=not DataSet.IsEmpty;
end;

end.
