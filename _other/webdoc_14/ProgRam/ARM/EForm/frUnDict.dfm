object fUnDict: TfUnDict
  Left = 0
  Top = 0
  Width = 1001
  Height = 428
  HelpContext = 36
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object sSplitter1: TsSplitter
    Left = 0
    Top = 189
    Width = 1001
    Height = 4
    Cursor = crVSplit
    Align = alBottom
    SkinData.SkinSection = 'SPLITTER'
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 72
    Width = 1001
    Height = 117
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = dsObjGetList
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clBlack
    FooterFont.Height = -11
    FooterFont.Name = 'Microsoft Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pmUnDic
    RowDetailPanel.Color = clBtnFace
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Microsoft Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'ObjName'
        Footers = <>
        Title.Caption = 'Название'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 169
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'PName'
        Footers = <>
        Title.Caption = 'Принадлежность'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 120
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'FileName'
        Footers = <>
        Title.Caption = 'Текст для файла'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 81
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'DateStart'
        Footers = <>
        Title.Caption = 'Дата|С'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'DateStop'
        Footers = <>
        Title.Caption = 'Дата|По'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'WorkType'
        Footers = <>
        Title.Caption = 'Вид деятельности|Виды деятельности'
        Visible = False
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'RealWorkType'
        Footers = <>
        Title.Caption = 'Вид деятельности|Тематика'
        Visible = False
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'isSellerStr'
        Footers = <>
        Title.Caption = 'Роли|Покупатель'
        Visible = False
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'isBayerStr'
        Footers = <>
        Title.Caption = 'Роли|Продавец'
        Visible = False
        Width = 87
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 193
    Width = 1001
    Height = 235
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    Visible = False
    SkinData.SkinSection = 'PANEL'
    object sPageControl1: TsPageControl
      Left = 1
      Top = 1
      Width = 999
      Height = 233
      ActivePage = tsInfo
      Align = alClient
      TabOrder = 0
      OnChange = sPageControl1Change
      SkinData.SkinSection = 'PAGECONTROL'
      object tsInfo: TsTabSheet
        Caption = 'Статистика'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        inline fCAInfo1: TfCAInfo
          Width = 991
          Height = 205
          Align = alTop
        end
      end
      object tsFiles: TsTabSheet
        Caption = 'Файлы'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        inline fFiles1: TfFiles
          Width = 991
          Height = 205
          inherited dbgFileList: TDBGridEh
            Width = 991
            Height = 179
            FooterFont.Charset = RUSSIAN_CHARSET
            FooterFont.Color = clBlack
            FooterFont.Name = 'Microsoft Sans Serif'
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Name = 'Microsoft Sans Serif'
          end
          inherited sPanel1: TsPanel
            Width = 991
          end
        end
      end
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 46
    Width = 1001
    Height = 26
    Align = alTop
    Caption = ' '
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object sLabel1: TsLabel
      Left = 8
      Top = 5
      Width = 40
      Height = 13
      Caption = 'Фильтр'
    end
    object FilterEdit: TsEdit
      Left = 56
      Top = 2
      Width = 217
      Height = 21
      TabOrder = 0
      OnChange = FilterEditChange
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object btnName: TsButton
      Left = 275
      Top = 2
      Width = 25
      Height = 22
      Caption = '<='
      TabOrder = 1
      OnClick = btnNameClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object ToolBar1: TsToolBar
    Left = 0
    Top = 0
    Width = 1001
    Height = 46
    ButtonHeight = 39
    Caption = 'ToolBar1'
    Images = DM.ilImage
    TabOrder = 3
    SkinData.SkinSection = 'TOOLBAR'
    object sSpeedButton1: TsSpeedButton
      Tag = 5
      Left = 0
      Top = 2
      Width = 89
      Height = 39
      Action = aNewObj
      Layout = blGlyphTop
      Spacing = 0
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 16
      Images = DM.ilImage
      Reflected = True
      TextAlignment = taLeftJustify
    end
    object sSpeedButton2: TsSpeedButton
      Tag = 5
      Left = 89
      Top = 2
      Width = 89
      Height = 39
      Action = aEditObj
      Layout = blGlyphTop
      Spacing = 0
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 15
      Images = DM.ilImage
      Reflected = True
      TextAlignment = taLeftJustify
    end
    object sSpeedButton7: TsSpeedButton
      Tag = 5
      Left = 178
      Top = 2
      Width = 89
      Height = 39
      Action = aCopy
      Layout = blGlyphTop
      Spacing = 0
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 36
      Images = DM.ilImage
      Reflected = True
      TextAlignment = taLeftJustify
    end
    object sSpeedButton9: TsSpeedButton
      Tag = 5
      Left = 267
      Top = 2
      Width = 89
      Height = 39
      Action = aDelObj
      Layout = blGlyphTop
      Spacing = 0
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 17
      Images = DM.ilImage
      Reflected = True
      TextAlignment = taLeftJustify
    end
    object sSpeedButton10: TsSpeedButton
      Tag = 5
      Left = 356
      Top = 2
      Width = 89
      Height = 39
      Action = aRefresh
      Layout = blGlyphTop
      Spacing = 0
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 18
      Images = DM.ilImage
      Reflected = True
      TextAlignment = taLeftJustify
    end
  end
  object ActionList1: TActionList
    Images = DM.ilImage
    Left = 160
    Top = 136
    object aNewObj: TAction
      Caption = 'Добавить'
      ImageIndex = 16
      OnExecute = aNewObjExecute
    end
    object aEditObj: TAction
      Caption = 'Редактировать'
      Enabled = False
      ImageIndex = 15
      OnExecute = aEditObjExecute
    end
    object aDelObj: TAction
      Caption = 'Удалить'
      Enabled = False
      ImageIndex = 17
      OnExecute = aDelObjExecute
    end
    object aRefresh: TAction
      Caption = 'Обновить'
      ImageIndex = 18
      OnExecute = aRefreshExecute
    end
    object aCopy: TAction
      Caption = 'Копировать'
      Enabled = False
      ImageIndex = 36
      OnExecute = aCopyExecute
    end
  end
  object dsObjGetList: TDataSource
    DataSet = cdsObjGetList
    OnDataChange = dsObjGetListDataChange
    Left = 104
    Top = 96
  end
  object cdsObjGetList: TClientDataSet
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
        Name = '@ExtId'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_NS'
        ParamType = ptInput
      end>
    ProviderName = 'dsObjGetList'
    RemoteServer = DM.rsCA
    AfterOpen = cdsObjGetListAfterOpen
    OnFilterRecord = cdsObjGetListFilterRecord
    Left = 40
    Top = 96
    object cdsObjGetListid_Obj: TAutoIncField
      FieldName = 'id_Obj'
      ReadOnly = True
    end
    object cdsObjGetListid_NS: TIntegerField
      FieldName = 'id_NS'
    end
    object cdsObjGetListPID: TIntegerField
      FieldName = 'PID'
    end
    object cdsObjGetListid_ObjType: TIntegerField
      FieldName = 'id_ObjType'
    end
    object cdsObjGetListObjName: TStringField
      FieldName = 'ObjName'
      Size = 255
    end
    object cdsObjGetListFileName: TStringField
      FieldName = 'FileName'
      Size = 255
    end
    object cdsObjGetListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsObjGetListDateStart: TDateTimeField
      FieldName = 'DateStart'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object cdsObjGetListDateStop: TDateTimeField
      FieldName = 'DateStop'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object cdsObjGetListisDef: TBooleanField
      FieldName = 'isDef'
    end
    object cdsObjGetListPName: TStringField
      FieldName = 'PName'
      Size = 255
    end
    object cdsObjGetListisBayer: TBooleanField
      FieldName = 'isBayer'
    end
    object cdsObjGetListisSeller: TBooleanField
      FieldName = 'isSeller'
    end
    object cdsObjGetListWorkType: TStringField
      FieldName = 'WorkType'
      Size = 1000
    end
    object cdsObjGetListRealWorkType: TStringField
      FieldName = 'RealWorkType'
      Size = 1000
    end
    object cdsObjGetListisBayerStr: TStringField
      FieldName = 'isBayerStr'
      Size = 10
    end
    object cdsObjGetListisSellerStr: TStringField
      FieldName = 'isSellerStr'
      Size = 10
    end
    object cdsObjGetListisUsedStr: TStringField
      FieldName = 'isUsedStr'
      Size = 10
    end
    object cdsObjGetListEmailList: TStringField
      FieldName = 'EmailList'
      Size = 255
    end
  end
  object pmUnDic: TPopupMenu
    Images = DM.ilImage
    Left = 296
    Top = 72
    object N1: TMenuItem
      Action = aNewObj
    end
    object N2: TMenuItem
      Action = aEditObj
    end
    object N4: TMenuItem
      Action = aCopy
    end
    object N3: TMenuItem
      Action = aDelObj
    end
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'GROUPBOX'
    Left = 328
    Top = 160
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer1Timer
    Left = 328
    Top = 64
  end
end
