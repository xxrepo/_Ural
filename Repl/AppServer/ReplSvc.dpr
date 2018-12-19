program ReplSvc;

uses
  SvcMgr,
  uSvc in 'uSvc.pas' {ural_Replicator: TService},
  ReplSvc_TLB in 'ReplSvc_TLB.pas',
  uRDM in 'uRDM.pas' {ReplDM: TRemoteDataModule} {ReplDM: CoClass},
  uMeCrpt in '..\..\__ARM\common\uMeCrpt.pas';

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tural_Replicator, ural_Replicator);
  Application.Run;
end.
