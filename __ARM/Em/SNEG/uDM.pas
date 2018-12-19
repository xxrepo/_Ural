unit uDM;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  registry, inifiles, Db, DBClient, MConnect, ImgList, SConnect, Menus,
  Provider, RxMemDS, foMyFunc, RxDBComb, ToolEdit, RXLookup, Clipbrd, DBGridEh, AdvCGrid;

const SRegPath = '\SOFTWARE\FO\EMng_SNZ';
      colorNonViza = clWindowText;
       
type                 
  TBsnObj = class (TDBObj);

  TDM = class(TDataModule)
    rsCA: TSocketConnection;
    cdsBusinessData: TClientDataSet;
    cdsBsnByFunc: TClientDataSet;
    cdsBsnByFuncid_business: TIntegerField;
    cdsBsnByFuncName: TStringField;
    cdsLCBuff: TClientDataSet;
    RxMemoryData1: TRxMemoryData;
    DataSetProvider1: TDataSetProvider;
    cdsOPBuff: TClientDataSet;
    rsFlt: TSocketConnection;
    cdsBufImp: TClientDataSet;
    cdsClsdDayList: TClientDataSet;
    cdsClsdDayListName: TStringField;
    cdsOperFin: TClientDataSet;
    cdsOperWare: TClientDataSet;
    cdsOperWareid_OperWare: TAutoIncField;
    cdsOperWareid_Oper: TIntegerField;
    cdsOperWareid_Measure: TIntegerField;
    cdsOperWareid_Goods: TIntegerField;
    cdsOperWareMeasureName: TStringField;
    cdsOperWareRealKoef: TFloatField;
    cdsOperWareAmountOperBaseMS: TFloatField;
    cdsOperWareWareName: TStringField;
    cdsOperWareWareID_Main: TIntegerField;
    cdsOperWareSummOper2: TFloatField;
    cdsOperWareNumb: TIntegerField;
    cdsOperWareAmountOper: TFloatField;
    cdsOperWarePriceOper: TFloatField;
    cdsOperWareSummSys: TFloatField;
    cdsOperWarePriceInv: TFloatField;
    cdsOperWareSS: TAggregateField;
    cdsDList: TClientDataSet;
    cdsOperFinid_Oper: TIntegerField;
    cdsOperFinid_OperParent: TIntegerField;
    cdsOperFinid_old_Oper: TIntegerField;
    cdsOperFinDateCreate: TDateTimeField;
    cdsOperFinid_LC_Oper: TIntegerField;
    cdsOperFinOperVid: TIntegerField;
    cdsOperFinid_UserCreator: TIntegerField;
    cdsOperFinCreatorFIO: TStringField;
    cdsOperFinid_business: TIntegerField;
    cdsOperFinId_CurrencyBsn: TIntegerField;
    cdsOperFinBusinessName: TStringField;
    cdsOperFinBusinessNum: TStringField;
    cdsOperFinDateLocal: TDateTimeField;
    cdsOperFinCorrect: TBooleanField;
    cdsOperFinOperTypeIn: TBooleanField;
    cdsOperFinId_CurrencyOper: TIntegerField;
    cdsOperFinCurrencyOperName: TStringField;
    cdsOperFinCurrencyOperShortName: TStringField;
    cdsOperFinPriceOper: TFloatField;
    cdsOperFinRateOper: TFloatField;
    cdsOperFinId_CurrencySys: TIntegerField;
    cdsOperFinCurrencySysName: TStringField;
    cdsOperFinCurrencySysShortName: TStringField;
    cdsOperFinSummSys: TFloatField;
    cdsOperFinRateSys: TFloatField;
    cdsOperFinid_Acc: TIntegerField;
    cdsOperFinid_Warehouse: TIntegerField;
    cdsOperFinid_Manufact: TIntegerField;
    cdsOperFinSrcName: TStringField;
    cdsOperFinSrcID_Main: TIntegerField;
    cdsOperFinid_Repr: TIntegerField;
    cdsOperFinid_Acc_Ext: TIntegerField;
    cdsOperFinid_Warehouse_Ext: TIntegerField;
    cdsOperFinid_Manufact_Ext: TIntegerField;
    cdsOperFinReprName: TStringField;
    cdsOperFinReprID_Main: TIntegerField;
    cdsOperFinId_CurrencyInv: TIntegerField;
    cdsOperFinRateInv: TFloatField;
    cdsOperFinCurrencyInvName: TStringField;
    cdsOperFinCurrencyInvShortName: TStringField;
    cdsOperFinKoeff: TIntegerField;
    cdsOperFinKoeffName: TStringField;
    cdsOperFinCheckDate: TDateTimeField;
    cdsOperFinCheckerFIO: TStringField;
    cdsOperFinid_FormalDistrib: TIntegerField;
    cdsOperFinFormalDistribName: TStringField;
    cdsOperFinid_FuncDistrib: TIntegerField;
    cdsOperFinFuncDistribName: TStringField;
    cdsOperFinDeleted: TBooleanField;
    cdsOperFinid_ContrAgent: TIntegerField;
    cdsOperFinContrAgentName: TStringField;
    cdsOperFinid_CAGroup: TIntegerField;
    cdsOperFinSummOper: TFloatField;
    cdsOperFinTypeName: TStringField;
    cdsOperFinHasViza: TBooleanField;
    cdsOperFinOperState: TIntegerField;
    cdsOperFinHidedOper: TBooleanField;
    cdsOperFinRateMain: TFloatField;
    cdsOperFinid_Repr_Ex: TIntegerField;
    cdsOperFinid_DocType: TIntegerField;
    cdsOperFinImp_PayBasic: TStringField;
    cdsOperFinAccInv_PayAssignment: TStringField;
    cdsOperFinContract: TStringField;
    cdsOperFinOperCrnName: TStringField;
    cdsOperFinBlocked: TBooleanField;
    cdsOperFinCurrencyBsnName: TStringField;
    cdsOperFinOpComment: TStringField;
    cdsOperFinRealDataCreate: TDateTimeField;
    cdsOperFinOperTypeSIGN: TIntegerField;
    cdsOperFinHasChild: TIntegerField;
    cdsOperFinDig1: TFloatField;
    cdsOperFinDig2: TFloatField;
    cdsOperFinDig3: TFloatField;
    cdsOperFinDig4: TFloatField;
    cdsOperFinDig5: TFloatField;
    cdsOperFinDig6: TFloatField;
    cdsOperFinDig7: TFloatField;
    cdsOperFinDig8: TFloatField;
    cdsOperFinDig9: TFloatField;
    cdsOperFinDig10: TFloatField;
    cdsOperFinDig11: TFloatField;
    cdsOperFinDig12: TFloatField;
    cdsOperFinDig13: TFloatField;
    cdsOperFinDig14: TFloatField;
    cdsOperFinDig15: TFloatField;
    cdsOperFinStr1: TStringField;
    cdsOperFinStr2: TStringField;
    cdsOperFinStr3: TStringField;
    cdsOperFinStr4: TStringField;
    cdsOperFinStr5: TStringField;
    cdsOperFinStr6: TStringField;
    cdsOperFinStr7: TStringField;
    cdsOperFinStr8: TStringField;
    cdsOperFinStr9: TStringField;
    cdsOperFinStr10: TStringField;
    cdsOperFinStr11: TStringField;
    cdsOperFinStr12: TStringField;
    cdsOperFinStr13: TStringField;
    cdsOperFinStr14: TStringField;
    cdsOperFinStr15: TStringField;
    cdsOperFinOperVidName: TStringField;
    cdsOperFinis_Mirr: TBooleanField;
    cdsOperFinid_Acc_Group: TIntegerField;
    cdsOperFinid_Warehouse_Group: TIntegerField;
    cdsOperFinid_Manufact_Group: TIntegerField;
    cdsOperFinOperNum: TStringField;
    cdsOperFinid_Replicator: TIntegerField;
    cdsOPBuffid_Oper: TIntegerField;
    cdsOPBuffid_OperParent: TIntegerField;
    cdsOPBuffid_old_Oper: TIntegerField;
    cdsOPBuffDateCreate: TDateTimeField;
    cdsOPBuffid_LC_Oper: TIntegerField;
    cdsOPBuffOperVid: TIntegerField;
    cdsOPBuffid_Replicator: TIntegerField;
    cdsOPBuffReplicatorShortName: TStringField;
    cdsOPBuffid_UserCreator: TIntegerField;
    cdsOPBuffid_business: TIntegerField;
    cdsOPBuffId_CurrencyBsn: TIntegerField;
    cdsOPBuffBusinessName: TStringField;
    cdsOPBuffBusinessNum: TStringField;
    cdsOPBuffDateLocal: TDateTimeField;
    cdsOPBuffCorrect: TBooleanField;
    cdsOPBuffOperTypeIn: TBooleanField;
    cdsOPBuffId_CurrencyOper: TIntegerField;
    cdsOPBuffCurrencyOperName: TStringField;
    cdsOPBuffCurrencyOperShortName: TStringField;
    cdsOPBuffAmountOper: TFloatField;
    cdsOPBuffAmountOper2: TFloatField;
    cdsOPBuffPriceOper: TFloatField;
    cdsOPBuffRateOper: TFloatField;
    cdsOPBuffid_Measure: TIntegerField;
    cdsOPBuffMeasureName: TStringField;
    cdsOPBuffRealKoef: TFloatField;
    cdsOPBuffAmountOperBaseMS: TFloatField;
    cdsOPBuffId_CurrencySys: TIntegerField;
    cdsOPBuffCurrencySysName: TStringField;
    cdsOPBuffCurrencySysShortName: TStringField;
    cdsOPBuffSummSys: TFloatField;
    cdsOPBuffRateSys: TFloatField;
    cdsOPBuffid_Acc: TIntegerField;
    cdsOPBuffid_Warehouse: TIntegerField;
    cdsOPBuffid_Manufact: TIntegerField;
    cdsOPBuffSrcName: TStringField;
    cdsOPBuffSrcID_Main: TIntegerField;
    cdsOPBuffid_Repr: TIntegerField;
    cdsOPBuffid_Acc_Ext: TIntegerField;
    cdsOPBuffid_Warehouse_Ext: TIntegerField;
    cdsOPBuffid_Manufact_Ext: TIntegerField;
    cdsOPBuffReprName: TStringField;
    cdsOPBuffReprID_Main: TIntegerField;
    cdsOPBuffId_CurrencyInv: TIntegerField;
    cdsOPBuffPriceInv: TFloatField;
    cdsOPBuffRateInv: TFloatField;
    cdsOPBuffCurrencyInvName: TStringField;
    cdsOPBuffCurrencyInvShortName: TStringField;
    cdsOPBuffid_Goods: TIntegerField;
    cdsOPBuffWareName: TStringField;
    cdsOPBuffWareID_Main: TIntegerField;
    cdsOPBuffKoeff: TIntegerField;
    cdsOPBuffKoeffName: TStringField;
    cdsOPBuffCheckDate: TDateTimeField;
    cdsOPBuffid_UserChecker: TIntegerField;
    cdsOPBuffid_FormalDistrib: TIntegerField;
    cdsOPBuffFormalDistribName: TStringField;
    cdsOPBuffid_FuncDistrib: TIntegerField;
    cdsOPBuffFuncDistribName: TStringField;
    cdsOPBuffDeleted: TBooleanField;
    cdsOPBuffid_ContrAgent: TIntegerField;
    cdsOPBuffContrAgentName: TStringField;
    cdsOPBuffid_CAGroup: TIntegerField;
    cdsOPBuffSummOper: TFloatField;
    cdsOPBuffTypeName: TStringField;
    cdsOPBuffOperNum: TStringField;
    cdsOPBuffOperDelta: TFloatField;
    cdsOPBuffOperRateDelta: TFloatField;
    cdsOPBuffOperTotalDelta: TFloatField;
    cdsOPBuffDTDiff: TIntegerField;
    cdsOPBuffHasViza: TBooleanField;
    cdsOPBuffOperState: TIntegerField;
    cdsOPBuffHidedOper: TBooleanField;
    cdsOPBuffOperSummSys: TFloatField;
    cdsOPBuffRateMain: TFloatField;
    cdsOPBuffid_Repr_Ex: TIntegerField;
    cdsOPBuffid_DocType: TIntegerField;
    cdsOPBuffImp_PayBasic: TStringField;
    cdsOPBuffAccInv_PayAssignment: TStringField;
    cdsOPBuffContract: TStringField;
    cdsOPBuffOperDeltaCrn: TFloatField;
    cdsOPBuffOperRateDeltaCrn: TFloatField;
    cdsOPBuffOperTotalDeltaCrn: TFloatField;
    cdsOPBuffOperCrnName: TStringField;
    cdsOPBuffOperSum_Offer: TFloatField;
    cdsOPBuffCRN_OLD_OperSum: TFloatField;
    cdsOPBuffCRN_OLD_OperSum_Offer: TFloatField;
    cdsOPBuffCRN_OperSum_Inv: TFloatField;
    cdsOPBuffOperSumCalced: TFloatField;
    cdsOPBuffOperSum_OfferCalced: TFloatField;
    cdsOPBuffBlocked: TBooleanField;
    cdsOPBuffCurrencyBsnName: TStringField;
    cdsOPBuffid_Ctg_Goods_2: TIntegerField;
    cdsOPBuffOpComment: TStringField;
    cdsOPBuffRealDataCreate: TDateTimeField;
    cdsOPBuffOperTypeSIGN: TIntegerField;
    cdsOPBuffHasChild: TIntegerField;
    cdsOPBuffDig1: TFloatField;
    cdsOPBuffDig2: TFloatField;
    cdsOPBuffDig3: TFloatField;
    cdsOPBuffDig4: TFloatField;
    cdsOPBuffDig5: TFloatField;
    cdsOPBuffDig6: TFloatField;
    cdsOPBuffDig7: TFloatField;
    cdsOPBuffDig8: TFloatField;
    cdsOPBuffDig9: TFloatField;
    cdsOPBuffDig10: TFloatField;
    cdsOPBuffDig11: TFloatField;
    cdsOPBuffDig12: TFloatField;
    cdsOPBuffDig13: TFloatField;
    cdsOPBuffDig14: TFloatField;
    cdsOPBuffDig15: TFloatField;
    cdsOPBuffStr1: TStringField;
    cdsOPBuffStr2: TStringField;
    cdsOPBuffStr3: TStringField;
    cdsOPBuffStr4: TStringField;
    cdsOPBuffStr5: TStringField;
    cdsOPBuffStr6: TStringField;
    cdsOPBuffStr7: TStringField;
    cdsOPBuffStr8: TStringField;
    cdsOPBuffStr9: TStringField;
    cdsOPBuffStr10: TStringField;
    cdsOPBuffStr11: TStringField;
    cdsOPBuffStr12: TStringField;
    cdsOPBuffStr13: TStringField;
    cdsOPBuffStr14: TStringField;
    cdsOPBuffStr15: TStringField;
    cdsOPBuffid_OperWare: TIntegerField;
    cdsOPBuffOperVidName: TStringField;
    cdsOPBuffCRN_OperSumRez: TFloatField;
    cdsOPBuffOnlyDate: TDateTimeField;
    cdsOPBuffis_Mirr: TBooleanField;
    cdsOPBuffid_Acc_Group: TIntegerField;
    cdsOPBuffid_Warehouse_Group: TIntegerField;
    cdsOPBuffid_Manufact_Group: TIntegerField;
    cdsOPBuffCreatorFIO: TStringField;
    cdsOPBuffCheckerFIO: TStringField;
    cdsOPBuffid_BuffItem: TIntegerField;
    cdsOPBuffid_Buff: TIntegerField;
    cdsOPBuffid_Oper2: TIntegerField;
    cdsBufImpid_Oper: TIntegerField;
    cdsBufImpid_OperParent: TIntegerField;
    cdsBufImpid_old_Oper: TIntegerField;
    cdsBufImpDateCreate: TDateTimeField;
    cdsBufImpid_LC_Oper: TIntegerField;
    cdsBufImpOperVid: TIntegerField;
    cdsBufImpid_Replicator: TIntegerField;
    cdsBufImpReplicatorShortName: TStringField;
    cdsBufImpid_UserCreator: TIntegerField;
    cdsBufImpid_business: TIntegerField;
    cdsBufImpId_CurrencyBsn: TIntegerField;
    cdsBufImpBusinessName: TStringField;
    cdsBufImpBusinessNum: TStringField;
    cdsBufImpDateLocal: TDateTimeField;
    cdsBufImpCorrect: TBooleanField;
    cdsBufImpOperTypeIn: TBooleanField;
    cdsBufImpId_CurrencyOper: TIntegerField;
    cdsBufImpCurrencyOperName: TStringField;
    cdsBufImpCurrencyOperShortName: TStringField;
    cdsBufImpAmountOper: TFloatField;
    cdsBufImpAmountOper2: TFloatField;
    cdsBufImpPriceOper: TFloatField;
    cdsBufImpRateOper: TFloatField;
    cdsBufImpid_Measure: TIntegerField;
    cdsBufImpMeasureName: TStringField;
    cdsBufImpRealKoef: TFloatField;
    cdsBufImpAmountOperBaseMS: TFloatField;
    cdsBufImpId_CurrencySys: TIntegerField;
    cdsBufImpCurrencySysName: TStringField;
    cdsBufImpCurrencySysShortName: TStringField;
    cdsBufImpSummSys: TFloatField;
    cdsBufImpRateSys: TFloatField;
    cdsBufImpid_Acc: TIntegerField;
    cdsBufImpid_Warehouse: TIntegerField;
    cdsBufImpid_Manufact: TIntegerField;
    cdsBufImpSrcName: TStringField;
    cdsBufImpSrcID_Main: TIntegerField;
    cdsBufImpid_Repr: TIntegerField;
    cdsBufImpid_Acc_Ext: TIntegerField;
    cdsBufImpid_Warehouse_Ext: TIntegerField;
    cdsBufImpid_Manufact_Ext: TIntegerField;
    cdsBufImpReprName: TStringField;
    cdsBufImpReprID_Main: TIntegerField;
    cdsBufImpId_CurrencyInv: TIntegerField;
    cdsBufImpPriceInv: TFloatField;
    cdsBufImpRateInv: TFloatField;
    cdsBufImpCurrencyInvName: TStringField;
    cdsBufImpCurrencyInvShortName: TStringField;
    cdsBufImpid_Goods: TIntegerField;
    cdsBufImpWareName: TStringField;
    cdsBufImpWareID_Main: TIntegerField;
    cdsBufImpKoeff: TIntegerField;
    cdsBufImpKoeffName: TStringField;
    cdsBufImpCheckDate: TDateTimeField;
    cdsBufImpid_UserChecker: TIntegerField;
    cdsBufImpid_FormalDistrib: TIntegerField;
    cdsBufImpFormalDistribName: TStringField;
    cdsBufImpid_FuncDistrib: TIntegerField;
    cdsBufImpFuncDistribName: TStringField;
    cdsBufImpDeleted: TBooleanField;
    cdsBufImpid_ContrAgent: TIntegerField;
    cdsBufImpContrAgentName: TStringField;
    cdsBufImpid_CAGroup: TIntegerField;
    cdsBufImpSummOper: TFloatField;
    cdsBufImpTypeName: TStringField;
    cdsBufImpOperNum: TStringField;
    cdsBufImpOperDelta: TFloatField;
    cdsBufImpOperRateDelta: TFloatField;
    cdsBufImpOperTotalDelta: TFloatField;
    cdsBufImpDTDiff: TIntegerField;
    cdsBufImpHasViza: TBooleanField;
    cdsBufImpOperState: TIntegerField;
    cdsBufImpHidedOper: TBooleanField;
    cdsBufImpOperSummSys: TFloatField;
    cdsBufImpRateMain: TFloatField;
    cdsBufImpid_Repr_Ex: TIntegerField;
    cdsBufImpid_DocType: TIntegerField;
    cdsBufImpImp_PayBasic: TStringField;
    cdsBufImpAccInv_PayAssignment: TStringField;
    cdsBufImpContract: TStringField;
    cdsBufImpOperDeltaCrn: TFloatField;
    cdsBufImpOperRateDeltaCrn: TFloatField;
    cdsBufImpOperTotalDeltaCrn: TFloatField;
    cdsBufImpOperCrnName: TStringField;
    cdsBufImpOperSum_Offer: TFloatField;
    cdsBufImpCRN_OLD_OperSum: TFloatField;
    cdsBufImpCRN_OLD_OperSum_Offer: TFloatField;
    cdsBufImpCRN_OperSum_Inv: TFloatField;
    cdsBufImpOperSumCalced: TFloatField;
    cdsBufImpOperSum_OfferCalced: TFloatField;
    cdsBufImpBlocked: TBooleanField;
    cdsBufImpCurrencyBsnName: TStringField;
    cdsBufImpid_Ctg_Goods_2: TIntegerField;
    cdsBufImpOpComment: TStringField;
    cdsBufImpRealDataCreate: TDateTimeField;
    cdsBufImpOperTypeSIGN: TIntegerField;
    cdsBufImpHasChild: TIntegerField;
    cdsBufImpDig1: TFloatField;
    cdsBufImpDig2: TFloatField;
    cdsBufImpDig3: TFloatField;
    cdsBufImpDig4: TFloatField;
    cdsBufImpDig5: TFloatField;
    cdsBufImpDig6: TFloatField;
    cdsBufImpDig7: TFloatField;
    cdsBufImpDig8: TFloatField;
    cdsBufImpDig9: TFloatField;
    cdsBufImpDig10: TFloatField;
    cdsBufImpDig11: TFloatField;
    cdsBufImpDig12: TFloatField;
    cdsBufImpDig13: TFloatField;
    cdsBufImpDig14: TFloatField;
    cdsBufImpDig15: TFloatField;
    cdsBufImpStr1: TStringField;
    cdsBufImpStr2: TStringField;
    cdsBufImpStr3: TStringField;
    cdsBufImpStr4: TStringField;
    cdsBufImpStr5: TStringField;
    cdsBufImpStr6: TStringField;
    cdsBufImpStr7: TStringField;
    cdsBufImpStr8: TStringField;
    cdsBufImpStr9: TStringField;
    cdsBufImpStr10: TStringField;
    cdsBufImpStr11: TStringField;
    cdsBufImpStr12: TStringField;
    cdsBufImpStr13: TStringField;
    cdsBufImpStr14: TStringField;
    cdsBufImpStr15: TStringField;
    cdsBufImpid_OperWare: TAutoIncField;
    cdsBufImpOperVidName: TStringField;
    cdsBufImpCRN_OperSumRez: TFloatField;
    cdsBufImpOnlyDate: TDateTimeField;
    cdsBufImpis_Mirr: TBooleanField;
    cdsBufImpid_Acc_Group: TIntegerField;
    cdsBufImpid_Warehouse_Group: TIntegerField;
    cdsBufImpid_Manufact_Group: TIntegerField;
    cdsBufImpCreatorFIO: TStringField;
    cdsBufImpCheckerFIO: TStringField;
    cdsBufImpid_BuffItem: TIntegerField;
    cdsBufImpid_Buff: TIntegerField;
    cdsBufImpid_Oper2: TIntegerField;
    cdsLCBuffid_Oper: TIntegerField;
    cdsLCBuffid_OperParent: TIntegerField;
    cdsLCBuffid_old_Oper: TIntegerField;
    cdsLCBuffDateCreate: TDateTimeField;
    cdsLCBuffid_LC_Oper: TIntegerField;
    cdsLCBuffOperVid: TIntegerField;
    cdsLCBuffid_Replicator: TIntegerField;
    cdsLCBuffReplicatorShortName: TStringField;
    cdsLCBuffid_UserCreator: TIntegerField;
    cdsLCBuffCreatorFIO: TStringField;
    cdsLCBuffid_business: TIntegerField;
    cdsLCBuffId_CurrencyBsn: TIntegerField;
    cdsLCBuffBusinessName: TStringField;
    cdsLCBuffBusinessNum: TStringField;
    cdsLCBuffDateLocal: TDateTimeField;
    cdsLCBuffCorrect: TBooleanField;
    cdsLCBuffOperTypeIn: TBooleanField;
    cdsLCBuffId_CurrencyOper: TIntegerField;
    cdsLCBuffCurrencyOperName: TStringField;
    cdsLCBuffCurrencyOperShortName: TStringField;
    cdsLCBuffAmountOper: TFloatField;
    cdsLCBuffAmountOper2: TFloatField;
    cdsLCBuffPriceOper: TFloatField;
    cdsLCBuffRateOper: TFloatField;
    cdsLCBuffid_Measure: TIntegerField;
    cdsLCBuffMeasureName: TStringField;
    cdsLCBuffRealKoef: TFloatField;
    cdsLCBuffAmountOperBaseMS: TFloatField;
    cdsLCBuffId_CurrencySys: TIntegerField;
    cdsLCBuffCurrencySysName: TStringField;
    cdsLCBuffCurrencySysShortName: TStringField;
    cdsLCBuffSummSys: TFloatField;
    cdsLCBuffRateSys: TFloatField;
    cdsLCBuffid_Acc: TIntegerField;
    cdsLCBuffid_Warehouse: TIntegerField;
    cdsLCBuffid_Manufact: TIntegerField;
    cdsLCBuffSrcName: TStringField;
    cdsLCBuffSrcID_Main: TIntegerField;
    cdsLCBuffid_Repr: TIntegerField;
    cdsLCBuffid_CAWhouse: TIntegerField;
    cdsLCBuffid_Acc_Ext: TIntegerField;
    cdsLCBuffid_Warehouse_Ext: TIntegerField;
    cdsLCBuffid_Manufact_Ext: TIntegerField;
    cdsLCBuffid_Equipment: TIntegerField;
    cdsLCBuffReprName: TStringField;
    cdsLCBuffReprID_Main: TIntegerField;
    cdsLCBuffReprWHName: TStringField;
    cdsLCBuffReprWHID_Main: TIntegerField;
    cdsLCBuffId_CurrencyInv: TIntegerField;
    cdsLCBuffPriceInv: TFloatField;
    cdsLCBuffRateInv: TFloatField;
    cdsLCBuffCurrencyInvName: TStringField;
    cdsLCBuffCurrencyInvShortName: TStringField;
    cdsLCBuffid_Goods: TIntegerField;
    cdsLCBuffWareName: TStringField;
    cdsLCBuffWareID_Main: TIntegerField;
    cdsLCBuffKoeff: TIntegerField;
    cdsLCBuffKoeffName: TStringField;
    cdsLCBuffCheckDate: TDateTimeField;
    cdsLCBuffid_UserChecker: TIntegerField;
    cdsLCBuffCheckerFIO: TStringField;
    cdsLCBuffid_FormalDistrib: TIntegerField;
    cdsLCBuffFormalDistribName: TStringField;
    cdsLCBuffid_FuncDistrib: TIntegerField;
    cdsLCBuffFuncDistribName: TStringField;
    cdsLCBuffDeleted: TBooleanField;
    cdsLCBuffid_ContrAgent: TIntegerField;
    cdsLCBuffContrAgentName: TStringField;
    cdsLCBuffid_CAGroup: TIntegerField;
    cdsLCBuffSummOper: TFloatField;
    cdsLCBuffTypeName: TStringField;
    cdsLCBuffOperNum: TStringField;
    cdsLCBuffOperDelta: TFloatField;
    cdsLCBuffOperRateDelta: TFloatField;
    cdsLCBuffOperTotalDelta: TFloatField;
    cdsLCBuffDTDiff: TIntegerField;
    cdsLCBuffHasViza: TBooleanField;
    cdsLCBuffOperState: TIntegerField;
    cdsLCBuffHidedOper: TBooleanField;
    cdsLCBuffOperSummSys: TFloatField;
    cdsLCBuffRateMain: TFloatField;
    cdsLCBuffid_Repr_Ex: TIntegerField;
    cdsLCBuffid_DocType: TIntegerField;
    cdsLCBuffImp_PayBasic: TStringField;
    cdsLCBuffAccInv_PayAssignment: TStringField;
    cdsLCBuffContract: TStringField;
    cdsLCBuffOperDeltaCrn: TFloatField;
    cdsLCBuffOperRateDeltaCrn: TFloatField;
    cdsLCBuffOperTotalDeltaCrn: TFloatField;
    cdsLCBuffOperCrnName: TStringField;
    cdsLCBuffOperSum_Offer: TFloatField;
    cdsLCBuffOperSum_Inv: TFloatField;
    cdsLCBuffCRN_OLD_OperSum: TFloatField;
    cdsLCBuffCRN_OLD_OperSum_Offer: TFloatField;
    cdsLCBuffCRN_OperSum_Inv: TFloatField;
    cdsLCBuffOperSumCalced: TFloatField;
    cdsLCBuffOperSum_OfferCalced: TFloatField;
    cdsLCBuffBlocked: TBooleanField;
    cdsLCBuffCurrencyBsnName: TStringField;
    cdsLCBuffOperTypeSIGN: TIntegerField;
    cdsLCBuffHasChild: TIntegerField;
    cdsLCBuffDig1: TFloatField;
    cdsLCBuffDig2: TFloatField;
    cdsLCBuffDig3: TFloatField;
    cdsLCBuffDig4: TFloatField;
    cdsLCBuffDig5: TFloatField;
    cdsLCBuffDig6: TFloatField;
    cdsLCBuffDig7: TFloatField;
    cdsLCBuffDig8: TFloatField;
    cdsLCBuffDig9: TFloatField;
    cdsLCBuffDig10: TFloatField;
    cdsLCBuffDig11: TFloatField;
    cdsLCBuffDig12: TFloatField;
    cdsLCBuffDig13: TFloatField;
    cdsLCBuffDig14: TFloatField;
    cdsLCBuffDig15: TFloatField;
    cdsLCBuffStr1: TStringField;
    cdsLCBuffStr2: TStringField;
    cdsLCBuffStr3: TStringField;
    cdsLCBuffStr4: TStringField;
    cdsLCBuffStr5: TStringField;
    cdsLCBuffStr6: TStringField;
    cdsLCBuffStr7: TStringField;
    cdsLCBuffStr8: TStringField;
    cdsLCBuffStr9: TStringField;
    cdsLCBuffStr10: TStringField;
    cdsLCBuffStr11: TStringField;
    cdsLCBuffStr12: TStringField;
    cdsLCBuffStr13: TStringField;
    cdsLCBuffStr14: TStringField;
    cdsLCBuffStr15: TStringField;
    cdsLCBuffOperVidName: TStringField;
    cdsLCBuffis_MIrr: TBooleanField;
    cdsOperFinVatIn: TBooleanField;
    cdsDListid_OrgDet: TAutoIncField;
    cdsDListid_Doc_Org: TIntegerField;
    cdsDListVal: TStringField;
    cdsDListDT: TIntegerField;
    cdsDListDefDet: TBooleanField;
    cdsLCBuffAutoGen: TBooleanField;
    cdsLCBuffVatIn: TBooleanField;
    cdsOperWare201: TClientDataSet;
    cdsOperWare201id_OperWare: TAutoIncField;
    cdsOperWare201id_Oper: TIntegerField;
    cdsOperWare201AmountOper: TFloatField;
    cdsOperWare201id_Measure: TIntegerField;
    cdsOperWare201PriceOper: TFloatField;
    cdsOperWare201SummSys: TFloatField;
    cdsOperWare201PriceInv: TFloatField;
    cdsOperWare201id_Goods: TIntegerField;
    cdsOperWare201MeasureName: TStringField;
    cdsOperWare201RealKoef: TFloatField;
    cdsOperWare201AmountOperBaseMS: TFloatField;
    cdsOperWare201WareName: TStringField;
    cdsOperWare201WareID_Main: TIntegerField;
    cdsOperWare201AmountOperBaseMS_2: TFloatField;
    cdsOperWare201AmountOperBaseMS_1: TFloatField;
    cdsOperWare201id_Raw: TIntegerField;
    cdsOperWare201id_ExtRaw: TIntegerField;
    cdsOperWare201id_Service: TIntegerField;
    cdsOperWare201SummOper_2: TFloatField;
    cdsOperWare201SummSys_2: TFloatField;
    cdsOperWare201PriceInv_2: TFloatField;
    cdsOperWare201DMName: TStringField;
    cdsOperWare201SummOper_1: TFloatField;
    cdsOperWare201SummSys_1: TFloatField;
    cdsOperWare201PriceInv_1: TFloatField;
    cdsOperWare201delta: TFloatField;
    cdsOperWare201SummOper2: TFloatField;
    cdsOperWare201Numb: TIntegerField;
    AggregateField1: TAggregateField;
    cdsCur: TClientDataSet;
    cdsCurId_Currency: TAutoIncField;
    cdsCurName: TStringField;
    cdsCurShortName: TStringField;
    cdsCurISOCode: TStringField;
    cdsCurNumberCode: TStringField;
    cdsCurFastAccess: TBooleanField;
    cdsCurValue: TIntegerField;
    cdsCurRate: TFloatField;
    cdsCurAvForPay: TBooleanField;
    cdsCurBase: TBooleanField;
    cdsCurLastUpdated: TBytesField;
    cdsCurId_URL: TIntegerField;
    cdsAPNGen: TClientDataSet;
    cdsAPNGenNAme: TStringField;
    cdsAPNGenid_APN_AccList: TAutoIncField;
    cdsAPNGenid_APN_Obj: TIntegerField;
    cdsAPNGenid_Acc: TIntegerField;
    cdsAPNGenASumm: TFloatField;
    cdsAPNGenId_Currency: TIntegerField;
    cdsAPNGenAPrc: TFloatField;
    cdsAPNGenAccName: TStringField;
    cdsAPNGenCRNName: TStringField;
    cdsAPNGenDestName: TStringField;
    cdsAPNGenid_Repr: TIntegerField;
    cdsAPNGenOperTypeIn: TBooleanField;
    cdsAPNGenid_business: TIntegerField;
    cdsAPNGenid_AccDest: TIntegerField;
    cdsAPNGenId_Currency2: TIntegerField;
    cdsAPNGenCName2: TStringField;
    cdsAPNGenAPPP: TFloatField;
    cdsAPNGenAR: TFloatField;
    cdsAPNGenARC: TStringField;
    cdsAPNGenOperVid: TIntegerField;
    cdsAPNGenid_Cur: TIntegerField;
    mdCash: TRxMemoryData;
    mdCashType: TStringField;
    mdCashName: TStringField;
    mdCashID: TIntegerField;
    ilMenu: TImageList;
    cdsAccs: TClientDataSet;
    cdsAccsid_Acc: TAutoIncField;
    cdsAccsid_business: TIntegerField;
    cdsAccsName: TStringField;
    cdsAccsBank: TStringField;
    cdsAccsPrsnAccName: TStringField;
    cdsAccsCorrAccName: TStringField;
    cdsAccsINN: TStringField;
    cdsAccsBIK: TStringField;
    cdsAccsDisabled: TBooleanField;
    cdsAccsLastUpdated: TBytesField;
    cdsAccsID_Main: TIntegerField;
    cdsAccsBusinessName: TStringField;
    cdsAccsNeedSend: TBooleanField;
    cdsAccsid_Acc_Group: TIntegerField;
    cdsAccsGroupName: TStringField;
    cdsBJ_ByOper: TClientDataSet;
    cdsBJ_ByOperid_OperRel: TAutoIncField;
    cdsBJ_ByOperid_BJ_Obj: TAutoIncField;
    cdsBJ_ByOperNotUse: TBooleanField;
    cdsBJ_ByOperid_BJ_Item: TIntegerField;
    cdsBJ_ByOperName: TStringField;
    cdsBJ_ByOperBJ_Name: TStringField;
    cdsBJ_ByOperid_Oper: TIntegerField;
    mdBuff: TRxMemoryData;
    mdBuffaText: TStringField;
    mdBuffaFieldName: TStringField;
    cdsGoodsProp: TClientDataSet;
    cdsGoodsPropid_Goods: TAutoIncField;
    cdsGoodsPropid_Ctg_Goods: TIntegerField;
    cdsGoodsPropName: TStringField;
    cdsGoodsPropShortName: TStringField;
    cdsGoodsPropBarCode: TStringField;
    cdsGoodsPropDisabled: TBooleanField;
    cdsGoodsPropLastUpdated: TBytesField;
    cdsGoodsPropid_Measure: TIntegerField;
    cdsGoodsPropMeasureName: TStringField;
    cdsGoodsPropGTD: TStringField;
    cdsGoodsPropCountry: TStringField;
    cdsGoodsPropDocNomCode: TStringField;
    cdsGoodsPropDocPriceCode: TStringField;
    cdsGoodsPropDocArt: TStringField;
    cdsGoodsPropDocNumber: TStringField;
    cdsGoodsPropPrice: TFloatField;
    cdsDBO: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsOperWareCalcFields(DataSet: TDataSet);
    procedure cdsAPNGenCalcFields(DataSet: TDataSet);
  private 
    FIDUser : Variant;
    FPassword : String;
    dbName, FFullFio, SVC_Name, FSA, FSA_Psw : string;
    FNeedTerminate : boolean;
    function rsDoLogin: boolean;
    procedure AddToSelect(CDS: TDataSet);
    procedure AddOperToBuff(CDS: TDataSet; ID_Buff : integer);
    function GetRBLSumm(ASumm, AID: Variant): Variant;
  public
    FDateCreate : TDate;
    FisPPP : boolean;
    DefB, DefB_APN, LastID_Oper : integer;
    Capt : String;
    PIN, ShowComm, FFF201 : boolean;
    FUserName : String;
    FMayRez : boolean;
    FBsnList : TList;
    host, port, SkinFileName  :String;
    procedure CheckExcel;

    function SnglObj_Acc(var ObjName, ObjID, BsnName, id_business: OleVariant): boolean;
    function SnglObj_MN(var ObjName, ObjID, BsnName, id_business: OleVariant): boolean;
    function SnglObj_wh(var ObjName, ObjID, BsnName, id_business: OleVariant): boolean;
    function SnglObj_CA(var ObjName, ObjID, BsnName, id_business: OleVariant): boolean;

    function CheckUserRights(id_Func: Integer; id_Business: OleVariant): boolean;
    procedure Rights_GetUserRights(id_Func: Integer; id_Business: OleVariant; NeedRaise : boolean = true);
    function DD_DayGetProp(id_business: Integer = -1) : Variant;

    procedure AddTextToBuff(AStringField: TStringField);
    function PL_GetDefWarePrice(AID_Ctg: Integer;
    ID_Warehouse: OleVariant; out Price, ID_Cur: OleVariant; out TotalAmount : Double): Integer;

    procedure GetBsnList(AList : TList; AIDUser : integer; AUID : Variant);
    property NeedTerminate : boolean read FNeedTerminate;
    property FullFIO : String read FFullFio;
    property UserName : String read FUserName;
    property IDUser : Variant read FIDUser;

    function GetBusinessName(Id: Variant): string;
    function GetBsnNum(Id: Variant): string;

    procedure UnAddOperToBuff(CDS: TDataSet; ID_Buff: integer);
    procedure UnDelOperFromBuff(CDS: TDataSet);

    function GetClosedDaysList : string;

    procedure EditBookmark(ActiveDocument : Variant; AName, AText : String);
    procedure cdsDocCurGetListOpen(CDS: tclientdataset;
      ALC: TRxDBLookupCombo; id_business, id_Doc: integer;
                            id_DocCur : Variant);

    procedure CDStoSL(id_Doc : integer; CB: TRxDBComboBox; DT, id_Doc_Org : Variant);
    procedure ColumnGetData(ACol: TColumnEh; id_Doc_Org, id_Doc: integer);
    function GetDefOrg(id_business: Integer; var id_Doc_Org, OrgName, INN,
      KPP, Chif, Buh, OKPO, OKPD, Address: OleVariant): boolean;

    function GetID_Oper(AText: String): Variant;

    procedure TrimCDS(AmountField : TField);

    procedure RefrBsnList;

    property XdbName : String read dbName;

    function GetFromBase(AType, AName : String; id_business : integer) : integer;
    procedure InitializeMI(Aid_business: integer; xMI: TMenuItem);
    procedure MiClick(Sender: TObject);

    function GetID_BsnFromArc : integer;
    function GetHandleFromArc: HWnd;
    
    function GetLeftText(AText : String) : String;
    function GetRightText(AText : String) : String;
    function GetLastPos(AText, AChar: String): integer;

    function GetOneAcc(id_Business: integer; var id_Acc : integer; var AccName : String): boolean;
    function IsSimple : boolean;
    function GetWord(N : integer; AText : String) : String;
    procedure CombineCol(Col1 : TGridColumnItem; Col2 : TGridColumnItem);

    function acsINN(Sender: TField) : String;
    function acsKPP(Sender: TField) : String;
    function acsAdr(Sender: TField) : String;
    function GetDocNum(id_Oper, id_business: integer; var xDate: TDateTime;
      var xNum: String): boolean;
  end;

