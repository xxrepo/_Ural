object APCond: TAPCond
  Left = 167
  Top = 121
  Width = 664
  Height = 513
  Caption = 'Условия'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline fAPCond1: TfAPCond
    Width = 656
    Height = 445
    Align = alClient
    inherited Panel2: TPanel
      Width = 656
      Height = 404
      inherited AdvStringGrid1: TAdvColumnGrid
        Width = 654
        Height = 402
        inherited cbCorrect: TComboBox
          Width = 490
        end
        inherited cbOperTypeIn: TComboBox
          Width = 490
        end
        inherited cbOperVid: TComboBox
          Width = 490
        end
        inherited cbKoef: TComboBox
          Width = 492
        end
        inherited cbCond: TComboBox
          Width = 307
        end
      end
    end
    inherited Panel1: TPanel
      Width = 656
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 445
    Width = 656
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object btnCancel: TButton
      Left = 566
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
      Left = 471
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
end
