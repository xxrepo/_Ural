object fAPOper: TfAPOper
  Left = 0
  Top = 0
  Width = 909
  Height = 663
  TabOrder = 0
  object Splitter1: TSplitter
    Left = 0
    Top = 373
    Width = 909
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 909
    Height = 308
    Align = alClient
    Caption = ' '
    TabOrder = 0
    object AdvStringGrid1: TAdvColumnGrid
      Left = 1
      Top = 1
      Width = 907
      Height = 306
      Cursor = crDefault
      Align = alClient
      ColCount = 4
      DefaultColWidth = 80
      DefaultRowHeight = 18
      DefaultDrawing = True
      RowCount = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      OnKeyDown = AdvStringGrid1KeyDown
      OnKeyPress = AdvStringGrid1KeyPress
      OnGetCellColor = AdvStringGrid1GetCellColor
      OnCanAddRow = AdvStringGrid1CanAddRow
      OnCanDeleteRow = AdvStringGrid1CanDeleteRow
      OnCanEditCell = AdvStringGrid1CanEditCell
      OnCellValidate = AdvStringGrid1CellValidate
      OnGetEditorType = AdvStringGrid1GetEditorType
      OnEllipsClick = AdvStringGrid1EllipsClick
      HintColor = clYellow
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'MS Sans Serif'
      ActiveCellFont.Style = []
      CellNode.ShowTree = False
      ColumnHeaders.Strings = (
        '1'
        'Параметр'
        'Значение'
        'Значение')
      ControlLook.ControlStyle = csClassic
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      EnhTextSize = True
      ExcelStyleDecimalSeparator = True
      Filter = <>
      FilterDropDown.ColumnWidth = True
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'MS Sans Serif'
      FilterDropDown.Font.Style = []
      FilterDropDown.Height = 200
      FilterDropDown.Width = 200
      FilterDropDownClear = '(All)'
      FixedColWidth = 20
      FixedRowHeight = 18
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'MS Sans Serif'
      FixedFont.Style = []
      FloatFormat = '%.2f'
      Lookup = True
      MouseActions.DirectEdit = True
      Navigation.AdvanceOnEnter = True
      Navigation.AdvanceInsert = True
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.Borders = pbNoborder
      PrintSettings.Centered = False
      PrintSettings.PageNumSep = '/'
      RowHeaders.Strings = (
        '1'
        '2'
        '3'
        '4')
      ScrollWidth = 16
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurence'
      SearchFooter.HintFindPrev = 'Find previous occurence'
      SearchFooter.HintHighlight = 'Highlight occurences'
      SearchFooter.MatchCaseCaption = 'Match case'
      SelectionColor = clHighlight
      SelectionTextColor = clHighlightText
      SortSettings.Column = 0
      VAlignment = vtaCenter
      Version = '3.1.1.3'
      WordWrap = False
      Columns = <
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taLeftJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ColumnPopupType = cpFixedCellsRClick
          DropDownCount = 8
          EditLength = 0
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = '1'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 20
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taLeftJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ColumnPopupType = cpFixedCellsRClick
          DropDownCount = 8
          EditLength = 0
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = 'Параметр'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 211
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taLeftJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ColumnPopupType = cpFixedCellsRClick
          ComboItems.Strings = (
            'не задано'
            'как в операции'
            'указать')
          DropDownCount = 8
          EditLength = 0
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = 'Значение'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 75
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taLeftJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ColumnPopupType = cpFixedCellsRClick
          DropDownCount = 8
          EditLength = 0
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = 'Значение'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 309
        end>
      ColWidths = (
        20
        211
        75
        309)
      object lcFuncDistrib: TDBLookupComboBox
        Left = 240
        Top = 256
        Width = 145
        Height = 21
        KeyField = 'id_FuncDistrib'
        ListField = 'Name'
        ListSource = dsFunc
        TabOrder = 3
        Visible = False
      end
      object lcFormalDistrib: TDBLookupComboBox
        Left = 64
        Top = 256
        Width = 145
        Height = 21
        KeyField = 'id_FormalDistrib'
        ListField = 'Name'
        ListSource = dsFormal
        TabOrder = 4
        Visible = False
      end
      object cbCorrect: TComboBox
        Left = 80
        Top = 227
        Width = 679
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 5
        Visible = False
        OnKeyPress = cbOperTypeInKeyPress
        Items.Strings = (
          'Да'
          'Нет')
      end
      object cbOperTypeIn: TComboBox
        Left = 80
        Top = 203
        Width = 679
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 6
        Visible = False
        OnKeyPress = cbOperTypeInKeyPress
        Items.Strings = (
          'Приходная операция'
          'Расходная операция')
      end
      object cbOperVid: TComboBox
        Left = 80
        Top = 179
        Width = 679
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 7
        Visible = False
        OnKeyPress = cbOperTypeInKeyPress
        Items.Strings = (
          'Складская'
          'Финансовая'
          'Взаимозачетная')
      end
      object cbKoef: TComboBox
        Left = 77
        Top = 145
        Width = 681
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 8
        Visible = False
        OnChange = cbKoefChange
        OnKeyDown = cbKoefKeyDown
        Items.Strings = (
          'Расчет с контрагентом'
          'Прибыль'
          'Затрата')
      end
      object sbCrnType: TComboBox
        Left = 85
        Top = 417
        Width = 681
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 9
        Visible = False
        Items.Strings = (
          'Расчет с контрагентом'
          'Прибыль'
          'Затрата')
      end
      object lcCur: TRxDBLookupCombo
        Left = 504
        Top = 256
        Width = 145
        Height = 21
        DropDownCount = 8
        LookupField = 'Id_Currency'
        LookupDisplay = 'Name'
        LookupSource = dsCur
        TabOrder = 10
        Visible = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 909
    Height = 65
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 44
      Height = 13
      Caption = 'Условие'
    end
    object Edit1: TEdit
      Left = 80
      Top = 8
      Width = 281
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 536
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
      Visible = False
      OnClick = Button1Click
    end
    object edObjName: TEdit
      Left = 80
      Top = 37
      Width = 257
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 336
      Top = 37
      Width = 23
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
  object gbWare: TGroupBox
    Left = 0
    Top = 376
    Width = 909
    Height = 287
    Align = alBottom
    Caption = 'Товары'
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 884
      Height = 270
      Align = alClient
      AllowedOperations = [alopUpdateEh, alopAppendEh]
      DataGrouping.GroupLevels = <>
      DataSource = dsAPGoods
      Flat = False
      FooterColor = clSilver
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      RowDetailPanel.Color = clBtnFace
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEditButtonClick = DBGridEh1EditButtonClick
      Columns = <
        item
          ButtonStyle = cbsNone
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Numb'
          Footer.EndEllipsis = True
          Footers = <>
          ReadOnly = True
          Title.Caption = '№№'
          Width = 32
        end
        item
          AlwaysShowEditButton = True
          ButtonStyle = cbsNone
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'WareName'
          Footer.EndEllipsis = True
          Footers = <>
          ReadOnly = True
          Title.Caption = 'Наименование'
          Width = 185
        end
        item
          AlwaysShowEditButton = True
          ButtonStyle = cbsNone
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'MeasureName'
          Footer.EndEllipsis = True
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          ReadOnly = True
          Title.Caption = 'Ед. изм'
          Width = 56
        end
        item
          AlwaysShowEditButton = True
          ButtonStyle = cbsEllipsis
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'AmountStr'
          Footer.EndEllipsis = True
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Increment = 0.01
          ReadOnly = True
          Title.Caption = 'Кол-во'
          Width = 183
        end
        item
          ButtonStyle = cbsEllipsis
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'PriceStr'
          Footer.EndEllipsis = True
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Increment = 0.01
          ReadOnly = True
          Title.Caption = 'Цена'
          Width = 81
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object ToolBar3: TToolBar
      Left = 886
      Top = 15
      Width = 21
      Height = 270
      Align = alRight
      Caption = 'ToolBar3'
      Images = ilImage
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object ToolButton11: TToolButton
        Left = 0
        Top = 2
        Action = aAddWare
        Wrap = True
      end
      object ToolButton12: TToolButton
        Left = 0
        Top = 24
        Action = aDelWare
      end
      object ToolButton13: TToolButton
        Left = 0
        Top = 24
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Wrap = True
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 0
        Top = 51
        Action = aClearWare
      end
    end
  end
  object cdsAPOI: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_ObjItem'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'dsAPOI'
    RemoteServer = DM.rsCA
    Left = 80
    Top = 126
    object cdsAPOIid_ObjItem: TAutoIncField
      FieldName = 'id_ObjItem'
      ReadOnly = True
    end
    object cdsAPOIid_AP_Obj: TIntegerField
      FieldName = 'id_AP_Obj'
    end
    object cdsAPOIOperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object cdsAPOIOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsAPOICorrect: TBooleanField
      FieldName = 'Correct'
    end
    object cdsAPOIOpName: TStringField
      FieldName = 'OpName'
      Size = 255
    end
  end
  object cdsFormal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
      end>
    ProviderName = 'dsFormal'
    RemoteServer = DM.rsCA
    Left = 248
    Top = 320
    object cdsFormalid_FormalDistrib: TAutoIncField
      FieldName = 'id_FormalDistrib'
      ReadOnly = True
    end
    object cdsFormalName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object dsFormal: TDataSource
    DataSet = cdsFormal
    Left = 284
    Top = 320
  end
  object dsCur: TDataSource
    DataSet = cdsCur
    Left = 404
    Top = 368
  end
  object cdsFunc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
      end>
    ProviderName = 'dsFunc'
    RemoteServer = DM.rsCA
    Left = 248
    Top = 352
    object cdsFuncid_FuncDistrib: TAutoIncField
      FieldName = 'id_FuncDistrib'
      ReadOnly = True
    end
    object cdsFuncName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object elCorr: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = False
    WantKeyPriorNext = False
    WantKeyReturn = False
    WantKeyEscape = False
    Control = cbCorrect
    OnSetEditorValue = elCorrSEV
    OnSetEditorFocus = elSetEditorFocus
    OnGetEditorValue = elCorGEV
    OnSetEditorProperties = elSetEditorProperties
    Left = 224
    Top = 184
  end
  object elOType: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = False
    WantKeyPriorNext = False
    WantKeyReturn = False
    WantKeyEscape = False
    Control = cbOperTypeIn
    OnSetEditorValue = elOTypeSEV
    OnSetEditorFocus = elSetEditorFocus
    OnGetEditorValue = elOTypeGEV
    OnSetEditorProperties = elSetEditorProperties
    Left = 224
    Top = 120
  end
  object elKoef: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = False
    WantKeyPriorNext = False
    WantKeyReturn = False
    WantKeyEscape = False
    Control = cbKoef
    OnSetEditorValue = elKoeffSEV
    OnSetEditorFocus = elSetEditorFocus
    OnGetEditorValue = elKoeffGEV
    OnSetEditorProperties = elSetEditorProperties
    Left = 232
    Top = 240
  end
  object elFormal: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = False
    WantKeyPriorNext = False
    WantKeyReturn = False
    WantKeyEscape = False
    Control = lcFormalDistrib
    OnSetEditorValue = elFormalSEV
    OnSetEditorFocus = elSetEditorFocus
    OnGetEditorValue = elFormalGEV
    OnSetEditorProperties = elSetEditorProperties
    Left = 272
    Top = 240
  end
  object elFunc: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = False
    WantKeyPriorNext = False
    WantKeyReturn = False
    WantKeyEscape = False
    Control = lcFuncDistrib
    OnSetEditorValue = elFuncSEV
    OnSetEditorFocus = elSetEditorFocus
    OnGetEditorValue = elFuncGEV
    OnSetEditorProperties = elSetEditorProperties
    Left = 304
    Top = 240
  end
  object elOperVid: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = False
    WantKeyPriorNext = False
    WantKeyReturn = False
    WantKeyEscape = False
    Control = cbOperVid
    OnSetEditorValue = elOperVidSEV
    OnSetEditorFocus = elSetEditorFocus
    OnGetEditorValue = elOperVidGEV
    OnSetEditorProperties = elSetEditorProperties
    Left = 224
    Top = 152
  end
  object cdsExtData: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Oper'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_business'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsExtData_v2'
    RemoteServer = DM.rsCA
    Left = 304
    Top = 400
    object cdsExtDataid_Oper_ExtData: TIntegerField
      FieldName = 'id_Oper_ExtData'
    end
    object cdsExtDataid_Oper: TIntegerField
      FieldName = 'id_Oper'
    end
    object cdsExtDataType: TIntegerField
      FieldName = 'Type'
    end
    object cdsExtDataNumPrm: TIntegerField
      FieldName = 'NumPrm'
    end
    object cdsExtDataParName: TStringField
      FieldName = 'ParName'
      Size = 100
    end
    object cdsExtDataVisible: TBooleanField
      FieldName = 'Visible'
    end
    object cdsExtDataDigVal: TFloatField
      FieldName = 'DigVal'
    end
    object cdsExtDataStrVal: TStringField
      FieldName = 'StrVal'
      Size = 100
    end
    object cdsExtDataDateVal: TDateTimeField
      FieldName = 'DateVal'
    end
  end
  object cdsAP: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_ObjItem'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsAP'
    RemoteServer = DM.rsCA
    Left = 80
    Top = 209
    object cdsAPid_AP_Oper: TAutoIncField
      FieldName = 'id_AP_Oper'
      ReadOnly = True
    end
    object cdsAPid_ObjItem: TIntegerField
      FieldName = 'id_ObjItem'
    end
    object cdsAPid_AP_Oper_Dic: TIntegerField
      FieldName = 'id_AP_Oper_Dic'
    end
    object cdsAPParamType: TIntegerField
      FieldName = 'ParamType'
    end
    object cdsAPV_Str: TStringField
      FieldName = 'V_Str'
      Size = 255
    end
    object cdsAPV1: TFloatField
      FieldName = 'V1'
    end
    object cdsAPExtID: TIntegerField
      FieldName = 'ExtID'
    end
  end
  object cdsCur: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftBoolean
        Name = '@FastAccess'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@AvForPay'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
      end>
    ProviderName = 'dsCur2'
    RemoteServer = DM.rsCA
    Left = 368
    Top = 368
    object cdsCurId_Currency: TAutoIncField
      FieldName = 'Id_Currency'
      ReadOnly = True
    end
    object cdsCurName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object cdsCurShortName: TStringField
      FieldName = 'ShortName'
      Size = 10
    end
    object cdsCurISOCode: TStringField
      FieldName = 'ISOCode'
      FixedChar = True
      Size = 3
    end
    object cdsCurNumberCode: TStringField
      FieldName = 'NumberCode'
      FixedChar = True
      Size = 3
    end
    object cdsCurFastAccess: TBooleanField
      FieldName = 'FastAccess'
    end
    object cdsCurValue: TIntegerField
      FieldName = 'Value'
    end
    object cdsCurRate: TFloatField
      FieldName = 'Rate'
    end
    object cdsCurAvForPay: TBooleanField
      FieldName = 'AvForPay'
    end
    object cdsCurBase: TBooleanField
      FieldName = 'Base'
    end
    object cdsCurLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsCurId_URL: TIntegerField
      FieldName = 'Id_URL'
    end
  end
  object dsFunc: TDataSource
    DataSet = cdsFunc
    Left = 284
    Top = 352
  end
  object elCurOper: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = False
    WantKeyPriorNext = False
    WantKeyReturn = False
    WantKeyEscape = False
    Control = lcCur
    OnSetEditorValue = elCurOperSEV
    OnSetEditorFocus = elSetEditorFocus
    OnGetEditorValue = elCurOperGEV
    Left = 384
    Top = 240
  end
  object elCurSys: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = False
    WantKeyPriorNext = False
    WantKeyReturn = False
    WantKeyEscape = False
    Control = lcCur
    OnSetEditorValue = elCurSysSEV
    OnSetEditorFocus = elSetEditorFocus
    OnGetEditorValue = elCurSysGEV
    Left = 432
    Top = 240
  end
  object cdsAPSumm: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_ObjItem'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'dsAPSumm'
    RemoteServer = DM.rsCA
    Left = 80
    Top = 174
    object cdsAPSummid_ObjItemSumm: TAutoIncField
      FieldName = 'id_ObjItemSumm'
      ReadOnly = True
    end
    object cdsAPSummid_ObjItem: TIntegerField
      FieldName = 'id_ObjItem'
    end
    object cdsAPSummisSys: TBooleanField
      FieldName = 'isSys'
    end
    object cdsAPSummSumm_Type: TIntegerField
      FieldName = 'Summ_Type'
    end
    object cdsAPSummSumm_FormType: TIntegerField
      FieldName = 'Summ_FormType'
    end
    object cdsAPSummSumm_Koeff: TFloatField
      FieldName = 'Summ_Koeff'
    end
    object cdsAPSummSumm_B: TFloatField
      FieldName = 'Summ_B'
    end
    object cdsAPSummSumm_Znak: TStringField
      FieldName = 'Summ_Znak'
      Size = 3
    end
    object cdsAPSummSumm_Koeff2: TFloatField
      FieldName = 'Summ_Koeff2'
    end
    object cdsAPSummSumm_Znak2: TStringField
      FieldName = 'Summ_Znak2'
      Size = 3
    end
    object cdsAPSummSumm_Koeff3: TFloatField
      FieldName = 'Summ_Koeff3'
    end
    object cdsAPSummSumm_Znak3: TStringField
      FieldName = 'Summ_Znak3'
      Size = 3
    end
    object cdsAPSumminPercent: TBooleanField
      FieldName = 'inPercent'
    end
    object cdsAPSummid_Currency: TIntegerField
      FieldName = 'id_Currency'
    end
    object cdsAPSummCurrency_Type: TIntegerField
      FieldName = 'Currency_Type'
    end
    object cdsAPSummSumm_Formulas: TStringField
      FieldName = 'Summ_Formulas'
      Size = 1000
    end
    object cdsAPSummSumm_UseSys: TBooleanField
      FieldName = 'Summ_UseSys'
    end
    object cdsAPSummdd: TBooleanField
      FieldName = 'dd'
    end
    object cdsAPSummID_Main3: TIntegerField
      FieldName = 'ID_Main3'
    end
    object cdsAPSummid_CnstItem: TIntegerField
      FieldName = 'id_CnstItem'
    end
    object cdsAPSummZnakCnstItem: TStringField
      FieldName = 'ZnakCnstItem'
      Size = 3
    end
    object cdsAPSummK_CnstItem: TFloatField
      FieldName = 'K_CnstItem'
    end
  end
  object elCurTypeOper: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = False
    WantKeyPriorNext = False
    WantKeyReturn = False
    WantKeyEscape = False
    Control = sbCrnType
    OnSetEditorValue = elCurTypeOperSEV
    OnSetEditorFocus = elSetEditorFocus
    OnGetEditorValue = elCurTypeOperGEV
    OnSetEditorProperties = elCurTypeOperSetEditorProperties
    Left = 384
    Top = 429
  end
  object elCurTypeSys: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = False
    WantKeyPriorNext = False
    WantKeyReturn = False
    WantKeyEscape = False
    Control = sbCrnType
    OnSetEditorValue = elCurTypeSysSEV
    OnSetEditorFocus = elSetEditorFocus
    OnGetEditorValue = elCurTypeSysGEV
    OnSetEditorProperties = elCurTypeOperSetEditorProperties
    Left = 432
    Top = 429
  end
  object cdsAPObj: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_AP_Obj'
        ParamType = ptInput
      end>
    ProviderName = 'dsAPObj'
    RemoteServer = DM.rsCA
    Left = 23
    Top = 262
    object cdsAPObjid_AP_Obj: TAutoIncField
      FieldName = 'id_AP_Obj'
      ReadOnly = True
    end
    object cdsAPObjid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsAPObjOperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object cdsAPObjOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsAPObjCorrect: TBooleanField
      FieldName = 'Correct'
    end
    object cdsAPObjName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object cdsAPObjid_User: TIntegerField
      FieldName = 'id_User'
    end
    object cdsAPObjDateCreateAP: TDateTimeField
      FieldName = 'DateCreateAP'
    end
    object cdsAPObjDeleted: TBooleanField
      FieldName = 'Deleted'
    end
  end
  object ActionList1: TActionList
    Images = ilImage
    Left = 524
    Top = 123
    object aAddWare: TAction
      Caption = 'Добавить товар'
      Hint = 'Добавить товар'
      ImageIndex = 22
      OnExecute = aAddWareExecute
    end
    object aDelWare: TAction
      Caption = 'Убрать товар'
      Enabled = False
      Hint = 'Убрать товар'
      ImageIndex = 16
      OnExecute = aDelWareExecute
    end
    object aCalcSys: TAction
      Caption = 'Рассчитать сумму зачета'
      Enabled = False
      Hint = 'Рассчитать сумму зачета'
      ImageIndex = 28
    end
    object aSumm: TAction
      Caption = 'Ввести сумму товара'
      Enabled = False
      Hint = 'Ввести сумму товара'
      ImageIndex = 30
    end
    object aCalcAmount: TAction
      Caption = 'Рассчитать...'
      Enabled = False
      Hint = 'Рассчитать...'
      ImageIndex = 29
    end
    object aClearWare: TAction
      Caption = 'Очистить'
      Enabled = False
      ImageIndex = 31
      OnExecute = aClearWareExecute
    end
    object aCalcOper: TAction
      Caption = 'Рассчитать сумму операции'
      Enabled = False
      Hint = 'Рассчитать сумму операции'
      ImageIndex = 32
    end
  end
  object ilImage: TImageList
    Left = 488
    Top = 120
    Bitmap = {
      494C010121002200040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FF00
      0000FFFFFF00C6C6C60000000000C6C6C6000000FF000000FF000000FF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FF000000FF00
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FF000000FF000000FFFF
      FF00FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FF00
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FF000000FF000000FFFF
      FF00FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FF00
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FF000000FF00
      0000FFFFFF00C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FF00
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000FFFF000000000000FFFF000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD0000000000BDBDBD0000000000BDBDBD000000FF000000FF000000FF00BDBD
      BD00000000000000000000000000000000000000000000000000FFFFFF008484
      8400CED6D6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CED6D600FFFF
      FF0084848400CED6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000084840000848400008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD0000000000BDBDBD0000000000BDBDBD0000000000BDBDBD0000000000BDBD
      BD00000000000000000000000000000000000000000084840000FFFFFF008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000084840000FFFF00008484
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000840000008400000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD0000000000BDBDBD0000000000BDBDBD0000000000BDBDBD0000000000BDBD
      BD000000000000000000000000000000000000000000CED6D600FFFFFF008484
      8400CED6D6008484000084840000848400008484000084840000848400008484
      0000848400008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000084000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000084840000FFFF00008484
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      840000000000000000000000000000000000000000000000000000000000BDBD
      BD0000000000BDBDBD0000000000BDBDBD0000000000BDBDBD0000000000BDBD
      BD00000000000000000000000000000000000000000084840000FFFFFF008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      000000848400000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000084840000FFFF00000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      0000848400008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF0000000000008484000000000000000000000000000000000000000000BDBD
      BD0000000000000000000000000000000000000000000000000000000000BDBD
      BD000000000000000000000000000000000000000000CED6D600FFFFFF008484
      8400CED6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6008484
      0000848400008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF00000000000084840000000000000000000000000000000000BDBD
      BD00000000000000000000000000FFFF000000000000FFFF000000000000BDBD
      BD00000000000000000000000000000000000000000084840000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000008484
      0000848400008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF000084840000848400000000000000000000000000BDBD
      BD0000000000000000000000000000000000000000000000000000000000BDBD
      BD00000000000000000000000000000000000000000084840000FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF008484000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000848400000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000848400008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF00000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CED6D600FFFF
      FF0084848400CED6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000FFFFFF008484
      8400CED6D6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      00008484000084840000848400000000000000000000000000000000FF000000
      FF0000000000000000007B7B7B00000000007B7B7B00000000000000FF000000
      FF000000FF0000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000084000000FF000000FF0000008400000084000000
      0000000000000000000000000000000000000000000084848400848484008484
      840084848400848484008484840084848400848484000000000084840000FFFF
      0000FFFF0000FFFFFF000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000FF00FFFFFF000000FF0000008400000084000000
      0000000000000000000000000000000000000000000000000000FFFF00008484
      0000848400008484000084840000848400000000000084840000FFFF0000FFFF
      0000FFFFFF00000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF007B7B7B00000000007B7B7B0000000000000000000000
      00000000FF000000FF000000000000000000000000000084840000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000848400000000000000000000000000000000000000
      00000000000000000000000084000000FF000000840000008400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00008484000084840000848400000000000084840000FFFF0000FFFF0000FFFF
      FF00000000008484000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000CED6D600FFFFFF008484
      8400CED6D60000FFFF000084840000000000000000000084840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000848400000000000084840000FFFF0000FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000FFFF0000FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000007B7B7B00000000007B7B7B0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084840000FFFF0000FFFF0000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000840000000000000084000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084840000FFFF0000FFFF0000FFFFFF000000000084840000848484000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF000000000000000000CED6D600FFFFFF008484
      8400CED6D600000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000008400000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      0000FFFF0000FFFF0000FFFFFF0000000000FFFF000084840000848400008484
      840000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      000000000000000000000084840000FFFF0000FFFF0000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000008400000084000000
      000000000000000000000000000000000000000000000000000084840000FFFF
      0000FFFF0000FFFFFF00000000000000000000000000FFFF0000848400008484
      000084848400000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00848484000000FF000000FF00000084000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000000000000000FF000000
      FF000000FF00000000007B7B7B00000000007B7B7B0000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000008484
      8400CED6D6000084840000FFFF0000FFFF0000FFFF0000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400848484008484840000000000848484008484840084848400C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000C6C6C6008484
      00008484000084840000848484008484840084848400C6C6C600848484008484
      0000848400008484840000000000000000000000000000000000000000000000
      0000000000000084000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00CED6D600FFFF
      FF0084848400CED6D60000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000848484008484
      0000848400008484000084840000C6C6C60084848400C6C6C600848484008484
      8400848400008484000084848400000000000000000000000000000000000000
      0000008400000084000000840000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000000000FFFFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000000000C6C6C600848400000084
      00008484000084840000848400000000000084848400C6C6C600C6C6C6008484
      8400848400008484000084840000C6C6C6000000000000000000000000000000
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000000FFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000084848400848400008484
      0000848400008484840084848400000000000000000084848400848484008484
      8400848484008484000000840000848484000000000000000000000000000084
      0000008400000084000000840000008400000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000084840000848400008484000084
      84000084840000848400008484000000000000000000FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000084840000848400008484000084
      840000848400008484000084840000000000C6C6C60084840000848484008484
      00008484840000000000000000000000000000000000C6C6C600848484000000
      0000848400008484840084848400848484000000000000000000FFFFFF008484
      8400CED6D6000084000000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00CED6D600FFFF
      FF0084848400CED6D600FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848400008484840084848400000000000000000000000000000000008484
      8400848484008484840084848400848484000000000084848400008400000084
      0000000000000000000000840000008400000084000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C6000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C60000000000000000000000000000000000C6C6C60084848400848484008484
      84008484840084840000C6C6C600000000000000000000000000000000000084
      0000848400008484840084848400848484008484840000840000000000000000
      0000000000000000000000000000008400000084000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000084848400C6C6C600C6C6
      C600848484008484840000000000000000000000000000000000000000008484
      8400848400008484000084840000C6C6C6000000000000000000000000000000
      0000000000000000000000000000008400000084000000840000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF008484840000FF
      000000FF0000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000084848400848484008484
      84008484840084848400C6C6C600000000008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000000000000000
      0000000000000000000000000000000000000000000000000000CED6D600FFFF
      FF0084848400CED6D600FFFFFF00FFFFFF00FFFFFF00848484008484840000FF
      000000FF0000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400848484008484
      840000000000000000000000000000000000000000000000000000000000C6C6
      C600848484008484000084840000000000008484840084840000848400008484
      8400848400008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      0000848484008484000084840000848484000000000084848400848400008484
      0000848400008484000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000084
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000008400000084000000
      8400000084000000840000008400000000000000000000000000000000008484
      8400C6C6C6008484840084848400848400008484840084840000848400008484
      0000848400000084000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000000000000000000000000000000000000000000848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      000000FF00000000000000000000000000000000000000000000848484008484
      840084848400848484008484840084848400848484000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000000000000000C6C6
      C60084848400C6C6C600C6C6C600848484000084000084840000848400008484
      0000848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000840000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000C6C6C6008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000000000000000CED6D60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CED6D600FFFFFF008484
      8400CED6D600FFFFFF009CFFFF00009C31009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000000000000000CED6D600000000000000000000000000CED6D600FFFF
      FF0084848400CED6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000000000000000CED6D60084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00009C3100009C3100FFFFFF009CFFFF00FFFFFF009CFF
      FF000000000000000000CED6D600000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF009CFFFF00009C3100009C3100009C3100009C3100009C31009CFFFF00FFFF
      FF000000000000000000CED6D600000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00009C3100009C3100FFFFFF00639C0000636300009CFF
      FF000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      00000000000000000000000000000000000000000000CED6D600FFFFFF008484
      8400CED6D600FFFFFF009CFFFF00009C31009CFFFF00FFFFFF0063630000FFFF
      FF000000000000000000CED6D600000000000000000000000000CED6D600FFFF
      FF0084848400CED6D60000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00636300009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00636300009CFF
      FF000000000000000000CED6D60000000000000000000000000000000000FFFF
      FF00000000000000000000000000C6DEC6000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF0063630000FFFFFF009CFFFF00009C31009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000000000000000CED6D60000000000000000000000000000000000FFFF
      FF00000000000000000000000000C6DEC6000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF0063630000639C0000FFFFFF00009C3100009C31009CFFFF00FFFFFF009CFF
      FF000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      00000000000000000000000000000000000000000000CED6D600FFFFFF008484
      8400CED6D600009C3100009C3100009C3100009C3100009C31009CFFFF00FFFF
      FF000000000000000000CED6D60000000000000000000000000000000000FFFF
      FF0084848400CED6D60000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00009C3100009C31009CFFFF00FFFFFF000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00009C31009CFFFF00FFFFFF00000000000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF0084848400FFFF
      FF0000000000CED6D600CED6D600000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CED6D600FFFFFF008484
      8400CED6D600CED6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      000000000000CED6D60000000000CED6D6000000000000000000000000000000
      000084848400CED6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840084848400848484008484840084848400848484008484840084848400CED6
      D600CED6D60000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000848484000000000000000000C6C6C6000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF008484840000000000848484000000000000FFFF0000000000848484000000
      000084848400FFFFFF00FFFFFF00000000000000000000000000FFFFFF008484
      8400CED6D600FFFF0000FFFF000000000000FFFF0000FF000000000000000000
      000084848400000000000000000000000000000000000000000000000000FFFF
      FF0084848400CED6D60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C6000000000000FFFF00848484000000000000FFFF00000000008484840000FF
      FF0000000000C6C6C600FFFFFF0000000000000000000000000000000000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000000000000000000084848400000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000848484008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      84008484840000000000FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF000000000000FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400000000000000000000FFFF0084848400000000008484840000FFFF000000
      00000000000084848400FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000000000FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000000000FFFFFF000000000000000000CED6D600FFFFFF008484
      8400CED6D600FFFF0000FFFF000000000000FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF0000000000000000000000000000000000000000000000FFFF
      FF0084848400CED6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400000000000000000000FFFF0084848400000000008484840000FFFF000000
      00000000000084848400FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00848484008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      840084848400FFFFFF00FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF008484840084848400000000008484840084848400000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF000000000000FFFF00848484000000000000FFFF00000000008484840000FF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFF0000FFFF00008484
      84000000FF00FFFF000000000000FFFF000000000000848484000000FF000000
      FF0000000000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF008484840000000000848484000000000000FFFF0000000000848484000000
      000084848400FFFFFF00FFFFFF000000000000000000CED6D600FFFFFF000000
      0000CED6D6000000FF00FFFF00000000000084848400848484000000FF000000
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0084848400CED6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF000000000000FFFF
      000000000000FFFF00000000FF00848484000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFF00000000FF0000000000848484000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000848484000000
      00000000000000000000FFFF00008484840084848400848484000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000CED6D6000000000000000000FFFF000000000000848484000000FF000000
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0084848400CED6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000C6C6C6000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CED6D6000000000000000000000000000084840000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0084848400CED6D600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000FFFF0000FFFF0000FFFFFF00FFFF0000FF000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000FF00000000000000FFFFFF0000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000000000000000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      000000000000000000008484840000000000000000000000000000000000FF00
      000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000084840000FFFF0000000000000000000084840000FFFF00008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000FF000000FF00
      0000FF00000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      84000000000000000000000000000000000084848400FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF0000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF00
      0000000000000000000000000000000000000000000000000000000000008484
      8400CED6D60000FFFF0000000000000000000084840000FFFF00008484000084
      84000000000000000000000000000000000084848400FFFFFF00CED6D600FFFF
      FF0084848400CED6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF000000000000000000000084000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FF0000000000000000000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      84000000000000000000000000000000000084848400FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF00000000000000000000FF00000084000000FF000000FF00
      0000FF000000FF000000FF000000FF00000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FF00000000000000000000000000000000000000000000008484
      84000084840000FFFF0000000000000000000084840000FFFF00008484000084
      84000000000000000000000000000000000084848400FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF008484840084848400FFFFFF0084848400848484000000FF00FF00
      0000FFFF0000FF000000000000000000000000000000FF00000084000000FF00
      0000FF00000000000000FF000000FF000000FF00000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FF000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      84000000000000000000000000000000000084848400FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF000000000000FFFF00000000000000000000000000FFFF0000FFFF00008484
      84000000FF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF00000000FF008484
      8400FF000000FFFF000000000000000000000000000000000000FF0000008400
      0000FF000000FF000000FF00000000000000FF000000FF00000000000000FFFF
      FF0000000000FF00000000000000000000000000000000000000000000008484
      8400CED6D60000FFFF0000000000000000000084840000FFFF00008484000084
      84000000000000000000000000000000000084848400FFFFFF00CED6D600FFFF
      FF0084848400CED6D6000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000008484840084848400FFFF
      FF00FFFF00000000FF00FFFF0000FFFFFF00FFFF00000000FF00FFFF0000FFFF
      FF0084848400848484000000000000000000000000000000000000000000FF00
      000084000000FF0000000000000000000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000084840000000000008484000000000000848400000000000084
      84000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF00000000FF000000FF000000FF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF000000000000000000000000000000000000000000000000
      0000FF00000084000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000FFFF000000000000FFFF000000000000FFFF000000
      00000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF008484840000000000FFFFFF008484840084848400FFFF
      FF0000000000000000000000000000000000848484000000000000000000FFFF
      FF00FFFF00000000FF00FFFFFF00FFFF0000FFFFFF000000FF00FFFF0000FFFF
      FF00000000000000000084848400000000000000000000000000000000000000
      000000000000FF00000084000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF008484840084848400FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000848484000000
      000000000000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00000084000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CED6D6000000000000FFFF000000000000FFFF000000000000FFFF008484
      8400000000000000000000000000000000008484840084848400CED6D600FFFF
      FF0084848400CED6D600000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000FFFF00000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840000000000000000000000000084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000424242004242420042424200000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600848484008484840084848400848484008484840000000000000000008484
      840084848400C6C6C60000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF000084840000FFFF000084
      84000000000000000000000000000000000000000000BDBDBD00000000007B7B
      7B0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200000000000000
      00000000000000000000000000000000000000000000C6C6C6000063630000A5
      A50000C6C60000C6C60000A5A5000084840000848400002121000042420000E7
      E7000084840000636300C6C6C600000000000000000000000000000000000000
      0000008484000000000000FFFF0000FFFF000084840000848400000000000084
      84000084840000000000000000000000000000000000CED6D600FFFFFF008484
      8400CED6D600FFFFFF00FFFFFF00BDBDBD000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0084848400CED6D60000000000848484004242420042424200000000000000
      0000212121000000000000000000000000000000000000424200008484000084
      840031737300315252003152520000424200002121000063630000FFFF0000C6
      C60000A5A5000084840000424200000000000000000000000000000000000084
      84000000000000FFFF0000FFFF000000000000FFFF000084840000FFFF000084
      84000084840000848400000000000000000000000000BDBDBD00BDBDBD000000
      0000000000000000000000000000FFFFFF00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000212121006363
      6300313131002121210021212100A5A5A5006363630000000000000000002121
      21002121210021212100000000000000000000000000000000000084840000A5
      A50000A5A5000084840000848400008484000084840000C6C60000A5A50000C6
      C60000E7E70000C6C60000A5A500848484000000000000000000000000000084
      84000084840000FFFF0000FFFF0000FFFF0000FFFF0000848400008484000084
      8400008484000084840000000000000000000000000000000000000000007B7B
      7B00FFFFFF00FFFFFF00FFFFFF0000000000BDBDBD00BDBDBD00000000000000
      000000000000000000000000000000000000000000000000000021212100A5A5
      A500C6C6C60073737300A5A5A500C6C6C600C6C6C60063636300737373009494
      9400212121004242420000000000000000004263630000A5A500008484000063
      6300006363000063630000424200004242000084840000C6C6000084840000E7
      E70000FFFF0000A5A50000C6C60084848400000000000000000000FFFF000084
      840000FFFF000084840000FFFF0000FFFF000084840000FFFF0000FFFF000084
      840000FFFF000084840000848400000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00BDBDBD00000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000003131
      3100C6C6C60094949400D6D6D600B5B5B500A5A5A500D6D6D600737373007373
      73000000000042424200000000000000000000212100002121000063630000A5
      A50000C6C60000C6C60000A5A500008484000084840000C6C6000084840000C6
      C60000C6C60000C6C60000C6C60084848400000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00008484000084840000848400000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000042424200CED6D600FFFF
      FF0084848400CED6D60063636300424242006363630063636300D6D6D6006363
      6300000000004242420042424200424242004263630000424200004242000084
      840063A5A5003194940031949400319494000084840000A5A5000084840000A5
      A50000C6C60000C6C60000A5A500C6C6C600000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000084840000FFFF0000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00BDBDBD00424242003131310063636300E7E7
      E700636363009494940073737300737373005252520063636300A5A5A500C6C6
      C600636363004242420000000000424242000000000000212100006363000042
      4200006363000063630000636300006363000042420000E7E70000A5A5000084
      84000084840000FFFF004263630000000000000000000000000000FFFF000084
      840000FFFF0000848400008484000084840000FFFF0000FFFF000000000000FF
      FF00008484000084840000FFFF00000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000004242420063636300D6D6D600E7E7
      E700424242006363630084848400636363007373730042424200B5B5B500C6C6
      C600A5A5A50084848400000000004242420000000000848484000084840000A5
      A50000A5A50000A5A50000A5A50000A5A50000A5A5000063630000A5A50000A5
      A50000A5A500428484000000000000000000000000000000000000FFFF000084
      84000084840000848400008484000084840000FFFF0000FFFF0000FFFF000084
      840000FFFF000084840000FFFF000000000000000000000000000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000FFFFFF00212121000000000000000000A5A5
      A50063636300B5B5B500C6C6C600848484007373730063636300D6D6D600A5A5
      A500212121002121210000000000212121000000000084848400004242000042
      420000C6C60063A5A50031525200315252003152520000212100000000000021
      210000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00008484000084840000848400008484000084840000848400008484000084
      840000FFFF0000FFFF00000000000000000000000000CED6D600FFFFFF008484
      8400CED6D60000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF000000000000FFFF000000000000000000000000000000000000000000FFFF
      FF0084848400CED6D600B5B5B5006363630094949400C6C6C600949494006363
      63000000000042424200000000000000000000000000C6C6C600006363003173
      73000063630000A5A50000C6C60000C6C60000C6C60000C6C60000C6C6000063
      63004263630000000000000000000000000000000000000000000000000000FF
      FF00008484000084840000FFFF000084840000848400008484000084840000FF
      FF0000FFFF0000848400000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF000000000000FFFF000000000000000000000000000000000000000000A5A5
      A500D6D6D600B5B5B500636363004242420063636300A5A5A500B5B5B500A5A5
      A500212121004242420000000000000000000000000000000000C6C6C6000042
      42003173730073D6D60084FFFF0084E7E70042C6C60000A5A50000A5A5000042
      42000063630084848400000000000000000000000000000000000000000000FF
      FF0000FFFF00008484000084840000848400008484000000000000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF000000
      000000FFFF000000000000000000000000000000000000000000424242005252
      5200A5A5A50031313100A5A5A500E7E7E700E7E7E70063636300212121007373
      7300212121002121210000000000000000000000000000000000000000000021
      21000084840000A5A50000C6C60000FFFF0000FFFF0000C6C60000C6C60000A5
      A500006363008484840000000000000000000000000000000000000000000000
      000000FFFF0000FFFF00008484000084840000FFFF000084840000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000006363
      6300424242002121210000000000D6D6D6006363630042424200000000002121
      210021212100000000000000000000000000000000000000000000000000C6C6
      C600004242000084840000C6C60000E7E70042FFFF0084FFFF0042C6C6000042
      4200426363000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CED6D60000000000000000000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363003131310042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000021212100424242004242420042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400CED6D600218C2100007B0000007B0000007B000008840800218C21005AAD
      5A00B5D6B500FFFFFF0000000000000000008484840000FFFF00CED6D600FFFF
      FF0084848400CED6D60000FFFF0000FFFF0000FFFF0000FFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000FFFF000000000000DEEFDE00399C39000084
      000000840000008400000084000000C6000000C6000000840000008400000084
      00000084000031943100DEEFDE00000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF00848484000000000000000000000000000000000000000000000000000084
      8400000000000084840000000000008484000000000000848400000000000084
      84000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF0000E7F7E700188C1800008400000084
      0000008400000084000000D6000000FF000000FF000000BD0000008400000084
      00000084000000840000188C1800E7EFE7008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF0000FFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000848400008484000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF000063AD630000840000008400000084
      0000008400000084000000E7000000A5000000B5000000F70000008400000084
      00000084000000840000008400005AAD5A008484840084848400848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      FF0000FFFF00848484008484840000000000C6C6C60000848400008484000084
      8400008484000084840000848400008484000084840000000000008400000084
      84000084840000000000000000000000000000000000FFFFFF00FFFF00000000
      000000FFFF000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF0000188C1800CED6D600FFFFFF008484
      8400CED6D600008400000094000000C6000000DE000000EF0000008400000084
      0000008400000084000000840000088408008484840000FFFF00CED6D600FFFF
      FF0084848400CED6D60000FFFF0000FFFF0000FFFF0000FFFF00848484008484
      840000FFFF008484840000FFFF0084848400FFFFFF0000848400008484000084
      840000848400008484000084840000848400008484000084840000FFFF000000
      00000084840000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF0000188C180000840000008400000084
      0000008400000084000000F7000000EF000000DE000000A50000008400000084
      0000008400000084000000840000007B00008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF00848484008484840000FFFF0084848400FFFFFF0000848400008484000084
      840000848400008484000084840000FFFF0000FFFF00000000000084840000FF
      FF0000FFFF0000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000000000FFFF00005AAD5A0000840000008400000084
      0000008400000084000000FF000000B5000000A5000000D60000008400000084
      00000084000000840000008400004AA54A008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF0000FFFF008484840000FFFF0084848400FFFFFF00FFFFFF00008484000084
      8400008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000848400FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF00000000000000000000FFFF00FFFF
      FF0000FFFF00000000000000000000000000DEEFDE00108C1000008400000084
      0000008400000084000000EF000000F7000000F7000000DE0000008400000084
      0000008400000084000008840800D6E7D6008484840084848400848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      FF0000FFFF0084848400848484008484840084000000FFFFFF00C6C6C60000FF
      FF0000000000000000000084840000FFFF0000FFFF0000848400000000000084
      84000084840000000000FFFFFF008400000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000000000000000000000
      00000000000000000000000000000000000000000000CED6D600FFFFFF008484
      8400CED6D60000840000008C000000DE000000DE000000840000008400000084
      000000840000188C1800C6DEC600000000008484840000FFFF00CED6D600FFFF
      FF0084848400CED6D6008484840000FFFF0000FFFF0000FFFF0000FFFF008484
      840000FFFF008484840000FFFF008484840084000000FFFFFF00C6C6C60000FF
      FF0000FFFF0000FFFF0000000000000000000000000000848400008484000084
      840000848400FFFFFF00FFFFFF008400000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000F7FFF70094C6
      9400399C39000084000000840000008C0000008C00000084000000840000399C
      390094C69400F7FFF7000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FF
      FF00848484008484840000FFFF00848484008400000084000000FFFFFF000000
      000000FFFF0000FFFF0000848400008484000084840000FFFF0000FFFF0000FF
      FF0000848400FFFFFF0084000000840000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFF7EF0029942900008400000084000000840000008400005AAD5A00F7FF
      F700000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000FFFF00848484008400000084000000000000000000
      000000000000008484000084840000FFFF000084840000000000000000000000
      0000FFFFFF0084000000840000008400000000000000000000007B7B7B000000
      00007B7B7B00000000007B7B7B00000000007B7B7B00000000000000000000FF
      FF0000000000000000000000000000000000000000000000000000000000F7F7
      F700319C31000084000000840000008400000084000000840000008400003194
      3100E7EFE7000000000000000000000000000000000000000000000000008484
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484840000FFFF0000FF
      FF0000FFFF0000FFFF0084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000000000000000000007B7B7B000000
      00007B7B7B00000000007B7B7B00000000007B7B7B0000000000000000000000
      00000000FF000000000000000000000000000000000000000000FFFFFF008484
      8400CED6D6000084000000840000008400000084000000840000008400000084
      0000108C1000C6DEC60000000000000000000000000000000000000000000000
      000084848400CED6D60084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094BD940084BD
      840063AD63004AA54A008CBD8C0073B57300088408000884080018841800A5CE
      A5007BBD7B0052A55200B5D6B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF00C007000000000000C007000000000000
      C007000000000000800700000000000000070000000000000007000000000000
      000700000000000000070000000000008007000000000000C007000000000000
      C007000000000000C007000000000000C007000000000000C007000000000000
      C007000000000000C007000000000000C007FFFFFFFF847FC007FFFFFFFF00EF
      C007C003C00731BFC0078001E7E739FFC0078001F3F7993FC0078001F9F7CA1F
      C0078001FCFFF40FC0078001FE7F9C07C0078001FF3F9603C0078001FE7FCB01
      C0078001FCFFFF80C0078001F9F7F7C0C0078001F3F7FFE0C007C003E7E7EFF0
      C007FFFFC007FFF8C007FFFFFFFFFFFCFFFFF81FFFFFFFFFF83FE007FE1FFFE0
      E00FC003FC1F0000CC478001FC0F000184638001FC0F8003A0730000FC1FC001
      31F90000FF7FE00138F90000FE3FF01F3C790000FE3FF01F3C390000FE1FE00F
      3C190000FC1FC0079C0B8001FC0F81038C438001FC0F0381C467C003F80F07C1
      E00FE007FC0FFFFFF83FF81FFE3FFFFFFF9FFFFF000F000FF107FFFF00070007
      C003F9FF00030003C001F0FF000100018100F0FF000000008180E07F00000000
      0790C07F0000000001E0843F0007000701E01E3F0003000783E0FE1F80038007
      8101FF1FC001C007E103FF8FC000C001E081FFC7C000C000E001FFE3C001C000
      E005FFF8FFC3FF81F00FFFFFFFE7FFFFFFFF8001FFFFFFFFDFFB3FF9FFFFFFFF
      8FFF800983E0001F87F7000983E0000FC7EF800983E00007E3CF800980800003
      F19F800980000001F83F800980000000FC7F80098000001FF83F8009C001001F
      F19F8009E083001FC3CF8019E0838FF187E78001F1C7FFF98FFB8001F1C7FF75
      FFFF800AF1C7FF8FFFFF8005FFFFFFFF8000FC7FFFFFFFFF8000F01FFFFF000F
      8000C107E003000F80008001E003000F80000101E003000F80000001E003000F
      80000101E003000F80000001E003000F80000101E003008F80000281E0031144
      80001101E0030AB880002801E003057C80009201E007FAFC8001C403E00FFDF8
      8003F007E01FFE048007FC4FFFFFFFFFFFFFFFFFFFFFFC7FFDFFFC3FD8BFF01F
      F8FFF30FE07FC007F07FE287F07F0001E03FE30700010001C01FE28700010001
      800FE307000100010007E287000100010003E307000100018001E28700010001
      C003E30700010001E00FE2A700050001F00FE55700010001F81FEAA70005C007
      FC7FF54F0101F01FFFFFF81FC387FC7FFE0F81FFFE3FE063F00780FFFFBF8001
      E003007FE2378001C001001FC0638000C0018007C00300008000E001E00B0000
      8000F800800800008000F800000280018000E000000280038000C0006002800F
      80018002E00B8007C0018003E003C003C003C003C003E003E007E007E227E007
      F00FF00FFE3FF81FFC1FFC3FFC3FFFFF803FFFFFFFFFFFFF001FFFFF001FFF7F
      0004C003000FE00F000080010007C00F00000000000300070000000000010003
      0000000000000003000000000000000000000000000000000000000000000000
      0007800100000000001FC00380000000000FF00FC00008008007E007E0007FF0
      8023C003F000FFFC5577C001FFFFFFFE00000000000000000000000000000000
      000000000000}
  end
  object cdsAPGoods: TClientDataSet
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
        Name = '@id_ObjItem'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsAPGoods'
    RemoteServer = DM.rsCA
    OnCalcFields = cdsAPGoodsCalcFields
    Left = 168
    Top = 494
    object cdsAPGoodsid_AP_Goods: TAutoIncField
      FieldName = 'id_AP_Goods'
    end
    object cdsAPGoodsid_ObjItem: TIntegerField
      FieldName = 'id_ObjItem'
    end
    object cdsAPGoodsid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsAPGoodsAmount_Koeff: TBCDField
      FieldName = 'Amount_Koeff'
      Precision = 19
    end
    object cdsAPGoodsAmount_Znak: TStringField
      FieldName = 'Amount_Znak'
      Size = 3
    end
    object cdsAPGoodsAmount_B: TBCDField
      FieldName = 'Amount_B'
      Precision = 19
    end
    object cdsAPGoodsDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsAPGoodsid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsAPGoodsSumm_UseSys: TBooleanField
      FieldName = 'Summ_UseSys'
    end
    object cdsAPGoodsSumm_Type: TIntegerField
      FieldName = 'Summ_Type'
    end
    object cdsAPGoodsSumm_Koeff: TBCDField
      FieldName = 'Summ_Koeff'
      Precision = 19
    end
    object cdsAPGoodsSumm_B: TBCDField
      FieldName = 'Summ_B'
      Precision = 19
    end
    object cdsAPGoodsSumm_Znak: TStringField
      FieldName = 'Summ_Znak'
      FixedChar = True
      Size = 3
    end
    object cdsAPGoodsid_Currency: TIntegerField
      FieldName = 'id_Currency'
    end
    object cdsAPGoodsCurrency_Type: TIntegerField
      FieldName = 'Currency_Type'
    end
    object cdsAPGoodsMeasureName: TStringField
      FieldName = 'MeasureName'
      Size = 10
    end
    object cdsAPGoodsRealKoef: TFloatField
      FieldName = 'RealKoef'
    end
    object cdsAPGoodsWareName: TStringField
      FieldName = 'WareName'
      Size = 255
    end
    object cdsAPGoodsNumb: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'Numb'
    end
    object cdsAPGoodsPriceStr: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'PriceStr'
      Size = 255
    end
    object cdsAPGoodsAmountStr: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'AmountStr'
      Size = 255
    end
  end
  object dsAPGoods: TDataSource
    DataSet = cdsAPGoods
    OnDataChange = dsAPGoodsDataChange
    Left = 208
    Top = 494
  end
end
