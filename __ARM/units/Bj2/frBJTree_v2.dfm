object fBJTree_v2: TfBJTree_v2
  Left = 0
  Top = 0
  Width = 1146
  Height = 425
  TabOrder = 0
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1146
    Height = 29
    Caption = 'ToolBar1'
    Images = ImgList
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Width = 4
      Caption = 'ToolButton1'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object RxSpeedButton1: TRxSpeedButton
      Left = 4
      Top = 2
      Width = 56
      Height = 22
      DropDownMenu = pmServiceType
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000000000000000000000000000000000000000
        000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object ToolButton2: TToolButton
      Left = 60
      Top = 2
      Action = aProperty
    end
    object ToolButton3: TToolButton
      Left = 83
      Top = 2
      Width = 5
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 88
      Top = 2
      Action = aDelete
    end
    object ToolButton5: TToolButton
      Left = 111
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 119
      Top = 2
      Action = aRefreshe
    end
    object ToolButton7: TToolButton
      Left = 142
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 150
      Top = 2
      Action = aExcel
    end
    object ToolButton9: TToolButton
      Left = 173
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 181
      Top = 2
      Action = aSort
    end
    object ToolButton11: TToolButton
      Left = 204
      Top = 2
      Width = 13
      Caption = 'ToolButton11'
      ImageIndex = 31
      Style = tbsSeparator
    end
    object RxSpeedButton2: TRxSpeedButton
      Left = 217
      Top = 2
      Width = 114
      Height = 22
      DropDownMenu = pmHide
      Caption = 'Настройки'
    end
    object ToolButton14: TToolButton
      Left = 331
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 31
      Style = tbsSeparator
    end
    object Label2: TLabel
      Left = 339
      Top = 2
      Width = 26
      Height = 22
      Caption = 'Дата'
      Layout = tlCenter
      Visible = False
    end
    object ToolButtonSep13: TToolButton
      Left = 365
      Top = 2
      Width = 8
      Caption = 'ToolButtonSep13'
      ImageIndex = 31
      Style = tbsSeparator
      Visible = False
    end
    object dtTo: TDateTimePicker
      Left = 373
      Top = 2
      Width = 101
      Height = 22
      CalAlignment = dtaLeft
      Date = 37604.576338125
      Time = 37604.576338125
      ShowCheckbox = True
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      Visible = False
    end
    object ToolButton10: TToolButton
      Left = 474
      Top = 2
      Width = 17
      Caption = 'ToolButton10'
      ImageIndex = 30
      Style = tbsSeparator
      Visible = False
    end
    object Label32: TLabel
      Left = 491
      Top = 2
      Width = 73
      Height = 22
      Caption = 'Операция №   '
      Layout = tlCenter
      Visible = False
    end
    object ceOper: TEdit
      Left = 564
      Top = 2
      Width = 209
      Height = 22
      TabOrder = 0
      Visible = False
    end
  end
  object dxDBTreeList1: TdxDBTreeList
    Left = 0
    Top = 29
    Width = 1146
    Height = 396
    Bands = <
      item
        Width = 344
      end
      item
        Caption = 'Январь'
      end
      item
        Caption = 'Февраль'
      end
      item
        Caption = 'Март'
      end
      item
        Caption = '1 кв.'
      end
      item
        Caption = 'Апрель'
      end
      item
        Caption = 'Май'
      end
      item
        Caption = 'Июнь'
      end
      item
        Caption = '2 кв.'
      end
      item
        Caption = 'Июль'
      end
      item
        Caption = 'Август'
      end
      item
        Caption = 'Сентябрь'
      end
      item
        Caption = '3 кв.'
      end
      item
        Caption = 'Октябрь'
      end
      item
        Caption = 'Ноябрь'
      end
      item
        Caption = 'Декабрь'
      end
      item
        Caption = '4 кв.'
      end
      item
        Caption = 'весь год'
      end>
    DefaultLayout = False
    HeaderPanelRowCount = 1
    KeyField = 'id_BJ_Tree'
    ParentField = 'PID'
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu2
    TabOrder = 1
    BandFont.Charset = RUSSIAN_CHARSET
    BandFont.Color = clWindowText
    BandFont.Height = -11
    BandFont.Name = 'MS Sans Serif'
    BandFont.Style = []
    DataSource = dsBJTree
    HeaderFont.Charset = RUSSIAN_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    Images = ImgList
    OptionsBehavior = [etoAutoDragDrop, etoAutoDragDropCopy, etoDragScroll, etoEnterShowEditor, etoImmediateEditor, etoMultiSelect, etoTabThrough]
    OptionsCustomize = [etoBandSizing, etoColumnSizing, etoKeepColumnWidth]
    OptionsView = [etoBandHeaderWidth, etoDrawEndEllipsis, etoUseBitmap, etoUseImageIndexForSelected]
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
    object dxDBTreeList1Name: TdxDBTreeListMaskColumn
      Caption = 'Название'
      Width = 344
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Name'
    end
    object dxDBTreeList1id_Acc: TdxDBTreeListMaskColumn
      Tag = -26
      Visible = False
      Width = 344
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_Acc'
    end
    object dxDBTreeList1id_ContrAgent: TdxDBTreeListMaskColumn
      Tag = -26
      Visible = False
      Width = 344
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_ContrAgent'
    end
    object dxDBTreeList1id_BJ_Tree: TdxDBTreeListMaskColumn
      Tag = -26
      Visible = False
      Width = 344
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_BJ_Tree'
    end
    object dxDBTreeList1PID: TdxDBTreeListMaskColumn
      Tag = -26
      Visible = False
      Width = 344
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PID'
    end
    object dxDBTreeList1id_BJ_Item: TdxDBTreeListMaskColumn
      Tag = -26
      Visible = False
      Width = 344
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id_BJ_Item'
    end
    object dxDBTreeList1ALevel: TdxDBTreeListMaskColumn
      Tag = -26
      Visible = False
      Width = 344
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ALevel'
    end
    object dxDBTreeList1isInState: TdxDBTreeListCheckColumn
      Tag = -26
      Visible = False
      Width = 344
      BandIndex = 0
      RowIndex = 0
      FieldName = 'isInState'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dxDBTreeList1BlackList: TdxDBTreeListMaskColumn
      Tag = -26
      Visible = False
      Width = 344
      BandIndex = 0
      RowIndex = 0
      FieldName = 'BlackList'
    end
    object dxDBTreeList1PlanIn: TdxDBTreeListMaskColumn
      Tag = -26
      Visible = False
      Width = 344
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PlanIn'
    end
    object dxDBTreeList1PlanDelta1: TdxDBTreeListMaskColumn
      Caption = 'План'
      Width = 120
      BandIndex = 1
      RowIndex = 0
      FieldName = 'PlanDelta1'
    end
    object dxDBTreeList1PlanCorrect1: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Width = 120
      BandIndex = 1
      RowIndex = 0
      FieldName = 'PlanCorrect1'
    end
    object dxDBTreeList1PlanTotal1: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Width = 120
      BandIndex = 1
      RowIndex = 0
      FieldName = 'PlanTotal1'
    end
    object dxDBTreeList1S_Pay1: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Width = 120
      BandIndex = 1
      RowIndex = 0
      FieldName = 'S_Pay1'
    end
    object dxDBTreeList1PRC1: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Width = 120
      BandIndex = 1
      RowIndex = 0
      FieldName = 'PRC1'
    end
    object dxDBTreeList1Delta1: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Width = 120
      BandIndex = 1
      RowIndex = 0
      FieldName = 'Delta1'
    end
    object dxDBTreeList1PlanDelta2: TdxDBTreeListMaskColumn
      Caption = 'План'
      Width = 120
      BandIndex = 2
      RowIndex = 0
      FieldName = 'PlanDelta2'
    end
    object dxDBTreeList1PlanCorrect2: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Width = 120
      BandIndex = 2
      RowIndex = 0
      FieldName = 'PlanCorrect2'
    end
    object dxDBTreeList1PlanTotal2: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Width = 120
      BandIndex = 2
      RowIndex = 0
      FieldName = 'PlanTotal2'
    end
    object dxDBTreeList1S_Pay2: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Width = 120
      BandIndex = 2
      RowIndex = 0
      FieldName = 'S_Pay2'
    end
    object dxDBTreeList1PRC2: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Width = 120
      BandIndex = 2
      RowIndex = 0
      FieldName = 'PRC2'
    end
    object dxDBTreeList1Delta2: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Width = 120
      BandIndex = 2
      RowIndex = 0
      FieldName = 'Delta2'
    end
    object dxDBTreeList1PlanDelta3: TdxDBTreeListMaskColumn
      Caption = 'План'
      Width = 120
      BandIndex = 3
      RowIndex = 0
      FieldName = 'PlanDelta3'
    end
    object dxDBTreeList1PlanCorrect3: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Width = 120
      BandIndex = 3
      RowIndex = 0
      FieldName = 'PlanCorrect3'
    end
    object dxDBTreeList1PlanTotal3: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Width = 120
      BandIndex = 3
      RowIndex = 0
      FieldName = 'PlanTotal3'
    end
    object dxDBTreeList1S_Pay3: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Width = 120
      BandIndex = 3
      RowIndex = 0
      FieldName = 'S_Pay3'
    end
    object dxDBTreeList1PRC3: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Width = 117
      BandIndex = 3
      RowIndex = 0
      FieldName = 'PRC3'
    end
    object dxDBTreeList1Delta3: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Width = 120
      BandIndex = 3
      RowIndex = 0
      FieldName = 'Delta3'
    end
    object dxDBTreeList1PlanDeltaQ1: TdxDBTreeListMaskColumn
      Caption = 'План'
      Color = 13816530
      Width = 120
      BandIndex = 4
      RowIndex = 0
      FieldName = 'PlanDeltaQ1'
    end
    object dxDBTreeList1PlanCorrectQ1: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Color = 13816530
      Width = 120
      BandIndex = 4
      RowIndex = 0
      FieldName = 'PlanCorrectQ1'
    end
    object dxDBTreeList1PlanTotalQ1: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Color = 13816530
      Width = 120
      BandIndex = 4
      RowIndex = 0
      FieldName = 'PlanTotalQ1'
    end
    object dxDBTreeList1S_PayQ1: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Color = 13816530
      Width = 120
      BandIndex = 4
      RowIndex = 0
      FieldName = 'S_PayQ1'
    end
    object dxDBTreeList1PRCQ1: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Color = 13816530
      Width = 120
      BandIndex = 4
      RowIndex = 0
      FieldName = 'PRCQ1'
    end
    object dxDBTreeList1DeltaQ1: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Color = 13816530
      Width = 120
      BandIndex = 4
      RowIndex = 0
      FieldName = 'DeltaQ1'
    end
    object dxDBTreeList1PlanDelta4: TdxDBTreeListMaskColumn
      Caption = 'План'
      Width = 120
      BandIndex = 5
      RowIndex = 0
      FieldName = 'PlanDelta4'
    end
    object dxDBTreeList1PlanCorrect4: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Width = 120
      BandIndex = 5
      RowIndex = 0
      FieldName = 'PlanCorrect4'
    end
    object dxDBTreeList1PlanTotal4: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Width = 120
      BandIndex = 5
      RowIndex = 0
      FieldName = 'PlanTotal4'
    end
    object dxDBTreeList1S_Pay4: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Width = 120
      BandIndex = 5
      RowIndex = 0
      FieldName = 'S_Pay4'
    end
    object dxDBTreeList1PRC4: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Width = 120
      BandIndex = 5
      RowIndex = 0
      FieldName = 'PRC4'
    end
    object dxDBTreeList1Delta4: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Width = 120
      BandIndex = 5
      RowIndex = 0
      FieldName = 'Delta4'
    end
    object dxDBTreeList1PlanDelta5: TdxDBTreeListMaskColumn
      Caption = 'План'
      Width = 120
      BandIndex = 6
      RowIndex = 0
      FieldName = 'PlanDelta5'
    end
    object dxDBTreeList1PlanCorrect5: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Width = 120
      BandIndex = 6
      RowIndex = 0
      FieldName = 'PlanCorrect5'
    end
    object dxDBTreeList1PlanTotal5: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Width = 120
      BandIndex = 6
      RowIndex = 0
      FieldName = 'PlanTotal5'
    end
    object dxDBTreeList1S_Pay5: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Width = 120
      BandIndex = 6
      RowIndex = 0
      FieldName = 'S_Pay5'
    end
    object dxDBTreeList1PRC5: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Width = 120
      BandIndex = 6
      RowIndex = 0
      FieldName = 'PRC5'
    end
    object dxDBTreeList1Delta5: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Width = 120
      BandIndex = 6
      RowIndex = 0
      FieldName = 'Delta5'
    end
    object dxDBTreeList1PlanDelta6: TdxDBTreeListMaskColumn
      Caption = 'План'
      Width = 120
      BandIndex = 7
      RowIndex = 0
      FieldName = 'PlanDelta6'
    end
    object dxDBTreeList1PlanCorrect6: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Width = 120
      BandIndex = 7
      RowIndex = 0
      FieldName = 'PlanCorrect6'
    end
    object dxDBTreeList1PlanTotal6: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Width = 120
      BandIndex = 7
      RowIndex = 0
      FieldName = 'PlanTotal6'
    end
    object dxDBTreeList1S_Pay6: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Width = 120
      BandIndex = 7
      RowIndex = 0
      FieldName = 'S_Pay6'
    end
    object dxDBTreeList1PRC6: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Width = 120
      BandIndex = 7
      RowIndex = 0
      FieldName = 'PRC6'
    end
    object dxDBTreeList1Delta6: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Width = 120
      BandIndex = 7
      RowIndex = 0
      FieldName = 'Delta6'
    end
    object dxDBTreeList1PlanDeltaQ2: TdxDBTreeListMaskColumn
      Caption = 'План'
      Color = 13816530
      Width = 120
      BandIndex = 8
      RowIndex = 0
      FieldName = 'PlanDeltaQ2'
    end
    object dxDBTreeList1PlanCorrectQ2: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Color = 13816530
      Width = 120
      BandIndex = 8
      RowIndex = 0
      FieldName = 'PlanCorrectQ2'
    end
    object dxDBTreeList1PlanTotalQ2: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Color = 13816530
      Width = 120
      BandIndex = 8
      RowIndex = 0
      FieldName = 'PlanTotalQ2'
    end
    object dxDBTreeList1S_PayQ2: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Color = 13816530
      Width = 120
      BandIndex = 8
      RowIndex = 0
      FieldName = 'S_PayQ2'
    end
    object dxDBTreeList1PRCQ2: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Color = 13816530
      Width = 120
      BandIndex = 8
      RowIndex = 0
      FieldName = 'PRCQ2'
    end
    object dxDBTreeList1DeltaQ2: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Color = 13816530
      Width = 120
      BandIndex = 8
      RowIndex = 0
      FieldName = 'DeltaQ2'
    end
    object dxDBTreeList1PlanDelta7: TdxDBTreeListMaskColumn
      Caption = 'План'
      Width = 120
      BandIndex = 9
      RowIndex = 0
      FieldName = 'PlanDelta7'
    end
    object dxDBTreeList1PlanCorrect7: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Width = 120
      BandIndex = 9
      RowIndex = 0
      FieldName = 'PlanCorrect7'
    end
    object dxDBTreeList1PlanTotal7: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Width = 120
      BandIndex = 9
      RowIndex = 0
      FieldName = 'PlanTotal7'
    end
    object dxDBTreeList1S_Pay7: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Width = 120
      BandIndex = 9
      RowIndex = 0
      FieldName = 'S_Pay7'
    end
    object dxDBTreeList1PRC7: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Width = 120
      BandIndex = 9
      RowIndex = 0
      FieldName = 'PRC7'
    end
    object dxDBTreeList1Delta7: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Width = 120
      BandIndex = 9
      RowIndex = 0
      FieldName = 'Delta7'
    end
    object dxDBTreeList1PlanDelta8: TdxDBTreeListMaskColumn
      Caption = 'План'
      Width = 120
      BandIndex = 10
      RowIndex = 0
      FieldName = 'PlanDelta8'
    end
    object dxDBTreeList1PlanCorrect8: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Width = 120
      BandIndex = 10
      RowIndex = 0
      FieldName = 'PlanCorrect8'
    end
    object dxDBTreeList1PlanTotal8: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Width = 120
      BandIndex = 10
      RowIndex = 0
      FieldName = 'PlanTotal8'
    end
    object dxDBTreeList1S_Pay8: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Width = 120
      BandIndex = 10
      RowIndex = 0
      FieldName = 'S_Pay8'
    end
    object dxDBTreeList1PRC8: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Width = 120
      BandIndex = 10
      RowIndex = 0
      FieldName = 'PRC8'
    end
    object dxDBTreeList1Delta8: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Width = 120
      BandIndex = 10
      RowIndex = 0
      FieldName = 'Delta8'
    end
    object dxDBTreeList1PlanDelta9: TdxDBTreeListMaskColumn
      Caption = 'План'
      Width = 120
      BandIndex = 11
      RowIndex = 0
      FieldName = 'PlanDelta9'
    end
    object dxDBTreeList1PlanCorrect9: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Width = 120
      BandIndex = 11
      RowIndex = 0
      FieldName = 'PlanCorrect9'
    end
    object dxDBTreeList1PlanTotal9: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Width = 120
      BandIndex = 11
      RowIndex = 0
      FieldName = 'PlanTotal9'
    end
    object dxDBTreeList1S_Pay9: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Width = 120
      BandIndex = 11
      RowIndex = 0
      FieldName = 'S_Pay9'
    end
    object dxDBTreeList1PRC9: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Width = 120
      BandIndex = 11
      RowIndex = 0
      FieldName = 'PRC9'
    end
    object dxDBTreeList1Delta9: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Width = 120
      BandIndex = 11
      RowIndex = 0
      FieldName = 'Delta9'
    end
    object dxDBTreeList1PlanDeltaQ3: TdxDBTreeListMaskColumn
      Caption = 'План'
      Color = 13816530
      Width = 120
      BandIndex = 12
      RowIndex = 0
      FieldName = 'PlanDeltaQ3'
    end
    object dxDBTreeList1PlanCorrectQ3: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Color = 13816530
      Width = 120
      BandIndex = 12
      RowIndex = 0
      FieldName = 'PlanCorrectQ3'
    end
    object dxDBTreeList1PlanTotalQ3: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Color = 13816530
      Width = 120
      BandIndex = 12
      RowIndex = 0
      FieldName = 'PlanTotalQ3'
    end
    object dxDBTreeList1S_PayQ3: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Color = 13816530
      Width = 120
      BandIndex = 12
      RowIndex = 0
      FieldName = 'S_PayQ3'
    end
    object dxDBTreeList1PRCQ3: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Color = 13816530
      Width = 120
      BandIndex = 12
      RowIndex = 0
      FieldName = 'PRCQ3'
    end
    object dxDBTreeList1DeltaQ3: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Color = 13816530
      Width = 120
      BandIndex = 12
      RowIndex = 0
      FieldName = 'DeltaQ3'
    end
    object dxDBTreeList1PlanDelta10: TdxDBTreeListMaskColumn
      Caption = 'План'
      Width = 120
      BandIndex = 13
      RowIndex = 0
      FieldName = 'PlanDelta10'
    end
    object dxDBTreeList1PlanCorrect10: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Width = 120
      BandIndex = 13
      RowIndex = 0
      FieldName = 'PlanCorrect10'
    end
    object dxDBTreeList1PlanTotal10: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Width = 120
      BandIndex = 13
      RowIndex = 0
      FieldName = 'PlanTotal10'
    end
    object dxDBTreeList1S_Pay10: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Width = 120
      BandIndex = 13
      RowIndex = 0
      FieldName = 'S_Pay10'
    end
    object dxDBTreeList1PRC10: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Width = 120
      BandIndex = 13
      RowIndex = 0
      FieldName = 'PRC10'
    end
    object dxDBTreeList1Delta10: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Width = 120
      BandIndex = 13
      RowIndex = 0
      FieldName = 'Delta10'
    end
    object dxDBTreeList1PlanDelta11: TdxDBTreeListMaskColumn
      Caption = 'План'
      Width = 120
      BandIndex = 14
      RowIndex = 0
      FieldName = 'PlanDelta11'
    end
    object dxDBTreeList1PlanCorrect11: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Width = 120
      BandIndex = 14
      RowIndex = 0
      FieldName = 'PlanCorrect11'
    end
    object dxDBTreeList1PlanTotal11: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Width = 120
      BandIndex = 14
      RowIndex = 0
      FieldName = 'PlanTotal11'
    end
    object dxDBTreeList1S_Pay11: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Width = 120
      BandIndex = 14
      RowIndex = 0
      FieldName = 'S_Pay11'
    end
    object dxDBTreeList1PRC11: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Width = 120
      BandIndex = 14
      RowIndex = 0
      FieldName = 'PRC11'
    end
    object dxDBTreeList1Delta11: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Width = 120
      BandIndex = 14
      RowIndex = 0
      FieldName = 'Delta11'
    end
    object dxDBTreeList1PlanDelta12: TdxDBTreeListMaskColumn
      Caption = 'План'
      Width = 120
      BandIndex = 15
      RowIndex = 0
      FieldName = 'PlanDelta12'
    end
    object dxDBTreeList1PlanCorrect12: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Width = 120
      BandIndex = 15
      RowIndex = 0
      FieldName = 'PlanCorrect12'
    end
    object dxDBTreeList1PlanTotal12: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Width = 120
      BandIndex = 15
      RowIndex = 0
      FieldName = 'PlanTotal12'
    end
    object dxDBTreeList1S_Pay12: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Width = 120
      BandIndex = 15
      RowIndex = 0
      FieldName = 'S_Pay12'
    end
    object dxDBTreeList1PRC12: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Width = 120
      BandIndex = 15
      RowIndex = 0
      FieldName = 'PRC12'
    end
    object dxDBTreeList1Delta12: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Width = 120
      BandIndex = 15
      RowIndex = 0
      FieldName = 'Delta12'
    end
    object dxDBTreeList1PlanDeltaQ4: TdxDBTreeListMaskColumn
      Caption = 'План'
      Color = 13816530
      Width = 120
      BandIndex = 16
      RowIndex = 0
      FieldName = 'PlanDeltaQ4'
    end
    object dxDBTreeList1PlanCorrectQ4: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Color = 13816530
      Width = 120
      BandIndex = 16
      RowIndex = 0
      FieldName = 'PlanCorrectQ4'
    end
    object dxDBTreeList1PlanTotalQ4: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Color = 13816530
      Width = 120
      BandIndex = 16
      RowIndex = 0
      FieldName = 'PlanTotalQ4'
    end
    object dxDBTreeList1S_PayQ4: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Color = 13816530
      Width = 120
      BandIndex = 16
      RowIndex = 0
      FieldName = 'S_PayQ4'
    end
    object dxDBTreeList1PRCQ4: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Color = 13816530
      Width = 120
      BandIndex = 16
      RowIndex = 0
      FieldName = 'PRCQ4'
    end
    object dxDBTreeList1DeltaQ4: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Color = 13816530
      Width = 120
      BandIndex = 16
      RowIndex = 0
      FieldName = 'DeltaQ4'
    end
    object dxDBTreeList1PlanDeltaYear: TdxDBTreeListMaskColumn
      Caption = 'План'
      Width = 120
      BandIndex = 17
      RowIndex = 0
      FieldName = 'PlanDeltaYear'
    end
    object dxDBTreeList1PlanCorrectYear: TdxDBTreeListMaskColumn
      Caption = 'Коррекция'
      Width = 120
      BandIndex = 17
      RowIndex = 0
      FieldName = 'PlanCorrectYear'
    end
    object dxDBTreeList1PlanTotalYear: TdxDBTreeListMaskColumn
      Caption = 'Итого план'
      Width = 120
      BandIndex = 17
      RowIndex = 0
      FieldName = 'PlanTotalYear'
    end
    object dxDBTreeList1S_PayYear: TdxDBTreeListMaskColumn
      Caption = 'Оплаты'
      Width = 120
      BandIndex = 17
      RowIndex = 0
      FieldName = 'S_PayYear'
    end
    object dxDBTreeList1TRezYear: TdxDBTreeListMaskColumn
      Visible = False
      Width = 120
      BandIndex = 17
      RowIndex = 0
      FieldName = 'TRezYear'
    end
    object dxDBTreeList1PRCYear: TdxDBTreeListMaskColumn
      Caption = '% исполнения'
      Width = 120
      BandIndex = 17
      RowIndex = 0
      FieldName = 'PRCYear'
    end
    object dxDBTreeList1DeltaYear: TdxDBTreeListMaskColumn
      Caption = 'Отклонение'
      Width = 120
      BandIndex = 17
      RowIndex = 0
      FieldName = 'DeltaYear'
    end
    object dxDBTreeList1OrderNum: TdxDBTreeListMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'OrderNum'
    end
    object dxDBTreeList1isDeb: TdxDBTreeListCheckColumn
      Visible = False
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'isDeb'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dxDBTreeList1ExtID: TdxDBTreeListMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ExtID'
    end
  end
  object ActionList1: TActionList
    Images = ImgList
    Left = 136
    Top = 232
    object aNewDeb: TAction
      Caption = 'Создать базовую группу в доходах'
      Hint = 'Создать'
      OnExecute = aNewDebExecute
    end
    object aProperty: TAction
      Caption = 'Редактировать'
      Enabled = False
      Hint = 'Редактировать'
      ImageIndex = 14
      OnExecute = aPropertyExecute
    end
    object aArc: TAction
      Caption = 'Движение по счетам - расширенное'
      Enabled = False
      Hint = 'Движение по счетам - расширенное'
    end
    object aRefreshe: TAction
      Caption = 'Обновить'
      ImageIndex = 26
      OnExecute = aRefresheExecute
    end
    object aDelete: TAction
      Caption = 'Удалить'
      Enabled = False
      ImageIndex = 12
      OnExecute = aDeleteExecute
    end
    object aNewCh: TAction
      Caption = 'Добавить подгруппу'
      OnExecute = aNewChExecute
    end
    object aBJ_ItemAdd: TAction
      Caption = 'Добавить статью'
      Enabled = False
      OnExecute = aBJ_ItemAddExecute
    end
    object aAddAcc: TAction
      Caption = 'Добавить счета'
      Enabled = False
      OnExecute = aAddAccExecute
    end
    object aAddCA: TAction
      Caption = 'Добавить контрагентов'
      Enabled = False
      OnExecute = aAddCAExecute
    end
    object aNewCred: TAction
      Caption = 'Создать базовую группу в расходах'
      OnExecute = aNewCredExecute
    end
    object aAddDeb: TAction
      Caption = 'Добавить дебиторов'
      Visible = False
      OnExecute = aAddDebExecute
    end
    object aAddKred: TAction
      Caption = 'Добавить кредиторов'
      Visible = False
      OnExecute = aAddKredExecute
    end
    object aAddAcz: TAction
      Caption = 'Добавить остатки денежных средств'
      OnExecute = aAddAczExecute
    end
    object aClearGrp: TAction
      Caption = 'Очистить группу'
      Enabled = False
      OnExecute = aClearGrpExecute
    end
    object aExcel: TAction
      Caption = 'В Excel'
      ImageIndex = 30
      OnExecute = aExcelExecute
    end
    object aItemUP: TAction
      Enabled = False
      ImageIndex = 21
      OnExecute = aItemUPExecute
    end
    object aItemDown: TAction
      Caption = 'aItemDown'
      Enabled = False
      ImageIndex = 22
      OnExecute = aItemDownExecute
    end
    object aSort: TAction
      Caption = 'Упорядочить'
      Enabled = False
      ImageIndex = 29
      OnExecute = aSortExecute
    end
    object aDet: TAction
      Caption = 'Детализация'
      Enabled = False
      OnExecute = aDetExecute
    end
    object aAccCard: TAction
      Caption = 'Карточка счета'
      Enabled = False
      OnExecute = aAccCardExecute
    end
    object aBalance: TAction
      Caption = 'Взаиморасчеты'
      Enabled = False
      OnExecute = aBalanceExecute
    end
    object aExpandNode: TAction
      Category = 'nnn'
      Caption = 'Открыть ветку'
      Enabled = False
      OnExecute = aExpandNodeExecute
    end
    object aCollapseNode: TAction
      Category = 'nnn'
      Caption = 'Закрыть ветку'
      Enabled = False
      OnExecute = aCollapseNodeExecute
    end
    object aExpandAll: TAction
      Category = 'nnn'
      Caption = 'Открыть все'
      OnExecute = aExpandAllExecute
    end
    object aCollapseAll: TAction
      Category = 'nnn'
      Caption = 'Закрыть все'
      OnExecute = aCollapseAllExecute
    end
    object aNodeExp: TAction
      Category = 'nnn'
      Caption = 'Экспортировать ветку в Excel'
      Enabled = False
      OnExecute = aNodeExpExecute
    end
    object aSetisDirect: TAction
      Caption = 
        'Пометить вложенные  элементы как "Постоянная величина (переносит' +
        'ь при копировании)"'
      OnExecute = aSetisDirectExecute
    end
    object aSetisInState: TAction
      Caption = 'Пометить вложенные  элементы как "Входящее состояние"'
      OnExecute = aSetisInStateExecute
    end
    object aUnSetInitial: TAction
      Category = 'nnn'
      Caption = 'Обнулить план'
      OnExecute = aUnSetInitialExecute
    end
    object aSetInitial: TAction
      Category = 'nnn'
      Caption = 'Установить план'
      OnExecute = aSetInitialExecute
    end
    object Action1: TAction
      Category = 'Отчеты'
      Caption = 'Action1'
    end
  end
  object PopupMenu2: TPopupMenu
    Images = ImgList
    OnPopup = pmServiceTypePopup
    Left = 304
    Top = 264
    object N4: TMenuItem
      Action = aNewCh
    end
    object N36: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Action = aBJ_ItemAdd
    end
    object N11: TMenuItem
      Action = aAddAcc
    end
    object N12: TMenuItem
      Action = aAddCA
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N25: TMenuItem
      Action = aClearGrp
      Visible = False
    end
    object N30: TMenuItem
      Caption = '-'
    end
    object N31: TMenuItem
      Action = aExpandNode
    end
    object N33: TMenuItem
      Action = aCollapseNode
    end
    object N32: TMenuItem
      Action = aExpandAll
    end
    object N34: TMenuItem
      Action = aCollapseAll
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N27: TMenuItem
      Action = aDet
    end
    object N28: TMenuItem
      Action = aAccCard
    end
    object N29: TMenuItem
      Action = aBalance
    end
    object N26: TMenuItem
      Caption = '-'
    end
    object N35: TMenuItem
      Action = aNodeExp
    end
    object MenuItem3: TMenuItem
      Action = aProperty
    end
  end
  object pmServiceType: TPopupMenu
    Images = ImgList
    OnPopup = pmServiceTypePopup
    Left = 176
    Top = 112
    object N3: TMenuItem
      Action = aNewDeb
    end
    object N5: TMenuItem
      Action = aNewCred
    end
    object MenuItem4: TMenuItem
      Action = aNewCh
    end
    object N20: TMenuItem
      Caption = '-'
    end
    object N21: TMenuItem
      Action = aAddDeb
    end
    object N22: TMenuItem
      Action = aAddKred
    end
    object N23: TMenuItem
      Action = aAddAcz
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Action = aBJ_ItemAdd
    end
    object N7: TMenuItem
      Action = aAddAcc
    end
    object N10: TMenuItem
      Action = aAddCA
    end
    object MenuItem5: TMenuItem
      Caption = '-'
    end
    object N24: TMenuItem
      Action = aClearGrp
    end
    object N6: TMenuItem
      Action = aDelete
    end
  end
  object ImgList: TImageList
    ShareImages = True
    Left = 80
    Top = 60
    Bitmap = {
      494C01011F002200040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808000008080000080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      800080808000808080008080800080808000808080000000000080800000FFFF
      0000FFFF0000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00008080
      0000808000008080000080800000808000000000000080800000FFFF0000FFFF
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00008080000080800000808000000000000080800000FFFF0000FFFF0000FFFF
      FF00000000008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000808000000000000080800000FFFF0000FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080800000FFFF0000FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080800000FFFF0000FFFF0000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080800000FFFF0000FFFF0000FFFFFF000000000080800000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000FFFF0000FFFF0000FFFFFF0000000000FFFF000080800000808000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080800000FFFF
      0000FFFF0000FFFFFF00000000000000000000000000FFFF0000808000008080
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      00000000000080808000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00009C31009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000000000000000CED6D60084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00009C3100009C3100FFFFFF009CFFFF00FFFFFF009CFF
      FF000000000000000000CED6D600000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF009CFFFF00009C3100009C3100009C3100009C3100009C31009CFFFF00FFFF
      FF000000000000000000CED6D600000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00009C3100009C3100FFFFFF00639C0000636300009CFF
      FF000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00009C31009CFFFF00FFFFFF0063630000FFFF
      FF000000000000000000CED6D60000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00636300009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00636300009CFF
      FF000000000000000000CED6D60000000000000000000000000000000000FFFF
      FF00000000000000000000000000C6DEC6000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF0063630000FFFFFF009CFFFF00009C31009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000000000000000CED6D60000000000000000000000000000000000FFFF
      FF00000000000000000000000000C6DEC6000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF0063630000639C0000FFFFFF00009C3100009C31009CFFFF00FFFFFF009CFF
      FF000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF009CFFFF00009C3100009C3100009C3100009C3100009C31009CFFFF00FFFF
      FF000000000000000000CED6D600000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000840000008400000000000000000000000000FF000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00009C3100009C31009CFFFF00FFFFFF000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008400000084000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00009C31009CFFFF00FFFFFF00000000000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008400000084000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF0084848400FFFF
      FF0000000000CED6D600CED6D600000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00CED6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      000000000000CED6D60000000000CED6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840084848400848484008484840084848400848484008484840084848400CED6
      D600CED6D60000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000142030001420300014A04000252050001460300014603000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000024C
      0400024C0400037B080003960A00039F0C00039F0C00039D0C00038C0A00036B
      0A00036B0A000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000001340200026A
      060003A70C0003A50C0003A10C0003A00C0003A00C0007A5180006A7160009AF
      1C000A991F0006620F0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000014D04000269060003A7
      0C00039F0C00039E0C00039E0C00B1E6B600FFFFFF0041BF57000CA627000BA4
      20000FB02D0011A330001B9D3D00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000014D040003A60C0003A0
      0C00039E0C00039E0C00039E0C00AFE5B400FFFFFF0041BF58000FAA2E000EA7
      290012AA340023BC4F001B9D3D00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000001330200027E090003A50C00039E
      0C00039E0C00039E0C00039E0C00ADE5B200FFFFFF0041BF5B000FAA300010A9
      310013AC3C002FBC5D0049C77900138C2A000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000001430300039D0C0003A00C00039E
      0C0016AA200007A01000039E0C00ADE5B200FFFFFF0041C05B0011AB34002DB8
      53001FB44E0030BB600078D99F002BA649000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000002510400039F0C00039F0C00039E
      0C00D5F2D80082D58900039E0C00B4E7BD00FFFFFF003EBF5E004FC67500F4FC
      F700ABE6C1002CBA5D0090E0B10042B863000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000002510400039F0C00029E0A00039D
      0A00E9F8EA00FFFFFF0075D07D00B7E9C500FFFFFF0082D9A000E2F7EA00FFFF
      FF0095DEB00038BD6700A7E7C40046BC66000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000001410300039C0B0003A00B00029D
      0A0048C05200F4FCF600FCFEFC00F7FCF800FCFFFE00FAFEFB00FFFFFF008EDC
      AB001CB24F0050C77A00BDEED40038B454000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000013002000378080003A60C00049E
      0D00039E0F0041BD4B00F3FBF400FFFFFF00FFFFFF00FFFFFF0095DEB0001CB1
      4D0020B452009AE1B60098E1B5001DA435000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000145030004A30D0007A4
      150009A41C0005A0130041BD4E00F0FBF300FFFFFF00A4E3BC001DB24F0016AF
      480066CF8C00D0F4E3004BBF6700000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000001450300036509000AAB
      1F000DAB28000EA92D0011AB340070D39200BAEACC002CBA5C0022B6550068D0
      8E00C5F0D8006ACC88004BBF6700000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000034F0900066B
      110010AC300017B6410018B54A001EB751002ABA5C0044C6740083DDA700AAE7
      C50056C573001399230000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000044F
      0900044F09000D82230017A3410021B151003EBD690054C57A004CBD690021A3
      360021A336000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000035706000357060006680D000874120006780E0006780E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000006780E0006780E000874120006680D0003570600035706000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000021A3
      360021A336004CBD690054C57A003EBD690021B1510017A341000D822300044F
      0900044F09000000000000000000000000000000000000000000000000008000
      0000FF000000FF000000800000008000000080000000C0C0C00080000000FF00
      0000800000008000000000000000000000000000000000000000FEFEFE00B2D3
      B2005BA95B00228C2200057E0500007C0000007C000008800800238D23005AA8
      5A00B4D4B400FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001399230056C5
      7300AAE7C50083DDA70044C674002ABA5C001EB7510018B54A0017B6410010AC
      3000066B1100034F090000000000000000000000000000000000000000000000
      00008000000080000000C0C0C000C0C0C000FFFFFF00C0C0C000808080008000
      00008000000000000000000000000000000000000000DEECDE00389838000082
      000000820000008200000083000000C2000000C1000000820000008200000082
      00000082000035973500D9E9D900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004BBF67006ACC8800C5F0
      D80068D08E0022B655002CBA5C00BAEACC0070D3920011AB34000EA92D000DAB
      28000AAB1F000365090001450300000000000000000000000000000000000000
      0000000000000000000080808000FFFFFF00FFFFFF0080808000000000008000
      000000000000000000000000000000000000E6F0E6001B8C1B00008200000082
      0000008200000083000000D0000000FF000000FF000000BF0000008200000082
      00000082000000820000198B1900E4EFE4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004BBF6700D0F4E30066CF
      8C0016AF48001DB24F00A4E3BC00FFFFFF00F0FBF30041BD4E0005A0130009A4
      1C0007A4150004A30D0001450300000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0
      C0000000000000000000000000000000000066AE660000820000008200000082
      0000008200000085000000E2000000A5000000B1000000F10000008200000082
      00000082000000820000008200005BA95B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001DA4350098E1B5009AE1B60020B4
      52001CB14D0095DEB000FFFFFF00FFFFFF00FFFFFF00F3FBF40041BD4B00039E
      0F00049E0D0003A60C0003780800013002000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000001A891A0000820000008200000082
      000000820000008200000094000000C7000000DC000000EF0000008200000082
      00000082000000820000008200000D820D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000038B45400BDEED40050C77A001CB2
      4F008EDCAB00FFFFFF00FAFEFB00FCFFFE00F7FCF800FCFEFC00F4FCF60048C0
      5200029D0A0003A00B00039C0B00014103000000000000000000000000000000
      000000000000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000001A891A0000820000008200000082
      0000008200000084000000F3000000E9000000DC000000A10000008200000082
      0000008200000082000000820000077F07000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000046BC6600A7E7C40038BD670095DE
      B000FFFFFF00E2F7EA0082D9A000FFFFFF00B7E9C50075D07D00FFFFFF00E9F8
      EA00039D0A00029E0A00039F0C00025104000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000005EAA5E0000820000008200000082
      0000008200000086000000FF000000B0000000A4000000D30000008200000082
      00000082000000820000008200004CA14C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000042B8630090E0B1002CBA5D00ABE6
      C100F4FCF7004FC675003EBF5E00FFFFFF00B4E7BD00039E0C0082D58900D5F2
      D800039E0C00039F0C00039F0C00025104000000000000000000000000000000
      000000000000000000000000000080808000FFFFFF00FFFFFF00C0C0C000FF00
      0000C0C0C000000000000000000000000000DDEBDD0013881300008200000082
      0000008200000084000000EC000000F1000000F1000000DC0000008200000082
      000000820000008200000C860C00D3E5D3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002BA6490078D99F0030BB60001FB4
      4E002DB8530011AB340041C05B00FFFFFF00ADE5B200039E0C0007A0100016AA
      2000039E0C0003A00C00039D0C00014303000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000FFFFFF008080
      80000000000000000000000000000000000000000000D0E5D0001F8D1F000082
      00000082000000820000008E000000DA000000D9000000870000008200000082
      0000008200001F8D1F00C6DFC600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000138C2A0049C779002FBC5D0013AC
      3C0010A931000FAA300041BF5B00FFFFFF00ADE5B200039E0C00039E0C00039E
      0C00039E0C0003A50C00027E0900013302000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000F5F8F50092C4
      9200399839000682060000820000008E0000008F000000820000068106003A99
      3A0095C59500F5F8F50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001B9D3D0023BC4F0012AA
      34000EA729000FAA2E0041BF5800FFFFFF00AFE5B400039E0C00039E0C00039E
      0C0003A00C0003A60C00014D0400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EEF5EE002F952F00008200000082000000820000008200005CA85C00F6F9
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001B9D3D0011A330000FB0
      2D000BA420000CA6270041BF5700FFFFFF00B1E6B600039E0C00039E0C00039F
      0C0003A70C0002690600014D0400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0F6
      F000359835000082000000820000008200000082000000820000008200003497
      3400E2EEE2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000006620F000A99
      1F0009AF1C0006A7160007A5180003A00C0003A00C0003A10C0003A50C0003A7
      0C00026A06000134020000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F3F7F3003B9B
      3B00008200000082000000820000008200000082000000820000008200000082
      0000168A1600C0DCC00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000036B
      0A00036B0A00038C0A00039D0C00039F0C00039F0C0003960A00037B0800024C
      0400024C04000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000091BF910080BB
      800067AB67004DA24D0089BF890075B175000F830F000F830F001C851C00A5CD
      A5007AB87A0054A45400B7D1B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000014603000146030002520500014A040001420300014203000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000000000000000000000000005B7000005B7000005
      B700000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B6000005
      B7000005B7000000000000000000000000000000000000000000000000000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF0000000000000000000000000000000000000000000006D7000005
      BA000005B7000005B700000000000000000000000000000000000005B7000005
      B700000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000005B600000000000005B6000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000005B6000006C7000006C7000006CE000005B400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000006C1000005C1000006DA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B6000006D7000006CE000006DA000006E900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000006E5000006DA000006D30000000000000000000006E5000006EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000006
      F8000006DA000006EF00000000000000000000000000000000000006F8000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      00000000000000000000000000000000000000000000000000000006F6000006
      F6000006F8000000000000000000000000000000000000000000000000000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000840000008400000000000000000000000000FF000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF0000000000000000000000000000000000000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000006F60000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008400000084000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000006F6000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008400000084000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000006F6000006F600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000006780E0006780E000874120006680D0003570600035706000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000142030001420300014A04000252050001460300014603000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1370100AF4101008926
      03000000000000000000000000000000000000000000000000000000000021A3
      360021A336004CBD690054C57A003EBD690021B1510017A341000D822300044F
      0900044F0900000000000000000000000000000000000000000000000000024C
      0400024C0400037B080003960A00039F0C00039F0C00039D0C00038C0A00036B
      0A00036B0A000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000922D0200BF4E0000AC40
      01008926030000000000000000000000000000000000000000001399230056C5
      7300AAE7C50083DDA70044C674002ABA5C001EB7510018B54A0017B6410010AC
      3000066B1100034F09000000000000000000000000000000000001340200026A
      060003A70C0003A50C0003A10C0003A00C0003A00C0007A5180006A7160009AF
      1C000A991F0006620F0000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000952E0200C450
      0000A53A0100872303000000000000000000000000004BBF67006ACC8800C5F0
      D80068D08E0022B655002CBA5C00BAEACC0070D3920011AB34000EA92D000DAB
      28000AAB1F0003650900014503000000000000000000014D04000269060003A7
      0C00039F0C00039E0C00039E0C00B1E6B600FFFFFF0041BF57000CA627000BA4
      20000FB02D0011A330001B9D3D00000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000912D04009D360400972F0200972E
      0100993102009831020098310200993002008E28030000000000000000009D34
      0100C2500000972F02008724030000000000000000004BBF6700D0F4E30066CF
      8C0016AF48001DB24F00A4E3BC00FFFFFF00F0FBF30041BD4E0005A0130009A4
      1C0007A4150004A30D00014503000000000000000000014D040003A60C0003A0
      0C00039E0C00039E0C00039E0C00AFE5B400FFFFFF0041BF58000FAA2E000EA7
      290012AA340023BC4F001B9D3D0000000000000000000000000000000000FF00
      0000FF000000FF00000000000000FF000000FF00000000000000000000000000
      000000000000000000000000000000000000AD470D00EE871F00D1640A00BF4D
      0100BA480000BC4B0000BC4B0000BD4C0000962E020000000000000000000000
      0000A63B0100B84800008B270300882502001DA4350098E1B5009AE1B60020B4
      52001CB14D0095DEB000FFFFFF00FFFFFF00FFFFFF00F3FBF40041BD4B00039E
      0F00049E0D0003A60C00037808000130020001330200027E090003A50C00039E
      0C00039E0C00039E0C00039E0C00ADE5B200FFFFFF0041BF5B000FAA300010A9
      310013AC3C002FBC5D0049C77900138C2A000000000000000000FF000000FF00
      0000FF0000000000000000000000FF000000FF000000FF000000000000000000
      000000000000000000000000000000000000AF4A0F00FE9F3400E67F1E00D065
      0D008F2A01008B2802008F2A02008F2902008B28030000000000000000000000
      00008B280300BC4B00009E3502008424030038B45400BDEED40050C77A001CB2
      4F008EDCAB00FFFFFF00FAFEFB00FCFFFE00F7FCF800FCFEFC00F4FCF60048C0
      5200029D0A0003A00B00039C0B000141030001430300039D0C0003A00C00039E
      0C0016AA200007A01000039E0C00ADE5B200FFFFFF0041C05B0011AB34002DB8
      53001FB44E0030BB600078D99F002BA6490000000000FF000000FF0000000000
      000000000000000000000000000000000000FF000000FF000000FF0000000000
      000000000000000000000000000000000000AF490F00FFA53700B6501200E982
      2000C2590E008622020000000000000000000000000000000000000000000000
      000000000000B0410100AB3F01008624030046BC6600A7E7C40038BD670095DE
      B000FFFFFF00E2F7EA0082D9A000FFFFFF00B7E9C50075D07D00FFFFFF00E9F8
      EA00039D0A00029E0A00039F0C000251040002510400039F0C00039F0C00039E
      0C00D5F2D80082D58900039E0C00B4E7BD00FFFFFF003EBF5E004FC67500F4FC
      F700ABE6C1002CBA5D0090E0B10042B863000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      000000000000000000000000000000000000AF490F00FFAA39009A350700A944
      0D00FC982B00C1580F0086220100000000000000000000000000000000000000
      000000000000AD400100AF4101008725030042B8630090E0B1002CBA5D00ABE6
      C100F4FCF7004FC675003EBF5E00FFFFFF00B4E7BD00039E0C0082D58900D5F2
      D800039E0C00039F0C00039F0C000251040002510400039F0C00029E0A00039D
      0A00E9F8EA00FFFFFF0075D07D00B7E9C500FFFFFF0082D9A000E2F7EA00FFFF
      FF0095DEB00038BD6700A7E7C40046BC66000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      000000000000000000000000000000000000AF490F00FFA93900A13D0A007D19
      000089260300FF9D2D00C95F11008A2702000000000000000000000000000000
      00008A270300BA4A0000A93C0100862503002BA6490078D99F0030BB60001FB4
      4E002DB8530011AB340041C05B00FFFFFF00ADE5B200039E0C0007A0100016AA
      2000039E0C0003A00C00039D0C000143030001410300039C0B0003A00B00029D
      0A0048C05200F4FCF600FCFEFC00F7FCF800FCFFFE00FAFEFB00FFFFFF008EDC
      AB001CB24F0050C77A00BDEED40038B454000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000000000000000000000000000AF490F00FFA93900A13D0A000000
      00000000000089260300FB9C2E00DA731900952D030083200100842302008724
      0300A73C0100C4500000952E020088250200138C2A0049C779002FBC5D0013AC
      3C0010A931000FAA300041BF5B00FFFFFF00ADE5B200039E0C00039E0C00039E
      0C00039E0C0003A50C00027E090001330200013002000378080003A60C00049E
      0D00039E0F0041BD4B00F3FBF400FFFFFF00FFFFFF00FFFFFF0095DEB0001CB1
      4D0020B452009AE1B60098E1B5001DA435000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF0000000000000000000000B14B1000FFB03D00A33F0B000000
      0000000000000000000089260300E3802400EB841F00C2580C00AC410300B444
      0000C14E00009F350100952E020000000000000000001B9D3D0023BC4F0012AA
      34000EA729000FAA2E0041BF5800FFFFFF00AFE5B400039E0C00039E0C00039E
      0C0003A00C0003A60C00014D040000000000000000000145030004A30D0007A4
      150009A41C0005A0130041BD4E00F0FBF300FFFFFF00A4E3BC001DB24F0016AF
      480066CF8C00D0F4E3004BBF6700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00000000000000A33F0B00E2882900993507000000
      000000000000000000000000000089260300AC480D00C45D1100BB500700A63A
      0100912C0200872403000000000000000000000000001B9D3D0011A330000FB0
      2D000BA420000CA6270041BF5700FFFFFF00B1E6B600039E0C00039E0C00039F
      0C0003A70C0002690600014D0400000000000000000001450300036509000AAB
      1F000DAB28000EA92D0011AB340070D39200BAEACC002CBA5C0022B6550068D0
      8E00C5F0D8006ACC88004BBF6700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A33F0B00902B03008A2602000000
      00000000000000000000000000000000000088250200882502008A2703008825
      030088250200000000000000000000000000000000000000000006620F000A99
      1F0009AF1C0006A7160007A5180003A00C0003A00C0003A10C0003A50C0003A7
      0C00026A06000134020000000000000000000000000000000000034F0900066B
      110010AC300017B6410018B54A001EB751002ABA5C0044C6740083DDA700AAE7
      C50056C573001399230000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000036B
      0A00036B0A00038C0A00039D0C00039F0C00039F0C0003960A00037B0800024C
      0400024C0400000000000000000000000000000000000000000000000000044F
      0900044F09000D82230017A3410021B151003EBD690054C57A004CBD690021A3
      360021A336000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000014603000146030002520500014A040001420300014203000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000035706000357060006680D000874120006780E0006780E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000130020001410300025104000251040001430300013302000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000130020001410300025104000251040001430300013302000000
      0000000000000000000000000000000000000000000000000000A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A467690000000000000000000000000098403F00953A
      3A008B343500957D7D00B0B8B700BDBCBB00C0BCBB00BBB8B700B6BBBA00A487
      870080282900812C2C0090373700000000000000000000000000000000000145
      03000145030003780800039C0B00039F0C00039F0C00039D0C00027E0900014D
      0400014D04000000000000000000000000000000000000000000000000000145
      03000145030003780800039C0B00039F0C00039F0C00039D0C00027E0900014D
      0400014D04000000000000000000000000000000000000000000A4676900FEE9
      C700C6CC9300D5CE9600F2D0A000E7CA9100E9C58800EDC18200EBC17F00EBC1
      8000EBC18000F2C78200A46769000000000000000000AA5D5600C14B4B00C54D
      4D00A640410083666600AC8A8900D9C2C000FEF7F200FFFCF800EEF3F000C59F
      9F007E191800811D1D00B14141009C3E3F000000000000000000034F09000365
      090004A30D0003A60C0003A00B00029E0A00039F0C0003A00C0003A50C0003A6
      0C00026906000134020000000000000000000000000000000000034F09000365
      090004A30D0003A60C0003A00B00029E0A00039F0C0003A00C0003A50C0003A6
      0C00026906000134020000000000000000000000000000000000A4676900FCEA
      CE0099C077002D9822006FAC4E0020911600219116005FA13900CAB77000E9BD
      7F00E9BD7F00EFC48100A46769000000000000000000A95D5600BC4A4A00C04C
      4C00A542420087606200862B2B00A45B5A00E0D5D300FCFAF700FEFFFC00CEA7
      A6007E1A1A00811E1E00AF4040009A3E3F0000000000044F0900066B11000AAB
      1F0007A41500049E0D00029D0A00039D0A00039E0C00039E0C00039E0C0003A0
      0C0003A70C00026A0600024C04000000000000000000044F0900066B11000AAB
      1F0007A41500049E0D00029D0A00039D0A00039E0C00039E0C00039E0C0003A0
      0C0003A70C00026A0600024C0400000000000000000000000000A0675B00FEEF
      DA00BFCE9900108C0D000082010000820100008201000082010029921A00DEBB
      7D00E9BD7F00EFC48100A46769000000000000000000A95D5600BC4A4A00C04B
      4C00A5424200926A69008123230083202000BFAAA900EEEBE900FFFFFF00D9B2
      B0007E191900801E1E00AF4040009A3E3F0000000000044F090010AC30000DAB
      280009A41C00039E0F0048C05200E9F8EA00D5F2D80016AA2000039E0C00039E
      0C00039F0C0003A70C00024C04000000000000000000044F090010AC30000DAB
      280009A41C00039E0F0016AA2000D5F2D800E9F8EA0048C05200039E0C00039E
      0C00039F0C0003A70C00024C0400000000000000000000000000A0675B00FFF4
      E500BDD19F00138F0F00008201001B911400A9BD750073AB4D000484030077A9
      4800EABF8100EFC48000A46769000000000000000000A95D5600BC4A4A00C04B
      4B00A44141009E767500882F2F007B1D1D0090828200C9D0CC00F8FFFE00DEBA
      B8007A1818007E1C1C00AD3F3F009A3E3F00035706000D82230017B641000EA9
      2D0005A0130041BD4B00F4FCF600FFFFFF0082D5890007A01000039E0C00039E
      0C00039E0C0003A50C00037B080001420300035706000D82230017B641000EA9
      2D0005A01300049F0D0007A0110082D58900FFFFFF00F4FCF60040BC4A00039E
      0C00039E0C0003A50C00037B0800014203000000000000000000A7756B00FFFB
      F000BCD5A7000A8A0A00008201000486040082B55F00F0D0A900A5B76E006DAD
      4E00EBC28A00EFC58300A46769000000000000000000A95D5600BC4A4A00C14B
      4B00A9414100B2777600B17E7D009F6C6C0095747500A78B8A00D8BBB800D193
      93008C2323008E272700B2424200993D3E000357060017A3410018B54A0011AB
      340041BD4E00F3FBF400FCFEFC0075D07D00039E0C00039E0C00039E0C00039E
      0C00039E0C0003A10C0003960A00014203000357060017A3410018B54A0011AB
      340006A01100039E0C00049F0D00039E0C0074D07D00FCFEFC00F3FBF4003EBC
      4800039E0C0003A10C0003960A00014203000000000000000000A7756B00FFFF
      FC00E1E7D000A4CC900099C6810093C1770099C07700EED4AF00F0D0A7009FC2
      7900EBC79300F2C98C00A46769000000000000000000A95D5600BD4A4B00BC49
      4900BC494900BC484900BD4C4C00BF4C4C00BD494900B8414100BA434300BB46
      4600BD4A4A00BF4B4B00C14D4D00973C3D0006680D0021B151001EB7510070D3
      9200F0FBF300FFFFFF00F7FCF800B7E9C500B4E7BD00ADE5B200ADE5B200AFE5
      B400B1E6B60003A00C00039F0C00014A040006680D0021B151001EB75100BFED
      CF00BAEAC600B7E9C200B8EAC500B5E9C200B7E9C100F6FCF700FFFFFF00EEFA
      EF0054C55E0003A00C00039F0C00014A04000000000000000000BC826800FFFF
      FF00A7D9A400FAEFE600F4E9D5009DC6840095C1770097BF75009FBD7500EACF
      A300EECC9E00F3CE9700A46769000000000000000000AA5E5700A43937009E41
      3D00B66C6A00C58E8B00C9969500C9959300C9969500C98F8E00C9929100C995
      9300CA999700C6848400BF4B4B00973B3C00087412003EBD69002ABA5C00BAEA
      CC00FFFFFF00FFFFFF00FCFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0003A00C00039F0C0002520500087412003EBD69002ABA5C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFEFC00FFFFFF00FFFF
      FF00AAE3B00003A00C00039F0C00025205000000000000000000BC826800FFFF
      FF0074C57500B0D8A900FAEFE60084C1760005860400008201000A890900F3D4
      B000F0D0A600F6D3A000A46769000000000000000000AA5D56009D353300DCBF
      BC00F8F4F400F6F0EF00F7F2F000F7F2F000F7F2F000F7F3F200F7F2F000F7F2
      F000FAFAF800D4ACAB00B4414200983C3D0006780E0054C57A0044C674002CBA
      5C00A4E3BC00FFFFFF00FAFEFB0082D9A0003EBF5E0041C05B0041BF5B0041BF
      580041BF570007A51800039D0C000146030006780E0054C57A0044C6740052C7
      7D0057CA810056CA800057CA810049C5730079D59200FAFEFA00FFFFFF0097DD
      A5001AAD330007A51800039D0C00014603000000000000000000D1926D00FFFF
      FF0081CA8200058605007AC47500AFD4A0001C95180000820100138E0F00F3D9
      B800F4D8B100EBCFA400A46769000000000000000000AA5D56009F373500E5CB
      CA00FBFAF800F4EBEA00F4EDEB00F4EDEB00F4EDEB00F4EDEB00F4EDEB00F3ED
      EB00FAF7F600D4AAA900B2414100983C3D0006780E004CBD690083DDA70022B6
      55001DB24F0095DEB000FFFFFF00E2F7EA004FC6750011AB34000FAA30000FAA
      2E000CA6270006A71600038C0A000146030006780E004CBD690083DDA70022B6
      55001CB24E0022B5540022B5540055CA7F00E1F6E900FFFFFF0088D99D0010AB
      2F000CA6270006A71600038C0A00014603000000000000000000D1926D00FFFF
      FF00F3FAF3002DA12D0000820100008201000082010000820100118E0F00FBEA
      CE00DECEB400B6AA9300A46769000000000000000000AA5D56009F373500E5CB
      C700EBEAEA00CCC9C700CFCBCB00CFCBCB00CFCBCB00CFCBCB00CFCBCB00CCC9
      C900E6E6E500D7ABAA00B1414100983C3D000000000021A33600AAE7C50068D0
      8E0016AF48001CB14D008EDCAB00FFFFFF00F4FCF7002DB8530010A931000EA7
      29000BA4200009AF1C00036B0A00000000000000000021A33600AAE7C50068D0
      8E0016AF48001BB14C0039BF6800F4FCF700FFFFFF0084D99E0011AA32000EA7
      29000BA4200009AF1C00036B0A00000000000000000000000000DA9D7500FFFF
      FF00FFFFFF00DDF2DD0067BF6700249C24002299210075BF6B002D992600956D
      5600A56B5F00A56B5F00A46769000000000000000000AA5D56009F373500E5CB
      C900EFEDED00D4CFCE00D5D0D000D5D0D000D5D0D000D5D0D000D5D0D000D3CF
      CE00E9E9E900D7ABAA00B2414100983C3D000000000021A3360056C57300C5F0
      D80066CF8C0020B452001CB24F0095DEB000ABE6C1001FB44E0013AC3C0012AA
      34000FB02D000A991F00036B0A00000000000000000021A3360056C57300C5F0
      D80066CF8C0020B4520023B55400AAE6C00096DEB10019B1480013AC3C0012AA
      34000FB02D000A991F00036B0A00000000000000000000000000DA9D7500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E1F3E100E0F2DD00FFFEF700ACB692008B6E
      5100E19E5500E68F3100B56D4D000000000000000000AA5D56009F373500E3CB
      C900F2F0EF00DCD5D400DDD8D700DDD8D700DDD8D700DDD8D700DDD8D700DCD5
      D500EEEDEB00D5ABA900B2414100983C3D000000000000000000139923006ACC
      8800D0F4E3009AE1B60050C77A0038BD67002CBA5D0030BB60002FBC5D0023BC
      4F0011A3300006620F0000000000000000000000000000000000139923006ACC
      8800D0F4E3009AE1B60050C77A0038BD67002CBA5D0030BB60002FBC5D0023BC
      4F0011A3300006620F0000000000000000000000000000000000E7AB7900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500A56B
      5F00F8B55C00BF7A5C00000000000000000000000000AA5D56009F373500E5CB
      CA00EDEBEA00CEC9C900CFCCCB00CFCCCB00CFCCCB00CFCCCB00CFCCCB00CCC9
      C900E7E6E500D8ACAB00B2414100983C3D000000000000000000000000004BBF
      67004BBF670098E1B500BDEED400A7E7C40090E0B10078D99F0049C779001B9D
      3D001B9D3D000000000000000000000000000000000000000000000000004BBF
      67004BBF670098E1B500BDEED400A7E7C40090E0B10078D99F0049C779001B9D
      3D001B9D3D000000000000000000000000000000000000000000E7AB7900FBF4
      F000FBF4EF00FAF3EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000A56B
      5F00C1836C0000000000000000000000000000000000AA5D55009F373500E2CA
      C700FEFAFA00F8EFEE00F8EFEE00F8EFEE00F8EFEE00F8EFEE00F8EFEE00F8EF
      EE00FCF8F700D4AAA900B2414100983C3D000000000000000000000000000000
      0000000000001DA4350038B4540046BC660042B863002BA64900138C2A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001DA4350038B4540046BC660042B863002BA64900138C2A000000
      0000000000000000000000000000000000000000000000000000E7AB7900D192
      6D00D1926D00D1926D00D1926D00D1926D00D1926D00D1926D00D1926D00A56B
      5F0000000000000000000000000000000000000000000000000092363300BAA3
      A100C6C9C700C4C0C000C4C0C000C4C0C000C4C0C000C4C0C000C4C0C000C4C0
      C000C6C7C700BC9998008C343500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7918400FEE9
      C700F4DAB500F3D5AA00F2D0A000EFCB9600EFC68B00EDC18200EBC17F00EBC1
      8000EBC18000F2C78200A4676900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7918700FCEA
      CE00F3DABC00F2D5B100F0D0A700EECB9E00EDC79300EDC28B00E9BD8100E9BD
      7F00E9BD7F00EFC48100A4676900000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7938A00FEEF
      DA00F6E0C600F2DABC00F2D5B200EFD0A900EECB9E00EDC79600EBC28C00E9BD
      8200E9BD7F00EFC48100A4676900000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000BA978F00FFF4
      E500F7E5CF00F4E0C500F3DABB00F2D5B100F0D0A600EECB9E00EDC79500EBC2
      8A00EABF8100EFC48000A4676900000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C09E9500FFFB
      F000F8EADC00F6E3CF00F4E0C600F2D9BC00F2D5B100F0D0A900EDCB9E00EDC6
      9500EBC28A00EFC58300A4676900000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBF
      BF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000C6A49A00FFFF
      FC00FAF0E600F8EADA00F7E5CF00F4E0C500F2DABA00F2D5B100F0D0A700EECB
      9D00EBC79300F2C98C00A46769000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF000000000000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FF
      FF00BFBFBF0000FFFF000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000CBA99E00FFFF
      FF00FEF7F200FAEFE600F8EAD900F7E3CF00F6E0C500F2DABB00F2D4B100F0D0
      A700EECC9E00F3CE9700A467690000000000000000007F7F7F000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000CFAC9F00FFFF
      FF00FFFEFC00FCF6F000FAEFE600F7EADA00F6E3CF00F4E0C500F3D9BB00F3D4
      B000F0D0A600F6D3A000A4676900000000007F7F7F000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000D4B0A100FFFF
      FF00FFFFFF00FFFEFC00FEF7F000FAEFE500F8EAD900F7E5CE00F6DEC400F3D9
      B800F4D8B100EBCFA400A4676900000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9B5A100FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FCF7F000FAEFE500F8E9D900F8E7D100FBEA
      CE00DECEB400B6AA9300A4676900000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DDB7A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FCF6EF00FCF3E600EDD8C900B68A
      7B00A17B6F009C766700A4676900000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00000000000000000000000000000000007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000E2BCA500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00AD73
      5B00E19E5500E68F3100B56D4D00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      FF000000000000000000000000000000000000000000000000007F7F7F000000
      00000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E6BFA700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500B882
      6500F8B55C00BF7A5C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E4BCA400FBF4
      F000FBF4EF00FAF3EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000B77F
      6200C1836C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8C4AD00EBCB
      B700EBCBB700EACBB700EACAB600EACAB600EACAB600EACAB600E3C2B100A56B
      5F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF7FFFFFF0000FFFFE3EFFFE00000
      001FE3EF00000000000FC1EF000100000007C1EF800300000003F7EFC0010000
      0001F7EFE00100000000F7EFF01F0000001FF7EFF01F0000001FF7EFE00F0000
      001FF7EFC00700008FF1F78381030000FFF9F78303810000FF75F7C707C10000
      FF8FF7C7FFFF0000FFFFFFEFFFFF0000FFFFFFFF8001FFFF000FDFFB3FF9FFFF
      000F8FFF800983E0000F87F7000983E0000FC7EF800983E0000FE3CF80098080
      000FF19F80098000000FF83F80098000008FFC7F800980001144F83F8009C001
      0AB8F19F8009E083057CC3CF8019E083FAFC87E78001F1C7FDF88FFB8001F1C7
      FE04FFFF800AF1C7FFFFFFFF8005FFFFF81FFC7FFEFFFFFFE007FC7FFEFFFFFF
      C003FC7FFC7FE0038001FC7FFC7FE0038001FC7FF83FE0030000FC7FF83FE003
      0000E00FF01FE0030000E00FF01FE0030000F01FE00FE0030000F01FE00FE003
      0000F83FFC7FE0038001F83FFC7FE0038001FC7FFC7FE007C003FC7FFC7FE00F
      E007FEFFFC7FE01FF81FFEFFFC7FFFFFFFFFFFFFFFFFF81FF007FFFFFFFFE007
      E003C003C007C003F0078001E7E78001F0070000F3F78001F0070000F9F70000
      E0070000FCFF0000C0070000FE7F0000C0030000FF3F0000C0030000FE7F0000
      C0078001FCFF0000E003C003F9F78001F003F00FF3F78001F803E007E7E7C003
      FC07C003C007E007FFFFC001FFFFF81FFFFCFFFFFFFFFFFF9FF9FFFF000FDFFB
      8FF3E003000F8FFF87E7E003000F87F7C3CFE003000FC7EFF11FE003000FE3CF
      F83FE003000FF19FFC7FE003000FF83FF83FE003008FFC7FF19FE0031144F83F
      E3CFE0030AB8F19FC7E7E003057CC3CF8FFBE007FAFC87E71FFFE00FFDF88FFB
      3FFFE01FFE04FFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FF81FFFFFFF8FE007E007
      FDFFFF87C003C003F8FFFFC380018001F0FF006180018001E27F007000000000
      C63F0070000000009F1F03F800000000FF9F01F800000000FFCF00F000000000
      FFE7180000000000FFFB1C0180018001FFFD1E0380018001FFFF1F07C003C003
      FFFFFFFFE007E007FFFFFFFFF81FF81FF81FF81FC001C001E007E007C0018000
      C003C003C001800080018001C001800080018001C001800000000000C0018000
      00000000C001800000000000C001800000000000C001800000000000C0018000
      00000000C001800080018001C001800080018001C0018000C003C003C0038000
      E007E007C0078000F81FF81FC00FC001FFFFFFFFC001FFFFFFFFFFFFC001FFFF
      FFFFFFFFC001F9FFFFFFE007C001F0FFC00FC007C001F0FF8007C007C001E07F
      8003C007C001C07F8001C007C001843F8001C007C0011E3F800FC007C001FE1F
      800FC00FC001FF1F801FE07FC001FF8FC0FFE07FC001FFC7C0FFFFFFC003FFE3
      FFFFFFFFC007FFF8FFFFFFFFC00FFFFF00000000000000000000000000000000
      000000000000}
  end
  object cdsBJTec: TClientDataSet
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
        DataType = ftInteger
        Name = '@id_BJ_Obj'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@TechMode'
        ParamType = ptInput
      end>
    ProviderName = 'dsBJTec'
    RemoteServer = DM.rsCA
    Left = 280
    Top = 56
  end
  object dsBJTree: TDataSource
    DataSet = cdsBJTree
    Left = 72
    Top = 184
  end
  object cdsBJTree: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_BJ_Obj'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@isDeb'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Mode'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Oper'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DateRep'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@M1'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@M2'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@M3'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@M4'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@M5'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@M6'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@M7'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@M8'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@M9'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@M10'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@M11'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@M12'
        ParamType = ptInput
      end>
    ProviderName = 'dsBJTree2'
    RemoteServer = DM.rsCA
    OnCalcFields = cdsBJTreeCalcFields
    Left = 104
    Top = 184
    object cdsBJTreeOrderNum: TIntegerField
      Tag = -26
      FieldName = 'OrderNum'
    end
    object cdsBJTreeisDeb: TBooleanField
      Tag = -26
      FieldName = 'isDeb'
    end
    object cdsBJTreeName: TStringField
      Tag = -26
      FieldName = 'Name'
      Size = 255
    end
    object cdsBJTreeid_Acc: TIntegerField
      Tag = -26
      FieldName = 'id_Acc'
    end
    object cdsBJTreeid_ContrAgent: TIntegerField
      Tag = -26
      FieldName = 'id_ContrAgent'
    end
    object cdsBJTreeid_BJ_Tree: TIntegerField
      Tag = -26
      FieldName = 'id_BJ_Tree'
    end
    object cdsBJTreePID: TIntegerField
      Tag = -26
      FieldName = 'PID'
    end
    object cdsBJTreeid_BJ_Item: TIntegerField
      Tag = -26
      FieldName = 'id_BJ_Item'
    end
    object cdsBJTreeExtID: TIntegerField
      Tag = -26
      FieldName = 'ExtID'
    end
    object cdsBJTreeALevel: TIntegerField
      Tag = -26
      FieldName = 'ALevel'
    end
    object cdsBJTreeisInState: TBooleanField
      Tag = -26
      FieldName = 'isInState'
    end
    object cdsBJTreeBlackList: TIntegerField
      Tag = -26
      FieldName = 'BlackList'
    end
    object cdsBJTreePlanIn: TFloatField
      Tag = -26
      FieldName = 'PlanIn'
    end
    object cdsBJTreePlanDelta1: TFloatField
      DisplayLabel = 'Дельта'
      FieldName = 'PlanDelta1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrect1: TFloatField
      FieldName = 'PlanCorrect1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotal1: TFloatField
      FieldName = 'PlanTotal1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_Pay1: TFloatField
      FieldName = 'S_Pay1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRez1: TFloatField
      FieldName = 'TRez1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRC1: TFloatField
      FieldName = 'PRC1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDelta1: TFloatField
      FieldName = 'Delta1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDelta2: TFloatField
      FieldName = 'PlanDelta2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrect2: TFloatField
      FieldName = 'PlanCorrect2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotal2: TFloatField
      FieldName = 'PlanTotal2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_Pay2: TFloatField
      FieldName = 'S_Pay2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRez2: TFloatField
      FieldName = 'TRez2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRC2: TFloatField
      FieldName = 'PRC2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDelta2: TFloatField
      FieldName = 'Delta2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDelta3: TFloatField
      FieldName = 'PlanDelta3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrect3: TFloatField
      FieldName = 'PlanCorrect3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotal3: TFloatField
      FieldName = 'PlanTotal3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_Pay3: TFloatField
      FieldName = 'S_Pay3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRez3: TFloatField
      FieldName = 'TRez3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRC3: TFloatField
      FieldName = 'PRC3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDelta3: TFloatField
      FieldName = 'Delta3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDeltaQ1: TFloatField
      FieldName = 'PlanDeltaQ1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrectQ1: TFloatField
      FieldName = 'PlanCorrectQ1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotalQ1: TFloatField
      FieldName = 'PlanTotalQ1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_PayQ1: TFloatField
      FieldName = 'S_PayQ1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRezQ1: TFloatField
      FieldName = 'TRezQ1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRCQ1: TFloatField
      FieldName = 'PRCQ1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDeltaQ1: TFloatField
      FieldName = 'DeltaQ1'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDelta4: TFloatField
      FieldName = 'PlanDelta4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrect4: TFloatField
      FieldName = 'PlanCorrect4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotal4: TFloatField
      FieldName = 'PlanTotal4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_Pay4: TFloatField
      FieldName = 'S_Pay4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRez4: TFloatField
      FieldName = 'TRez4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRC4: TFloatField
      FieldName = 'PRC4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDelta4: TFloatField
      FieldName = 'Delta4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDelta5: TFloatField
      FieldName = 'PlanDelta5'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrect5: TFloatField
      FieldName = 'PlanCorrect5'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotal5: TFloatField
      FieldName = 'PlanTotal5'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_Pay5: TFloatField
      FieldName = 'S_Pay5'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRez5: TFloatField
      FieldName = 'TRez5'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRC5: TFloatField
      FieldName = 'PRC5'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDelta5: TFloatField
      FieldName = 'Delta5'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDelta6: TFloatField
      FieldName = 'PlanDelta6'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrect6: TFloatField
      FieldName = 'PlanCorrect6'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotal6: TFloatField
      FieldName = 'PlanTotal6'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_Pay6: TFloatField
      FieldName = 'S_Pay6'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRez6: TFloatField
      FieldName = 'TRez6'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRC6: TFloatField
      FieldName = 'PRC6'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDelta6: TFloatField
      FieldName = 'Delta6'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDeltaQ2: TFloatField
      FieldName = 'PlanDeltaQ2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrectQ2: TFloatField
      FieldName = 'PlanCorrectQ2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotalQ2: TFloatField
      FieldName = 'PlanTotalQ2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_PayQ2: TFloatField
      FieldName = 'S_PayQ2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRezQ2: TFloatField
      FieldName = 'TRezQ2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRCQ2: TFloatField
      FieldName = 'PRCQ2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDeltaQ2: TFloatField
      FieldName = 'DeltaQ2'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDelta7: TFloatField
      FieldName = 'PlanDelta7'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrect7: TFloatField
      FieldName = 'PlanCorrect7'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotal7: TFloatField
      FieldName = 'PlanTotal7'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_Pay7: TFloatField
      FieldName = 'S_Pay7'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRez7: TFloatField
      FieldName = 'TRez7'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRC7: TFloatField
      FieldName = 'PRC7'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDelta7: TFloatField
      FieldName = 'Delta7'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDelta8: TFloatField
      FieldName = 'PlanDelta8'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrect8: TFloatField
      FieldName = 'PlanCorrect8'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotal8: TFloatField
      FieldName = 'PlanTotal8'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_Pay8: TFloatField
      FieldName = 'S_Pay8'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRez8: TFloatField
      FieldName = 'TRez8'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRC8: TFloatField
      FieldName = 'PRC8'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDelta8: TFloatField
      FieldName = 'Delta8'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDelta9: TFloatField
      FieldName = 'PlanDelta9'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrect9: TFloatField
      FieldName = 'PlanCorrect9'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotal9: TFloatField
      FieldName = 'PlanTotal9'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_Pay9: TFloatField
      FieldName = 'S_Pay9'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRez9: TFloatField
      FieldName = 'TRez9'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRC9: TFloatField
      FieldName = 'PRC9'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDelta9: TFloatField
      FieldName = 'Delta9'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDeltaQ3: TFloatField
      FieldName = 'PlanDeltaQ3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrectQ3: TFloatField
      FieldName = 'PlanCorrectQ3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotalQ3: TFloatField
      FieldName = 'PlanTotalQ3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_PayQ3: TFloatField
      FieldName = 'S_PayQ3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRezQ3: TFloatField
      FieldName = 'TRezQ3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRCQ3: TFloatField
      FieldName = 'PRCQ3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDeltaQ3: TFloatField
      FieldName = 'DeltaQ3'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDelta10: TFloatField
      FieldName = 'PlanDelta10'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrect10: TFloatField
      FieldName = 'PlanCorrect10'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotal10: TFloatField
      FieldName = 'PlanTotal10'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_Pay10: TFloatField
      FieldName = 'S_Pay10'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRez10: TFloatField
      FieldName = 'TRez10'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRC10: TFloatField
      FieldName = 'PRC10'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDelta10: TFloatField
      FieldName = 'Delta10'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDelta11: TFloatField
      FieldName = 'PlanDelta11'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrect11: TFloatField
      FieldName = 'PlanCorrect11'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotal11: TFloatField
      FieldName = 'PlanTotal11'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_Pay11: TFloatField
      FieldName = 'S_Pay11'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRez11: TFloatField
      FieldName = 'TRez11'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRC11: TFloatField
      FieldName = 'PRC11'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDelta11: TFloatField
      FieldName = 'Delta11'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDelta12: TFloatField
      FieldName = 'PlanDelta12'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrect12: TFloatField
      FieldName = 'PlanCorrect12'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotal12: TFloatField
      FieldName = 'PlanTotal12'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_Pay12: TFloatField
      FieldName = 'S_Pay12'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRez12: TFloatField
      FieldName = 'TRez12'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRC12: TFloatField
      FieldName = 'PRC12'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDelta12: TFloatField
      FieldName = 'Delta12'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDeltaQ4: TFloatField
      FieldName = 'PlanDeltaQ4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrectQ4: TFloatField
      FieldName = 'PlanCorrectQ4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotalQ4: TFloatField
      FieldName = 'PlanTotalQ4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_PayQ4: TFloatField
      FieldName = 'S_PayQ4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRezQ4: TFloatField
      FieldName = 'TRezQ4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRCQ4: TFloatField
      FieldName = 'PRCQ4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDeltaQ4: TFloatField
      FieldName = 'DeltaQ4'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanDeltaYear: TFloatField
      FieldName = 'PlanDeltaYear'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanCorrectYear: TFloatField
      FieldName = 'PlanCorrectYear'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePlanTotalYear: TFloatField
      FieldName = 'PlanTotalYear'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeS_PayYear: TFloatField
      FieldName = 'S_PayYear'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeTRezYear: TFloatField
      FieldName = 'TRezYear'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreePRCYear: TFloatField
      FieldName = 'PRCYear'
      DisplayFormat = '### ### ### ##0.00'
    end
    object cdsBJTreeDeltaYear: TFloatField
      FieldName = 'DeltaYear'
      DisplayFormat = '### ### ### ##0.00'
    end
  end
  object pmHide: TPopupMenu
    Left = 360
    Top = 112
    object cbNullRow: TMenuItem
      Caption = 'Скрывать пустые строки'
      OnClick = cbNullColClick
    end
    object cbNullCol: TMenuItem
      Caption = 'Скрыть пустые колонки'
      Checked = True
      OnClick = cbNullColClick
    end
    object N40: TMenuItem
      Caption = '-'
    end
    object cbShowPlan: TMenuItem
      Caption = 'Показывать план'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbShowCorrect: TMenuItem
      Caption = 'Показывать корректировку'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbShowPlanTotal: TMenuItem
      Caption = 'Показывать итоговый план'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbShowS_Pay: TMenuItem
      Caption = 'Показывать исполнение'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbShowPRC: TMenuItem
      Caption = 'Показывать процент исполнения'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbShowDelta: TMenuItem
      Caption = 'Показывать отклонение от плана'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbShowTRez: TMenuItem
      Caption = 'Показывать остаток на конец периода'
      Checked = True
      OnClick = cbNullColClick
    end
    object N18: TMenuItem
      Caption = '-'
    end
    object miNonShowFuture: TMenuItem
      Caption = 'Не показывать будущее'
      OnClick = cbNullColClick
    end
    object miToNow: TMenuItem
      Caption = 'С начала года по н.в.'
      Checked = True
      OnClick = cbNullColClick
    end
    object miToClosedPeriod: TMenuItem
      Caption = 'С начала года по конец завершенный период'
      Checked = True
      OnClick = cbNullColClick
    end
    object N41: TMenuItem
      Caption = '-'
      Checked = True
    end
    object cbShowQ1: TMenuItem
      Caption = 'Отображать 1 кв.'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbShowQ2: TMenuItem
      Caption = 'Отображать 2 кв.'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbShowQ3: TMenuItem
      Caption = 'Отображать 3 кв.'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbShowQ4: TMenuItem
      Caption = 'Отображать 4 кв.'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbShowYear: TMenuItem
      Caption = 'Отображать итоги года'
      Checked = True
      OnClick = cbNullColClick
    end
    object N42: TMenuItem
      Caption = '-'
    end
    object cbM1: TMenuItem
      Caption = 'Январь'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbM2: TMenuItem
      Caption = 'Февраль'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbM3: TMenuItem
      Caption = 'Март'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbM4: TMenuItem
      Caption = 'Апрель'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbM5: TMenuItem
      Caption = 'Май'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbM6: TMenuItem
      Caption = 'Июнь'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbM7: TMenuItem
      Caption = 'Июль'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbM8: TMenuItem
      Caption = 'Август'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbM9: TMenuItem
      Caption = 'Сентябрь'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbM10: TMenuItem
      Caption = 'Октябрь'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbM11: TMenuItem
      Caption = 'Ноябрь'
      Checked = True
      OnClick = cbNullColClick
    end
    object cbM12: TMenuItem
      Caption = 'Декабрь'
      Checked = True
      OnClick = cbNullColClick
    end
  end
end
