object CRepCtgSelector: TCRepCtgSelector
  Left = 265
  Top = 120
  Width = 636
  Height = 424
  Caption = 'Выбор категории'
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
    Top = 356
    Width = 628
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnDel: TSpeedButton
      Left = 19
      Top = 8
      Width = 80
      Height = 25
      Caption = 'Отцепить'
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C007C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        007C1F7C1F7C1F7C007C007C007C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C007C007C007C007C1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C
        1F7C1F7C1F7C1F7C1F7C007C007C007C1F7C1F7C1F7C1F7C1F7C1F7C007C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C1F7C1F7C1F7C1F7C007C007C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C1F7C1F7C007C007C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C007C007C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C007C007C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C1F7C1F7C007C007C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C007C007C007C007C1F7C1F7C1F7C1F7C007C007C1F7C
        1F7C1F7C1F7C1F7C007C007C007C007C1F7C1F7C1F7C1F7C1F7C1F7C007C007C
        1F7C1F7C1F7C1F7C007C007C007C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        007C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
      OnClick = btnDelClick
    end
    object btnCancel: TButton
      Left = 542
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 451
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      Enabled = False
      ModalResult = 1
      TabOrder = 0
    end
  end
  inline fCRepCtgTree1: TfCRepTree
    Width = 628
    Height = 356
    Align = alClient
    TabOrder = 1
    inherited TreeView1: TTreeView
      Width = 628
      Height = 327
      OnChange = fWareCtgTree1TreeView1Change
      OnCustomDrawItem = fWareCtgTree1TreeView1CustomDrawItem
    end
    inherited ToolBar1: TToolBar
      Width = 628
    end
  end
end
