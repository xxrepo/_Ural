unit frDocProp;

interface

uses
  Windows, Messages, {$IFDEF VER150} Variants,{$ENDIF} SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls,
  RxLookup, Db, ADODB, Provider, MtUPDPrv, DBClient, ExtDlgs, jpeg, ImgList,
  RXDBCtrl, ComCtrls, ActnList, ToolWin, Grids, DBGrids, Clipbrd;

type
  TfDocProp = class(TFrame)
    qDocProp2: TADOQuery;
    dsDocProp: TDataSource;
    cdsDocProp: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    dsCur: TDataSource;
    qCur: TADOQuery;
    lbDTNAME: TLabel;
    lbDOCDATE: TLabel;
    lbNUM: TLabel;
    Label8: TLabel;
    lbDOCCOMMENT: TLabel;
    lbSUMM: TLabel;
    lbCURNAME: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Button1: TButton;
    ceSUMM: TRxDBCalcEdit;
    lcCURNAME: TRxDBLookupCombo;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    RxDBCalcEdit1: TRxDBCalcEdit;
    DBDateEdit2: TDBDateEdit;
    edDATECREATE: TDBDateEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Button2: TButton;
    Button3: TButton;
    DBMemo1: TDBMemo;
    DBEdit6: TDBEdit;
    Label3: TLabel;
    Bevel1: TBevel;
    qDocProp2ID_DOCBASE: TAutoIncField;
    qDocProp2NAME: TStringField;
    qDocProp2ID_DOCTYPE: TIntegerField;
    qDocProp2NUM: TStringField;
    qDocProp2DATECREATE: TDateTimeField;
    qDocProp2DOCDATE: TDateTimeField;
    qDocProp2ID_CA: TIntegerField;
    qDocProp2id_REP: TIntegerField;
    qDocProp2DOCCOMMENT2: TStringField;
    qDocProp2DELETED: TIntegerField;
    qDocProp2SUMM: TFloatField;
    qDocProp2ID_CUR: TIntegerField;
    qDocProp2COL1: TStringField;
    qDocProp2COL2: TStringField;
    qDocProp2COL3: TStringField;
    qDocProp2COL4: TStringField;
    qDocProp2COL5: TStringField;
    qDocProp2COL6: TStringField;
    qDocProp2COL7: TStringField;
    qDocProp2COL8: TStringField;
    qDocProp2COL9: TStringField;
    qDocProp2COL10: TStringField;
    qDocProp2EV_Date: TDateTimeField;
    qDocProp2EV_EventComment: TStringField;
    qDocProp2DateClosed: TDateTimeField;
    qDocProp2Amount: TIntegerField;
    qDocProp2HasFormPrint: TBooleanField;
    qDocProp2HasFormEl: TBooleanField;
    qDocProp2RedDate: TDateTimeField;
    qDocProp2id_EventType: TIntegerField;
    qDocProp2id_BSN: TIntegerField;
    qDocProp2DTName: TStringField;
    qDocProp2OrgName: TStringField;
    qDocProp2ID_CAParent: TAutoIncField;
    qDocProp2OrgNameParent: TStringField;
    qDocProp2RepName: TStringField;
    qDocProp2ID_RepParent: TAutoIncField;
    qDocProp2RepNameParent: TStringField;
    qDocProp2CURNAME: TStringField;
    qDocProp2EventTypeName: TStringField;
    qDocProp2XDay: TIntegerField;
    cdsDocPropID_DOCBASE: TAutoIncField;
    cdsDocPropNAME: TStringField;
    cdsDocPropID_DOCTYPE: TIntegerField;
    cdsDocPropNUM: TStringField;
    cdsDocPropDATECREATE: TDateTimeField;
    cdsDocPropDOCDATE: TDateTimeField;
    cdsDocPropID_CA: TIntegerField;
    cdsDocPropid_REP: TIntegerField;
    cdsDocPropDOCCOMMENT2: TStringField;
    cdsDocPropDELETED: TIntegerField;
    cdsDocPropSUMM: TFloatField;
    cdsDocPropID_CUR: TIntegerField;
    cdsDocPropCOL1: TStringField;
    cdsDocPropCOL2: TStringField;
    cdsDocPropCOL3: TStringField;
    cdsDocPropCOL4: TStringField;
    cdsDocPropCOL5: TStringField;
    cdsDocPropCOL6: TStringField;
    cdsDocPropCOL7: TStringField;
    cdsDocPropCOL8: TStringField;
    cdsDocPropCOL9: TStringField;
    cdsDocPropCOL10: TStringField;
    cdsDocPropEV_Date: TDateTimeField;
    cdsDocPropEV_EventComment: TStringField;
    cdsDocPropDateClosed: TDateTimeField;
    cdsDocPropAmount: TIntegerField;
    cdsDocPropHasFormPrint: TBooleanField;
    cdsDocPropHasFormEl: TBooleanField;
    cdsDocPropRedDate: TDateTimeField;
    cdsDocPropid_EventType: TIntegerField;
    cdsDocPropid_BSN: TIntegerField;
    cdsDocPropDTName: TStringField;
    cdsDocPropOrgName: TStringField;
    cdsDocPropID_CAParent: TAutoIncField;
    cdsDocPropOrgNameParent: TStringField;
    cdsDocPropRepName: TStringField;
    cdsDocPropID_RepParent: TAutoIncField;
    cdsDocPropRepNameParent: TStringField;
    cdsDocPropCURNAME: TStringField;
    cdsDocPropEventTypeName: TStringField;
    cdsDocPropXDay: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ceSUMMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ceSUMMKeyPress(Sender: TObject; var Key: Char);
  private

    procedure ChType;
  public
    Fid_DocBase : Variant;
    function SaveProp : boolean;
    procedure BlockData;
    procedure Initialize(ACopy  :boolean; id_DocBase : integer; id_DocType : integer; id_CA : integer);
  end;
                   
