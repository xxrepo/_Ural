object fUsers: TfUsers
  Left = 0
  Top = 0
  Width = 443
  Height = 277
  Align = alClient
  TabOrder = 0
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 65
    Width = 443
    Height = 212
    Align = alClient
    DataSource = dsNS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    TitleButtons = True
    OnCheckButton = RxDBGrid1CheckButton
    OnGetBtnParams = RxDBGrid1GetBtnParams
    Columns = <
      item
        Expanded = False
        FieldName = 'FIO'
        Title.Caption = '���'
        Width = 368
        Visible = True
      end>
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 443
    Height = 40
    AutoSize = True
    ButtonHeight = 36
    ButtonWidth = 84
    Caption = 'ToolBar'
    Images = DM.ilImage
    ShowCaptions = True
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = aAdd
    end
    object ToolButton2: TToolButton
      Left = 84
      Top = 2
      Action = aEdit
    end
    object ToolButton3: TToolButton
      Left = 168
      Top = 2
      Action = aDel
      Visible = False
    end
    object ToolButton5: TToolButton
      Left = 252
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 260
      Top = 2
      Action = aRefresh
    end
  end
  object FilterPanel: TPanel
    Left = 0
    Top = 40
    Width = 443
    Height = 25
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 6
      Width = 27
      Height = 13
      Caption = '���'
    end
    object FilterEdit: TEdit
      Left = 96
      Top = 1
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = FilterEditChange
      OnKeyPress = FilterEditKeyPress
    end
  end
  object dsNS: TDataSource
    DataSet = cdsUsers
    OnDataChange = dsNSDataChange
    Left = 56
    Top = 48
  end
  object cdsUsers: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_User'
        ParamType = ptInput
      end>
    ProviderName = 'dsUsers'
    RemoteServer = DM.rsCA
    OnFilterRecord = cdsUsersFilterRecord
    Left = 104
    Top = 48
    object cdsUsersid_User: TAutoIncField
      FieldName = 'id_User'
      ReadOnly = True
    end
    object cdsUsersFIO: TStringField
      FieldName = 'FIO'
      Size = 255
    end
  end
  object ActionList1: TActionList
    Images = DM.ilImage
    Left = 96
    Top = 160
    object aAdd: TAction
      Caption = '��������'
      ImageIndex = 16
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = '�������������'
      Enabled = False
      ImageIndex = 15
      OnExecute = aEditExecute
    end
    object aDel: TAction
      Caption = '�������'
      Enabled = False
      ImageIndex = 17
      OnExecute = aDelExecute
    end
    object aRefresh: TAction
      Caption = '��������'
      ImageIndex = 18
      OnExecute = aRefreshExecute
    end
  end
  object PopupMenu1: TAdvPopupMenu
    Images = DM.ilImage
    Version = '2.5.3.1'
    Left = 168
    Top = 144
    object N1: TMenuItem
      Action = aAdd
    end
    object N2: TMenuItem
      Action = aEdit
    end
    object N3: TMenuItem
      Action = aDel
    end
  end
end
