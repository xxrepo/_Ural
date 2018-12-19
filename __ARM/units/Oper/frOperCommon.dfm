object fOperCommon: TfOperCommon
  Left = 0
  Top = 0
  Width = 321
  Height = 385
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 321
    Height = 30
    Align = alTop
    Caption = ' '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 34
      Height = 13
      Caption = 'Кол-во'
      FocusControl = DBEdit1
    end
    object DBEdit1: TDBEdit
      Left = 80
      Top = 5
      Width = 64
      Height = 21
      DataField = 'AmountOper'
      DataSource = dsOperCmn
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 30
    Width = 321
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 13
      Caption = 'Цена'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 8
      Top = 31
      Width = 38
      Height = 13
      Caption = 'Валюта'
      FocusControl = DBEdit3
    end
    object DBEdit2: TDBEdit
      Left = 80
      Top = 4
      Width = 64
      Height = 21
      DataField = 'PriceOper'
      DataSource = dsOperCmn
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 80
      Top = 27
      Width = 209
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CurrencyOperName'
      DataSource = dsOperCmn
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 288
      Top = 27
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
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object CheckBox1: TCheckBox
      Left = 80
      Top = 52
      Width = 233
      Height = 17
      Caption = 'Зачесть в другой валюте'
      TabOrder = 3
      OnClick = CheckBox1Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 102
    Width = 321
    Height = 65
    Align = alTop
    Caption = 'Зачетная сумма: '
    TabOrder = 2
    object Label4: TLabel
      Left = 9
      Top = 20
      Width = 34
      Height = 13
      Caption = 'Сумма'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 9
      Top = 43
      Width = 38
      Height = 13
      Caption = 'Валюта'
      FocusControl = DBEdit5
    end
    object DBEdit4: TDBEdit
      Left = 80
      Top = 16
      Width = 64
      Height = 21
      DataField = 'SummSys'
      DataSource = dsOperCmn
      TabOrder = 0
    end
    object DBEdit5: TDBEdit
      Left = 80
      Top = 39
      Width = 209
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CurrencySysName'
      DataSource = dsOperCmn
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 288
      Top = 38
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
      TabOrder = 2
      OnClick = BitBtn2Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 167
    Width = 321
    Height = 218
    Align = alClient
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 3
  end
  object cdsOperCmn: TClientDataSet
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
        Name = '@id_OperCommon'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsOperCmn'
    RemoteServer = DM.rsCA
    Left = 96
    Top = 190
    object cdsOperCmnid_OperCommon: TAutoIncField
      FieldName = 'id_OperCommon'
      ReadOnly = True
    end
    object cdsOperCmnid_Replicator: TIntegerField
      FieldName = 'id_Replicator'
    end
    object cdsOperCmnReplicatorShortName: TStringField
      FieldName = 'ReplicatorShortName'
      Size = 5
    end
    object cdsOperCmnid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsOperCmnCreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      Size = 152
    end
    object cdsOperCmnid_Manager: TIntegerField
      FieldName = 'id_Manager'
    end
    object cdsOperCmnManagerFIO: TStringField
      FieldName = 'ManagerFIO'
      Size = 152
    end
    object cdsOperCmnid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsOperCmnBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsOperCmnBusinessNum: TStringField
      FieldName = 'BusinessNum'
      Size = 5
    end
    object cdsOperCmnDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object cdsOperCmnDateLocal: TDateTimeField
      FieldName = 'DateLocal'
    end
    object cdsOperCmnOperNumber: TIntegerField
      FieldName = 'OperNumber'
    end
    object cdsOperCmnCorrect: TBooleanField
      FieldName = 'Correct'
    end
    object cdsOperCmnOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsOperCmnId_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object cdsOperCmnCurrencyOperName: TStringField
      FieldName = 'CurrencyOperName'
      Size = 30
    end
    object cdsOperCmnCurrencyOperShortName: TStringField
      FieldName = 'CurrencyOperShortName'
      Size = 10
    end
    object cdsOperCmnAmountOper: TFloatField
      FieldName = 'AmountOper'
    end
    object cdsOperCmnPriceOper: TFloatField
      FieldName = 'PriceOper'
    end
    object cdsOperCmnRateOper: TFloatField
      FieldName = 'RateOper'
    end
    object cdsOperCmnId_CurrencySys: TIntegerField
      FieldName = 'Id_CurrencySys'
    end
    object cdsOperCmnCurrencySysName: TStringField
      FieldName = 'CurrencySysName'
      Size = 30
    end
    object cdsOperCmnCurrencySysShortName: TStringField
      FieldName = 'CurrencySysShortName'
      Size = 10
    end
    object cdsOperCmnSummSys: TFloatField
      FieldName = 'SummSys'
    end
    object cdsOperCmnRateSys: TFloatField
      FieldName = 'RateSys'
    end
    object cdsOperCmnid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsOperCmnReprName: TStringField
      FieldName = 'ReprName'
      Size = 92
    end
    object cdsOperCmnCheckDate: TDateTimeField
      FieldName = 'CheckDate'
    end
    object cdsOperCmnid_UserChecker: TIntegerField
      FieldName = 'id_UserChecker'
    end
    object cdsOperCmnCheckerFIO: TStringField
      FieldName = 'CheckerFIO'
      Size = 152
    end
    object cdsOperCmnKoeff: TIntegerField
      FieldName = 'Koeff'
    end
    object cdsOperCmnOld_OperTypeIn: TIntegerField
      FieldName = 'Old_OperTypeIn'
    end
    object cdsOperCmnOld_Id_CurrencyOper: TIntegerField
      FieldName = 'Old_Id_CurrencyOper'
    end
    object cdsOperCmnOld_CurrencyOperName: TStringField
      FieldName = 'Old_CurrencyOperName'
      Size = 30
    end
    object cdsOperCmnOld_CurrencyOperShortName: TStringField
      FieldName = 'Old_CurrencyOperShortName'
      Size = 10
    end
    object cdsOperCmnOld_AmountOper: TFloatField
      FieldName = 'Old_AmountOper'
    end
    object cdsOperCmnOld_RateOper: TFloatField
      FieldName = 'Old_RateOper'
    end
    object cdsOperCmnOld_PriceOper: TFloatField
      FieldName = 'Old_PriceOper'
    end
    object cdsOperCmnOld_Id_CurrencySys: TIntegerField
      FieldName = 'Old_Id_CurrencySys'
    end
    object cdsOperCmnOld_CurrencySysName: TStringField
      FieldName = 'Old_CurrencySysName'
      Size = 30
    end
    object cdsOperCmnOld_CurrencySysShortName: TStringField
      FieldName = 'Old_CurrencySysShortName'
      Size = 10
    end
    object cdsOperCmnOld_SummSys: TFloatField
      FieldName = 'Old_SummSys'
    end
    object cdsOperCmnOld_RateSys: TFloatField
      FieldName = 'Old_RateSys'
    end
  end
  object dsOperCmn: TDataSource
    DataSet = cdsOperCmn
    Left = 128
    Top = 190
  end
end
