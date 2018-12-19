object SplashForm: TSplashForm
  Left = 404
  Top = 191
  Width = 324
  Height = 219
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Добро пожаловать'
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbVer2: TLabel
    Left = 0
    Top = 115
    Width = 316
    Height = 22
    Align = alBottom
    Alignment = taCenter
    AutoSize = False
    Caption = 'Версия %d.%d'
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 162
    Width = 316
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 0
    object Button1: TButton
      Left = 229
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 137
    Width = 316
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    object CheckBox1: TCheckBox
      Left = 12
      Top = 0
      Width = 162
      Height = 20
      Anchors = [akRight, akBottom]
      Caption = 'Не показывать заставку'
      TabOrder = 0
      Visible = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 316
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 2
  end
  object Timer1: TTimer
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 8
    Top = 8
  end
  object ActionList1: TActionList
    Left = 240
    Top = 72
    object aEgg: TAction
      Caption = 'aEgg'
      ShortCut = 57456
    end
  end
end
