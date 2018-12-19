unit uComment;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TComment = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    GroupBox1: TGroupBox;
    cbTypeNone: TRadioButton;
    cbTypePisitiv: TRadioButton;
    cbTypeNegativ: TRadioButton;
    procedure btnOkClick(Sender: TObject);
  private
    function GetCommentType: integer;
    function GetComment: String;
    procedure SetComment(const Value: String);
    procedure SetCommentType(const Value: integer);
    { Private declarations }
  public
    property CommentType : integer read GetCommentType write SetCommentType;
    property Comment : String read GetComment write SetComment;
  end;

function EditComment(var CommentType : integer; var Comment : String; MaxLength: Integer = 255) : boolean;

var
  Comment: TComment;


implementation

uses uDM, uMainForm;

{$R *.DFM}
function EditComment(var CommentType : integer; var Comment : String; MaxLength: Integer) : boolean;
var F : TComment;
begin
  Result := false;
  F := TComment.Create(MainForm);
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
{ TComment }

procedure TComment.btnOkClick(Sender: TObject);
begin
  if Trim(Memo1.Lines.Text) = '' then
  begin
    ModalResult := mrNone;
    MessageBox(Handle, 'Не введен текст комментария. Пустые комментари добавлять нельзя.', 'Не введен комментарий', MB_ICONERROR);
  end;
end;

function TComment.GetCommentType: integer;
begin
  if cbTypeNone.Checked then
    Result := 0
  else
    if cbTypePisitiv.Checked then
      Result := 1
    else
      Result := -1;
end;

function TComment.GetComment: String;
begin
  Result := Memo1.Lines.Text; 
end;

procedure TComment.SetComment(const Value: String);
begin
  Memo1.Lines.Text := Value;
end;

procedure TComment.SetCommentType(const Value: integer);
begin
  case Value of
    -1 : cbTypeNegativ.Checked := true;
    0 : cbTypeNone.Checked := true;
    1 : cbTypePisitiv.Checked := true;
  end;
end;

end.
