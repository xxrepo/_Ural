unit uLCEnt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frLCEntFrame;

type
  TLCEnt = class(TForm)
    fLCEntFrame1: TfLCEntFrame;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    Fid_Bsn : Variant;
    FDisabled : Variant;
  public
    procedure Initialize(id_Bsn : Variant; Disabled : Variant);
  end;

var
  LCEnt: TLCEnt;

  procedure ShowLCEnt(id_Bsn : Variant; Disabled : Variant);

implementation

uses uMainForm, foMyFunc, uDM;

procedure ShowLCEnt(id_Bsn : Variant; Disabled : Variant);
begin
  //DM.Rights_GetUserRights(10, Null);
  if not Assigned(LCEnt) then
  begin
    LCEnt := TLCEnt.Create(MainForm);
    LCEnt.Initialize(id_Bsn, Disabled);
  end
  else
  begin
    LCEnt.WindowState := wsMaximized;
    LCEnt.BringToFront;
  end;
end;

{$R *.DFM}

{ TEForm }

procedure TLCEnt.Initialize(id_Bsn, Disabled: Variant);
var Need : TSelectedObj;
begin
  Fid_Bsn := id_Bsn;
  FDisabled := Disabled;
  fLCEntFrame1.Initialize(Need, Fid_Bsn, FDisabled, [eotBsn, eotFin, eotWH, eotManuf, eotGoods, eotSimplRepr], false, false);
end;

procedure TLCEnt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TLCEnt.FormDestroy(Sender: TObject);
begin
  LCEnt := nil;
end;

end.
