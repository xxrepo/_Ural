program DldUplPrj;

uses
  Forms,
  Dld_upl in 'Dld_upl.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
