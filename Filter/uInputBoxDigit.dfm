object FrmInputBoxDigit: TFrmInputBoxDigit
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Число'
  ClientHeight = 70
  ClientWidth = 211
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
    Left = 8
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Значение'
  end
  object RxCalcEdit1: TRxCalcEdit
    Left = 72
    Top = 12
    Width = 129
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',0.####'
    NumGlyphs = 2
    TabOrder = 2
  end
  object btnOk: TButton
    Left = 43
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
    Left = 133
    Top = 42
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 1
  end
end
