program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  IMessage in '..\ARM\MAPI\imessage.pas',
  MapiDefs in '..\ARM\MAPI\mapidefs.pas',
  MapiGuid in '..\ARM\MAPI\mapiguid.pas',
  MapiTags in '..\ARM\MAPI\MapiTags.pas',
  MAPIUtil in '..\ARM\MAPI\MAPIUtil.pas',
  MapiX in '..\ARM\MAPI\mapix.pas',
  tnef in '..\ARM\MAPI\tnef.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
