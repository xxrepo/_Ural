program _Project1;

uses
  Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  UnitCurrency in 'UnitCurrency.pas' {FormCurrency},
  UnitURLsTune in 'UnitURLsTune.pas' {FormURLsTune},
  Pinger in 'Pinger.pas',
  UnitACurrency in 'UnitACurrency.pas' {FormACurrency},
  UnitARate in 'UnitARate.pas' {FormARate},
  UnitCheckRates in 'UnitCheckRates.pas' {FormCheckRates},
  UnitSelectSite in 'UnitSelectSite.pas' {FormSelectSite},
  Common in 'Common.pas',
  HyperParse in '..\..\common\HyperParse.pas',
  foMyFunc in '..\..\common\foMyFunc.pas',
  uInputBox in '..\..\common\uInputBox.pas' {FrmInputBox},
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
