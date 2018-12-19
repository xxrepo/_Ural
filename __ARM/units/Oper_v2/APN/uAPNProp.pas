unit uAPNProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Mask, DBCtrls, Grids, DBGrids,
  ActnList, Menus, Buttons;

type
  TAPNProp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cdsAPNProp: TClientDataSet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsAPNProp: TDataSource;
    cdsAPNPropid_APN_Obj: TAutoIncField;
    cdsAPNPropid_business: TIntegerField;
    cdsAPNPropid_Repr: TIntegerField;
    cdsAPNPropOperTypeIn: TBooleanField;
    cdsAPNPropDayNum: TIntegerField;
    cdsAPNPropDisabled: TBooleanField;
    cdsAPNPropNAme: TStringField;
    cdsAPNPropid_Acc: TIntegerField;
    cdsAPNPropDestName: TStringField;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BitBtn3: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    Fid_APN_Obj, Fid_Bsn : integer;
  public
    procedure Initialize(Aid_APN_Obj : integer; Aid_Bsn : integer; ACopy : boolean);

    procedure SaveData;
  end;

var
  APNProp: TAPNProp;
function ShowAPNProp(var Aid_APN_Obj : integer; Aid_Bsn : integer; ACopy : boolean = false) : boolean;

implementation

uses uDM, foMyFunc, uUnivSelector;

{$R *.DFM}

function ShowAPNProp(var Aid_APN_Obj : integer; Aid_Bsn : integer; ACopy : boolean) : boolean;
var F : TAPNProp;
    AHandle : HWnd;
begin
  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;

  Result := false;
  F := TAPNProp.Create(Application.MainForm);
  try
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);

    F.Initialize(Aid_APN_Obj, Aid_Bsn, ACopy);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      F.SaveData;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

{ TCR_Cat }

procedure TAPNProp.Initialize(Aid_APN_Obj, Aid_Bsn: integer; ACopy : boolean);
begin
  Fid_APN_Obj := Aid_APN_Obj;
  Fid_Bsn := Aid_Bsn;
  with cdsAPNProp do
  begin
    Close;

    Params.ParamByName('@id_APN_Obj').Value := Fid_APN_Obj;
    Open;
  end;
  if ACopy then
    Fid_APN_Obj := -1;

end;

procedure TAPNProp.SaveData;
var ID : integer;
    id_Repr, id_Acc : OleVariant;
    OperTypeIn: WordBool;
    DayNum: Integer;
    AName: OleVariant;
begin
  if cdsAPNProp.State in [dsEdit, dsInsert] then
    cdsAPNProp.Post;


  id_Repr := Null; //cdsAPNPropid_Repr.AsVariant;
  id_Acc := Null; //cdsAPNPropid_Acc.AsVariant;
  OperTypeIn := true;
  DayNum :=  cdsAPNPropDayNum.asinteger;
  AName := cdsAPNPropNAme.AsString;
  
    ID := DM.rsCA.AppServer.APN_ObjEdit(Fid_APN_Obj, Fid_Bsn, id_Repr, id_Acc,
    OperTypeIn, DayNum, AName);
  if Fid_APN_Obj = -1 then
    Fid_APN_Obj := ID;
end;

procedure TAPNProp.btnOkClick(Sender: TObject);
begin
  with DBEdit1 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введено название', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      ModalResult := mrNone;
      Exit;
    end;  
 { with DBEdit3 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбрано с кого начислять', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      ModalResult := mrNone;
      Exit;
    end; } 
  with DBEdit2 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбрано число', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      ModalResult := mrNone;
      Exit;
    end;  
end;

procedure TAPNProp.BitBtn3Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
    Rez : boolean;
    AEObjTypes: TEObjTypes;
begin
  AEObjTypes := [eotFin, eotRepr];
  if not cdsAPNProp.FieldByName('id_Acc').IsNull then
  begin
    ASelectedObj.ID := cdsAPNProp.FieldByName('id_Acc').Value;
    ASelectedObj.ObjType := eotFin;
  end;
  if not cdsAPNProp.FieldByName('id_Repr').IsNull then
  begin
    ASelectedObj.ID := cdsAPNProp.FieldByName('id_Repr').Value;
    ASelectedObj.ObjType := eotRepr;
  end;

  Rez := SelectObjUnBsn(Owner, Fid_Bsn, ASelectedObj, 0, AEObjTypes);
  if Rez then
  begin
    with cdsAPNProp do
    begin
      Edit;
      FieldByName('id_Acc').Value := Null;
      FieldByName('id_Repr').Value := Null;

      case ASelectedObj.ObjType of
        eotFin : FieldByName('id_Acc').Value := ASelectedObj.ID;
        eotRepr : FieldByName('id_Repr').Value := ASelectedObj.ID;
      else
        raise Exception.Create('Неверный тип возвращаемого значения');
      end;

      FieldByName('DestName').Value := ASelectedObj.Name;
      Post;
    end;
  end;
end;

end.
