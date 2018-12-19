object OperImp_LC: TOperImp_LC
  Left = 158
  Top = 90
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Импорт операций'
  ClientHeight = 167
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 364
    Top = 0
    Width = 185
    Height = 144
    Align = alRight
    Caption = 'Номера операций'
    TabOrder = 0
    object Memo1: TMemo
      Left = 2
      Top = 15
      Width = 181
      Height = 127
      Align = alClient
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 364
    Height = 144
    Align = alClient
    Caption = ' '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 35
      Width = 29
      Height = 13
      Caption = 'Файл'
    end
    inline fBsnSelector1: TfBsnSelector
      Width = 361
      Height = 29
      inherited edName: TEdit
        Left = 75
        Width = 258
      end
      inherited Button1: TButton
        Left = 330
      end
    end
    object FilenameEdit1: TFilenameEdit
      Left = 75
      Top = 32
      Width = 280
      Height = 21
      DefaultExt = 'ads'
      Filter = 'Файлы экспорта системы учета (*.ads)|*.ads|Все файлы|*.*'
      InitialDir = ' '
      DialogTitle = 'Файл для импорта'
      NumGlyphs = 1
      TabOrder = 1
    end
    object Button1: TButton
      Left = 56
      Top = 64
      Width = 297
      Height = 25
      Caption = 'Импортировать'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 56
      Top = 104
      Width = 297
      Height = 25
      Caption = 'Выход'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object RxDBGrid1: TDBGridEh
    Left = 0
    Top = 144
    Width = 549
    Height = 23
    Align = alBottom
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    Visible = False
    Columns = <
      item
        EndEllipsis = True
        FieldName = 'OperState'
        Footers = <>
        Title.Caption = 'Виза'
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 21
      end
      item
        EndEllipsis = True
        FieldName = 'OperVid'
        Footers = <>
        Title.Caption = 'Тип'
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 22
      end
      item
        EndEllipsis = True
        FieldName = 'TypeName'
        Footers = <>
        Title.Caption = 'Приход/ Расход'
        Title.TitleButton = True
        Width = 62
      end
      item
        EndEllipsis = True
        FieldName = 'Correct'
        Footers = <>
        Title.Caption = 'Корр.'
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 30
      end
      item
        FieldName = 'CtgName'
        Footers = <>
        Title.Caption = 'Товар/услуга|Категория'
        Width = 120
      end
      item
        EndEllipsis = True
        FieldName = 'WareName'
        Footers = <>
        Title.Caption = 'Товар/услуга|Наименование'
        Title.TitleButton = True
        Width = 148
      end
      item
        EndEllipsis = True
        FieldName = 'AmountOper'
        Footers = <>
        Title.Caption = 'Количество|Кол-во'
        Title.TitleButton = True
        Width = 63
      end
      item
        EndEllipsis = True
        FieldName = 'MeasureName'
        Footers = <>
        Title.Caption = 'Количество|Ед. изм.'
        Title.TitleButton = True
        Width = 57
      end
      item
        EndEllipsis = True
        FieldName = 'PriceOper'
        Footers = <>
        Title.Caption = 'Сумма|Цена'
        Title.TitleButton = True
        Width = 53
      end
      item
        EndEllipsis = True
        FieldName = 'SummOper'
        Footers = <>
        Title.Caption = 'Сумма|Сумма'
        Title.TitleButton = True
      end
      item
        EndEllipsis = True
        FieldName = 'CurrencyOperShortName'
        Footers = <>
        Title.Caption = 'Сумма|Валюта'
        Title.TitleButton = True
        Width = 53
      end
      item
        EndEllipsis = True
        FieldName = 'PriceInv'
        Footers = <>
        Title.Caption = 'Себестоимость|Цена ед.'
        Title.TitleButton = True
        Visible = False
      end
      item
        EndEllipsis = True
        FieldName = 'CRN_OperSum_Inv'
        Footers = <>
        Title.Caption = 'Себестоимость|Сумма'
        Title.TitleButton = True
        Visible = False
      end
      item
        EndEllipsis = True
        FieldName = 'CurrencyInvShortName'
        Footers = <>
        Title.Caption = 'Себестоимость|Валюта'
        Title.TitleButton = True
        Visible = False
        Width = 113
      end
      item
        EndEllipsis = True
        FieldName = 'SummSys'
        Footers = <>
        Title.Caption = 'Зачтено|Cумма'
        Title.TitleButton = True
        Width = 84
      end
      item
        EndEllipsis = True
        FieldName = 'CurrencySysShortName'
        Footers = <>
        Title.Caption = 'Зачтено|Валюта'
        Title.TitleButton = True
        Width = 62
      end
      item
        EndEllipsis = True
        FieldName = 'SrcName'
        Footers = <>
        Title.Caption = 'Участники|Свой объект'
        Title.TitleButton = True
        Width = 100
      end
      item
        EndEllipsis = True
        FieldName = 'ReprName'
        Footers = <>
        Title.Caption = 'Участники|Чужой объект'
        Title.TitleButton = True
        Width = 100
      end
      item
        EndEllipsis = True
        FieldName = 'ContrAgentName'
        Footers = <>
        Title.Caption = 'Участники|Контрагент'
        Title.TitleButton = True
        Width = 106
      end
      item
        EndEllipsis = True
        FieldName = 'BusinessName'
        Footers = <>
        Title.Caption = 'Бизнес'
        Title.TitleButton = True
        Width = 103
      end
      item
        EndEllipsis = True
        FieldName = 'KoeffName'
        Footers = <>
        Title.Caption = 'Суть'
        Title.TitleButton = True
        Width = 110
      end
      item
        EndEllipsis = True
        FieldName = 'FormalDistribName'
        Footers = <>
        Title.Caption = 'Распределение|Формальное'
        Title.TitleButton = True
        Width = 100
      end
      item
        EndEllipsis = True
        FieldName = 'FuncDistribName'
        Footers = <>
        Title.Caption = 'Распределение|Функциональное'
        Title.TitleButton = True
        Width = 100
      end
      item
        EndEllipsis = True
        FieldName = 'Imp_PayBasic'
        Footers = <>
        Title.Caption = 'Документ|Осн. платежа/накладная'
        Title.TitleButton = True
        Width = 115
      end
      item
        EndEllipsis = True
        FieldName = 'AccInv_PayAssignment'
        Footers = <>
        Title.Caption = 'Документ|Пл. поручение/Счет фактура'
        Title.TitleButton = True
        Width = 115
      end
      item
        EndEllipsis = True
        FieldName = 'Contract'
        Footers = <>
        Title.Caption = 'Документ|Договор'
        Title.TitleButton = True
        Width = 115
      end
      item
        FieldName = 'OpComment'
        Footers = <>
        Title.Caption = 'Комментарий'
        Width = 120
      end>
  end
  object cdsExp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsExp'
    Left = 128
    Top = 46
  end
  object dsExp: TDataSetProvider
    DataSet = mtExp
    Constraints = True
    Left = 176
    Top = 46
  end
  object mtExp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'id_Oper'
        DataType = ftInteger
      end
      item
        Name = 'id_OperParent'
        DataType = ftInteger
      end
      item
        Name = 'id_old_Oper'
        DataType = ftInteger
      end
      item
        Name = 'DateCreate'
        DataType = ftDateTime
      end
      item
        Name = 'id_LC_Oper'
        DataType = ftInteger
      end
      item
        Name = 'OperVid'
        DataType = ftInteger
      end
      item
        Name = 'id_Replicator'
        DataType = ftInteger
      end
      item
        Name = 'ReplicatorShortName'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'id_UserCreator'
        DataType = ftInteger
      end
      item
        Name = 'CreatorFIO'
        DataType = ftString
        Size = 152
      end
      item
        Name = 'id_business'
        DataType = ftInteger
      end
      item
        Name = 'Id_CurrencyBsn'
        DataType = ftInteger
      end
      item
        Name = 'BusinessName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'BusinessNum'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DateLocal'
        DataType = ftDateTime
      end
      item
        Name = 'Correct'
        DataType = ftBoolean
      end
      item
        Name = 'OperTypeIn'
        DataType = ftBoolean
      end
      item
        Name = 'Id_CurrencyOper'
        DataType = ftInteger
      end
      item
        Name = 'CurrencyOperName'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CurrencyOperShortName'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'AmountOper'
        DataType = ftFloat
      end
      item
        Name = 'AmountOper2'
        DataType = ftFloat
      end
      item
        Name = 'PriceOper'
        DataType = ftFloat
      end
      item
        Name = 'RateOper'
        DataType = ftFloat
      end
      item
        Name = 'id_Measure'
        DataType = ftInteger
      end
      item
        Name = 'MeasureName'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RealKoef'
        DataType = ftFloat
      end
      item
        Name = 'AmountOperBaseMS'
        DataType = ftFloat
      end
      item
        Name = 'Id_CurrencySys'
        DataType = ftInteger
      end
      item
        Name = 'CurrencySysName'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CurrencySysShortName'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SummSys'
        DataType = ftFloat
      end
      item
        Name = 'RateSys'
        DataType = ftFloat
      end
      item
        Name = 'id_Acc'
        DataType = ftInteger
      end
      item
        Name = 'id_Warehouse'
        DataType = ftInteger
      end
      item
        Name = 'id_Manufact'
        DataType = ftInteger
      end
      item
        Name = 'SrcName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SrcID_Main'
        DataType = ftInteger
      end
      item
        Name = 'id_Repr'
        DataType = ftInteger
      end
      item
        Name = 'id_CAWhouse'
        DataType = ftInteger
      end
      item
        Name = 'id_Acc_Ext'
        DataType = ftInteger
      end
      item
        Name = 'id_Warehouse_Ext'
        DataType = ftInteger
      end
      item
        Name = 'id_Manufact_Ext'
        DataType = ftInteger
      end
      item
        Name = 'id_Equipment'
        DataType = ftInteger
      end
      item
        Name = 'ReprName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ReprID_Main'
        DataType = ftInteger
      end
      item
        Name = 'ReprWHName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ReprWHID_Main'
        DataType = ftInteger
      end
      item
        Name = 'Id_CurrencyInv'
        DataType = ftInteger
      end
      item
        Name = 'PriceInv'
        DataType = ftFloat
      end
      item
        Name = 'RateInv'
        DataType = ftFloat
      end
      item
        Name = 'CurrencyInvName'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CurrencyInvShortName'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'id_Goods'
        DataType = ftInteger
      end
      item
        Name = 'id_Raw'
        DataType = ftInteger
      end
      item
        Name = 'id_ExtRaw'
        DataType = ftInteger
      end
      item
        Name = 'id_Service'
        DataType = ftInteger
      end
      item
        Name = 'CtgName'
        DataType = ftString
        Size = 4000
      end
      item
        Name = 'WareName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'WareID_Main'
        DataType = ftInteger
      end
      item
        Name = 'Koeff'
        DataType = ftInteger
      end
      item
        Name = 'KoeffName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CheckDate'
        DataType = ftDateTime
      end
      item
        Name = 'id_UserChecker'
        DataType = ftInteger
      end
      item
        Name = 'CheckerFIO'
        DataType = ftString
        Size = 152
      end
      item
        Name = 'id_FormalDistrib'
        DataType = ftInteger
      end
      item
        Name = 'FormalDistribName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'id_FuncDistrib'
        DataType = ftInteger
      end
      item
        Name = 'FuncDistribName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Deleted'
        DataType = ftBoolean
      end
      item
        Name = 'id_ContrAgent'
        DataType = ftInteger
      end
      item
        Name = 'ContrAgentName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'id_CAGroup'
        DataType = ftInteger
      end
      item
        Name = 'SummOper'
        DataType = ftFloat
      end
      item
        Name = 'TypeName'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OperNum'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'OperDelta'
        DataType = ftFloat
      end
      item
        Name = 'OperRateDelta'
        DataType = ftFloat
      end
      item
        Name = 'OperTotalDelta'
        DataType = ftFloat
      end
      item
        Name = 'DTDiff'
        DataType = ftInteger
      end
      item
        Name = 'HasViza'
        DataType = ftBoolean
      end
      item
        Name = 'OperState'
        DataType = ftInteger
      end
      item
        Name = 'HidedOper'
        DataType = ftBoolean
      end
      item
        Name = 'OperSummSys'
        DataType = ftFloat
      end
      item
        Name = 'RateMain'
        DataType = ftFloat
      end
      item
        Name = 'id_Repr_Ex'
        DataType = ftInteger
      end
      item
        Name = 'id_DocType'
        DataType = ftInteger
      end
      item
        Name = 'Imp_PayBasic'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AccInv_PayAssignment'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'Contract'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'OperDeltaCrn'
        DataType = ftFloat
      end
      item
        Name = 'OperRateDeltaCrn'
        DataType = ftFloat
      end
      item
        Name = 'OperTotalDeltaCrn'
        DataType = ftFloat
      end
      item
        Name = 'OperCrnName'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'OperSum_Offer'
        DataType = ftFloat
      end
      item
        Name = 'OperSum_Inv'
        DataType = ftFloat
      end
      item
        Name = 'CRN_OLD_OperSum'
        DataType = ftFloat
      end
      item
        Name = 'CRN_OLD_OperSum_Offer'
        DataType = ftFloat
      end
      item
        Name = 'CRN_OperSum_Inv'
        DataType = ftFloat
      end
      item
        Name = 'OperSumCalced'
        DataType = ftFloat
      end
      item
        Name = 'OperSum_OfferCalced'
        DataType = ftFloat
      end
      item
        Name = 'Blocked'
        DataType = ftBoolean
      end
      item
        Name = 'CurrencyBsnName'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OperTypeSIGN'
        DataType = ftInteger
      end
      item
        Name = 'HasChild'
        DataType = ftInteger
      end
      item
        Name = 'Dig1'
        DataType = ftFloat
      end
      item
        Name = 'Dig2'
        DataType = ftFloat
      end
      item
        Name = 'Dig3'
        DataType = ftFloat
      end
      item
        Name = 'Dig4'
        DataType = ftFloat
      end
      item
        Name = 'Dig5'
        DataType = ftFloat
      end
      item
        Name = 'Dig6'
        DataType = ftFloat
      end
      item
        Name = 'Dig7'
        DataType = ftFloat
      end
      item
        Name = 'Dig8'
        DataType = ftFloat
      end
      item
        Name = 'Dig9'
        DataType = ftFloat
      end
      item
        Name = 'Dig10'
        DataType = ftFloat
      end
      item
        Name = 'Dig11'
        DataType = ftFloat
      end
      item
        Name = 'Dig12'
        DataType = ftFloat
      end
      item
        Name = 'Dig13'
        DataType = ftFloat
      end
      item
        Name = 'Dig14'
        DataType = ftFloat
      end
      item
        Name = 'Dig15'
        DataType = ftFloat
      end
      item
        Name = 'Str1'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Str2'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Str3'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Str4'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Str5'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Str6'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Str7'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Str8'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Str9'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Str10'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Str11'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Str12'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Str13'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Str14'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Str15'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Date1'
        DataType = ftDateTime
      end
      item
        Name = 'Date2'
        DataType = ftDateTime
      end
      item
        Name = 'Date3'
        DataType = ftDateTime
      end
      item
        Name = 'Date4'
        DataType = ftDateTime
      end
      item
        Name = 'Date5'
        DataType = ftDateTime
      end
      item
        Name = 'Date6'
        DataType = ftDateTime
      end
      item
        Name = 'Date7'
        DataType = ftDateTime
      end
      item
        Name = 'Date8'
        DataType = ftDateTime
      end
      item
        Name = 'Date9'
        DataType = ftDateTime
      end
      item
        Name = 'Date10'
        DataType = ftDateTime
      end
      item
        Name = 'Date11'
        DataType = ftDateTime
      end
      item
        Name = 'Date12'
        DataType = ftDateTime
      end
      item
        Name = 'Date13'
        DataType = ftDateTime
      end
      item
        Name = 'Date14'
        DataType = ftDateTime
      end
      item
        Name = 'Date15'
        DataType = ftDateTime
      end
      item
        Name = 'OpComment'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'is_MIrr'
        DataType = ftBoolean
      end>
    Left = 216
    Top = 46
  end
  object DataSource1: TDataSource
    DataSet = cdsExp
    Left = 160
    Top = 184
  end
end
