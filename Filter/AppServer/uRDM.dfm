object UnFilter: TUnFilter
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 195
  Top = 209
  Height = 627
  Width = 957
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=1;Persist Security Info=True;User I' +
      'D=sa;Initial Catalog=ACS_MBase;Data Source=ovk;Extended Properti' +
      'es="Use Encryption for Data=False;Tag with column collation when' +
      ' possible=False";Use Procedure for Prepare=1;Auto Translate=True' +
      ';Packet Size=4096;Workstation ID=HP'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 26
    Top = 8
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 8
  end
  object SQLUpdateDSProvider1: TSQLUpdateDSProvider
    Constraints = True
    OnUpdateError = SQLUpdateDSUpdateError
    Left = 248
    Top = 16
  end
  object spWhoIAm: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
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
    Left = 33
    Top = 64
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
  object spGetObj: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FLT_GetObj;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_univ'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 41
    Top = 120
    object spGetObjid_Rel: TAutoIncField
      FieldName = 'id_Rel'
      ReadOnly = True
    end
    object spGetObjid_Obj: TIntegerField
      FieldName = 'id_Obj'
    end
    object spGetObjid_RelParent: TIntegerField
      FieldName = 'id_RelParent'
    end
    object spGetObjRelName: TStringField
      FieldName = 'RelName'
      ReadOnly = True
      Size = 50
    end
    object spGetObjisDetail: TBooleanField
      FieldName = 'isDetail'
    end
    object spGetObjTableName: TStringField
      FieldName = 'TableName'
      Size = 50
    end
    object spGetObjRelField: TStringField
      FieldName = 'RelField'
      Size = 50
    end
    object spGetObjKeyField: TStringField
      FieldName = 'KeyField'
      Size = 50
    end
    object spGetObjMinLen: TIntegerField
      FieldName = 'MinLen'
    end
    object spGetObjisExtParam: TBooleanField
      FieldName = 'isExtParam'
    end
    object spGetObjExtID: TIntegerField
      FieldName = 'ExtID'
    end
    object spGetObjNameField: TStringField
      FieldName = 'NameField'
      Size = 100
    end
  end
  object dsGetObj: TDataSetProvider
    DataSet = spGetObj
    Constraints = True
    Left = 48
    Top = 168
  end
  object spGetUnivPropList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FLT_GetUnivPropList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_univ'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 169
    Top = 120
    object spGetUnivPropListid_Obj: TIntegerField
      FieldName = 'id_Obj'
    end
    object spGetUnivPropListid_Prop: TAutoIncField
      FieldName = 'id_Prop'
      ReadOnly = True
    end
    object spGetUnivPropListFieldType: TStringField
      FieldName = 'FieldType'
      Size = 10
    end
    object spGetUnivPropListFieldDescr: TStringField
      FieldName = 'FieldDescr'
      Size = 255
    end
    object spGetUnivPropListFieldName: TStringField
      FieldName = 'FieldName'
      Size = 100
    end
    object spGetUnivPropListNeedAlias: TBooleanField
      FieldName = 'NeedAlias'
    end
  end
  object dsGetUnivPropList: TDataSetProvider
    DataSet = spGetUnivPropList
    Constraints = True
    Left = 168
    Top = 168
  end
  object dsGrp: TDataSetProvider
    DataSet = spGrp
    Constraints = True
    Left = 32
    Top = 448
  end
  object spGrp: TADOStoredProc
    Connection = ADOConnection1
    CursorLocation = clUseServer
    CursorType = ctDynamic
    ProcedureName = 'FLT_FLT_GroupGetProp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftSmallint
        Direction = pdReturnValue
        Value = Null
      end
      item
        Name = '@id_Filter'
        DataType = ftSmallint
        Value = 0
      end>
    Left = 33
    Top = 400
    object spGrpid_Filter: TIntegerField
      FieldName = 'id_Filter'
    end
    object spGrpid_Prop: TIntegerField
      FieldName = 'id_Prop'
    end
    object spGrpid_Obj: TIntegerField
      FieldName = 'id_Obj'
    end
    object spGrpid_Rel: TIntegerField
      FieldName = 'id_Rel'
    end
  end
  object dsAggs: TDataSetProvider
    DataSet = spAggs
    Constraints = True
    Left = 96
    Top = 448
  end
  object spAggs: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FLT_FLT_AggsGetProp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Value = 0
      end
      item
        Name = '@id_Filter'
        DataType = ftInteger
        Value = 0
      end>
    Left = 97
    Top = 400
    object spAggsid_Aggs: TAutoIncField
      FieldName = 'id_Aggs'
      ReadOnly = True
    end
    object spAggsid_Filter: TIntegerField
      FieldName = 'id_Filter'
    end
    object spAggsid_Prop: TIntegerField
      FieldName = 'id_Prop'
    end
    object spAggsid_Rel: TIntegerField
      FieldName = 'id_Rel'
    end
    object spAggsAggCode: TIntegerField
      FieldName = 'AggCode'
    end
  end
  object dsFltProp: TDataSetProvider
    DataSet = spFltProp
    Constraints = True
    Left = 352
    Top = 184
  end
  object spFltProp: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FLT_FLT_FilterGetProp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_Filter'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 353
    Top = 136
    object spFltPropid_Filter: TAutoIncField
      FieldName = 'id_Filter'
      ReadOnly = True
    end
    object spFltPropName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object spFltPropid_User: TIntegerField
      FieldName = 'id_User'
    end
    object spFltPropDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object spFltPropLastModified: TDateTimeField
      FieldName = 'LastModified'
    end
    object spFltPropid_univ: TIntegerField
      FieldName = 'id_univ'
    end
    object spFltPropid_business: TIntegerField
      FieldName = 'id_business'
    end
    object spFltPropBsnName: TStringField
      FieldName = 'BsnName'
      Size = 50
    end
  end
  object dsCond: TDataSetProvider
    DataSet = spCond
    Constraints = True
    Left = 208
    Top = 312
  end
  object spCond: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FLT_FLT_CondGetProp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftSmallint
        Direction = pdReturnValue
        Value = 0
      end
      item
        Name = '@id_Filter'
        DataType = ftSmallint
        Value = 0
      end>
    Left = 209
    Top = 256
    object spCondid_Cond: TAutoIncField
      FieldName = 'id_Cond'
      ReadOnly = True
    end
    object spCondid_Filter: TIntegerField
      FieldName = 'id_Filter'
    end
    object spCondid_Obj: TIntegerField
      FieldName = 'id_Obj'
    end
    object spCondid_Prop: TIntegerField
      FieldName = 'id_Prop'
    end
    object spCondid_Rel: TIntegerField
      FieldName = 'id_Rel'
    end
    object spCondCondCode: TIntegerField
      FieldName = 'CondCode'
    end
    object spCondPar1: TStringField
      FieldName = 'Par1'
      Size = 1000
    end
    object spCondPar2: TStringField
      FieldName = 'Par2'
      Size = 1000
    end
    object spCondCondNum: TIntegerField
      FieldName = 'CondNum'
    end
  end
  object dsObj: TDataSetProvider
    DataSet = spObj
    Constraints = True
    Left = 384
    Top = 320
  end
  object spObj: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FLT_FLT_ObjGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Obj'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 385
    Top = 272
    object spObjID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object spObjName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object spObjid_bsn: TIntegerField
      FieldName = 'id_bsn'
      ReadOnly = True
    end
  end
  object dsFltList: TDataSetProvider
    DataSet = spFltList
    Constraints = True
    Left = 424
    Top = 184
  end
  object spFltList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FLT_FLT_FilterGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Size = -1
        Value = 0
      end
      item
        Name = '@id_User'
        DataType = ftSmallint
        Value = 0
      end>
    Left = 425
    Top = 136
  end
  object spGetData: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FLT_GetData;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@SQLText'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@id_user'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_business'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 297
    Top = 248
  end
  object dsGetData: TDataSetProvider
    DataSet = spGetData
    Constraints = True
    Left = 296
    Top = 296
  end
  object dsSQLStr: TDataSetProvider
    DataSet = spSQLStr
    Constraints = True
    Left = 272
    Top = 152
  end
  object spSQLStr: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FLT_Eng_CondStr_Ext;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_Filter'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 273
    Top = 104
    object spSQLStrisDetail: TBooleanField
      FieldName = 'isDetail'
    end
    object spSQLStrid_RelParent: TIntegerField
      FieldName = 'id_RelParent'
    end
    object spSQLStrid_Prop: TIntegerField
      FieldName = 'id_Prop'
    end
    object spSQLStrFieldName: TStringField
      FieldName = 'FieldName'
      Size = 100
    end
    object spSQLStrFieldType: TStringField
      FieldName = 'FieldType'
      Size = 10
    end
    object spSQLStrid_Rel: TIntegerField
      FieldName = 'id_Rel'
    end
    object spSQLStrCondCode: TIntegerField
      FieldName = 'CondCode'
    end
    object spSQLStrPar1: TStringField
      FieldName = 'Par1'
      Size = 1000
    end
    object spSQLStrPar2: TStringField
      FieldName = 'Par2'
      Size = 1000
    end
    object spSQLStrTableName: TStringField
      FieldName = 'TableName'
      Size = 50
    end
    object spSQLStrRelField: TStringField
      FieldName = 'RelField'
      Size = 100
    end
    object spSQLStrKeyField: TStringField
      FieldName = 'KeyField'
      Size = 100
    end
    object spSQLStrid_business: TIntegerField
      FieldName = 'id_business'
      ReadOnly = True
    end
    object spSQLStrid_Obj: TIntegerField
      FieldName = 'id_Obj'
    end
    object spSQLStrisExtParam: TBooleanField
      FieldName = 'isExtParam'
    end
    object spSQLStrCondNum: TIntegerField
      FieldName = 'CondNum'
    end
  end
  object dsOperExtDataNamez: TDataSetProvider
    DataSet = spOperExtDataNamez
    Constraints = True
    Left = 408
    Top = 64
  end
  object spOperExtDataNamez: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'OP_OperExtDataNamez;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_business'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 409
    Top = 16
  end
  object dsCondList: TDataSetProvider
    DataSet = spCondList
    Constraints = True
    Left = 208
    Top = 424
  end
  object spCondList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FLT_FLT_CondGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Value = 0
      end
      item
        Name = '@id_Filter'
        DataType = ftInteger
        Value = 0
      end>
    Left = 209
    Top = 376
    object spCondListCondNum: TIntegerField
      FieldName = 'CondNum'
    end
  end
  object spCond_v2: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FLT_FLT_CondGet_v2;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Filter'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@CondNum'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 289
    Top = 376
    object AutoIncField1: TAutoIncField
      FieldName = 'id_Cond'
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'id_Filter'
    end
    object IntegerField2: TIntegerField
      FieldName = 'id_Obj'
    end
    object IntegerField3: TIntegerField
      FieldName = 'id_Prop'
    end
    object IntegerField4: TIntegerField
      FieldName = 'id_Rel'
    end
    object IntegerField5: TIntegerField
      FieldName = 'CondCode'
    end
    object StringField1: TStringField
      FieldName = 'Par1'
      Size = 1000
    end
    object StringField2: TStringField
      FieldName = 'Par2'
      Size = 1000
    end
    object IntegerField6: TIntegerField
      FieldName = 'CondNum'
    end
  end
  object dsCond_v2: TDataSetProvider
    DataSet = spCond_v2
    Constraints = True
    Left = 288
    Top = 432
  end
  object spGetData2: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FLT_GetData_v2;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@SQLText0'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam0'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText3'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam3'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText4'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam4'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText5'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam5'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText6'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam6'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText7'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam7'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText8'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam8'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText9'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam9'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@id_user'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_business'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 505
    Top = 368
    object spGetData2id_Oper: TIntegerField
      FieldName = 'id_Oper'
    end
    object spGetData2id_OperParent: TIntegerField
      FieldName = 'id_OperParent'
    end
    object spGetData2id_old_Oper: TIntegerField
      FieldName = 'id_old_Oper'
    end
    object spGetData2DateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object spGetData2id_LC_Oper: TIntegerField
      FieldName = 'id_LC_Oper'
    end
    object spGetData2OperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object spGetData2id_Replicator: TIntegerField
      FieldName = 'id_Replicator'
    end
    object spGetData2ReplicatorShortName: TStringField
      FieldName = 'ReplicatorShortName'
      Size = 5
    end
    object spGetData2id_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object spGetData2id_business: TIntegerField
      FieldName = 'id_business'
    end
    object spGetData2Id_CurrencyBsn: TIntegerField
      FieldName = 'Id_CurrencyBsn'
    end
    object spGetData2BusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object spGetData2BusinessNum: TStringField
      FieldName = 'BusinessNum'
      Size = 5
    end
    object spGetData2DateLocal: TDateTimeField
      FieldName = 'DateLocal'
    end
    object spGetData2Correct: TBooleanField
      FieldName = 'Correct'
    end
    object spGetData2OperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object spGetData2Id_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object spGetData2CurrencyOperName: TStringField
      FieldName = 'CurrencyOperName'
      Size = 30
    end
    object spGetData2CurrencyOperShortName: TStringField
      FieldName = 'CurrencyOperShortName'
      Size = 10
    end
    object spGetData2AmountOper: TFloatField
      FieldName = 'AmountOper'
    end
    object spGetData2AmountOper2: TFloatField
      FieldName = 'AmountOper2'
    end
    object spGetData2PriceOper: TFloatField
      FieldName = 'PriceOper'
    end
    object spGetData2RateOper: TFloatField
      FieldName = 'RateOper'
    end
    object spGetData2id_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object spGetData2MeasureName: TStringField
      FieldName = 'MeasureName'
      Size = 10
    end
    object spGetData2RealKoef: TFloatField
      FieldName = 'RealKoef'
    end
    object spGetData2AmountOperBaseMS: TFloatField
      FieldName = 'AmountOperBaseMS'
    end
    object spGetData2Id_CurrencySys: TIntegerField
      FieldName = 'Id_CurrencySys'
    end
    object spGetData2CurrencySysName: TStringField
      FieldName = 'CurrencySysName'
      Size = 30
    end
    object spGetData2CurrencySysShortName: TStringField
      FieldName = 'CurrencySysShortName'
      Size = 10
    end
    object spGetData2SummSys: TFloatField
      FieldName = 'SummSys'
    end
    object spGetData2RateSys: TFloatField
      FieldName = 'RateSys'
    end
    object spGetData2id_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object spGetData2id_Warehouse: TIntegerField
      FieldName = 'id_Warehouse'
    end
    object spGetData2id_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object spGetData2SrcName: TStringField
      FieldName = 'SrcName'
      Size = 50
    end
    object spGetData2SrcID_Main: TIntegerField
      FieldName = 'SrcID_Main'
    end
    object spGetData2id_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object spGetData2id_Acc_Ext: TIntegerField
      FieldName = 'id_Acc_Ext'
    end
    object spGetData2id_Warehouse_Ext: TIntegerField
      FieldName = 'id_Warehouse_Ext'
    end
    object spGetData2id_Manufact_Ext: TIntegerField
      FieldName = 'id_Manufact_Ext'
    end
    object spGetData2ReprName: TStringField
      FieldName = 'ReprName'
      Size = 255
    end
    object spGetData2ReprID_Main: TIntegerField
      FieldName = 'ReprID_Main'
    end
    object spGetData2Id_CurrencyInv: TIntegerField
      FieldName = 'Id_CurrencyInv'
    end
    object spGetData2PriceInv: TFloatField
      FieldName = 'PriceInv'
    end
    object spGetData2RateInv: TFloatField
      FieldName = 'RateInv'
    end
    object spGetData2CurrencyInvName: TStringField
      FieldName = 'CurrencyInvName'
      Size = 30
    end
    object spGetData2CurrencyInvShortName: TStringField
      FieldName = 'CurrencyInvShortName'
      Size = 30
    end
    object spGetData2id_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object spGetData2WareName: TStringField
      FieldName = 'WareName'
      Size = 255
    end
    object spGetData2WareID_Main: TIntegerField
      FieldName = 'WareID_Main'
    end
    object spGetData2Koeff: TIntegerField
      FieldName = 'Koeff'
    end
    object spGetData2KoeffName: TStringField
      FieldName = 'KoeffName'
      Size = 50
    end
    object spGetData2CheckDate: TDateTimeField
      FieldName = 'CheckDate'
    end
    object spGetData2id_UserChecker: TIntegerField
      FieldName = 'id_UserChecker'
    end
    object spGetData2id_FormalDistrib: TIntegerField
      FieldName = 'id_FormalDistrib'
    end
    object spGetData2FormalDistribName: TStringField
      FieldName = 'FormalDistribName'
      Size = 50
    end
    object spGetData2id_FuncDistrib: TIntegerField
      FieldName = 'id_FuncDistrib'
    end
    object spGetData2FuncDistribName: TStringField
      FieldName = 'FuncDistribName'
      Size = 50
    end
    object spGetData2Deleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetData2id_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object spGetData2ContrAgentName: TStringField
      FieldName = 'ContrAgentName'
      Size = 50
    end
    object spGetData2id_CAGroup: TIntegerField
      FieldName = 'id_CAGroup'
    end
    object spGetData2SummOper: TFloatField
      FieldName = 'SummOper'
    end
    object spGetData2TypeName: TStringField
      FieldName = 'TypeName'
      Size = 30
    end
    object spGetData2OperNum: TStringField
      FieldName = 'OperNum'
      Size = 255
    end
    object spGetData2OperDelta: TFloatField
      FieldName = 'OperDelta'
    end
    object spGetData2OperRateDelta: TFloatField
      FieldName = 'OperRateDelta'
    end
    object spGetData2OperTotalDelta: TFloatField
      FieldName = 'OperTotalDelta'
    end
    object spGetData2DTDiff: TIntegerField
      FieldName = 'DTDiff'
    end
    object spGetData2HasViza: TBooleanField
      FieldName = 'HasViza'
    end
    object spGetData2OperState: TIntegerField
      FieldName = 'OperState'
    end
    object spGetData2HidedOper: TBooleanField
      FieldName = 'HidedOper'
    end
    object spGetData2OperSummSys: TFloatField
      FieldName = 'OperSummSys'
    end
    object spGetData2RateMain: TFloatField
      FieldName = 'RateMain'
    end
    object spGetData2id_Repr_Ex: TIntegerField
      FieldName = 'id_Repr_Ex'
    end
    object spGetData2id_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object spGetData2Imp_PayBasic: TStringField
      FieldName = 'Imp_PayBasic'
      Size = 1000
    end
    object spGetData2AccInv_PayAssignment: TStringField
      FieldName = 'AccInv_PayAssignment'
      Size = 1000
    end
    object spGetData2Contract: TStringField
      FieldName = 'Contract'
      Size = 1000
    end
    object spGetData2OperDeltaCrn: TFloatField
      FieldName = 'OperDeltaCrn'
    end
    object spGetData2OperRateDeltaCrn: TFloatField
      FieldName = 'OperRateDeltaCrn'
    end
    object spGetData2OperTotalDeltaCrn: TFloatField
      FieldName = 'OperTotalDeltaCrn'
    end
    object spGetData2OperCrnName: TStringField
      FieldName = 'OperCrnName'
      Size = 10
    end
    object spGetData2OperSum_Offer: TFloatField
      FieldName = 'OperSum_Offer'
    end
    object spGetData2CRN_OLD_OperSum: TFloatField
      FieldName = 'CRN_OLD_OperSum'
    end
    object spGetData2CRN_OLD_OperSum_Offer: TFloatField
      FieldName = 'CRN_OLD_OperSum_Offer'
    end
    object spGetData2CRN_OperSum_Inv: TFloatField
      FieldName = 'CRN_OperSum_Inv'
    end
    object spGetData2OperSumCalced: TFloatField
      FieldName = 'OperSumCalced'
    end
    object spGetData2OperSum_OfferCalced: TFloatField
      FieldName = 'OperSum_OfferCalced'
    end
    object spGetData2Blocked: TBooleanField
      FieldName = 'Blocked'
    end
    object spGetData2CurrencyBsnName: TStringField
      FieldName = 'CurrencyBsnName'
      Size = 10
    end
    object spGetData2id_Ctg_Goods_2: TIntegerField
      FieldName = 'id_Ctg_Goods_2'
    end
    object spGetData2OpComment: TStringField
      FieldName = 'OpComment'
      Size = 1000
    end
    object spGetData2RealDataCreate: TDateTimeField
      FieldName = 'RealDataCreate'
    end
    object spGetData2OperTypeSIGN: TIntegerField
      FieldName = 'OperTypeSIGN'
    end
    object spGetData2HasChild: TIntegerField
      FieldName = 'HasChild'
    end
    object spGetData2Dig1: TFloatField
      FieldName = 'Dig1'
    end
    object spGetData2Dig2: TFloatField
      FieldName = 'Dig2'
    end
    object spGetData2Dig3: TFloatField
      FieldName = 'Dig3'
    end
    object spGetData2Dig4: TFloatField
      FieldName = 'Dig4'
    end
    object spGetData2Dig5: TFloatField
      FieldName = 'Dig5'
    end
    object spGetData2Dig6: TFloatField
      FieldName = 'Dig6'
    end
    object spGetData2Dig7: TFloatField
      FieldName = 'Dig7'
    end
    object spGetData2Dig8: TFloatField
      FieldName = 'Dig8'
    end
    object spGetData2Dig9: TFloatField
      FieldName = 'Dig9'
    end
    object spGetData2Dig10: TFloatField
      FieldName = 'Dig10'
    end
    object spGetData2Dig11: TFloatField
      FieldName = 'Dig11'
    end
    object spGetData2Dig12: TFloatField
      FieldName = 'Dig12'
    end
    object spGetData2Dig13: TFloatField
      FieldName = 'Dig13'
    end
    object spGetData2Dig14: TFloatField
      FieldName = 'Dig14'
    end
    object spGetData2Dig15: TFloatField
      FieldName = 'Dig15'
    end
    object spGetData2Str1: TStringField
      FieldName = 'Str1'
      Size = 100
    end
    object spGetData2Str2: TStringField
      FieldName = 'Str2'
      Size = 100
    end
    object spGetData2Str3: TStringField
      FieldName = 'Str3'
      Size = 100
    end
    object spGetData2Str4: TStringField
      FieldName = 'Str4'
      Size = 100
    end
    object spGetData2Str5: TStringField
      FieldName = 'Str5'
      Size = 100
    end
    object spGetData2Str6: TStringField
      FieldName = 'Str6'
      Size = 100
    end
    object spGetData2Str7: TStringField
      FieldName = 'Str7'
      Size = 100
    end
    object spGetData2Str8: TStringField
      FieldName = 'Str8'
      Size = 100
    end
    object spGetData2Str9: TStringField
      FieldName = 'Str9'
      Size = 100
    end
    object spGetData2Str10: TStringField
      FieldName = 'Str10'
      Size = 100
    end
    object spGetData2Str11: TStringField
      FieldName = 'Str11'
      Size = 100
    end
    object spGetData2Str12: TStringField
      FieldName = 'Str12'
      Size = 100
    end
    object spGetData2Str13: TStringField
      FieldName = 'Str13'
      Size = 100
    end
    object spGetData2Str14: TStringField
      FieldName = 'Str14'
      Size = 100
    end
    object spGetData2Str15: TStringField
      FieldName = 'Str15'
      Size = 100
    end
    object spGetData2id_OperWare: TAutoIncField
      FieldName = 'id_OperWare'
    end
    object spGetData2OperVidName: TStringField
      FieldName = 'OperVidName'
      Size = 50
    end
    object spGetData2CRN_OperSumRez: TFloatField
      FieldName = 'CRN_OperSumRez'
    end
    object spGetData2OnlyDate: TDateTimeField
      FieldName = 'OnlyDate'
    end
    object spGetData2is_Mirr: TBooleanField
      FieldName = 'is_Mirr'
    end
    object spGetData2id_Acc_Group: TIntegerField
      FieldName = 'id_Acc_Group'
    end
    object spGetData2id_Warehouse_Group: TIntegerField
      FieldName = 'id_Warehouse_Group'
    end
    object spGetData2id_Manufact_Group: TIntegerField
      FieldName = 'id_Manufact_Group'
    end
    object spGetData2VatIn: TBooleanField
      FieldName = 'VatIn'
    end
    object spGetData2AutoGen: TBooleanField
      FieldName = 'AutoGen'
    end
    object spGetData2CreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      Size = 152
    end
    object spGetData2CheckerFIO: TStringField
      FieldName = 'CheckerFIO'
      Size = 152
    end
    object spGetData2ID_Oper_1: TIntegerField
      FieldName = 'ID_Oper_1'
    end
    object spGetData2id_OperWare_1: TIntegerField
      FieldName = 'id_OperWare_1'
    end
    object spGetData2is_Mirr_1: TBooleanField
      FieldName = 'is_Mirr_1'
    end
  end
  object dsGetData2: TDataSetProvider
    DataSet = spGetData2
    Constraints = True
    Left = 504
    Top = 416
  end
  object spGetDataTree: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FLT_GetDataTree;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@TreeSQL'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText0'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam0'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText3'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam3'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText4'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam4'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText5'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam5'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText6'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam6'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText7'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam7'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText8'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam8'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@SQLText9'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@FltExtPatam9'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = '@id_user'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_business'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 417
    Top = 400
  end
  object dsGetDataTree: TDataSetProvider
    DataSet = spGetDataTree
    Constraints = True
    Left = 416
    Top = 448
  end
end
