object fBJTreeProp: TfBJTreeProp
  Left = 0
  Top = 0
  Width = 430
  Height = 306
  Constraints.MinHeight = 100
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
      Width = 127
      Height = 13
      Caption = 'Родительская категория'
      FocusControl = DBEdit5
    end
    object DBEdit5: TDBEdit
      Left = 144
      Top = 6
      Width = 256
      Height = 21
      DataField = 'PName'
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
    Height = 35
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = ' '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Название'
      FocusControl = DBEdit1
    end
    object DBEdit1: TDBEdit
      Left = 144
      Top = 5
      Width = 279
      Height = 21
      DataField = 'Name'
      DataSource = dsCtgGoodsProp
      TabOrder = 0
      OnKeyPress = DBEdit1KeyPress
    end
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
    Left = 224
    Top = 48
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
  object dsCtgGoodsProp: TDataSource
    DataSet = cdsBJTProp
    Left = 284
    Top = 54
  end
end
