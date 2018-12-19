object OperRepl: TOperRepl
  Left = 181
  Top = 106
  BorderStyle = bsDialog
  Caption = 'Перенос операций'
  ClientHeight = 174
  ClientWidth = 498
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
  object Label2: TLabel
    Left = 16
    Top = 14
    Width = 473
    Height = 43
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'Выберите число, в которое хотите перенести операции.'#13#10'Перенос в ' +
      'закрытый день невозможен!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object btnOpenDay: TButton
    Left = 16
    Top = 110
    Width = 210
    Height = 49
    Caption = 'Перенести операции'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnOpenDayClick
  end
  object btnCloseDay: TButton
    Left = 272
    Top = 110
    Width = 210
    Height = 49
    Caption = 'Отмена'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnCloseDayClick
  end
  object DateEdit1: TDateEdit
    Left = 184
    Top = 72
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
    OnAcceptDate = DateEdit1AcceptDate
  end
end
