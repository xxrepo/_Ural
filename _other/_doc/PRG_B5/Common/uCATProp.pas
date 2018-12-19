unit uCATProp;

interface

uses
  Windows, Messages, SysUtils, Classes, {$IFDEF VER150} Variants,{$ENDIF} Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls,
  RxLookup, Db, ADODB, Provider, MtUPDPrv, DBClient, ExtDlgs, jpeg, ImgList,
  RXDBCtrl, RXSpin, Grids;

type
  TCATProp = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    qDTProp: TADOQuery;
    dsCAProp: TDataSource;
    DBEdit1: TDBEdit;
    cdsDTProp: TClientDataSet;
    dspDTProp: TDataSetProvider;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    Label2: TLabel;
    Button1: TButton;
    DBEdit2: TDBEdit;
    procedure btnOkClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    Ftype : integer;
    Fid_DocType : Variant;
  public
    function SaveProp : boolean;
    procedure Initialize(AType, id_DocType : integer; PID : integer);
  end;
                   
var
  CATProp: TCATProp;
function ShowCATProp(AType : integer; var id_DocType : integer; PID : integer = -1): boolean;

implementation

uses uDM, uDTSelector;

{$R *.DFM}
function ShowCATProp(AType : integer; var id_DocType : integer; PID : integer): boolean;
var F : TCATProp;
begin
  Result := false;
  F := TCATProp.Create(nil);
  try
    F.Initialize(AType, id_DocType, PID);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      id_DocType := F.Fid_DocType;
    end;
  finally
    F.Free;
  end;
end;

procedure TCATProp.btnOkClick(Sender: TObject);
var S2 : String;
begin
  if cdsDTProp.State in [dsEdit, dsInsert] then cdsDTProp.Post;
  if DBEdit1.Text = '' then
  begin
    MessageBox(Handle, 'Name not input!', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(DBEdit1.Handle);
    ModalResult := mrNone;
    Exit;
  end;


  S2 := 'SELECT id_DocType FROM DW_DocType WHERE deleted=0 and Atype= ' + Inttostr(Ftype) + 'and id_DocType<>' + Inttostr(Fid_DocType) + 'AND  UPPER(Name) = ' + '''' + AnsiUpperCase(Trim(DBEdit1.Text)) + '''';
  S2 := S2 + ' AND id_BSN=' + IntToStr(DM.id_Bsn);
  if DM.xxx_Group_Check_v2(S2) then
  begin
    ModalResult := mrNone;
    Windows.SetFocus(DBEdit1.Handle);
    raise Exception.Create('Название "' + DBEdit1.Text + '" уже использовано');
  end;
end;

procedure TCATProp.Initialize(AType, id_DocType : integer; PID : integer);
var S : String;
    i : integer;
begin
  Ftype := AType;
  Fid_DocType := id_DocType;

  with cdsDTProp do
  begin
    Close;
    Params.ParamByName('id_DocType').Value := Fid_DocType;
    Open;
    if Fid_DocType = -1 then
    begin
      Edit;
      cdsDTProp.FieldByName('id_BSN').AsVariant := DM.id_Bsn;
      if PID > 0 then
        cdsDTProp.FieldByName('PID').AsVariant := PID;
      Post;
    end;
  end;

    case AType of
      0 :
      begin
        Caption := 'Категория документов';
        Label2.Caption := 'Род. категория';
        Label1.Caption := 'Название';
      end;
      5 :
      begin
        Caption := 'Клиент';
        Label2.Caption := 'Род. клиент';
        Label1.Caption := 'Название';
        Button1.enabled := false;
      end;
      6 :
      begin
        Caption := 'Оператор';
        Label2.Caption := 'Род. оператор';
        Label1.Caption := 'Название';
        Button1.enabled := false;
      end;
      13 :
      begin
        Caption := 'Вид события';
      end;
      26 :
      begin
        Caption := 'Описание события';
      end;
    end;

end;

function TCATProp.SaveProp: boolean;
var i, id_Icons : integer;
    ADOQ : TADOQuery;
    stm: TMemoryStream;
begin
    if cdsDTProp.State in [dsEdit, dsInsert] then cdsDTProp.Post;
 // if (Fid_CA <> -1) and (cdsCAPropID_ICONS.AsInteger > 0) then

  if Fid_DocType = -1 then
    ADOQ := ADOQuery1
  else
    ADOQ := ADOQuery2;

  with cdsDTProp do
  begin
    if cdsDTProp.State in [dsEdit, dsInsert] then cdsDTProp.Post;

    for i := 0 to ADOQ.Parameters.Count - 1 do
    begin
      if FindField(ADOQ.Parameters[i].Name) <> nil then
      begin
        ADOQ.Parameters[i].Value := cdsDTProp.FindField(ADOQ.Parameters[i].Name).Value;
      //  ADOQ.Parameters[i].DataType := TDataType(FindField(ADOQ.Parameters[i].Name).FieldKind);
      end;
    end;
    if Fid_DocType > -1 then
      ADOQ.Parameters.ParamByName('id_DocType').Value := Fid_DocType;

    if ADOQ.Parameters.FindParam('AType') <> nil then ADOQ.Parameters.ParamByName('AType').Value := FType;
    ADOQ.ExecSQL;
  end;
  if Fid_DocType = -1 then
  begin
    Fid_DocType := DM.GetMaxID('select max(id_DocType) AS ID FROM dw_DocType');
  end;
  Result := true;
end;

procedure TCATProp.Button1Click(Sender: TObject);
var id_DocType : integer;
    AName : String;
begin
  id_DocType := cdsDTProp.fieldByName('PID').AsInteger;
  if ShowDTSelector(Ftype, id_DocType, AName, true) then
  begin
    cdsDTProp.Edit;
    cdsDTProp.fieldByName('PID').AsInteger := id_DocType;
    cdsDTProp.fieldByName('ParentName').AsString := AName;
    cdsDTProp.Post;
  end;
end;

end.
