object fCurProp: TfCurProp
  Left = 0
  Top = 0
  Width = 432
  Height = 324
  TabOrder = 0
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 50
    Height = 13
    Caption = 'Название'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 99
    Height = 13
    Caption = 'Короткое название'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 81
    Width = 40
    Height = 13
    Caption = 'Код ISO'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 160
    Top = 80
    Width = 73
    Height = 13
    Caption = 'Цифровой код'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 6
    Top = 104
    Width = 86
    Height = 13
    Caption = 'Единиц к обмену'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 160
    Top = 104
    Width = 24
    Height = 13
    Caption = 'Курс'
  end
  object Label7: TLabel
    Left = 8
    Top = 132
    Width = 96
    Height = 13
    Caption = 'Обновлять с сайта'
  end
  object Label8: TLabel
    Left = 8
    Top = 56
    Width = 56
    Height = 13
    Caption = 'Состоит из'
    FocusControl = DBEdit7
  end
  object RxSpeedButton2: TRxSpeedButton
    Left = 279
    Top = 102
    Width = 50
    Height = 21
    Caption = '<<--'
    OnClick = Button1Click
  end
  object DBEdit1: TDBEdit
    Left = 112
    Top = 5
    Width = 280
    Height = 21
    DataField = 'Name'
    DataSource = dsCurProp
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 112
    Top = 29
    Width = 163
    Height = 21
    DataField = 'ShortName'
    DataSource = dsCurProp
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 112
    Top = 77
    Width = 35
    Height = 21
    DataField = 'ISOCode'
    DataSource = dsCurProp
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 240
    Top = 77
    Width = 35
    Height = 21
    DataField = 'NumberCode'
    DataSource = dsCurProp
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 112
    Top = 101
    Width = 37
    Height = 21
    DataField = 'Value'
    DataSource = dsCurProp
    TabOrder = 5
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 112
    Top = 128
    Width = 281
    Height = 21
    DropDownCount = 8
    DataField = 'Id_URL'
    DataSource = dsCurProp
    LookupField = 'Id_URL'
    LookupDisplay = 'Name'
    LookupSource = dsUrl
    TabOrder = 6
  end
  object DBEdit6: TRxDBCalcEdit
    Left = 194
    Top = 101
    Width = 82
    Height = 21
    DataField = 'Rate'
    DataSource = dsCurProp
    DecimalPlaces = 4
    DisplayFormat = ',0.####'
    NumGlyphs = 2
    TabOrder = 7
  end
  object DBEdit7: TDBEdit
    Left = 112
    Top = 53
    Width = 163
    Height = 21
    DataField = 'DocCurPartName'
    DataSource = dsCurProp
    TabOrder = 2
  end
  object cdsCurProp: TClientDataSet
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
        Name = '@Id_Currency'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsCurProp'
    RemoteServer = DM.rsCA
    Left = 272
    Top = 160
    object cdsCurPropId_Currency: TAutoIncField
      FieldName = 'Id_Currency'
      ReadOnly = True
    end
    object cdsCurPropName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object cdsCurPropShortName: TStringField
      FieldName = 'ShortName'
      Size = 10
    end
    object cdsCurPropISOCode: TStringField
      FieldName = 'ISOCode'
      FixedChar = True
      Size = 3
    end
    object cdsCurPropNumberCode: TStringField
      FieldName = 'NumberCode'
      FixedChar = True
      Size = 3
    end
    object cdsCurPropFastAccess: TBooleanField
      FieldName = 'FastAccess'
    end
    object cdsCurPropValue: TIntegerField
      FieldName = 'Value'
    end
    object cdsCurPropRate: TFloatField
      FieldName = 'Rate'
    end
    object cdsCurPropAvForPay: TBooleanField
      FieldName = 'AvForPay'
    end
    object cdsCurPropId_URL: TIntegerField
      FieldName = 'Id_URL'
    end
    object cdsCurPropBase: TBooleanField
      FieldName = 'Base'
    end
    object cdsCurPropLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsCurPropURLName: TStringField
      FieldName = 'URLName'
    end
    object cdsCurPropURL: TStringField
      FieldName = 'URL'
      Size = 255
    end
    object cdsCurPropID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object cdsCurPropid_Bsn: TIntegerField
      FieldName = 'id_Bsn'
    end
    object cdsCurPropDocCurPartName: TStringField
      FieldName = 'DocCurPartName'
      Size = 50
    end
    object cdsCurPropId_CurrencyUnData: TIntegerField
      FieldName = 'Id_CurrencyUnData'
    end
  end
  object cdsUrl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsURLList'
    RemoteServer = DM.rsCA
    Left = 272
    Top = 125
    object cdsUrlId_URL: TAutoIncField
      FieldName = 'Id_URL'
      ReadOnly = True
    end
    object cdsUrlUseTable: TSmallintField
      FieldName = 'UseTable'
    end
    object cdsUrlName: TStringField
      FieldName = 'Name'
    end
    object cdsUrlURL: TStringField
      FieldName = 'URL'
      Size = 255
    end
  end
  object dsCurProp: TDataSource
    DataSet = cdsCurProp
    Left = 312
    Top = 120
  end
  object dsUrl: TDataSource
    DataSet = cdsUrl
    Left = 312
    Top = 160
  end
end
