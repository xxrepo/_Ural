unit uBJTreeProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, frBJTreeProp;

type
  TBJTreeProp1 = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fBJTreeProp1: TfBJTreeProp;
    procedure btnOkClick(Sender: TObject);
  private
    function Getid_BJ_Tree: Variant;
    { Private declarations }
  public
    function SaveProp: boolean;
    procedure Initialize(id_BJ_Tree, id_BJ_Obj : integer; APID : Variant; isDeb : boolean; Aid_Bsn : Variant);
    property id_BJ_Tree : Variant read Getid_BJ_Tree;
  end;

var
  BJTreeProp1: TBJTreeProp1;
function ShowBJTreeProp(var id_BJ_Tree : integer; id_BJ_Obj : integer; APID : Variant; isDeb : boolean; Aid_Bsn : Variant) : boolean;


implementation

uses uDM;

{$R *.DFM}

function ShowBJTreeProp(var id_BJ_Tree : integer; id_BJ_Obj : integer; APID : Variant; isDeb : boolean; Aid_Bsn : Variant) : boolean;
var F : TBJTreeProp1;
    AHandle : HWnd;
    id_Func : integer;
    b103 : boolean;
begin
  DM.Rights_GetUserRights(102, Aid_Bsn);//555



  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;

  Result := false;
  F := TBJTreeProp1.Create(Application.MainForm);
  try
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);
    F.Initialize(id_BJ_Tree, id_BJ_Obj, APID, isDeb, Aid_Bsn);

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      id_BJ_Tree := F.id_BJ_Tree;
    end;
  finally
    F.Free;
  end;
end;

procedure TBJTreeProp1.btnOkClick(Sender: TObject);
begin
  if not fBJTreeProp1.ConfirmChanges then
    ModalResult := mrNone;
end;

function TBJTreeProp1.Getid_BJ_Tree: Variant;
begin
  Result := fBJTreeProp1.id_BJ_Tree;
end;

procedure TBJTreeProp1.Initialize(id_BJ_Tree, id_BJ_Obj : integer; APID : Variant; isDeb : boolean; Aid_Bsn : Variant);
var H : integer;
begin
  ActiveControl := fBJTreeProp1.DBEdit1;

  fBJTreeProp1.Initialize(id_BJ_Tree, id_BJ_Obj, APID, isDeb, Aid_Bsn);

  if id_BJ_Tree = -1 then
  begin
    Caption := 'Новый раздел бюджета';
   // Caption := Caption + ' - бизнес "' + DM.GetBusinessName(id_Bsn) + '"'
  end
  else
  begin
    Caption := 'Раздел бюджета: ' + fBJTreeProp1.dsCtgGoodsProp.DataSet.FieldByName('Name').AsString + ' (' + IntToStr(id_BJ_Tree) + ')';
  end;
  if isDeb then
    Caption := Caption + ', доходы'
  else
    Caption := Caption + ', расходы';
end;

function TBJTreeProp1.SaveProp: boolean;
begin
  Result := fBJTreeProp1.SaveProp;
end;

end.
 