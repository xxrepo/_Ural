object FrmuInputQuery_Grp: TFrmuInputQuery_Grp
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'FrmuInputQuery_Grp'
  ClientHeight = 101
  ClientWidth = 392
  Color = clBtnFace
  Constraints.MinHeight = 128
  Constraints.MinWidth = 350
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 60
    Align = alClient
    Caption = ' '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Edit1: TEdit
      Left = 72
      Top = 4
      Width = 312
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'Edit1'
    end
    object cbShowInRoot: TCheckBox
      Left = 72
      Top = 32
      Width = 241
      Height = 17
      Caption = 'Отображать в первом уровне баланса'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 60
    Width = 392
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object btnCancel: TButton
      Left = 294
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akBottom]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 0
    end
    object btnOk: TButton
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
end
