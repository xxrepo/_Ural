unit uCAList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, frCntrAgentList, StdCtrls, RXSpin, frCAGroupList, comctrls,
  frReprList, db, registry, frCaNavigator;

type
  TCAList = class(TForm)
    fCaNavigator1: TfCaNavigator;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Fid_Bsn, FDisabled: Variant;
    FisOwn : boolean;
  public
    procedure Initialize(id_Bsn : Variant; Disabled : Variant; isOwn : Boolean);
  end;

var
  CAList: TCAList;

implementation

uses uDM;

{$R *.DFM}

procedure TCAList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCAList.Initialize(id_Bsn, Disabled : Variant; isOwn: Boolean);
var AID : Variant;
begin
  AID := Null;
  Fid_Bsn := id_Bsn;
  FDisabled := Disabled;
  FisOwn := isOwn;
  fCaNavigator1.Initialize(AID, Fid_Bsn, FDisabled, FisOwn);
//  fCntrAgentList1.Init(Null, Fid_Bsn, FDisabled, FisOwn, Null);
end;

procedure TCAList.FormDestroy(Sender: TObject);
begin
  CAList := nil;
end;

end.