var
  DM: TDM;

  ShowSplash : boolean;
  AReadOneObj : boolean;

  CrnInArc: boolean;
  HideFin, FPrViza, FPredViza: boolean;
  HideWH: boolean;
  HideMnf: boolean;
  HideCA: boolean;
  HideWare: boolean;
  HideAllWares, AutoCalcDocNum: boolean;

  FVatIn, FOpenDay, FAP, FArcOptim, FStayHere, FStayHere_Copy, FUsePrice, FIsSimple, FIsMegaFlt : boolean;
  procedure CheckEmptyControl(Handle : hWnd; AWC: TWinControl);
  procedure HideEObjTypes(var AEObjTypes : TEObjTypes);

  function ffSRegPath : String;
implementation

uses LogInUnit, uSplashForm, uSettings, uMeCrpt, uCurProp, uFormApi_Crn,
  uFormApi_CrnAdm, uArc, uSelDocNum;

{$R *.DFM}

function ffSRegPath : String;
begin
  {result := fRegPath;
  if UpperCase(DM.host) = 'SP' then
    Result := result + 'SP';   }
end;

procedure HideEObjTypes(var AEObjTypes : TEObjTypes);
begin
  if HideFin then
    AEObjTypes := AEObjTypes - [eotFin];
  if HideWH then
    AEObjTypes := AEObjTypes - [eotWH];
  if HideMnf then
    AEObjTypes := AEObjTypes - [eotManuf];
  if HideCA then
    AEObjTypes := AEObjTypes - [eotCA];
  if HideWare then
    AEObjTypes := AEObjTypes - [eotGoods];
