unit uOperRepl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, DBGridEh, DB;

type
  TOperRepl = class(TForm)
    Label2: TLabel;
    btnOpenDay: TButton;
    btnCloseDay: TButton;
    DateEdit1: TDateEdit;
    procedure btnOpenDayClick(Sender: TObject);
    procedure btnCloseDayClick(Sender: TObject);
    procedure DateEdit1AcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
  private
    FRxDBGrid : TDBGridEh;
    FDD_MaxDay : Variant;
  public
    procedure Initialize(id_business : integer; ARxDBGrid: TDBGridEh);
  end;

function ShowOperRepl(id_business : integer; ARxDBGrid: TDBGridEh) : boolean;
var
  OperRepl: TOperRepl;

implementation

uses uDM, foMyFunc, uPrgForm;

function ShowOperRepl(id_business : integer; ARxDBGrid: TDBGridEh) : boolean;
var F : TOperRepl;
begin
  Result := false;
  F := TOperRepl.Create(nil);
  try
    F.Initialize(id_business, ARxDBGrid);
    F.ShowModal;
    Result := F.ModalResult = mrOk;
  finally
    F.Free;
  end;
end;

{$R *.DFM}

{ TOperDay }

procedure TOperRepl.Initialize(id_business : integer; ARxDBGrid: TDBGridEh);
begin
  FRxDBGrid := ARxDBGrid;
  FDD_MaxDay := Null;

  exit;
     
  FDD_MaxDay := DM.rsCA.AppServer.DD_MaxDay(id_business);
  if FDD_MaxDay <> Null then
    DateEdit1.Date := FDD_MaxDay + 0;
end;

procedure TOperRepl.btnOpenDayClick(Sender: TObject);
var i, id_Oper : integer;
    ABookmark : TBookmark;
    AIDLIst : TIDList;
begin
  with DateEdit1 do
    if DateEdit1.Date = 0 then
    begin
      MessageBox(Handle, 'Не введена дата', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;

  if MessageBox(Handle, 'Перенести выделенные операции?', 'Подтвердите перенос', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    with FRxDBGrid.DataSource.DataSet do
    begin
      AIDLIst := TIDList.Create;
      id_Oper := FRxDBGrid.DataSource.DataSet.FieldByName('id_OPer').AsInteger;
      if AIDLIst.IndexOf(id_Oper) = -1 then
        AIDLIst.Add(id_Oper);
      try
        try
          DisableControls;
          ABookmark := GetBookmark;
          for i := 0 to FRxDBGrid.SelectedRows.Count - 1 do
          begin
            GotoBookmark(Pointer(FRxDBGrid.SelectedRows.Items[i]));
            id_Oper := FRxDBGrid.DataSource.DataSet.FieldByName('id_OPer').AsInteger;
            if (FRxDBGrid.DataSource.DataSet.FieldByName('OperVid').AsInteger >= 0) and
                not FieldByName('Blocked').AsBoolean and
                (AIDLIst.IndexOf(id_Oper) = -1) then AIDLIst.Add(id_Oper);
          end;
          BeginTruns(DM.rsCA);
          for i := 0 to AIDLIst.Count - 1 do
          begin
            ShowProgressForm(Handle, i, AIDLIst.Count, 'Перенос операций');
            id_Oper := AIDLIst[i];
            if DM.rsCA.AppServer.OP_ReplaceDate_CH(id_Oper, Int(DateEdit1.Date)) = 0 then
            begin
              raise Exception.Create('Перенос невозможен!!!');
              ModalResult := mrCancel;
            end;
          end;
          CommitTrans(DM.rsCA);
          ModalResult := mrOk;
          FRxDBGrid.SelectedRows.Clear;
        finally
          AIDLIst.Free;
          EnableControls;
          CloseProgressForm;
       //   aRefreshe.Execute;
        end;
       except
         on E : Exception do
         begin
           RollbackTrans(DM.rsCA);
           raise Exception.Create(E.Message);
         end;
       end;
    end;
  end;
end;

procedure TOperRepl.btnCloseDayClick(Sender: TObject);
begin
  Close;
end;

procedure TOperRepl.DateEdit1AcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  if FDD_MaxDay <> Null then
    Action := int(ADate) > int(FDD_MaxDay);

end;

end.
