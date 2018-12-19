object BCImp: TBCImp
  Left = 55
  Top = 169
  Width = 969
  Height = 359
  Caption = 'Импорт данных из программы StoreHouse'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 28
    Width = 961
    Height = 304
    ActivePage = tsCorr
    Align = alClient
    TabOrder = 0
    object tsFile: TTabSheet
      Caption = 'Файлы'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 953
        Height = 276
        Align = alClient
        Caption = 'Файлы'
        TabOrder = 0
        object Label2: TLabel
          Left = 10
          Top = 20
          Width = 53
          Height = 13
          Caption = 'Движение'
        end
        object Label3: TLabel
          Left = 10
          Top = 55
          Width = 93
          Height = 13
          Caption = 'Марочный КАРТЫ'
        end
        object Label4: TLabel
          Left = 10
          Top = 87
          Width = 78
          Height = 13
          Caption = 'Марочный НАЛ'
        end
        object Label1: TLabel
          Left = 104
          Top = 136
          Width = 542
          Height = 24
          Caption = 'Заливка данных по продажам и внутренним перемещениям'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btnParse1: TButton
          Left = 584
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Разобрать'
          Enabled = False
          TabOrder = 0
          OnClick = btnParse1Click
        end
        object btnSave1: TButton
          Left = 672
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Загрузить'
          Enabled = False
          TabOrder = 1
          OnClick = btnSave1Click
        end
        object AdvFileNameEdit1: TAdvFileNameEdit
          Left = 112
          Top = 17
          Width = 467
          Height = 21
          Flat = False
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = True
          ReadOnly = False
          TabOrder = 2
          Visible = True
          OnChange = AdvFileNameEdit1Change
          Version = '1.3.2.8'
          ButtonStyle = bsButton
          ButtonWidth = 18
          Etched = False
          Glyph.Data = {
            CE000000424DCE0000000000000076000000280000000C0000000B0000000100
            0400000000005800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000DDD
            00000077777770DD00000F077777770D00000FF07777777000000FFF00000000
            00000FFFFFFF0DDD00000FFF00000DDD0000D000DDDDD0000000DDDDDDDDDD00
            0000DDDDD0DDD0D00000DDDDDD000DDD0000}
          Filter = 'Файлы Excel (*.xls*; *.xml)|*.xls*; *.xml|Все файлы|*.*'
          FilterIndex = 0
          DialogOptions = []
          DialogTitle = 'Движение'
          DialogKind = fdOpen
        end
        object AdvFileNameEdit3: TAdvFileNameEdit
          Left = 112
          Top = 52
          Width = 467
          Height = 21
          Flat = False
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = True
          ReadOnly = False
          TabOrder = 3
          Visible = True
          OnChange = AdvFileNameEdit3Change
          Version = '1.3.2.8'
          ButtonStyle = bsButton
          ButtonWidth = 18
          Etched = False
          Glyph.Data = {
            CE000000424DCE0000000000000076000000280000000C0000000B0000000100
            0400000000005800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000DDD
            00000077777770DD00000F077777770D00000FF07777777000000FFF00000000
            00000FFFFFFF0DDD00000FFF00000DDD0000D000DDDDD0000000DDDDDDDDDD00
            0000DDDDD0DDD0D00000DDDDDD000DDD0000}
          Filter = 'Файлы Excel (*.xls*; *.xml)|*.xls*; *.xml|Все файлы|*.*'
          FilterIndex = 0
          DialogOptions = []
          DialogTitle = 'Марочный КАРТЫ'
          DialogKind = fdOpen
        end
        object btnSave3: TButton
          Left = 672
          Top = 49
          Width = 75
          Height = 25
          Caption = 'Загрузить'
          Enabled = False
          TabOrder = 4
          OnClick = btnSave3Click
        end
        object AdvFileNameEdit4: TAdvFileNameEdit
          Left = 112
          Top = 84
          Width = 467
          Height = 21
          Flat = False
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = True
          ReadOnly = False
          TabOrder = 5
          Visible = True
          OnChange = AdvFileNameEdit3Change
          Version = '1.3.2.8'
          ButtonStyle = bsButton
          ButtonWidth = 18
          Etched = False
          Glyph.Data = {
            CE000000424DCE0000000000000076000000280000000C0000000B0000000100
            0400000000005800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000DDD
            00000077777770DD00000F077777770D00000FF07777777000000FFF00000000
            00000FFFFFFF0DDD00000FFF00000DDD0000D000DDDDD0000000DDDDDDDDDD00
            0000DDDDD0DDD0D00000DDDDDD000DDD0000}
          Filter = 'Файлы Excel (*.xls*; *.xml)|*.xls*; *.xml|Все файлы|*.*'
          FilterIndex = 0
          DialogOptions = []
          DialogTitle = 'Марочный НАЛ'
          DialogKind = fdOpen
        end
        object btnParse3: TButton
          Left = 584
          Top = 49
          Width = 75
          Height = 25
          Caption = 'Разобрать'
          TabOrder = 6
          OnClick = btnParse3Click
        end
        object btnParse4: TButton
          Left = 584
          Top = 82
          Width = 75
          Height = 25
          Caption = 'Разобрать'
          TabOrder = 7
          OnClick = btnParse4Click
        end
        object btnSave4: TButton
          Left = 672
          Top = 82
          Width = 75
          Height = 25
          Caption = 'Загрузить'
          Enabled = False
          TabOrder = 8
          OnClick = btnSave4Click
        end
        object cbMode: TCheckBox
          Left = 112
          Top = 116
          Width = 153
          Height = 17
          Caption = 'Режим сверки'
          TabOrder = 9
          Visible = False
        end
      end
    end
    object tsCorr: TTabSheet
      Caption = 'Ревизии'
      ImageIndex = 3
      object Jcnfnrb: TLabel
        Left = 10
        Top = 9
        Width = 42
        Height = 13
        Caption = 'Остатки'
      end
      object Label5: TLabel
        Left = 96
        Top = 48
        Width = 428
        Height = 24
        Caption = 'Обновление остатков по результатам ревизий'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object AdvFileNameEdit2: TAdvFileNameEdit
        Left = 64
        Top = 6
        Width = 515
        Height = 21
        Flat = False
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        Lookup.Separator = ';'
        Color = clWindow
        Enabled = True
        ReadOnly = False
        TabOrder = 0
        Visible = True
        OnChange = AdvFileNameEdit2Change
        Version = '1.3.2.8'
        ButtonStyle = bsButton
        ButtonWidth = 18
        Etched = False
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000C0000000B0000000100
          0400000000005800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000DDD
          00000077777770DD00000F077777770D00000FF07777777000000FFF00000000
          00000FFFFFFF0DDD00000FFF00000DDD0000D000DDDDD0000000DDDDDDDDDD00
          0000DDDDD0DDD0D00000DDDDDD000DDD0000}
        Filter = 'Файлы Excel (*.xls*; *.xml)|*.xls*; *.xml|Все файлы|*.*'
        FilterIndex = 0
        DialogOptions = []
        DialogTitle = 'Ревизия-остатки'
        DialogKind = fdOpen
      end
      object btnParse2: TButton
        Left = 584
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Разобрать'
        Enabled = False
        TabOrder = 1
        OnClick = btnParse2Click
      end
      object btnSave2: TButton
        Left = 672
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Загрузить'
        Enabled = False
        TabOrder = 2
        OnClick = btnSave2Click
      end
    end
    object tsData: TTabSheet
      Caption = 'Данные'
      ImageIndex = 1
      object RxDBGrid1: TDBGridEh
        Left = 0
        Top = 0
        Width = 953
        Height = 276
        Align = alClient
        ColumnDefValues.EndEllipsis = True
        DataSource = DataSource1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        PopupMenu = PopupMenu1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object tsRep: TTabSheet
      Caption = 'Отчет'
      ImageIndex = 2
      object RxDBGrid2: TDBGridEh
        Left = 0
        Top = 143
        Width = 953
        Height = 133
        Align = alClient
        DataSource = dsBCRep
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        PopupMenu = PopupMenu1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            FieldName = 'comment'
            Footers = <>
            Title.Caption = 'Событие'
            Width = 120
          end
          item
            FieldName = 'WHName'
            Footers = <>
            Title.Caption = 'Склад'
            Width = 175
          end
          item
            FieldName = 'GoodsName'
            Footers = <>
            Title.Caption = 'Товар'
            Width = 199
          end
          item
            FieldName = 'TotalAmount'
            Footers = <>
            Title.Caption = 'Кол-во'
            Width = 80
          end
          item
            FieldName = 'Name'
            Footers = <>
            Title.Caption = 'Ед. изм'
            Width = 50
          end
          item
            FieldName = 'TotalSum'
            Footers = <>
            Title.Caption = 'Сумма'
            Width = 149
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 113
        Width = 953
        Height = 30
        Align = alTop
        Caption = ' '
        TabOrder = 1
        object lbRep: TLabel
          Left = 8
          Top = 8
          Width = 28
          Height = 13
          Caption = 'lbRep'
        end
      end
      object RxDBGrid3: TDBGridEh
        Left = 0
        Top = 0
        Width = 953
        Height = 113
        Align = alTop
        DataSource = dsSelRep
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        PopupMenu = PopupMenu1
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            FieldName = 'WHName'
            Footers = <>
            Title.Caption = 'Склад'
            Width = 175
          end
          item
            FieldName = 'TotalAmount'
            Footers = <>
            Title.Caption = 'Кол-во|В базе'
            Width = 99
          end
          item
            FieldName = 'AmountFile'
            Footers = <>
            Title.Caption = 'Кол-во|В файле'
          end
          item
            FieldName = 'Delta_A'
            Footers = <>
            Title.Caption = 'Кол-во|Разность'
            Width = 80
          end
          item
            FieldName = 'TotalSum'
            Footers = <>
            Title.Caption = 'Сумма|В базе'
            Width = 149
          end
          item
            FieldName = 'TotalFile'
            Footers = <>
            Title.Caption = 'Сумма|В файле'
          end
          item
            FieldName = 'Delta_S'
            Footers = <>
            Title.Caption = 'Сумма|Разность'
            Width = 80
          end>
      end
    end
  end
  inline fBsnSelector1: TfBsnSelector
    Width = 961
    Height = 28
    Align = alTop
    TabOrder = 1
    inherited edName: TEdit
      Width = 257
    end
    inherited Button1: TButton
      Left = 311
      Width = 21
    end
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <>
    Left = 608
    Top = 112
  end
  object FormStorage1: TFormStorage
    Options = [fpState]
    StoredProps.Strings = (
      'AdvFileNameEdit1.FileName'
      'AdvFileNameEdit2.FileName'
      'AdvFileNameEdit3.FileName'
      'AdvFileNameEdit4.FileName')
    StoredValues = <>
    Left = 396
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 532
    Top = 80
  end
  object PopupMenu1: TPopupMenu
    Left = 212
    Top = 48
    object Excel1: TMenuItem
      Caption = 'в Excel'
      OnClick = Excel1Click
    end
  end
  object cdsBCRep: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Session'
        ParamType = ptInput
        Value = '149'
      end>
    ProviderName = 'dspBCRep'
    RemoteServer = DM.rsCA
    Left = 504
    Top = 152
    object cdsBCRepid_WareHouse: TIntegerField
      FieldName = 'id_WareHouse'
    end
    object cdsBCRepid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsBCRepTotalAmount: TBCDField
      FieldName = 'TotalAmount'
      DisplayFormat = '### ##0.00'
      Precision = 19
    end
    object cdsBCRepTotalSum: TBCDField
      FieldName = 'TotalSum'
      DisplayFormat = '### ##0.00'
      Precision = 19
    end
    object cdsBCRepid_Session: TIntegerField
      FieldName = 'id_Session'
    end
    object cdsBCRepcomment: TStringField
      FieldName = 'comment'
      Size = 255
    end
    object cdsBCRepeventType: TIntegerField
      FieldName = 'eventType'
    end
    object cdsBCRepWHName: TStringField
      FieldName = 'WHName'
      Size = 50
    end
    object cdsBCRepGoodsName: TStringField
      FieldName = 'GoodsName'
      Size = 255
    end
    object cdsBCRepName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object dsBCRep: TDataSource
    DataSet = cdsBCRep
    Left = 540
    Top = 160
  end
  object cdsSelRep: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Session'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Mode'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@WH1_Amount'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@WH1_Summ'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@WH2_Amount'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@WH2_Summ'
        ParamType = ptInput
      end>
    ProviderName = 'dsSelRep'
    RemoteServer = DM.rsCA
    OnCalcFields = cdsSelRepCalcFields
    Left = 504
    Top = 184
    object cdsSelRepWHName: TStringField
      FieldName = 'WHName'
      Size = 255
    end
    object cdsSelRepTotalAmount: TBCDField
      FieldName = 'TotalAmount'
      DisplayFormat = '### ##0.00'
      Precision = 19
    end
    object cdsSelRepTotalSum: TBCDField
      FieldName = 'TotalSum'
      DisplayFormat = '### ##0.00'
      Precision = 19
    end
    object cdsSelRepAmountFile: TBCDField
      FieldName = 'AmountFile'
      DisplayFormat = '### ##0.00'
      Precision = 19
    end
    object cdsSelRepTotalFile: TBCDField
      FieldName = 'TotalFile'
      DisplayFormat = '### ##0.00'
      Precision = 19
    end
    object cdsSelRepDelta_A: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'Delta_A'
      DisplayFormat = '### ##0.00'
    end
    object cdsSelRepDelta_S: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'Delta_S'
      DisplayFormat = '### ##0.00'
    end
  end
  object dsSelRep: TDataSource
    DataSet = cdsSelRep
    Left = 540
    Top = 192
  end
end
