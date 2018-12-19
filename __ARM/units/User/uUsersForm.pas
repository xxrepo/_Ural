unit uUsersForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, uUsersFrame, StdCtrls;

type
  TUsersForm = class(TForm)
    UsersFrame: TUsersFrame;
    Panel1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
    procedure Init(ReadOnly:boolean=false; ShowToolBar:boolean=false);
  end;

var
  UsersForm: TUsersForm;

implementation
  uses   uNSIDetailFormsAPI;

{$R *.DFM}             

procedure TUsersForm.Init(ReadOnly:boolean=false; ShowToolBar:boolean=false);
begin
    if FormStyle=fsNormal then
     Panel1.Visible:=True
    else
     Panel1.Visible:=False;

  UsersFrame.ReadOnly:=ReadOnly;
  with UsersFrame do
   begin
    ToolBar.Visible:=ShowToolBar;
    Init;
   end;
end;

procedure TUsersForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FormStyle=fsMDIChild then
 Action:=caFree;
end;

procedure TUsersForm.FormDestroy(Sender: TObject);
begin
 UsersForm:=nil;
end;

procedure TUsersForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then ModalResult:=mrOk;
 if Key=27 then ModalResult:=mrCancel;
end;

end.
