object Arc_OperSet: TArc_OperSet
  Left = 266
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Архивирование'
  ClientHeight = 97
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 356
    Height = 13
    Caption = 
      'Введите дату. Операции, созданные до нее, будут помещены в архив' +
      '.'
  end
  object btnOk: TButton
    Left = 254
    Top = 66
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 344
    Top = 66
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 1
  end
  object DateEdit1: TDateEdit
    Left = 144
    Top = 32
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
end
