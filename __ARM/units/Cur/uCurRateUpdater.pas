unit uCurRateUpdater;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Db, DBGrids, RXDBCtrl, ComCtrls, ToolWin, Menus, ActnList, ImgList,
  DBClient, Provider, ADODB, StdCtrls, Mask, ToolEdit, MtUPDPrv, ExtCtrls,
  RxMemDS, frBsnSelector;

type
  TRate = class
  private
    FChecked : boolean;
    FNewRate : Variant;
    function GetChRate: boolean;
    function GetNewRate: Variant;
    procedure SetNewRate(const Value: Variant);
    procedure SetChecked(const Value: boolean);
  public
    Id_Currency : Variant;
    Name : string;
    ShortName : String;
    ISOCode : string;
    NumberCode : string;
    Pieces : integer;
    Rate : Variant;
    FastAccess : boolean;
    AvForPay : boolean;
    SiteRates : TStringList;
    constructor Create;
    destructor Destoy; //override;
    property ChRate : boolean read GetChRate;
    property NewRate : Variant read GetNewRate write SetNewRate;
    property Checked : boolean read FChecked write SetChecked;
  end;

  TCurRateUpdater = class(TForm)
    ActionList1: TActionList;
    aEditRate: TAction;
    PopupMenu1: TPopupMenu;
    Action11: TMenuItem;
    ImageList1: TImageList;
    N1: TMenuItem;
    DelUser1: TMenuItem;
    cdsRate: TClientDataSet;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    aReadSites: TAction;
    N4: TMenuItem;
    cdsUrl: TClientDataSet;
    cdsUrlId_URL: TAutoIncField;
    cdsUrlName: TStringField;
    cdsUrlURL: TStringField;
    cdsUrlColName: TSmallintField;
    cdsUrlColISO: TSmallintField;
    cdsUrlColCode: TSmallintField;
    cdsUrlColRate: TSmallintField;
    cdsUrlColPieces: TSmallintField;
    cdsUrlUseTable: TSmallintField;
    cdsRateId_Currency: TIntegerField;
    cdsRateName: TStringField;
    cdsRateISOCode: TStringField;
    cdsRateNumberCode: TStringField;
    cdsRateValue: TIntegerField;
    cdsRateRate: TFloatField;
    cdsRateid_URL: TIntegerField;
    cdsRateNewRate: TFloatField;
    StringGridRates: TStringGrid;
    aExit: TAction;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    aSelectAll: TAction;
    aUnSelectAll: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    cdsRateShortName: TStringField;
    cdsRateAvForPay: TBooleanField;
    cdsRateFastAccess: TBooleanField;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    fBsnSelector1: TfBsnSelector;
    procedure FormActivate(Sender: TObject);
    procedure aEditRateExecute(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure aReadSitesExecute(Sender: TObject);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgRezDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure StringGridRatesDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure aExitExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aUnSelectAllExecute(Sender: TObject);
    procedure StringGridRatesMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure StringGridRatesKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure StringGridRatesClick(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
  private
    Val : Variant;
    procedure CloneCDSRec(SrcCDS, DestCDS: TClientDataSet);
    procedure RefresheStringGrid;
    procedure SetChecked(AFlag: boolean);
    procedure UpdateOkBtn;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Init;
    function SaveProp: boolean;
  end;

var
  CurRateUpdater: TCurRateUpdater;

implementation

{$R *.DFM}

uses
  foMyFunc, uDM, CrnCommon;

procedure TCurRateUpdater.FormActivate(Sender: TObject);
var i : integer;
    RObj : TRate;
begin
  if (Val <> Null) and (Val > -1) then
    fBsnSelector1.ID := Val;
  for i:=0 to ActionList1.ActionCount-1 do
    begin
    (ActionList1.Actions[i] as TAction).Hint:=
      (ActionList1.Actions[i] as TAction).Caption;
    ShowHint:=True;
    end;

  StringGridRates.ColCount := 7;
  StringGridRates.ColWidths[0] := 25;

  WriteToCell(StringGridRates, 0, 0, '   ');
  WriteToCell(StringGridRates, 1, 0, 'Наименование');
  WriteToCell(StringGridRates, 2, 0, 'ISO');
  WriteToCell(StringGridRates, 3, 0, 'Цифр. код');
  WriteToCell(StringGridRates, 4, 0, 'Единиц к обмену');
  WriteToCell(StringGridRates, 5, 0, 'Тек. курс');
  WriteToCell(StringGridRates, 6, 0, 'Новый курс');

  with CDSRate do
  begin
    Params.ParamByName('@id_Bsn').Value := fBsnSelector1.ID;
    if not Active then Open;
    StringGridRates.RowCount := RecordCount + 1;
    First;
    i := 1;
    while not Eof do
    begin
      RObj := TRate.Create;

    //  StringGridRates.RowCount := StringGridRates.RowCount + 1;
      StringGridRates.Objects[0, i] := RObj;

      RObj.Id_Currency := cdsRateId_Currency.AsInteger;
      RObj.Name := cdsRateName.AsString;
      RObj.ShortName := cdsRateShortName.AsString;
      RObj.ISOCode := UpperCase(cdsRateISOCode.AsString);
      RObj.NumberCode := cdsRateNumberCode.AsString;
      RObj.Pieces := cdsRateValue.AsInteger;
      RObj.Rate := cdsRate.FieldByName('Rate').AsFloat;

      RObj.FastAccess := cdsRateFastAccess.AsBoolean;
      RObj.AvForPay := cdsRateAvForPay.AsBoolean;
      Next;
      Inc(i);
    end;
  end;
  RefresheStringGrid;
end;

procedure TCurRateUpdater.aEditRateExecute(Sender: TObject);
var Val : String;
begin
  Val := VarToStr(TRate(StringGridRates.Objects[0, StringGridRates.Row]).NewRate);
  if InputBoxKrm('Курс валюты ' + TRate(StringGridRates.Objects[0, StringGridRates.Row]).Name, 'Курс', Val, [], True) then
  begin
    if Val = '' then
      TRate(StringGridRates.Objects[0, StringGridRates.Row]).NewRate := Null
    else
      TRate(StringGridRates.Objects[0, StringGridRates.Row]).NewRate := StrToFloatAdv(Val);
    RefresheStringGrid;
    UpdateOkBtn;
  end;
end;

procedure TCurRateUpdater.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
var Index : TIndexDef;
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TCurRateUpdater.RxDBGrid1DblClick(Sender: TObject);
begin
  aEditRate.Execute;
end;

procedure TCurRateUpdater.aReadSitesExecute(Sender: TObject);
begin
  if fBsnSelector1.ID = -1 then
  begin
    MessageBox(Handle, 'Не выбран бизнес. Обновление курсов не возможно!', 'Сначала выберите бизнес', MB_ICONWARNING + MB_OK);
    Exit;
  end;
  Init;
end;

procedure TCurRateUpdater.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TCurRateUpdater.CloneCDSRec(SrcCDS, DestCDS : TClientDataSet);
var i : integer;
    Fld : TField;
begin
  with DestCDS do
  begin
    Append;
    for i := 0 to Fields.Count - 1 do
    begin
      Fld := SrcCDS.FindField(Fields[i].FieldName);
      if Fld <> nil then
        Fld.Value := Fields[i].Value;
    end;
    Post;
  end;
end;

procedure TCurRateUpdater.Init;
var S : String;
    AURLParser : TURLParser;
    V : Variant;
    ColCount, RowCount, i, j, ID : integer;
    RObj : TRate;
begin
  if (Val <> Null) and (Val > -1) then
    fBsnSelector1.ID := Val;
  StringGridRates.ColCount := 7;
  AURLParser := TURLParser.Create;
  cdsRate.DisableControls;
  try
    with cdsUrl do
    begin
      Close;
      Params.ParamByName('@id_Bsn').Value := fBsnSelector1.ID;
      Open;
      First;
      while not Eof do
      begin
        try
          S := URLWithDate(cdsUrlURL.AsString, Date);
          if AURLParser.SetURL(S) then
          begin
            V := AURLParser.VarTableByNumFromHTMLFile_2(cdsUrlUseTable.AsInteger);
            if VarType(V) <> varNull then // Таблица курсов получена
            begin
              StringGridRates.ColCount := StringGridRates.ColCount + 1;
              WriteToCell(StringGridRates, StringGridRates.ColCount - 1, 0, cdsUrlName.AsString);
              RowCount := VarArrayHighBound(V, 1);
//              ColCount := VarArrayHighBound(V, 2);
              for i := 1 to RowCount do
              begin
                S := UpperCase(VarToStr(V[i, cdsUrlColISO.AsInteger - 1]));
                RObj := nil;
                for j := 0 to StringGridRates.RowCount - 1 do
                begin
                  if StringGridRates.Objects[0, j] is TRate then
                  begin
                    if Pos(S, TRate(StringGridRates.Objects[0, j]).ISOCode) > 0 then
                    begin
                      RObj := TRate(StringGridRates.Objects[0, j]);
                      Break;
                    end;
                  end;
                end;
                if RObj = nil then
                begin
                  RObj := TRate.Create;

                  StringGridRates.RowCount := StringGridRates.RowCount + 1;
                  StringGridRates.Objects[0, StringGridRates.RowCount - 1] := RObj;
                end;
                RObj.SiteRates.Add(V[i, cdsUrlColRate.AsInteger - 1]);

//                if cdsRate.Locate('NumberCode', ID, [loCaseInsensitive, loPartialKey]) then // Нашли такую валюту
                if cdsRate.Locate('ISOCode', S, [loCaseInsensitive, loPartialKey]) then // Нашли такую валюту
                begin
                  if cdsRate.FieldByName('id_URL').Value = cdsUrl.FieldByName('id_URL').Value then
                  begin
                {    RObj.Id_Currency := cdsRateId_Currency.AsInteger;
                    RObj.Name := cdsRateName.AsString;
                    RObj.ShortName := cdsRateShortName.AsString;
                    RObj.ISOCode := UpperCase(cdsRateISOCode.AsString);
                    RObj.NumberCode := cdsRateNumberCode.AsString;
                    RObj.Pieces := cdsRateValue.AsInteger;      
                    RObj.Rate := cdsRate.FieldByName('Rate').AsFloat; 

                    RObj.FastAccess := cdsRateFastAccess.AsBoolean;
                    RObj.AvForPay := cdsRateAvForPay.AsBoolean;   }

                    RObj.NewRate := StrToFloatAdv(V[i, cdsUrlColRate.AsInteger - 1]);
                  end;
                end
                else // Новая валюта
                begin
                  RObj.Name := V[i, cdsUrlColName.AsInteger - 1];
                  RObj.ShortName := V[i, cdsUrlColISO.AsInteger - 1];
                  RObj.ISOCode := S;
                  RObj.NumberCode := V[i, cdsUrlColCode.AsInteger - 1];
                  RObj.Pieces := V[i, cdsUrlColPieces.AsInteger - 1];
                  RObj.NewRate := StrToFloatAdv(V[i, cdsUrlColRate.AsInteger - 1]);
                end;

              end;
            end
            else
              raise Exception.Create('Ошибка при разборе страницы ' + cdsUrlName.AsString);
          end
          else
            raise Exception.Create('Ошибка при загрузке страницы ' + cdsUrlName.AsString);
        finally

        end;
        Next;
      end;
    end;
    RefresheStringGrid;
    MessageBox(Handle, 'Курсы валют успешно прочитаны.', 'Ок', MB_ICONINFORMATION);
  finally
    RefresheStringGrid;
    AURLParser.Free;
    cdsRate.EnableControls;
  end;
end;

procedure TCurRateUpdater.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Id_Currency').IsNull then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clGray;
  end;
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TCurRateUpdater.dbgRezDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
{  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Id_Currency').IsNull then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clGray;
  end;                                                   }
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Id_Currency').IsNull then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clGray;
  end;                                                   
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

{ TRate }

constructor TRate.Create;
begin
  inherited;
  FChecked := false;
  SiteRates := TStringList.Create;
  Id_Currency := Null;
  Rate := Null;
  NewRate := Null;

  FastAccess := false;
  AvForPay := false;
end;

destructor TRate.Destoy;
begin
  SiteRates.Free;
  inherited;

end;

procedure TCurRateUpdater.RefresheStringGrid;
var i, j : integer;
    Obj : TRate;
begin
  for i := 0 to StringGridRates.RowCount - 1 do
  begin
    if StringGridRates.Objects[0, i] is TRate then
    begin
      Obj := TRate(StringGridRates.Objects[0, i]);
      WriteToCell(StringGridRates, 1, i, Obj.Name);
      WriteToCell(StringGridRates, 2, i, Obj.ISOCode);
      WriteToCell(StringGridRates, 3, i, Obj.NumberCode);
      WriteToCell(StringGridRates, 4, i, Obj.Pieces);
      WriteToCell(StringGridRates, 5, i, Obj.Rate);
      WriteToCell(StringGridRates, 6, i, Obj.NewRate);

      for j := 0 to Obj.SiteRates.Count - 1 do
        WriteToCell(StringGridRates, 7 + j, i, Obj.SiteRates[j]);

    end;
  end;
end;

procedure TCurRateUpdater.StringGridRatesDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var i : integer;
    Obj : TRate;
    Style, cbSize   : Integer;
    R : TRect;
begin
  if ARow > 0 then
  begin
    if StringGridRates.Objects[0, ARow] is TRate then
    begin
      Obj := TRate(StringGridRates.Objects[0, ARow]);
    end
    else
      Exit;

    if Obj.Id_Currency = Null then
      StringGridRates.Canvas.Font.Color := clGrayText;
    if (ACol = StringGridRates.Col) and (ARow = StringGridRates.Row) then
    begin
      StringGridRates.Canvas.Brush.Color := clHighlight;
      StringGridRates.Canvas.FillRect(Rect);
      StringGridRates.Canvas.Font.Color := clWindow;
    end;
    if ACol > 0 then
    begin
      if obj.ChRate and (ACol = 6) then
      begin
        StringGridRates.Canvas.Pen.Color := clRed;
        StringGridRates.Canvas.Rectangle(Rect.Left + 0, Rect.Top + 0, Rect.Right - 0, Rect.Bottom - 0);
        if (ACol = StringGridRates.Col) and (ARow = StringGridRates.Row) then
          StringGridRates.Canvas.Font.Color := clRed;
      end;
      Rect.Left := Rect.Left + 2;
      Rect.Top := Rect.Top + 1;
      DrawText(StringGridRates.Canvas.Handle, PChar(StringGridRates.Cells[ACol, ARow]), -1, Rect, DT_Left);
    end
    else
    begin
      if Obj.Checked = true then
        Style := DFCS_CHECKED
      else
        Style := DFCS_BUTTONCHECK;

      R := Rect;
      cbSize := 15;
      if R.Bottom - R.Top > cbSize then
      begin
        R.Top := R.Top + (R.Bottom - R.Top - cbSize) div 2;
        R.Bottom := R.Top + cbSize;
      end;
      if R.Right - R.Left < cbSize then
      begin
        R.Right := R.Left + cbSize;
      end;

      DrawFrameControl(StringGridRates.Canvas.Handle, R, DFC_BUTTON, Style);
    end;

  end;
end;

procedure TCurRateUpdater.aExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TCurRateUpdater.SetChecked(AFlag : boolean);
var i : integer;
    Obj : TRate;
begin
  for i := 0 to StringGridRates.RowCount  do
  begin
    if StringGridRates.Objects[0, i] is TRate then
    begin
      Obj := TRate(StringGridRates.Objects[0, i]);
      Obj.Checked := AFlag;
    end;                                 
  end;
  StringGridRates.Repaint;
  UpdateOkBtn;
end;

procedure TCurRateUpdater.aSelectAllExecute(Sender: TObject);
begin
  SetChecked(true);
end;

procedure TCurRateUpdater.aUnSelectAllExecute(Sender: TObject);
begin
  SetChecked(false);
end;

procedure TCurRateUpdater.StringGridRatesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column, Row: Longint;
  P : TPoint;
begin           
  P := Mouse.CursorPos;
  P := StringGridRates.ScreenToClient(P);
  StringGridRates.MouseToCell(P.x, P.Y, Column, Row);

  if (Column = 0) and (StringGridRates.Row = Row) then
  begin
    if StringGridRates.Objects[0, Row] is TRate then
    begin
      TRate(StringGridRates.Objects[0, Row]).Checked := not TRate(StringGridRates.Objects[0, Row]).Checked;
      StringGridRates.Repaint;
      UpdateOkBtn;
    end;
  end;
end;

procedure TCurRateUpdater.StringGridRatesKeyPress(Sender: TObject;
  var Key: Char);
var
  Column, Row: Longint;
  P : TPoint;
begin           
  if (Key = ' ') {and (StringGridRates.Col = 0) } then
  begin
    if StringGridRates.Objects[0, StringGridRates.Row] is TRate then
    begin
      TRate(StringGridRates.Objects[0, StringGridRates.Row]).Checked := not TRate(StringGridRates.Objects[0, StringGridRates.Row]).Checked;
      StringGridRates.Repaint;
      UpdateOkBtn;
    end;
  end;
end;

function TCurRateUpdater.SaveProp: boolean;
var OldCursor : TCursor;
    AName, ShortName, ISOCode, NumberCode: OleVariant;
    FastAccess: WordBool;
    AValue: Integer;
    Rate: Double;
    AvForPay: WordBool;
    Id_URL: OleVariant;

    i : integer;
    Obj : TRate;
    id_Bsn : integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
    for i := 0 to StringGridRates.RowCount  do
    begin
      if StringGridRates.Objects[0, i] is TRate then
      begin
        Obj := TRate(StringGridRates.Objects[0, i]);
        if Obj.Checked then
        begin
          Rate := Obj.NewRate;
          if Obj.Id_Currency = Null then // Добавляется
          begin
            AName := Obj.Name;
            ShortName := Obj.ShortName;
            ISOCode := Obj.ISOCode;
            NumberCode := Obj.NumberCode;

            FastAccess := Obj.FastAccess;
            AvForPay := true;

            AValue := Obj.Pieces;

            Id_URL := Null;
            id_Bsn := fBsnSelector1.ID;
            Obj.Id_Currency := DM.rsCA.AppServer.CurrencyAdd_2(AName, ShortName, ISOCode, NumberCode, FastAccess, AValue, Rate, AvForPay, Id_URL, id_Bsn);
            if Obj.Id_Currency = -1 then
              raise Exception.Create('Ошибка при сохранении свойств');

          end
          else
          begin
            if DM.rsCA.AppServer.CurrencyEditRate(Obj.Id_Currency, Rate) <> 1 then
              raise Exception.Create('Ошибка при сохранении свойств');
          end;
        end;
      end;
    end;
    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;
end;


function TRate.GetChRate: boolean;
begin
  Result := (NewRate <> Null) and
            (Rate <> NewRate);
end;

function TRate.GetNewRate: Variant;
begin
  Result := FNewRate;
end;

procedure TRate.SetChecked(const Value: boolean);
begin
  FChecked := Value;
 // if CurRateUpdater <> nil then
 //   CurRateUpdater.UpdateOkBtn;
end;

procedure TRate.SetNewRate(const Value: Variant);
begin
  FNewRate := Value;
end;

procedure TCurRateUpdater.btnOkClick(Sender: TObject);
var rez : integer;
begin
  rez := MessageBox(Handle, 'Сохранить новые курсы валют?', 'Сохранить данные?', MB_ICONQUESTION + MB_YESNOCANCEL);
  case rez of
    IDYES : ModalResult := mrOk;
    IDNO : ModalResult := mrCancel;
    else
      ModalResult := mrNone;
  end;
end;

procedure TCurRateUpdater.UpdateOkBtn;
var i : integer;
    Obj : TRate;
begin
  btnOk.Enabled := false; 
  for i := 0 to StringGridRates.RowCount  do
  begin
    if StringGridRates.Objects[0, i] is TRate then
    begin
      Obj := TRate(StringGridRates.Objects[0, i]);
      if Obj.Checked and Obj.ChRate then
      begin
        btnOk.Enabled := true;
        Break
      end;
    end;                                 
  end;
end;

procedure TCurRateUpdater.StringGridRatesClick(Sender: TObject);
begin
  aEditRate.Enabled := StringGridRates.Objects[0, StringGridRates.Row] is TRate;
end;

procedure TCurRateUpdater.fBsnSelector1Button1Click(Sender: TObject);
begin
  fBsnSelector1.Button1Click(Sender);
  Val := fBsnSelector1.ID;
  FormActivate(Self);
end;

constructor TCurRateUpdater.Create(AOwner: TComponent);
begin
  inherited;
  LoadValFromRegistry(Val, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
end;

destructor TCurRateUpdater.Destroy;
begin
  SaveValToRegistry(fBsnSelector1.ID, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  inherited;

end;

end.
