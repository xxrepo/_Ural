object BJList: TBJList
  Left = 186
  Top = 107
  Width = 879
  Height = 380
  Caption = 'ֱ‏הזועû'
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
  inline fBJList1: TfBJList
    Width = 871
    Height = 353
    inherited Splitter1: TSplitter
      Width = 871
    end
    inherited RxDBGrid1: TDBGridEh
      Width = 871
    end
    inherited ToolBar: TToolBar
      Width = 871
    end
    inherited FilterPanel: TPanel
      Width = 871
    end
    inherited pnDate: TPanel
      Width = 871
    end
    inherited fBJTree1: TfBJTree
      Width = 871
      Height = 91
      inherited ToolBar1: TToolBar
        Width = 871
      end
      inherited dxDBTreeList1: TdxDBTreeList
        Width = 871
        Height = 62
      end
    end
  end
end
