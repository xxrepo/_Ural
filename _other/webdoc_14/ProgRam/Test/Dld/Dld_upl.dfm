object Form1: TForm1
  Left = 192
  Top = 107
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'GetFile'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo: TMemo
    Left = 280
    Top = 24
    Width = 617
    Height = 409
    Lines.Strings = (
      'Memo')
    TabOrder = 1
  end
  object RxSpinEdit1: TRxSpinEdit
    Left = 32
    Top = 88
    Width = 121
    Height = 21
    Value = 1024000
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 24
    Top = 120
    Width = 201
    Height = 321
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object Button2: TButton
    Left = 192
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Upload'
    TabOrder = 4
    OnClick = Button2Click
  end
  object SocketConnection1: TSocketConnection
    ServerGUID = '{A9E4CBBA-B56D-4606-B0C9-F2E0E40F27FC}'
    ServerName = 'svcWebDoc.rdmWebDoc'
    Host = '127.0.0.1'
    Left = 144
    Top = 40
  end
end
