object WHAvg: TWHAvg
  Left = 136
  Top = 53
  Width = 1004
  Height = 612
  Caption = 'Средние остатки на складах'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 544
    Width = 996
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 910
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Закрыть'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCancelClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 193
    Width = 996
    Height = 351
    Align = alClient
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 996
    Height = 31
    Align = alTop
    Caption = ' '
    TabOrder = 2
    inline fBsnSelector1: TfBsnSelector
      Left = 1
      Top = 1
      Width = 278
      Height = 29
      Align = alLeft
      inherited edName: TEdit
        Width = 192
      end
      inherited Button1: TButton
        Left = 247
        OnClick = fBsnSelector1Button1Click
      end
    end
  end
  inline fAvg_Goods1: TfAvg_Goods
    Top = 193
    Width = 996
    Height = 351
    Align = alClient
    TabOrder = 3
    inherited dxDBTreeList1: TdxDBTreeList
      Width = 996
      Height = 252
    end
    inherited Panel3: TPanel
      Width = 996
    end
    inherited ToolBar1: TToolBar
      Width = 996
    end
    inherited pnDate: TPanel
      Width = 996
      inherited Panel1: TPanel
        inherited BitBtn2: TBitBtn
          OnClick = fAvg_Goods1BitBtn2Click
        end
      end
    end
    inherited dxComponentPrinter2: TdxComponentPrinter
      inherited dxComponentPrinter1Link2: TdxDBTreeListReportLink
        DateTime = 38781.0888915162
        PrinterPage._dxMeasurementUnits_ = 0
        PrinterPage._dxLastMU_ = 2
      end
    end
    inherited cdsWHAvg: TClientDataSet
      inherited cdsWHAvgTotalSumOld: TFloatField
        DisplayFormat = '0.00'
      end
      inherited cdsWHAvgTotalAmountOld: TFloatField
        DisplayFormat = '0.00'
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 31
    Width = 996
    Height = 162
    Align = alTop
    Caption = ' '
    TabOrder = 4
    object Splitter1: TSplitter
      Left = 409
      Top = 1
      Width = 3
      Height = 160
      Cursor = crHSplit
    end
    object p1: TGroupBox
      Left = 1
      Top = 1
      Width = 408
      Height = 160
      Align = alLeft
      Caption = 'Склады и группы'
      TabOrder = 0
      inline fObjListWH: TfObjList
        Left = 2
        Top = 15
        Width = 404
        Height = 143
        Align = alClient
        inherited ToolBar1: TToolBar
          Width = 404
        end
        inherited RxDBGrid1: TRxDBGrid
          Width = 404
          Height = 116
          TitleFont.Charset = RUSSIAN_CHARSET
        end
      end
    end
    object p2: TGroupBox
      Left = 412
      Top = 1
      Width = 583
      Height = 160
      Align = alClient
      Caption = 'Товары/категории'
      TabOrder = 1
      inline fObjListWare: TfObjList
        Left = 2
        Top = 15
        Width = 579
        Height = 143
        Align = alClient
        inherited ToolBar1: TToolBar
          Width = 579
        end
        inherited RxDBGrid1: TRxDBGrid
          Width = 579
          Height = 116
          TitleFont.Charset = RUSSIAN_CHARSET
        end
      end
    end
  end
end
