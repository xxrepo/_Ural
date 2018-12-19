object Arc201: TArc201
  Left = 210
  Top = 107
  Width = 911
  Height = 612
  Caption = 'Резервирования'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 477
    Width = 903
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Visible = False
  end
  object pnDate: TPanel
    Left = 0
    Top = 0
    Width = 903
    Height = 29
    Align = alTop
    Caption = ' '
    TabOrder = 0
    object Label2: TLabel
      Left = 391
      Top = 8
      Width = 12
      Height = 13
      Caption = 'по'
    end
    object Label3: TLabel
      Left = 247
      Top = 8
      Width = 35
      Height = 13
      Caption = 'Дата с'
    end
    object RxSpeedButton8: TRxSpeedButton
      Left = 508
      Top = 2
      Width = 95
      Height = 22
      DropDownMenu = pmOperFilter
      Caption = 'Тип операций'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    inline fBsnSelector1: TfBsnSelector
      Left = 1
      Top = 1
      Width = 240
      Height = 27
      Align = alLeft
      TabOrder = 2
      inherited edName: TEdit
        Width = 154
      end
      inherited Button1: TButton
        Left = 209
      end
    end
    object dtTo: TDateEdit
      Left = 407
      Top = 5
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object dtFrom: TDateEdit
      Left = 290
      Top = 5
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object cbShowOper: TCheckBox
      Left = 616
      Top = 7
      Width = 153
      Height = 17
      Caption = 'Показывать операции'
      TabOrder = 3
      OnClick = cbShowOperClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 903
    Height = 52
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 34
      Height = 13
      Caption = 'Склад:'
    end
    object Label4: TLabel
      Left = 8
      Top = 33
      Width = 34
      Height = 13
      Caption = 'Товар:'
    end
    object edWH: TEdit
      Left = 56
      Top = 5
      Width = 153
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 211
      Top = 5
      Width = 23
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 235
      Top = 5
      Width = 23
      Height = 21
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object edCA: TEdit
      Left = 403
      Top = 5
      Width = 153
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object BitBtn3: TBitBtn
      Left = 581
      Top = 5
      Width = 23
      Height = 21
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 557
      Top = 5
      Width = 23
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn4Click
    end
    object cbType: TComboBox
      Left = 287
      Top = 5
      Width = 113
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      Items.Strings = (
        'Представитель'
        'Контрагент')
    end
    object BitBtn5: TBitBtn
      Left = 235
      Top = 28
      Width = 23
      Height = 21
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 211
      Top = 28
      Width = 23
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = BitBtn6Click
    end
    object edGoods: TEdit
      Left = 56
      Top = 28
      Width = 153
      Height = 21
      ReadOnly = True
      TabOrder = 9
    end
  end
  inline fRepRez1: TfRepRez
    Top = 81
    Width = 903
    Height = 396
    Align = alClient
    TabOrder = 2
    inherited RxDBGrid1: TDBGridEh
      Width = 903
      Height = 326
      Columns = <
        item
          EditButtons = <>
          FieldName = 'HasDept'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Готово'
          Title.Orientation = tohVertical
          Title.TitleButton = True
          Width = 22
        end
        item
          EditButtons = <>
          FieldName = 'DateCreate'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Дата'
          Title.TitleButton = True
          Width = 97
        end
        item
          EditButtons = <>
          FieldName = 'OperNum'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Номер'
          Title.TitleButton = True
          Width = 175
        end
        item
          EditButtons = <>
          FieldName = 'WareName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Товар'
          Title.TitleButton = True
          Width = 132
        end
        item
          EditButtons = <>
          FieldName = 'AmountOper'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Кол-во|Кол-во'
          Title.TitleButton = True
          Width = 53
        end
        item
          EditButtons = <>
          FieldName = 'MeasureName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Кол-во|Ед. изм'
          Title.TitleButton = True
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'Sended'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Кол-во|Отгружено'
          Title.TitleButton = True
          Width = 81
        end
        item
          EditButtons = <>
          FieldName = 'WareDept'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Кол-во|Остаток'
          Title.TitleButton = True
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = 'ReprName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Получатель|Название'
          Title.TitleButton = True
          Width = 128
        end
        item
          EditButtons = <>
          FieldName = 'ContrAgentName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Получатель|Контрагент'
          Title.TitleButton = True
          Width = 168
        end
        item
          EditButtons = <>
          FieldName = 'SrcName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Склад'
          Title.TitleButton = True
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'CRN_OLD_OperSum'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Сумма|Сумма'
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'CurrencyOperName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Сумма|Валюта'
          Title.TitleButton = True
          Width = 102
        end
        item
          EditButtons = <>
          FieldName = 'SummSys'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Зачтено|Сумма'
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'CurrencySysName'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Зачтено|Валюта'
          Title.TitleButton = True
          Width = 89
        end>
    end
    inherited ToolBar1: TToolBar
      Width = 903
    end
    inherited ToolBar2: TToolBar
      Width = 903
    end
    inherited dsAmount: TDataSource
      OnDataChange = fRepRez1dsAmountDataChange
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 480
    Width = 903
    Height = 105
    Align = alBottom
    Caption = 'Операции по резервированию'
    TabOrder = 3
    Visible = False
  end
  object pmOperFilter: TPopupMenu
    Left = 624
    Top = 8
    object miNoDept: TMenuItem
      Caption = 'Полностью отгруженные'
      Checked = True
      OnClick = miDeptClick
    end
    object miDept: TMenuItem
      Caption = 'Недоотгруденные'
      Checked = True
      OnClick = miDeptClick
    end
  end
end
