object fExtData: TfExtData
  Left = 0
  Top = 0
  Width = 736
  Height = 276
  TabOrder = 0
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 736
    Height = 40
    AutoSize = True
    ButtonHeight = 36
    ButtonWidth = 84
    Caption = 'ToolBar'
    Images = DM.ilImage
    ShowCaptions = True
    TabOrder = 0
    object ToolButton2: TToolButton
      Left = 0
      Top = 2
      Action = aEdit
    end
    object ToolButton1: TToolButton
      Left = 84
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 92
      Top = 2
      Action = aRefr
    end
    object ToolButton3: TToolButton
      Left = 176
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 184
      Top = 2
      Action = aReSort
      Visible = False
    end
  end
  object sDBGrid1: TsDBGrid
    Left = 0
    Top = 40
    Width = 736
    Height = 236
    Align = alClient
    DataSource = dsExtDataDict
    DefaultDrawing = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = RxDBGridDrawColumnCell
    OnDblClick = RxDBGridDblClick
    SkinData.SkinSection = 'EDIT'
    Columns = <
      item
        Expanded = False
        FieldName = 'ColName'
        Title.Caption = 'Параметр'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ParamName'
        Title.Caption = 'Название'
        Width = 234
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'isVisible'
        Title.Caption = 'Видимый'
        Width = 88
        Visible = True
      end>
  end
  object cdsDDD: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_NS'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@isInt'
        ParamType = ptInput
      end>
    ProviderName = 'dsDDD'
    RemoteServer = DM.rsCA
    Left = 56
    Top = 72
    object cdsDDDid_NameRules: TAutoIncField
      FieldName = 'id_NameRules'
      ReadOnly = True
    end
    object cdsDDDid_NS: TIntegerField
      FieldName = 'id_NS'
    end
    object cdsDDDColName: TStringField
      FieldName = 'ColName'
      OnGetText = cdsDDDColNameGetText
      Size = 255
    end
    object cdsDDDParamName: TStringField
      FieldName = 'ParamName'
      Size = 255
    end
    object cdsDDDOrderID: TIntegerField
      FieldName = 'OrderID'
    end
    object cdsDDDisInt: TBooleanField
      FieldName = 'isInt'
    end
    object cdsDDDinName: TIntegerField
      FieldName = 'inName'
    end
    object cdsDDDisVisible: TBooleanField
      FieldName = 'isVisible'
    end
  end
  object dsExtDataDict: TDataSource
    DataSet = cdsDDD
    OnDataChange = dsExtDataDictDataChange
    Left = 104
    Top = 64
  end
  object ActionList1: TActionList
    Images = DM.ilImage
    Left = 368
    Top = 56
    object aEdit: TAction
      Caption = 'Редактировать'
      ImageIndex = 15
      OnExecute = aEditExecute
    end
    object aReSort: TAction
      Caption = 'Сортировка'
      OnExecute = aReSortExecute
    end
    object aRefr: TAction
      Caption = 'Обновить'
      ImageIndex = 18
      OnExecute = aRefrExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Images = DM.ilImage
    Left = 176
    Top = 152
    object N1: TMenuItem
      Action = aEdit
    end
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'GROUPBOX'
    Left = 68
    Top = 142
  end
end
