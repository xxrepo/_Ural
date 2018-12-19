unit UnitRate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Db, DBGrids, RXDBCtrl, ComCtrls, ToolWin, Menus, ActnList, ImgList,
  DBClient, Provider, ADODB, StdCtrls, Mask, ToolEdit, MtUPDPrv, ExtCtrls,
  RxMemDS;

type
  TRate = class
    Checked : boolean;
    Id_Currency : Variant;
    Name : string;
    ISOCode : string;
    NumberCode : string;
    Pieces : integer;
    Rate : Variant;
    NewRate : Variant;
    SiteRates : TStringList;
    constructor Create;
    destructor Destoy; //override;
  end;

  TFormRate = class(TForm)
    ActionList1: TActionList;
    NewRate: TAction;
    EditRate: TAction;
    DelRate: TAction;
    PopupMenu1: TPopupMenu;
    Action11: TMenuItem;
    ImageList1: TImageList;
    N1: TMenuItem;
    DelUser1: TMenuItem;
    Refresh: TAction;
    cdsRate: TClientDataSet;
    N2: TMenuItem;
    N3: TMenuItem;
    OpenDay: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    ReadSites: TAction;
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
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DelRateExecute(Sender: TObject);
    procedure NewRateExecute(Sender: TObject);
    procedure EditRateExecute(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure cdsRateAfterRefresh(DataSet: TDataSet);
    procedure ReadSitesExecute(Sender: TObject);
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
  private
    procedure CloneCDSRec(SrcCDS, DestCDS: TClientDataSet);
    procedure RefresheStringGrid;
    procedure SetChecked(AFlag: boolean);
    { Private declarations }
  public
    procedure Init;
  end;

var
  FormRate: TFormRate;

implementation

{$R *.DFM}

uses
  Common, Unit1, UnitARate, UnitCheckRates, foMyFunc, uDM;

procedure TFormRate.FormActivate(Sender: TObject);
var i : integer;
    RObj : TRate;
begin
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
      RObj.ISOCode := UpperCase(cdsRateISOCode.AsString);
      RObj.NumberCode := cdsRateNumberCode.AsString;
      RObj.Pieces := cdsRateValue.AsInteger;
      RObj.Rate := cdsRate.FieldByName('Rate').AsFloat;

      Next;
      Inc(i);
    end;
  end;
  RefresheStringGrid;
end;

procedure TFormRate.FormDestroy(Sender: TObject);
begin
  FormRate := nil;
end;

procedure TFormRate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormRate.DelRateExecute(Sender: TObject);
begin
  if Application.MessageBox('Удалить данное значение?', 'Внимание',
    mb_OkCancel)=mrOk then
    with CDSRate do
      begin
      Delete;
      if ApplyUpdates(0)=0 then
        FixIdRefresh(CDSRate, 'Id_Rate');
      end;
end;

procedure TFormRate.NewRateExecute(Sender: TObject);
begin
  with TFormARate.Create(Form1) do
    begin
    try
      Caption:=(Sender as TAction).Caption;
      Tag:=0;
      ShowModal;
    finally
      Free;
      end;
    end;
end;

procedure TFormRate.EditRateExecute(Sender: TObject);
begin
  with TFormARate.Create(Form1) do
    begin
    Caption:=(Sender as TAction).Caption;
    Tag:=1;
    ShowModal;
    Free;
    end;
end;

procedure TFormRate.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
var Index : TIndexDef;
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TFormRate.RxDBGrid1DblClick(Sender: TObject);
begin
  if (Sender as TRxDBGrid).DataSource.DataSet.IsEmpty then
    NewRate.Execute
  else
    EditRate.Execute;
end;

procedure TFormRate.cdsRateAfterRefresh(DataSet: TDataSet);
begin
  EditRate.Enabled:=not DataSet.IsEmpty;
  DelRate.Enabled:=not DataSet.IsEmpty;
end;

procedure TFormRate.ReadSitesExecute(Sender: TObject);
begin
  Init;
end;

procedure TFormRate.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);

end;

procedure TFormRate.CloneCDSRec(SrcCDS, DestCDS : TClientDataSet);
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

procedure TFormRate.Init;
var S : String;
    AURLParser : TURLParser;
    V : Variant;
    ColCount, RowCount, i, j, ID : integer;
    RObj : TRate;
begin
  StringGridRates.ColCount := 7;
  AURLParser := TURLParser.Create;
  cdsRate.DisableControls;
  try
    with cdsUrl do
    begin
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
                  if cdsRateid_URL.AsInteger = cdsRateid_URL.AsInteger then
                  begin
                    RObj.Id_Currency := cdsRateId_Currency.AsInteger;
                    RObj.Name := cdsRateName.AsString;
                    RObj.ISOCode := UpperCase(cdsRateISOCode.AsString);
                    RObj.NumberCode := cdsRateNumberCode.AsString;
                    RObj.Pieces := cdsRateValue.AsInteger;
                    RObj.Rate := cdsRate.FieldByName('Rate').AsFloat;

                    RObj.NewRate := StrToFloatAdv(V[i, cdsUrlColRate.AsInteger - 1]);
                  end;
                end
                else // Новая валюта
                begin
                  RObj.Name := V[i, cdsUrlColName.AsInteger - 1];
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
        except

        end;
        Next;
      end;
    end;
  finally
    RefresheStringGrid;
    AURLParser.Free;
    cdsRate.EnableControls;
  end;
end;

procedure TFormRate.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Id_Currency').IsNull then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clGray;
  end;
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormRate.dbgRezDrawColumnCell(Sender: TObject;
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
  Checked := false;
  SiteRates := TStringList.Create;
  Id_Currency := Null;
  Rate := Null;
  NewRate := Null;
end;

destructor TRate.Destoy;
begin
  SiteRates.Free;
  inherited;

end;

procedure TFormRate.RefresheStringGrid;
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

procedure TFormRate.StringGridRatesDrawCell(Sender: TObject; ACol,
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
      if (Obj.Rate <> Obj.NewRate) and (Obj.NewRate <> Null) and (ACol = 6) then
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

procedure TFormRate.aExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormRate.SetChecked(AFlag : boolean);
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
end;

procedure TFormRate.aSelectAllExecute(Sender: TObject);
begin
  SetChecked(true);
end;

procedure TFormRate.aUnSelectAllExecute(Sender: TObject);
begin
  SetChecked(false);
end;

procedure TFormRate.StringGridRatesMouseDown(Sender: TObject;
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
    end;
  end;
end;

end.
