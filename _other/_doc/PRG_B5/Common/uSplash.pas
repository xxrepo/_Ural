unit uSplash;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF VER150} Variants, {$ENDIF} Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSplash = class(TForm)
    Label1: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Splash: TSplash;

implementation

{$R *.dfm}

procedure TSplash.FormDestroy(Sender: TObject);
begin
  Splash := nil;
end;

procedure TSplash.FormCreate(Sender: TObject);
begin
  Caption := Application.Title;
end;

end.
