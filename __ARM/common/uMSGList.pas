unit uMSGList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frMSG;

type
  TSMGList = class(TForm)
    fMSG1: TfMSG;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Initialize;
  end;

var
  SMGList: TSMGList;
procedure ShowSMGList;

implementation

{$R *.DFM}

procedure ShowSMGList;
begin
  if not Assigned(SMGList) then
  begin
    SMGList := TSMGList.Create(nil);
    SMGList.WindowState := wsMaximized;
    SMGList.Initialize;
  end
  else
  begin
    SMGList.WindowState := wsMaximized;
    SMGList.BringToFront;
  end;
end;

procedure TSMGList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TSMGList.FormDestroy(Sender: TObject);
begin
  SMGList := nil;
end;

procedure TSMGList.Initialize;
begin
  fMSG1.Initialize;
end;

end.
