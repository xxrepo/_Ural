object PrgForm: TPrgForm
  Left = 186
  Top = 107
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Progress...'
  ClientHeight = 117
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 76
    Width = 417
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 52
    Width = 409
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label2'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object ProgressBar2: TProgressBar
    Left = 8
    Top = 29
    Width = 417
    Height = 16
    Min = 0
    Max = 100
    Position = 23
    TabOrder = 0
  end
  object PBGlobal: TProgressBar
    Left = 9
    Top = 4
    Width = 417
    Height = 16
    Min = 0
    Max = 100
    Position = 23
    TabOrder = 1
  end
end
