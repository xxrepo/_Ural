unit uWHImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, RxMemDS, ExtCtrls, Grids, DBGrids, ComObj,RXDBCtrl, StdCtrls, Mask, ToolEdit,
  frBsnSelector;

type
  TWHImport = class(TForm)
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1WHName: TStringField;
    RxMemoryData1CatName: TStringField;
    RxMemoryData1WareName: TStringField;
    RxMemoryData1WareShortName: TStringField;
    RxMemoryData1WareCode: TStringField;
    RxMemoryData1MesName: TStringField;
    RxMemoryData1Amount: TFloatField;
    RxMemoryData1id_Ware: TIntegerField;
    RxMemoryData1id_Cat: TIntegerField;
    RxMemoryData1id_WareHouse: TIntegerField;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    FilenameEdit1: TFilenameEdit;
    RxMemoryData1Summ: TFloatField;
    RxMemoryData1Cmnt: TStringField;
    RxMemoryData1id_Mes: TIntegerField;
    fBsnSelector1: TfBsnSelector;
    RxMemoryData1OldAmount: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Initialize;
  end;

var
  WHImport: TWHImport;
procedure ShowWHImport;

implementation

uses foMyFunc, uPrgForm, uDM;

{$R *.DFM}

procedure ShowWHImport;
var F : TWHImport;
begin
  F := TWHImport.Create(nil);
  try
    F.Show;
    F.Repaint;
    F.Initialize;
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;


{ TWHImport }

procedure TWHImport.Initialize;
begin

end;

procedure TWHImport.Button1Click(Sender: TObject);
var
    ExcelApp, DataValues : Variant;
    Workbook, Column, Row, Sheet, Cell1, Cell2, Range : Variant;
    i, j : integer;
    S : String;
    TotalAmount : Double;
    Price, ID_Cur : OLeVariant;
begin
  if fBsnSelector1.ID < 0 then
  begin
    MessageBox(Self.Handle, 'Не выбран бизнес, в который надо импортировать операции.', 'Выберите бизнес', MB_OK + MB_ICONERROR);
    Windows.SetFocus(fBsnSelector1.edName.Handle);
    Exit;
  end;

  if FilenameEdit1.FileName = '' then
  begin
    MessageBox(Self.Handle, 'Не выбран файл данных.', 'Выберите файл', MB_OK + MB_ICONERROR);
    Windows.SetFocus(FilenameEdit1.Handle);
    Exit;
  end;
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.DisplayAlerts := false;
    //ExcelApp.visible := true;
    try
      try Workbook := ExcelApp.WorkBooks.Add(FilenameEdit1.FileName); except end;
      Sheet := ExcelApp.Workbooks[1].WorkSheets[1];

      for i := 0 to RxDBGrid1.Columns.Count - 1 do
      begin
        if (RxDBGrid1.Columns[i].Field.Tag = 0) then
        begin
          RxDBGrid1.Columns[i].Title.Font.Color := clRed;
          RxDBGrid1.Columns[i].Title.Font.Style := [fsBold];
        end;

        for j := 1 to 10 do
        begin
          Cell1 := Sheet.Cells[1, j];
          S := Cell1.value;
          if (S = RxDBGrid1.Columns[i].Title.Caption) and (RxDBGrid1.Columns[i].Field.Tag = 0) then
          begin
            RxDBGrid1.Columns[i].Title.Font.Color := clBlack;
            RxDBGrid1.Columns[i].Title.Font.Style := [fsBold];
            RxDBGrid1.Columns[i].Field.Tag := j;
          end;
        end;

      end;

        RxMemoryData1.Close;
        RxMemoryData1.Open;
      ShowProgressForm(0, -1, -1, 'Идет загрузка данных...');
      for j := 2 to 5000 do
      begin
        RxMemoryData1.Append;

        for i := 0 to RxDBGrid1.Columns.Count - 1 do
        begin
          if (RxDBGrid1.Columns[i].Field.Tag > 0) then
          begin
            Cell1 := Sheet.Cells[j, RxDBGrid1.Columns[i].Field.Tag];
            S := Cell1.value;
            if RxDBGrid1.Columns[i].Field is TStringField then
              RxDBGrid1.Columns[i].Field.Value := trim(S)
            else
              RxDBGrid1.Columns[i].Field.AsFloat := StrToFloatAdv(trim(S));
          end;
        end;
        RxMemoryData1.Post;
        if (RxMemoryData1WHName.AsString = '')
            and (RxMemoryData1WareName.AsString = '') then
        begin
          RxMemoryData1.Delete;
          Break;
        end;

      end;

      with RxMemoryData1 do
      begin
        First;

        while not Eof do
        begin
          ShowProgressForm(0, RecNo, RecordCount, 'Предварительная обработка данных');
          Edit;
          RxMemoryData1id_WareHouse.AsInteger := DM.GetFromBase('wh', RxMemoryData1WHName.AsString, fBsnSelector1.ID);
          RxMemoryData1id_Mes.AsInteger := DM.GetFromBase('mes', RxMemoryData1MesName.AsString, fBsnSelector1.ID);

          RxMemoryData1id_Ware.AsInteger := DM.rsCA.AppServer.DCh_WareGoodsAdd(fBsnSelector1.ID, RxMemoryData1CatName.AsString, RxMemoryData1WareName.AsString, RxMemoryData1id_Mes.AsInteger);
          if DM.PL_GetDefWarePrice(RxMemoryData1id_Ware.AsInteger, Null, Price, ID_Cur, TotalAmount) <> -1 then
          begin
            RxMemoryData1OldAmount.AsFloat := TotalAmount;
          end;
          Post;
          Next;
        end;
      end;
      CloseProgressForm;
      Button2.Enabled := true;

    //  ExcelApp.DisplayAlerts := true;
    //  ExcelApp.Visible := true;
      ExcelApp.Quit;
      ExcelApp := Null;
    except
      ExcelApp.Quit;
      ExcelApp := Null;

    end;

end;

constructor TWHImport.Create(AOwner: TCOmponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);

end;

procedure TWHImport.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

destructor TWHImport.Destroy;
begin
  inherited;

end;

procedure TWHImport.Button2Click(Sender: TObject);
begin
      Button2.Enabled := false;
      with RxMemoryData1 do
      begin
        First;

        while not Eof do
        begin
          ShowProgressForm(0, RecNo, RecordCount, 'Предварительная обработка данных');
          Edit;
          if DM.rsCA.AppServer.DCh_WareAmountAdd(fBsnSelector1.ID, RxMemoryData1id_Ware.AsInteger, RxMemoryData1id_WareHouse.AsInteger, RxMemoryData1id_Mes.AsInteger,
          RxMemoryData1Amount.AsFloat, RxMemoryData1Summ.AsFloat) <> -1 then
          begin
            RxMemoryData1Cmnt.AsString := 'Ok';
          end
          else
            RxMemoryData1Cmnt.AsString := 'ОШИБКА';
          Post;
          Next;
        end;
      end;
      CloseProgressForm;
end;

procedure TWHImport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

end.
