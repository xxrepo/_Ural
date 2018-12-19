unit uGroupsForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uGroupsFrame, StdCtrls, ExtCtrls;

type
  TGroupsForm = class(TForm)
    GroupsFrame: TGroupsFrame;
    Panel2222: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(ReadOnly:boolean=false; ShowToolBar:boolean=false);
  end;

var
  GroupsForm: TGroupsForm;

implementation

{$R *.DFM}

procedure TGroupsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FormStyle=fsMDIChild then
 Action:=caFree;
end;

procedure TGroupsForm.Init(ReadOnly:boolean=false; ShowToolBar:boolean=false);
begin
  GroupsFrame.ReadOnly:=ReadOnly;
  with GroupsFrame do
   begin
    ToolBar.Visible:=ShowToolBar;
    Init;
   end;
    if FormStyle=fsNormal then
     Panel2222.Visible:=True
    else
     Panel2222.Visible:=False;
   
end;

procedure TGroupsForm.FormDestroy(Sender: TObject);
begin
 GroupsForm:=nil;
end;

end.
