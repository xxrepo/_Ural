unit uWareHouseForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, uWareHouseFrame;

type
  TWareHouseForm = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    WareHouseFrame1: TWareHouseFrame;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
     procedure Init(AId_Business:Variant; ReadOnly:boolean=false; ShowToolBar:boolean=false);
    { Public declarations }
  end;

var
  WareHouseForm: TWareHouseForm;

implementation

{$R *.DFM}
procedure TWareHouseForm.Init(AId_Business:Variant; ReadOnly:boolean=false; ShowToolBar:boolean=false);
begin
 WareHouseFrame1.Init(AId_Business,ReadOnly,ShowToolBar);

    if FormStyle=fsNormal then
     Panel1.Visible:=True
    else
     Panel1.Visible:=False;
end;

procedure TWareHouseForm.FormDestroy(Sender: TObject);
begin
 WareHouseForm:=nil;
end;

procedure TWareHouseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle=fsMDIChild then
 Action:=caFree;
end;

procedure TWareHouseForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then ModalResult:=mrOk;
 if Key=27 then ModalResult:=mrCancel;
end;

end.
