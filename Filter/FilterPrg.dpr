program FilterPrg;

uses
  Forms,
  um in 'um.pas' {Form1},
  uFltEng in 'AppServer\uFltEng.pas',
  frFltList in '..\units\Filter\frFltList.pas' {fFltList: TFrame},
  UniverseFilterForm in '..\units\Filter\UniverseFilterForm.pas' {UFForm},
  UniverseFilterUnit2 in '..\units\Filter\UniverseFilterUnit2.pas',
  uInputBoxDate in '..\units\Filter\uInputBoxDate.pas' {frmInputBoxDate},
  uInputBoxDigit in '..\units\Filter\uInputBoxDigit.pas' {FrmInputBoxDigit},
  uInputBoxStr in '..\units\Filter\uInputBoxStr.pas' {FrmInputBoxStr},
  uInputBoxObj in '..\units\Filter\uInputBoxObj.pas' {FrmInputBoxObj},
  uGridUtils in '..\units\Filter\uGridUtils.pas',
  UniverseFilter in '..\units\Filter\UniverseFilter.pas',
  foMyFunc in '..\common\foMyFunc.pas',
  uInputBox in '..\common\uInputBox.pas' {FrmInputBox},
  uDM in '..\Em\uDM.pas' {DM: TDataModule},
  LogInUnit in '..\units\LogIn\LogInUnit.pas' {LogInForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
