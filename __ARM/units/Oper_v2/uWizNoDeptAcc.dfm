object WizNoDeptAcc: TWizNoDeptAcc
  Left = 94
  Top = 78
  Width = 897
  Height = 529
  Caption = 'Списание остатков со счета'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 557
    Top = 0
    Width = 3
    Height = 461
    Cursor = crHSplit
    Beveled = True
  end
  object Panel2: TPanel
    Left = 0
    Top = 461
    Width = 889
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 803
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
      Left = 704
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Enabled = False
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 557
    Height = 461
    Align = alLeft
    Caption = 'Контрагенты'
    TabOrder = 1
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 553
      Height = 32
      Align = alTop
      Caption = ' '
      TabOrder = 0
      inline fBsnSelector1: TfBsnSelector
        Left = 1
        Top = 1
        Width = 285
        Height = 30
        Align = alLeft
        inherited edName: TEdit
          Left = 88
          Width = 167
        end
        inherited Button1: TButton
          Left = 254
          OnClick = fBsnSelector1Button1Click
        end
      end
      object Panel3: TPanel
        Left = 286
        Top = 1
        Width = 9
        Height = 30
        Align = alLeft
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
      end
      inline fCurSelector1: TfCurSelector
        Left = 295
        Top = 1
        Width = 257
        Height = 30
        Align = alClient
        TabOrder = 2
        inherited Label1: TLabel
          Left = 4
        end
        inherited cbCur: TComboBox
          Width = 186
        end
      end
    end
    inline AccsFrame1: TAccsFrame
      Left = 2
      Top = 77
      Width = 553
      Height = 382
      Align = alClient
      TabOrder = 1
      inherited Splitter1: TSplitter
        Height = 382
      end
      inherited Panel1: TPanel
        Width = 365
        Height = 382
        inherited FilterPanel: TPanel
          Width = 363
        end
        inherited ToolBar: TToolBar
          Width = 363
        end
        inherited RxDBGrid1: TRxDBGrid
          Width = 363
          Height = 315
          OnDblClick = AccsFrame1RxDBGrid1DblClick
        end
      end
      inherited Panel2: TPanel
        Height = 382
        inherited fAccGroup1: TfAccGroup
          Height = 380
          inherited OrgTreeView: TTreeView
            Height = 351
          end
        end
      end
      inherited DataSource: TDataSource
        OnDataChange = AccsFrame1DataSourceDataChange
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 47
      Width = 553
      Height = 30
      Align = alTop
      Caption = ' '
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 71
        Height = 13
        Caption = 'Куда списать:'
      end
      object Button1: TButton
        Left = 255
        Top = 5
        Width = 22
        Height = 21
        Anchors = [akTop, akRight]
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
      object edName: TEdit
        Left = 88
        Top = 5
        Width = 168
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 1
      end
      object CheckBox1: TCheckBox
        Left = 304
        Top = 6
        Width = 169
        Height = 17
        Caption = 'Зачесть задолженность'
        Enabled = False
        TabOrder = 2
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 597
    Top = 0
    Width = 292
    Height = 461
    Align = alClient
    Caption = 'Выбранные счета'
    TabOrder = 2
    object grdCA: TRxDBGrid
      Left = 2
      Top = 15
      Width = 288
      Height = 444
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = grdCADblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Title.Caption = 'Название'
          Width = 247
          Visible = True
        end>
    end
  end
  object Panel9: TPanel
    Left = 560
    Top = 0
    Width = 37
    Height = 461
    Align = alLeft
    TabOrder = 3
    object sbAddOne1: TSpeedButton
      Left = 6
      Top = 16
      Width = 25
      Height = 25
      Action = aAddOne
      NumGlyphs = 2
    end
    object sbDelOne1: TSpeedButton
      Left = 6
      Top = 48
      Width = 25
      Height = 25
      Action = aDelOne
      NumGlyphs = 2
    end
    object sbAddAll1: TSpeedButton
      Left = 6
      Top = 80
      Width = 25
      Height = 25
      Action = aAddAll
      NumGlyphs = 2
    end
    object sbDelAll1: TSpeedButton
      Left = 6
      Top = 112
      Width = 25
      Height = 25
      Action = aDelAll
      NumGlyphs = 2
    end
  end
  object ActionList1: TActionList
    Left = 403
    Top = 162
    object aAddOne: TAction
      Caption = '>'
      Enabled = False
      OnExecute = aAddOneExecute
    end
    object aAddAll: TAction
      Caption = '>>'
      Enabled = False
      OnExecute = aAddAllExecute
    end
    object aDelOne: TAction
      Caption = '<'
      Enabled = False
      OnExecute = aDelOneExecute
    end
    object aDelAll: TAction
      Caption = '<<'
      Enabled = False
      OnExecute = aDelAllExecute
    end
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end>
    Left = 749
    Top = 128
    object RxMemoryData1ID: TIntegerField
      FieldName = 'ID'
    end
    object RxMemoryData1Name: TStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    OnDataChange = DataSource1DataChange
    Left = 709
    Top = 136
  end
  object cdsAccSumm: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Acc'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@Date'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Id_Currency'
        ParamType = ptInput
      end>
    ProviderName = 'dsAccSumm'
    RemoteServer = DM.rsCA
    Left = 744
    Top = 176
    object cdsAccSummId_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object cdsAccSummSumm: TFloatField
      FieldName = 'Summ'
      ReadOnly = True
    end
    object cdsAccSummCrnName: TStringField
      FieldName = 'CrnName'
      ReadOnly = True
      Size = 10
    end
  end
  object mdSumm: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID_Currency'
        DataType = ftInteger
      end
      item
        Name = 'Summ'
        DataType = ftFloat
      end>
    Left = 653
    Top = 232
    object mdSummID_Currency: TIntegerField
      FieldName = 'ID_Currency'
    end
    object mdSummSumm: TFloatField
      FieldName = 'Summ'
    end
  end
end