end;


function TDM.GetLastPos(AText, AChar: String): integer;
var i : integer;
begin
  Result := -1;
  for i := length(AText) downto 1 do
  begin
    if AText[i] = AChar then
    begin
      Result := i;
      Break;
    end;
  end;

end;
function TDM.GetLeftText(AText: String): String;
var i : integer;
begin
  i := GetLastPos(AText, '(');
  if i = -1 then
  begin
    Result := AText;
  end
  else
  begin
    Result := trim(Copy(Atext, 1, i - 1));
  end;
end;

function TDM.GetRightText(AText: String): String;
var i : integer;
begin
  i := GetLastPos(AText, '(');
  if i = -1 then
  begin
    Result := '';
  end
  else
  begin
    AText := StringReplace(AText, ')', '', []);;
    Result := trim(Copy(Atext, i + 1, 255));

  end;
end;

procedure TDM.ColumnGetData(ACol : TColumnEh; id_Doc_Org, id_Doc: integer);
var B : boolean;
    V : Variant;
begin
  B := ACol.Field.DataSet.Active;
  V := Null;
  with cdsDList do
  begin
    Close;
    Params.ParamByName('@DT').AsInteger := 1;
    Params.ParamByName('@id_Doc_Org').Value := id_Doc_Org;
    Open;
    try
      First;
      ACol.PickList.Clear;
      V := cdsDListVal.AsVariant;
      while not Eof do
      begin
        ACol.PickList.Add(cdsDListVal.AsString);
        if B and (id_Doc = -1) and cdsDListDefDet.AsBoolean then
        begin
          V := cdsDListVal.AsVariant;
        end;
        Next;
      end;
    finally
      Close;
    end;
  end;
  if B and (id_Doc = -1) {and (ACol.Field.AsString = '')} then
  begin
    with ACol.Field.DataSet do
    begin
      First;
      DisableControls;
      while not Eof do
      begin
        Edit;
        if ACol.Field.IsNull then
          ACol.Field.Value := V;
        Post;
        
        Next;
      end;
      First;
      EnableControls;
    end;
  end;
