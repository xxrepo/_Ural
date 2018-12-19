object fAPCond: TfAPCond
  Left = 0
  Top = 0
  Width = 909
  Height = 663
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 909
    Height = 622
    Align = alClient
    Caption = ' '
    TabOrder = 0
    object AdvStringGrid1: TAdvColumnGrid
      Left = 1
      Top = 1
      Width = 907
      Height = 620
      Cursor = crDefault
      Align = alClient
      ColCount = 5
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
      PopupMenu = PopupMenu1
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
          Width = 80
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
          Width = 80
        end>
      ColWidths = (
        20
        211
        75
        80
        80)
      object cbCorrect: TComboBox
        Left = 80
        Top = 227
        Width = 679
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 3
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
        TabOrder = 4
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
        TabOrder = 5
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
        TabOrder = 6
        Visible = False
        OnChange = cbKoefChange
        OnKeyDown = cbKoefKeyDown
        Items.Strings = (
          'Расчет с контрагентом'
          'Прибыль'
          'Затрата')
      end
      object cbCond: TComboBox
        Left = 64
        Top = 291
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
      object lcCur: TRxDBLookupCombo
        Left = 560
        Top = 256
        Width = 145
        Height = 21
        DropDownCount = 8
        DisplayEmpty = '   '
        LookupField = 'Id_Currency'
        LookupDisplay = 'Name'
        LookupSource = dsCur
        TabOrder = 8
        Visible = False
      end
      object cbAutoGen: TComboBox
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
      object lcFormalDistrib: TRxDBLookupCombo
        Left = 64
        Top = 256
        Width = 145
        Height = 21
        DropDownCount = 8
        DisplayEmpty = '   '
        LookupField = 'id_FormalDistrib'
        LookupDisplay = 'Name'
        LookupSource = dsFormal
        TabOrder = 10
        Visible = False
      end
      object lcFuncDistrib: TRxDBLookupCombo
        Left = 240
        Top = 256
        Width = 145
        Height = 21
        DropDownCount = 8
        DisplayEmpty = '   '
        LookupField = 'id_FuncDistrib'
        LookupDisplay = 'Name'
        LookupSource = dsFunc
        TabOrder = 11
        Visible = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 909
    Height = 41
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Edit1: TEdit
      Left = 40
      Top = 8
      Width = 281
      Height = 21
      TabOrder = 0
    end
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
    Left = 80
    Top = 174
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
    object cdsAPObjIndAuto: TIntegerField
      FieldName = 'IndAuto'
    end
    object cdsAPObjId_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object cdsAPObjId_CurrencySys: TIntegerField
      FieldName = 'Id_CurrencySys'
    end
    object cdsAPObjid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsAPObjid_Warehouse: TIntegerField
      FieldName = 'id_Warehouse'
    end
    object cdsAPObjid_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object cdsAPObjid_Acc_Ext: TIntegerField
      FieldName = 'id_Acc_Ext'
    end
    object cdsAPObjid_Warehouse_Ext: TIntegerField
      FieldName = 'id_Warehouse_Ext'
    end
    object cdsAPObjid_Manufact_Ext: TIntegerField
      FieldName = 'id_Manufact_Ext'
    end
    object cdsAPObjid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsAPObjid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object cdsAPObjKoeff: TIntegerField
      FieldName = 'Koeff'
    end
    object cdsAPObjid_FormalDistrib: TIntegerField
      FieldName = 'id_FormalDistrib'
    end
    object cdsAPObjid_FuncDistrib: TIntegerField
      FieldName = 'id_FuncDistrib'
    end
    object cdsAPObjOpComment: TStringField
      FieldName = 'OpComment'
      Size = 1000
    end
    object cdsAPObjImp_PayBasic: TStringField
      FieldName = 'Imp_PayBasic'
      Size = 1000
    end
    object cdsAPObjAccInv_PayAssignment: TStringField
      FieldName = 'AccInv_PayAssignment'
      Size = 1000
    end
    object cdsAPObjContract: TStringField
      FieldName = 'Contract'
      Size = 1000
    end
    object cdsAPObjAutoGen: TBooleanField
      FieldName = 'AutoGen'
    end
    object cdsAPObjid_Goods: TIntegerField
      FieldName = 'id_Goods'
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
    Left = 248
    Top = 392
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
  object cdsAPCond: TClientDataSet
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
    ProviderName = 'dsAPCond'
    RemoteServer = DM.rsCA
    Left = 80
    Top = 209
    object cdsAPCondid_AP_Cond: TAutoIncField
      FieldName = 'id_AP_Cond'
      ReadOnly = True
    end
    object cdsAPCondid_AP_Obj: TIntegerField
      FieldName = 'id_AP_Obj'
    end
    object cdsAPCondid_AP_Oper_Dic: TIntegerField
      FieldName = 'id_AP_Oper_Dic'
    end
    object cdsAPCondAPCond: TIntegerField
      FieldName = 'APCond'
    end
    object cdsAPCondV_Str: TStringField
      FieldName = 'V_Str'
      Size = 255
    end
    object cdsAPCondExtID: TIntegerField
      FieldName = 'ExtID'
    end
    object cdsAPCondV_Str2: TStringField
      FieldName = 'V_Str2'
      Size = 255
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
  object edCondOper: TFormControlEditLink
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
    Control = cbCond
    OnSetEditorValue = edCondOperSetEditorValue
    OnSetEditorFocus = elSetEditorFocus
    OnGetEditorValue = edCondOperGetEditorValue
    OnSetEditorProperties = elSetEditorProperties
    Left = 562
    Top = 368
  end
  object edCondSys: TFormControlEditLink
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
    Control = cbCond
    OnSetEditorValue = edCondOperSetEditorValue
    OnSetEditorFocus = elSetEditorFocus
    OnGetEditorValue = edCondOperGetEditorValue
    OnSetEditorProperties = elSetEditorProperties
    Left = 594
    Top = 368
  end
  object elAutoGen: TFormControlEditLink
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
    Control = cbAutoGen
    OnSetEditorValue = alAGSev
    OnSetEditorFocus = elSetEditorFocus
    OnGetEditorValue = alAGGev
    OnSetEditorProperties = elSetEditorProperties
    Left = 160
    Top = 397
  end
  object cdsGoodsProp: TClientDataSet
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
        Name = '@id_Goods'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsGoodsProp'
    RemoteServer = DM.rsCA
    Left = 368
    Top = 32
    object cdsGoodsPropid_Goods: TAutoIncField
      FieldName = 'id_Goods'
      ReadOnly = True
    end
    object cdsGoodsPropid_Ctg_Goods: TIntegerField
      FieldName = 'id_Ctg_Goods'
    end
    object cdsGoodsPropName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsGoodsPropShortName: TStringField
      FieldName = 'ShortName'
      Size = 100
    end
    object cdsGoodsPropBarCode: TStringField
      FieldName = 'BarCode'
    end
    object cdsGoodsPropDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsGoodsPropLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsGoodsPropid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsGoodsPropMeasureName: TStringField
      FieldName = 'MeasureName'
      Size = 50
    end
    object cdsGoodsPropGTD: TStringField
      FieldName = 'GTD'
      Size = 50
    end
    object cdsGoodsPropCountry: TStringField
      FieldName = 'Country'
      Size = 255
    end
    object cdsGoodsPropDocNomCode: TStringField
      FieldName = 'DocNomCode'
      Size = 50
    end
    object cdsGoodsPropDocPriceCode: TStringField
      FieldName = 'DocPriceCode'
      Size = 50
    end
    object cdsGoodsPropDocArt: TStringField
      FieldName = 'DocArt'
      Size = 50
    end
    object cdsGoodsPropDocNumber: TStringField
      FieldName = 'DocNumber'
      Size = 50
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 595
    Top = 108
    object miClearPar: TMenuItem
      Caption = 'Очистить'
      OnClick = miClearParClick
    end
  end
end
