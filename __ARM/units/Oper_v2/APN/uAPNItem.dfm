object APNItem: TAPNItem
  Left = 210
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Начисление'
  ClientHeight = 197
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 35
    Height = 13
    Caption = 'Группа'
  end
  object Label3: TLabel
    Left = 8
    Top = 35
    Width = 23
    Height = 13
    Caption = 'Счет'
    FocusControl = DBEdit3
  end
  object lbSum: TLabel
    Left = 8
    Top = 99
    Width = 34
    Height = 13
    Caption = 'Сумма'
    FocusControl = edSum
  end
  object lbPrc: TLabel
    Left = 8
    Top = 131
    Width = 43
    Height = 13
    Caption = 'Процент'
    FocusControl = edPrc
  end
  object lbCur: TLabel
    Left = 144
    Top = 99
    Width = 38
    Height = 13
    Caption = 'Валюта'
    FocusControl = edSum
  end
  object Panel2: TPanel
    Left = 0
    Top = 156
    Width = 433
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 7
    object btnCancel: TButton
      Left = 347
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 256
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object DBEdit3: TDBEdit
    Left = 64
    Top = 32
    Width = 300
    Height = 21
    DataField = 'AccName'
    DataSource = dsAPNItemProp
    TabOrder = 1
  end
  object BitBtn3: TBitBtn
    Left = 363
    Top = 32
    Width = 24
    Height = 21
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object edSum: TDBEdit
    Left = 64
    Top = 96
    Width = 64
    Height = 21
    DataField = 'ASumm'
    DataSource = dsAPNItemProp
    TabOrder = 4
  end
  object edPrc: TDBEdit
    Left = 64
    Top = 128
    Width = 64
    Height = 21
    DataField = 'APrc'
    DataSource = dsAPNItemProp
    TabOrder = 6
  end
  object lcGrp: TRxDBLookupCombo
    Left = 64
    Top = 8
    Width = 321
    Height = 21
    DropDownCount = 8
    DataField = 'id_APN_Obj'
    DataSource = dsAPNItemProp
    LookupField = 'id_APN_Obj'
    LookupDisplay = 'NAme'
    LookupSource = dsAPN
    TabOrder = 0
  end
  object cbType: TComboBox
    Left = 64
    Top = 64
    Width = 321
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    OnChange = cbTypeChange
    Items.Strings = (
      'Начислять фиксированную сумму'
      'Начислять процент')
  end
  object lcCur: TRxDBLookupCombo
    Left = 192
    Top = 96
    Width = 121
    Height = 21
    DropDownCount = 8
    DataField = 'Id_Currency'
    DataSource = dsAPNItemProp
    LookupField = 'Id_Currency'
    LookupDisplay = 'ShortName'
    LookupSource = DataSource1
    TabOrder = 5
  end
  object cdsAPNItemProp: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_APN_AccList'
        ParamType = ptInput
        Value = 33
      end>
    ProviderName = 'dsAPNItemProp'
    RemoteServer = DM.rsCA
    Left = 240
    Top = 65528
    object cdsAPNItemPropid_APN_AccList: TAutoIncField
      FieldName = 'id_APN_AccList'
      ReadOnly = True
    end
    object cdsAPNItemPropid_APN_Obj: TIntegerField
      FieldName = 'id_APN_Obj'
    end
    object cdsAPNItemPropid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsAPNItemPropASumm: TFloatField
      FieldName = 'ASumm'
    end
    object cdsAPNItemPropId_Currency: TIntegerField
      FieldName = 'Id_Currency'
    end
    object cdsAPNItemPropAPrc: TFloatField
      FieldName = 'APrc'
    end
    object cdsAPNItemPropAccName: TStringField
      FieldName = 'AccName'
      Size = 50
    end
    object cdsAPNItemPropCRNName: TStringField
      FieldName = 'CRNName'
      Size = 10
    end
  end
  object dsAPNItemProp: TDataSource
    DataSet = cdsAPNItemProp
    Left = 272
    Top = 65528
  end
  object cdsAPN: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftSmallint
        Name = '@id_business'
        ParamType = ptInput
        Value = 11
      end>
    ProviderName = 'dsAPN'
    RemoteServer = DM.rsCA
    Left = 240
    Top = 32
    object cdsAPNid_APN_Obj: TAutoIncField
      FieldName = 'id_APN_Obj'
      ReadOnly = True
    end
    object cdsAPNid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsAPNid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsAPNOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsAPNDayNum: TIntegerField
      FieldName = 'DayNum'
    end
    object cdsAPNDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsAPNNAme: TStringField
      FieldName = 'NAme'
      Size = 255
    end
    object cdsAPNid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsAPNWDate: TDateTimeField
      FieldName = 'WDate'
      ReadOnly = True
    end
  end
  object dsAPN: TDataSource
    DataSet = cdsAPN
    Left = 272
    Top = 32
  end
  object cdsCur: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftBoolean
        Name = '@FastAccess'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@AvForPay'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
      end>
    ProviderName = 'dsCur2'
    RemoteServer = DM.rsCA
    Left = 248
    Top = 72
    object cdsCurId_Currency: TAutoIncField
      FieldName = 'Id_Currency'
      ReadOnly = True
    end
    object cdsCurName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object cdsCurShortName: TStringField
      FieldName = 'ShortName'
      Size = 10
    end
    object cdsCurISOCode: TStringField
      FieldName = 'ISOCode'
      FixedChar = True
      Size = 3
    end
    object cdsCurNumberCode: TStringField
      FieldName = 'NumberCode'
      FixedChar = True
      Size = 3
    end
    object cdsCurFastAccess: TBooleanField
      FieldName = 'FastAccess'
    end
    object cdsCurValue: TIntegerField
      FieldName = 'Value'
    end
    object cdsCurRate: TFloatField
      FieldName = 'Rate'
    end
    object cdsCurAvForPay: TBooleanField
      FieldName = 'AvForPay'
    end
    object cdsCurBase: TBooleanField
      FieldName = 'Base'
    end
    object cdsCurLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsCurId_URL: TIntegerField
      FieldName = 'Id_URL'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsCur
    Left = 288
    Top = 72
  end
end
