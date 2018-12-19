object FrmInputBoxStr: TFrmInputBoxStr
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'FrmInputBoxStr'
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
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Значение'
  end
  object Edit1: TEdit
    Left = 64
    Top = 12
    Width = 225
    Height = 21
    TabOrder = 0
  end
  object btnOk: TButton
    Left = 130
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
    Left = 220
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
