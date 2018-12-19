object CAGroupSelect: TCAGroupSelect
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Выбор категории'
  ClientHeight = 395
  ClientWidth = 353
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
    Top = 354
    Width = 353
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 267
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
      Left = 176
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
  inline fCAGroupList1: TfCAGroupList
    Width = 353
    Height = 354
    Align = alClient
    TabOrder = 1
    inherited OrgTreeView: TTreeView
      Width = 353
      Height = 325
      OnChange = fCAGroupList1OrgTreeViewChange
      OnDblClick = fCAGroupList1OrgTreeViewDblClick
    end
    inherited ToolBar1: TToolBar
      Width = 353
    end
  end
end
