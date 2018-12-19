unit uAccsForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, uAccsFrame;

type
  TAccsForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    AccsFrame1: TAccsFrame;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AId_Business:Variant; ReadOnly:boolean=false; ShowToolBar:boolean=false);
  end;

var
  AccsForm: TAccsForm;

implementation

{$R *.DFM}
procedure TAccsForm.Init(AId_Business:Variant; ReadOnly:boolean=false; ShowToolBar:boolean=false);
begin
    if FormStyle=fsNormal then
     Panel1.Visible:=True
    else
     Panel1.Visible:=False;

    AccsFrame1.Init(AId_Business, ReadOnly, ShowToolBar);
end;

procedure TAccsForm.FormDestroy(Sender: TObject);
begin
 AccsForm:=nil;
end;

procedure TAccsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FormStyle=fsMDIChild then
 Action:=caFree;
end;

procedure TAccsForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then ModalResult:=mrOk;
 if Key=27 then ModalResult:=mrCancel;
end;

end.
