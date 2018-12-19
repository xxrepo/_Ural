object FuncsForm: TFuncsForm
  Left = 261
  Top = 230
  Width = 499
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
  Scaled = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 230
    Width = 491
    Height = 33
    Align = alBottom
    TabOrder = 0
    object OkButton: TButton
      Left = 310
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 401
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  inline FuncsFrame1: TFuncsFrame
    Width = 491
    Height = 230
    Align = alClient
    TabOrder = 1
    inherited RxDBGrid1: TRxDBGrid
      Width = 491
      Height = 230
    end
  end
end
