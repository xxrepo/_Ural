object fOperCrnCh: TfOperCrnCh
  Left = 0
  Top = 0
  Width = 607
  Height = 661
  TabOrder = 0
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 607
    Height = 661
    ActivePage = tsComment
    Align = alClient
    TabOrder = 0
    object tsData: TTabSheet
      Caption = 'Данные'
      object P1: TPanel
        Left = 0
        Top = 0
        Width = 599
        Height = 70
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 0
        object Label9: TLabel
          Left = 2
          Top = 4
          Width = 70
          Height = 13
          Caption = 'Тип операции'
          FocusControl = cbOperTypeIn
        end
        object Label13: TLabel
          Left = 3
          Top = 28
          Width = 58
          Height = 13
          Caption = 'Контрагент'
          FocusControl = DBEdit3
        end
        object Label3: TLabel
          Left = 5
          Top = 56
          Width = 37
          Height = 13
          Caption = 'Бизнес'
        end
        object cbOperTypeIn: TComboBox
          Left = 89
          Top = 0
          Width = 499
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 0
          OnChange = cbOperTypeInChange
          Items.Strings = (
            'Приходная операция'
            'Расходная операция')
        end
        object DBEdit3: TDBEdit
          Left = 89
          Top = 24
          Width = 501
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMenu
          DataField = 'ContrAgentName'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit8: TDBEdit
          Left = 89
          Top = 48
          Width = 501
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMenu
          DataField = 'BusinessName'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 2
        end
      end
      object P2: TPanel
        Left = 0
        Top = 70
        Width = 599
        Height = 26
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 300
          Height = 26
          Align = alLeft
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 0
          object Label2: TLabel
            Left = 4
            Top = 8
            Width = 34
            Height = 13
            Caption = 'Сумма'
          end
          object DBEdit2: TRxDBCalcEdit
            Left = 132
            Top = 3
            Width = 110
            Height = 21
            DataField = 'PriceOper'
            DataSource = dsOperFin
            NumGlyphs = 2
            TabOrder = 0
            OnClick = DBEdit2Click
          end
        end
        inline fCurSelector1: TfCurSelector
          Left = 300
          Width = 299
          Height = 26
          Align = alClient
          TabOrder = 1
          inherited Label1: TLabel
            Left = 4
          end
          inherited cbCur: TComboBox
            Width = 236
          end
        end
      end
      object P_FF: TPanel
        Left = 0
        Top = 96
        Width = 599
        Height = 48
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 2
        Visible = False
        object Label5: TLabel
          Left = 3
          Top = 4
          Width = 103
          Height = 13
          Caption = 'Формальное распр.'
          FocusControl = lcFormalDistrib
        end
        object Label10: TLabel
          Left = 3
          Top = 27
          Width = 124
          Height = 13
          Caption = 'Функциональное распр.'
          FocusControl = lcFuncDistrib
        end
        object lcFormalDistrib: TRxDBLookupCombo
          Left = 132
          Top = 2
          Width = 461
          Height = 21
          DropDownCount = 8
          DataField = 'id_FormalDistrib'
          DataSource = dsOperFin
          Anchors = [akLeft, akTop, akRight]
          LookupField = 'id_FormalDistrib'
          LookupDisplay = 'Name'
          LookupSource = dsFormal
          TabOrder = 0
        end
        object lcFuncDistrib: TRxDBLookupCombo
          Left = 132
          Top = 25
          Width = 461
          Height = 21
          DropDownCount = 8
          DataField = 'id_FuncDistrib'
          DataSource = dsOperFin
          Anchors = [akLeft, akTop, akRight]
          LookupField = 'id_FuncDistrib'
          LookupDisplay = 'Name'
          LookupSource = dsFunc
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 144
        Width = 599
        Height = 489
        Align = alClient
        Caption = 'Комментарий'
        TabOrder = 3
        object DBMemo1: TDBMemo
          Left = 2
          Top = 15
          Width = 595
          Height = 472
          Align = alClient
          DataField = 'OpComment'
          DataSource = dsOperFin
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object tsComment: TTabSheet
      Caption = 'Доп. информация'
      ImageIndex = 1
      object Panel7: TPanel
        Left = 0
        Top = 154
        Width = 599
        Height = 33
        Align = alTop
        Caption = ' '
        TabOrder = 0
        object Label6: TLabel
          Left = 4
          Top = 9
          Width = 59
          Height = 13
          Caption = 'Дата ввода'
          FocusControl = DBEdit4
        end
        object DBEdit4: TDBEdit
          Left = 88
          Top = 4
          Width = 137
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DateLocal'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 0
        end
      end
      inline fExtDataVal1: TfExtDataVal
        Top = 187
        Width = 599
        Height = 446
        Align = alClient
        TabOrder = 1
        inherited ToolBar: TToolBar
          Width = 599
        end
        inherited RxDBGrid1: TRxDBGrid
          Width = 599
          Height = 420
        end
      end
      inline fBJByOper1: TfBJByOper
        Width = 599
        Height = 154
        Align = alTop
        TabOrder = 2
        inherited dbgBJ: TDBGridEh
          Width = 599
          Height = 154
        end
      end
    end
  end
  object cdsOperFin: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Oper'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@is_Mirr'
        ParamType = ptInput
      end>
    ProviderName = 'dsOperProp_v2'
    RemoteServer = DM.rsCA
    AfterPost = cdsOperFinAfterPost
    Left = 96
    Top = 190
  end
  object dsOperFin: TDataSource
    DataSet = cdsOperFin
    Left = 128
    Top = 190
  end
  object cdsFormal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
      end>
    ProviderName = 'dsFormal'
    RemoteServer = DM.rsCA
    Left = 240
    Top = 240
    object cdsFormalid_FormalDistrib: TAutoIncField
      FieldName = 'id_FormalDistrib'
      ReadOnly = True
    end
    object cdsFormalName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object dsFormal: TDataSource
    DataSet = cdsFormal
    Left = 276
    Top = 240
  end
  object dsFunc: TDataSource
    DataSet = cdsFunc
    Left = 276
    Top = 272
  end
  object cdsFunc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
      end>
    ProviderName = 'dsFunc'
    RemoteServer = DM.rsCA
    Left = 240
    Top = 272
    object cdsFuncid_FuncDistrib: TAutoIncField
      FieldName = 'id_FuncDistrib'
      ReadOnly = True
    end
    object cdsFuncName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
end
