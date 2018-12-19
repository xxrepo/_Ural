object APList: TAPList
  Left = 181
  Top = 103
  Width = 783
  Height = 540
  Caption = 'Условия для генерирования операций'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 220
    Width = 767
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  inline fBsnSelector1: TfBsnSelector
    Width = 767
    Height = 33
    Align = alTop
    inherited edName: TEdit
      Width = 689
    end
    inherited Button1: TButton
      Left = 744
      OnClick = fBsnSelector1Button1Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 33
    Width = 767
    Height = 187
    Align = alTop
    Caption = 'Условия'
    TabOrder = 1
    inline fApList1: TfAPList
      Left = 2
      Top = 15
      Width = 763
      Height = 170
      Align = alClient
      inherited RxDBGrid1: TRxDBGrid
        Width = 763
        Height = 105
      end
      inherited ToolBar: TToolBar
        Width = 763
      end
      inherited FilterPanel: TPanel
        Width = 763
      end
      inherited dsFltList: TDataSource
        OnDataChange = fApList1dsFltListDataChange
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 223
    Width = 767
    Height = 278
    Align = alClient
    Caption = 'Операции'
    TabOrder = 2
    inline fAPListOper1: TfAPListOper
      Left = 2
      Top = 15
      Width = 763
      Height = 261
      Align = alClient
      inherited RxDBGrid1: TRxDBGrid
        Width = 763
        Height = 196
      end
      inherited ToolBar: TToolBar
        Width = 763
        inherited ToolButton2: TToolButton
          OnClick = nil
        end
      end
      inherited FilterPanel: TPanel
        Width = 763
      end
    end
  end
end
