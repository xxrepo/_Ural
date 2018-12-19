object Log: TLog
  Left = 231
  Top = 107
  Width = 928
  Height = 480
  Caption = 'Ошибки'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 920
    Height = 453
    Align = alClient
    Color = clMenu
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    TabOrder = 0
  end
end
