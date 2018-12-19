program serverProject1;

uses
  Forms,
  u2 in 'u2.pas' {Form1},
  serverProject1_TLB in 'serverProject1_TLB.pas',
  uRDM in 'uRDM.pas' {RDM: TRemoteDataModule} {RDM: CoClass};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
