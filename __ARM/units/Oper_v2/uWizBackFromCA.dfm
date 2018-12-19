object WizBackFromCA: TWizBackFromCA
  Left = 313
  Top = 253
  Width = 675
  Height = 320
  Caption = 'Отмена отгрузки'
  Color = clBtnFace
  Constraints.MinHeight = 320
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 252
    Width = 667
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 581
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOk: TButton
      Left = 490
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  inline fWizBackFromCA1: TfWizBackFromCA
    Width = 667
    Height = 252
    Align = alClient
    TabOrder = 1
    inherited GroupBox1: TGroupBox
      Width = 667
      inherited Label3: TLabel
        Left = 443
      end
      inherited DBEdit3: TDBEdit
        Width = 538
      end
      inherited DBEdit12: TDBEdit
        Width = 323
      end
      inherited DBEdit8: TDBEdit
        Left = 489
      end
      inherited ed: TDBEdit
        Width = 561
      end
      inherited Panel2: TPanel
        Width = 663
        inherited fCurSelector1: TfCurSelector
          Width = 297
          inherited cbCur: TComboBox
            Width = 195
          end
        end
        inherited fCurSelector2: TfCurSelector
          Left = 299
          inherited cbCur: TComboBox
            Width = 237
          end
        end
      end
      inherited BitBtn1: TBitBtn
        Left = 638
      end
    end
    inherited gbWare: TGroupBox
      Width = 667
      Height = 131
      inherited DBGridEh1: TDBGridEh
        Width = 639
        Height = 114
      end
      inherited ToolBar3: TToolBar
        Left = 641
        Height = 114
      end
    end
    inherited cdsOperFin: TClientDataSet
      Top = 38
    end
    inherited dsOperFin: TDataSource
      Top = 38
    end
    inherited cdsOperWare: TClientDataSet
      Top = 58
    end
    inherited dsOperWare: TDataSource
      Left = 100
      Top = 47
    end
  end
end
