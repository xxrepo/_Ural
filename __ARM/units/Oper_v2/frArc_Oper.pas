unit frArc_Oper;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ActnList, ImgList, Grids, DBGrids, RXDBCtrl, Menus,
  Db, DBClient, StdCtrls, ExtCtrls, DateUtil;

type
  TfArc_Oper = class(TFrame)
    RxDBGrid1: TRxDBGrid;
    ImageList: TImageList;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    ToolBar: TToolBar;
    ToolButton4: TToolButton;
    cdsArc_OPList: TClientDataSet;
    dsFltList: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    aExcelExp: TAction;
    Excel1: TMenuItem;
    aSelAll: TAction;
    N5: TMenuItem;
    cdsArc_OPListid_Arc: TAutoIncField;
    cdsArc_OPListDateCreateArc: TDateTimeField;
    cdsArc_OPListid_User: TIntegerField;
    cdsArc_OPListid_business: TIntegerField;
    cdsArc_OPListArcDate: TDateTimeField;
    cdsArc_OPListFIO: TStringField;
    aSave: TAction;
    cdsOldOperList: TClientDataSet;
    SaveDialog1: TSaveDialog;
    aShowArcImp: TAction;
    procedure aAddExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure dsFltListDataChange(Sender: TObject; Field: TField);
    procedure aExcelExpExecute(Sender: TObject);
    procedure aSelAllExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aShowArcImpExecute(Sender: TObject);
  private
    Fid_Bsn : integer;
  public
    procedure Initialize(id_Bsn : integer);
  end;

implementation

uses foMyFunc, uDM, uInputBoxDate, uArc_OperSet, uPrgForm, uMeCrpt, uArcImp;

{$R *.DFM}

procedure TfArc_Oper.aAddExecute(Sender: TObject);
var
  ID:Variant;
  ADate: Variant;
