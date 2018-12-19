object FrmInputBoxAP: TFrmInputBoxAP
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'FrmInputBoxAP'
  ClientHeight = 90
  ClientWidth = 298
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
    Top = 10
    Width = 51
    Height = 13
    Caption = 'Параметр'
  end
  object Label2: TLabel
    Left = 8
    Top = 37
    Width = 48
    Height = 13
    Caption = 'Значение'
  end
  object Edit1: TEdit
    Left = 64
    Top = 7
    Width = 225
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object btnOk: TButton
    Left = 114
    Top = 62
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 204
    Top = 62
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 3
  end
  object RxCalcEdit2: TRxCalcEdit
    Left = 64
    Top = 32
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',0.####'
    NumGlyphs = 2
    TabOrder = 1
  end
end
