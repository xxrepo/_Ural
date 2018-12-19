unit uURLParser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Buttons, ComCtrls, Grids, ExtCtrls, Db, ADODB,
  ShellAPI, OleCtrls, SHDocVw, DBClient;

type
  THTMLTableItem = class
    TableNum : integer;
    Rows : integer;
    Cols : integer;
    TheCells : TList;
    constructor Create(aTableNum : integer = 0);
    procedure OutputTable(Grid : TStringGrid);
  end;

  TRate = class(TObject)
    Name : string;
    Code : string[3];
    Rate : double;
    Pieces : integer;
    SiteRates : TStringList;
    constructor Create;
  end;

  TFormParser = class(TForm)
    Panel2: TPanel;
    PageControl1: TPageControl;
    tsParse: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bBack: TBitBtn;
    bNext: TBitBtn;
    btnUseIt: TBitBtn;
    StringGrid1: TStringGrid;
    tsStng: TTabSheet;
    Label3: TLabel;
    ComboBox2: TComboBox;
    ListBox1: TListBox;
    Label4: TLabel;
    ComboBox3: TComboBox;
    ListBox2: TListBox;
    Label5: TLabel;
    ComboBox4: TComboBox;
    ListBox3: TListBox;
    Label6: TLabel;
    ComboBox5: TComboBox;
    ListBox4: TListBox;
    Bevel1: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    Panel3: TPanel;
    BitBtnPrev: TBitBtn;
    BitBtnNext: TBitBtn;
    BitBtnFinish: TBitBtn;
    BitBtn5: TBitBtn;
    Label12: TLabel;
    ComboBox1: TComboBox;
    ListBox5: TListBox;
    OpenDialog1: TOpenDialog;
    tsUrl: TTabSheet;
    Panel4: TPanel;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    edUrl: TEdit;
    Panel5: TPanel;
    Label11: TLabel;
    edName: TEdit;
    WebBrowser1: TWebBrowser;
    BitBtn1: TBitBtn;
    cdsURLProp: TClientDataSet;
    cdsURLPropId_URL: TAutoIncField;
    cdsURLPropName: TStringField;
    cdsURLPropURL: TStringField;
    cdsURLPropUseTable: TSmallintField;
    cdsURLPropColName: TIntegerField;
    cdsURLPropColISO: TIntegerField;
    cdsURLPropColCode: TIntegerField;
    cdsURLPropColRate: TIntegerField;
    cdsURLPropColPieces: TIntegerField;
    Memo1: TMemo;
    procedure bBackClick(Sender: TObject);
    procedure bNextClick(Sender: TObject);
    procedure btnUseItClick(Sender: TObject);
    procedure BitBtnNextClick(Sender: TObject);
    procedure BitBtnPrevClick(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BitBtnFinishClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure WebBrowser1NewWindow2(Sender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
    procedure FormCreate(Sender: TObject);
  private
    FIDUrl : integer;

    FTblCnt, FTblNum : integer;
    TheCells : TList;

    Stage : byte;
    Table : THTMLTableItem;

    FURL : string;
    FWasParsed : boolean;
    FTableNum, FColName, FColISO, FColCode, FColPieces, FColRate : integer;
    procedure SetRblNum(ATblNum: integer);
    procedure Init(AName : String; AURL : string; ATableNum, AColName, AColISO, AColCode, AColPieces, AColRate : integer);
  public
    { Public declarations }
    Tables : TList;
    SL : TStringList;
    procedure Initialize(AID : integer);
    function SaveProp: boolean;

    property IDUrl : integer read FIDUrl;
  end;

var
  FormParser: TFormParser;

implementation

{$R *.DFM}

uses WinInet, CrnCommon, uDM, foMyFunc;

const
  vtNone        = 0;
  vtEmpty       = 1;
  vtText        = 2;
  vtTable       = 3;
  vtMixed       = 4;

type
  PHTMLCell = ^THTMLCell;
  THTMLCell = record
    TableNum : integer;
    Row : integer;
    Col : integer;
    ValueType : integer;
    sValue : string;
    iValue : integer;
  end;

//*******************************************************************

constructor TRate.Create;
begin
  inherited;
  SiteRates := TStringList.Create;
end;

//*******************************************************************

constructor THTMLTableItem.Create(aTableNum: integer);
begin
  TableNum := aTableNum;
  Rows := 0;
  Cols := 0;
  TheCells := TList.Create;
end;

procedure WriteToCell(Sender : TStringGrid; ACol, ARow : integer; Value : Variant);
var
  Len: TSize;
begin
  with Sender do
    begin
    Cells[ACol, ARow] := value;
    Win32Check(GetTextExtentPoint32(Canvas.Handle, Pchar(Cells[ACol, ARow]),
      Length(Cells[ACol, ARow]), Len));
    if Len.cx > ColWidths[ACol] then
      ColWidths[ACol] := Len.cx+6;
    end;
end;

procedure TFormParser.WebBrowser1NewWindow2(Sender: TObject;
  var ppDisp: IDispatch; var Cancel: WordBool);
begin
  Cancel := true;
end;

procedure THTMLTableItem.OutputTable(Grid : TStringGrid);
var i, j : integer;
begin
  with Grid do
    begin
    RowCount := Self.Rows;
    ColCount := Self.Cols;
    for i := 0 to ColCount-1 do
      begin
      ColWidths[i] := 10;
      for j := 0 to RowCount-1 do
        Grid.Cells[i, j] := '';
      end;
    end;
  for i := 0 to TheCells.Count-1 do
    if THTMLCell((TheCells.Items[i])^).TableNum = Self.TableNum then
      case THTMLCell((TheCells.Items[i])^).ValueType of
        vtEmpty : ;
        vtText :
          WriteToCell(Grid, THTMLCell((TheCells.Items[i])^).Col-1,
            THTMLCell((TheCells.Items[i])^).Row-1,
            Trim(string(THTMLCell((TheCells.Items[i])^).sValue)));
        vtMixed,
        vtTable :
          WriteToCell(Grid, THTMLCell((TheCells.Items[i])^).Col-1,
            THTMLCell((TheCells.Items[i])^).Row-1,
            'Вложенная таблица # '+IntToStr(THTMLCell((TheCells.Items[i])^).iValue));
        end;
end;

//*******************************************************************

procedure TFormParser.bBackClick(Sender: TObject);
begin
  SetRblNum(FTblNum - 1);
end;

procedure TFormParser.bNextClick(Sender: TObject);
begin
  SetRblNum(FTblNum + 1);
end;

procedure TFormParser.btnUseItClick(Sender: TObject);
begin
  if FWasParsed then
  begin
    FTableNum := FTblNum;
    btnUseIt.Enabled := false;
  end
  else
    MessageBox(Handle, 'Данная таблица не поддается разбору и не может быть использована', 'Ошибка', MB_OK + MB_ICONERROR);
end;

procedure TFormParser.BitBtnNextClick(Sender: TObject);
var AllowChange : boolean;
begin
  if PageControl1.ActivePage = tsUrl then
  begin
    AllowChange := Trim(edUrl.Text) <> '';
    if not AllowChange then
    begin
      MessageBox(Handle, 'Не указан адрес', 'Ошибка', MB_OK + MB_ICONERROR);
      SendMessage(edUrl.Handle, WM_SETFOCUS, 0, 0)
    end;
  end
  else
    if PageControl1.ActivePage = tsParse then
    begin
      AllowChange := (FTableNum = FTblNum) and (not btnUseIt.Enabled);
      if not AllowChange then
      begin
        MessageBox(Handle, 'Не выбрана таблица с курсами', 'Ошибка', MB_OK + MB_ICONERROR);
        SendMessage(btnUseIt.Handle, WM_SETFOCUS, 0, 0)
      end;
    end
    else
      if PageControl1.ActivePage = tsStng then
      begin
        AllowChange := not btnUseIt.Enabled;
      end;
  if AllowChange then
  begin
    PageControl1.ActivePageIndex := PageControl1.ActivePageIndex + 1;
    PageControl1Change(nil);
  end;
end;

procedure TFormParser.BitBtnPrevClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := PageControl1.ActivePageIndex - 1;
  PageControl1Change(nil);
end;

procedure TFormParser.ComboBox1Change(Sender: TObject);
var i : integer;
begin
  ListBox5.Clear;
  if ComboBox1.ItemIndex = -1 then
    Exit;
  for i := 2 to StringGrid1.RowCount do
    ListBox5.Items.Add(StringGrid1.Cells[ComboBox1.ItemIndex, i-1]);
  FColName := ComboBox1.ItemIndex+1;
end;

procedure TFormParser.ComboBox2Change(Sender: TObject);
var i : integer;
begin
  ListBox1.Clear;
  if ComboBox2.ItemIndex = -1 then
    Exit;
  for i := 2 to StringGrid1.RowCount do
    ListBox1.Items.Add(StringGrid1.Cells[ComboBox2.ItemIndex, i-1]);
  FColISO := ComboBox2.ItemIndex+1;
end;

procedure TFormParser.ComboBox3Change(Sender: TObject);
var i : integer;
begin
  ListBox2.Clear;
  if ComboBox3.ItemIndex = -1 then
    Exit;
  for i := 2 to StringGrid1.RowCount do
    ListBox2.Items.Add(StringGrid1.Cells[ComboBox3.ItemIndex, i-1]);
  FColCode := ComboBox3.ItemIndex+1;
end;

procedure TFormParser.ComboBox4Change(Sender: TObject);
var i : integer;
begin
  ListBox3.Clear;
  if ComboBox4.ItemIndex = -1 then
    Exit;
  for i := 2 to StringGrid1.RowCount do
    ListBox3.Items.Add(StringGrid1.Cells[ComboBox4.ItemIndex, i-1]);
  FColPieces := ComboBox4.ItemIndex+1;
end;

procedure TFormParser.ComboBox5Change(Sender: TObject);
var i : integer;
begin
  ListBox4.Clear;
  if ComboBox5.ItemIndex = -1 then
    Exit;
  for i := 2 to StringGrid1.RowCount do
    ListBox4.Items.Add(StringGrid1.Cells[ComboBox5.ItemIndex, i-1]);
  FColRate := ComboBox5.ItemIndex+1;
end;

procedure TFormParser.PageControl1Change(Sender: TObject);
var i : integer;
begin
  BitBtnPrev.Enabled := PageControl1.ActivePageIndex > 0;
  BitBtnNext.Visible := PageControl1.ActivePageIndex < PageControl1.PageCount - 1;

  if PageControl1.ActivePage <> nil then
    Caption := 'Настройка загрузки курсов валют - ' + PageControl1.ActivePage.Caption + ' (шаг ' + IntToStr(PageControl1.ActivePageIndex + 1) + ' из ' + IntToStr(PageControl1.PageCount) + ')'
  else
    Caption := '';

  if PageControl1.ActivePage = tsStng then
  begin
    with ComboBox1 do
    begin
      Clear;
      for i := 0 to StringGrid1.ColCount-1 do
        Items.Add(StringGrid1.Cells[i, 0]);
      DropDownCount := Items.Count;
      ItemIndex := FColName-1;
      OnChange(Sender);
    end;
    with ComboBox2 do
    begin
      Clear;
      Items.AddStrings(ComboBox1.Items);
      DropDownCount := Items.Count;
      ItemIndex := FColISO-1;
      OnChange(Sender);
    end;
    with ComboBox3 do
    begin
      Clear;
      Items.AddStrings(ComboBox1.Items);
      DropDownCount := Items.Count;
      ItemIndex := FColCode-1;
      OnChange(Sender);
    end;
    with ComboBox4 do
    begin
      Clear;
      Items.AddStrings(ComboBox1.Items);
      DropDownCount := Items.Count;
      ItemIndex := FColPieces-1;
      OnChange(Sender);
    end;
    with ComboBox5 do
    begin
      Clear;
      Items.AddStrings(ComboBox1.Items);
      DropDownCount := Items.Count;
      ItemIndex := FColRate-1;
      OnChange(Sender);
    end;
  end;
end;

procedure TFormParser.BitBtnFinishClick(Sender: TObject);
begin
  ModalResult := mrNone;
  if Trim(edName.Text)='' then
  begin
    MessageBox(Handle, 'Не указано название ресурса', 'Ошибка', MB_OK + MB_ICONERROR);
    edName.SetFocus;
  end
  else
    if ComboBox1.ItemIndex=-1 then
    begin
      MessageBox(Handle, 'Не выбран столбец для параметра', 'Ошибка', MB_OK + MB_ICONERROR);
      ComboBox1.SetFocus;
      Exit;
    end
    else
      if ComboBox2.ItemIndex=-1 then
      begin
        MessageBox(Handle, 'Не выбран столбец для параметра', 'Ошибка', MB_OK + MB_ICONERROR);
        ComboBox2.SetFocus;
      end
      else
        if ComboBox3.ItemIndex=-1 then
        begin
          MessageBox(Handle, 'Не выбран столбец для параметра', 'Ошибка', MB_OK + MB_ICONERROR);
          ComboBox3.SetFocus;
        end
        else
        if ComboBox4.ItemIndex=-1 then
        begin
          MessageBox(Handle, 'Не выбран столбец для параметра', 'Ошибка', MB_OK + MB_ICONERROR);
          ComboBox4.SetFocus;
        end
        else
          if ComboBox5.ItemIndex=-1 then
          begin
            MessageBox(Handle, 'Не выбран столбец для параметра', 'Ошибка', MB_OK + MB_ICONERROR);
            ComboBox5.SetFocus;
          end
          else
          if (ComboBox1.ItemIndex = ComboBox2.ItemIndex)
              or (ComboBox1.ItemIndex = ComboBox3.ItemIndex)
              or (ComboBox1.ItemIndex = ComboBox4.ItemIndex)
              or (ComboBox2.ItemIndex = ComboBox5.ItemIndex)

              or (ComboBox2.ItemIndex = ComboBox3.ItemIndex)
              or (ComboBox2.ItemIndex = ComboBox4.ItemIndex)
              or (ComboBox2.ItemIndex = ComboBox5.ItemIndex)

              or (ComboBox3.ItemIndex = ComboBox4.ItemIndex)
              or (ComboBox3.ItemIndex = ComboBox5.ItemIndex)

              or (ComboBox4.ItemIndex = ComboBox5.ItemIndex) then
            MessageBox(Handle, 'Выбраны одинаковые столбцы для разных параметров', 'Ошибка', MB_OK + MB_ICONERROR)
          else
          begin
        {    with sp_AddURL, Parameters do
            begin
              ParamByName('@Name').Value := edName.Text;
              ParamByName('@URL').Value := FURL;
              ParamByName('@UseTable').Value := FTableNum;

              ParamByName('@ColName').Value := FColName;
              ParamByName('@ColISO').Value := FColISO;
              ParamByName('@ColCode').Value := FColCode;
              ParamByName('@ColPieces').Value := FColPieces;
              ParamByName('@ColRate').Value := FColRate;
              ExecProc;
            end; }
            ModalResult := mrOk;
      //      MessageBox(Handle, 'Данные успешно сохранены', 'Внимание', MB_OK + MB_ICONINFORMATION);
          end;
end;

procedure TFormParser.SpeedButton1Click(Sender: TObject);
begin
  if Trim(edUrl.Text)='' then
    MessageBox(Handle, 'Не указан URL', 'Ошибка', MB_OK + MB_ICONERROR)
  else
  begin
 //   Init(Trim(Edit3.Text), FTableNum, FColName, FColISO, FColCode, FColPieces, FColRate);
  //  ShowHTMLText(WebBrowser1, SL.Text);
    WebBrowser1.Navigate(URLWithDate(Trim(edUrl.Text), Date));
  end;
end;

procedure TFormParser.Init(AName : String; AURL: string; ATableNum, AColName, AColISO, AColCode, AColPieces, AColRate : integer);
var S : String;
begin
  edName.Text := AName;
  SL := TStringList.Create;
  FURL := AURL;
  edUrl.Text := FURL;
  FTableNum := ATableNum;
  FColName := AColName;
  FColISO := AColISO;
  FColCode := AColCode;
  FColPieces := AColPieces;
  FColRate := AColRate;
  
  if FURL <> '' then
  begin
    S := URLWithDate(FURL, Date);
    WebBrowser1.Navigate(S);
    if GetInetHTMLFile(S, SL) then
    begin
      FTblCnt := GetTableCountFromHTMLFile(SL);
      FTblNum := 0;
      if FTableNum <> -1 then
      begin
        SetRblNum(FTableNum);
        btnUseIt.Enabled := FTableNum <> FTblNum;
      end
      else
        SetRblNum(0);

      ComboBox1.ItemIndex := FColName - 1;
      ComboBox2.ItemIndex := FColISO - 1;
      ComboBox3.ItemIndex := FColCode - 1;
      ComboBox4.ItemIndex := FColPieces - 1;
      ComboBox5.ItemIndex := FColRate - 1;
    end
    else
      raise Exception.Create('Невозможно прочитать страницу с адресом ' + S);
  end;
end;

procedure TFormParser.SetRblNum(ATblNum: integer);
var i, j : integer;
  ColCount, RowCount : integer;
  V : Variant;
begin
  btnUseIt.Enabled := true;
  if (ATblNum > 0) and (ATblNum <= FTblCnt) then
  begin
    FTblNum := ATblNum;
    FWasParsed := OutputTable(SL, FTblNum, StringGrid1);
  end;
  bNext.Enabled := FTblNum < FTblCnt;
  bBack.Enabled := FTblNum > 1;
  Label1.Caption := 'Таблица ' + IntToStr(ATblNum) + ' из ' + IntToStr(FTblCnt);
  Label1.Visible := true;
end;

procedure TFormParser.FormDestroy(Sender: TObject);
begin
  SL.Free;
end;

procedure TFormParser.BitBtn1Click(Sender: TObject);
begin
  Init(Trim(edName.Text), Trim(edUrl.Text), FTableNum, FColName, FColISO, FColCode, FColPieces, FColRate);
end;

procedure TFormParser.FormCreate(Sender: TObject);
var i : integer;
begin
  FWasParsed := false;
  for i := 0 to PageControl1.PageCount - 1 do
    PageControl1.Pages[i].TabVisible := false;
  PageControl1.ActivePage := tsUrl;
  PageControl1Change(nil);
end;

procedure TFormParser.Initialize(AID: integer);
begin
  FIDUrl := AID;
  with cdsURLProp do
  begin
    Params.ParamByName('@id_Url').Value := FIDUrl;
    Open;
    try
      Init(FieldByName('Name').AsString,
           FieldByName('URL').AsString,
           FieldByName('UseTable').AsInteger,
           FieldByName('ColName').AsInteger,
           FieldByName('ColISO').AsInteger,
           FieldByName('ColCode').AsInteger,
           FieldByName('ColPieces').AsInteger,
           FieldByName('ColRate').AsInteger);
    finally
      Close;
    end;
  end;
end;

function TFormParser.SaveProp: boolean;
var OldCursor : TCursor;
    AName, URL: OleVariant;
    UseTable, ColName, ColISO, ColCode, ColRate, ColPieces: Integer;
begin
  AName := edName.Text;
  URL := FURL;
  UseTable := FTableNum;
  ColName := FColName;
  ColISO := FColISO;
  ColCode := FColCode;
  ColRate := FColPieces;
  ColPieces := FColRate;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;

  BeginTruns(DM.rsCA);
  try
    if FIDUrl = -1 then // Добавляется
    begin
      FIDUrl := DM.rsCA.AppServer.Crn_URLAdd(AName, URL, UseTable, ColName, ColISO, ColCode, ColRate, ColPieces);
      if FIDUrl = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    end
    else
    begin
      if DM.rsCA.AppServer.Crn_URLEdit(FIDUrl, AName, URL, UseTable, ColName, ColISO, ColCode, ColRate, ColPieces) <> 1 then
        raise Exception.Create('Ошибка при сохранении свойств');
    end;

    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;
end;

end.
