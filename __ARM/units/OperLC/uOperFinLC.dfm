object OperFinLC: TOperFinLC
  Left = 360
  Top = 106
  BorderStyle = bsDialog
  Caption = 'Финансовая операция'
  ClientHeight = 418
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 377
    Width = 555
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 469
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 378
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
  inline fFinOperLC1: TfFinOperLC
    Width = 555
    Height = 377
    Align = alClient
    TabOrder = 1
    inherited PageControl1: TPageControl
      Width = 555
      Height = 377
      inherited tsData: TTabSheet
        inherited Panel1: TPanel
          Width = 547
          inherited DBEdit1: TDBEdit
            Width = 374
          end
          inherited BitBtn3: TBitBtn
            Left = 514
          end
          inherited DBEdit6: TDBEdit
            Width = 375
          end
          inherited BitBtn4: TBitBtn
            Left = 514
          end
          inherited DBEdit8: TDBEdit
            Width = 397
          end
        end
        inherited Panel3: TPanel
          Width = 547
          Height = 49
          inherited DBEdit7: TDBEdit
            Width = 397
          end
        end
        inherited Panel2: TPanel
          Width = 547
          inherited fCurSelector1: TfCurSelector
            Width = 341
            inherited cbCur: TComboBox
              Width = 236
            end
          end
        end
        inherited GroupBox2: TGroupBox
          Width = 547
          inherited DBEdit10: TDBEdit
            Width = 397
          end
          inherited DBEdit13: TDBEdit
            Width = 397
          end
          inherited DBEdit14: TDBEdit
            Width = 397
          end
        end
        inherited GroupBox1: TGroupBox
          Width = 547
          inherited Panel8: TPanel
            Width = 543
            inherited fCurSelector2: TfCurSelector
              Width = 338
              inherited cbCur: TComboBox
                Width = 236
              end
            end
          end
          inherited Panel9: TPanel
            Width = 543
          end
        end
      end
      inherited tsComment: TTabSheet
        inherited ToolBar2: TToolBar
          Width = 496
        end
        inherited dbgComment: TDBGrid
          Width = 496
          Height = 407
        end
      end
    end
  end
end
