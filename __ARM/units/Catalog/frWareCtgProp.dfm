object fWareCtgProp: TfWareCtgProp
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
      DataField = 'ParentName'
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
    Height = 76
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
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 99
      Height = 13
      Caption = 'Короткое название'
      FocusControl = DBEdit2
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
    object DBEdit2: TDBEdit
      Left = 144
      Top = 29
      Width = 137
      Height = 21
      DataField = 'ShortName'
      DataSource = dsCtgGoodsProp
      TabOrder = 1
    end
    object cbDisabled: TDBCheckBox
      Left = 144
      Top = 54
      Width = 97
      Height = 17
      Caption = 'Заблокировать'
      DataField = 'Disabled'
      DataSource = dsCtgGoodsProp
      TabOrder = 2
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Visible = False
    end
  end
  object cdsCtgGoodsProp: TClientDataSet
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
        Name = '@id_Ctg'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsCtgGoodsProp'
    RemoteServer = DM.rsCA
    Left = 224
    Top = 48
    object cdsCtgGoodsPropid_Ctg_Goods: TAutoIncField
      FieldName = 'id_Ctg_Goods'
      ReadOnly = True
    end
    object cdsCtgGoodsPropid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsCtgGoodsPropid_BaseCtg_Goods: TIntegerField
      FieldName = 'id_BaseCtg_Goods'
    end
    object cdsCtgGoodsPropDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsCtgGoodsPropLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsCtgGoodsPropBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsCtgGoodsPropCurrencyName: TStringField
      FieldName = 'CurrencyName'
      Size = 30
    end
    object cdsCtgGoodsPropParentName: TStringField
      FieldName = 'ParentName'
      Size = 50
    end
    object cdsCtgGoodsPropName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsCtgGoodsPropShortName: TStringField
      FieldName = 'ShortName'
      Size = 100
    end
    object cdsCtgGoodsPropID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
  end
  object dsCtgGoodsProp: TDataSource
    DataSet = cdsCtgGoodsProp
    Left = 284
    Top = 54
  end
end
