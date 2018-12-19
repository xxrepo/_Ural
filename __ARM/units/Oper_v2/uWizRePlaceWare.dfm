object WizReplaceWare: TWizReplaceWare
  Left = 85
  Top = 95
  Width = 897
  Height = 529
  Caption = 'Списание остатков с контрагентов'
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
      object Label3: TLabel
        Left = 304
        Top = 8
        Width = 39
        Height = 13
        Caption = 'Товары'
      end
      inline fBsnSelector1: TfBsnSelector
        Left = 1
        Top = 1
        Width = 285
        Height = 30
        Align = alLeft
        inherited edName: TEdit
          Left = 94
          Width = 145
        end
        inherited Button1: TButton
          Left = 238
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
      object cbG: TComboBox
        Left = 384
        Top = 8
        Width = 161
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnChange = cbGChange
        Items.Strings = (
          'Все товары'
          'Только выбранные')
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 47
      Width = 553
      Height = 30
      Align = alTop
      Caption = ' '
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 83
        Height = 13
        Caption = 'Откуда списать:'
      end
      object Label2: TLabel
        Left = 304
        Top = 8
        Width = 71
        Height = 13
        Caption = 'Куда списать:'
      end
      object Button1: TButton
        Left = 239
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
        Left = 95
        Top = 5
        Width = 145
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 1
      end
      object Button2: TButton
        Left = 527
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
        TabOrder = 2
        OnClick = Button2Click
      end
      object edName2: TEdit
        Left = 383
        Top = 5
        Width = 145
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 3
      end
    end
    inline fWare1: TfWare
      Left = 2
      Top = 77
      Width = 553
      Height = 382
      Align = alClient
      TabOrder = 2
      inherited Splitter1888: TSplitter
        Height = 315
      end
      inherited spFind3: TSplitter
        Left = 365
        Height = 315
      end
      inherited ToolBar1: TToolBar
        Width = 553
      end
      inherited pcCldObj: TPageControl
        Width = 82
        Height = 315
        inherited tsCtg: TTabSheet
          inherited fTreeChItem1: TfTreeChItem
            inherited tvChild: TTreeView
              OnChange = fTreeChItem1tvChildChange
            end
          end
        end
        inherited tsWare: TTabSheet
          inherited Splitter2: TSplitter
            Top = 170
            Width = 74
          end
          inherited grdList: TRxDBGrid
            Width = 74
            Height = 103
            OnDblClick = fWare1grdListDblClick
          end
          inherited ToolBar2: TToolBar
            Width = 74
            inherited ToolButton8: TToolButton
              Wrap = True
            end
            inherited ToolButton9: TToolButton
              Left = 0
              Top = 38
              Wrap = True
            end
            inherited ToolButton10: TToolButton
              Left = 0
              Top = 74
            end
            inherited ToolButton11: TToolButton
              Left = 0
              Top = 74
              Wrap = True
            end
            inherited ToolButton12: TToolButton
              Left = 0
              Top = 115
            end
          end
          inherited FilterPanel: TPanel
            Width = 74
          end
          inherited pnAmount: TPanel
            Top = 174
            Width = 74
            inherited Label3: TLabel
              Width = 72
            end
            inherited RxDBGrid1: TRxDBGrid
              Width = 72
            end
          end
        end
      end
      inherited Panel1: TPanel
        Width = 553
      end
      inherited fWareCtgTree1: TfWareCtgTree
        Height = 315
        inherited TreeView1: TTreeView
          Height = 286
          OnChange = fWareCtgTree1TreeView1Change
        end
      end
      inherited pnFind: TPanel
        Left = 368
        Height = 315
        inherited fWareFinder1: TfWareFinder
          Height = 313
          inherited StatusBar1: TStatusBar
            Top = 294
          end
          inherited PageControl1: TPageControl
            Height = 267
            inherited tsWare: TTabSheet
              inherited Panel3: TPanel
                Height = 239
                inherited grdList: TRxDBGrid
                  Height = 208
                end
              end
            end
          end
        end
      end
      inherited dsWaresList: TDataSource
        OnDataChange = fWare1dsWaresListDataChange
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 597
    Top = 0
    Width = 292
    Height = 461
    Align = alClient
    Caption = 'Выбранные товары'
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
      end
      item
        Name = 'id_Measure'
        DataType = ftInteger
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
    object RxMemoryData1id_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    OnDataChange = DataSource1DataChange
    Left = 709
    Top = 136
  end
  object cdsCtg_GetGoods: TClientDataSet
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
        Name = '@ID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsCtg_GetGoods'
    RemoteServer = DM.rsCA
    Left = 160
    Top = 16
    object cdsCtg_GetGoodsId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object cdsCtg_GetGoodsName: TStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object cdsGoods: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Ctg_Goods'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@Disabled'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_business'
        ParamType = ptInput
      end>
    ProviderName = 'dsGoods'
    RemoteServer = DM.rsCA
    Left = 306
    Top = 80
  end
end