implementation

uses uDM, foMyFunc, uDTSelector;

{$R *.DFM}

procedure TfDocProp.Initialize(ACopy  :boolean; id_DocBase: integer; id_DocType : integer; id_CA : integer);
var S : String;
   Year, Month, Day: Word;
begin
  DisableControl(DBEdit6);
  DisableControl(DBEdit5);
  DisableControl(DBDateEdit2);
  qCur.Open;
  Fid_DocBase := id_DocBase;

  with cdsDocProp do
  begin
    Close;
    Params.ParamByName('id_DocBase').Value := Fid_DocBase;
    Open;
    if (Fid_DocBase = -1) then
    begin
      Edit;
      cdsDocProp.FieldByName('id_BSN').AsVariant := DM.id_Bsn;
      cdsDocProp.FieldByName('HasFormPrint').AsBoolean := false;
      cdsDocProp.FieldByName('HasFormEl').AsBoolean := false;
      if (id_DocType > 0) then
      begin
        cdsDocProp.FieldByName('ID_DOCTYPE').AsInteger := id_DocType;
        cdsDocProp.FieldByName('DTNAME').AsString := DM.GetName('select Name from DW_DocType where id_DocType=' + IntToStr(id_DocType));
      end;
      if (id_CA > 0) then
      begin
        cdsDocProp.FieldByName('id_CA').AsInteger := id_CA;
      end;
      Post;
    end;
  end;
  if ACopy then
  begin
     Fid_DocBase := -1;
     cdsDocProp.Edit;
     cdsDocProp.FieldByName('DateCreate').AsVariant := now;
     cdsDocProp.FieldByName('DateClosed').AsVariant := null;
     cdsDocProp.FieldByName('EventTypeName').AsVariant := null;
     cdsDocProp.FieldByName('EV_EventComment').AsVariant := null;
     cdsDocProp.FieldByName('EV_Date').AsVariant := null;
     cdsDocProp.FieldByName('id_EventType').AsVariant := null;
     cdsDocProp.Post;
  end;
  if Fid_DocBase = -1 then
    Caption := 'Новый документ'
  else
    Caption := cdsDocProp.FieldByName('NAME').AsString;

  ChType;
  if not cdsDocProp.FieldByName('DateClosed').IsNull then
    BlockData;
end;

function TfDocProp.SaveProp: boolean;
var i : integer;
    ADOQ : TADOQuery;
    stm: TMemoryStream;
