object RptForm: TRptForm
  Left = 173
  Top = 190
  Width = 837
  Height = 540
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'RptForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
  object Panel1: TPanel
    Left = 0
    Top = 472
    Width = 829
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 743
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
  inline fRptFrame1: TfRptFrame
    Width = 829
    Height = 472
    Align = alClient
    TabOrder = 1
    inherited Splitter1: TSplitter
      Width = 829
    end
    inherited RxDBGrid1: TRxDBGrid
      Width = 829
    end
    inherited Panel3: TPanel
      Width = 829
      inherited SpeedButton1: TSpeedButton
        OnClick = fRptFrame1SpeedButton1Click
      end
    end
    inherited fArc1: TfArc
      Width = 829
      Height = 337
      inherited ToolBar1: TToolBar
        Width = 829
      end
      inherited pnDate: TPanel
        Width = 829
        inherited Panel3: TPanel
          Width = 555
        end
      end
      inherited RxDBGrid1: TDBGridEh
        Width = 829
        Height = 219
      end
      inherited ToolBar2: TToolBar
        Width = 829
        inherited EhGridFilter1: TEhGridFilter
          Width = 61
        end
      end
      inherited StatusBar1: TStatusBar
        Top = 318
        Width = 829
      end
    end
  end
end
