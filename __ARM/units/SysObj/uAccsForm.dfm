object AccsForm: TAccsForm
  Left = 306
  Top = 107
  Width = 580
  Height = 389
  Caption = 'Счета'
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
    Top = 321
    Width = 572
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 382
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 473
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  inline AccsFrame1: TAccsFrame
    Width = 572
    Height = 321
    Align = alClient
    TabOrder = 1
    inherited Splitter1: TSplitter
      Height = 321
    end
    inherited Panel1: TPanel
      Width = 384
      Height = 321
      inherited FilterPanel: TPanel
        Width = 382
      end
      inherited ToolBar: TToolBar
        Width = 382
      end
      inherited RxDBGrid1: TRxDBGrid
        Width = 382
        Height = 254
      end
    end
    inherited Panel2: TPanel
      Height = 321
      inherited fAccGroup1: TfAccGroup
        Height = 319
        inherited OrgTreeView: TTreeView
          Height = 290
        end
      end
    end
  end
end
