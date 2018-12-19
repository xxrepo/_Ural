object BsnImp: TBsnImp
  Left = 210
  Top = 107
  Width = 696
  Height = 399
  Caption = 'Импорт данных в бизнес'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 56
    Width = 688
    Height = 62
    Align = alTop
    Caption = ' '
    TabOrder = 0
    Visible = False
    object Label1: TLabel
      Left = 176
      Top = 40
      Width = 33
      Height = 13
      Caption = 'Время'
    end
    object Label2: TLabel
      Left = 16
      Top = 39
      Width = 26
      Height = 13
      Caption = 'Дата'
    end
    object Label5: TLabel
      Left = 8
      Top = 2
      Width = 609
      Height = 26
      Caption = 
        'Если хотите импортитьвать данные по состоянию на прошедшую дату,' +
        ' введите Дату (и Время). Если Дата не введена, импортируются дан' +
        'ные на текущий момент. '
      WordWrap = True
    end
    object dtTo: TDateTimePicker
      Left = 64
      Top = 36
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
      OnChange = dtToChange
    end
    object dtTimeTo: TDateTimePicker
      Left = 216
      Top = 36
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
  object Panel3: TPanel
    Left = 0
    Top = 118
    Width = 688
    Height = 209
    Align = alClient
    Caption = ' '
    Enabled = False
    TabOrder = 1
    object Label6: TLabel
      Left = 8
      Top = 2
      Width = 165
      Height = 13
      Caption = 'Выберите данные для экспорта:'
      WordWrap = True
    end
    object RxSpeedButton2: TRxSpeedButton
      Left = 14
      Top = 164
      Width = 135
      Height = 41
      Caption = 'Импортировать'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00800000008000
        000080000000800000008000000080000000800000008000000080000000FF00
        FF000000FF000000FF000000FF000000FF000000FF00FF00FF0080000000FFFF
        FF00FFFFFF00C0C0C000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF0080000000FFFF
        FF00FFFFFF00C0C0C000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFF
        FF000000FF000000FF000000FF000000FF000000FF000000FF0080000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
        0000FF00FF000000FF000000FF00FF00FF000000FF000000FF0080000000FFFF
        FF00FFFFFF00C0C0C000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF008000
        0000FF00FF00FF00FF000000FF00FF00FF00FF00FF000000FF0080000000FFFF
        FF00FFFFFF00C0C0C000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF008000
        00008000000080000000FF00FF00FF00FF000000FF000000FF00800000008000
        0000800000008000000080000000800000008000000080000000800000008000
        0000FFFFFF00FFFFFF00800000000000FF000000FF000000FF00800000008000
        000080000000800000008000000080000000FFFF000080000000FFFF00008000
        0000FFFFFF00FFFFFF00800000000000FF000000FF000000FF00800000008000
        0000800000008000000080000000800000008000000080000000800000008000
        0000C0C0C000C0C0C000800000000000FF000000FF00FF00FF00FF00FF00FF00
        FF00FF00FF0080000000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00C0C0
        C000FFFFFF00FFFFFF0080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0080000000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00C0C0
        C000FFFFFF00FFFFFF0080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008000000080000000800000008000000080000000800000008000
        0000800000008000000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00800000008000000080000000800000008000000080000000FFFF
        000080000000FFFF000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008000000080000000800000008000000080000000800000008000
        0000800000008000000080000000FF00FF00FF00FF00FF00FF00}
      OnClick = RxSpeedButton2Click
    end
    object cbAccGrp: TCheckBox
      Left = 14
      Top = 40
      Width = 143
      Height = 17
      Caption = 'Группы счетов'
      TabOrder = 1
      OnClick = cbAccClick
    end
    object cbAcc: TCheckBox
      Left = 14
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Счета'
      TabOrder = 0
      OnClick = cbAccClick
    end
    object cbAccState: TCheckBox
      Left = 14
      Top = 56
      Width = 145
      Height = 17
      Caption = 'Остатки на счетах'
      TabOrder = 2
      OnClick = cbAccClick
    end
    object cbWH: TCheckBox
      Left = 230
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Склады'
      TabOrder = 4
      OnClick = cbAccClick
    end
    object cbWHGrp: TCheckBox
      Left = 230
      Top = 40
      Width = 143
      Height = 17
      Caption = 'Группы складов'
      TabOrder = 5
      OnClick = cbAccClick
    end
    object cbCAState: TCheckBox
      Left = 360
      Top = 56
      Width = 194
      Height = 17
      Caption = 'Задолженности по контрагентам'
      TabOrder = 8
      OnClick = cbAccClick
    end
    object cbCA: TCheckBox
      Left = 360
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Контрагенты'
      TabOrder = 6
      OnClick = cbAccClick
    end
    object cbCAGrp: TCheckBox
      Left = 360
      Top = 40
      Width = 143
      Height = 17
      Caption = 'Группы контрагентов'
      TabOrder = 7
      OnClick = cbAccClick
    end
    object cbMNGrp: TCheckBox
      Left = 230
      Top = 123
      Width = 143
      Height = 17
      Caption = 'Группы производств'
      TabOrder = 13
      OnClick = cbAccClick
    end
    object cbMN: TCheckBox
      Left = 230
      Top = 107
      Width = 97
      Height = 17
      Caption = 'Производства'
      TabOrder = 12
      OnClick = cbAccClick
    end
    object cbWareState: TCheckBox
      Left = 14
      Top = 123
      Width = 129
      Height = 17
      Caption = 'Товарные остатки'
      TabOrder = 11
      OnClick = cbAccClick
    end
    object cbWare: TCheckBox
      Left = 14
      Top = 107
      Width = 109
      Height = 17
      Caption = 'Каталог товаров'
      TabOrder = 10
      OnClick = cbAccClick
    end
    object cbAccCrn: TCheckBox
      Left = 14
      Top = 72
      Width = 194
      Height = 17
      Caption = 'Конвертировать в учетную валюту'
      TabOrder = 3
      OnClick = cbAccClick
    end
    object cbCACrn: TCheckBox
      Left = 360
      Top = 72
      Width = 194
      Height = 17
      Caption = 'Конвертировать в учетную валюту'
      TabOrder = 9
      OnClick = cbAccClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 327
    Width = 688
    Height = 45
    Align = alBottom
    Caption = ' '
    TabOrder = 2
    object btnCancel: TButton
      Left = 602
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
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 56
    Align = alTop
    Caption = ' '
    TabOrder = 3
    object Panel0: TPanel
      Left = 1
      Top = 1
      Width = 338
      Height = 54
      Align = alLeft
      Caption = ' '
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 306
        Height = 13
        Caption = 'Выберите бизнес, в который нужно импортировать данные:'
      end
      object edName: TEdit
        Left = 8
        Top = 25
        Width = 269
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object Button1: TButton
        Left = 276
        Top = 25
        Width = 22
        Height = 21
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button1Click
      end
    end
    object Panel1: TPanel
      Left = 339
      Top = 1
      Width = 348
      Height = 54
      Align = alClient
      Caption = ' '
      TabOrder = 1
      object Label8: TLabel
        Left = 8
        Top = 5
        Width = 320
        Height = 13
        Caption = 'Выберите бизнес, данные которого Вы хотите импортировать:'
      end
      object Edit1: TEdit
        Left = 8
        Top = 22
        Width = 277
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object Button4: TButton
        Left = 284
        Top = 22
        Width = 22
        Height = 21
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button2Click
      end
    end
  end
  object cdsAccGroup: TClientDataSet
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
        Value = '0'
      end>
    ProviderName = 'dsAccGroup'
    RemoteServer = DM.rsCA
    Left = 128
    Top = 136
    object cdsAccGroupid_Group: TIntegerField
      FieldName = 'id_Group'
      ReadOnly = True
    end
    object cdsAccGroupName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object cdsAccGroupCnt: TIntegerField
      FieldName = 'Cnt'
      ReadOnly = True
    end
    object cdsAccGroupShowInRoot: TBooleanField
      FieldName = 'ShowInRoot'
    end
  end
  object cdsAccs: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@ID_Business'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_Group'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsGetAccs'
    RemoteServer = DM.rsCA
    Left = 128
    Top = 168
    object cdsAccsid_Acc: TAutoIncField
      FieldName = 'id_Acc'
      ReadOnly = True
    end
    object cdsAccsid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsAccsName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object cdsAccsBank: TStringField
      FieldName = 'Bank'
      Size = 50
    end
    object cdsAccsPrsnAccName: TStringField
      FieldName = 'PrsnAccName'
    end
    object cdsAccsCorrAccName: TStringField
      FieldName = 'CorrAccName'
    end
    object cdsAccsINN: TStringField
      FieldName = 'INN'
    end
    object cdsAccsBIK: TStringField
      FieldName = 'BIK'
    end
    object cdsAccsDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsAccsLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsAccsID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object cdsAccsBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsAccsNeedSend: TBooleanField
      FieldName = 'NeedSend'
    end
    object cdsAccsid_Acc_Group: TIntegerField
      FieldName = 'id_Acc_Group'
    end
    object cdsAccsGroupName: TStringField
      FieldName = 'GroupName'
      Size = 255
    end
    object cdsAccsShowInRoot: TBooleanField
      FieldName = 'ShowInRoot'
    end
  end
  object cdsManufacts: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@ID_Business'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_Group'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsManufacts'
    RemoteServer = DM.rsCA
    Left = 280
    Top = 240
    object cdsManufactsid_Manufact: TAutoIncField
      FieldName = 'id_Manufact'
      ReadOnly = True
    end
    object cdsManufactsid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsManufactsName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object cdsManufactsAddr: TStringField
      FieldName = 'Addr'
      Size = 1000
    end
    object cdsManufactsDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsManufactsID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object cdsManufactsLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsManufactsNeedSend: TBooleanField
      FieldName = 'NeedSend'
    end
    object cdsManufactsid_Manufact_Group: TIntegerField
      FieldName = 'id_Manufact_Group'
    end
    object cdsManufactsBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsManufactsGroupName: TStringField
      FieldName = 'GroupName'
      Size = 255
    end
    object cdsManufactsShowInRoot: TBooleanField
      FieldName = 'ShowInRoot'
    end
  end
  object cdsMNGroup: TClientDataSet
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
        Value = '0'
      end>
    ProviderName = 'dsMNGroup'
    RemoteServer = DM.rsCA
    Left = 280
    Top = 272
    object cdsMNGroupid_Group: TIntegerField
      FieldName = 'id_Group'
      ReadOnly = True
    end
    object cdsMNGroupName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object cdsMNGroupCnt: TIntegerField
      FieldName = 'Cnt'
      ReadOnly = True
    end
    object cdsMNGroupShowInRoot: TBooleanField
      FieldName = 'ShowInRoot'
    end
  end
  object cdsWHGroup: TClientDataSet
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
        Value = 0
      end>
    ProviderName = 'dsWHGroup'
    RemoteServer = DM.rsCA
    Left = 272
    Top = 136
    object cdsWHGroupid_Group: TIntegerField
      FieldName = 'id_Group'
      ReadOnly = True
    end
    object cdsWHGroupName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object cdsWHGroupCnt: TIntegerField
      FieldName = 'Cnt'
      ReadOnly = True
    end
    object cdsWHGroupShowInRoot: TBooleanField
      FieldName = 'ShowInRoot'
    end
  end
  object cdsWareHouses: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@ID_Business'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_Group'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsGetWH'
    RemoteServer = DM.rsCA
    Left = 272
    Top = 168
    object cdsWareHousesid_Warehouse: TAutoIncField
      FieldName = 'id_Warehouse'
      ReadOnly = True
    end
    object cdsWareHousesid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsWareHousesName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object cdsWareHousesAddr: TStringField
      FieldName = 'Addr'
      Size = 1000
    end
    object cdsWareHousesDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsWareHousesLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsWareHousesID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object cdsWareHousesBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsWareHousesNeedSend: TBooleanField
      FieldName = 'NeedSend'
    end
    object cdsWareHousesid_Warehouse_Group: TIntegerField
      FieldName = 'id_Warehouse_Group'
    end
    object cdsWareHousesGroupName: TStringField
      FieldName = 'GroupName'
      Size = 255
    end
    object cdsWareHousesShowInRoot: TBooleanField
      FieldName = 'ShowInRoot'
    end
  end
  object cdsCAGroup: TClientDataSet
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
        Name = '@isOwn'
        ParamType = ptInput
      end>
    ProviderName = 'dsCAGroup'
    RemoteServer = DM.rsCA
    Left = 488
    Top = 136
    object cdsCAGroupid_CAGroup: TAutoIncField
      FieldName = 'id_CAGroup'
      ReadOnly = True
    end
    object cdsCAGroupName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object cdsCAGroupCnt: TIntegerField
      FieldName = 'Cnt'
      ReadOnly = True
    end
    object cdsCAGroupShowInRoot: TBooleanField
      FieldName = 'ShowInRoot'
    end
  end
  object cdsCAgent: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
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
        Value = 0
      end
      item
        DataType = ftBoolean
        Name = '@Disabled'
        ParamType = ptInput
        Value = False
      end
      item
        DataType = ftBoolean
        Name = '@isOwn'
        ParamType = ptInput
        Value = False
      end
      item
        DataType = ftInteger
        Name = '@id_CAGroup'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsCAgent'
    RemoteServer = DM.rsCA
    Left = 488
    Top = 168
    object cdsCAgentid_ContrAgent: TAutoIncField
      FieldName = 'id_ContrAgent'
      ReadOnly = True
    end
    object cdsCAgentName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object cdsCAgentid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsCAgentid_CAGroup: TIntegerField
      FieldName = 'id_CAGroup'
    end
    object cdsCAgentDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsCAgentBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsCAgentCAGroupName: TStringField
      FieldName = 'CAGroupName'
      Size = 50
    end
    object cdsCAgentAddr: TStringField
      FieldName = 'Addr'
      Size = 2000
    end
    object cdsCAgentDescr: TStringField
      FieldName = 'Descr'
      Size = 2000
    end
    object cdsCAgentShowInRoot: TBooleanField
      FieldName = 'ShowInRoot'
    end
  end
  object cdsPepr: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_ContrAgent'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftBoolean
        Name = '@Disabled'
        ParamType = ptInput
        Value = False
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsPepr'
    RemoteServer = DM.rsCA
    Left = 488
    Top = 200
    object cdsPeprid_Repr: TAutoIncField
      FieldName = 'id_Repr'
      ReadOnly = True
    end
    object cdsPeprid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object cdsPeprisJur: TBooleanField
      FieldName = 'isJur'
    end
    object cdsPeprName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object cdsPeprCAName: TStringField
      FieldName = 'CAName'
      Size = 50
    end
    object cdsPeprDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsPeprId_Currency: TIntegerField
      FieldName = 'Id_Currency'
    end
    object cdsPeprCurrencyName: TStringField
      FieldName = 'CurrencyName'
      Size = 30
    end
    object cdsPeprid_business2: TIntegerField
      FieldName = 'id_business'
      ReadOnly = True
    end
    object cdsPeprID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object cdsPeprNeedSend: TBooleanField
      FieldName = 'NeedSend'
    end
    object cdsPeprBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsPeprGroupName: TStringField
      FieldName = 'GroupName'
      Size = 255
    end
    object cdsPeprid_Repr_Group: TIntegerField
      FieldName = 'id_Repr_Group'
    end
    object cdsPeprBIK: TStringField
      FieldName = 'BIK'
      Size = 255
    end
    object cdsPeprBank: TStringField
      FieldName = 'Bank'
      Size = 255
    end
    object cdsPeprAccName: TStringField
      FieldName = 'AccName'
      Size = 255
    end
    object cdsPeprCorAccNAme: TStringField
      FieldName = 'CorAccNAme'
      Size = 255
    end
    object cdsPeprOKPO: TStringField
      FieldName = 'OKPO'
      Size = 50
    end
    object cdsPeprINN: TStringField
      FieldName = 'INN'
      Size = 50
    end
    object cdsPeprKPP: TStringField
      FieldName = 'KPP'
      Size = 50
    end
    object cdsPeprFirstName: TStringField
      FieldName = 'FirstName'
      Size = 30
    end
    object cdsPeprMiddleName: TStringField
      FieldName = 'MiddleName'
      Size = 30
    end
    object cdsPeprLastName: TStringField
      FieldName = 'LastName'
      Size = 30
    end
    object cdsPeprAddr: TStringField
      FieldName = 'Addr'
      Size = 2000
    end
    object cdsPeprDescr: TStringField
      FieldName = 'Descr'
      Size = 2000
    end
  end
  object cdsCtg_Goods2: TClientDataSet
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
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_P'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftBoolean
        Name = '@Disabled'
        ParamType = ptInput
        Value = False
      end>
    ProviderName = 'dsCtg_Goods'
    RemoteServer = DM.rsCA
    Left = 40
    Top = 216
    object cdsCtg_Goods2id_Ctg_Goods: TIntegerField
      FieldName = 'id_Ctg_Goods'
      ReadOnly = True
    end
    object cdsCtg_Goods2id_BaseCtg_Goods: TIntegerField
      FieldName = 'id_BaseCtg_Goods'
      ReadOnly = True
    end
    object cdsCtg_Goods2id_business: TIntegerField
      FieldName = 'id_business'
      ReadOnly = True
    end
    object cdsCtg_Goods2Name: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object cdsCtg_Goods2ShortName: TStringField
      FieldName = 'ShortName'
      ReadOnly = True
      Size = 100
    end
    object cdsCtg_Goods2Disabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsCtg_Goods2Cnt: TIntegerField
      FieldName = 'Cnt'
      ReadOnly = True
    end
    object cdsCtg_Goods2CldCnt: TIntegerField
      FieldName = 'CldCnt'
      ReadOnly = True
    end
  end
  object cdsGoods: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Ctg_Goods'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@Disabled'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_business'
        ParamType = ptInput
      end>
    ProviderName = 'dsGoods'
    RemoteServer = DM.rsCA
    Left = 42
    Top = 248
    object cdsGoodsid_Goods: TAutoIncField
      FieldName = 'id_Goods'
      ReadOnly = True
    end
    object cdsGoodsid_Ctg_Goods: TIntegerField
      FieldName = 'id_Ctg_Goods'
    end
    object cdsGoodsName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsGoodsShortName: TStringField
      FieldName = 'ShortName'
      Size = 100
    end
    object cdsGoodsBarCode: TStringField
      FieldName = 'BarCode'
    end
    object cdsGoodsPrice: TFloatField
      FieldName = 'Price'
    end
    object cdsGoodsDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsGoodsLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsGoodsBC: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'BC'
    end
    object cdsGoodsID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object cdsGoodsid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsGoodsMeasureName: TStringField
      FieldName = 'MeasureName'
      Size = 50
    end
    object cdsGoodsGTD: TStringField
      FieldName = 'GTD'
      Size = 50
    end
    object cdsGoodsCountry: TStringField
      FieldName = 'Country'
      Size = 255
    end
    object cdsGoodsDocNomCode: TStringField
      FieldName = 'DocNomCode'
      Size = 50
    end
    object cdsGoodsDocPriceCode: TStringField
      FieldName = 'DocPriceCode'
      Size = 50
    end
    object cdsGoodsDocArt: TStringField
      FieldName = 'DocArt'
      Size = 50
    end
    object cdsGoodsDocNumber: TStringField
      FieldName = 'DocNumber'
      Size = 50
    end
  end
  object cdsGoodsProp2: TClientDataSet
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
        Name = '@id_Goods'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsGoodsProp'
    RemoteServer = DM.rsCA
    Left = 80
    Top = 248
    object cdsGoodsProp2id_Goods: TAutoIncField
      FieldName = 'id_Goods'
      ReadOnly = True
    end
    object cdsGoodsProp2id_Ctg_Goods: TIntegerField
      FieldName = 'id_Ctg_Goods'
    end
    object cdsGoodsProp2Name: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsGoodsProp2ShortName: TStringField
      FieldName = 'ShortName'
      Size = 100
    end
    object cdsGoodsProp2BarCode: TStringField
      FieldName = 'BarCode'
    end
    object cdsGoodsProp2Price: TFloatField
      FieldName = 'Price'
    end
    object cdsGoodsProp2Disabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsGoodsProp2LastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsGoodsProp2id_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsGoodsProp2MeasureName: TStringField
      FieldName = 'MeasureName'
      Size = 50
    end
    object cdsGoodsProp2GTD: TStringField
      FieldName = 'GTD'
      Size = 50
    end
    object cdsGoodsProp2Country: TStringField
      FieldName = 'Country'
      Size = 255
    end
    object cdsGoodsProp2DocNomCode: TStringField
      FieldName = 'DocNomCode'
      Size = 50
    end
    object cdsGoodsProp2DocPriceCode: TStringField
      FieldName = 'DocPriceCode'
      Size = 50
    end
    object cdsGoodsProp2DocArt: TStringField
      FieldName = 'DocArt'
      Size = 50
    end
    object cdsGoodsProp2DocNumber: TStringField
      FieldName = 'DocNumber'
      Size = 50
    end
  end
  object cdsMeasures: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'id_Business'
        ParamType = ptUnknown
        Value = '-1'
      end
      item
        DataType = ftInteger
        Name = 'id_Base'
        ParamType = ptUnknown
      end>
    ProviderName = 'dsMeasures'
    RemoteServer = DM.rsCA
    Left = 80
    Top = 216
    object cdsMeasuresid_Measure: TAutoIncField
      FieldName = 'id_Measure'
      ReadOnly = True
    end
    object cdsMeasuresid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsMeasuresName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object cdsMeasuresShortName: TStringField
      FieldName = 'ShortName'
      Size = 10
    end
    object cdsMeasuresid_BaseMeasure: TIntegerField
      FieldName = 'id_BaseMeasure'
    end
    object cdsMeasuresKoef: TFloatField
      FieldName = 'Koef'
    end
    object cdsMeasuresDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsMeasuresLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsMeasuresID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object cdsMeasuresOKEI: TStringField
      FieldName = 'OKEI'
      Size = 50
    end
  end
end
