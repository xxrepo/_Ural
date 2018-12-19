object fOperFin_FFF: TfOperFin_FFF
  Left = 0
  Top = 0
  Width = 600
  Height = 487
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  TabOrder = 0
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 600
    Height = 487
    ActivePage = tsData
    Align = alClient
    TabOrder = 0
    object tsData: TTabSheet
      Caption = 'Данные'
      object P1: TPanel
        Left = 0
        Top = 0
        Width = 592
        Height = 112
        Align = alTop
        BevelOuter = bvNone
        Caption = '.'
        TabOrder = 0
        object lbSrcName: TLabel
          Left = 4
          Top = 27
          Width = 38
          Height = 13
          Caption = 'Объект'
          FocusControl = DBEdit1
        end
        object Label3: TLabel
          Left = 4
          Top = 76
          Width = 37
          Height = 13
          Caption = 'Бизнес'
        end
        object lbOperTypeIn: TLabel
          Left = 2
          Top = 4
          Width = 70
          Height = 13
          Caption = 'Тип операции'
          FocusControl = cbOperTypeIn
        end
        object Label1: TLabel
          Left = 427
          Top = 2
          Width = 79
          Height = 13
          Caption = 'Коррекционная'
        end
        object Label13: TLabel
          Left = 4
          Top = 51
          Width = 58
          Height = 13
          Caption = 'Контрагент'
          FocusControl = DBEdit3
        end
        object DBEdit1: TDBEdit
          Left = 88
          Top = 24
          Width = 474
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'ReprName'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 0
        end
        object BitBtn3: TBitBtn
          Left = 561
          Top = 24
          Width = 24
          Height = 21
          Anchors = [akTop, akRight]
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn3Click
        end
        object cbOperTypeIn: TComboBox
          Left = 89
          Top = 0
          Width = 310
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          OnChange = cbOperTypeInChange
          Items.Strings = (
            'Приходная операция'
            'Расходная операция')
        end
        object DBEdit9: TDBEdit
          Left = 513
          Top = 0
          Width = 72
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Correct'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit8: TDBEdit
          Left = 88
          Top = 72
          Width = 498
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMenu
          DataField = 'BusinessName'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit3: TDBEdit
          Left = 88
          Top = 47
          Width = 500
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMenu
          DataField = 'ContrAgentName'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 5
        end
      end
      object P2: TPanel
        Left = 0
        Top = 112
        Width = 592
        Height = 26
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 300
          Height = 26
          Align = alLeft
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 0
          object Label2: TLabel
            Left = 4
            Top = 8
            Width = 34
            Height = 13
            Caption = 'Сумма'
          end
          object DBEdit2: TRxDBCalcEdit
            Left = 87
            Top = 3
            Width = 127
            Height = 21
            DataField = 'PriceOper'
            DataSource = dsOperFin
            NumGlyphs = 2
            TabOrder = 0
            OnClick = DBEdit2Click
          end
        end
        inline fCurSelector1: TfCurSelector
          Left = 300
          Width = 292
          Height = 26
          Align = alClient
          TabOrder = 1
          inherited Label1: TLabel
            Left = 4
          end
          inherited cbCur: TComboBox
            Width = 226
          end
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 138
        Width = 592
        Height = 321
        Align = alClient
        Caption = 'Комментарий'
        TabOrder = 2
        object DBMemo1: TDBMemo
          Left = 2
          Top = 15
          Width = 588
          Height = 304
          Align = alClient
          DataField = 'OpComment'
          DataSource = dsOperFin
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object tsComment: TTabSheet
      Caption = 'Доп. информация'
      ImageIndex = 1
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 592
        Height = 103
        Align = alTop
        Caption = ' '
        TabOrder = 0
        object Label7: TLabel
          Left = 4
          Top = 8
          Width = 80
          Height = 13
          Caption = 'Ввел сотрудник'
          FocusControl = DBEdit7
        end
        object Label5: TLabel
          Left = 4
          Top = 31
          Width = 59
          Height = 13
          Caption = 'Дата ввода'
          FocusControl = DBEdit5
        end
        object Label12: TLabel
          Left = 4
          Top = 56
          Width = 67
          Height = 13
          Caption = 'Завизировал'
          FocusControl = DBEdit6
        end
        object Label14: TLabel
          Left = 4
          Top = 79
          Width = 95
          Height = 13
          Caption = 'Дата визирования'
          FocusControl = DBEdit10
        end
        object DBEdit7: TDBEdit
          Left = 106
          Top = 3
          Width = 474
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMenu
          DataField = 'CreatorFIO'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 106
          Top = 27
          Width = 115
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DateLocal'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 106
          Top = 51
          Width = 474
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMenu
          DataField = 'CheckerFIO'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit10: TDBEdit
          Left = 106
          Top = 75
          Width = 115
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CheckDate'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
  end
  object cdsOperFin: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Oper'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@is_Mirr'
        ParamType = ptInput
      end>
    ProviderName = 'dsOperProp_v2'
    RemoteServer = DM.rsCA
    AfterPost = cdsOperFinAfterPost
    Left = 80
    Top = 166
    object cdsOperFinid_Oper: TIntegerField
      FieldName = 'id_Oper'
    end
    object cdsOperFinid_OperParent: TIntegerField
      FieldName = 'id_OperParent'
    end
    object cdsOperFinid_old_Oper: TIntegerField
      FieldName = 'id_old_Oper'
    end
    object cdsOperFinDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object cdsOperFinid_LC_Oper: TIntegerField
      FieldName = 'id_LC_Oper'
    end
    object cdsOperFinOperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object cdsOperFinid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsOperFinCreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      Size = 152
    end
    object cdsOperFinid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsOperFinId_CurrencyBsn: TIntegerField
      FieldName = 'Id_CurrencyBsn'
    end
    object cdsOperFinBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsOperFinBusinessNum: TStringField
      FieldName = 'BusinessNum'
      Size = 5
    end
    object cdsOperFinDateLocal: TDateTimeField
      FieldName = 'DateLocal'
    end
    object cdsOperFinCorrect: TBooleanField
      FieldName = 'Correct'
      DisplayValues = 'Да;Нет'
    end
    object cdsOperFinOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsOperFinId_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object cdsOperFinCurrencyOperName: TStringField
      FieldName = 'CurrencyOperName'
      Size = 30
    end
    object cdsOperFinCurrencyOperShortName: TStringField
      FieldName = 'CurrencyOperShortName'
      Size = 10
    end
    object cdsOperFinPriceOper: TFloatField
      FieldName = 'PriceOper'
    end
    object cdsOperFinRateOper: TFloatField
      FieldName = 'RateOper'
    end
    object cdsOperFinId_CurrencySys: TIntegerField
      FieldName = 'Id_CurrencySys'
    end
    object cdsOperFinCurrencySysName: TStringField
      FieldName = 'CurrencySysName'
      Size = 30
    end
    object cdsOperFinCurrencySysShortName: TStringField
      FieldName = 'CurrencySysShortName'
      Size = 10
    end
    object cdsOperFinSummSys: TFloatField
      FieldName = 'SummSys'
    end
    object cdsOperFinRateSys: TFloatField
      FieldName = 'RateSys'
    end
    object cdsOperFinid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsOperFinid_Warehouse: TIntegerField
      FieldName = 'id_Warehouse'
    end
    object cdsOperFinid_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object cdsOperFinSrcName: TStringField
      FieldName = 'SrcName'
      Size = 50
    end
    object cdsOperFinSrcID_Main: TIntegerField
      FieldName = 'SrcID_Main'
    end
    object cdsOperFinid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsOperFinid_Acc_Ext: TIntegerField
      FieldName = 'id_Acc_Ext'
    end
    object cdsOperFinid_Warehouse_Ext: TIntegerField
      FieldName = 'id_Warehouse_Ext'
    end
    object cdsOperFinid_Manufact_Ext: TIntegerField
      FieldName = 'id_Manufact_Ext'
    end
    object cdsOperFinReprName: TStringField
      FieldName = 'ReprName'
      OnGetText = cdsOperFinReprNameGetText
      Size = 255
    end
    object cdsOperFinReprID_Main: TIntegerField
      FieldName = 'ReprID_Main'
    end
    object cdsOperFinId_CurrencyInv: TIntegerField
      FieldName = 'Id_CurrencyInv'
    end
    object cdsOperFinRateInv: TFloatField
      FieldName = 'RateInv'
    end
    object cdsOperFinCurrencyInvName: TStringField
      FieldName = 'CurrencyInvName'
      Size = 30
    end
    object cdsOperFinCurrencyInvShortName: TStringField
      FieldName = 'CurrencyInvShortName'
      Size = 10
    end
    object cdsOperFinKoeff: TIntegerField
      FieldName = 'Koeff'
    end
    object cdsOperFinKoeffName: TStringField
      FieldName = 'KoeffName'
      Size = 50
    end
    object cdsOperFinCheckDate: TDateTimeField
      FieldName = 'CheckDate'
    end
    object cdsOperFinCheckerFIO: TStringField
      FieldName = 'CheckerFIO'
      Size = 152
    end
    object cdsOperFinid_FormalDistrib: TIntegerField
      FieldName = 'id_FormalDistrib'
    end
    object cdsOperFinFormalDistribName: TStringField
      FieldName = 'FormalDistribName'
      Size = 50
    end
    object cdsOperFinid_FuncDistrib: TIntegerField
      FieldName = 'id_FuncDistrib'
    end
    object cdsOperFinFuncDistribName: TStringField
      FieldName = 'FuncDistribName'
      Size = 50
    end
    object cdsOperFinDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsOperFinid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object cdsOperFinContrAgentName: TStringField
      FieldName = 'ContrAgentName'
      Size = 50
    end
    object cdsOperFinid_CAGroup: TIntegerField
      FieldName = 'id_CAGroup'
    end
    object cdsOperFinSummOper: TFloatField
      FieldName = 'SummOper'
    end
    object cdsOperFinTypeName: TStringField
      FieldName = 'TypeName'
      Size = 30
    end
    object cdsOperFinHasViza: TBooleanField
      FieldName = 'HasViza'
    end
    object cdsOperFinOperState: TIntegerField
      FieldName = 'OperState'
    end
    object cdsOperFinHidedOper: TBooleanField
      FieldName = 'HidedOper'
    end
    object cdsOperFinRateMain: TFloatField
      FieldName = 'RateMain'
    end
    object cdsOperFinid_Repr_Ex: TIntegerField
      FieldName = 'id_Repr_Ex'
    end
    object cdsOperFinid_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object cdsOperFinImp_PayBasic: TStringField
      FieldName = 'Imp_PayBasic'
      Size = 1000
    end
    object cdsOperFinAccInv_PayAssignment: TStringField
      FieldName = 'AccInv_PayAssignment'
      Size = 1000
    end
    object cdsOperFinContract: TStringField
      FieldName = 'Contract'
      Size = 1000
    end
    object cdsOperFinOperCrnName: TStringField
      FieldName = 'OperCrnName'
      Size = 10
    end
    object cdsOperFinBlocked: TBooleanField
      FieldName = 'Blocked'
    end
    object cdsOperFinCurrencyBsnName: TStringField
      FieldName = 'CurrencyBsnName'
      Size = 10
    end
    object cdsOperFinOpComment: TStringField
      FieldName = 'OpComment'
      Size = 1000
    end
    object cdsOperFinRealDataCreate: TDateTimeField
      FieldName = 'RealDataCreate'
    end
    object cdsOperFinOperTypeSIGN: TIntegerField
      FieldName = 'OperTypeSIGN'
    end
    object cdsOperFinHasChild: TIntegerField
      FieldName = 'HasChild'
    end
    object cdsOperFinDig1: TFloatField
      FieldName = 'Dig1'
    end
    object cdsOperFinDig2: TFloatField
      FieldName = 'Dig2'
    end
    object cdsOperFinDig3: TFloatField
      FieldName = 'Dig3'
    end
    object cdsOperFinDig4: TFloatField
      FieldName = 'Dig4'
    end
    object cdsOperFinDig5: TFloatField
      FieldName = 'Dig5'
    end
    object cdsOperFinDig6: TFloatField
      FieldName = 'Dig6'
    end
    object cdsOperFinDig7: TFloatField
      FieldName = 'Dig7'
    end
    object cdsOperFinDig8: TFloatField
      FieldName = 'Dig8'
    end
    object cdsOperFinDig9: TFloatField
      FieldName = 'Dig9'
    end
    object cdsOperFinDig10: TFloatField
      FieldName = 'Dig10'
    end
    object cdsOperFinDig11: TFloatField
      FieldName = 'Dig11'
    end
    object cdsOperFinDig12: TFloatField
      FieldName = 'Dig12'
    end
    object cdsOperFinDig13: TFloatField
      FieldName = 'Dig13'
    end
    object cdsOperFinDig14: TFloatField
      FieldName = 'Dig14'
    end
    object cdsOperFinDig15: TFloatField
      FieldName = 'Dig15'
    end
    object cdsOperFinStr1: TStringField
      FieldName = 'Str1'
      Size = 100
    end
    object cdsOperFinStr2: TStringField
      FieldName = 'Str2'
      Size = 100
    end
    object cdsOperFinStr3: TStringField
      FieldName = 'Str3'
      Size = 100
    end
    object cdsOperFinStr4: TStringField
      FieldName = 'Str4'
      Size = 100
    end
    object cdsOperFinStr5: TStringField
      FieldName = 'Str5'
      Size = 100
    end
    object cdsOperFinStr6: TStringField
      FieldName = 'Str6'
      Size = 100
    end
    object cdsOperFinStr7: TStringField
      FieldName = 'Str7'
      Size = 100
    end
    object cdsOperFinStr8: TStringField
      FieldName = 'Str8'
      Size = 100
    end
    object cdsOperFinStr9: TStringField
      FieldName = 'Str9'
      Size = 100
    end
    object cdsOperFinStr10: TStringField
      FieldName = 'Str10'
      Size = 100
    end
    object cdsOperFinStr11: TStringField
      FieldName = 'Str11'
      Size = 100
    end
    object cdsOperFinStr12: TStringField
      FieldName = 'Str12'
      Size = 100
    end
    object cdsOperFinStr13: TStringField
      FieldName = 'Str13'
      Size = 100
    end
    object cdsOperFinStr14: TStringField
      FieldName = 'Str14'
      Size = 100
    end
    object cdsOperFinStr15: TStringField
      FieldName = 'Str15'
      Size = 100
    end
    object cdsOperFinOperVidName: TStringField
      FieldName = 'OperVidName'
      Size = 50
    end
    object cdsOperFinis_Mirr: TBooleanField
      FieldName = 'is_Mirr'
    end
    object cdsOperFinid_Acc_Group: TIntegerField
      FieldName = 'id_Acc_Group'
    end
    object cdsOperFinid_Warehouse_Group: TIntegerField
      FieldName = 'id_Warehouse_Group'
    end
    object cdsOperFinid_Manufact_Group: TIntegerField
      FieldName = 'id_Manufact_Group'
    end
    object cdsOperFinOperNum: TStringField
      FieldName = 'OperNum'
      Size = 255
    end
    object cdsOperFinid_Replicator: TIntegerField
      FieldName = 'id_Replicator'
    end
  end
  object dsOperFin: TDataSource
    DataSet = cdsOperFin
    Left = 112
    Top = 174
  end
end
