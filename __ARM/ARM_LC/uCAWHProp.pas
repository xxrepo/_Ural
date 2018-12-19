unit uCAWHProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Db, DBClient, foMyFunc, Mask, DBCtrls;

type
  TCAWHProp = class(TForm)
    Panel1: TPanel;
    OkButton: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cdsCAWHProp: TClientDataSet;
    cdsCAWHPropid_CAWhouse: TAutoIncField;
    cdsCAWHPropid_Repr: TIntegerField;
    cdsCAWHPropName: TStringField;
    cdsCAWHPropAddr: TStringField;
    cdsCAWHPropDescr: TStringField;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
  private
    Fid_CAWhouse : integer;
    Fid_Repr : Variant;
  protected
    function SaveProp : boolean;
    procedure UpdateData;
    function ConfirmChanges : boolean;
    function CheckData : boolean;
  public
    procedure Initialize(Aid_CAWhouse : integer; Aid_Repr : Variant);
  end;

var
  CAWHProp: TCAWHProp;

function EditCAWHPProp(var Aid_CAWhouse : Variant; Aid_Repr : Variant)  : boolean;

implementation
     uses uDM, uMainForm;

{$R *.DFM}

{ TCAWHProp }

function EditCAWHPProp(var Aid_CAWhouse : Variant; Aid_Repr : Variant)  : boolean;
var F : TCAWHProp;
begin
  Result := false;
  F := TCAWHProp.Create(MainForm);
  try
    F.Initialize(Aid_CAWhouse, Aid_Repr);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      Aid_CAWhouse := F.Fid_CAWhouse;
    end;
  finally
    F.Free;
  end;
end;

function TCAWHProp.CheckData: boolean;
begin
  Result := false;
  UpdateData;
  with DBEdit1 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введено наименование', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;

  Result := true;
end;

function TCAWHProp.ConfirmChanges: boolean;
var SL : TStringList;
    CDS : TClientDataSet;
begin
  Result := false;
  if not CheckData then
    Exit;
  CDS := cdsCAWHProp;
  Result := true;
  UpdateData;
  if (Fid_CAWhouse <> -1) then
  begin
    SL := TStringList.Create;
    try
      if (CDS.ChangeCount > 0) then
      begin
        CompareField(CDS, 'Name', 'Наименование', SL);

        CompareField(CDS, 'Addr', 'адрес', SL, false);
        CompareField(CDS, 'Descr', 'описание', SL, false);
      end;

      if SL.Count > 0 then
        Result := MessageBox(Handle, PChar('Были изменены следующие данные:' + #13 + #10 + SL.Text ), 'Подтвердите изменения', MB_YESNO + MB_ICONQUESTION) = idYes;
    finally
      SL.Free;
    end;
  end;
end;

procedure TCAWHProp.Initialize(Aid_CAWhouse: integer; Aid_Repr : Variant);
begin
  Fid_CAWhouse := Aid_CAWhouse;
  Fid_Repr := Aid_Repr;

  with cdsCAWHProp do
  begin
    Close;
    Params.ParamByName('@id_CAWhouse').AsInteger := Fid_CAWhouse;
    Open;
    if Fid_CAWhouse = -1 then
    begin
      Edit;
      FieldByName('id_Repr').Value := Fid_Repr;
      Post;
    end;
  end;
  if Aid_CAWhouse = -1 then
    Caption := 'Добавляется новый склад'
  else
    Caption := 'Редактирование данных о складе';
end;

function TCAWHProp.SaveProp: boolean;
var OldCursor : TCursor;
    id_Repr : integer;
    AName, Addr, Descr: OleVariant;
begin
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
    AName := cdsCAWHPropName.AsString;
    id_Repr := cdsCAWHProp.FieldByName('id_Repr').Value;
    if trim(cdsCAWHProp.FieldByName('Addr').AsString) = '' then
      Addr := Null
    else
      Addr := cdsCAWHProp.FieldByName('Addr').Value;
      
    if trim(cdsCAWHProp.FieldByName('Descr').AsString) = '' then
      Descr := Null
    else
      Descr := cdsCAWHProp.FieldByName('Descr').Value;

    if Fid_CAWhouse = -1 then // Добавляется
    begin
      Fid_CAWhouse := DM.rsCA.AppServer.CA_CAWhouseAdd(id_Repr, AName, Addr, Descr);

      if Fid_CAWhouse = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    end
    else
    begin
      if DM.rsCA.AppServer.CA_CAWhouseEdit(Fid_CAWhouse, id_Repr, AName, Addr, Descr) <> 1 then
        raise Exception.Create('Ошибка при сохранении свойств');
    end;
    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;

end;

procedure TCAWHProp.UpdateData;
begin

end;

end.
