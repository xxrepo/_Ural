unit uComment_ext;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB;

type
  TComment_ext = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    GroupBox1: TGroupBox;
    cbTypeNone: TRadioButton;
    cbTypePisitiv: TRadioButton;
    cbTypeNegativ: TRadioButton;
    Panel2: TPanel;
    Button1: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    function GetCommentType: integer;
    function GetComment: String;
    procedure SetComment(const Value: String);
    procedure SetCommentType(const Value: integer);
    procedure SelectEvent(Sender: TObject);
    { Private declarations }
  public
    property CommentType : integer read GetCommentType write SetCommentType;
    property Comment : String read GetComment write SetComment;
  end;

function EditComment_ext(var CommentType : integer; var Comment : String; MaxLength: Integer) : boolean;

var
  Comment_ext: TComment_ext;


implementation

uses uDM, uMainForm, uOperSelector;

{$R *.DFM}
function EditComment_ext(var CommentType : integer; var Comment : String; MaxLength: Integer) : boolean;
var F : TComment_ext;
begin
  Result := false;
  F := TComment_ext.Create(MainForm);
  try
    F.Memo1.MaxLength := MaxLength;
    F.GroupBox1.Visible := CommentType <> -13;

    F.CommentType := CommentType;
    F.Comment := Comment;

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      CommentType := F.CommentType;
      Comment := F.Comment;

      Result := true;
    end;
  finally
    F.Free;
  end;
end;
{ TComment_ext }

procedure TComment_ext.btnOkClick(Sender: TObject);
begin
  if Trim(Memo1.Lines.Text) = '' then
  begin
    ModalResult := mrNone;
    MessageBox(Handle, 'Не введен текст комментария. Пустые комментари добавлять нельзя.', 'Не введен комментарий', MB_ICONERROR);
  end;
end;

function TComment_ext.GetCommentType: integer;
begin
  if cbTypeNone.Checked then
    Result := 0
  else
    if cbTypePisitiv.Checked then
      Result := 1
    else
      Result := -1;
end;

function TComment_ext.GetComment: String;
begin
  Result := Memo1.Lines.Text; 
end;

procedure TComment_ext.SetComment(const Value: String);
begin
  Memo1.Lines.Text := Value;
end;

procedure TComment_ext.SetCommentType(const Value: integer);
begin
  case Value of
    -1 : cbTypeNegativ.Checked := true;
    0 : cbTypeNone.Checked := true;
    1 : cbTypePisitiv.Checked := true;
  end;
end;

procedure TComment_ext.SelectEvent(Sender: TObject);
var S : String;
begin
  if Sender is TDataSet then
  begin
    S := '';
    
    TDataSet(Sender).FieldbyName('OperNum').AsString;

    Memo1.SelText := S;
  end;
end;

procedure TComment_ext.Button1Click(Sender: TObject);
begin
  ShowOperSelector(-1, true, SelectEvent); 
end;

end.
