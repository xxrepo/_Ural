object MovWH_Adv: TMovWH_Adv
  Left = 202
  Top = 70
  Width = 726
  Height = 612
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Движение товаров и сырья по складу'
  Color = clBtnFace
  Constraints.MinWidth = 725
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 544
    Width = 718
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 632
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Закрыть'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCancelClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 718
    Height = 544
    ActivePage = tsMain
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object tsMain: TTabSheet
      Caption = 'Основная'
      ImageIndex = 3
      object Splitter1: TSplitter
        Left = 0
        Top = 158
        Width = 710
        Height = 4
        Cursor = crVSplit
        Align = alTop
      end
      object Splitter2: TSplitter
        Left = 0
        Top = 319
        Width = 710
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 710
        Height = 32
        Align = alTop
        Caption = ' '
        TabOrder = 0
        inline fBsnSelector1: TfBsnSelector
          Left = 1
          Top = 1
          Width = 278
          Height = 30
          Align = alLeft
          inherited edName: TEdit
            Width = 192
          end
          inherited Button1: TButton
            Left = 247
            OnClick = fBsnSelector1Button1Click
          end
        end
        object Panel4: TPanel
          Left = 279
          Top = 1
          Width = 430
          Height = 30
          Align = alClient
          BevelInner = bvLowered
          Caption = ' '
          TabOrder = 1
          object BitBtn2: TBitBtn
            Left = 104
            Top = 3
            Width = 28
            Height = 25
            TabOrder = 0
            OnClick = BitBtn2Click
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000CED6D600FF00FF00CED6D6008484
              8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
              8400FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00009C31009CFFFF00FFFF
              FF009CFFFF00FFFFFF00FF00FF0000000000CED6D600FF00FF00CED6D6008484
              8400FFFFFF009CFFFF00FFFFFF009CFFFF00009C3100009C3100FFFFFF009CFF
              FF00FFFFFF009CFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
              8400FFFFFF00FFFFFF009CFFFF00009C3100009C3100009C3100009C3100009C
              31009CFFFF00FFFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
              8400FFFFFF009CFFFF00FFFFFF009CFFFF00009C3100009C3100FFFFFF00639C
              0000636300009CFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
              8400FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00009C31009CFFFF00FFFF
              FF0063630000FFFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
              8400FFFFFF009CFFFF00636300009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
              FF00636300009CFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
              8400FFFFFF00FFFFFF0063630000FFFFFF009CFFFF00009C31009CFFFF00FFFF
              FF009CFFFF00FFFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
              8400FFFFFF009CFFFF0063630000639C0000FFFFFF00009C3100009C31009CFF
              FF00FFFFFF009CFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
              8400FFFFFF00FFFFFF009CFFFF00009C3100009C3100009C3100009C3100009C
              31009CFFFF00FFFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
              8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00009C3100009C31009CFF
              FF00FFFFFF00FF00FF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
              8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00009C31009CFFFF00FFFF
              FF0000000000000000000000000000000000CED6D600FF00FF00FF00FF008484
              8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFF
              FF0084848400FFFFFF0000000000CED6D600CED6D600FF00FF00FF00FF008484
              8400FFFFFF00FFFFFF00FFFFFF00CED6D600FFFFFF00FFFFFF00FFFFFF00FFFF
              FF008484840000000000FF00FF00CED6D600FF00FF00CED6D600FF00FF008484
              8400848484008484840084848400848484008484840084848400848484008484
              840084848400CED6D600CED6D600FF00FF00CED6D600FF00FF00}
          end
          object dtTo: TDateTimePicker
            Left = 11
            Top = 5
            Width = 84
            Height = 21
            CalAlignment = dtaLeft
            Date = 37604.576338125
            Time = 37604.576338125
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 1
          end
          object cbShowByWH: TCheckBox
            Left = 144
            Top = 8
            Width = 97
            Height = 17
            Caption = 'По складам'
            TabOrder = 2
          end
        end
      end
      object p1: TGroupBox
        Left = 0
        Top = 32
        Width = 710
        Height = 126
        Align = alTop
        Caption = 'Склады и группы'
        TabOrder = 1
        inline fObjListWH: TfObjList
          Left = 2
          Top = 15
          Width = 706
          Height = 109
          Align = alClient
          inherited ToolBar1: TToolBar
            Width = 706
          end
          inherited RxDBGrid1: TRxDBGrid
            Width = 706
            Height = 82
            TitleFont.Charset = RUSSIAN_CHARSET
          end
        end
      end
      object p2: TGroupBox
        Left = 0
        Top = 162
        Width = 710
        Height = 157
        Align = alTop
        Caption = 'Товары/категории'
        TabOrder = 2
        inline fObjListWare: TfObjList
          Left = 2
          Top = 15
          Width = 706
          Height = 140
          Align = alClient
          inherited ToolBar1: TToolBar
            Width = 706
          end
          inherited RxDBGrid1: TRxDBGrid
            Width = 706
            Height = 113
            TitleFont.Charset = RUSSIAN_CHARSET
          end
        end
      end
      object AdvStringGrid1: TAdvStringGrid
        Left = 0
        Top = 322
        Width = 710
        Height = 194
        Cursor = crDefault
        Align = alClient
        Ctl3D = True
        DefaultRowHeight = 21
        RowCount = 5
        FixedRows = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
        ParentCtl3D = False
        ParentFont = False
        PopupMenu = pmGrExc
        ScrollBars = ssBoth
        TabOrder = 3
        OnGetDisplText = AdvStringGrid1GetDisplText
        OnGetCellColor = AdvStringGrid1GetCellColor
        OnGetAlignment = AdvStringGrid1GetAlignment
        HintShowLargeText = True
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWhite
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'MS Sans Serif'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = clHighlight
        Bands.Active = True
        CellNode.ShowTree = False
        ColumnHeaders.Strings = (
          '')
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
        EnhRowColMove = False
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FilterDropDownClear = '(All)'
        FixedAsButtons = True
        FixedColWidth = 8
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = []
        FloatFormat = '%.2f'
        Look = glSoft
        Multilinecells = True
        Navigation.AllowClipboardShortCuts = True
        Navigation.AllowRTFClipboard = True
        Navigation.AllowFmtClipboard = True
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Title = ppTopRight
        PrintSettings.TitleLines.Strings = (
          '')
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
        PrintSettings.Centered = False
        PrintSettings.FitToPage = fpAlways
        PrintSettings.PageNumSep = '/'
        PrintSettings.NoAutoSize = True
        PrintSettings.NoAutoSizeRow = True
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
        Version = '5.0.6.0'
        ColWidths = (
          8
          64
          64
          64
          64)
      end
    end
    object tsGoods: TTabSheet
      Caption = 'Движение'
      inline fMov_WareUn1: TfMov_WareUn
        Width = 710
        Height = 516
        Align = alClient
        inherited Splitter1: TSplitter
          Width = 710
        end
        inherited dxDBTreeList1: TdxDBTreeList
          Width = 710
        end
        inherited Panel3: TPanel
          Width = 710
        end
        inherited ToolBar1: TToolBar
          Width = 710
        end
        inherited pnDate: TPanel
          Width = 710
          inherited Panel1: TPanel
            inherited BitBtn2: TBitBtn
              OnClick = fMov_WareUn1BitBtn2Click
            end
          end
        end
        inherited fArc1: TfArc
          Width = 710
          Height = 191
          inherited ToolBar1: TToolBar
            Width = 694
            inherited sep3: TToolButton
              Left = 0
              Wrap = True
            end
            inherited ToolButton13: TToolButton
              Left = 67
              Top = 43
            end
            inherited ToolButton5: TToolButton
              Left = 134
              Top = 43
            end
            inherited RxSpeedButton2: TRxSpeedButton
              Left = 139
              Top = 43
            end
            inherited ToolButton10: TToolButton
              Left = 207
              Top = 43
            end
            inherited RxSpeedButton3: TRxSpeedButton
              Left = 215
              Top = 43
            end
            inherited ToolButton12: TToolButton
              Left = 275
              Top = 43
            end
            inherited ToolButton1: TToolButton
              Left = 283
              Top = 43
            end
            inherited ToolButton9: TToolButton
              Left = 363
              Top = 43
            end
            inherited ToolButton7: TToolButton
              Left = 368
              Top = 43
            end
            inherited ToolButton11: TToolButton
              Left = 435
              Top = 43
            end
          end
          inherited pnDate: TPanel
            Width = 694
            inherited Panel3: TPanel
              Width = 436
            end
          end
          inherited RxDBGrid1: TDBGridEh
            Width = 503
          end
          inherited ToolBar2: TToolBar
            Width = 694
            inherited EhGridFilter1: TEhGridFilter
              Width = 62
            end
          end
          inherited StatusBar1: TStatusBar
            Width = 694
          end
        end
        inherited dxComponentPrinter2: TdxComponentPrinter
          inherited dxComponentPrinter1Link2: TdxDBTreeListReportLink
            DateTime = 38043.4855527083
            PrinterPage._dxMeasurementUnits_ = 0
            PrinterPage._dxLastMU_ = 2
          end
        end
        inherited cdsMov: TClientDataSet
          Params = <
            item
              DataType = ftInteger
              Name = '@RETURN_VALUE'
              ParamType = ptResult
            end
            item
              DataType = ftInteger
              Name = '@id'
              ParamType = ptInput
              Value = 1
            end
            item
              DataType = ftInteger
              Name = '@id_business'
              ParamType = ptInput
              Value = 24
            end
            item
              DataType = ftString
              Name = '@IDWHList'
              ParamType = ptInput
              Value = '31'
            end
            item
              DataType = ftString
              Name = '@IDWHGroupList'
              ParamType = ptInput
            end
            item
              DataType = ftString
              Name = '@IDGoodsList'
              ParamType = ptInput
            end
            item
              DataType = ftString
              Name = '@IDGoodsGroupList'
              ParamType = ptInput
            end
            item
              DataType = ftBoolean
              Name = '@ShowNull'
              ParamType = ptInput
              Value = False
            end
            item
              DataType = ftDateTime
              Name = '@DateFrom'
              ParamType = ptInput
              Value = 36892d
            end
            item
              DataType = ftDateTime
              Name = '@DateTo'
              ParamType = ptInput
              Value = 39448d
            end>
        end
      end
    end
  end
  object cdsMovWare: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@ID_Warehouse'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@ShowNull'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DateFrom'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DateTo'
        ParamType = ptInput
      end>
    ProviderName = 'dsMovGoods'
    RemoteServer = DM.rsCA
    Left = 368
    Top = 160
    object cdsMovWareid_Ctg_Goods: TIntegerField
      FieldName = 'id_Ctg_Goods'
    end
    object cdsMovWareid_BaseCtg_Goods: TIntegerField
      FieldName = 'id_BaseCtg_Goods'
    end
    object cdsMovWareid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsMovWareName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsMovWareTotalSumOld: TFloatField
      FieldName = 'TotalSumOld'
      DisplayFormat = '0.00'
    end
    object cdsMovWareTotalSumIn: TFloatField
      FieldName = 'TotalSumIn'
      DisplayFormat = '0.00'
    end
    object cdsMovWareTotalSumOut: TFloatField
      FieldName = 'TotalSumOut'
      DisplayFormat = '0.00'
    end
    object cdsMovWareTotalSum: TFloatField
      FieldName = 'TotalSum'
      DisplayFormat = '0.00'
    end
    object cdsMovWareId_Currency: TIntegerField
      FieldName = 'Id_Currency'
    end
    object cdsMovWareTotalAmountOld: TFloatField
      FieldName = 'TotalAmountOld'
      DisplayFormat = '0.00'
    end
    object cdsMovWareTotalAmountIn: TFloatField
      FieldName = 'TotalAmountIn'
      DisplayFormat = '0.00'
    end
    object cdsMovWareTotalAmountOut: TFloatField
      FieldName = 'TotalAmountOut'
      DisplayFormat = '0.00'
    end
    object cdsMovWareTotalAmount: TFloatField
      FieldName = 'TotalAmount'
      DisplayFormat = '0.00'
    end
    object cdsMovWareid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsMovWareMeasureName: TStringField
      FieldName = 'MeasureName'
      Size = 50
    end
    object cdsMovWareCurrencyName: TStringField
      FieldName = 'CurrencyName'
      ReadOnly = True
      Size = 30
    end
    object cdsMovWareAvgPrice: TFloatField
      FieldName = 'AvgPrice'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
  end
  object cdsWareState: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@IDWHList'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@IDWHGroupList'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@IDGoodsList'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@IDGoodsGroupList'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DateTo'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@ShowByWH'
        ParamType = ptInput
      end>
    ProviderName = 'dsWareState'
    RemoteServer = DM.rsCA
    Left = 436
    Top = 274
    object cdsWareStateF: TIntegerField
      FieldName = 'F'
      ReadOnly = True
    end
    object cdsWareStateId_Currency: TIntegerField
      FieldName = 'Id_Currency'
      ReadOnly = True
    end
    object cdsWareStateID_Measure: TIntegerField
      FieldName = 'ID_Measure'
      ReadOnly = True
    end
    object cdsWareStateMesName: TStringField
      FieldName = 'MesName'
      ReadOnly = True
      Size = 50
    end
    object cdsWareStateTotal: TFloatField
      FieldName = 'Total'
      ReadOnly = True
    end
    object cdsWareStateAvgPrice: TFloatField
      FieldName = 'AvgPrice'
      ReadOnly = True
    end
    object cdsWareStateCrnName: TStringField
      FieldName = 'CrnName'
      ReadOnly = True
      Size = 30
    end
    object cdsWareStateWHName: TStringField
      FieldName = 'WHName'
      ReadOnly = True
      Size = 50
    end
    object cdsWareStateID_Warehouse: TIntegerField
      FieldName = 'ID_Warehouse'
      ReadOnly = True
    end
  end
  object pmGrExc: TPopupMenu
    Images = fMov_WareUn1.ilButtons
    Left = 326
    Top = 444
    object N11: TMenuItem
      Caption = 'Экспорт в Excel'
      ImageIndex = 9
      OnClick = N11Click
    end
  end
end
