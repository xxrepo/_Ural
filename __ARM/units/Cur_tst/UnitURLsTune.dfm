object FormURLsTune: TFormURLsTune
  Left = 221
  Top = 265
  Width = 544
  Height = 375
  Caption = 'Перечень URL'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 536
    Height = 27
    AutoSize = True
    ButtonHeight = 25
    ButtonWidth = 35
    Caption = 'ToolBar1'
    Flat = True
    Images = MainForm.ImageList2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = New
    end
    object ToolButton2: TToolButton
      Left = 35
      Top = 0
      Action = Edit
    end
    object ToolButton3: TToolButton
      Left = 70
      Top = 0
      Action = Del
    end
    object ToolButton4: TToolButton
      Left = 105
      Top = 0
      Width = 24
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 129
      Top = 0
      Action = Refresh
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 27
    Width = 536
    Height = 321
    Align = alClient
    DataSource = DataSourceURLs
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Microsoft Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    TitleButtons = True
    OnGetBtnParams = RxDBGrid1GetBtnParams
    OnTitleBtnClick = RxDBGrid1TitleBtnClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Наименование'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'URL'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UseTable'
        Title.Caption = 'Номер т-цы'
        Visible = True
      end>
  end
  object ActionList1: TActionList
    Left = 8
    Top = 64
    object New: TAction
      Caption = 'Новый'
      ImageIndex = 0
      OnExecute = NewExecute
    end
    object Edit: TAction
      Caption = 'Редактировать / настроить'
      ImageIndex = 1
      OnExecute = EditExecute
    end
    object Del: TAction
      Caption = 'Удалить'
      ImageIndex = 2
      OnExecute = DelExecute
    end
    object Refresh: TAction
      Caption = 'Обновить'
      Hint = 'Обновить'
      ImageIndex = 3
      OnExecute = RefreshExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 40
    Top = 64
    object Action11: TMenuItem
      Action = New
    end
    object N1: TMenuItem
      Action = Edit
    end
    object DelUser1: TMenuItem
      Action = Del
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Action = Refresh
    end
  end
  object DataSourceURLs: TDataSource
    DataSet = CDSURLs
    Left = 104
    Top = 96
  end
  object QueryURLs: TADOQuery
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Crn_URL (NOLOCK)')
    Left = 8
    Top = 96
  end
  object CDSURLs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'SQLUpdateDSPURLs'
    AfterOpen = CDSURLsAfterRefresh
    AfterRefresh = CDSURLsAfterRefresh
    Left = 72
    Top = 96
    object CDSURLsId_URL: TAutoIncField
      FieldName = 'Id_URL'
      ReadOnly = True
    end
    object CDSURLsName: TStringField
      FieldName = 'Name'
    end
    object CDSURLsURL: TStringField
      FieldName = 'URL'
      Size = 255
    end
    object CDSURLsUseTable: TSmallintField
      FieldName = 'UseTable'
    end
  end
  object SQLUpdateDSPURLs: TSQLUpdateDSProvider
    DataSet = QueryURLs
    Constraints = True
    ModifySQL.Strings = (
      'UPDATE Crn_URLSET'
      'Name = :Name,'
      'URL = :URL,'
      'UseTable = :UseTable'
      'WHERE Id_CurrURL = :Id_CurrURL')
    InsertSQL.Strings = (
      'INSERT INTO Crn_URL'
      '(Name, URL, UseTable)'
      'VALUES'
      '(:Name, :URL, :UseTable)')
    DeleteSQL.Strings = (
      'DELETE FROM Crn_URLTable'
      'WHERE Id_URL = :Id_URL'
      ''
      'DELETE FROM Crn_URL'
      'WHERE Id_URL = :Id_URL'
      ' ')
    Left = 40
    Top = 96
  end
  object QueryRatesInet: TADOQuery
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Id_URL'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '    Id_URLTable, ColName, ColISO, ColCode, ColRate, ColPieces'
      'FROM Crn_URLTable (NOLOCK)'
      'WHERE Id_URL = :Id_URL'
      ' ')
    Left = 8
    Top = 128
    object QueryRatesInetId_URLTable: TAutoIncField
      FieldName = 'Id_URLTable'
      ReadOnly = True
    end
    object QueryRatesInetColName: TSmallintField
      FieldName = 'ColName'
    end
    object QueryRatesInetColISO: TSmallintField
      FieldName = 'ColISO'
    end
    object QueryRatesInetColCode: TSmallintField
      FieldName = 'ColCode'
    end
    object QueryRatesInetColRate: TSmallintField
      FieldName = 'ColRate'
    end
    object QueryRatesInetColPieces: TSmallintField
      FieldName = 'ColPieces'
    end
  end
  object dsQueryRatesInet: TSQLUpdateDSProvider
    DataSet = QueryRatesInet
    Constraints = True
    Left = 40
    Top = 128
  end
  object cdsQueryRatesInet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'Id_URL'
        ParamType = ptInput
      end>
    ProviderName = 'dsQueryRatesInet'
    AfterOpen = CDSURLsAfterRefresh
    AfterRefresh = CDSURLsAfterRefresh
    Left = 72
    Top = 128
    object cdsQueryRatesInetId_URLTable: TAutoIncField
      FieldName = 'Id_URLTable'
      ReadOnly = True
    end
    object cdsQueryRatesInetColName: TSmallintField
      FieldName = 'ColName'
    end
    object cdsQueryRatesInetColISO: TSmallintField
      FieldName = 'ColISO'
    end
    object cdsQueryRatesInetColCode: TSmallintField
      FieldName = 'ColCode'
    end
    object cdsQueryRatesInetColRate: TSmallintField
      FieldName = 'ColRate'
    end
    object cdsQueryRatesInetColPieces: TSmallintField
      FieldName = 'ColPieces'
    end
  end
end
