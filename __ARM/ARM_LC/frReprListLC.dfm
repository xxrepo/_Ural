object fReprListLC: TfReprListLC
  Left = 0
  Top = 0
  Width = 730
  Height = 430
  TabOrder = 0
  object Splitter1: TSplitter
    Left = 185
    Top = 0
    Width = 3
    Height = 430
    Cursor = crHSplit
  end
  object Panel1: TPanel
    Left = 188
    Top = 0
    Width = 542
    Height = 430
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 540
      Height = 41
      ButtonHeight = 36
      ButtonWidth = 84
      Caption = 'ToolBar1'
      Images = DM.ilMenu
      ShowCaptions = True
      TabOrder = 0
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
    end
    object FilterPanel: TPanel
      Left = 1
      Top = 42
      Width = 540
      Height = 25
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 5
        Width = 79
        Height = 13
        Caption = 'Наименование:'
      end
      object FilterEdit: TEdit
        Left = 104
        Top = 1
        Width = 177
        Height = 21
        TabOrder = 0
        OnChange = FilterEditChange
      end
    end
    object RxDBGrid1: TRxDBGrid
      Left = 1
      Top = 67
      Width = 540
      Height = 362
      Align = alClient
      DataSource = dsCAgent
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = RxDBGrid1DrawColumnCell
      OnDblClick = RxDBGrid1DblClick
      OnMouseMove = RxDBGrid1MouseMove
      MultiSelect = True
      TitleButtons = True
      OnCheckButton = RxDBGrid1CheckButton
      OnGetBtnParams = RxDBGrid1GetBtnParams
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Title.Caption = 'Наименование'
          Width = 245
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GroupName'
          Title.Caption = 'Группа'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BusinessName'
          Title.Caption = 'Бизнес'
          Width = 110
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 430
    Align = alLeft
    Caption = 'Panel2'
    TabOrder = 1
    inline fGroup: TfReprGroup
      Left = 1
      Top = 1
      Width = 183
      Height = 428
      Align = alClient
      inherited OrgTreeView: TTreeView
        Width = 183
        Height = 399
        OnChange = fReprGroup1OrgTreeViewChange
      end
      inherited ToolBar1: TToolBar
        Width = 183
      end
    end
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
    object aSetGrp: TAction
      Caption = 'Поместить в группу'
      OnExecute = aSetGrpExecute
    end
    object aSelAll: TAction
      Caption = 'Выбрать все'
      ShortCut = 16449
      OnExecute = aSelAllExecute
    end
  end
  object cdsPepr: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_ContrAgent'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftBoolean
        Name = '@Disabled'
        ParamType = ptInput
        Value = False
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_Group'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsReprLC'
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
    object cdsPeprDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsPeprName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object cdsPeprCAName: TStringField
      FieldName = 'CAName'
      Size = 50
    end
    object cdsPeprId_Currency: TIntegerField
      FieldName = 'Id_Currency'
    end
    object cdsPeprCurrencyName: TStringField
      FieldName = 'CurrencyName'
      Size = 30
    end
    object cdsPeprid_business: TIntegerField
      FieldName = 'id_business'
      ReadOnly = True
    end
    object cdsPeprID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object cdsPeprNeedSend: TBooleanField
      FieldName = 'NeedSend'
    end
    object cdsPeprGroupName: TStringField
      FieldName = 'GroupName'
      Size = 50
    end
    object cdsPeprid_Repr_Group: TIntegerField
      FieldName = 'id_Repr_Group'
    end
    object cdsPeprBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
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
    object N4: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Action = aSetGrp
    end
    object N7: TMenuItem
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
