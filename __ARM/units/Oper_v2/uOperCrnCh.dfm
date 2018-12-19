object OperCrnCh: TOperCrnCh
  Left = 291
  Top = 113
  Width = 669
  Height = 520
  Caption = 'Курсовая разница'
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 550
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 452
    Width = 661
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 567
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Закрыть'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOk: TButton
      Left = 471
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
  inline fOperCrnCh1: TfOperCrnCh
    Width = 661
    Height = 452
    Align = alClient
    TabOrder = 1
    inherited PageControl1: TPageControl
      Width = 661
      Height = 452
      inherited tsData: TTabSheet
        inherited P1: TPanel
          Width = 653
          inherited cbOperTypeIn: TComboBox
            Width = 553
          end
          inherited DBEdit3: TDBEdit
            Width = 555
          end
          inherited DBEdit8: TDBEdit
            Width = 555
          end
        end
        inherited P2: TPanel
          Width = 653
          inherited fCurSelector1: TfCurSelector
            Width = 353
            inherited cbCur: TComboBox
              Width = 282
            end
          end
        end
        inherited P_FF: TPanel
          Width = 653
          inherited lcFormalDistrib: TRxDBLookupCombo
            Width = 515
          end
          inherited lcFuncDistrib: TRxDBLookupCombo
            Width = 515
          end
        end
        inherited GroupBox3: TGroupBox
          Width = 653
          Height = 280
          inherited DBMemo1: TDBMemo
            Width = 649
            Height = 263
          end
        end
      end
    end
  end
end
