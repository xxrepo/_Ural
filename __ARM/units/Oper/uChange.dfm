object ChangeOper: TChangeOper
  Left = 168
  Top = 107
  Width = 685
  Height = 480
  Caption = 'Редакции операций'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 337
    Top = 0
    Width = 3
    Height = 412
    Cursor = crHSplit
  end
  object Panel2: TPanel
    Left = 0
    Top = 412
    Width = 677
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 16
      Top = 6
      Width = 177
      Height = 29
      Caption = 'Принять изменения'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 208
      Top = 6
      Width = 169
      Height = 29
      Caption = 'Оставить без изменений'
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 497
      Top = 6
      Width = 169
      Height = 29
      Caption = 'Закрыть'
      OnClick = SpeedButton3Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 412
    Align = alLeft
    Caption = ' '
    TabOrder = 1
    inline fDataOld: TfOperOldData
      Left = 1
      Top = 1
      Width = 335
      Height = 410
      Align = alClient
      inherited StringGrid1: TStringGrid
        Width = 335
        Height = 410
      end
    end
  end
  object Panel3: TPanel
    Left = 340
    Top = 0
    Width = 337
    Height = 412
    Align = alClient
    Caption = ' '
    TabOrder = 2
    inline fDataNew: TfOperOldData
      Left = 1
      Top = 1
      Width = 335
      Height = 410
      Align = alClient
      inherited StringGrid1: TStringGrid
        Width = 335
        Height = 410
      end
    end
  end
end
