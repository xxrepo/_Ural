object ValListDistinct: TValListDistinct
  Left = 360
  Top = 106
  Width = 451
  Height = 540
  Caption = 'Перечень значений'
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
  object RxDBGrid1: TDBGridEh
    Left = 0
    Top = 29
    Width = 443
    Height = 443
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = DataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    RowDetailPanel.Color = clBtnFace
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        Title.Caption = 'Значение'
        Width = 368
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 472
    Width = 443
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 12
      Top = 9
      Width = 101
      Height = 25
      Caption = 'В Excel'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000008080000080800000808000008080000000000000000000008080
        8000808080008080800080808000808080008080800080808000808080000000
        000080800000FFFF0000FFFF0000FFFFFF0000000000FF00FF00FF00FF000000
        0000FFFF00008080000080800000808000008080000080800000000000008080
        0000FFFF0000FFFF0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FFFF00008080000080800000808000000000000080800000FFFF
        0000FFFF0000FFFFFF00000000008080000000000000FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFF0000808000000000000080800000FFFF0000FFFF
        0000FFFFFF0000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000000000000080800000FFFF0000FFFF0000FFFF
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000080800000FFFF0000FFFF0000FFFFFF000000
        000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000080800000FFFF0000FFFF0000FFFFFF00000000008080
        00008080800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000080800000FFFF0000FFFF0000FFFFFF0000000000FFFF00008080
        0000808000008080800000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        000080800000FFFF0000FFFF0000FFFFFF0000000000FF00FF0000000000FFFF
        000080800000808000008080800000000000FF00FF00FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF000000
        0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF00FF00000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = SpeedButton1Click
    end
    object btnCancel: TButton
      Left = 355
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Закрыть'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCancelClick
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 443
    Height = 29
    ButtonHeight = 25
    Caption = 'ToolBar1'
    TabOrder = 2
    object EhGridFilter1: TEhGridFilter
      Left = 0
      Top = 2
      Width = 70
      Height = 25
      DisableFieldType = []
      Caption = 'Фильтр'
      DBGrid = RxDBGrid1
    end
  end
  object RxMemoryData: TRxMemoryData
    FieldDefs = <
      item
        Name = 'RxMemoryData1Field1'
      end>
    Left = 104
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 160
    Top = 128
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = RxMemoryData
    Constraints = True
    Left = 104
    Top = 160
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 104
    Top = 200
  end
end
