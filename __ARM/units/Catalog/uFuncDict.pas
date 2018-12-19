unit uFuncDict;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frFuncDict, frBsnSelector;

type
  TFuncDict = class(TForm)
    fFuncDict1: TfFuncDict;
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

  procedure ShowFuncDict;
var
  FuncDict: TFuncDict;

implementation

uses foMyFunc, uDM;


  procedure ShowFuncDict;
  begin
    DM.Rights_GetUserRights(10, Null);
    if not Assigned(FuncDict) then
    begin
      FuncDict := TFuncDict.Create(nil);
      FuncDict.Initialize;
    end
    else
    begin
      FuncDict.WindowState := wsMaximized;
      FuncDict.BringToFront;
    end;
  end;

{$R *.DFM}

{ TFuncDict }

procedure TFuncDict.Initialize;
begin
  fFuncDict1.Initialize(fBsnSelector1.ID);
end;

procedure TFuncDict.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFuncDict.FormDestroy(Sender: TObject);
begin
  FuncDict := nil;
end;

procedure TFuncDict.fBsnSelector1Button1Click(Sender: TObject);
begin
  fBsnSelector1.Button1Click(Sender);
  Initialize;
end;

constructor TFuncDict.Create(AOwner: TComponent);
begin
  inherited;
  fBsnSelector1.UID := 10;
  LoadValFromRegistry(Val, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  if Val <> Null then
    fBsnSelector1.ID := Val;

end;

destructor TFuncDict.Destroy;
begin
  SaveValToRegistry(fBsnSelector1.ID, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  inherited;

end;

end.
