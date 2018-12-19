object BJList_v2: TBJList_v2
  Left = 186
  Top = 107
  Width = 879
  Height = 380
  Caption = 'Á‏הזוע םא דמה'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inline fBJList1: TfBJList_v2
    Width = 863
    Height = 341
    inherited Splitter1: TSplitter
      Width = 863
    end
    inherited RxDBGrid1: TDBGridEh
      Width = 863
    end
    inherited ToolBar: TToolBar
      Width = 863
    end
    inherited FilterPanel: TPanel
      Width = 863
    end
    inherited pnDate: TPanel
      Width = 863
    end
    inherited fBJTree1: TfBJTree_v2
      Width = 863
      Height = 188
      inherited ToolBar1: TToolBar
        Width = 863
        inherited Label2: TLabel [0]
          Left = 0
          Top = 2
        end
        inherited ToolButton1: TToolButton [1]
          Left = 26
        end
        inherited RxSpeedButton1: TRxSpeedButton [2]
          Left = 30
        end
        inherited ToolButton2: TToolButton [3]
          Left = 86
        end
        inherited ToolButton3: TToolButton [4]
          Left = 109
        end
        inherited ToolButton4: TToolButton [5]
          Left = 114
        end
        inherited ToolButton5: TToolButton [6]
          Left = 137
        end
        inherited ToolButton6: TToolButton [7]
          Left = 145
        end
        inherited ToolButton7: TToolButton [8]
          Left = 168
        end
        inherited ToolButton8: TToolButton [9]
          Left = 176
        end
        inherited ToolButton9: TToolButton [10]
          Left = 199
        end
        inherited ToolButton12: TToolButton [11]
          Left = 207
        end
        inherited ToolButton11: TToolButton [12]
          Left = 230
        end
        inherited ceOper: TEdit [13]
          Left = 243
          Top = 2
        end
        inherited Label32: TLabel [14]
          Left = 452
          Top = 2
        end
        inherited RxSpeedButton2: TRxSpeedButton [15]
          Left = 525
        end
        inherited ToolButton14: TToolButton [16]
          Left = 639
        end
        inherited ToolButtonSep13: TToolButton [17]
          Left = 647
          Wrap = False
        end
        inherited dtTo: TDateTimePicker [18]
          Left = 658
          Top = 2
        end
        inherited ToolButton10: TToolButton [19]
          Left = 759
          Top = 2
        end
      end
      inherited dxDBTreeList1: TdxDBTreeList
        Width = 863
        Height = 159
      end
    end
  end
end
