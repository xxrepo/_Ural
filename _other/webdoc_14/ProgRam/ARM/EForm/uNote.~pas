unit uNote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, sMemo;

type
  TxNote = class(TForm)
    sMemo1: TsMemo;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  xNote: TxNote;
procedure ShowxNote;

implementation

uses foMyFunc, uDM;

{$R *.DFM}

{ TForm1 }

constructor TxNote.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);

end;

procedure TxNote.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure ShowxNote;
begin
  if xNote <> nil then
  begin
    xNote.Show;
    xNote.BringToFront;
    Exit;
  end;
  xNote := TxNote.Create(nil);
  try



    xNote.Show;
  except
    xNote.Free;
    xNote := nil;
  end;
end;

procedure TxNote.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TxNote.FormHide(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

end.
