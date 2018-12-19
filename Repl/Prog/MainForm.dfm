object SvcForm: TSvcForm
  Left = 331
  Top = 153
  Width = 455
  Height = 539
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Сервис GDS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 447
    Height = 29
    ButtonHeight = 25
    Caption = 'ToolBar1'
    TabOrder = 0
    object Button1: TButton
      Left = 0
      Top = 2
      Width = 121
      Height = 25
      Caption = 'Проверить почту'
      TabOrder = 0
      OnClick = Button1Click
    end
    object ToolButton1: TToolButton
      Left = 121
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object Button2: TButton
      Left = 129
      Top = 2
      Width = 112
      Height = 25
      Caption = 'Проверить файл'
      TabOrder = 1
      Visible = False
      OnClick = Button2Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 474
    Width = 447
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ListBox1: TListBox
    Left = 0
    Top = 29
    Width = 447
    Height = 445
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    Style = lbOwnerDrawFixed
    TabOrder = 2
    OnDrawItem = ListBox1DrawItem
  end
  object PopupMenu: TPopupMenu
    Left = 8
    Top = 72
    object miProperties: TMenuItem
      Caption = '&Свойства'
      Default = True
      OnClick = miPropertiesClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miClose: TMenuItem
      Action = aClose
    end
  end
  object UpdateTimer: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = UpdateTimerTimer
    Left = 32
    Top = 104
  end
  object MainMenu1: TMainMenu
    Left = 188
    Top = 141
    object Afqk1: TMenuItem
      Caption = 'Файл'
      object N4: TMenuItem
        Caption = 'Настройки'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object N3: TMenuItem
        Action = aClose
        Visible = False
      end
    end
  end
  object ActionList1: TActionList
    Left = 276
    Top = 165
    object aClose: TAction
      Caption = 'Выход'
      OnExecute = aCloseExecute
    end
  end
  object NMPOP: TNMPOP3
    Host = 'mail.webtours.ru'
    Port = 110
    ReportLevel = 0
    Parse = False
    DeleteOnRead = False
    Left = 308
    Top = 109
  end
  object TimerList: TRxTimerList
    Active = True
    Left = 232
    Top = 18
    object Timer1: TRxTimerEvent
      Interval = 120000
      OnTimer = Timer1Timer
    end
    object Timer254t3q: TRxTimerEvent
      OnTimer = Timer254t3qTimer
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 312
    Top = 10
  end
end
