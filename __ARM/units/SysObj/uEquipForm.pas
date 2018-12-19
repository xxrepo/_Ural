unit uEquipForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uEquipFrame, StdCtrls, ExtCtrls;

type
  TEquipForm = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AId_Business:Variant; ReadOnly:boolean=false; ShowToolBar:boolean=false);
  end;

var
  EquipForm: TEquipForm;

implementation

{$R *.DFM}

procedure TEquipForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle=fsMDIChild then
  Action:=caFree;
end;

procedure TEquipForm.Init(AId_Business:Variant; ReadOnly:boolean=false; ShowToolBar:boolean=false);
begin
  EquipFrame1.ReadOnly:=ReadOnly;
  with EquipFrame1 do
   begin
    ToolBar.Visible:=ShowToolBar;
    if FormStyle=fsNormal then
     Panel1.Visible:=True
    else
     Panel1.Visible:=False;
    Init(AId_Business,ReadOnly,ShowToolBar);
   end;
end;


procedure TEquipForm.FormDestroy(Sender: TObject);
begin
 EquipForm:=nil;
end;

procedure TEquipForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then ModalResult:=mrOk;
 if Key=27 then ModalResult:=mrCancel;
end;

end.
