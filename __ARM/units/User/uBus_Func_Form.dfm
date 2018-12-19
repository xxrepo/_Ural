object Bus_Func_Form: TBus_Func_Form
  Left = 257
  Top = 197
  Width = 774
  Height = 722
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Выбор бизнеса и функции'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 642
    Width = 758
    Height = 41
    Align = alBottom
    TabOrder = 0
    object OkButton: TButton
      Left = 576
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
      OnClick = OkButtonClick
    end
    object Button2: TButton
      Left = 672
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 642
    Align = alClient
    TabOrder = 1
    inline fBsnSelector1: TfBsnSelector
      Left = 1
      Top = 1
      Width = 756
      Height = 31
      Align = alTop
      Enabled = False
      inherited edName: TEdit
        Width = 678
      end
      inherited Button1: TButton
        Left = 733
        Visible = False
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 32
      Width = 756
      Height = 609
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Функции'
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 748
          Height = 581
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 0
          object Splitter1: TSplitter
            Left = 348
            Top = 2
            Width = 3
            Height = 577
            Cursor = crHSplit
            Beveled = True
          end
          object Panel8: TPanel
            Left = 2
            Top = 2
            Width = 346
            Height = 577
            Align = alLeft
            TabOrder = 0
            object Label18: TLabel
              Left = 1
              Top = 1
              Width = 344
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Функции'
            end
            object DBGrid1: TDBGrid
              Left = 1
              Top = 14
              Width = 344
              Height = 562
              Align = alClient
              DataSource = DataSource1
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGrid1DblClick
              OnDragDrop = DBGrid1DragDrop
              OnDragOver = DBGrid1DragOver
              OnMouseMove = DBGrid1MouseMove
              Columns = <
                item
                  Expanded = False
                  FieldName = 'FuncName'
                  Title.Caption = 'Функция'
                  Width = 208
                  Visible = True
                end>
            end
          end
          object Panel9: TPanel
            Left = 351
            Top = 2
            Width = 37
            Height = 577
            Align = alLeft
            TabOrder = 1
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
          object Panel10: TPanel
            Left = 388
            Top = 2
            Width = 358
            Height = 577
            Align = alClient
            TabOrder = 2
            object Label19: TLabel
              Left = 1
              Top = 1
              Width = 356
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Выбранные функции'
            end
            object DBGrid2: TDBGrid
              Left = 1
              Top = 14
              Width = 356
              Height = 562
              Align = alClient
              DataSource = DataSource2
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGrid2DblClick
              OnDragDrop = DBGrid2DragDrop
              OnDragOver = DBGrid2DragOver
              OnMouseMove = DBGrid2MouseMove
              Columns = <
                item
                  Expanded = False
                  FieldName = 'FuncName'
                  Title.Caption = 'Функция'
                  Width = 233
                  Visible = True
                end>
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Счета'
        ImageIndex = 1
        inline fObjListAcc: TfObjList
          Width = 748
          Height = 581
          Align = alClient
          inherited ToolBar1: TToolBar
            Width = 748
          end
          inherited RxDBGrid1: TRxDBGrid
            Width = 748
            Height = 554
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Контрагенты'
        ImageIndex = 2
        inline fObjListCA: TfObjList
          Width = 748
          Height = 581
          Align = alClient
          inherited ToolBar1: TToolBar
            Width = 748
          end
          inherited RxDBGrid1: TRxDBGrid
            Width = 748
            Height = 554
          end
        end
      end
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
        Name = '@id_Group'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Business'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@Has'
        ParamType = ptInput
      end>
    ProviderName = 'dsGroupRights'
    RemoteServer = DM.rsCA
    Left = 48
    Top = 101
    object AutoIncField1: TAutoIncField
      FieldName = 'id_Func'
    end
    object StringField1: TStringField
      FieldName = 'FuncName'
      Size = 50
    end
    object IntegerField1: TIntegerField
      FieldName = 'Has'
    end
    object ClientDataSet1id_Business: TIntegerField
      FieldName = 'id_Business'
    end
    object ClientDataSet1id_Group: TIntegerField
      FieldName = 'id_Group'
    end
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Group'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Business'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@Has'
        ParamType = ptInput
      end>
    ProviderName = 'dsGroupRights'
    RemoteServer = DM.rsCA
    Left = 112
    Top = 109
    object AutoIncField2: TAutoIncField
      FieldName = 'id_Func'
    end
    object StringField2: TStringField
      FieldName = 'FuncName'
      Size = 50
    end
    object IntegerField2: TIntegerField
      FieldName = 'Has'
    end
    object ClientDataSet2id_Business: TIntegerField
      FieldName = 'id_Business'
    end
    object ClientDataSet2id_Group: TIntegerField
      FieldName = 'id_Group'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    OnDataChange = DataSource1DataChange
    Left = 51
    Top = 59
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    OnDataChange = DataSource2DataChange
    Left = 115
    Top = 67
  end
  object ActionList1: TActionList
    Left = 403
    Top = 162
    object aAddOne: TAction
      Caption = '>'
      OnExecute = aAddOneExecute
    end
    object aAddAll: TAction
      Caption = '>>'
      OnExecute = aAddAllExecute
    end
    object aDelOne: TAction
      Caption = '<'
      OnExecute = aDelOneExecute
    end
    object aDelAll: TAction
      Caption = '<<'
      OnExecute = aDelAllExecute
    end
  end
  object cdsPermitGetListAcc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Group'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_business'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@CA'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@ACC'
        ParamType = ptInput
      end>
    ProviderName = 'dsPermitGetList'
    RemoteServer = DM.rsCA
    Left = 484
    Top = 82
    object cdsPermitGetListAccid_Permit: TAutoIncField
      FieldName = 'id_Permit'
      ReadOnly = True
    end
    object cdsPermitGetListAccid_Group: TIntegerField
      FieldName = 'id_Group'
    end
    object cdsPermitGetListAccid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsPermitGetListAccid_Acc_Group: TIntegerField
      FieldName = 'id_Acc_Group'
    end
    object cdsPermitGetListAccid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object cdsPermitGetListAccid_CAGroup: TIntegerField
      FieldName = 'id_CAGroup'
    end
    object cdsPermitGetListAccName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsPermitGetListAccid_business: TIntegerField
      FieldName = 'id_business'
    end
  end
end
