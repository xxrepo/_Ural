object ReplDM: TReplDM
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  Left = 65516
  Top = 107
  Height = 713
  Width = 1022
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=1;Persist Security Info=True;User I' +
      'D=sa;Initial Catalog=ACS_MBase;Data Source=.;Extended Properties' +
      '="Use Encryption for Data=False;Tag with column collation when p' +
      'ossible=False";Use Procedure for Prepare=1;Auto Translate=True;P' +
      'acket Size=4096;Workstation ID=HP;Use Encryption for Data=False;' +
      'Tag with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 8
  end
  object spWhoIAm: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'RP_ReplicatorWhoIAm;1'
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
    Left = 209
    Top = 8
    object spWhoIAmid_Replicator: TAutoIncField
      FieldName = 'id_Replicator'
      ReadOnly = True
    end
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
    Left = 656
    Top = 16
  end
  object dsAccTS: TDataSetProvider
    DataSet = spAccTS
    Constraints = True
    Left = 32
    Top = 128
  end
  object spAccTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Acc_GetTIMESTAMP;1'
    Parameters = <>
    Left = 32
    Top = 80
  end
  object dsAccList: TDataSetProvider
    DataSet = spAccList
    Constraints = True
    Left = 32
    Top = 232
  end
  object spAccList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'RP_Acc_RepAccList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 32
    Top = 184
    object spAccListid_Acc: TAutoIncField
      FieldName = 'id_Acc'
      ReadOnly = True
    end
    object spAccListid_business: TIntegerField
      FieldName = 'id_business'
    end
    object spAccListName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spAccListBank: TStringField
      FieldName = 'Bank'
      Size = 50
    end
    object spAccListPrsnAccName: TStringField
      FieldName = 'PrsnAccName'
    end
    object spAccListCorrAccName: TStringField
      FieldName = 'CorrAccName'
    end
    object spAccListINN: TStringField
      FieldName = 'INN'
    end
    object spAccListBIK: TStringField
      FieldName = 'BIK'
    end
    object spAccListDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object spAccListLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spAccListID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object spAccListid_Acc_Group: TIntegerField
      FieldName = 'id_Acc_Group'
    end
  end
  object dsBsnList: TDataSetProvider
    DataSet = spBsnList
    Constraints = True
    Left = 96
    Top = 224
  end
  object spBsnList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_BSN_RepBusinessList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 96
    Top = 176
    object spBsnListid_business: TAutoIncField
      FieldName = 'id_business'
      ReadOnly = True
    end
    object spBsnListId_Currency: TIntegerField
      FieldName = 'Id_Currency'
    end
    object spBsnListName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spBsnListShortName: TStringField
      FieldName = 'ShortName'
      Size = 5
    end
    object spBsnListNum: TStringField
      FieldName = 'Num'
      Size = 5
    end
    object spBsnListDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object spBsnListLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spBsnListID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object spBsnListCrn_Name: TStringField
      FieldName = 'Crn_Name'
      Size = 30
    end
    object spBsnListCrn_ShortName: TStringField
      FieldName = 'Crn_ShortName'
      Size = 10
    end
    object spBsnListCrn_ISOCode: TStringField
      FieldName = 'Crn_ISOCode'
      FixedChar = True
      Size = 3
    end
    object spBsnListCrn_NumberCode: TStringField
      FieldName = 'Crn_NumberCode'
      FixedChar = True
      Size = 3
    end
    object spBsnListCrn_FastAccess: TBooleanField
      FieldName = 'Crn_FastAccess'
    end
    object spBsnListCrn_Value: TIntegerField
      FieldName = 'Crn_Value'
    end
    object spBsnListCrn_Rate: TBCDField
      FieldName = 'Crn_Rate'
      Precision = 19
    end
    object spBsnListCrn_AvForPay: TBooleanField
      FieldName = 'Crn_AvForPay'
    end
  end
  object dsBsnTS: TDataSetProvider
    DataSet = spBsnTS
    Constraints = True
    Left = 96
    Top = 128
  end
  object spBsnTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_BSN_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 96
    Top = 80
  end
  object dsCrnList: TDataSetProvider
    DataSet = spCrnList
    Constraints = True
    Left = 160
    Top = 224
  end
  object spCrnList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Crn_RepCrnList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 160
    Top = 176
    object spCrnListId_Currency: TAutoIncField
      FieldName = 'Id_Currency'
      ReadOnly = True
    end
    object spCrnListName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object spCrnListShortName: TStringField
      FieldName = 'ShortName'
      Size = 10
    end
    object spCrnListISOCode: TStringField
      FieldName = 'ISOCode'
      FixedChar = True
      Size = 3
    end
    object spCrnListNumberCode: TStringField
      FieldName = 'NumberCode'
      FixedChar = True
      Size = 3
    end
    object spCrnListFastAccess: TBooleanField
      FieldName = 'FastAccess'
    end
    object spCrnListValue: TIntegerField
      FieldName = 'Value'
    end
    object spCrnListRate: TFloatField
      FieldName = 'Rate'
    end
    object spCrnListAvForPay: TBooleanField
      FieldName = 'AvForPay'
    end
    object spCrnListId_URL: TIntegerField
      FieldName = 'Id_URL'
    end
    object spCrnListBase: TBooleanField
      FieldName = 'Base'
    end
    object spCrnListLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spCrnListid_Main: TIntegerField
      FieldName = 'id_Main'
    end
    object spCrnListid_Bsn: TIntegerField
      FieldName = 'id_Bsn'
    end
    object spCrnListId_CurrencyUnData: TIntegerField
      FieldName = 'Id_CurrencyUnData'
    end
  end
  object dsCrnTS: TDataSetProvider
    DataSet = spCrnTS
    Constraints = True
    Left = 160
    Top = 128
  end
  object spCrnTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Crn_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 160
    Top = 80
  end
  object dsReprList: TDataSetProvider
    DataSet = spReprList
    Constraints = True
    Left = 216
    Top = 224
  end
  object spReprList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Repr_RepReprList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 216
    Top = 176
  end
  object dsReprTS: TDataSetProvider
    DataSet = srReprTS
    Constraints = True
    Left = 216
    Top = 128
  end
  object srReprTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Repr_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 216
    Top = 80
  end
  object dsMNList: TDataSetProvider
    DataSet = spMNList
    Constraints = True
    Left = 416
    Top = 168
  end
  object spMNList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Mn_RepMnList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 416
    Top = 120
  end
  object dsMNTS: TDataSetProvider
    DataSet = spMNTS
    Constraints = True
    Left = 416
    Top = 72
  end
  object spMNTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_mn_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 416
    Top = 24
  end
  object dsMSList: TDataSetProvider
    DataSet = spMSList
    Constraints = True
    Left = 24
    Top = 456
  end
  object spMSList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_MS_RepMSList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 24
    Top = 408
  end
  object dsMSTS: TDataSetProvider
    DataSet = spMSTS
    Constraints = True
    Left = 24
    Top = 360
  end
  object spMSTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_MS_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 24
    Top = 312
  end
  object dsWHList: TDataSetProvider
    DataSet = spWHList
    Constraints = True
    Left = 88
    Top = 448
  end
  object spWHList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Wh_RepWhList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 88
    Top = 400
  end
  object dsWHTS: TDataSetProvider
    DataSet = spWHTS
    Constraints = True
    Left = 88
    Top = 352
  end
  object spWHTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_WH_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 88
    Top = 304
  end
  object dsCtgGoodsList: TDataSetProvider
    DataSet = spCtgGoodsList
    Constraints = True
    Left = 728
    Top = 160
  end
  object spCtgGoodsList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_CtgGoods_RepCtgGoodsList;1'
    Parameters = <>
    Left = 728
    Top = 112
  end
  object dsCtgGoodsTS: TDataSetProvider
    DataSet = spCtgGoodsTS
    Constraints = True
    Left = 728
    Top = 64
  end
  object spCtgGoodsTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_CtgGoods_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 728
    Top = 16
  end
  object dsGoodsList: TDataSetProvider
    DataSet = spGoodsList
    Constraints = True
    Left = 744
    Top = 352
  end
  object spGoodsList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Goods_RepGoodsList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 744
    Top = 304
  end
  object dsGoodsTS: TDataSetProvider
    DataSet = spGoodsTS
    Constraints = True
    Left = 744
    Top = 256
  end
  object spGoodsTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Goods_GetTIMESTAMP;1'
    Parameters = <>
    Left = 744
    Top = 208
  end
  object dsCAWHList: TDataSetProvider
    DataSet = spCAWHList
    Constraints = True
    Left = 144
    Top = 456
  end
  object spCAWHList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_CAWH_RepCAWHList;1'
    Parameters = <>
    Left = 144
    Top = 408
  end
  object dsCAWHTS: TDataSetProvider
    DataSet = spCAWHTS
    Constraints = True
    Left = 144
    Top = 360
  end
  object spCAWHTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_CAWH_GetTIMESTAMP;1'
    Parameters = <>
    Left = 144
    Top = 312
  end
  object dsFuncList: TDataSetProvider
    DataSet = spFuncList
    Constraints = True
    Left = 208
    Top = 424
  end
  object spFuncList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Func_RepFuncList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 208
    Top = 376
  end
  object dsFuncTS: TDataSetProvider
    DataSet = spFuncTS
    Constraints = True
    Left = 208
    Top = 328
  end
  object spFuncTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Func_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 208
    Top = 280
  end
  object dsUserList: TDataSetProvider
    DataSet = spUserList
    Constraints = True
    Left = 264
    Top = 424
  end
  object spUserList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'RP_User_RepUserList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 264
    Top = 376
  end
  object dsUserTS: TDataSetProvider
    DataSet = spUserTS
    Constraints = True
    Left = 264
    Top = 328
  end
  object spUserTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_User_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 264
    Top = 280
  end
  object dsGroupList: TDataSetProvider
    DataSet = spGroupList
    Constraints = True
    Left = 320
    Top = 440
  end
  object spGroupList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'RP_Group_RepGroupList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 320
    Top = 392
  end
  object dsGroupTS: TDataSetProvider
    DataSet = spGroupTS
    Constraints = True
    Left = 320
    Top = 344
  end
  object spGroupTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Group_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 320
    Top = 296
  end
  object dsGetGroup: TDataSetProvider
    DataSet = spGetGroup
    Constraints = True
    Left = 264
    Top = 520
  end
  object spGetGroup: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'RP_User_GetGroup;1'
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
    Left = 264
    Top = 472
  end
  object dsGetRights: TDataSetProvider
    DataSet = spGetRights
    Constraints = True
    Left = 328
    Top = 544
  end
  object spGetRights: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'RP_Group_GetRights;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Group'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 328
    Top = 496
  end
  object dsLNKList: TDataSetProvider
    DataSet = spLNKList
    Constraints = True
    Left = 368
    Top = 424
  end
  object spLNKList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'RP_LNK_RepRelinkList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 368
    Top = 376
  end
  object dsLNKTS: TDataSetProvider
    DataSet = spLNKTS
    Constraints = True
    Left = 368
    Top = 328
  end
  object spLNKTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_lnk_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 368
    Top = 280
  end
  object dsOPList: TDataSetProvider
    DataSet = spOPList
    Constraints = True
    Left = 408
    Top = 576
  end
  object spOPList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'RP_OP_Oper_RepOperList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 408
    Top = 528
  end
  object dsOpTS: TDataSetProvider
    DataSet = spOpTS
    Constraints = True
    Left = 408
    Top = 480
  end
  object spOpTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_OP_Oper_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 408
    Top = 432
  end
  object dsWhStateTS: TDataSetProvider
    DataSet = spWhStateTS
    Constraints = True
    Left = 344
    Top = 48
  end
  object spWhStateTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_WHState_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 344
  end
  object spLog: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Log_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Msg'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end>
    Left = 624
    Top = 88
  end
  object spWHSList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_WHState_RepList_v21;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 504
    Top = 392
  end
  object dsWHSList: TDataSetProvider
    DataSet = spWHSList
    Constraints = True
    Left = 504
    Top = 440
  end
  object spWHS2: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'RP_WHState_RepList_v22;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Warehouse'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 504
    Top = 488
  end
  object dsWHS2: TDataSetProvider
    DataSet = spWHS2
    Constraints = True
    Left = 504
    Top = 536
  end
  object spEDTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_ExtDataNames_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 608
    Top = 536
  end
  object spEDList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_ExtDataNamesList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 5
      end>
    Left = 608
    Top = 480
  end
  object dsEDList: TDataSetProvider
    DataSet = spEDList
    Constraints = True
    Left = 656
    Top = 480
  end
  object dsEDTS: TDataSetProvider
    DataSet = spEDTS
    Constraints = True
    Left = 656
    Top = 536
  end
  object spAddOper_v22: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_OP_OperAdd_v22;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@AddOldData'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@DateLocal'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@id_LC_Oper'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Replicator'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@OperVid'
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
      end
      item
        Name = '@Correct'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@OperTypeIn'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Id_CurrencyOper'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PriceFinOper'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Id_CurrencySys'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@SummSysFin'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@id_Acc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Warehouse'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Repr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Acc_Ext'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Warehouse_Ext'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Manufact'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Manufact_Ext'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_UserCreator'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_DocType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Imp_PayBasic'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1000
        Value = Null
      end
      item
        Name = '@AccInv_PayAssignment'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1000
        Value = Null
      end
      item
        Name = '@Contract'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1000
        Value = Null
      end
      item
        Name = '@OpComment'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1000
        Value = Null
      end
      item
        Name = '@Koeff'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Dig1'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Dig2'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Dig3'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Dig4'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Dig5'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Dig6'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Dig7'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Dig8'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Dig9'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Dig10'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Dig11'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Dig12'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Dig13'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Dig14'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Dig15'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Str1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Str2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Str3'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Str4'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Str5'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Str6'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Str7'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Str8'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Str9'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Str10'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Str11'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Str12'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Str13'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Str14'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Str15'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Date1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Date2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Date3'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Date4'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Date5'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Date6'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Date7'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Date8'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Date9'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Date10'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Date11'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Date12'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Date13'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Date14'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Date15'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@id_FormalDistrib'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_FuncDistrib'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_OperParent'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 48
    Top = 544
  end
  object spAddWare: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_OP_OperAdd_Ware;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Oper'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@AmountOper'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@id_Measure'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PriceOper'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@SummSys'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@id_Goods'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 152
    Top = 544
  end
  object spWHS_3: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'RP_WHState_RepList_v23;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Warehouse'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 504
    Top = 584
  end
  object dsWHS_3: TDataSetProvider
    DataSet = spWHS_3
    Constraints = True
    Left = 504
    Top = 632
  end
  object dsFuncDistribList: TDataSetProvider
    DataSet = spFuncDistribList
    Constraints = True
    Left = 480
    Top = 160
  end
  object spFuncDistribList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_FuncDistrib_List;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 480
    Top = 112
  end
  object dsFuncDistribTS: TDataSetProvider
    DataSet = spFuncDistribTS
    Constraints = True
    Left = 480
    Top = 64
  end
  object spFuncDistribTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_FuncDistrib_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 480
    Top = 16
  end
  object dsFormalDistribList: TDataSetProvider
    DataSet = spFormalDistribList
    Constraints = True
    Left = 544
    Top = 152
  end
  object spFormalDistribList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_FormalDistrib_List;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 544
    Top = 104
  end
  object dsFormalDistribTS: TDataSetProvider
    DataSet = spFormalDistribTS
    Constraints = True
    Left = 544
    Top = 56
  end
  object spFormalDistribTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_FormalDistrib_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 544
    Top = 8
  end
  object dsINV_FormList: TDataSetProvider
    DataSet = spINV_FormList
    Constraints = True
    Left = 528
    Top = 352
  end
  object spINV_FormList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Inv_Form_List;1'
    Parameters = <>
    Left = 528
    Top = 304
  end
  object dsINV_FormTS: TDataSetProvider
    DataSet = spINV_FormTS
    Constraints = True
    Left = 528
    Top = 256
  end
  object spINV_FormTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Inv_Form_GetTIMESTAMP;1'
    Parameters = <>
    Left = 528
    Top = 208
  end
  object dsInv_LinesList: TDataSetProvider
    DataSet = spInv_LinesList
    Constraints = True
    Left = 584
    Top = 368
  end
  object spInv_LinesList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Inv_Lines_List;1'
    Parameters = <>
    Left = 584
    Top = 320
  end
  object dsInv_LinesTS: TDataSetProvider
    DataSet = spInv_LinesTS
    Constraints = True
    Left = 584
    Top = 272
  end
  object spInv_LinesTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Inv_Lines_GetTIMESTAMP;1'
    Parameters = <>
    Left = 584
    Top = 224
  end
  object dsINV_TimeDictList: TDataSetProvider
    DataSet = spINV_TimeDictList
    Constraints = True
    Left = 640
    Top = 400
  end
  object spINV_TimeDictList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_INV_TimeDict_List;1'
    Parameters = <>
    Left = 640
    Top = 352
  end
  object dsINV_TimeDictTS: TDataSetProvider
    DataSet = spINV_TimeDictTS
    Constraints = True
    Left = 640
    Top = 304
  end
  object spINV_TimeDictTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_INV_TimeDict_GetTIMESTAMP;1'
    Parameters = <>
    Left = 640
    Top = 256
  end
  object dsRP_Inv_GetProp: TDataSetProvider
    DataSet = spRP_Inv_GetProp
    Constraints = True
    Left = 656
    Top = 208
  end
  object spRP_Inv_GetProp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from inv_Project where 1=0')
    Left = 656
    Top = 152
  end
  object spInvTimeList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_INV_UP_TimeItemGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Project'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 608
    Top = 584
  end
  object dsInvTimeList: TDataSetProvider
    DataSet = spInvTimeList
    Constraints = True
    Left = 656
    Top = 584
  end
  object dsInvWareList: TDataSetProvider
    DataSet = spInvWareList
    Constraints = True
    Left = 656
    Top = 632
  end
  object spInvWareList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_INV_UP_WareItemGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Project'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 608
    Top = 632
  end
  object spInvProject: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Inv_UN_ProjectRepList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 608
    Top = 680
    object spInvProjectid_Project: TAutoIncField
      FieldName = 'id_Project'
      ReadOnly = True
    end
    object spInvProjectLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
  end
  object dsInvProject: TDataSetProvider
    DataSet = spInvProject
    Constraints = True
    Left = 656
    Top = 680
  end
  object spInvProjectGetTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Inv_Project_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 720
    Top = 624
    object spInvProjectGetTSLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
  end
  object dsInvProjectGetTS: TDataSetProvider
    DataSet = spInvProjectGetTS
    Constraints = True
    Left = 768
    Top = 624
  end
  object ds201List: TDataSetProvider
    DataSet = sp201List
    Constraints = True
    Left = 280
    Top = 152
  end
  object sp201List: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_201_Oper_LCList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 280
    Top = 104
  end
  object ds201TS: TDataSetProvider
    DataSet = sp201TS
    Constraints = True
    Left = 280
    Top = 56
  end
  object sp201TS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_201_Oper_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 280
    Top = 8
  end
  object ds201Ware: TDataSetProvider
    DataSet = sp201Ware
    Constraints = True
    Left = 280
    Top = 248
  end
  object sp201Ware: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_201_OP_OperGet_Ware;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Oper'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 123
      end>
    Left = 280
    Top = 200
  end
  object dsAccGrpGetList: TDataSetProvider
    DataSet = spAccGrpGetList
    Constraints = True
    Left = 416
    Top = 360
  end
  object spAccGrpGetList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_v2_Acc_Group_List;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 416
    Top = 312
  end
  object dsAccGrpTS: TDataSetProvider
    DataSet = spAccGrpTS
    Constraints = True
    Left = 416
    Top = 264
  end
  object spAccGrpTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_v2_Acc_Group_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 416
    Top = 216
  end
  object dsCAGroupGetList: TDataSetProvider
    DataSet = spCAGroupGetList
    Constraints = True
    Left = 472
    Top = 360
  end
  object spCAGroupGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'RP_v2_CAGroup_List;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 472
    Top = 312
  end
  object dsCAGroupTS: TDataSetProvider
    DataSet = spCAGroupTS
    Constraints = True
    Left = 472
    Top = 264
  end
  object spCAGroupTS: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'RP_v2_CAGroup_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 472
    Top = 216
  end
  object dsCAList: TDataSetProvider
    DataSet = spCAList
    Constraints = True
    Left = 336
    Top = 248
  end
  object spCAList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_v2_ContrAgent_List;1'
    Parameters = <>
    Left = 336
    Top = 200
  end
  object dsCATS: TDataSetProvider
    DataSet = spCATS
    Constraints = True
    Left = 336
    Top = 152
  end
  object spCATS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_v2_ContrAgent_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 336
    Top = 104
  end
  object spRRRTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_V2_Permit_GetTIMESTAMP;1'
    Parameters = <>
    Left = 560
    Top = 432
  end
  object dsRRRTS: TDataSetProvider
    DataSet = spRRRTS
    Constraints = True
    Left = 560
    Top = 480
  end
  object spRRRList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_V2_Permit_List;1'
    Parameters = <>
    Left = 560
    Top = 528
  end
  object dsRRRList: TDataSetProvider
    DataSet = spRRRList
    Constraints = True
    Left = 560
    Top = 576
  end
  object dsDocList: TDataSetProvider
    DataSet = spDocList
    Constraints = True
    Left = 760
    Top = 448
  end
  object spDocList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Doc_GetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@TName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@LastUpdated1'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@LastUpdated2'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end
      item
        Name = '@ID_Rep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 720
    Top = 464
  end
  object dsDocTS: TDataSetProvider
    DataSet = spDocTS
    Constraints = True
    Left = 760
    Top = 400
  end
  object spDocTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Doc_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@TName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end>
    Left = 720
    Top = 408
  end
  object dsDocCH: TDataSetProvider
    DataSet = spDocCH
    Constraints = True
    Left = 760
    Top = 496
  end
  object spDocCH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Doc_GetList_Ch;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@TName_CH'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@TKey'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end>
    Left = 720
    Top = 512
  end
end
