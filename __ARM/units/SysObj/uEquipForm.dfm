object EquipForm: TEquipForm
  Left = 197
  Top = 107
  Width = 530
  Height = 351
  Caption = 'Оборудование'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 286
    Width = 522
    Height = 38
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
