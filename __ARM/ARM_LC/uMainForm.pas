unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ComCtrls, StdCtrls, RXSpin, ActnList, ImgList, RXCtrls, ToolWin;
                                  
type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    StatusBar1: TStatusBar;
    N111: TMenuItem;
    N9: TMenuItem;
    miWindow: TMenuItem;
    ArrangeAll1: TMenuItem;
    Cascade1: TMenuItem;
    Tile1: TMenuItem;
    N8: TMenuItem;
    Ds1: TMenuItem;
    N24: TMenuItem;
    N20: TMenuItem;
    ActionList1: TActionList;
    aNewWH: TAction;
    aNewFin: TAction;
    aNewZac: TAction;
    aNewEmpty: TAction;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    ilImage: TImageList;
    aArc: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    RxSpeedButton1: TRxSpeedButton;
    Action1: TAction;
    ToolButton4: TToolButton;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ToolButton5: TToolButton;
    aCat: TAction;
    N7: TMenuItem;
    aShowRelinkView: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    Action2: TAction;
    N15: TMenuItem;
    N4: TMenuItem;
    Bvgjhnbhjdfnm1: TMenuItem;
    miInv: TMenuItem;
    Cgbcjrpfrfpjd1: TMenuItem;
    miInvRep: TMenuItem;
    N16: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure Tile1Click(Sender: TObject);
    procedure ArrangeAll1Click(Sender: TObject);
    procedure Ds1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure aNewWHExecute(Sender: TObject);
    procedure aNewFinExecute(Sender: TObject);
    procedure aNewZacExecute(Sender: TObject);
    procedure aNewEmptyExecute(Sender: TObject);
    procedure aArcExecute(Sender: TObject);
    procedure aCatExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aShowRelinkViewExecute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Bvgjhnbhjdfnm1Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure Cgbcjrpfrfpjd1Click(Sender: TObject);
    procedure miInvRepClick(Sender: TObject);
    procedure N16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses uDM, uLCEnt, uFormApi_Ware, foMyFunc, uLCSelectorUn, uFormApi_OperLC,
  uRelinkView, uOperImp_LC, uMovWHLC, uInvList, uInvRepList, uFormAPI_Doc;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Пользователь: ' + DM.FullFIO;
  if DM.Capt <> Null then
  begin
    Application.Title :=DM.Capt ;
    Caption := DM.Capt ;
  end;
  aNewWH.Visible := DM.CheckUserRights(1, Null);
  aNewFin.Visible := DM.CheckUserRights(2, Null);
  aNewZac.Visible := DM.CheckUserRights(4, Null);
  miInvRep.Visible := DM.CheckUserRights(1000, Null);
end;

procedure TMainForm.N8Click(Sender: TObject);
var i : integer;
begin
  for i := 0 to MDIChildCount - 1 do
    MDIChildren[i].WindowState := wsMinimized;
end;

procedure TMainForm.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm.Tile1Click(Sender: TObject);
begin
  Tile;
end;

procedure TMainForm.ArrangeAll1Click(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TMainForm.Ds1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.Button2Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
begin


end;
procedure TMainForm.aNewWHExecute(Sender: TObject);
var
    ID : integer;
begin
  ID := -1;
  if EditOperWareLC(ID) then
    RefresheArcLc(ID);
end;

procedure TMainForm.aNewFinExecute(Sender: TObject);
var
    ID : integer;
begin
  ID := -1;
  if EditOperFinLC(ID) then
    RefresheArcLc(ID);
end;

procedure TMainForm.aNewZacExecute(Sender: TObject);
var
    ID : integer;
begin
  ID := -1;
  if EditOperOffsetLC(ID) then
    RefresheArcLc(ID);
end;

procedure TMainForm.aNewEmptyExecute(Sender: TObject);
var
    ID : integer;
begin
  ID := -1;
  if EditOperEmptyLC(ID) then
    RefresheArcLc(ID);
end;

procedure TMainForm.aArcExecute(Sender: TObject);
begin
  ShowArcLc(Null);
end;

procedure TMainForm.aCatExecute(Sender: TObject);
begin
  ShowLCEnt(-13, 0);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Завершать работу с программой?', Pchar(Application.Title), MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idYes then
    Action := caFree
  else
    Action := caNone;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TMainForm.aShowRelinkViewExecute(Sender: TObject);
begin
  ShowRelinkView  ;
end;

procedure TMainForm.Action2Execute(Sender: TObject);
var Rez : boolean;
    ID : integer;
begin
  ID := -1;
  Rez := EditOperWareLC(ID, false, false, false, false, true);
end;

procedure TMainForm.Bvgjhnbhjdfnm1Click(Sender: TObject);
begin
  ShowOperImp_LC(Null);
end;

procedure TMainForm.N13Click(Sender: TObject);
begin
  ShowMovWHLC(Null, true);
end;

procedure TMainForm.Cgbcjrpfrfpjd1Click(Sender: TObject);
begin
  ShowInvList;
end;

procedure TMainForm.miInvRepClick(Sender: TObject);
begin
  ShowInvRepList(-1, Now-30, Now);
end;

procedure TMainForm.N16Click(Sender: TObject);
begin
    ShowDocList(Null, 0);

end;

end.
