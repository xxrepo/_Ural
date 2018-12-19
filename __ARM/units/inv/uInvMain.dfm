object InvMain: TInvMain
  Left = 160
  Top = 48
  Width = 1367
  Height = 595
  Caption = 'Заказ'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 527
    Width = 1359
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 3
    object sbViza: TRxSpeedButton
      Left = 16
      Top = 8
      Width = 121
      Height = 25
      DropDownMenu = pmViza
      Caption = 'Завизировать'
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000200001F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C00020002000200001F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C00020002000200001F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0002000200020002000200001F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C00020002000200020002000200001F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C10420002000200001F7C00020002000200001F7C1F7C1F7C
        1F7C1F7C1F7C1042000200001F7C1F7C1F7C1F7C0002000200001F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00020002000200001F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0002000200001F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0002000200001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104200020000
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10420002
        00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        0002000200001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
      Layout = blGlyphLeft
    end
    object btnCancel: TButton
      Left = 1273
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOk: TButton
      Left = 1182
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
    object Button1: TButton
      Left = 232
      Top = 8
      Width = 113
      Height = 25
      Caption = 'пересчитать'
      TabOrder = 2
      Visible = False
      OnClick = Button1Click
    end
    object btn1C: TButton
      Left = 160
      Top = 8
      Width = 137
      Height = 25
      Caption = 'Выгрузить в 1C'
      TabOrder = 3
      OnClick = btn1CClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1359
    Height = 177
    Align = alTop
    Caption = ' '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Заказ'
    end
    object Label6: TLabel
      Left = 269
      Top = 10
      Width = 26
      Height = 13
      Caption = 'Дата'
    end
    object Label7: TLabel
      Left = 8
      Top = 32
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Label20: TLabel
      Left = 8
      Top = 105
      Width = 89
      Height = 13
      Caption = 'Количество план.'
      FocusControl = edAmount1
    end
    object Label21: TLabel
      Left = 356
      Top = 105
      Width = 90
      Height = 13
      Caption = 'Количество факт.'
      FocusControl = DBEdit12
    end
    object Label29: TLabel
      Left = 8
      Top = 56
      Width = 48
      Height = 13
      Caption = 'Заказчик'
    end
    object Label30: TLabel
      Left = 8
      Top = 80
      Width = 63
      Height = 13
      Caption = 'Композиция'
    end
    object Label31: TLabel
      Left = 8
      Top = 130
      Width = 77
      Height = 13
      Caption = 'Проверил план'
      FocusControl = DBEdit15
    end
    object Label32: TLabel
      Left = 357
      Top = 131
      Width = 78
      Height = 13
      Caption = 'Проверил факт'
      FocusControl = DBEdit18
    end
    object Label33: TLabel
      Left = 461
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Линия'
    end
    object DateEdit1: TDBDateEdit
      Left = 310
      Top = 6
      Width = 97
      Height = 21
      DataField = 'PrjDate'
      DataSource = dsInv_Rep
      NumGlyphs = 2
      TabOrder = 1
      OnKeyPress = edName2KeyPress
    end
    object edNum: TDBEdit
      Left = 98
      Top = 6
      Width = 86
      Height = 21
      DataField = 'PrjNum'
      DataSource = dsInv_Rep
      TabOrder = 0
      OnKeyPress = edName2KeyPress
    end
    object edName2: TDBEdit
      Left = 98
      Top = 30
      Width = 670
      Height = 21
      DataField = 'Name'
      DataSource = dsInv_Rep
      TabOrder = 2
      OnKeyPress = edName2KeyPress
    end
    object edAmount1: TDBEdit
      Left = 98
      Top = 102
      Width = 64
      Height = 21
      DataField = 'Amount1'
      DataSource = dsInv_Rep
      TabOrder = 5
    end
    object DBEdit12: TDBEdit
      Left = 453
      Top = 102
      Width = 64
      Height = 21
      DataField = 'Amount2'
      DataSource = dsInv_Rep
      TabOrder = 6
    end
    object Button2: TButton
      Left = 200
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 7
      Visible = False
      OnClick = Button2Click
    end
    object edOwnName: TDBEdit
      Left = 98
      Top = 54
      Width = 647
      Height = 21
      DataField = 'OwnName'
      DataSource = dsInv_Rep
      ReadOnly = True
      TabOrder = 3
      OnKeyPress = edName2KeyPress
    end
    object edKomposit: TDBEdit
      Left = 98
      Top = 78
      Width = 671
      Height = 21
      DataField = 'Komposit'
      DataSource = dsInv_Rep
      TabOrder = 4
      OnKeyPress = edName2KeyPress
    end
    object DBEdit15: TDBEdit
      Left = 98
      Top = 128
      Width = 223
      Height = 21
      Color = 14804712
      DataField = 'FIO'
      DataSource = dsInv_Rep
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit18: TDBEdit
      Left = 453
      Top = 128
      Width = 316
      Height = 21
      Color = 14804712
      DataField = 'FIOFFF'
      DataSource = dsInv_Rep
      ReadOnly = True
      TabOrder = 9
    end
    object btnSelCA2: TBitBtn
      Left = 745
      Top = 54
      Width = 24
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = btnSelCA2Click
    end
    inline fKomp1: TfKomp
      Left = 811
      Top = 39
      Width = 1191
      Height = 72
      TabOrder = 11
      Visible = False
    end
    object cbLineNum: TComboBox
      Left = 501
      Top = 5
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 12
      Items.Strings = (
        'Неопр'
        'Старая'
        'Новая')
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 258
    Width = 1359
    Height = 269
    ActivePage = tsTab
    Align = alClient
    TabOrder = 2
    OnChange = PageControl1Change
    object tsTime: TTabSheet
      Caption = 'Временные затраты'
      ImageIndex = 1
      object grdTime: TDBGridEh
        Left = 0
        Top = 29
        Width = 1351
        Height = 260
        Align = alClient
        AllowedOperations = [alopUpdateEh, alopDeleteEh]
        AllowedSelections = []
        DataGrouping.GroupLevels = <>
        DataSource = DataSource1
        Flat = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clSilver
        FooterFont.Charset = RUSSIAN_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        FooterRowCount = 1
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        RowDetailPanel.Color = clBtnFace
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnGetCellParams = grdTimeGetCellParams
        OnKeyPress = grdTimeKeyPress
        Columns = <
          item
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'LName'
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Линия'
            Title.EndEllipsis = True
            Title.TitleButton = True
            Width = 153
          end
          item
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'Name'
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Действие'
            Title.EndEllipsis = True
            Title.TitleButton = True
            Width = 209
          end
          item
            ButtonStyle = cbsNone
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'ValPlan2'
            Footers = <>
            Title.Caption = 'План|Время (доли часов)'
            Width = 79
          end
          item
            ButtonStyle = cbsNone
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'ValPlan'
            Footers = <>
            ReadOnly = True
            Title.Caption = 'План|Время (часов:минут)'
            Title.EndEllipsis = True
            Title.TitleButton = True
            Width = 86
          end
          item
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'TimePricePlan'
            Footers = <>
            Title.Caption = 'План|Цена часа'
            Width = 72
          end
          item
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'SummPlan'
            Footers = <
              item
                EndEllipsis = True
                ValueType = fvtSum
              end>
            Title.Caption = 'План|Сумма'
            Width = 71
          end
          item
            ButtonStyle = cbsNone
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'Val2'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = 'Факт|Время (доли часов)'
            Width = 85
          end
          item
            ButtonStyle = cbsNone
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'Val'
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Факт|Время (часов:минут)'
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'SummF'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = 'Факт|Сумма'
            Width = 71
          end
          item
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'rrr'
            Footers = <>
            Title.Caption = 'Разница|В часах'
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'rrrPPP'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = 'Разница|Сумма'
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object ToolBar3: TToolBar
        Left = 0
        Top = 0
        Width = 1351
        Height = 29
        ButtonHeight = 25
        Caption = 'ToolBar2'
        TabOrder = 1
        object BitBtn1: TBitBtn
          Left = 0
          Top = 2
          Width = 75
          Height = 25
          Caption = 'В Excel'
          TabOrder = 0
          OnClick = BitBtn1Click
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
    end
    object tsWare: TTabSheet
      Caption = 'Сырьевые затраты'
      ImageIndex = 3
      object grdRaw: TDBGridEh
        Left = 0
        Top = 59
        Width = 1351
        Height = 182
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataGrouping.GroupLevels = <>
        DataSource = dsInvWare
        Flat = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clSilver
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        FooterRowCount = 1
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        RowDetailPanel.Color = clBtnFace
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnEditButtonClick = grdRawEditButtonClick
        OnGetCellParams = grdRawGetCellParams
        OnKeyPress = grdRawKeyPress
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
            EditButtons = <>
            FieldName = 'FPP'
            Footers = <>
            ReadOnly = True
            Title.Caption = 'ФПП'
            Title.Orientation = tohVertical
            Width = 26
          end
          item
            AlwaysShowEditButton = True
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'GName'
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
            FieldName = 'MSName'
            Footer.EndEllipsis = True
            Footers = <>
            ReadOnly = True
            Title.Caption = 'План|Ед. изм'
            Width = 67
          end
          item
            AlwaysShowEditButton = True
            ButtonStyle = cbsNone
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'AmountPlan'
            Footer.EndEllipsis = True
            Footer.ValueType = fvtSum
            Footers = <>
            Increment = 0.01
            Title.Caption = 'План|Кол-во'
          end
          item
            ButtonStyle = cbsNone
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'PricePlan'
            Footer.EndEllipsis = True
            Footers = <>
            Increment = 0.01
            Title.Caption = 'План|Цена'
            Width = 51
          end
          item
            ButtonStyle = cbsNone
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'SummOper2'
            Footer.EndEllipsis = True
            Footer.ValueType = fvtSum
            Footers = <>
            Increment = 0.01
            ReadOnly = True
            Title.Caption = 'План|Сумма'
            Width = 72
          end
          item
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'Amount'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Факт|Кол-во'
          end
          item
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'PriceAvg'
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Факт|Ср. цена'
            Width = 70
          end
          item
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'Summ'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Факт|Сумма'
          end
          item
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'Delta'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Разница'
          end
          item
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'MNName'
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Участок'
            Width = 100
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1351
        Height = 30
        Align = alTop
        Caption = ' '
        TabOrder = 1
        object Label19: TLabel
          Left = 8
          Top = 8
          Width = 42
          Height = 13
          Caption = 'Участок'
        end
        object RxSpeedButton2: TRxSpeedButton
          Left = 701
          Top = 2
          Width = 105
          Height = 25
          DropDownMenu = pmDetRaw
          Caption = 'Детализация'
        end
        object cbMnList: TComboBox
          Left = 56
          Top = 5
          Width = 249
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = cbMnListChange
        end
        object btnGetRaw: TButton
          Left = 320
          Top = 3
          Width = 121
          Height = 25
          Caption = 'Прочитать сырье'
          TabOrder = 1
          Visible = False
          OnClick = btnGetRawClick
        end
        object BitBtn2: TBitBtn
          Left = 456
          Top = 3
          Width = 75
          Height = 25
          Caption = 'В Excel'
          TabOrder = 2
          OnClick = BitBtn2Click
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
        object cbFFF: TComboBox
          Left = 545
          Top = 4
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          OnChange = cbFFFChange
          Items.Strings = (
            'Показывать все'
            'Показывать только план'
            'Показывать только факт')
        end
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 30
        Width = 1351
        Height = 29
        Caption = 'ToolBar1'
        Images = ilImage
        TabOrder = 2
        object ToolButton1: TToolButton
          Left = 0
          Top = 2
          Width = 8
          Caption = 'ToolButton1'
          Style = tbsSeparator
        end
        object ToolButton2: TToolButton
          Left = 8
          Top = 2
          Action = aAddWare
        end
        object ToolButton4: TToolButton
          Left = 31
          Top = 2
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 17
          Style = tbsSeparator
        end
        object ToolButton3: TToolButton
          Left = 39
          Top = 2
          Action = aDelWare
        end
        object ToolButton5: TToolButton
          Left = 62
          Top = 2
          Action = aClearWare
        end
      end
    end
    object tsPred: TTabSheet
      Caption = 'Предварительная себестоимость'
      ImageIndex = 4
      object asgPrev: TAdvColumnGrid
        Left = 0
        Top = 29
        Width = 1351
        Height = 212
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
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnGetCellColor = asgPrevGetCellColor
        OnGetAlignment = asgPrevGetAlignment
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
      end
      object ToolBar4: TToolBar
        Left = 0
        Top = 0
        Width = 1351
        Height = 29
        ButtonHeight = 25
        Caption = 'ToolBar2'
        TabOrder = 1
        object Button4: TButton
          Left = 0
          Top = 2
          Width = 97
          Height = 25
          Caption = 'Пересчитать'
          TabOrder = 1
          OnClick = Button4Click
        end
        object BitBtn3: TBitBtn
          Left = 97
          Top = 2
          Width = 75
          Height = 25
          Caption = 'В Excel'
          TabOrder = 0
          OnClick = BitBtn3Click
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
    end
    object tsTab: TTabSheet
      Caption = 'Фактическая себестоимость'
      object asgInv: TAdvColumnGrid
        Left = 0
        Top = 29
        Width = 1351
        Height = 212
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
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnGetCellColor = asgInvGetCellColor
        OnGetAlignment = asgInvGetAlignment
        OnCanEditCell = asgInvCanEditCell
        OnCellValidate = asgInvCellValidate
        OnGetEditorType = asgInvGetEditorType
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
      end
      object ToolBar2: TToolBar
        Left = 0
        Top = 0
        Width = 1351
        Height = 29
        ButtonHeight = 25
        Caption = 'ToolBar2'
        TabOrder = 1
        object ToolButton6: TToolButton
          Left = 0
          Top = 2
          Width = 5
          Caption = 'ToolButton6'
          Style = tbsSeparator
        end
        object btnCalcInv: TButton
          Left = 5
          Top = 2
          Width = 149
          Height = 25
          Caption = 'Затраты'
          TabOrder = 1
          OnClick = btnCalcInvClick
        end
        object BitBtn4: TBitBtn
          Left = 154
          Top = 2
          Width = 75
          Height = 25
          Caption = 'В Excel'
          TabOrder = 0
          OnClick = BitBtn4Click
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
        object ToolButton7: TToolButton
          Left = 229
          Top = 2
          Width = 8
          Caption = 'ToolButton7'
          ImageIndex = 0
          Style = tbsSeparator
        end
        object RxSpeedButton1: TRxSpeedButton
          Left = 237
          Top = 2
          Width = 101
          Height = 25
          DropDownMenu = pmDet
          Caption = 'Детализация'
        end
        object ToolButton8: TToolButton
          Left = 338
          Top = 2
          Width = 8
          Caption = 'ToolButton8'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object Button6: TButton
          Left = 346
          Top = 2
          Width = 103
          Height = 25
          Caption = 'Обновить тарифы'
          TabOrder = 2
          OnClick = Button6Click
        end
      end
    end
    object tsRez: TTabSheet
      Caption = 'План по затратам'
      ImageIndex = 2
      TabVisible = False
      object Label8: TLabel
        Left = 11
        Top = 10
        Width = 59
        Height = 13
        Caption = 'Количество'
        FocusControl = DBEdit1
      end
      object Label9: TLabel
        Left = 11
        Top = 34
        Width = 79
        Height = 13
        Caption = 'Себестоимость'
        FocusControl = DBEdit2
      end
      object Label10: TLabel
        Left = 11
        Top = 68
        Width = 53
        Height = 13
        Caption = 'С/с клише'
        FocusControl = DBEdit3
      end
      object Label11: TLabel
        Left = 11
        Top = 92
        Width = 141
        Height = 13
        Caption = 'Время на формном участке'
        FocusControl = DBEdit4
      end
      object Label12: TLabel
        Left = 11
        Top = 116
        Width = 127
        Height = 13
        Caption = 'Время на участке печати'
        FocusControl = DBEdit5
      end
      object Label13: TLabel
        Left = 11
        Top = 140
        Width = 173
        Height = 13
        Caption = 'Время на участке ламинирования'
        FocusControl = DBEdit6
      end
      object Label14: TLabel
        Left = 11
        Top = 164
        Width = 123
        Height = 13
        Caption = 'Время на участке резки'
        FocusControl = DBEdit7
      end
      object Label15: TLabel
        Left = 334
        Top = 91
        Width = 151
        Height = 13
        Caption = 'Затраты на формном участке'
        FocusControl = DBEdit8
      end
      object Label16: TLabel
        Left = 334
        Top = 115
        Width = 137
        Height = 13
        Caption = 'Затраты на участке печати'
        FocusControl = DBEdit9
      end
      object Label17: TLabel
        Left = 334
        Top = 139
        Width = 183
        Height = 13
        Caption = 'Затраты на участке ламинирования'
        FocusControl = DBEdit10
      end
      object Label18: TLabel
        Left = 334
        Top = 163
        Width = 133
        Height = 13
        Caption = 'Затраты на участке резки'
        FocusControl = DBEdit11
      end
      object DBEdit1: TDBEdit
        Left = 192
        Top = 6
        Width = 64
        Height = 21
        DataField = 'Amount1'
        DataSource = dsInv_Rep
        TabOrder = 0
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit2: TDBEdit
        Left = 192
        Top = 30
        Width = 64
        Height = 21
        DataField = 'Inv1'
        DataSource = dsInv_Rep
        TabOrder = 1
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit3: TDBEdit
        Left = 192
        Top = 64
        Width = 64
        Height = 21
        DataField = 'Klishe_Inv1'
        DataSource = dsInv_Rep
        TabOrder = 2
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit4: TDBEdit
        Left = 192
        Top = 88
        Width = 112
        Height = 21
        DataField = 'Time_Form1'
        DataSource = dsInv_Rep
        TabOrder = 3
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit5: TDBEdit
        Left = 192
        Top = 112
        Width = 112
        Height = 21
        DataField = 'Time_Print1'
        DataSource = dsInv_Rep
        TabOrder = 4
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit6: TDBEdit
        Left = 192
        Top = 136
        Width = 112
        Height = 21
        DataField = 'Time_Lam1'
        DataSource = dsInv_Rep
        TabOrder = 5
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit7: TDBEdit
        Left = 192
        Top = 160
        Width = 112
        Height = 21
        DataField = 'Time_Rez1'
        DataSource = dsInv_Rep
        TabOrder = 6
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit8: TDBEdit
        Left = 525
        Top = 88
        Width = 64
        Height = 21
        DataField = 'Raw_Form1'
        DataSource = dsInv_Rep
        TabOrder = 7
        OnKeyPress = DBEdit8KeyPress
      end
      object DBEdit9: TDBEdit
        Left = 525
        Top = 112
        Width = 64
        Height = 21
        DataField = 'Raw_Print1'
        DataSource = dsInv_Rep
        TabOrder = 8
        OnKeyPress = DBEdit8KeyPress
      end
      object DBEdit10: TDBEdit
        Left = 525
        Top = 136
        Width = 64
        Height = 21
        DataField = 'Raw_Lam1'
        DataSource = dsInv_Rep
        TabOrder = 9
        OnKeyPress = DBEdit8KeyPress
      end
      object DBEdit11: TDBEdit
        Left = 525
        Top = 160
        Width = 64
        Height = 21
        DataField = 'Raw_Rez1'
        DataSource = dsInv_Rep
        TabOrder = 10
        OnKeyPress = DBEdit8KeyPress
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Комментарий'
      ImageIndex = 5
      object DBMemo1: TDBMemo
        Left = 0
        Top = 0
        Width = 954
        Height = 316
        Align = alClient
        DataField = 'Comment'
        DataSource = dsInv_Rep
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object tsBuh: TTabSheet
      Caption = 'Отчет'
      ImageIndex = 6
      object Splitter1: TSplitter
        Left = 0
        Top = 155
        Width = 1351
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 54
        Width = 1351
        Height = 101
        Align = alTop
        Caption = 'Произведено'
        TabOrder = 0
        object dbgBGP: TRxDBGrid
          Left = 2
          Top = 15
          Width = 950
          Height = 84
          Align = alClient
          DataSource = dsBuh_GP
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'GName'
              Title.Caption = 'Наименование'
              Width = 328
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSName'
              Title.Caption = 'Ед. изм'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DateCreate'
              Title.Caption = 'Дата'
              Width = 137
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Amount'
              Title.Caption = 'Кол-во'
              Visible = True
            end>
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 158
        Width = 1351
        Height = 83
        Align = alClient
        Caption = 'Расход сырья'
        TabOrder = 1
        object dbgB: TRxDBGrid
          Left = 2
          Top = 15
          Width = 950
          Height = 114
          Align = alClient
          DataSource = dsBuh
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'GName'
              Title.Caption = 'Наименование'
              Width = 332
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSName'
              Title.Caption = 'Ед. изм'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Amount'
              Title.Caption = 'Кол-во'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Summ'
              Title.Caption = 'Сумма'
              Width = 84
              Visible = True
            end>
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1351
        Height = 54
        Align = alTop
        Caption = ' '
        TabOrder = 2
        object Label25: TLabel
          Left = 8
          Top = 8
          Width = 114
          Height = 13
          Caption = 'Себестоимость клише'
        end
        object Label26: TLabel
          Left = 8
          Top = 32
          Width = 118
          Height = 13
          Caption = 'Себестоимость пленки'
        end
        object Label27: TLabel
          Left = 217
          Top = 8
          Width = 90
          Height = 13
          Caption = 'Стоимость клише'
        end
        object Label28: TLabel
          Left = 217
          Top = 32
          Width = 94
          Height = 13
          Caption = 'Стоимость пленки'
        end
        object BitBtn5: TBitBtn
          Left = 513
          Top = 15
          Width = 97
          Height = 25
          Caption = 'В Excel'
          TabOrder = 0
          OnClick = BitBtn5Click
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
        object Button5: TButton
          Left = 408
          Top = 15
          Width = 97
          Height = 25
          Caption = 'Пересчитать'
          TabOrder = 1
          OnClick = Button5Click
        end
        object ceKlishe_Inv: TCurrencyEdit
          Left = 130
          Top = 4
          Width = 75
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          ReadOnly = True
          TabOrder = 2
        end
        object cePlenka_Inv: TCurrencyEdit
          Left = 130
          Top = 28
          Width = 75
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          ReadOnly = True
          TabOrder = 3
        end
        object ceKlishe_price: TCurrencyEdit
          Left = 315
          Top = 4
          Width = 75
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          ReadOnly = True
          TabOrder = 4
        end
        object cePlenka_price: TCurrencyEdit
          Left = 315
          Top = 28
          Width = 75
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 177
    Width = 1359
    Height = 81
    Align = alTop
    Caption = ' '
    TabOrder = 1
    Visible = False
    object Label3: TLabel
      Left = 8
      Top = 35
      Width = 53
      Height = 13
      Caption = 'Цена план'
    end
    object Label4: TLabel
      Left = 164
      Top = 35
      Width = 60
      Height = 13
      Caption = 'кол-во план'
    end
    object Label5: TLabel
      Left = 303
      Top = 35
      Width = 34
      Height = 13
      Caption = 'Сумма'
    end
    object Label24: TLabel
      Left = 303
      Top = 59
      Width = 34
      Height = 13
      Caption = 'Сумма'
    end
    object Label23: TLabel
      Left = 164
      Top = 59
      Width = 61
      Height = 13
      Caption = 'кол-во факт'
    end
    object Label22: TLabel
      Left = 8
      Top = 59
      Width = 54
      Height = 13
      Caption = 'Цена факт'
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Пластины'
    end
    object cePrice: TDBEdit
      Left = 78
      Top = 32
      Width = 80
      Height = 21
      AutoSize = False
      DataField = 'Inv1'
      DataSource = dsInv_Rep
      TabOrder = 2
      OnKeyPress = cePriceKeyPress
    end
    object ceAmount: TDBEdit
      Left = 228
      Top = 32
      Width = 65
      Height = 21
      AutoSize = False
      DataField = 'Klishe_Amount'
      DataSource = dsInv_Rep
      TabOrder = 3
      OnKeyPress = cePriceKeyPress
    end
    object ceSumm_old: TDBEdit
      Left = 343
      Top = 32
      Width = 80
      Height = 21
      AutoSize = False
      DataField = 'ceSumm_old'
      DataSource = dsInv_Rep
      ReadOnly = True
      TabOrder = 4
      OnKeyPress = cePriceKeyPress
    end
    object DBEdit15_old: TDBEdit
      Left = 343
      Top = 56
      Width = 80
      Height = 21
      AutoSize = False
      DataField = 'ceSumm2_old'
      DataSource = dsInv_Rep
      ReadOnly = True
      TabOrder = 7
      OnKeyPress = cePriceKeyPress
    end
    object DBEdit14: TDBEdit
      Left = 228
      Top = 56
      Width = 65
      Height = 21
      AutoSize = False
      DataField = 'Klishe_Amount2'
      DataSource = dsInv_Rep
      TabOrder = 6
      OnKeyPress = cePriceKeyPress
    end
    object DBEdit13: TDBEdit
      Left = 78
      Top = 56
      Width = 80
      Height = 21
      AutoSize = False
      DataField = 'Inv2'
      DataSource = dsInv_Rep
      TabOrder = 5
      OnKeyPress = cePriceKeyPress
    end
    object edWare: TDBEdit
      Left = 78
      Top = 8
      Width = 321
      Height = 21
      DataField = 'WNAme'
      DataSource = dsInv_Rep
      ReadOnly = True
      TabOrder = 0
    end
    object Button3: TButton
      Left = 398
      Top = 8
      Width = 25
      Height = 22
      Caption = '...'
      TabOrder = 1
      OnClick = Button3Click
    end
    object DBEdit16: TDBEdit
      Left = 439
      Top = 32
      Width = 80
      Height = 21
      AutoSize = False
      DataField = 'S_PPPPricePlan'
      ReadOnly = True
      TabOrder = 8
      OnKeyPress = cePriceKeyPress
    end
    object DBEdit17: TDBEdit
      Left = 439
      Top = 52
      Width = 80
      Height = 21
      AutoSize = False
      DataField = 'S_PPPPrice'
      ReadOnly = True
      TabOrder = 9
      OnKeyPress = cePriceKeyPress
    end
  end
  object dsInv_Rep: TDataSource
    DataSet = cdsInv_Rep
    Left = 184
    Top = 160
  end
  object cdsInv_Rep: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Project'
        ParamType = ptInput
        Value = 2
      end>
    ProviderName = 'dsPP'
    RemoteServer = DM.rsCA
    AfterPost = cdsInv_RepAfterPost
    OnCalcFields = cdsInv_RepCalcFields
    Left = 128
    Top = 160
    object cdsInv_RepceSumm_old: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'ceSumm_old'
    end
    object cdsInv_Repid_Project: TAutoIncField
      FieldName = 'id_Project'
      ReadOnly = True
    end
    object cdsInv_RepName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsInv_Repid_User: TIntegerField
      FieldName = 'id_User'
    end
    object cdsInv_RepPrjNum: TIntegerField
      FieldName = 'PrjNum'
    end
    object cdsInv_RepPrjDate: TDateTimeField
      FieldName = 'PrjDate'
    end
    object cdsInv_RepDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object cdsInv_Repid_Inv: TIntegerField
      FieldName = 'id_Inv'
    end
    object cdsInv_RepDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsInv_RepAmount1: TFloatField
      FieldName = 'Amount1'
    end
    object cdsInv_RepAmount2: TFloatField
      FieldName = 'Amount2'
    end
    object cdsInv_RepInv1: TFloatField
      FieldName = 'Inv1'
    end
    object cdsInv_RepInv2: TFloatField
      FieldName = 'Inv2'
    end
    object cdsInv_RepPrice: TFloatField
      FieldName = 'Price'
    end
    object cdsInv_RepKlishe_Inv1: TFloatField
      FieldName = 'Klishe_Inv1'
    end
    object cdsInv_RepKlishe_Inv2: TFloatField
      FieldName = 'Klishe_Inv2'
    end
    object cdsInv_RepKlishe_Price: TFloatField
      FieldName = 'Klishe_Price'
    end
    object cdsInv_RepKlishe_Amount: TFloatField
      FieldName = 'Klishe_Amount'
    end
    object cdsInv_RepTime_FormPrice: TFloatField
      FieldName = 'Time_FormPrice'
    end
    object cdsInv_RepTime_Form1: TDateTimeField
      FieldName = 'Time_Form1'
    end
    object cdsInv_RepTime_Form2: TDateTimeField
      FieldName = 'Time_Form2'
    end
    object cdsInv_RepTime_Form_Time: TDateTimeField
      FieldName = 'Time_Form_Time'
    end
    object cdsInv_RepTime_Form_Tuning: TDateTimeField
      FieldName = 'Time_Form_Tuning'
    end
    object cdsInv_RepTime_FormDelta: TDateTimeField
      FieldName = 'Time_FormDelta'
    end
    object cdsInv_RepTime_PrintPrice: TFloatField
      FieldName = 'Time_PrintPrice'
    end
    object cdsInv_RepTime_Print1: TDateTimeField
      FieldName = 'Time_Print1'
    end
    object cdsInv_RepTime_Print2: TDateTimeField
      FieldName = 'Time_Print2'
    end
    object cdsInv_RepTime_Print_Time: TDateTimeField
      FieldName = 'Time_Print_Time'
    end
    object cdsInv_RepTime_Print_Tuning: TDateTimeField
      FieldName = 'Time_Print_Tuning'
    end
    object cdsInv_RepTime_PrintDelta: TDateTimeField
      FieldName = 'Time_PrintDelta'
    end
    object cdsInv_RepTime_LamPrice: TFloatField
      FieldName = 'Time_LamPrice'
    end
    object cdsInv_RepTime_Lam1: TDateTimeField
      FieldName = 'Time_Lam1'
    end
    object cdsInv_RepTime_Lam2: TDateTimeField
      FieldName = 'Time_Lam2'
    end
    object cdsInv_RepTime_Lam_Time: TDateTimeField
      FieldName = 'Time_Lam_Time'
    end
    object cdsInv_RepTime_Lam_Tuning: TDateTimeField
      FieldName = 'Time_Lam_Tuning'
    end
    object cdsInv_RepTime_LamDelta: TDateTimeField
      FieldName = 'Time_LamDelta'
    end
    object cdsInv_RepTime_RezPrice: TFloatField
      FieldName = 'Time_RezPrice'
    end
    object cdsInv_RepTime_Rez1: TDateTimeField
      FieldName = 'Time_Rez1'
    end
    object cdsInv_RepTime_Rez2: TDateTimeField
      FieldName = 'Time_Rez2'
    end
    object cdsInv_RepTime_Rez_Time: TDateTimeField
      FieldName = 'Time_Rez_Time'
    end
    object cdsInv_RepTime_Rez_Tuning: TDateTimeField
      FieldName = 'Time_Rez_Tuning'
    end
    object cdsInv_RepTime_RezDelta: TDateTimeField
      FieldName = 'Time_RezDelta'
    end
    object cdsInv_RepRaw_FormAmount: TFloatField
      FieldName = 'Raw_FormAmount'
    end
    object cdsInv_RepRaw_Form1: TFloatField
      FieldName = 'Raw_Form1'
    end
    object cdsInv_RepRaw_Form2: TFloatField
      FieldName = 'Raw_Form2'
    end
    object cdsInv_RepRaw_FormPriceStat: TFloatField
      FieldName = 'Raw_FormPriceStat'
    end
    object cdsInv_RepRaw_FormDelta: TFloatField
      FieldName = 'Raw_FormDelta'
    end
    object cdsInv_RepRaw_PrintAmount: TFloatField
      FieldName = 'Raw_PrintAmount'
    end
    object cdsInv_RepRaw_Print1: TFloatField
      FieldName = 'Raw_Print1'
    end
    object cdsInv_RepRaw_Print2: TFloatField
      FieldName = 'Raw_Print2'
    end
    object cdsInv_RepRaw_PrintPriceStat: TFloatField
      FieldName = 'Raw_PrintPriceStat'
    end
    object cdsInv_RepRaw_PrintDelta: TFloatField
      FieldName = 'Raw_PrintDelta'
    end
    object cdsInv_RepRaw_LamAmount: TFloatField
      FieldName = 'Raw_LamAmount'
    end
    object cdsInv_RepRaw_Lam1: TFloatField
      FieldName = 'Raw_Lam1'
    end
    object cdsInv_RepRaw_Lam2: TFloatField
      FieldName = 'Raw_Lam2'
    end
    object cdsInv_RepRaw_LamPriceStat: TFloatField
      FieldName = 'Raw_LamPriceStat'
    end
    object cdsInv_RepRaw_LamDelta: TFloatField
      FieldName = 'Raw_LamDelta'
    end
    object cdsInv_RepRaw_RezAmount: TFloatField
      FieldName = 'Raw_RezAmount'
    end
    object cdsInv_RepRaw_Rez1: TFloatField
      FieldName = 'Raw_Rez1'
    end
    object cdsInv_RepRaw_Rez2: TFloatField
      FieldName = 'Raw_Rez2'
    end
    object cdsInv_RepRaw_RezPriceStat: TFloatField
      FieldName = 'Raw_RezPriceStat'
    end
    object cdsInv_RepRaw_RezDelta: TFloatField
      FieldName = 'Raw_RezDelta'
    end
    object cdsInv_Repid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsInv_RepWNAme: TStringField
      FieldName = 'WNAme'
      Size = 255
    end
    object cdsInv_RepCalcDate: TDateTimeField
      FieldName = 'CalcDate'
    end
    object cdsInv_RepCheckDate: TDateTimeField
      FieldName = 'CheckDate'
    end
    object cdsInv_RepID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object cdsInv_RepceSumm2_old: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'ceSumm2_old'
    end
    object cdsInv_RepKlishe_Price2: TFloatField
      FieldName = 'Klishe_Price2'
    end
    object cdsInv_RepKlishe_Amount2: TFloatField
      FieldName = 'Klishe_Amount2'
    end
    object cdsInv_RepLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsInv_Repid_lc: TIntegerField
      FieldName = 'id_lc'
    end
    object cdsInv_RepComment: TStringField
      FieldName = 'Comment'
      Size = 1000
    end
    object cdsInv_RepInv_Prev: TFloatField
      FieldName = 'Inv_Prev'
    end
    object cdsInv_RepInv_Real: TFloatField
      FieldName = 'Inv_Real'
    end
    object cdsInv_RepKL_PRev: TFloatField
      FieldName = 'KL_PRev'
    end
    object cdsInv_RepKL_Real: TFloatField
      FieldName = 'KL_Real'
    end
    object cdsInv_RepKL_Price: TFloatField
      FieldName = 'KL_Price'
    end
    object cdsInv_RepPrice_Real: TFloatField
      FieldName = 'Price_Real'
    end
    object cdsInv_RepKomposit: TStringField
      FieldName = 'Komposit'
      Size = 255
    end
    object cdsInv_RepOwnName: TStringField
      FieldName = 'OwnName'
      Size = 255
    end
    object cdsInv_RepCheckDateFact: TDateTimeField
      FieldName = 'CheckDateFact'
    end
    object cdsInv_RepSendFact: TDateTimeField
      FieldName = 'SendFact'
    end
    object cdsInv_RepxxxDate: TDateTimeField
      FieldName = 'xxxDate'
    end
    object cdsInv_Repid_Checker: TIntegerField
      FieldName = 'id_Checker'
    end
    object cdsInv_Repid_CheckerFFF: TIntegerField
      FieldName = 'id_CheckerFFF'
    end
    object cdsInv_RepFIO: TStringField
      FieldName = 'FIO'
      Size = 152
    end
    object cdsInv_RepFIOFFF: TStringField
      FieldName = 'FIOFFF'
      Size = 152
    end
    object cdsInv_Repid_BSN: TIntegerField
      FieldName = 'id_BSN'
    end
    object cdsInv_RepOLD_PPP: TIntegerField
      FieldName = 'OLD_PPP'
    end
    object cdsInv_RepLineNum: TIntegerField
      FieldName = 'LineNum'
    end
  end
  object cdsTime2: TClientDataSet
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
        Name = '@id_Project'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsTime'
    RemoteServer = DM.rsCA
    OnCalcFields = cdsTime2CalcFields
    Left = 448
    Top = 176
    object cdsTime2id_TimeItem: TAutoIncField
      FieldName = 'id_TimeItem'
      ReadOnly = True
    end
    object cdsTime2Val: TDateTimeField
      FieldName = 'Val'
      OnGetText = cdsTime2ValPlanGetText
      DisplayFormat = 'dd hh:nn'
      EditMask = '!90:00;1; '
    end
    object cdsTime2id_TimeDict: TIntegerField
      FieldName = 'id_TimeDict'
    end
    object cdsTime2id_Project: TIntegerField
      FieldName = 'id_Project'
    end
    object cdsTime2Name: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsTime2LName: TStringField
      FieldName = 'LName'
      Size = 255
    end
    object cdsTime2ValPlan: TDateTimeField
      FieldName = 'ValPlan'
      OnGetText = cdsTime2ValPlanGetText
      DisplayFormat = 'dd hh:nn'
      EditMask = '!99 90:00;1; '
    end
    object cdsTime2Val2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'Val2'
      DisplayFormat = '0.00'
      EditFormat = '0.##'
    end
    object cdsTime2rrr: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'rrr'
      OnGetText = cdsTime2rrrGetText
      DisplayFormat = 'hh:nn'
    end
    object cdsTime2ValPlan2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'ValPlan2'
      DisplayFormat = '0.00'
      EditFormat = '0.##'
    end
    object cdsTime2TimePricePlan: TFloatField
      FieldName = 'TimePricePlan'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object cdsTime2SummPlan: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SummPlan'
      DisplayFormat = '0.00'
    end
    object cdsTime2Val2_2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'Val2_2'
      DisplayFormat = '0.00'
      EditFormat = '0.##'
    end
    object cdsTime2ValPlan2_2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'ValPlan2_2'
      DisplayFormat = '0.00'
      EditFormat = '0.##'
    end
    object cdsTime2id_Lines: TIntegerField
      FieldName = 'id_Lines'
    end
    object cdsTime2rrrPPP: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'rrrPPP'
      DisplayFormat = '0.00'
    end
    object cdsTime2ExtID: TIntegerField
      FieldName = 'ExtID'
    end
    object cdsTime2SummF: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SummF'
      DisplayFormat = '0.00'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsTime2
    Left = 488
    Top = 176
  end
  object cdsInvWare: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Project'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@PrjNum'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_Manufact'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@Mode'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsInvWare'
    RemoteServer = DM.rsCA
    AfterPost = cdsInvWareAfterPost
    OnCalcFields = cdsInvWareCalcFields
    Left = 512
    Top = 256
    object cdsInvWareid_Inv_Ware: TIntegerField
      FieldName = 'id_Inv_Ware'
    end
    object cdsInvWareid_Project: TIntegerField
      FieldName = 'id_Project'
    end
    object cdsInvWareid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsInvWareid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsInvWareid_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object cdsInvWareAmountPlan: TFloatField
      FieldName = 'AmountPlan'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsInvWarePricePlan: TFloatField
      FieldName = 'PricePlan'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsInvWareAmount: TFloatField
      FieldName = 'Amount'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsInvWareSumm: TFloatField
      FieldName = 'Summ'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsInvWareGName: TStringField
      FieldName = 'GName'
      Size = 255
    end
    object cdsInvWareMSName: TStringField
      FieldName = 'MSName'
      Size = 50
    end
    object cdsInvWareMNName: TStringField
      FieldName = 'MNName'
      Size = 50
    end
    object cdsInvWareNumb: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'Numb'
    end
    object cdsInvWareSummOper2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SummOper2'
      DisplayFormat = '#,##0.00'
    end
    object cdsInvWareDelta: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'Delta'
      DisplayFormat = '0.00'
    end
    object cdsInvWarePriceAvg: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PriceAvg'
      DisplayFormat = '0.00'
    end
    object cdsInvWarePLLid_Goods: TIntegerField
      FieldName = 'PLLid_Goods'
    end
    object cdsInvWareFPP: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'FPP'
    end
    object cdsInvWarePPPPrice: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PPPPrice'
    end
    object cdsInvWarePPPPricePlan: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PPPPricePlan'
    end
    object cdsInvWareK_AmountPlan: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'K_AmountPlan'
    end
    object cdsInvWareK_Amount: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'K_Amount'
    end
    object cdsInvWarezzzz_PPPPrice: TAggregateField
      FieldName = 'zzzz_PPPPrice'
      Active = True
      Expression = 'sum(PPPPrice)'
    end
  end
  object dsInvWare: TDataSource
    DataSet = cdsInvWare
    OnDataChange = dsInvWareDataChange
    Left = 552
    Top = 256
  end
  object ilImage: TImageList
    Left = 56
    Top = 176
    Bitmap = {
      494C010121002200040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FF00
      0000FFFFFF00C0C0C00000000000C0C0C0000000FF000000FF000000FF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FF000000FF00
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
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
      0000FFFFFF00C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FF00
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000FFFF000000000000FFFF000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00000000000000000000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF000000FF000000FF000000FF00BFBF
      BF00000000000000000000000000000000000000000000000000FFFFFF008080
      8000C8D0D4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8D0D400FFFF
      FF0080808000C8D0D40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000080800000808000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF00000000000000000000000000000000000000000080800000F8F8F8008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000080800000F8F800008080
      000000000000F8F8F80000000000F8F8F80000000000F8F8F80000000000F8F8
      F800000000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF000000000000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D4008080000080800000808000008080000080800000808000008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000080000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000080800000F8F800008080
      000000000000F8F8F80000000000F8F8F80000000000F8F8F80000000000F8F8
      F800000000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      800000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF00000000000000000000000000000000000000000080800000F8F8F8008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      000000808000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000080800000F8F800000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF0000000000008080000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF000000000000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800C0C0C0008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF00000000000080800000000000000000000000000000000000BFBF
      BF00000000000000000000000000FFFF000000000000FFFF000000000000BFBF
      BF00000000000000000000000000000000000000000080800000F8F800000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF000080800000808000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000080800000F8F8F800F8F8
      0000F8F8F800F8F80000F8F8F800F8F80000F8F8F800F8F80000F8F8F800F8F8
      0000F8F8F8008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000808000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000808000008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF00000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8D0D400FFFF
      FF0080808000C8D0D40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000080000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000FFFFFF008080
      8000C8D0D4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000080000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      00008080000080800000808000000000000000000000000000000000FF000000
      FF0000000000000000007F7F7F00000000007F7F7F00000000000000FF000000
      FF000000FF0000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000080000000FF000000FF0000008000000080000000
      0000000000000000000000000000000000000000000080808000808080008080
      800080808000808080008080800080808000808080000000000080800000FFFF
      0000FFFF0000FFFFFF000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000FF00FFFFFF000000FF0000008000000080000000
      0000000000000000000000000000000000000000000000000000FFFF00008080
      0000808000008080000080800000808000000000000080800000FFFF0000FFFF
      0000FFFFFF00000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF007F7F7F00000000007F7F7F0000000000000000000000
      00000000FF000000FF000000000000000000000000000080800000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000808000000000000000000000000000000000000000
      00000000000000000000000080000000FF000000800000008000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00008080000080800000808000000000000080800000FFFF0000FFFF0000FFFF
      FF00000000008080000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000C8D0D400FFFFFF008080
      8000C8D0D40000FFFF000080800000000000000000000080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000808000000000000080800000FFFF0000FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080800000FFFF0000FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080800000FFFF0000FFFF0000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000800000000000000080000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080800000FFFF0000FFFF0000FFFFFF000000000080800000808080000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000008000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000FFFF0000FFFF0000FFFFFF0000000000FFFF000080800000808000008080
      800000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      000000000000000000000080800000FFFF0000FFFF0000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000008000000080000000
      000000000000000000000000000000000000000000000000000080800000FFFF
      0000FFFF0000FFFFFF00000000000000000000000000FFFF0000808000008080
      000080808000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00808080000000FF000000FF00000080000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000000000000000FF000000
      FF000000FF00000000007F7F7F00000000007F7F7F0000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808080000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000008080
      8000C8D0D4000080800000FFFF0000FFFF0000FFFF0000FFFF00008080000000
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
      0000000000000000000000000000000000000000000080808000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000808080008080800000000000808080008080800080808000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000C0C0C0008080
      00008080000080800000808080008080800080808000C0C0C000808080008080
      0000808000008080800000000000000000000000000000000000000000000000
      0000000000000084000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00C8D0D400FFFF
      FF0080808000C8D0D40000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000808080008080
      0000808000008080000080800000C0C0C00080808000C0C0C000808080008080
      8000808000008080000080808000000000000000000000000000000000000000
      0000008400000084000000840000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000000000FFFFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000000000C0C0C000808000000080
      00008080000080800000808000000000000080808000C0C0C000C0C0C0008080
      8000808000008080000080800000C0C0C0000000000000000000000000000000
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000000FFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000080808000808000008080
      0000808000008080800080808000000000000000000080808000808080008080
      8000808080008080000000800000808080000000000000000000000000000084
      0000008400000084000000840000008400000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000084840000848400008484000084
      84000084840000848400008484000000000000000000FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000084840000848400008484000084
      840000848400008484000084840000000000C0C0C00080800000808080008080
      00008080800000000000000000000000000000000000C0C0C000808080000000
      0000808000008080800080808000808080000000000000000000FFFFFF008080
      8000C8D0D4000084000000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00C8D0D400FFFF
      FF0080808000C8D0D400FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808000008080800080808000000000000000000000000000000000008080
      8000808080008080800080808000808080000000000084848400008400000084
      0000000000000000000000840000008400000084000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C6000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C60000000000000000000000000000000000C0C0C00080808000808080008080
      80008080800080800000C0C0C000000000000000000000000000000000000080
      0000808000008080800080808000808080008484840000840000000000000000
      0000000000000000000000000000008400000084000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000080808000C0C0C000C0C0
      C000808080008080800000000000000000000000000000000000000000008080
      8000808000008080000080800000C0C0C0000000000000000000000000000000
      0000000000000000000000000000008400000084000000840000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF008484840000FF
      000000FF0000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000080808000808080008080
      80008080800080808000C0C0C000000000008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000000000000000
      0000000000000000000000000000000000000000000000000000C8D0D400FFFF
      FF0080808000C8D0D400FFFFFF00FFFFFF00FFFFFF00848484008484840000FF
      000000FF0000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400848484008484
      840000000000000000000000000000000000000000000000000000000000C0C0
      C000808080008080000080800000000000008080800080800000808000008080
      8000808000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808080008080000080800000808080000000000080808000808000008080
      0000808000008080000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000084
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000008400000084000000
      8400000084000000840000008400000000000000000000000000000000008080
      8000C0C0C0008080800080808000808000008080800080800000808000008080
      0000808000000080000080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000000000000000000000000000000000000000000848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      000000FF00000000000000000000000000000000000000000000848484008484
      840084848400848484008484840084848400848484000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000000000000000C0C0
      C00080808000C0C0C000C0C0C000808080000080000080800000808000008080
      0000808080000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000840000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000C0C0C0008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400FFFFFF009CFFFF00009C31009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000000000000000CED6D600000000000000000000000000C8D0D400FFFF
      FF0080808000C8D0D40000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400FFFFFF009CFFFF00009C31009CFFFF00FFFFFF0063630000FFFF
      FF000000000000000000CED6D600000000000000000000000000C8D0D400FFFF
      FF0080808000C8D0D40000000000000000000000000000000000FFFFFF000000
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
      00000000000000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400009C3100009C3100009C3100009C3100009C31009CFFFF00FFFF
      FF000000000000000000CED6D60000000000000000000000000000000000FFFF
      FF0080808000C8D0D40000000000000000000000000000000000FFFFFF000000
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
      00000000000000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400CED6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      000000000000CED6D60000000000CED6D6000000000000000000000000000000
      000080808000C8D0D40000000000000000000000000000000000000000000000
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
      000084848400FFFFFF00FFFFFF00000000000000000000000000FFFFFF008080
      8000C8D0D400FFFF0000FFFF000000000000FFFF0000FF000000000000000000
      000084848400000000000000000000000000000000000000000000000000FFFF
      FF0080808000C8D0D40000000000000000000000000000000000000000000000
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
      FF0000FFFF0000000000FFFFFF000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400FFFF0000FFFF000000000000FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF0000000000000000000000000000000000000000000000FFFF
      FF0080808000C8D0D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
      000084848400FFFFFF00FFFFFF000000000000000000C8D0D400FFFFFF000000
      0000C8D0D4000000FF00FFFF00000000000084848400848484000000FF000000
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0080808000C8D0D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
      0000C8D0D4000000000000000000FFFF000000000000848484000000FF000000
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0080808000C8D0D40000000000000000000000000000000000000000000000
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
      0000C8D0D4000000000000000000000000000084840000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0080808000C8D0D400FFFFFF00000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000008080
      8000C8D0D40000FFFF0000000000000000000084840000FFFF00008484000084
      84000000000000000000000000000000000084848400FFFFFF00C8D0D400FFFF
      FF0080808000C8D0D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
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
      FF0000000000FF00000000000000000000000000000000000000000000008080
      8000C8D0D40000FFFF0000000000000000000084840000FFFF00008484000084
      84000000000000000000000000000000000084848400FFFFFF00C8D0D400FFFF
      FF0080808000C8D0D4000000000000000000000000000000000000000000FFFF
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
      0000C8D0D4000000000000FFFF000000000000FFFF000000000000FFFF008484
      8400000000000000000000000000000000008484840084848400C8D0D400FFFF
      FF0080808000C8D0D400000000000000000084848400FFFFFF00FFFFFF00FFFF
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
      84000084840000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400FFFFFF00FFFFFF00BDBDBD000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0080808000C8D0D40000000000848484004242420042424200000000000000
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
      FF0000FFFF0000FFFF0000FFFF00000000000000000042424200C8D0D400FFFF
      FF0080808000C8D0D40063636300424242006363630063636300D6D6D6006363
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
      840000FFFF0000FFFF00000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D40000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF000000000000FFFF000000000000000000000000000000000000000000FFFF
      FF0080808000C8D0D400B5B5B5006363630094949400C6C6C600949494006363
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
      0000C8D0D40000000000000000000000000000FFFF0000000000000000000000
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
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      8000C8D0D400218C2100007B0000007B0000007B000008840800218C21005AAD
      5A00B5D6B500FFFFFF0000000000000000008484840000FFFF00C8D0D400FFFF
      FF0080808000C8D0D40000FFFF0000FFFF0000FFFF0000FFFF00848484008484
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
      FF00FFFFFF0000FFFF0000000000FFFF0000188C1800C8D0D400FFFFFF008080
      8000C8D0D400008400000094000000C6000000DE000000EF0000008400000084
      0000008400000084000000840000088408008484840000FFFF00C8D0D400FFFF
      FF0080808000C8D0D40000FFFF0000FFFF0000FFFF0000FFFF00848484008484
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
      00000000000000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D40000840000008C000000DE000000DE000000840000008400000084
      000000840000188C1800C6DEC600000000008484840000FFFF00C8D0D400FFFF
      FF0080808000C8D0D4008484840000FFFF0000FFFF0000FFFF0000FFFF008484
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
      00000000FF000000000000000000000000000000000000000000FFFFFF008080
      8000C8D0D4000084000000840000008400000084000000840000008400000084
      0000108C1000C6DEC60000000000000000000000000000000000000000000000
      000080808000C8D0D40084848400848484008484840084848400848484008484
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
  object ActionList1: TActionList
    Images = ilImage
    Left = 52
    Top = 243
    object aAddWare: TAction
      Caption = 'Добавить товар'
      Enabled = False
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
    object aClearWare: TAction
      Caption = 'Очистить'
      Enabled = False
      ImageIndex = 31
      OnExecute = aClearWareExecute
    end
  end
  object pmDet: TPopupMenu
    Left = 244
    Top = 267
    object p1: TMenuItem
      Caption = 'p'
      OnClick = p1Click
    end
  end
  object cdsBuh: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Project'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@PrjNum'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@TM'
        ParamType = ptInput
      end>
    ProviderName = 'dsBuh'
    RemoteServer = DM.rsCA
    Left = 704
    Top = 224
    object cdsBuhid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsBuhId_Ctg_Goods: TIntegerField
      FieldName = 'Id_Ctg_Goods'
    end
    object cdsBuhid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsBuhAmount: TFloatField
      FieldName = 'Amount'
      DisplayFormat = '0.00'
    end
    object cdsBuhSumm: TFloatField
      FieldName = 'Summ'
      DisplayFormat = '0.00'
    end
    object cdsBuhDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object cdsBuhGName: TStringField
      FieldName = 'GName'
      Size = 255
    end
    object cdsBuhMSName: TStringField
      FieldName = 'MSName'
      Size = 255
    end
    object cdsBuhS_ord: TIntegerField
      FieldName = 'S_ord'
    end
  end
  object dsBuh: TDataSource
    DataSet = cdsBuh
    OnDataChange = dsInvWareDataChange
    Left = 744
    Top = 224
  end
  object cdsBuh_GP: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Project'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@PrjNum'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@TM'
        ParamType = ptInput
      end>
    ProviderName = 'dsBuh'
    RemoteServer = DM.rsCA
    Left = 704
    Top = 264
    object IntegerField1: TIntegerField
      FieldName = 'id_Goods'
    end
    object IntegerField2: TIntegerField
      FieldName = 'Id_Ctg_Goods'
    end
    object IntegerField3: TIntegerField
      FieldName = 'id_Measure'
    end
    object FloatField1: TFloatField
      FieldName = 'Amount'
      DisplayFormat = '0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'Summ'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DateCreate'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object StringField1: TStringField
      FieldName = 'GName'
      Size = 255
    end
    object StringField2: TStringField
      FieldName = 'MSName'
      Size = 255
    end
    object IntegerField4: TIntegerField
      FieldName = 'S_ord'
    end
    object cdsBuh_GPTT: TAggregateField
      FieldName = 'TT'
      Active = True
      Expression = 'sum(Amount)'
    end
  end
  object dsBuh_GP: TDataSource
    DataSet = cdsBuh_GP
    OnDataChange = dsInvWareDataChange
    Left = 744
    Top = 264
  end
  object cdsInvWare2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@OPComment'
        ParamType = ptInput
        Value = '22'
      end
      item
        DataType = ftInteger
        Name = '@id_Manufact'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Mode'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsInvWare2'
    RemoteServer = DM.rsCA
    OnCalcFields = cdsTime2CalcFields
    Left = 544
    Top = 56
    object cdsInvWare2id_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsInvWare2id_Manufact_Ext: TIntegerField
      FieldName = 'id_Manufact_Ext'
    end
    object cdsInvWare2AmountOper: TFloatField
      FieldName = 'AmountOper'
      ReadOnly = True
    end
    object cdsInvWare2Name: TStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object pmDetRaw: TPopupMenu
    Left = 812
    Top = 263
  end
  object pmViza: TPopupMenu
    Left = 144
    Top = 535
    object aVisa: TMenuItem
      Caption = 'Завизировать план'
      OnClick = aVisaClick
    end
    object aVisaFact: TMenuItem
      Caption = 'Завизировать факт'
      OnClick = aVisaFactClick
    end
  end
  object cdsInvWare1C: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftSmallint
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftSmallint
        Name = '@id_Project'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftSmallint
        Name = '@PrjNum'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftSmallint
        Name = '@id_Manufact'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftSmallint
        Name = '@Mode'
        ParamType = ptInput
        Value = 126
      end>
    ProviderName = 'dsInvWare'
    RemoteServer = DM.rsCA
    Left = 728
    Top = 16
    object cdsInvWare1Cid_Inv_Ware: TIntegerField
      FieldName = 'id_Inv_Ware'
    end
    object cdsInvWare1Cid_Project: TIntegerField
      FieldName = 'id_Project'
    end
    object cdsInvWare1Cid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsInvWare1Cid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsInvWare1Cid_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object cdsInvWare1CAmountPlan: TFloatField
      FieldName = 'AmountPlan'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsInvWare1CPricePlan: TFloatField
      FieldName = 'PricePlan'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsInvWare1CAmount: TFloatField
      FieldName = 'Amount'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsInvWare1CSumm: TFloatField
      FieldName = 'Summ'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsInvWare1CGName: TStringField
      FieldName = 'GName'
      Size = 255
    end
    object cdsInvWare1CMSName: TStringField
      FieldName = 'MSName'
      Size = 50
    end
    object cdsInvWare1CMNName: TStringField
      FieldName = 'MNName'
      Size = 50
    end
    object cdsInvWare1CNumb: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'Numb'
    end
    object cdsInvWare1CSummOper2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SummOper2'
      DisplayFormat = '#,##0.00'
    end
    object cdsInvWare1CDelta: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'Delta'
      DisplayFormat = '0.00'
    end
    object cdsInvWare1CPriceAvg: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PriceAvg'
      DisplayFormat = '0.00'
    end
    object cdsInvWare1CPLLid_Goods: TIntegerField
      FieldName = 'PLLid_Goods'
    end
    object cdsInvWare1CFPP: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'FPP'
    end
    object cdsInvWare1CPPPPrice: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PPPPrice'
    end
    object cdsInvWare1CPPPPricePlan: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PPPPricePlan'
    end
    object cdsInvWare1CK_AmountPlan: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'K_AmountPlan'
    end
    object cdsInvWare1CK_Amount: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'K_Amount'
    end
    object cdsInvWare1Czzzz_PPPPrice: TAggregateField
      FieldName = 'zzzz_PPPPrice'
      Active = True
      Expression = 'sum(PPPPrice)'
    end
  end
end
