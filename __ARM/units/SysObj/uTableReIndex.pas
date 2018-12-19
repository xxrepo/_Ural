unit uTableReIndex;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, RxMemDS, Grids, DBGrids, RXDBCtrl, ImgList;

type
  TTableReIndex = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1TableName: TStringField;
    RxMemoryData1ScanDensity: TFloatField;
    RxMemoryData1Check: TBooleanField;
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    RxMemoryData1TableDescr: TStringField;
    ilMenu: TImageList;
    procedure btnOkClick(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1CellClick(Column: TColumn);
  private
    procedure GetCONTIG;
    { Private declarations }
  public
    procedure Initialize;
  end;

var
  TableReIndex: TTableReIndex;
procedure ShowTableReIndex;

implementation

uses uDM, uPrgForm;

{$R *.DFM}

procedure ShowTableReIndex;
var F : TTableReIndex;
begin
  F := TTableReIndex.Create(nil);
  try
    F.Initialize;
    F.ShowModal;

  finally
    F.Free;
  end;
end;

{ TTableReIndex }

  procedure TTableReIndex.GetCONTIG;
  var V : OleVariant;
  begin
    try
      with RxMemoryData1 do
      begin
        First;
        while not Eof do
        begin
          ShowProgressForm(Handle, ReCNo, RecordCount, 'Проверка таблиц...');
          Edit;
          try
            V := DM.rsCA.AppServer.SHOWCONTIG(RxMemoryData1TableName.AsString);
            RxMemoryData1ScanDensity.AsVariant := 100.0 - V;
            RxMemoryData1Check.AsBoolean := RxMemoryData1ScanDensity.AsFloat > 0;
          finally
            Post;
          end;
          Next;
        end;
      end;
    finally
      CloseProgressForm;
    end;
  end;

procedure TTableReIndex.Initialize;


  procedure AddTableData(AName, ADescr : String);
  begin
    with RxMemoryData1 do
    begin
      if not Active then Open;
      Append;
      try
        RxMemoryData1TableName.AsString := AName;
        RxMemoryData1TableDescr.AsString := ADescr;

      finally
        Post;
      end;
    end;

  end;
begin
  RxMemoryData1.Close;
  try
    AddTableData('op_Oper2', 'Операции');
    AddTableData('op_OperWare', 'Операции - перечень товаров');
    AddTableData('PL_Goods', 'Товары');
    AddTableData('PL_ctg_Goods', 'Категории товаров');
    AddTableData('CA_Repr', 'Представители');
    AddTableData('CA_ContrAgent', 'Контрагенты');
    AddTableData('Acc_Acc', 'Счета');
    AddTableData('WH_WareHouse', 'Склады');
    AddTableData('MN_Manufact', 'Производства');
    GetCONTIG;
  finally
   // CloseProgressForm;
  end;
end;

procedure TTableReIndex.btnOkClick(Sender: TObject);
begin
  try
    with RxMemoryData1 do
    begin
      First;
      while not Eof do
      begin
        ShowProgressForm(Handle, ReCNo, RecordCount, 'Переиндексация таблиц...');
        if RxMemoryData1Check.AsBoolean then
          DM.rsCA.AppServer.DBREINDEX(RxMemoryData1TableName.AsString);
        Next;
      end;
    end;
    GetCONTIG;
    MessageBox(Handle, 'Переиндексация таблиц завершена', '', MB_OK);
  finally
    CloseProgressForm;
  end;
end;

procedure TTableReIndex.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;

  if Column.Field = RxMemoryData1Check then
  begin
    if RxMemoryData1Check.AsBoolean then
      ImgIndex := 0
    else
      ImgIndex := -1;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    ilMenu.Draw(TDBGrid(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
  end
  else
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TTableReIndex.RxDBGrid1CellClick(Column: TColumn);
begin
  if Column.Index = 0 then
  begin
    with RxMemoryData1 do
    begin
      Edit;
      FieldByName('Check').AsBoolean := not FieldByName('Check').AsBoolean;
      Post;
    end;
  end;
end;

end.
