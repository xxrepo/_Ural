unit frOperEmptyData;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ExtCtrls, StdCtrls, Mask, DBCtrls, foMyFunc, Buttons,
  frCurSelector, ToolEdit, RXDBCtrl, ComCtrls, ActnList, Grids, DBGrids,
  ToolWin, RxLookup, frOperOldData, frArc;

type
  TfOperEmptyData = class(TFrame)
    PageControl1: TPageControl;
    ActionList1: TActionList;
    aCommentNew: TAction;
    aCommentProp: TAction;
    aCommentDel: TAction;
    TabSheet1: TTabSheet;
    cdsEmptyProp: TClientDataSet;
    cdsEmptyPropid_Oper: TAutoIncField;
    cdsEmptyPropOperVid: TIntegerField;
    cdsEmptyPropOperTypeIn: TBooleanField;
    cdsEmptyPropid_UserCreator: TIntegerField;
    cdsEmptyPropCreatorFIO: TStringField;
    cdsEmptyPropManagerFIO: TStringField;
    cdsEmptyPropDateLocal: TDateTimeField;
    cdsEmptyPropBody: TStringField;
    Panel1: TPanel;
    Label9: TLabel;
    Panel3: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    DBEdit5: TDBEdit;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    cdsEmptyPropid_OperParent: TIntegerField;
    procedure cdsEmptyPropOperTypeInGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    FID_Oper : integer;
  public
    function ChangeData : boolean;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    procedure Initialize(ID_Oper : integer);

    property ID_Oper : integer read FID_Oper;
  end;

implementation

uses uDM, uUnivOper_v2;

{$R *.DFM}

{ TfOperOffset }

function TfOperEmptyData.CheckData: boolean;
begin
  Result := false;
  UpdateData;
{  with cbOperTypeIn do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран тип операции', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with DBEdit6 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введен чужой объект', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with DBEdit2 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введена сумма', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with fCurSelector1.cbCur do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбрана валюта расчета', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;  }
    
  Result := true;
end;

function TfOperEmptyData.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
{  Result := false;
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
        CompareField(CDS, 'SrcName', 'Счет', SL);
        CompareField(CDS, 'AcName', 'Склад', SL);
        CompareField(CDS, 'ReprName', 'Получатель', SL);
        CompareField(CDS, 'ReprWHName', 'Склад представителя', SL);

        CompareField(CDS, 'BusinessName', 'Бизнес', SL);

        CompareField(CDS, 'WareName', 'Товар', SL);
  //      CompareField(CDS, 'AmountOper', 'Количество', SL);
        CompareField(CDS, 'MeasureName', 'Единица измерения', SL);

        CompareField(CDS, 'PriceOper', 'Сумма', SL);
        CompareField(CDS, 'CurrencyOperName', 'Валюта', SL);

        CompareField(CDS, 'PriceInv', 'Себестоисомть', SL);
        CompareField(CDS, 'CurrencyInvName', 'Валюта себестоимости', SL);

        CompareField(CDS, 'ManagerFIO', 'Сотрудник', SL);
        CompareField(CDS, 'FormalDistribName', 'Формальное распределение', SL);
        CompareField(CDS, 'FuncDistribName', 'Функциональное распределение', SL);
        CompareField(CDS, 'Koeff', 'Суть операции', SL, false);
      end;
      if cdsOperComment.ChangeCount > 0 then
        SL.Add('изменены комментарии');

      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end; }
end;

constructor TfOperEmptyData.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TfOperEmptyData.Destroy;
begin
  inherited;

end;

procedure TfOperEmptyData.Initialize(ID_Oper: integer);
begin
  FID_Oper := ID_Oper;
  with cdsEmptyProp do
  begin
    Close;
    Params.ParamByName('@id_Oper').AsInteger := FID_Oper;
    Open;
    if FID_Oper = -1 then
    begin
      Edit;
 //     FieldByName('AmountOper').Value := 1;
      FieldByName('Correct').AsBoolean := false;
  //    FieldByName('id_Replicator').AsInteger := Null;    //1013
      FieldByName('id_UserCreator').AsInteger := DM.IDUser;
      Post;
    end
    else
    begin

    end;
  end;
  PageControl1.ActivePageIndex := 0;
end;

function TfOperEmptyData.SaveProp: boolean;
begin
end;

procedure TfOperEmptyData.UpdateData;
var CDS : TClientDataSet;
begin
end;

function TfOperEmptyData.ChangeData: boolean;
begin
  Result := true;
end;

procedure TfOperEmptyData.cdsEmptyPropOperTypeInGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := 'Приходная операция'
  else
    Text := 'Расходная операция'
end;

end.
