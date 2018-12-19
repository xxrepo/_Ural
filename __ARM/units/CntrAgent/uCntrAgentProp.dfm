object CntrAgentProp: TCntrAgentProp
  Left = 241
  Top = 106
  Width = 513
  Height = 466
  Caption = 'Контрагент'
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
  object Panel2: TPanel
    Left = 0
    Top = 398
    Width = 505
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 419
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 328
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  inline fCntrAgentProp1: TfCntrAgentProp
    Width = 505
    Height = 398
    Align = alClient
    TabOrder = 1
    inherited pcCA: TPageControl
      Width = 505
      Height = 398
      ActivePage = fCntrAgentProp1.tsComment
      inherited tsProp: TTabSheet
        inherited Panel1: TPanel
          Width = 497
          Height = 262
          inherited DBMemo1: TDBMemo
            Width = 480
          end
          inherited DBMemo2: TDBMemo
            Width = 482
            Height = 119
          end
        end
        inherited Panel2: TPanel
          Width = 497
          inherited fCAGroupSelect1: TfCAGroupSelect
            Width = 493
            inherited edName: TEdit
              Width = 406
            end
            inherited Button1: TButton
              Left = 461
            end
          end
        end
        inherited Panel3: TPanel
          Width = 497
        end
      end
      inherited tsContact: TTabSheet
        inherited dbgContact: TRxDBGrid
          Width = 497
          Height = 341
        end
        inherited ToolBar1: TToolBar
          Width = 497
        end
      end
      inherited tsComment: TTabSheet
        inherited ToolBar2: TToolBar
          Width = 497
        end
        inherited dbgComment: TDBGrid
          Width = 497
          Height = 341
        end
      end
    end
    inherited dsCAComment: TDataSource
      Left = 204
      Top = 96
    end
  end
end
