object CurProp: TCurProp
  Left = 360
  Top = 103
  ActiveControl = fCurProp1.DBEdit1
  BorderStyle = bsDialog
  Caption = 'Валюта'
  ClientHeight = 197
  ClientWidth = 402
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
  object Panel2: TPanel
    Left = 0
    Top = 156
    Width = 402
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 316
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 225
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  inline fCurProp1: TfCurProp
    Width = 402
    Height = 156
    Align = alClient
    TabOrder = 1
    inherited RxDBLookupCombo1: TRxDBLookupCombo
      TabOrder = 7
    end
    inherited DBEdit6: TRxDBCalcEdit
      TabOrder = 6
    end
  end
end
