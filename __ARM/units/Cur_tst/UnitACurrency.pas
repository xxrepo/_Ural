unit UnitACurrency;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Db, DBCtrls, Buttons;

type
  TFormACurrency = class(TForm)
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormACurrency: TFormACurrency;

implementation

uses Common,
UnitCurrency, uDM;

{$R *.DFM}

procedure TFormACurrency.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #22]) then Key:=#0;
end;

procedure TFormACurrency.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', DecimalSeparator, #8, #22]) then Key:=#0;
end;

end.
