unit uBJList_v2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frBsnSelector, ExtCtrls, StdCtrls, Buttons, ComCtrls,
  frBJList_v2;

type
  TBJList_v2 = class(TForm)
    fBJList1: TfBJList_v2;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    Val : Variant;
  public
    procedure Initialize;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

procedure ShowBJList_v2;
var
  BJList_v2: TBJList_v2;

implementation

uses foMyFunc, uDM;

{$R *.DFM}

procedure ShowBJList_v2;
begin
  DM.Rights_GetUserRights(110, Null);
  if not Assigned(BJList_v2) then
  begin
    BJList_v2 := TBJList_v2.Create(Application.MainForm);
    BJList_v2.Initialize;
  end
  else
  begin
    BJList_v2.WindowState := wsMaximized;
    BJList_v2.BringToFront;
  end;
end;

procedure TBJList_v2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TBJList_v2.FormDestroy(Sender: TObject);
begin
  BJList_v2 := nil;
end;

procedure TBJList_v2.Initialize;
begin
  fBJList1.Initialize;
end;

constructor TBJList_v2.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TBJList_v2.Destroy;
begin
  inherited;

end;

end.
