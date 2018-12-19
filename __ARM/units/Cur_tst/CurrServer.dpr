program CurrServer;

uses
  Forms,
  CurrServer_TLB in 'CurrServer_TLB.pas',
  uRDM in 'uRDM.pas' {DM_Cur: TRemoteDataModule} {Cur: CoClass},
  uSvc in 'uSvc.pas' {ural_Curr: TService};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tural_Curr, ural_Curr);
  Application.Run;
end.
