object CurrencyDetailForm: TCurrencyDetailForm
  Left = 228
  Top = 110
  Width = 501
  Height = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 79
    Height = 13
    Caption = 'Наименование:'
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 113
    Height = 13
    Caption = 'Кратк. наименование:'
  end
  object Label3: TLabel
    Left = 16
    Top = 112
    Width = 86
    Height = 13
    Caption = 'Быстрый доступ:'
  end
  object Label4: TLabel
    Left = 16
    Top = 64
    Width = 43
    Height = 13
    Caption = 'Код ISO:'
  end
  object Label5: TLabel
    Left = 16
    Top = 88
    Width = 74
    Height = 13
    Caption = 'Числовой код:'
  end
  object Label6: TLabel
    Left = 16
    Top = 136
    Width = 30
    Height = 13
    Caption = 'Value:'
  end
  object Label7: TLabel
    Left = 16
    Top = 160
    Width = 27
    Height = 13
    Caption = 'Курс:'
  end
  object Label8: TLabel
    Left = 16
    Top = 184
    Width = 27
    Height = 13
    Caption = 'Сайт:'
  end
  object Label11: TLabel
    Left = 16
    Top = 208
    Width = 47
    Height = 13
    Caption = 'AvToPay:'
  end
  object Label12: TLabel
    Left = 16
    Top = 232
    Width = 86
    Height = 13
    Caption = 'Базовая валюта:'
  end
  object SpeedButton1: TSpeedButton
    Left = 448
    Top = 176
    Width = 23
    Height = 22
    Caption = '...'
  end
  object Panel1: TPanel
    Left = 0
    Top = 261
    Width = 493
    Height = 33
    Align = alBottom
    TabOrder = 0
    object OkButton: TButton
      Left = 24
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 160
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object NameEdit: TEdit
    Left = 136
    Top = 8
    Width = 329
    Height = 21
    MaxLength = 30
    TabOrder = 1
  end
  object ShortNameEdit: TEdit
    Left = 136
    Top = 32
    Width = 121
    Height = 21
    MaxLength = 10
    TabOrder = 2
  end
  object ISOCodeEdit: TEdit
    Left = 136
    Top = 56
    Width = 49
    Height = 21
    MaxLength = 3
    TabOrder = 3
  end
  object NumCodeEdit: TEdit
    Left = 136
    Top = 80
    Width = 49
    Height = 21
    MaxLength = 3
    TabOrder = 4
  end
  object FastAccess: TCheckBox
    Left = 136
    Top = 112
    Width = 33
    Height = 17
    TabOrder = 5
  end
  object AvForPay: TCheckBox
    Left = 136
    Top = 208
    Width = 33
    Height = 17
    TabOrder = 6
  end
  object Base: TCheckBox
    Left = 136
    Top = 232
    Width = 33
    Height = 17
    TabOrder = 7
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 136
    Top = 128
    Width = 121
    Height = 21
    AutoSize = False
    TabOrder = 8
  end
  object CurrencyEdit2: TCurrencyEdit
    Left = 136
    Top = 152
    Width = 121
    Height = 21
    AutoSize = False
    TabOrder = 9
  end
  object SiteEdit: TEdit
    Left = 136
    Top = 176
    Width = 305
    Height = 21
    ReadOnly = True
    TabOrder = 10
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CallType'
        ParamType = ptUnknown
      end>
    ProviderName = 'dsGetUser'
    RemoteServer = AdminDM.SocketConnection
    Left = 400
    Top = 64
  end
end
