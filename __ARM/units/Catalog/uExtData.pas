unit uExtData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frBsnSelector, frExtData;

type
  TExtData = class(TForm)
    fBsnSelector1: TfBsnSelector;
    fExtData1: TfExtData;
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

  procedure ShowExtData;
var
  ExtData: TExtData;

implementation

uses foMyFunc, uDM;

  procedure ShowExtData;
  begin
    DM.Rights_GetUserRights(10, Null);
    if not Assigned(ExtData) then
    begin
      ExtData := TExtData.Create(nil);
      ExtData.Initialize;
    end
    else
    begin
      ExtData.WindowState := wsMaximized;
      ExtData.BringToFront;
    end;
  end;
{$R *.DFM}

{ TFormalDict }

procedure TExtData.Initialize;
begin
  fExtData1.Initialize(fBsnSelector1.ID);
end;

procedure TExtData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TExtData.FormDestroy(Sender: TObject);
begin
  ExtData := nil;
end;

procedure TExtData.fBsnSelector1Button1Click(Sender: TObject);
begin
  fBsnSelector1.Button1Click(Sender);
  Initialize;
end;

constructor TExtData.Create(AOwner: TComponent);
begin
  inherited;
  fBsnSelector1.UID := 10;
  LoadValFromRegistry(Val, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  if Val <> Null then
    fBsnSelector1.ID := Val;
end;

destructor TExtData.Destroy;
begin
  SaveValToRegistry(fBsnSelector1.ID, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  inherited;

end;

end.
