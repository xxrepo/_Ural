unit frCurProp;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ComCtrls, Grids, DBGrids, RXDBCtrl, StdCtrls, DBCtrls, Mask,
  RxLookup, ToolEdit, CurrEdit, TaskDialog;

type
  TfCurProp = class(TFrame)
    cdsCurProp: TClientDataSet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    dsCurProp: TDataSource;
    DBEdit6: TRxDBCalcEdit;
    cdsCurPropId_Cur: TAutoIncField;
    cdsCurPropISOCode: TStringField;
    cdsCurPropNumberCode: TStringField;
    cdsCurPropValue: TIntegerField;
    cdsCurPropRate: TBCDField;
    cdsCurPropAvForPay: TBooleanField;
    cdsCurPropLastUpdated: TBytesField;
    cdsCurPropID_Main: TIntegerField;
    cdsCurPropBase: TBooleanField;
    cdsCurPropCurName: TStringField;
    cdsCurPropCurShortName: TStringField;
    cdsCurPropColNum: TIntegerField;
    cdsCurPropOrderNum: TIntegerField;
    procedure dbgContactCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure dbgContactGetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
  private
    FIDObj : integer;
    function GetObjName: String;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure initialize(AID : integer);
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
    property ObjName : String read GetObjName;
    property ObjID : integer read FIDObj;
  end;

implementation

uses foMyFunc, uDM;

{$R *.DFM}

{ TfCntrAgentProp }

function TfCurProp.CheckData: boolean;
begin
  Result := false;
  with DBEdit1 do
    if trim(Text) = '' then
    begin
      AdvMessageBox(Handle, 'Не введено название', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with DBEdit2 do
    if trim(Text) = '' then
    begin
      AdvMessageBox(Handle, 'Не введено короткое название', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
 { with DBEdit3 do
    if trim(Text) = '' then
    begin
      AdvMessageBox(Handle, 'Не введен код ISO', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end; }
  with DBEdit5 do
    if trim(Text) = '' then
    begin
      AdvMessageBox(Handle, 'Не введено "единиц к обмену"', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with DBEdit5 do
    if (cdsCurPropValue.AsInteger <= 0) and (Enabled) then
    begin
      AdvMessageBox(Handle, 'Число "единиц к обмену" должно быть больше нуля', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with DBEdit6 do
    if (trim(Text) = '') and (Enabled) then
    begin
      AdvMessageBox(Handle, 'Не введен курс', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  Result := true;
end;



function TfCurProp.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsCurProp;
  Result := true;
  UpdateData;
  if (FIDObj <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'Name', 'название', SL);
        CompareField(CDS, 'ShortName', 'короткое название', SL);
        CompareField(CDS, 'ISOCode', 'код ISO', SL);
        CompareField(CDS, 'NumberCode', 'цифровой код', SL);
        CompareField(CDS, 'Value', 'единиц к обмену', SL);
        CompareField(CDS, 'Rate', 'курс', SL, true, '0.0000');
      end;
      if SL.Count > 0 then
        Result := AdvMessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

constructor TfCurProp.Create(AOwner: TComponent);
begin
  inherited;
  
end;

destructor TfCurProp.Destroy;
begin
  inherited;

end;

function TfCurProp.SaveProp: boolean;
var OldCursor : TCursor;
    AName, ShortName, ISOCode, NumberCode: OleVariant;
    AValue: Integer;
    Rate: OleVariant;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  UpdateData;
  BeginTruns(DM.rsCA);
  try
    if not cdsCurProp.FieldByName('Base').AsBoolean then
      Rate := cdsCurProp.FieldByName('Rate').AsFloat
    else
      Rate := 1;

    if FIDObj = -1 then // Добавляется
    begin
      FIDObj := DM.rsCA.AppServer.CurrencyAdd(AName, ShortName, ISOCode, NumberCode, AValue, Rate);
      if FIDObj = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    end
    else
    begin
      if DM.rsCA.AppServer.CurrencyEdit(FIDObj, Rate) <> 1 then
        raise Exception.Create('Ошибка при сохранении свойств');
    end;

    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;
end;

procedure TfCurProp.UpdateData;
begin
  if cdsCurProp.State = dsEdit then
    cdsCurProp.Post
end;

procedure TfCurProp.dbgContactCheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfCurProp.dbgContactGetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfCurProp.initialize(AID: integer);
begin
  FIDObj := AID;
  with cdsCurProp do
  begin
    Close;
    Params.ParamByName('@Id_Cur').AsInteger := FIDObj;
    Open;
    DBEdit5.Enabled := not FieldByName('Base').AsBoolean;
    DBEdit6.Enabled := not FieldByName('Base').AsBoolean;
  end;
end;

function TfCurProp.GetObjName: String;
begin
  Result := cdsCurPropCurName.AsString;
end;

end.
