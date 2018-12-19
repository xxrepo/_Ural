object BusinessesForm: TBusinessesForm
  Left = 179
  Top = 153
  Width = 492
  Height = 379
  Caption = 'Бизнесы'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inline BusinessesFrame1: TBusinessesFrame
    Width = 484
    Height = 311
    Align = alClient
    inherited ToolBar: TToolBar
      Width = 484
    end
    inherited RxDBGrid1: TRxDBGrid
      Width = 484
      Height = 246
      OnDblClick = BusinessesFrame1RxDBGrid1DblClick
    end
    inherited FilterPanel: TPanel
      Width = 484
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 311
    Width = 484
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object btnCancel: TButton
      Left = 399
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 308
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
  end
end
