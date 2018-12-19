object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 65535
  Top = 52
  Height = 713
  Width = 1022
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=1;Persist Security Info=True;User I' +
      'D=SA;Initial Catalog=b1;Data Source=.;Use Procedure for Prepare=' +
      '1;Auto Translate=True;Packet Size=4096;Application Name=Replicat' +
      'or;Workstation ID=OVK;Use Encryption for Data=False;Tag with col' +
      'umn collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 50
    Top = 16
  end
  object spAccCLList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Acc_LCList;1'
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 16
    Top = 80
  end
  object spTSGet: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_TSGet;1'
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
    Left = 168
    Top = 16
  end
  object spTSFix: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_TSFix;1'
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
        Name = '@TS'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 8
        Value = Null
      end>
    Left = 248
    Top = 16
  end
  object spAcc_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Acc_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Disabled'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Acc_Group_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 16
    Top = 128
  end
  object cdsAccTS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsAccTS'
    RemoteServer = SocketConnection1
    Left = 16
    Top = 184
  end
  object SocketConnection1: TSocketConnection
    ServerGUID = '{67884D55-9085-474F-B7AF-14F2836208ED}'
    ServerName = 'ReplSvc.ReplDM'
    Address = '127.0.0.1'
    Left = 112
    Top = 32
  end
  object cdsAccList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsAccList'
    RemoteServer = SocketConnection1
    Left = 16
    Top = 240
  end
  object spAcc_CH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Acc_CH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 16
    Top = 288
  end
  object spCrn_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Crn_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end
      item
        Name = '@ShortName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@ISOCode'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@NumberCode'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@FastAccess'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Value'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Rate'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@AvForPay'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@id_BsnMain'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Base'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 72
    Top = 104
  end
  object cdsCrnTS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsCrnTS'
    RemoteServer = SocketConnection1
    Left = 72
    Top = 160
  end
  object cdsCrnList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsCrnList'
    RemoteServer = SocketConnection1
    Left = 72
    Top = 216
  end
  object spCrn_CH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Crn_CH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Currency'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 72
    Top = 272
  end
  object spBSN_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_BSN_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@ShortName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Id_Currency_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 5
        Value = Null
      end
      item
        Name = '@Disabled'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Crn_Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end
      item
        Name = '@Crn_ShortName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@Crn_ISOCode'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@Crn_NumberCode'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@Crn_FastAccess'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Crn_Value'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Crn_Rate'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Crn_AvForPay'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 136
    Top = 128
  end
  object cdsBsnTS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsBsnTS'
    RemoteServer = SocketConnection1
    Left = 136
    Top = 184
  end
  object cdsBsnList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsBsnList'
    RemoteServer = SocketConnection1
    Left = 136
    Top = 240
  end
  object spBsn_CH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Bsn_CH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Business'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 136
    Top = 296
  end
  object spReprLCList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Repr_LCList;1'
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 192
    Top = 112
  end
  object spRepr_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Repr_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_ContrAgent_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Bsn_ex_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@isJur'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@FirstName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end
      item
        Name = '@MiddleName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end
      item
        Name = '@LastName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end
      item
        Name = '@Id_Currency_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Disabled'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Addr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2000
        Value = Null
      end
      item
        Name = '@Descr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2000
        Value = Null
      end>
    Left = 192
    Top = 160
  end
  object cdsReprTS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsReprTS'
    RemoteServer = SocketConnection1
    Left = 192
    Top = 216
  end
  object cdsReprList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsReprList'
    RemoteServer = SocketConnection1
    Left = 192
    Top = 272
  end
  object spRepr_CH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Repr_CH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 88
  end
  object spMNLCList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Mn_LCList;1'
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 312
    Top = 72
  end
  object spMn_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Mn_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Disabled'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 312
    Top = 120
  end
  object cdsMNTS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsMNTS'
    RemoteServer = SocketConnection1
    Left = 312
    Top = 176
  end
  object cdsMNList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsMNList'
    RemoteServer = SocketConnection1
    Left = 312
    Top = 232
  end
  object spMn_CH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Mn_CH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 312
    Top = 280
  end
  object spCtgGoodsLCList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_CtgGoods_LCList;1'
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 696
    Top = 88
  end
  object spCtgGoods_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_CtgGoods_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
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
        Name = '@ShortName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_BaseCtg_Goods_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Disabled'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 696
    Top = 136
  end
  object cdsCtgGoodsTS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsCtgGoodsTS'
    RemoteServer = SocketConnection1
    Left = 696
    Top = 192
  end
  object cdsCtgGoodsList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsCtgGoodsList'
    RemoteServer = SocketConnection1
    Left = 696
    Top = 248
  end
  object spCtgGoods_CH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_CtgGoods_CH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Ctg_Goods'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 696
    Top = 296
  end
  object spMSLCList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_MS_LCList;1'
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 24
    Top = 368
  end
  object spMS_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_MS_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@ShortName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@id_BaseMeasure_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Koef'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Disabled'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 24
    Top = 416
  end
  object cdsMSTS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsMSTS'
    RemoteServer = SocketConnection1
    Left = 24
    Top = 472
  end
  object cdsMSList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsMSList'
    RemoteServer = SocketConnection1
    Left = 24
    Top = 528
  end
  object spMS_CH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_MS_CH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 24
    Top = 576
  end
  object spWHLCList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_wh_LCList;1'
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 80
    Top = 352
  end
  object spWH_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Wh_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Addr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1000
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Disabled'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 80
    Top = 400
  end
  object cdsWHTS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsWHTS'
    RemoteServer = SocketConnection1
    Left = 80
    Top = 456
  end
  object cdsWHList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsWHList'
    RemoteServer = SocketConnection1
    Left = 80
    Top = 512
  end
  object spWh_CH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Wh_CH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 80
    Top = 560
  end
  object spGoodsLCList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Goods_LCList;1'
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 696
    Top = 352
  end
  object spGoods_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Goods_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
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
        Name = '@ShortName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@BarCode'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@id_Measure_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Ctg_Goods_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Disabled'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 696
    Top = 400
  end
  object cdsGoodsTS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsGoodsTS'
    RemoteServer = SocketConnection1
    Left = 696
    Top = 456
  end
  object cdsGoodsList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsGoodsList'
    RemoteServer = SocketConnection1
    Left = 696
    Top = 512
  end
  object spGoods_CH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Goods_CH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Goods'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 696
    Top = 560
  end
  object spCAWHLCList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_CAWH_LCList;1'
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 144
    Top = 376
  end
  object spCAWH_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_CAWH_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Repr_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Addr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2000
        Value = Null
      end
      item
        Name = '@Descr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2000
        Value = Null
      end
      item
        Name = '@Disabled'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 144
    Top = 424
  end
  object cdsCAWHTS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsCAWHTS'
    RemoteServer = SocketConnection1
    Left = 144
    Top = 480
  end
  object cdsCAWHList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsCAWHList'
    RemoteServer = SocketConnection1
    Left = 144
    Top = 536
  end
  object spCAWH_CH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_CAWH_CH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_CAWhouse'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 144
    Top = 584
  end
  object spFunc_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Func_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end
      item
        Name = '@UID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@DESCR'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end>
    Left = 208
    Top = 448
  end
  object cdsFuncTS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsFuncTS'
    RemoteServer = SocketConnection1
    Left = 208
    Top = 504
  end
  object cdsFuncList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsFuncList'
    RemoteServer = SocketConnection1
    Left = 208
    Top = 560
  end
  object spUser_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_User_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@FirstName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@MiddleName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@LastName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
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
      end
      item
        Name = '@PspSeries'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@PspNumber'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@PspPlace'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@PspDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@PspAddr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@AddrReal'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Phones'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Emails'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@OrgPost'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@Disabled'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@isPPP'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 264
    Top = 448
  end
  object cdsUserTS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsUserTS'
    RemoteServer = SocketConnection1
    Left = 264
    Top = 504
  end
  object cdsUserList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsUserList'
    RemoteServer = SocketConnection1
    Left = 264
    Top = 560
  end
  object spGroup_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Group_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Disabled'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 336
    Top = 448
  end
  object cdsGroupTS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsGroupTS'
    RemoteServer = SocketConnection1
    Left = 336
    Top = 504
  end
  object cdsGroupList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsGroupList'
    RemoteServer = SocketConnection1
    Left = 336
    Top = 560
  end
  object spDelFromGroup: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_User_DelFromGroup;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_User_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 264
    Top = 344
  end
  object spAddToGrp: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_User_AddToGroup;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_User_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Group_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 264
    Top = 392
  end
  object cdsGetGroup: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_User'
        ParamType = ptInput
      end>
    ProviderName = 'dsGetGroup'
    RemoteServer = SocketConnection1
    Left = 264
    Top = 608
  end
  object cdsGetRights: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Group'
        ParamType = ptInput
      end>
    ProviderName = 'dsGetRights'
    RemoteServer = SocketConnection1
    Left = 344
    Top = 608
  end
  object spAddRights: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Group_AddRights;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@UID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Group_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 344
    Top = 392
  end
  object spDelRights: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Group_DelRights;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Group_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 344
    Top = 344
  end
  object spOper_LCList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Oper_LCList;1'
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 368
    Top = 8
  end
  object spOperTS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Oper_GetTIMESTAMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 368
    Top = 56
  end
  object spLNK_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_LNK_RepRelink_Add;1'
    Parameters = <>
    Left = 408
    Top = 408
  end
  object cdsLNKTS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsLNKTS'
    RemoteServer = SocketConnection1
    Left = 408
    Top = 464
  end
  object cdsLNKList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsLNKList'
    RemoteServer = SocketConnection1
    Left = 408
    Top = 520
  end
  object spOper_CH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Oper_CH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 368
    Top = 112
  end
  object spOper_Ware: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Oper_Ware;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_LC_Oper'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 368
    Top = 164
    object spOper_Wareid_LC_Oper: TIntegerField
      FieldName = 'id_LC_Oper'
    end
    object spOper_WareAmountOper: TFloatField
      FieldName = 'AmountOper'
    end
    object spOper_WarePriceOper: TFloatField
      FieldName = 'PriceOper'
    end
    object spOper_Wareid_Measure_Main: TIntegerField
      FieldName = 'id_Measure_Main'
    end
    object spOper_WareSummSys: TFloatField
      FieldName = 'SummSys'
    end
    object spOper_Wareid_Goods_Main: TIntegerField
      FieldName = 'id_Goods_Main'
    end
  end
  object spOper_Add: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_OP_Oper_Edit;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@CheckDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 368
    Top = 216
  end
  object cdsOPList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsOPList'
    RemoteServer = SocketConnection1
    Left = 368
    Top = 309
  end
  object cdsOpTS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end>
    ProviderName = 'dsOpTS'
    RemoteServer = SocketConnection1
    Left = 368
    Top = 261
  end
  object cdsWhStateTS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsWhStateTS'
    RemoteServer = SocketConnection1
    Left = 136
    Top = 85
  end
  object ADOStoredProc2: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_OP_Oper_Edit;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@CheckDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 8
  end
  object spTSClear: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_TSClear;1'
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
    Left = 192
    Top = 64
  end
  object spUser_LCList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_User_LCList;1'
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 408
    Top = 560
  end
  object spUser_CH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_User_CH;1'
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
        Name = '@id_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 408
    Top = 608
  end
  object spWHState_Clear: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_WHState_Clear;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 608
    Top = 538
  end
  object cdsWHStateList_2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsWHStateList'
    RemoteServer = SocketConnection1
    Left = 248
    Top = 253
  end
  object spAddWare: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_WHState_Add_Ware_22;1'
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
        Name = '@id_Measure_Main'
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
        Name = '@id_Goods_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 699
    Top = 576
  end
  object spWHStateAdd: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_WHState_Add_22;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Warehouse_Main'
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
      end>
    Left = 699
    Top = 528
  end
  object cdsWHS2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Warehouse'
        ParamType = ptInput
      end>
    ProviderName = 'dsWHS_3'
    RemoteServer = SocketConnection1
    Left = 699
    Top = 464
  end
  object cdsWHSList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsWHSList'
    RemoteServer = SocketConnection1
    Left = 699
    Top = 416
  end
  object spEDAdd: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_ExtDataNames_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Type'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NumPrm'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ParName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Visible'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@OrdNum'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 768
    Top = 232
  end
  object cdsEDList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsEDList'
    RemoteServer = SocketConnection1
    Left = 768
    Top = 288
  end
  object cdsEDTS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end>
    ProviderName = 'dsEDTS'
    RemoteServer = SocketConnection1
    Left = 768
    Top = 336
  end
  object spFormalDistribAdd: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_FormalDistrib_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 520
    Top = 168
  end
  object cdsFormalDistribList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsFormalDistribList'
    RemoteServer = SocketConnection1
    Left = 520
    Top = 216
  end
  object cdsFormalDistribTS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end>
    ProviderName = 'dsFormalDistribTS'
    RemoteServer = SocketConnection1
    Left = 520
    Top = 264
  end
  object spFuncDistribAdd: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_FuncDistrib_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 560
    Top = 24
  end
  object cdsFuncDistribList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsFuncDistribList'
    RemoteServer = SocketConnection1
    Left = 560
    Top = 72
  end
  object cdsFuncDistribTS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end>
    ProviderName = 'dsFuncDistribTS'
    RemoteServer = SocketConnection1
    Left = 560
    Top = 112
  end
  object spINV_FormAdd: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_INV_Form_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Lines_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Price'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@ExtID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ByAmount'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 488
    Top = 328
  end
  object cdsINV_FormList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsINV_FormList'
    RemoteServer = SocketConnection1
    Left = 488
    Top = 376
  end
  object cdsINV_FormTS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end>
    ProviderName = 'dsINV_FormTS'
    RemoteServer = SocketConnection1
    Left = 488
    Top = 424
  end
  object spInv_LinesAdd: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Inv_Lines_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@TimePrice'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@ExtID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@OrdNum'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 552
    Top = 344
  end
  object cdsInv_LinesList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsInv_LinesList'
    RemoteServer = SocketConnection1
    Left = 552
    Top = 392
  end
  object cdsInv_LinesTS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end>
    ProviderName = 'dsInv_LinesTS'
    RemoteServer = SocketConnection1
    Left = 552
    Top = 440
  end
  object spINV_TimeDictAdd: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_INV_TimeDict_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_Lines_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ExtID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@OrdNum'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 616
    Top = 368
  end
  object cdsINV_TimeDictList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsINV_TimeDictList'
    RemoteServer = SocketConnection1
    Left = 616
    Top = 416
  end
  object cdsINV_TimeDictTS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end>
    ProviderName = 'dsINV_TimeDictTS'
    RemoteServer = SocketConnection1
    Left = 616
    Top = 464
  end
  object spInv_Project_CH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Inv_Project_CH;1'
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
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 616
    Top = 176
  end
  object cdsRP_Inv_GetProp: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end>
    ProviderName = 'dsRP_Inv_GetProp'
    RemoteServer = SocketConnection1
    Left = 616
    Top = 232
  end
  object spINVTimeItem: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_INV_TimeItem_List;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_Project'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 616
    Top = 280
    object spINVTimeItemid_TimeItem: TAutoIncField
      FieldName = 'id_TimeItem'
      ReadOnly = True
    end
    object spINVTimeItemid_TimeDict: TIntegerField
      FieldName = 'id_TimeDict'
    end
    object spINVTimeItemid_Project: TIntegerField
      FieldName = 'id_Project'
    end
    object spINVTimeItemVal: TDateTimeField
      FieldName = 'Val'
    end
    object spINVTimeItemTimePrice: TFloatField
      FieldName = 'TimePrice'
    end
    object spINVTimeItemValPlan: TDateTimeField
      FieldName = 'ValPlan'
    end
    object spINVTimeItemTimePricePlan: TFloatField
      FieldName = 'TimePricePlan'
    end
    object spINVTimeItemID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object spINVTimeItemLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spINVTimeItemid_TimeDict_Main: TIntegerField
      FieldName = 'id_TimeDict_Main'
    end
  end
  object spInvWare: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_INV_Ware_List;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_Project'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 616
    Top = 328
    object spInvWareid_Inv_Ware: TAutoIncField
      FieldName = 'id_Inv_Ware'
      ReadOnly = True
    end
    object spInvWareid_Project: TIntegerField
      FieldName = 'id_Project'
    end
    object spInvWareid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object spInvWareid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object spInvWareid_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object spInvWareAmountPlan: TFloatField
      FieldName = 'AmountPlan'
    end
    object spInvWarePricePlan: TFloatField
      FieldName = 'PricePlan'
    end
    object spInvWareAmount: TFloatField
      FieldName = 'Amount'
    end
    object spInvWareSumm: TFloatField
      FieldName = 'Summ'
    end
    object spInvWareID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object spInvWareLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spInvWareid_Goods_Main: TIntegerField
      FieldName = 'id_Goods_Main'
    end
    object spInvWareid_Measure_Main: TIntegerField
      FieldName = 'id_Measure_Main'
    end
    object spInvWareid_Manufact_Main: TIntegerField
      FieldName = 'id_Manufact_Main'
    end
  end
  object spInv_LCList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Inv_Project_LCList;1'
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 624
    Top = 136
  end
  object spInvTICH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Inv_TimeItem_CH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_TimeItem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 632
    Top = 96
  end
  object spInvWareCH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Inv_Ware_CH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Inv_Ware'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 624
    Top = 48
  end
  object cdsInvTimeList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Project'
        ParamType = ptInput
      end>
    ProviderName = 'dsInvTimeList'
    RemoteServer = SocketConnection1
    Left = 536
    Top = 504
    object cdsInvTimeListid_TimeItem: TAutoIncField
      FieldName = 'id_TimeItem'
      ReadOnly = True
    end
    object cdsInvTimeListVal: TDateTimeField
      FieldName = 'Val'
    end
    object cdsInvTimeListValPlan: TDateTimeField
      FieldName = 'ValPlan'
    end
  end
  object cdsInvWareList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Project'
        ParamType = ptInput
      end>
    ProviderName = 'dsInvWareList'
    RemoteServer = SocketConnection1
    Left = 536
    Top = 552
    object cdsInvWareListid_Inv_Ware: TAutoIncField
      FieldName = 'id_Inv_Ware'
      ReadOnly = True
    end
    object cdsInvWareListAmountPlan: TFloatField
      FieldName = 'AmountPlan'
    end
    object cdsInvWareListPricePlan: TFloatField
      FieldName = 'PricePlan'
    end
    object cdsInvWareListAmount: TFloatField
      FieldName = 'Amount'
    end
    object cdsInvWareListSumm: TFloatField
      FieldName = 'Summ'
    end
  end
  object cdsInvProject: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsInvProject'
    RemoteServer = SocketConnection1
    Left = 536
    Top = 600
    object cdsInvProjectid_Project: TAutoIncField
      FieldName = 'id_Project'
      ReadOnly = True
    end
    object cdsInvProjectLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
  end
  object spUP_TimeItem: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_INV_UP_TimeItem;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Val'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ValPlan'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 488
    Top = 504
  end
  object spUP_Ware: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_INV_UP_Ware;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@AmountPlan'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@PricePlan'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Amount'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Summ'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 488
    Top = 552
  end
  object cdsInvProjectGetTS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end>
    ProviderName = 'dsInvProjectGetTS'
    RemoteServer = SocketConnection1
    Left = 608
    Top = 600
    object cdsInvProjectGetTSLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
  end
  object spAddOper201: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_201_OP_OperAdd_v2;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_oper'
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
        Name = '@Id_CurrencyOper'
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
        Name = '@id_UserCreator'
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
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@DateCreate'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 704
    Top = 8
  end
  object cdsOper201List: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'ds201List'
    RemoteServer = SocketConnection1
    Left = 768
    Top = 72
  end
  object cdsOper201TS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end>
    ProviderName = 'ds201TS'
    RemoteServer = SocketConnection1
    Left = 768
    Top = 120
  end
  object cds201Ware: TClientDataSet
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
        Value = 123
      end>
    ProviderName = 'ds201Ware'
    RemoteServer = SocketConnection1
    Left = 768
    Top = 168
  end
  object spAddOper201Ware: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_201_OP_OperAdd_Ware;1'
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
        Name = '@id_Goods'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 760
    Top = 24
  end
  object spSendFact: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Inv_Project_CH_F;1'
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
    Left = 512
    Top = 16
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    Parameters = <>
    Left = 296
    Top = 8
  end
  object spInv_FactList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_Inv_Project_LCList_F;1'
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 624
  end
  object spGetID_Main: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'id_LC_Oper'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select max(id_Main) as id_Main from LC_OP_Oper2 where id_LC_Oper' +
        '= :id_LC_Oper '
      ' ')
    Left = 256
    Top = 80
    object spGetID_Mainid_Main: TIntegerField
      FieldName = 'id_Main'
    end
  end
  object qDelWare: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'DELETE FROM OP_OperWare ')
    Left = 256
    Top = 144
    object IntegerField1: TIntegerField
      FieldName = 'id_Main'
    end
  end
  object qDelOper: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'DELETE FROM OP_Oper2')
    Left = 256
    Top = 192
    object IntegerField2: TIntegerField
      FieldName = 'id_Main'
    end
  end
  object spAccGrpAdd: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_v2_Acc_Group_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@PID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 488
    Top = 72
  end
  object cdsAccGrpTS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end>
    ProviderName = 'dsAccGrpTS'
    RemoteServer = SocketConnection1
    Left = 488
    Top = 168
  end
  object cdsAccGrpList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsAccGrpGetList'
    RemoteServer = SocketConnection1
    Left = 488
    Top = 120
  end
  object spCAGrpAdd: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_v2_CA_CAGroup_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 432
    Top = 72
  end
  object cdsCAGroupTS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end>
    ProviderName = 'dsCAGroupTS'
    RemoteServer = SocketConnection1
    Left = 432
    Top = 168
  end
  object cdsCAGroupGetList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsCAGroupGetList'
    RemoteServer = SocketConnection1
    Left = 432
    Top = 120
  end
  object spCAAdd: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_v2_ContrAgent_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@id_CAGroup_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Addr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2000
        Value = Null
      end
      item
        Name = '@Descr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2000
        Value = Null
      end>
    Left = 440
    Top = 224
  end
  object cdsCATS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end>
    ProviderName = 'dsCATS'
    RemoteServer = SocketConnection1
    Left = 440
    Top = 320
  end
  object cdsCAList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsCAList'
    RemoteServer = SocketConnection1
    Left = 440
    Top = 272
  end
  object spCALCList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_v2_ContrAgent_LCList;1'
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
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 440
    Top = 368
  end
  object spCA_CH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_v2_ContrAgent_CH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_ContrAgent'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 440
    Top = 16
  end
  object cdsRRRList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsRRRList'
    RemoteServer = SocketConnection1
    Left = 200
    Top = 360
  end
  object spRRRAdd: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RP_V2_Permit_Add;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Business_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Acc_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Acc_Group_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_ContrAgent_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_CAGroup_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Group_Main'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 200
    Top = 312
  end
  object cdsRRRTS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end>
    ProviderName = 'dsRRRTS'
    RemoteServer = SocketConnection1
    Left = 200
    Top = 408
  end
  object cdsDocTS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@TName'
        ParamType = ptInput
      end>
    ProviderName = 'dsDocTS'
    RemoteServer = SocketConnection1
    Left = 760
    Top = 392
  end
  object cdsDocCH: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@TName_CH'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@TKey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID'
        ParamType = ptInput
      end>
    ProviderName = 'dsDocCH'
    RemoteServer = SocketConnection1
    Left = 760
    Top = 488
  end
  object cdsDocList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@TName'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated1'
        ParamType = ptInput
      end
      item
        DataType = ftVarBytes
        Name = '@LastUpdated2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_Rep'
        ParamType = ptInput
      end>
    ProviderName = 'dsDocList'
    RemoteServer = SocketConnection1
    Left = 760
    Top = 440
  end
  object qDoc: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 216
    Top = 8
  end
end
