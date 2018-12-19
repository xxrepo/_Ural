object fReprPropLC: TfReprPropLC
  Left = 0
  Top = 0
  Width = 430
  Height = 370
  Constraints.MinHeight = 370
  Constraints.MinWidth = 430
  TabOrder = 0
  object pnCA: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 28
    Align = alTop
    TabOrder = 0
    object Label8: TLabel
      Left = 8
      Top = 8
      Width = 35
      Height = 13
      Caption = 'Группа'
    end
    object DBLookupComboBox1: TRxDBLookupCombo
      Left = 62
      Top = 2
      Width = 339
      Height = 21
      DropDownCount = 8
      DisplayEmpty = 'без группы'
      LookupField = 'id_Group'
      LookupDisplay = 'Name'
      LookupSource = DataSource1
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 28
    Width = 430
    Height = 342
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = ' '
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 33
      Width = 50
      Height = 13
      Caption = 'Название'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 8
      Top = 122
      Width = 31
      Height = 13
      Caption = 'Адрес'
      FocusControl = DBMemo1
    end
    object Label3: TLabel
      Left = 8
      Top = 226
      Width = 50
      Height = 13
      Caption = 'Описание'
      FocusControl = DBMemo2
    end
    object Label5: TLabel
      Left = 8
      Top = 80
      Width = 22
      Height = 13
      Caption = 'Имя'
      FocusControl = DBEdit2
    end
    object Label6: TLabel
      Left = 8
      Top = 104
      Width = 47
      Height = 13
      Caption = 'Отчество'
      FocusControl = DBEdit3
    end
    object Label7: TLabel
      Left = 8
      Top = 56
      Width = 49
      Height = 13
      Caption = 'Фамилия'
      FocusControl = DBEdit4
    end
    object Label4: TLabel
      Left = 8
      Top = 8
      Width = 19
      Height = 13
      Caption = 'Тип'
    end
    object DBEdit1: TDBEdit
      Left = 62
      Top = 29
      Width = 339
      Height = 21
      DataField = 'Name'
      DataSource = dsProp
      TabOrder = 1
    end
    object DBMemo1: TDBMemo
      Left = 8
      Top = 138
      Width = 413
      Height = 89
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Addr'
      DataSource = dsProp
      TabOrder = 5
    end
    object DBMemo2: TDBMemo
      Left = 8
      Top = 242
      Width = 415
      Height = 89
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Descr'
      DataSource = dsProp
      TabOrder = 6
    end
    object DBEdit2: TDBEdit
      Left = 62
      Top = 77
      Width = 257
      Height = 21
      DataField = 'FirstName'
      DataSource = dsProp
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 62
      Top = 101
      Width = 257
      Height = 21
      DataField = 'MiddleName'
      DataSource = dsProp
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 62
      Top = 53
      Width = 257
      Height = 21
      DataField = 'LastName'
      DataSource = dsProp
      TabOrder = 2
    end
    object cbIsJur: TComboBox
      Left = 62
      Top = 4
      Width = 339
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnChange = cbIsJurChange
      Items.Strings = (
        'Юридическое лицо'
        'Физическое лицо')
    end
  end
  object cdsReprProp: TClientDataSet
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
        Name = '@id_Repr'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsReprProp'
    RemoteServer = DM.rsCA
    Left = 280
    Top = 256
    object cdsReprPropName: TStringField
      DisplayLabel = 'Название'
      FieldName = 'Name'
      Size = 255
    end
    object cdsReprPropDisabled: TBooleanField
      DisplayLabel = 'Заблокирован'
      FieldName = 'Disabled'
    end
    object cdsReprPropAddr: TStringField
      FieldName = 'Addr'
      Size = 2000
    end
    object cdsReprPropDescr: TStringField
      FieldName = 'Descr'
      Size = 2000
    end
    object cdsReprPropid_Repr: TAutoIncField
      FieldName = 'id_Repr'
      ReadOnly = True
    end
    object cdsReprPropid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object cdsReprPropisJur: TBooleanField
      FieldName = 'isJur'
      OnChange = cdsReprPropisJurChange
    end
    object cdsReprPropFirstName: TStringField
      DisplayLabel = 'Имя'
      FieldName = 'FirstName'
      Size = 30
    end
    object cdsReprPropMiddleName: TStringField
      DisplayLabel = 'Отчество'
      FieldName = 'MiddleName'
      Size = 30
    end
    object cdsReprPropLastName: TStringField
      DisplayLabel = 'Фамилия'
      FieldName = 'LastName'
      Size = 30
    end
    object cdsReprPropCAName: TStringField
      FieldName = 'CAName'
      Size = 50
    end
    object cdsReprPropId_Currency: TIntegerField
      FieldName = 'Id_Currency'
    end
    object cdsReprPropCurrencyName: TStringField
      FieldName = 'CurrencyName'
      Size = 30
    end
    object cdsReprPropNeedSend: TBooleanField
      FieldName = 'NeedSend'
    end
    object cdsReprPropGroupName: TStringField
      FieldName = 'GroupName'
      Size = 255
    end
    object cdsReprPropid_Repr_Group: TIntegerField
      FieldName = 'id_Repr_Group'
    end
    object cdsReprPropid_Bsn: TIntegerField
      FieldName = 'id_Bsn'
      ReadOnly = True
    end
  end
  object dsProp: TDataSource
    DataSet = cdsReprProp
    Left = 204
    Top = 174
  end
  object dsReprContact: TDataSource
    Left = 388
    Top = 144
  end
  object cdsReprGroup: TClientDataSet
    Aggregates = <>
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
        Value = '0'
      end>
    ProviderName = 'dsReprGroup'
    RemoteServer = DM.rsCA
    Left = 30
    Top = 45
    object cdsAccGroupid_Group: TIntegerField
      FieldName = 'id_Group'
      ReadOnly = True
    end
    object cdsAccGroupName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object cdsAccGroupCnt: TIntegerField
      FieldName = 'Cnt'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsReprGroup
    Left = 6
    Top = 69
  end
end
