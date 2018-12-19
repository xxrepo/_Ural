object CA_W_Det: TCA_W_Det
  Left = 173
  Top = 209
  Width = 837
  Height = 521
  BorderIcons = [biSystemMenu, biMaximize]
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 453
    Width = 829
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 743
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 829
    Height = 57
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Button1: TButton
      Left = 328
      Top = 14
      Width = 131
      Height = 33
      Caption = 'Перечитать'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 310
      Height = 55
      Align = alLeft
      Caption = ' '
      TabOrder = 1
      inline fBsnSelector1: TfBsnSelector
        Left = 1
        Top = 1
        Width = 308
        Height = 33
        Align = alTop
        inherited edName: TEdit
          Width = 222
        end
        inherited Button1: TButton
          Left = 277
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 34
        Width = 308
        Height = 20
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
        object Label2: TLabel
          Left = 8
          Top = 35
          Width = 26
          Height = 13
          Caption = 'Дата'
          Visible = False
        end
        object Label3: TLabel
          Left = 168
          Top = 35
          Width = 33
          Height = 13
          Caption = 'Время'
          Visible = False
        end
        object Label4: TLabel
          Left = 168
          Top = 6
          Width = 33
          Height = 13
          Caption = 'Время'
          Visible = False
        end
        object Label5: TLabel
          Left = 8
          Top = 5
          Width = 35
          Height = 13
          Caption = 'Дата c'
          Visible = False
        end
        object dtTo: TDateTimePicker
          Left = 56
          Top = 31
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
          TabOrder = 2
          Visible = False
          OnChange = dtToChange
        end
        object dtTimeTo: TDateTimePicker
          Left = 203
          Top = 31
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
          TabOrder = 3
          Visible = False
        end
        object dtDFrom: TDateTimePicker
          Left = 56
          Top = 2
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
          TabOrder = 0
          Visible = False
          OnChange = dtDFromChange
        end
        object dtTFrom: TDateTimePicker
          Left = 203
          Top = 2
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
          TabOrder = 1
          Visible = False
        end
      end
    end
  end
  object RxDBGrid1: TDBGridEh
    Left = 0
    Top = 127
    Width = 829
    Height = 326
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = dsArc
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghColumnResize, dghColumnMove]
    ParentFont = False
    ReadOnly = True
    RowDetailPanel.Color = clBtnFace
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = RxDBGrid1DblClick
    OnDrawColumnCell = RxDBGrid1DrawColumnCell
    Columns = <
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'OperState'
        Footers = <>
        Title.Caption = 'Виза'
        Title.EndEllipsis = True
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 21
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'OperVidName'
        Footers = <>
        Title.Caption = 'Тип'
        Title.EndEllipsis = True
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 22
      end
      item
        EditButtons = <>
        FieldName = 'AutoGen'
        Footers = <>
        Title.Caption = 'Автомат.'
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 23
      end
      item
        EditButtons = <>
        FieldName = 'WareProff'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Товары|Прибыль'
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'WareLoss'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Товары|Затраты'
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'FinProff'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Финансы|Прибыль'
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'FinLoss'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Финансы|Затраты'
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'OffProff'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Зачеты|Прибыль'
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'OffLoss'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Зачеты|Затраты'
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'CurProff'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Курсовые|Прибыль'
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'CurLoss'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Курсовые|Затраты'
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'OperNum'
        Footers = <>
        Title.Caption = 'Номер'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 116
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'TypeName'
        Footers = <>
        Title.Caption = 'Приход/ Расход'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 62
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'DateCreate'
        Footers = <>
        Title.Caption = 'Дата/время создания'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 101
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'OnlyDate'
        Footers = <>
        Title.Caption = 'Дата создания'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 110
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Correct'
        Footers = <>
        Title.Caption = 'Корр.'
        Title.EndEllipsis = True
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 30
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'WareName'
        Footers = <>
        Title.Caption = 'Наименование товара/услуги'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 148
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'AmountOper'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Количество|Кол-во'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 63
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'MeasureName'
        Footers = <>
        Title.Caption = 'Количество|Ед. изм.'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 57
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'PriceOper'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Сумма|Цена'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 53
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'SummOper'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Сумма|Сумма'
        Title.EndEllipsis = True
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'SummOperIn'
        Footers = <>
        Title.Caption = 'Сумма|Приход'
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'SummOperOut'
        Footers = <>
        Title.Caption = 'Сумма|Расход'
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'CurrencyOperShortName'
        Footers = <>
        Title.Caption = 'Сумма|Валюта'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 53
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'PriceInv'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Себестоимость|Себест. ед.'
        Title.EndEllipsis = True
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'CRN_OperSum_Inv'
        Footers = <>
        Title.Caption = 'Себестоимость|Сумма'
        Title.EndEllipsis = True
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'CurrencyInvShortName'
        Footers = <>
        Title.Caption = 'Себестоимость|Валюта'
        Title.EndEllipsis = True
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'SummSys'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Зачтено|Cумма'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'SummSysIn'
        Footers = <>
        Title.Caption = 'Зачтено|Приход'
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'SummSysOut'
        Footers = <>
        Title.Caption = 'Зачтено|Расход'
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'CurrencySysShortName'
        Footers = <>
        Title.Caption = 'Зачтено|Валюта'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 62
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'SrcName'
        Footers = <>
        Title.Caption = 'Участники|Свой объект'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'ReprName'
        Footers = <>
        Title.Caption = 'Участники|Чужой объект'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'ContrAgentName'
        Footers = <>
        Title.Caption = 'Участники|Контрагент'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 106
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'OperDeltaCrn'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Прибыль|По операции'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 85
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'OperRateDeltaCrn'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Прибыль|Курсовая'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 76
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'OperTotalDeltaCrn'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Прибыль|Итого'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'Rent'
        Footers = <>
        Title.Caption = 'Прибыль|Рентабельность (%)'
        Title.TitleButton = True
        Width = 91
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'CurrencyBsnName'
        Footers = <>
        Title.Caption = 'Прибыль|Валюта'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 63
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'OperSumCalced'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'В валюте бизнеса|Сумма'
        Title.EndEllipsis = True
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'OperSum_OfferCalced'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'В валюте бизнеса|Зачтено'
        Title.EndEllipsis = True
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'CRN_OperSumRez'
        Footers = <>
        Title.Caption = 'В валюте бизнеса|Итого'
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'CurrencyBsnName'
        Footers = <>
        Title.Caption = 'В валюте бизнеса|Валюта'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 87
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'BusinessName'
        Footers = <>
        Title.Caption = 'Бизнес'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 103
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'KoeffName'
        Footers = <>
        Title.Caption = 'Суть'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 110
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'FormalDistribName'
        Footers = <>
        Title.Caption = 'Распределение|Формальное'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'FuncDistribName'
        Footers = <>
        Title.Caption = 'Распределение|Функциональное'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'CreatorFIO'
        Footers = <>
        Title.Caption = 'Создал'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'CheckerFIO'
        Footers = <>
        Title.Caption = 'Проверка|Проверил'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 127
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'CheckDate'
        Footers = <>
        Title.Caption = 'Проверка|Дата'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 82
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Imp_PayBasic'
        Footers = <>
        Title.Caption = 'Документ|Осн. платежа/накладная'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 115
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'AccInv_PayAssignment'
        Footers = <>
        Title.Caption = 'Документ|Пл. поручение/Счет фактура'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 115
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Contract'
        Footers = <>
        Title.Caption = 'Документ|Договор'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 115
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'OperTypeSIGN'
        Footers = <>
        Title.Caption = 'Бюджет|Знак'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'OperSumCalced'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Бюджет|Сумма'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'OperSum_OfferCalced'
        Footer.EndEllipsis = True
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Бюджет|Зачтено'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'CRN_OperSumRez'
        Footers = <>
        Title.Caption = 'Бюджет|Итого'
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'CurrencyBsnName'
        Footers = <>
        Title.Caption = 'Бюджет|Валюта'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'OpComment'
        Footers = <>
        Title.Caption = 'Комментарий'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 120
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str1'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 1'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str2'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 2'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str3'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 3'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str4'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 4'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str5'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 5'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str6'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 6'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str7'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 7'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str8'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 8'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str9'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 9'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str10'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 10'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str11'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 11'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str12'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 12'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str13'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 13'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str14'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 14'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Str15'
        Footers = <>
        Title.Caption = 'Бюджет|Строка 15'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig1'
        Footers = <>
        Title.Caption = 'Бюджет|Число 1'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig2'
        Footers = <>
        Title.Caption = 'Бюджет|Число 2'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig3'
        Footers = <>
        Title.Caption = 'Бюджет|Число 3'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig4'
        Footers = <>
        Title.Caption = 'Бюджет|Число 4'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig5'
        Footers = <>
        Title.Caption = 'Бюджет|Число 5'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig6'
        Footers = <>
        Title.Caption = 'Бюджет|Число 6'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig7'
        Footers = <>
        Title.Caption = 'Бюджет|Число 7'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig8'
        Footers = <>
        Title.Caption = 'Бюджет|Число 8'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig9'
        Footers = <>
        Title.Caption = 'Бюджет|Число 9'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig10'
        Footers = <>
        Title.Caption = 'Бюджет|Число 10'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig11'
        Footers = <>
        Title.Caption = 'Бюджет|Число 11'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig12'
        Footers = <>
        Title.Caption = 'Бюджет|Число 12'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig13'
        Footers = <>
        Title.Caption = 'Бюджет|Число 13'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig14'
        Footers = <>
        Title.Caption = 'Бюджет|Число 14'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'Dig15'
        Footers = <>
        Title.Caption = 'Бюджет|Число 15'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Visible = False
        Width = 60
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 98
    Width = 829
    Height = 29
    ButtonHeight = 25
    Caption = 'ToolBar2'
    TabOrder = 3
    object ToolButton3: TToolButton
      Left = 0
      Top = 2
      Width = 1
      Caption = 'ToolButton3'
      Style = tbsSeparator
    end
    object EhGridFilter1: TEhGridFilter
      Left = 1
      Top = 2
      Width = 70
      Height = 25
      DisableFieldType = [dsbNumeric]
      Caption = 'Фильтр'
      DBGrid = RxDBGrid1
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 57
    Width = 829
    Height = 41
    ButtonHeight = 36
    ButtonWidth = 62
    Caption = 'ToolBar1'
    Images = ilImage
    ShowCaptions = True
    TabOrder = 4
    object ToolButton8: TToolButton
      Left = 0
      Top = 2
      Width = 4
      Caption = 'ToolButton8'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object RxSpeedButton4: TRxSpeedButton
      Left = 4
      Top = 2
      Width = 70
      Height = 36
      Action = aNewCopyOper2
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
        00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF000000FF00
        0000FF000000FF000000FF000000FFFFFF0000000000FF00FF00000000000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FF000000FF00
        0000FF000000FF000000FF000000FFFFFF0000000000FF00FF0000000000FFFF
        FF008400000084000000840000008400000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FF000000FF00
        0000FFFFFF0000000000000000000000000000000000FF00FF0000000000FFFF
        FF008400000084000000840000008400000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF000000000000000000FF00FF00FF00FF00FF00FF0000000000FFFF
        FF008400000084000000FFFFFF00000000000000000000000000000000000000
        00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object ToolButton2: TToolButton
      Left = 74
      Top = 2
      Action = aProperty
    end
    object sep1: TToolButton
      Left = 136
      Top = 2
      Width = 7
      Caption = 'sep1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 143
      Top = 2
      Action = aDelete
    end
    object sep2: TToolButton
      Left = 205
      Top = 2
      Width = 4
      Caption = 'sep2'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 209
      Top = 2
      Action = aRefreshe
      Visible = False
    end
    object sep3: TToolButton
      Left = 271
      Top = 2
      Width = 8
      Caption = 'sep3'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 279
      Top = 2
      Action = aGreedToExcel
    end
    object ToolButton5: TToolButton
      Left = 341
      Top = 2
      Width = 5
      Caption = 'ToolButton5'
      ImageIndex = 32
      Style = tbsSeparator
    end
    object RxSpeedButton3: TRxSpeedButton
      Left = 346
      Top = 2
      Width = 60
      Height = 36
      Action = aShowArcAnaliz
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF000000FF000000FF00FF00000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        0000FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
        FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        0000FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        0000FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
        FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
        FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000
        FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
        0000FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
        FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
        0000FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF000000
        FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        0000FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF000000FF000000FF00FF00000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object ToolButton12: TToolButton
      Left = 406
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 36
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 414
      Top = 2
      Action = aSettings
    end
    object BitBtn1: TBitBtn
      Left = 476
      Top = 2
      Width = 80
      Height = 36
      Caption = 'ГЕНЕРАЦИЯ'
      TabOrder = 0
      Visible = False
    end
  end
  object cdsPrfLoss: TClientDataSet
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
        Name = '@Date'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Oper'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_ContrAgent'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Goods'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@NeedOperData'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@WareProff'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@WareLoss'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@FinProff'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@FinLoss'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@OffProff'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@OffLoss'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@CurProff'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@CurLoss'
        ParamType = ptInput
      end>
    ProviderName = 'dsPrfLoss'
    RemoteServer = DM.rsCA
    Left = 392
    Top = 296
    object cdsPrfLossid_Oper2: TIntegerField
      FieldName = 'id_Oper2'
    end
    object cdsPrfLossid_OperWare2: TIntegerField
      FieldName = 'id_OperWare2'
    end
    object cdsPrfLossWareProff: TFloatField
      FieldName = 'WareProff'
      DisplayFormat = '0.00'
    end
    object cdsPrfLossWareLoss: TFloatField
      FieldName = 'WareLoss'
      DisplayFormat = '0.00'
    end
    object cdsPrfLossFinProff: TFloatField
      FieldName = 'FinProff'
      DisplayFormat = '0.00'
    end
    object cdsPrfLossFinLoss: TFloatField
      FieldName = 'FinLoss'
      DisplayFormat = '0.00'
    end
    object cdsPrfLossOffProff: TFloatField
      FieldName = 'OffProff'
      DisplayFormat = '0.00'
    end
    object cdsPrfLossOffLoss: TFloatField
      FieldName = 'OffLoss'
      DisplayFormat = '0.00'
    end
    object cdsPrfLossCurProff: TFloatField
      FieldName = 'CurProff'
      DisplayFormat = '0.00'
    end
    object cdsPrfLossCurLoss: TFloatField
      FieldName = 'CurLoss'
      DisplayFormat = '0.00'
    end
    object cdsPrfLossInvSumm: TFloatField
      FieldName = 'InvSumm'
      DisplayFormat = '0.00'
    end
    object cdsPrfLossRealWareProff: TFloatField
      FieldName = 'RealWareProff'
      DisplayFormat = '0.00'
    end
    object cdsPrfLossid_Oper: TAutoIncField
      FieldName = 'id_Oper'
      ReadOnly = True
    end
    object cdsPrfLossid_OperParent: TIntegerField
      FieldName = 'id_OperParent'
    end
    object cdsPrfLossid_old_Oper: TIntegerField
      FieldName = 'id_old_Oper'
    end
    object cdsPrfLossDateCreate: TDateTimeField
      FieldName = 'DateCreate'
      ReadOnly = True
    end
    object cdsPrfLossid_LC_Oper: TIntegerField
      FieldName = 'id_LC_Oper'
    end
    object cdsPrfLossOperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object cdsPrfLossid_Replicator: TIntegerField
      FieldName = 'id_Replicator'
    end
    object cdsPrfLossReplicatorShortName: TStringField
      FieldName = 'ReplicatorShortName'
      Size = 5
    end
    object cdsPrfLossid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsPrfLossid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsPrfLossId_CurrencyBsn: TIntegerField
      FieldName = 'Id_CurrencyBsn'
    end
    object cdsPrfLossBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsPrfLossBusinessNum: TStringField
      FieldName = 'BusinessNum'
      Size = 5
    end
    object cdsPrfLossDateLocal: TDateTimeField
      FieldName = 'DateLocal'
    end
    object cdsPrfLossCorrect: TBooleanField
      FieldName = 'Correct'
    end
    object cdsPrfLossOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsPrfLossId_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object cdsPrfLossCurrencyOperName: TStringField
      FieldName = 'CurrencyOperName'
      Size = 30
    end
    object cdsPrfLossCurrencyOperShortName: TStringField
      FieldName = 'CurrencyOperShortName'
      Size = 10
    end
    object cdsPrfLossAmountOper: TFloatField
      FieldName = 'AmountOper'
      ReadOnly = True
    end
    object cdsPrfLossAmountOper2: TFloatField
      FieldName = 'AmountOper2'
      ReadOnly = True
    end
    object cdsPrfLossPriceOper: TFloatField
      FieldName = 'PriceOper'
      ReadOnly = True
    end
    object cdsPrfLossRateOper: TFloatField
      FieldName = 'RateOper'
    end
    object cdsPrfLossid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsPrfLossMeasureName: TStringField
      FieldName = 'MeasureName'
      ReadOnly = True
      Size = 10
    end
    object cdsPrfLossRealKoef: TFloatField
      FieldName = 'RealKoef'
      ReadOnly = True
    end
    object cdsPrfLossAmountOperBaseMS: TFloatField
      FieldName = 'AmountOperBaseMS'
      ReadOnly = True
    end
    object cdsPrfLossId_CurrencySys: TIntegerField
      FieldName = 'Id_CurrencySys'
    end
    object cdsPrfLossCurrencySysName: TStringField
      FieldName = 'CurrencySysName'
      Size = 30
    end
    object cdsPrfLossCurrencySysShortName: TStringField
      FieldName = 'CurrencySysShortName'
      Size = 10
    end
    object cdsPrfLossSummSys: TFloatField
      FieldName = 'SummSys'
      ReadOnly = True
    end
    object cdsPrfLossRateSys: TFloatField
      FieldName = 'RateSys'
    end
    object cdsPrfLossid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsPrfLossid_Warehouse: TIntegerField
      FieldName = 'id_Warehouse'
    end
    object cdsPrfLossid_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object cdsPrfLossSrcName: TStringField
      FieldName = 'SrcName'
      ReadOnly = True
      Size = 50
    end
    object cdsPrfLossSrcID_Main: TIntegerField
      FieldName = 'SrcID_Main'
      ReadOnly = True
    end
    object cdsPrfLossid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsPrfLossid_Acc_Ext: TIntegerField
      FieldName = 'id_Acc_Ext'
    end
    object cdsPrfLossid_Warehouse_Ext: TIntegerField
      FieldName = 'id_Warehouse_Ext'
    end
    object cdsPrfLossid_Manufact_Ext: TIntegerField
      FieldName = 'id_Manufact_Ext'
    end
    object cdsPrfLossReprName: TStringField
      FieldName = 'ReprName'
      ReadOnly = True
      Size = 255
    end
    object cdsPrfLossReprID_Main: TIntegerField
      FieldName = 'ReprID_Main'
      ReadOnly = True
    end
    object cdsPrfLossId_CurrencyInv: TIntegerField
      FieldName = 'Id_CurrencyInv'
    end
    object cdsPrfLossPriceInv: TFloatField
      FieldName = 'PriceInv'
    end
    object cdsPrfLossRateInv: TFloatField
      FieldName = 'RateInv'
    end
    object cdsPrfLossCurrencyInvName: TStringField
      FieldName = 'CurrencyInvName'
      ReadOnly = True
      Size = 30
    end
    object cdsPrfLossCurrencyInvShortName: TStringField
      FieldName = 'CurrencyInvShortName'
      ReadOnly = True
      Size = 30
    end
    object cdsPrfLossid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsPrfLossWareName: TStringField
      FieldName = 'WareName'
      Size = 255
    end
    object cdsPrfLossWareID_Main: TIntegerField
      FieldName = 'WareID_Main'
    end
    object cdsPrfLossKoeff: TIntegerField
      FieldName = 'Koeff'
    end
    object cdsPrfLossKoeffName: TStringField
      FieldName = 'KoeffName'
      ReadOnly = True
      Size = 50
    end
    object cdsPrfLossCheckDate: TDateTimeField
      FieldName = 'CheckDate'
      ReadOnly = True
    end
    object cdsPrfLossid_UserChecker: TIntegerField
      FieldName = 'id_UserChecker'
      ReadOnly = True
    end
    object cdsPrfLossid_FormalDistrib: TIntegerField
      FieldName = 'id_FormalDistrib'
    end
    object cdsPrfLossFormalDistribName: TStringField
      FieldName = 'FormalDistribName'
      Size = 50
    end
    object cdsPrfLossid_FuncDistrib: TIntegerField
      FieldName = 'id_FuncDistrib'
    end
    object cdsPrfLossFuncDistribName: TStringField
      FieldName = 'FuncDistribName'
      Size = 50
    end
    object cdsPrfLossDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsPrfLossid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
      ReadOnly = True
    end
    object cdsPrfLossContrAgentName: TStringField
      FieldName = 'ContrAgentName'
      ReadOnly = True
      Size = 50
    end
    object cdsPrfLossid_CAGroup: TIntegerField
      FieldName = 'id_CAGroup'
    end
    object cdsPrfLossSummOper: TFloatField
      FieldName = 'SummOper'
      ReadOnly = True
    end
    object cdsPrfLossTypeName: TStringField
      FieldName = 'TypeName'
      ReadOnly = True
      Size = 30
    end
    object cdsPrfLossOperNum: TStringField
      FieldName = 'OperNum'
      ReadOnly = True
      Size = 255
    end
    object cdsPrfLossOperDelta: TFloatField
      FieldName = 'OperDelta'
      ReadOnly = True
    end
    object cdsPrfLossOperRateDelta: TFloatField
      FieldName = 'OperRateDelta'
      ReadOnly = True
    end
    object cdsPrfLossOperTotalDelta: TFloatField
      FieldName = 'OperTotalDelta'
      ReadOnly = True
    end
    object cdsPrfLossDTDiff: TIntegerField
      FieldName = 'DTDiff'
      ReadOnly = True
    end
    object cdsPrfLossHasViza: TBooleanField
      FieldName = 'HasViza'
      ReadOnly = True
    end
    object cdsPrfLossOperState: TIntegerField
      FieldName = 'OperState'
    end
    object cdsPrfLossHidedOper: TBooleanField
      FieldName = 'HidedOper'
    end
    object cdsPrfLossOperSummSys: TFloatField
      FieldName = 'OperSummSys'
      ReadOnly = True
    end
    object cdsPrfLossRateMain: TFloatField
      FieldName = 'RateMain'
    end
    object cdsPrfLossid_Repr_Ex: TIntegerField
      FieldName = 'id_Repr_Ex'
    end
    object cdsPrfLossid_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object cdsPrfLossImp_PayBasic: TStringField
      FieldName = 'Imp_PayBasic'
      Size = 1000
    end
    object cdsPrfLossAccInv_PayAssignment: TStringField
      FieldName = 'AccInv_PayAssignment'
      Size = 1000
    end
    object cdsPrfLossContract: TStringField
      FieldName = 'Contract'
      Size = 1000
    end
    object cdsPrfLossOperDeltaCrn: TFloatField
      FieldName = 'OperDeltaCrn'
      ReadOnly = True
    end
    object cdsPrfLossOperRateDeltaCrn: TFloatField
      FieldName = 'OperRateDeltaCrn'
      ReadOnly = True
    end
    object cdsPrfLossOperTotalDeltaCrn: TFloatField
      FieldName = 'OperTotalDeltaCrn'
      ReadOnly = True
    end
    object cdsPrfLossOperCrnName: TStringField
      FieldName = 'OperCrnName'
      ReadOnly = True
      Size = 10
    end
    object cdsPrfLossOperSum_Offer: TFloatField
      FieldName = 'OperSum_Offer'
      ReadOnly = True
    end
    object cdsPrfLossCRN_OLD_OperSum: TFloatField
      FieldName = 'CRN_OLD_OperSum'
      ReadOnly = True
    end
    object cdsPrfLossCRN_OLD_OperSum_Offer: TFloatField
      FieldName = 'CRN_OLD_OperSum_Offer'
      ReadOnly = True
    end
    object cdsPrfLossCRN_OperSum_Inv: TFloatField
      FieldName = 'CRN_OperSum_Inv'
      ReadOnly = True
    end
    object cdsPrfLossOperSumCalced: TFloatField
      FieldName = 'OperSumCalced'
      ReadOnly = True
    end
    object cdsPrfLossOperSum_OfferCalced: TFloatField
      FieldName = 'OperSum_OfferCalced'
      ReadOnly = True
    end
    object cdsPrfLossBlocked: TBooleanField
      FieldName = 'Blocked'
    end
    object cdsPrfLossCurrencyBsnName: TStringField
      FieldName = 'CurrencyBsnName'
      ReadOnly = True
      Size = 10
    end
    object cdsPrfLossid_Ctg_Goods_2: TIntegerField
      FieldName = 'id_Ctg_Goods_2'
    end
    object cdsPrfLossOpComment: TStringField
      FieldName = 'OpComment'
      Size = 1000
    end
    object cdsPrfLossRealDataCreate: TDateTimeField
      FieldName = 'RealDataCreate'
    end
    object cdsPrfLossOperTypeSIGN: TIntegerField
      FieldName = 'OperTypeSIGN'
      ReadOnly = True
    end
    object cdsPrfLossHasChild: TIntegerField
      FieldName = 'HasChild'
      ReadOnly = True
    end
    object cdsPrfLossDig1: TFloatField
      FieldName = 'Dig1'
    end
    object cdsPrfLossDig2: TFloatField
      FieldName = 'Dig2'
    end
    object cdsPrfLossDig3: TFloatField
      FieldName = 'Dig3'
    end
    object cdsPrfLossDig4: TFloatField
      FieldName = 'Dig4'
    end
    object cdsPrfLossDig5: TFloatField
      FieldName = 'Dig5'
    end
    object cdsPrfLossDig6: TFloatField
      FieldName = 'Dig6'
    end
    object cdsPrfLossDig7: TFloatField
      FieldName = 'Dig7'
    end
    object cdsPrfLossDig8: TFloatField
      FieldName = 'Dig8'
    end
    object cdsPrfLossDig9: TFloatField
      FieldName = 'Dig9'
    end
    object cdsPrfLossDig10: TFloatField
      FieldName = 'Dig10'
    end
    object cdsPrfLossDig11: TFloatField
      FieldName = 'Dig11'
    end
    object cdsPrfLossDig12: TFloatField
      FieldName = 'Dig12'
    end
    object cdsPrfLossDig13: TFloatField
      FieldName = 'Dig13'
    end
    object cdsPrfLossDig14: TFloatField
      FieldName = 'Dig14'
    end
    object cdsPrfLossDig15: TFloatField
      FieldName = 'Dig15'
    end
    object cdsPrfLossStr1: TStringField
      FieldName = 'Str1'
      Size = 100
    end
    object cdsPrfLossStr2: TStringField
      FieldName = 'Str2'
      Size = 100
    end
    object cdsPrfLossStr3: TStringField
      FieldName = 'Str3'
      Size = 100
    end
    object cdsPrfLossStr4: TStringField
      FieldName = 'Str4'
      Size = 100
    end
    object cdsPrfLossStr5: TStringField
      FieldName = 'Str5'
      Size = 100
    end
    object cdsPrfLossStr6: TStringField
      FieldName = 'Str6'
      Size = 100
    end
    object cdsPrfLossStr7: TStringField
      FieldName = 'Str7'
      Size = 100
    end
    object cdsPrfLossStr8: TStringField
      FieldName = 'Str8'
      Size = 100
    end
    object cdsPrfLossStr9: TStringField
      FieldName = 'Str9'
      Size = 100
    end
    object cdsPrfLossStr10: TStringField
      FieldName = 'Str10'
      Size = 100
    end
    object cdsPrfLossStr11: TStringField
      FieldName = 'Str11'
      Size = 100
    end
    object cdsPrfLossStr12: TStringField
      FieldName = 'Str12'
      Size = 100
    end
    object cdsPrfLossStr13: TStringField
      FieldName = 'Str13'
      Size = 100
    end
    object cdsPrfLossStr14: TStringField
      FieldName = 'Str14'
      Size = 100
    end
    object cdsPrfLossStr15: TStringField
      FieldName = 'Str15'
      Size = 100
    end
    object cdsPrfLossid_OperWare: TAutoIncField
      FieldName = 'id_OperWare'
      ReadOnly = True
    end
    object cdsPrfLossOperVidName: TStringField
      FieldName = 'OperVidName'
      ReadOnly = True
      Size = 50
    end
    object cdsPrfLossCRN_OperSumRez: TFloatField
      FieldName = 'CRN_OperSumRez'
      ReadOnly = True
    end
    object cdsPrfLossOnlyDate: TDateTimeField
      FieldName = 'OnlyDate'
      ReadOnly = True
    end
    object cdsPrfLossis_Mirr: TBooleanField
      FieldName = 'is_Mirr'
      ReadOnly = True
    end
    object cdsPrfLossid_Acc_Group: TIntegerField
      FieldName = 'id_Acc_Group'
      ReadOnly = True
    end
    object cdsPrfLossid_Warehouse_Group: TIntegerField
      FieldName = 'id_Warehouse_Group'
      ReadOnly = True
    end
    object cdsPrfLossid_Manufact_Group: TIntegerField
      FieldName = 'id_Manufact_Group'
      ReadOnly = True
    end
    object cdsPrfLossVatIn: TBooleanField
      FieldName = 'VatIn'
    end
    object cdsPrfLossAutoGen: TBooleanField
      FieldName = 'AutoGen'
    end
    object cdsPrfLossCreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      ReadOnly = True
      Size = 152
    end
    object cdsPrfLossCheckerFIO: TStringField
      FieldName = 'CheckerFIO'
      ReadOnly = True
      Size = 152
    end
  end
  object dsArc: TDataSource
    DataSet = cdsPrfLoss
    OnDataChange = dsArcDataChange
    Left = 424
    Top = 296
  end
  object cdsExtDataDict: TClientDataSet
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
        Name = '@id_business'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsExtDataDict'
    RemoteServer = DM.rsCA
    Left = 88
    Top = 280
    object cdsExtDataDictid_Oper_ExtDataNames: TIntegerField
      FieldName = 'id_Oper_ExtDataNames'
    end
    object cdsExtDataDictid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsExtDataDictType: TIntegerField
      FieldName = 'Type'
    end
    object cdsExtDataDictNumPrm: TIntegerField
      FieldName = 'NumPrm'
    end
    object cdsExtDataDictParName: TStringField
      FieldName = 'ParName'
      Size = 100
    end
    object cdsExtDataDictVisible: TBooleanField
      FieldName = 'Visible'
    end
  end
  object ilImage: TImageList
    Left = 40
    Top = 32
    Bitmap = {
      494C010124002700040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000A0000000010020000000000000A0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008402
      0400FCFE0400FC02040084020400000000000000000004028400000000000402
      FC00040284000402040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000008402
      0400FCFE0400FC02040084020400000000000000000004028400000000000402
      FC00040284000402040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F00BFBFBF007F7F7F00000000007F7F7F00BFBFBF007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000008402
      0400FCFE0400FC02040084020400000000000000000004028400000000000402
      FC00040284000402040000000000000000008000000080000000800000008000
      00008000000080000000800000008000000080000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F7F7F00000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000000000000000000000000000000000008402
      0400C4C2C400FCFE0400FC020400000000000000000004028400FCFEFC00C4C2
      C4000402FC0004020400000000000000000080000000FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000000000000000FF000000
      FF000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000840204008402040084020400000000000000000000000000040284000402
      84000402840000000000000000000000000080000000FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000000000000000FF000000
      FF000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000000000000000000000000000000000000000
      000004020400C4C2C4000402040000000000000000000000000084828400C4C2
      C4000402040000000000000000000000000080000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00080000000000000000000
      FF000000FF00000000000000FF000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      000004020400C4C2C4000402040000000000000000000000000084828400C4C2
      C4000402040000000000000000000000000080000000FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF0080000000000000000000
      00000000FF0000000000000000000000FF0000000000000000000000FF000000
      00000000000000000000000000000000000000000000FF000000000000000000
      00000000000000000000000000000000000000FFFF000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000000000000000000000000000000000000000
      000004020400C4C2C4000402040000000000000000000000000084828400C4C2
      C4000402040000000000000000000000000080000000FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF0080000000800000008000
      000000000000000000000000FF000000FF0000000000000000000000FF000000
      FF0000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000402040000000000000000000402
      040004020400C4C2C40004020400000000000000000000000000040204000402
      0400040204000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000FFFFFF00FFFF
      FF00800000000000FF000000FF000000FF000000000000000000000000000000
      FF000000FF000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000008482840004020400040204008482
      840084828400C4C2C40084828400040204000402040004020400848284000402
      0400040204000000000000000000000000008000000080000000800000008000
      00008000000080000000FFFF000080000000FFFF000080000000FFFFFF00FFFF
      FF00800000000000FF000000FF000000FF000000000000000000000000000000
      00000000FF000000FF000000000000000000FF00000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF007F7F7F00000000007F7F7F0000FFFF0000FFFF000000000000000000BFBF
      BF0000000000000000000000000000000000C4C2C400FCFEFC00FCFEFC00C4C2
      C400C4C2C400C4C2C400C4C2C400C4C2C400C4C2C400FCFEFC0004020400C4C2
      C400040204000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000C0C0C000C0C0
      C000800000000000FF000000FF00000000000000FF000000FF00000000000000
      00000000FF000000FF00000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000BFBFBF000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000008482840084828400FCFE
      FC00FCFEFC00FCFEFC00FCFEFC00FCFEFC00FCFEFC0004020400C4C2C400C4C2
      C400848284000402040000000000000000000000000000000000000000008000
      0000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFF
      FF00800000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF00000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF0000000000BFBFBF000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000008482
      8400848284008482840084828400848284008482840084828400C4C2C400C4C2
      C400848284000402040000000000000000000000000000000000000000008000
      0000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFF
      FF0080000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF0000000000000000000000000000000000FF000000000000000000
      00000000000000000000000000000000000000FFFF00000000000000000000FF
      FF007F7F7F007F7F7F00BFBFBF00000000000000000000000000BFBFBF007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084828400C4C2C400C4C2
      C400848284000402040000000000000000000000000000000000000000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084828400FCFEFC00C4C2
      C400848284000402040000000000000000000000000000000000000000008000
      00008000000080000000800000008000000080000000FFFF000080000000FFFF
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084828400848284008482
      8400848284000402040000000000000000000000000000000000000000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      000000000000000000007F7F7F000000000000000000000000007F7F7F000000
      000000000000000000007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808000008080000080800000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FF000000FF000000FF000000FF00
      0000FF000000FFFFFF0000000000000000000000000000000000808080000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      800080808000808080008080800080808000808080000000000080800000FFFF
      0000FFFF0000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      FF00000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000FFFF00008080
      0000808000008080000080800000808000000000000080800000FFFF0000FFFF
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FF000000FF000000FF000000FF00
      0000FF000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000FF000000FF0000000000FF00000000000000FF00
      000000000000000000000000000000000000000000000000000000000000FFFF
      00008080000080800000808000000000000080800000FFFF0000FFFF0000FFFF
      FF000000000080800000000000000000000000000000FFFFFF00840000008400
      0000840000008400000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F00000000007F7F
      7F000000FF007F7F7F000000FF007F7F7F000000FF007F7F7F007F7F7F00FF00
      00007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000FFFF0000808000000000000080800000FFFF0000FFFF0000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FF000000FF000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000FF0000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000080800000FFFF0000FFFF0000FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00840000008400
      0000840000008400000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F0000000000FF00
      0000000000000000000000000000FF000000000000000000FF00000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      00000000000080800000FFFF0000FFFF0000FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000000000000FF00000000000000000000000000FF00000000000000
      FF00FF0000000000FF0000000000000000000000000000000000000000000000
      000080800000FFFF0000FFFF0000FFFFFF000000000080800000808080000000
      00000000000000000000000000000000000000000000FFFFFF00840000008400
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F00000000007F7F
      7F00FF0000007F7F7F00FF0000007F7F7F007F7F7F007F7F7F000000FF007F7F
      7F007F7F7F00FF0000000000FF007F7F7F000000000000000000000000008080
      0000FFFF0000FFFF0000FFFFFF0000000000FFFF000080800000808000008080
      80000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      000000000000FF0000000000000000000000000000000000000080800000FFFF
      0000FFFF0000FFFFFF00000000000000000000000000FFFF0000808000008080
      00008080800000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      000000000000808080000000000000000000000000007F7F7F00000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      00000000000000000000FF0000000000000000000000FFFFFF00FFFFFF00FFFF
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
      0000000000000000000000000000000000000000000000000000808080000000
      0000808080000000000000000000000000007F7F7F007F7F7F00000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000800000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000080000000800000008000000000000000
      00000000000000000000000000000000000000000000FFFFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000000000000000000000FF000000
      FF0000000000000000007F7F7F00000000007F7F7F00000000000000FF000000
      FF000000FF0000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000080000000FF000000FF0000008000000080000000
      0000000000000000000000000000000000000000000000FFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      840000848400008484000084840000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000FF00FFFFFF000000FF0000008000000080000000
      00000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000084840000848400008484000084
      840000848400008484000084840000000000000000000000FF00000000000000
      FF000000FF000000FF007F7F7F00000000007F7F7F0000000000000000000000
      00000000FF000000FF000000000000000000000000000080800000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000808000000000000000000000000000000000000000
      00000000000000000000000080000000FF000000800000008000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000080800000000000000000000080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C600000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000800000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000800000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000800000000000000080000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000800000008000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400848484008484
      8400000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000008000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      000000000000000000000080800000FFFF0000FFFF0000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000008000000080000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000008400000084000000
      840000008400000084000000840000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00808080000000FF000000FF00000080000000
      0000000000000000000000000000000000000000000000000000848484008484
      840084848400848484008484840084848400848484000000FF000000FF000000
      FF000000FF000000FF000000FF000000000000000000000000000000FF000000
      FF000000FF00000000007F7F7F00000000007F7F7F0000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808080000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000FFFF0000FFFF0000FFFF0000FFFF00008080000000
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
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0008080
      00008080000080800000808080008080800080808000C0C0C000808080008080
      0000808000008080800000000000000000000000000000000000000000000000
      0000000000000084000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000808080008080
      0000808000008080000080800000C0C0C00080808000C0C0C000808080008080
      8000808000008080000080808000000000000000000000000000000000000000
      0000008400000084000000840000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000000000000000000000000000000000000000000C0C0C000808000000080
      00008080000080800000808000000000000080808000C0C0C000C0C0C0008080
      8000808000008080000080800000C0C0C0000000000000000000000000000000
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000848400008484000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000080808000808000008080
      0000808000008080800080808000000000000000000080808000808080008080
      8000808080008080000000800000808080000000000000000000000000000084
      0000008400000084000000840000008400000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000084840000848400008484000084
      8400008484000084840000848400000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      840000848400008484000000000000000000C0C0C00080800000808080008080
      00008080800000000000000000000000000000000000C0C0C000808080000000
      0000808000008080800080808000808080000000000000000000008400000084
      0000008400000084000000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808000008080800080808000000000000000000000000000000000008080
      8000808080008080800080808000808080000000000084848400008400000084
      0000000000000000000000840000008400000084000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C600000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      000000000000000000000000000000000000C0C0C00080808000808080008080
      80008080800080800000C0C0C000000000000000000000000000000000000080
      0000808000008080800080808000808080008484840000840000000000000000
      0000000000000000000000000000008400000084000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000080808000C0C0C000C0C0
      C000808080008080800000000000000000000000000000000000000000008080
      8000808000008080000080800000C0C0C0000000000000000000000000000000
      0000000000000000000000000000008400000084000000840000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF008484840000FF
      000000FF00000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      80008080800080808000C0C0C000000000008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000808080008080000080800000000000008080800080800000808000008080
      8000808000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840000FF000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808080008080000080800000808080000000000080808000808000008080
      0000808000008080000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000084
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000FF000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C0008080800080808000808000008080800080800000808000008080
      0000808000000080000080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000000000000000000000000000000000000000000848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00080808000C0C0C000C0C0C000808080000080000080800000808000008080
      0000808080000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000840000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000084848400000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000FFFFFF000000
      0000848484008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      84008484840000000000FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF000000000000FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF000000000000000000000000000000000000FFFFFF008484
      8400000000000000000000FFFF0084848400000000008484840000FFFF000000
      00000000000084848400FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000000000FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000000000FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF000000000000FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF000000000000000000000000000000000000FFFFFF008484
      8400000000000000000000FFFF0084848400000000008484840000FFFF000000
      00000000000084848400FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF008484840084848400FFFFFF0084848400848484000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000FFFFFF00FFFF
      FF00848484008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      840084848400FFFFFF00FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF008484840084848400000000008484840084848400000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFF0000FFFF00008484
      84000000FF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF00000000FF008484
      8400FF000000FFFF000000000000000000000000000000000000FFFFFF00FFFF
      FF000000000000FFFF00848484000000000000FFFF00000000008484840000FF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFF0000FFFF00008484
      84000000FF00FFFF000000000000FFFF000000000000848484000000FF000000
      FF0000000000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000008484840084848400FFFF
      FF00FFFF00000000FF00FFFF0000FFFFFF00FFFF00000000FF00FFFF0000FFFF
      FF00848484008484840000000000000000000000000000000000FFFFFF00FFFF
      FF008484840000000000848484000000000000FFFF0000000000848484000000
      000084848400FFFFFF00FFFFFF00000000000000000084848400848484000000
      0000FFFF00000000FF00FFFF00000000000084848400848484000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF00000000FF000000FF000000FF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF000000000000FFFF
      000000000000FFFF00000000FF00848484000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000848484000000000000000000FFFF
      FF00FFFF00000000FF00FFFFFF00FFFF0000FFFFFF000000FF00FFFF0000FFFF
      FF00000000000000000084848400000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFF00000000FF0000000000848484000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000848484000000
      000000000000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00000000000000
      0000848484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000848484000000
      00000000000000000000FFFF00008484840084848400848484000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000FFFF00000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000FFFF000000000000848484000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000FFFF0000FFFF000084840000FFFF000084
      84000000000000000000000000000000000000000000BDBDBD00000000007B7B
      7B0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008484000000000000FFFF0000FFFF000084840000848400000000000084
      84000084840000000000000000000000000000000000BDBDBD00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002121
      2100212121002121210000000000848484004242420042424200000000000000
      0000212121000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      84000000000000FFFF0000FFFF000000000000FFFF000084840000FFFF000084
      84000084840000848400000000000000000000000000BDBDBD00BDBDBD000000
      0000000000000000000000000000FFFFFF00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000212121006363
      6300313131002121210021212100A5A5A5006363630000000000000000002121
      2100212121002121210000000000000000000000000000000000000000008400
      0000FF000000FF00000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000084
      84000084840000FFFF0000FFFF0000FFFF0000FFFF0000848400008484000084
      8400008484000084840000000000000000000000000000000000000000007B7B
      7B00FFFFFF00FFFFFF00FFFFFF0000000000BDBDBD00BDBDBD00000000000000
      000000000000000000000000000000000000000000000000000021212100A5A5
      A500C6C6C60073737300A5A5A500C6C6C600C6C6C60063636300737373009494
      9400212121004242420000000000000000000000000000000000000000008400
      000084000000C6C6C600FFFFFF00848484008400000084000000840000008400
      000084000000000000000000000000000000000000000000000000FFFF000084
      840000FFFF000084840000FFFF0000FFFF000084840000FFFF0000FFFF000084
      840000FFFF000084840000848400000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00BDBDBD00000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000003131
      3100C6C6C60094949400D6D6D600B5B5B500A5A5A500D6D6D600737373007373
      7300000000004242420000000000000000000000000000000000000000000000
      000084848400FFFFFF00C6C6C6000000000084000000FFFFFF00848484008400
      000084000000000000000000000000000000000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00008484000084840000848400000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000042424200424242006363
      6300A5A5A500C6C6C60063636300424242006363630063636300D6D6D6006363
      6300000000004242420042424200424242000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF0000000000C6C6C600000000008400
      000000000000000000000000000000000000000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000084840000FFFF0000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00BDBDBD00424242003131310063636300E7E7
      E700636363009494940073737300737373005252520063636300A5A5A500C6C6
      C600636363004242420000000000424242000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000FFFF000084
      840000FFFF0000848400008484000084840000FFFF0000FFFF000000000000FF
      FF00008484000084840000FFFF00000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000004242420063636300D6D6D600E7E7
      E700424242006363630084848400636363007373730042424200B5B5B500C6C6
      C600A5A5A5008484840000000000424242000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF000084
      84000084840000848400008484000084840000FFFF0000FFFF0000FFFF000084
      840000FFFF000084840000FFFF000000000000000000000000000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000FFFFFF00212121000000000000000000A5A5
      A50063636300B5B5B500C6C6C600848484007373730063636300D6D6D600A5A5
      A500212121002121210000000000212121000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF008400000000000000FFFFFF00FFFF
      FF0084848400000000000000000000000000000000000000000000FFFF0000FF
      FF00008484000084840000848400008484000084840000848400008484000084
      840000FFFF0000FFFF000000000000000000000000000000000000FFFF000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF000000000000FFFF0000000000000000000000000000000000000000003131
      3100B5B5B50063636300B5B5B5006363630094949400C6C6C600949494006363
      6300000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600FFFFFF0000000000FFFFFF008400
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00008484000084840000FFFF000084840000848400008484000084840000FF
      FF0000FFFF0000848400000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF000000000000FFFF000000000000000000000000000000000000000000A5A5
      A500D6D6D600B5B5B500636363004242420063636300A5A5A500B5B5B500A5A5
      A500212121004242420000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000000000000000FFFF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF00008484000084840000848400008484000000000000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF000000
      000000FFFF000000000000000000000000000000000000000000424242005252
      5200A5A5A50031313100A5A5A500E7E7E700E7E7E70063636300212121007373
      7300212121002121210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF00008484000084840000FFFF000084840000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000006363
      6300424242002121210000000000D6D6D6006363630042424200000000002121
      2100212121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00008484000084840000848400008484000000
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
      0000000000000000000000000000000000000000000000000000FFFFFF00B5D6
      B5005AAD5A00218C2100007B0000007B0000007B000008840800218C21005AAD
      5A00B5D6B500FFFFFF0000000000000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF00848484008484
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
      FF00FFFFFF0000FFFF0000000000FFFF0000188C180000840000008400000084
      000000840000008400000094000000C6000000DE000000EF0000008400000084
      0000008400000084000000840000088408008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF00848484008484
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
      00000000000000000000000000000000000000000000D6E7D600188C18000084
      00000084000000840000008C000000DE000000DE000000840000008400000084
      000000840000188C1800C6DEC600000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484
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
      00000000FF000000000000000000000000000000000000000000F7F7F700399C
      3900008400000084000000840000008400000084000000840000008400000084
      0000108C1000C6DEC60000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
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
      2800000040000000A00000000100010000000000000500000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FC1FE1A3FFF7FFFFF007E1A3FFE7FFC8
      E003E1A30041FFB8C001E1830000CFBFC001F1C70000CFBCC001F1C70024FFBC
      C001F1C70036DFBF4001F1C7000CCF7CA00361C70000E6FCC3C700070000F37F
      00470007000133BCC1C78003E00733BCA1C7E003E00787BF6007FF83E007FFB8
      E80FFF83E007FFC8EC1FFF83E007FFFFFFFFF7FFDDDDFFFFFC01E3EFD555FFE0
      FC01E3EF00000000FC01C1EFDFFF00010001C1EF8FDF80030001F7EFD4AFC001
      0001F7EF0000E0010001F7EFDB77F01F0003F7EF8EB7F01F0007F7EFD5A3E00F
      000FF7EF0000C00700FFF783DBFB810301FFF7839BFD038103FFF7C7DFFF07C1
      FFFFF7C70000FFFFFFFFFFEFFFFFFFFF000FFFFFF81FFFFF0007F83FE007FE1F
      0003E00FC003FC1F0001CC478001FC0F000084638001FC0F0000A0730000FC1F
      000031F90000FF7F000738F90000FE3F00073C790000FE3F80073C390000FE1F
      C0073C190000FC1FC0019C0B8001FC0FC0008C438001FC0FC000C467C003F80F
      FF81E00FE007FC0FFFFFF83FF81FFE3FFFFFFF9FFFFF000FFFFFF107FFFF0007
      001FC003F9FF0003000FC001F0FF000100078100F0FF000000038180E07F0000
      00010790C07F0000000001E0843F0007001F01E01E3F0003001F83E0FE1F8003
      001F8101FF1FC0018FF1E103FF8FC000FFF9E081FFC7C000FF75E001FFE3C001
      FF8FE005FFF8FFC3FFFFF00FFFFFFFE7FFFFFFFF8001FFFF000FDFFB3FF9FFFF
      000F8FFF800983E0000F87F7000983E0000FC7EF800983E0000FE3CF80098080
      000FF19F80098000000FF83F80098000008FFC7F800980001144F83F8009C001
      0AB8F19F8009E083057CC3CF8019E083FAFC87E78001F1C7FDF88FFB8001F1C7
      FE04FFFF800AF1C7FFFFFFFF8005FFFFFC7F8000FC7FFFFFF01F8000F01FFFFF
      C0078000C107E003000180008001E003000180000101E003000180000001E003
      000180000101E003000180000001E003000180000101E003000180000281E003
      000180001101E003000180002801E003000180009201E007C0078001C403E00F
      F01F8003F007E01FFC7F8007FC4FFFFFE063FFFFFFFFFFFF8001FDFFFC3FD8BF
      8001F8FFF30FE07F8000F07FE287F07F0000E03FE30700010000C01FE2870001
      0000800FE307000180010007E287000180030003E3070001800F8001E2870001
      8007C003E3070001C003E00FE2A70005E003F00FE5570001E007F81FEAA70005
      F81FFC7FF54F0101FFFFFFFFF81FC387FE0F81FFFE3FFFFFF00780FFFFBFFFFF
      E003007FE237E07FC001001FC063E007C0018007C003E0078000E001E00BE007
      8000F8008008C00F8000F8000002C00F8000E0000002C0078000C0006002C007
      80018002E00BC007C0018003E003C007C003C003C003E003E007E007E227F003
      F00FF00FFE3FFE07FC1FFC3FFC3FFFFF803FFFFFFFFFFFFF001FFFFF001FFF7F
      0004C003000FE00F000080010007C00F00000000000300070000000000010003
      0000000000000003000000000000000000000000000000000000000000000000
      0007800100000000001FC00380000000000FF00FC00008008007E007E0007FF0
      8023C003F000FFFC5577C001FFFFFFFE00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Images = ilImage
    Left = 296
    Top = 88
    object aNewWH: TAction
      Category = 'операции'
      Caption = 'Создать складскую операцию'
      Hint = 'Создать'
      ImageIndex = 2
    end
    object aNewFin: TAction
      Category = 'операции'
      Caption = 'Создать финансовую операцию'
      ImageIndex = 1
    end
    object aNewService: TAction
      Category = 'операции'
      Caption = 'Создать операцию по услугам'
      ImageIndex = 3
    end
    object aNewZac: TAction
      Category = 'операции'
      Caption = 'Создать взаимозачет'
      ImageIndex = 21
    end
    object aProperty: TAction
      Caption = 'Открыть'
      Enabled = False
      Hint = 'Редактировать'
      ImageIndex = 16
      OnExecute = aPropertyExecute
    end
    object aRefreshe: TAction
      Caption = 'Обновить'
      ImageIndex = 18
      OnExecute = aRefresheExecute
    end
    object aDelete: TAction
      Caption = 'Удалить'
      Enabled = False
      ImageIndex = 17
      OnExecute = aDeleteExecute
    end
    object aNewEmpty: TAction
      Category = 'операции'
      Caption = 'Создать пустую операцию'
      ImageIndex = 0
    end
    object aGetMi: TAction
      Category = 'Взять в обработку'
      Caption = 'Взять в обработку'
    end
    object aCancelSeted: TAction
      Category = 'Взять в обработку'
      Caption = 'Отказаться от обработки'
    end
    object aSetUser: TAction
      Category = 'Взять в обработку'
      Caption = 'Назначить'
    end
    object aNewCorHW: TAction
      Category = 'операции'
      Caption = 'Создать складскую операцию'
      ImageIndex = 2
    end
    object aNewCorFin: TAction
      Category = 'операции'
      Caption = 'Создать финансовую операцию'
      ImageIndex = 1
    end
    object aNewCorService: TAction
      Category = 'операции'
      Caption = 'Создать операцию по услугам'
      ImageIndex = 3
    end
    object aNewCorOffset: TAction
      Category = 'операции'
      Caption = 'Создать взаимозачетную операцию'
      ImageIndex = 21
    end
    object aUnSetUser: TAction
      Category = 'Взять в обработку'
      Caption = 'Снять назначение'
    end
    object aSetViza: TAction
      Caption = 'Визировать'
      ImageIndex = 22
      OnExecute = aSetVizaExecute
    end
    object aUnViza: TAction
      Caption = 'Снять визу'
      Enabled = False
      ImageIndex = 32
      OnExecute = aUnVizaExecute
    end
    object aBuffAdd: TAction
      Category = 'Работа с буфером'
      Caption = 'Поместить в буфер'
      ImageIndex = 23
    end
    object aBuffDel: TAction
      Category = 'Работа с буфером'
      Caption = 'Убрать из буфера'
      ImageIndex = 24
      Visible = False
    end
    object aSetError: TAction
      Caption = 'Пометить'
      Enabled = False
      ImageIndex = 26
      Visible = False
      OnExecute = aSetErrorExecute
    end
    object aUnSetError: TAction
      Caption = 'Снять метку'
      Enabled = False
      Visible = False
    end
    object aNewCor: TAction
      Category = 'Правки'
      Caption = 'Создать корректирующую операцию'
      Enabled = False
    end
    object aDoChangeOper: TAction
      Caption = 'Изменения'
    end
    object aNewCopyOper2: TAction
      Category = 'Правки'
      Caption = 'Копировать'
      Enabled = False
      ImageIndex = 28
      OnExecute = aNewCopyOper2Execute
    end
    object aLCBuffAdd: TAction
      Category = 'Работа с буфером'
      Caption = 'Поместить во временный буфер'
    end
    object Action1: TAction
      Caption = 'Посчитать'
      ImageIndex = 30
    end
    object aGreedToExcel: TAction
      Caption = 'В Excel'
      ImageIndex = 31
      OnExecute = aGreedToExcelExecute
    end
    object aSelectAll: TAction
      Category = 'Работа с буфером'
      Caption = 'Выделить все'
      ShortCut = 16449
    end
    object aSettings: TAction
      Caption = 'Настройка'
      ImageIndex = 33
      OnExecute = aSettingsExecute
    end
    object aBeBack: TAction
      Category = 'Правки'
      Caption = 'Возврат'
      Enabled = False
    end
    object aExportAll: TAction
      Caption = 'Экспортировать все'
    end
    object aImport: TAction
      Caption = 'Импорт'
    end
    object aExportSelected: TAction
      Caption = 'Экспортировать выделенное'
    end
    object aBackToCA: TAction
      Category = 'Правки'
      Caption = 'Возврат контрагенту'
      Enabled = False
    end
    object aBackFromCA: TAction
      Category = 'Правки'
      Caption = 'Возврат отгрузки'
      Enabled = False
    end
    object aShowArcAnaliz: TAction
      Caption = 'Анализ'
      ImageIndex = 35
      OnExecute = aShowArcAnalizExecute
    end
    object aValList: TAction
      Caption = 'Перечень значений столбца'
    end
    object aAccCard: TAction
      Category = 'Отчеты'
      Caption = 'Карточка счета'
      Enabled = False
    end
    object aBalance: TAction
      Category = 'Отчеты'
      Caption = 'Взаиморасчеты с контрагентом'
      Enabled = False
    end
    object aWHRep: TAction
      Category = 'Отчеты'
      Caption = 'Движение по складу'
      Enabled = False
    end
    object aCopySel: TAction
      Caption = 'Копировать значения'
      ShortCut = 16451
    end
    object aNewRez: TAction
      Category = 'операции'
      Caption = 'Создать резерв'
      ImageIndex = 14
    end
    object aMakeRez: TAction
      Category = 'операции'
      Caption = 'Резервировать по операции'
    end
    object aOperByRez: TAction
      Category = 'операции'
      Caption = 'Отгрузить'
    end
    object aVizaSelected: TAction
      Caption = 'Визировать выделенное'
    end
    object aDoc_ShowInv: TAction
      Category = 'Документы'
      Caption = 'Товарная накладная'
    end
    object aDoc_ShowPayIn: TAction
      Category = 'Документы'
      Caption = 'Приходный кассовый ордер'
    end
    object aDoc_ShowActCL: TAction
      Category = 'Документы'
      Caption = 'Акт взаимозачета'
    end
    object aDoc_ShowDAcc: TAction
      Category = 'Документы'
      Caption = 'Счет'
    end
    object aDoc_ShowFinalAct: TAction
      Category = 'Документы'
      Caption = 'Акт приема'
    end
    object aDoc_ShowWarrant: TAction
      Category = 'Документы'
      Caption = 'Доверенность'
    end
    object aDoc_ShowAF: TAction
      Category = 'Документы'
      Caption = 'Счет-фактура'
    end
    object aDoc_ShowWBill: TAction
      Category = 'Документы'
      Caption = 'Товарно-транспортная накладная'
    end
    object aShowDocList: TAction
      Category = 'Документы'
      Caption = 'Список документов по операции'
    end
    object ADelSel: TAction
      Caption = 'Удалить выделенные'
    end
    object aUnVizaSel: TAction
      Caption = 'Развизировать выделенные'
    end
  end
end
