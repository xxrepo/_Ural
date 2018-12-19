unit uEventProp;

interface

uses
  Windows, Messages, SysUtils, Classes, {$IFDEF VER150} Variants,{$ENDIF} Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls,
  RxLookup, Db, ADODB, Provider, MtUPDPrv, DBClient, ExtDlgs, jpeg, ImgList, frDoc,
  RXDBCtrl, RXSpin, Grids, RXCtrls, ComCtrls, ToolWin, ActnList,
  frDocProp, Menus, AdvMenus;

type
  TEventProp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    qDTProp: TADOQuery;
    dsCAProp: TDataSource;
    cdsDTProp: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    ImageList: TImageList;
    ActionList1: TActionList;
    sbUp: TAction;
    sbDown: TAction;
    ADOStoredProc1: TADOStoredProc;
    fDocProp1: TfDocProp;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Button1: TButton;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    RxSpeedButton1: TRxSpeedButton;
    pmEventText: TAdvPopupMenu;
    qTExt: TADOQuery;
    DBDateEdit2: TDBDateEdit;
    Label5: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sbDownExecute(Sender: TObject);
    procedure sbUpExecute(Sender: TObject);
    procedure miAddTextClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Fid_Event, Fid_DocBase : integer;
    procedure MoveRec(APos: integer);
  public
    function SaveProp : boolean;
    procedure Initialize(id_Event : integer; id_DocBase : integer);
  end;
                   
var
  EventProp: TEventProp;
function ShowEventProp(var id_Event : integer; id_DocBase : integer): boolean;

implementation

uses uDM, uDTSelector, foMyFunc;

{$R *.DFM}
function ShowEventProp(var id_Event : integer; id_DocBase : integer): boolean;
var F : TEventProp;
begin
  Result := false;
  F := TEventProp.Create(nil);
  try
    F.Initialize(id_Event, id_DocBase);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      id_Event := F.Fid_Event;
    end;
  //  fDoc.initialize2(id_DocType);
  finally
    F.Free;
  end;
end;

procedure TEventProp.btnOkClick(Sender: TObject);
var S2 : String;
begin
{  if cdsDTProp.State in [dsEdit, dsInsert] then cdsDTProp.Post;
  if DBEdit1.Text = '' then
  begin
    MessageBox(Handle, 'Не введено событие!', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(DBEdit1.Handle);
    ModalResult := mrNone;
    Exit;
  end;    }


end;

procedure TEventProp.Initialize(id_Event : integer; id_DocBase : integer);
var S : String;
    i : integer;
    MI : TMenuItem;
begin
  Fid_DocBase := id_DocBase;
  Fid_Event := id_Event;
  fDocProp1.Initialize(false, Fid_DocBase, -1, -1);
  fDocProp1.BlockData;
  with cdsDTProp do
  begin
    Close;
    Params.ParamByName('id_Event').Value := Fid_Event;
    Open;
    if Fid_Event = -1 then
    begin

    end;
  end;
  if Fid_Event = -1 then
    Caption := 'Новое событие'
  else
    Caption := copy( cdsDTProp.FieldByName('EventComment').AsString, 1, 100);

  with qTExt do
  begin
    Close;
    Open;
    First;
    while not Eof do
    begin
      MI := TMenuItem.Create(Self);
      MI.Caption := Copy(FieldByName('Name').AsString, 1, 100);
      MI.OnClick := miAddTextClick;
      pmEventText.Items.Add(MI);
      Next;
    end;
    Close;
  end;
end;

function TEventProp.SaveProp: boolean;
var i, id_Icons : integer;
    SCol : String;
    stm: TMemoryStream;
begin
    if cdsDTProp.State in [dsEdit, dsInsert] then cdsDTProp.Post;
 // if (Fid_CA <> -1) and (cdsCAPropID_ICONS.AsInteger > 0) then

  with cdsDTProp do
  begin

    ADOStoredProc1.Parameters.ParamByName('@xDate').Value := cdsDTProp.fieldbyname('DateCreate').AsDateTime;
    ADOStoredProc1.Parameters.ParamByName('@EventComment').Value := cdsDTProp.fieldbyname('EventComment').AsString;
    ADOStoredProc1.Parameters.ParamByName('@ID_USER').Value := DM.id_User;

    ADOStoredProc1.Parameters.ParamByName('@id_Event').Value := Fid_Event;
    ADOStoredProc1.Parameters.ParamByName('@id_DocBase').Value := Fid_DocBase;
    if cdsDTProp.fieldByName('id_EventType').AsInteger > 0 then
      ADOStoredProc1.Parameters.ParamByName('@id_EventType').Value := cdsDTProp.fieldByName('id_EventType').AsInteger
    else
      ADOStoredProc1.Parameters.ParamByName('@id_EventType').Value := Null;
    ADOStoredProc1.ExecProc;
  end;
  if Fid_Event = -1 then
  begin
    Fid_Event := ADOStoredProc1.Parameters.ParamValues['@RETURN_VALUE'];
  end;
  Result := true;
end;

procedure TEventProp.Button1Click(Sender: TObject);
var id_EventType : integer;
    AName : String;
begin
  id_EventType := cdsDTProp.fieldByName('id_EventType').AsInteger;
  if ShowDTSelector(13, id_EventType, AName, false) then
  begin
    cdsDTProp.Edit;
    cdsDTProp.fieldByName('id_EventType').AsInteger := id_EventType;
    cdsDTProp.fieldByName('ParentName').AsString := AName;
    cdsDTProp.Post;
  end;
end;

procedure TEventProp.MoveRec(APos: integer);
var X : integer;
begin

end;
procedure TEventProp.sbDownExecute(Sender: TObject);
begin
  MoveRec(1);

end;

procedure TEventProp.sbUpExecute(Sender: TObject);
begin
  MoveRec(-1);

end;

procedure TEventProp.miAddTextClick(Sender: TObject);
begin
  if cdsDTProp.State in [dsEdit, dsInsert] then cdsDTProp.Post;
  cdsDTProp.Edit;
  cdsDTProp.fieldByName('EventComment').AsString := StringReplace(TMenuItem(Sender).Caption, '&', '', []);
  cdsDTProp.Post;
end;

procedure TEventProp.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);

end;

procedure TEventProp.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);

end;

end.
