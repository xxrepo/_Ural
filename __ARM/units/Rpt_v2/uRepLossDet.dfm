object RepLossDet: TRepLossDet
  Left = 263
  Top = 88
  Width = 1559
  Height = 822
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Детализация баланса'
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
  object Panel1: TPanel
    Left = 0
    Top = 742
    Width = 1543
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 1465
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
  inline fArcLite1: TfArcLite
    Width = 1543
    Height = 742
    Align = alClient
    TabOrder = 1
    inherited ToolBar1: TToolBar
      Width = 1543
    end
    inherited RxDBGrid1: TDBGridEh
      Width = 1543
      Height = 626
      FooterRowCount = 1
      SumList.Active = True
      Columns = <
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'WorkSum'
          Footer.EndEllipsis = True
          Footer.FieldName = 'WorkSum'
          Footer.ValueType = fvtSum
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Сумма для расчета'
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'OperState'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Виза'
          Title.Orientation = tohVertical
          Title.TitleButton = True
          Width = 21
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'OperVidName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Тип'
          Title.Orientation = tohVertical
          Title.TitleButton = True
          Width = 22
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'OperNum'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Номер'
          Title.TitleButton = True
          Width = 93
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'TypeName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Приход/ Расход'
          Title.TitleButton = True
          Width = 62
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'DateCreate'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Дата/время создания'
          Title.TitleButton = True
          Width = 101
        end
        item
          EditButtons = <>
          FieldName = 'OnlyDate'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Дата'
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Correct'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Корр.'
          Title.Orientation = tohVertical
          Title.TitleButton = True
          Width = 30
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'WareName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Наименование товара/услуги'
          Title.TitleButton = True
          Width = 148
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'AmountOper'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Количество|Кол-во'
          Title.TitleButton = True
          Width = 63
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'MeasureName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Количество|Ед. изм.'
          Title.TitleButton = True
          Width = 104
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'PriceOper'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Сумма|Цена'
          Title.TitleButton = True
          Width = 53
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'SummOper'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Сумма|Сумма'
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'CurrencyOperShortName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Сумма|Валюта'
          Title.TitleButton = True
          Width = 74
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'PriceInv'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Себестоимость|Цена ед.'
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'CRN_OperSum_Inv'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Себестоимость|Сумма'
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'CurrencyInvShortName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Себестоимость|Валюта'
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'SummSys'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Зачтено|Cумма'
          Title.TitleButton = True
          Width = 52
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'CurrencySysShortName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Зачтено|Валюта'
          Title.TitleButton = True
          Width = 83
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'SrcName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Участники|Свой объект'
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'ReprName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Участники|Чужой объект'
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'ContrAgentName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Участники|Контрагент'
          Title.TitleButton = True
          Width = 137
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'OperDeltaCrn'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Прибыль|По операции'
          Title.TitleButton = True
          Width = 85
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'OperRateDeltaCrn'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Прибыль|Курсовая'
          Title.TitleButton = True
          Width = 76
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'OperTotalDeltaCrn'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Прибыль|Итого'
          Title.TitleButton = True
          Width = 73
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'CurrencyBsnName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Прибыль|Валюта'
          Title.TitleButton = True
          Width = 77
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'OperSumCalced'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'В валюте бизнеса|Сумма'
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'OperSum_OfferCalced'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'В валюте бизнеса|Зачтено'
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'CurrencyBsnName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'В валюте бизнеса|Валюта'
          Title.TitleButton = True
          Width = 87
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'BusinessName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бизнес'
          Title.TitleButton = True
          Width = 103
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'KoeffName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Суть'
          Title.TitleButton = True
          Width = 110
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'FormalDistribName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Распределение|Формальное'
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'FuncDistribName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Распределение|Функциональное'
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'CreatorFIO'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Создал'
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'CheckerFIO'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Проверка|Проверил'
          Title.TitleButton = True
          Width = 127
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'CheckDate'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Проверка|Дата'
          Title.TitleButton = True
          Width = 82
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'OperTypeSIGN'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Знак'
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'Imp_PayBasic'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Документ|Осн. платежа/накладная'
          Title.TitleButton = True
          Width = 130
        end
        item
          EditButtons = <>
          FieldName = 'AccInv_PayAssignment'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Документ|Пл. поручение/Счет фактура'
          Title.TitleButton = True
          Width = 130
        end
        item
          EditButtons = <>
          FieldName = 'Contract'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Документ|Договор'
          Title.TitleButton = True
          Width = 130
        end
        item
          EditButtons = <>
          FieldName = 'OpComment'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Комментарий'
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str1'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 1'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str2'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 2'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str3'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 3'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str4'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 4'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str5'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 5'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str6'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 6'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str7'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 7'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str8'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 8'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str9'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 9'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str10'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 10'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str11'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 11'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str12'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 12'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str13'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 13'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str14'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 14'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Str15'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 15'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig1'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 1'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig2'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 2'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig3'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 3'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig4'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 4'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig5'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 5'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig6'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 6'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig7'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 7'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig8'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 8'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig9'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 9'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig10'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 10'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig11'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 11'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig12'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 12'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig13'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 13'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig14'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 14'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'Dig15'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 15'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end>
    end
    inherited ToolBar2: TToolBar
      Width = 1543
    end
    inherited Panel3: TPanel
      Width = 1543
    end
    inherited StatusBar1: TStatusBar
      Top = 723
      Width = 1543
    end
    inherited cdsArcLite: TClientDataSet
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
          Name = '@isRawZ'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isNotRawZ'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isCRN'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isUp'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isDown'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isInFromManuf'
          ParamType = ptInput
        end
        item
          DataType = ftInteger
          Name = '@id_Manufact'
          ParamType = ptInput
        end>
      ProviderName = 'dsBlnDet2'
    end
  end
  object cdsRep: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@Id_business'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@RepNum'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Year'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Str3'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Str4'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@M'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_User'
        ParamType = ptInput
      end>
    ProviderName = 'dsRPT_NewRepTree'
    RemoteServer = DM.rsCA
    Left = 272
    Top = 240
    object cdsRepWorkSum: TFloatField
      FieldName = 'WorkSum'
      DisplayFormat = '### ### ##0.##'
    end
    object cdsRepid_Oper: TAutoIncField
      FieldName = 'id_Oper'
      ReadOnly = True
    end
    object cdsRepid_OperParent: TIntegerField
      FieldName = 'id_OperParent'
    end
    object cdsRepid_old_Oper: TIntegerField
      FieldName = 'id_old_Oper'
    end
    object cdsRepDateCreate: TDateTimeField
      FieldName = 'DateCreate'
      ReadOnly = True
    end
    object cdsRepid_LC_Oper: TIntegerField
      FieldName = 'id_LC_Oper'
    end
    object cdsRepOperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object cdsRepid_Replicator: TIntegerField
      FieldName = 'id_Replicator'
    end
    object cdsRepReplicatorShortName: TStringField
      FieldName = 'ReplicatorShortName'
      Size = 5
    end
    object cdsRepid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsRepid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsRepId_CurrencyBsn: TIntegerField
      FieldName = 'Id_CurrencyBsn'
    end
    object cdsRepBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsRepBusinessNum: TStringField
      FieldName = 'BusinessNum'
      Size = 5
    end
    object cdsRepDateLocal: TDateTimeField
      FieldName = 'DateLocal'
    end
    object cdsRepCorrect: TBooleanField
      FieldName = 'Correct'
    end
    object cdsRepOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsRepId_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object cdsRepCurrencyOperName: TStringField
      FieldName = 'CurrencyOperName'
      Size = 30
    end
    object cdsRepCurrencyOperShortName: TStringField
      FieldName = 'CurrencyOperShortName'
      Size = 10
    end
    object cdsRepAmountOper: TFloatField
      FieldName = 'AmountOper'
      ReadOnly = True
    end
    object cdsRepAmountOper2: TFloatField
      FieldName = 'AmountOper2'
      ReadOnly = True
    end
    object cdsRepPriceOper: TFloatField
      FieldName = 'PriceOper'
      ReadOnly = True
    end
    object cdsRepRateOper: TFloatField
      FieldName = 'RateOper'
    end
    object cdsRepid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsRepMeasureName: TStringField
      FieldName = 'MeasureName'
      ReadOnly = True
      Size = 10
    end
    object cdsRepRealKoef: TFloatField
      FieldName = 'RealKoef'
      ReadOnly = True
    end
    object cdsRepAmountOperBaseMS: TFloatField
      FieldName = 'AmountOperBaseMS'
      ReadOnly = True
    end
    object cdsRepId_CurrencySys: TIntegerField
      FieldName = 'Id_CurrencySys'
    end
    object cdsRepCurrencySysName: TStringField
      FieldName = 'CurrencySysName'
      Size = 30
    end
    object cdsRepCurrencySysShortName: TStringField
      FieldName = 'CurrencySysShortName'
      Size = 10
    end
    object cdsRepSummSys: TFloatField
      FieldName = 'SummSys'
      ReadOnly = True
    end
    object cdsRepRateSys: TFloatField
      FieldName = 'RateSys'
    end
    object cdsRepid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsRepid_Warehouse: TIntegerField
      FieldName = 'id_Warehouse'
    end
    object cdsRepid_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object cdsRepSrcName: TStringField
      FieldName = 'SrcName'
      ReadOnly = True
      Size = 50
    end
    object cdsRepSrcID_Main: TIntegerField
      FieldName = 'SrcID_Main'
      ReadOnly = True
    end
    object cdsRepid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsRepid_Acc_Ext: TIntegerField
      FieldName = 'id_Acc_Ext'
    end
    object cdsRepid_Warehouse_Ext: TIntegerField
      FieldName = 'id_Warehouse_Ext'
    end
    object cdsRepid_Manufact_Ext: TIntegerField
      FieldName = 'id_Manufact_Ext'
    end
    object cdsRepReprName: TStringField
      FieldName = 'ReprName'
      ReadOnly = True
      Size = 255
    end
    object cdsRepReprID_Main: TIntegerField
      FieldName = 'ReprID_Main'
      ReadOnly = True
    end
    object cdsRepId_CurrencyInv: TIntegerField
      FieldName = 'Id_CurrencyInv'
    end
    object cdsRepPriceInv: TFloatField
      FieldName = 'PriceInv'
    end
    object cdsRepRateInv: TFloatField
      FieldName = 'RateInv'
    end
    object cdsRepCurrencyInvName: TStringField
      FieldName = 'CurrencyInvName'
      ReadOnly = True
      Size = 30
    end
    object cdsRepCurrencyInvShortName: TStringField
      FieldName = 'CurrencyInvShortName'
      ReadOnly = True
      Size = 30
    end
    object cdsRepid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsRepWareName: TStringField
      FieldName = 'WareName'
      Size = 255
    end
    object cdsRepWareID_Main: TIntegerField
      FieldName = 'WareID_Main'
    end
    object cdsRepKoeff: TIntegerField
      FieldName = 'Koeff'
    end
    object cdsRepKoeffName: TStringField
      FieldName = 'KoeffName'
      ReadOnly = True
      Size = 50
    end
    object cdsRepCheckDate: TDateTimeField
      FieldName = 'CheckDate'
      ReadOnly = True
    end
    object cdsRepid_UserChecker: TIntegerField
      FieldName = 'id_UserChecker'
      ReadOnly = True
    end
    object cdsRepid_FormalDistrib: TIntegerField
      FieldName = 'id_FormalDistrib'
    end
    object cdsRepFormalDistribName: TStringField
      FieldName = 'FormalDistribName'
      Size = 50
    end
    object cdsRepid_FuncDistrib: TIntegerField
      FieldName = 'id_FuncDistrib'
    end
    object cdsRepFuncDistribName: TStringField
      FieldName = 'FuncDistribName'
      Size = 50
    end
    object cdsRepDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsRepid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
      ReadOnly = True
    end
    object cdsRepContrAgentName: TStringField
      FieldName = 'ContrAgentName'
      ReadOnly = True
      Size = 50
    end
    object cdsRepid_CAGroup: TIntegerField
      FieldName = 'id_CAGroup'
    end
    object cdsRepSummOper: TFloatField
      FieldName = 'SummOper'
      ReadOnly = True
    end
    object cdsRepTypeName: TStringField
      FieldName = 'TypeName'
      ReadOnly = True
      Size = 30
    end
    object cdsRepOperNum: TStringField
      FieldName = 'OperNum'
      ReadOnly = True
      Size = 255
    end
    object cdsRepOperDelta: TFloatField
      FieldName = 'OperDelta'
      ReadOnly = True
    end
    object cdsRepOperRateDelta: TFloatField
      FieldName = 'OperRateDelta'
      ReadOnly = True
    end
    object cdsRepOperTotalDelta: TFloatField
      FieldName = 'OperTotalDelta'
      ReadOnly = True
    end
    object cdsRepDTDiff: TIntegerField
      FieldName = 'DTDiff'
      ReadOnly = True
    end
    object cdsRepHasViza: TBooleanField
      FieldName = 'HasViza'
      ReadOnly = True
    end
    object cdsRepOperState: TIntegerField
      FieldName = 'OperState'
    end
    object cdsRepHidedOper: TBooleanField
      FieldName = 'HidedOper'
    end
    object cdsRepOperSummSys: TFloatField
      FieldName = 'OperSummSys'
      ReadOnly = True
    end
    object cdsRepRateMain: TFloatField
      FieldName = 'RateMain'
    end
    object cdsRepid_Repr_Ex: TIntegerField
      FieldName = 'id_Repr_Ex'
    end
    object cdsRepid_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object cdsRepImp_PayBasic: TStringField
      FieldName = 'Imp_PayBasic'
      Size = 1000
    end
    object cdsRepAccInv_PayAssignment: TStringField
      FieldName = 'AccInv_PayAssignment'
      Size = 1000
    end
    object cdsRepContract: TStringField
      FieldName = 'Contract'
      Size = 1000
    end
    object cdsRepOperDeltaCrn: TFloatField
      FieldName = 'OperDeltaCrn'
      ReadOnly = True
    end
    object cdsRepOperRateDeltaCrn: TFloatField
      FieldName = 'OperRateDeltaCrn'
      ReadOnly = True
    end
    object cdsRepOperTotalDeltaCrn: TFloatField
      FieldName = 'OperTotalDeltaCrn'
      ReadOnly = True
    end
    object cdsRepOperCrnName: TStringField
      FieldName = 'OperCrnName'
      ReadOnly = True
      Size = 10
    end
    object cdsRepOperSum_Offer: TFloatField
      FieldName = 'OperSum_Offer'
      ReadOnly = True
    end
    object cdsRepCRN_OLD_OperSum: TFloatField
      FieldName = 'CRN_OLD_OperSum'
      ReadOnly = True
    end
    object cdsRepCRN_OLD_OperSum_Offer: TFloatField
      FieldName = 'CRN_OLD_OperSum_Offer'
      ReadOnly = True
    end
    object cdsRepCRN_OperSum_Inv: TFloatField
      FieldName = 'CRN_OperSum_Inv'
      ReadOnly = True
    end
    object cdsRepOperSumCalced: TFloatField
      FieldName = 'OperSumCalced'
      ReadOnly = True
    end
    object cdsRepOperSum_OfferCalced: TFloatField
      FieldName = 'OperSum_OfferCalced'
      ReadOnly = True
    end
    object cdsRepBlocked: TBooleanField
      FieldName = 'Blocked'
    end
    object cdsRepCurrencyBsnName: TStringField
      FieldName = 'CurrencyBsnName'
      ReadOnly = True
      Size = 10
    end
    object cdsRepid_Ctg_Goods_2: TIntegerField
      FieldName = 'id_Ctg_Goods_2'
    end
    object cdsRepOpComment: TStringField
      FieldName = 'OpComment'
      Size = 1000
    end
    object cdsRepRealDataCreate: TDateTimeField
      FieldName = 'RealDataCreate'
    end
    object cdsRepOperTypeSIGN: TIntegerField
      FieldName = 'OperTypeSIGN'
      ReadOnly = True
    end
    object cdsRepHasChild: TIntegerField
      FieldName = 'HasChild'
      ReadOnly = True
    end
    object cdsRepDig1: TFloatField
      FieldName = 'Dig1'
    end
    object cdsRepDig2: TFloatField
      FieldName = 'Dig2'
    end
    object cdsRepDig3: TFloatField
      FieldName = 'Dig3'
    end
    object cdsRepDig4: TFloatField
      FieldName = 'Dig4'
    end
    object cdsRepDig5: TFloatField
      FieldName = 'Dig5'
    end
    object cdsRepDig6: TFloatField
      FieldName = 'Dig6'
    end
    object cdsRepDig7: TFloatField
      FieldName = 'Dig7'
    end
    object cdsRepDig8: TFloatField
      FieldName = 'Dig8'
    end
    object cdsRepDig9: TFloatField
      FieldName = 'Dig9'
    end
    object cdsRepDig10: TFloatField
      FieldName = 'Dig10'
    end
    object cdsRepDig11: TFloatField
      FieldName = 'Dig11'
    end
    object cdsRepDig12: TFloatField
      FieldName = 'Dig12'
    end
    object cdsRepDig13: TFloatField
      FieldName = 'Dig13'
    end
    object cdsRepDig14: TFloatField
      FieldName = 'Dig14'
    end
    object cdsRepDig15: TFloatField
      FieldName = 'Dig15'
    end
    object cdsRepStr1: TStringField
      FieldName = 'Str1'
      Size = 100
    end
    object cdsRepStr2: TStringField
      FieldName = 'Str2'
      Size = 100
    end
    object cdsRepStr3: TStringField
      FieldName = 'Str3'
      Size = 100
    end
    object cdsRepStr4: TStringField
      FieldName = 'Str4'
      Size = 100
    end
    object cdsRepStr5: TStringField
      FieldName = 'Str5'
      Size = 100
    end
    object cdsRepStr6: TStringField
      FieldName = 'Str6'
      Size = 100
    end
    object cdsRepStr7: TStringField
      FieldName = 'Str7'
      Size = 100
    end
    object cdsRepStr8: TStringField
      FieldName = 'Str8'
      Size = 100
    end
    object cdsRepStr9: TStringField
      FieldName = 'Str9'
      Size = 100
    end
    object cdsRepStr10: TStringField
      FieldName = 'Str10'
      Size = 100
    end
    object cdsRepStr11: TStringField
      FieldName = 'Str11'
      Size = 100
    end
    object cdsRepStr12: TStringField
      FieldName = 'Str12'
      Size = 100
    end
    object cdsRepStr13: TStringField
      FieldName = 'Str13'
      Size = 100
    end
    object cdsRepStr14: TStringField
      FieldName = 'Str14'
      Size = 100
    end
    object cdsRepStr15: TStringField
      FieldName = 'Str15'
      Size = 100
    end
    object cdsRepid_OperWare: TAutoIncField
      FieldName = 'id_OperWare'
      ReadOnly = True
    end
    object cdsRepOperVidName: TStringField
      FieldName = 'OperVidName'
      ReadOnly = True
      Size = 50
    end
    object cdsRepCRN_OperSumRez: TFloatField
      FieldName = 'CRN_OperSumRez'
      ReadOnly = True
    end
    object cdsRepOnlyDate: TDateTimeField
      FieldName = 'OnlyDate'
      ReadOnly = True
    end
    object cdsRepis_Mirr: TBooleanField
      FieldName = 'is_Mirr'
      ReadOnly = True
    end
    object cdsRepid_Acc_Group: TIntegerField
      FieldName = 'id_Acc_Group'
      ReadOnly = True
    end
    object cdsRepid_Warehouse_Group: TIntegerField
      FieldName = 'id_Warehouse_Group'
      ReadOnly = True
    end
    object cdsRepid_Manufact_Group: TIntegerField
      FieldName = 'id_Manufact_Group'
      ReadOnly = True
    end
    object cdsRepVatIn: TBooleanField
      FieldName = 'VatIn'
    end
    object cdsRepAutoGen: TBooleanField
      FieldName = 'AutoGen'
    end
    object cdsRepCreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      ReadOnly = True
      Size = 152
    end
    object cdsRepCheckerFIO: TStringField
      FieldName = 'CheckerFIO'
      ReadOnly = True
      Size = 152
    end
  end
end
