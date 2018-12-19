object FrmInputBoxDigit: TFrmInputBoxDigit
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Число'
  ClientHeight = 234
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Значение'
  end
  object btnOk: TButton
    Left = 107
    Top = 206
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 197
    Top = 206
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 1
  end
  object dxCalculator: TdxCalculator
    Left = 57
    Top = 43
    Width = 210
    Height = 139
    TabOrder = 2
    OnKeyPress = dxCalculatorKeyPress
    Associate = RxCalcEdit1
    ShowFocusRect = False
    OnResult = dxCalculatorResult
  end
  object RxCalcEdit1: TdxCalcDisplay
    Left = 64
    Top = 11
    Width = 199
    Height = 21
    TabStop = False
    Text = '0'
  end
end