end;

procedure TDM.cdsDocCurGetListOpen(CDS : TClientDataSet; ALC : TRxDBLookupCombo; id_business, id_Doc: integer;
                            id_DocCur : Variant);
begin
  with CDS do
  begin
    Close;
    Params.ParamByName('@id_bsn').Value := id_business;
    Open;
    Locate('id_DocCur', id_DocCur, [loCaseInsensitive, loPartialKey]);
  end;
  with ALC.DataSource.DataSet do
  begin
    if Active and (id_Doc = -1) then
    begin
      Edit;
      FieldByName(ALC.DataField).Value := CDS.fieldByName('id_DocCur').Value;
      Post;
    end;
  end;
end;


procedure TDM.DataModuleCreate(Sender: TObject);
  procedure GetRegVal(AReg: TRegistry; AName: String; ADefVal : boolean; var V : boolean);
  begin
    if AReg.ValueExists(AName) then
      V := AReg.ReadBool(AName)
    else
      V := ADefVal;
  end;
var Reg: TRegistry;
    Buffer : PChar;
    Len : DWORD;
    CmpName : String;
    IniFile : TIniFile;
    S : String;
    SL : TStringList;
begin
  LastID_Oper := -1;
  SkinFileName := '';
  FMayRez := false;
  S := ExtractFilePath(ParamStr(0)) + 'RezKey.acs';
  if  FileExists(S) then
  begin
    SL := TStringList.Create;
    try
      SL.Text := FileToStr(S);
      with SL do
      begin
        FMayRez := Values['Val'] = 'gopapopa26';
      end;
    finally
      SL.Free;
    end;
  end;
  FMayRez := true;

  FBsnList := TList.Create;
 { try
    Len := 256;
    Buffer := AllocMem(Len);
    GetComputerName(Buffer, Len);
    CmpName := StrPas(Buffer);
  finally
    FreeMem(Buffer, Len);
  end;    }
