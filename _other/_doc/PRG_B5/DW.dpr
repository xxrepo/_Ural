program DW;

uses
  Forms,
  uMain in 'uMain.pas' {Main},
  uDM in 'uDM.pas' {DM: TDataModule},
  uMeCrpt in 'Common\uMeCrpt.pas',
  uSplash in 'Common\uSplash.pas' {Splash},
  LogInUnit in 'Common\LogInUnit.pas' {LogInForm},
  foMyFunc in 'Common\foMyFunc.pas',
  uInputBoxDigit in 'Common\uInputBoxDigit.pas' {FrmInputBoxDigit},
  uPrgForm in 'Common\uPrgForm.pas' {PrgForm},
  uArcProp in 'Common\uArcProp.pas' {ArcProp},
  frByObjFileList in 'EForm\frByObjFileList.pas' {fByObjFileList: TFrame},
  uInputQuery_File in 'EForm\uInputQuery_File.pas' {frmInputQuery_File},
  frObjList in 'EForm\frObjList.pas' {fObjList: TFrame},
  frGrp in 'EForm\frGrp.pas' {fGrp: TFrame},
  uDTSelector in 'EForm\uDTSelector.pas' {DTSelector},
  frDoc in 'Common\frDoc.pas' {fDoc: TFrame},
  uDocList in 'Common\uDocList.pas' {DocList},
  uDocProp in 'EForm\uDocProp.pas' {DocProp},
  frFindFirm in 'EForm\frFindFirm.pas' {fFindFirm: TFrame},
  frFindDoc in 'EForm\frFindDoc.pas' {fFindDoc: TFrame},
  uCATProp in 'Common\uCATProp.pas' {CATProp},
  uDTProp in 'Common\uDTProp.pas' {DTProp},
  InputQuery_Obj in 'EForm\InputQuery_Obj.pas' {frmInputQuery_Obj},
  uCurList in 'Common\uCurList.pas' {CurList},
  uInputBoxDate in 'Common\uInputBoxDate.pas' {frmInputBoxDate},
  foMyFuncDXTreeExcel in 'Common\foMyFuncDXTreeExcel.pas',
  frEventList in 'EForm\frEventList.pas' {fEventList: TFrame},
  uDic in 'Common\uDic.pas' {Dic},
  uEventProp in 'Common\uEventProp.pas' {EventProp},
  frDocProp in 'EForm\frDocProp.pas' {fDocProp: TFrame},
  uSettDiagr in 'EForm\uSettDiagr.pas' {SettDiagr},
  frUsers in 'Common\frUsers.pas' {fUsers: TFrame},
  uUsers in 'Common\uUsers.pas' {Users},
  uUserProp in 'Common\uUserProp.pas' {UserProp},
  ActnList in '..\..\..\program files\borland\delphi5\source\vcl\actnlist.pas',
  foMyFuncEh in 'Common\foMyFuncEh.pas',
  foMyFuncEhExcel in 'Common\foMyFuncEhExcel.pas',
  uMultiEventProp in 'Common\uMultiEventProp.pas' {MultiEventProp},
  frBSN in 'Common\frBSN.pas' {fBSN: TFrame},
  uBsn in 'Common\uBsn.pas' {Bsn},
  frDualList in 'Common\frDualList.pas' {fDualList: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'InfoSystem';
  if false then Application.CreateForm(TMain, Main);
  Application.CreateForm(TDM, DM);
  Splash.Free;
  if DM.NeedTerminate then
  begin
    DM.free;
    Application.Terminate;
    Exit;
  end;
  Application.CreateForm(TMain, Main);
  Application.BringToFront;

  Application.Run;
end.
