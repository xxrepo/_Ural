unit uFormalDict;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frFormalDict, frBsnSelector;

type
  TFormalDict = class(TForm)
    fFormalDict1: TfFormalDict;
    fBsnSelector1: TfBsnSelector;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
  private
    Val : Variant;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Initialize;
  end;

  procedure ShowFormalDict;
var
  FormalDict: TFormalDict;

implementation

uses foMyFunc, uDM;

  procedure ShowFormalDict;
  begin
    DM.Rights_GetUserRights(10, Null);
    if not Assigned(FormalDict) then
    begin
      FormalDict := TFormalDict.Create(nil);
      FormalDict.Initialize;
    end
    else
    begin
      FormalDict.WindowState := wsMaximized;
      FormalDict.BringToFront;
    end;
  end;
{$R *.DFM}

{ TFormalDict }

procedure TFormalDict.Initialize;
begin
  fFormalDict1.Initialize(fBsnSelector1.ID);
end;

procedure TFormalDict.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormalDict.FormDestroy(Sender: TObject);
begin
  FormalDict := nil;
end;

procedure TFormalDict.fBsnSelector1Button1Click(Sender: TObject);
begin
  fBsnSelector1.Button1Click(Sender);
  Initialize;
end;

constructor TFormalDict.Create(AOwner: TComponent);
begin
  inherited;
  fBsnSelector1.UID := 10;
  LoadValFromRegistry(Val, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  if Val <> Null then
    fBsnSelector1.ID := Val;
end;

destructor TFormalDict.Destroy;
begin
  SaveValToRegistry(fBsnSelector1.ID, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  inherited;

end;

end.
