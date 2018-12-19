object SvcForm: TSvcForm
  Left = 568
  Top = 201
  BorderStyle = bsDialog
  Caption = 'Сервис фильтр'
  ClientHeight = 512
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 29
    Width = 448
    Height = 483
    Align = alClient
    Columns = <
      item
        Width = 15
      end
      item
        Width = 200
      end
      item
        Width = 200
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 448
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 1
    Visible = False
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Caption = 'ToolButton1'
      ImageIndex = 0
      OnClick = ToolButton1Click
    end
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
      Caption = '&Выход'
      OnClick = miCloseClick
    end
  end
  object UpdateTimer: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = UpdateTimerTimer
    Left = 8
    Top = 104
  end
end
