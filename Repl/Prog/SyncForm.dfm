object fSyncForm: TfSyncForm
  Left = 186
  Top = 106
  BorderStyle = bsDialog
  Caption = 'Синхронизация'
  ClientHeight = 247
  ClientWidth = 326
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
    Left = 16
    Top = 8
    Width = 206
    Height = 13
    Caption = 'Синхронизировать следующие объекты:'
  end
  object Panel2: TPanel
    Left = 0
    Top = 206
    Width = 326
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 240
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
      Left = 149
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'ОК'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
  object cbUser: TCheckBox
    Left = 16
    Top = 32
    Width = 200
    Height = 17
    Caption = 'Пользователи'
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object cbObj: TCheckBox
    Left = 16
    Top = 56
    Width = 200
    Height = 17
    Caption = 'Счета, склады, представители'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object cbGoods: TCheckBox
    Left = 16
    Top = 80
    Width = 200
    Height = 17
    Caption = 'Товары'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object cbWHState: TCheckBox
    Left = 16
    Top = 104
    Width = 200
    Height = 17
    Caption = 'Состоянис склада'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
end
