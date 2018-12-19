object Comment_ext: TComment_ext
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Комментарий'
  ClientHeight = 257
  ClientWidth = 382
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
  object Memo1: TMemo
    Left = 0
    Top = 89
    Width = 382
    Height = 127
    Align = alClient
    Lines.Strings = (
      'Однажды в студеную зимнюю пору,'
      'Сплотила на веки великая русь,'
      'гляжу поднимается медлено в гору'
      'единый могучий советский союз'
      ''
      'Однажды в студеную зимнюю пору,'
      'Сплотила на веки великая русь,'
      'гляжу поднимается медлено в гору'
      'единый могучий советский')
    MaxLength = 255
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 216
    Width = 382
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object btnCancel: TButton
      Left = 296
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
      Left = 205
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 41
    Width = 382
    Height = 48
    Align = alTop
    Caption = 'Тип комментария'
    TabOrder = 2
    object cbTypeNone: TRadioButton
      Left = 13
      Top = 20
      Width = 107
      Height = 17
      Caption = 'Не определен'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object cbTypePisitiv: TRadioButton
      Left = 131
      Top = 20
      Width = 107
      Height = 17
      Caption = 'Положительный'
      TabOrder = 1
    end
    object cbTypeNegativ: TRadioButton
      Left = 259
      Top = 20
      Width = 107
      Height = 17
      Caption = 'Отрицательный'
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 41
    Align = alTop
    Caption = ' '
    TabOrder = 3
    object Button1: TButton
      Left = 77
      Top = 6
      Width = 209
      Height = 25
      Caption = 'Добавить номер операции'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
