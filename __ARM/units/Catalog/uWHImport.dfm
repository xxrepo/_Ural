object WHImport: TWHImport
  Left = 192
  Top = 107
  Width = 1371
  Height = 656
  Caption = 'Импорт складских остатков'
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
    Width = 1363
    Height = 556
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
        FieldName = 'WHName'
        Title.Caption = 'Склад'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CatName'
        Title.Caption = 'Категория'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WareName'
        Title.Caption = 'Название'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WareShortName'
        Title.Caption = 'Короткое название'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WareCode'
        Title.Caption = 'Код'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MesName'
        Title.Caption = 'Ед. измерения'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount'
        Title.Caption = 'Остаток'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summ'
        Title.Caption = 'Сумма'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cmnt'
        Title.Caption = 'Комментарий'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_Ware'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_WareHouse'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_Mes'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OldAmount'
        Width = 50
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1363
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
        Name = 'WHName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CatName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'WareName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'WareShortName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'WareCode'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'MesName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Amount'
        DataType = ftFloat
      end
      item
        Name = 'Summ'
        DataType = ftFloat
      end
      item
        Name = 'id_Ware'
        DataType = ftInteger
      end
      item
        Name = 'id_Cat'
        DataType = ftInteger
      end
      item
        Name = 'id_WareHouse'
        DataType = ftInteger
      end
      item
        Name = 'Cmnt'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'id_Mes'
        DataType = ftInteger
      end
      item
        Name = 'OldAmount'
        DataType = ftInteger
      end>
    Left = 248
    Top = 176
    object RxMemoryData1WHName: TStringField
      FieldName = 'WHName'
      Size = 255
    end
    object RxMemoryData1CatName: TStringField
      FieldName = 'CatName'
      Size = 255
    end
    object RxMemoryData1WareName: TStringField
      FieldName = 'WareName'
      Size = 255
    end
    object RxMemoryData1WareShortName: TStringField
      FieldName = 'WareShortName'
      Size = 255
    end
    object RxMemoryData1WareCode: TStringField
      FieldName = 'WareCode'
      Size = 255
    end
    object RxMemoryData1MesName: TStringField
      FieldName = 'MesName'
      Size = 255
    end
    object RxMemoryData1Amount: TFloatField
      FieldName = 'Amount'
    end
    object RxMemoryData1Summ: TFloatField
      FieldName = 'Summ'
    end
    object RxMemoryData1id_Ware: TIntegerField
      Tag = -1
      FieldName = 'id_Ware'
    end
    object RxMemoryData1id_Cat: TIntegerField
      Tag = -1
      FieldName = 'id_Cat'
    end
    object RxMemoryData1id_WareHouse: TIntegerField
      Tag = -1
      FieldName = 'id_WareHouse'
    end
    object RxMemoryData1Cmnt: TStringField
      Tag = -1
      FieldName = 'Cmnt'
      Size = 255
    end
    object RxMemoryData1id_Mes: TIntegerField
      Tag = -1
      FieldName = 'id_Mes'
    end
    object RxMemoryData1OldAmount: TIntegerField
      Tag = -1
      FieldName = 'OldAmount'
    end
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 112
    Top = 168
  end
end
