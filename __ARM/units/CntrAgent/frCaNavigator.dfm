object fCaNavigator: TfCaNavigator
  Left = 0
  Top = 0
  Width = 630
  Height = 611
  TabOrder = 0
  object Splitter2: TSplitter
    Left = 147
    Top = 0
    Width = 3
    Height = 611
    Cursor = crHSplit
  end
  inline fCAGroupList1: TfCAGroupList
    Width = 147
    Height = 611
    Align = alLeft
    inherited OrgTreeView: TTreeView
      Width = 147
      Height = 582
      ChangeDelay = 0
      OnChange = fCAGroupList1OrgTreeViewChange
    end
    inherited ToolBar1: TToolBar
      Width = 147
    end
  end
  object Panel2: TPanel
    Left = 150
    Top = 0
    Width = 480
    Height = 611
    Align = alClient
    Caption = ' '
    TabOrder = 1
    object Splitter3: TSplitter
      Left = 1
      Top = 318
      Width = 478
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 321
      Width = 478
      Height = 289
      Align = alClient
      Caption = 'Представители:  '
      TabOrder = 0
      inline fReprList1: TfReprList
        Left = 2
        Top = 15
        Width = 474
        Height = 272
        Align = alClient
        inherited RxDBGrid1: TRxDBGrid
          Width = 474
          Height = 206
          OnCellClick = fReprList1RxDBGrid1CellClick
        end
        inherited ToolBar1: TToolBar
          Width = 474
        end
        inherited FilterPanel: TPanel
          Width = 474
        end
      end
    end
    inline fCntrAgentList1: TfCntrAgentList
      Left = 1
      Top = 1
      Width = 478
      Height = 317
      Align = alTop
      TabOrder = 1
      inherited Splitter1: TSplitter
        Top = 226
        Width = 478
      end
      inherited RxDBGrid1: TRxDBGrid
        Width = 478
        Height = 160
      end
      inherited ToolBar1: TToolBar
        Width = 478
      end
      inherited FilterPanel: TPanel
        Width = 478
      end
      inherited dbgComment: TDBGrid
        Top = 229
        Width = 478
      end
      inherited dsCAgent: TDataSource
        OnDataChange = fCntrAgentList1dsCAgentDataChange
      end
    end
  end
end
