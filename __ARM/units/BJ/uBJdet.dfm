object BJdet: TBJdet
  Left = 210
  Top = 107
  Width = 727
  Height = 480
  Caption = 'BJdet'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline fArcLite1: TfArcLite
    Width = 711
    Height = 400
    Align = alClient
    inherited ToolBar1: TToolBar
      Width = 711
    end
    inherited RxDBGrid1: TDBGridEh
      Width = 711
      Height = 284
    end
    inherited ToolBar2: TToolBar
      Width = 711
    end
    inherited Panel3: TPanel
      Width = 711
    end
    inherited StatusBar1: TStatusBar
      Top = 381
      Width = 711
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 400
    Width = 711
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object btnCancel: TButton
      Left = 633
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Закрыть'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCancelClick
    end
  end
  object cdsBJDet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_BJ_Obj'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Acc'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_ContrAgent'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_BJ_Item'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Oper'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DateRep'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_User'
        ParamType = ptInput
      end>
    ProviderName = 'dsBJDet'
    RemoteServer = DM.rsCA
    Left = 72
    Top = 216
    object cdsBJDetid_Oper2: TIntegerField
      FieldName = 'id_Oper2'
    end
    object cdsBJDetS_Pay: TFloatField
      FieldName = 'S_Pay'
    end
    object cdsBJDetS_Off: TFloatField
      FieldName = 'S_Off'
    end
    object cdsBJDetid_Oper: TIntegerField
      FieldName = 'id_Oper'
    end
    object cdsBJDetid_OperParent: TIntegerField
      FieldName = 'id_OperParent'
    end
    object cdsBJDetid_old_Oper: TIntegerField
      FieldName = 'id_old_Oper'
    end
    object cdsBJDetDateCreate: TDateTimeField
      FieldName = 'DateCreate'
      ReadOnly = True
    end
    object cdsBJDetid_LC_Oper: TIntegerField
      FieldName = 'id_LC_Oper'
    end
    object cdsBJDetOperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object cdsBJDetid_Replicator: TIntegerField
      FieldName = 'id_Replicator'
    end
    object cdsBJDetReplicatorShortName: TStringField
      FieldName = 'ReplicatorShortName'
      Size = 5
    end
    object cdsBJDetid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsBJDetid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsBJDetId_CurrencyBsn: TIntegerField
      FieldName = 'Id_CurrencyBsn'
    end
    object cdsBJDetBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsBJDetBusinessNum: TStringField
      FieldName = 'BusinessNum'
      Size = 5
    end
    object cdsBJDetDateLocal: TDateTimeField
      FieldName = 'DateLocal'
    end
    object cdsBJDetCorrect: TBooleanField
      FieldName = 'Correct'
    end
    object cdsBJDetOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsBJDetId_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object cdsBJDetCurrencyOperName: TStringField
      FieldName = 'CurrencyOperName'
      Size = 30
    end
    object cdsBJDetCurrencyOperShortName: TStringField
      FieldName = 'CurrencyOperShortName'
      Size = 10
    end
    object cdsBJDetAmountOper: TFloatField
      FieldName = 'AmountOper'
      ReadOnly = True
    end
    object cdsBJDetAmountOper2: TFloatField
      FieldName = 'AmountOper2'
      ReadOnly = True
    end
    object cdsBJDetPriceOper: TFloatField
      FieldName = 'PriceOper'
      ReadOnly = True
    end
    object cdsBJDetRateOper: TFloatField
      FieldName = 'RateOper'
    end
    object cdsBJDetid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsBJDetMeasureName: TStringField
      FieldName = 'MeasureName'
      ReadOnly = True
      Size = 10
    end
    object cdsBJDetRealKoef: TFloatField
      FieldName = 'RealKoef'
      ReadOnly = True
    end
    object cdsBJDetAmountOperBaseMS: TFloatField
      FieldName = 'AmountOperBaseMS'
      ReadOnly = True
    end
    object cdsBJDetId_CurrencySys: TIntegerField
      FieldName = 'Id_CurrencySys'
    end
    object cdsBJDetCurrencySysName: TStringField
      FieldName = 'CurrencySysName'
      Size = 30
    end
    object cdsBJDetCurrencySysShortName: TStringField
      FieldName = 'CurrencySysShortName'
      Size = 10
    end
    object cdsBJDetSummSys: TFloatField
      FieldName = 'SummSys'
      ReadOnly = True
    end
    object cdsBJDetRateSys: TFloatField
      FieldName = 'RateSys'
    end
    object cdsBJDetid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsBJDetid_Warehouse: TIntegerField
      FieldName = 'id_Warehouse'
    end
    object cdsBJDetid_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object cdsBJDetSrcName: TStringField
      FieldName = 'SrcName'
      ReadOnly = True
      Size = 50
    end
    object cdsBJDetSrcID_Main: TIntegerField
      FieldName = 'SrcID_Main'
      ReadOnly = True
    end
    object cdsBJDetid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsBJDetid_Acc_Ext: TIntegerField
      FieldName = 'id_Acc_Ext'
    end
    object cdsBJDetid_Warehouse_Ext: TIntegerField
      FieldName = 'id_Warehouse_Ext'
    end
    object cdsBJDetid_Manufact_Ext: TIntegerField
      FieldName = 'id_Manufact_Ext'
    end
    object cdsBJDetReprName: TStringField
      FieldName = 'ReprName'
      ReadOnly = True
      Size = 255
    end
    object cdsBJDetReprID_Main: TIntegerField
      FieldName = 'ReprID_Main'
      ReadOnly = True
    end
    object cdsBJDetId_CurrencyInv: TIntegerField
      FieldName = 'Id_CurrencyInv'
    end
    object cdsBJDetPriceInv: TFloatField
      FieldName = 'PriceInv'
    end
    object cdsBJDetRateInv: TFloatField
      FieldName = 'RateInv'
    end
    object cdsBJDetCurrencyInvName: TStringField
      FieldName = 'CurrencyInvName'
      ReadOnly = True
      Size = 30
    end
    object cdsBJDetCurrencyInvShortName: TStringField
      FieldName = 'CurrencyInvShortName'
      ReadOnly = True
      Size = 30
    end
    object cdsBJDetid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsBJDetWareName: TStringField
      FieldName = 'WareName'
      Size = 255
    end
    object cdsBJDetWareID_Main: TIntegerField
      FieldName = 'WareID_Main'
    end
    object cdsBJDetKoeff: TIntegerField
      FieldName = 'Koeff'
    end
    object cdsBJDetKoeffName: TStringField
      FieldName = 'KoeffName'
      ReadOnly = True
      Size = 50
    end
    object cdsBJDetCheckDate: TDateTimeField
      FieldName = 'CheckDate'
      ReadOnly = True
    end
    object cdsBJDetid_UserChecker: TIntegerField
      FieldName = 'id_UserChecker'
      ReadOnly = True
    end
    object cdsBJDetid_FormalDistrib: TIntegerField
      FieldName = 'id_FormalDistrib'
    end
    object cdsBJDetFormalDistribName: TStringField
      FieldName = 'FormalDistribName'
      Size = 50
    end
    object cdsBJDetid_FuncDistrib: TIntegerField
      FieldName = 'id_FuncDistrib'
    end
    object cdsBJDetFuncDistribName: TStringField
      FieldName = 'FuncDistribName'
      Size = 50
    end
    object cdsBJDetDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsBJDetid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
      ReadOnly = True
    end
    object cdsBJDetContrAgentName: TStringField
      FieldName = 'ContrAgentName'
      ReadOnly = True
      Size = 50
    end
    object cdsBJDetid_CAGroup: TIntegerField
      FieldName = 'id_CAGroup'
    end
    object cdsBJDetSummOper: TFloatField
      FieldName = 'SummOper'
      ReadOnly = True
    end
    object cdsBJDetTypeName: TStringField
      FieldName = 'TypeName'
      ReadOnly = True
      Size = 30
    end
    object cdsBJDetOperNum: TStringField
      FieldName = 'OperNum'
      ReadOnly = True
      Size = 255
    end
    object cdsBJDetOperDelta: TFloatField
      FieldName = 'OperDelta'
      ReadOnly = True
    end
    object cdsBJDetOperRateDelta: TFloatField
      FieldName = 'OperRateDelta'
      ReadOnly = True
    end
    object cdsBJDetOperTotalDelta: TFloatField
      FieldName = 'OperTotalDelta'
      ReadOnly = True
    end
    object cdsBJDetDTDiff: TIntegerField
      FieldName = 'DTDiff'
      ReadOnly = True
    end
    object cdsBJDetHasViza: TBooleanField
      FieldName = 'HasViza'
      ReadOnly = True
    end
    object cdsBJDetOperState: TIntegerField
      FieldName = 'OperState'
    end
    object cdsBJDetHidedOper: TBooleanField
      FieldName = 'HidedOper'
    end
    object cdsBJDetOperSummSys: TFloatField
      FieldName = 'OperSummSys'
      ReadOnly = True
    end
    object cdsBJDetRateMain: TFloatField
      FieldName = 'RateMain'
    end
    object cdsBJDetid_Repr_Ex: TIntegerField
      FieldName = 'id_Repr_Ex'
    end
    object cdsBJDetid_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object cdsBJDetImp_PayBasic: TStringField
      FieldName = 'Imp_PayBasic'
      Size = 1000
    end
    object cdsBJDetAccInv_PayAssignment: TStringField
      FieldName = 'AccInv_PayAssignment'
      Size = 1000
    end
    object cdsBJDetContract: TStringField
      FieldName = 'Contract'
      Size = 1000
    end
    object cdsBJDetOperDeltaCrn: TFloatField
      FieldName = 'OperDeltaCrn'
      ReadOnly = True
    end
    object cdsBJDetOperRateDeltaCrn: TFloatField
      FieldName = 'OperRateDeltaCrn'
      ReadOnly = True
    end
    object cdsBJDetOperTotalDeltaCrn: TFloatField
      FieldName = 'OperTotalDeltaCrn'
      ReadOnly = True
    end
    object cdsBJDetOperCrnName: TStringField
      FieldName = 'OperCrnName'
      ReadOnly = True
      Size = 10
    end
    object cdsBJDetOperSum_Offer: TFloatField
      FieldName = 'OperSum_Offer'
      ReadOnly = True
    end
    object cdsBJDetCRN_OLD_OperSum: TFloatField
      FieldName = 'CRN_OLD_OperSum'
      ReadOnly = True
    end
    object cdsBJDetCRN_OLD_OperSum_Offer: TFloatField
      FieldName = 'CRN_OLD_OperSum_Offer'
      ReadOnly = True
    end
    object cdsBJDetCRN_OperSum_Inv: TFloatField
      FieldName = 'CRN_OperSum_Inv'
      ReadOnly = True
    end
    object cdsBJDetOperSumCalced: TFloatField
      FieldName = 'OperSumCalced'
      ReadOnly = True
    end
    object cdsBJDetOperSum_OfferCalced: TFloatField
      FieldName = 'OperSum_OfferCalced'
      ReadOnly = True
    end
    object cdsBJDetBlocked: TBooleanField
      FieldName = 'Blocked'
    end
    object cdsBJDetCurrencyBsnName: TStringField
      FieldName = 'CurrencyBsnName'
      ReadOnly = True
      Size = 10
    end
    object cdsBJDetid_Ctg_Goods_2: TIntegerField
      FieldName = 'id_Ctg_Goods_2'
    end
    object cdsBJDetOpComment: TStringField
      FieldName = 'OpComment'
      Size = 1000
    end
    object cdsBJDetRealDataCreate: TDateTimeField
      FieldName = 'RealDataCreate'
    end
    object cdsBJDetOperTypeSIGN: TIntegerField
      FieldName = 'OperTypeSIGN'
      ReadOnly = True
    end
    object cdsBJDetHasChild: TIntegerField
      FieldName = 'HasChild'
      ReadOnly = True
    end
    object cdsBJDetDig1: TFloatField
      FieldName = 'Dig1'
    end
    object cdsBJDetDig2: TFloatField
      FieldName = 'Dig2'
    end
    object cdsBJDetDig3: TFloatField
      FieldName = 'Dig3'
    end
    object cdsBJDetDig4: TFloatField
      FieldName = 'Dig4'
    end
    object cdsBJDetDig5: TFloatField
      FieldName = 'Dig5'
    end
    object cdsBJDetDig6: TFloatField
      FieldName = 'Dig6'
    end
    object cdsBJDetDig7: TFloatField
      FieldName = 'Dig7'
    end
    object cdsBJDetDig8: TFloatField
      FieldName = 'Dig8'
    end
    object cdsBJDetDig9: TFloatField
      FieldName = 'Dig9'
    end
    object cdsBJDetDig10: TFloatField
      FieldName = 'Dig10'
    end
    object cdsBJDetDig11: TFloatField
      FieldName = 'Dig11'
    end
    object cdsBJDetDig12: TFloatField
      FieldName = 'Dig12'
    end
    object cdsBJDetDig13: TFloatField
      FieldName = 'Dig13'
    end
    object cdsBJDetDig14: TFloatField
      FieldName = 'Dig14'
    end
    object cdsBJDetDig15: TFloatField
      FieldName = 'Dig15'
    end
    object cdsBJDetStr1: TStringField
      FieldName = 'Str1'
      Size = 100
    end
    object cdsBJDetStr2: TStringField
      FieldName = 'Str2'
      Size = 100
    end
    object cdsBJDetStr3: TStringField
      FieldName = 'Str3'
      Size = 100
    end
    object cdsBJDetStr4: TStringField
      FieldName = 'Str4'
      Size = 100
    end
    object cdsBJDetStr5: TStringField
      FieldName = 'Str5'
      Size = 100
    end
    object cdsBJDetStr6: TStringField
      FieldName = 'Str6'
      Size = 100
    end
    object cdsBJDetStr7: TStringField
      FieldName = 'Str7'
      Size = 100
    end
    object cdsBJDetStr8: TStringField
      FieldName = 'Str8'
      Size = 100
    end
    object cdsBJDetStr9: TStringField
      FieldName = 'Str9'
      Size = 100
    end
    object cdsBJDetStr10: TStringField
      FieldName = 'Str10'
      Size = 100
    end
    object cdsBJDetStr11: TStringField
      FieldName = 'Str11'
      Size = 100
    end
    object cdsBJDetStr12: TStringField
      FieldName = 'Str12'
      Size = 100
    end
    object cdsBJDetStr13: TStringField
      FieldName = 'Str13'
      Size = 100
    end
    object cdsBJDetStr14: TStringField
      FieldName = 'Str14'
      Size = 100
    end
    object cdsBJDetStr15: TStringField
      FieldName = 'Str15'
      Size = 100
    end
    object cdsBJDetid_OperWare: TIntegerField
      FieldName = 'id_OperWare'
    end
    object cdsBJDetOperVidName: TStringField
      FieldName = 'OperVidName'
      ReadOnly = True
      Size = 50
    end
    object cdsBJDetCRN_OperSumRez: TFloatField
      FieldName = 'CRN_OperSumRez'
      ReadOnly = True
    end
    object cdsBJDetOnlyDate: TDateTimeField
      FieldName = 'OnlyDate'
      ReadOnly = True
    end
    object cdsBJDetis_Mirr: TBooleanField
      FieldName = 'is_Mirr'
      ReadOnly = True
    end
    object cdsBJDetid_Acc_Group: TIntegerField
      FieldName = 'id_Acc_Group'
      ReadOnly = True
    end
    object cdsBJDetid_Warehouse_Group: TIntegerField
      FieldName = 'id_Warehouse_Group'
      ReadOnly = True
    end
    object cdsBJDetid_Manufact_Group: TIntegerField
      FieldName = 'id_Manufact_Group'
      ReadOnly = True
    end
    object cdsBJDetVatIn: TBooleanField
      FieldName = 'VatIn'
    end
    object cdsBJDetAutoGen: TBooleanField
      FieldName = 'AutoGen'
    end
    object cdsBJDetCreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      ReadOnly = True
      Size = 152
    end
    object cdsBJDetCheckerFIO: TStringField
      FieldName = 'CheckerFIO'
      ReadOnly = True
      Size = 152
    end
  end
  object cdsInvCalc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@OPComment'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@OrdN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Manufact'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@OperTypeIn'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Mode'
        ParamType = ptInput
      end>
    ProviderName = 'dsInvCalc'
    RemoteServer = DM.rsCA
    Left = 232
    Top = 248
  end
  object cdsBJDet2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_BJ_Obj'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Acc'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_ContrAgent'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_BJ_Item'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Oper'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DateRep'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DATE1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DATE2'
        ParamType = ptInput
      end>
    ProviderName = 'dsBJDet2'
    RemoteServer = DM.rsCA
    Left = 128
    Top = 224
  end
end
