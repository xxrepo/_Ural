object fDualList: TfDualList
  Left = 0
  Top = 0
  Width = 875
  Height = 338
  Align = alClient
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Splitter1: TAdvSplitter
    Left = 281
    Top = 0
    Width = 3
    Height = 338
    Cursor = crHSplit
    Visible = False
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = clWhite
    Appearance.ColorTo = clSilver
    Appearance.ColorHot = clWhite
    Appearance.ColorHotTo = clGray
    GripStyle = sgDots
  end
  object SrcPanel: TPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 338
    Align = alLeft
    Caption = ' '
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 279
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 0
      object SrcLabel: TLabel
        Left = 4
        Top = 4
        Width = 55
        Height = 13
        Caption = 'Список 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object SrcList: TTextListBox
      Left = 1
      Top = 25
      Width = 279
      Height = 312
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      MultiSelect = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 1
      OnClick = ListClick
      OnDblClick = IncBtnClick
      OnDragDrop = SrcListDragDrop
      OnDragOver = SrcListDragOver
      OnKeyDown = SrcListKeyDown
    end
  end
  object DestPanel: TPanel
    Left = 324
    Top = 0
    Width = 551
    Height = 338
    Align = alClient
    Caption = ' '
    TabOrder = 1
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 549
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 0
      object DstLabel: TLabel
        Left = 8
        Top = 4
        Width = 55
        Height = 13
        Caption = 'Список 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object DstList: TTextListBox
      Left = 1
      Top = 25
      Width = 549
      Height = 312
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      MultiSelect = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ListClick
      OnDblClick = ExclBtnClick
      OnDragDrop = DstListDragDrop
      OnDragOver = DstListDragOver
      OnKeyDown = DstListKeyDown
    end
  end
  object BtnPanel: TPanel
    Left = 284
    Top = 0
    Width = 40
    Height = 338
    Align = alLeft
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 2
    object IncBtn: TButton
      Left = 6
      Top = 32
      Width = 26
      Height = 26
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = IncBtnClick
    end
    object IncAllBtn: TButton
      Left = 6
      Top = 64
      Width = 26
      Height = 26
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = IncAllBtnClick
    end
    object ExclBtn: TButton
      Left = 6
      Top = 97
      Width = 26
      Height = 26
      Caption = '<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ExclBtnClick
    end
    object ExclAllBtn: TButton
      Left = 6
      Top = 129
      Width = 26
      Height = 26
      Caption = '<<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = ExclAllBtnClick
    end
  end
end
