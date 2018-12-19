object FrmInputBoxDigit: TFrmInputBoxDigit
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  ClientHeight = 81
  ClientWidth = 227
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 36
    Height = 13
    Caption = '799999'
  end
  object btnOk: TButton
    Left = 59
    Top = 53
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
    Left = 149
    Top = 53
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object RxCalcEdit1: TRxCalcEdit
    Left = 137
    Top = 14
    Width = 79
    Height = 21
    AutoSize = False
    NumGlyphs = 2
    TabOrder = 2
  end
end
