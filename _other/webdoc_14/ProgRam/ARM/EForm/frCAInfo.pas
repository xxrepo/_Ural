unit frCAInfo;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, sMemo, Db, DBClient, Grids, DBGrids, acDBGrid, ActnList, Menus;

type
  TfCAInfo = class(TFrame)
    cdsCAInfo: TClientDataSet;
    dbgCAInfo: TsDBGrid;
    dsCAInfo: TDataSource;
    cdsCAInfoxID: TAutoIncField;
    cdsCAInfoAtext: TStringField;
    cdsCAInfoAID: TIntegerField;
    cdsCAInfoCnt: TIntegerField;
    cdsCAInfoTag: TStringField;
    cdsCAInfodd: TDateTimeField;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    ActionList1: TActionList;
    aDet: TAction;
    aOpenCA: TAction;
    aGoToCA: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure dbgCAInfoGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; State: TGridDrawState;
      StateEx: TGridDrawStateEx);
    procedure aDetExecute(Sender: TObject);
    procedure aOpenCAExecute(Sender: TObject);
    procedure aGoToCAExecute(Sender: TObject);
    procedure dsCAInfoDataChange(Sender: TObject; Field: TField);
    procedure dbgCAInfoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    fUnDict : TFrame;
    Fid_OBJ: integer;
    procedure Initialize(id_OBJ : integer);
  end;

implementation

uses uDM, uRep, uObjProp, frUnDict;

{$R *.DFM}

{ TFrame1 }

procedure TfCAInfo.Initialize(id_OBJ: integer);
begin
  try
    Fid_OBJ := id_OBJ;
//  sMemo1.Lines.Clear;
  with cdsCAInfo do
  begin
    Close;
    Params.ParamByName('@id_Obj').Value := Fid_OBJ;
    Open;
    First;

{    while not Eof do
    begin
      sMemo1.Lines.Add(cdsCAInfoAtext.AsString);

      Next;
    end;  }
  end;
  except

  end;
end;

procedure TfCAInfo.dbgCAInfoGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; State: TGridDrawState;
  StateEx: TGridDrawStateEx);
begin
  if trim(cdsCAInfoAtext.AsString) = '' then
  begin
    Background := clWindow;
  end
  else
  if POS(' ', cdsCAInfoAtext.AsString) > 1 then
  begin
    AFont.Style := [fsbold];
    Background := clInactiveCaption;
  end
  else
  if cdsCAInfoAID.IsNull then
  begin
    AFont.Style := [fsbold];
    Background := clMenu;
  end
end;

procedure TfCAInfo.aDetExecute(Sender: TObject);
var ExtSQL: Variant;
begin
  if (UpperCase(cdsCAInfoTag.AsString) = UpperCase('id_CA')) then
  begin
    ExtSQL := 'AND ( ' +
    '(id_Bayer = ' + IntToStr(Fid_OBJ) + ' AND id_Seller in (SELECT id_Obj FROM VW_CA X1 (NOLOCK) WHERE X1.id_Obj = ' + cdsCAInfoAID.AsString + '))' +
         'OR' +
    '(id_Seller = ' + IntToStr(Fid_OBJ) + ' AND id_Bayer in (SELECT id_Obj FROM VW_CA X2 (NOLOCK) WHERE X2.id_Obj = ' + cdsCAInfoAID.AsString + '))'
         + ')';
  end;
  if (UpperCase(cdsCAInfoTag.AsString) = UpperCase('id_WorkType')) then
  begin
    ExtSQL := 'AND (id_WorkType = ' + cdsCAInfoAID.AsString +
    'OR id_WorkType2 = ' + cdsCAInfoAID.AsString  +
    'OR id_WorkType3 = ' + cdsCAInfoAID.AsString  +
    'OR id_WorkType4 = ' + cdsCAInfoAID.AsString  +
    'OR id_WorkType5 = ' + cdsCAInfoAID.AsString  +
    ') AND (id_Bayer = ' + IntToStr(Fid_OBJ) + ' OR id_Seller = ' + IntToStr(Fid_OBJ) + ')';
  end;
  if ExtSQL = null then Exit;
  ShowRep(false, null, ExtSQL);
end;

procedure TfCAInfo.aOpenCAExecute(Sender: TObject);
var AID: integer;
begin
  AID := cdsCAInfoAID.AsInteger;
  ShowObjProp_Adv(AID, -1, Handle, false);


end;

procedure TfCAInfo.aGoToCAExecute(Sender: TObject);
begin
  if fUnDict <> nil then
    TfUnDict(fUnDict).cdsObjGetList.Locate('id_Obj', cdsCAInfoAID.AsInteger, [loCaseInsensitive, loPartialKey]);
end;

procedure TfCAInfo.dsCAInfoDataChange(Sender: TObject; Field: TField);
begin
  aDet.Enabled := not cdsCAInfoAID.IsNull;
  aOpenCA.Enabled := not cdsCAInfoAID.IsNull and (UpperCase(cdsCAInfoTag.AsString) = UpperCase('id_CA'));
  aGoToCA.Enabled := not cdsCAInfoAID.IsNull and (UpperCase(cdsCAInfoTag.AsString) = UpperCase('id_CA')) and (fUnDict <> nil);
end;

procedure TfCAInfo.dbgCAInfoDblClick(Sender: TObject);
begin
  aOpenCA.Execute;
end;

end.
