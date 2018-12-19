object fArcSumm: TfArcSumm
  Left = 0
  Top = 0
  Width = 796
  Height = 393
  TabOrder = 0
  object PageControl1: TPageControl
    Left = 0
    Top = 137
    Width = 796
    Height = 256
    ActivePage = TabSheet6
    Align = alBottom
    TabOrder = 0
    object TabSheet6: TTabSheet
      Caption = 'Итоги'
      ImageIndex = 5
      object RxDBGrid8: TRxDBGrid
        Left = 0
        Top = 0
        Width = 788
        Height = 228
        Align = alClient
        DataSource = dsTotalSum
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleButtons = True
        OnGetCellParams = RxDBGrid2GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'Sum'
            Title.Caption = 'Сумма'
            Width = 377
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CurrencyName'
            Title.Caption = 'Валюта'
            Width = 145
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TotalName'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TotalNum'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'isTotal'
            Visible = False
          end>
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Финансы'
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 788
        Height = 365
        Align = alClient
        DataSource = dsFinSum
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleButtons = True
        OnGetCellParams = RxDBGrid2GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'Sum'
            Title.Caption = 'Сумма'
            Width = 377
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CurrencyName'
            Title.Caption = 'Валюта'
            Width = 145
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TotalName'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TotalNum'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'isTotal'
            Visible = False
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Склад'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 192
        Width = 788
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 195
        Width = 788
        Height = 33
        Align = alClient
        Caption = 'Количества'
        TabOrder = 0
        object RxDBGrid3: TRxDBGrid
          Left = 2
          Top = 15
          Width = 784
          Height = 16
          Align = alClient
          DataSource = dsWHAmount
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleButtons = True
          Columns = <
            item
              Expanded = False
              FieldName = 'WareName'
              Title.Caption = 'Наименование'
              Width = 309
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Amount'
              Title.Caption = 'Количество'
              Width = 136
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MeasureName'
              Title.Caption = 'Единица измерения'
              Width = 159
              Visible = True
            end>
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 788
        Height = 192
        Align = alTop
        Caption = 'Суммы'
        TabOrder = 1
        object RxDBGrid2: TRxDBGrid
          Left = 2
          Top = 15
          Width = 784
          Height = 175
          Align = alClient
          DataSource = dsWHSum
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleButtons = True
          OnGetCellParams = RxDBGrid2GetCellParams
          Columns = <
            item
              Expanded = False
              FieldName = 'Sum'
              Title.Caption = 'Сумма'
              Width = 377
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CurrencyName'
              Title.Caption = 'Валюта'
              Width = 145
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TotalName'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TotalNum'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'isTotal'
              Visible = False
            end>
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Услуги'
      ImageIndex = 2
      object Splitter2: TSplitter
        Left = 0
        Top = 151
        Width = 788
        Height = 6
        Cursor = crVSplit
        Align = alTop
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 788
        Height = 151
        Align = alTop
        Caption = 'Суммы'
        TabOrder = 0
        object RxDBGrid4: TRxDBGrid
          Left = 2
          Top = 15
          Width = 784
          Height = 134
          Align = alClient
          DataSource = dsSvcSum
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleButtons = True
          OnGetCellParams = RxDBGrid2GetCellParams
          Columns = <
            item
              Expanded = False
              FieldName = 'Sum'
              Title.Caption = 'Сумма'
              Width = 377
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CurrencyName'
              Title.Caption = 'Валюта'
              Width = 145
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TotalName'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TotalNum'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'isTotal'
              Visible = False
            end>
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 157
        Width = 788
        Height = 208
        Align = alClient
        Caption = 'Количества'
        TabOrder = 1
        object RxDBGrid5: TRxDBGrid
          Left = 2
          Top = 15
          Width = 784
          Height = 191
          Align = alClient
          DataSource = dsSvcAmount
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleButtons = True
          Columns = <
            item
              Expanded = False
              FieldName = 'WareName'
              Title.Caption = 'Наименование'
              Width = 379
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Amount'
              Title.Caption = 'Количество'
              Width = 94
              Visible = True
            end>
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Взаимозачеты'
      ImageIndex = 3
      object RxDBGrid6: TRxDBGrid
        Left = 0
        Top = 0
        Width = 788
        Height = 365
        Align = alClient
        DataSource = dsOfferSum
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleButtons = True
        OnGetCellParams = RxDBGrid2GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'Sum'
            Title.Caption = 'Сумма'
            Width = 377
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CurrencyName'
            Title.Caption = 'Валюта'
            Width = 145
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TotalName'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TotalNum'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'isTotal'
            Visible = False
          end>
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Курсовые изменения'
      ImageIndex = 4
      object RxDBGrid7: TRxDBGrid
        Left = 0
        Top = 0
        Width = 788
        Height = 365
        Align = alClient
        DataSource = dsRateCHSum
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleButtons = True
        OnGetCellParams = RxDBGrid2GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'Sum'
            Title.Caption = 'Сумма'
            Width = 377
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CurrencyName'
            Title.Caption = 'Валюта'
            Width = 145
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TotalName'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TotalNum'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'isTotal'
            Visible = False
          end>
      end
    end
  end
  object RxDBGrid9: TRxDBGrid
    Left = 0
    Top = 0
    Width = 796
    Height = 137
    Align = alClient
    DataSource = dsSumm
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleButtons = True
    Columns = <
      item
        Expanded = False
        FieldName = 'AFName'
        Title.Caption = 'Столбец'
        Width = 369
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ASumm'
        Title.Caption = 'Сумма'
        Visible = True
      end>
  end
  object dsTotalSum: TDataSource
    DataSet = cdsTotalSum
    Left = 156
    Top = 184
  end
  object cdsWHAmount: TRxMemoryData
    FieldDefs = <
      item
        Name = 'isTotal'
        DataType = ftBoolean
      end
      item
        Name = 'isIn'
        DataType = ftBoolean
      end
      item
        Name = 'id_Goods'
        DataType = ftInteger
      end
      item
        Name = 'id_Raw'
        DataType = ftInteger
      end
      item
        Name = 'id_ExtRaw'
        DataType = ftInteger
      end
      item
        Name = 'id_Service'
        DataType = ftInteger
      end
      item
        Name = 'WareName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Amount'
        DataType = ftFloat
      end
      item
        Name = 'id_Measure'
        DataType = ftInteger
      end
      item
        Name = 'MeasureName'
        DataType = ftString
        Size = 20
      end>
    Left = 132
    Top = 96
    object cdsWHAmountisTotal: TBooleanField
      FieldName = 'isTotal'
    end
    object cdsWHAmountisIn: TBooleanField
      FieldName = 'isIn'
    end
    object cdsWHAmountid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsWHAmountid_Raw: TIntegerField
      FieldName = 'id_Raw'
    end
    object cdsWHAmountid_ExtRaw: TIntegerField
      FieldName = 'id_ExtRaw'
    end
    object cdsWHAmountid_Service: TIntegerField
      FieldName = 'id_Service'
    end
    object cdsWHAmountWareName: TStringField
      FieldName = 'WareName'
      Size = 255
    end
    object cdsWHAmountAmount: TFloatField
      FieldName = 'Amount'
    end
    object cdsWHAmountid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsWHAmountMeasureName: TStringField
      FieldName = 'MeasureName'
    end
  end
  object dsWHAmount: TDataSource
    DataSet = cdsWHAmount
    Left = 172
    Top = 96
  end
  object rxWHSum: TRxMemoryData
    FieldDefs = <
      item
        Name = 'id_Currency'
        DataType = ftInteger
      end
      item
        Name = 'Sum'
        DataType = ftFloat
      end
      item
        Name = 'CurrencyName'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'isTotal'
        DataType = ftBoolean
      end
      item
        Name = 'TotalNum'
        DataType = ftInteger
      end
      item
        Name = 'TotalName'
        DataType = ftString
        Size = 50
      end>
    Left = 84
    Top = 48
  end
  object dsWHSum: TDataSource
    DataSet = cdsWHSum
    Left = 204
    Top = 48
  end
  object dsSvcSum: TDataSource
    DataSet = cdsSvcSum
    Left = 388
    Top = 48
  end
  object cdsSvcAmount: TRxMemoryData
    FieldDefs = <
      item
        Name = 'isTotal'
        DataType = ftBoolean
      end
      item
        Name = 'isIn'
        DataType = ftBoolean
      end
      item
        Name = 'id_Service'
        DataType = ftInteger
      end
      item
        Name = 'WareName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Amount'
        DataType = ftFloat
      end>
    Left = 244
    Top = 96
    object cdsSvcAmountisTotal: TBooleanField
      FieldName = 'isTotal'
    end
    object cdsSvcAmountisIn: TBooleanField
      FieldName = 'isIn'
    end
    object cdsSvcAmountid_Service: TIntegerField
      FieldName = 'id_Service'
    end
    object cdsSvcAmountWareName: TStringField
      FieldName = 'WareName'
      Size = 255
    end
    object cdsSvcAmountAmount: TFloatField
      FieldName = 'Amount'
    end
  end
  object dsSvcAmount: TDataSource
    DataSet = cdsSvcAmount
    Left = 284
    Top = 96
  end
  object dsOfferSum: TDataSource
    DataSet = cdsOfferSum
    Left = 548
    Top = 48
  end
  object dsRateCHSum: TDataSource
    DataSet = cdsRateCHSum
    Left = 716
    Top = 160
  end
  object cdsWHSum: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspWHSum'
    Left = 164
    Top = 48
    object cdsWHSumid_Currency: TIntegerField
      FieldName = 'id_Currency'
    end
    object cdsWHSumSum: TFloatField
      FieldName = 'Sum'
      OnGetText = cdsWHSumSumGetText
    end
    object cdsWHSumCurrencyName: TStringField
      FieldName = 'CurrencyName'
      OnGetText = cdsWHSumCurrencyNameGetText
    end
    object cdsWHSumisTotal: TBooleanField
      FieldName = 'isTotal'
    end
    object cdsWHSumTotalNum: TIntegerField
      FieldName = 'TotalNum'
    end
    object cdsWHSumTotalName: TStringField
      FieldName = 'TotalName'
      Size = 50
    end
  end
  object dspWHSum: TDataSetProvider
    DataSet = rxWHSum
    Constraints = True
    Left = 124
    Top = 48
  end
  object rxSvcSum: TRxMemoryData
    FieldDefs = <
      item
        Name = 'id_Currency'
        DataType = ftInteger
      end
      item
        Name = 'Sum'
        DataType = ftFloat
      end
      item
        Name = 'CurrencyName'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'isTotal'
        DataType = ftBoolean
      end
      item
        Name = 'TotalNum'
        DataType = ftInteger
      end
      item
        Name = 'TotalName'
        DataType = ftString
        Size = 50
      end>
    Left = 292
    Top = 48
  end
  object dspSvcSum: TDataSetProvider
    DataSet = rxSvcSum
    Constraints = True
    Left = 324
    Top = 48
  end
  object cdsSvcSum: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSvcSum'
    Left = 356
    Top = 48
    object cdsSvcSumid_Currency: TIntegerField
      FieldName = 'id_Currency'
    end
    object cdsSvcSumSum: TFloatField
      FieldName = 'Sum'
      OnGetText = cdsWHSumSumGetText
    end
    object cdsSvcSumCurrencyName: TStringField
      FieldName = 'CurrencyName'
      OnGetText = cdsWHSumCurrencyNameGetText
    end
    object cdsSvcSumisTotal: TBooleanField
      FieldName = 'isTotal'
    end
    object cdsSvcSumTotalNum: TIntegerField
      FieldName = 'TotalNum'
    end
    object cdsSvcSumTotalName: TStringField
      FieldName = 'TotalName'
      Size = 50
    end
  end
  object rxFinSum: TRxMemoryData
    FieldDefs = <
      item
        Name = 'id_Currency'
        DataType = ftInteger
      end
      item
        Name = 'Sum'
        DataType = ftFloat
      end
      item
        Name = 'CurrencyName'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'isTotal'
        DataType = ftBoolean
      end
      item
        Name = 'TotalNum'
        DataType = ftInteger
      end
      item
        Name = 'TotalName'
        DataType = ftString
        Size = 50
      end>
    Left = 44
    Top = 224
  end
  object dspFinSum: TDataSetProvider
    DataSet = rxFinSum
    Constraints = True
    Left = 84
    Top = 224
  end
  object cdsFinSum: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspWHSum'
    Left = 124
    Top = 224
    object cdsFinSumid_Currency: TIntegerField
      FieldName = 'id_Currency'
    end
    object cdsFinSumSum: TFloatField
      FieldName = 'Sum'
      OnGetText = cdsWHSumSumGetText
    end
    object cdsFinSumCurrencyName: TStringField
      FieldName = 'CurrencyName'
      OnGetText = cdsWHSumCurrencyNameGetText
    end
    object cdsFinSumisTotal: TBooleanField
      FieldName = 'isTotal'
    end
    object cdsFinSumTotalNum: TIntegerField
      FieldName = 'TotalNum'
    end
    object cdsFinSumTotalName: TStringField
      FieldName = 'TotalName'
      Size = 50
    end
  end
  object rxOfferSum: TRxMemoryData
    FieldDefs = <
      item
        Name = 'id_Currency'
        DataType = ftInteger
      end
      item
        Name = 'Sum'
        DataType = ftFloat
      end
      item
        Name = 'CurrencyName'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'isTotal'
        DataType = ftBoolean
      end
      item
        Name = 'TotalNum'
        DataType = ftInteger
      end
      item
        Name = 'TotalName'
        DataType = ftString
        Size = 50
      end>
    Left = 452
    Top = 48
  end
  object dspOfferSum: TDataSetProvider
    DataSet = rxOfferSum
    Constraints = True
    Left = 484
    Top = 48
  end
  object cdsOfferSum: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOfferSum'
    Left = 516
    Top = 48
    object cdsOfferSumid_Currency: TIntegerField
      FieldName = 'id_Currency'
    end
    object cdsOfferSumSum: TFloatField
      FieldName = 'Sum'
      OnGetText = cdsWHSumSumGetText
    end
    object cdsOfferSumCurrencyName: TStringField
      FieldName = 'CurrencyName'
      OnGetText = cdsWHSumCurrencyNameGetText
    end
    object cdsOfferSumisTotal: TBooleanField
      FieldName = 'isTotal'
    end
    object cdsOfferSumTotalNum: TIntegerField
      FieldName = 'TotalNum'
    end
    object cdsOfferSumTotalName: TStringField
      FieldName = 'TotalName'
      Size = 50
    end
  end
  object rxRateCHSum: TRxMemoryData
    FieldDefs = <
      item
        Name = 'id_Currency'
        DataType = ftInteger
      end
      item
        Name = 'Sum'
        DataType = ftFloat
      end
      item
        Name = 'CurrencyName'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'isTotal'
        DataType = ftBoolean
      end
      item
        Name = 'TotalNum'
        DataType = ftInteger
      end
      item
        Name = 'TotalName'
        DataType = ftString
        Size = 50
      end>
    Left = 612
    Top = 160
  end
  object dspRateCHSum: TDataSetProvider
    DataSet = rxRateCHSum
    Constraints = True
    Left = 644
    Top = 160
  end
  object cdsRateCHSum: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOfferSum'
    Left = 676
    Top = 160
    object IntegerField1: TIntegerField
      FieldName = 'id_Currency'
    end
    object FloatField1: TFloatField
      FieldName = 'Sum'
      OnGetText = cdsWHSumSumGetText
    end
    object StringField1: TStringField
      FieldName = 'CurrencyName'
      OnGetText = cdsWHSumCurrencyNameGetText
    end
    object BooleanField1: TBooleanField
      FieldName = 'isTotal'
    end
    object IntegerField2: TIntegerField
      FieldName = 'TotalNum'
    end
    object StringField2: TStringField
      FieldName = 'TotalName'
      Size = 50
    end
  end
  object PopupMenu2: TPopupMenu
    Images = ImageList1
    OnPopup = PopupMenu2Popup
    Left = 348
    Top = 240
    object miExport: TMenuItem
      Caption = 'Экспортировать в Excel'
      ImageIndex = 0
      OnClick = miExportClick
    end
  end
  object ImageList1: TImageList
    Left = 300
    Top = 200
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808000008080000080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      800080808000808080008080800080808000808080000000000080800000FFFF
      0000FFFF0000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00008080
      0000808000008080000080800000808000000000000080800000FFFF0000FFFF
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00008080000080800000808000000000000080800000FFFF0000FFFF0000FFFF
      FF00000000008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000808000000000000080800000FFFF0000FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080800000FFFF0000FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080800000FFFF0000FFFF0000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080800000FFFF0000FFFF0000FFFFFF000000000080800000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000FFFF0000FFFF0000FFFFFF0000000000FFFF000080800000808000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080800000FFFF
      0000FFFF0000FFFFFF00000000000000000000000000FFFF0000808000008080
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFE0000000000000
      000000000000000000010000000000008003000000000000C001000000000000
      E001000000000000F01F000000000000F01F000000000000E00F000000000000
      C0070000000000008103000000000000038100000000000007C1000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object cdsTotalSum: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspWHSum'
    Left = 124
    Top = 184
    object IntegerField3: TIntegerField
      FieldName = 'id_Currency'
    end
    object FloatField2: TFloatField
      FieldName = 'Sum'
      OnGetText = cdsWHSumSumGetText
    end
    object StringField3: TStringField
      FieldName = 'CurrencyName'
      OnGetText = cdsWHSumCurrencyNameGetText
    end
    object BooleanField2: TBooleanField
      FieldName = 'isTotal'
    end
    object IntegerField4: TIntegerField
      FieldName = 'TotalNum'
    end
    object StringField4: TStringField
      FieldName = 'TotalName'
      Size = 50
    end
  end
  object dspTotalSum: TDataSetProvider
    DataSet = rxTotalSum
    Constraints = True
    Left = 84
    Top = 184
  end
  object rxTotalSum: TRxMemoryData
    FieldDefs = <
      item
        Name = 'id_Currency'
        DataType = ftInteger
      end
      item
        Name = 'Sum'
        DataType = ftFloat
      end
      item
        Name = 'CurrencyName'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'isTotal'
        DataType = ftBoolean
      end
      item
        Name = 'TotalNum'
        DataType = ftInteger
      end
      item
        Name = 'TotalName'
        DataType = ftString
        Size = 50
      end>
    Left = 44
    Top = 184
  end
  object dsFinSum: TDataSource
    DataSet = cdsFinSum
    Left = 156
    Top = 232
  end
  object cdsSumm: TRxMemoryData
    FieldDefs = <
      item
        Name = 'AFName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ASumm'
        DataType = ftFloat
      end>
    Left = 132
    Top = 132
    object cdsSummAFName: TStringField
      FieldName = 'AFName'
      Size = 255
    end
    object cdsSummASumm: TFloatField
      FieldName = 'ASumm'
      OnGetText = cdsSummASummGetText
      DisplayFormat = '0'
    end
  end
  object dsSumm: TDataSource
    DataSet = cdsSumm
    Left = 172
    Top = 132
  end
end
