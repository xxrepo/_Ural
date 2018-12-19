object fReprList: TfReprList
  Left = 0
  Top = 0
  Width = 469
  Height = 425
  TabOrder = 0
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 66
    Width = 469
    Height = 359
    Align = alClient
    DataSource = dsCAgent
    DefaultDrawing = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = RxDBGrid1DrawColumnCell
    OnDblClick = RxDBGrid1DblClick
    MultiSelect = True
    TitleButtons = True
    OnCheckButton = RxDBGrid1CheckButton
    OnGetBtnParams = RxDBGrid1GetBtnParams
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Наименование'
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAName'
        Title.Caption = 'Контрагент'
        Width = 199
        Visible = True
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 469
    Height = 41
    ButtonHeight = 36
    ButtonWidth = 84
    Caption = 'ToolBar1'
    Images = DM.ilMenu
    ShowCaptions = True
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = aNew
    end
    object ToolButton2: TToolButton
      Left = 84
      Top = 2
      Action = aProperty
    end
    object ToolButton3: TToolButton
      Left = 168
      Top = 2
      Width = 5
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 173
      Top = 2
      Action = aDelete
    end
    object ToolButton5: TToolButton
      Left = 257
      Top = 2
      Width = 15
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 272
      Top = 2
      Action = aRefreshe
    end
    object ToolButton7: TToolButton
      Left = 356
      Top = 2
      Width = 5
      Caption = 'ToolButton7'
      ImageIndex = 4
      Style = tbsSeparator
    end
  end
  object FilterPanel: TPanel
    Left = 0
    Top = 41
    Width = 469
    Height = 25
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 4
      Width = 79
      Height = 13
      Caption = 'Наименование:'
    end
    object FilterEdit: TEdit
      Left = 96
      Top = 1
      Width = 177
      Height = 21
      TabOrder = 0
      OnChange = FilterEditChange
    end
  end
  object ActionList1: TActionList
    Images = DM.ilMenu
    Left = 296
    Top = 80
    object aNew: TAction
      Caption = 'Создать'
      Enabled = False
      Hint = 'Создать'
      ImageIndex = 0
      OnExecute = aNewExecute
    end
    object aProperty: TAction
      Caption = 'Редактировать'
      Enabled = False
      Hint = 'Редактировать'
      ImageIndex = 1
      OnExecute = aPropertyExecute
    end
    object aArc: TAction
      Caption = 'Архив операций'
      Enabled = False
      Hint = 'Архив операций'
      ImageIndex = 4
      OnExecute = aArcExecute
    end
    object aRefreshe: TAction
      Caption = 'Обновить'
      ImageIndex = 3
      OnExecute = aRefresheExecute
    end
    object aDelete: TAction
      Caption = 'Удалить'
      Enabled = False
      ImageIndex = 2
      OnExecute = aDeleteExecute
    end
    object aExcelExp: TAction
      Caption = 'Экспортировать в Excel'
      Enabled = False
      ImageIndex = 13
      OnExecute = aExcelExpExecute
    end
    object aSelAll: TAction
      Caption = 'Выбрать все'
      ShortCut = 16449
      OnExecute = aSelAllExecute
    end
  end
  object cdsPepr: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
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
        DataType = ftBoolean
        Name = '@Disabled'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Group'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_User'
        ParamType = ptInput
      end>
    ProviderName = 'dsPepr'
    RemoteServer = DM.rsCA
    OnFilterRecord = cdsPeprFilterRecord
    Left = 64
    Top = 104
    object cdsPeprid_Repr: TAutoIncField
      FieldName = 'id_Repr'
      ReadOnly = True
    end
    object cdsPeprid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object cdsPeprisJur: TBooleanField
      FieldName = 'isJur'
    end
    object cdsPeprName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object cdsPeprCAName: TStringField
      FieldName = 'CAName'
      Size = 255
    end
    object cdsPeprDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsPeprId_Currency: TIntegerField
      FieldName = 'Id_Currency'
    end
    object cdsPeprCurrencyName: TStringField
      FieldName = 'CurrencyName'
      Size = 30
    end
    object cdsPeprid_business2: TIntegerField
      FieldName = 'id_business'
      ReadOnly = True
    end
    object cdsPeprID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object cdsPeprNeedSend: TBooleanField
      FieldName = 'NeedSend'
    end
  end
  object dsCAgent: TDataSource
    DataSet = cdsPepr
    OnDataChange = dsCAgentDataChange
    Left = 64
    Top = 160
  end
  object PopupMenu1: TPopupMenu
    Images = DM.ilMenu
    Left = 176
    Top = 200
    object N1: TMenuItem
      Action = aNew
    end
    object N2: TMenuItem
      Action = aDelete
    end
    object Excel1: TMenuItem
      Action = aExcelExp
    end
    object N4: TMenuItem
      Action = aSelAll
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Action = aProperty
    end
  end
end
