object PL_W: TPL_W
  Left = 181
  Top = 106
  Width = 783
  Height = 540
  Caption = 'Отгрузки по товарам'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Top = 472
    Width = 775
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 689
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
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 105
      Height = 25
      Action = aPreview
      Caption = 'Просмотр'
      TabOrder = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C00000000000C0C0C00000000000FF00FF00FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000C0C0C00000000000FF00FF0000000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000FFFF0000FFFF0000FF
        FF00C0C0C000C0C0C000000000000000000000000000FF00FF0000000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00080808000808080008080
        8000C0C0C000C0C0C00000000000C0C0C00000000000FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000C0C0C000C0C0C0000000000000000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C00000000000C0C0C00000000000C0C0C00000000000FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000C0C0C00000000000C0C0C0000000000000000000FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000C0C0C00000000000C0C0C00000000000FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00000000000000000000000000000000000000
        0000FFFFFF0000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FFFFFF000000000000000000000000000000
        000000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object BitBtn5: TBitBtn
      Left = 144
      Top = 8
      Width = 105
      Height = 25
      Action = aExport
      Caption = 'В Excel'
      TabOrder = 2
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000008080000080800000808000008080000000000000000000008080
        8000808080008080800080808000808080008080800080808000808080000000
        000080800000FFFF0000FFFF0000FFFFFF0000000000FF00FF00FF00FF000000
        0000FFFF00008080000080800000808000008080000080800000000000008080
        0000FFFF0000FFFF0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FFFF00008080000080800000808000000000000080800000FFFF
        0000FFFF0000FFFFFF00000000008080000000000000FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFF0000808000000000000080800000FFFF0000FFFF
        0000FFFFFF0000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000000000000080800000FFFF0000FFFF0000FFFF
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000080800000FFFF0000FFFF0000FFFFFF000000
        000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000080800000FFFF0000FFFF0000FFFFFF00000000008080
        00008080800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000080800000FFFF0000FFFF0000FFFFFF0000000000FFFF00008080
        0000808000008080800000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        000080800000FFFF0000FFFF0000FFFFFF0000000000FF00FF0000000000FFFF
        000080800000808000008080800000000000FF00FF00FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF000000
        0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF00FF00000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 61
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 37
      Width = 35
      Height = 13
      Caption = 'Дата c'
    end
    object Label1: TLabel
      Left = 176
      Top = 37
      Width = 12
      Height = 13
      Caption = 'по'
    end
    object Label3: TLabel
      Left = 418
      Top = 11
      Width = 50
      Height = 13
      Caption = 'Операция'
      Visible = False
    end
    object RxSpeedButton1: TRxSpeedButton
      Left = 304
      Top = 32
      Width = 113
      Height = 25
      DropDownMenu = pmSett
      Caption = 'Настройки'
    end
    inline fBsnSelector1: TfBsnSelector
      Width = 297
      Height = 33
      inherited edName: TEdit
        Width = 211
      end
      inherited Button1: TButton
        Left = 266
        OnClick = fBsnSelector1Button1Click
      end
    end
    object dtFrom: TDateTimePicker
      Left = 56
      Top = 34
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 37604.576338125
      Time = 37604.576338125
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object Button1: TButton
      Left = 592
      Top = 14
      Width = 169
      Height = 33
      Caption = 'Перечитать'
      TabOrder = 2
      OnClick = Button1Click
    end
    object dtTo: TDateTimePicker
      Left = 200
      Top = 34
      Width = 90
      Height = 21
      CalAlignment = dtaLeft
      Date = 37604.576338125
      Time = 37604.576338125
      Checked = False
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
    end
    object cbOnlyNotZerro: TCheckBox
      Left = 320
      Top = 8
      Width = 161
      Height = 17
      Caption = 'Только ненулевые'
      Checked = True
      State = cbChecked
      TabOrder = 4
      Visible = False
    end
    object ceOper: TEdit
      Left = 480
      Top = 8
      Width = 209
      Height = 21
      TabOrder = 5
      Visible = False
    end
  end
  object dxDBTreeList1: TdxDBTreeList
    Left = 0
    Top = 161
    Width = 775
    Height = 311
    Bands = <
      item
        Width = 460
      end>
    DefaultLayout = False
    HeaderPanelRowCount = 1
    KeyField = 'id_Ctg_Goods'
    ParentField = 'id_BaseCtg_Goods'
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 2
    BandFont.Charset = RUSSIAN_CHARSET
    BandFont.Color = clWindowText
    BandFont.Height = -11
    BandFont.Name = 'MS Sans Serif'
    BandFont.Style = []
    DataSource = dsCAPrfLoss
    HeaderFont.Charset = RUSSIAN_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    Images = ilEM
    OptionsBehavior = [etoAutoDragDrop, etoAutoDragDropCopy, etoDragExpand, etoDragScroll, etoEditing, etoEnterShowEditor, etoImmediateEditor, etoMultiSelect, etoTabThrough]
    OptionsView = [etoBandHeaderWidth, etoDrawEndEllipsis, etoRowSelect, etoUseBitmap, etoUseImageIndexForSelected]
    PreviewFont.Charset = DEFAULT_CHARSET
    PreviewFont.Color = clBlue
    PreviewFont.Height = -11
    PreviewFont.Name = 'MS Sans Serif'
    PreviewFont.Style = []
    ShowBands = True
    TreeLineColor = clGrayText
    OnGetImageIndex = dxDBTreeList1GetImageIndex
    OnGetSelectedIndex = dxDBTreeList1GetSelectedIndex
    OnChangeNode = dxDBTreeList1ChangeNode
    OnCustomDrawCell = dxDBTreeList1CustomDrawCell
    object dxDBTreeList1id_Ctg_Goods: TdxDBTreeListMaskColumn
      Tag = 13
      Visible = False
      Width = 86
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_Ctg_Goods'
    end
    object dxDBTreeList1id_BaseCtg_Goods: TdxDBTreeListMaskColumn
      Tag = 13
      Visible = False
      Width = 76
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_BaseCtg_Goods'
    end
    object dxDBTreeList1Name: TdxDBTreeListMaskColumn
      Tag = 13
      Caption = 'Название'
      Width = 192
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Name'
    end
    object dxDBTreeList1Rent: TdxDBTreeListMaskColumn
      Tag = 13
      Caption = 'Начало работы'
      MinWidth = 10
      Width = 122
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DateFirstOper'
    end
    object dxDBTreeList1S_ByPeriod: TdxDBTreeListMaskColumn
      Caption = 'Кол-во за период'
      BandIndex = 0
      RowIndex = 0
      FieldName = 'S_ByPeriod'
    end
    object dxDBTreeList1S_Total: TdxDBTreeListMaskColumn
      Tag = 13
      Caption = 'Кол-во за все время'
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'S_Total'
    end
    object dxDBTreeList1AvgTotal: TdxDBTreeListMaskColumn
      Tag = 13
      Caption = 'Ср. кол-во за месяц'
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'AvgTotal'
    end
    object dxDBTreeList1ID: TdxDBTreeListColumn
      Tag = 13
      Visible = False
      Width = 60
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object dxDBTreeList1AvgYear: TdxDBTreeListMaskColumn
      Tag = 13
      Caption = 'Ср. кол-во с начала работы'
      BandIndex = 0
      RowIndex = 0
      FieldName = 'AvgYear'
    end
    object dxDBTreeList1SSS: TdxDBTreeListColumn
      Tag = 13
      Caption = 'Сумма за период'
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SSS'
    end
  end
  object p2: TGroupBox
    Left = 0
    Top = 61
    Width = 775
    Height = 100
    Align = alTop
    Caption = 'Товары/категории'
    TabOrder = 3
    inline fObjListWare: TfObjList
      Left = 2
      Top = 15
      Width = 771
      Height = 83
      Align = alClient
      inherited ToolBar1: TToolBar
        Width = 771
      end
      inherited RxDBGrid1: TRxDBGrid
        Width = 771
        Height = 56
      end
    end
  end
  object dsCAPrfLoss: TDataSource
    DataSet = cdsPL_w
    OnDataChange = dsCAPrfLossDataChange
    Left = 460
    Top = 112
  end
  object cdsPL_w: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_business'
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
      end
      item
        DataType = ftInteger
        Name = '@id_Oper'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@OnlyNotZerro'
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
      end>
    ProviderName = 'dsPL_W'
    RemoteServer = DM.rsCA
    OnCalcFields = cdsPL_wCalcFields
    Left = 504
    Top = 112
    object cdsPL_wALEVEL: TIntegerField
      FieldName = 'ALEVEL'
    end
    object cdsPL_wID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object cdsPL_wName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsPL_wid_Ctg_Goods: TIntegerField
      FieldName = 'id_Ctg_Goods'
    end
    object cdsPL_wid_BaseCtg_Goods: TIntegerField
      FieldName = 'id_BaseCtg_Goods'
    end
    object cdsPL_wid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsPL_wDateFirstOper: TDateTimeField
      FieldName = 'DateFirstOper'
      DisplayFormat = 'dd-mm-yyyy'
    end
    object cdsPL_wAvgYear: TFloatField
      FieldName = 'AvgYear'
    end
    object cdsPL_wAvgTotal: TFloatField
      FieldName = 'AvgTotal'
    end
    object cdsPL_wS_Total: TFloatField
      FieldName = 'S_Total'
    end
    object cdsPL_wM1_CRN_OperSum: TFloatField
      FieldName = 'M1_CRN_OperSum'
    end
    object cdsPL_wM1_InvSumm: TFloatField
      FieldName = 'M1_InvSumm'
    end
    object cdsPL_wM1_WareProff: TFloatField
      FieldName = 'M1_WareProff'
    end
    object cdsPL_wM1_Amount: TFloatField
      FieldName = 'M1_Amount'
    end
    object cdsPL_wM1_Rent: TFloatField
      FieldName = 'M1_Rent'
    end
    object cdsPL_wM1_MSName: TStringField
      FieldName = 'M1_MSName'
      Size = 50
    end
    object cdsPL_wM1_MSCNT: TIntegerField
      FieldName = 'M1_MSCNT'
    end
    object cdsPL_wM1_id_Measure: TIntegerField
      FieldName = 'M1_id_Measure'
    end
    object cdsPL_wM2_CRN_OperSum: TFloatField
      FieldName = 'M2_CRN_OperSum'
    end
    object cdsPL_wM2_InvSumm: TFloatField
      FieldName = 'M2_InvSumm'
    end
    object cdsPL_wM2_WareProff: TFloatField
      FieldName = 'M2_WareProff'
    end
    object cdsPL_wM2_Amount: TFloatField
      FieldName = 'M2_Amount'
    end
    object cdsPL_wM2_Rent: TFloatField
      FieldName = 'M2_Rent'
    end
    object cdsPL_wM2_MSName: TStringField
      FieldName = 'M2_MSName'
      Size = 50
    end
    object cdsPL_wM2_MSCNT: TIntegerField
      FieldName = 'M2_MSCNT'
    end
    object cdsPL_wM2_id_Measure: TIntegerField
      FieldName = 'M2_id_Measure'
    end
    object cdsPL_wM3_CRN_OperSum: TFloatField
      FieldName = 'M3_CRN_OperSum'
    end
    object cdsPL_wM3_InvSumm: TFloatField
      FieldName = 'M3_InvSumm'
    end
    object cdsPL_wM3_WareProff: TFloatField
      FieldName = 'M3_WareProff'
    end
    object cdsPL_wM3_Amount: TFloatField
      FieldName = 'M3_Amount'
    end
    object cdsPL_wM3_Rent: TFloatField
      FieldName = 'M3_Rent'
    end
    object cdsPL_wM3_MSName: TStringField
      FieldName = 'M3_MSName'
      Size = 50
    end
    object cdsPL_wM3_MSCNT: TIntegerField
      FieldName = 'M3_MSCNT'
    end
    object cdsPL_wM3_id_Measure: TIntegerField
      FieldName = 'M3_id_Measure'
    end
    object cdsPL_wM4_CRN_OperSum: TFloatField
      FieldName = 'M4_CRN_OperSum'
    end
    object cdsPL_wM4_InvSumm: TFloatField
      FieldName = 'M4_InvSumm'
    end
    object cdsPL_wM4_WareProff: TFloatField
      FieldName = 'M4_WareProff'
    end
    object cdsPL_wM4_Amount: TFloatField
      FieldName = 'M4_Amount'
    end
    object cdsPL_wM4_Rent: TFloatField
      FieldName = 'M4_Rent'
    end
    object cdsPL_wM4_MSName: TStringField
      FieldName = 'M4_MSName'
      Size = 50
    end
    object cdsPL_wM4_MSCNT: TIntegerField
      FieldName = 'M4_MSCNT'
    end
    object cdsPL_wM4_id_Measure: TIntegerField
      FieldName = 'M4_id_Measure'
    end
    object cdsPL_wM5_CRN_OperSum: TFloatField
      FieldName = 'M5_CRN_OperSum'
    end
    object cdsPL_wM5_InvSumm: TFloatField
      FieldName = 'M5_InvSumm'
    end
    object cdsPL_wM5_WareProff: TFloatField
      FieldName = 'M5_WareProff'
    end
    object cdsPL_wM5_Amount: TFloatField
      FieldName = 'M5_Amount'
    end
    object cdsPL_wM5_Rent: TFloatField
      FieldName = 'M5_Rent'
    end
    object cdsPL_wM5_MSName: TStringField
      FieldName = 'M5_MSName'
      Size = 50
    end
    object cdsPL_wM5_MSCNT: TIntegerField
      FieldName = 'M5_MSCNT'
    end
    object cdsPL_wM5_id_Measure: TIntegerField
      FieldName = 'M5_id_Measure'
    end
    object cdsPL_wM6_CRN_OperSum: TFloatField
      FieldName = 'M6_CRN_OperSum'
    end
    object cdsPL_wM6_InvSumm: TFloatField
      FieldName = 'M6_InvSumm'
    end
    object cdsPL_wM6_WareProff: TFloatField
      FieldName = 'M6_WareProff'
    end
    object cdsPL_wM6_Amount: TFloatField
      FieldName = 'M6_Amount'
    end
    object cdsPL_wM6_Rent: TFloatField
      FieldName = 'M6_Rent'
    end
    object cdsPL_wM6_MSName: TStringField
      FieldName = 'M6_MSName'
      Size = 50
    end
    object cdsPL_wM6_MSCNT: TIntegerField
      FieldName = 'M6_MSCNT'
    end
    object cdsPL_wM6_id_Measure: TIntegerField
      FieldName = 'M6_id_Measure'
    end
    object cdsPL_wM7_CRN_OperSum: TFloatField
      FieldName = 'M7_CRN_OperSum'
    end
    object cdsPL_wM7_InvSumm: TFloatField
      FieldName = 'M7_InvSumm'
    end
    object cdsPL_wM7_WareProff: TFloatField
      FieldName = 'M7_WareProff'
    end
    object cdsPL_wM7_Amount: TFloatField
      FieldName = 'M7_Amount'
    end
    object cdsPL_wM7_Rent: TFloatField
      FieldName = 'M7_Rent'
    end
    object cdsPL_wM7_MSName: TStringField
      FieldName = 'M7_MSName'
      Size = 50
    end
    object cdsPL_wM7_MSCNT: TIntegerField
      FieldName = 'M7_MSCNT'
    end
    object cdsPL_wM7_id_Measure: TIntegerField
      FieldName = 'M7_id_Measure'
    end
    object cdsPL_wM8_CRN_OperSum: TFloatField
      FieldName = 'M8_CRN_OperSum'
    end
    object cdsPL_wM8_InvSumm: TFloatField
      FieldName = 'M8_InvSumm'
    end
    object cdsPL_wM8_WareProff: TFloatField
      FieldName = 'M8_WareProff'
    end
    object cdsPL_wM8_Amount: TFloatField
      FieldName = 'M8_Amount'
    end
    object cdsPL_wM8_Rent: TFloatField
      FieldName = 'M8_Rent'
    end
    object cdsPL_wM8_MSName: TStringField
      FieldName = 'M8_MSName'
      Size = 50
    end
    object cdsPL_wM8_MSCNT: TIntegerField
      FieldName = 'M8_MSCNT'
    end
    object cdsPL_wM8_id_Measure: TIntegerField
      FieldName = 'M8_id_Measure'
    end
    object cdsPL_wM9_CRN_OperSum: TFloatField
      FieldName = 'M9_CRN_OperSum'
    end
    object cdsPL_wM9_InvSumm: TFloatField
      FieldName = 'M9_InvSumm'
    end
    object cdsPL_wM9_WareProff: TFloatField
      FieldName = 'M9_WareProff'
    end
    object cdsPL_wM9_Amount: TFloatField
      FieldName = 'M9_Amount'
    end
    object cdsPL_wM9_Rent: TFloatField
      FieldName = 'M9_Rent'
    end
    object cdsPL_wM9_MSName: TStringField
      FieldName = 'M9_MSName'
      Size = 50
    end
    object cdsPL_wM9_MSCNT: TIntegerField
      FieldName = 'M9_MSCNT'
    end
    object cdsPL_wM9_id_Measure: TIntegerField
      FieldName = 'M9_id_Measure'
    end
    object cdsPL_wM10_CRN_OperSum: TFloatField
      FieldName = 'M10_CRN_OperSum'
    end
    object cdsPL_wM10_InvSumm: TFloatField
      FieldName = 'M10_InvSumm'
    end
    object cdsPL_wM10_WareProff: TFloatField
      FieldName = 'M10_WareProff'
    end
    object cdsPL_wM10_Amount: TFloatField
      FieldName = 'M10_Amount'
    end
    object cdsPL_wM10_Rent: TFloatField
      FieldName = 'M10_Rent'
    end
    object cdsPL_wM10_MSName: TStringField
      FieldName = 'M10_MSName'
      Size = 50
    end
    object cdsPL_wM10_MSCNT: TIntegerField
      FieldName = 'M10_MSCNT'
    end
    object cdsPL_wM10_id_Measure: TIntegerField
      FieldName = 'M10_id_Measure'
    end
    object cdsPL_wM11_CRN_OperSum: TFloatField
      FieldName = 'M11_CRN_OperSum'
    end
    object cdsPL_wM11_InvSumm: TFloatField
      FieldName = 'M11_InvSumm'
    end
    object cdsPL_wM11_WareProff: TFloatField
      FieldName = 'M11_WareProff'
    end
    object cdsPL_wM11_Amount: TFloatField
      FieldName = 'M11_Amount'
    end
    object cdsPL_wM11_Rent: TFloatField
      FieldName = 'M11_Rent'
    end
    object cdsPL_wM11_MSName: TStringField
      FieldName = 'M11_MSName'
      Size = 50
    end
    object cdsPL_wM11_MSCNT: TIntegerField
      FieldName = 'M11_MSCNT'
    end
    object cdsPL_wM11_id_Measure: TIntegerField
      FieldName = 'M11_id_Measure'
    end
    object cdsPL_wM12_CRN_OperSum: TFloatField
      FieldName = 'M12_CRN_OperSum'
    end
    object cdsPL_wM12_InvSumm: TFloatField
      FieldName = 'M12_InvSumm'
    end
    object cdsPL_wM12_WareProff: TFloatField
      FieldName = 'M12_WareProff'
    end
    object cdsPL_wM12_Amount: TFloatField
      FieldName = 'M12_Amount'
    end
    object cdsPL_wM12_Rent: TFloatField
      FieldName = 'M12_Rent'
    end
    object cdsPL_wM12_MSName: TStringField
      FieldName = 'M12_MSName'
      Size = 50
    end
    object cdsPL_wM12_MSCNT: TIntegerField
      FieldName = 'M12_MSCNT'
    end
    object cdsPL_wM12_id_Measure: TIntegerField
      FieldName = 'M12_id_Measure'
    end
    object cdsPL_wM13_CRN_OperSum: TFloatField
      FieldName = 'M13_CRN_OperSum'
    end
    object cdsPL_wM13_InvSumm: TFloatField
      FieldName = 'M13_InvSumm'
    end
    object cdsPL_wM13_WareProff: TFloatField
      FieldName = 'M13_WareProff'
    end
    object cdsPL_wM13_Amount: TFloatField
      FieldName = 'M13_Amount'
    end
    object cdsPL_wM13_Rent: TFloatField
      FieldName = 'M13_Rent'
    end
    object cdsPL_wM13_MSName: TStringField
      FieldName = 'M13_MSName'
      Size = 50
    end
    object cdsPL_wM13_MSCNT: TIntegerField
      FieldName = 'M13_MSCNT'
    end
    object cdsPL_wM13_id_Measure: TIntegerField
      FieldName = 'M13_id_Measure'
    end
    object cdsPL_wM14_CRN_OperSum: TFloatField
      FieldName = 'M14_CRN_OperSum'
    end
    object cdsPL_wM14_InvSumm: TFloatField
      FieldName = 'M14_InvSumm'
    end
    object cdsPL_wM14_WareProff: TFloatField
      FieldName = 'M14_WareProff'
    end
    object cdsPL_wM14_Amount: TFloatField
      FieldName = 'M14_Amount'
    end
    object cdsPL_wM14_Rent: TFloatField
      FieldName = 'M14_Rent'
    end
    object cdsPL_wM14_MSName: TStringField
      FieldName = 'M14_MSName'
      Size = 50
    end
    object cdsPL_wM14_MSCNT: TIntegerField
      FieldName = 'M14_MSCNT'
    end
    object cdsPL_wM14_id_Measure: TIntegerField
      FieldName = 'M14_id_Measure'
    end
    object cdsPL_wM15_CRN_OperSum: TFloatField
      FieldName = 'M15_CRN_OperSum'
    end
    object cdsPL_wM15_InvSumm: TFloatField
      FieldName = 'M15_InvSumm'
    end
    object cdsPL_wM15_WareProff: TFloatField
      FieldName = 'M15_WareProff'
    end
    object cdsPL_wM15_Amount: TFloatField
      FieldName = 'M15_Amount'
    end
    object cdsPL_wM15_Rent: TFloatField
      FieldName = 'M15_Rent'
    end
    object cdsPL_wM15_MSName: TStringField
      FieldName = 'M15_MSName'
      Size = 50
    end
    object cdsPL_wM15_MSCNT: TIntegerField
      FieldName = 'M15_MSCNT'
    end
    object cdsPL_wM15_id_Measure: TIntegerField
      FieldName = 'M15_id_Measure'
    end
    object cdsPL_wM16_CRN_OperSum: TFloatField
      FieldName = 'M16_CRN_OperSum'
    end
    object cdsPL_wM16_InvSumm: TFloatField
      FieldName = 'M16_InvSumm'
    end
    object cdsPL_wM16_WareProff: TFloatField
      FieldName = 'M16_WareProff'
    end
    object cdsPL_wM16_Amount: TFloatField
      FieldName = 'M16_Amount'
    end
    object cdsPL_wM16_Rent: TFloatField
      FieldName = 'M16_Rent'
    end
    object cdsPL_wM16_MSName: TStringField
      FieldName = 'M16_MSName'
      Size = 50
    end
    object cdsPL_wM16_MSCNT: TIntegerField
      FieldName = 'M16_MSCNT'
    end
    object cdsPL_wM16_id_Measure: TIntegerField
      FieldName = 'M16_id_Measure'
    end
    object cdsPL_wM17_CRN_OperSum: TFloatField
      FieldName = 'M17_CRN_OperSum'
    end
    object cdsPL_wM17_InvSumm: TFloatField
      FieldName = 'M17_InvSumm'
    end
    object cdsPL_wM17_WareProff: TFloatField
      FieldName = 'M17_WareProff'
    end
    object cdsPL_wM17_Amount: TFloatField
      FieldName = 'M17_Amount'
    end
    object cdsPL_wM17_Rent: TFloatField
      FieldName = 'M17_Rent'
    end
    object cdsPL_wM17_MSName: TStringField
      FieldName = 'M17_MSName'
      Size = 50
    end
    object cdsPL_wM17_MSCNT: TIntegerField
      FieldName = 'M17_MSCNT'
    end
    object cdsPL_wM17_id_Measure: TIntegerField
      FieldName = 'M17_id_Measure'
    end
    object cdsPL_wM18_CRN_OperSum: TFloatField
      FieldName = 'M18_CRN_OperSum'
    end
    object cdsPL_wM18_InvSumm: TFloatField
      FieldName = 'M18_InvSumm'
    end
    object cdsPL_wM18_WareProff: TFloatField
      FieldName = 'M18_WareProff'
    end
    object cdsPL_wM18_Amount: TFloatField
      FieldName = 'M18_Amount'
    end
    object cdsPL_wM18_Rent: TFloatField
      FieldName = 'M18_Rent'
    end
    object cdsPL_wM18_MSName: TStringField
      FieldName = 'M18_MSName'
      Size = 50
    end
    object cdsPL_wM18_MSCNT: TIntegerField
      FieldName = 'M18_MSCNT'
    end
    object cdsPL_wM18_id_Measure: TIntegerField
      FieldName = 'M18_id_Measure'
    end
    object cdsPL_wS_ByPeriod: TFloatField
      FieldName = 'S_ByPeriod'
    end
    object cdsPL_wSSS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SSS'
      DisplayFormat = '0.00'
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    PreviewOptions.RegistryPath = 'Software\Developer Express\PrintingSystem\DesignTime'
    PreviewOptions.PreviewBoundsRect = {0000000000000000200300003C020000}
    Left = 496
    object dxComponentPrinter1Link1: TdxDBTreeListReportLink
      Component = dxDBTreeList1
      DateTime = 37890.8046247338
      DesignerHelpContext = 0
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportTitle.Font.Charset = DEFAULT_CHARSET
      ReportTitle.Font.Color = clWindowText
      ReportTitle.Font.Height = -19
      ReportTitle.Font.Name = 'Times New Roman'
      ReportTitle.Font.Style = [fsBold]
      BandFont.Charset = RUSSIAN_CHARSET
      BandFont.Color = clWindowText
      BandFont.Height = -11
      BandFont.Name = 'Times New Roman'
      BandFont.Style = []
      EvenFont.Charset = DEFAULT_CHARSET
      EvenFont.Color = clWindowText
      EvenFont.Height = -11
      EvenFont.Name = 'Times New Roman'
      EvenFont.Style = []
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Times New Roman'
      FooterFont.Style = []
      GroupNodeFont.Charset = DEFAULT_CHARSET
      GroupNodeFont.Color = clWindowText
      GroupNodeFont.Height = -11
      GroupNodeFont.Name = 'Times New Roman'
      GroupNodeFont.Style = []
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'Times New Roman'
      HeaderFont.Style = []
      OddFont.Charset = DEFAULT_CHARSET
      OddFont.Color = clWindowText
      OddFont.Height = -11
      OddFont.Name = 'Times New Roman'
      OddFont.Style = []
      Options = [tlpoBands, tlpoHeaders, tlpoFooters, tlpoRowFooters, tlpoPreview, tlpoPreviewGrid, tlpoGrid, tlpoFlatCheckMarks, tlpoSoft3D, tlpoRowFooterGrid]
      PreviewFont.Charset = DEFAULT_CHARSET
      PreviewFont.Color = clWindowText
      PreviewFont.Height = -11
      PreviewFont.Name = 'Times New Roman'
      PreviewFont.Style = []
      RowFooterFont.Charset = DEFAULT_CHARSET
      RowFooterFont.Color = clWindowText
      RowFooterFont.Height = -11
      RowFooterFont.Name = 'Times New Roman'
      RowFooterFont.Style = []
    end
  end
  object dxPrintDialog1: TdxPrintDialog
    HelpContext = 0
    Left = 504
    Top = 48
  end
  object ilButtons: TImageList
    Left = 600
    Top = 162
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000800000008000000000FFFF0000FF
      FF0000FFFF0000FFFF0080000000800000008000000080000000800000008000
      00008000000000FFFF0000FFFF00800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF000000800000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF00800000008000
      0000008080000080800080000000008080008000000080000000008080000080
      8000800000000080800000FFFF00800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000008000000080000000800000008000000080
      00000080000000800000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000008080008000000080000000008080008000000000808000008080008000
      0000800000000080800000FFFF00800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF000000800000008000000080000000800000008000000080
      00000080000000800000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000080000000FF0000008000
      000080000000FF000000FF000000FF000000FF00000080000000FF000000FF00
      00008000000000FFFF0080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000008000000080000000800000008000000080
      00000080000000800000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF00000080000000FF000000FF00
      000000FFFF008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF000000800000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      00008000000080000000800000008000000080000000800000008000000000FF
      FF00800000008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      000080000000800000008000000080000000800000008000000000FFFF008000
      0000800000008000000080000000800000000000000080800000FFFF000000FF
      0000FFFF000000FF0000FFFF000000FF0000FFFF000000FF0000FFFF00008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000FFFF000000FF
      0000FFFF000000FF0000FFFF000000FF0000FFFF000000FF0000FFFF00008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080800000808000008080
      0000808000008080000080800000808000008080000080800000808000008080
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C0000000000000000000000000000000000000000000000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F0000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000000000000000000000000000000000007F7F7F000000
      00000000000000000000BFBFBF00BFBFBF00BFBFBF0000000000000000000000
      000000000000000000007F7F7F00000000008000000080000000800000008000
      000080000000800000008080800080000000FFFFFF0080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00000FFFF0000FFFF0000FFFF00C0C0C000C0C0
      C00000000000000000000000000000000000000000007F7F7F0000000000BFBF
      BF007F7F7F000000000000000000BFBFBF00BFBFBF00000000007F7F7F00BFBF
      BF0000000000000000007F7F7F00000000008000000080000000808080008080
      800080808000808080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008000000080000000000000008080800080808000808080000000
      000000000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      FF000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080008080800080808000C0C0C000C0C0
      C00000000000C0C0C000000000000000000000000000000000007F7F7F00BFBF
      BF007F7F7F00BFBFBF00BFBFBF007F7F7F0000000000BFBFBF007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000008000000080000000808080008080
      800080808000808080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000800000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000000000000000
      0000BFBFBF00BFBFBF0000000000FFFFFF00FFFFFF0000000000BFBFBF000000
      00000000000000000000000000007F7F7F008000000080000000808080008080
      800080808000808080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000800000000000000000000000FFFFFF00800000008000
      000000000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      FF000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C00000000000C0C0C000000000007F7F7F0000000000BFBFBF000000
      0000BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00FFFFFF007F7F7F000000
      0000BFBFBF00BFBFBF00000000007F7F7F008000000080000000808080008080
      800080808000808080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000800000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00000000000C0C0C00000000000000000007F7F7F0000000000BFBFBF00BFBF
      BF00FFFFFF00000000007F7F7F0000000000BFBFBF00FFFFFF007F7F7F00BFBF
      BF00BFBFBF00BFBFBF00000000007F7F7F008000000080000000808080008080
      800080808000808080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000800000000000000000000000FFFFFF00800000008000
      00008000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C0C0C00000000000C0C0C000000000007F7F7F0000000000000000000000
      0000FFFFFF00000000007F7F7F007F7F7F00BFBFBF0000000000BFBFBF000000
      0000000000000000000000000000000000008000000080000000808080008080
      800080808000808080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000800000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF00FFFFFF00000000000000000000000000BFBFBF00BFBFBF000000
      0000000000007F7F7F0000000000000000008000000080000000808080008080
      800080808000808080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000800000000000000000000000FFFFFF00800000008000
      000080000000800000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000080808000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000007F7F7F00BFBF
      BF007F7F7F00BFBFBF00FFFFFF00FFFFFF00BFBFBF00BFBFBF007F7F7F007F7F
      7F007F7F7F00000000007F7F7F00000000008000000080000000808080008080
      80008080800080808000800000000000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000800000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C0000000000000000000000000000000
      0000FFFFFF00FFFFFF0080808000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000007F7F7F0000000000BFBF
      BF007F7F7F000000000000000000BFBFBF000000000000000000BFBFBF00BFBF
      BF00000000007F7F7F0000000000000000000000000080000000800000008000
      0000800000008000000000000000000000000000000080000000800000008000
      00008000000080000000000000000000000000000000FFFFFF00800000008000
      00008000000080000000FFFFFF00C0C0C000FFFFFF0080000000800000008000
      0000800000008000000080808000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F0000000000BFBFBF00BFBFBF00BFBFBF00000000007F7F7F000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F0000000000000000000000000000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF00000000800F000F0000
      0000800F000F00000000800F000F00000000800F000F00000000800F000F0000
      0000800F000F000000008003000F000000008003008F00000000800311440000
      0000800F0AB800000000800F057C00000000800FFAFC00000000800FFDF80000
      0000800FFE040000FFFF800FFFFF0000FFFFFFFEFFFFFC7FFFFFFF0CC007FC27
      F83FFC008003EC230001F8050001C4010001F80500018001000100060001C001
      000100060000E0000001000600000000000100068000000000010005C0000003
      00010005E001E00300010001E007C00101010001F007800383830001F003C407
      FFFF0001F803EC3FFFFF0001FFFFFC7F00000000000000000000000000000000
      000000000000}
  end
  object dxComponentPrinter2: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link2
    PreviewOptions.RegistryPath = 'Software\Developer Express\PrintingSystem\DesignTime'
    PreviewOptions.PreviewBoundsRect = {0000000000000000200300003C020000}
    Left = 541
    Top = 3
    object dxComponentPrinter1Link2: TdxDBTreeListReportLink
      Active = True
      Component = dxDBTreeList1
      DateTime = 40975.6746630671
      DesignerHelpContext = 0
      PrinterPage.Background.Brush.Style = bsClear
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 25400
      PrinterPage.Margins.Left = 25400
      PrinterPage.Margins.Right = 25400
      PrinterPage.Margins.Top = 10008
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportTitle.Font.Charset = RUSSIAN_CHARSET
      ReportTitle.Font.Color = clWindowText
      ReportTitle.Font.Height = -19
      ReportTitle.Font.Name = 'Times New Roman'
      ReportTitle.Font.Style = [fsBold]
      BandColor = clBtnFace
      BandFont.Charset = RUSSIAN_CHARSET
      BandFont.Color = clWindowText
      BandFont.Height = -11
      BandFont.Name = 'Tahoma'
      BandFont.Style = []
      Color = clWindow
      EvenFont.Charset = RUSSIAN_CHARSET
      EvenFont.Color = clWindowText
      EvenFont.Height = -11
      EvenFont.Name = 'Times New Roman'
      EvenFont.Style = []
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      GridLineColor = clBtnShadow
      GroupNodeFont.Charset = RUSSIAN_CHARSET
      GroupNodeFont.Color = clWindowText
      GroupNodeFont.Height = -11
      GroupNodeFont.Name = 'Times New Roman'
      GroupNodeFont.Style = []
      GroupNodeColor = clBtnFace
      HeaderColor = clBtnFace
      HeaderFont.Charset = RUSSIAN_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'Tahoma'
      HeaderFont.Style = []
      OddColor = clWindow
      OddFont.Charset = RUSSIAN_CHARSET
      OddFont.Color = clWindowText
      OddFont.Height = -11
      OddFont.Name = 'Times New Roman'
      OddFont.Style = []
      Options = [tlpoHeaders, tlpoPreview, tlpoPreviewGrid, tlpoFlatCheckMarks, tlpoStateImages, tlpo3DEffects, tlpoSoft3D]
      PreviewFont.Charset = ANSI_CHARSET
      PreviewFont.Color = clBlue
      PreviewFont.Height = -11
      PreviewFont.Name = 'Tahoma'
      PreviewFont.Style = []
      RowFooterColor = cl3DLight
      RowFooterFont.Charset = RUSSIAN_CHARSET
      RowFooterFont.Color = clWindowText
      RowFooterFont.Height = -11
      RowFooterFont.Name = 'Tahoma'
      RowFooterFont.Style = []
    end
  end
  object ilEM: TImageList
    Left = 24
    Top = 64
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FF000000FF000000840000008400000084000000C6C6C60084000000FF00
      0000840000008400000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000008080800000FFFF0000FFFF0000FF
      FF0000FFFF008080800000FFFF0000FFFF0000FFFF0000FFFF00808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000084000000C6C6C600C6C6C600FFFFFF00C6C6C600848484008400
      0000840000000000000000000000000000000000000000000000000000008400
      0000FF000000FF00000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000008080800000FFFF0000FFFF0000FF
      FF0000FFFF008080800000FFFF0000FFFF0000FFFF0000FFFF008080800000FF
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF0084848400000000008400
      0000000000000000000000000000000000000000000000000000000000008400
      000084000000C6C6C600FFFFFF00848484008400000084000000840000008400
      0000840000000000000000000000000000008080800000FFFF0000FFFF0000FF
      FF0000FFFF008080800000FFFF0000FFFF0000FFFF0000FFFF008080800000FF
      FF0000FFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00C6C6C6000000000084000000FFFFFF00848484008400
      0000840000000000000000000000000000008080800080808000808080008080
      80008080800080808000808080008080800080808000808080008080800000FF
      FF0000FFFF008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF0000000000C6C6C600000000008400
      0000000000000000000000000000000000008080800000FFFF0000FFFF0000FF
      FF0000FFFF008080800000FFFF0000FFFF0000FFFF0000FFFF00808080008080
      800000FFFF008080800000FFFF00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000008080800000FFFF0000FFFF0000FF
      FF0000FFFF008080800000FFFF0000FFFF0000FFFF0000FFFF008080800000FF
      FF00808080008080800000FFFF00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFF
      FF00000000000000000000000000000000008080800000FFFF0000FFFF0000FF
      FF0000FFFF008080800000FFFF0000FFFF0000FFFF0000FFFF008080800000FF
      FF0000FFFF008080800000FFFF00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00C6C6C600FF00
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF008400000000000000FFFFFF00FFFF
      FF00848484000000000000000000000000008080800080808000808080008080
      80008080800080808000808080008080800080808000808080008080800000FF
      FF0000FFFF008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600FFFFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600FFFFFF0000000000FFFFFF008400
      0000000000000000000000000000000000008080800000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF008080800000FFFF0000FFFF0000FFFF0000FFFF008080
      800000FFFF008080800000FFFF00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000000000000000FFFF
      FF0000000000000000000000000000000000000000008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF008080800000FFFF0000FFFF0000FFFF0000FF
      FF00808080008080800000FFFF00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000FFFF00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008080800000FFFF0000FF
      FF0000FFFF0000FFFF0080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000F007FFFF001F0000
      E003E07F000F0000F007E00700070000F007E00700030000F007E00700010000
      E007C00F00000000C007C00F00000000C003C00700000000C003C00700000000
      C007C00700000000E003C00780000000F003E003C0000000F803F003E0000000
      FC07FE07F0000000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Images = ilButtons
    Left = 400
    Top = 264
    object aPrint: TAction
      Caption = 'Печатать'
      ImageIndex = 2
      OnExecute = aPrintExecute
    end
    object aPreview: TAction
      Caption = 'Просмотр'
      ImageIndex = 1
    end
    object aShowBalance: TAction
      Caption = 'Взаиморасчеты'
      Enabled = False
      OnExecute = aShowBalanceExecute
    end
    object aExpandNode: TAction
      Caption = 'Открыть ветку'
      Enabled = False
      OnExecute = aExpandNodeExecute
    end
    object aExpandAll: TAction
      Caption = 'Открыть все'
      Enabled = False
      OnExecute = aExpandAllExecute
    end
    object aCollapseNode: TAction
      Caption = 'Закрыть ветку'
      Enabled = False
      OnExecute = aCollapseNodeExecute
    end
    object aCollapseAll: TAction
      Caption = 'Закрыть все'
      Enabled = False
      OnExecute = aCollapseAllExecute
    end
    object aExport: TAction
      Caption = 'В Excel'
      ImageIndex = 9
      OnExecute = aExportExecute
    end
    object aNodeExp: TAction
      Caption = 'Экспортировать ветку'
      Enabled = False
      OnExecute = aNodeExpExecute
    end
    object aDetail: TAction
      Caption = 'Детализация'
      Enabled = False
      OnExecute = aDetailExecute
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 288
    Top = 168
    object aShowBalance1: TMenuItem
      Action = aShowBalance
      Visible = False
    end
    object N1: TMenuItem
      Action = aDetail
      Visible = False
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Action = aExpandNode
    end
    object N8: TMenuItem
      Action = aCollapseNode
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Action = aExpandAll
    end
    object N11: TMenuItem
      Action = aCollapseAll
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object Excel1: TMenuItem
      Action = aExport
    end
    object N13: TMenuItem
      Action = aNodeExp
    end
  end
  object pmSett: TPopupMenu
    Left = 384
    Top = 128
    object miAmount: TMenuItem
      Caption = 'Количество'
      Checked = True
      OnClick = miSettClick
    end
    object miMS: TMenuItem
      Caption = 'Единица измерения'
      Checked = True
      OnClick = miSettClick
    end
    object miSumm: TMenuItem
      Caption = 'Сумма'
      Checked = True
      OnClick = miSettClick
    end
    object miInv: TMenuItem
      Caption = 'Себестоимость'
      Checked = True
      OnClick = miSettClick
    end
    object miProff: TMenuItem
      Caption = 'Прибыль'
      Checked = True
      OnClick = miSettClick
    end
    object miRent: TMenuItem
      Caption = 'Рентабельность'
      Checked = True
      OnClick = miSettClick
    end
  end
end
