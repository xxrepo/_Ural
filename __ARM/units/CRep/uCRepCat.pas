unit uCRepCat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Mask, DBCtrls, Grids, DBGrids,
  ActnList, Menus;

type
  TCR_Cat = class(TForm)
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
    dsCCFlt: TDataSource;
    cdsCCFlt: TClientDataSet;
    cdsCCFltid_FLT: TAutoIncField;
    cdsCCFltid_Cat: TIntegerField;
    cdsCCFltF_OperVid: TStringField;
    cdsCCFltF_id_ContrAgent: TStringField;
    cdsCCFltExtStr: TStringField;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    cdsCCFltEXXX: TStringField;
    PopupMenu1: TPopupMenu;
    ActionList1: TActionList;
    aDel: TAction;
    N1: TMenuItem;
    procedure aDelExecute(Sender: TObject);
    procedure dsCCFltDataChange(Sender: TObject; Field: TField);
    procedure btnOkClick(Sender: TObject);
  private
    Fid_Cat, Fid_Rep : integer;
  public
    procedure Initialize(Aid_Cat : integer; Aid_Rep : integer);

    procedure SaveData;
  end;

var
  CR_Cat: TCR_Cat;
function ShowCR_Cat(var Aid_Cat : integer; Aid_Rep : integer) : boolean;

implementation

uses uDM, foMyFunc;

{$R *.DFM}

function ShowCR_Cat(var Aid_Cat : integer; Aid_Rep : integer) : boolean;
var F : TCR_Cat;
    AHandle : HWnd;
begin
  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;

  Result := false;
  F := TCR_Cat.Create(Application.MainForm);
  try
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);

    F.Initialize(Aid_Cat, Aid_Rep);
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

procedure TCR_Cat.Initialize(Aid_Cat, Aid_Rep: integer);
begin
  Fid_Cat := Aid_Cat;
  Fid_Rep := Aid_Rep;
  with cdsCCP do
  begin
    Close;

    Params.ParamByName('@id_Cat').Value := Fid_Cat;
    Open;
  end;
  with cdsCCFlt do
  begin
    Close;

    Params.ParamByName('@id_Cat').Value := Fid_Cat;
    Open;
  {  First;
    while not Eof do
    begin
      Edit;
      cdsCCFltEXXX.AsString := StringReplace(cdsCCFltExtStr.AsString, 'Str8=', '', [rfReplaceAll, rfIgnoreCase]);
      Post;
      Next;
    end; }
  end;

end;

procedure TCR_Cat.SaveData;
begin
  if Fid_Cat = -1 then
    Fid_Cat := DM.rsCA.AppServer.CustRep_CatAdd(Fid_Rep, DBEdit1.Text, Null,
    Null,Null,Null,Null,true, Null, Null)
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

  if not CDSApplyUpdates(cdsCCFlt, 'id_Cat', Fid_Cat, true) then
    raise Exception.Create('Ошибка при сохранении');             
end;

procedure TCR_Cat.aDelExecute(Sender: TObject);
begin
    if MessageBox(Handle, PChar('Удалить "' + cdsCCFltEXXX.AsString + '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
    begin
      cdsCCFlt.Delete;
    end;   
end;

procedure TCR_Cat.dsCCFltDataChange(Sender: TObject; Field: TField);
begin
  aDel.Enabled :=  not cdsCCFlt.IsEmpty;
end;

procedure TCR_Cat.btnOkClick(Sender: TObject);
begin
  with DBEdit1 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введено название', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;  
end;

end.
