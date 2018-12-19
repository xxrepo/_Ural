object CASelector: TCASelector
  Left = 291
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Выбор контрагента'
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
    Top = 412
    Width = 688
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 602
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
      Left = 511
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
  inline fCaNavigator1: TfCaNavigator
    Top = 42
    Width = 688
    Height = 370
    Align = alClient
    TabOrder = 1
    inherited Splitter2: TSplitter
      Height = 370
    end
    inherited fCAGroupList1: TfCAGroupList
      Height = 370
      inherited OrgTreeView: TTreeView
        Height = 341
      end
    end
    inherited Panel2: TPanel
      Width = 538
      Height = 370
      inherited Splitter3: TSplitter
        Width = 536
      end
      inherited GroupBox1: TGroupBox
        Width = 536
        Height = 48
        inherited fReprList1: TfReprList
          Width = 532
          Height = 31
          inherited RxDBGrid1: TRxDBGrid
            Width = 516
            Height = 0
          end
          inherited ToolBar1: TToolBar
            Width = 516
          end
          inherited FilterPanel: TPanel
            Width = 516
          end
        end
      end
      inherited fCntrAgentList1: TfCntrAgentList
        Width = 536
        inherited Splitter1: TSplitter
          Width = 536
        end
        inherited RxDBGrid1: TRxDBGrid
          Width = 536
        end
        inherited ToolBar1: TToolBar
          Width = 536
        end
        inherited FilterPanel: TPanel
          Width = 536
        end
        inherited dbgComment: TDBGrid
          Width = 536
        end
        inherited dsCAgent: TDataSource
          OnDataChange = fCntrAgentList1dsCAgentDataChange
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 21
    Align = alTop
    Caption = ' '
    TabOrder = 2
    object lbCA: TLabel
      Left = 8
      Top = 4
      Width = 27
      Height = 13
      Caption = 'lbCA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 21
    Width = 688
    Height = 21
    Align = alTop
    Caption = ' '
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 4
      Width = 32
      Height = 13
      Caption = 'Label2'
    end
  end
end
