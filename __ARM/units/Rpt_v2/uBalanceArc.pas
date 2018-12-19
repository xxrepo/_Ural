unit uBalanceArc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frBalanceArc, frBsnSelector, ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  TBalanceArc = class(TForm)
    fBalanceArc1: TfBalanceArc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    Val : Variant;
  public
    procedure Initialize;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  BalanceArc: TBalanceArc;

implementation

uses foMyFunc, uDM;

{$R *.DFM}

procedure TBalanceArc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TBalanceArc.FormDestroy(Sender: TObject);
begin
  BalanceArc := nil;
end;

procedure TBalanceArc.Initialize;
begin

end;

constructor TBalanceArc.Create(AOwner: TComponent);
begin
  inherited;
//  LoadValFromRegistry(Val, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
//  if Val <> Null then
//    fBsnSelector1.ID := Val;

end;

destructor TBalanceArc.Destroy;
begin
//  SaveValToRegistry(fBsnSelector1.ID, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  inherited;

end;

end.
