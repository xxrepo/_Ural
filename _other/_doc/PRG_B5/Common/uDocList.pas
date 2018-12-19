unit uDocList;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF VER150} Variants,{$ENDIF}  Classes, Graphics, Controls, Forms,
  Dialogs, frDoc, ExtCtrls, comctrls, frFindDoc, frGrp, AdvSplitter, AdvOfficePager,
  AdvPanel;

type
  TDocList = class(TForm)
    Splitter1: TAdvSplitter;
    pcDT: TAdvOfficePager;
    tsDT: TAdvOfficePage;
    tsFind: TAdvOfficePage;
    fFindDoc1: TfFindDoc;
    fDoc1: TfDoc;
    AdvPanel1: TAdvPanel;
    fGrp1: TfGrp;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure fGrp1OrgTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fFindDoc1Button2Click(Sender: TObject);
    procedure fDoc1aFindDocExecute(Sender: TObject);
    procedure pcDTResize(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure fDoc1pnBuffDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    destructor Destroy; override;
    procedure Initialize(id_DOCBASE : integer = -1);
  end;

var
  DocList: TDocList;
procedure ShowDocList(id_DOCBASE : integer = -1);

implementation

uses uDM;

{$R *.dfm}

procedure ShowDocList(id_DOCBASE : integer);
begin
  DM.Rights_GetUserRights(7);
  if not Assigned(DocList) then
  begin
    DocList := TDocList.Create(Application.MainForm);
    DocList.WindowState := wsMaximized;
    DocList.Initialize(id_DOCBASE);
  end
  else
  begin
    DocList.WindowState := wsMaximized;
    DocList.BringToFront;
    if id_DOCBASE > 0 then
      DocList.Initialize(id_DOCBASE);
  end;
end;


{ TDivisionTree }

procedure TDocList.Initialize(id_DOCBASE : integer);
begin

  fGrp1.Edit1.Visible := false;
  fGrp1.Button3.Visible := false;
 // fGrp1.ToolButton4.Visible := false;
  fGrp1.aSort.Visible := false;


  fGrp1.Fmode := 0;
  fGrp1.FShowAll := 1;
  fGrp1.Initialize(0, -1, false, id_DOCBASE);
  if id_DOCBASE > 0 then
    fDoc1.initialize(id_DOCBASE);
  tsDT.TabVisible := false;
  tsFind.TabVisible := false;
  pcDT.ActivePage := tsDT;
  fGrp1.fDoc := fDoc1;
  fDoc1.GetSett;
  fDoc1.ReloadBuff;
end;

procedure TDocList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TDocList.FormDestroy(Sender: TObject);
begin
  DocList := nil;
end;

procedure TDocList.fGrp1OrgTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  fGrp1.OrgTreeViewChange(Sender, Node);
  if Node <> nil then
  begin
    if (Node.HasChildren) or (TNodeObj(Node.Data).isGrp) then
      fDoc1.initialize2(-1)
    else
      fDoc1.initialize2(fGrp1.GetIDS);
  end;
end;

procedure TDocList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    fFindDoc1.SpeedButton2Click(Sender);
end;

procedure TDocList.fFindDoc1Button2Click(Sender: TObject);
begin
  pcDT.ActivePage := tsDT;
  fDoc1.dsDocList.DataSet := fDoc1.cdsDocList2;
  fDoc1.dsDocList.OnDataChange(fDoc1.dsDocList, nil);
    fDoc1.cbShowClosed.Visible := true;
    fDoc1.cbShowOpened.Visible := true;
end;

procedure TDocList.fDoc1aFindDocExecute(Sender: TObject);
begin
  if pcDT.ActivePage = tsFind then
    fFindDoc1Button2Click(nil)
  else
  begin
    pcDT.ActivePage := tsFind;
    fDoc1.dsDocList.DataSet := fFindDoc1.cdsDocList;
    fDoc1.dsDocList.OnDataChange(fDoc1.dsDocList, nil);
    fFindDoc1.initialize();
    fDoc1.cbShowClosed.Visible := false;
    fDoc1.cbShowOpened.Visible := false;
  end;
end;

destructor TDocList.Destroy;
begin
 // fDoc1.dsDocList.DataSet := nil;
  inherited;

end;

procedure TDocList.pcDTResize(Sender: TObject);
begin
  fGrp1.Width := pcDT.Width;
  fGrp1.Align := alClient;
end;

procedure TDocList.FormResize(Sender: TObject);
begin
  fDoc1.pnBuff.Top := 1;
  fDoc1.pnBuff.Width := fDoc1.pnBuff.Height;
  fDoc1.pnBuff.Left := fDoc1.width - fDoc1.pnBuff.width - 5;
end;

procedure TDocList.fDoc1pnBuffDblClick(Sender: TObject);
begin
  fGrp1.Initialize(0, -126);
end;

end.
