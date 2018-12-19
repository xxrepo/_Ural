object WizReVal: TWizReVal
  Left = 234
  Top = 102
  Width = 750
  Height = 400
  Caption = 'Переоценка'
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
    Width = 742
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 656
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
      Left = 565
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
  inline fWizReVal1: TfWizReVal
    Width = 742
    Height = 332
    Align = alClient
    TabOrder = 1
    inherited gbWare: TGroupBox
      Width = 742
      Height = 235
      inherited DBGridEh1: TDBGridEh
        Width = 716
        Height = 218
      end
      inherited ToolBar3: TToolBar
        Left = 718
        Height = 218
      end
    end
    inherited GroupBox2: TGroupBox
      Width = 742
    end
  end
end
