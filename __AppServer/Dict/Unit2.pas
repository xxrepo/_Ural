unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, svc_Dict_TLB, StdVcl;

type
  TRDM2 = class(TRemoteDataModule, IRDM2)
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure Method1; safecall;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TRDM2.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TRDM2.Method1;
begin

end;

initialization
  TComponentFactory.Create(ComServer, TRDM2,
    Class_RDM2, ciMultiInstance, tmApartment);
end.
