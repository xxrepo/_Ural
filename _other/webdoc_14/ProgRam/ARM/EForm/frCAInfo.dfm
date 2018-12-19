object fCAInfo: TfCAInfo
  Left = 0
  Top = 0
  Width = 443
  Height = 277
  Align = alClient
  TabOrder = 0
  object dbgCAInfo: TsDBGrid
    Left = 0
    Top = 0
    Width = 443
    Height = 277
    Align = alClient
    DataSource = dsCAInfo
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgCAInfoDblClick
    SkinData.SkinSection = 'EDIT'
    OnGetCellParams = dbgCAInfoGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'Atext'
        Title.Caption = 'Показатель'
        Width = 343
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cnt'
        Title.Caption = 'Кол-во'
        Width = 70
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 232
    Top = 88
    Width = 121
    Height = 21
    Color = clInactiveCaption
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
  end
  object cdsCAInfo: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Obj'
        ParamType = ptInput
      end>
    ProviderName = 'dsCAInfo'
    RemoteServer = DM.rsCA
    Left = 40
    Top = 96
    object cdsCAInfoxID: TAutoIncField
      FieldName = 'xID'
      ReadOnly = True
    end
    object cdsCAInfoAtext: TStringField
      FieldName = 'Atext'
      Size = 255
    end
    object cdsCAInfoAID: TIntegerField
      FieldName = 'AID'
    end
    object cdsCAInfoCnt: TIntegerField
      FieldName = 'Cnt'
    end
    object cdsCAInfoTag: TStringField
      FieldName = 'Tag'
      Size = 50
    end
    object cdsCAInfodd: TDateTimeField
      FieldName = 'dd'
    end
  end
  object dsCAInfo: TDataSource
    DataSet = cdsCAInfo
    OnDataChange = dsCAInfoDataChange
    Left = 72
    Top = 96
  end
  object PopupMenu1: TPopupMenu
    Left = 136
    Top = 176
    object N2: TMenuItem
      Action = aGoToCA
    end
    object N3: TMenuItem
      Action = aOpenCA
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Action = aDet
    end
  end
  object ActionList1: TActionList
    Left = 144
    Top = 104
    object aDet: TAction
      Caption = 'Детализация'
      Enabled = False
      OnExecute = aDetExecute
    end
    object aOpenCA: TAction
      Caption = 'Открыть юрлицо'
      Enabled = False
      OnExecute = aOpenCAExecute
    end
    object aGoToCA: TAction
      Caption = 'Перейти к юрлицу'
      Enabled = False
      OnExecute = aGoToCAExecute
    end
  end
end
