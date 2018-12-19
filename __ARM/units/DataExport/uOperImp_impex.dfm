object OperImp_impex: TOperImp_impex
  Left = 127
  Top = 163
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Импорт операций'
  ClientHeight = 461
  ClientWidth = 1078
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 893
    Top = 0
    Width = 185
    Height = 281
    Align = alRight
    Caption = 'Номера операций'
    TabOrder = 0
    object Memo2: TMemo
      Left = 2
      Top = 15
      Width = 181
      Height = 264
      Align = alClient
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 893
    Height = 281
    Align = alClient
    Caption = ' '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 67
      Width = 29
      Height = 13
      Caption = 'Файл'
    end
    object lbRecordCount: TLabel
      Left = 96
      Top = 91
      Width = 71
      Height = 13
      Caption = 'lbRecordCount'
    end
    inline fBsnSelector1: TfBsnSelector
      Width = 361
      Height = 29
      inherited edName: TEdit
        Left = 67
        Width = 258
      end
      inherited Button1: TButton
        Left = 330
        OnClick = fBsnSelector1Button1Click
      end
    end
    object FilenameEdit1: TFilenameEdit
      Left = 75
      Top = 64
      Width = 280
      Height = 21
      DefaultExt = 'ads'
      Filter = 'Файлы HTML (*.htm*)|*.htm*|Файлы XML (*.xml)|*.xml|Все файлы|*.*'
      DialogTitle = 'Файл для импорта'
      NumGlyphs = 1
      TabOrder = 1
    end
    object Button1: TButton
      Left = 56
      Top = 112
      Width = 297
      Height = 25
      Caption = 'Импортировать'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 56
      Top = 144
      Width = 297
      Height = 25
      Caption = 'Выход'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object RxDBGrid1: TDBGridEh
    Left = 0
    Top = 281
    Width = 1078
    Height = 180
    Align = alBottom
    DataGrouping.GroupLevels = <>
    DataSource = DataSource1
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    ReadOnly = True
    RowDetailPanel.Color = clBtnFace
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'OperDate'
        Footers = <>
        Title.Caption = 'Дата операции'
      end
      item
        EditButtons = <>
        FieldName = 'Summ'
        Footers = <>
        Title.Caption = 'Сумма'
      end
      item
        EditButtons = <>
        FieldName = 'Narr'
        Footers = <>
        Title.Caption = 'Основание'
        Width = 332
      end
      item
        EditButtons = <>
        FieldName = 'ReprName'
        Footers = <>
        Title.Caption = 'Контрагент'
        Width = 195
      end
      item
        EditButtons = <>
        FieldName = 'OperType'
        Footers = <>
        Title.Caption = 'Тип'
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'Acc'
        Footers = <>
        Title.Caption = 'Счет'
        Width = 127
      end
      item
        EditButtons = <>
        FieldName = 'OperNum'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'OperNum2'
        Footers = <>
        Width = 100
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object cdsExp2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsExp'
    Left = 312
    Top = 206
  end
  object dsExp: TDataSetProvider
    DataSet = cdsExp
    Constraints = True
    Left = 264
    Top = 198
  end
  object cdsExp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'OperDate'
        DataType = ftDateTime
      end
      item
        Name = 'Summ'
        DataType = ftFloat
      end
      item
        Name = 'Narr'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'ReprName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'OperType'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'OperNum'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Acc'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'OperNum2'
        DataType = ftString
        Size = 255
      end>
    BeforePost = cdsExpBeforePost
    Left = 224
    Top = 30
    object cdsExpOperDate: TDateTimeField
      FieldName = 'OperDate'
    end
    object cdsExpSumm: TFloatField
      FieldName = 'Summ'
    end
    object cdsExpNarr: TStringField
      FieldName = 'Narr'
      Size = 1000
    end
    object cdsExpReprName: TStringField
      FieldName = 'ReprName'
      Size = 255
    end
    object cdsExpOperType: TStringField
      FieldName = 'OperType'
      Size = 255
    end
    object cdsExpOperNum: TStringField
      FieldName = 'OperNum'
      Size = 255
    end
    object cdsExpAcc: TStringField
      FieldName = 'Acc'
      Size = 255
    end
    object cdsExpOperNum2: TStringField
      FieldName = 'OperNum2'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsExp
    Left = 184
    Top = 208
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'adr'
    Filter = 'Файлы отчета системы учета (*.adr)|*.adr|Все файлы|*.*'
    InitialDir = 'c:\'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 392
    Top = 88
  end
  object cdsExtDataDict: TClientDataSet
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
    ProviderName = 'dsExtDataDict'
    RemoteServer = DM.rsCA
    Left = 448
    Top = 38
    object cdsExtDataDictid_Oper_ExtDataNames: TIntegerField
      FieldName = 'id_Oper_ExtDataNames'
    end
    object cdsExtDataDictid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsExtDataDictType: TIntegerField
      FieldName = 'Type'
    end
    object cdsExtDataDictNumPrm: TIntegerField
      FieldName = 'NumPrm'
    end
    object cdsExtDataDictParName: TStringField
      FieldName = 'ParName'
      Size = 100
    end
    object cdsExtDataDictVisible: TBooleanField
      FieldName = 'Visible'
    end
  end
  object cdsCur: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftBoolean
        Name = '@FastAccess'
        ParamType = ptInput
        Value = False
      end
      item
        DataType = ftBoolean
        Name = '@AvForPay'
        ParamType = ptInput
        Value = False
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsCur2'
    RemoteServer = DM.rsCA
    Left = 24
    Top = 80
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
      DisplayFormat = '0.0000'
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
end
