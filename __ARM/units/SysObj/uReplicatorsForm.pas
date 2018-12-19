unit uReplicatorsForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, uReplicatorsFrame;

type
  TReplicatorsForm = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ReplicatorsFrame1: TReplicatorsFrame;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure Init(Aid_Business: Variant; ReadOnly:boolean=false; ShowToolBar:boolean=false);
  end;

var
  ReplicatorsForm: TReplicatorsForm;

implementation

{$R *.DFM}
procedure TReplicatorsForm.Init(Aid_Business: Variant; ReadOnly:boolean=false; ShowToolBar:boolean=false);
begin
  ReplicatorsFrame1.ReadOnly:=ReadOnly;
  with ReplicatorsFrame1 do
   begin
    ToolBar.Visible:=ShowToolBar;
    if FormStyle=fsNormal then
     Panel1.Visible:=True
    else
     Panel1.Visible:=False;
    Init(Aid_Business);
  end;
end;

procedure TReplicatorsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle=fsMDIChild then
 Action:=caFree;
end;

procedure TReplicatorsForm.FormDestroy(Sender: TObject);
begin
 ReplicatorsForm:=nil;
end;

procedure TReplicatorsForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then ModalResult:=mrOk;
 if Key=27 then ModalResult:=mrCancel;
end;

end.
