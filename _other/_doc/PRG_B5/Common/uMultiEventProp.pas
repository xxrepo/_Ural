unit uMultiEventProp;

interface

uses
  Windows, Messages, SysUtils, Classes, {$IFDEF VER150} Variants,{$ENDIF} Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls,
  RxLookup, Db, ADODB, Provider, MtUPDPrv, DBClient, ExtDlgs, jpeg, ImgList, frDoc,
  RXDBCtrl, RXSpin, Grids, RXCtrls, ComCtrls, ToolWin, ActnList,
  DBGridEh, Menus, RxMemDS, DBGrids, AdvMenus;

type
  TMultiEventProp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    qDTProp: TADOQuery;
    dsCAProp: TDataSource;
    cdsDTProp: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    ImageList: TImageList;
    ADOStoredProc1: TADOStoredProc;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Button1: TButton;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    RxSpeedButton1: TRxSpeedButton;
    pmEventText: TAdvPopupMenu;
    qTExt: TADOQuery;
    GroupBox2: TGroupBox;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1Num: TIntegerField;
    RxMemoryData1Rep: TStringField;
    RxMemoryData1Org: TStringField;
    RxMemoryData1Doc: TStringField;
    RxMemoryData1DocDate: TDateTimeField;
    RxMemoryData1Summ: TStringField;
    RxMemoryData1Amount: TIntegerField;
    RxMemoryData1State: TStringField;
    RxMemoryData1ID_DOCBASE: TIntegerField;
    RxMemoryData1DOCCOMMENT2: TStringField;
    DataSource1: TDataSource;
    DBGrid888: TDBGrid;
    procedure btnOkClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure miAddTextClick(Sender: TObject);
  private

  public
    function SaveProp : boolean;
    procedure Initialize(AGrid : TDBGridEh);
  end;
                   
var
  MultiEventProp: TMultiEventProp;
function ShowMultiEventProp(AGrid : TDBGridEh): boolean;

implementation

uses uDM, uDTSelector;

{$R *.DFM}
function ShowMultiEventProp(AGrid : TDBGridEh): boolean;
var F : TMultiEventProp;
begin
  Result := false;
  F := TMultiEventProp.Create(nil);
  try
    F.Initialize(AGrid);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
    end;
  //  fDoc.initialize2(id_DocType);
  finally
    F.Free;
  end;
end;

procedure TMultiEventProp.btnOkClick(Sender: TObject);
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

procedure TMultiEventProp.Initialize(AGrid : TDBGridEh);
var S : String;
    i : integer;
    MI : TMenuItem;
begin
  DoMakeMT(rmSel, AGrid, RxMemoryData1, false);

  with cdsDTProp do
  begin
    Close;
    Params.ParamByName('id_Event').Value := -1;
    Open;
  end;
  Caption := 'Новое событие';

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

function TMultiEventProp.SaveProp: boolean;
var i, id_Icons : integer;
    SCol : String;
    stm: TMemoryStream;
begin
    if cdsDTProp.State in [dsEdit, dsInsert] then cdsDTProp.Post;
 // if (Fid_CA <> -1) and (cdsCAPropID_ICONS.AsInteger > 0) then

  with cdsDTProp do
  begin

    ADOStoredProc1.Parameters.ParamByName('@EventComment').Value := cdsDTProp.fieldbyname('EventComment').AsString;
    ADOStoredProc1.Parameters.ParamByName('@ID_USER').Value := DM.id_User;



    if cdsDTProp.fieldByName('id_EventType').AsInteger > 0 then
      ADOStoredProc1.Parameters.ParamByName('@id_EventType').Value := cdsDTProp.fieldByName('id_EventType').AsInteger
    else
      ADOStoredProc1.Parameters.ParamByName('@id_EventType').Value := Null;

  end;
  with RxMemoryData1 do
  begin
    First;
    while not Eof do
    begin
      ADOStoredProc1.Parameters.ParamByName('@id_Event').Value := -1;
      ADOStoredProc1.Parameters.ParamByName('@id_DocBase').Value := RxMemoryData1.FieldByName('ID_DOCBASE').AsInteger;
      ADOStoredProc1.ExecProc;

      Next;
    end;

  end;
  Result := true;
end;

procedure TMultiEventProp.Button1Click(Sender: TObject);
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


procedure TMultiEventProp.miAddTextClick(Sender: TObject);
begin
  if cdsDTProp.State in [dsEdit, dsInsert] then cdsDTProp.Post;
  cdsDTProp.Edit;
  cdsDTProp.fieldByName('EventComment').AsString := StringReplace(TMenuItem(Sender).Caption, '&', '', []);
  cdsDTProp.Post;
end;

end.