begin
  if cdsDocProp.State in [dsEdit, dsInsert] then cdsDocProp.Post;

  if Fid_DocBase = -1 then
    ADOQ := ADOQuery1
  else
    ADOQ := ADOQuery2;

  with cdsDocProp do
  begin
    Edit;
    if not ceSUMM.Enabled then
      ceSUMM.Field.AsVariant := Null;
    if not lcCURNAME.Enabled then
      lcCURNAME.Field.AsVariant := Null;
    Post;

    for i := 0 to ADOQ.Parameters.Count - 1 do
    begin
      if FindField(ADOQ.Parameters[i].Name) <> nil then
      begin
        ADOQ.Parameters[i].Value := FindField(ADOQ.Parameters[i].Name).Value;
      //  ADOQ.Parameters[i].DataType := TDataType(FindField(ADOQ.Parameters[i].Name).FieldKind);
      end;
    end;
    ADOQ.ExecSQL;
  end;
  if Fid_DocBase = -1 then
  begin
    Fid_DocBase := DM.GetMaxID('select max(id_DocBase) AS ID FROM DW_DocBase');
    DM.ExecSQL('exec DW_EVENT_AU -1, ' + IntToStr(Fid_DocBase) + ', ' + '''' + 'Документ создан' + '''' + ', 18, ' + IntToStr(DM.id_User) );

    DM.AddToProtocol(Fid_DocBase, Null, 1);
  end;{
  else
    DM.AddToProtocol(Fid_CA, Null, 2)};
  Result := true;
end;

procedure TfDocProp.Button1Click(Sender: TObject);
var id_DocType : integer;
    AName : String;
begin
  id_DocType := cdsDocProp.FieldByName('ID_DOCTYPE').AsInteger;
  if ShowDTSelector(0, id_DocType, AName) then
  begin
    cdsDocProp.Edit;
    cdsDocProp.FieldByName('ID_DOCTYPE').AsInteger := id_DocType;
    cdsDocProp.FieldByName('DTNAME').AsString := AName;
    cdsDocProp.Post;
  end;
end;

procedure TfDocProp.ChType;
var PCol : TPanel;
    lbCol : TLabel;
    i, pnnotVis : integer;
begin
  pnnotVis := 0;

  if pnnotVis = 0 then
    pnnotVis := 10;
  //Height := Height - 24 * pnnotVis + 5;
end;

procedure TfDocProp.Button2Click(Sender: TObject);
var id_DocType : integer;
    AName : String;
begin
  id_DocType := cdsDocProp.FieldByName('ID_rep').AsInteger;
  if ShowDTSelector(5, id_DocType, AName) then
  begin
    cdsDocProp.Edit;
    cdsDocProp.FieldByName('ID_rep').AsInteger := id_DocType;
    cdsDocProp.FieldByName('RepName').AsString := AName;
    cdsDocProp.Post;
  end;
end;

procedure TfDocProp.Button3Click(Sender: TObject);
var id_DocType : integer;
    AName : String;
begin
  id_DocType := cdsDocProp.FieldByName('ID_CA').AsInteger;
  if ShowDTSelector(6, id_DocType, AName) then
  begin
    cdsDocProp.Edit;
    cdsDocProp.FieldByName('ID_CA').AsInteger := id_DocType;
    cdsDocProp.FieldByName('OrgName').AsString := AName;
    cdsDocProp.Post;
  end;
end;

procedure TfDocProp.ceSUMMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Key =86) then
    try
      if (sender as TRxDBCalcEdit).Enabled and not (sender as TRxDBCalcEdit).ReadOnly then
      begin
        (sender as TRxDBCalcEdit).DataSource.DataSet.edit;
        (sender as TRxDBCalcEdit).Field.AsFloat := StrToFloatAdv(Clipboard.AsText);
        (sender as TRxDBCalcEdit).DataSource.DataSet.Post;
        Key := 0;
      end;
    except
    end;
end;

procedure TfDocProp.ceSUMMKeyPress(Sender: TObject; var Key: Char);
begin
 Tag := 0;

end;

procedure TfDocProp.BlockData;
begin
  DisableControl(Self);
end;

end.
