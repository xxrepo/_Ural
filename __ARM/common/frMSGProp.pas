unit frMSGProp;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, StdCtrls, Mask, DBCtrls, ExtCtrls, RxLookup, Registry;

type
  TfMSGProp = class(TFrame)
    cdsMSGPr: TClientDataSet;
    cdsMSGPrid_Msg: TAutoIncField;
    cdsMSGPrBody: TStringField;
    cdsMSGPrDateCreate: TDateTimeField;
    cdsMSGPrid_User: TIntegerField;
    cdsMSGPrWasRead: TBooleanField;
    cdsMSGPrDateClose: TDateTimeField;
    cdsMSGPrRepBody: TStringField;
    cdsMSGPrid_State: TIntegerField;
    cdsMSGPrStateName: TStringField;
    cdsMSGPrFIO: TStringField;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    cdsMSGState: TClientDataSet;
    DataSource2: TDataSource;
    cdsMSGStateid_State: TAutoIncField;
    cdsMSGStateStateName: TStringField;
    cdsMSGStateOrdNum: TIntegerField;
    Panel3: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    GroupBox2: TGroupBox;
    DBMemo2: TDBMemo;
  private
    Fid_MSG: integer;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    procedure Initialize(id_MSG : integer);
    function SaveProp : boolean;
    function CheckData : boolean;

    procedure SetMayEdit;

    property ID_MSG : integer read Fid_MSG;
  end;

implementation

uses uDM, foMyFunc;

{$R *.DFM}

{ TfMSGProp }

function TfMSGProp.CheckData: boolean;
begin
  Result := false;
  with DBMemo1 do
    if trim(Lines.Text) = '' then
    begin
      MessageBox(Handle, 'Не введено сообщение', '', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  Result := true;
end;

constructor TfMSGProp.Create(AOwner: TComponent);
var i : integer;
    Reg : TRegistry;
    FullRegPathName : String;
begin
  inherited;
  if Owner is TCustomForm then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      FullRegPathName := SRegPath + '\' + ClassName + TCustomForm(Owner).ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        if Reg.ValueExists('GroupBox2Height') then
          GroupBox2.Height := Reg.ReadInteger('GroupBox2Height');
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
end;

destructor TfMSGProp.Destroy;
var i : integer;
    Reg : TRegistry;
    FullRegPathName : String;
begin
  if Owner is TCustomForm then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;

      FullRegPathName := SRegPath + '\' + ClassName + TCustomForm(Owner).ClassName;
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        Reg.WriteInteger('GroupBox2Height', GroupBox2.Height);
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  inherited;
end;

procedure TfMSGProp.Initialize(id_MSG: integer);
begin
  Fid_MSG := id_MSG;
  with cdsMSGState do
  begin
    Close;
    Open;
  end;
  with cdsMSGPr do
  begin
    Close;
    Params.ParamByName('@id_MSG').Value := id_MSG;
    Open;
    if not FieldByName('DateClose').IsNull then
    begin
      DBMemo1.ReadOnly := true;
      DBMemo1.Color := clMenu;

      DBMemo2.ReadOnly := true;
      DBMemo2.Color := clMenu;

      RxDBLookupCombo1.ReadOnly := true;
    end;
    if FieldByName('WasRead').AsBoolean then
    begin
      DBMemo1.ReadOnly := true;
      DBMemo1.Color := clMenu;
    end;
  end;
end;

function TfMSGProp.SaveProp: boolean;
var Body: OleVariant;
    id_User: Integer;
    WasRead: WordBool;
    DateClose, RepBody, id_State: OleVariant;
    OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  Body := cdsMSGPrBody.AsString;
  id_User := DM.IDUser;        
  WasRead := cdsMSGPrWasRead.AsBoolean;

  DateClose := cdsMSGPr.FieldByName('DateClose').Value;
  if not cdsMSGPrRepBody.IsNull then
    RepBody := cdsMSGPrRepBody.AsString
  else
    RepBody := Null;
  id_State := cdsMSGPr.FieldByName('id_State').Value;

  BeginTruns(DM.rsCA);
  try
    if Fid_MSG = -1 then // Добавляется
    begin
      Fid_MSG := DM.rsCA.AppServer.MSG_Add(Body, id_User, WasRead, DateClose, RepBody, id_State);

      if Fid_MSG = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    end
    else
    begin
      if DM.rsCA.AppServer.MSG_Edit(Fid_MSG,
                                    Body, cdsMSGPrid_User.AsInteger, WasRead, DateClose, RepBody, id_State) <> 1 then
          raise Exception.Create('Ошибка при сохранении свойств');
    end;
    CommitTrans(DM.rsCA);
    Result := true;
  except
    on E : Exception do
    begin
      Screen.Cursor := OldCursor;
      RollbackTrans(DM.rsCA);
      raise Exception.Create(E.Message);
    end;
  end;
  Screen.Cursor := OldCursor;    
end;

procedure TfMSGProp.SetMayEdit;
begin
  if cdsMSGPr.FieldByName('DateClose').IsNull then
  begin
    DBMemo2.ReadOnly := false;
    DBMemo2.Color := clWindow;

    RxDBLookupCombo1.ReadOnly := false;
  end;
end;

end.
