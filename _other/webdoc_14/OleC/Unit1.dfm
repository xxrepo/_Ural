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
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 41
    Align = alTop
    Caption = ' '
    Locked = True
    TabOrder = 0
    object Button2: TButton
      Left = 6
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 920
    Height = 412
    Align = alClient
    Caption = 'Panel2'
    Locked = True
    TabOrder = 1
    object OleContainer1: TOleContainer
      Left = 1
      Top = 1
      Width = 918
      Height = 410
      AutoActivate = aaGetFocus
      Align = alClient
      BorderStyle = bsNone
      Caption = 'OleContainer1'
      TabOrder = 0
    end
  end
  object sOpenDialog1: TsOpenDialog
    Filter = 
      'Документы Microsoft Office (*.doc;*.docx;*.xls;*.xlsx)|*.doc;*.d' +
      'ocx;*.xls;*.xlsx|Microsoft Word (*.doc;*.docx)|*.doc;*.docx|Micr' +
      'osoft Excel (*.xls;*.xlsx)|*.xls;*.xlsx|Adobe Acrobar (*.pdf)|*.' +
      'pdf|Изобржения (*.bmp;*.gif;*.jpg;*.jpeg)|*.bmp;*.gif;*.jpg;*.jp' +
      'eg|Все файлы (*.*)|*.*'
    Left = 392
    Top = 120
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 776
    Top = 128
  end
end
