object FltPropSelector: TFltPropSelector
  Left = 218
  Top = 96
  Width = 395
  Height = 565
  Caption = 'FltPropSelector'
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
  object Panel2: TPanel
    Left = 0
    Top = 497
    Width = 387
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 301
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Закрыть'
      ModalResult = 2
      TabOrder = 0
    end
    object Button1: TButton
      Left = 205
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'OK'
      Enabled = False
      ModalResult = 1
      TabOrder = 1
    end
  end
  inline UFTree1: TUFTree
    Width = 387
    Height = 497
    Align = alClient
    TabOrder = 1
    inherited TBar: TToolBar
      Width = 387
    end
    inherited ObjView: TTreeView
      Width = 387
      Height = 472
      OnChange = UFTree1ObjViewChange
    end
  end
end
