object fRptFrame: TfRptFrame
  Left = 0
  Top = 0
  Width = 860
  Height = 434
  TabOrder = 0
  object Splitter1: TSplitter
    Left = 0
    Top = 130
    Width = 860
    Height = 5
    Cursor = crVSplit
    Align = alTop
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 34
    Width = 860
    Height = 96
    Align = alTop
    DataSource = dsUser
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleButtons = True
    OnCheckButton = RxDBGrid1CheckButton
    OnGetBtnParams = RxDBGrid1GetBtnParams
    Columns = <
      item
        Expanded = False
        FieldName = 'FIO'
        Title.Caption = 'Сотрудник'
        Width = 345
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cnt'
        Title.Caption = 'Всего операций'
        Width = 105
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 34
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 669
      Top = 4
      Width = 98
      Height = 25
      Caption = 'Перечитать'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000CED6D600FF00FF00CED6D6008484
        8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00009C31009CFFFF00FFFF
        FF009CFFFF00FFFFFF00FF00FF0000000000CED6D600FF00FF00CED6D6008484
        8400FFFFFF009CFFFF00FFFFFF009CFFFF00009C3100009C3100FFFFFF009CFF
        FF00FFFFFF009CFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF009CFFFF00009C3100009C3100009C3100009C3100009C
        31009CFFFF00FFFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF009CFFFF00FFFFFF009CFFFF00009C3100009C3100FFFFFF00639C
        0000636300009CFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00009C31009CFFFF00FFFF
        FF0063630000FFFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF009CFFFF00636300009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
        FF00636300009CFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF0063630000FFFFFF009CFFFF00009C31009CFFFF00FFFF
        FF009CFFFF00FFFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF009CFFFF0063630000639C0000FFFFFF00009C3100009C31009CFF
        FF00FFFFFF009CFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF009CFFFF00009C3100009C3100009C3100009C3100009C
        31009CFFFF00FFFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00009C3100009C31009CFF
        FF00FFFFFF00FF00FF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00009C31009CFFFF00FFFF
        FF0000000000000000000000000000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFF
        FF0084848400FFFFFF0000000000CED6D600CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF00FFFFFF00CED6D600FFFFFF00FFFFFF00FFFFFF00FFFF
        FF008484840000000000FF00FF00CED6D600FF00FF00CED6D600FF00FF008484
        8400848484008484840084848400848484008484840084848400848484008484
        840084848400CED6D600CED6D600FF00FF00CED6D600FF00FF00}
      OnClick = SpeedButton1Click
    end
    inline fBsnSelector1: TfBsnSelector
      Left = 1
      Top = 1
      Width = 350
      Height = 32
      Align = alLeft
      inherited edName: TEdit
        Width = 264
      end
      inherited Button1: TButton
        Left = 319
        OnClick = fBsnSelector1Button1Click
      end
    end
    object Panel1: TPanel
      Left = 351
      Top = 1
      Width = 313
      Height = 32
      Align = alLeft
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 1
      object Label2: TLabel
        Left = 155
        Top = 9
        Width = 41
        Height = 13
        Caption = 'Дата по'
      end
      object Label1: TLabel
        Left = 6
        Top = 9
        Width = 35
        Height = 13
        Caption = 'Дата с'
      end
      object dtFrom: TDateEdit
        Left = 48
        Top = 6
        Width = 96
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object dtTo: TDateEdit
        Left = 203
        Top = 6
        Width = 96
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  inline fArc1: TfArc
    Top = 135
    Width = 860
    Height = 299
    Align = alClient
    TabOrder = 2
    inherited ToolBar1: TToolBar
      Width = 860
    end
    inherited pnDate: TPanel
      Width = 860
      inherited Panel3: TPanel
        Width = 586
      end
    end
    inherited RxDBGrid1: TDBGridEh
      Width = 860
      Height = 181
    end
    inherited ToolBar2: TToolBar
      Width = 860
      inherited EhGridFilter1: TEhGridFilter
        Width = 62
      end
    end
    inherited StatusBar1: TStatusBar
      Top = 280
      Width = 860
    end
  end
  object mtUser: TRxMemoryData
    FieldDefs = <
      item
        Name = 'id_User'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Cnt'
        DataType = ftInteger
      end>
    Left = 132
    Top = 48
  end
  object dsUser: TDataSource
    DataSet = cdsUser
    OnDataChange = dsUserDataChange
    Left = 172
    Top = 48
  end
  object cdsUser: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 264
    Top = 48
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = mtUser
    Constraints = True
    Left = 224
    Top = 48
  end
  object cdsArcOld: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_business'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@HasViza'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DateFrom'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DateTo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_ContrAgent'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_CAGroup'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Repr'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Warehouse'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Acc'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Manufact'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_user'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@Correct'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@Deleted'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@OperVid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Koeff'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@DoUP'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@DoDOWN'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@OperFin'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@OperWare'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@OperService'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@OperOffset'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@OperCrn'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@OperEmpty'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@is_Mirr'
        ParamType = ptInput
      end>
    ProviderName = 'dsArcOld'
    RemoteServer = DM.rsCA
    Left = 328
    Top = 328
    object cdsArcOldid_Oper: TIntegerField
      FieldName = 'id_Oper'
    end
    object cdsArcOldDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object cdsArcOldOperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object cdsArcOldBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsArcOldCorrect: TBooleanField
      FieldName = 'Correct'
    end
    object cdsArcOldOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsArcOldCurrencyOperShortName: TStringField
      FieldName = 'CurrencyOperShortName'
      Size = 10
    end
    object cdsArcOldAmountOper: TFloatField
      FieldName = 'AmountOper'
    end
    object cdsArcOldAmountOper2: TFloatField
      FieldName = 'AmountOper2'
    end
    object cdsArcOldPriceOper: TFloatField
      FieldName = 'PriceOper'
    end
    object cdsArcOldMeasureName: TStringField
      FieldName = 'MeasureName'
      Size = 10
    end
    object cdsArcOldCurrencySysShortName: TStringField
      FieldName = 'CurrencySysShortName'
      Size = 10
    end
    object cdsArcOldSummSys: TFloatField
      FieldName = 'SummSys'
    end
    object cdsArcOldid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsArcOldid_Warehouse: TIntegerField
      FieldName = 'id_Warehouse'
    end
    object cdsArcOldid_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object cdsArcOldSrcName: TStringField
      FieldName = 'SrcName'
      Size = 50
    end
    object cdsArcOldSrcID_Main: TIntegerField
      FieldName = 'SrcID_Main'
    end
    object cdsArcOldid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsArcOldid_Acc_Ext: TIntegerField
      FieldName = 'id_Acc_Ext'
    end
    object cdsArcOldid_Warehouse_Ext: TIntegerField
      FieldName = 'id_Warehouse_Ext'
    end
    object cdsArcOldid_Manufact_Ext: TIntegerField
      FieldName = 'id_Manufact_Ext'
    end
    object cdsArcOldReprName: TStringField
      FieldName = 'ReprName'
      Size = 255
    end
    object cdsArcOldReprID_Main: TIntegerField
      FieldName = 'ReprID_Main'
    end
    object cdsArcOldPriceInv: TFloatField
      FieldName = 'PriceInv'
    end
    object cdsArcOldCurrencyInvShortName: TStringField
      FieldName = 'CurrencyInvShortName'
      Size = 30
    end
    object cdsArcOldid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsArcOldWareName: TStringField
      FieldName = 'WareName'
      Size = 255
    end
    object cdsArcOldWareID_Main: TIntegerField
      FieldName = 'WareID_Main'
    end
    object cdsArcOldKoeff: TIntegerField
      FieldName = 'Koeff'
    end
    object cdsArcOldKoeffName: TStringField
      FieldName = 'KoeffName'
      Size = 50
    end
    object cdsArcOldCheckDate: TDateTimeField
      FieldName = 'CheckDate'
    end
    object cdsArcOldid_UserChecker: TIntegerField
      FieldName = 'id_UserChecker'
    end
    object cdsArcOldFormalDistribName: TStringField
      FieldName = 'FormalDistribName'
      Size = 50
    end
    object cdsArcOldFuncDistribName: TStringField
      FieldName = 'FuncDistribName'
      Size = 50
    end
    object cdsArcOldDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsArcOldid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object cdsArcOldContrAgentName: TStringField
      FieldName = 'ContrAgentName'
      Size = 50
    end
    object cdsArcOldSummOper: TFloatField
      FieldName = 'SummOper'
    end
    object cdsArcOldTypeName: TStringField
      FieldName = 'TypeName'
      Size = 30
    end
    object cdsArcOldOperNum: TStringField
      FieldName = 'OperNum'
      Size = 255
    end
    object cdsArcOldOperDelta: TFloatField
      FieldName = 'OperDelta'
    end
    object cdsArcOldOperRateDelta: TFloatField
      FieldName = 'OperRateDelta'
    end
    object cdsArcOldOperTotalDelta: TFloatField
      FieldName = 'OperTotalDelta'
    end
    object cdsArcOldDTDiff: TIntegerField
      FieldName = 'DTDiff'
    end
    object cdsArcOldHasViza: TBooleanField
      FieldName = 'HasViza'
    end
    object cdsArcOldOperState: TIntegerField
      FieldName = 'OperState'
    end
    object cdsArcOldOperSummSys: TFloatField
      FieldName = 'OperSummSys'
    end
    object cdsArcOldImp_PayBasic: TStringField
      FieldName = 'Imp_PayBasic'
      Size = 1000
    end
    object cdsArcOldAccInv_PayAssignment: TStringField
      FieldName = 'AccInv_PayAssignment'
      Size = 1000
    end
    object cdsArcOldContract: TStringField
      FieldName = 'Contract'
      Size = 1000
    end
    object cdsArcOldOperDeltaCrn: TFloatField
      FieldName = 'OperDeltaCrn'
    end
    object cdsArcOldOperRateDeltaCrn: TFloatField
      FieldName = 'OperRateDeltaCrn'
    end
    object cdsArcOldOperTotalDeltaCrn: TFloatField
      FieldName = 'OperTotalDeltaCrn'
    end
    object cdsArcOldOperCrnName: TStringField
      FieldName = 'OperCrnName'
      Size = 10
    end
    object cdsArcOldOperSum_Offer: TFloatField
      FieldName = 'OperSum_Offer'
    end
    object cdsArcOldCRN_OLD_OperSum: TFloatField
      FieldName = 'CRN_OLD_OperSum'
    end
    object cdsArcOldCRN_OLD_OperSum_Offer: TFloatField
      FieldName = 'CRN_OLD_OperSum_Offer'
    end
    object cdsArcOldCRN_OperSum_Inv: TFloatField
      FieldName = 'CRN_OperSum_Inv'
    end
    object cdsArcOldOperSumCalced: TFloatField
      FieldName = 'OperSumCalced'
    end
    object cdsArcOldOperSum_OfferCalced: TFloatField
      FieldName = 'OperSum_OfferCalced'
    end
    object cdsArcOldBlocked: TBooleanField
      FieldName = 'Blocked'
    end
    object cdsArcOldCurrencyBsnName: TStringField
      FieldName = 'CurrencyBsnName'
      Size = 10
    end
    object cdsArcOldOpComment: TStringField
      FieldName = 'OpComment'
      Size = 1000
    end
    object cdsArcOldRealDataCreate: TDateTimeField
      FieldName = 'RealDataCreate'
    end
    object cdsArcOldDig1: TFloatField
      FieldName = 'Dig1'
    end
    object cdsArcOldDig2: TFloatField
      FieldName = 'Dig2'
    end
    object cdsArcOldDig3: TFloatField
      FieldName = 'Dig3'
    end
    object cdsArcOldDig4: TFloatField
      FieldName = 'Dig4'
    end
    object cdsArcOldDig5: TFloatField
      FieldName = 'Dig5'
    end
    object cdsArcOldDig6: TFloatField
      FieldName = 'Dig6'
    end
    object cdsArcOldDig7: TFloatField
      FieldName = 'Dig7'
    end
    object cdsArcOldDig8: TFloatField
      FieldName = 'Dig8'
    end
    object cdsArcOldDig9: TFloatField
      FieldName = 'Dig9'
    end
    object cdsArcOldDig10: TFloatField
      FieldName = 'Dig10'
    end
    object cdsArcOldDig11: TFloatField
      FieldName = 'Dig11'
    end
    object cdsArcOldDig12: TFloatField
      FieldName = 'Dig12'
    end
    object cdsArcOldDig13: TFloatField
      FieldName = 'Dig13'
    end
    object cdsArcOldDig14: TFloatField
      FieldName = 'Dig14'
    end
    object cdsArcOldDig15: TFloatField
      FieldName = 'Dig15'
    end
    object cdsArcOldStr1: TStringField
      FieldName = 'Str1'
      Size = 100
    end
    object cdsArcOldStr2: TStringField
      FieldName = 'Str2'
      Size = 100
    end
    object cdsArcOldStr3: TStringField
      FieldName = 'Str3'
      Size = 100
    end
    object cdsArcOldStr4: TStringField
      FieldName = 'Str4'
      Size = 100
    end
    object cdsArcOldStr5: TStringField
      FieldName = 'Str5'
      Size = 100
    end
    object cdsArcOldStr6: TStringField
      FieldName = 'Str6'
      Size = 100
    end
    object cdsArcOldStr7: TStringField
      FieldName = 'Str7'
      Size = 100
    end
    object cdsArcOldStr8: TStringField
      FieldName = 'Str8'
      Size = 100
    end
    object cdsArcOldStr9: TStringField
      FieldName = 'Str9'
      Size = 100
    end
    object cdsArcOldStr10: TStringField
      FieldName = 'Str10'
      Size = 100
    end
    object cdsArcOldStr11: TStringField
      FieldName = 'Str11'
      Size = 100
    end
    object cdsArcOldStr12: TStringField
      FieldName = 'Str12'
      Size = 100
    end
    object cdsArcOldStr13: TStringField
      FieldName = 'Str13'
      Size = 100
    end
    object cdsArcOldStr14: TStringField
      FieldName = 'Str14'
      Size = 100
    end
    object cdsArcOldStr15: TStringField
      FieldName = 'Str15'
      Size = 100
    end
    object cdsArcOldOperVidName: TStringField
      FieldName = 'OperVidName'
      Size = 50
    end
    object cdsArcOldCRN_OperSumRez: TFloatField
      FieldName = 'CRN_OperSumRez'
    end
    object cdsArcOldOnlyDate: TDateTimeField
      FieldName = 'OnlyDate'
    end
    object cdsArcOldis_Mirr: TBooleanField
      FieldName = 'is_Mirr'
    end
    object cdsArcOldid_Repr_Ex: TIntegerField
      FieldName = 'id_Repr_Ex'
    end
    object cdsArcOldid_OperParent: TIntegerField
      FieldName = 'id_OperParent'
    end
    object cdsArcOldid_old_Oper: TIntegerField
      FieldName = 'id_old_Oper'
    end
    object cdsArcOldid_LC_Oper: TIntegerField
      FieldName = 'id_LC_Oper'
    end
    object cdsArcOldid_Replicator: TIntegerField
      FieldName = 'id_Replicator'
    end
    object cdsArcOldReplicatorShortName: TStringField
      FieldName = 'ReplicatorShortName'
      Size = 5
    end
    object cdsArcOldid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsArcOldid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsArcOldId_CurrencyBsn: TIntegerField
      FieldName = 'Id_CurrencyBsn'
    end
    object cdsArcOldBusinessNum: TStringField
      FieldName = 'BusinessNum'
      Size = 5
    end
    object cdsArcOldDateLocal: TDateTimeField
      FieldName = 'DateLocal'
    end
    object cdsArcOldId_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object cdsArcOldCurrencyOperName: TStringField
      FieldName = 'CurrencyOperName'
      Size = 30
    end
    object cdsArcOldRateOper: TFloatField
      FieldName = 'RateOper'
    end
    object cdsArcOldid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsArcOldRealKoef: TFloatField
      FieldName = 'RealKoef'
    end
    object cdsArcOldAmountOperBaseMS: TFloatField
      FieldName = 'AmountOperBaseMS'
      ReadOnly = True
    end
    object cdsArcOldId_CurrencySys: TIntegerField
      FieldName = 'Id_CurrencySys'
    end
    object cdsArcOldCurrencySysName: TStringField
      FieldName = 'CurrencySysName'
      Size = 30
    end
    object cdsArcOldRateSys: TFloatField
      FieldName = 'RateSys'
    end
    object cdsArcOldId_CurrencyInv: TIntegerField
      FieldName = 'Id_CurrencyInv'
    end
    object cdsArcOldRateInv: TFloatField
      FieldName = 'RateInv'
    end
    object cdsArcOldCurrencyInvName: TStringField
      FieldName = 'CurrencyInvName'
      ReadOnly = True
      Size = 30
    end
    object cdsArcOldid_FormalDistrib: TIntegerField
      FieldName = 'id_FormalDistrib'
    end
    object cdsArcOldid_FuncDistrib: TIntegerField
      FieldName = 'id_FuncDistrib'
    end
    object cdsArcOldid_CAGroup: TIntegerField
      FieldName = 'id_CAGroup'
    end
    object cdsArcOldHidedOper: TBooleanField
      FieldName = 'HidedOper'
    end
    object cdsArcOldRateMain: TFloatField
      FieldName = 'RateMain'
    end
    object cdsArcOldid_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object cdsArcOldid_Ctg_Goods_2: TIntegerField
      FieldName = 'id_Ctg_Goods_2'
    end
    object cdsArcOldOperTypeSIGN: TIntegerField
      FieldName = 'OperTypeSIGN'
      ReadOnly = True
    end
    object cdsArcOldHasChild: TIntegerField
      FieldName = 'HasChild'
      ReadOnly = True
    end
    object cdsArcOldid_OperWare: TAutoIncField
      FieldName = 'id_OperWare'
      ReadOnly = True
    end
    object cdsArcOldid_Acc_Group: TIntegerField
      FieldName = 'id_Acc_Group'
      ReadOnly = True
    end
    object cdsArcOldid_Warehouse_Group: TIntegerField
      FieldName = 'id_Warehouse_Group'
      ReadOnly = True
    end
    object cdsArcOldid_Manufact_Group: TIntegerField
      FieldName = 'id_Manufact_Group'
      ReadOnly = True
    end
    object cdsArcOldCreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      ReadOnly = True
      Size = 152
    end
    object cdsArcOldCheckerFIO: TStringField
      FieldName = 'CheckerFIO'
      ReadOnly = True
      Size = 152
    end
  end
end
