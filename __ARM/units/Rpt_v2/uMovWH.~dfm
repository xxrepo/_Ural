object MovWH: TMovWH
  Left = 4
  Top = 4
  Width = 1004
  Height = 569
  Caption = 'Движение товаров/услуг'
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
    Top = 501
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
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 140
      Height = 25
      Caption = 'Расширенный вариант'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 31
    Width = 996
    Height = 470
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
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Склад'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 409
      Top = 5
      Width = 22
      Height = 22
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = fBsnSelector1Button1Click
    end
    object edWH: TEdit
      Left = 64
      Top = 5
      Width = 345
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
  end
  inline fMov_Goods1: TfMov_Goods
    Top = 31
    Width = 996
    Height = 470
    Align = alClient
    TabOrder = 3
    inherited Splitter1: TSplitter
      Width = 996
    end
    inherited dxDBTreeList1: TdxDBTreeList
      Width = 996
    end
    inherited Panel3: TPanel
      Width = 996
    end
    inherited ToolBar1: TToolBar
      Width = 996
    end
    inherited pnDate: TPanel
      Width = 996
      inherited SpeedButton2: TSpeedButton
        OnClick = fMov_Goods1SpeedButton2Click
      end
    end
    inherited fArc1: TfArc
      Width = 996
      Height = 145
      inherited ToolBar1: TToolBar
        Width = 980
      end
      inherited pnDate: TPanel
        Width = 980
        inherited Panel3: TPanel
          Width = 706
        end
      end
      inherited RxDBGrid1: TDBGridEh
        Width = 789
      end
      inherited ToolBar2: TToolBar
        Width = 980
      end
      inherited StatusBar1: TStatusBar
        Width = 980
      end
    end
    inherited dxComponentPrinter2: TdxComponentPrinter
      inherited dxComponentPrinter1Link2: TdxDBTreeListReportLink
        DateTime = 37916.4840996644
        PrinterPage._dxMeasurementUnits_ = 0
        PrinterPage._dxLastMU_ = 2
      end
    end
    inherited cdsMovGoods: TClientDataSet
      inherited cdsMovGoodsTotalSumOld: TFloatField
        DisplayFormat = '0.##'
      end
      inherited cdsMovGoodsTotalSumIn: TFloatField
        DisplayFormat = '0.##'
      end
      inherited cdsMovGoodsTotalSumOut: TFloatField
        DisplayFormat = '0.##'
      end
      inherited cdsMovGoodsTotalSum: TFloatField
        DisplayFormat = '0.##'
      end
      inherited cdsMovGoodsTotalAmountOld: TFloatField
        DisplayFormat = '0.##'
      end
      inherited cdsMovGoodsTotalAmountIn: TFloatField
        DisplayFormat = '0.##'
      end
      inherited cdsMovGoodsTotalAmountOut: TFloatField
        DisplayFormat = '0.##'
      end
      inherited cdsMovGoodsTotalAmount: TFloatField
        DisplayFormat = '0.##'
      end
      inherited cdsMovGoodsTotalAmountRez: TFloatField
        DisplayFormat = '0.##'
      end
      inherited cdsMovGoodsTotalSumRez: TFloatField
        DisplayFormat = '0.##'
      end
      inherited cdsMovGoodsAvgPrice: TFloatField
        DisplayFormat = '0.##'
      end
      inherited cdsMovGoodsAmountDelta: TFloatField
        DisplayFormat = '0.##'
      end
    end
  end
end
