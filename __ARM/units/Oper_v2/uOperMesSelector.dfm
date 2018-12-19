object OperMesSelector: TOperMesSelector
  Left = 360
  Top = 103
  Width = 564
  Height = 289
  Caption = 'Выбор единицы измерения'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 221
    Width = 556
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 470
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 379
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 92
      Height = 25
      Caption = 'Очистить'
      ModalResult = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C007C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        007C1F7C1F7C1F7C007C007C007C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C007C007C007C007C1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C
        1F7C1F7C1F7C1F7C1F7C007C007C007C1F7C1F7C1F7C1F7C1F7C1F7C007C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C1F7C1F7C1F7C1F7C007C007C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C1F7C1F7C007C007C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C007C007C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C007C007C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C1F7C1F7C007C007C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C007C007C007C007C1F7C1F7C1F7C1F7C007C007C1F7C
        1F7C1F7C1F7C1F7C007C007C007C007C1F7C1F7C1F7C1F7C1F7C1F7C007C007C
        1F7C1F7C1F7C1F7C007C007C007C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        007C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 556
    Height = 221
    Align = alClient
    DataSource = dsMeasureGetList
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    TitleButtons = True
    OnCheckButton = RxDBGrid1CheckButton
    OnGetBtnParams = RxDBGrid1GetBtnParams
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Наименование'
        Width = 285
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ShortName'
        Title.Caption = 'Короткое наименование'
        Width = 146
        Visible = True
      end>
  end
  object dsMeasureGetList: TDataSource
    DataSet = cdsMeasureGetList
    Left = 96
    Top = 128
  end
  object cdsMeasureGetList: TClientDataSet
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
        Name = '@id_Goods'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsWMes'
    RemoteServer = DM.rsCA
    Left = 152
    Top = 56
    object cdsMeasureGetListid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsMeasureGetListName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object cdsMeasureGetListShortName: TStringField
      FieldName = 'ShortName'
      Size = 10
    end
    object cdsMeasureGetListid_BaseMeasure: TIntegerField
      FieldName = 'id_BaseMeasure'
    end
    object cdsMeasureGetListKoef: TFloatField
      FieldName = 'Koef'
    end
    object cdsMeasureGetListDisabled: TBooleanField
      FieldName = 'Disabled'
    end
  end
end
