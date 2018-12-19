unit uWHExp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frBsnSelector;

type
  TWHExp = class(TForm)
    fBsnSelector1: TfBsnSelector;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;

    procedure Initialize(id_business : Variant);
  end;

var
  WHExp: TWHExp;

implementation

uses foMyFunc, uDM;

{$R *.DFM}

procedure ShowWHExp(id_business : Variant);
var F : TWHExp;
begin
  F := TWHExp.Create(nil);
  try
    F.Show;
    F.Repaint;
    F.Initialize(id_business);
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

{ TForm1 }

constructor TWHExp.Create(AOwner: TCOmponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TWHExp.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

destructor TWHExp.Destroy;
begin
  inherited;

end;

procedure TWHExp.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TWHExp.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TWHExp.Initialize(id_business: Variant);
begin

end;

end.
