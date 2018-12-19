object InvDet: TInvDet
  Left = 173
  Top = 190
  Width = 837
  Height = 540
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Детализация себестоимости'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 472
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
    Height = 61
    Align = alTop
    Caption = ' '
    TabOrder = 1
    Visible = False
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
      Height = 59
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
        Height = 24
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
        object Label2: TLabel
          Left = 157
          Top = 5
          Width = 41
          Height = 13
          Caption = 'Дата по'
        end
        object Label3: TLabel
          Left = 13
          Top = 5
          Width = 35
          Height = 13
          Caption = 'Дата с'
        end
        object dtFrom: TDateEdit
          Left = 56
          Top = 2
          Width = 95
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
        object dtTo: TDateEdit
          Left = 205
          Top = 2
          Width = 95
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
        end
      end
    end
  end
  inline fArcLite1: TfArcLite
    Top = 61
    Width = 829
    Height = 411
    Align = alClient
    TabOrder = 2
    inherited ToolBar1: TToolBar
      Width = 829
    end
    inherited RxDBGrid1: TDBGridEh
      Width = 829
      Height = 295
      FooterRowCount = 1
      SumList.Active = True
      Columns = <
        item
          EndEllipsis = True
          FieldName = 'AmountOper126'
          Footer.EndEllipsis = True
          Footer.ValueType = fvtSum
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Tag = -1
          Title.Caption = 'Кол-во для расчета'
          Title.TitleButton = True
        end
        item
          EndEllipsis = True
          FieldName = 'SummOper126'
          Footer.EndEllipsis = True
          Footer.ValueType = fvtSum
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Сумма для расчета'
          Title.TitleButton = True
        end
        item
          EndEllipsis = True
          FieldName = 'OperState'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Виза'
          Title.Orientation = tohVertical
          Title.TitleButton = True
          Width = 21
        end
        item
          EndEllipsis = True
          FieldName = 'OperVidName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Тип'
          Title.Orientation = tohVertical
          Title.TitleButton = True
          Width = 22
        end
        item
          EndEllipsis = True
          FieldName = 'OperNum'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Номер'
          Title.TitleButton = True
          Width = 93
        end
        item
          EndEllipsis = True
          FieldName = 'TypeName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Приход/ Расход'
          Title.TitleButton = True
          Width = 62
        end
        item
          EndEllipsis = True
          FieldName = 'DateCreate'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Дата/время создания'
          Title.TitleButton = True
          Width = 101
        end
        item
          FieldName = 'OnlyDate'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Дата'
          Title.TitleButton = True
        end
        item
          EndEllipsis = True
          FieldName = 'Correct'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Корр.'
          Title.Orientation = tohVertical
          Title.TitleButton = True
          Width = 30
        end
        item
          EndEllipsis = True
          FieldName = 'WareName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Наименование товара/услуги'
          Title.TitleButton = True
          Width = 148
        end
        item
          EndEllipsis = True
          FieldName = 'AmountOper'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Количество|Кол-во'
          Title.TitleButton = True
          Width = 63
        end
        item
          EndEllipsis = True
          FieldName = 'MeasureName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Количество|Ед. изм.'
          Title.TitleButton = True
          Width = 104
        end
        item
          EndEllipsis = True
          FieldName = 'PriceOper'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Сумма|Цена'
          Title.TitleButton = True
          Width = 53
        end
        item
          EndEllipsis = True
          FieldName = 'SummOper'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Сумма|Сумма'
          Title.TitleButton = True
        end
        item
          EndEllipsis = True
          FieldName = 'CurrencyOperShortName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Сумма|Валюта'
          Title.TitleButton = True
          Width = 74
        end
        item
          EndEllipsis = True
          FieldName = 'PriceInv'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Себестоимость|Цена ед.'
          Title.TitleButton = True
        end
        item
          EndEllipsis = True
          FieldName = 'CRN_OperSum_Inv'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Себестоимость|Сумма'
          Title.TitleButton = True
        end
        item
          EndEllipsis = True
          FieldName = 'CurrencyInvShortName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Себестоимость|Валюта'
          Title.TitleButton = True
        end
        item
          EndEllipsis = True
          FieldName = 'SummSys'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Зачтено|Cумма'
          Title.TitleButton = True
          Width = 52
        end
        item
          EndEllipsis = True
          FieldName = 'CurrencySysShortName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Зачтено|Валюта'
          Title.TitleButton = True
          Width = 83
        end
        item
          EndEllipsis = True
          FieldName = 'SrcName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Участники|Свой объект'
          Title.TitleButton = True
          Width = 100
        end
        item
          EndEllipsis = True
          FieldName = 'ReprName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Участники|Чужой объект'
          Title.TitleButton = True
          Width = 100
        end
        item
          EndEllipsis = True
          FieldName = 'ContrAgentName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Участники|Контрагент'
          Title.TitleButton = True
          Width = 137
        end
        item
          EndEllipsis = True
          FieldName = 'OperDeltaCrn'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Прибыль|По операции'
          Title.TitleButton = True
          Width = 85
        end
        item
          EndEllipsis = True
          FieldName = 'OperRateDeltaCrn'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Прибыль|Курсовая'
          Title.TitleButton = True
          Width = 76
        end
        item
          EndEllipsis = True
          FieldName = 'OperTotalDeltaCrn'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Прибыль|Итого'
          Title.TitleButton = True
          Width = 73
        end
        item
          EndEllipsis = True
          FieldName = 'CurrencyBsnName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Прибыль|Валюта'
          Title.TitleButton = True
          Width = 77
        end
        item
          EndEllipsis = True
          FieldName = 'OperSumCalced'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'В валюте бизнеса|Сумма'
          Title.TitleButton = True
        end
        item
          EndEllipsis = True
          FieldName = 'OperSum_OfferCalced'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'В валюте бизнеса|Зачтено'
          Title.TitleButton = True
        end
        item
          EndEllipsis = True
          FieldName = 'CurrencyBsnName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'В валюте бизнеса|Валюта'
          Title.TitleButton = True
          Width = 87
        end
        item
          EndEllipsis = True
          FieldName = 'BusinessName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бизнес'
          Title.TitleButton = True
          Width = 103
        end
        item
          EndEllipsis = True
          FieldName = 'KoeffName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Суть'
          Title.TitleButton = True
          Width = 110
        end
        item
          EndEllipsis = True
          FieldName = 'FormalDistribName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Распределение|Формальное'
          Title.TitleButton = True
          Width = 100
        end
        item
          EndEllipsis = True
          FieldName = 'FuncDistribName'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Распределение|Функциональное'
          Title.TitleButton = True
          Width = 100
        end
        item
          EndEllipsis = True
          FieldName = 'CreatorFIO'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Создал'
          Title.TitleButton = True
          Width = 100
        end
        item
          EndEllipsis = True
          FieldName = 'CheckerFIO'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Проверка|Проверил'
          Title.TitleButton = True
          Width = 127
        end
        item
          EndEllipsis = True
          FieldName = 'CheckDate'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Проверка|Дата'
          Title.TitleButton = True
          Width = 82
        end
        item
          EndEllipsis = True
          FieldName = 'OperTypeSIGN'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Знак'
          Title.TitleButton = True
          Visible = False
        end
        item
          FieldName = 'Imp_PayBasic'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Документ|Осн. платежа/накладная'
          Title.TitleButton = True
          Width = 130
        end
        item
          FieldName = 'AccInv_PayAssignment'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Документ|Пл. поручение/Счет фактура'
          Title.TitleButton = True
          Width = 130
        end
        item
          FieldName = 'Contract'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Документ|Договор'
          Title.TitleButton = True
          Width = 130
        end
        item
          FieldName = 'OpComment'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Комментарий'
          Title.TitleButton = True
          Width = 100
        end
        item
          EndEllipsis = True
          FieldName = 'Str1'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 1'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Str2'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 2'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Str3'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 3'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Str4'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 4'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Str5'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 5'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Str6'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 6'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Str7'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 7'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Str8'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 8'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Str9'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 9'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Str10'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 10'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Str11'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 11'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Str12'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 12'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Str13'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 13'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Str14'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 14'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Str15'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Строка 15'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig1'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 1'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig2'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 2'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig3'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 3'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig4'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 4'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig5'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 5'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig6'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 6'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig7'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 7'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig8'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 8'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig9'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 9'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig10'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 10'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig11'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 11'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig12'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 12'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig13'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 13'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig14'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 14'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end
        item
          EndEllipsis = True
          FieldName = 'Dig15'
          Footers = <>
          KeyList.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Бюджет|Число 15'
          Title.TitleButton = True
          Visible = False
          Width = 60
        end>
    end
    inherited ToolBar2: TToolBar
      Width = 829
    end
    inherited Panel3: TPanel
      Width = 829
    end
    inherited StatusBar1: TStatusBar
      Top = 392
      Width = 829
    end
    inherited cdsArcLite: TClientDataSet
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
          Value = 126
        end>
      ProviderName = 'dsInvWare'
    end
  end
  object cdsInvWare: TClientDataSet
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
        Value = 126
      end>
    ProviderName = 'dsInvWare'
    RemoteServer = DM.rsCA
    Left = 136
    Top = 152
    object cdsInvWareAmountOper126: TFloatField
      FieldName = 'AmountOper126'
      DisplayFormat = '0.00'
    end
    object cdsInvWareSummOper126: TFloatField
      FieldName = 'SummOper126'
      DisplayFormat = '0.00'
    end
    object cdsInvWareid_Oper: TAutoIncField
      FieldName = 'id_Oper'
      ReadOnly = True
    end
    object cdsInvWareid_OperParent: TIntegerField
      FieldName = 'id_OperParent'
    end
    object cdsInvWareid_old_Oper: TIntegerField
      FieldName = 'id_old_Oper'
    end
    object cdsInvWareDateCreate: TDateTimeField
      FieldName = 'DateCreate'
      ReadOnly = True
    end
    object cdsInvWareid_LC_Oper: TIntegerField
      FieldName = 'id_LC_Oper'
    end
    object cdsInvWareOperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object cdsInvWareid_Replicator: TIntegerField
      FieldName = 'id_Replicator'
    end
    object cdsInvWareReplicatorShortName: TStringField
      FieldName = 'ReplicatorShortName'
      Size = 5
    end
    object cdsInvWareid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsInvWareid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsInvWareId_CurrencyBsn: TIntegerField
      FieldName = 'Id_CurrencyBsn'
    end
    object cdsInvWareBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsInvWareBusinessNum: TStringField
      FieldName = 'BusinessNum'
      Size = 5
    end
    object cdsInvWareDateLocal: TDateTimeField
      FieldName = 'DateLocal'
    end
    object cdsInvWareCorrect: TBooleanField
      FieldName = 'Correct'
    end
    object cdsInvWareOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsInvWareId_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object cdsInvWareCurrencyOperName: TStringField
      FieldName = 'CurrencyOperName'
      Size = 30
    end
    object cdsInvWareCurrencyOperShortName: TStringField
      FieldName = 'CurrencyOperShortName'
      Size = 10
    end
    object cdsInvWareAmountOper: TFloatField
      FieldName = 'AmountOper'
      ReadOnly = True
    end
    object cdsInvWareAmountOper2: TFloatField
      FieldName = 'AmountOper2'
      ReadOnly = True
    end
    object cdsInvWarePriceOper: TFloatField
      FieldName = 'PriceOper'
      ReadOnly = True
    end
    object cdsInvWareRateOper: TFloatField
      FieldName = 'RateOper'
    end
    object cdsInvWareid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsInvWareMeasureName: TStringField
      FieldName = 'MeasureName'
      ReadOnly = True
      Size = 10
    end
    object cdsInvWareRealKoef: TFloatField
      FieldName = 'RealKoef'
      ReadOnly = True
    end
    object cdsInvWareAmountOperBaseMS: TFloatField
      FieldName = 'AmountOperBaseMS'
      ReadOnly = True
    end
    object cdsInvWareId_CurrencySys: TIntegerField
      FieldName = 'Id_CurrencySys'
    end
    object cdsInvWareCurrencySysName: TStringField
      FieldName = 'CurrencySysName'
      Size = 30
    end
    object cdsInvWareCurrencySysShortName: TStringField
      FieldName = 'CurrencySysShortName'
      Size = 10
    end
    object cdsInvWareSummSys: TFloatField
      FieldName = 'SummSys'
      ReadOnly = True
    end
    object cdsInvWareRateSys: TFloatField
      FieldName = 'RateSys'
    end
    object cdsInvWareid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsInvWareid_Warehouse: TIntegerField
      FieldName = 'id_Warehouse'
    end
    object cdsInvWareid_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object cdsInvWareSrcName: TStringField
      FieldName = 'SrcName'
      ReadOnly = True
      Size = 50
    end
    object cdsInvWareSrcID_Main: TIntegerField
      FieldName = 'SrcID_Main'
      ReadOnly = True
    end
    object cdsInvWareid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsInvWareid_Acc_Ext: TIntegerField
      FieldName = 'id_Acc_Ext'
    end
    object cdsInvWareid_Warehouse_Ext: TIntegerField
      FieldName = 'id_Warehouse_Ext'
    end
    object cdsInvWareid_Manufact_Ext: TIntegerField
      FieldName = 'id_Manufact_Ext'
    end
    object cdsInvWareReprName: TStringField
      FieldName = 'ReprName'
      ReadOnly = True
      Size = 255
    end
    object cdsInvWareReprID_Main: TIntegerField
      FieldName = 'ReprID_Main'
      ReadOnly = True
    end
    object cdsInvWareId_CurrencyInv: TIntegerField
      FieldName = 'Id_CurrencyInv'
    end
    object cdsInvWarePriceInv: TFloatField
      FieldName = 'PriceInv'
    end
    object cdsInvWareRateInv: TFloatField
      FieldName = 'RateInv'
    end
    object cdsInvWareCurrencyInvName: TStringField
      FieldName = 'CurrencyInvName'
      ReadOnly = True
      Size = 30
    end
    object cdsInvWareCurrencyInvShortName: TStringField
      FieldName = 'CurrencyInvShortName'
      ReadOnly = True
      Size = 30
    end
    object cdsInvWareid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsInvWareWareName: TStringField
      FieldName = 'WareName'
      Size = 255
    end
    object cdsInvWareWareID_Main: TIntegerField
      FieldName = 'WareID_Main'
    end
    object cdsInvWareKoeff: TIntegerField
      FieldName = 'Koeff'
    end
    object cdsInvWareKoeffName: TStringField
      FieldName = 'KoeffName'
      ReadOnly = True
      Size = 50
    end
    object cdsInvWareCheckDate: TDateTimeField
      FieldName = 'CheckDate'
      ReadOnly = True
    end
    object cdsInvWareid_UserChecker: TIntegerField
      FieldName = 'id_UserChecker'
      ReadOnly = True
    end
    object cdsInvWareid_FormalDistrib: TIntegerField
      FieldName = 'id_FormalDistrib'
    end
    object cdsInvWareFormalDistribName: TStringField
      FieldName = 'FormalDistribName'
      Size = 50
    end
    object cdsInvWareid_FuncDistrib: TIntegerField
      FieldName = 'id_FuncDistrib'
    end
    object cdsInvWareFuncDistribName: TStringField
      FieldName = 'FuncDistribName'
      Size = 50
    end
    object cdsInvWareDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsInvWareid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
      ReadOnly = True
    end
    object cdsInvWareContrAgentName: TStringField
      FieldName = 'ContrAgentName'
      ReadOnly = True
      Size = 50
    end
    object cdsInvWareid_CAGroup: TIntegerField
      FieldName = 'id_CAGroup'
    end
    object cdsInvWareSummOper: TFloatField
      FieldName = 'SummOper'
      ReadOnly = True
    end
    object cdsInvWareTypeName: TStringField
      FieldName = 'TypeName'
      ReadOnly = True
      Size = 30
    end
    object cdsInvWareOperNum: TStringField
      FieldName = 'OperNum'
      ReadOnly = True
      Size = 255
    end
    object cdsInvWareOperDelta: TFloatField
      FieldName = 'OperDelta'
      ReadOnly = True
    end
    object cdsInvWareOperRateDelta: TFloatField
      FieldName = 'OperRateDelta'
      ReadOnly = True
    end
    object cdsInvWareOperTotalDelta: TFloatField
      FieldName = 'OperTotalDelta'
      ReadOnly = True
    end
    object cdsInvWareDTDiff: TIntegerField
      FieldName = 'DTDiff'
      ReadOnly = True
    end
    object cdsInvWareHasViza: TBooleanField
      FieldName = 'HasViza'
      ReadOnly = True
    end
    object cdsInvWareOperState: TIntegerField
      FieldName = 'OperState'
    end
    object cdsInvWareHidedOper: TBooleanField
      FieldName = 'HidedOper'
    end
    object cdsInvWareOperSummSys: TFloatField
      FieldName = 'OperSummSys'
      ReadOnly = True
    end
    object cdsInvWareRateMain: TFloatField
      FieldName = 'RateMain'
    end
    object cdsInvWareid_Repr_Ex: TIntegerField
      FieldName = 'id_Repr_Ex'
    end
    object cdsInvWareid_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object cdsInvWareImp_PayBasic: TStringField
      FieldName = 'Imp_PayBasic'
      Size = 1000
    end
    object cdsInvWareAccInv_PayAssignment: TStringField
      FieldName = 'AccInv_PayAssignment'
      Size = 1000
    end
    object cdsInvWareContract: TStringField
      FieldName = 'Contract'
      Size = 1000
    end
    object cdsInvWareOperDeltaCrn: TFloatField
      FieldName = 'OperDeltaCrn'
      ReadOnly = True
    end
    object cdsInvWareOperRateDeltaCrn: TFloatField
      FieldName = 'OperRateDeltaCrn'
      ReadOnly = True
    end
    object cdsInvWareOperTotalDeltaCrn: TFloatField
      FieldName = 'OperTotalDeltaCrn'
      ReadOnly = True
    end
    object cdsInvWareOperCrnName: TStringField
      FieldName = 'OperCrnName'
      ReadOnly = True
      Size = 10
    end
    object cdsInvWareOperSum_Offer: TFloatField
      FieldName = 'OperSum_Offer'
      ReadOnly = True
    end
    object cdsInvWareCRN_OLD_OperSum: TFloatField
      FieldName = 'CRN_OLD_OperSum'
      ReadOnly = True
    end
    object cdsInvWareCRN_OLD_OperSum_Offer: TFloatField
      FieldName = 'CRN_OLD_OperSum_Offer'
      ReadOnly = True
    end
    object cdsInvWareCRN_OperSum_Inv: TFloatField
      FieldName = 'CRN_OperSum_Inv'
      ReadOnly = True
    end
    object cdsInvWareOperSumCalced: TFloatField
      FieldName = 'OperSumCalced'
      ReadOnly = True
    end
    object cdsInvWareOperSum_OfferCalced: TFloatField
      FieldName = 'OperSum_OfferCalced'
      ReadOnly = True
    end
    object cdsInvWareBlocked: TBooleanField
      FieldName = 'Blocked'
    end
    object cdsInvWareCurrencyBsnName: TStringField
      FieldName = 'CurrencyBsnName'
      ReadOnly = True
      Size = 10
    end
    object cdsInvWareid_Ctg_Goods_2: TIntegerField
      FieldName = 'id_Ctg_Goods_2'
    end
    object cdsInvWareOpComment: TStringField
      FieldName = 'OpComment'
      Size = 1000
    end
    object cdsInvWareRealDataCreate: TDateTimeField
      FieldName = 'RealDataCreate'
    end
    object cdsInvWareOperTypeSIGN: TIntegerField
      FieldName = 'OperTypeSIGN'
      ReadOnly = True
    end
    object cdsInvWareHasChild: TIntegerField
      FieldName = 'HasChild'
      ReadOnly = True
    end
    object cdsInvWareDig1: TFloatField
      FieldName = 'Dig1'
    end
    object cdsInvWareDig2: TFloatField
      FieldName = 'Dig2'
    end
    object cdsInvWareDig3: TFloatField
      FieldName = 'Dig3'
    end
    object cdsInvWareDig4: TFloatField
      FieldName = 'Dig4'
    end
    object cdsInvWareDig5: TFloatField
      FieldName = 'Dig5'
    end
    object cdsInvWareDig6: TFloatField
      FieldName = 'Dig6'
    end
    object cdsInvWareDig7: TFloatField
      FieldName = 'Dig7'
    end
    object cdsInvWareDig8: TFloatField
      FieldName = 'Dig8'
    end
    object cdsInvWareDig9: TFloatField
      FieldName = 'Dig9'
    end
    object cdsInvWareDig10: TFloatField
      FieldName = 'Dig10'
    end
    object cdsInvWareDig11: TFloatField
      FieldName = 'Dig11'
    end
    object cdsInvWareDig12: TFloatField
      FieldName = 'Dig12'
    end
    object cdsInvWareDig13: TFloatField
      FieldName = 'Dig13'
    end
    object cdsInvWareDig14: TFloatField
      FieldName = 'Dig14'
    end
    object cdsInvWareDig15: TFloatField
      FieldName = 'Dig15'
    end
    object cdsInvWareStr1: TStringField
      FieldName = 'Str1'
      Size = 100
    end
    object cdsInvWareStr2: TStringField
      FieldName = 'Str2'
      Size = 100
    end
    object cdsInvWareStr3: TStringField
      FieldName = 'Str3'
      Size = 100
    end
    object cdsInvWareStr4: TStringField
      FieldName = 'Str4'
      Size = 100
    end
    object cdsInvWareStr5: TStringField
      FieldName = 'Str5'
      Size = 100
    end
    object cdsInvWareStr6: TStringField
      FieldName = 'Str6'
      Size = 100
    end
    object cdsInvWareStr7: TStringField
      FieldName = 'Str7'
      Size = 100
    end
    object cdsInvWareStr8: TStringField
      FieldName = 'Str8'
      Size = 100
    end
    object cdsInvWareStr9: TStringField
      FieldName = 'Str9'
      Size = 100
    end
    object cdsInvWareStr10: TStringField
      FieldName = 'Str10'
      Size = 100
    end
    object cdsInvWareStr11: TStringField
      FieldName = 'Str11'
      Size = 100
    end
    object cdsInvWareStr12: TStringField
      FieldName = 'Str12'
      Size = 100
    end
    object cdsInvWareStr13: TStringField
      FieldName = 'Str13'
      Size = 100
    end
    object cdsInvWareStr14: TStringField
      FieldName = 'Str14'
      Size = 100
    end
    object cdsInvWareStr15: TStringField
      FieldName = 'Str15'
      Size = 100
    end
    object cdsInvWareid_OperWare: TAutoIncField
      FieldName = 'id_OperWare'
      ReadOnly = True
    end
    object cdsInvWareOperVidName: TStringField
      FieldName = 'OperVidName'
      ReadOnly = True
      Size = 50
    end
    object cdsInvWareCRN_OperSumRez: TFloatField
      FieldName = 'CRN_OperSumRez'
      ReadOnly = True
    end
    object cdsInvWareOnlyDate: TDateTimeField
      FieldName = 'OnlyDate'
      ReadOnly = True
    end
    object cdsInvWareis_Mirr: TBooleanField
      FieldName = 'is_Mirr'
      ReadOnly = True
    end
    object cdsInvWareid_Acc_Group: TIntegerField
      FieldName = 'id_Acc_Group'
      ReadOnly = True
    end
    object cdsInvWareid_Warehouse_Group: TIntegerField
      FieldName = 'id_Warehouse_Group'
      ReadOnly = True
    end
    object cdsInvWareid_Manufact_Group: TIntegerField
      FieldName = 'id_Manufact_Group'
      ReadOnly = True
    end
    object cdsInvWareVatIn: TBooleanField
      FieldName = 'VatIn'
    end
    object cdsInvWareAutoGen: TBooleanField
      FieldName = 'AutoGen'
    end
    object cdsInvWareCreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      ReadOnly = True
      Size = 152
    end
    object cdsInvWareCheckerFIO: TStringField
      FieldName = 'CheckerFIO'
      ReadOnly = True
      Size = 152
    end
  end
end
