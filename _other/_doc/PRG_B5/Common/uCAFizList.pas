unit uCAFizList;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF VER150} Variants,{$ENDIF}  Classes, Graphics, Controls, Forms,
  Dialogs, frCA, Menus, frCAFiz;

type
  TCAFizList = class(TForm)
    fCA1: TfCAFiz;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure Initialize(ID : integer);
    destructor Destroy; override;
  end;

var
  CAFizList: TCAFizList;
procedure ShowCAFizList(ID : integer = -1);

implementation

uses uDM;

{$R *.dfm}

procedure ShowCAFizList(ID : integer);
begin
  DM.Rights_GetUserRights(7);
  if not Assigned(CAFizList) then
  begin
    CAFizList := TCAFizList.Create(Application.MainForm);
    CAFizList.WindowState := wsMaximized;
    CAFizList.Initialize(ID);
  end
  else
  begin
    CAFizList.WindowState := wsMaximized;
    CAFizList.BringToFront;
    if ID > 0 then
      CAFizList.Initialize(ID);
  end;
end;


{ TDivisionTree }

procedure TCAFizList.Initialize(ID : integer);
begin
  fCA1.RxSpeedButton2.Action := fCA1.aAddPrsn;
  fCA1.aOrgChart.Caption := 'OrgChart for selected person';
  fCA1.Initialize(ID, 0);
end;

procedure TCAFizList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCAFizList.FormDestroy(Sender: TObject);
begin
  CAFizList := nil;
end;

destructor TCAFizList.Destroy;
begin
  inherited;

end;


procedure TCAFizList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    fCA1.fFindFirm1SpeedButton2Click(Sender);

end;

end.
