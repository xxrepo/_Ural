unit frBJByOper;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, Grids, DBGridEh, GridsEh;

type
  TfBJByOper = class(TFrame)
    cdsBJ_ByOper: TClientDataSet;
    dsBJ_ByOper: TDataSource;
    cdsBJ_ByOperid_OperRel: TAutoIncField;
    cdsBJ_ByOperid_BJ_Obj: TAutoIncField;
    cdsBJ_ByOperNotUse: TBooleanField;
    cdsBJ_ByOperid_BJ_Item: TIntegerField;
    cdsBJ_ByOperName: TStringField;
    dbgBJ: TDBGridEh;
    cdsBJ_ByOperBJ_Name: TStringField;
    cdsBJ_ByOperid_Oper: TIntegerField;
    procedure dbgBJGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure dbgBJEditButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    Fid_oper, Fid_business : integer;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    procedure Initialize(id_oper, id_business : integer; id_Oper_OLD : integer = -1);
    procedure SaveData(id_oper : integer);

    procedure SetNotUse;

    function ChangeCount : integer;
  end;

implementation

uses uDM, foMyFunc, uBJTreeSel, foMyFuncEh;

{$R *.DFM}


procedure TfBJByOper.Initialize(id_oper, id_business : integer; id_Oper_OLD : integer);
begin
  Fid_oper := id_oper;
  Fid_business := id_business;
  with cdsBJ_ByOper do
  begin
    Close;
    Params.ParamByName('@id_Oper').Value := id_oper;
    Params.ParamByName('@id_business').Value := id_business;
    Params.ParamByName('@id_Oper_OLD').Value := id_Oper_OLD;
    Open;
  end;
end;

procedure TfBJByOper.SaveData(id_oper : integer);
begin
  if id_oper = -1 then
    id_oper := Fid_oper;
  CDSApplyUpdates(cdsBJ_ByOper, 'id_Oper', id_oper);
end;

procedure TfBJByOper.dbgBJGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if cdsBJ_ByOperNotUse.AsBoolean then
    AFont.Color := clGrayText;
end;


procedure TfBJByOper.dbgBJEditButtonClick(Sender: TObject);
var AID : Variant;
    AName : String;
begin
  if cdsBJ_ByOperid_BJ_Obj.AsInteger = 0 then
    Exit;
  AID := -cdsBJ_ByOperid_BJ_Item.AsInteger;

  if ShowBJTreeSel(AID, AName,
            cdsBJ_ByOperid_BJ_Obj.AsInteger, Null, Null,
            Null, Fid_business, true, 10) then
  begin
    with cdsBJ_ByOper do
    begin
      Edit;
      cdsBJ_ByOperid_BJ_Item.AsVariant := AID;
      cdsBJ_ByOperName.AsString := AName;
      cdsBJ_ByOperNotUse.AsBoolean := false;
      Post;
    end;
  end;
end;

constructor TfBJByOper.Create(AOwner: TComponent);
var TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadEhGridSettingsFromRegistry(dbgBJ, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
end;

destructor TfBJByOper.Destroy;
var TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    SaveEhGridSettingsToRegistry(dbgBJ, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
end;

function TfBJByOper.ChangeCount: integer;
begin
  if cdsBJ_ByOper.State in [dsEdit, dsInsert] then
    cdsBJ_ByOper.Post;
  Result := cdsBJ_ByOper.ChangeCount;
end;

procedure TfBJByOper.SetNotUse;
begin
  if Fid_oper > 0 then
    Exit;
  with cdsBJ_ByOper do
  begin
    First;
    while not Eof do
    begin
      Edit;
      cdsBJ_ByOperNotUse.AsBoolean := true;
      Post;
      Next;
    end;

    First;
  end;
end;

end.
