object APNList: TAPNList
  Left = 181
  Top = 103
  Width = 783
  Height = 632
  Caption = 'Начисление процентов'
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
  inline fBsnSelector1: TfBsnSelector
    Width = 775
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
  inline fAPNList1: TfAPNList
    Top = 33
    Width = 775
    Height = 572
    Align = alClient
    TabOrder = 1
    inherited Splitter1: TSplitter
      Width = 775
    end
    inherited RxDBGrid1: TRxDBGrid
      Width = 775
    end
    inherited ToolBar: TToolBar
      Width = 775
      inherited btnDoAll: TButton
        Width = 144
        Caption = 'Начислить по времени'
      end
    end
    inherited FilterPanel: TPanel
      Width = 775
    end
    inherited RxDBGrid2: TRxDBGrid
      Width = 775
      Height = 353
    end
    inherited ToolBar1: TToolBar
      Width = 775
    end
  end
end
