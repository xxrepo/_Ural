object CAContact: TCAContact
  Left = 192
  Top = 107
  ActiveControl = fCAContact1.edFIO
  BorderStyle = bsDialog
  Caption = 'Контактная информация'
  ClientHeight = 149
  ClientWidth = 476
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
    Top = 108
    Width = 476
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 390
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
      Left = 299
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  inline fCAContact1: TfCAContact
    Width = 476
    Height = 108
    Align = alClient
    TabOrder = 1
    inherited edFIO: TEdit
      Width = 369
    end
    inherited edPost: TEdit
      Width = 369
    end
    inherited edPhone: TEdit
      Width = 369
    end
    inherited edMail: TEdit
      Width = 369
    end
  end
end
