object Conf: TConf
  Left = 233
  Top = 107
  Width = 336
  Height = 201
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Do you realy want to deletion object?'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 305
    Height = 81
    Alignment = taCenter
    AutoSize = False
    Caption = 'Press button 0 for deletion'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Button1: TButton
    Left = 24
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Button 1'
    ModalResult = 1
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Button 2'
    ModalResult = 1
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 232
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Button 3'
    ModalResult = 1
    TabOrder = 2
    OnClick = Button3Click
  end
end
