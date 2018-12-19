unit uAPNList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frBsnSelector, Db, DBClient, ExtCtrls, StdCtrls, frAPListOper, frAPList,
  frAPNList;

type
  TAPNList = class(TForm)
    fBsnSelector1: TfBsnSelector;
    fAPNList1: TfAPNList;
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

  procedure ShowAPNList;
var
  APNList: TAPNList;

implementation

uses foMyFunc, uDM;

  procedure ShowAPNList;
  begin
//    DM.Rights_GetUserRights(10, Null);
    if not Assigned(APNList) then
    begin
      APNList := TAPNList.Create(nil);
      APNList.Initialize;
    end
    else
    begin
      APNList.WindowState := wsMaximized;
      APNList.BringToFront;
    end;
  end;
{$R *.DFM}

{ TFormalDict }

procedure TAPNList.Initialize;
begin
  fApnList1.Initialize(fBsnSelector1.ID);
end;

procedure TAPNList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAPNList.FormDestroy(Sender: TObject);
begin
  APNList := nil;
end;

procedure TAPNList.fBsnSelector1Button1Click(Sender: TObject);
begin
  fBsnSelector1.Button1Click(Sender);
  Initialize;
end;

constructor TAPNList.Create(AOwner: TComponent);
begin
  inherited;
  fBsnSelector1.UID := 10;
  LoadValFromRegistry(Val, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  if Val <> Null then
    fBsnSelector1.ID := Val;

end;

destructor TAPNList.Destroy;
begin
  SaveValToRegistry(fBsnSelector1.ID, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  inherited;

end;

end.
