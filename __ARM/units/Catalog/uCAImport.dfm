object CAImport: TCAImport
  Left = 0
  Top = 41
  Width = 1360
  Height = 656
  Caption = 'Испорт остатков по контаргентам'
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
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 73
    Width = 1344
    Height = 544
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CAName'
        Title.Caption = 'Контрагент'
        Width = 309
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'S_RUB'
        Title.Caption = 'Сумма RUB'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'S_USD'
        Title.Caption = 'Сумма USD'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'S_EUR'
        Title.Caption = 'Сумма EUR'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cmnt'
        Width = 120
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1344
    Height = 73
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Button1: TButton
      Left = 392
      Top = 40
      Width = 150
      Height = 25
      Caption = 'Прочитать из файла'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 560
      Top = 40
      Width = 150
      Height = 25
      Caption = 'Загрузить в базу'
      Enabled = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object FilenameEdit1: TFilenameEdit
      Left = 11
      Top = 48
      Width = 342
      Height = 21
      DefaultExt = 'ads'
      Filter = 'Файлы Excel (*.xls*)|*.xls*|Все файлы|*.*'
      DialogTitle = 'Файл для импорта'
      NumGlyphs = 1
      TabOrder = 2
    end
    inline fBsnSelector1: TfBsnSelector
      Width = 361
      Height = 29
      TabOrder = 3
      inherited edName: TEdit
        Left = 75
        Width = 275
      end
      inherited Button1: TButton
        Left = 330
      end
    end
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <
      item
        Name = 'CAName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'S_RUB'
        DataType = ftFloat
      end
      item
        Name = 'S_USD'
        DataType = ftFloat
      end
      item
        Name = 'S_EUR'
        DataType = ftInteger
      end
      item
        Name = 'id_Repr'
        DataType = ftInteger
      end
      item
        Name = 'Cmnt'
        DataType = ftString
        Size = 255
      end>
    Left = 248
    Top = 176
    object RxMemoryData1CAName: TStringField
      FieldName = 'CAName'
      Size = 255
    end
    object RxMemoryData1S_RUB: TFloatField
      FieldName = 'S_RUB'
    end
    object RxMemoryData1S_USD: TFloatField
      FieldName = 'S_USD'
    end
    object RxMemoryData1S_EUR: TIntegerField
      FieldName = 'S_EUR'
    end
    object RxMemoryData1id_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object RxMemoryData1Cmnt: TStringField
      FieldName = 'Cmnt'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 112
    Top = 168
  end
end
