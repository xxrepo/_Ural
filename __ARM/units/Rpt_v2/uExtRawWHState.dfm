object ExtRawWHState: TExtRawWHState
  Left = 181
  Top = 106
  Width = 783
  Height = 540
  Caption = 'Состояние склада сырья давальческого'
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
  object Panel2: TPanel
    Left = 0
    Top = 472
    Width = 775
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 689
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
    object BitBtn1: TBitBtn
      Left = 144
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Печатать'
      TabOrder = 1
      Visible = False
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C00000000000C0C0C00000000000FF00FF00FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000C0C0C00000000000FF00FF0000000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000FFFF0000FFFF0000FF
        FF00C0C0C000C0C0C000000000000000000000000000FF00FF0000000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00080808000808080008080
        8000C0C0C000C0C0C00000000000C0C0C00000000000FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000C0C0C000C0C0C0000000000000000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C00000000000C0C0C00000000000C0C0C00000000000FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000C0C0C00000000000C0C0C0000000000000000000FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000C0C0C00000000000C0C0C00000000000FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00000000000000000000000000000000000000
        0000FFFFFF0000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FFFFFF000000000000000000000000000000
        000000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 8
      Width = 113
      Height = 25
      Caption = 'Просмотр'
      TabOrder = 2
      Visible = False
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        00000000000000000000FF00FF00FF00FF000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FF000000FF000000FF000000FF00
        0000FF000000FFFFFF0000000000FF00FF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF0000000000FF00FF00808080008080
        8000808080000000000000000000FF000000FF000000FF000000FF000000FF00
        0000FF000000FFFFFF0000000000FF00FF00FF00FF000000000000000000FFFF
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF000000000000000000FFFF
        FF00800000008000000000000000FF000000FF000000FF000000FF000000FF00
        0000FF000000FFFFFF0000000000FF00FF00FF00FF000000000000000000FFFF
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF000000000000000000FFFF
        FF0080000000800000008000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF0000000000FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000008080800080808000808080008080
        8000808080008080800080808000FF00FF0000000000FF00FF0000000000FFFF
        FF00800000008000000080000000800000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000000000000080808000FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000000000000000
        00000000000000000000FFFFFF00FFFFFF0080808000FF00FF0000000000FFFF
        FF0080000000800000008000000080000000FFFFFF00C0C0C000FFFFFF008000
        00008000000080000000800000008000000080808000FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000080808000FF00FF00}
    end
  end
  object RxDBGrid1: TDBGridEh
    Left = 0
    Top = 71
    Width = 775
    Height = 401
    Align = alClient
    DataSource = dsArc
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnTitleBtnClick = RxDBGrid1TitleBtnClick
    Columns = <
      item
        FieldName = 'Name'
        Footers = <>
        Title.Caption = 'Наименование'
        Title.TitleButton = True
        Width = 226
      end
      item
        FieldName = 'TotalAmount'
        Footers = <>
        Title.Caption = 'Количество|Кол-во'
        Title.TitleButton = True
        Width = 63
      end
      item
        FieldName = 'MeasureName'
        Footers = <>
        Title.Caption = 'Количество|Ед. изм.'
        Title.TitleButton = True
        Width = 104
      end
      item
        FieldName = 'AvgPrice'
        Footers = <>
        Title.Caption = 'Сумма|Ср. стоимость'
        Title.TitleButton = True
        Width = 119
      end
      item
        FieldName = 'TotalSum'
        Footers = <>
        Title.Caption = 'Сумма|Сумма'
        Title.TitleButton = True
      end
      item
        FieldName = 'CRNName'
        Footers = <>
        Title.Caption = 'Сумма|Валюта'
        Title.TitleButton = True
        Width = 74
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 71
    Align = alTop
    Caption = ' '
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 34
      Height = 13
      Caption = 'Сумма'
    end
    inline fBsnSelector1: TfBsnSelector
      Width = 361
      Height = 33
      inherited edName: TEdit
        Width = 275
      end
      inherited Button1: TButton
        Left = 330
      end
    end
    object Button1: TButton
      Left = 376
      Top = 6
      Width = 131
      Height = 33
      Caption = 'Перечитать'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 56
      Top = 44
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = 'Edit1'
    end
  end
  object cdsERWHState: TClientDataSet
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
      end>
    ProviderName = 'dsERWHState'
    RemoteServer = DM.rsCA
    Left = 136
    Top = 152
    object cdsERWHStateid_ExtRaw: TAutoIncField
      FieldName = 'id_ExtRaw'
      ReadOnly = True
    end
    object cdsERWHStateid_Ctg_ExtRaw: TIntegerField
      FieldName = 'id_Ctg_ExtRaw'
    end
    object cdsERWHStateName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 100
    end
    object cdsERWHStateTotalAmount: TFloatField
      FieldName = 'TotalAmount'
    end
    object cdsERWHStateTotalSum: TFloatField
      FieldName = 'TotalSum'
    end
    object cdsERWHStateid_Currency: TIntegerField
      FieldName = 'id_Currency'
    end
    object cdsERWHStateCRNName: TStringField
      FieldName = 'CRNName'
      Size = 30
    end
    object cdsERWHStateid_Currency_UST: TIntegerField
      FieldName = 'id_Currency_UST'
    end
    object cdsERWHStatePrice: TFloatField
      FieldName = 'Price'
    end
    object cdsERWHStateCRN_UST: TStringField
      FieldName = 'CRN_UST'
      Size = 30
    end
    object cdsERWHStateAvgPrice: TFloatField
      FieldName = 'AvgPrice'
      ReadOnly = True
    end
    object cdsERWHStateMeasureName: TStringField
      FieldName = 'MeasureName'
      Size = 50
    end
  end
  object dsArc: TDataSource
    DataSet = cdsERWHState
    Left = 192
    Top = 152
  end
  object DBSumList1: TDBSumList
    DataSet = cdsERWHState
    ExternalRecalc = False
    SumCollection = <
      item
        FieldName = 'TotalSum'
        GroupOperation = goSum
      end>
    VirtualRecords = False
    SumListChanged = DBSumList1SumListChanged
    Left = 320
    Top = 280
  end
end
