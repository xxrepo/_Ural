object ReLink: TReLink
  Left = 181
  Top = 106
  BorderStyle = bsDialog
  Caption = 'Переназначение'
  ClientHeight = 161
  ClientWidth = 495
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
    Top = 8
    Width = 117
    Height = 13
    Caption = 'Исправляемый объект'
  end
  object Label2: TLabel
    Left = 8
    Top = 72
    Width = 82
    Height = 13
    Caption = 'Новое значение'
  end
  object Panel2: TPanel
    Left = 0
    Top = 120
    Width = 495
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 409
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
      Left = 318
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
  object BitBtn3: TBitBtn
    Left = 461
    Top = 88
    Width = 24
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn3Click
  end
  object edNew: TEdit
    Left = 8
    Top = 88
    Width = 455
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 8
    Top = 32
    Width = 476
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 3
  end
end
