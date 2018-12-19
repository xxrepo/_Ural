object fShowFlt: TfShowFlt
  Left = 185
  Top = 107
  Width = 783
  Height = 540
  Caption = 'Условия поиска'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 472
    Width = 775
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 689
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Закрыть'
      ModalResult = 2
      TabOrder = 0
    end
    object Button1: TButton
      Left = 593
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'OK'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  inline UFFrame1: TUFFrame
    Width = 775
    Height = 472
    Align = alClient
    TabOrder = 1
    inherited Splitter1: TSplitter
      Height = 472
    end
    inherited Panel1: TPanel
      Width = 587
      Height = 472
      inherited Splitter2: TSplitter
        Width = 585
      end
      inherited ToolBar1: TToolBar
        Width = 585
      end
      inherited CondBox: TGroupBox
        Width = 585
        inherited TypeCondBox: TComboBox
          Width = 390
        end
      end
      inherited GroupBox2: TGroupBox
        Width = 585
        Height = 265
        inherited CondGrid: TRxDrawGrid
          Width = 581
          Height = 248
        end
      end
    end
    inherited panLeft: TPanel
      Height = 472
      inherited UFTree1: TUFTree
        Height = 470
        inherited TBar: TToolBar
          inherited AddBtn2: TToolButton
            Action = UFFrame1.aAdd
          end
        end
        inherited ObjView: TTreeView
          Height = 445
        end
      end
    end
  end
end
