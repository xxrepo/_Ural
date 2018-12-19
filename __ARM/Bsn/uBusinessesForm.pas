unit uBusinessesForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, dbgrids, ExtCtrls, Grids, uBusinessesFrame, Menus;

type
  TBusinessesForm = class(TForm)
    BusinessesFrame1: TBusinessesFrame;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BusinessesFrame1RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent); override;
    procedure Init(ReadOnly:boolean=false; ShowToolBar:boolean=false);
  end;

var
  BusinessesForm: TBusinessesForm;

implementation

uses foMyFunc;

{$R *.DFM}
procedure TBusinessesForm.Init(ReadOnly:boolean=false; ShowToolBar:boolean=false);
begin
  BusinessesFrame1.Init(ReadOnly,ShowToolBar);
    if FormStyle=fsNormal then
     Panel2.Visible:=True
    else
     Panel2.Visible:=False;
end;

procedure TBusinessesForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle=fsMDIChild then
   Action:=caFree;
end;

procedure TBusinessesForm.FormDestroy(Sender: TObject);
begin
 BusinessesForm:=nil;
end;

constructor TBusinessesForm.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TBusinessesForm.BusinessesFrame1RxDBGrid1DblClick(
  Sender: TObject);
var
  P:TPoint;
begin
  if FormStyle<>fsNormal then
    BusinessesFrame1.RxDBGrid1DblClick(Sender)
  else
  begin
    P:=Mouse.CursorPos;
    P:=THackGrid(Sender).ScreenToClient(P);
    if P.y<=THackGrid(Sender).RowHeights[0] then
      Exit;
    ModalResult := mrOk;
   end;

end;

end.
