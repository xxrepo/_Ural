object frmInputBoxDate: TfrmInputBoxDate
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Введите дату'
  ClientHeight = 70
  ClientWidth = 213
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 11
    Width = 26
    Height = 13
    Caption = 'Дата'
  end
  object btnOk: TButton
    Left = 48
    Top = 42
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 136
    Top = 42
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 1
  end
  object DateEdit1: TDateEdit
    Left = 72
    Top = 8
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
end
