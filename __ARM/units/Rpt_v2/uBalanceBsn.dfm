object BalanceBsn: TBalanceBsn
  Left = 283
  Top = 75
  Width = 783
  Height = 540
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Баланс'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 460
    Width = 767
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
    object BitBtn2: TBitBtn
      Left = 272
      Top = 8
      Width = 113
      Height = 25
      Action = aPreview
      Caption = 'Просмотр'
      TabOrder = 2
      Visible = False
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        00000000000000000000FF00FF00FF00FF000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FF000000FF000000FF000000FF00
        0000FF000000FFFFFF0000000000FF00FF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF0000000000FF00FF00808080008080
        8000808080000000000000000000FF000000FF000000FF000000FF000000FF00
        0000FF000000FFFFFF0000000000FF00FF00FF00FF000000000000000000FFFF
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF000000000000000000FFFF
        FF00800000008000000000000000FF000000FF000000FF000000FF000000FF00
        0000FF000000FFFFFF0000000000FF00FF00FF00FF000000000000000000FFFF
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF000000000000000000FFFF
        FF0080000000800000008000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF0000000000FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000008080800080808000808080008080
        8000808080008080800080808000FF00FF0000000000FF00FF0000000000FFFF
        FF00800000008000000080000000800000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000000000000080808000FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000000000000000
        00000000000000000000FFFFFF00FFFFFF0080808000FF00FF0000000000FFFF
        FF0080000000800000008000000080000000FFFFFF00C0C0C000FFFFFF008000
        00008000000080000000800000008000000080808000FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000080808000FF00FF00}
    end
    object BitBtn5: TBitBtn
      Left = 144
      Top = 8
      Width = 105
      Height = 25
      Action = aExport
      Caption = 'В Excel'
      TabOrder = 3
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
    object Button2: TButton
      Left = 440
      Top = 16
      Width = 75
      Height = 25
      Action = Action1
      TabOrder = 4
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 105
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 85
      Width = 26
      Height = 13
      Caption = 'Дата'
    end
    object Label1: TLabel
      Left = 168
      Top = 86
      Width = 33
      Height = 13
      Caption = 'Время'
    end
    object Label3: TLabel
      Left = 168
      Top = 62
      Width = 33
      Height = 13
      Caption = 'Время'
    end
    object Label4: TLabel
      Left = 8
      Top = 61
      Width = 35
      Height = 13
      Caption = 'Дата c'
    end
    object Label5: TLabel
      Left = 8
      Top = 36
      Width = 19
      Height = 13
      Caption = 'Вид'
    end
    object Label6: TLabel
      Left = 336
      Top = 84
      Width = 318
      Height = 13
      Caption = 'Помещать в "Незначительные суммы" при задолженности до'
    end
    inline fBsnSelector1: TfBsnSelector
      Width = 361
      Height = 33
      TabOrder = 7
      inherited edName: TEdit
        Width = 275
      end
      inherited Button1: TButton
        Left = 330
        OnClick = fBsnSelector1Button1Click
      end
    end
    object dtTo: TDateTimePicker
      Left = 56
      Top = 82
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 37604.576338125
      Time = 37604.576338125
      ShowCheckbox = True
      Checked = False
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      OnChange = dtToChange
    end
    object Button1: TButton
      Left = 376
      Top = 14
      Width = 131
      Height = 33
      Caption = 'Перечитать'
      Enabled = False
      TabOrder = 5
      OnClick = Button1Click
    end
    object BitBtn3: TBitBtn
      Left = 608
      Top = 8
      Width = 153
      Height = 25
      Action = aClosePeriod
      Caption = 'Закрыть период'
      TabOrder = 6
      TabStop = False
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
        000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000000007F7F7F007F7F7F00BFBFBF007F7F7F00000000007F7F
        7F00BFBFBF007F7F7F007F7F7F0000000000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F00000000007F7F
        7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000FF00FF00FF00FF00FF00
        FF00000000007F7F7F007F7F7F007F7F7F00BFBFBF00BFBFBF0000000000BFBF
        BF00BFBFBF007F7F7F007F7F7F007F7F7F0000000000FF00FF00FF00FF00FF00
        FF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000000000000000
        0000BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000FF00FF00FF00FF00FF00
        FF00000000007F7F7F007F7F7F007F7F7F007F7F7F0000000000000000000000
        00007F7F7F007F7F7F007F7F7F007F7F7F0000000000FF00FF00FF00FF00FF00
        FF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00
        FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00
        FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00
        FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF007F7F7F007F7F7F00BFBFBF0000000000000000000000
        0000BFBFBF007F7F7F007F7F7F00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
        000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object dtTimeTo: TDateTimePicker
      Left = 208
      Top = 82
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 37604.576338125
      Time = 37604.576338125
      ShowCheckbox = True
      Checked = False
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkTime
      ParseInput = False
      TabOrder = 4
    end
    object dtTFrom: TDateTimePicker
      Left = 208
      Top = 58
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 37604.576338125
      Time = 37604.576338125
      ShowCheckbox = True
      Checked = False
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkTime
      ParseInput = False
      TabOrder = 2
    end
    object dtDFrom: TDateTimePicker
      Left = 56
      Top = 58
      Width = 105
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
      OnChange = dtDFromChange
    end
    object ComboBox1: TComboBox
      Left = 56
      Top = 32
      Width = 297
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox1Change
      Items.Strings = (
        'Производственная форма баланса'
        'Финансовая форма баланса')
    end
    object RxCalcEdit1: TRxCalcEdit
      Left = 660
      Top = 80
      Width = 81
      Height = 21
      AutoSize = False
      NumGlyphs = 2
      TabOrder = 8
      OnChange = RxCalcEdit1Change
    end
    object cbDeltaz: TCheckBox
      Left = 336
      Top = 64
      Width = 145
      Height = 17
      Caption = 'Изменениe'
      TabOrder = 9
      OnClick = cbDeltazClick
    end
    object cbCurRez: TCheckBox
      Left = 520
      Top = 64
      Width = 145
      Height = 17
      Caption = 'Повалютные остатки'
      TabOrder = 10
    end
    object Edit1: TAdvLUEdit
      Left = 520
      Top = 40
      Width = 239
      Height = 21
      EmptyText = 'Введите текст для поиска...'
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 11
      Visible = True
      OnKeyDown = Edit1KeyDown
      Version = '1.4.0.0'
      AutoHistory = False
      AutoSynchronize = False
      FileLookup = False
      LookupPersist.Enable = False
      LookupPersist.Location = plInifile
      LookupPersist.Count = 0
      LookupPersist.MaxCount = False
      MatchCase = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 105
    Width = 767
    Height = 20
    Align = alTop
    Caption = ' '
    TabOrder = 2
    object lbInfo: TLabel
      Left = 8
      Top = 3
      Width = 33
      Height = 13
      Caption = 'lbInfo'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dxDBTreeList1: TdxDBTreeList
    Left = 0
    Top = 125
    Width = 767
    Height = 335
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ID'
    ParentField = 'id_Rr'
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 3
    BandFont.Charset = RUSSIAN_CHARSET
    BandFont.Color = clWindowText
    BandFont.Height = -11
    BandFont.Name = 'MS Sans Serif'
    BandFont.Style = []
    DataSource = DataSource1
    HeaderFont.Charset = RUSSIAN_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    Images = ilEM
    OptionsBehavior = [etoAutoDragDrop, etoAutoDragDropCopy, etoDragScroll, etoEnterShowEditor, etoImmediateEditor, etoStoreToRegistry, etoTabThrough]
    OptionsCustomize = [etoBandMoving, etoBandSizing, etoColumnSizing, etoKeepColumnWidth]
    OptionsView = [etoBandHeaderWidth, etoDrawEndEllipsis, etoRowSelect, etoUseBitmap, etoUseImageIndexForSelected]
    PreviewFont.Charset = DEFAULT_CHARSET
    PreviewFont.Color = clBlue
    PreviewFont.Height = -11
    PreviewFont.Name = 'MS Sans Serif'
    PreviewFont.Style = []
    TreeLineColor = clGrayText
    OnGetImageIndex = dxDBTreeList1GetImageIndex
    OnGetSelectedIndex = dxDBTreeList1GetSelectedIndex
    OnChangeNode = dxDBTreeList1ChangeNode
    OnCustomDrawCell = dxDBTreeList1CustomDrawCell
    OnDeletion = dxDBTreeList1Deletion
    object dxDBTreeList1ID: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object dxDBTreeList1id_Rr: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_Rr'
    end
    object dxDBTreeList1RowName: TdxDBTreeListMaskColumn
      Caption = 'Название'
      Width = 259
      BandIndex = 0
      RowIndex = 0
      FieldName = 'RowName'
    end
    object dxDBTreeList1RowLevel: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'RowLevel'
    end
    object dxDBTreeList1IsDeb: TdxDBTreeListCheckColumn
      Visible = False
      Width = 27
      BandIndex = 0
      RowIndex = 0
      FieldName = 'IsDeb'
      ValueChecked = 'Да'
      ValueUnchecked = 'False'
    end
    object dxDBTreeList1OperSummSysCur: TdxDBTreeListMaskColumn
      Caption = 'Сумма'
      Width = 91
      BandIndex = 0
      RowIndex = 0
      FieldName = 'OperSummSysCur'
    end
    object dxDBTreeList1Column25: TdxDBTreeListMaskColumn
      Caption = 'Пред. значение'
      Width = 105
      BandIndex = 0
      RowIndex = 0
      FieldName = 'OperSummSysCurOLD'
    end
    object dxDBTreeList1isTotal: TdxDBTreeListCheckColumn
      Visible = False
      Width = 27
      BandIndex = 0
      RowIndex = 0
      FieldName = 'isTotal'
      ValueChecked = 'Да'
      ValueUnchecked = 'False'
    end
    object dxDBTreeList1OrdNum: TdxDBTreeListMaskColumn
      Visible = False
      Width = 73
      BandIndex = 0
      RowIndex = 0
      FieldName = 'OrdNum'
    end
    object dxDBTreeList1id_Acc: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_Acc'
    end
    object dxDBTreeList1id_Manufact: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_Manufact'
    end
    object dxDBTreeList1Column24: TdxDBTreeListMaskColumn
      Caption = 'Изменение'
      Width = 89
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Delta'
    end
    object dxDBTreeList1id_Raw: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_Raw'
    end
    object dxDBTreeList1id_ExtRaw: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_ExtRaw'
    end
    object dxDBTreeList1id_Service: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_Service'
    end
    object dxDBTreeList1id_Goods: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_Goods'
    end
    object dxDBTreeList1id_CAGroup: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_CAGroup'
    end
    object dxDBTreeList1ID_Oper: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID_Oper'
    end
    object dxDBTreeList1id_Warehouse: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_Warehouse'
    end
    object dxDBTreeList1id_repr: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_repr'
    end
    object dxDBTreeList1id_ContrAgent: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_ContrAgent'
    end
    object dxDBTreeList1id_Acc_Group: TdxDBTreeListMaskColumn
      Visible = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_Acc_Group'
    end
    object dxDBTreeList1id_Manufact_Group: TdxDBTreeListMaskColumn
      Visible = False
      Width = 27
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_Manufact_Group'
    end
    object dxDBTreeList1id_Warehouse_Group: TdxDBTreeListMaskColumn
      Visible = False
      Width = 29
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_Warehouse_Group'
    end
    object dxDBTreeList1HasChld: TdxDBTreeListCheckColumn
      Visible = False
      Width = 27
      BandIndex = 0
      RowIndex = 0
      FieldName = 'HasChld'
      ValueChecked = 'Да'
      ValueUnchecked = 'False'
    end
    object dxDBTreeList1Val1: TdxDBTreeListMaskColumn
      Visible = False
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Val1'
    end
    object dxDBTreeList1Delta1: TdxDBTreeListMaskColumn
      Visible = False
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Delta1'
    end
    object dxDBTreeList1Val2: TdxDBTreeListMaskColumn
      Visible = False
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Val2'
    end
    object dxDBTreeList1Delta2: TdxDBTreeListMaskColumn
      Visible = False
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Delta2'
    end
    object dxDBTreeList1Val3: TdxDBTreeListMaskColumn
      Visible = False
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Val3'
    end
    object dxDBTreeList1Delta3: TdxDBTreeListMaskColumn
      Visible = False
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Delta3'
    end
    object dxDBTreeList1Val4: TdxDBTreeListMaskColumn
      Visible = False
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Val4'
    end
    object dxDBTreeList1Delta4: TdxDBTreeListMaskColumn
      Visible = False
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Delta4'
    end
    object dxDBTreeList1Val5: TdxDBTreeListMaskColumn
      Visible = False
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Val5'
    end
    object dxDBTreeList1Delta5: TdxDBTreeListMaskColumn
      Visible = False
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Delta5'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsBal
    OnDataChange = DataSource1DataChange
    Left = 460
    Top = 88
  end
  object cdsBal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 1
      end
      item
        DataType = ftInteger
        Name = '@id_business'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftDateTime
        Name = '@Date'
        ParamType = ptInput
        Value = 1d
      end
      item
        DataType = ftBoolean
        Name = '@isDeBug'
        ParamType = ptInput
        Value = True
      end
      item
        DataType = ftBoolean
        Name = '@ClosePeriod'
        ParamType = ptInput
        Value = True
      end
      item
        DataType = ftBoolean
        Name = '@CalcAll'
        ParamType = ptInput
        Value = True
      end
      item
        DataType = ftBoolean
        Name = '@Save'
        ParamType = ptInput
        Value = True
      end
      item
        DataType = ftDateTime
        Name = '@DateFrom'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftFloat
        Name = '@MinCA'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftInteger
        Name = '@TechMode'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftBoolean
        Name = '@Deltaz'
        ParamType = ptInput
        Value = True
      end
      item
        DataType = ftBoolean
        Name = '@CurRez'
        ParamType = ptInput
        Value = True
      end
      item
        DataType = ftInteger
        Name = '@id_User'
        ParamType = ptInput
        Value = 1
      end>
    ProviderName = 'dsBal_v2'
    RemoteServer = DM.rsCA
    BeforeClose = cdsBalBeforeClose
    Left = 496
    Top = 80
    object cdsBalID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object cdsBalid_Rr: TIntegerField
      FieldName = 'id_Rr'
    end
    object cdsBalRowLevel: TIntegerField
      FieldName = 'RowLevel'
    end
    object cdsBalRowName: TStringField
      FieldName = 'RowName'
      Size = 255
    end
    object cdsBalIsDeb: TBooleanField
      FieldName = 'IsDeb'
    end
    object cdsBalOrdNum: TIntegerField
      FieldName = 'OrdNum'
    end
    object cdsBalisTotal: TBooleanField
      FieldName = 'isTotal'
    end
    object cdsBalOperSummSysCur: TFloatField
      FieldName = 'OperSummSysCur'
      OnGetText = cdsBalOperSummSysCurGetText
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBalid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsBalid_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object cdsBalid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsBalid_CAGroup: TIntegerField
      FieldName = 'id_CAGroup'
    end
    object cdsBalID_Oper: TIntegerField
      FieldName = 'ID_Oper'
    end
    object cdsBalid_Warehouse: TIntegerField
      FieldName = 'id_Warehouse'
    end
    object cdsBalid_repr: TIntegerField
      FieldName = 'id_repr'
    end
    object cdsBalid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object cdsBalid_Acc_Group: TIntegerField
      FieldName = 'id_Acc_Group'
    end
    object cdsBalid_Manufact_Group: TIntegerField
      FieldName = 'id_Manufact_Group'
    end
    object cdsBalid_Warehouse_Group: TIntegerField
      FieldName = 'id_Warehouse_Group'
    end
    object cdsBalHasChld: TBooleanField
      FieldName = 'HasChld'
    end
    object cdsBalOnTop: TBooleanField
      FieldName = 'OnTop'
    end
    object cdsBalDelta: TFloatField
      FieldName = 'Delta'
      OnGetText = cdsBalDeltaGetText
      DisplayFormat = '0.00'
    end
    object cdsBalOperSummSysCurOLD: TFloatField
      FieldName = 'OperSummSysCurOLD'
      OnGetText = cdsBalDeltaGetText
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBalRowOrd: TIntegerField
      FieldName = 'RowOrd'
    end
    object cdsBalTek: TIntegerField
      FieldName = 'Tek'
    end
    object cdsBalVal1: TFloatField
      FieldName = 'Val1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBalDelta1: TFloatField
      FieldName = 'Delta1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBalVal2: TFloatField
      FieldName = 'Val2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBalDelta2: TFloatField
      FieldName = 'Delta2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBalVal3: TFloatField
      FieldName = 'Val3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBalDelta3: TFloatField
      FieldName = 'Delta3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBalVal4: TFloatField
      FieldName = 'Val4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBalDelta4: TFloatField
      FieldName = 'Delta4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBalVal5: TFloatField
      FieldName = 'Val5'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBalDelta5: TFloatField
      FieldName = 'Delta5'
      DisplayFormat = '### ### ### ##0.00'
    end
  end
  object dxPrintDialog1: TdxPrintDialog
    HelpContext = 0
    Left = 448
    Top = 56
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
      OnExecute = aPreviewExecute
    end
    object aClosePeriod: TAction
      Caption = 'Закрыть период'
      Enabled = False
      ImageIndex = 7
      Visible = False
      OnExecute = aClosePeriodExecute
    end
    object aSave: TAction
      Caption = 'Завизировать'
      Enabled = False
      ImageIndex = 8
      Visible = False
      OnExecute = aSaveExecute
    end
    object aShowAccCard: TAction
      Caption = 'Карточка счета (ст)'
      Visible = False
      OnExecute = aShowAccCardExecute
    end
    object aShowBalance: TAction
      Caption = 'Взаиморасчеты (ст)'
      Visible = False
      OnExecute = aShowBalanceExecute
    end
    object aShowGoodsSum: TAction
      Caption = 'Склад товаров'
      Visible = False
      OnExecute = aShowGoodsSumExecute
    end
    object aShowRawSum: TAction
      Caption = 'Склад сырья'
      Visible = False
    end
    object aShowExtRawSum: TAction
      Caption = 'Склад давальческого сырья'
      Visible = False
    end
    object aShowServiceSum: TAction
      Caption = 'Склад услуг'
      Visible = False
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
    object aBlnDetail: TAction
      Caption = 'Детализация старая'
      Enabled = False
      OnExecute = aBlnDetailExecute
    end
    object aShowInRoot: TAction
      Caption = 'На первый уровень'
      Enabled = False
      OnExecute = aShowInRootExecute
    end
    object aUnShowInRoot: TAction
      Caption = 'Убрать с первого уровня'
      Enabled = False
      OnExecute = aUnShowInRootExecute
    end
    object aShowAccCard_Adv: TAction
      Caption = 'Карточка группы счетов'
      Visible = False
      OnExecute = aShowAccCard_AdvExecute
    end
    object aBlnDetail_2: TAction
      Caption = 'Детализация'
      Enabled = False
      OnExecute = aBlnDetail_2Execute
    end
    object aBlnDetail_3: TAction
      Caption = 'Детализация статьи'
      Enabled = False
      OnExecute = aBlnDetail_3Execute
    end
    object aShowB2: TAction
      Caption = 'Взаиморасчеты'
      OnExecute = aShowB2Execute
    end
    object aA2: TAction
      Caption = 'Карточка счета'
      OnExecute = aA2Execute
    end
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 24688
      OnExecute = Action1Execute
    end
    object aNoDeptCA: TAction
      Caption = 'Зачесть долг'
      OnExecute = aNoDeptCAExecute
    end
    object aOffPM: TAction
      Caption = 'Зачесть платежи теми же днями'
      OnExecute = aOffPMExecute
    end
  end
  object ilButtons: TImageList
    Left = 600
    Top = 162
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808000008080000080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      800080808000808080008080800080808000808080000000000080800000FFFF
      0000FFFF0000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00008080
      0000808000008080000080800000808000000000000080800000FFFF0000FFFF
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      0000008400000084000000840000008400000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00008080000080800000808000000000000080800000FFFF0000FFFF0000FFFF
      FF00000000008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008400000084
      0000008400000084000000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000808000000000000080800000FFFF0000FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008400000084
      0000000000000000000000840000008400000084000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080800000FFFF0000FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000840000000000000000
      0000000000000000000000000000008400000084000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080800000FFFF0000FFFF0000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008400000084000000840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080800000FFFF0000FFFF0000FFFFFF000000000080800000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000FFFF0000FFFF0000FFFFFF0000000000FFFF000080800000808000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000000
      000000000000000000000000000000000000000000000000000080800000FFFF
      0000FFFF0000FFFFFF00000000000000000000000000FFFF0000808000008080
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000084
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000840000000000000000000000000000000000000000
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
      00000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F00BFBFBF007F7F7F00000000007F7F7F00BFBFBF007F7F
      7F007F7F7F000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F7F7F00000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF007F7F
      7F007F7F7F007F7F7F0000000000000000008000000080000000800000008000
      0000800000008000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF000000000000000000800000008000000000FFFF0000FF
      FF0000FFFF0000FFFF0080000000800000008000000080000000800000008000
      00008000000000FFFF0000FFFF00800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF000000800000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F00000000000000000000FFFF0000FFFF00800000008000
      0000008080000080800080000000008080008000000080000000008080000080
      8000800000000080800000FFFF00800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000008000000080000000800000008000000080
      00000080000000800000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000000000008000000080000000800000008000
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
      000000000000BFBFBF000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000008000000080000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF00000080000000FF000000FF00
      000000FFFF008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF000000800000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      000000000000BFBFBF000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000008000000080000000800000008000
      00008000000080000000800000008000000080000000800000008000000000FF
      FF00800000008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      000000000000BFBFBF000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000008000000080000000800000008000
      000080000000800000008000000080000000800000008000000000FFFF008000
      0000800000008000000080000000800000000000000080800000FFFF000000FF
      0000FFFF000000FF0000FFFF000000FF0000FFFF000000FF0000FFFF00008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      00007F7F7F007F7F7F00BFBFBF00000000000000000000000000BFBFBF007F7F
      7F007F7F7F000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000FFFF000000FF
      0000FFFF000000FF0000FFFF000000FF0000FFFF000000FF0000FFFF00008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      00000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
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
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFFFE000000000
      F9FF000000000000F0FF000100000000F0FF800300000000E07FC00100000000
      C07FE00100000000843FF01F000000001E3FF01F00000000FE1FE00F00000000
      FF1FC00700000000FF8F810300000000FFC7038100000000FFE307C100000000
      FFF8FFFF00000000FFFFFFFF00000000FFFFFFFFFFFFFC1F0000800F000FF007
      0000800F000FE0030000800F000FC0010000800F000FC0010000800F000FC001
      0000800F000FC00100008003000FC00100008003008FE003000080031144F1C7
      0000800F0AB8F1C70000800F057CF1C70000800FFAFCF0070000800FFDF8F80F
      0000800FFE04FC1FFFFF800FFFFFFFFFFFFFFFFEFFFFFC7FFFFFFF0CC007FC27
      F83FFC008003EC230001F8050001C4010001F80500018001000100060001C001
      000100060000E0000001000600000000000100068000000000010005C0000003
      00010005E001E00300010001E007C00101010001F007800383830001F003C407
      FFFF0001F803EC3FFFFF0001FFFFFC7F00000000000000000000000000000000
      000000000000}
  end
  object dxComponentPrinter2: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link2
    PreviewOptions.RegistryPath = 'Software\Developer Express\PrintingSystem\DesignTime'
    Left = 541
    Top = 3
    object dxComponentPrinter1Link2: TdxDBTreeListReportLink
      Active = True
      Component = dxDBTreeList1
      DateTime = 43013.8953401852
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
      Options = [tlpoHeaders, tlpoPreview, tlpoPreviewGrid, tlpoGrid, tlpoFlatCheckMarks, tlpoImages, tlpoStateImages, tlpo3DEffects, tlpoSoft3D]
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
      SupportedCustomDraw = True
      OnCustomDrawCell = dxComponentPrinter1Link2CustomDrawCell
    end
  end
  object ClientDataSet1: TClientDataSet
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
        Name = '@Date'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@isDeBug'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@ClosePeriod'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@CalcAll'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@Save'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DateFrom'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@MinCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@TechMode'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@Deltaz'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@CurRez'
        ParamType = ptInput
      end>
    ProviderName = 'dsBal_v2'
    RemoteServer = DM.rsCA
    Left = 504
    Top = 162
  end
  object cdsBsnData: TClientDataSet
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
        Name = '@Date'
        ParamType = ptInput
      end>
    ProviderName = 'dsBsnData'
    RemoteServer = DM.rsCA
    Left = 368
    Top = 160
    object cdsBsnDataCnt: TIntegerField
      FieldName = 'Cnt'
      ReadOnly = True
    end
    object cdsBsnDataNAMEMain: TStringField
      FieldName = 'NAMEMain'
      ReadOnly = True
      Size = 255
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 288
    Top = 168
    object N14: TMenuItem
      Action = aA2
    end
    object N18: TMenuItem
      Action = aShowAccCard_Adv
    end
    object N6: TMenuItem
      Action = aShowB2
    end
    object N2: TMenuItem
      Action = aShowGoodsSum
    end
    object N3: TMenuItem
      Action = aBlnDetail_2
    end
    object N5: TMenuItem
      Action = aBlnDetail_3
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
    object N16: TMenuItem
      Action = aShowInRoot
    end
    object N17: TMenuItem
      Action = aUnShowInRoot
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object N13: TMenuItem
      Action = aNodeExp
    end
  end
  object ilEM: TImageList
    Left = 32
    Top = 104
    Bitmap = {
      494C010117001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
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
      00000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF00C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF00C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00C0C0C0000000
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
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000C6C6C6000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000848484000000000000000000C6C6C6000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000FFFF0000FFFF0000FFFFFF00FFFF0000FF000000000000000000
      0000848484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF008484840000000000848484000000000000FFFF0000000000848484000000
      000084848400FFFFFF00FFFFFF00000000000000000000000000848484000000
      000000000000FFFF0000FFFF000000000000FFFF0000FF000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000000000000000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000000000000000000084848400000000000000000000000000FFFFFF00C6C6
      C6000000000000FFFF00848484000000000000FFFF00000000008484840000FF
      FF0000000000C6C6C600FFFFFF0000000000000000000000000000000000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000000000000000000084848400000000000000000000000000808080000000
      0000000000000000000080808000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000FFFFFF000000
      0000848484008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      84008484840000000000FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF000000000000FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF000000000000000000000000000000000000FFFFFF008484
      8400000000000000000000FFFF0084848400000000008484840000FFFF000000
      00000000000084848400FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000000000FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000000000FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF000000000000FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF000000000000000000000000000000000000FFFFFF008484
      8400000000000000000000FFFF0084848400000000008484840000FFFF000000
      00000000000084848400FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF008484840084848400FFFFFF0084848400848484000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000FFFFFF00FFFF
      FF00848484008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      840084848400FFFFFF00FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF008484840084848400000000008484840084848400000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF00008484
      84000000FF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF00000000FF008484
      8400FF000000FFFF000000000000000000000000000000000000FFFFFF00FFFF
      FF000000000000FFFF00848484000000000000FFFF00000000008484840000FF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFF0000FFFF00008484
      84000000FF00FFFF000000000000FFFF000000000000848484000000FF000000
      FF0000000000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00FFFF00000000FF00FFFF0000FFFFFF00FFFF00000000FF00FFFF0000FFFF
      FF00848484008484840000000000000000000000000000000000FFFFFF00FFFF
      FF008484840000000000848484000000000000FFFF0000000000848484000000
      000084848400FFFFFF00FFFFFF00000000000000000084848400848484000000
      0000FFFF00000000FF00FFFF00000000000084848400848484000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF00000000FF000000FF000000FF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF000000000000FFFF
      000000000000FFFF00000000FF00848484000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000000000000000FFFF
      FF00FFFF00000000FF00FFFFFF00FFFF0000FFFFFF000000FF00FFFF0000FFFF
      FF00000000000000000084848400000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFF00000000FF0000000000848484000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000008080800000000000000000000000000000000000848484000000
      000000000000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00000000000000
      0000848484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000848484000000
      00000000000000000000FFFF00008484840084848400848484000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000FFFF00000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000FFFF000000000000848484000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600848484008484840084848400848484008484840000000000000000008484
      840084848400C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C6000063630000A5
      A50000C6C60000C6C60000A5A5000084840000848400002121000042420000E7
      E7000084840000636300C6C6C600000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000424200008484000084
      840031737300315252003152520000424200002121000063630000FFFF0000C6
      C60000A5A5000084840000424200000000000000000000000000000000000000
      000000000000FF00000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000084840000A5
      A50000A5A5000084840000848400008484000084840000C6C60000A5A50000C6
      C60000E7E70000C6C60000A5A500848484000000000000000000000000000000
      0000FF00000000000000FFFFFF0000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004263630000A5A500008484000063
      6300006363000063630000424200004242000084840000C6C6000084840000E7
      E70000FFFF0000A5A50000C6C60084848400000000000000000000000000FF00
      000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000084840000FFFF0000000000000000000084840000FFFF00008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000212100002121000063630000A5
      A50000C6C60000C6C60000A5A500008484000084840000C6C6000084840000C6
      C60000C6C60000C6C60000C6C600848484000000000000000000FF000000FF00
      0000FF00000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      84000000000000000000000000000000000084848400FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000004263630000424200004242000084
      840063A5A5003194940031949400319494000084840000A5A5000084840000A5
      A50000C6C60000C6C60000A5A500C6C6C60000000000FF000000FF000000FF00
      0000FF000000FF00000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF00
      0000000000000000000000000000000000000000000000000000000000008484
      84000084840000FFFF0000000000000000000084840000FFFF00008484000084
      84000000000000000000000000000000000084848400FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000212100006363000042
      4200006363000063630000636300006363000042420000E7E70000A5A5000084
      84000084840000FFFF00426363000000000084000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FF0000000000000000000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      84000000000000000000000000000000000084848400FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFF0000000000000000000000000000848484000084840000A5
      A50000A5A50000A5A50000A5A50000A5A50000A5A5000063630000A5A50000A5
      A50000A5A500428484000000000000000000FF00000084000000FF000000FF00
      0000FF000000FF000000FF000000FF00000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FF00000000000000000000000000000000000000000000008484
      84000084840000FFFF0000000000000000000084840000FFFF00008484000084
      84000000000000000000000000000000000084848400FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084848400004242000042
      420000C6C60063A5A50031525200315252003152520000212100000000000021
      21000000000000000000000000000000000000000000FF00000084000000FF00
      0000FF00000000000000FF000000FF000000FF00000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FF000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      84000000000000000000000000000000000084848400FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF000000000000FFFF00000000000000000000000000C6C6C600006363003173
      73000063630000A5A50000C6C60000C6C60000C6C60000C6C60000C6C6000063
      6300426363000000000000000000000000000000000000000000FF0000008400
      0000FF000000FF000000FF00000000000000FF000000FF00000000000000FFFF
      FF0000000000FF00000000000000000000000000000000000000000000008484
      84000084840000FFFF0000000000000000000084840000FFFF00008484000084
      84000000000000000000000000000000000084848400FFFFFF00848484000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000C6C6C6000042
      42003173730073D6D60084FFFF0084E7E70042C6C60000A5A50000A5A5000042
      420000636300848484000000000000000000000000000000000000000000FF00
      000084000000FF0000000000000000000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000084840000000000008484000000000000848400000000000084
      84000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000021
      21000084840000A5A50000C6C60000FFFF0000FFFF0000C6C60000C6C60000A5
      A500006363008484840000000000000000000000000000000000000000000000
      0000FF00000084000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000FFFF000000000000FFFF000000000000FFFF000000
      00000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF008484840000000000FFFFFF008484840084848400FFFF
      FF0000000000000000000000000000000000000000000000000000000000C6C6
      C600004242000084840000C6C60000E7E70042FFFF0084FFFF0042C6C6000042
      4200426363000000000000000000000000000000000000000000000000000000
      000000000000FF00000084000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF008484840084848400FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00000084000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000FFFF000000000000FFFF000000000000FFFF008484
      840000000000000000000000000000000000848484008484840084848400FFFF
      FF00FFFFFF00FFFFFF00000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840000000000000000000000000084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000424242004242420042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00000000000000FF000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00000000007B7B
      7B0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF00000000000000FFFFFF0000000000FF0000000000
      00000000000000000000000000000000000000000000BDBDBD00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002121
      2100212121002121210000000000848484004242420042424200000000000000
      0000212121000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000FFFFFF0000000000FFFFFF0000000000FF00
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD000000
      0000000000000000000000000000FFFFFF00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000212121006363
      6300313131002121210021212100A5A5A5006363630000000000000000002121
      2100212121002121210000000000000000000000000000000000000000008400
      0000FF000000FF00000084000000840000008400000084000000840000008400
      000000000000000000000000000000000000000000000000000000000000FF00
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FF0000000000000000000000000000000000000000000000000000007B7B
      7B00FFFFFF00FFFFFF00FFFFFF0000000000BDBDBD00BDBDBD00000000000000
      000000000000000000000000000000000000000000000000000021212100A5A5
      A500C6C6C60073737300A5A5A500C6C6C600C6C6C60063636300737373009494
      9400212121004242420000000000000000000000000000000000000000008400
      000084000000C6C6C600FFFFFF00848484008400000084000000840000008400
      00008400000000000000000000000000000000000000FF000000FF0000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FF00000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00BDBDBD00000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000003131
      3100C6C6C60094949400D6D6D600B5B5B500A5A5A500D6D6D600737373007373
      7300000000004242420000000000000000000000000000000000000000000000
      000084848400FFFFFF00C6C6C6000000000084000000FFFFFF00848484008400
      000084000000000000000000000000000000FF0000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000042424200424242006363
      6300A5A5A500C6C6C60063636300424242006363630063636300D6D6D6006363
      6300000000004242420042424200424242000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF0000000000C6C6C600000000008400
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00BDBDBD00424242003131310063636300E7E7
      E700636363009494940073737300737373005252520063636300A5A5A500C6C6
      C600636363004242420000000000424242000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000004242420063636300D6D6D600E7E7
      E700424242006363630084848400636363007373730042424200B5B5B500C6C6
      C600A5A5A5008484840000000000424242000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000FFFFFF00212121000000000000000000A5A5
      A50063636300B5B5B500C6C6C600848484007373730063636300D6D6D600A5A5
      A500212121002121210000000000212121000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF008400000000000000FFFFFF00FFFF
      FF0084848400000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF000000000000FFFF0000000000000000000000000000000000000000003131
      3100B5B5B50063636300B5B5B5006363630094949400C6C6C600949494006363
      6300000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600FFFFFF0000000000FFFFFF008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF000000000000FFFF000000000000000000000000000000000000000000A5A5
      A500D6D6D600B5B5B500636363004242420063636300A5A5A500B5B5B500A5A5
      A500212121004242420000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF000000
      000000FFFF000000000000000000000000000000000000000000424242005252
      5200A5A5A50031313100A5A5A500E7E7E700E7E7E70063636300212121007373
      7300212121002121210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000006363
      6300424242002121210000000000D6D6D6006363630042424200000000002121
      2100212121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363003131310042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF000084840000FFFF000084
      8400000000000000000000000000000000000000000000000000FFFFFF00B5D6
      B5005AAD5A00218C2100007B0000007B0000007B000008840800218C21005AAD
      5A00B5D6B500FFFFFF0000000000000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008484000000000000FFFF0000FFFF000084840000848400000000000084
      84000084840000000000000000000000000000000000DEEFDE00399C39000084
      000000840000008400000084000000C6000000C6000000840000008400000084
      00000084000031943100DEEFDE00000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF00848484000000000000000000000000000000000000000000000000000084
      8400000000000084840000000000008484000000000000848400000000000084
      8400000000000000000000000000000000000000000000000000000000000084
      84000000000000FFFF0000FFFF000000000000FFFF000084840000FFFF000084
      840000848400008484000000000000000000E7F7E700188C1800008400000084
      0000008400000084000000D6000000FF000000FF000000BD0000008400000084
      00000084000000840000188C1800E7EFE7008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF0000FFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000084
      84000084840000FFFF0000FFFF0000FFFF0000FFFF0000848400008484000084
      84000084840000848400000000000000000063AD630000840000008400000084
      0000008400000084000000E7000000A5000000B5000000F70000008400000084
      00000084000000840000008400005AAD5A008484840084848400848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      FF0000FFFF00848484008484840000000000C6C6C60000848400008484000084
      8400008484000084840000848400008484000084840000000000008400000084
      840000848400000000000000000000000000000000000000000000FFFF000084
      840000FFFF000084840000FFFF0000FFFF000084840000FFFF0000FFFF000084
      840000FFFF00008484000084840000000000188C180000840000008400000084
      000000840000008400000094000000C6000000DE000000EF0000008400000084
      0000008400000084000000840000088408008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF00848484008484
      840000FFFF008484840000FFFF0084848400FFFFFF0000848400008484000084
      840000848400008484000084840000848400008484000084840000FFFF000000
      00000084840000FFFF000000000000000000000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000848400008484000084840000000000188C180000840000008400000084
      0000008400000084000000F7000000EF000000DE000000A50000008400000084
      0000008400000084000000840000007B00008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF00848484008484840000FFFF0084848400FFFFFF0000848400008484000084
      840000848400008484000084840000FFFF0000FFFF00000000000084840000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000084840000FFFF0000848400000000005AAD5A0000840000008400000084
      0000008400000084000000FF000000B5000000A5000000D60000008400000084
      00000084000000840000008400004AA54A008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF0000FFFF008484840000FFFF0084848400FFFFFF00FFFFFF00008484000084
      8400008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000848400FFFFFF0000000000000000000000000000FFFF000084
      840000FFFF0000848400008484000084840000FFFF0000FFFF000000000000FF
      FF00008484000084840000FFFF0000000000DEEFDE00108C1000008400000084
      0000008400000084000000EF000000F7000000F7000000DE0000008400000084
      0000008400000084000008840800D6E7D6008484840084848400848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      FF0000FFFF0084848400848484008484840084000000FFFFFF00C6C6C60000FF
      FF0000000000000000000084840000FFFF0000FFFF0000848400000000000084
      84000084840000000000FFFFFF0084000000000000000000000000FFFF000084
      84000084840000848400008484000084840000FFFF0000FFFF0000FFFF000084
      840000FFFF000084840000FFFF000000000000000000D6E7D600188C18000084
      00000084000000840000008C000000DE000000DE000000840000008400000084
      000000840000188C1800C6DEC600000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484
      840000FFFF008484840000FFFF008484840084000000FFFFFF00C6C6C60000FF
      FF0000FFFF0000FFFF0000000000000000000000000000848400008484000084
      840000848400FFFFFF00FFFFFF0084000000000000000000000000FFFF0000FF
      FF00008484000084840000848400008484000084840000848400008484000084
      840000FFFF0000FFFF0000000000000000000000000000000000F7FFF70094C6
      9400399C39000084000000840000008C0000008C00000084000000840000399C
      390094C69400F7FFF7000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FF
      FF00848484008484840000FFFF00848484008400000084000000FFFFFF000000
      000000FFFF0000FFFF0000848400008484000084840000FFFF0000FFFF0000FF
      FF0000848400FFFFFF00840000008400000000000000000000000000000000FF
      FF00008484000084840000FFFF000084840000848400008484000084840000FF
      FF0000FFFF000084840000000000000000000000000000000000000000000000
      0000EFF7EF0029942900008400000084000000840000008400005AAD5A00F7FF
      F700000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000FFFF00848484008400000084000000000000000000
      000000000000008484000084840000FFFF000084840000000000000000000000
      0000FFFFFF0084000000840000008400000000000000000000000000000000FF
      FF0000FFFF00008484000084840000848400008484000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000000000000000000000F7F7
      F700319C31000084000000840000008400000084000000840000008400003194
      3100E7EFE7000000000000000000000000000000000000000000000000008484
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484840000FFFF0000FF
      FF0000FFFF0000FFFF0084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000000000000000000000000
      000000FFFF0000FFFF00008484000084840000FFFF000084840000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000F7F7F700399C
      3900008400000084000000840000008400000084000000840000008400000084
      0000108C1000C6DEC60000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000FFFF00008484000084840000848400008484000000
      000000000000000000000000000000000000000000000000000094BD940084BD
      840063AD63004AA54A008CBD8C0073B57300088408000884080018841800A5CE
      A5007BBD7B0052A55200B5D6B500000000000000000000000000000000000000
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
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008400
      0000FF000000FF000000840000008400000084000000C6C6C60084000000FF00
      0000840000008400000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00008400000084000000C6C6C600C6C6C600FFFFFF00C6C6C600848484008400
      000084000000000000000000000000000000848484000000000000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF008484840000000000000000000000000000000000848484000000
      000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF008484840000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF0084848400000000008400
      0000000000000000000000000000000000008484840000000000C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60084848400000000000000000000000000848484000000000000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00C6C6C600C6C6C600C6C6C600C6C6
      C60000000000000000000000000000000000848484000000000000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00848484000000000000000000000000008484840000000000C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C600848484000000000084848400000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000008484840000000000C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C6008484840000000000000000008484840000000000C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00000000008484840084848400000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00C6C6
      C60000000000000000000000000000000000848484000000000000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF008484840000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000008484840000000000C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C6008484840000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840000FFFF0084848400000000000000000000000000000000000000
      00000084840000FFFF000084840000FFFF000084840000FFFF000084840000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00C6C6C600FF00
      0000C6C6C600000000000000000000000000848484000000000000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00848484000000000000000000000000008484840000000000C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000084840000FFFF000084840000FFFF000084840000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600FFFFFF008484
      8400000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400000000000000000000000000848484000000000000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000000000000084840000FFFF000084840000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C60000000000000000000000000084848400C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C6008484840084848400848484008484
      840084848400848484000000000000000000000000008484840000000000C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C6000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      00000000000000000000000000000084840000FFFF0000848400000000000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000000000000000000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FFFFFFFFC0070000FC1FFFFFE7E70000F81FFFFFF3F70000F81FFE7FF9F70000
      F803FC3FFCFF0000C007F81FFE7F0000E00FF00FFF3F0000F01FE007FE7F0000
      F83FC007FCFF0000FC7FF81FF9F70000FEFFF81FF3F70000FFFFF83FE7E70000
      FFFFFFFFC0070000FFFFFFFFFFFF0000FC7F8000FC7FF7FFF01F8000F01FE3EF
      C0078000C107E3EF000180008001C1EF000180000101C1EF000180000001F7EF
      000180000101F7EF000180000001F7EF000180000101F7EF000180000281F7EF
      000180001101F7EF000180002801F783000180009201F783C0078001C403F7C7
      F01F8003F007F7C7FC7F8007FC4FFFEFE063FFFFFFFFFFFF8001FDFFFC3FD8BF
      8001F8FFF30FE07F8000F07FE287F07F0000E03FE30700010000C01FE2870001
      0000800FE307000180010007E287000180030003E3070001800F8001E2870001
      8007C003E3070001C003E00FE2A70005E003F00FE5570001E007F81FEAA70005
      F81FFC7FF54F0101FFFFFFFFF81FC387FFFF81FFFE3FFFFFFE3F80FFFFBFFFFF
      F81F007FE237E07FF40F001FC063E007E0078007C003E0078003E001E00BE007
      4001F8008008C00F0000F8000002C00F0000E0000002C0078001C0006002C007
      C0038002E00BC007E00F8003E003C007F07FC003C003E003F8FFE007E227F003
      FFFFF00FFE3FFE07FFFFFC3FFC3FFFFFFFFFFFFFFFFFFE0FFFFF001FFF7FF007
      C003000FE00FE00380010007C00FC001000000030007C0010000000100038000
      0000000000038000000000000000800000000000000080000000000000008000
      8001000000008001C00380000000C001F00FC0000800C003E007E0007FF0E007
      C003F000FFFCF00FC001FFFFFFFEFC1FFFFFFFFFFFFFFFFFFFFFFFFFE003F007
      8001E000E003E0030001C000E003F0074001D000E003F0074001A000E003F007
      4001A000E003E00740014000E003C00740017FE0C001C00340010000E003C003
      4001A000F007C0077FF9A07CF807E0030003A081FC07F00380FFDF7FFE27F803
      C1FFE0FFFF67FC07FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
