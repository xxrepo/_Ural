object MovService: TMovService
  Left = 68
  Top = 203
  Width = 860
  Height = 576
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 508
    Width = 852
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 766
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
  inline fMov_Service1: TfMov_Service
    Top = 34
    Width = 852
    Height = 474
    Align = alClient
    TabOrder = 1
    inherited Splitter1: TSplitter
      Width = 852
    end
    inherited dxDBTreeList1: TdxDBTreeList
      Width = 852
    end
    inherited Panel3: TPanel
      Width = 852
    end
    inherited ToolBar1: TToolBar
      Width = 852
    end
    inherited pnDate: TPanel
      Width = 852
    end
    inherited fArc1: TfArc
      Width = 852
      Height = 157
      inherited ToolBar1: TToolBar
        Width = 852
      end
      inherited pnDate: TPanel
        Width = 852
        inherited Panel3: TPanel
          Width = 578
        end
      end
      inherited RxDBGrid1: TDBGridEh
        Width = 852
        Height = 39
      end
      inherited StatusBar1: TStatusBar
        Top = 138
        Width = 852
      end
      inherited ToolBar2: TToolBar
        Width = 852
      end
    end
    inherited dxComponentPrinter2: TdxComponentPrinter
      inherited dxComponentPrinter1Link2: TdxDBTreeListReportLink
        DateTime = 37917.7545199537
        PrinterPage._dxMeasurementUnits_ = 0
        PrinterPage._dxLastMU_ = 2
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 852
    Height = 34
    Align = alTop
    Caption = ' '
    TabOrder = 2
    inline fBsnSelector1: TfBsnSelector
      Width = 361
      Height = 33
      inherited edName: TEdit
        Width = 275
      end
      inherited Button1: TButton
        Left = 330
        Top = 8
        Height = 18
        OnClick = fBsnSelector1Button1Click
      end
    end
  end
end
