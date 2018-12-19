object ObjName: TObjName
  Left = 266
  Top = 107
  Width = 403
  Height = 306
  BorderIcons = [biSystemMenu]
  Caption = 'ObjName'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 50
    Height = 13
    Caption = 'Название'
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 50
    Height = 13
    Caption = 'Описание'
  end
  object Panel2: TPanel
    Left = 0
    Top = 238
    Width = 395
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 2
    object btnCancel: TButton
      Left = 297
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 0
    end
    object btnOk: TButton
      Left = 211
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
  end
  object Edit1: TEdit
    Left = 72
    Top = 4
    Width = 313
    Height = 21
    MaxLength = 50
    TabOrder = 0
    Text = 'Edit1'
  end
  object Memo1: TMemo
    Left = 72
    Top = 32
    Width = 313
    Height = 177
    Lines.Strings = (
      'Memo1')
    MaxLength = 1000
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object CheckBox1: TAdvOfficeCheckBox
    Left = 72
    Top = 216
    Width = 97
    Height = 17
    Caption = 'Основная'
    TabOrder = 3
  end
end
