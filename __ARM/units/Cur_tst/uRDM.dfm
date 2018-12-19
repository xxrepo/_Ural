object DM_Cur: TDM_Cur
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  Left = 192
  Top = 107
  Height = 480
  Width = 696
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=1;Persist Security Info=True;User I' +
      'D=sa;Initial Catalog=ACS_MBase;Data Source=ovk'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object spUrl: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'Crn_CurrencyGetURLList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 32
    Top = 96
    object spUrlId_URL: TAutoIncField
      FieldName = 'Id_URL'
      ReadOnly = True
    end
    object spUrlName: TStringField
      FieldName = 'Name'
    end
    object spUrlURL: TStringField
      FieldName = 'URL'
      Size = 255
    end
    object spUrlColName: TSmallintField
      FieldName = 'ColName'
    end
    object spUrlColISO: TSmallintField
      FieldName = 'ColISO'
    end
    object spUrlColCode: TSmallintField
      FieldName = 'ColCode'
    end
    object spUrlColRate: TSmallintField
      FieldName = 'ColRate'
    end
    object spUrlColPieces: TSmallintField
      FieldName = 'ColPieces'
    end
    object spUrlUseTable: TSmallintField
      FieldName = 'UseTable'
    end
  end
  object spRates: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'Crn_CurrencyGetRates;1'
    Parameters = <>
    Left = 120
    Top = 88
    object spRatesId_Currency: TIntegerField
      FieldName = 'Id_Currency'
    end
    object spRatesName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object spRatesISOCode: TStringField
      FieldName = 'ISOCode'
      FixedChar = True
      Size = 3
    end
    object spRatesNumberCode: TStringField
      FieldName = 'NumberCode'
      FixedChar = True
      Size = 3
    end
    object spRatesValue: TIntegerField
      FieldName = 'Value'
    end
    object spRatesRate: TFloatField
      FieldName = 'Rate'
    end
    object spRatesid_URL: TIntegerField
      FieldName = 'id_URL'
    end
    object spRatesNewRate: TFloatField
      FieldName = 'NewRate'
    end
  end
  object dsUrl: TDataSetProvider
    DataSet = spUrl
    Constraints = True
    Left = 32
    Top = 144
  end
  object dsRates: TSQLUpdateDSProvider
    DataSet = spRates
    Constraints = True
    Left = 120
    Top = 144
  end
  object spCur: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Crn_CurrencyGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@FastAccess'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end
      item
        Name = '@AvForPay'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 239
    Top = 24
    object spCurId_Currency: TAutoIncField
      FieldName = 'Id_Currency'
      ReadOnly = True
    end
    object spCurName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object spCurShortName: TStringField
      FieldName = 'ShortName'
      Size = 10
    end
    object spCurISOCode: TStringField
      FieldName = 'ISOCode'
      FixedChar = True
      Size = 3
    end
    object spCurNumberCode: TStringField
      FieldName = 'NumberCode'
      FixedChar = True
      Size = 3
    end
    object spCurFastAccess: TBooleanField
      FieldName = 'FastAccess'
    end
    object spCurValue: TIntegerField
      FieldName = 'Value'
    end
    object spCurRate: TFloatField
      FieldName = 'Rate'
    end
    object spCurAvForPay: TBooleanField
      FieldName = 'AvForPay'
    end
    object spCurBase: TBooleanField
      FieldName = 'Base'
    end
    object spCurLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spCurId_URL: TIntegerField
      FieldName = 'Id_URL'
    end
  end
  object dsCur: TDataSetProvider
    DataSet = spCur
    Constraints = True
    Left = 236
    Top = 72
  end
  object spCurProp: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Crn_CurrencyByID;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Id_Currency'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 335
    Top = 24
    object spCurPropId_Currency: TAutoIncField
      FieldName = 'Id_Currency'
      ReadOnly = True
    end
    object spCurPropName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object spCurPropShortName: TStringField
      FieldName = 'ShortName'
      Size = 10
    end
    object spCurPropISOCode: TStringField
      FieldName = 'ISOCode'
      FixedChar = True
      Size = 3
    end
    object spCurPropNumberCode: TStringField
      FieldName = 'NumberCode'
      FixedChar = True
      Size = 3
    end
    object spCurPropFastAccess: TBooleanField
      FieldName = 'FastAccess'
    end
    object spCurPropValue: TIntegerField
      FieldName = 'Value'
    end
    object spCurPropRate: TFloatField
      FieldName = 'Rate'
    end
    object spCurPropAvForPay: TBooleanField
      FieldName = 'AvForPay'
    end
    object spCurPropId_URL: TIntegerField
      FieldName = 'Id_URL'
    end
    object spCurPropBase: TBooleanField
      FieldName = 'Base'
    end
    object spCurPropLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spCurPropURLName: TStringField
      FieldName = 'URLName'
    end
    object spCurPropURL: TStringField
      FieldName = 'URL'
      Size = 255
    end
  end
  object dsCurProp: TDataSetProvider
    DataSet = spCurProp
    Constraints = True
    Left = 332
    Top = 72
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    Parameters = <>
    Left = 136
    Top = 24
  end
  object SQLUpdateDSProvider1: TSQLUpdateDSProvider
    Constraints = True
    OnUpdateError = SQLUpdateDSUpdateError
    Left = 240
    Top = 256
  end
  object spWhoIAm: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'USR_WhoIAm;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Login'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = '0'
      end
      item
        Name = '@Password'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = '0'
      end>
    Left = 456
    Top = 16
    object spWhoIAmid_user: TAutoIncField
      FieldName = 'id_user'
      ReadOnly = True
    end
    object spWhoIAmLogin: TStringField
      FieldName = 'Login'
    end
    object spWhoIAmFirstName: TStringField
      FieldName = 'FirstName'
      Size = 50
    end
    object spWhoIAmLastName: TStringField
      FieldName = 'LastName'
      Size = 50
    end
    object spWhoIAmMiddleName: TStringField
      FieldName = 'MiddleName'
      Size = 50
    end
    object spWhoIAmDisabled: TBooleanField
      FieldName = 'Disabled'
    end
  end
end
