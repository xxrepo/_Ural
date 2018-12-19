object WizNoDeptCA: TWizNoDeptCA
  Left = 87
  Top = 102
  Width = 897
  Height = 529
  Caption = 'Списание остатков с контрагентов'
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
  object Splitter1: TSplitter
    Left = 557
    Top = 0
    Width = 3
    Height = 461
    Cursor = crHSplit
    Beveled = True
  end
  object Panel2: TPanel
    Left = 0
    Top = 461
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
    Height = 461
    Align = alLeft
    Caption = 'Контрагенты'
    TabOrder = 1
    inline fCaNavigator1: TfCaNavigator
      Left = 2
      Top = 45
      Width = 553
      Height = 414
      Align = alClient
      inherited Splitter2: TSplitter
        Height = 414
      end
      inherited fCAGroupList1: TfCAGroupList
        Height = 414
        inherited OrgTreeView: TTreeView
          Height = 385
        end
      end
      inherited Panel2: TPanel
        Width = 403
        Height = 414
        inherited Splitter3: TSplitter
          Width = 401
        end
        inherited GroupBox1: TGroupBox
          Width = 401
          Height = 92
          inherited fReprList1: TfReprList
            Width = 397
            Height = 75
            inherited RxDBGrid1: TRxDBGrid
              Width = 397
              Height = 9
              OnDblClick = fReprList1RxDBGrid1DblClick
            end
            inherited ToolBar1: TToolBar
              Width = 397
            end
            inherited FilterPanel: TPanel
              Width = 397
            end
          end
        end
        inherited fCntrAgentList1: TfCntrAgentList
          Width = 401
          inherited Splitter1: TSplitter
            Width = 401
          end
          inherited RxDBGrid1: TRxDBGrid
            Width = 401
            OnDblClick = fCntrAgentList1RxDBGrid1DblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Name'
                PickList.Strings = ()
                Title.Caption = 'Наименование'
                Width = 175
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CAGroupName'
                PickList.Strings = ()
                Title.Caption = 'Группа'
                Width = 154
                Visible = True
              end>
          end
          inherited ToolBar1: TToolBar
            Width = 401
            inherited ToolButton5: TToolButton
              Left = 0
              Wrap = True
            end
            inherited ToolButton6: TToolButton
              Left = 0
              Top = 42
            end
            inherited ToolButton7: TToolButton
              Left = 88
              Top = 42
            end
            inherited ToolButton8: TToolButton
              Left = 93
              Top = 42
            end
          end
          inherited FilterPanel: TPanel
            Width = 401
          end
          inherited dbgComment: TDBGrid
            Width = 401
          end
          inherited dsCAgent: TDataSource
            OnDataChange = fCntrAgentList1dsCAgentDataChange
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 553
      Height = 30
      Align = alTop
      Caption = ' '
      TabOrder = 1
      inline fBsnSelector1: TfBsnSelector
        Left = 1
        Top = 1
        Width = 254
        Height = 28
        Align = alLeft
        inherited edName: TEdit
          Width = 168
        end
        inherited Button1: TButton
          Left = 223
          OnClick = fBsnSelector1Button1Click
        end
      end
      object Panel3: TPanel
        Left = 255
        Top = 1
        Width = 10
        Height = 28
        Align = alLeft
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
      end
      inline fCurSelector1: TfCurSelector
        Left = 265
        Top = 1
        Width = 287
        Height = 28
        Align = alClient
        TabOrder = 2
        inherited Label1: TLabel
          Left = 4
        end
        inherited cbCur: TComboBox
          Width = 216
        end
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 597
    Top = 0
    Width = 292
    Height = 461
    Align = alClient
    Caption = 'Выбранные контрагенты'
    TabOrder = 2
    object grdCA: TRxDBGrid
      Left = 2
      Top = 15
      Width = 288
      Height = 444
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
    Height = 461
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