// ****************************************************************************
{$IFNDEF SEINV}
  S := ExpandFileName(ParamStr(0));
  Delete(S, Length(S) - 2, 3);
  S := S + 'ini';
  S := StringReplace(S, '_test', '', [rfReplaceAll, rfIgnoreCase]);
 // S := StringReplace(S, '_SNZ', '', [rfReplaceAll, rfIgnoreCase]);

  if FileExists(S) then
  begin
    IniFile := TIniFile.Create(S);
    with IniFile do
    begin
      if ValueExists('AppServer', 'Capt') then
        Capt := ReadString('AppServer', 'Capt', '');
  if Capt <> '' then
  begin
    Application.Title := Capt;
  end;

      host := ReadString('AppServer', 'HostName', 'OVK');
      port := ReadString('AppServer', 'Port', '211');
      dbName := ReadString('AppServer', 'DBName', '');
      SVC_Name := ReadString('AppServer', 'SVCName', '');
      FSA := ReadString('AppServer', 'SAName', 'SA');
      FSA_Psw := ReadString('AppServer', 'SAP', '');
      PIN :=  ReadBool('AppServer', 'PIN', false);
      ShowComm :=  ReadBool('AppServer', 'ShowComm', false);

      FFF201 :=  ReadBool('AppServer', 'FFF201', true);

      DefB :=  ReadInteger('AppServer', 'DefB', -1);
      DefB_APN :=  ReadInteger('AppServer', 'DefB_APN', -1);
    end;

    IniFile.Free;
  end
  else
  begin
    ChangeStng(true);
    if (host = '') or (port='') then
    begin
      MessageBox(0, 'Не введены параметры сервера. Программа будет закрыта', 'Необходимо ввести параметры сервера', MB_ICONERROR + mb_ok);
      Application.Terminate;
    end;
  end;
{$ENDIF}

{$IFDEF SEINV}
  host := '212.119.47.74';
  port := '211';
  dbName := '';

{$ENDIF}
      {$IFDEF SEOLD}
     //   dbName := '';
       if Capt = '' then
          Capt := 'Старая база Снежинска - только просмотр';
        if host = 'OVK' then
          host := 'Bd';
       {$ENDIF}
