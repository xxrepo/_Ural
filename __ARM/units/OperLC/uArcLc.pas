unit uArcLc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frArcLc, Menus;

type
  TArcLc = class(TForm)
    fArcLc1: TfArcLc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Initialize(id_business : Variant);
  end;

var
  ArcLc: TArcLc;

implementation

{$R *.DFM}

{ TArcLc }

procedure TArcLc.Initialize(id_business: Variant);
begin
  fArcLc1.Initialize(id_business);
end;

procedure TArcLc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TArcLc.FormDestroy(Sender: TObject);
begin
  ArcLc := nil;
end;

end.
