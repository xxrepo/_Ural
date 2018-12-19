object ClImport: TClImport
  Left = 0
  Top = 41
  Width = 1360
  Height = 656
  Caption = 'Импорт клиентов СБ-АСТ'
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
    Top = 40
    Width = 1344
    Height = 577
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
        FieldName = 'ReprName'
        Title.Caption = 'Организация'
        Width = 309
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INN'
        Title.Caption = 'ИНН организации'
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Title.Caption = 'EMail организации'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Phone1'
        Title.Caption = 'Служебный тел. №1'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Phone2'
        Title.Caption = 'Служебный тел. №2'
        Width = 139
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1344
    Height = 40
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Button1: TButton
      Left = 392
      Top = 8
      Width = 150
      Height = 25
      Caption = 'Прочитать из файла'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 560
      Top = 8
      Width = 150
      Height = 25
      Caption = 'Загрузить в базу'
      Enabled = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object FilenameEdit1: TFilenameEdit
      Left = 11
      Top = 10
      Width = 342
      Height = 21
      DefaultExt = 'ads'
      Filter = 'Файлы Excel (*.xls*)|*.xls*|Все файлы|*.*'
      DialogTitle = 'Файл для импорта'
      NumGlyphs = 1
      TabOrder = 2
    end
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ReprName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'INN'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'email'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Phone1'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Phone2'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'isEx'
        DataType = ftInteger
      end>
    Left = 248
    Top = 176
    object RxMemoryData1ReprName: TStringField
      FieldName = 'ReprName'
      Size = 255
    end
    object RxMemoryData1INN: TStringField
      FieldName = 'INN'
      Size = 255
    end
    object RxMemoryData1email: TStringField
      FieldName = 'email'
      Size = 255
    end
    object RxMemoryData1Phone1: TStringField
      FieldName = 'Phone1'
      Size = 255
    end
    object RxMemoryData1Phone2: TStringField
      FieldName = 'Phone2'
      Size = 255
    end
    object RxMemoryData1isEx: TIntegerField
      FieldName = 'isEx'
    end
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 112
    Top = 168
  end
end
