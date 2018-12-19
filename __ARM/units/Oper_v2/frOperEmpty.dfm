object fOperEmpty: TfOperEmpty
  Left = 0
  Top = 0
  Width = 449
  Height = 348
  TabOrder = 0
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 449
    Height = 348
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Исходные данные'
      ImageIndex = 2
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 441
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 0
        inline fBsnSelector1: TfBsnSelector
          Width = 441
          Height = 33
          Align = alClient
          inherited Label1: TLabel
            Left = 6
          end
          inherited edName: TEdit
            Left = 88
            Width = 323
          end
          inherited Button1: TButton
            Left = 410
          end
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 148
        Width = 441
        Height = 172
        Align = alClient
        Caption = 'Описание операции: '
        TabOrder = 1
        object Label1: TLabel
          Left = 120
          Top = 88
          Width = 70
          Height = 13
          Caption = 'id_UserCreator'
        end
        object DBMemo1: TDBMemo
          Left = 2
          Top = 15
          Width = 437
          Height = 155
          Align = alClient
          Color = clMenu
          DataField = 'OpComment'
          DataSource = DataSource1
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 33
        Width = 441
        Height = 23
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 2
        object Label2: TLabel
          Left = 4
          Top = 6
          Width = 80
          Height = 13
          Caption = 'Ввел сотрудник'
          FocusControl = DBEdit1
        end
        object Label3: TLabel
          Left = 297
          Top = 2
          Width = 59
          Height = 13
          Caption = 'Дата ввода'
          FocusControl = DBEdit2
        end
        object DBEdit1: TDBEdit
          Left = 88
          Top = 0
          Width = 201
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CreatorFIO'
          DataSource = DataSource1
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 360
          Top = 0
          Width = 73
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DateLocal'
          DataSource = DataSource1
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 56
        Width = 441
        Height = 92
        Align = alTop
        Caption = ' Документ: '
        TabOrder = 3
        object Label8: TLabel
          Left = 10
          Top = 23
          Width = 128
          Height = 13
          Caption = 'Осн. платежа/накладная'
        end
        object Label11: TLabel
          Left = 10
          Top = 46
          Width = 145
          Height = 13
          Caption = 'Пл. поручение/Счет фактура'
        end
        object Label17: TLabel
          Left = 10
          Top = 70
          Width = 44
          Height = 13
          Caption = 'Договор'
        end
        object edContract: TDBEdit
          Left = 173
          Top = 66
          Width = 460
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'Contract'
          DataSource = DataSource1
          TabOrder = 2
        end
        object edImp_PayBasic: TDBEdit
          Left = 173
          Top = 18
          Width = 460
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'Imp_PayBasic'
          DataSource = DataSource1
          TabOrder = 0
        end
        object edAccInv_PayAssignment: TDBEdit
          Left = 173
          Top = 42
          Width = 460
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'AccInv_PayAssignment'
          DataSource = DataSource1
          TabOrder = 1
        end
      end
    end
    object tsData: TTabSheet
      Caption = 'Созданные по ней операции'
      inline fArc1: TfArc
        Width = 441
        Height = 320
        Align = alClient
        inherited ToolBar1: TToolBar
          Width = 441
        end
        inherited pnDate: TPanel
          Width = 441
          inherited Panel3: TPanel
            Width = 167
          end
        end
        inherited RxDBGrid1: TDBGridEh
          Width = 441
          Height = 202
        end
        inherited ToolBar2: TToolBar
          Width = 441
          inherited EhGridFilter1: TEhGridFilter
            Width = 63
          end
        end
        inherited StatusBar1: TStatusBar
          Top = 301
          Width = 441
        end
        inherited cdsArc: TClientDataSet
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
              DataType = ftBoolean
              Name = '@HasViza'
              ParamType = ptInput
            end
            item
              DataType = ftDateTime
              Name = '@DateFrom'
              ParamType = ptInput
              Value = 38081d
            end
            item
              DataType = ftDateTime
              Name = '@DateTo'
              ParamType = ptInput
              Value = 38200d
            end
            item
              DataType = ftInteger
              Name = '@id_ContrAgent'
              ParamType = ptInput
            end
            item
              DataType = ftInteger
              Name = '@id_CAGroup'
              ParamType = ptInput
            end
            item
              DataType = ftInteger
              Name = '@id_Repr'
              ParamType = ptInput
            end
            item
              DataType = ftBoolean
              Name = '@CANone'
              ParamType = ptInput
            end
            item
              DataType = ftBoolean
              Name = '@AllRepr'
              ParamType = ptInput
            end
            item
              DataType = ftInteger
              Name = '@id_Warehouse'
              ParamType = ptInput
            end
            item
              DataType = ftBoolean
              Name = '@AllWH'
              ParamType = ptInput
            end
            item
              DataType = ftInteger
              Name = '@id_Acc'
              ParamType = ptInput
            end
            item
              DataType = ftBoolean
              Name = '@AllAcc'
              ParamType = ptInput
            end
            item
              DataType = ftInteger
              Name = '@id_Manufact'
              ParamType = ptInput
            end
            item
              DataType = ftBoolean
              Name = '@AllMN'
              ParamType = ptInput
            end
            item
              DataType = ftInteger
              Name = '@id_user'
              ParamType = ptInput
            end
            item
              DataType = ftBoolean
              Name = '@Correct'
              ParamType = ptInput
            end
            item
              DataType = ftBoolean
              Name = '@Deleted'
              ParamType = ptInput
            end
            item
              DataType = ftInteger
              Name = '@OperVid'
              ParamType = ptInput
            end
            item
              DataType = ftInteger
              Name = '@Koeff'
              ParamType = ptInput
            end
            item
              DataType = ftBoolean
              Name = '@DoUP'
              ParamType = ptInput
            end
            item
              DataType = ftBoolean
              Name = '@DoDOWN'
              ParamType = ptInput
            end
            item
              DataType = ftBoolean
              Name = '@OperFin'
              ParamType = ptInput
              Value = True
            end
            item
              DataType = ftBoolean
              Name = '@OperWare'
              ParamType = ptInput
              Value = True
            end
            item
              DataType = ftBoolean
              Name = '@OperService'
              ParamType = ptInput
              Value = True
            end
            item
              DataType = ftBoolean
              Name = '@OperOffset'
              ParamType = ptInput
              Value = True
            end
            item
              DataType = ftBoolean
              Name = '@OperCrn'
              ParamType = ptInput
              Value = True
            end
            item
              DataType = ftBoolean
              Name = '@OperEmpty'
              ParamType = ptInput
              Value = True
            end>
        end
      end
    end
  end
  object cdsEmptyProp: TClientDataSet
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
        Name = '@id_Oper'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsEOp'
    RemoteServer = DM.rsCA
    Left = 44
    Top = 112
    object cdsEmptyPropOperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object cdsEmptyPropid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsEmptyPropCreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      Size = 152
    end
    object cdsEmptyPropOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsEmptyPropDateLocal: TDateTimeField
      FieldName = 'DateLocal'
    end
    object cdsEmptyPropid_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object cdsEmptyPropDocTypeName: TStringField
      FieldName = 'DocTypeName'
      Size = 255
    end
    object cdsEmptyPropContract: TStringField
      FieldName = 'Contract'
      Size = 1000
    end
    object cdsEmptyPropOpComment: TStringField
      FieldName = 'OpComment'
      Size = 1000
    end
    object cdsEmptyPropid_Oper: TAutoIncField
      FieldName = 'id_Oper'
      ReadOnly = True
    end
    object cdsEmptyPropid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsEmptyPropBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsEmptyPropCheckDate: TDateTimeField
      FieldName = 'CheckDate'
    end
    object cdsEmptyPropImp_PayBasic: TStringField
      FieldName = 'Imp_PayBasic'
      Size = 1000
    end
    object cdsEmptyPropAccInv_PayAssignment: TStringField
      FieldName = 'AccInv_PayAssignment'
      Size = 1000
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsEmptyProp
    Left = 76
    Top = 113
  end
  object cdsEOpArc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_OperParent'
        ParamType = ptInput
        Value = 1
      end>
    ProviderName = 'dsEOpArc'
    RemoteServer = DM.rsCA
    Left = 44
    Top = 151
  end
end
