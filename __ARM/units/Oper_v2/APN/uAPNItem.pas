unit uAPNItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Mask, DBCtrls, Grids, DBGrids,
  ActnList, Menus, Buttons, RxLookup;

type
  TAPNItem = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cdsAPNItemProp: TClientDataSet;
    Label1: TLabel;
    dsAPNItemProp: TDataSource;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BitBtn3: TBitBtn;
    cdsAPNItemPropid_APN_AccList: TAutoIncField;
    cdsAPNItemPropid_APN_Obj: TIntegerField;
    cdsAPNItemPropid_Acc: TIntegerField;
    cdsAPNItemPropASumm: TFloatField;
    cdsAPNItemPropId_Currency: TIntegerField;
    cdsAPNItemPropAPrc: TFloatField;
    cdsAPNItemPropAccName: TStringField;
    cdsAPNItemPropCRNName: TStringField;
    cdsAPN: TClientDataSet;
    dsAPN: TDataSource;
    lbSum: TLabel;
    edSum: TDBEdit;
    lbPrc: TLabel;
    edPrc: TDBEdit;
    cdsCur: TClientDataSet;
    cdsCurId_Currency: TAutoIncField;
    cdsCurName: TStringField;
    cdsCurShortName: TStringField;
    cdsCurISOCode: TStringField;
    cdsCurNumberCode: TStringField;
    cdsCurFastAccess: TBooleanField;
    cdsCurValue: TIntegerField;
    cdsCurRate: TFloatField;
    cdsCurAvForPay: TBooleanField;
    cdsCurBase: TBooleanField;
    cdsCurLastUpdated: TBytesField;
    cdsCurId_URL: TIntegerField;
    DataSource1: TDataSource;
    lcGrp: TRxDBLookupCombo;
    cbType: TComboBox;
    lcCur: TRxDBLookupCombo;
    lbCur: TLabel;
    cdsAPNid_APN_Obj: TAutoIncField;
    cdsAPNid_business: TIntegerField;
    cdsAPNid_Repr: TIntegerField;
    cdsAPNOperTypeIn: TBooleanField;
    cdsAPNDayNum: TIntegerField;
    cdsAPNDisabled: TBooleanField;
    cdsAPNNAme: TStringField;
    cdsAPNid_Acc: TIntegerField;
    cdsAPNWDate: TDateTimeField;
    procedure btnOkClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure cbTypeChange(Sender: TObject);
  private
    Fid_APN_Obj, Fid_Bsn, Fid_APN_AccList : integer;
  public
    procedure Initialize(id_APN_AccList : integer; Aid_APN_Obj, Aid_Bsn : integer; ACopy : boolean);

    procedure SaveData;
  end;

var
  APNItem: TAPNItem;
function ShowAPNItemProp(var id_APN_AccList : integer; Aid_APN_Obj, Aid_Bsn : integer; ACopy : boolean = false) : boolean;

implementation

uses uDM, foMyFunc, uUnivSelector;

{$R *.DFM}

function ShowAPNItemProp(var id_APN_AccList : integer; Aid_APN_Obj, Aid_Bsn : integer; ACopy : boolean = false) : boolean;
var F : TAPNItem;
    AHandle : HWnd;
begin
  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;

  Result := false;
  F := TAPNItem.Create(Application.MainForm);
  try
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);

    F.Initialize(id_APN_AccList, Aid_APN_Obj, Aid_Bsn, ACopy);
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

procedure TAPNItem.Initialize(id_APN_AccList : integer; Aid_APN_Obj, Aid_Bsn : integer; ACopy : boolean);
begin
  Fid_APN_Obj := Aid_APN_Obj;
  Fid_Bsn := Aid_Bsn;
  Fid_APN_AccList :=  id_APN_AccList;
  with cdsAPNItemProp do
  begin
    Close;

    Params.ParamByName('@id_APN_AccList').Value := Fid_APN_AccList;
    Open;

    if Fid_APN_AccList = -1 then
    begin
      Edit;
      cdsAPNItemPropid_APN_Obj.AsVariant := Fid_APN_Obj;
      Post;
    end;
    if cdsAPNItemPropAPrc.IsNull then
      cbType.ItemIndex := 0
    else
      cbType.ItemIndex := 1;
    cbTypeChange(cbType);
  end;                                    
  with cdsAPN do
  begin
    Close;

    Params.ParamByName('@id_business').Value := Fid_Bsn;
    Open;
  end;
  with cdsCur do
  begin
    Close;

    Params.ParamByName('@id_Bsn').Value := Fid_Bsn;
    Params.ParamByName('@AvForPay').Value := true;
    Params.ParamByName('@FastAccess').Value := true;
    Open;
  end;

  if ACopy then
    Fid_APN_AccList := -1;

