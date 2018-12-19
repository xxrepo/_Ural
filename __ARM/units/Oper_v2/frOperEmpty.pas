unit frOperEmpty;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ExtCtrls, StdCtrls, Mask, DBCtrls, foMyFunc, Buttons,
  frCurSelector, ToolEdit, RXDBCtrl, ComCtrls, ActnList, Grids, DBGrids,
  ToolWin, RxLookup, frOperOldData, frArc, frBsnSelector;

type
  TfOperEmpty = class(TFrame)
    PageControl1: TPageControl;
    tsData: TTabSheet;
    TabSheet1: TTabSheet;
    cdsEmptyProp: TClientDataSet;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    DataSource1: TDataSource;
    cdsEOpArc: TClientDataSet;
    fArc1: TfArc;
    cdsEmptyPropOperVid: TIntegerField;
    cdsEmptyPropid_UserCreator: TIntegerField;
    cdsEmptyPropCreatorFIO: TStringField;
    cdsEmptyPropOperTypeIn: TBooleanField;
    cdsEmptyPropDateLocal: TDateTimeField;
    cdsEmptyPropid_DocType: TIntegerField;
    cdsEmptyPropDocTypeName: TStringField;
    cdsEmptyPropContract: TStringField;
    cdsEmptyPropOpComment: TStringField;
    cdsEmptyPropid_Oper: TAutoIncField;
    cdsEmptyPropid_business: TIntegerField;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    fBsnSelector1: TfBsnSelector;
    cdsEmptyPropBusinessName: TStringField;
    cdsEmptyPropCheckDate: TDateTimeField;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label11: TLabel;
    Label17: TLabel;
    edContract: TDBEdit;
    edImp_PayBasic: TDBEdit;
    edAccInv_PayAssignment: TDBEdit;
    cdsEmptyPropImp_PayBasic: TStringField;
    cdsEmptyPropAccInv_PayAssignment: TStringField;
    procedure cdsEmptyPropOperTypeInGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    FOperParamz : TOperParamz;
    function GetID_Oper: integer;
  public
    function ChangeData : boolean;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    procedure Initialize(AOperParamz : TOperParamz);

    property ID_Oper : integer read GetID_Oper;
  end;

implementation

uses uDM, uUnivOper_v2;

{$R *.DFM}

{ TfOperOffset }

function TfOperEmpty.CheckData: boolean;
begin
  Result := false;
  UpdateData;
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
    
  Result := true;
end;

function TfOperEmpty.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsEmptyProp;
  Result := true;
  UpdateData;
  if (FOperParamz.ID_Oper <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'BusinessName', 'Бизнес', SL);

        CompareField(CDS, 'Imp_PayBasic', 'Основание платежа', SL);
        CompareField(CDS, 'AccInv_PayAssignment', 'Пл. поручение/Счет фактура', SL);
        CompareField(CDS, 'Contract', 'Договор', SL);
        CompareField(CDS, 'OpComment', 'Описание', SL, false);
      end;
      if cdsEmptyProp.ChangeCount > 0 then
        SL.Add('изменены комментарии');

      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end; 
end;

constructor TfOperEmpty.Create(AOwner: TComponent);
begin
  inherited;
  fArc1.RxSpeedButton1.Visible := true;
end;

destructor TfOperEmpty.Destroy;
begin
  inherited;

end;

procedure TfOperEmpty.Initialize(AOperParamz : TOperParamz);
begin
  FOperParamz := AOperParamz;
  with cdsEmptyProp do
  begin
    Close;
    Params.ParamByName('@id_Oper').AsInteger := FOperParamz.ID_Oper;
  //  Params.ParamByName('@is_Mirr').AsBoolean := false;
    Open;
    with cdsEOpArc do   // Читаем список операций
    begin
      Close;
      Params.ParamByName('@id_OperParent').Value := FOperParamz.ID_Oper;
      Open;
    end;
 //   if cdsEOpArc.IsEmpty then
    begin
      DBMemo1.ReadOnly := false;
      DBMemo1.Color := clWindow;
    end;
    if (FOperParamz.ID_Oper = -1) then
    begin
      Edit;
      windows.SetFocus(DBMemo1.Handle);
      FieldByName('CreatorFIO').Value := DM.FullFIO;
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      Post;
      PageControl1.ActivePageIndex := 0;
    end
    else
    begin
      PageControl1.ActivePageIndex := 1;
      if not FieldByName('id_business').IsNull then
        fBsnSelector1.id := FieldByName('id_business').AsInteger;   
    end;
    if FOperParamz.Copy then
    begin
      Edit;
      FOperParamz.ID_Oper := -1;
      FieldByName('CreatorFIO').Value := DM.FullFIO;
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      Post;
      PageControl1.ActivePageIndex := 0;
    end;
  end;
  fArc1.dsArc.DataSet := cdsEOpArc;
  fArc1.Fid_OperParent := FOperParamz.ID_Oper;

end;

function TfOperEmpty.SaveProp: boolean;
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
    with cdsEmptyProp do
    begin
      Imp_PayBasic := FieldByName('Imp_PayBasic').Value;
      AccInv_PayAssignment := FieldByName('AccInv_PayAssignment').Value;

      id_UserCreator := DM.IDUser;
      OperTypeIn := FieldByName('OperTypeIn').AsBoolean;

      Contract := FieldByName('Contract').Value;
      OpComment := FieldByName('OpComment').Value;
      if fBsnSelector1.ID = -1 then
        id_business := Null
      else
        id_business := fBsnSelector1.ID;
    end;


    if FOperParamz.ID_Oper = -1 then // Добавляется
    begin
      FOperParamz.ID_Oper := DM.rsCA.AppServer.OP_EmptyAdd(id_UserCreator, OperTypeIn, id_DocType, Contract, OpComment, id_business, Imp_PayBasic, AccInv_PayAssignment);

      if FOperParamz.ID_Oper = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    end
    else
    begin
      if DM.rsCA.AppServer.OP_EmptyEdit(FOperParamz.ID_Oper, id_UserCreator, id_DocType, Contract, OpComment, id_business, Imp_PayBasic, AccInv_PayAssignment) <> 1 then
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


procedure TfOperEmpty.UpdateData;
var CDS : TClientDataSet;
begin
  CDS := cdsEmptyProp;

  if CDS.State <> dsEdit then
    CDS.Edit;

  CDS.FieldByName('OperTypeIn').AsBoolean := true;
  CDS.FieldByName('BusinessName').AsString := fBsnSelector1.BsnName;
  CDS.Post;
end;

function TfOperEmpty.ChangeData: boolean;
begin
  Result := true;
end;

procedure TfOperEmpty.cdsEmptyPropOperTypeInGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := 'Приходная операция'
  else
    Text := 'Расходная операция'
end;

function TfOperEmpty.GetID_Oper: integer;
begin
  Result := FOperParamz.ID_Oper;
end;

end.
