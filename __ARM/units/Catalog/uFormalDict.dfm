object FormalDict: TFormalDict
  Left = 181
  Top = 103
  Width = 783
  Height = 540
  Caption = 'Формальное распределение'
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
  inline fFormalDict1: TfFormalDict
    Top = 33
    Width = 775
    Height = 480
    Align = alClient
    inherited RxDBGrid1: TRxDBGrid
      Width = 775
      Height = 415
    end
    inherited ToolBar: TToolBar
      Width = 775
    end
    inherited FilterPanel: TPanel
      Width = 775
    end
  end
  inline fBsnSelector1: TfBsnSelector
    Width = 775
    Height = 33
    Align = alTop
    TabOrder = 1
    inherited edName: TEdit
      Width = 689
    end
    inherited Button1: TButton
      Left = 744
      OnClick = fBsnSelector1Button1Click
    end
  end
end
