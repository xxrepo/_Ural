object APOper: TAPOper
  Left = 167
  Top = 121
  Width = 664
  Height = 513
  Caption = 'Создаваемая операция'
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
  object Panel2: TPanel
    Left = 0
    Top = 445
    Width = 656
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
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
  inline fAPOper1: TfAPOper
    Width = 656
    Height = 445
    Align = alClient
    TabOrder = 1
    inherited Panel2: TPanel
      Width = 881
      Height = 388
      inherited AdvStringGrid1: TAdvColumnGrid
        Width = 879
        Height = 386
        inherited cbCorrect: TComboBox
          Width = 651
        end
        inherited cbOperTypeIn: TComboBox
          Width = 651
        end
        inherited cbOperVid: TComboBox
          Width = 651
        end
        inherited cbKoef: TComboBox
          Width = 653
        end
      end
    end
    inherited Panel1: TPanel
      Width = 881
    end
  end
end
