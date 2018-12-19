unit uCnstItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frCnstItem, frBsnSelector;

type
  TCnstItem = class(TForm)
    fCnstItem1: TfCnstItem;
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

  procedure ShowCnstItem;
var
  CnstItem: TCnstItem;

implementation

uses foMyFunc, uDM;


  procedure ShowCnstItem;
  begin
  //  DM.Rights_GetUserRights(10, Null);
    if not Assigned(CnstItem) then
    begin
      CnstItem := TCnstItem.Create(nil);
      CnstItem.Initialize;
    end
    else
    begin
      CnstItem.WindowState := wsMaximized;
      CnstItem.BringToFront;
    end;
  end;

{$R *.DFM}

{ TFuncDict }

procedure TCnstItem.Initialize;
begin
  fCnstItem1.Initialize(fBsnSelector1.ID);
end;

procedure TCnstItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCnstItem.FormDestroy(Sender: TObject);
begin
  CnstItem := nil;
end;

procedure TCnstItem.fBsnSelector1Button1Click(Sender: TObject);
begin
  fBsnSelector1.Button1Click(Sender);
  Initialize;
end;

constructor TCnstItem.Create(AOwner: TComponent);
begin
  inherited;
  fBsnSelector1.UID := 10;
  LoadValFromRegistry(Val, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  if Val <> Null then
    fBsnSelector1.ID := Val;

end;

destructor TCnstItem.Destroy;
begin
  SaveValToRegistry(fBsnSelector1.ID, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  inherited;

end;

end.
