unit uExtData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frExtData;

type
  TExtData = class(TForm)
    fExtData1: TfExtData;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
  private
 
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
  fExtData1.Free;
  fExtData1 := TfExtData.Create(Self);
  fExtData1.Parent := Self;
  fExtData1.Align := alClient;
  
  fExtData1.Initialize;
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
   Initialize;
end;

constructor TExtData.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TExtData.Destroy;
begin
   inherited;

end;

end.
