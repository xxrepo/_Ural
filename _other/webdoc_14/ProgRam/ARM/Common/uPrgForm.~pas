unit uPrgForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls;

type
  TPrgForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ProgressBar2: TProgressBar;
    PBGlobal: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    FHandle : HWnd;
    function GetMax: integer;
    function GetPosition: integer;
    procedure SetMax(const Value: integer);
    procedure SetPosition(const Value: integer);
    function GetMaxGlobal: integer;
    function GetPositionGlobal: integer;
    procedure SetMaxGlobal(const Value: integer);
    procedure SetPositionGlobal(const Value: integer);
    { Private declarations }
  public
    constructor Create(AOwner : TComponent; ALabel : String; AMax : integer; IsInput : boolean = true); overload;
    property Position : integer read GetPosition write SetPosition;
    property Max : integer read GetMax write SetMax;
    property PositionGlobal : integer read GetPositionGlobal write SetPositionGlobal;
    property MaxGlobal : integer read GetMaxGlobal write SetMaxGlobal;
  end;

var
  PrgForm: TPrgForm;

procedure ShowProgressForm(const AHandle : HWnd; Pos, Max : integer; ALabel : String;
                           PosGlobal : integer = -1;
                           MaxGlobal : integer = -1);
procedure CloseProgressForm;

implementation

{$R *.DFM}

{ TPrgForm }

procedure ShowProgressForm(const AHandle : HWnd; Pos, Max : integer; ALabel : String; PosGlobal, MaxGlobal : integer);
begin
  if not Assigned(PrgForm) then
  begin
    PrgForm := TPrgForm.Create(nil, ALabel, Max);
    PrgForm.FHandle := AHandle;
    Screen.Cursor := crSQLWait;
    if AHandle > 0 then
      SetWindowLong(PrgForm.Handle, GWL_HWNDPARENT, AHandle);
    PrgForm.Show;
  end;
  if Assigned(PrgForm) then
  begin
    PrgForm.Label1.Caption := ALabel;
    PrgForm.Max := Max;
    PrgForm.Position := Pos;
    PrgForm.Label1.rePaint;
    PrgForm.MaxGlobal := MaxGlobal;
    PrgForm.PositionGlobal := PosGlobal;

    PrgForm.BringToFront;
  end;
  
  Application.ProcessMessages;
end;

procedure CloseProgressForm;
begin
  if PrgForm <> nil then
    BringWindowToTop(PrgForm.FHandle);
  PrgForm.Free;
  Screen.Cursor := crDefault;
end;

constructor TPrgForm.Create(AOwner: TComponent; ALabel: String;
  AMax: integer; IsInput: boolean);
begin
  inherited Create(AOwner);
  Label1.Caption := ALabel;
end;

function TPrgForm.GetMax: integer;
begin
  Result := ProgressBar2.Max;
end;

function TPrgForm.GetPosition: integer;
begin
  Result := ProgressBar2.Position;
end;

procedure TPrgForm.SetMax(const Value: integer);
begin
  if Value >= 0 then
    ProgressBar2.Max := Value;
  ProgressBar2.Visible := Value > 0;
end;

procedure TPrgForm.SetPosition(const Value: integer);
var S : String;
begin
  if Value >= 0 then
    ProgressBar2.Position := Value;
  if ProgressBar2.Max > 0 then
    Label2.Caption := 'Выполнено ' + IntToStr(Trunc(ProgressBar2.Position/ProgressBar2.Max*100)) + '%'
  else
    Label2.Caption := 'Идет выполнение...';
  if Label2.Visible <> ProgressBar2.Visible then
    Label2.Visible := ProgressBar2.Visible;
end;

procedure TPrgForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TPrgForm.FormDestroy(Sender: TObject);
begin
  PrgForm := nil;
end;

function TPrgForm.GetMaxGlobal: integer;
begin
  Result := PBGlobal.Max;
end;

function TPrgForm.GetPositionGlobal: integer;
begin
  Result := PBGlobal.Position;
end;

procedure TPrgForm.SetMaxGlobal(const Value: integer);
begin
  if Value >= 0 then
    PBGlobal.Max := Value;
  PBGlobal.Visible := Value > 0;
end;

procedure TPrgForm.SetPositionGlobal(const Value: integer);
begin
  if Value >= 0 then
    PBGlobal.Position := Value;
end;

end.
