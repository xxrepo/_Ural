object WareMemo: TWareMemo
  Left = 192
  Top = 107
  Width = 580
  Height = 543
  Caption = 'Список товаров'
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
    Top = 475
    Width = 572
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 486
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
      Left = 395
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
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 572
    Height = 434
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 572
    Height = 41
    Align = alTop
    Caption = ' '
    TabOrder = 2
    object Label6: TLabel
      Left = 5
      Top = 8
      Width = 102
      Height = 13
      Caption = 'Единица измерения'
    end
    object SpeedButton1: TSpeedButton
      Left = 257
      Top = 6
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object edMes: TEdit
      Left = 114
      Top = 6
      Width = 144
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
end
