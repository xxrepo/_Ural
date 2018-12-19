object FrmInputBox: TFrmInputBox
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'FrmInputBox'
  ClientHeight = 70
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
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object RxCalcEdit1: TRxCalcEdit
    Left = 48
    Top = 7
    Width = 241
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    NumGlyphs = 2
    TabOrder = 3
    Visible = False
  end
  object Edit1: TEdit
    Left = 48
    Top = 7
    Width = 241
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    OnKeyPress = Edit1KeyPress
  end
  object btnOk: TButton
    Left = 114
    Top = 42
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 204
    Top = 42
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 2
  end
end
