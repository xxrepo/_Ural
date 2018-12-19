object rdmWebDoc: TrdmWebDoc
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  Left = 231
  Top = 107
  Height = 480
  Width = 928
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=1;Persist Security Info=True;User I' +
      'D=sa;Initial Catalog=WebDoc_2;Data Source=192.168.56.2\SQL2008R2' +
      '_X,1433'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 26
    Top = 20
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
        Value = Null
      end
      item
        Name = '@Password'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end>
    Left = 32
    Top = 72
    object spWhoIAmid_user: TAutoIncField
      FieldName = 'id_user'
      ReadOnly = True
    end
    object spWhoIAmFIO: TStringField
      FieldName = 'FIO'
      Size = 255
    end
    object spWhoIAmUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 255
    end
    object spWhoIAmLC_deleted: TBooleanField
      FieldName = 'LC_deleted'
    end
    object spWhoIAmid_UADM: TBooleanField
      FieldName = 'id_UADM'
    end
  end
  object spObjGetList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'WD_ObjGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ExtId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_NS'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 32
    Top = 128
  end
  object dsObjGetList: TSQLUpdateDSProvider
    DataSet = spObjGetList
    Constraints = True
    Left = 32
    Top = 176
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'WD_ObjGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_ObjType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 96
    Top = 8
  end
  object dsObjProp: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'WD_ObjGetProp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_Obj'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 32
    Top = 224
    object dsObjPropPname: TStringField
      FieldName = 'Pname'
      Size = 255
    end
    object dsObjPropObjTypeName: TStringField
      FieldName = 'ObjTypeName'
      Size = 255
    end
    object dsObjPropExtID: TIntegerField
      FieldName = 'ExtID'
    end
    object dsObjPropid_Obj: TIntegerField
      FieldName = 'id_Obj'
    end
    object dsObjPropid_NS: TIntegerField
      FieldName = 'id_NS'
    end
    object dsObjPropPID: TIntegerField
      FieldName = 'PID'
    end
    object dsObjPropid_ObjType: TIntegerField
      FieldName = 'id_ObjType'
    end
    object dsObjPropObjName: TStringField
      FieldName = 'ObjName'
      Size = 255
    end
    object dsObjPropFileName: TStringField
      FieldName = 'FileName'
      Size = 255
    end
    object dsObjPropDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object dsObjPropDateStart: TDateTimeField
      FieldName = 'DateStart'
    end
    object dsObjPropDateStop: TDateTimeField
      FieldName = 'DateStop'
    end
    object dsObjPropisBayer: TBooleanField
      FieldName = 'isBayer'
    end
    object dsObjPropisSeller: TBooleanField
      FieldName = 'isSeller'
    end
    object dsObjPropisDef: TBooleanField
      FieldName = 'isDef'
    end
    object dsObjPropObj_Digit1: TBCDField
      FieldName = 'Obj_Digit1'
      Precision = 19
    end
    object dsObjPropObj_Digit2: TBCDField
      FieldName = 'Obj_Digit2'
      Precision = 19
    end
    object dsObjPropObj_Digit3: TBCDField
      FieldName = 'Obj_Digit3'
      Precision = 19
    end
    object dsObjPropObj_Digit4: TBCDField
      FieldName = 'Obj_Digit4'
      Precision = 19
    end
    object dsObjPropObj_Digit5: TBCDField
      FieldName = 'Obj_Digit5'
      Precision = 19
    end
    object dsObjPropObj_Digit6: TBCDField
      FieldName = 'Obj_Digit6'
      Precision = 19
    end
    object dsObjPropObj_Digit7: TBCDField
      FieldName = 'Obj_Digit7'
      Precision = 19
    end
    object dsObjPropObj_Digit8: TBCDField
      FieldName = 'Obj_Digit8'
      Precision = 19
    end
    object dsObjPropObj_Digit9: TBCDField
      FieldName = 'Obj_Digit9'
      Precision = 19
    end
    object dsObjPropObj_Digit10: TBCDField
      FieldName = 'Obj_Digit10'
      Precision = 19
    end
    object dsObjPropObj_Date1: TDateTimeField
      FieldName = 'Obj_Date1'
    end
    object dsObjPropObj_Date2: TDateTimeField
      FieldName = 'Obj_Date2'
    end
    object dsObjPropObj_Date3: TDateTimeField
      FieldName = 'Obj_Date3'
    end
    object dsObjPropObj_Date4: TDateTimeField
      FieldName = 'Obj_Date4'
    end
    object dsObjPropObj_Date5: TDateTimeField
      FieldName = 'Obj_Date5'
    end
    object dsObjPropObj_Date6: TDateTimeField
      FieldName = 'Obj_Date6'
    end
    object dsObjPropObj_Date7: TDateTimeField
      FieldName = 'Obj_Date7'
    end
    object dsObjPropObj_Date8: TDateTimeField
      FieldName = 'Obj_Date8'
    end
    object dsObjPropObj_Date9: TDateTimeField
      FieldName = 'Obj_Date9'
    end
    object dsObjPropObj_Date10: TDateTimeField
      FieldName = 'Obj_Date10'
    end
    object dsObjPropEmailList: TStringField
      FieldName = 'EmailList'
      Size = 255
    end
    object dsObjPropid_Dic1: TIntegerField
      FieldName = 'id_Dic1'
    end
    object dsObjPropid_Dic2: TIntegerField
      FieldName = 'id_Dic2'
    end
    object dsObjPropid_Dic3: TIntegerField
      FieldName = 'id_Dic3'
    end
    object dsObjPropid_Dic4: TIntegerField
      FieldName = 'id_Dic4'
    end
    object dsObjPropid_Dic5: TIntegerField
      FieldName = 'id_Dic5'
    end
    object dsObjPropid_Dic6: TIntegerField
      FieldName = 'id_Dic6'
    end
    object dsObjPropid_Dic7: TIntegerField
      FieldName = 'id_Dic7'
    end
    object dsObjPropid_Dic8: TIntegerField
      FieldName = 'id_Dic8'
    end
    object dsObjPropid_Dic9: TIntegerField
      FieldName = 'id_Dic9'
    end
    object dsObjPropid_Dic10: TIntegerField
      FieldName = 'id_Dic10'
    end
  end
  object cdsObjProp: TSQLUpdateDSProvider
    DataSet = dsObjProp
    Constraints = True
    Left = 32
    Top = 272
  end
  object dsNS: TSQLUpdateDSProvider
    DataSet = spNS
    Constraints = True
    Left = 192
    Top = 64
  end
  object spNS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'NS_GetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_User'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 192
    Top = 16
  end
  object spValList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'WD_CAgetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_User'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@SysKey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_NS'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ObjName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@CAName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@isBayerStr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@isSellerStr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@WorkType'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@RealWorkType'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@isUsedStr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Digit1'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit2'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit3'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit4'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit5'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit6'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit7'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit8'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit9'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit10'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Str1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str3'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str4'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str5'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str6'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str7'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str8'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str9'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str10'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Date1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date3'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date4'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date5'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date6'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date7'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date8'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date9'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date10'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@FlDName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end>
    Left = 197
    Top = 144
    object spValListVal: TStringField
      FieldName = 'Val'
      Size = 255
    end
  end
  object dsValList: TSQLUpdateDSProvider
    DataSet = spValList
    Constraints = True
    Left = 200
    Top = 192
  end
  object spCAList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'WD_CAgetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_User'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@SysKey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_NS'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ObjName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@CAName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@isBayerStr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@isSellerStr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@WorkType'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@RealWorkType'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@isUsedStr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Digit1'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit2'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit3'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit4'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit5'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit6'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit7'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit8'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit9'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Digit10'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@Obj_Str1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str3'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str4'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str5'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str6'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str7'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str8'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str9'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Str10'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Obj_Date1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date3'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date4'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date5'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date6'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date7'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date8'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date9'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Obj_Date10'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@FlDName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end>
    Left = 205
    Top = 256
    object spCAListCAName: TStringField
      FieldName = 'CAName'
      Size = 255
    end
    object spCAListisBayerStr: TStringField
      FieldName = 'isBayerStr'
      Size = 10
    end
    object spCAListisSellerStr: TStringField
      FieldName = 'isSellerStr'
      Size = 10
    end
    object spCAListisUsedStr: TStringField
      FieldName = 'isUsedStr'
      Size = 10
    end
    object spCAListid_Obj: TIntegerField
      FieldName = 'id_Obj'
    end
    object spCAListid_NS: TIntegerField
      FieldName = 'id_NS'
    end
    object spCAListPID: TIntegerField
      FieldName = 'PID'
    end
    object spCAListid_ObjType: TIntegerField
      FieldName = 'id_ObjType'
    end
    object spCAListObjName: TStringField
      FieldName = 'ObjName'
      Size = 255
    end
    object spCAListFileName: TStringField
      FieldName = 'FileName'
      Size = 255
    end
    object spCAListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spCAListDateStart: TDateTimeField
      FieldName = 'DateStart'
    end
    object spCAListDateStop: TDateTimeField
      FieldName = 'DateStop'
    end
    object spCAListisBayer: TBooleanField
      FieldName = 'isBayer'
    end
    object spCAListisSeller: TBooleanField
      FieldName = 'isSeller'
    end
    object spCAListisDef: TBooleanField
      FieldName = 'isDef'
    end
    object spCAListObj_Digit1: TBCDField
      FieldName = 'Obj_Digit1'
      Precision = 19
    end
    object spCAListObj_Digit2: TBCDField
      FieldName = 'Obj_Digit2'
      Precision = 19
    end
    object spCAListObj_Digit3: TBCDField
      FieldName = 'Obj_Digit3'
      Precision = 19
    end
    object spCAListObj_Digit4: TBCDField
      FieldName = 'Obj_Digit4'
      Precision = 19
    end
    object spCAListObj_Digit5: TBCDField
      FieldName = 'Obj_Digit5'
      Precision = 19
    end
    object spCAListObj_Digit6: TBCDField
      FieldName = 'Obj_Digit6'
      Precision = 19
    end
    object spCAListObj_Digit7: TBCDField
      FieldName = 'Obj_Digit7'
      Precision = 19
    end
    object spCAListObj_Digit8: TBCDField
      FieldName = 'Obj_Digit8'
      Precision = 19
    end
    object spCAListObj_Digit9: TBCDField
      FieldName = 'Obj_Digit9'
      Precision = 19
    end
    object spCAListObj_Digit10: TBCDField
      FieldName = 'Obj_Digit10'
      Precision = 19
    end
    object spCAListObj_Str1: TStringField
      FieldName = 'Obj_Str1'
      Size = 255
    end
    object spCAListObj_Str2: TStringField
      FieldName = 'Obj_Str2'
      Size = 255
    end
    object spCAListObj_Str3: TStringField
      FieldName = 'Obj_Str3'
      Size = 255
    end
    object spCAListObj_Str4: TStringField
      FieldName = 'Obj_Str4'
      Size = 255
    end
    object spCAListObj_Str5: TStringField
      FieldName = 'Obj_Str5'
      Size = 255
    end
    object spCAListObj_Str6: TStringField
      FieldName = 'Obj_Str6'
      Size = 255
    end
    object spCAListObj_Str7: TStringField
      FieldName = 'Obj_Str7'
      Size = 255
    end
    object spCAListObj_Str8: TStringField
      FieldName = 'Obj_Str8'
      Size = 255
    end
    object spCAListObj_Str9: TStringField
      FieldName = 'Obj_Str9'
      Size = 255
    end
    object spCAListObj_Str10: TStringField
      FieldName = 'Obj_Str10'
      Size = 255
    end
    object spCAListObj_Date1: TDateTimeField
      FieldName = 'Obj_Date1'
    end
    object spCAListObj_Date2: TDateTimeField
      FieldName = 'Obj_Date2'
    end
    object spCAListObj_Date3: TDateTimeField
      FieldName = 'Obj_Date3'
    end
    object spCAListObj_Date4: TDateTimeField
      FieldName = 'Obj_Date4'
    end
    object spCAListObj_Date5: TDateTimeField
      FieldName = 'Obj_Date5'
    end
    object spCAListObj_Date6: TDateTimeField
      FieldName = 'Obj_Date6'
    end
    object spCAListObj_Date7: TDateTimeField
      FieldName = 'Obj_Date7'
    end
    object spCAListObj_Date8: TDateTimeField
      FieldName = 'Obj_Date8'
    end
    object spCAListObj_Date9: TDateTimeField
      FieldName = 'Obj_Date9'
    end
    object spCAListObj_Date10: TDateTimeField
      FieldName = 'Obj_Date10'
    end
    object spCAListWorkType: TStringField
      FieldName = 'WorkType'
      Size = 1000
    end
    object spCAListRealWorkType: TStringField
      FieldName = 'RealWorkType'
      Size = 1000
    end
  end
  object dsCAList: TSQLUpdateDSProvider
    DataSet = spCAList
    Constraints = True
    Left = 208
    Top = 304
  end
  object spFileList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'WD_FileGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_User'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_NS'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ExtSQL'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Comment'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@FileInfo'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@DocSumm'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@id_Crn'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@DateFrom'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@DateTo'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@OnlyNAN'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@CAIDList'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end>
    Left = 309
    Top = 48
  end
  object dsFileList: TSQLUpdateDSProvider
    DataSet = spFileList
    Constraints = True
    Left = 312
    Top = 96
  end
  object dsFileProp: TSQLUpdateDSProvider
    DataSet = spFileProp
    Constraints = True
    ModifySQL.Strings = (
      'EXEC WD_File_UnEdit'
      '  @FileGUID = :FileGUID,'
      '  @id_DocType = :id_DocType,'
      '  @id_WorkType = :id_WorkType,'
      '  @id_Seller = :id_Seller,'
      '  @id_Bayer = :id_Bayer,'
      '  @id_Org3 = :id_Org3,'
      '  @id_Org4 = :id_Org4,'
      '  @DocNum = :DocNum,'
      '  @DocDate = :DocDate,'
      '  @DocDateStop = :DocDateStop,'
      '  @isAutoLong = :isAutoLong,'
      '  @DocSumm = :DocSumm,'
      '  @id_Crn = :id_Crn,'
      '  @id_State = :id_State,'
      '  @Comment = :Comment,'
      '  @xVers = :xVers,'
      '  @CalcName = :CalcName,'
      '  @OrigName = :OrigName,'
      '  @FileInfo = :FileInfo,'
      '  @Adv_Digit1 = :Adv_Digit1,'
      '  @Adv_Digit2 = :Adv_Digit2,'
      '  @Adv_Digit3 = :Adv_Digit3,'
      '  @Adv_Digit4 = :Adv_Digit4,'
      '  @Adv_Digit5 = :Adv_Digit5,'
      '  @Adv_Digit6 = :Adv_Digit6,'
      '  @Adv_Digit7 = :Adv_Digit7,'
      '  @Adv_Digit8 = :Adv_Digit8,'
      '  @Adv_Digit9 = :Adv_Digit9,'
      '  @Adv_Digit10 = :Adv_Digit10,'
      '  @Adv_Str1 = :Adv_Str1,'
      '  @Adv_Str2 = :Adv_Str2,'
      '  @Adv_Str3 = :Adv_Str3,'
      '  @Adv_Str4 = :Adv_Str4,'
      '  @Adv_Str5 = :Adv_Str5,'
      '  @Adv_Str6 = :Adv_Str6,'
      '  @Adv_Str7 = :Adv_Str7,'
      '  @Adv_Str8 = :Adv_Str8,'
      '  @Adv_Str9 = :Adv_Str9,'
      '  @Adv_Str10 = :Adv_Str10,'
      '  @Adv_Date1 = :Adv_Date1,'
      '  @Adv_Date2 = :Adv_Date2,'
      '  @Adv_Date3 = :Adv_Date3,'
      '  @Adv_Date4 = :Adv_Date4,'
      '  @Adv_Date5 = :Adv_Date5,'
      '  @Adv_Date6 = :Adv_Date6,'
      '  @Adv_Date7 = :Adv_Date7,'
      '  @Adv_Date8 = :Adv_Date8,'
      '  @Adv_Date9 = :Adv_Date9,'
      '  @Adv_Date10 = :Adv_Date10,'
      '  @id_File = :id_File')
    InsertSQL.Strings = (
      'EXEC WD_File_UnEdit'
      '  @FileGUID = :FileGUID,'
      '  @id_DocType = :id_DocType,'
      '  @id_WorkType = :id_WorkType,'
      '  @id_Seller = :id_Seller,'
      '  @id_Bayer = :id_Bayer,'
      '  @id_Org3 = :id_Org3,'
      '  @id_Org4 = :id_Org4,'
      '  @DocNum = :DocNum,'
      '  @DocDate = :DocDate,'
      '  @DocDateStop = :DocDateStop,'
      '  @isAutoLong = :isAutoLong,'
      '  @DocSumm = :DocSumm,'
      '  @id_Crn = :id_Crn,'
      '  @id_State = :id_State,'
      '  @Comment = :Comment,'
      '  @xVers = :xVers,'
      '  @CalcName = :CalcName,'
      '  @OrigName = :OrigName,'
      '  @FileInfo = :FileInfo,'
      '  @Adv_Digit1 = :Adv_Digit1,'
      '  @Adv_Digit2 = :Adv_Digit2,'
      '  @Adv_Digit3 = :Adv_Digit3,'
      '  @Adv_Digit4 = :Adv_Digit4,'
      '  @Adv_Digit5 = :Adv_Digit5,'
      '  @Adv_Digit6 = :Adv_Digit6,'
      '  @Adv_Digit7 = :Adv_Digit7,'
      '  @Adv_Digit8 = :Adv_Digit8,'
      '  @Adv_Digit9 = :Adv_Digit9,'
      '  @Adv_Digit10 = :Adv_Digit10,'
      '  @Adv_Str1 = :Adv_Str1,'
      '  @Adv_Str2 = :Adv_Str2,'
      '  @Adv_Str3 = :Adv_Str3,'
      '  @Adv_Str4 = :Adv_Str4,'
      '  @Adv_Str5 = :Adv_Str5,'
      '  @Adv_Str6 = :Adv_Str6,'
      '  @Adv_Str7 = :Adv_Str7,'
      '  @Adv_Str8 = :Adv_Str8,'
      '  @Adv_Str9 = :Adv_Str9,'
      '  @Adv_Str10 = :Adv_Str10,'
      '  @Adv_Date1 = :Adv_Date1,'
      '  @Adv_Date2 = :Adv_Date2,'
      '  @Adv_Date3 = :Adv_Date3,'
      '  @Adv_Date4 = :Adv_Date4,'
      '  @Adv_Date5 = :Adv_Date5,'
      '  @Adv_Date6 = :Adv_Date6,'
      '  @Adv_Date7 = :Adv_Date7,'
      '  @Adv_Date8 = :Adv_Date8,'
      '  @Adv_Date9 = :Adv_Date9,'
      '  @Adv_Date10 = :Adv_Date10,'
      '  @id_File = :id_File')
    Left = 312
    Top = 200
  end
  object spFileProp: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'WD_FileGetProp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_File'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_User'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 309
    Top = 152
    object spFilePropid_File: TIntegerField
      FieldName = 'id_File'
    end
    object spFilePropid_email: TIntegerField
      FieldName = 'id_email'
    end
    object spFilePropFileGUID: TStringField
      FieldName = 'FileGUID'
      Size = 50
    end
    object spFilePropDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spFilePropid_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object spFilePropid_WorkType: TIntegerField
      FieldName = 'id_WorkType'
    end
    object spFilePropid_Seller: TIntegerField
      FieldName = 'id_Seller'
    end
    object spFilePropid_Bayer: TIntegerField
      FieldName = 'id_Bayer'
    end
    object spFilePropid_Org3: TIntegerField
      FieldName = 'id_Org3'
    end
    object spFilePropid_Org4: TIntegerField
      FieldName = 'id_Org4'
    end
    object spFilePropDocNum: TStringField
      FieldName = 'DocNum'
      Size = 255
    end
    object spFilePropDocDate: TDateTimeField
      FieldName = 'DocDate'
    end
    object spFilePropDocDateStop: TDateTimeField
      FieldName = 'DocDateStop'
    end
    object spFilePropDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object spFilePropisAutoLong: TBooleanField
      FieldName = 'isAutoLong'
    end
    object spFilePropDocSumm: TBCDField
      FieldName = 'DocSumm'
      Precision = 19
    end
    object spFilePropid_Crn: TIntegerField
      FieldName = 'id_Crn'
    end
    object spFilePropid_State: TIntegerField
      FieldName = 'id_State'
    end
    object spFilePropComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object spFilePropxVers: TIntegerField
      FieldName = 'xVers'
    end
    object spFilePropCalcName: TStringField
      FieldName = 'CalcName'
      Size = 255
    end
    object spFilePropOrigName: TStringField
      FieldName = 'OrigName'
      Size = 255
    end
    object spFilePropFileInfo: TStringField
      FieldName = 'FileInfo'
      Size = 255
    end
    object spFilePropFileSize: TIntegerField
      FieldName = 'FileSize'
    end
    object spFilePropAdv_Digit1: TBCDField
      FieldName = 'Adv_Digit1'
      Precision = 19
    end
    object spFilePropAdv_Digit2: TBCDField
      FieldName = 'Adv_Digit2'
      Precision = 19
    end
    object spFilePropAdv_Digit3: TBCDField
      FieldName = 'Adv_Digit3'
      Precision = 19
    end
    object spFilePropAdv_Digit4: TBCDField
      FieldName = 'Adv_Digit4'
      Precision = 19
    end
    object spFilePropAdv_Digit5: TBCDField
      FieldName = 'Adv_Digit5'
      Precision = 19
    end
    object spFilePropAdv_Digit6: TBCDField
      FieldName = 'Adv_Digit6'
      Precision = 19
    end
    object spFilePropAdv_Digit7: TBCDField
      FieldName = 'Adv_Digit7'
      Precision = 19
    end
    object spFilePropAdv_Digit8: TBCDField
      FieldName = 'Adv_Digit8'
      Precision = 19
    end
    object spFilePropAdv_Digit9: TBCDField
      FieldName = 'Adv_Digit9'
      Precision = 19
    end
    object spFilePropAdv_Digit10: TBCDField
      FieldName = 'Adv_Digit10'
      Precision = 19
    end
    object spFilePropAdv_Date1: TDateTimeField
      FieldName = 'Adv_Date1'
    end
    object spFilePropAdv_Date2: TDateTimeField
      FieldName = 'Adv_Date2'
    end
    object spFilePropAdv_Date3: TDateTimeField
      FieldName = 'Adv_Date3'
    end
    object spFilePropAdv_Date4: TDateTimeField
      FieldName = 'Adv_Date4'
    end
    object spFilePropAdv_Date5: TDateTimeField
      FieldName = 'Adv_Date5'
    end
    object spFilePropAdv_Date6: TDateTimeField
      FieldName = 'Adv_Date6'
    end
    object spFilePropAdv_Date7: TDateTimeField
      FieldName = 'Adv_Date7'
    end
    object spFilePropAdv_Date8: TDateTimeField
      FieldName = 'Adv_Date8'
    end
    object spFilePropAdv_Date9: TDateTimeField
      FieldName = 'Adv_Date9'
    end
    object spFilePropAdv_Date10: TDateTimeField
      FieldName = 'Adv_Date10'
    end
    object spFilePropid_DicFile1: TIntegerField
      FieldName = 'id_DicFile1'
    end
    object spFilePropid_DicFile2: TIntegerField
      FieldName = 'id_DicFile2'
    end
    object spFilePropid_DicFile3: TIntegerField
      FieldName = 'id_DicFile3'
    end
    object spFilePropid_DicFile4: TIntegerField
      FieldName = 'id_DicFile4'
    end
    object spFilePropid_DicFile5: TIntegerField
      FieldName = 'id_DicFile5'
    end
    object spFilePropid_DicFile6: TIntegerField
      FieldName = 'id_DicFile6'
    end
    object spFilePropid_DicFile7: TIntegerField
      FieldName = 'id_DicFile7'
    end
    object spFilePropid_DicFile8: TIntegerField
      FieldName = 'id_DicFile8'
    end
    object spFilePropid_DicFile9: TIntegerField
      FieldName = 'id_DicFile9'
    end
    object spFilePropid_DicFile10: TIntegerField
      FieldName = 'id_DicFile10'
    end
    object spFilePropID_NS: TIntegerField
      FieldName = 'ID_NS'
    end
    object spFilePropBayerName: TStringField
      FieldName = 'BayerName'
      Size = 255
    end
    object spFilePropBayerCAName: TStringField
      FieldName = 'BayerCAName'
      Size = 255
    end
    object spFilePropBayerID_CA: TIntegerField
      FieldName = 'BayerID_CA'
    end
    object spFilePropSellerName: TStringField
      FieldName = 'SellerName'
      Size = 255
    end
    object spFilePropSellerCAName: TStringField
      FieldName = 'SellerCAName'
      Size = 255
    end
    object spFilePropSellerID_CA: TIntegerField
      FieldName = 'SellerID_CA'
    end
    object spFilePropisBayer: TBooleanField
      FieldName = 'isBayer'
    end
    object spFilePropisSeller: TBooleanField
      FieldName = 'isSeller'
    end
    object spFilePropOrg3Name: TStringField
      FieldName = 'Org3Name'
      Size = 255
    end
    object spFilePropOrg4Name: TStringField
      FieldName = 'Org4Name'
      Size = 255
    end
    object spFilePropWorkTypeName: TStringField
      FieldName = 'WorkTypeName'
      Size = 255
    end
    object spFilePropDocTypeName: TStringField
      FieldName = 'DocTypeName'
      Size = 255
    end
    object spFilePropStateName: TStringField
      FieldName = 'StateName'
      Size = 255
    end
    object spFilePropCrnName: TStringField
      FieldName = 'CrnName'
      Size = 255
    end
    object spFilePropEmailDateCreate: TDateTimeField
      FieldName = 'EmailDateCreate'
    end
    object spFilePropEmailDate: TDateTimeField
      FieldName = 'EmailDate'
    end
    object spFilePropEmailFrom: TStringField
      FieldName = 'EmailFrom'
      Size = 255
    end
    object spFilePropEmailName: TStringField
      FieldName = 'EmailName'
      Size = 255
    end
    object spFilePropEmailTo: TStringField
      FieldName = 'EmailTo'
      Size = 255
    end
    object spFilePropSubj: TStringField
      FieldName = 'Subj'
      Size = 255
    end
    object spFilePropAdv_Str1: TStringField
      FieldName = 'Adv_Str1'
      Size = 255
    end
    object spFilePropAdv_Str2: TStringField
      FieldName = 'Adv_Str2'
      Size = 255
    end
    object spFilePropAdv_Str3: TStringField
      FieldName = 'Adv_Str3'
      Size = 255
    end
    object spFilePropAdv_Str4: TStringField
      FieldName = 'Adv_Str4'
      Size = 255
    end
    object spFilePropAdv_Str5: TStringField
      FieldName = 'Adv_Str5'
      Size = 255
    end
    object spFilePropAdv_Str6: TStringField
      FieldName = 'Adv_Str6'
      Size = 255
    end
    object spFilePropAdv_Str7: TStringField
      FieldName = 'Adv_Str7'
      Size = 255
    end
    object spFilePropAdv_Str8: TStringField
      FieldName = 'Adv_Str8'
      Size = 255
    end
    object spFilePropAdv_Str9: TStringField
      FieldName = 'Adv_Str9'
      Size = 255
    end
    object spFilePropAdv_Str10: TStringField
      FieldName = 'Adv_Str10'
      Size = 255
    end
    object spFilePropxID_NS: TIntegerField
      FieldName = 'xID_NS'
    end
    object spFilePropid_User_F: TIntegerField
      FieldName = 'id_User_F'
    end
    object spFilePropid_User_L: TIntegerField
      FieldName = 'id_User_L'
    end
    object spFilePropLastEdit: TDateTimeField
      FieldName = 'LastEdit'
    end
    object spFilePropid_WorkType2: TIntegerField
      FieldName = 'id_WorkType2'
    end
    object spFilePropid_WorkType3: TIntegerField
      FieldName = 'id_WorkType3'
    end
    object spFilePropid_WorkType4: TIntegerField
      FieldName = 'id_WorkType4'
    end
    object spFilePropid_WorkType5: TIntegerField
      FieldName = 'id_WorkType5'
    end
    object spFilePropBayerDeleted: TBooleanField
      FieldName = 'BayerDeleted'
    end
    object spFilePropSellerDeleted: TBooleanField
      FieldName = 'SellerDeleted'
    end
    object spFilePropFIO: TStringField
      FieldName = 'FIO'
      Size = 255
    end
    object spFilePropLastFIO: TStringField
      FieldName = 'LastFIO'
      Size = 255
    end
    object spFilePropWorkTypeName1: TStringField
      FieldName = 'WorkTypeName1'
      Size = 255
    end
    object spFilePropWorkTypeName2: TStringField
      FieldName = 'WorkTypeName2'
      Size = 255
    end
    object spFilePropWorkTypeName3: TStringField
      FieldName = 'WorkTypeName3'
      Size = 255
    end
    object spFilePropWorkTypeName4: TStringField
      FieldName = 'WorkTypeName4'
      Size = 255
    end
    object spFilePropWorkTypeName5: TStringField
      FieldName = 'WorkTypeName5'
      Size = 255
    end
  end
  object spWT: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'WD_ObjGetWT;1'
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
        Name = '@ID_NS'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 312
    Top = 272
  end
  object dsWT: TSQLUpdateDSProvider
    DataSet = spWT
    Constraints = True
    Left = 312
    Top = 320
  end
  object spCAInfo: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'WD_caInfo;1'
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
      end>
    Left = 469
    Top = 16
  end
  object dsCAInfo: TSQLUpdateDSProvider
    DataSet = spCAInfo
    Constraints = True
    Left = 472
    Top = 64
  end
  object spUsers: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'USR_USERGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_User'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 488
    Top = 136
  end
  object dsUsers: TSQLUpdateDSProvider
    DataSet = spUsers
    Constraints = True
    Left = 488
    Top = 184
  end
  object dsUserProp: TSQLUpdateDSProvider
    DataSet = spUserProp
    Constraints = True
    Left = 488
    Top = 280
  end
  object spUserProp: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'USR_USERGetProp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_User'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 112
      end>
    Left = 488
    Top = 232
    object spUserPropid_User: TAutoIncField
      FieldName = 'id_User'
      ReadOnly = True
    end
    object spUserPropFIO: TStringField
      FieldName = 'FIO'
      Size = 255
    end
    object spUserPropUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 255
    end
    object spUserPropid_UADM: TBooleanField
      FieldName = 'id_UADM'
    end
  end
  object spDDD: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'NS_NameRulesGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_NS'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@isInt'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 125
    Top = 208
  end
  object dsDDD: TSQLUpdateDSProvider
    DataSet = spDDD
    Constraints = True
    Left = 128
    Top = 256
  end
  object spFileCalcName: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'WD_FileCalcName;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_File'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 589
      end>
    Left = 104
    Top = 104
    object spFileCalcNameCalcName: TStringField
      FieldName = 'CalcName'
      Size = 255
    end
  end
  object spErr: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'WD_SetisAutoLong;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_File'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@isAutoLong'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@FileSize'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 104
    Top = 344
  end
  object dsFindCAByEmail: TSQLUpdateDSProvider
    DataSet = spFindCAByEmail
    Constraints = True
    Left = 584
    Top = 80
  end
  object spFindCAByEmail: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'WD_FindCAByEmail;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Email'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end>
    Left = 584
    Top = 32
  end
  object spBuffCnt: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'WD_BuffGetCnt;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_User'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 11
      end>
    Left = 597
    Top = 168
    object spBuffCntCnt: TIntegerField
      FieldName = 'Cnt'
      ReadOnly = True
    end
  end
  object spMSG: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'log_logAdd;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@msg'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end>
    Left = 608
    Top = 280
    object StringField1: TStringField
      FieldName = 'CalcName'
      Size = 255
    end
  end
end
