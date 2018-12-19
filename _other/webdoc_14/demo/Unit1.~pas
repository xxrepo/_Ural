unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Db, ADODB, ImgList;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    lbFlt: TListBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    ADOConnection1: TADOConnection;
    ADOStoredProc1: TADOStoredProc;
    ADOStoredProc1id: TAutoIncField;
    ADOStoredProc1Name: TWideStringField;
    ADOStoredProc1Owner: TWideStringField;
    ADOStoredProc1isBayer: TBooleanField;
    ADOStoredProc1isSeller: TBooleanField;
    ADOStoredProc1WorkType: TWideStringField;
    ADOStoredProc1Sended: TWideStringField;
    ADOStoredProc1CloseDate: TDateTimeField;
    ADOStoredProc1StartDate: TDateTimeField;
    ADOStoredProc1isUsed: TBooleanField;
    ADOStoredProc1isClosed: TBooleanField;
    ADOStoredProc1isBayerStr: TStringField;
    ADOStoredProc1isSellerStr: TStringField;
    ADOStoredProc1isUsedStr: TStringField;
    ADOStoredProc1isClosedStr: TStringField;
    spValList: TADOStoredProc;
    spValListVal: TStringField;
    TabSheet3: TTabSheet;
    TreeView1: TTreeView;
    ImageList1: TImageList;
    procedure lbFltDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure TreeView1Expanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
  private
    procedure SetVal_ex(Atext: String; aVal: Variant; ASP: TADOStoredProc);
    { Private declarations }
  public
    procedure MakeList(SL : TStrings; exList : TStrings = nil);
    function NameTrans(Atext : String) : String;

    procedure SetParamval(APanel : TPanel; ASP : TADOStoredProc);
  end;

var
  Form1: TForm1;

implementation

uses frFLT;

{$R *.DFM}

{ TForm1 }

procedure TForm1.MakeList(SL : TStrings; exList : TStrings);
  procedure AddVal(aVal : String);
  begin
    if assigned(exList) then
    begin
      if exList.IndexOf(aVal) >= 0 then exit;
    end;
    SL.Add(aVal);
  end;
begin
  AddVal('Наименование');
  AddVal('Принадлежность');
  AddVal('Покупатель');
  AddVal('Продавец');
  AddVal('Действующий');
  AddVal('Завершенный');
  AddVal('Вид деятельности');
end;

procedure TForm1.lbFltDblClick(Sender: TObject);
var FR : TfFlt;
    N : integer;
begin
  N := lbFlt.ItemIndex;
  SetParamval(Panel1, spValList);
  spValList.Parameters.ParamByName('@FlDName').Value := NameTrans(lbFlt.Items[N]);
  
  FR := GetFrame(lbFlt.Items[N], Panel1, lbFlt.Items, spValList);


  lbFlt.Items.Delete(N);

  if N = lbFlt.Items.Count then N := N - 1;

  lbFlt.ItemIndex := N;
end;

procedure TForm1.FormCreate(Sender: TObject);
var Node : TTreeNode;
    SL : TStringList;
    i : integer;
begin
  MakeList(lbFlt.Items);

  for i := 0 to lbFlt.Items.Count - 1 do
  begin
    Node := TreeView1.Items.Add(nil, lbFlt.Items[i]);
    Node.HasChildren := true;
    Node.ImageIndex := 5;
  end;
end;

procedure TForm1.SetVal_ex(Atext : String; aVal : Variant; ASP: TADOStoredProc);
begin
  if aVal = '' then aVal := Null;
  Atext := '@' + NameTrans(Atext);
  ASP.Parameters.ParamByName(Atext).Value := aVal;
end;

procedure TForm1.SetParamval(APanel: TPanel; ASP: TADOStoredProc);
var i : integer;
begin
  ASP.Close;
  for i := 0 to ASP.Parameters.Count - 1 do
    ASP.Parameters[i].Value := Null;
  if APanel = nil then exit;
  
  for i := 0 to APanel.ControlCount - 1 do
  begin
    if (APanel.Controls[i] is TfFlt) then
    begin
      if TfFlt(APanel.Controls[i]).Visible then
        SetVal_ex(TfFlt(APanel.Controls[i]).Label1.Caption, TfFlt(APanel.Controls[i]).cbVal.Items[TfFlt(APanel.Controls[i]).cbVal.ItemIndex], ASP);

    end;
  end;
end;

function TForm1.NameTrans(Atext: String): String;
begin
 // Atext := StringReplace(StringReplace(Atext, '[', '', [rfReplaceAll, rfIgnoreCase]), ']', '', [rfReplaceAll, rfIgnoreCase]);
      if Atext = 'Наименование' then
        Result := 'Name';
      if Atext = 'Принадлежность' then
        Result := 'Owner';
      if Atext = 'Покупатель' then
        Result := 'isBayerStr';
      if Atext = 'Продавец' then
        Result := 'isSellerStr';
      if Atext = 'Действующий' then
        Result := 'isUsedStr';
      if Atext = 'Завершенный' then
        Result := 'isClosedStr';
      if Atext = 'Вид деятельности' then
        Result := 'WorkType';

end;

procedure TForm1.TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  if Node.ImageIndex in [4, 5] then
  begin
    if (Node.Expanded) then
      Node.ImageIndex := 5
    else
      Node.ImageIndex := 4;
  end;
end;

procedure TForm1.TreeView1GetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TForm1.TreeView1Expanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
var i, j : integer;
    N : TTreeNode;
    exList : TStringList;
    SL : TStringList;
begin
  if Node.Count > 0 then Exit;
  if Node.ImageIndex <> 15 then
  begin
    SetParamval(nil, spValList);

    N := Node;
    while (N <> nil) and (N.Parent <> nil) do
    begin
      if N.ImageIndex = 15 then
        SetVal_ex(N.Parent.Text, N.Text, spValList);
      N := N.Parent;
    end;

    spValList.Parameters.ParamByName('@FlDName').Value := NameTrans(Node.Text);
    with spValList do
    begin
      Open;
      while not Eof do
      begin
        N := TreeView1.Items.AddChild(Node, spValList.fieldByName('Val').AsString);
        N.ImageIndex := 15;
        N.HasChildren := true;
        Next;
      end;
    end;
  end
  else
  begin
    exList := TStringList.Create;
    SL := TStringList.Create;

    N := Node;
    while N <> nil do
    begin
      if N.ImageIndex <> 15 then
        exList.Add(N.Text);
      N := N.Parent;
    end;

    MakeList(SL, exList);

    for i := 0 to SL.Count - 1 do
    begin
      N := TreeView1.Items.AddChild(Node, SL[i]);
      N.HasChildren := true;
      N.ImageIndex := 5;
    end;
  end;
 { if (Node <> nil) and ((Node.Count = 0) and Node.HasChildren) and (TObject(Node.Data) is TDBObjectParented) then
  begin
    GetServiceTypeTree(Node, TDBObjectParented(Node.Data).ID, TreeView1);
  end;       }
end;

end.