end;

procedure TAPNItem.SaveData;
var ID : integer;
    id_APN_AccList, id_APN_Obj, id_Acc: Integer;
    ASumm, Id_Currency, APrc: OleVariant;
begin
  if cdsAPNItemProp.State in [dsEdit, dsInsert] then
    cdsAPNItemProp.Post;
    
  id_APN_AccList := Fid_APN_AccList;
  id_APN_Obj := cdsAPNItemPropid_APN_Obj.AsVariant;
  id_Acc := cdsAPNItemPropid_Acc.AsVariant;
  ASumm := cdsAPNItemPropASumm.AsVariant;
  Id_Currency :=  cdsAPNItemPropId_Currency.AsVariant;
  APrc :=  cdsAPNItemPropAPrc.AsVariant;

  if not edSum.Enabled then
  begin
    ASumm := Null;
    Id_Currency := Null;
  end;
  if not edPrc.Enabled then
  begin
    APrc := Null;
  end;

    ID := DM.rsCA.AppServer.APN_AccListEdit(id_APN_AccList, id_APN_Obj, id_Acc,
           ASumm, Id_Currency, APrc);
  if Fid_APN_AccList = -1 then
    Fid_APN_AccList := ID;
end;

procedure TAPNItem.btnOkClick(Sender: TObject);
begin
  with lcGrp do
    if KeyValue = Null then
    begin
      MessageBox(Handle, 'Не выбрана группа', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      ModalResult := mrNone;
      Exit;
    end;  
  with DBEdit3 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран счет', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      ModalResult := mrNone;
      Exit;
    end;  
  with edSum do
    if Enabled and (trim(Text) = '') then
    begin
      MessageBox(Handle, 'Не введена сумма', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      ModalResult := mrNone;
      Exit;
    end;  
  with lcCur do
    if Enabled and (KeyValue = Null) then
    begin
      MessageBox(Handle, 'Не выбрана валюта', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      ModalResult := mrNone;
      Exit;
    end;  
  with edPrc do
    if Enabled and (trim(Text) = '') then
    begin
      MessageBox(Handle, 'Не введен процент', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      ModalResult := mrNone;
      Exit;
    end;  
end;

procedure TAPNItem.BitBtn3Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
    Rez : boolean;
    AEObjTypes: TEObjTypes;
begin
  AEObjTypes := [eotFin];
  if not cdsAPNItemProp.FieldByName('id_Acc').IsNull then
  begin
    ASelectedObj.ID := cdsAPNItemProp.FieldByName('id_Acc').Value;
    ASelectedObj.ObjType := eotFin;
  end;

  Rez := SelectObjUnBsn(Owner, Fid_Bsn, ASelectedObj, 0, AEObjTypes);
  if Rez then
  begin
    with cdsAPNItemProp do
    begin
      Edit;
      FieldByName('id_Acc').Value := Null;

      case ASelectedObj.ObjType of
        eotFin : FieldByName('id_Acc').Value := ASelectedObj.ID;
      else
        raise Exception.Create('Неверный тип возвращаемого значения');
      end;

      FieldByName('AccName').Value := ASelectedObj.Name;
      Post;
    end;
  end;
end;

procedure TAPNItem.cbTypeChange(Sender: TObject);
begin
  lbSum.Enabled := cbType.ItemIndex = 0;
  edSum.Enabled := cbType.ItemIndex = 0;
  lbCur.Enabled := cbType.ItemIndex = 0;
  lcCur.Enabled := cbType.ItemIndex = 0;

  lbPrc.Enabled := cbType.ItemIndex = 1;
  edPrc.Enabled := cbType.ItemIndex = 1;
end;

end.

