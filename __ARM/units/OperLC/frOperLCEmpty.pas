unit frOperLCEmpty;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ExtCtrls, StdCtrls, Mask, DBCtrls, foMyFunc, Buttons,
  frCurSelector, ToolEdit, RXDBCtrl, ComCtrls, ActnList, Grids, DBGrids,
  ToolWin, RxLookup, frBsnSelector;

type
  TfOperLCEmpty = class(TFrame)
    cdsOperFin: TClientDataSet;
    dsOperFin: TDataSource;
    PageControl1: TPageControl;
    tsData: TTabSheet;
    tsComment: TTabSheet;
    ActionList1: TActionList;
    aCommentNew: TAction;
    aCommentProp: TAction;
    aCommentDel: TAction;
    cdsOperFinid_LC_Oper: TAutoIncField;
    cdsOperFinOperVid: TIntegerField;
    cdsOperFinid_UserCreator: TIntegerField;
    cdsOperFinCreatorFIO: TStringField;
    cdsOperFinDateLocal: TDateTimeField;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    cdsOperFinOperTypeIn: TBooleanField;
    Panel3: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    DBEdit5: TDBEdit;
    cdsOperFinid_DocType: TIntegerField;
    cdsOperFinDocTypeName: TStringField;
    cdsOperFinContract: TStringField;
    cdsOperFinOpComment: TStringField;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    cdsOperFinid_business: TIntegerField;
    cdsOperFinBusinessName: TStringField;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label11: TLabel;
    Label17: TLabel;
    edContract: TDBEdit;
    edImp_PayBasic: TDBEdit;
    edAccInv_PayAssignment: TDBEdit;
    cdsOperFinImp_PayBasic: TStringField;
    cdsOperFinAccInv_PayAssignment: TStringField;
    procedure BitBtn2Click(Sender: TObject);
    procedure cbVizaClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsOperFinAfterPost(DataSet: TDataSet);
  private
    FNeedColor : boolean;
    FID_Oper : integer;
  public
    function ChangeData : boolean; 
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    procedure Initialize(ID_Oper : integer; AReadOnly : boolean = false);

    property ID_Oper : integer read FID_Oper;
    procedure CheckNColor;
  end;

implementation

uses uDM, uLCSelectorUn;

{$R *.DFM}

{ TfOperCommon }


{ TfOperCommon }

function TfOperLCEmpty.CheckData: boolean;
begin
  Result := false;
  UpdateData;

  with fBsnSelector1.edName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран бизнес', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;

  with DBMemo1 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введено описание', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  Result := true;
end;

function TfOperLCEmpty.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsOperFin;
  Result := true;
  UpdateData;
  if (FID_Oper <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'Correct', 'Коррекция', SL);
        CompareField(CDS, 'AcName', 'Счет', SL);
        CompareField(CDS, 'RealReprName', 'Получатель', SL);
        CompareField(CDS, 'BusinessName', 'Бизнес', SL);

        CompareField(CDS, 'PriceOper', 'Сумма', SL);
        CompareField(CDS, 'CurrencyOperName', 'Валюта', SL);

        CompareField(CDS, 'ManagerFIO', 'Сотрудник', SL);
        CompareField(CDS, 'FormalDistribName', 'Формальное распределение', SL);
        CompareField(CDS, 'FuncDistribName', 'Функциональное распределение', SL);
        CompareField(CDS, 'Body', 'Описание', SL, False);
      end;

      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfOperLCEmpty.Create(AOwner: TComponent);
begin
  inherited;
  FNeedColor := false;
end;

destructor TfOperLCEmpty.Destroy;
begin
  inherited;

end;

procedure TfOperLCEmpty.Initialize(ID_Oper: integer; AReadOnly: boolean);
begin
  FNeedColor := ID_Oper <> -1;
  FID_Oper := ID_Oper;
  with cdsOperFin do
  begin
    Close;
    Params.ParamByName('@id_LC_Oper').AsInteger := FID_Oper;
    Open;
    if FID_Oper = -1 then
    begin
      Edit;
//      FieldByName('AmountOper').Value := 1;
//      FieldByName('Correct').AsBoolean := false;
  //    FieldByName('id_Replicator').AsInteger := Null;    //1013
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      FieldByName('OperVid').AsInteger := 0;
      Post;
    end
    else
    begin
      if not FieldByName('id_business').IsNull then
        fBsnSelector1.id := FieldByName('id_business').AsInteger;
    end;
  end;
