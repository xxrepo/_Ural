object EquipDetailForm: TEquipDetailForm
  Left = 197
  Top = 107
  Width = 419
  Height = 237
  Caption = 'EquipDetailForm'
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
    Top = 174
    Width = 411
    Height = 36
    Align = alBottom
    TabOrder = 0
    object OkButton: TButton
      Left = 231
      Top = 4
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
      Top = 4
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
    Width = 411
    Height = 174
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 79
      Height = 13
      Caption = 'Наименование:'
    end
    object Label6: TLabel
      Left = 16
      Top = 40
      Width = 40
      Height = 13
      Caption = 'Бизнес:'
    end
    object Label5: TLabel
      Left = 16
      Top = 152
      Width = 82
      Height = 13
      Caption = 'Заблокировано:'
    end
    object SpeedButton2: TSpeedButton
      Left = 367
      Top = 32
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton2Click
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 53
      Height = 13
      Caption = 'Описание:'
    end
    object NameEdit: TEdit
      Left = 104
      Top = 8
      Width = 289
      Height = 21
      MaxLength = 50
      TabOrder = 0
    end
    object BusinessEdit: TEdit
      Left = 104
      Top = 32
      Width = 257
      Height = 21
      MaxLength = 50
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 1
      OnKeyDown = BusinessEditKeyDown
    end
    object DisabledCheckBox: TCheckBox
      Left = 104
      Top = 149
      Width = 25
      Height = 17
      TabOrder = 3
    end
    object DescrEdit: TMemo
      Left = 104
      Top = 56
      Width = 289
      Height = 89
      TabOrder = 2
    end
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'Id'
        ParamType = ptUnknown
        Value = '1'
      end>
    ProviderName = 'dsGetEquipment'
    RemoteServer = DM.SocketConnection
    Left = 312
    Top = 128
  end
end
