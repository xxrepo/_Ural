object MultiSelectAcc: TMultiSelectAcc
  Left = 72
  Top = -18
  Width = 897
  Height = 736
  Caption = 'Выбор счетов'
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 557
    Top = 0
    Width = 3
    Height = 668
    Cursor = crHSplit
    Beveled = True
  end
  object Panel2: TPanel
    Left = 0
    Top = 668
    Width = 889
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 803
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
      Left = 712
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Enabled = False
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 557
    Height = 668
    Align = alLeft
    Caption = 'Контрагенты'
    TabOrder = 1
    inline AccsFrame1: TAccsFrame
      Left = 2
      Top = 15
      Width = 553
      Height = 651
      Align = alClient
      inherited Splitter1: TSplitter
        Height = 651
      end
      inherited Panel1: TPanel
        Width = 365
        Height = 651
        inherited FilterPanel: TPanel
          Width = 363
        end
        inherited ToolBar: TToolBar
          Width = 363
        end
        inherited RxDBGrid1: TRxDBGrid
          Width = 363
          Height = 584
          OnDblClick = fCntrAgentList1RxDBGrid1DblClick
        end
      end
      inherited Panel2: TPanel
        Height = 651
        inherited fAccGroup1: TfAccGroup
          Height = 649
          inherited OrgTreeView: TTreeView
            Height = 620
          end
          inherited PopupMenu2: TPopupMenu
            Left = 144
          end
        end
      end
      inherited DataSource: TDataSource
        OnDataChange = AccsFrame1DataSourceDataChange
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 597
    Top = 0
    Width = 292
    Height = 668
    Align = alClient
    Caption = 'Выбранные контрагенты'
    TabOrder = 2
    object grdCA: TRxDBGrid
      Left = 2
      Top = 15
      Width = 288
      Height = 651
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = grdCADblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Title.Caption = 'Название'
          Width = 247
          Visible = True
        end>
    end
  end
  object Panel9: TPanel
    Left = 560
    Top = 0
    Width = 37
    Height = 668
    Align = alLeft
    TabOrder = 3
    object sbAddOne1: TSpeedButton
      Left = 6
      Top = 16
      Width = 25
      Height = 25
      Action = aAddOne
      NumGlyphs = 2
    end
    object sbDelOne1: TSpeedButton
      Left = 6
      Top = 48
      Width = 25
      Height = 25
      Action = aDelOne
      NumGlyphs = 2
    end
    object sbAddAll1: TSpeedButton
      Left = 6
      Top = 80
      Width = 25
      Height = 25
      Action = aAddAll
      NumGlyphs = 2
    end
    object sbDelAll1: TSpeedButton
      Left = 6
      Top = 112
      Width = 25
      Height = 25
      Action = aDelAll
      NumGlyphs = 2
    end
  end
  object ActionList1: TActionList
    Left = 403
    Top = 162
    object aAddOne: TAction
      Caption = '>'
      Enabled = False
      OnExecute = aAddOneExecute
    end
    object aAddAll: TAction
      Caption = '>>'
      Enabled = False
      OnExecute = aAddAllExecute
    end
    object aDelOne: TAction
      Caption = '<'
      Enabled = False
      OnExecute = aDelOneExecute
    end
    object aDelAll: TAction
      Caption = '<<'
      Enabled = False
      OnExecute = aDelAllExecute
    end
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end>
    Left = 741
    Top = 136
    object RxMemoryData1ID: TIntegerField
      FieldName = 'ID'
    end
    object RxMemoryData1Name: TStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    OnDataChange = DataSource1DataChange
    Left = 709
    Top = 136
  end
  object cdsCASumm: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_ContrAgent'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Date'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Id_Currency'
        ParamType = ptInput
      end>
    ProviderName = 'dsCASumm'
    RemoteServer = DM.rsCA
    Left = 744
    Top = 176
    object cdsCASummId_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object cdsCASummSumm: TFloatField
      FieldName = 'Summ'
      ReadOnly = True
    end
    object cdsCASummCrnName: TStringField
      FieldName = 'CrnName'
      ReadOnly = True
      Size = 10
    end
    object cdsCASummid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object cdsCASummOperSumm: TFloatField
      FieldName = 'OperSumm'
      ReadOnly = True
    end
  end
end
