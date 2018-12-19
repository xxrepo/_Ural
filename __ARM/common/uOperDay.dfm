object OperDay: TOperDay
  Left = 181
  Top = 106
  BorderStyle = bsDialog
  Caption = 'Открытие/закрытие дня'
  ClientHeight = 259
  ClientWidth = 599
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
  object Label1: TLabel
    Left = 8
    Top = 46
    Width = 577
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOpenDay: TButton
    Left = 16
    Top = 142
    Width = 177
    Height = 49
    Caption = 'Открыть день'
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
    Left = 216
    Top = 142
    Width = 177
    Height = 49
    Caption = 'Закрыть день'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnCloseDayClick
  end
  object Button1: TButton
    Left = 32
    Top = 208
    Width = 561
    Height = 33
    Caption = 'Выход'
    TabOrder = 2
    OnClick = Button1Click
  end
  inline fBsnSelector1: TfBsnSelector
    Width = 599
    Align = alTop
    TabOrder = 3
    inherited edName: TEdit
      Width = 513
    end
    inherited Button1: TButton
      Left = 568
      OnClick = fBsnSelector1Button1Click
    end
  end
  object DateEdit1: TDateEdit
    Left = 240
    Top = 88
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 4
    OnAcceptDate = DateEdit1AcceptDate
  end
  object btnCNC: TButton
    Left = 416
    Top = 142
    Width = 177
    Height = 49
    Caption = 'Отменить открытие'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnCNCClick
  end
end
