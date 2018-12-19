program LC_Manager_V2;

uses
  Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  frWareFinder in '..\units\Catalog\frWareFinder.pas' {fWareFinder: TFrame},
  LogInUnit in '..\units\LogIn\LogInUnit.pas' {LogInForm},
  foMyFunc in '..\common\foMyFunc.pas',
  uInputBox in '..\common\uInputBox.pas' {FrmInputBox},
  frTreeChItem in '..\common\frTreeChItem.pas' {fTreeChItem: TFrame},
  uDM in 'uDM.pas' {DM: TDataModule},
  frLCEntFrame in 'frLCEntFrame.pas' {fLCEntFrame: TFrame},
  uLCEnt in 'uLCEnt.pas' {LCEnt},
  uLCSelectorUn in '..\common\uLCSelectorUn.pas' {LCSelectorUn},
  uCurSelectorForm in '..\units\Cur\uCurSelectorForm.pas' {CurSelectorForm},
  frWareCtgProp in '..\units\Catalog\frWareCtgProp.pas' {fWareCtgProp: TFrame},
  uFormApi_Ware in '..\common\uFormApi_Ware.pas',
  uWareCtgProp in '..\units\Catalog\uWareCtgProp.pas' {WareCtgProp},
  uMeasureSelector in '..\units\Catalog\uMeasureSelector.pas' {MeasureSelector},
  uWareProp in '..\units\Catalog\uWareProp.pas' {WareProp},
  frWareProp in '..\units\Catalog\frWareProp.pas' {fWareProp: TFrame},
  frCurSelector in '..\units\Cur\frCurSelector.pas' {fCurSelector: TFrame},
  uFormApi_Crn in '..\common\uFormApi_Crn.pas',
  frWHList in 'frWHList.pas' {fWHList: TFrame},
  frManufactList in 'frManufactList.pas' {fManufactList: TFrame},
  frReprListLC in 'frReprListLC.pas' {fReprListLC: TFrame},
  frAccList in 'frAccList.pas' {fAccList: TFrame},
  uFormApi_OperLC in '..\common\uFormApi_OperLC.pas',
  frArcLc in '..\units\OperLC\frArcLc.pas' {fArcLc: TFrame},
  uArcLc in '..\units\OperLC\uArcLc.pas' {ArcLc},
  uComment in '..\common\uComment.pas' {Comment},
  uReprProp in '..\units\CntrAgent\uReprProp.pas',
  frReprProp in '..\units\CntrAgent\frReprProp.pas' {fReprProp: TFrame},
  frCAGroupSelect in '..\units\CntrAgent\frCAGroupSelect.pas' {fCAGroupSelect: TFrame},
  uFormApi_CA in '..\common\uFormApi_CA.pas',
  frCaNavigator in '..\units\CntrAgent\frCaNavigator.pas' {fCaNavigator: TFrame},
  frCAGroupList in '..\units\CntrAgent\frCAGroupList.pas' {fCAGroupList: TFrame},
  frCntrAgentList in '..\units\CntrAgent\frCntrAgentList.pas' {fCntrAgentList: TFrame},
  frCntrAgentProp in '..\units\CntrAgent\frCntrAgentProp.pas' {fCntrAgentProp: TFrame},
  frReprList in '..\units\CntrAgent\frReprList.pas' {fReprList: TFrame},
  uCAContact in '..\units\CntrAgent\uCAContact.pas' {CAContact},
  uCAGroupSelect in '..\units\CntrAgent\uCAGroupSelect.pas' {CAGroupSelect},
  uCntrAgentProp in '..\units\CntrAgent\uCntrAgentProp.pas' {CntrAgentProp},
  frCAContact in '..\units\CntrAgent\frCAContact.pas' {fCAContact: TFrame},
  uCASelector in '..\common\uCASelector.pas',
  uLCOperEng in '..\common\uLCOperEng.pas',
  frOperLCEmpty in '..\units\OperLC\frOperLCEmpty.pas' {fOperLCEmpty: TFrame},
  frOperLCFin in '..\units\OperLC\frOperLCFin.pas' {fOperLCFin: TFrame},
  frOperLCOffset in '..\units\OperLC\frOperLCOffset.pas' {fOperLCOffset: TFrame},
  uOperLCEmpty in '..\units\OperLC\uOperLCEmpty.pas' {EmptyOperLC},
  uOperLCFin in '..\units\OperLC\uOperLCFin.pas' {OperFinLC},
  uOperLCOffset in '..\units\OperLC\uOperLCOffset.pas' {OffsetOperLC},
  uOperLCWare in '..\units\OperLC\uOperLCWare.pas' {WareOperLC},
  frOperLCWare in '..\units\OperLC\frOperLCWare.pas' {fOperLCWare: TFrame},
  frWareCtgTree in '..\units\Catalog\frWareCtgTree.pas' {fWareCtgTree: TFrame},
  uWareCtgSelector in '..\units\Catalog\uWareCtgSelector.pas' {WareCtgSelector},
  uWareFinder in '..\units\Catalog\uWareFinder.pas' {WareFinder},
  frWare in '..\units\Catalog\frWare.pas' {fWare: TFrame},
  foMyFuncEh in '..\common\foMyFuncEh.pas',
  foMyFuncEhExcel in '..\common\foMyFuncEhExcel.pas',
  uRelinkView in 'uRelinkView.pas' {RelinkView},
  frRelinkView in 'frRelinkView.pas' {fRelinkView: TFrame},
  foMyFuncDXTreeExcel in '..\common\foMyFuncDXTreeExcel.pas',
  frMov_GoodsLC in 'frMov_GoodsLC.pas' {fMov_GoodsLC: TFrame},
  uMovWHLC in 'uMovWHLC.pas' {MovWH},
  uArcProp in '..\units\Oper\uArcProp.pas' {ArcProp},
  frAccGroup in '..\units\SysObj\frAccGroup.pas' {fAccGroup: TFrame},
  frMNGroup in '..\units\SysObj\frMNGroup.pas' {fMNGroup: TFrame},
  frWHGroup in '..\units\SysObj\frWHGroup.pas' {fWHGroup: TFrame},
  frReprGroup in '..\units\SysObj\frReprGroup.pas' {fReprGroup: TFrame},
  uInputBox_LCObj in '..\common\uInputBox_LCObj.pas' {FrmInputBox_LCObj},
  frReprPropLC in '..\units\CntrAgent\frReprPropLC.pas' {fReprPropLC: TFrame},
  uReprPropLC in '..\units\CntrAgent\uReprPropLC.pas' {ReprPropLC},
  uInputQuery_Grp in '..\common\uInputQuery_Grp.pas' {FrmuInputQuery_Grp},
  uUnGroupSelect in '..\units\CntrAgent\uUnGroupSelect.pas' {UnGroupSelect},
  frBsnSelector in '..\units\Bsn\frBsnSelector.pas' {fBsnSelector: TFrame},
  uBsnSelector in '..\units\Bsn\uBsnSelector.pas' {BsnSelector},
  uOperMesSelector in '..\units\Oper_v2\uOperMesSelector.pas' {OperMesSelector},
  uOperImp_LC in '..\units\DataExport\uOperImp_LC.pas' {OperImp_LC},
  uOperExp_LC in '..\units\DataExport\uOperExp_LC.pas' {OperExp_LC},
  uValListDistinct in '..\common\uValListDistinct.pas' {ValListDistinct},
  uPrgForm in '..\common\uPrgForm.pas' {PrgForm},
  uInputBoxDigit in '..\units\Filter\uInputBoxDigit.pas' {FrmInputBoxDigit},
  uSettings in '..\common\uSettings.pas' {Settings},
  uInputBoxDate in '..\units\Filter\uInputBoxDate.pas' {frmInputBoxDate},
  uInputBoxStr in '..\units\Filter\uInputBoxStr.pas' {FrmInputBoxStr},
  frExtDataValLC in '..\units\OperLC\frExtDataValLC.pas' {fExtDataValLC: TFrame},
  uEgg in '..\common\uEgg.pas' {Egg},
  uMeCrpt in '..\common\uMeCrpt.pas',
  uInvList in '..\units\inv\uInvList.pas' {InvList},
  uInvMain in '..\units\inv\uInvMain.pas' {InvMain},
  uInputQuery_AccGrp in '..\common\uInputQuery_AccGrp.pas' {AccGrp},
  foMyFuncAdvStrGrigExcel in '..\common\foMyFuncAdvStrGrigExcel.pas',
  uInvRepList in '..\units\inv\uInvRepList.pas' {InvRepList};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'LC Manager';
  if false then Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  if DM.NeedTerminate then
  begin                                                                             
    DM.free;
    Application.Terminate;
    Exit;
  end;

  Application.CreateForm(TMainForm, MainForm);
  MainForm.miInvRep.Visible := false;
  Application.Run;
end.
