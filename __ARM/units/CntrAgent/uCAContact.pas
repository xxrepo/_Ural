unit uCAContact;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frCAContact;

type

  TContact = record
    FIO : String;
    Post : String;
    Phone : String;
    email : String;
  end;
  
  TCAContact = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fCAContact1: TfCAContact;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EditContact(var Contact : TContact) : boolean;

var
  CAContact: TCAContact;

implementation

uses uMainForm;

{$R *.DFM}

function EditContact(var Contact : TContact) : boolean;
var F : TCAContact;
begin
  Result := false;
  F := TCAContact.Create(MainForm);
  try
    F.fCAContact1.edFIO.Text := Contact.FIO;
    F.fCAContact1.edPost.Text := Contact.Post;
    F.fCAContact1.edPhone.Text := Contact.Phone;
    F.fCAContact1.edMail.Text := Contact.email;

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Contact.FIO := F.fCAContact1.edFIO.Text;
      Contact.Post := F.fCAContact1.edPost.Text;
      Contact.Phone := F.fCAContact1.edPhone.Text;
      Contact.email := F.fCAContact1.edMail.Text;

      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TCAContact.btnOkClick(Sender: TObject);
begin
  if not fCAContact1.CheckData then
    ModalResult := mrNone;
end;

end.
