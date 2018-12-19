object FuncsForm: TFuncsForm
  Left = 261
  Top = 230
  Width = 520
  Height = 290
  Caption = 'Функции'
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
  object Panel1: TPanel
    Left = 0
    Top = 230
    Width = 512
    Height = 33
    Align = alBottom
    TabOrder = 0
    object OkButton: TButton
      Left = 8
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 136
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  inline FuncsFrame1: TFuncsFrame
    Width = 512
    Height = 230
    Align = alClient
    TabOrder = 1
    inherited RxDBGrid1: TRxDBGrid
      Width = 512
      Height = 230
    end
  end
end
