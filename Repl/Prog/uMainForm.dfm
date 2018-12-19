object SvcForm: TSvcForm
  Left = 198
  Top = 169
  Width = 677
  Height = 408
  BorderIcons = [biSystemMenu]
  Caption = 'Репликатор'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 669
    Height = 29
    ButtonHeight = 25
    Caption = 'ToolBar1'
    TabOrder = 0
    object Button1: TButton
      Left = 0
      Top = 2
      Width = 121
      Height = 25
      Caption = 'Передать данные'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 121
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      Visible = False
      OnClick = Button2Click
    end
    object ToolButton1: TToolButton
      Left = 196
      Top = 2
      Width = 133
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object Button3: TButton
      Left = 329
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 2
      Visible = False
      OnClick = Button3Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 343
    Width = 669
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object ListBox1: TListBox
    Left = 0
    Top = 29
    Width = 669
    Height = 314
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    Style = lbOwnerDrawVariable
    TabOrder = 2
    OnDrawItem = ListBox1DrawItem
  end
  object ListBox2: TListBox
    Left = 408
    Top = 80
    Width = 121
    Height = 185
    ItemHeight = 13
    TabOrder = 3
    Visible = False
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
  object MainMenu1: TMainMenu
    Left = 188
    Top = 141
    object Afqk1: TMenuItem
      Caption = 'Файл'
      object N7: TMenuItem
        Caption = 'Закрыть'
        OnClick = N7Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = 'Настройки'
        Visible = False
        OnClick = miPropertiesClick
      end
      object N5: TMenuItem
        Caption = 'Синхронизация'
        Visible = False
        OnClick = N5Click
      end
      object miStng: TMenuItem
        Caption = 'Параметры подключения'
        OnClick = miStngClick
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
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=1;Persist Security Info=True;User I' +
      'D=sa;Initial Catalog=ACS_LCBase;Data Source=OVK\OVK;Extended Pro' +
      'perties="Use Encryption for Data=False;Tag with column collation' +
      ' when possible=False";Use Procedure for Prepare=1;Auto Translate' +
      '=True;Packet Size=4096;Workstation ID=HP'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 50
    Top = 32
  end
  object RealThread1: TRealThread
    PriorityClass = pL4_NORMAL
    DoInThread = RealThread1DoInThread
    OnStart = RealThread1Start
    OnEnd = RealThread1End
    OnThreadProcException = RealThread1ThreadProcException
    Left = 520
    Top = 80
  end
end