begin
  ADate := IncMonth(Date, -3);
  if InputArcDate(Handle, '', '', ADate) then
  begin
  {  if DM.rsCA.AppServer.Arc_OperLastBal(Fid_Bsn, ADate) <> 1 then
    begin
      if MessageBox(Handle, 'Для архивации операций необходимо, чтобы на дату ', '', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
      begin
        Screen.Cursor := crSQLWait;
        try
          DM.rsCA.AppServer.UN_BalanceForm_v2(Fid_Bsn);
        finally
          Screen.Cursor := crDefault;
        end;
      end
      else
        Exit;
    end; }
    ShowProgressForm(Handle, 0, 0, 'Идет архивация данных...');
    Screen.Cursor := crSQLWait;
    try
   //   DM.rsCA.AppServer.BeginTruns;
      try
        DM.rsCA.AppServer.Arc_OperAdd(Fid_Bsn, ADate, DM.IDUser);
        Screen.Cursor := crDefault;
      //  CloseProgressForm;
        MessageBox(Handle, 'Архивация завершена', '', MB_ICONINFORMATION + MB_OK);
    //    DM.rsCA.AppServer.CommitTrans;
      except
    //    DM.rsCA.AppServer.RollbackTrans;
      end;
      cdsArc_OPList.Close;
      cdsArc_OPList.Open;
    finally
      CloseProgressForm;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfArc_Oper.aDelExecute(Sender: TObject);
var i : integer;
    S : String;
begin
  S := 'Удалить данные?';
  if MessageBox(Handle, PChar(S), 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    if MessageBox(Handle, 'Удаленные операции невозможно будет восстановить, если заранее не сделать экспорт архива', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
    begin
      ShowProgressForm(Handle, 0, 0, 'Идет удаление...');
      Screen.Cursor := crSQLWait;
      try
        DM.rsCA.AppServer.Arc_OperClear(Fid_Bsn);
        Screen.Cursor := crDefault;
      //  CloseProgressForm;
        MessageBox(Handle, 'Архивные данные удалены ', '', MB_ICONINFORMATION + MB_OK);
      finally
        Screen.Cursor := crDefault;
        CloseProgressForm;
      end;

    end;
  end;
end;

procedure TfArc_Oper.aRefreshExecute(Sender: TObject);
 var
  id:Integer;
begin
  ID := cdsArc_OPListid_Arc.AsInteger;
  with cdsArc_OPList do
  begin
    Close;
    Open;
   Locate('id_Arc', Id, [loCaseInsensitive]);
  end;
end;

procedure TfArc_Oper.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfArc_Oper.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfArc_Oper.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfArc_Oper.Initialize(id_Bsn : integer);
begin
  Fid_Bsn := id_Bsn;
  aAdd.Enabled := Fid_Bsn > 0;
  aSave.Enabled := Fid_Bsn > 0;
  with cdsArc_OPList do
  begin
    Close;
    Params.ParamByName('@id_business').Value := id_Bsn;
    Open;
  end;
end;

procedure TfArc_Oper.dsFltListDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsArc_OPList.IsEmpty;
  aDel.Enabled := not cdsArc_OPList.IsEmpty;
  aExcelExp.Enabled := not cdsArc_OPList.IsEmpty;
end;

procedure TfArc_Oper.aExcelExpExecute(Sender: TObject);
begin
  GreedToExcel(RxDBGrid1, 'Формальные распределения бизнеса ' + DM.GetBusinessName(Fid_Bsn));
end;

procedure TfArc_Oper.aSelAllExecute(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TfArc_Oper.aSaveExecute(Sender: TObject);
var id_OP_Arc, CNT, i, N, xxx, id_Max: Integer;
    S, S2 : String;
begin
  xxx := 2000;
  xxx := 400;
  with cdsOldOperList do
  begin
   // PacketRecords := 500;
    SaveDialog1.FileName := 'ArcExport ' + FormatDateTime('yyyy_mm_dd hh_mm', Now);
    if SaveDialog1.Execute then
    begin
      S := ExtractFileName(SaveDialog1.FileName);
      S := StringReplace(S, '.aex', '', []);
      S2 := ExtractFileExt(SaveDialog1.FileName);
      if DM.rsCA.AppServer.Arc_OldOperCount(Fid_Bsn, id_OP_Arc, CNT) then
      begin
        if CNT > xxx then
        begin
          MessageBox(Handle, Pchar('Всего будет экспортировано ' + IntToStr(CNT) + ' операций.' + #13 + #10 + 'Экспортируемые данные будут разбиты на несколько файлов по ' + InttoStr(xxx) + ' операций.'), '', MB_Ok);
          id_Max := id_OP_Arc + CNT - 1;
          i := id_OP_Arc;
          try
            while id_OP_Arc < id_Max do
            begin
              ShowProgressForm(Handle, id_OP_Arc - i, id_Max - i, 'Экспорт архива операций');
              Close;
              Params.ParamByName('@id_business').Value := Fid_Bsn;
              Params.ParamByName('@id_OP_Arc1').Value := id_OP_Arc;
              Params.ParamByName('@id_OP_Arc2').Value := id_OP_Arc + xxx - 1;
              Open;
              cdsOldOperList.SaveToFile(S + ' ' + Inttostr(id_OP_Arc) + '_' + Inttostr(id_OP_Arc + xxx) + S2);
           //   if id_OP_Arc = id_Max then Break;
              id_OP_Arc := id_OP_Arc + xxx;
              if id_OP_Arc > id_Max then
                id_OP_Arc := id_Max;
            end;
            MessageBox(Handle, 'Экспорт завершен', '', MB_Ok + MB_ICONINFORMATION);
          finally
            CloseProgressForm;
          end;
        end
        else
        begin
          ShowProgressForm(Handle, 0, 0, 'Экспорт архива операций');
          Close;
          Params.ParamByName('@id_business').Value := Fid_Bsn;
          Params.ParamByName('@id_OP_Arc1').Value := -1;
          Params.ParamByName('@id_OP_Arc2').Value := -1;
          Open;
          ShowProgressForm(Handle, 0, 0, 'Сохранение данных...');
          try
            cdsOldOperList.SaveToFile(SaveDialog1.FileName);
            MessageBox(Handle, 'Экспорт завершен', '', MB_Ok + MB_ICONINFORMATION);
          finally
            CloseProgressForm;
          end;
        end;
      end
      else
      begin

      end;
    end;
  end;
end;



procedure TfArc_Oper.aShowArcImpExecute(Sender: TObject);
begin
  ShowArcImp
end;

end.
