object SettDiagr: TSettDiagr
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Settings'
  ClientHeight = 123
  ClientWidth = 342
  Color = clBtnFace
  Constraints.MinHeight = 100
  Constraints.MinWidth = 350
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
  object lb1: TLabel
    Left = 24
    Top = 48
    Width = 78
    Height = 13
    Caption = 'Цвет закрытых'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lb3: TLabel
    Left = 24
    Top = 16
    Width = 100
    Height = 13
    Caption = 'Цвет просроченных'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 82
    Width = 342
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 251
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 0
    end
    object btnOk: TButton
      Left = 163
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 233
    Top = 43
    Width = 105
    Height = 25
    Caption = 'Выбрать цвет'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 233
    Top = 11
    Width = 105
    Height = 25
    Caption = 'Выбрать цвет'
    TabOrder = 2
    OnClick = Button3Click
  end
  object PP: TPanel
    Left = 130
    Top = 11
    Width = 92
    Height = 25
    TabOrder = 3
  end
  object PF: TPanel
    Left = 130
    Top = 43
    Width = 92
    Height = 25
    TabOrder = 4
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 40
    Top = 48
  end
end
