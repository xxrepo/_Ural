object ManufactDetailForm: TManufactDetailForm
  Left = 197
  Top = 107
  Width = 414
  Height = 317
  ActiveControl = NameEdit
  Caption = 'ManufactDetailForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 254
    Width = 406
    Height = 36
    Align = alBottom
    TabOrder = 0
    object OkButton: TButton
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = OkButtonClick
    end
    object Button1: TButton
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 406
    Height = 254
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 79
      Height = 13
      Caption = 'Наименование:'
    end
    object Label6: TLabel
      Left = 8
      Top = 72
      Width = 40
      Height = 13
      Caption = 'Бизнес:'
    end
    object SpeedButton2: TSpeedButton
      Left = 359
      Top = 64
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton2Click
    end
    object Label2: TLabel
      Left = 8
      Top = 96
      Width = 34
      Height = 13
      Caption = 'Адрес:'
    end
    object Label13: TLabel
      Left = 9
      Top = 9
      Width = 38
      Height = 13
      Caption = 'Группа:'
    end
    object Bevel1: TBevel
      Left = -43
      Top = 32
      Width = 449
      Height = 9
      Shape = bsTopLine
    end
    object NameEdit: TEdit
      Left = 96
      Top = 40
      Width = 289
      Height = 21
      MaxLength = 50
      TabOrder = 0
    end
    object BusinessEdit: TEdit
      Left = 96
      Top = 64
      Width = 263
      Height = 21
      MaxLength = 50
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 1
      OnKeyDown = BusinessEditKeyDown
    end
    object AddrEdit: TMemo
      Left = 96
      Top = 88
      Width = 289
      Height = 89
      TabOrder = 2
    end
    object DBLookupComboBox1: TRxDBLookupCombo
      Left = 96
      Top = 8
      Width = 289
      Height = 21
      DropDownCount = 8
      DisplayEmpty = 'без группы'
      LookupField = 'id_Group'
      LookupDisplay = 'Name'
      LookupSource = DataSource1
      TabOrder = 3
    end
    object cbNeedSend: TCheckBox
      Left = 10
      Top = 186
      Width = 225
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Передавать в удаленные базы:'
      TabOrder = 4
    end
    object cbShowInRoot: TCheckBox
      Left = 9
      Top = 204
      Width = 226
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Отображать в первом уровне баланса'
      TabOrder = 5
    end
    object DisabledCheckBox: TCheckBox
      Left = 291
      Top = 187
      Width = 66
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Удалить:'
      TabOrder = 6
      Visible = False
    end
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptUnknown
      end>
    ProviderName = 'dsGetManufact'
    RemoteServer = DM.rsCA
    Left = 264
    Top = 88
  end
  object cdsMNGroup: TClientDataSet
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
      end>
    ProviderName = 'dsMNGroup'
    RemoteServer = DM.rsCA
    Left = 104
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = cdsMNGroup
    Left = 376
    Top = 136
  end
end
