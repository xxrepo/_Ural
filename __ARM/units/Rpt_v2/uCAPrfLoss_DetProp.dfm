object CAPrfLoss_Det_Prop: TCAPrfLoss_Det_Prop
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Выбор типов операций'
  ClientHeight = 180
  ClientWidth = 379
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
  object btnOk: TButton
    Left = 195
    Top = 152
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
    Left = 285
    Top = 152
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 1
  end
  object cbWareProff: TCheckBox
    Left = 8
    Top = 8
    Width = 150
    Height = 17
    Caption = 'Складские, прибыль'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object cbFinProff: TCheckBox
    Left = 8
    Top = 40
    Width = 150
    Height = 17
    Caption = 'Финансовые, прибыль'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object cbOffProff: TCheckBox
    Left = 8
    Top = 72
    Width = 150
    Height = 17
    Caption = 'Зачеты, прибыль'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object cbCurProff: TCheckBox
    Left = 8
    Top = 105
    Width = 150
    Height = 17
    Caption = 'Курсовые, прибыль'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object cbWareLoss: TCheckBox
    Left = 216
    Top = 8
    Width = 150
    Height = 17
    Caption = 'Складские, затраты'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object cbFinLoss: TCheckBox
    Left = 216
    Top = 40
    Width = 150
    Height = 17
    Caption = 'Финансовые, затраты'
    Checked = True
    State = cbChecked
    TabOrder = 7
  end
  object cbOffLoss: TCheckBox
    Left = 216
    Top = 72
    Width = 150
    Height = 17
    Caption = 'Зачеты, затраты'
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
  object cbCurLoss: TCheckBox
    Left = 216
    Top = 104
    Width = 150
    Height = 17
    Caption = 'Курсовые, затраты'
    Checked = True
    State = cbChecked
    TabOrder = 9
  end
end
