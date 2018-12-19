object fBJItemProp: TfBJItemProp
  Left = 0
  Top = 0
  Width = 430
  Height = 306
  Constraints.MinHeight = 65
  Constraints.MinWidth = 430
  TabOrder = 0
  object pBase: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 30
    Align = alTop
    Caption = ' '
    TabOrder = 0
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Категория'
      FocusControl = DBEdit5
    end
    object DBEdit5: TDBEdit
      Left = 128
      Top = 6
      Width = 272
      Height = 21
      DataField = 'P_Name'
      DataSource = dsCtgGoodsProp
      ReadOnly = True
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 399
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 30
    Width = 430
    Height = 276
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = ' '
    TabOrder = 1
    object lbMain: TLabel
      Left = 5
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Название'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 5
      Top = 35
      Width = 52
      Height = 13
      Caption = 'На начало'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 5
      Top = 60
      Width = 26
      Height = 13
      Caption = 'План'
      FocusControl = DBEdit3
    end
    object Label1: TLabel
      Left = 5
      Top = 84
      Width = 116
      Height = 13
      Caption = 'Незапланир. операции'
      FocusControl = DBEdit4
    end
    object DBEdit1: TDBEdit
      Left = 128
      Top = 5
      Width = 273
      Height = 21
      DataField = 'Name'
      DataSource = dsCtgGoodsProp
      TabOrder = 0
      OnKeyPress = DBEdit1KeyPress
    end
    object BitBtn2: TBitBtn
      Left = 399
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
      OnClick = BitBtn2Click
    end
    object DBEdit2: TDBEdit
      Left = 128
      Top = 32
      Width = 121
      Height = 21
      DataField = 'PlanIn'
      DataSource = dsCtgGoodsProp
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 128
      Top = 56
      Width = 121
      Height = 21
      DataField = 'PlanDelta'
      DataSource = dsCtgGoodsProp
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 128
      Top = 81
      Width = 121
      Height = 21
      DataField = 'PlanCorrect'
      DataSource = dsCtgGoodsProp
      TabOrder = 4
    end
    object DBCheckBox1: TDBCheckBox
      Left = 128
      Top = 110
      Width = 297
      Height = 17
      Caption = 'Постоянная величина (переносить при копировании)'
      DataField = 'isDirect'
      DataSource = dsCtgGoodsProp
      TabOrder = 5
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 128
      Top = 131
      Width = 220
      Height = 17
      Caption = 'Входящее состояние'
      DataField = 'isInState'
      DataSource = dsCtgGoodsProp
      TabOrder = 6
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object cdsBIP: TClientDataSet
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
        Name = '@id_BJ_Item'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsBIP'
    RemoteServer = DM.rsCA
    Left = 248
    Top = 56
    object cdsBIPisDeb: TBooleanField
      FieldName = 'isDeb'
    end
    object cdsBIPName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsBIPid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsBIPid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object cdsBIPid_BJ_Tree: TIntegerField
      FieldName = 'id_BJ_Tree'
    end
    object cdsBIPid_BJ_Item: TAutoIncField
      FieldName = 'id_BJ_Item'
    end
    object cdsBIPExtID: TIntegerField
      FieldName = 'ExtID'
    end
    object cdsBIPPlanIn: TBCDField
      FieldName = 'PlanIn'
      DisplayFormat = '0.00'
      Precision = 19
    end
    object cdsBIPPlanDelta: TBCDField
      FieldName = 'PlanDelta'
      DisplayFormat = '0.00'
      Precision = 19
    end
    object cdsBIPP_Name: TStringField
      FieldName = 'P_Name'
      Size = 255
    end
    object cdsBIPid_BJ_Obj: TIntegerField
      FieldName = 'id_BJ_Obj'
    end
    object cdsBIPid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsBIPPlanCorrect: TBCDField
      FieldName = 'PlanCorrect'
      Precision = 19
    end
    object cdsBIPisDirect: TBooleanField
      FieldName = 'isDirect'
    end
    object cdsBIPisInState: TBooleanField
      FieldName = 'isInState'
    end
  end
  object dsCtgGoodsProp: TDataSource
    DataSet = cdsBIP
    Left = 284
    Top = 54
  end
  object cdsBJTProp: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_BJ_Tree'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'dsBJTProp'
    RemoteServer = DM.rsCA
    Left = 320
    Top = 88
    object cdsBJTPropid_BJ_Tree: TAutoIncField
      FieldName = 'id_BJ_Tree'
      ReadOnly = True
    end
    object cdsBJTPropid_BJ_Obj: TIntegerField
      FieldName = 'id_BJ_Obj'
    end
    object cdsBJTPropName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsBJTPropDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsBJTPropPID: TIntegerField
      FieldName = 'PID'
    end
    object cdsBJTPropPName: TStringField
      FieldName = 'PName'
      Size = 255
    end
    object cdsBJTPropisDeb: TBooleanField
      FieldName = 'isDeb'
    end
    object cdsBJTPropExtID: TIntegerField
      FieldName = 'ExtID'
    end
  end
end
