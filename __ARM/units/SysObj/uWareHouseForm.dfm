object WareHouseForm: TWareHouseForm
  Left = 252
  Top = 134
  Width = 554
  Height = 370
  Caption = 'Склады'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 306
    Width = 546
    Height = 37
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 464
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отказ'
      ModalResult = 2
      TabOrder = 1
    end
  end
  inline WareHouseFrame1: TWareHouseFrame
    Width = 546
    Height = 306
    Align = alClient
    TabOrder = 1
    inherited ToolBar: TToolBar
      Width = 546
    end
    inherited RxDBGrid1: TRxDBGrid
      Width = 546
      Height = 241
    end
    inherited FilterPanel: TPanel
      Width = 546
    end
  end
end
