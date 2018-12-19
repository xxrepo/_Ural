object BlnDetail_3: TBlnDetail_3
  Left = 173
  Top = 190
  Width = 837
  Height = 540
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Детализация баланса'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 472
    Width = 829
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 743
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
  object Panel3: TPanel
    Left = 0
    Top = 97
    Width = 829
    Height = 31
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Итого:'
    end
    object edSum: TEdit
      Left = 54
      Top = 5
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = ' '
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 829
    Height = 97
    Align = alTop
    Caption = ' '
    TabOrder = 2
    object Button1: TButton
      Left = 328
      Top = 14
      Width = 131
      Height = 33
      Caption = 'Перечитать'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 310
      Height = 95
      Align = alLeft
      Caption = ' '
      TabOrder = 1
      inline fBsnSelector1: TfBsnSelector
        Left = 1
        Top = 1
        Width = 308
        Height = 33
        Align = alTop
        inherited edName: TEdit
          Width = 222
        end
        inherited Button1: TButton
          Left = 277
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 34
        Width = 308
        Height = 60
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
        object Label2: TLabel
          Left = 8
          Top = 35
          Width = 26
          Height = 13
          Caption = 'Дата'
        end
        object Label3: TLabel
          Left = 168
          Top = 35
          Width = 33
          Height = 13
          Caption = 'Время'
        end
        object Label4: TLabel
          Left = 168
          Top = 6
          Width = 33
          Height = 13
          Caption = 'Время'
        end
        object Label5: TLabel
          Left = 8
          Top = 5
          Width = 35
          Height = 13
          Caption = 'Дата c'
        end
        object dtTo: TDateTimePicker
          Left = 56
          Top = 31
          Width = 105
          Height = 21
          CalAlignment = dtaLeft
          Date = 37604.576338125
          Time = 37604.576338125
          ShowCheckbox = True
          Checked = False
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 2
          OnChange = dtToChange
        end
        object dtTimeTo: TDateTimePicker
          Left = 203
          Top = 31
          Width = 105
          Height = 21
          CalAlignment = dtaLeft
          Date = 37604.576338125
          Time = 37604.576338125
          ShowCheckbox = True
          Checked = False
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkTime
          ParseInput = False
          TabOrder = 3
        end
        object dtDFrom: TDateTimePicker
          Left = 56
          Top = 2
          Width = 105
          Height = 21
          CalAlignment = dtaLeft
          Date = 37604.576338125
          Time = 37604.576338125
          ShowCheckbox = True
          Checked = False
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
          OnChange = dtDFromChange
        end
        object dtTFrom: TDateTimePicker
          Left = 203
          Top = 2
          Width = 105
          Height = 21
          CalAlignment = dtaLeft
          Date = 37604.576338125
          Time = 37604.576338125
          ShowCheckbox = True
          Checked = False
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkTime
          ParseInput = False
          TabOrder = 1
        end
      end
    end
  end
  inline fArcLite1: TfArcLite
    Top = 128
    Width = 829
    Height = 344
    Align = alClient
    TabOrder = 3
    inherited ToolBar1: TToolBar
      Width = 829
    end
    inherited RxDBGrid1: TDBGridEh
      Width = 829
      Height = 228
    end
    inherited ToolBar2: TToolBar
      Width = 829
    end
    inherited Panel3: TPanel
      Width = 829
    end
    inherited StatusBar1: TStatusBar
      Top = 325
      Width = 829
    end
    inherited cdsArcLite: TClientDataSet
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
          DataType = ftDateTime
          Name = '@Date'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isRawZ'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isNotRawZ'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isCRN'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isUp'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isDown'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isInFromManuf'
          ParamType = ptInput
        end
        item
          DataType = ftInteger
          Name = '@id_Manufact'
          ParamType = ptInput
        end>
      ProviderName = 'dsBlnDet2'
    end
  end
  object cdsArcLite_v2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_business'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Date'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DateFrom'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@OrdNum'
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
        Name = '@id_WareHouse'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_CA'
        ParamType = ptInput
      end>
    ProviderName = 'dsBalDet'
    RemoteServer = DM.rsCA
    Left = 392
    Top = 296
    object cdsArcLite_v2WorkSum: TFloatField
      FieldName = 'WorkSum'
    end
    object cdsArcLite_v2id_Oper: TAutoIncField
      FieldName = 'id_Oper'
      ReadOnly = True
    end
    object cdsArcLite_v2id_OperParent: TIntegerField
      FieldName = 'id_OperParent'
    end
    object cdsArcLite_v2id_old_Oper: TIntegerField
      FieldName = 'id_old_Oper'
    end
    object cdsArcLite_v2DateCreate: TDateTimeField
      FieldName = 'DateCreate'
      ReadOnly = True
    end
    object cdsArcLite_v2id_LC_Oper: TIntegerField
      FieldName = 'id_LC_Oper'
    end
    object cdsArcLite_v2OperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object cdsArcLite_v2id_Replicator: TIntegerField
      FieldName = 'id_Replicator'
    end
    object cdsArcLite_v2ReplicatorShortName: TStringField
      FieldName = 'ReplicatorShortName'
      Size = 5
    end
    object cdsArcLite_v2id_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsArcLite_v2id_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsArcLite_v2Id_CurrencyBsn: TIntegerField
      FieldName = 'Id_CurrencyBsn'
    end
    object cdsArcLite_v2BusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsArcLite_v2BusinessNum: TStringField
      FieldName = 'BusinessNum'
      Size = 5
    end
    object cdsArcLite_v2DateLocal: TDateTimeField
      FieldName = 'DateLocal'
    end
    object cdsArcLite_v2Correct: TBooleanField
      FieldName = 'Correct'
    end
    object cdsArcLite_v2OperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsArcLite_v2Id_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object cdsArcLite_v2CurrencyOperName: TStringField
      FieldName = 'CurrencyOperName'
      Size = 30
    end
    object cdsArcLite_v2CurrencyOperShortName: TStringField
      FieldName = 'CurrencyOperShortName'
      Size = 10
    end
    object cdsArcLite_v2AmountOper: TFloatField
      FieldName = 'AmountOper'
      ReadOnly = True
    end
    object cdsArcLite_v2AmountOper2: TFloatField
      FieldName = 'AmountOper2'
      ReadOnly = True
    end
    object cdsArcLite_v2PriceOper: TFloatField
      FieldName = 'PriceOper'
      ReadOnly = True
    end
    object cdsArcLite_v2RateOper: TFloatField
      FieldName = 'RateOper'
    end
    object cdsArcLite_v2id_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsArcLite_v2MeasureName: TStringField
      FieldName = 'MeasureName'
      ReadOnly = True
      Size = 10
    end
    object cdsArcLite_v2RealKoef: TFloatField
      FieldName = 'RealKoef'
      ReadOnly = True
    end
    object cdsArcLite_v2AmountOperBaseMS: TFloatField
      FieldName = 'AmountOperBaseMS'
      ReadOnly = True
    end
    object cdsArcLite_v2Id_CurrencySys: TIntegerField
      FieldName = 'Id_CurrencySys'
    end
    object cdsArcLite_v2CurrencySysName: TStringField
      FieldName = 'CurrencySysName'
      Size = 30
    end
    object cdsArcLite_v2CurrencySysShortName: TStringField
      FieldName = 'CurrencySysShortName'
      Size = 10
    end
    object cdsArcLite_v2SummSys: TFloatField
      FieldName = 'SummSys'
      ReadOnly = True
    end
    object cdsArcLite_v2RateSys: TFloatField
      FieldName = 'RateSys'
    end
    object cdsArcLite_v2id_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsArcLite_v2id_Warehouse: TIntegerField
      FieldName = 'id_Warehouse'
    end
    object cdsArcLite_v2id_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object cdsArcLite_v2SrcName: TStringField
      FieldName = 'SrcName'
      ReadOnly = True
      Size = 50
    end
    object cdsArcLite_v2SrcID_Main: TIntegerField
      FieldName = 'SrcID_Main'
      ReadOnly = True
    end
    object cdsArcLite_v2id_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsArcLite_v2id_Acc_Ext: TIntegerField
      FieldName = 'id_Acc_Ext'
    end
    object cdsArcLite_v2id_Warehouse_Ext: TIntegerField
      FieldName = 'id_Warehouse_Ext'
    end
    object cdsArcLite_v2id_Manufact_Ext: TIntegerField
      FieldName = 'id_Manufact_Ext'
    end
    object cdsArcLite_v2ReprName: TStringField
      FieldName = 'ReprName'
      ReadOnly = True
      Size = 255
    end
    object cdsArcLite_v2ReprID_Main: TIntegerField
      FieldName = 'ReprID_Main'
      ReadOnly = True
    end
    object cdsArcLite_v2Id_CurrencyInv: TIntegerField
      FieldName = 'Id_CurrencyInv'
    end
    object cdsArcLite_v2PriceInv: TFloatField
      FieldName = 'PriceInv'
    end
    object cdsArcLite_v2RateInv: TFloatField
      FieldName = 'RateInv'
    end
    object cdsArcLite_v2CurrencyInvName: TStringField
      FieldName = 'CurrencyInvName'
      ReadOnly = True
      Size = 30
    end
    object cdsArcLite_v2CurrencyInvShortName: TStringField
      FieldName = 'CurrencyInvShortName'
      ReadOnly = True
      Size = 30
    end
    object cdsArcLite_v2id_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsArcLite_v2WareName: TStringField
      FieldName = 'WareName'
      Size = 255
    end
    object cdsArcLite_v2WareID_Main: TIntegerField
      FieldName = 'WareID_Main'
    end
    object cdsArcLite_v2Koeff: TIntegerField
      FieldName = 'Koeff'
    end
    object cdsArcLite_v2KoeffName: TStringField
      FieldName = 'KoeffName'
      ReadOnly = True
      Size = 50
    end
    object cdsArcLite_v2CheckDate: TDateTimeField
      FieldName = 'CheckDate'
      ReadOnly = True
    end
    object cdsArcLite_v2id_UserChecker: TIntegerField
      FieldName = 'id_UserChecker'
      ReadOnly = True
    end
    object cdsArcLite_v2id_FormalDistrib: TIntegerField
      FieldName = 'id_FormalDistrib'
    end
    object cdsArcLite_v2FormalDistribName: TStringField
      FieldName = 'FormalDistribName'
      Size = 50
    end
    object cdsArcLite_v2id_FuncDistrib: TIntegerField
      FieldName = 'id_FuncDistrib'
    end
    object cdsArcLite_v2FuncDistribName: TStringField
      FieldName = 'FuncDistribName'
      Size = 50
    end
    object cdsArcLite_v2Deleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsArcLite_v2id_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
      ReadOnly = True
    end
    object cdsArcLite_v2ContrAgentName: TStringField
      FieldName = 'ContrAgentName'
      ReadOnly = True
      Size = 50
    end
    object cdsArcLite_v2id_CAGroup: TIntegerField
      FieldName = 'id_CAGroup'
    end
    object cdsArcLite_v2SummOper: TFloatField
      FieldName = 'SummOper'
      ReadOnly = True
    end
    object cdsArcLite_v2TypeName: TStringField
      FieldName = 'TypeName'
      ReadOnly = True
      Size = 30
    end
    object cdsArcLite_v2OperNum: TStringField
      FieldName = 'OperNum'
      ReadOnly = True
      Size = 255
    end
    object cdsArcLite_v2OperDelta: TFloatField
      FieldName = 'OperDelta'
      ReadOnly = True
    end
    object cdsArcLite_v2OperRateDelta: TFloatField
      FieldName = 'OperRateDelta'
      ReadOnly = True
    end
    object cdsArcLite_v2OperTotalDelta: TFloatField
      FieldName = 'OperTotalDelta'
      ReadOnly = True
    end
    object cdsArcLite_v2DTDiff: TIntegerField
      FieldName = 'DTDiff'
      ReadOnly = True
    end
    object cdsArcLite_v2HasViza: TBooleanField
      FieldName = 'HasViza'
      ReadOnly = True
    end
    object cdsArcLite_v2OperState: TIntegerField
      FieldName = 'OperState'
    end
    object cdsArcLite_v2HidedOper: TBooleanField
      FieldName = 'HidedOper'
    end
    object cdsArcLite_v2OperSummSys: TFloatField
      FieldName = 'OperSummSys'
      ReadOnly = True
    end
    object cdsArcLite_v2RateMain: TFloatField
      FieldName = 'RateMain'
    end
    object cdsArcLite_v2id_Repr_Ex: TIntegerField
      FieldName = 'id_Repr_Ex'
    end
    object cdsArcLite_v2id_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object cdsArcLite_v2Imp_PayBasic: TStringField
      FieldName = 'Imp_PayBasic'
      Size = 1000
    end
    object cdsArcLite_v2AccInv_PayAssignment: TStringField
      FieldName = 'AccInv_PayAssignment'
      Size = 1000
    end
    object cdsArcLite_v2Contract: TStringField
      FieldName = 'Contract'
      Size = 1000
    end
    object cdsArcLite_v2OperDeltaCrn: TFloatField
      FieldName = 'OperDeltaCrn'
      ReadOnly = True
    end
    object cdsArcLite_v2OperRateDeltaCrn: TFloatField
      FieldName = 'OperRateDeltaCrn'
      ReadOnly = True
    end
    object cdsArcLite_v2OperTotalDeltaCrn: TFloatField
      FieldName = 'OperTotalDeltaCrn'
      ReadOnly = True
    end
    object cdsArcLite_v2OperCrnName: TStringField
      FieldName = 'OperCrnName'
      ReadOnly = True
      Size = 10
    end
    object cdsArcLite_v2OperSum_Offer: TFloatField
      FieldName = 'OperSum_Offer'
      ReadOnly = True
    end
    object cdsArcLite_v2CRN_OLD_OperSum: TFloatField
      FieldName = 'CRN_OLD_OperSum'
      ReadOnly = True
    end
    object cdsArcLite_v2CRN_OLD_OperSum_Offer: TFloatField
      FieldName = 'CRN_OLD_OperSum_Offer'
      ReadOnly = True
    end
    object cdsArcLite_v2CRN_OperSum_Inv: TFloatField
      FieldName = 'CRN_OperSum_Inv'
      ReadOnly = True
    end
    object cdsArcLite_v2OperSumCalced: TFloatField
      FieldName = 'OperSumCalced'
      ReadOnly = True
    end
    object cdsArcLite_v2OperSum_OfferCalced: TFloatField
      FieldName = 'OperSum_OfferCalced'
      ReadOnly = True
    end
    object cdsArcLite_v2Blocked: TBooleanField
      FieldName = 'Blocked'
    end
    object cdsArcLite_v2CurrencyBsnName: TStringField
      FieldName = 'CurrencyBsnName'
      ReadOnly = True
      Size = 10
    end
    object cdsArcLite_v2id_Ctg_Goods_2: TIntegerField
      FieldName = 'id_Ctg_Goods_2'
    end
    object cdsArcLite_v2OpComment: TStringField
      FieldName = 'OpComment'
      Size = 1000
    end
    object cdsArcLite_v2RealDataCreate: TDateTimeField
      FieldName = 'RealDataCreate'
    end
    object cdsArcLite_v2OperTypeSIGN: TIntegerField
      FieldName = 'OperTypeSIGN'
      ReadOnly = True
    end
    object cdsArcLite_v2HasChild: TIntegerField
      FieldName = 'HasChild'
      ReadOnly = True
    end
    object cdsArcLite_v2Dig1: TFloatField
      FieldName = 'Dig1'
    end
    object cdsArcLite_v2Dig2: TFloatField
      FieldName = 'Dig2'
    end
    object cdsArcLite_v2Dig3: TFloatField
      FieldName = 'Dig3'
    end
    object cdsArcLite_v2Dig4: TFloatField
      FieldName = 'Dig4'
    end
    object cdsArcLite_v2Dig5: TFloatField
      FieldName = 'Dig5'
    end
    object cdsArcLite_v2Dig6: TFloatField
      FieldName = 'Dig6'
    end
    object cdsArcLite_v2Dig7: TFloatField
      FieldName = 'Dig7'
    end
    object cdsArcLite_v2Dig8: TFloatField
      FieldName = 'Dig8'
    end
    object cdsArcLite_v2Dig9: TFloatField
      FieldName = 'Dig9'
    end
    object cdsArcLite_v2Dig10: TFloatField
      FieldName = 'Dig10'
    end
    object cdsArcLite_v2Dig11: TFloatField
      FieldName = 'Dig11'
    end
    object cdsArcLite_v2Dig12: TFloatField
      FieldName = 'Dig12'
    end
    object cdsArcLite_v2Dig13: TFloatField
      FieldName = 'Dig13'
    end
    object cdsArcLite_v2Dig14: TFloatField
      FieldName = 'Dig14'
    end
    object cdsArcLite_v2Dig15: TFloatField
      FieldName = 'Dig15'
    end
    object cdsArcLite_v2Str1: TStringField
      FieldName = 'Str1'
      Size = 100
    end
    object cdsArcLite_v2Str2: TStringField
      FieldName = 'Str2'
      Size = 100
    end
    object cdsArcLite_v2Str3: TStringField
      FieldName = 'Str3'
      Size = 100
    end
    object cdsArcLite_v2Str4: TStringField
      FieldName = 'Str4'
      Size = 100
    end
    object cdsArcLite_v2Str5: TStringField
      FieldName = 'Str5'
      Size = 100
    end
    object cdsArcLite_v2Str6: TStringField
      FieldName = 'Str6'
      Size = 100
    end
    object cdsArcLite_v2Str7: TStringField
      FieldName = 'Str7'
      Size = 100
    end
    object cdsArcLite_v2Str8: TStringField
      FieldName = 'Str8'
      Size = 100
    end
    object cdsArcLite_v2Str9: TStringField
      FieldName = 'Str9'
      Size = 100
    end
    object cdsArcLite_v2Str10: TStringField
      FieldName = 'Str10'
      Size = 100
    end
    object cdsArcLite_v2Str11: TStringField
      FieldName = 'Str11'
      Size = 100
    end
    object cdsArcLite_v2Str12: TStringField
      FieldName = 'Str12'
      Size = 100
    end
    object cdsArcLite_v2Str13: TStringField
      FieldName = 'Str13'
      Size = 100
    end
    object cdsArcLite_v2Str14: TStringField
      FieldName = 'Str14'
      Size = 100
    end
    object cdsArcLite_v2Str15: TStringField
      FieldName = 'Str15'
      Size = 100
    end
    object cdsArcLite_v2id_OperWare: TAutoIncField
      FieldName = 'id_OperWare'
      ReadOnly = True
    end
    object cdsArcLite_v2OperVidName: TStringField
      FieldName = 'OperVidName'
      ReadOnly = True
      Size = 50
    end
    object cdsArcLite_v2CRN_OperSumRez: TFloatField
      FieldName = 'CRN_OperSumRez'
      ReadOnly = True
    end
    object cdsArcLite_v2OnlyDate: TDateTimeField
      FieldName = 'OnlyDate'
      ReadOnly = True
    end
    object cdsArcLite_v2is_Mirr: TBooleanField
      FieldName = 'is_Mirr'
      ReadOnly = True
    end
    object cdsArcLite_v2id_Acc_Group: TIntegerField
      FieldName = 'id_Acc_Group'
      ReadOnly = True
    end
    object cdsArcLite_v2id_Warehouse_Group: TIntegerField
      FieldName = 'id_Warehouse_Group'
      ReadOnly = True
    end
    object cdsArcLite_v2id_Manufact_Group: TIntegerField
      FieldName = 'id_Manufact_Group'
      ReadOnly = True
    end
    object cdsArcLite_v2VatIn: TBooleanField
      FieldName = 'VatIn'
    end
    object cdsArcLite_v2AutoGen: TBooleanField
      FieldName = 'AutoGen'
    end
    object cdsArcLite_v2CreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      ReadOnly = True
      Size = 152
    end
    object cdsArcLite_v2CheckerFIO: TStringField
      FieldName = 'CheckerFIO'
      ReadOnly = True
      Size = 152
    end
  end
end
