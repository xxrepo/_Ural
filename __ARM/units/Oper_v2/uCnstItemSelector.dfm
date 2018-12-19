object CnstItemSelector: TCnstItemSelector
  Left = 321
  Top = 93
  Width = 564
  Height = 289
  Caption = 'Выбор параметра'
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
    Top = 221
    Width = 556
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 470
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
      Left = 379
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      Enabled = False
      ModalResult = 1
      TabOrder = 0
    end
  end
  inline fCnstItem1: TfCnstItem
    Width = 556
    Height = 221
    Align = alClient
    TabOrder = 1
    inherited RxDBGrid1: TRxDBGrid
      Width = 556
      Height = 156
      OnDblClick = fDocOrg1RxDBGrid1DblClick
    end
    inherited ToolBar: TToolBar
      Width = 556
    end
    inherited FilterPanel: TPanel
      Width = 556
    end
    inherited dsFltList: TDataSource
      OnDataChange = fCnstItem1dsFltListDataChange
    end
  end
end
