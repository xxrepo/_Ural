object WareFinder: TWareFinder
  Left = 424
  Top = 100
  Width = 598
  Height = 407
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Поиск товаров'
  Color = clBtnFace
  Constraints.MinHeight = 220
  Constraints.MinWidth = 330
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 361
    Width = 590
    Height = 19
    Panels = <
      item
        Width = 500
      end
      item
        Width = 50
      end>
    ParentFont = True
    SimplePanel = False
    UseSystemFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 493
    Height = 361
    ActivePage = tsWare
    Align = alClient
    TabOrder = 1
    object tsWare: TTabSheet
      Caption = 'Товар'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 485
        Height = 333
        Align = alClient
        Caption = 'Panel3'
        TabOrder = 0
        object grdList: TRxDBGrid
          Left = 1
          Top = 42
          Width = 483
          Height = 290
          Align = alClient
          DataSource = DataSource1
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = grdListDblClick
          TitleButtons = True
          OnCheckButton = grdListCheckButton
          OnGetBtnParams = grdListGetBtnParams
          Columns = <
            item
              Expanded = False
              FieldName = 'Name'
              Title.Caption = 'Наименование'
              Width = 218
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShortName'
              Title.Caption = 'Кор. наименование'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BarCode'
              Title.Caption = 'Код'
              Width = 116
              Visible = True
            end>
        end
        object Panel1: TPanel
          Left = 1
          Top = 1
          Width = 483
          Height = 41
          Align = alTop
          Caption = ' '
          TabOrder = 1
          object Label1: TLabel
            Left = 8
            Top = 11
            Width = 59
            Height = 13
            Caption = 'Название'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edFilter: TComboBox
            Left = 78
            Top = 8
            Width = 367
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 0
            OnKeyPress = edFilterKeyPress
          end
        end
      end
    end
    object tsCat: TTabSheet
      Caption = 'Категория'
      ImageIndex = 1
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 485
        Height = 41
        Align = alTop
        Caption = ' '
        TabOrder = 0
        object Label2: TLabel
          Left = 8
          Top = 11
          Width = 124
          Height = 13
          Caption = 'Название категории'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edFilterCtg: TComboBox
          Left = 144
          Top = 8
          Width = 319
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 0
          TabOrder = 0
          OnKeyPress = edFilterKeyPress
        end
      end
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 41
        Width = 485
        Height = 292
        Align = alClient
        DataSource = dsFind_Ctg_Ware
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = grdListDblClick
        TitleButtons = True
        OnCheckButton = grdListCheckButton
        OnGetBtnParams = grdListGetBtnParams
        Columns = <
          item
            Expanded = False
            FieldName = 'Name'
            Title.Caption = 'Наименование'
            Width = 246
            Visible = True
          end>
      end
    end
  end
  object Panel2: TPanel
    Left = 493
    Top = 0
    Width = 97
    Height = 361
    Align = alRight
    Caption = ' '
    TabOrder = 2
    object SpeedButton2: TSpeedButton
      Left = 10
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Поиск'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C0000000000000000000000000000000000000000000000001F7C
        1F7C000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F7C
        0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001042
        000000001F7C0000FF7FFF7FFF7FFF7FFF7FFF7F000010421F7C1F7C10420000
        10421F7C1F7C0000FF7FFF7FFF7FFF7FFF7F000010421F7C1F7CFF0310421042
        00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00001F7C1F7C1F7C1F7C10421F7C
        00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00001F7CFF031F7C1F7C10421F7C
        00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00001042FF03FF031F7C10421042
        00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7F000010421F7C1F7C10420000
        1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F7C
        1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F7C
        1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F7C
        1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F7C00001F7C1F7C
        1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000001F7C1F7C1F7C
        1F7C1F7C1F7C0000000000000000000000000000000000001F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object btnOk: TSpeedButton
      Left = 10
      Top = 91
      Width = 75
      Height = 25
      Caption = 'Выбрать'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnOkClick
    end
    object SpeedButton3: TSpeedButton
      Left = 10
      Top = 139
      Width = 75
      Height = 25
      Caption = 'Закрыть'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton3Click
    end
  end
  object cdsFindGoods: TClientDataSet
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
        Name = '@id_Ctg'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = '@Name'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'dsFindGoods'
    RemoteServer = DM.rsCA
    Left = 224
    Top = 48
    object cdsFindGoodsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object cdsFindGoodsName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsFindGoodsShortName: TStringField
      FieldName = 'ShortName'
      Size = 100
    end
    object cdsFindGoodsBarCode: TStringField
      FieldName = 'BarCode'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsFindGoods
    OnDataChange = DataSource1DataChange
    Left = 352
    Top = 96
  end
  object cdsFind_Ctg_Ware: TClientDataSet
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
        Name = '@isGoods'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Name'
        ParamType = ptInput
      end>
    ProviderName = 'dsFind_Ctg_Ware'
    RemoteServer = DM.rsCA
    Left = 216
    Top = 230
    object cdsFind_Ctg_WareID: TIntegerField
      FieldName = 'ID'
    end
    object cdsFind_Ctg_WareName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsFind_Ctg_WareShortName: TStringField
      FieldName = 'ShortName'
      Size = 100
    end
  end
  object dsFind_Ctg_Ware: TDataSource
    DataSet = cdsFind_Ctg_Ware
    OnDataChange = DataSource1DataChange
    Left = 256
    Top = 232
  end
end