end;

function TfOperLCEmpty.SaveProp: boolean;
var OldCursor : TCursor;
    id_UserCreator: Integer;
    OperTypeIn: WordBool;
    Imp_PayBasic, AccInv_PayAssignment, id_DocType, Contract, OpComment, id_business: OleVariant;
begin
  if not ChangeData then
  begin
    Result := true;
    Exit;
  end;   
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
    with cdsOperFin do
    begin
      id_UserCreator := DM.IDUser;
      OperTypeIn := FieldByName('OperTypeIn').AsBoolean;

      id_DocType := FieldByName('id_DocType').Value;
      Contract := FieldByName('Contract').Value;
      OpComment := FieldByName('OpComment').Value;
      id_business := fBsnSelector1.ID;

      Imp_PayBasic := FieldByName('Imp_PayBasic').Value;
      AccInv_PayAssignment := FieldByName('AccInv_PayAssignment').Value;
    end;


    if FID_Oper = -1 then // Добавляется
    begin
      FID_Oper := DM.rsCA.AppServer.LC_OP_EmptyAdd(id_UserCreator, OperTypeIn, id_DocType, Contract, OpComment, id_business, Imp_PayBasic, AccInv_PayAssignment);

      if FID_Oper = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    end
    else
    begin
      if DM.rsCA.AppServer.LC_OP_EmptyEdit(FID_Oper, id_UserCreator, id_DocType, Contract, OpComment, id_business, Imp_PayBasic, AccInv_PayAssignment) <> 1 then
        raise Exception.Create('Ошибка при сохранении свойств');
    end;
 //   if not CDSApplyUpdates(cdsLcComment, 'id_LC_Oper', FID_Oper) then
 //     raise Exception.Create('Ошибка при сохранении списка комментариев');

    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;
end;

procedure TfOperLCEmpty.UpdateData;
var CDS : TClientDataSet;
begin
  CDS := cdsOperFin;

  if CDS.State <> dsEdit then
    CDS.Edit;

  CDS.FieldByName('OperTypeIn').AsBoolean := true;
  CDS.FieldByName('BusinessName').AsString := fBsnSelector1.BsnName;
  CDS.Post;
end;

procedure TfOperLCEmpty.BitBtn2Click(Sender: TObject);
begin
//*
end;

procedure TfOperLCEmpty.cbVizaClick(Sender: TObject);
begin
  with cdsOperFin do
  begin
    Edit;
    FieldByName('CheckDate').Value := Null;
    FieldByName('id_UserChecker').Value := Null;
    Post;
  end;
end;

procedure TfOperLCEmpty.DBEdit1Change(Sender: TObject);
begin
 { if FID_Oper <> -1 then
  begin
    if THackControl(Sender).Text = '' then
      THackControl(Sender).Color := clRed
    else
      THackControl(Sender).Color := clWindow;
  end;  }
end;

procedure TfOperLCEmpty.DBEdit4Change(Sender: TObject);
begin
{  if (FID_Oper <> -1) and CheckBox1.Checked then
  begin
    if THackControl(Sender).Text = '' then
      THackControl(Sender).Color := clRed
    else
      THackControl(Sender).Color := clWindow;
  end;  }
end;

function TfOperLCEmpty.ChangeData: boolean;
begin
  UpdateData;
  Result := (ID_Oper = -1) or (cdsOperFin.ChangeCount > 0)
end;

procedure TfOperLCEmpty.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_delete then
  begin
    with cdsOperFin do
    begin
      Edit;
      FieldByName('id_business').Value := Null;
      FieldByName('BusinessName').Value := Null;
      Post;
    end;
  end;
end;

procedure TfOperLCEmpty.cdsOperFinAfterPost(DataSet: TDataSet);
begin
  CheckNColor;
end;

procedure TfOperLCEmpty.CheckNColor;
begin
  if not FNeedColor then
    Exit;
  with DBMemo1 do
  begin
    if  trim(Lines.Text) = '' then
      Color := clRed
    else
      Color := clWindow;
  end;
{  with lcDocType do
  begin
    if  trim(Text) = '' then
      Color := clRed
    else
      Color := clWindow;
  end; }
  with edContract do
  begin
    if  trim(Text) = '' then
      Color := clRed
    else
      Color := clWindow;
  end;
end;

end.
