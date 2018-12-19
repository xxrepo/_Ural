object BJTreeSel: TBJTreeSel
  Left = 192
  Top = 107
  Width = 973
  Height = 522
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Выбор группы'
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
    Top = 454
    Width = 965
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
      Left = 879
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
      Left = 788
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
  inline fBJTree1: TfBJTree
    Width = 965
    Height = 454
    Align = alClient
    TabOrder = 1
    inherited ToolBar1: TToolBar
      Width = 965
    end
    inherited dxDBTreeList1: TdxDBTreeList
      Width = 965
      Height = 425
      OnChangeNode = fBJTree1dxDBTreeList1ChangeNode
    end
  end
end
