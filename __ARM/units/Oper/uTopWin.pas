unit uTopWin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frOperEmptyData;

type
  TTopWin = class(TForm)
    fOperEmptyData1: TfOperEmptyData;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override; 
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure ShowEmptyOperProp(ID_Oper : integer; AOwner : TComponent);

var
  TopWin: TTopWin;

implementation

procedure ShowEmptyOperProp(ID_Oper : integer; AOwner : TComponent);
var F : TTopWin;
begin
  F := TTopWin.Create(AOwner);
  try
    F.fOperEmptyData1.Initialize(ID_Oper);
    F.Show;
    F.Top := 10;
    F.Left := Screen.Width - F.Width - 10;
  except
    F.Free;
  end;
end;

{$R *.DFM}

constructor TTopWin.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TTopWin.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TTopWin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TTopWin.FormShow(Sender: TObject);
begin
  SetForegroundWindow(Handle);
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE);
end;

end.