// ****************************************************************************
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(SRegPath, false) then
    begin
      if Reg.ValueExists('UserID') then
        FUserName := Reg.ReadString('UserID');

      GetRegVal(Reg, 'ShowSplash', true, ShowSplash);
      GetRegVal(Reg, 'ReadOneObj', true, AReadOneObj);
      AReadOneObj := false;

      GetRegVal(Reg, 'FPredViza', true, FPredViza);
      GetRegVal(Reg, 'FPrViza', true, FPrViza);
      GetRegVal(Reg, 'HideFin', false, HideFin);
      GetRegVal(Reg, 'HideWH', false, HideWH);
      GetRegVal(Reg, 'HideMnf', false, HideMnf);
      GetRegVal(Reg, 'HideCA', false, HideCA);
      GetRegVal(Reg, 'HideWare', false, HideWare);

      GetRegVal(Reg, 'HideAllWares', false, HideAllWares);
      GetRegVal(Reg, 'CrnInArc', false, CrnInArc);
      GetRegVal(Reg, 'FVatIn', true, FVatIn);
      GetRegVal(Reg, 'FOpenDay', true, FOpenDay);
      GetRegVal(Reg, 'FAP', false, FAP);
      GetRegVal(Reg, 'FArcOptim', false, FArcOptim);
      GetRegVal(Reg, 'FStayHere', false, FStayHere);
      GetRegVal(Reg, 'FStayHere_Copy', false, FStayHere_Copy);
      GetRegVal(Reg, 'FUsePrice', false, FUsePrice);
      GetRegVal(Reg, 'FIsSimple', false, FIsSimple);
      GetRegVal(Reg, 'FIsMegaFlt', false, FIsMegaFlt);

      if Reg.ValueExists('SkinFileName') then
        SkinFileName := Reg.ReadString('SkinFileName');
   //   sd1.skinfile := SkinFileName;
//      sd1.active:= POS('Not use skins', DM.sd1.skinfile) = 0;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  FNeedTerminate := true;
  FNeedTerminate := not rsDoLogin;
end;

function TDM.rsDoLogin: boolean;
var LogInForm : TLogInForm;
    Reg: TRegistry;
    N : integer;
    b1, b2, b3 : boolean;
begin
  N := 0;
  Result := false;
  {$IFDEF SEOLD}
    FUserName := 'admin';
    FPassword := '123';
  {$ENDIF}
  {$IFNDEF SEOLD}
  LogInForm := TLogInForm.Create(Self);
  LogInForm.edUserID.Text := FUserName;
  {$ENDIF}
  Screen.Cursor := crSQLWait;
  try
    repeat
  {$IFNDEF SEOLD}
      if LogInForm.ShowModal = mrCancel then
      begin
        rsCA.Close;
        rsFlt.Close;
        Exit;
      end;
  {$ENDIF}

    rsCA.Host := host;
    rsFlt.Host := host;

    rsCA.Port := StrToInt(port);
    rsFlt.port := StrToInt(port);

    if ShowSplash and not Assigned(SplashForm) then
    begin
      ShowSplashForm(10000);
    end;
    
    if not rsCA.Connected then rsCA.Open;
      {$IFNDEF SEINV}
    try
      if not rsFlt.Connected then rsFlt.Open;
    except
    end;
       {$ENDIF}

  {$IFNDEF SEOLD}
      FUserName := LogInForm.UserID;
      FPassword := LogInForm.Password;
  {$ENDIF}
      if dbName <> '' then
      begin
        rsCA.AppServer.LC_SetBaseName(dbName);
      {$IFNDEF SEINV}
        rsFlt.AppServer.LC_SetBaseName(dbName);
       {$ENDIF}

      end;
      if SVC_Name <> '' then
      begin
        try rsCA.AppServer.SetBaseName(SVC_Name, FSA, FSA_Psw); except end;
      {$IFNDEF SEINV}
        try rsFlt.AppServer.SetBaseName(SVC_Name, FSA, FSA_Psw); except end;
       {$ENDIF}
      end;
      if (FUserName = 'admin') and (FPassword = '123') {$IFNDEF SEOLD} and false {$ENDIF} then
      begin
        b1 := false;
        b3 := false;
        try
          rsCA.AppServer.DoLogin(FUserName, FPassword);
        except
        end;
        try
          rsFlt.AppServer.DoLogin(FUserName, FPassword);
        except
        end;
      end
      else
      begin
        try
          b1 := rsCA.AppServer.DoLogin(FUserName, FPassword) <> 1;
        except
        end;
{$IFNDEF SEINV}
        if not b1 then
        begin
          try
            b3 := rsFlt.AppServer.DoLogin(FUserName, FPassword) <> 1;
          except
          end;
        end;
{$ENDIF}
      end;
      if b1 {$IFNDEF SEINV} or b3 {$ENDIF}
      then
      begin

        ShowMessage('Неверное имя или пароль');
        inc(N);
      end
      else
      begin
        if (FUserName = 'admin') and (FPassword = '123') {$IFNDEF SEOLD} and false {$ENDIF} then
        begin
          FFullFio := '';
          FIDUser := 1;
          FisPPP := false;
        end
        else
        begin
          FFullFio := rsCA.AppServer.FIO;
          FIDUser := rsCA.AppServer.id_User;
          try
            FisPPP := rsCA.AppServer.isPPP;
          except
          end;
        end;
        Reg := TRegistry.Create;
        try
          Reg.RootKey := HKEY_CURRENT_USER;
          if Reg.OpenKey(SRegPath, True) then
          begin
            Reg.WriteString('UserID', FUserName);
          end;
          Result := true;
        finally
          Reg.Free;
        end;
        GetBsnList(FBsnList, FIDUser, Null);
      end;
    {  if N = 3 then
      begin
        MessageBox(Application.Handle, 'Вы трижды неверно ввели пароль. Число попыток исчерпано. Обратитесь к админисратору системы', 'В доступе отказано!!!', MB_ICONERROR + MB_OK);
        Break;
      end;    }
    until Result = true;
    KillSplashForm;
  except
    on E : Exception do
    begin
      KillSplashForm;
      Raise Exception.Create('Произошла ошибка при соединении с сервером. ' + #13 + #10 +
                             E.Message + #13 + #10 +
                             'host=' + host + ' dbName=' + dbName +  #13 + #10 +
                             'Программа будет закрыта.');
    end;
  end;
    Screen.Cursor := crDefault;
 //   dsWhoIAm.Close;
  {$IFNDEF SEOLD}
    LogInForm.Free;
{$ENDIF}
end;


procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  try
    while FBsnList.Count > 0 do
    begin
      TObject(FBsnList[FBsnList.Count - 1]).Free;
      FBsnList.Delete(FBsnList.Count - 1);
    end;
    FBsnList.Free;
  except

  end;
end;

procedure TDM.GetBsnList(AList : TList; AIDUser : integer; AUID : Variant);
var Obj : TBsnObj;
begin
  AList.Clear;
  with cdsBsnByFunc do
  begin
    Close;
    try
      Params.ParamByName('@id_User').Value := AIDUser;
      Params.ParamByName('@UID').Value := AUID;
      Open;
      First;
      while not Eof do
      begin
        Obj := TBsnObj.Create;
        Obj.ID := FieldByName('id_business').AsInteger;
        Obj.Name := FieldByName('Name').AsString;
        AList.Add(Obj);
        Next;
      end;
    finally
      Close;
    end;
  end;
end;

function TDM.GetBusinessName(Id:Variant):string;
var
  ID2 : Variant;
  AName: OleVariant;
begin
  Result := '';
  if Id <> Null then
  begin
    ID2 := id;
    if DM.rsCA.AppServer.BsnByID(Id2, AName) = 1 then
      Result := AName;
  end;
end;

function TDM.GetBsnNum(Id:Variant):string;
var
  ID2 : Variant;
  AName: OleVariant;
begin
  Result := '';
  if Id <> Null then
  begin
    ID2 := id;
    if DM.rsCA.AppServer.BsnNumByID(Id2, AName) = 1 then
      Result := AName;
  end;
end;

function TDM.PL_GetDefWarePrice(AID_Ctg: Integer;
  ID_Warehouse: OleVariant; out Price, ID_Cur: OleVariant; out TotalAmount : Double): Integer;
begin
 // if (ID_Warehouse <> Null) then
  begin
    Result := DM.rsCA.AppServer.PL_GetDefPriceGoods(AID_Ctg, ID_Warehouse, Price, ID_Cur, TotalAmount);
    if Price = Null then
      Price := 0;
  end;
end;

procedure TDM.UnAddOperToBuff(CDS : TDataSet; ID_Buff : integer);
begin
  if ID_Buff = -13 then
    AddToSelect(CDS)
  else
    AddOperToBuff(CDS, ID_Buff)
end;

procedure TDM.AddToSelect(CDS : TDataSet);
var i : integer;
    AField : TField;
begin
  with cdsLCBuff do
  begin
    if not Active then
      Open;
    DisableControls;
    try
      if not Locate('id_Oper', CDS.fieldByName('id_Oper').AsInteger, []) then
      begin
        Append;
        for i := 0 to CDS.Fields.Count - 1 do
        begin
          AField := FindField(CDS.Fields[i].FieldName);
          if AField <> nil then
            AField.Value := CDS.Fields[i].Value;
        end;
        Post;
      end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TDM.AddOperToBuff(CDS : TDataSet; ID_Buff : integer);
var i : integer;
    AField : TField;
begin
  with cdsOpBuff do
  begin
    if Params.ParamByName('@id_Buff').Value <> ID_Buff then
    begin
      Close;
      Params.ParamByName('@id_Buff').Value := ID_Buff;
      Open;
    end;
    
    if not Active then
    Open;
    DisableControls;
    try
      if not Locate('id_Oper', CDS.FieldByName('id_Oper').AsInteger, []) then
      begin
        Append;
        for i := 0 to CDS.Fields.Count - 1 do
        begin
          AField := FindField(CDS.Fields[i].FieldName);
          if (AField <> nil) and (not AField.ReadOnly)  then
            AField.Value := CDS.Fields[i].Value;
        end;
        Post;
          if not CDSApplyUpdates(cdsOpBuff, 'id_Buff', ID_Buff) then
            raise Exception.Create('Ошибка при сохранении буфера');
      end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TDM.UnDelOperFromBuff(CDS: TDataSet);
begin
  with CDS do
  begin
    if Active then
    begin
      DisableControls;
      try
        Delete;

        if CDS = cdsOPBuff then
        begin
          if not CDSApplyUpdates(TClientDataSet(CDS), 'id_Buff', TClientDataSet(CDS).Params.ParamByName('@id_Buff').Value) then
            raise Exception.Create('Ошибка при сохранении буфера');
        end;
      finally
        EnableControls;
      end;
    end;
  end;
