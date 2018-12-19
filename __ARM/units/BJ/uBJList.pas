unit uBJList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frBalanceArc, frBsnSelector, ExtCtrls, StdCtrls, Buttons, ComCtrls,
  frBJList;

type
  TBJList = class(TForm)
    fBJList1: TfBJList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    Val : Variant;
  public
    procedure Initialize;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

procedure ShowBJList;
var
  BJList: TBJList;

implementation

uses foMyFunc, uDM;

{$R *.DFM}

procedure ShowBJList;
begin
  DM.Rights_GetUserRights(110, Null);
  if not Assigned(BJList) then
  begin
    BJList := TBJList.Create(Application.MainForm);
    BJList.Initialize;
  end
  else
  begin
    BJList.WindowState := wsMaximized;
    BJList.BringToFront;
  end;
end;

procedure TBJList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TBJList.FormDestroy(Sender: TObject);
begin
  BJList := nil;
end;

procedure TBJList.Initialize;
begin
  fBJList1.Initialize;
end;

constructor TBJList.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TBJList.Destroy;
begin
  inherited;

end;

end.
