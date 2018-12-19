object fTreeChItem: TfTreeChItem
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  object tvChild: TTreeView
    Left = 0
    Top = 0
    Width = 320
    Height = 240
    Align = alClient
    ChangeDelay = 50
    HideSelection = False
    Indent = 19
    ReadOnly = True
    RowSelect = True
    ShowRoot = False
    TabOrder = 0
    OnDblClick = tvChildDblClick
    OnGetImageIndex = tvChildGetImageIndex
    OnGetSelectedIndex = tvChildGetSelectedIndex
  end
end