end;

function TDM.DD_DayGetProp(id_business: Integer) : Variant;
begin
  if id_business = -2 then
    Result := DM.rsCA.AppServer.DD_DayGetProp(id_business)
  else
    result := Date;
end;

function TDM.CheckUserRights(id_Func: Integer; id_Business: OleVariant) : boolean;
begin
  Result := true;
  try
    Result := DM.rsCA.AppServer.Rights_GetUserRights(id_Func, id_Business, FIDUser) >= 1;
  except
    Result := false;
  end;       
end;

procedure TDM.Rights_GetUserRights(id_Func: Integer; id_Business: OleVariant; NeedRaise : boolean);
var NNN, NNN2 : OleVariant;
    AHWnd : HWnd;
    S, S2 : String;
begin
  if not CheckUserRights(id_Func, id_Business) then
  begin
    NNN := rsCA.AppServer.Rights_GetFuncName(id_Func);
    S := GetBusinessName(id_Business);
    if Screen.ActiveForm = nil then
      AHWnd := 0
    else
      AHWnd := Screen.ActiveForm.Handle;
    S2 := 'У вас нет прав на операцию "' + VarToStr(NNN) + '"';
    if S <> '' then
      S2 := S2 + ' в бизнесе ' + S;
    MessageBox(AHWnd, PChar(S2), 'Нет прав!!!', MB_ICONERROR + mb_Ok);
    Abort;
  //  raise Exception.Create('У вас нет прав на операцию "' + VarToStr(NNN) + '"');
  end;
end;

procedure TDM.CheckExcel;
var ExpFlag : boolean;
    S : String;
    IniFile : TIniFile;
begin
  S := Application.ExeName;
  Delete(S, Length(S) - 3, 4);
  S := S + '_exp.ini';
  ExpFlag := true;
  if  FileExists(S) then
  begin
    IniFile := TIniFile.Create(S);
    with IniFile do
    begin
      ExpFlag := ReadBool('AppServer', 'Exp', true);
    end;  
    IniFile.Free;
  end;

  if not ExpFlag then
  begin
    MessageBeep(MB_ICONASTERISK	);
    MessageBox(Application.Handle, 'Экспорт в Excel запрещен, пользуйтесь фильтрами. Если не можете - формулируйте потребности в письменном виде.', 'Функция экспорта отключена', MB_OK + MB_ICONSTOP);
    Abort;
  end;  

end;

function TDM.GetClosedDaysList: string;
begin
  Result := '';
  try
    with cdsClsdDayList do
    begin
      Close;
      try
        Params.ParamByName('@id_User').Value := IDUser;
        Open;
        First;
        while not Eof do
        begin
          if Result <> '' then
            Result := Result + #13 + #10;
          Result := Result + FieldByName('Name').AsString;
          Next;
        end;
      finally
        Close;
      end;
    end;
  except
  end;
end;

function TDM.SnglObj_Acc(var ObjName, ObjID, BsnName,
  id_business: OleVariant): boolean;
var AObjName, AObjID, ABsnName, Aid_business: OleVariant;
begin
  if rsCA.AppServer.SnglObj_Acc(DM.IDUser, AObjName, AObjID, ABsnName, Aid_business) = 1 then
  begin
    ObjName := AObjName;
    ObjID := AObjID;
    BsnName := ABsnName;
    id_business := Aid_business;
    Result := true;
  end
  else
    Result := false;
end;

function TDM.SnglObj_CA(var ObjName, ObjID, BsnName,
  id_business: OleVariant): boolean;
var AObjName, AObjID, ABsnName, Aid_business: OleVariant;
begin
  if rsCA.AppServer.SnglObj_CA(DM.IDUser, AObjName, AObjID, ABsnName, Aid_business) = 1 then
  begin
    ObjName := AObjName;
    ObjID := AObjID;
    BsnName := ABsnName;
    id_business := Aid_business;
    Result := true;
  end
  else
    Result := false;
end;

function TDM.SnglObj_MN(var ObjName, ObjID, BsnName,
  id_business: OleVariant): boolean;
var AObjName, AObjID, ABsnName, Aid_business: OleVariant;
begin
  if rsCA.AppServer.SnglObj_MN(DM.IDUser, AObjName, AObjID, ABsnName, Aid_business) = 1 then
  begin
    ObjName := AObjName;
    ObjID := AObjID;
    BsnName := ABsnName;
    id_business := Aid_business;
    Result := true;
  end
  else
    Result := false;
end;

function TDM.SnglObj_wh(var ObjName, ObjID, BsnName,
  id_business: OleVariant): boolean;
var AObjName, AObjID, ABsnName, Aid_business: OleVariant;
begin
  if rsCA.AppServer.SnglObj_wh(DM.IDUser, AObjName, AObjID, ABsnName, Aid_business) = 1 then
  begin
    ObjName := AObjName;
    ObjID := AObjID;
    BsnName := ABsnName;
    id_business := Aid_business;
    Result := true;
  end
  else
    Result := false;
end;

procedure TDM.CDStoSL(id_Doc : integer; CB: TRxDBComboBox; DT, id_Doc_Org : Variant);
var B : boolean;
    V : Variant;
begin
  V := Null;
  B := CB.DataSource.DataSet.Active;
  with cdsDList do
  begin
    Close;
    Params.ParamByName('@DT').AsInteger := DT;
    Params.ParamByName('@id_Doc_Org').Value := id_Doc_Org;
    Open;
    try
      First;
      CB.items.Clear;
      V := cdsDListVal.AsVariant;
      while not Eof do
      begin
        CB.items.Add(cdsDListVal.AsString);
        if B and (id_Doc = -1) and cdsDListDefDet.AsBoolean then
        begin
          CB.DataSource.DataSet.Edit;
          CB.Field.Value := cdsDListVal.AsVariant;
          CB.DataSource.DataSet.Post;
          B := false;
        end;
        Next;
      end;
    finally
      Close;
    end;
  end;
  if B and (id_Doc = -1) and (CB.itemindex = -1) and (CB.Field.isNull) then
  begin
    CB.DataSource.DataSet.Edit;
    CB.Field.Value := V;
    CB.DataSource.DataSet.Post;
  end;
end;

procedure TDM.EditBookmark(ActiveDocument: Variant; AName, AText: String);
var V : Variant;
begin
  try
    if ActiveDocument.bookmarks.Exists(AName) then
    begin
      V := ActiveDocument.bookmarks.item(AName);
      V.Select;
      V.Application.Selection.text := AText;
    end;
  except

  end;
end;

function TDM.GetDefOrg(id_business: Integer; var id_Doc_Org, OrgName, INN,
  KPP, Chif, Buh, OKPO, OKPD, Address: OleVariant): boolean;
begin
  Result := false;
  Result := rsCA.AppServer.GetDefOrg(id_business, id_Doc_Org, OrgName, INN,
  KPP, Chif, Buh, OKPO, OKPD, Address) = 1;
end;

function TDM.GetRBLSumm(ASumm, AID : Variant): Variant;
var AName, AShortName, RateRBL: Variant;
begin
  Result := Null;
  if AID <> Null then
  begin
    if DM.rsCA.AppServer.CurByID(AID, AName, AShortName, RateRBL) = 1 then
      Result := RateRBL * ASumm;
  end;
end;

procedure CheckEmptyControl(Handle : hWnd; AWC : TWinControl);
var B : boolean;
    S : String;
begin
  if AWC is TCustomDateEdit then
    b := TCustomDateEdit(AWC).Date = 0
  else
  begin
    S := TWinHackControl(AWC).Text;
    B := trim(S) = '';
  end;
  if B then
  begin
    Windows.SetFocus(TWinHackControl(AWC).Handle);
    MessageBox(Handle, 'Введены не все данные. Заполните все неоходимые поля', 'Введены не все данные', MB_OK + MB_ICONERROR);
    Abort;
  end;
end;

procedure TDM.cdsOperWareCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('AmountOper').AsFloat = 0 then
    DataSet.FieldByName('SummOper2').AsFloat := DataSet.FieldByName('PriceOper').AsFloat
  else
    DataSet.FieldByName('SummOper2').AsFloat := DataSet.FieldByName('AmountOper').AsFloat * DataSet.FieldByName('PriceOper').AsFloat;
end;

function TDM.GetID_Oper(AText: String): Variant;
var SL : TStringList;
    i, E, Rez : integer;
    S : String;
