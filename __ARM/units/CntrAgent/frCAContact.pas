unit frCAContact;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfCAContact = class(TFrame)
    Label1: TLabel;
    edFIO: TEdit;
    Label2: TLabel;
    edPost: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edPhone: TEdit;
    edMail: TEdit;
  private
    { Private declarations }
  public
    function CheckData : boolean;
  end;

implementation

{$R *.DFM}

{ TfCAContact }

function TfCAContact.CheckData: boolean;
begin
  Result := false;
  with edFIO do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введено контактное лицо', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with edPhone do
    if (trim(Text) = '') and (trim(edMail.Text) = '')  then
    begin
      MessageBox(Handle, 'Не введена контактная информация', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  Result := true;

end;

end.
