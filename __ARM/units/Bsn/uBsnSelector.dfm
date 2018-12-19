object BsnSelector: TBsnSelector
  Left = 181
  Top = 106
  Width = 334
  Height = 341
  Caption = 'Выберите бизнес'
  Color = clBtnFace
  Constraints.MinWidth = 330
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
    Top = 273
    Width = 326
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnDel: TSpeedButton
      Left = 11
      Top = 8
      Width = 80
      Height = 25
      Caption = 'Отцепить'
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
      OnClick = btnDelClick
    end
    object btnCancel: TButton
      Left = 240
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 149
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 326
    Height = 273
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
        Title.Caption = 'Бизнес'
        Width = 235
        Visible = True
      end>
  end
  object cdsBsn: TClientDataSet
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
        Name = '@id_User'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@UID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsBsnByFunc'
    RemoteServer = DM.rsCA
    Left = 80
    Top = 105
    object cdsBsnid_business: TIntegerField
      FieldName = 'id_business'
      ReadOnly = True
    end
    object cdsBsnName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsBsn
    OnDataChange = DataSource1DataChange
    Left = 160
    Top = 128
  end
end
