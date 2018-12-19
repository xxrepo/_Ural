object APListSelector: TAPListSelector
  Left = 266
  Top = 107
  Width = 783
  Height = 540
  Caption = 'Выбор условия'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
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
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 598
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
  inline fAPList1: TfAPList
    Width = 775
    Height = 472
    Align = alClient
    TabOrder = 1
    inherited RxDBGrid1: TRxDBGrid
      Width = 775
      Height = 407
      OnDblClick = fAPList1RxDBGrid1DblClick
    end
    inherited ToolBar: TToolBar
      Width = 775
    end
    inherited FilterPanel: TPanel
      Width = 775
    end
    inherited dsFltList: TDataSource
      OnDataChange = fAPList1dsFltListDataChange
    end
  end
end
