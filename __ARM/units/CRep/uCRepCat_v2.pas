unit uCRepCat_v2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Mask, DBCtrls, Grids, DBGrids,
  ActnList, Menus, Buttons, RxLookup;

type
  TCRepCat_v2 = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cdsCCP: TClientDataSet;
    cdsCCPid_Cat: TAutoIncField;
    cdsCCPid_Rep: TIntegerField;
    cdsCCPName: TStringField;
    cdsCCPPID: TIntegerField;
    cdsCCPF_OperVid: TStringField;
    cdsCCPF_id_ContrAgent: TStringField;
    cdsCCPOrdNum: TIntegerField;
    cdsCCPGrpOper: TBooleanField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsCCP: TDataSource;
    pBase: TPanel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    cdsCCPExtStr: TStringField;
    cdsCCPid_FormalDistrib: TIntegerField;
    cdsCCPid_FuncDistrib: TIntegerField;
    cdsCCPid_Acc: TIntegerField;
    cdsCCPisCat: TBooleanField;
    cdsCCPAPlan: TFloatField;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    edPName: TEdit;
    cdsFormal: TClientDataSet;
    cdsFormalid_FormalDistrib: TAutoIncField;
    cdsFormalName: TStringField;
    cdsFunc: TClientDataSet;
    cdsFuncid_FuncDistrib: TAutoIncField;
    cdsFuncName: TStringField;
    dsFunc: TDataSource;
    dsFormal: TDataSource;
    P_FF: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    lcFormalDistrib: TRxDBLookupCombo;
    lcFuncDistrib: TRxDBLookupCombo;
    cbFormal: TComboBox;
    cbFunc: TComboBox;
    edSrcName: TEdit;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label4: TLabel;
    edCA: TEdit;
    BitBtn3: TBitBtn;
    ClientDataSet1: TClientDataSet;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    BooleanField1: TBooleanField;
    StringField4: TStringField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    BooleanField2: TBooleanField;
    FloatField1: TFloatField;
    ClientDataSet1F_OperVid: TStringField;
    ClientDataSet1F_id_ContrAgent: TStringField;
    Panel1: TPanel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    procedure btnOkClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    Fid_Cat, Fid_Rep : integer;
    FisCat : boolean;
  public
    procedure Initialize(Aid_Cat : integer; Aid_Rep : integer; isCat : boolean; PID : integer);

    procedure SaveData;
  end;

var
  CRepCat_v2: TCRepCat_v2;
function ShowCR_Cat_v2(var Aid_Cat : integer; Aid_Rep : integer; isCat : boolean; PID : integer = -1) : boolean;

implementation

uses uDM, foMyFunc, uUnivSelector, uCRepCtgSelector;

{$R *.DFM}

function ShowCR_Cat_v2(var Aid_Cat : integer; Aid_Rep : integer; isCat : boolean; PID : integer) : boolean;
var F : TCRepCat_v2;
    AHandle : HWnd;
begin
  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;

  Result := false;
  F := TCRepCat_v2.Create(Application.MainForm);
  try
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);

    F.Initialize(Aid_Cat, Aid_Rep, isCat, PID);
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

procedure TCRepCat_v2.Initialize(Aid_Cat, Aid_Rep: integer; isCat : boolean; PID : integer);
begin
  Fid_Cat := Aid_Cat;
  Fid_Rep := Aid_Rep;
  FisCat := isCat;
  with cdsCCP do
  begin
    Close;

    Params.ParamByName('@id_Cat').Value := Fid_Cat;
    Open;
    if (cdsCCPid_FormalDistrib.AsInteger > 0) or (Aid_Cat = -1) then
    begin
      cbFormal.ItemIndex := 0;
    end
    else
    begin
      cbFormal.ItemIndex := 1;
      cdsCCP.Edit;
      cdsCCPid_FormalDistrib.AsInteger := - cdsCCPid_FormalDistrib.AsInteger;
      cdsCCP.Post;
    end;

    if (cdsCCPid_FuncDistrib.AsInteger > 0) or (Aid_Cat = -1) then
    begin
      cbFunc.ItemIndex := 0;
    end
    else
    begin
      cbFunc.ItemIndex := 1;
      cdsCCP.Edit;
      cdsCCPid_FuncDistrib.AsInteger := - cdsCCPid_FuncDistrib.AsInteger;
      cdsCCP.Post;
    end;

    if Aid_Cat = -1 then
      cbFormal.ItemIndex := 0;
    if Aid_Cat = -1 then
      cbFunc.ItemIndex := 0;


    if cdsCCPF_id_ContrAgent.AsString > '' then
      edCA.text := DM.rsCA.appserver.GetCAName(StrToInt(cdsCCPF_id_ContrAgent.AsString));
    if cdsCCPid_Acc.AsInteger > 0 then
      edCA.text := DM.rsCA.appserver.GetAccName(cdsCCPid_Acc.AsInteger);

    if (Fid_Cat = -1) and (PID > 0) then
    begin
      ClientDataSet1.Close;
      ClientDataSet1.Params.ParamByName('@id_Cat').Value := PID;
      ClientDataSet1.Open;

      cdsCCP.Edit;
      cdsCCPPID.AsInteger := PID;
      cdsCCP.Post;
      edPName.Text := ClientDataSet1.FieldByName('Name').AsString;
      ClientDataSet1.Close;
    end
    else
    begin
      if cdsCCPPID.AsInteger > 0 then
      begin
        ClientDataSet1.Close;
        ClientDataSet1.Params.ParamByName('@id_Cat').Value := cdsCCPPID.AsInteger;
        ClientDataSet1.Open;
        edPName.Text := ClientDataSet1.FieldByName('Name').AsString;
        ClientDataSet1.Close;
      end;
    end;
  end;

  cdsFormal.Close;
  cdsFormal.Params.ParamByName('@id_Bsn').Value := 24;
  cdsFormal.Open;
  cdsFunc.Close;
  cdsFunc.Params.ParamByName('@id_Bsn').Value := 24;
  cdsFunc.Open;
