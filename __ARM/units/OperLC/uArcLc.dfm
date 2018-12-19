object ArcLc: TArcLc
  Left = 172
  Top = 96
  Width = 783
  Height = 540
  Caption = 'Архив'
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
  inline fArcLc1: TfArcLc
    Width = 775
    Height = 513
    Align = alClient
    inherited ToolBar1: TToolBar
      Width = 775
      inherited ToolButton9: TToolButton
        Left = 0
        Wrap = True
      end
      inherited ToolButton6: TToolButton
        Left = 0
        Top = 43
      end
      inherited ToolButton7: TToolButton
        Left = 84
        Top = 43
      end
      inherited RxSpeedButton2: TRxSpeedButton
        Left = 112
        Top = 43
      end
      inherited ToolButton11: TToolButton
        Left = 195
        Top = 43
      end
      inherited ToolButton12: TToolButton
        Left = 203
        Top = 43
      end
      inherited ToolButton14: TToolButton
        Left = 287
        Top = 43
      end
      inherited ToolButton13: TToolButton
        Left = 371
        Top = 43
      end
      inherited RxSpeedButton3: TRxSpeedButton
        Left = 379
        Top = 43
      end
    end
    inherited pnDate: TPanel
      Width = 775
      inherited Panel3: TPanel
        Width = 397
      end
    end
    inherited StatusBar1: TStatusBar
      Top = 494
      Width = 775
    end
    inherited RxDBGrid1: TDBGridEh
      Width = 775
      Height = 424
    end
  end
end
