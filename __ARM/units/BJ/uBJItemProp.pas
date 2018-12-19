unit uBJItemProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, frBJItemProp, frBJTree;

type
  TBJItemProp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fBJItemProp1: TfBJItemProp;
    procedure btnOkClick(Sender: TObject);
    procedure fBJItemProp1DBEdit2KeyPress(Sender: TObject; var Key: Char);
  private
    function Getid_BJ_Item: Variant;
    { Private declarations }
  public
    function SaveProp: boolean;
    procedure Initialize(Aid_BJ_Item : integer; id_business : integer; ABJType : TBJType; id_BJ_Tree : integer; isDeb : boolean);
    property id_BJ_Item : Variant read Getid_BJ_Item;
  end;

var
  BJItemProp: TBJItemProp;
function ShowBJItemProp(var Aid_BJ_Item : integer; id_business : integer; ABJType : TBJType; id_BJ_Tree : integer; isDeb : boolean) : boolean;


implementation

uses uDM;

{$R *.DFM}

function ShowBJItemProp(var Aid_BJ_Item : integer; id_business : integer; ABJType : TBJType; id_BJ_Tree : integer; isDeb : boolean) : boolean;
var F : TBJItemProp;
    AHandle : HWnd;
    b103, b102 : boolean;
    id_Func : integer;
begin
  b103 := true;
  if Aid_BJ_Item = -1 then
  begin
    id_Func := 102;
 //   b103 := DM.CheckUserRights(103, id_business);
   // b102 := DM.CheckUserRights(102, id_business);
  end
  else
  begin
    b103 := DM.CheckUserRights(103, id_business);
    b102 := DM.CheckUserRights(102, id_business);
    if not b103 then
      id_Func := 102
    else
      id_Func := 103;//555
  end;
  DM.Rights_GetUserRights(id_Func, id_business);//555


  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;

  Result := false;
  F := TBJItemProp.Create(Application.MainForm);
  try
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);

    F.fBJItemProp1.BitBtn1.Enabled := b102 or (Aid_BJ_Item = -1);
    F.fBJItemProp1.BitBtn2.Enabled := b102 or (Aid_BJ_Item = -1);
    F.fBJItemProp1.DBEdit1.Enabled := b102 or (Aid_BJ_Item = -1);
    F.fBJItemProp1.DBEdit2.Enabled := b102 or (Aid_BJ_Item = -1);
    F.fBJItemProp1.DBEdit3.Enabled := b102 or (Aid_BJ_Item = -1);
    F.fBJItemProp1.DBEdit4.Enabled := b102 or b103 or (Aid_BJ_Item = -1);

    F.fBJItemProp1.DBCheckBox1.Enabled := b102 or (Aid_BJ_Item = -1);
    F.fBJItemProp1.DBCheckBox2.Enabled := b102 or (Aid_BJ_Item = -1);


    F.Initialize(Aid_BJ_Item, id_business, ABJType, id_BJ_Tree, isDeb);

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      Aid_BJ_Item := F.id_BJ_Item;
    end;
  finally
    F.Free;
  end;
end;

procedure TBJItemProp.btnOkClick(Sender: TObject);
begin
  if not fBJItemProp1.ConfirmChanges then
    ModalResult := mrNone;
end;

function TBJItemProp.Getid_BJ_Item: Variant;
begin
  Result := fBJItemProp1.id_BJ_Item;
end;

procedure TBJItemProp.Initialize(Aid_BJ_Item : integer; id_business : integer; ABJType : TBJType; id_BJ_Tree : integer; isDeb : boolean);
var H : integer;
begin
  if fBJItemProp1.DBEdit1.Enabled then
    ActiveControl := fBJItemProp1.DBEdit1;

  fBJItemProp1.Initialize(Aid_BJ_Item, id_business, ABJType, id_BJ_Tree, isDeb, id_business);

  if id_BJ_Tree = -1 then
  begin
    case ABJType of
      bjtItem : Caption := 'Добавление статьи';
      bjtAcc : Caption := 'Добавление счета';
      bjtCA : Caption := 'Добавление контрагента';
    end;

   // Caption := Caption + ' - бизнес "' + DM.GetBusinessName(id_Bsn) + '"'
  end
  else
  begin
    case ABJType of
      bjtItem : Caption := 'Статья';
      bjtAcc : Caption := 'Счет';
      bjtCA : Caption := 'Контрагент';
    end;
  end;
  if isDeb then
    Caption := Caption + ', доходы'
  else
    Caption := Caption + ', расходы';
end;

function TBJItemProp.SaveProp: boolean;
begin
  Result := fBJItemProp1.SaveProp;
end;

procedure TBJItemProp.fBJItemProp1DBEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = '.') or (Key = ',') then
    Key := DecimalSeparator; 
end;

end.
