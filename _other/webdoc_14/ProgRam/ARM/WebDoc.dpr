program WebDoc;



uses
  Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  foMyFunc in 'Common\foMyFunc.pas',
  foMyFuncEh in 'Common\foMyFuncEh.pas',
  foMyFuncEhExcel in 'Common\foMyFuncEhExcel.pas',
  foMyFuncDXTreeExcel in 'Common\foMyFuncDXTreeExcel.pas',
  uInputBox in 'Common\uInputBox.pas' {FrmInputBox},
  uDM in 'uDM.pas' {DM: TDataModule},
  LogInUnit in 'Common\LogInUnit.pas' {LogInForm},
  uSettings in 'uSettings.pas' {Settings},
  uPrgForm in 'Common\uPrgForm.pas' {PrgForm},
  uSplashForm in 'uSplashForm.pas' {SplashForm},
  uMeCrpt in 'Common\uMeCrpt.pas',
  frEForm in 'EForm\frEForm.pas' {fEForm: TFrame},
  uObjProp in 'EForm\uObjProp.pas' {ObjProp},
  frNS in 'EForm\frNS.pas' {fNS: TFrame},
  uEForm in 'EForm\uEForm.pas' {EForm},
  frUnDict in 'EForm\frUnDict.pas' {fUnDict: TFrame},
  uDataList in 'EForm\uDataList.pas' {DataList},
  frFLT in 'EForm\frFLT.pas' {fFlt: TFrame},
  uOneItemSelector in 'Common\uOneItemSelector.pas' {OneItemSelector},
  uArcPropEh in 'Common\uArcPropEh.pas' {ArcPropEh},
  uFileProp in 'EForm\uFileProp.pas' {FileProp},
  uUnSelector in 'EForm\uUnSelector.pas' {UnSelector},
  frCAInfo in 'EForm\frCAInfo.pas' {fCAInfo: TFrame},
  frFiles in 'EForm\frFiles.pas' {fFiles: TFrame},
  tnef in 'MAPI\tnef.pas',
  MapiX in 'MAPI\mapix.pas',
  MAPIUtil in 'MAPI\MAPIUtil.pas',
  MapiTags in 'MAPI\MapiTags.pas',
  MapiGuid in 'MAPI\mapiguid.pas',
  MapiDefs in 'MAPI\mapidefs.pas',
  IMessage in 'MAPI\imessage.pas',
  frFileProp in 'EForm\frFileProp.pas' {fFileProp: TFrame},
  frUsers in 'EForm\frUsers.pas' {fUsers: TFrame},
  frDualList in 'EForm\frDualList.pas' {fDualList: TFrame},
  uUserProp in 'EForm\uUserProp.pas' {UserProp},
  uStr in 'Common\uStr.pas',
  uRep in 'EForm\uRep.pas' {Rep},
  frExtData in 'EForm\frExtData.pas' {fExtData: TFrame},
  uExtDataEditor in 'EForm\uExtDataEditor.pas' {ExtDataEditor},
  uExtDataSort in 'EForm\uExtDataSort.pas' {ExtDataSort},
  uExtData in 'EForm\uExtData.pas' {ExtData},
  uNote in 'EForm\uNote.pas' {xNote},
  uLog in 'EForm\uLog.pas' {Log},
  uCAByEmail in 'EForm\uCAByEmail.pas' {CAByEmail};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ВебАрхив';
  if false then Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  if DM.NeedTerminate then
  begin
    DM.free;
    Application.Terminate;
    Exit;
  end;

  Application.CreateForm(TMainForm, MainForm);
  Application.BringToFront;

  Application.Run;
end.
