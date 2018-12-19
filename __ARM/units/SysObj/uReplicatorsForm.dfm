object ReplicatorsForm: TReplicatorsForm
  Left = 192
  Top = 107
  Width = 573
  Height = 421
  Caption = 'Репликаторы'
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
    Top = 360
    Width = 565
    Height = 34
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 384
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 472
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  inline ReplicatorsFrame1: TReplicatorsFrame
    Width = 565
    Height = 360
    Align = alClient
    TabOrder = 1
    inherited ToolBar: TToolBar
      Width = 565
    end
    inherited RxDBGrid1: TRxDBGrid
      Width = 565
      Height = 295
    end
    inherited FilterPanel: TPanel
      Width = 565
    end
  end
end
