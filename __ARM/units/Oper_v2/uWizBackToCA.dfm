object WizBackToCA: TWizBackToCA
  Left = 234
  Top = 102
  Width = 658
  Height = 400
  Caption = 'Отмена прихода товара'
  Color = clBtnFace
  Constraints.MinHeight = 400
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
    Top = 332
    Width = 650
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 564
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
      Left = 473
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
  inline fWizBackToCA1: TfWizBackToCA
    Width = 650
    Height = 332
    Align = alClient
    TabOrder = 1
    inherited GroupBox1: TGroupBox
      Width = 650
      inherited Label3: TLabel
        Left = 426
      end
      inherited DBEdit3: TDBEdit
        Width = 544
      end
      inherited DBEdit12: TDBEdit
        Width = 306
      end
      inherited DBEdit8: TDBEdit
        Left = 472
      end
      inherited ed: TDBEdit
        Width = 544
      end
      inherited Panel2: TPanel
        Width = 646
        inherited fCurSelector1: TfCurSelector
          inherited cbCur: TComboBox
            Width = 114
          end
        end
        inherited fCurSelector2: TfCurSelector
          inherited cbCur: TComboBox
            Width = 118
          end
          inherited cdsCur: TClientDataSet
            Left = 112
            Top = 65528
          end
        end
        inherited fCurSelectorBsn: TfCurSelector
          Width = 232
          inherited cbCur: TComboBox
            Width = 130
          end
        end
      end
    end
    inherited gbWare: TGroupBox
      Width = 650
      Height = 145
      inherited DBGridEh1: TDBGridEh
        Width = 622
        Height = 128
      end
      inherited ToolBar3: TToolBar
        Left = 624
        Height = 128
      end
    end
    inherited GroupBox2: TGroupBox
      Width = 650
    end
  end
end
