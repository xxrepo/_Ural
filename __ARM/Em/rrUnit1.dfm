object Form1: TForm1
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 245
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnEn: TButton
    Left = 80
    Top = 64
    Width = 289
    Height = 25
    Caption = 'Разрешить экспорт'
    TabOrder = 0
    OnClick = btnEnClick
  end
  object btnDis: TButton
    Left = 80
    Top = 120
    Width = 289
    Height = 25
    Caption = 'Запретить экспорт'
    TabOrder = 1
    OnClick = btnDisClick
  end
end
