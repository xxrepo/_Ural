object CAList: TCAList
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Контрагенты'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inline fCaNavigator1: TfCaNavigator
    Width = 688
    Height = 453
    Align = alClient
    inherited Splitter2: TSplitter
      Height = 453
    end
    inherited fCAGroupList1: TfCAGroupList
      Height = 453
      inherited OrgTreeView: TTreeView
        Height = 424
      end
    end
    inherited Panel2: TPanel
      Width = 538
      Height = 453
      inherited Splitter3: TSplitter
        Width = 536
      end
      inherited fCntrAgentList1: TfCntrAgentList
        Width = 536
        inherited RxDBGrid1: TRxDBGrid
          Width = 536
        end
        inherited ToolBar1: TToolBar
          Width = 536
        end
      end
      inherited GroupBox1: TGroupBox
        Width = 536
        Height = 280
        inherited fReprList1: TfReprList
          Width = 532
          Height = 263
          inherited RxDBGrid1: TRxDBGrid
            Width = 532
            Height = 222
          end
          inherited ToolBar1: TToolBar
            Width = 532
          end
        end
      end
    end
  end
end
