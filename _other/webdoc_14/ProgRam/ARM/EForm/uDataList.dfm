object DataList: TDataList
  Left = 156
  Top = 47
  Width = 1137
  Height = 599
  Caption = 'DataList'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object spFlt: TsSplitter
    Left = 432
    Top = 53
    Width = 3
    Height = 519
    Cursor = crHSplit
    OnMoved = spFltMoved
    SkinData.SkinSection = 'SPLITTER'
  end
  object pnCA: TsPanel
    Left = 435
    Top = 53
    Width = 694
    Height = 519
    Align = alClient
    Caption = 'Контрагенты'
    Constraints.MinHeight = 1
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object spCA: TsSplitter
      Left = 1
      Top = 301
      Width = 692
      Height = 3
      Cursor = crVSplit
      Align = alTop
      OnMoved = spCAMoved
      SkinData.SkinSection = 'SPLITTER'
    end
    object dbgCA: TDBGridEh
      Left = 1
      Top = 27
      Width = 692
      Height = 274
      Align = alTop
      DataGrouping.GroupLevels = <>
      DataSource = dsCAList
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = pmCA
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnCellClick = dbgCACellClick
      Columns = <
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'ObjName'
          Footers = <>
          Title.Caption = 'Юрлицо'
          Title.EndEllipsis = True
          Title.TitleButton = True
          Width = 140
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'CAName'
          Footers = <>
          Title.Caption = 'Принадлежность'
          Title.EndEllipsis = True
          Title.TitleButton = True
          Width = 90
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'isSellerStr'
          Footers = <>
          Title.Caption = 'Роли|Продавец'
          Title.EndEllipsis = True
          Title.TitleButton = True
          Width = 76
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'isBayerStr'
          Footers = <>
          Title.Caption = 'Роли|Покупатель'
          Title.EndEllipsis = True
          Title.TitleButton = True
          Width = 82
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'isUsedStr'
          Footers = <>
          Title.Caption = 'Активен'
          Title.EndEllipsis = True
          Title.TitleButton = True
          Width = 72
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'WorkType'
          Footers = <>
          Tag = -777
          Title.Caption = 'Вид деятельности|Виды деятельности'
          Title.EndEllipsis = True
          Title.TitleButton = True
          Width = 197
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'RealWorkType'
          Footers = <>
          Tag = -777
          Title.Caption = 'Вид деятельности|Тематика'
          Title.EndEllipsis = True
          Title.TitleButton = True
          Width = 176
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    inline fFiles1: TfFiles
      Left = 1
      Top = 304
      Width = 692
      Height = 214
      TabOrder = 1
      inherited dbgFileList: TDBGridEh
        Width = 692
        Height = 188
      end
      inherited sPanel1: TsPanel
        Width = 692
        inherited sButton3: TsButton
          OnClick = nil
        end
      end
      inherited ActionList1: TActionList
        Left = 147
        Top = 45
      end
    end
    object sPanel2: TsPanel
      Left = 1
      Top = 1
      Width = 692
      Height = 26
      Align = alTop
      Caption = ' '
      TabOrder = 2
      SkinData.SkinSection = 'PANEL'
      object sLabel4: TsLabel
        Left = 8
        Top = 5
        Width = 40
        Height = 13
        Caption = 'Фильтр'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object FilterEdit: TsEdit
        Left = 56
        Top = 2
        Width = 217
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
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
  end
  object pnHide: TsPanel
    Left = 0
    Top = 0
    Width = 1129
    Height = 53
    Align = alTop
    Caption = ' '
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object sbHideCA: TsSpeedButton
      Left = 399
      Top = 4
      Width = 140
      Height = 22
      Caption = 'Скрыть контрагентов'
      Visible = False
      OnClick = sbHideCAClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 24
      Images = DM.ilImage
    end
    object sbHideFlt: TsSpeedButton
      Left = 140
      Top = 4
      Width = 140
      Height = 22
      Caption = 'Скрыть фильтры'
      OnClick = sbHideFltClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 24
      Images = DM.ilImage
    end
    object sbHideFiles: TsSpeedButton
      Left = 556
      Top = 4
      Width = 140
      Height = 22
      Caption = 'Скрыть файлы'
      Visible = False
      OnClick = sbHideFilesClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 24
      Images = DM.ilImage
    end
    object sLabel1: TsLabel
      Left = 7
      Top = 32
      Width = 108
      Height = 13
      Caption = 'Условия фильтрации'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object edFltFull: TsEdit
      Left = 120
      Top = 29
      Width = 1001
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = 'Нет'
      SkinData.SkinSection = 'DIVIDER'
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
    object sButton1: TsButton
      Left = 7
      Top = 3
      Width = 106
      Height = 25
      Caption = 'Новый поиск'
      TabOrder = 1
      OnClick = sButton1Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sCheckBox1: TsCheckBox
      Left = 723
      Top = 4
      Width = 108
      Height = 19
      Caption = 'Фильтры слева'
      TabOrder = 2
      Visible = False
      OnClick = sCheckBox1Click
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object pnFlt: TsPanel
    Left = 0
    Top = 53
    Width = 432
    Height = 519
    Align = alLeft
    Caption = ' '
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object spCond: TsSplitter
      Left = 1
      Top = 201
      Width = 430
      Height = 4
      Cursor = crVSplit
      Align = alTop
      SkinData.SkinSection = 'SPLITTER'
    end
    object pcFlt2: TsPageControl
      Left = 1
      Top = 1
      Width = 430
      Height = 200
      ActivePage = tsTree
      Align = alTop
      Constraints.MinHeight = 100
      HotTrack = True
      Images = DM.ilImage
      MultiLine = True
      TabOrder = 0
      SkinData.SkinSection = 'PAGECONTROL'
      object tsTree: TsTabSheet
        Caption = 'Дерево       '
        ImageIndex = 23
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        object fltTree: TsTreeView
          Left = 0
          Top = 0
          Width = 422
          Height = 171
          Align = alClient
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Images = DM.ilImage
          Indent = 19
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnChange = fltTreeChange
          OnExpanding = fltTreeExpanding
          OnGetSelectedIndex = fltTreeGetSelectedIndex
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
        end
      end
      object tsCB: TsTabSheet
        Caption = 'Фильтр       '
        ImageIndex = 22
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        object sGroupBox1: TsGroupBox
          Left = 0
          Top = 0
          Width = 137
          Height = 171
          Align = alLeft
          Caption = 'Поля'
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object lbFlt: TsListBox
            Left = 2
            Top = 15
            Width = 133
            Height = 154
            Align = alClient
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 16
            ParentFont = False
            Sorted = True
            TabOrder = 0
            OnDblClick = lbFltDblClick
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'EDIT'
          end
        end
        object pnFltControls: TsPanel
          Left = 137
          Top = 0
          Width = 285
          Height = 171
          Align = alClient
          Caption = ' '
          TabOrder = 1
          SkinData.SkinSection = 'PANEL'
        end
      end
    end
    object pnFileProp: TsGroupBox
      Left = 1
      Top = 205
      Width = 430
      Height = 313
      Align = alClient
      Caption = ' Свойства файла '
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object sLabel2: TsLabel
        Left = 85
        Top = 44
        Width = 6
        Height = 13
        Caption = 'с'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sSpeedButton1: TsSpeedButton
        Left = 6
        Top = 41
        Width = 70
        Height = 22
        Caption = 'Дата'
        ButtonStyle = tbsDropDown
        SkinData.SkinSection = 'SPEEDBUTTON'
        DropdownMenu = pmSetDate
      end
      object sLabel3: TsLabel
        Left = 188
        Top = 44
        Width = 12
        Height = 13
        Caption = 'по'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label1: TsLabel
        Left = 8
        Top = 71
        Width = 56
        Height = 13
        Caption = 'Мегапоиск'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object dtFrom: TsDateEdit
        Left = 96
        Top = 41
        Width = 86
        Height = 21
        AutoSize = False
        Color = clWhite
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Text = '  .  .    '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object dtTo: TsDateEdit
        Left = 208
        Top = 41
        Width = 86
        Height = 21
        AutoSize = False
        Color = clWhite
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Text = '  .  .    '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object edMegaText: TsEdit
        Left = 96
        Top = 67
        Width = 201
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
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
      object cbNeopr: TsCheckBox
        Left = 8
        Top = 16
        Width = 115
        Height = 19
        Caption = 'Неопределенные'
        TabOrder = 3
        OnClick = cbNeoprClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sButton2: TsButton
        Left = 11
        Top = 90
        Width = 106
        Height = 25
        Caption = 'Перечитать'
        TabOrder = 4
        OnClick = sButton2Click
        SkinData.SkinSection = 'BUTTON'
      end
    end
  end
  object cdsValList: TClientDataSet
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
      end
      item
        DataType = ftInteger
        Name = '@SysKey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_NS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@ObjName'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@CAName'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@isBayerStr'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@isSellerStr'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@WorkType'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@RealWorkType'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@isUsedStr'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit1'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit2'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit3'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit4'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit5'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit6'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit7'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit8'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit9'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit10'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str3'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str4'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str5'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str6'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str7'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str8'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str9'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str10'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date2'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date3'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date4'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date5'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date6'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date7'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date8'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date9'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date10'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@FlDName'
        ParamType = ptInput
      end>
    ProviderName = 'dsValList'
    RemoteServer = DM.rsCA
    Left = 520
    Top = 64
    object cdsValListVal: TStringField
      FieldName = 'Val'
      Size = 255
    end
  end
  object dsCAList: TDataSource
    DataSet = cdsCAList
    OnDataChange = dsCAListDataChange
    Left = 560
    Top = 104
  end
  object cdsCAList: TClientDataSet
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
      end
      item
        DataType = ftInteger
        Name = '@SysKey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_NS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@ObjName'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@CAName'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@isBayerStr'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@isSellerStr'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@WorkType'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@RealWorkType'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@isUsedStr'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit1'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit2'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit3'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit4'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit5'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit6'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit7'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit8'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit9'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@Obj_Digit10'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str3'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str4'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str5'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str6'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str7'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str8'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str9'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Obj_Str10'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date2'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date3'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date4'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date5'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date6'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date7'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date8'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date9'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Obj_Date10'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@FlDName'
        ParamType = ptInput
      end>
    ProviderName = 'dsCAList'
    RemoteServer = DM.rsCA
    BeforeOpen = cdsCAListBeforeOpen
    AfterOpen = cdsCAListAfterOpen
    OnFilterRecord = cdsCAListFilterRecord
    Left = 520
    Top = 104
    object cdsCAListCAName: TStringField
      FieldName = 'CAName'
      Size = 255
    end
    object cdsCAListisBayerStr: TStringField
      FieldName = 'isBayerStr'
      Size = 10
    end
    object cdsCAListisSellerStr: TStringField
      FieldName = 'isSellerStr'
      Size = 10
    end
    object cdsCAListisUsedStr: TStringField
      FieldName = 'isUsedStr'
      Size = 10
    end
    object cdsCAListid_Obj: TIntegerField
      FieldName = 'id_Obj'
    end
    object cdsCAListid_NS: TIntegerField
      FieldName = 'id_NS'
    end
    object cdsCAListPID: TIntegerField
      FieldName = 'PID'
    end
    object cdsCAListid_ObjType: TIntegerField
      FieldName = 'id_ObjType'
    end
    object cdsCAListObjName: TStringField
      FieldName = 'ObjName'
      Size = 255
    end
    object cdsCAListFileName: TStringField
      FieldName = 'FileName'
      Size = 255
    end
    object cdsCAListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsCAListDateStart: TDateTimeField
      FieldName = 'DateStart'
    end
    object cdsCAListDateStop: TDateTimeField
      FieldName = 'DateStop'
    end
    object cdsCAListisBayer: TBooleanField
      FieldName = 'isBayer'
    end
    object cdsCAListisSeller: TBooleanField
      FieldName = 'isSeller'
    end
    object cdsCAListisDef: TBooleanField
      FieldName = 'isDef'
    end
    object cdsCAListObj_Digit1: TBCDField
      FieldName = 'Obj_Digit1'
      Precision = 19
    end
    object cdsCAListObj_Digit2: TBCDField
      FieldName = 'Obj_Digit2'
      Precision = 19
    end
    object cdsCAListObj_Digit3: TBCDField
      FieldName = 'Obj_Digit3'
      Precision = 19
    end
    object cdsCAListObj_Digit4: TBCDField
      FieldName = 'Obj_Digit4'
      Precision = 19
    end
    object cdsCAListObj_Digit5: TBCDField
      FieldName = 'Obj_Digit5'
      Precision = 19
    end
    object cdsCAListObj_Digit6: TBCDField
      FieldName = 'Obj_Digit6'
      Precision = 19
    end
    object cdsCAListObj_Digit7: TBCDField
      FieldName = 'Obj_Digit7'
      Precision = 19
    end
    object cdsCAListObj_Digit8: TBCDField
      FieldName = 'Obj_Digit8'
      Precision = 19
    end
    object cdsCAListObj_Digit9: TBCDField
      FieldName = 'Obj_Digit9'
      Precision = 19
    end
    object cdsCAListObj_Digit10: TBCDField
      FieldName = 'Obj_Digit10'
      Precision = 19
    end
    object cdsCAListObj_Str1: TStringField
      FieldName = 'Obj_Str1'
      Size = 255
    end
    object cdsCAListObj_Str2: TStringField
      FieldName = 'Obj_Str2'
      Size = 255
    end
    object cdsCAListObj_Str3: TStringField
      FieldName = 'Obj_Str3'
      Size = 255
    end
    object cdsCAListObj_Str4: TStringField
      FieldName = 'Obj_Str4'
      Size = 255
    end
    object cdsCAListObj_Str5: TStringField
      FieldName = 'Obj_Str5'
      Size = 255
    end
    object cdsCAListObj_Str6: TStringField
      FieldName = 'Obj_Str6'
      Size = 255
    end
    object cdsCAListObj_Str7: TStringField
      FieldName = 'Obj_Str7'
      Size = 255
    end
    object cdsCAListObj_Str8: TStringField
      FieldName = 'Obj_Str8'
      Size = 255
    end
    object cdsCAListObj_Str9: TStringField
      FieldName = 'Obj_Str9'
      Size = 255
    end
    object cdsCAListObj_Str10: TStringField
      FieldName = 'Obj_Str10'
      Size = 255
    end
    object cdsCAListObj_Date1: TDateTimeField
      FieldName = 'Obj_Date1'
    end
    object cdsCAListObj_Date2: TDateTimeField
      FieldName = 'Obj_Date2'
    end
    object cdsCAListObj_Date3: TDateTimeField
      FieldName = 'Obj_Date3'
    end
    object cdsCAListObj_Date4: TDateTimeField
      FieldName = 'Obj_Date4'
    end
    object cdsCAListObj_Date5: TDateTimeField
      FieldName = 'Obj_Date5'
    end
    object cdsCAListObj_Date6: TDateTimeField
      FieldName = 'Obj_Date6'
    end
    object cdsCAListObj_Date7: TDateTimeField
      FieldName = 'Obj_Date7'
    end
    object cdsCAListObj_Date8: TDateTimeField
      FieldName = 'Obj_Date8'
    end
    object cdsCAListObj_Date9: TDateTimeField
      FieldName = 'Obj_Date9'
    end
    object cdsCAListObj_Date10: TDateTimeField
      FieldName = 'Obj_Date10'
    end
    object cdsCAListWorkType: TStringField
      FieldName = 'WorkType'
      Size = 1000
    end
    object cdsCAListRealWorkType: TStringField
      FieldName = 'RealWorkType'
      Size = 1000
    end
  end
  object pmSetDate: TPopupMenu
    Left = 296
    Top = 144
    object miAllDates: TMenuItem
      Caption = 'Все время'
      OnClick = miSetDateClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miToday: TMenuItem
      Caption = 'Сегодня'
      OnClick = miSetDateClick
    end
    object miYesterday: TMenuItem
      Caption = 'Вчера'
      OnClick = miSetDateClick
    end
    object N71: TMenuItem
      Caption = '-'
    end
    object miThisWeek: TMenuItem
      Caption = 'С начала недели'
      OnClick = miSetDateClick
    end
    object miThisMounth: TMenuItem
      Caption = 'С начала месяца'
      OnClick = miSetDateClick
    end
    object miThisQuart: TMenuItem
      Caption = 'С начала квартала'
      OnClick = miSetDateClick
    end
    object miThisYear: TMenuItem
      Caption = 'С начала года'
      OnClick = miSetDateClick
    end
    object N70: TMenuItem
      Caption = '-'
    end
    object miPrevWeek: TMenuItem
      Caption = 'Прошлая неделя'
      OnClick = miSetDateClick
    end
    object miPrevMounth: TMenuItem
      Caption = 'Прошлый месяц'
      OnClick = miSetDateClick
    end
    object miPrevQ: TMenuItem
      Caption = 'Прошлый квартал'
      OnClick = miSetDateClick
    end
  end
  object ActionList1: TActionList
    Images = DM.ilImage
    Left = 531
    Top = 165
    object aEditRepr: TAction
      Caption = 'Редактировать юрлицо'
      Enabled = False
      ImageIndex = 6
      OnExecute = aEditReprExecute
    end
    object aEditCA: TAction
      Caption = 'Редактировать принадлежность'
      Enabled = False
      ImageIndex = 3
      OnExecute = aEditCAExecute
    end
    object aBuffClear: TAction
      Caption = 'Очистить буфер'
      Visible = False
      OnExecute = aBuffClearExecute
    end
  end
  object pmCA: TPopupMenu
    Images = DM.ilImage
    Left = 715
    Top = 213
    object N2: TMenuItem
      Action = aEditRepr
    end
    object N3: TMenuItem
      Action = aEditCA
    end
    object N4: TMenuItem
      Action = aBuffClear
    end
  end
end
