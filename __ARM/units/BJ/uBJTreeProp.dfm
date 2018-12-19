object BJTreeProp1: TBJTreeProp1
  Left = 192
  Top = 107
  Width = 440
  Height = 133
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Категория'
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
    Top = 65
    Width = 432
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 346
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 255
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
  inline fBJTreeProp1: TfBJTreeProp
    Width = 432
    Height = 65
    Align = alClient
    Constraints.MinHeight = 65
    TabOrder = 1
    inherited pBase: TPanel
      Width = 432
    end
    inherited Panel1: TPanel
      Width = 432
    end
  end
end
