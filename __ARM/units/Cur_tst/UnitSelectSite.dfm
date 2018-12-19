object FormSelectSite: TFormSelectSite
  Left = 192
  Top = 107
  HelpContext = 37
  BorderStyle = bsDialog
  Caption = 'Выбор сайта'
  ClientHeight = 137
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 425
    Height = 33
    AutoSize = False
    Caption = 
      'Курсы валют, прочитанные с разных сайтов, отличаются.'#13#10'Выберите ' +
      'сайт, по которому будут установлены новые курсы.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 56
    Width = 417
    Height = 23
    Style = csDropDownList
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 15
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 232
    Top = 96
    Width = 97
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 352
    Top = 96
    Width = 97
    Height = 25
    Caption = 'Отмена'
    TabOrder = 2
    Kind = bkCancel
  end
end