begin
  if Trim(AText) = '' then
  begin
    result := Null;
    Exit;
  end;

   // Result := StrToInt(AText);
    Val(VartoStr(AText), Rez, E);
    if E = 0 then
    begin
      Result := Rez;
      exit;
    end
    else
    begin
      Result := -1;
      SL := TStringList.Create;
      try
       SL.Text := Trim(StringReplace(AText, '-', #13 + #10, [rfReplaceAll, rfIgnoreCase]));
       for i := 1 to 3 do
       begin
         if i <= SL.Count then
         begin
           try
             Result := StrToInt(SL[SL.Count - i]);
             Break;
           except

           end;
         end;
         if SL.Count > 0 then
           SL.Delete(SL.Count - 1);
       end;
      finally
        SL.Free;
      end;
    end;

end;

procedure TDM.TrimCDS(AmountField : TField);
begin
  with AmountField.DataSet do
  begin
    Last;
    while not Bof do
    begin
      if AmountField.IsNull or (ABS(AmountField.AsFloat) < 0.005) then
        Delete
      else
        Prior;
    end;
  end;

end;

procedure TDM.cdsAPNGenCalcFields(DataSet: TDataSet);
begin
  if cdsAPNGenAPrc.IsNull then
  begin
    cdsAPNGenAR.AsVariant := cdsAPNGenASumm.AsVariant;
    cdsAPNGenid_Cur.AsVariant := cdsAPNGenId_Currency.AsVariant;
    cdsAPNGenARC.AsVariant := cdsAPNGenCRNName.AsVariant;
  end
  else
  begin
    cdsAPNGenAR.AsVariant := cdsAPNGenAPrc.AsVariant*DM.cdsAPNGenAPPP.AsVariant/100;
    cdsAPNGenid_Cur.AsVariant := cdsAPNGenId_Currency2.AsVariant;
    cdsAPNGenARC.AsVariant := cdsAPNGenCName2.AsVariant; ;
  end;

end;

procedure TDM.RefrBsnList;
begin
  GetBsnList(FBsnList, FIDUser, Null);
end;

function TDM.GetFromBase(AType, AName: String; id_business : integer): integer;
  function LocateInMD : boolean;
  begin
    mdCash.First;
    Result := false;
    while not mdCash.Eof do
    begin
      if (mdCashType.AsString = AType) and (mdCashName.AsString = AName) then
      begin
        Result := true;
        Break;
      end;
      mdCash.Next;
    end;
  end;
var AID : integer;
begin
  Result := -1;
  if not mdCash.Active then
    mdCash.Open;
  if LocateInMD then
  begin
    Result := mdCashID.AsInteger;
  end
  else
  begin
    if LowerCase(AType) = 'mes' then
    begin
      Result := DM.rsCA.AppServer.DCh_MeasureAdd(id_business, AName);
    end
    else
    if LowerCase(AType) = 'wh' then
    begin
      Result := DM.rsCA.AppServer.DCh_WareHouseAdd(id_business, AName);
    end
    else
    if LowerCase(AType) = 'ware' then
    begin
      Result := DM.rsCA.AppServer.UN_Check_Ware(1, -1, AName, -1);
    end;
    if Result > -1 then
    begin
      mdCash.Append;
      mdCashType.AsString := AType;
      mdCashName.AsString := AName;
      mdCashID.AsInteger := Result;
      mdCash.Post;
    end;
  end;
end;

procedure TDM.InitializeMI(Aid_business : integer; xMI : TMenuItem);
var MI : TMenuItem;
    i : integer;
begin
//  xMI.Clear;
 if (xMI.Count > 0) or (not xMI.Visible) then
   Exit;
  xMI.tag := Aid_business;
  with cdsCur do
  begin
    Close;

    Params.ParamByName('@id_Bsn').Value := Aid_business;
    Params.ParamByName('@AvForPay').Value := true;
    Params.ParamByName('@FastAccess').Value := true;
    Open;

    First;
    while not Eof do
    begin
      if not cdsCurBase.AsBoolean then
      begin
        MI := TMenuItem.Create(xMI);
        xMI.Add(MI);

        MI.Caption := 'Скопировать курс ' + cdsCurShortName.AsString + ' (' + cdsCurRate.DisplayText + ' руб)';
        MI.OnClick := MiClick;
        MI.tag := round(10000*cdsCurRate.asfloat);
      end;
      Next;
    end;
        MI := TMenuItem.Create(xMI);
        xMI.Add(MI);

        MI.Caption := '-';
    First;
    while not Eof do
    begin
      if not cdsCurBase.AsBoolean then
      begin
        MI := TMenuItem.Create(xMI);
        xMI.Add(MI);

        MI.Caption := 'Установить курс ' + cdsCurShortName.AsString;
        MI.OnClick := MiClick;
        MI.tag := cdsCurId_Currency.AsInteger;
      end;
      Next;
    end;
  end;
end;

procedure TDM.MiClick(Sender: TObject);
var AID, i: integer;
    S : String;
begin
  if (Sender as TMenuItem).Tag > 10000 then
  begin
    S := (Sender as TMenuItem).Caption;
    S := StringReplace(S, '&', '', []);
    i := POS('(', S);
    S := Copy(S, i + 1, 255);
    S := StringReplace(S, ' руб)', '', []);
    Clipboard.AsText := S;
  end
  else
  if (Sender as TMenuItem).Tag < 10000 then
  begin
    AID := (Sender as TMenuItem).Tag;

    if EditCurrency(AID, (Sender as TMenuItem).Parent.Tag) then
    begin
      (Sender as TMenuItem).Parent.Clear;
    end;

  end;
end;

function TDM.GetID_BsnFromArc: integer;
begin
  if assigned(Arc) then
    Result := Arc.fArc1.id_business
  else
    Result := -1;
end;

function TDM.GetHandleFromArc: HWnd;
begin
  if assigned(Arc) then
    Result := Arc.fArc1.Handle
  else
    Result := 0;

end;

function TDM.GetOneAcc(id_Business: integer; var id_Acc: integer;
  var AccName: String): boolean;
begin
  cdsAccs.Close;
  cdsAccs.Params.ParamByName('@ID_Business').Value := id_Business;
  cdsAccs.Params.ParamByName('@id_Group').Value := Null;
  cdsAccs.Params.ParamByName('@id_User').Value := DM.IDUser;
  cdsAccs.Open;
  Result := cdsAccs.RecordCount = 1;
  if Result then
  begin
    id_Acc := cdsAccsid_Acc.AsInteger;
    AccName := cdsAccsName.AsString;
  end;
  cdsAccs.Close;
end;


procedure TDM.AddTextToBuff(AStringField: TStringField);
  procedure AddDDD;
  begin
        mdBuff.First;
        mdBuff.Insert;
        mdBuffaFieldName.AsString := AStringField.FieldName;
        mdBuffaText.AsString := AStringField.AsString;
        mdBuff.Post;
  end;
begin
  try
  if AStringField.AsString = '' then
    Exit;
  with mdBuff do
  begin
    if not Active then Open;
    First;
    while not Eof do
    begin
      if (mdBuffaFieldName.AsString = AStringField.FieldName) and (mdBuffaText.AsString = AStringField.AsString) then
      begin
        Delete;
        AddDDD;
        Exit;
      end;
      Next;
    end;
  {  Last;
    while not bof do
    begin
      if (mdBuffaFieldName.AsString = AStringField.FieldName) then
      begin
        Delete;
        AddDDD;
        Exit;
      end;
      Prior;
    end;   }
    AddDDD;
  end;

  except

  end;
end;
function TDM.IsSimple: boolean;
begin
  Result := FIsSimple;// POS(UpperCase('Smp'), UpperCase(Application.ExeName)) > 0;

//  Result := true;
end;

function TDM.GetWord(N : integer; AText : String) : String;
var i : integer;
begin
  Result := '';
  if N = 1 then
  begin
    i := POS('(', AText);
    if i > 0 then
      Result := COPY(AText, 0, i - 1)
    else
      Result := AText;
  end
  else
  if N = 2 then
  begin
    i := POS('(', AText);
    if i > 0 then
    begin
      Result := COPY(AText, i + 1, 255);
      Result := GetWord(1, Result);
      Result := trim(StringReplace(Result, ')', '', []));
    end;
  end
  else
  if N = 3 then
  begin
    i := POS('(', AText);
    if i > 0 then
    begin
      Result := COPY(AText, i + 1, 255);
      Result := GetWord(2, Result);
      Result := trim(StringReplace(Result, ')', '', []));
    end;
  end;
end;
 


procedure TDM.CombineCol(Col1, Col2: TGridColumnItem);
begin
  if Col1.width > Col2.width then
    Col2.width := Col1.width
  else
    Col1.width := Col2.width;
end;

function TDM.acsAdr(Sender: TField): String;
begin
  Result := StringReplace(Sender.AsString, '#13', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '#10', '', [rfReplaceAll, rfIgnoreCase]);
end;

function TDM.acsINN(Sender: TField): String;
var X : integer;
begin
// у физических лиц 12 цифр, у юридических лиц 10
  Result := Sender.AsString;
  
  X := length(Sender.AsString);
  if X = 9 then Result := '0' + Result;
  if X = 11 then Result := '0' + Result;
end;

function TDM.acsKPP(Sender: TField): String;
var X : integer;
begin
   // КПП состоит из девяти цифр
  Result := Sender.AsString;
  X := length(Sender.AsString);
  if X = 8 then Result := '0' + Result;

end;

function TDM.GetDocNum(id_Oper, id_business: integer; var xDate: TDateTime; var xNum: String) : boolean;
var D1 : TDateTime;
    xN : String;
    isUn : boolean;
    F : TSelDocNum;
begin
  xDate := 0;
  xNum := '';
  result := false;
  if not AutoCalcDocNum then exit;
  with cdsDBO do
  begin
    Close;
    Params.ParamByName('@id_oper').Value := id_Oper;
    Params.ParamByName('@id_business').Value := Null;

    Params.ParamByName('@DateFrom').Value := Null;
    Params.ParamByName('@DateTo').Value := Null;
    Params.ParamByName('@Doc_Account').Value := true;
    Params.ParamByName('@Doc_ActCL').Value := true;
    Params.ParamByName('@Doc_AF').Value := true;
    Params.ParamByName('@Doc_FinalAct').Value := true;
    Params.ParamByName('@Doc_Invoice').Value := true;
    Params.ParamByName('@Doc_Pay_In').Value := true;
    Params.ParamByName('@Doc_Warrant').Value := true;
    Params.ParamByName('@Doc_WBill').Value := true;
    Params.ParamByName('@Doc_WHOrd').Value := true;

    Open;
    if IsEmpty then Exit;
    First;
    D1 := cdsDBO.FieldByName('Doc_Date').AsDateTime;
    xN := cdsDBO.FieldByName('Doc_Num').AsString;
    isUn := true;
    while not Eof do
    begin
      if (D1 <> cdsDBO.FieldByName('Doc_Date').AsDateTime) or (xN <> cdsDBO.FieldByName('Doc_Num').AsString) then
      begin
        isUn := false;
        Break;
      end;
      Next;
    end;
  end;
  if isUn then
  begin
    xDate := D1;
    xNum := xN;
    result := true;
    Exit;
  end
  else
  begin
    F := TSelDocNum.Create(nil);
    try
      F.ShowModal;
      if F.ModalResult = mrOk then
      begin
        xDate := cdsDBO.FieldByName('Doc_Date').AsDateTime;
        xNum := cdsDBO.FieldByName('Doc_Num').AsString;
        result := true;
      end;
    finally
      F.Free;
    end;
  end;
end;

end.