end;

procedure TCRepCat_v2.SaveData;
var PID, ExtStr, id_FormalDistrib, id_FuncDistrib, id_Acc: OleVariant;
  isCat: WordBool;
  APlan, F_id_ContrAgent: OleVariant;
begin
  if cbFormal.ItemIndex = 1 then
  begin
    cdsCCP.Edit;
    cdsCCPid_FormalDistrib.AsInteger := - cdsCCPid_FormalDistrib.AsInteger;
    cdsCCP.Post;
  end;
  if cbFunc.ItemIndex = 1 then
  begin
    cdsCCP.Edit;
    cdsCCPid_FuncDistrib.AsInteger := - cdsCCPid_FuncDistrib.AsInteger;
    cdsCCP.Post;
  end;

  if Fid_Cat = -1 then
  begin
    PID := cdsCCPPID.AsVariant;
    ExtStr := cdsCCPExtStr.AsVariant;
    id_FormalDistrib := cdsCCPid_FormalDistrib.AsVariant;
    id_FuncDistrib := cdsCCPid_FuncDistrib.AsVariant;
    id_Acc := cdsCCPid_Acc.AsInteger;
    isCat := FisCat;
    APlan := cdsCCPAPlan.AsVariant;
    F_id_ContrAgent := cdsCCPF_id_ContrAgent.AsVariant;

    Fid_Cat := DM.rsCA.AppServer.CustRep_CatAdd(Fid_Rep, DBEdit1.Text,
      PID, ExtStr, id_FormalDistrib, id_FuncDistrib, id_Acc,
      isCat, APlan, F_id_ContrAgent);
  end
  else
  begin
    if cdsCCP.State in [dsEdit, dsInsert] then
      cdsCCP.Post;
    CDSApplyUpdates(cdsCCP, 'id_Rep', Fid_Rep);
  end;
 { with cdsCCFlt do
  begin
    First;
    while not Eof do
    begin
      Edit;
      cdsCCFltExtStr.AsString := 'UPPER(Str8)=UPPER(LTRIM(RTRIM(' + '''' + cdsCCFltEXXX.AsString + '''' + ')))';
      Post;
      Next;
    end;
  end;   }

end;

procedure TCRepCat_v2.btnOkClick(Sender: TObject);
begin
  with DBEdit1 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введено название', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;  
end;

procedure TCRepCat_v2.BitBtn1Click(Sender: TObject);
var AID, id_BlockSelf, id_BlockCh : Variant;
    xxx_AName : String;
begin
  id_BlockSelf := Fid_Cat;
  id_BlockCh := cdsCCPPID.AsVariant;
  AID := id_BlockCh;

  if ShowWareCtgSelector(Fid_Rep, AID, xxx_AName,
            id_BlockSelf) then
  begin
    with cdsCCP do
    begin
      Edit;
      cdsCCPPID.AsVariant := AID;
      edPName.Text := xxx_AName;
      Post;
    end;
  end;
end;

procedure TCRepCat_v2.BitBtn2Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
begin
  ASelectedObj.ID := cdsCCPid_Acc.AsVariant;
  ASelectedObj.ObjType := eotFin;

  if SelectObjUnBsn(Owner, 24, ASelectedObj, 0, [eotFin], false) then
  begin
    with cdsCCP do
    begin
      Edit;
      cdsCCPid_Acc.Value := ASelectedObj.ID;
      Post;
    end;
    edSrcName.Text := ASelectedObj.Name;
  end;
end;

procedure TCRepCat_v2.BitBtn3Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
begin
  if cdsCCPF_id_ContrAgent.AsString <> '' then
    ASelectedObj.ID := StrToInt(cdsCCPF_id_ContrAgent.AsString)
  else
    ASelectedObj.ID := -1;
    
  ASelectedObj.ObjType := eotCA;

  if SelectObjUnBsn(Owner, 24, ASelectedObj, 0, [eotCA], false) then
  begin
    with cdsCCP do
    begin
      Edit;
      cdsCCPF_id_ContrAgent.AsString := ASelectedObj.ID;
      Post;
    end;
    edCA.Text := ASelectedObj.Name;
  end;
end;

end.
