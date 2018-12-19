object fRepSelector: TfRepSelector
  Left = 0
  Top = 0
  Width = 514
  Height = 240
  TabOrder = 0
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 41
    Width = 514
    Height = 199
    Align = alClient
    DataSource = dsCAgent
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleButtons = True
    OnCheckButton = RxDBGrid1CheckButton
    OnGetBtnParams = RxDBGrid1GetBtnParams
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Наименование'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAName'
        Title.Caption = 'Контрагент'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BsnName'
        Title.Caption = 'Бизнес'
        Width = 105
        Visible = True
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 514
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
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 176
      Top = 2
      Action = aRefreshe
    end
  end
  object cdsReprSelector: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_Repr'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsReprSelector'
    RemoteServer = DM.rsCA
    Left = 64
    Top = 104
    object cdsReprSelectorid_Repr: TAutoIncField
      FieldName = 'id_Repr'
      ReadOnly = True
    end
    object cdsReprSelectorid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object cdsReprSelectorisJur: TBooleanField
      FieldName = 'isJur'
    end
    object cdsReprSelectorDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsReprSelectorName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object cdsReprSelectorCAName: TStringField
      FieldName = 'CAName'
      Size = 50
    end
    object cdsReprSelectorid_Bsn: TIntegerField
      FieldName = 'id_Bsn'
      ReadOnly = True
    end
    object cdsReprSelectorBsnName: TStringField
      FieldName = 'BsnName'
      ReadOnly = True
      Size = 255
    end
  end
  object dsCAgent: TDataSource
    DataSet = cdsReprSelector
    OnDataChange = dsCAgentDataChange
    Left = 64
    Top = 160
  end
  object ActionList1: TActionList
    Images = DM.ilMenu
    Left = 296
    Top = 80
    object aNew: TAction
      Caption = 'Создать'
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
    object aRefreshe: TAction
      Caption = 'Обновить'
      ImageIndex = 3
      OnExecute = aRefresheExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Images = DM.ilMenu
    Left = 176
    Top = 200
    object N1: TMenuItem
      Action = aNew
    end
    object N2: TMenuItem
      Caption = 'Удалить'
      Enabled = False
      ImageIndex = 2
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = 'Архив операций'
      Enabled = False
      Hint = 'Архив операций'
      ImageIndex = 4
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Action = aProperty
    end
  end
end
