unit uCAList;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF VER150} Variants,{$ENDIF}  Classes, Graphics, Controls, Forms,
  Dialogs, frCA, Menus;

type
  TCAList = class(TForm)
    fCA1: TfCA;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure Initialize(ID : integer; is_Grp : integer);
    destructor Destroy; override;
  end;

var
  CAList: TCAList;
procedure ShowCAList(ID : integer = -1; is_Grp : integer = 1);

implementation

uses uDM;

{$R *.dfm}

procedure ShowCAList(ID : integer; is_Grp : integer);
begin
  DM.Rights_GetUserRights(7);
  if not Assigned(CAList) then
  begin
    CAList := TCAList.Create(Application.MainForm);
    CAList.WindowState := wsMaximized;
    CAList.Initialize(ID, is_Grp);
  end
  else
  begin
    CAList.WindowState := wsMaximized;
    CAList.BringToFront;
    if ID > 0 then
      CAList.Initialize(ID, is_Grp);
  end;
end;


{ TDivisionTree }

procedure TCAList.Initialize(ID : integer; is_Grp : integer);
var i : integer;
begin
  fCA1.RxSpeedButton2.Action := fCA1.aAddGrp;
  fCA1.Initialize(ID, is_Grp);
end;

procedure TCAList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCAList.FormDestroy(Sender: TObject);
begin
  CAList := nil;
end;

destructor TCAList.Destroy;
begin
  inherited;

end;


procedure TCAList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    fCA1.fFindFirm1SpeedButton2Click(Sender);

end;

end.
