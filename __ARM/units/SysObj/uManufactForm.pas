unit uManufactForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uManufactFrame, StdCtrls, ExtCtrls;

type
  TManufactForm = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ManufactFrame1: TManufactFrame;
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
  ManufactForm: TManufactForm;

implementation

{$R *.DFM}

procedure TManufactForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle=fsMDIChild then
  Action:=caFree;
end;

procedure TManufactForm.Init(AId_Business:Variant; ReadOnly:boolean=false; ShowToolBar:boolean=false);
begin
{
  ManufactFrame1.ReadOnly:=ReadOnly;
  with ManufactFrame1 do
   begin
    ToolBar.Visible:=ShowToolBar;
    Init(AId_Business);
   end;
}
    ManufactFrame1.Init(AId_Business,ReadOnly,ShowToolBar);
    if FormStyle=fsNormal then
     Panel1.Visible:=True
    else
     Panel1.Visible:=False;
end;


procedure TManufactForm.FormDestroy(Sender: TObject);
begin
 ManufactForm:=nil;
end;

procedure TManufactForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then ModalResult:=mrOk;
 if Key=27 then ModalResult:=mrCancel;
end;

end.
