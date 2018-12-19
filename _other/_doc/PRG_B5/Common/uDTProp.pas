unit uDTProp;

interface

uses
  Windows, Messages, SysUtils, Classes, {$IFDEF VER150} Variants,{$ENDIF} Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls,
  RxLookup, Db, ADODB, Provider, MtUPDPrv, DBClient, ExtDlgs, jpeg, ImgList, frDoc,
  RXDBCtrl, RXSpin, Grids, RXCtrls, ComCtrls, ToolWin, ActnList;

type
  TDTProp = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    qDTProp: TADOQuery;
    dsCAProp: TDataSource;
    DBEdit1: TDBEdit;
    cdsDTProp: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    Label2: TLabel;
    Button1: TButton;
    DBEdit2: TDBEdit;
    qColProp: TADOQuery;
    dsColProp: TDataSource;
    ImageList: TImageList;
    ActionList1: TActionList;
    sbUp: TAction;
    sbDown: TAction;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    procedure btnOkClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sbDownExecute(Sender: TObject);
    procedure sbUpExecute(Sender: TObject);
  private
    Ftype : integer;
    Fid_DocType : Variant;
    procedure MoveRec(APos: integer);
  public
    function SaveProp : boolean;
    procedure Initialize(AType, id_DocType : integer; PID : integer; fDoc : TfDoc);
  end;
                   
var
  DTProp: TDTProp;
function ShowDTProp(AType : integer; var id_DocType : integer; PID : integer = -1; fDoc : TfDoc = nil): boolean;

implementation

uses uDM, uDTSelector;

{$R *.DFM}
function ShowDTProp(AType : integer; var id_DocType : integer; PID : integer; fDoc : TfDoc): boolean;
var F : TDTProp;
begin
 // if fDoc = nil then Exit;
 // fDoc.LoadEhColNamez;
  Result := false;
  F := TDTProp.Create(nil);
  try
    F.Initialize(AType, id_DocType, PID, fDoc);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      id_DocType := F.Fid_DocType;
    end;
  //  fDoc.initialize2(id_DocType);
  finally
    F.Free;
  end;
end;

procedure TDTProp.btnOkClick(Sender: TObject);
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


  S2 := 'SELECT id_DocType FROM DW_DocType WHERE deleted=0 and is_GRP=0 and Atype= ' + Inttostr(Ftype) + ' and id_DocType<>' + Inttostr(Fid_DocType) + 'AND  UPPER(Name) = ' + '''' + AnsiUpperCase(Trim(DBEdit1.Text)) + '''';
  S2 := S2 + ' AND id_BSN=' + IntToStr(DM.id_Bsn);
  if DM.xxx_Group_Check_v2(S2) then
  begin
    ModalResult := mrNone;
    Windows.SetFocus(DBEdit1.Handle);
    raise Exception.Create('Название "' + DBEdit1.Text + '" уже использовано');
  end;
end;

procedure TDTProp.Initialize(AType, id_DocType : integer; PID : integer; fDoc : TfDoc);
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
    begin
      cdsDTProp.FieldByName('PID').AsVariant := PID;
      cdsDTProp.FieldByName('PARENTNAME').AsVariant := DM.GetTypeName(PID);
    end;
      Post;
    end;
  end;
    case AType of
      0 :
      begin
        Caption := 'Тип документов';
        Label2.Caption := 'Категория';
        Label1.Caption := 'Название';
      end;
      5 :
      begin
        Caption := 'Юрлицо клиента';
        Label2.Caption := 'Клиент';
        Label1.Caption := 'Название';
      end;
      6 :
      begin
        Caption := 'Юрлицо оператора';
        Label2.Caption := 'Оператор';
        Label1.Caption := 'Название';
      end;
      13 :
      begin
        Caption := 'Вид события';
        Button1.Enabled := false;
        Label2.Enabled := false;
      end;
      26 :
      begin
        Caption := 'Описание события';
        Button1.Enabled := false;
        Label2.Enabled := false;
      end;
    end;

end;

function TDTProp.SaveProp: boolean;
var i, id_Icons : integer;
    ADOQ : TADOQuery;
    SCol : String;
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
    Edit;
    Post;

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
    if ADOQ.Parameters.FindParam('AType') <> nil then
      ADOQ.Parameters.ParamByName('AType').Value := FType;
    ADOQ.Parameters.ParamByName('id_BSN').Value := DM.id_Bsn;
    ADOQ.ExecSQL;
  end;
  if Fid_DocType = -1 then
  begin
    Fid_DocType := DM.GetMaxID('select max(id_DocType) AS ID FROM dw_DocType');
  end;
  Result := true;
end;

procedure TDTProp.Button1Click(Sender: TObject);
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

procedure TDTProp.MoveRec(APos: integer);
var X : integer;
begin

end;
procedure TDTProp.sbDownExecute(Sender: TObject);
begin
  MoveRec(1);

end;

procedure TDTProp.sbUpExecute(Sender: TObject);
begin
  MoveRec(-1);

end;

end.
