object BankData: TBankData
  Left = 210
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Банковские реквизиты'
  ClientHeight = 180
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 25
    Height = 13
    Caption = 'Банк'
  end
  object Label2: TLabel
    Left = 8
    Top = 36
    Width = 22
    Height = 13
    Caption = 'БИК'
  end
  object Label3: TLabel
    Left = 8
    Top = 60
    Width = 52
    Height = 13
    Caption = 'Расч. счет'
  end
  object Label4: TLabel
    Left = 8
    Top = 84
    Width = 53
    Height = 13
    Caption = 'Корр. счет'
  end
  object Panel2: TPanel
    Left = 0
    Top = 139
    Width = 385
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 299
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
      Left = 208
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
  object edBank: TEdit
    Left = 72
    Top = 7
    Width = 300
    Height = 21
    MaxLength = 255
    TabOrder = 1
  end
  object edBIK: TEdit
    Left = 72
    Top = 32
    Width = 121
    Height = 21
    MaxLength = 10
    TabOrder = 2
  end
  object edAcc: TEdit
    Left = 72
    Top = 56
    Width = 300
    Height = 21
    MaxLength = 255
    TabOrder = 3
  end
  object edCorrAcc: TEdit
    Left = 72
    Top = 80
    Width = 300
    Height = 21
    MaxLength = 255
    TabOrder = 4
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 112
    Width = 217
    Height = 17
    Caption = 'Использовать по умолчанию'
    TabOrder = 5
  end
end
