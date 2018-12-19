program DemoWebDoc;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  frFLT in 'frFLT.pas' {fFlt: TFrame};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
